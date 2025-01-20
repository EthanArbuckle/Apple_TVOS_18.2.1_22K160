@interface PDSecureConnectionManager
- (NSURLRequest)request;
- (id)failureHandler;
- (id)successHandler;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5;
- (void)_sendFailure:(id)a3;
- (void)_sendSuccess;
- (void)cancel;
- (void)setFailureHandler:(id)a3;
- (void)setRequest:(id)a3;
- (void)setSuccessHandler:(id)a3;
- (void)start;
@end

@implementation PDSecureConnectionManager

- (void)start
{
  if (!self->_started && !self->_canceled)
  {
    self->_started = 1;
    id v10 = (id)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration defaultSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "defaultSessionConfiguration"));
    uint64_t v3 = PKServiceBundleIdentifier;
    objc_msgSend(v10, "set_attributedBundleIdentifier:", PKServiceBundleIdentifier);
    objc_msgSend(v10, "set_sourceApplicationBundleIdentifier:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
    v5 = (NSURLSession *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v10,  self,  v4));
    urlSession = self->_urlSession;
    self->_urlSession = v5;

    v7 = self->_urlSession;
    if (v7)
    {
      v8 = (NSURLSessionTask *)objc_claimAutoreleasedReturnValue(-[NSURLSession dataTaskWithRequest:](v7, "dataTaskWithRequest:", self->_request));
      task = self->_task;
      self->_task = v8;

      -[NSURLSessionTask resume](self->_task, "resume");
    }

    else
    {
      -[PDSecureConnectionManager _sendFailure:](self, "_sendFailure:", 0LL);
    }
  }

- (void)cancel
{
  if (!self->_canceled)
  {
    self->_canceled = 1;
    -[NSURLSession invalidateAndCancel](self->_urlSession, "invalidateAndCancel");
  }

- (void)_sendSuccess
{
  id v3 = PDDefaultQueue();
  v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v3);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10017A6C8;
  block[3] = &unk_100639300;
  block[4] = self;
  dispatch_async(v4, block);
}

- (void)_sendFailure:(id)a3
{
  id v4 = a3;
  id v5 = PDDefaultQueue();
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10017A7B4;
  v8[3] = &unk_1006392B0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  uint64_t Object = PKLogFacilityTypeGetObject(2LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([a4 description]);
    int v8 = 138412290;
    id v9 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Session did become invalid with error %@",  (uint8_t *)&v8,  0xCu);
  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  v6 = (void (**)(id, uint64_t, void))a5;
  uint64_t Object = PKLogFacilityTypeGetObject(2LL);
  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(Object);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = a4;
    v18 = (void *)objc_claimAutoreleasedReturnValue([v9 protectionSpace]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v18 realm]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v9 protectionSpace]);
    v11 = (void *)objc_claimAutoreleasedReturnValue([v17 host]);
    v12 = (void *)objc_claimAutoreleasedReturnValue([v9 protectionSpace]);
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 protocol]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v9 protectionSpace]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 authenticationMethod]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v9 proposedCredential]);

    *(_DWORD *)buf = 138413314;
    v20 = v10;
    __int16 v21 = 2112;
    v22 = v11;
    __int16 v23 = 2112;
    v24 = v13;
    __int16 v25 = 2112;
    v26 = v15;
    __int16 v27 = 2112;
    v28 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Received authentication challenge:\n ---->Protection Space: <Realm: %@, Host: %@, Protocol: %@, Method: %@>\n ---->Proposed Credential: %@\n Performing default handling.",  buf,  0x34u);
  }

  v6[2](v6, 1LL, 0LL);
}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  request = self->_request;
  id v7 = a5;
  id v9 = (id)objc_claimAutoreleasedReturnValue(-[NSURLRequest HTTPBody](request, "HTTPBody"));
  int v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSInputStream inputStreamWithData:](&OBJC_CLASS___NSInputStream, "inputStreamWithData:", v9));
  (*((void (**)(id, void *))a5 + 2))(v7, v8);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  if (a5) {
    -[PDSecureConnectionManager _sendFailure:](self, "_sendFailure:", a5, a4);
  }
  else {
    -[PDSecureConnectionManager _sendSuccess](self, "_sendSuccess", a3, a4);
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v9 = a5;
  id v10 = (void (**)(id, uint64_t))a6;
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___NSHTTPURLResponse, v11);
  if ((objc_opt_isKindOfClass(v9, v12) & 1) != 0)
  {
    objc_storeStrong((id *)&self->_response, a5);
    -[NSMutableData setLength:](self->_data, "setLength:", 0LL);
    uint64_t v13 = 1LL;
  }

  else
  {
    NSErrorUserInfoKey v16 = NSLocalizedDescriptionKey;
    v17 = @"Connection received non-http URL response";
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v17,  &v16,  1LL));
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSURLErrorDomain,  -1011LL,  v14));
    -[PDSecureConnectionManager _sendFailure:](self, "_sendFailure:", v15);

    uint64_t v13 = 0LL;
  }

  v10[2](v10, v13);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  data = self->_data;
  if (!data)
  {
    uint64_t v12 = -[NSMutableData initWithLength:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithLength:", 0LL);
    uint64_t v13 = self->_data;
    self->_data = v12;

    data = self->_data;
  }

  v14 = -[NSMutableData length](data, "length");
  if (&v14[(void)[v10 length]] > (char *)0xF00000)
  {
    [v9 cancel];
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Connection received response data in excess of %g megabyte limit",  0x402E000000000000LL));
    NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
    v19 = v15;
    NSErrorUserInfoKey v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v19,  &v18,  1LL));
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSURLErrorDomain,  -1103LL,  v16));
    -[PDSecureConnectionManager _sendFailure:](self, "_sendFailure:", v17);
  }

  else
  {
    -[NSMutableData appendData:](self->_data, "appendData:", v10);
  }
}

- (id)successHandler
{
  return objc_getProperty(self, a2, 48LL, 1);
}

- (void)setSuccessHandler:(id)a3
{
}

- (id)failureHandler
{
  return objc_getProperty(self, a2, 56LL, 1);
}

- (void)setFailureHandler:(id)a3
{
}

- (NSURLRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (void).cxx_destruct
{
}

@end