@interface BKAlternateSystemAppManager
+ (BKAlternateSystemAppManager)sharedInstance;
- (BKAlternateSystemApp)alternateSystemApp;
- (BKAlternateSystemAppManager)init;
- (BOOL)isBlockingSystemApp;
- (NSString)alternateSystemAppBundleIdentifier;
- (NSString)openBundleId;
- (OS_dispatch_queue)queue;
- (void)_queue_cleanUpAfterAlternativeSystemApp:(id)a3;
- (void)_setBlockingSystemApp:(BOOL)a3;
- (void)blockSystemAppForAlternateSystemAppWithCompletion:(id)a3;
- (void)openAlternateSystemApp:(id)a3 options:(id)a4 withResult:(id)a5 andExitBlock:(id)a6;
- (void)setAlternateSystemApp:(id)a3;
- (void)setOpenBundleId:(id)a3;
- (void)setQueue:(id)a3;
- (void)terminateAlternateSystemApp:(id)a3 forReason:(int)a4 andReport:(BOOL)a5 withDescription:(id)a6 completion:(id)a7;
- (void)terminateAnyAlternateSystemApp;
- (void)unblockSystemAppForAlternateSystemAppWithCompletion:(id)a3;
@end

@implementation BKAlternateSystemAppManager

- (BKAlternateSystemAppManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___BKAlternateSystemAppManager;
  v2 = -[BKAlternateSystemAppManager init](&v6, "init");
  if (v2)
  {
    uint64_t Serial = BSDispatchQueueCreateSerial(@"com.apple.backboardd.altsysapp");
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)Serial;
  }

  return v2;
}

- (BOOL)isBlockingSystemApp
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100041830;
  v5[3] = &unk_1000B8080;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSString)alternateSystemAppBundleIdentifier
{
  uint64_t v6 = 0LL;
  v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  char v9 = sub_1000417DC;
  v10 = sub_1000417EC;
  id v11 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000417F4;
  v5[3] = &unk_1000B8080;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (void)blockSystemAppForAlternateSystemAppWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = BKLogAlternateSystemApp();
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Manager] Blocking the system app", v8, 2u);
  }

  -[BKAlternateSystemAppManager _setBlockingSystemApp:](self, "_setBlockingSystemApp:", 1LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKSystemShellSentinel sharedInstance](&OBJC_CLASS___BKSystemShellSentinel, "sharedInstance"));
  [v7 blockSystemApp];

  if (v4) {
    dispatch_async((dispatch_queue_t)self->_queue, v4);
  }
}

- (void)openAlternateSystemApp:(id)a3 options:(id)a4 withResult:(id)a5 andExitBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000414D8;
  block[3] = &unk_1000B6E90;
  id v20 = v10;
  id v21 = v11;
  v22 = self;
  id v23 = v12;
  id v24 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  dispatch_async(queue, block);
}

- (void)terminateAlternateSystemApp:(id)a3 forReason:(int)a4 andReport:(BOOL)a5 withDescription:(id)a6 completion:(id)a7
{
  id v9 = a3;
  id v10 = a7;
  if (-[NSString isEqualToString:](self->_openBundleId, "isEqualToString:", v9))
  {
    queue = (dispatch_queue_s *)self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10004140C;
    block[3] = &unk_1000B7558;
    id v14 = v9;
    id v15 = self;
    id v16 = v10;
    dispatch_async(queue, block);
    -[BKAlternateSystemAppManager setOpenBundleId:](self, "setOpenBundleId:", 0LL);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKSystemShellSentinel sharedInstance](&OBJC_CLASS___BKSystemShellSentinel, "sharedInstance"));
    [v12 setActiveAlternateSystemAppBundleIdentifier:0];
  }
}

- (void)terminateAnyAlternateSystemApp
{
  if (self->_openBundleId)
  {
    uint64_t v3 = BKLogAlternateSystemApp();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      openBundleId = self->_openBundleId;
      int v6 = 138543362;
      v7 = openBundleId;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[Manager] Terminating alternate system app with bundleID: %{public}@",  (uint8_t *)&v6,  0xCu);
    }

    -[BKAlternateSystemAppManager terminateAlternateSystemApp:forReason:andReport:withDescription:completion:]( self,  "terminateAlternateSystemApp:forReason:andReport:withDescription:completion:",  self->_openBundleId,  0LL,  0LL,  0LL,  0LL);
  }

- (void)unblockSystemAppForAlternateSystemAppWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = BKLogAlternateSystemApp();
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[Manager] Unblocking the system app", v8, 2u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKSystemShellSentinel sharedInstance](&OBJC_CLASS___BKSystemShellSentinel, "sharedInstance"));
  [v7 unblockSystemApp];

  -[BKAlternateSystemAppManager _setBlockingSystemApp:](self, "_setBlockingSystemApp:", 0LL);
  if (v4) {
    dispatch_async((dispatch_queue_t)self->_queue, v4);
  }
}

- (void)_queue_cleanUpAfterAlternativeSystemApp:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[BKAlternateSystemAppManager alternateSystemApp](self, "alternateSystemApp"));

  uint64_t v6 = BKLogAlternateSystemApp();
  v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (v5 == v4)
  {
    if (v8)
    {
      int v10 = 138543362;
      id v11 = v4;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "[Manager] clean up: %{public}@",  (uint8_t *)&v10,  0xCu);
    }

    -[BKAlternateSystemAppManager setAlternateSystemApp:](self, "setAlternateSystemApp:", 0LL);
  }

  else
  {
    if (v8)
    {
      alternateSystemApp = self->_alternateSystemApp;
      int v10 = 138543618;
      id v11 = v4;
      __int16 v12 = 2114;
      id v13 = alternateSystemApp;
      _os_log_error_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_ERROR,  "[Manager] clean up: %{public}@, but expected %{public}@",  (uint8_t *)&v10,  0x16u);
    }
  }
}

- (void)_setBlockingSystemApp:(BOOL)a3
{
  queue = (dispatch_queue_s *)self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000413FC;
  v4[3] = &unk_1000B7D18;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(queue, v4);
}

- (NSString)openBundleId
{
  return self->_openBundleId;
}

- (void)setOpenBundleId:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (BKAlternateSystemApp)alternateSystemApp
{
  return self->_alternateSystemApp;
}

- (void)setAlternateSystemApp:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (BKAlternateSystemAppManager)sharedInstance
{
  if (qword_1000DC0F8 != -1) {
    dispatch_once(&qword_1000DC0F8, &stru_1000B6E18);
  }
  return (BKAlternateSystemAppManager *)(id)qword_1000DC0F0;
}

@end