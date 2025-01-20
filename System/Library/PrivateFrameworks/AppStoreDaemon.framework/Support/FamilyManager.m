@interface FamilyManager
- (FamilyManager)init;
- (void)_handleAccountChangedNotification;
@end

@implementation FamilyManager

- (FamilyManager)init
{
  v15.receiver = self;
  v15.super_class = (Class)&OBJC_CLASS___FamilyManager;
  v2 = -[FamilyManager init](&v15, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSLock);
    lock = v2->_lock;
    v2->_lock = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.appstored.FamilyManager.dispatch", &_dispatch_queue_attr_concurrent);
    dispatch = v2->_dispatch;
    v2->_dispatch = (OS_dispatch_queue *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.appstored.FamilyManager.notifications", &_dispatch_queue_attr_concurrent);
    notificationQueue = v2->_notificationQueue;
    v2->_notificationQueue = (OS_dispatch_queue *)v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[ActiveAccountObserver sharedInstance](&OBJC_CLASS___ActiveAccountObserver, "sharedInstance"));
    [v9 addObserver:v2 selector:"_handleAccountChangedNotification" name:@"AccountStorePrimaryAccountDidChange" object:v10];

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ActiveAccountObserver activeAccount](&OBJC_CLASS___ActiveAccountObserver, "activeAccount"));
    uint64_t v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ams_DSID"));
    currentAccountDSID = v2->_currentAccountDSID;
    v2->_currentAccountDSID = (NSNumber *)v12;
  }

  return v2;
}

- (void)_handleAccountChangedNotification
{
  notificationQueue = (dispatch_queue_s *)self->_notificationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100321228;
  block[3] = &unk_1003E9880;
  block[4] = self;
  dispatch_async(notificationQueue, block);
}

- (void).cxx_destruct
{
}

@end