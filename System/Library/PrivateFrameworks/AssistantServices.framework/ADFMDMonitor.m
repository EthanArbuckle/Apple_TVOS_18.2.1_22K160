@interface ADFMDMonitor
+ (id)sharedManager;
- (ADFMDMonitor)init;
- (BOOL)_fetchLostModeState;
- (BOOL)isLostModeActive;
- (void)_updateLostModeState;
- (void)dealloc;
@end

@implementation ADFMDMonitor

- (ADFMDMonitor)init
{
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ADFMDMonitor;
  v2 = -[ADFMDMonitor init](&v14, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("Find My Device Monitor Queue", v4);

    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v5;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    id v8 = off_1005773E8();
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(v8);
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v2,  (CFNotificationCallback)sub_100341918,  v9,  0LL,  CFNotificationSuspensionBehaviorDrop);

    unsigned int v10 = -[ADFMDMonitor _fetchLostModeState](v2, "_fetchLostModeState");
    v2->_isLostModeActive = v10;
    v11 = (os_log_s *)AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      v12 = @"not lost";
      if (v10) {
        v12 = @"lost";
      }
      *(_DWORD *)buf = 136315394;
      v16 = "-[ADFMDMonitor init]";
      __int16 v17 = 2112;
      v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%s Device is %@", buf, 0x16u);
    }
  }

  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  id v4 = off_1005773E8();
  dispatch_queue_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue(v4);
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v5, 0LL);

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ADFMDMonitor;
  -[ADFMDMonitor dealloc](&v6, "dealloc");
}

- (void)_updateLostModeState
{
  serialQueue = (dispatch_queue_s *)self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100341748;
  block[3] = &unk_1004FD940;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (BOOL)_fetchLostModeState
{
  id v2 = [off_1005773F0() sharedInstance];
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  unsigned __int8 v4 = [v3 lostModeIsActive];

  return v4;
}

- (BOOL)isLostModeActive
{
  return self->_isLostModeActive;
}

- (void).cxx_destruct
{
}

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100341994;
  block[3] = &unk_1004FCFF8;
  block[4] = a1;
  if (qword_100578620 != -1) {
    dispatch_once(&qword_100578620, block);
  }
  return (id)qword_100578628;
}

@end