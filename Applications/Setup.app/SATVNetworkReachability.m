@interface SATVNetworkReachability
- (NSURLSession)urlSession;
- (id)newUrlSession;
- (void)_performReachabilityRequestWithRetryCount:(int64_t)a3 completion:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)setUrlSession:(id)a3;
- (void)testReachabilityWithCompletion:(id)a3;
@end

@implementation SATVNetworkReachability

- (id)newUrlSession
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLSessionConfiguration ephemeralSessionConfiguration]( &OBJC_CLASS___NSURLSessionConfiguration,  "ephemeralSessionConfiguration"));
  [v2 setRequestCachePolicy:4];
  [v2 setURLCache:0];
  [v2 setTimeoutIntervalForRequest:30.0];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLSession sessionWithConfiguration:](&OBJC_CLASS___NSURLSession, "sessionWithConfiguration:", v2));

  return v3;
}

- (void)testReachabilityWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = sub_10002AF94();
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[SATVNetworkReachability testReachabilityWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  id v7 = sub_10002AF94();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v19 = "-[SATVNetworkReachability testReachabilityWithCompletion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s - invalidating pending network reachability",  buf,  0xCu);
  }

  -[SATVNetworkReachability invalidate](self, "invalidate");
  v9 = -[SATVNetworkReachability newUrlSession](self, "newUrlSession");
  urlSession = self->_urlSession;
  self->_urlSession = v9;

  objc_initWeak((id *)buf, self);
  dispatch_time_t v11 = dispatch_time(0LL, 5000000000LL);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003D8E8;
  block[3] = &unk_1000CA300;
  objc_copyWeak(v17, (id *)buf);
  v17[1] = (id)3;
  id v16 = v4;
  id v14 = v4;
  dispatch_after(v11, v13, block);

  objc_destroyWeak(v17);
  objc_destroyWeak((id *)buf);
}

- (void)_performReachabilityRequestWithRetryCount:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = sub_10002AF94();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[SATVNetworkReachability _performReachabilityRequestWithRetryCount:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread")) {
    sub_10007752C();
  }
  +[NSDate timeIntervalSinceReferenceDate](&OBJC_CLASS___NSDate, "timeIntervalSinceReferenceDate");
  v10 = v9;
  objc_initWeak((id *)buf, self);
  dispatch_time_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkReachability urlSession](self, "urlSession"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"https://captive.apple.com/"));
  v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  v17 = sub_10003DC14;
  v18 = &unk_1000CA350;
  objc_copyWeak(v20, (id *)buf);
  v20[1] = v10;
  v20[2] = (id)a3;
  id v13 = v6;
  id v19 = v13;
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 dataTaskWithURL:v12 completionHandler:&v15]);
  objc_msgSend(v14, "resume", v15, v16, v17, v18);

  objc_destroyWeak(v20);
  objc_destroyWeak((id *)buf);
}

- (void)invalidate
{
  id v3 = sub_10002AF94();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v9 = 136315138;
    v10 = "-[SATVNetworkReachability invalidate]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v9, 0xCu);
  }

  if (self->_urlSession)
  {
    id v5 = sub_10002AF94();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      v10 = "-[SATVNetworkReachability invalidate]";
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s - Invalidating URLSession",  (uint8_t *)&v9,  0xCu);
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SATVNetworkReachability urlSession](self, "urlSession"));
    [v7 invalidateAndCancel];

    urlSession = self->_urlSession;
    self->_urlSession = 0LL;
  }

- (void)dealloc
{
  id v3 = sub_10002AF94();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[SATVNetworkReachability dealloc]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
  }

  -[SATVNetworkReachability invalidate](self, "invalidate");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SATVNetworkReachability;
  -[SATVNetworkReachability dealloc](&v5, "dealloc");
}

- (NSURLSession)urlSession
{
  return self->_urlSession;
}

- (void)setUrlSession:(id)a3
{
}

- (void).cxx_destruct
{
}

@end