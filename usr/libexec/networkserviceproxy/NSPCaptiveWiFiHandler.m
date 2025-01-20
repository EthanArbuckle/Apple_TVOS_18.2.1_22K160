@interface NSPCaptiveWiFiHandler
+ (id)sharedHandler;
- (BOOL)evaluate:(id)a3 completionHandler:(id)a4;
- (void)abort;
@end

@implementation NSPCaptiveWiFiHandler

+ (id)sharedHandler
{
  if (qword_100117248 != -1) {
    dispatch_once(&qword_100117248, &stru_1000FB0C8);
  }
  return (id)qword_100117240;
}

- (BOOL)evaluate:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = self;
  objc_sync_enter(v9);
  if (!v9)
  {

    goto LABEL_5;
  }

  if (!v9->_isRunning)
  {
    id v11 = v7;
    id v12 = v8;
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration"));
    v14 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    operationQueue = v9->_operationQueue;
    v9->_operationQueue = v14;

    uint64_t v17 = NPGetInternalQueue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    -[NSOperationQueue setUnderlyingQueue:](v9->_operationQueue, "setUnderlyingQueue:", v18);

    uint64_t v19 = objc_claimAutoreleasedReturnValue( +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:]( &OBJC_CLASS___NSURLSession,  "sessionWithConfiguration:delegate:delegateQueue:",  v13,  0LL,  v9->_operationQueue));
    urlSession = v9->_urlSession;
    v9->_urlSession = (NSURLSession *)v19;

    -[NSURLSession setSessionDescription:](v9->_urlSession, "setSessionDescription:", @"PrivacyProxyCaptiveProbe");
    id v21 = objc_retainBlock(v12);

    id completionHandler = v9->_completionHandler;
    v9->_id completionHandler = v21;

    objc_storeStrong((id *)&v9->_interfaceName, a3);
    v9->_isRunning = 1;

    objc_initWeak(&location, v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"http://netcts.cdn-apple.com"));
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableURLRequest requestWithURL:cachePolicy:timeoutInterval:]( &OBJC_CLASS___NSMutableURLRequest,  "requestWithURL:cachePolicy:timeoutInterval:",  v23,  4LL,  10.0));
    [v24 setBoundInterfaceIdentifier:v9->_interfaceName];
    v25 = v9->_urlSession;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_1000B1B9C;
    v29[3] = &unk_1000FB0F0;
    objc_copyWeak(&v30, &location);
    v29[4] = v9;
    uint64_t v26 = objc_claimAutoreleasedReturnValue( -[NSURLSession dataTaskWithRequest:completionHandler:]( v25,  "dataTaskWithRequest:completionHandler:",  v24,  v29));
    dataTask = v9->_dataTask;
    v9->_dataTask = (NSURLSessionDataTask *)v26;

    -[NSURLSessionDataTask resume](v9->_dataTask, "resume");
    -[NSURLSession finishTasksAndInvalidate](v9->_urlSession, "finishTasksAndInvalidate");
    objc_destroyWeak(&v30);

    objc_destroyWeak(&location);
LABEL_5:
    BOOL v10 = 1;
    goto LABEL_6;
  }

  BOOL v10 = 0;
LABEL_6:
  objc_sync_exit(v9);

  return v10;
}

- (void)abort
{
}

- (void).cxx_destruct
{
}

@end