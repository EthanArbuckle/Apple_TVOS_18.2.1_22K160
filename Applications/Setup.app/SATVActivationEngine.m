@interface SATVActivationEngine
+ (id)activationEngineWithOverrideActivationURL:(id)a3 sessionURL:(id)a4;
- (BOOL)allowAnyHTTPSCertificate;
- (NSDictionary)responseHeaders;
- (NSString)userAgent;
- (NSURL)overrideActivationURL;
- (NSURL)overrideSessionURL;
- (NSURLRequest)activationRequest;
- (NSURLSession)session;
- (NSURLSessionConfiguration)sessionConfiguration;
- (SATVActivationEngine)initWithOverrideActivationURL:(id)a3 sessionURL:(id)a4;
- (id)_newActivationRequestWithOptions:(id)a3 sessionData:(id)a4 error:(id *)a5;
- (id)completion;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)_cleanup;
- (void)_sendSessionRequest:(id)a3 withOptions:(id)a4;
- (void)cancel;
- (void)makeRequest:(id)a3 completion:(id)a4;
- (void)setActivationRequest:(id)a3;
- (void)setAllowAnyHTTPSCertificate:(BOOL)a3;
- (void)setCompletion:(id)a3;
- (void)setOverrideActivationURL:(id)a3;
- (void)setOverrideSessionURL:(id)a3;
- (void)setResponseHeaders:(id)a3;
- (void)setSessionConfiguration:(id)a3;
- (void)setUserAgent:(id)a3;
- (void)tryActivateWithOptions:(id)a3 requestMutator:(id)a4 completion:(id)a5;
@end

@implementation SATVActivationEngine

+ (id)activationEngineWithOverrideActivationURL:(id)a3 sessionURL:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [objc_alloc((Class)a1) initWithOverrideActivationURL:v7 sessionURL:v6];

  return v8;
}

- (SATVActivationEngine)initWithOverrideActivationURL:(id)a3 sessionURL:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SATVActivationEngine;
  v9 = -[SATVActivationEngine init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_overrideActivationURL, a3);
    objc_storeStrong((id *)&v10->_overrideSessionURL, a4);
  }

  return v10;
}

- (void)cancel
{
  v3 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue( -[SATVActivationEngine completion]( self,  "completion"));
  session = self->_session;
  -[SATVActivationEngine _cleanup](self, "_cleanup");
  if (session)
  {
    id v5 = sub_10002555C();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: Canceling any in-flight activation",  v7,  2u);
    }
  }

  if (v3) {
    v3[2](v3, 0LL, 0LL, 0LL, 0LL);
  }
}

- (void)_cleanup
{
  session = self->_session;
  self->_session = 0LL;

  activationData = self->_activationData;
  self->_activationData = 0LL;

  id completion = self->_completion;
  self->_id completion = 0LL;
}

- (NSURLSession)session
{
  session = self->_session;
  if (!session)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration defaultSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "defaultSessionConfiguration"));
    [v4 setWaitsForConnectivity:1];
    [v4 setTimeoutIntervalForResource:60.0];
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](&OBJC_CLASS___NSOperationQueue, "mainQueue"));
    id v6 = (NSURLSession *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v4,  self,  v5));
    id v7 = self->_session;
    self->_session = v6;

    session = self->_session;
  }

  return session;
}

- (NSURLSessionConfiguration)sessionConfiguration
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationEngine session](self, "session"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 configuration]);

  return (NSURLSessionConfiguration *)v3;
}

