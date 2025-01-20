@interface ATSACCAPlugin
+ (id)sharedPlugin;
- (ATSACCAPlugin)init;
- (void)addClockWithIdentifier:(unint64_t)a3;
- (void)halInitializeWithPluginHost:(AudioServerPlugInHostInterface *)a3;
- (void)interruptedConnectionForClockManager:(id)a3;
- (void)removeClockWithIdentifier:(unint64_t)a3 force:(BOOL)a4;
- (void)setupIOKitMatching;
@end

@implementation ATSACCAPlugin

+ (id)sharedPlugin
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_388C;
  block[3] = &unk_C368;
  block[4] = a1;
  if (qword_11228 != -1) {
    dispatch_once(&qword_11228, block);
  }
  return (id)_sharedPlugin;
}

- (ATSACCAPlugin)init
{
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___ATSACCAPlugin;
  v2 = -[ATSACCAPlugin init](&v13, "init");
  v3 = v2;
  if (v2)
  {
    v2->_interruptionLock._os_unfair_lock_opaque = 0;
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    clockDevices = v3->_clockDevices;
    v3->_clockDevices = v4;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.audio.AppleTimeSyncAudioClock.create", 0LL);
    clockAdminQueue = v3->_clockAdminQueue;
    v3->_clockAdminQueue = (OS_dispatch_queue *)v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.audio.AppleTimeSyncAudioClock.matching", 0LL);
    callbackQueue = v3->_callbackQueue;
    v3->_callbackQueue = (OS_dispatch_queue *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.audio.AppleTimeSyncAudioClock.processing", 0LL);
    processQueue = v3->_processQueue;
    v3->_processQueue = (OS_dispatch_queue *)v10;
  }

  return v3;
}

- (void)halInitializeWithPluginHost:(AudioServerPlugInHostInterface *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ATSACCAPlugin;
  -[ATSACCAPlugin halInitializeWithPluginHost:](&v5, "halInitializeWithPluginHost:", a3);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_3A14;
  v4[3] = &unk_C390;
  v4[4] = self;
  +[TSClockManager notifyWhenClockManagerIsAvailable:]( &OBJC_CLASS___TSClockManager,  "notifyWhenClockManagerIsAvailable:",  v4);
}

- (void)setupIOKitMatching
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "ATSAC setupIOKitMatching",  (uint8_t *)buf,  2u);
  }

  os_unfair_lock_lock(&self->_interruptionLock);
  v3 = (IOKNotificationPort *)-[IOKNotificationPort initOnDispatchQueue:]( objc_alloc(&OBJC_CLASS___IOKNotificationPort),  "initOnDispatchQueue:",  self->_callbackQueue);
  notificationPort = self->_notificationPort;
  self->_notificationPort = v3;

  objc_initWeak(buf, self);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( +[IOKService serviceMatching:]( &OBJC_CLASS___IOKService,  "serviceMatching:",  @"IOTimeSyncService"));
  uint64_t v6 = IOKMatchedNotification;
  v7 = self->_notificationPort;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_3D10;
  v19[3] = &unk_C3E0;
  v19[4] = self;
  objc_copyWeak(&v20, buf);
  dispatch_queue_t v8 = (IOKMatchingNotification *)objc_claimAutoreleasedReturnValue( +[IOKService addNotificationOfType:forMatching:usingNotificationPort:error:withEnumerationBlock:]( &OBJC_CLASS___IOKService,  "addNotificationOfType:forMatching:usingNotificationPort:error:withEnumerationBlock:",  v6,  v5,  v7,  0LL,  v19));
  arrivalNotification = self->_arrivalNotification;
  self->_arrivalNotification = v8;

  dispatch_queue_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[IOKService serviceMatching:]( &OBJC_CLASS___IOKService,  "serviceMatching:",  @"IOTimeSyncService"));
  uint64_t v11 = IOKTerminatedNotification;
  v12 = self->_notificationPort;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_404C;
  v17[3] = &unk_C3E0;
  v17[4] = self;
  objc_copyWeak(&v18, buf);
  objc_super v13 = (IOKMatchingNotification *)objc_claimAutoreleasedReturnValue( +[IOKService addNotificationOfType:forMatching:usingNotificationPort:error:withEnumerationBlock:]( &OBJC_CLASS___IOKService,  "addNotificationOfType:forMatching:usingNotificationPort:error:withEnumerationBlock:",  v11,  v10,  v12,  0LL,  v17));
  depatureNotification = self->_depatureNotification;
  self->_depatureNotification = v13;

  callbackQueue = self->_callbackQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_438C;
  block[3] = &unk_C390;
  block[4] = self;
  dispatch_async((dispatch_queue_t)callbackQueue, block);
  os_unfair_lock_unlock(&self->_interruptionLock);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(buf);
}

- (void)interruptedConnectionForClockManager:(id)a3
{
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(33LL, 0LL);
  objc_super v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_4450;
  block[3] = &unk_C390;
  block[4] = self;
  dispatch_async(v5, block);
}

- (void)addClockWithIdentifier:(unint64_t)a3
{
  clockAdminQueue = self->_clockAdminQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_48BC;
  v4[3] = &unk_C430;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_sync((dispatch_queue_t)clockAdminQueue, v4);
}

- (void)removeClockWithIdentifier:(unint64_t)a3 force:(BOOL)a4
{
  clockAdminQueue = self->_clockAdminQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_4AEC;
  block[3] = &unk_C458;
  block[4] = self;
  void block[5] = a3;
  BOOL v6 = a4;
  dispatch_sync((dispatch_queue_t)clockAdminQueue, block);
}

- (void).cxx_destruct
{
}

@end