@interface TestFlightExtensionSyncActivityManager
- (TestFlightExtensionSyncActivityManager)init;
- (void)_handleBagChangedNotification:(id)a3;
- (void)dealloc;
- (void)testFlightServiceHost:(id)a3 didUpdateExtensionStatus:(int64_t)a4;
@end

@implementation TestFlightExtensionSyncActivityManager

- (TestFlightExtensionSyncActivityManager)init
{
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___TestFlightExtensionSyncActivityManager;
  v2 = -[TestFlightExtensionSyncActivityManager init](&v18, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.appstored.TestFlightExtensionSyncActivityManager.dispatch", v4);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v5;

    v7 = sub_1003054A0((id *)objc_alloc(&OBJC_CLASS___TestFlightServiceHost), v2->_dispatchQueue);
    serviceHost = v2->_serviceHost;
    v2->_serviceHost = (TestFlightServiceHost *)v7;

    v9 = v2->_serviceHost;
    if (v9) {
      objc_storeWeak((id *)&v9->_delegate, v2);
    }
    v10 = -[TestFlightExtensionSyncActivity initWithTestFlightServiceHost:]( objc_alloc(&OBJC_CLASS____TtC9appstored31TestFlightExtensionSyncActivity),  "initWithTestFlightServiceHost:",  v2->_serviceHost);
    syncActivity = v2->_syncActivity;
    v2->_syncActivity = v10;

    v2->_isActivityRegistered = 0;
    v12 = (dispatch_queue_s *)v2->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10018F83C;
    block[3] = &unk_1003E9880;
    v13 = v2;
    v17 = v13;
    dispatch_async(v12, block);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v14 addObserver:v13 selector:"_handleBagChangedNotification:" name:AMSBagChangedNotification object:0];
  }

  return v2;
}

- (void)dealloc
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TestFlightExtensionSyncActivityManager;
  -[TestFlightExtensionSyncActivityManager dealloc](&v4, "dealloc");
}

- (void)testFlightServiceHost:(id)a3 didUpdateExtensionStatus:(int64_t)a4
{
}

- (void)_handleBagChangedNotification:(id)a3
{
  dispatchQueue = (dispatch_queue_s *)self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10018FBCC;
  block[3] = &unk_1003E9880;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void).cxx_destruct
{
}

@end