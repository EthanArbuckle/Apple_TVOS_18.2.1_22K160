@interface CCDURLOperation
- (BOOL)requestFailed;
- (CCDRequest)teslaRequest;
- (NSError)error;
- (NSMutableData)responseData;
- (NSString)httpResponseContentType;
- (NSTimer)timeoutTimer;
- (NSURLSession)urlSession;
- (double)retryAfterInterval;
- (id)responseWithResponseData:(id)a3 contentType:(id)a4 statusCode:(int64_t)a5 retryNeeded:(BOOL *)a6 outError:(id *)a7;
- (int64_t)_statusCodeFromResponse:(id)a3;
- (int64_t)requestCount;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6;
- (void)_callCompletionBlockWithResponse:(id)a3 error:(id)a4;
- (void)_invalidateAndCancelURLSession;
- (void)_printStatusCode:(int64_t)a3;
- (void)_retryRequestIfAllowed:(BOOL)a3 afterDelay:(double)a4 orFailWithError:(id)a5;
- (void)_retryRequestIfAllowedAfterDelayOrFailWithError:(id)a3;
- (void)_retryRequestOrFailWithError:(id)a3;
- (void)_sendFailureNoticeToRemote;
- (void)_sendResponseInfoToRemoteWithStatusCode:(int64_t)a3;
- (void)_startRetryTimerWithInterval:(double)a3;
- (void)_startURLRequest;
- (void)dealloc;
- (void)endOperation;
- (void)setError:(id)a3;
- (void)setHttpResponseContentType:(id)a3;
- (void)setRequestCount:(int64_t)a3;
- (void)setRequestFailed:(BOOL)a3;
- (void)setResponseData:(id)a3;
- (void)setRetryAfterInterval:(double)a3;
- (void)setTeslaRequest:(id)a3;
- (void)setTimeoutTimer:(id)a3;
- (void)setUrlSession:(id)a3;
- (void)start;
- (void)timeoutTimerDidFire:(id)a3;
@end

@implementation CCDURLOperation

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CCDURLOperation;
  -[CCDURLOperation dealloc](&v3, "dealloc");
}

- (void)start
{
  objc_super v3 = (void *)objc_opt_new(&OBJC_CLASS___NSMutableData, a2);
  -[CCDURLOperation setResponseData:](self, "setResponseData:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CCDURLOperation urlSession](self, "urlSession"));
  [v4 invalidateAndCancel];

  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration defaultSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "defaultSessionConfiguration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v5,  self,  v6));
  -[CCDURLOperation setUrlSession:](self, "setUrlSession:", v7);

  -[CCDOperation setOperationExecuting:](self, "setOperationExecuting:", 1LL);
  -[CCDOperation setOperationFinished:](self, "setOperationFinished:", 0LL);
  -[CCDURLOperation setRequestCount:](self, "setRequestCount:", 0LL);
  -[CCDURLOperation setRequestFailed:](self, "setRequestFailed:", 0LL);
  -[CCDURLOperation _startURLRequest](self, "_startURLRequest");
}

- (id)responseWithResponseData:(id)a3 contentType:(id)a4 statusCode:(int64_t)a5 retryNeeded:(BOOL *)a6 outError:(id *)a7
{
  return 0LL;
}

- (void)_invalidateAndCancelURLSession
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[CCDURLOperation urlSession](self, "urlSession"));
  [v3 invalidateAndCancel];

  -[CCDURLOperation setUrlSession:](self, "setUrlSession:", 0LL);
}

