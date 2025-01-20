@interface DetermineSizeForURLTask
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)main;
@end

@implementation DetermineSizeForURLTask

- (void)main
{
  v3 = (NSError *)dispatch_semaphore_create(0LL);
  error = self->super._error;
  self->super._error = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration"));
  v6 = (LogKey *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v5,  self,  0LL));
  logKey = self->_logKey;
  self->_logKey = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableURLRequest requestWithURL:]( &OBJC_CLASS___NSMutableURLRequest,  "requestWithURL:",  self->_semaphore));
  [v8 setHTTPMethod:@"HEAD"];
  [v8 setCachePolicy:1];
  [v8 setTimeoutInterval:30.0];
  id v9 = sub_10024E664((uint64_t)&OBJC_CLASS___AMSUserAgent);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  [v8 setHTTPUserAgent:v10];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[LogKey dataTaskWithRequest:](self->_logKey, "dataTaskWithRequest:", v8));
  uint64_t v12 = ASDLogHandleForCategory(2LL);
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)&self->super._success;
    semaphore = self->_semaphore;
    int v19 = 138412802;
    uint64_t v20 = v14;
    __int16 v21 = 2114;
    v22 = semaphore;
    __int16 v23 = 2114;
    v24 = v11;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[%@] Running HEAD operation to get size for URL: %{public}@ task: %{public}@",  (uint8_t *)&v19,  0x20u);
  }

  [v11 resume];
  v16 = self->super._error;
  [v8 timeoutInterval];
  dispatch_time_t v18 = dispatch_time(0LL, (uint64_t)((v17 + v17) * 1000000000.0));
  dispatch_semaphore_wait((dispatch_semaphore_t)v16, v18);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v6 = a4;
  uint64_t v7 = ASDLogHandleForCategory(2LL);
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = *(void *)&self->super._success;
    semaphore = self->_semaphore;
    int v11 = 138412546;
    uint64_t v12 = v9;
    __int16 v13 = 2114;
    uint64_t v14 = semaphore;
    _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "[%@] Unexpected data received for URL: %{public}@",  (uint8_t *)&v11,  0x16u);
  }

  [v6 cancel];
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v8 = a5;
  uint64_t v9 = (void (**)(id, uint64_t))a6;
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSHTTPURLResponse, v10);
  if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0) {
    uint64_t v12 = v8;
  }
  else {
    uint64_t v12 = 0LL;
  }
  id v13 = v12;
  if ((uint64_t)[v13 statusCode] < 200 || (uint64_t)objc_msgSend(v13, "statusCode") > 299)
  {
    uint64_t v23 = ASDLogHandleForCategory(2LL);
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v30 = *(void *)&self->super._success;
      id v31 = [v13 statusCode];
      semaphore = self->_semaphore;
      *(_DWORD *)buf = 138412802;
      uint64_t v40 = v30;
      __int16 v41 = 2048;
      id v42 = v31;
      __int16 v43 = 2114;
      v44 = semaphore;
      _os_log_error_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_ERROR,  "[%@] Invalid status: %ld for URL: %{public}@",  buf,  0x20u);
    }

    NSErrorUserInfoKey v35 = NSDebugDescriptionErrorKey;
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Invalid response, status code: %ld",  [v13 statusCode]));
    v36 = v25;
    v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL));

    v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  ASDErrorDomain,  507LL,  v26));
    -[Task completeWithError:](self, "completeWithError:", v27);
  }

  else
  {
    id v14 = [v13 expectedContentLength];
    uint64_t v15 = ASDLogHandleForCategory(2LL);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    double v17 = v16;
    if ((uint64_t)v14 <= 0)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v33 = *(void *)&self->super._success;
        v34 = self->_semaphore;
        *(_DWORD *)buf = 138412802;
        uint64_t v40 = v33;
        __int16 v41 = 2048;
        id v42 = v14;
        __int16 v43 = 2114;
        v44 = v34;
        _os_log_error_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "[%@] Invalid size: %lld for URL: %{public}@",  buf,  0x20u);
      }

      NSErrorUserInfoKey v37 = NSDebugDescriptionErrorKey;
      v38 = @"Invalid response, expected content length unknown";
      v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v38,  &v37,  1LL));
      v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  ASDErrorDomain,  507LL,  v28));
      -[Task completeWithError:](self, "completeWithError:", v29);
    }

    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)&self->super._success;
        id v19 = [v13 expectedContentLength];
        uint64_t v20 = self->_semaphore;
        *(_DWORD *)buf = 138412802;
        uint64_t v40 = v18;
        __int16 v41 = 2048;
        id v42 = v19;
        __int16 v43 = 2114;
        v44 = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[%@] Found size: %lld for URL: %{public}@",  buf,  0x20u);
      }

      __int16 v21 = (NSURLSession *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](&OBJC_CLASS___NSNumber, "numberWithLongLong:", v14));
      session = self->_session;
      self->_session = v21;

      -[Task completeWithSuccess](self, "completeWithSuccess");
    }
  }

  v9[2](v9, 1LL);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v6 = a5;
  if (v6)
  {
    uint64_t v7 = ASDLogHandleForCategory(2LL);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)&self->super._success;
      semaphore = self->_semaphore;
      int v13 = 138412802;
      uint64_t v14 = v11;
      __int16 v15 = 2114;
      v16 = semaphore;
      __int16 v17 = 2114;
      id v18 = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_ERROR,  "[%@] Failed to find size for URL: %{public}@ error: %{public}@",  (uint8_t *)&v13,  0x20u);
    }

    uint64_t v9 = ASDErrorWithSafeUserInfo(v6);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[Task completeWithError:](self, "completeWithError:", v10);
  }

  -[LogKey invalidateAndCancel](self->_logKey, "invalidateAndCancel");
  dispatch_semaphore_signal((dispatch_semaphore_t)self->super._error);
}

- (void).cxx_destruct
{
}

@end