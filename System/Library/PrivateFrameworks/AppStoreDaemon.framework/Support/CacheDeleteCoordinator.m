@interface CacheDeleteCoordinator
- (CacheDeleteCoordinator)init;
- (void)dealloc;
@end

@implementation CacheDeleteCoordinator

- (CacheDeleteCoordinator)init
{
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___CacheDeleteCoordinator;
  v2 = -[CacheDeleteCoordinator init](&v24, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_attr_t v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_BACKGROUND, 0);
    attr = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v5);

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.appstored.CacheDeleteCoordinator.run", attr);
    runQueue = v2->_runQueue;
    v2->_runQueue = (OS_dispatch_queue *)v6;

    v8 = objc_opt_new(&OBJC_CLASS___AppPurgeCoordinator);
    appPurgeCoordinator = v2->_appPurgeCoordinator;
    v2->_appPurgeCoordinator = (CacheDeletePurgeableProvider *)v8;

    objc_initWeak(&location, v2);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_10021E46C;
    v31[3] = &unk_1003ED4C8;
    objc_copyWeak(&v32, &location);
    v10 = objc_retainBlock(v31);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = sub_10021E814;
    v29[3] = &unk_1003ED4C8;
    objc_copyWeak(&v30, &location);
    v11 = objc_retainBlock(v29);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10021F0C0;
    v27[3] = &unk_1003ECBA0;
    objc_copyWeak(&v28, &location);
    v12 = objc_retainBlock(v27);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472LL;
    v25[2] = sub_10021F24C;
    v25[3] = &unk_1003ED4C8;
    objc_copyWeak(&v26, &location);
    v13 = objc_retainBlock(v25);
    int v14 = CacheDeleteRegisterInfoCallbacks(@"com.apple.appstored.CacheDelete", v10, v11, v12, v13);
    uint64_t v15 = ASDLogHandleForCategory(9LL);
    v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_opt_class(v2, v17);
      *(_DWORD *)buf = 138543874;
      v35 = v18;
      __int16 v36 = 2114;
      v37 = @"com.apple.appstored.CacheDelete";
      __int16 v38 = 1024;
      int v39 = v14;
      id v19 = v18;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] Registered cache delete callbacks for clientID: %{public}@ with osResult: %d",  buf,  0x1Cu);
    }

    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
    v20 = objc_alloc_init(&OBJC_CLASS___PartialDownloadPurgeCoordinator);
    partialDownloadPurgeCoordinator = v2->_partialDownloadPurgeCoordinator;
    v2->_partialDownloadPurgeCoordinator = (CacheDeletePurgeableProvider *)v20;
  }

  return v2;
}

- (void)dealloc
{
  scheduledTimer = self->_scheduledTimer;
  if (scheduledTimer) {
    dispatch_source_cancel((dispatch_source_t)scheduledTimer);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___CacheDeleteCoordinator;
  -[CacheDeleteCoordinator dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
}

@end