- (void)_startURLRequest
{
  objc_super v3 = *(os_log_s **)(DEPLogObjects(self, a2) + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting URL Request", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CCDURLOperation teslaRequest](self, "teslaRequest"));
  id v17 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 requestWithError:&v17]);
  id v6 = v17;

  if (v5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CCDURLOperation urlSession](self, "urlSession"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v9 dataTaskWithRequest:v5]);

    if (v10)
    {
      v13 = *(os_log_s **)(DEPLogObjects(v11, v12) + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Resume data task", v15, 2u);
      }

      [v10 resume];
    }

    else
    {
      -[CCDURLOperation setError:](self, "setError:", v6);
      -[CCDURLOperation _sendFailureNoticeToRemote](self, "_sendFailureNoticeToRemote");
    }
  }

  else
  {
    v14 = *(os_log_s **)(DEPLogObjects(v7, v8) + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Unable to build URL request", v16, 2u);
    }

    -[CCDURLOperation setError:](self, "setError:", v6);
    -[CCDURLOperation _sendFailureNoticeToRemote](self, "_sendFailureNoticeToRemote");
  }
}

- (void)_sendFailureNoticeToRemote
{
  objc_super v3 = *(os_log_s **)(DEPLogObjects(self, a2) + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Sending failure response back to client",  v5,  2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CCDURLOperation error](self, "error"));
  if (!v4) {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[CCDError internalErrorWithCode:](&OBJC_CLASS___CCDError, "internalErrorWithCode:", 34000LL));
  }
  -[CCDURLOperation _callCompletionBlockWithResponse:error:](self, "_callCompletionBlockWithResponse:error:", 0LL, v4);
}

- (void)endOperation
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CCDURLOperation;
  -[CCDOperation endOperation](&v3, "endOperation");
}

- (void)_callCompletionBlockWithResponse:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v9 = *(os_log_s **)(DEPLogObjects(v7, v8) + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543362;
    uint64_t v11 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ completed. Calling the completion block.",  (uint8_t *)&v10,  0xCu);
  }

  -[CCDURLOperation completeOperationWithResponse:error:](self, "completeOperationWithResponse:error:", v7, v6);

  -[CCDURLOperation endOperation](self, "endOperation");
}

- (int64_t)_statusCodeFromResponse:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSHTTPURLResponse);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    id v6 = v4;
    id v7 = [v6 statusCode];
    if (v7 == (id)503)
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v6 allHeaderFields]);
      v9 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:@"Retry-After"]);

      uint64_t v10 = (uint64_t)[v9 integerValue];
      if (v10 >= 1) {
        -[CCDURLOperation setRetryAfterInterval:](self, "setRetryAfterInterval:", (double)v10);
      }
      -[CCDURLOperation retryAfterInterval](self, "retryAfterInterval");
      if (v11 < 2.0) {
        -[CCDURLOperation setRetryAfterInterval:](self, "setRetryAfterInterval:", 2.0);
      }
    }
  }

  else
  {
    id v7 = 0LL;
  }

  return (int64_t)v7;
}

- (void)_sendResponseInfoToRemoteWithStatusCode:(int64_t)a3
{
  uint64_t v5 = *(os_log_s **)(DEPLogObjects(self, a2) + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Send response info to remote", buf, 2u);
  }

  char v12 = 0;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CCDURLOperation responseData](self, "responseData"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[CCDURLOperation httpResponseContentType](self, "httpResponseContentType"));
  id v11 = 0LL;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( -[CCDURLOperation responseWithResponseData:contentType:statusCode:retryNeeded:outError:]( self,  "responseWithResponseData:contentType:statusCode:retryNeeded:outError:",  v6,  v7,  a3,  &v12,  &v11));
  id v9 = v11;

  if (v9)
  {
    -[CCDURLOperation setError:](self, "setError:", v9);
    -[CCDURLOperation _sendFailureNoticeToRemote](self, "_sendFailureNoticeToRemote");
  }

  else if (v12)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[CCDError serviceBusyError](&OBJC_CLASS___CCDError, "serviceBusyError"));
    -[CCDURLOperation _retryRequestOrFailWithError:](self, "_retryRequestOrFailWithError:", v10);
  }

  else
  {
    -[CCDURLOperation _callCompletionBlockWithResponse:error:](self, "_callCompletionBlockWithResponse:error:", v8, 0LL);
  }
}

