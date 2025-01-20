@interface MediaSocialStatusPollingCoordinator
- (MediaSocialStatusPollingCoordinator)initWithDispatchQueue:(id)a3;
- (MediaSocialStatusPollingDelegate)delegate;
- (int64_t)numberOfPollRequests;
- (void)_addBackgroundTaskJob;
- (void)_finishRequests:(id)a3 withResponses:(id)a4;
- (void)_handleBackgroundTaskEvent:(id)a3;
- (void)addPollRequest:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation MediaSocialStatusPollingCoordinator

- (MediaSocialStatusPollingCoordinator)initWithDispatchQueue:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___MediaSocialStatusPollingCoordinator;
  v6 = -[MediaSocialStatusPollingCoordinator init](&v19, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dispatchQueue, a3);
    v8 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    requests = v7->_requests;
    v7->_requests = v8;

    v10 = objc_alloc_init(&OBJC_CLASS___ISOperationQueue);
    operationQueue = v7->_operationQueue;
    v7->_operationQueue = v10;

    -[ISOperationQueue setMaxConcurrentOperationCount:](v7->_operationQueue, "setMaxConcurrentOperationCount:", 1LL);
    -[ISOperationQueue setName:]( v7->_operationQueue,  "setName:",  @"com.apple.itunesstored.MediaSocialStatusPollingCoordinator");
    objc_initWeak(&location, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_10017C4A0;
    v16[3] = &unk_10034BF60;
    objc_copyWeak(&v17, &location);
    uint64_t v13 = objc_claimAutoreleasedReturnValue( [v12 addObserverForBackgroundTaskWithIdentifierPrefix:@"com.apple.itunesstored.MediaSocial.poll" withBlock:v16]);
    id btaObserver = v7->_btaObserver;
    v7->_id btaObserver = (id)v13;

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v7;
}

- (void)dealloc
{
  if (self->_btaObserver)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
    [v3 removeBackgroundTaskObserver:self->_btaObserver];
  }

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___MediaSocialStatusPollingCoordinator;
  -[MediaSocialStatusPollingCoordinator dealloc](&v4, "dealloc");
}

- (void)addPollRequest:(id)a3
{
  id v11 = a3;
  id v4 = -[NSMutableArray count](self->_requests, "count");
  id v5 = [v11 copy];
  -[NSMutableArray addObject:](self->_requests, "addObject:", v5);
  [v11 pollingInterval];
  double v6 = 15.0;
  if (v7 > 15.0)
  {
    [v11 pollingInterval];
    double v6 = v8;
  }

  if (!v4)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    goto LABEL_7;
  }

  double pollingInterval = self->_pollingInterval;
  if (v6 < pollingInterval)
  {
    double Current = self->_nextScheduledPoll - pollingInterval;
LABEL_7:
    self->_nextScheduledPoll = v6 + Current;
    self->_double pollingInterval = v6;
    -[MediaSocialStatusPollingCoordinator _addBackgroundTaskJob](self, "_addBackgroundTaskJob");
  }
}

- (int64_t)numberOfPollRequests
{
  return (int64_t)-[NSMutableArray count](self->_requests, "count");
}

- (void)_handleBackgroundTaskEvent:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10017C66C;
  block[3] = &unk_10034AC30;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_addBackgroundTaskJob
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceReferenceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceReferenceDate:",  self->_nextScheduledPoll));
  [v3 timeIntervalSinceNow];
  double v5 = v4;
  double v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v6) {
    double v6 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v7 = [v6 shouldLog];
  else {
    LODWORD(v8) = v7;
  }
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 OSLogObject]);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
    uint64_t v8 = v8;
  }
  else {
    v8 &= 2u;
  }
  if (!(_DWORD)v8) {
    goto LABEL_12;
  }
  int v15 = 138412546;
  id v16 = (id)objc_opt_class(self);
  __int16 v17 = 2112;
  v18 = v3;
  id v10 = v16;
  id v11 = (void *)_os_log_send_and_compose_impl( v8,  0LL,  0LL,  0LL,  &_mh_execute_header,  v9,  1LL,  "%@: Scheduling poll for time: %@",  &v15,  22);

  if (v11)
  {
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v11,  4LL));
    free(v11);
    SSFileLog(v6, @"%@");
LABEL_12:
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon daemon](&OBJC_CLASS___Daemon, "daemon"));
  [v12 cancelBackgroundTaskWithIdentifier:@"com.apple.itunesstored.MediaSocial.poll"];
  xpc_object_t v13 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v13, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 0);
  xpc_dictionary_set_BOOL(v13, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
  xpc_dictionary_set_int64(v13, XPC_ACTIVITY_DELAY, (uint64_t)v5);
  v14 = -[BackgroundTaskRequest initWithBackgroundTaskAgentJob:]( objc_alloc(&OBJC_CLASS___BackgroundTaskRequest),  "initWithBackgroundTaskAgentJob:",  v13);
  -[BackgroundTaskRequest setRequestIdentifier:]( v14,  "setRequestIdentifier:",  @"com.apple.itunesstored.MediaSocial.poll");
  [v12 addBackgroundTaskWithRequest:v14];
}

- (void)_finishRequests:(id)a3 withResponses:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = -[ISOperationQueue operationCount](self->_operationQueue, "operationCount") == (id)1;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10017CE70;
  v12[3] = &unk_1003507B0;
  id v13 = v6;
  id v14 = v7;
  int v15 = self;
  BOOL v16 = v8;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(dispatchQueue, v12);
}

- (MediaSocialStatusPollingDelegate)delegate
{
  return (MediaSocialStatusPollingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end