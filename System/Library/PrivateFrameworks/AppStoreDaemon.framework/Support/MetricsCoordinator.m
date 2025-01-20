@interface MetricsCoordinator
- (MetricsCoordinator)init;
- (void)_handleAppleIDDidChangeNotification:(id)a3;
@end

@implementation MetricsCoordinator

- (MetricsCoordinator)init
{
  v34.receiver = self;
  v34.super_class = (Class)&OBJC_CLASS___MetricsCoordinator;
  v2 = -[MetricsCoordinator init](&v34, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS____TtC9appstored6LogKey);
    dispatch_queue_attr_t v4 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v4);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.appstored.MetricsCoordinator.dispatch", v5);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ams_activeiTunesAccount"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[ACAccountStore ams_sharedAccountStore](&OBJC_CLASS___ACAccountStore, "ams_sharedAccountStore"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ams_activeiTunesAccount"));
      uint64_t v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ams_DSID"));
      activeAccountID = v2->_activeAccountID;
      v2->_activeAccountID = (NSNumber *)v12;
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v14 addObserver:v2 selector:"_handleAppleIDDidChangeNotification:" name:@"com.apple.appstored.ASDItunesAccountDidChangeNotification" object:0];

    v15 = objc_alloc(&OBJC_CLASS___NSDate);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](&OBJC_CLASS___NSProcessInfo, "processInfo"));
    [v16 systemUptime];
    v18 = -[NSDate initWithTimeIntervalSinceNow:](v15, "initWithTimeIntervalSinceNow:", -v17);
    systemUpDate = v2->_systemUpDate;
    v2->_systemUpDate = v18;

    uint64_t v20 = ASDLogHandleForCategory(3LL);
    v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v23 = (void *)objc_opt_class(v2, v22);
      v24 = v2->_systemUpDate;
      id v25 = v23;
      if (v24)
      {
        -[NSDate timeIntervalSince1970](v24, "timeIntervalSince1970");
        uint64_t v27 = (uint64_t)v26;
      }

      else
      {
        uint64_t v27 = 0LL;
      }

      *(_DWORD *)buf = 138543874;
      v36 = v23;
      __int16 v37 = 2112;
      v38 = v3;
      __int16 v39 = 2048;
      uint64_t v40 = v27;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[%{public}@/%@] Metrics coordinator started with system up date %{time_t}ld",  buf,  0x20u);
    }

    v28 = (dispatch_queue_s *)v2->_dispatchQueue;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_1002331DC;
    v31[3] = &unk_1003E9DC0;
    v32 = v2;
    v33 = v3;
    v29 = v3;
    dispatch_async(v28, v31);
  }

  return v2;
}

- (void)_handleAppleIDDidChangeNotification:(id)a3
{
  id v4 = a3;
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10023673C;
  v7[3] = &unk_1003E9DC0;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

- (void).cxx_destruct
{
}

@end