- (void)_printStatusCode:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Response code: %ld, ",  a3));
  uint64_t v5 = v4;
  if (a3 > 400)
  {
    if (a3 == 401)
    {
      id v6 = @"Auth Failure";
      goto LABEL_11;
    }

    if (a3 == 500)
    {
      id v6 = @"Server Exception";
      goto LABEL_11;
    }
  }

  else
  {
    if (a3 == 200)
    {
      id v6 = @"Success";
      goto LABEL_11;
    }

    if (a3 == 400)
    {
      id v6 = @"Invalid Request";
      goto LABEL_11;
    }
  }

  id v6 = @"Unknown Response";
LABEL_11:
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 stringByAppendingString:v6]);

  uint64_t v10 = *(os_log_s **)(DEPLogObjects(v8, v9) + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    char v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v8 = a5;
  uint64_t v9 = (void (**)(id, uint64_t))a6;
  id v10 = v8;
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___NSHTTPURLResponse);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
  {
    char v12 = (void *)objc_claimAutoreleasedReturnValue([v10 allHeaderFields]);
    v13 = v12;
    if (v12)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"Content-Type"]);
      -[CCDURLOperation setHttpResponseContentType:](self, "setHttpResponseContentType:", v14);

      v15 = (void *)objc_claimAutoreleasedReturnValue([v10 allHeaderFields]);
      id v17 = *(void **)(DEPLogObjects(v15, v16) + 8);
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = v17;
        v19 = (void *)objc_claimAutoreleasedReturnValue([v15 description]);
        int v20 = 138543362;
        v21 = v19;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Response Headers: %{public}@",  (uint8_t *)&v20,  0xCu);
      }
    }
  }

  v9[2](v9, 1LL);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v6 = a5;
  id v8 = *(os_log_s **)(DEPLogObjects(v6, v7) + 8);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received actual data", buf, 2u);
    }

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CCDURLOperation responseData](self, "responseData"));
    [v10 appendData:v6];
  }

  else if (v9)
  {
    *(_WORD *)uint64_t v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "No data received.", v11, 2u);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v7 = a5;
  BOOL v9 = v7;
  if (v7)
  {
    id v10 = *(os_log_s **)(DEPLogObjects(v7, v8) + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138412290;
      v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Error: %@", (uint8_t *)&v13, 0xCu);
    }

    -[CCDURLOperation _sendFailureNoticeToRemote](self, "_sendFailureNoticeToRemote");
  }

  else
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([a4 response]);
    int64_t v12 = -[CCDURLOperation _statusCodeFromResponse:](self, "_statusCodeFromResponse:", v11);

    -[CCDURLOperation _printStatusCode:](self, "_printStatusCode:", v12);
    -[CCDURLOperation _sendResponseInfoToRemoteWithStatusCode:](self, "_sendResponseInfoToRemoteWithStatusCode:", v12);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  id v6 = (void (**)(id, uint64_t, void))a6;
  BOOL v9 = *(os_log_s **)(DEPLogObjects(v6, v7, v8) + 8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Default challange handling", v10, 2u);
  }

  v6[2](v6, 1LL, 0LL);
}

- (void)_retryRequestOrFailWithError:(id)a3
{
  id v4 = a3;
  -[CCDURLOperation retryAfterInterval](self, "retryAfterInterval");
  -[CCDURLOperation _retryRequestIfAllowed:afterDelay:orFailWithError:]( self,  "_retryRequestIfAllowed:afterDelay:orFailWithError:",  1LL,  v4);
}

