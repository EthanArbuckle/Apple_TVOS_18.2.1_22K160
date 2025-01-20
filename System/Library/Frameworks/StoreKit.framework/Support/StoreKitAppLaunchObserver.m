@interface StoreKitAppLaunchObserver
- (StoreKitAppLaunchObserver)init;
- (StoreKitAppLaunchObserverDelegate)delegate;
- (void)_appDidLaunch:(id)a3;
- (void)_startObservingIfNecessary;
- (void)_stopObserving;
- (void)_stopObservingIfNecessary;
- (void)observeAppLaunchForBundleIDs:(id)a3;
- (void)removeObservationForBundleIDs:(id)a3;
- (void)setDelegate:(id)a3;
- (void)stopObserving;
@end

@implementation StoreKitAppLaunchObserver

- (StoreKitAppLaunchObserver)init
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___StoreKitAppLaunchObserver;
  v2 = -[StoreKitAppLaunchObserver init](&v18, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.StoreKit.StoreKitAppLaunchObserver.observations", 0LL);
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.StoreKit.StoreKitAppLaunchObserver.notifyQueue", 0LL);
    notifyQueue = v2->_notifyQueue;
    v2->_notifyQueue = (OS_dispatch_queue *)v5;

    v7 = -[BMBiomeScheduler initWithIdentifier:targetQueue:waking:]( objc_alloc(&OBJC_CLASS___BMBiomeScheduler),  "initWithIdentifier:targetQueue:waking:",  @"com.apple.StoreKit.StoreKitAppLaunchObserver.scheduler",  v2->_observerQueue,  1LL);
    scheduler = v2->_scheduler;
    v2->_scheduler = v7;

    v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    bundleIDsToObserve = v2->_bundleIDsToObserve;
    v2->_bundleIDsToObserve = v9;

    sink = v2->_sink;
    v2->_sink = 0LL;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue([v12 UUIDString]);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 componentsSeparatedByString:@"-"]);
    uint64_t v15 = objc_claimAutoreleasedReturnValue([v14 firstObject]);
    logKey = v2->_logKey;
    v2->_logKey = (NSString *)v15;
  }

  return v2;
}

- (void)observeAppLaunchForBundleIDs:(id)a3
{
  id v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100062484;
  v7[3] = &unk_1002E78B8;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)observerQueue, v7);
}

- (void)removeObservationForBundleIDs:(id)a3
{
  id v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000626C0;
  v7[3] = &unk_1002E78B8;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)observerQueue, v7);
}

- (void)stopObserving
{
  observerQueue = self->_observerQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000628D8;
  block[3] = &unk_1002E7958;
  block[4] = self;
  dispatch_async((dispatch_queue_t)observerQueue, block);
}

- (void)_stopObserving
{
  sink = self->_sink;
  self->_sink = 0LL;

  if (qword_10032EBC8 != -1) {
    dispatch_once(&qword_10032EBC8, &stru_1002E9AC0);
  }
  if (os_log_type_enabled((os_log_t)qword_10032EB88, OS_LOG_TYPE_DEBUG)) {
    sub_10026267C();
  }
  -[NSMutableSet removeAllObjects](self->_bundleIDsToObserve, "removeAllObjects");
}

- (void)_startObservingIfNecessary
{
  if (self->_sink)
  {
    if (qword_10032EBC8 != -1) {
      dispatch_once(&qword_10032EBC8, &stru_1002E9AC0);
    }
    if (os_log_type_enabled((os_log_t)qword_10032EB88, OS_LOG_TYPE_DEBUG)) {
      sub_10026279C();
    }
  }

  else if (-[NSMutableSet count](self->_bundleIDsToObserve, "count"))
  {
    if (qword_10032EBC8 != -1) {
      dispatch_once(&qword_10032EBC8, &stru_1002E9AC0);
    }
    if (os_log_type_enabled((os_log_t)qword_10032EB88, OS_LOG_TYPE_DEBUG)) {
      sub_10026273C();
    }
    objc_initWeak(&location, self);
    id v3 = -[NSString copy](self->_logKey, "copy");
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[BMStreams appLaunch](&OBJC_CLASS___BMStreams, "appLaunch"));
    dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 publisher]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue( [v5 filterWithKeyPath:@"eventBody.bundleID" comparison:3 value:self->_bundleIDsToObserve]);
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 filterWithKeyPath:@"eventBody.isStarting" value:&__kCFBooleanTrue]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 subscribeOn:self->_scheduler]);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100062C44;
    v16[3] = &unk_1002E9A50;
    objc_copyWeak(&v18, &location);
    id v9 = v3;
    id v17 = v9;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100062E18;
    v13[3] = &unk_1002E9AA0;
    objc_copyWeak(&v15, &location);
    id v10 = v9;
    id v14 = v10;
    v11 = (BPSSink *)objc_claimAutoreleasedReturnValue([v8 sinkWithCompletion:v16 receiveInput:v13]);
    sink = self->_sink;
    self->_sink = v11;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v18);

    objc_destroyWeak(&location);
  }

  else
  {
    if (qword_10032EBC8 != -1) {
      dispatch_once(&qword_10032EBC8, &stru_1002E9AC0);
    }
    if (os_log_type_enabled((os_log_t)qword_10032EB88, OS_LOG_TYPE_DEBUG)) {
      sub_1002626DC();
    }
  }

- (void)_stopObservingIfNecessary
{
  if (!-[NSMutableSet count](self->_bundleIDsToObserve, "count")) {
    -[StoreKitAppLaunchObserver _stopObserving](self, "_stopObserving");
  }
}

- (void)_appDidLaunch:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[StoreKitAppLaunchObserver delegate](self, "delegate"));
  if (v5
    && (id v6 = (void *)v5,
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[StoreKitAppLaunchObserver delegate](self, "delegate")),
        char v8 = objc_opt_respondsToSelector(v7, "appDidLaunchWithBundleID:"),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[StoreKitAppLaunchObserver delegate](self, "delegate"));
    [v9 appDidLaunchWithBundleID:v4];
  }

  else
  {
    if (qword_10032EBC8 != -1) {
      dispatch_once(&qword_10032EBC8, &stru_1002E9AC0);
    }
    if (os_log_type_enabled((os_log_t)qword_10032EB88, OS_LOG_TYPE_ERROR)) {
      sub_1002627FC();
    }
  }
}

- (StoreKitAppLaunchObserverDelegate)delegate
{
  return (StoreKitAppLaunchObserverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end