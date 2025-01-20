@interface SWCDownloadTaskState
- (BOOL)isDiscretionary;
- (NSDate)dateScheduled;
- (NSError)cancellationError;
- (NSMutableArray)completionHandlers;
- (NSMutableData)buffer;
- (NSString)taskDescription;
- (NSURLSessionDataTask)task;
- (SWCDownloadTaskState)initWithDownloader:(id)a3 domain:(id)a4 downloadRoute:(unsigned __int8)a5;
- (SWCDownloader)downloader;
- (_SWCDomain)domain;
- (id)debugDescription;
- (id)description;
- (id)redactedDescription;
- (unsigned)downloadRoute;
- (void)cancelTaskWithError:(id)a3;
- (void)receiveSIGTERMSignal;
- (void)resumeTask;
- (void)setBuffer:(id)a3;
- (void)setCancellationError:(id)a3;
- (void)setDiscretionary:(BOOL)a3;
- (void)setDownloadRoute:(unsigned __int8)a3;
@end

@implementation SWCDownloadTaskState

- (SWCDownloadTaskState)initWithDownloader:(id)a3 domain:(id)a4 downloadRoute:(unsigned __int8)a5
{
  id v8 = a3;
  id v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___SWCDownloadTaskState;
  v10 = -[SWCDownloadTaskState init](&v19, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_downloader, v8);
    uuid_generate_random(out);
    memset(v20, 0, 37);
    uuid_unparse(out, v20);
    v12 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"AASA-%s", v20);
    taskDescription = v11->_taskDescription;
    v11->_taskDescription = v12;

    objc_storeStrong((id *)&v11->_domain, a4);
    v11->_downloadRoute = a5;
    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    completionHandlers = v11->_completionHandlers;
    v11->_completionHandlers = v14;

    v16 = objc_alloc_init(&OBJC_CLASS___NSMutableData);
    buffer = v11->_buffer;
    v11->_buffer = v16;
  }

  return v11;
}

- (void)receiveSIGTERMSignal
{
  transaction = self->_transaction;
  self->_transaction = 0LL;
}

- (void)resumeTask
{
  p_task = &self->_task;
  if (!self->_task)
  {
    v5 = objc_autoreleasePoolPush();
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDownloadTaskState downloader](self, "downloader"));
    v7 = v6;
    if (v6)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 _sessionForTaskState:self]);
      if (!v8)
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
        [v23 handleFailureInMethod:a2 object:self file:@"SWCDownloader.mm" lineNumber:385 description:@"Failed to get/create URL session"];
      }

      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDownloadTaskState domain](self, "domain"));
      v10 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v7,  "_URLRequestWithDomain:downloadRoute:",  v9,  -[SWCDownloadTaskState downloadRoute](self, "downloadRoute")));

      if (!v10)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
        [v24 handleFailureInMethod:a2 object:self file:@"SWCDownloader.mm" lineNumber:387 description:@"Failed to create URL request"];
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue([v8 dataTaskWithRequest:v10]);
      if (!v11)
      {
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
        [v25 handleFailureInMethod:a2 object:self file:@"SWCDownloader.mm" lineNumber:389 description:@"Failed to get data task from URL session"];
      }

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDownloadTaskState taskDescription](self, "taskDescription"));
      [v11 setTaskDescription:v12];

      objc_storeStrong((id *)p_task, v11);
      v13 = -[NSDate initWithTimeIntervalSince1970:]( objc_alloc(&OBJC_CLASS___NSDate),  "initWithTimeIntervalSince1970:",  (double)time(0LL));
      dateScheduled = self->_dateScheduled;
      self->_dateScheduled = v13;

      v15 = objc_alloc(&OBJC_CLASS___NSString);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[_SWCDomain redactedDescription](self->_domain, "redactedDescription"));
      v17 = -[NSString initWithFormat:](v15, "initWithFormat:", @"com.apple.swc.aasa.dl-%@", v16);
      v18 = -[NSString UTF8String](v17, "UTF8String");
      v20 = (OS_os_transaction *)os_transaction_create(v18, v19);
      transaction = self->_transaction;
      self->_transaction = v20;

      if (qword_10002E830 != -1) {
        dispatch_once(&qword_10002E830, &stru_1000288C0);
      }
      v22 = (os_log_s *)qword_10002E828;
      if (os_log_type_enabled((os_log_t)qword_10002E828, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v27 = self;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Beginning data task %@", buf, 0xCu);
      }

      [v11 resume];
    }

    objc_autoreleasePoolPop(v5);
  }

- (void)cancelTaskWithError:(id)a3
{
  id v6 = a3;
  transaction = self->_transaction;
  self->_transaction = 0LL;

  -[NSURLSessionDataTask cancel](self->_task, "cancel");
}

- (id)description
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLSessionDataTask taskDescription](self->_task, "taskDescription"));
  domain = self->_domain;
  NSUInteger v6 = -[NSMutableData length](self->_buffer, "length");
  v7 = sub_100006280(self->_downloadRoute);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"%@ { domain: %@, bytes: %llu, route: %@ }",  v4,  domain,  v6,  v8);

  return v9;
}

- (id)debugDescription
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v4 = objc_opt_class(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SWCDownloadTaskState description](self, "description"));
  NSUInteger v6 = -[NSString initWithFormat:](v3, "initWithFormat:", @"<%@ %p> %@", v4, self, v5);

  return v6;
}

- (id)redactedDescription
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLSessionDataTask taskDescription](self->_task, "taskDescription"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_SWCDomain redactedDescription](self->_domain, "redactedDescription"));
  NSUInteger v6 = -[NSMutableData length](self->_buffer, "length");
  v7 = sub_100006280(self->_downloadRoute);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = -[NSString initWithFormat:]( v3,  "initWithFormat:",  @"%@ { domain: %@, bytes: %llu, route: %@ }",  v4,  v5,  v6,  v8);

  return v9;
}

- (SWCDownloader)downloader
{
  return (SWCDownloader *)objc_loadWeakRetained((id *)&self->_downloader);
}

- (NSURLSessionDataTask)task
{
  return (NSURLSessionDataTask *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSError)cancellationError
{
  return (NSError *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setCancellationError:(id)a3
{
}

- (NSString)taskDescription
{
  return (NSString *)objc_getProperty(self, a2, 48LL, 1);
}

- (NSDate)dateScheduled
{
  return (NSDate *)objc_getProperty(self, a2, 56LL, 1);
}

- (_SWCDomain)domain
{
  return (_SWCDomain *)objc_getProperty(self, a2, 64LL, 1);
}

- (BOOL)isDiscretionary
{
  return self->_discretionary;
}

- (void)setDiscretionary:(BOOL)a3
{
  self->_discretionary = a3;
}

- (unsigned)downloadRoute
{
  return self->_downloadRoute;
}

- (void)setDownloadRoute:(unsigned __int8)a3
{
  self->_downloadRoute = a3;
}

- (NSMutableArray)completionHandlers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 72LL, 1);
}

- (NSMutableData)buffer
{
  return (NSMutableData *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setBuffer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end