- (void)_retryRequestIfAllowed:(BOOL)a3 afterDelay:(double)a4 orFailWithError:(id)a5
{
  if (a3)
  {
    uint64_t v7 = *(os_log_s **)(DEPLogObjects(self, a2) + 8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Retrying the request", buf, 2u);
    }

    -[CCDURLOperation _startRetryTimerWithInterval:](self, "_startRetryTimerWithInterval:", a4);
  }

  else
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[CCDError maxRetriesExceededErrorWithUnderlyingError:]( &OBJC_CLASS___CCDError,  "maxRetriesExceededErrorWithUnderlyingError:",  a5,  a4));
    -[CCDURLOperation _callCompletionBlockWithResponse:error:](self, "_callCompletionBlockWithResponse:error:", 0LL, v8);
  }

- (void)_retryRequestIfAllowedAfterDelayOrFailWithError:(id)a3
{
  id v4 = a3;
  -[CCDURLOperation setRequestCount:]( self,  "setRequestCount:",  (char *)-[CCDURLOperation requestCount](self, "requestCount") + 1);
  -[CCDURLOperation _retryRequestIfAllowed:afterDelay:orFailWithError:]( self,  "_retryRequestIfAllowed:afterDelay:orFailWithError:",  -[CCDURLOperation requestCount](self, "requestCount") < 3,  v4,  2.0);
}

- (void)_startRetryTimerWithInterval:(double)a3
{
  uint64_t v5 = objc_alloc(&OBJC_CLASS___NSTimer);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceNow:](&OBJC_CLASS___NSDate, "dateWithTimeIntervalSinceNow:", a3));
  uint64_t v7 = -[NSTimer initWithFireDate:interval:target:selector:userInfo:repeats:]( v5,  "initWithFireDate:interval:target:selector:userInfo:repeats:",  v6,  self,  "timeoutTimerDidFire:",  0LL,  0LL,  0.0);
  -[CCDURLOperation setTimeoutTimer:](self, "setTimeoutTimer:", v7);

  id v9 = (id)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CCDURLOperation timeoutTimer](self, "timeoutTimer"));
  [v9 addTimer:v8 forMode:NSRunLoopCommonModes];
}

- (void)timeoutTimerDidFire:(id)a3
{
  if (-[CCDURLOperation requestFailed](self, "requestFailed", a3)) {
    -[CCDURLOperation _startURLRequest](self, "_startURLRequest");
  }
}

- (CCDRequest)teslaRequest
{
  return *(CCDRequest **)((char *)&self->super.super._private1 + 3);
}

- (void)setTeslaRequest:(id)a3
{
}

- (NSError)error
{
  return *(NSError **)(&self->super._operationReady + 1);
}

- (void)setError:(id)a3
{
}

- (NSMutableData)responseData
{
  return *(NSMutableData **)(&self->_requestFailed + 3);
}

- (void)setResponseData:(id)a3
{
}

- (NSURLSession)urlSession
{
  return *(NSURLSession **)((char *)&self->_teslaRequest + 3);
}

- (void)setUrlSession:(id)a3
{
}

- (NSTimer)timeoutTimer
{
  return *(NSTimer **)((char *)&self->_error + 3);
}

- (void)setTimeoutTimer:(id)a3
{
}

- (double)retryAfterInterval
{
  return *(double *)((char *)&self->_responseData + 3);
}

- (void)setRetryAfterInterval:(double)a3
{
  *(double *)((char *)&self->_responseData + 3) = a3;
}

- (BOOL)requestFailed
{
  return BYTE3(self->super.super._private);
}

- (void)setRequestFailed:(BOOL)a3
{
  BYTE3(self->super.super._private) = a3;
}

- (int64_t)requestCount
{
  return *(int64_t *)((char *)&self->_urlSession + 3);
}

- (void)setRequestCount:(int64_t)a3
{
  *(NSURLSession **)((char *)&self->_urlSession + 3) = (NSURLSession *)a3;
}

- (NSString)httpResponseContentType
{
  return *(NSString **)((char *)&self->_timeoutTimer + 3);
}

- (void)setHttpResponseContentType:(id)a3
{
}

- (void).cxx_destruct
{
}

@end