- (id)_newActivationRequestWithOptions:(id)a3 sessionData:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread")) {
    sub_100076CE8();
  }
  if (!v10) {
    sub_100076D10();
  }
  id v47 = 0LL;
  id v48 = 0LL;
  int v11 = MAECreateActivationRequestWithError(v10, &v48, v9, &v47);
  id v12 = v48;
  id v13 = v47;
  if (v11)
  {
    uint64_t v14 = objc_claimAutoreleasedReturnValue([v12 valueForHTTPHeaderField:@"User-Agent"]);
    if (!v14) {
      sub_100076D38();
    }
    v15 = (void *)v14;
    -[SATVActivationEngine setUserAgent:](self, "setUserAgent:", v14);
    if (self->_overrideActivationURL)
    {
      id v16 = sub_10002555C();
      v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue([v12 URL]);
        *(_DWORD *)buf = 138412290;
        v51 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: Setting override URL with old URL: %@",  buf,  0xCu);
      }

      [v12 setURL:self->_overrideActivationURL];
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationEngine userAgent](self, "userAgent"));
    [v12 setValue:v19 forHTTPHeaderField:@"User-Agent"];

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](&OBJC_CLASS___NSLocale, "preferredLanguages"));
    v21 = (void *)objc_claimAutoreleasedReturnValue([v20 firstObject]);
    [v12 setValue:v21 forHTTPHeaderField:@"Accept-Language"];

    if (sub_10002AF30())
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue([v12 URL]);
      v23 = (void *)objc_claimAutoreleasedReturnValue([v22 absoluteString]);
      unsigned int v24 = [v23 hasSuffix:@"/deviceActivation"];

      if (v24)
      {
        v41 = v15;
        id v42 = v9;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
        v26 = (void *)objc_claimAutoreleasedReturnValue([v25 dictionaryForKey:@"CustomActivationHeaders"]);

        __int128 v45 = 0u;
        __int128 v46 = 0u;
        __int128 v43 = 0u;
        __int128 v44 = 0u;
        id v27 = v26;
        id v28 = [v27 countByEnumeratingWithState:&v43 objects:v49 count:16];
        if (v28)
        {
          id v29 = v28;
          uint64_t v30 = *(void *)v44;
          do
          {
            for (i = 0LL; i != v29; i = (char *)i + 1)
            {
              if (*(void *)v44 != v30) {
                objc_enumerationMutation(v27);
              }
              uint64_t v32 = *(void *)(*((void *)&v43 + 1) + 8LL * (void)i);
              v33 = (void *)objc_claimAutoreleasedReturnValue([v27 objectForKeyedSubscript:v32]);
              [v12 setValue:v33 forHTTPHeaderField:v32];
            }

            id v29 = [v27 countByEnumeratingWithState:&v43 objects:v49 count:16];
          }

          while (v29);
        }

        v15 = v41;
        id v9 = v42;
      }
    }

    if (self->_allowAnyHTTPSCertificate)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue([v12 URL]);
      v35 = (void *)objc_claimAutoreleasedReturnValue([v34 host]);
      +[NSURLRequest setAllowsAnyHTTPSCertificate:forHost:]( &OBJC_CLASS___NSURLRequest,  "setAllowsAnyHTTPSCertificate:forHost:",  1LL,  v35);
    }
  }

  else
  {
    id v36 = sub_10002555C();
    v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      char v38 = sub_10002AF30();
      v39 = v13;
      if ((v38 & 1) == 0)
      {
        id v5 = (void *)objc_claimAutoreleasedReturnValue([v13 domain]);
        v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"<Error domain: %@, code %ld>",  v5,  [v13 code]));
      }

      *(_DWORD *)buf = 138543362;
      v51 = v39;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: Failed to create activation request: %{public}@",  buf,  0xCu);
      if ((v38 & 1) == 0)
      {
      }
    }

    if (a5) {
      *a5 = v13;
    }
  }

  return v12;
}

- (void)_sendSessionRequest:(id)a3 withOptions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  v21 = sub_100025E20;
  v22 = sub_100025E30;
  id v23 = 0LL;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationEngine session](self, "session"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100025E38;
  v15[3] = &unk_1000C9A98;
  v15[4] = self;
  id v9 = v7;
  id v16 = v9;
  v17 = &v18;
  uint64_t v10 = objc_claimAutoreleasedReturnValue([v8 dataTaskWithRequest:v6 completionHandler:v15]);
  int v11 = (void *)v19[5];
  v19[5] = v10;

  id v12 = sub_10002555C();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Buddy Activate: URL Session starting", v14, 2u);
  }

  [(id)v19[5] resume];
  _Block_object_dispose(&v18, 8);
}

- (void)tryActivateWithOptions:(id)a3 requestMutator:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  -[SATVActivationEngine setCompletion:](self, "setCompletion:", v10);
  activationData = self->_activationData;
  self->_activationData = 0LL;

  dispatch_queue_global_t global_queue = dispatch_get_global_queue(25LL, 0LL);
  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100026474;
  v17[3] = &unk_1000C9AE8;
  v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v14 = v10;
  id v15 = v8;
  id v16 = v9;
  dispatch_async(v13, v17);
}

