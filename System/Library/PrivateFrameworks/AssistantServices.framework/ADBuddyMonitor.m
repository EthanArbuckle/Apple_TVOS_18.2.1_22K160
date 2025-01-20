@interface ADBuddyMonitor
+ (id)sharedManager;
- (ADBuddyMonitor)init;
- (BOOL)_checkBuddyState;
- (BOOL)isPastBuddy;
- (void)_updateBuddyState;
- (void)dealloc;
@end

@implementation ADBuddyMonitor

- (ADBuddyMonitor)init
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___ADBuddyMonitor;
  v2 = -[ADBuddyMonitor init](&v17, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("Buddy Monitor Queue", v4);

    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;

    unsigned int v7 = -[ADBuddyMonitor _checkBuddyState](v2, "_checkBuddyState");
    v2->_isPastBuddy = v7;
    v8 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v9 = @"running";
      if (v7) {
        v9 = @"complete";
      }
      *(_DWORD *)buf = 136315394;
      v19 = "-[ADBuddyMonitor init]";
      __int16 v20 = 2112;
      v21 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "%s Buddy is %@", buf, 0x16u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    id v11 = off_100573350();
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(v11);
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v2,  (CFNotificationCallback)sub_10011F898,  v12,  0LL,  CFNotificationSuspensionBehaviorDrop);

    v13 = CFNotificationCenterGetDarwinNotifyCenter();
    id v14 = off_100573358();
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(v14);
    CFNotificationCenterAddObserver( v13,  v2,  (CFNotificationCallback)sub_10011F898,  v15,  0LL,  CFNotificationSuspensionBehaviorDrop);

    -[ADBuddyMonitor _updateBuddyState](v2, "_updateBuddyState");
  }

  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  id v4 = off_100573350();
  dispatch_queue_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue(v4);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v5, 0LL);

  v6 = CFNotificationCenterGetDarwinNotifyCenter();
  id v7 = off_100573358();
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue(v7);
  CFNotificationCenterRemoveObserver(v6, self, v8, 0LL);

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ADBuddyMonitor;
  -[ADBuddyMonitor dealloc](&v9, "dealloc");
}

- (void)_updateBuddyState
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011F5D0;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (BOOL)_checkBuddyState
{
  return off_100573360() ^ 1;
}

- (BOOL)isPastBuddy
{
  return self->_isPastBuddy;
}

- (void).cxx_destruct
{
}

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10011F9B0;
  block[3] = &unk_1004FCFF8;
  block[4] = a1;
  if (qword_100577E80 != -1) {
    dispatch_once(&qword_100577E80, block);
  }
  return (id)qword_100577E88;
}

@end