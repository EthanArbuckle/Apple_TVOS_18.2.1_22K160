@interface PerformDownloadOperation
- (BOOL)waitForDownload;
- (PerformDownloadOperation)initWithDownloadPipeline:(id)a3 response:(id)a4;
- (PrepareDownloadResponse)response;
- (void)run;
- (void)setResponse:(id)a3;
- (void)setWaitForDownload:(BOOL)a3;
- (void)signalDownloadCompletion;
@end

@implementation PerformDownloadOperation

- (PerformDownloadOperation)initWithDownloadPipeline:(id)a3 response:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___PerformDownloadOperation;
  v9 = -[PerformDownloadOperation init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_pipeline, a3);
    objc_storeStrong((id *)&v10->_response, a4);
    dispatch_semaphore_t v11 = dispatch_semaphore_create(0LL);
    downloadTaskWaitSemaphore = v10->_downloadTaskWaitSemaphore;
    v10->_downloadTaskWaitSemaphore = (OS_dispatch_semaphore *)v11;

    v10->_waitForDownload = 0;
  }

  return v10;
}

- (void)run
{
  if (self->_waitForDownload)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
    if (!v3) {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
    }
    unsigned int v4 = [v3 shouldLog];
    else {
      unsigned int v5 = v4;
    }
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
      uint64_t v7 = v5;
    }
    else {
      uint64_t v7 = v5 & 2;
    }
    if ((_DWORD)v7)
    {
      v9[0] = 0;
      id v8 = (void *)_os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  1LL,  "[Download]: waiting for task completion",  v9,  2);

      if (!v8)
      {
LABEL_14:

        dispatch_semaphore_wait((dispatch_semaphore_t)self->_downloadTaskWaitSemaphore, 0xFFFFFFFFFFFFFFFFLL);
        return;
      }

      v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v8,  4LL));
      free(v8);
      SSFileLog(v3, @"%@");
    }

    goto LABEL_14;
  }

- (void)signalDownloadCompletion
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedDaemonConfig](&OBJC_CLASS___SSLogConfig, "sharedDaemonConfig"));
  if (!v3) {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSLogConfig sharedConfig](&OBJC_CLASS___SSLogConfig, "sharedConfig"));
  }
  unsigned int v4 = [v3 shouldLog];
  else {
    unsigned int v5 = v4;
  }
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v3 OSLogObject]);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO)) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = v5 & 2;
  }
  if (!(_DWORD)v7) {
    goto LABEL_12;
  }
  v9[0] = 0;
  id v8 = (void *)_os_log_send_and_compose_impl( v7,  0LL,  0LL,  0LL,  &_mh_execute_header,  v6,  1LL,  "[Download]: download task complete!",  v9,  2);

  if (v8)
  {
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSString stringWithCString:encoding:]( &OBJC_CLASS___NSString,  "stringWithCString:encoding:",  v8,  4LL));
    free(v8);
    SSFileLog(v3, @"%@");
LABEL_12:
  }

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_downloadTaskWaitSemaphore);
}

- (PrepareDownloadResponse)response
{
  return (PrepareDownloadResponse *)objc_getProperty(self, a2, 104LL, 1);
}

- (void)setResponse:(id)a3
{
}

- (BOOL)waitForDownload
{
  return self->_waitForDownload;
}

- (void)setWaitForDownload:(BOOL)a3
{
  self->_waitForDownload = a3;
}

- (void).cxx_destruct
{
}

@end