- (void)makeRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (NSURLRequest *)[a3 mutableCopy];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationEngine userAgent](self, "userAgent"));
  -[NSURLRequest setValue:forHTTPHeaderField:](v7, "setValue:forHTTPHeaderField:", v8, @"User-Agent");

  activationRequest = self->_activationRequest;
  self->_activationRequest = v7;
  id v10 = v7;

  -[SATVActivationEngine setCompletion:](self, "setCompletion:", v6);
  int v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationEngine session](self, "session"));
  id v12 = (id)objc_claimAutoreleasedReturnValue([v11 dataTaskWithRequest:self->_activationRequest]);

  [v12 resume];
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v12 = a5;
  id v8 = (void (**)(id, uint64_t))a6;
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSHTTPURLResponse, v9);
  if ((objc_opt_isKindOfClass(v12, v10) & 1) != 0)
  {
    int v11 = (void *)objc_claimAutoreleasedReturnValue([v12 allHeaderFields]);
    -[SATVActivationEngine setResponseHeaders:](self, "setResponseHeaders:", v11);

    if (!v8) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  -[SATVActivationEngine setResponseHeaders:](self, "setResponseHeaders:", 0LL);
  if (v8) {
LABEL_5:
  }
    v8[2](v8, 1LL);
LABEL_6:
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  id v13 = (NSURLSession *)a3;
  id v8 = a4;
  id v9 = a5;
  if (self->_session == v13)
  {
    activationData = self->_activationData;
    if (activationData)
    {
      -[NSMutableData appendData:](activationData, "appendData:", v9);
    }

    else
    {
      int v11 = -[NSMutableData initWithData:](objc_alloc(&OBJC_CLASS___NSMutableData), "initWithData:", v9);
      id v12 = self->_activationData;
      self->_activationData = v11;
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  if (self->_session == a3)
  {
    id v11 = sub_10002555C();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      NSUInteger v13 = -[NSMutableData length](self->_activationData, "length");
      char v14 = sub_10002AF30();
      id v15 = v10;
      if ((v14 & 1) == 0)
      {
        id v5 = (void *)objc_claimAutoreleasedReturnValue([v10 domain]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"<Error domain: %@, code %ld>",  v5,  [v10 code]));
      }

      *(_DWORD *)buf = 134218242;
      NSUInteger v24 = v13;
      __int16 v25 = 2114;
      v26 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Buddy Activate: Task completed with activationData length=%llu, error: %{public}@",  buf,  0x16u);
      if ((v14 & 1) == 0)
      {
      }
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationEngine completion](self, "completion"));
    if (v16)
    {
      id v17 = -[NSMutableData copy](self->_activationData, "copy");
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationEngine responseHeaders](self, "responseHeaders"));
      id v19 = [v18 copy];

      id v20 = (void (**)(void, void, void, void, void))objc_claimAutoreleasedReturnValue( -[SATVActivationEngine completion]( self,  "completion"));
      -[SATVActivationEngine _cleanup](self, "_cleanup");
      v21 = (void *)objc_claimAutoreleasedReturnValue([v9 response]);
      v22 = (void *)objc_claimAutoreleasedReturnValue([v21 URL]);
      ((void (**)(void, id, id, void *, id))v20)[2](v20, v17, v19, v22, v10);
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  v21 = (NSURLSession *)a3;
  id v11 = (NSURLRequest *)a6;
  id v12 = (void (**)(id, NSURLRequest *))a7;
  id v13 = [a5 statusCode];
  if (a5)
  {
    if (v13 == (id)302)
    {
      activationRequest = self->_activationRequest;
      if (activationRequest)
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLRequest HTTPBody](activationRequest, "HTTPBody"));

        if (v15)
        {
          id v16 = (NSURLRequest *)-[NSURLRequest mutableCopy](v11, "mutableCopy");
          -[NSURLRequest setHTTPMethod:](v16, "setHTTPMethod:", @"POST");
          id v17 = (void *)objc_claimAutoreleasedReturnValue( -[NSURLRequest valueForHTTPHeaderField:]( self->_activationRequest,  "valueForHTTPHeaderField:",  @"Content-Type"));
          -[NSURLRequest setValue:forHTTPHeaderField:](v16, "setValue:forHTTPHeaderField:", v17, @"Content-Type");

          id v18 = (void *)objc_claimAutoreleasedReturnValue( -[NSURLRequest valueForHTTPHeaderField:]( self->_activationRequest,  "valueForHTTPHeaderField:",  @"Content-Length"));
          -[NSURLRequest setValue:forHTTPHeaderField:]( v16,  "setValue:forHTTPHeaderField:",  v18,  @"Content-Length");

          id v19 = (void *)objc_claimAutoreleasedReturnValue(-[SATVActivationEngine userAgent](self, "userAgent"));
          -[NSURLRequest setValue:forHTTPHeaderField:](v16, "setValue:forHTTPHeaderField:", v19, @"User-Agent");

          id v20 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLRequest HTTPBody](self->_activationRequest, "HTTPBody"));
          -[NSURLRequest setHTTPBody:](v16, "setHTTPBody:", v20);

          id v11 = v16;
        }
      }
    }
  }

  if (self->_session == v21 && self->_activationRequest != v11) {
    -[SATVActivationEngine setActivationRequest:](self, "setActivationRequest:", v11);
  }
  if (v12) {
    v12[2](v12, v11);
  }
}

- (BOOL)allowAnyHTTPSCertificate
{
  return self->_allowAnyHTTPSCertificate;
}

- (void)setAllowAnyHTTPSCertificate:(BOOL)a3
{
  self->_allowAnyHTTPSCertificate = a3;
}

- (void)setSessionConfiguration:(id)a3
{
}

- (NSURL)overrideActivationURL
{
  return self->_overrideActivationURL;
}

- (void)setOverrideActivationURL:(id)a3
{
}

- (NSURL)overrideSessionURL
{
  return self->_overrideSessionURL;
}

- (void)setOverrideSessionURL:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (NSDictionary)responseHeaders
{
  return self->_responseHeaders;
}

- (void)setResponseHeaders:(id)a3
{
}

- (NSURLRequest)activationRequest
{
  return self->_activationRequest;
}

- (void)setActivationRequest:(id)a3
{
}

- (NSString)userAgent
{
  return (NSString *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setUserAgent:(id)a3
{
}

- (void).cxx_destruct
{
}

@end