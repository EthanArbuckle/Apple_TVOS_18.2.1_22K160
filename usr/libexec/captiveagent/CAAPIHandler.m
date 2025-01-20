@interface CAAPIHandler
- (CAAPIHandler)initWithURLString:(id)a3 queue:(id)a4 responseHandler:(id)a5;
- (NSOperationQueue)opQueue;
- (NSString)interfaceName;
- (NSString)userAgent;
- (NSURL)apiURL;
- (NSURLSessionDataTask)dataTask;
- (id)responseHandler;
- (unsigned)timeoutSeconds;
- (void)cancel;
- (void)fetchAPI;
- (void)sendResponseCode:(unsigned int)a3 dictionary:(id)a4;
- (void)setApiURL:(id)a3;
- (void)setDataTask:(id)a3;
- (void)setInterfaceName:(id)a3;
- (void)setOpQueue:(id)a3;
- (void)setResponseHandler:(id)a3;
- (void)setTimeoutSeconds:(unsigned int)a3;
- (void)setUserAgent:(id)a3;
@end

@implementation CAAPIHandler

- (CAAPIHandler)initWithURLString:(id)a3 queue:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___CAAPIHandler;
  v11 = -[CAAPIHandler init](&v20, "init");
  if (!v11)
  {
LABEL_4:
    v13 = 0LL;
    goto LABEL_6;
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", v8));
  -[CAAPIHandler setApiURL:](v11, "setApiURL:", v12);

  v13 = (CAAPIHandler *)objc_claimAutoreleasedReturnValue(-[CAAPIHandler apiURL](v11, "apiURL"));
  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CAAPIHandler apiURL](v11, "apiURL"));
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 scheme]);
    id v16 = [v15 compare:@"https" options:1];

    if (!v16)
    {
      v17 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
      -[CAAPIHandler setOpQueue:](v11, "setOpQueue:", v17);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CAAPIHandler opQueue](v11, "opQueue"));
      [v18 setUnderlyingQueue:v9];

      -[CAAPIHandler setResponseHandler:](v11, "setResponseHandler:", v10);
      v13 = v11;
      goto LABEL_6;
    }

    goto LABEL_4;
  }

- (void)cancel
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[CAAPIHandler dataTask](self, "dataTask"));
  [v2 cancel];
}

- (void)sendResponseCode:(unsigned int)a3 dictionary:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v8 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CAAPIHandler responseHandler](self, "responseHandler"));

  if (v6)
  {
    v7 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(-[CAAPIHandler responseHandler](self, "responseHandler"));
    ((void (**)(void, uint64_t, id))v7)[2](v7, v4, v8);
  }

  -[CAAPIHandler cancel](self, "cancel");
}

- (void)fetchAPI
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration defaultSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "defaultSessionConfiguration"));
  [v3 setHTTPCookieStorage:0];
  [v3 setURLCache:0];
  [v3 setURLCredentialStorage:0];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[CAAPIHandler opQueue](self, "opQueue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v3,  0LL,  v4));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CAAPIHandler apiURL](self, "apiURL"));
  if (-[CAAPIHandler timeoutSeconds](self, "timeoutSeconds")) {
    double v7 = (double)-[CAAPIHandler timeoutSeconds](self, "timeoutSeconds");
  }
  else {
    double v7 = 60.0;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableURLRequest requestWithURL:cachePolicy:timeoutInterval:]( &OBJC_CLASS___NSMutableURLRequest,  "requestWithURL:cachePolicy:timeoutInterval:",  v6,  4LL,  v7));

  [v8 setValue:@"application/captive+json" forHTTPHeaderField:@"Accept"];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CAAPIHandler userAgent](self, "userAgent"));
  [v8 setValue:v9 forHTTPHeaderField:@"User-Agent"];

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CAAPIHandler interfaceName](self, "interfaceName"));
  [v8 setBoundInterfaceIdentifier:v10];

  objc_initWeak(&location, self);
  v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472LL;
  v15 = sub_10000B190;
  id v16 = &unk_100010A40;
  objc_copyWeak(&v17, &location);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v5 dataTaskWithRequest:v8 completionHandler:&v13]);
  -[CAAPIHandler setDataTask:](self, "setDataTask:", v11, v13, v14, v15, v16);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CAAPIHandler dataTask](self, "dataTask"));
  [v12 resume];

  [v5 finishTasksAndInvalidate];
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (NSURL)apiURL
{
  return (NSURL *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setApiURL:(id)a3
{
}

- (NSString)userAgent
{
  return (NSString *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setUserAgent:(id)a3
{
}

- (NSString)interfaceName
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setInterfaceName:(id)a3
{
}

- (unsigned)timeoutSeconds
{
  return self->_timeoutSeconds;
}

- (void)setTimeoutSeconds:(unsigned int)a3
{
  self->_timeoutSeconds = a3;
}

- (NSOperationQueue)opQueue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setOpQueue:(id)a3
{
}

- (NSURLSessionDataTask)dataTask
{
  return (NSURLSessionDataTask *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setDataTask:(id)a3
{
}

- (id)responseHandler
{
  return objc_getProperty(self, a2, 56LL, 1);
}

- (void)setResponseHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end