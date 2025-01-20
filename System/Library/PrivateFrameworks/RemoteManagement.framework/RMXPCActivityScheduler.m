@interface RMXPCActivityScheduler
+ (id)sharedInstance;
+ (void)start;
- (NSBackgroundActivityScheduler)onRebootActivity;
- (NSBackgroundActivityScheduler)periodicSyncActivity;
- (RMXPCActivityScheduler)init;
- (void)_forceSyncWithCompletion:(id)a3;
- (void)_onRebootWithCompletion:(id)a3;
- (void)_scheduleOnReboot;
- (void)_schedulePeriodicSync;
- (void)_start;
- (void)dealloc;
- (void)setOnRebootActivity:(id)a3;
- (void)setPeriodicSyncActivity:(id)a3;
@end

@implementation RMXPCActivityScheduler

+ (id)sharedInstance
{
  if (qword_1000CF438 != -1) {
    dispatch_once(&qword_1000CF438, &stru_1000BB128);
  }
  return (id)qword_1000CF430;
}

+ (void)start
{
  id v2 = +[RMXPCActivityScheduler sharedInstance](&OBJC_CLASS___RMXPCActivityScheduler, "sharedInstance");
}

- (RMXPCActivityScheduler)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___RMXPCActivityScheduler;
  id v2 = -[RMXPCActivityScheduler init](&v8, "init");
  if (v2)
  {
    v3 = -[NSBackgroundActivityScheduler initWithIdentifier:]( objc_alloc(&OBJC_CLASS___NSBackgroundActivityScheduler),  "initWithIdentifier:",  @"com.apple.remotemanagement.periodic-sync");
    periodicSyncActivity = v2->_periodicSyncActivity;
    v2->_periodicSyncActivity = v3;

    v5 = -[NSBackgroundActivityScheduler initWithIdentifier:]( objc_alloc(&OBJC_CLASS___NSBackgroundActivityScheduler),  "initWithIdentifier:",  @"com.apple.remotemanagement.on-reboot");
    onRebootActivity = v2->_onRebootActivity;
    v2->_onRebootActivity = v5;
  }

  return v2;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMXPCActivityScheduler periodicSyncActivity](self, "periodicSyncActivity"));
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___RMXPCActivityScheduler;
  -[RMXPCActivityScheduler dealloc](&v4, "dealloc");
}

- (void)_start
{
}

- (void)_schedulePeriodicSync
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog xpcActivityScheduler](&OBJC_CLASS___RMLog, "xpcActivityScheduler"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10007D50C(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RMXPCActivityScheduler periodicSyncActivity](self, "periodicSyncActivity"));
  [v11 setPreregistered:1];

  xpc_object_t v12 = xpc_dictionary_create(0LL, 0LL, 0LL);
  xpc_dictionary_set_BOOL(v12, XPC_ACTIVITY_REQUIRE_NETWORK_CONNECTIVITY, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RMXPCActivityScheduler periodicSyncActivity](self, "periodicSyncActivity"));
  [v13 _setAdditionalXPCActivityProperties:v12];

  objc_initWeak(&location, self);
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RMXPCActivityScheduler periodicSyncActivity](self, "periodicSyncActivity"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10007D0C8;
  v15[3] = &unk_1000BB150;
  objc_copyWeak(&v16, &location);
  [v14 scheduleWithBlock:v15];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_scheduleOnReboot
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog xpcActivityScheduler](&OBJC_CLASS___RMLog, "xpcActivityScheduler"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10007D540(v3, v4, v5, v6, v7, v8, v9, v10);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RMXPCActivityScheduler onRebootActivity](self, "onRebootActivity"));
  [v11 setPreregistered:1];

  objc_initWeak(&location, self);
  xpc_object_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[RMXPCActivityScheduler onRebootActivity](self, "onRebootActivity"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10007D220;
  v13[3] = &unk_1000BB150;
  objc_copyWeak(&v14, &location);
  [v12 scheduleWithBlock:v13];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_forceSyncWithCompletion:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog xpcActivityScheduler](&OBJC_CLASS___RMLog, "xpcActivityScheduler"));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Triggered periodic sync", buf, 2u);
  }

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[RMClientController sharedController](&OBJC_CLASS___RMClientController, "sharedController"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10007D344;
  v7[3] = &unk_1000BAAD8;
  id v8 = v3;
  id v6 = v3;
  [v5 syncAllManagementSourcesWithCompletionHandler:v7];
}

- (void)_onRebootWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, uint64_t))a3;
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog xpcActivityScheduler](&OBJC_CLASS___RMLog, "xpcActivityScheduler"));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Triggered on reboot", v7, 2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMXPCActivityScheduler onRebootActivity](self, "onRebootActivity"));
  [v6 invalidate];

  -[RMXPCActivityScheduler setOnRebootActivity:](self, "setOnRebootActivity:", 0LL);
  v4[2](v4, 1LL);
}

- (NSBackgroundActivityScheduler)periodicSyncActivity
{
  return self->_periodicSyncActivity;
}

- (void)setPeriodicSyncActivity:(id)a3
{
}

- (NSBackgroundActivityScheduler)onRebootActivity
{
  return self->_onRebootActivity;
}

- (void)setOnRebootActivity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end