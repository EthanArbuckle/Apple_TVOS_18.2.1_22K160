@interface BTAppInteraction
+ (id)instance;
- (BOOL)isBackgroundingSupported:(id)a3 central:(BOOL)a4;
- (BOOL)isPrivilegedBundleID:(id)a3;
- (BTAppInteraction)init;
- (int)pidForIdentifier:(id)a3;
- (unsigned)applicationStateForProcess:(id)a3;
- (unsigned)translateApplicationState:(unsigned int)a3;
- (void)appLaunchCallback:(__CFUserNotification *)a3 flags:(unint64_t)a4;
- (void)applicationStateChanged:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)assertionInvalidationCallback:(id)a3;
- (void)assertionTimerFired;
- (void)btControllerTapToRadar:(int)a3 reason:(id)a4 cid:(id)a5 cname:(id)a6 cvers:(id)a7;
- (void)cancelAppLaunchAlert:(id)a3;
- (void)cancelPairingAlert:(id)a3;
- (void)createAssertionForBundleID:(id)a3 duration:(unint64_t)a4 isUrgent:(BOOL)a5 withPid:(int)a6;
- (void)disableHIP;
- (void)displayAirWaveLaunchNotification:(id *)a3 forProduct:(unsigned int)a4 reason:(unsigned __int8)a5 findMySerialNumber:(id)a6;
- (void)invalidateAssertionTimer;
- (void)launchApplication:(id)a3 restoringCentrals:(id)a4 peripherals:(id)a5;
- (void)openBundle:(id)a3 options:(id)a4;
- (void)openBundle:(id)a3 options:(id)a4 attempt:(int)a5;
- (void)openTapToRadarWithAccessoryLogs:(id)a3 reason:(int)a4 pid:(unint64_t)a5;
- (void)pairingAlertCallback:(__CFUserNotification *)a3 flags:(unint64_t)a4;
- (void)powerAlertCallback:(__CFUserNotification *)a3 flags:(unint64_t)a4;
- (void)printDebug;
- (void)registerApplication:(id)a3 pid:(int)a4;
- (void)setCentralBackgroundingSupported:(id)a3;
- (void)setListener:(AppFrameworkListener *)a3;
- (void)setPeripheralBackgroundingSupported:(id)a3;
- (void)showAppLaunchAlert:(id)a3 device:(id)a4 type:(int)a5;
- (void)showFileRadarNotification:(id)a3 reason:(int)a4 pid:(unint64_t)a5;
- (void)showFoundAccessoryCrashAlert:(id)a3 productID:(unint64_t)a4 accessoryName:(id)a5 firmwareVersion:(id)a6;
- (void)showFoundAccessoryLogAlert:(id)a3 isCrash:(BOOL)a4 pid:(unint64_t)a5 accessoryName:(id)a6;
- (void)showPairingAlert:(id)a3 type:(int)a4 passkey:(unint64_t)a5;
- (void)showPowerAlert:(id)a3 forDenylistMode:(BOOL)a4 validateBundle:(BOOL)a5;
- (void)startAssertionTimer;
- (void)takeAssertionForProcess:(id)a3 duration:(unint64_t)a4 isUrgent:(BOOL)a5;
- (void)unregisterApplication:(id)a3;
- (void)updateApplicationAliveStatus:(id)a3 isAlive:(BOOL)a4;
- (void)updateApplicationState:(int)a3;
- (void)urgentAssertionInvalidationCallback:(id)a3;
@end

@implementation BTAppInteraction

+ (id)instance
{
  v2 = (void *)qword_1008F1F38;
  if (!qword_1008F1F38)
  {
    if (qword_1008F1F40 != -1) {
      dispatch_once(&qword_1008F1F40, &stru_1008A49B0);
    }
    v2 = (void *)qword_1008F1F38;
  }

  return v2;
}

- (BTAppInteraction)init
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___BTAppInteraction;
  v2 = -[BTAppInteraction init](&v21, "init");
  if (v2)
  {
    v2->_queue = dispatch_queue_create("com.apple.MobileBluetooth.AppFramework", 0LL);
    v2->_loggingQueue = dispatch_queue_create("com.apple.MobileBluetooth.AppFramework.loggingAlerts", 0LL);
    v3 = -[BKSApplicationStateMonitor initWithBundleIDs:states:]( objc_alloc(&OBJC_CLASS___BKSApplicationStateMonitor),  "initWithBundleIDs:states:",  &__NSArray0__struct,  0LL);
    monitor = v2->_monitor;
    v2->_monitor = v3;

    -[BKSApplicationStateMonitor setHandler:](v2->_monitor, "setHandler:", &stru_1008A49D0);
    v5 = objc_opt_new(&OBJC_CLASS___UninstallObserver);
    uninstallObserver = v2->_uninstallObserver;
    v2->_uninstallObserver = v5;

    -[UninstallObserver setDelegate:](v2->_uninstallObserver, "setDelegate:", v2);
    v7 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    applicationMap = v2->_applicationMap;
    v2->_applicationMap = v7;

    v9 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    launchNotifications = v2->_launchNotifications;
    v2->_launchNotifications = v9;

    v11 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    pairingNotifications = v2->_pairingNotifications;
    v2->_pairingNotifications = v11;

    v13 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    processAssertions = v2->_processAssertions;
    v2->_processAssertions = v13;

    v15 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
    urgentAssertions = v2->_urgentAssertions;
    v2->_urgentAssertions = v15;

    v2->_assertionTimer = 0LL;
    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    pendingResurrection = v2->_pendingResurrection;
    v2->_pendingResurrection = (NSMutableDictionary *)v17;

    lastAirWaveNotificationDate = v2->_lastAirWaveNotificationDate;
    v2->_lastAirWaveNotificationDate = 0LL;
  }

  return v2;
}

- (void)setListener:(AppFrameworkListener *)a3
{
  self->_listener = a3;
}

- (void)registerApplication:(id)a3 pid:(int)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100638928;
  block[3] = &unk_100880E18;
  block[4] = self;
  id v10 = v6;
  int v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

- (void)unregisterApplication:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100638D2C;
  v7[3] = &unk_10087FB90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (int)pidForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  int v14 = 0;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10063913C;
  block[3] = &unk_10089A308;
  id v9 = v4;
  id v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  LODWORD(queue) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return (int)queue;
}

- (void)updateApplicationAliveStatus:(id)a3 isAlive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_applicationMap, "objectForKey:", v6));
  id v8 = v7;
  if (v7)
  {
    [v7 setIsAlive:v4];
  }

  else if (os_log_type_enabled((os_log_t)qword_1008F7680, OS_LOG_TYPE_ERROR))
  {
    sub_10069FFE8();
  }
}

- (void)launchApplication:(id)a3 restoringCentrals:(id)a4 peripherals:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100639310;
  v15[3] = &unk_10088A1F8;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (void)openBundle:(id)a3 options:(id)a4
{
}

- (void)openBundle:(id)a3 options:(id)a4 attempt:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (os_log_s *)qword_1008F7680;
  if (os_log_type_enabled((os_log_t)qword_1008F7680, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 1024;
    int v29 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Attempting To Launch Bundle: %{public}@ Options: %@ Attempt: %d",  buf,  0x1Cu);
  }

  dispatch_time_t v11 = dispatch_time(0LL, 3000000000LL);
  if (a5 < 3)
  {
    dispatch_time_t v14 = v11;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[FBSOpenApplicationService serviceWithDefaultShellEndpoint]( &OBJC_CLASS___FBSOpenApplicationService,  "serviceWithDefaultShellEndpoint"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[FBSOpenApplicationOptions optionsWithDictionary:]( &OBJC_CLASS___FBSOpenApplicationOptions,  "optionsWithDictionary:",  v9));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100639908;
    v17[3] = &unk_1008A4A48;
    dispatch_time_t v20 = v14;
    v18[0] = v8;
    v18[1] = self;
    id v19 = v9;
    int v21 = a5;
    [v15 openApplication:v18[0] withOptions:v16 completion:v17];

    id v13 = (id *)v18;
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008F7680, OS_LOG_TYPE_ERROR)) {
      sub_1006A00A4();
    }
    uint64_t v12 = sub_100404FE8();
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1006398B8;
    v22[3] = &unk_10087EA48;
    id v23 = v8;
    sub_100405384(v12, v22);
    id v13 = &v23;
  }
}

- (void)applicationsDidUninstall:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100639BF4;
  v7[3] = &unk_10087FB90;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (unsigned)translateApplicationState:(unsigned int)a3
{
  if (a3 - 1 >= 8) {
    char v3 = 1;
  }
  else {
    char v3 = 0x1001010108010402uLL >> (8 * (a3 - 1));
  }
  return v3 & 0x1F;
}

- (void)updateApplicationState:(int)a3
{
  queue = self->_queue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100639FC8;
  v4[3] = &unk_10087EB48;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(queue, v4);
}

- (void)setCentralBackgroundingSupported:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10063A0CC;
  block[3] = &unk_10087FB90;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (void)setPeripheralBackgroundingSupported:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10063A228;
  block[3] = &unk_10087FB90;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (unsigned)applicationStateForProcess:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 1;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10063A3BC;
  block[3] = &unk_1008A4A90;
  block[4] = self;
  id v9 = v4;
  id v10 = &v11;
  id v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return queue;
}

- (void)applicationStateChanged:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10063A57C;
  v7[3] = &unk_10087FB90;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (BOOL)isBackgroundingSupported:(id)a3 central:(BOOL)a4
{
  id v6 = a3;
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 0;
  queue = self->_queue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10063B260;
  v10[3] = &unk_1008A4AB8;
  v10[4] = self;
  id v11 = v6;
  uint64_t v12 = &v14;
  BOOL v13 = a4;
  id v8 = v6;
  dispatch_sync(queue, v10);
  LOBYTE(self) = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return (char)self;
}

- (void)takeAssertionForProcess:(id)a3 duration:(unint64_t)a4 isUrgent:(BOOL)a5
{
  id v8 = a3;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10063B374;
  v11[3] = &unk_100881038;
  v11[4] = self;
  id v12 = v8;
  unint64_t v13 = a4;
  BOOL v14 = a5;
  id v10 = v8;
  dispatch_async(queue, v11);
}

- (void)createAssertionForBundleID:(id)a3 duration:(unint64_t)a4 isUrgent:(BOOL)a5 withPid:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  BOOL v7 = a5;
  id v10 = a3;
  if (v7)
  {
    id v11 = (os_log_s *)qword_1008F7578;
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "(EE) Creating URGENT Process Assertion",  buf,  2u);
    }

    uint64_t v12 = 3LL;
  }

  else
  {
    uint64_t v12 = 1LL;
  }

  uint64_t v13 = sub_1002E6BF0();
  if ((*(unsigned int (**)(uint64_t))(*(void *)v13 + 344LL))(v13)) {
    BOOL v14 = -[ProcessAssertion initWithPID:flags:reason:name:]( objc_alloc(&OBJC_CLASS___ProcessAssertion),  "initWithPID:flags:reason:name:",  v6,  v12,  5LL,  v10);
  }
  else {
    BOOL v14 = -[ProcessAssertion initWithBundleIdentifier:flags:reason:name:]( objc_alloc(&OBJC_CLASS___ProcessAssertion),  "initWithBundleIdentifier:flags:reason:name:",  v10,  v12,  5LL,  v10);
  }
  v15 = v14;
  if (v14 && -[ProcessAssertion acquire](v14, "acquire"))
  {
    uint64_t v16 = (os_log_s *)qword_1008F7578;
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_INFO))
    {
      id v17 = [v10 UTF8String];
      *(_DWORD *)buf = 136446210;
      *(void *)&uint8_t buf[4] = v17;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "Acquired process assertion for application \"%{public}s\"",  buf,  0xCu);
    }

    -[ProcessAssertion setSecondsLeft:](v15, "setSecondsLeft:", a4);
    *(void *)buf = 0LL;
    objc_initWeak((id *)buf, v15);
    if (v7)
    {
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = sub_10063BA08;
      v24[3] = &unk_100887098;
      id v18 = &v25;
      objc_copyWeak(&v25, (id *)buf);
      -[ProcessAssertion setInvalidationHandler:](v15, "setInvalidationHandler:", v24);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_urgentAssertions,  "setObject:forKeyedSubscript:",  v15,  v10);
    }

    else
    {
      id v19 = _NSConcreteStackBlock;
      uint64_t v20 = 3221225472LL;
      int v21 = sub_10063BA78;
      v22 = &unk_100887098;
      id v18 = &v23;
      objc_copyWeak(&v23, (id *)buf);
      -[ProcessAssertion setInvalidationHandler:](v15, "setInvalidationHandler:", &v19);
      -[NSMutableDictionary setObject:forKeyedSubscript:]( self->_processAssertions,  "setObject:forKeyedSubscript:",  v15,  v10,  v19,  v20,  v21,  v22);
    }

    objc_destroyWeak(v18);
    if ((-[NSMutableDictionary count](self->_processAssertions, "count")
       || -[NSMutableDictionary count](self->_urgentAssertions, "count"))
      && !self->_assertionTimer)
    {
      -[BTAppInteraction startAssertionTimer](self, "startAssertionTimer");
    }

    objc_destroyWeak((id *)buf);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_ERROR)) {
      sub_1006A028C((uint64_t)[v10 UTF8String], (uint64_t)buf);
    }
    -[ProcessAssertion invalidate](v15, "invalidate");
  }
}

- (void)urgentAssertionInvalidationCallback:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10063BB64;
  v7[3] = &unk_10087FB90;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)assertionInvalidationCallback:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10063BC9C;
  v7[3] = &unk_10087FB90;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)startAssertionTimer
{
  char v3 = (os_log_s *)qword_1008F7578;
  if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Creating Assertion Timer", buf, 2u);
  }

  id v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, self->_queue);
  self->_assertionTimer = v4;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472LL;
  handler[2] = sub_10063BEE0;
  handler[3] = &unk_10087EA48;
  handler[4] = self;
  dispatch_source_set_event_handler(v4, handler);
  assertionTimer = self->_assertionTimer;
  dispatch_time_t v6 = dispatch_time(0LL, 0LL);
  dispatch_source_set_timer(assertionTimer, v6, 0x3B9ACA00uLL, 0LL);
  dispatch_resume(self->_assertionTimer);
}

- (void)invalidateAssertionTimer
{
  char v3 = (os_log_s *)qword_1008F7578;
  if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Invalidating Assertion Timer", v5, 2u);
  }

  assertionTimer = self->_assertionTimer;
  if (assertionTimer)
  {
    dispatch_source_cancel(assertionTimer);
    dispatch_release(self->_assertionTimer);
    self->_assertionTimer = 0LL;
  }

- (void)assertionTimerFired
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10063BFC0;
  block[3] = &unk_10087EA48;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)isPrivilegedBundleID:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:@"com.teslamotors.TeslaApp"] & 1) != 0
    || ([v3 isEqualToString:@"com.teslamotors.enterpriseapp"] & 1) != 0)
  {
    unsigned __int8 v4 = 1;
  }

  else
  {
    unsigned __int8 v4 = [v3 hasPrefix:@"com.rivian.ios.consumer"];
  }

  return v4;
}

- (void)disableHIP
{
  double v3 = fabs(v2);
  if (qword_1008F1F48) {
    BOOL v4 = v3 < 2.0;
  }
  else {
    BOOL v4 = 0;
  }
  if (!v4)
  {
    int v5 = (os_log_s *)qword_1008F7578;
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(EE) Disabling HIP", v8, 2u);
    }

    notify_post("com.apple.request.hipuncap");
    uint64_t v6 = objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    BOOL v7 = (void *)qword_1008F1F48;
    qword_1008F1F48 = v6;
  }

- (void)showPowerAlert:(id)a3 forDenylistMode:(BOOL)a4 validateBundle:(BOOL)a5
{
  id v8 = a3;
  if (([v8 isEqualToString:@"com.apple.Preferences"] & 1) == 0)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10063C4C0;
    block[3] = &unk_1008A4B40;
    block[4] = self;
    id v11 = v8;
    BOOL v12 = a5;
    BOOL v13 = a4;
    dispatch_async(queue, block);
  }
}

- (void)powerAlertCallback:(__CFUserNotification *)a3 flags:(unint64_t)a4
{
  queue = self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10063CAD4;
  v5[3] = &unk_1008800B8;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(queue, v5);
}

- (void)showAppLaunchAlert:(id)a3 device:(id)a4 type:(int)a5
{
  id v8 = a3;
  id v9 = a4;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10063CD18;
  v13[3] = &unk_1008A4A20;
  v13[4] = self;
  id v14 = v8;
  int v16 = a5;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(queue, v13);
}

- (void)cancelAppLaunchAlert:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10063D4D8;
  v7[3] = &unk_10087FB90;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)appLaunchCallback:(__CFUserNotification *)a3 flags:(unint64_t)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10063D628;
  block[3] = &unk_10087FBF0;
  block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)showPairingAlert:(id)a3 type:(int)a4 passkey:(unint64_t)a5
{
  id v8 = a3;
  if (a4 == 5 && os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_FAULT)) {
    sub_1006A04FC();
  }
  v13[0] = 0LL;
  v13[1] = v13;
  v13[2] = 0x3032000000LL;
  v13[3] = sub_10063DCE8;
  v13[4] = sub_10063DCF8;
  id v14 = v8;
  queue = self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10063DD00;
  v11[3] = &unk_1008A4BD8;
  v11[4] = self;
  void v11[5] = v13;
  int v12 = a4;
  v11[6] = a5;
  id v10 = v8;
  dispatch_async(queue, v11);
  _Block_object_dispose(v13, 8);
}

- (void)cancelPairingAlert:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_10063EC98;
  v7[3] = &unk_10087FB90;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)pairingAlertCallback:(__CFUserNotification *)a3 flags:(unint64_t)a4
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10063EF2C;
  block[3] = &unk_10087FBF0;
  block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_async(queue, block);
}

- (void)printDebug
{
  double v3 = (os_log_s *)qword_1008F7578;
  if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Active process assertions:", buf, 2u);
  }

  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( self->_processAssertions,  "enumerateKeysAndObjectsUsingBlock:",  &stru_1008A4C18);
  id v4 = (os_log_s *)qword_1008F7578;
  if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Active (URGENT) process assertions:", v5, 2u);
  }

  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( self->_urgentAssertions,  "enumerateKeysAndObjectsUsingBlock:",  &stru_1008A4C38);
}

- (void)displayAirWaveLaunchNotification:(id *)a3 forProduct:(unsigned int)a4 reason:(unsigned __int8)a5 findMySerialNumber:(id)a6
{
  int v6 = a5;
  id v9 = a6;
  char v32 = 0;
  uint64_t v10 = sub_1002E6BF0();
  if ((*(unsigned int (**)(uint64_t))(*(void *)v10 + 424LL))(v10))
  {
    id v11 = (os_log_s *)qword_1008F7578;
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v12 = "displayAirWaveLaunchNotification: Unsupported source platform. Ignoring new request";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 2u);
      goto LABEL_11;
    }

    goto LABEL_11;
  }

  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  unsigned __int8 v14 = [v13 applicationIsInstalled:@"com.apple.internal.WayFinder"];

  if ((v14 & 1) == 0)
  {
    id v11 = (os_log_s *)qword_1008F7578;
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v12 = "displayAirWaveLaunchNotification: AirWave isn't installed on this device. Ignoring new request.";
      goto LABEL_10;
    }

    goto LABEL_11;
  }

  if (self->_isPopupInQueue)
  {
    id v11 = (os_log_s *)qword_1008F7578;
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v12 = "displayAirWaveLaunchNotification: Popup already in queue. Ignoring new request.";
      goto LABEL_10;
    }

    goto LABEL_11;
  }

  uint64_t v15 = sub_1002E6E00();
  sub_10002418C(buf, "AccessoryLogging");
  sub_10002418C(__p, "SuppressAllPopups");
  int v16 = (*(uint64_t (**)(uint64_t, uint8_t *, void **, char *))(*(void *)v15 + 72LL))(v15, buf, __p, &v32);
  if (v32) {
    int v17 = v16;
  }
  else {
    int v17 = 0;
  }
  if (v31 < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v37) < 0)
  {
    operator delete(*(void **)buf);
    if (v17) {
      goto LABEL_19;
    }
  }

  else if (v17)
  {
LABEL_19:
    id v11 = (os_log_s *)qword_1008F7578;
    if (!os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_WORD *)buf = 0;
    int v12 = "displayAirWaveLaunchNotification: Suppress all popups defaults write is set to true. Ignoring new request.";
    goto LABEL_10;
  }

  if ((a4 & 0xFFFFE000) == 0x2000)
  {
    if (self->_lastAirWaveNotificationDate)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
      id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue( [v19 components:16 fromDate:self->_lastAirWaveNotificationDate toDate:v18 options:0]);

      if ((uint64_t)[v20 day] <= 0)
      {
        if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_ERROR)) {
          sub_1006A07E4();
        }

        goto LABEL_11;
      }
    }

    int v21 = (os_log_s *)qword_1008F7578;
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
    {
      v22 = "Invalid";
      if (v6 == 1) {
        v22 = "Case Issue";
      }
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)&uint8_t buf[4] = a4;
      if (!v6) {
        v22 = "Unknown";
      }
      __int16 v34 = 1024;
      int v35 = v6;
      __int16 v36 = 2080;
      v37 = v22;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "displayAirWaveLaunchNotification: productID: 0x%04X, reason: %u (%s)",  buf,  0x18u);
    }

    loggingQueue = self->_loggingQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10063FB70;
    block[3] = &unk_1008A4CA0;
    block[4] = self;
    unsigned int v28 = a4;
    char v29 = v6;
    id v27 = v9;
    dispatch_async(loggingQueue, block);
    v24 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate now](&OBJC_CLASS___NSDate, "now"));
    lastAirWaveNotificationDate = self->_lastAirWaveNotificationDate;
    self->_lastAirWaveNotificationDate = v24;

    goto LABEL_11;
  }

  if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_ERROR)) {
    sub_1006A0810();
  }
LABEL_11:
}

- (void)showFoundAccessoryCrashAlert:(id)a3 productID:(unint64_t)a4 accessoryName:(id)a5 firmwareVersion:(id)a6
{
  uint64_t v8 = *(void *)a3.var0;
  id v10 = a5;
  id v11 = a6;
  char v38 = 0;
  if (self->_isPopupInQueue)
  {
    int v12 = (os_log_s *)qword_1008F7578;
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      BOOL v13 = "Warning: showFoundAccessoryCrashAlert: Suppressing duplicate popup";
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
      goto LABEL_19;
    }

    goto LABEL_19;
  }

  uint64_t v14 = sub_1002E6E00();
  sub_10002418C(buf, "AccessoryLogging");
  sub_10002418C(__p, "SuppressAllPopups");
  int v15 = (*(uint64_t (**)(uint64_t, uint8_t *, void **, char *))(*(void *)v14 + 72LL))(v14, buf, __p, &v38);
  if (v38) {
    int v16 = v15;
  }
  else {
    int v16 = 0;
  }
  if (v35 < 0) {
    operator delete(__p[0]);
  }
  if ((v37 & 0x80000000) == 0)
  {
    if (v16) {
      goto LABEL_11;
    }
LABEL_15:
    if ((a4 - 8194) <= 0xE && ((1 << (a4 - 2)) & 0x409B) != 0 || (a4 & 0xFFFFFFFFFFFFE000LL) != 0x2000)
    {
      if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_ERROR)) {
        sub_1006A0870();
      }
    }

    else
    {
      int v17 = (void *)objc_claimAutoreleasedReturnValue( +[CBAccessoryLogging getProductNameFromProductID:]( &OBJC_CLASS___CBAccessoryLogging,  "getProductNameFromProductID:",  a4));
      id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ Crash Detected",  v17));
      id v19 = sub_1002E95B8(@"TITLE", v18);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);

      if ([v11 length]) {
        int v21 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @" (FW %@)",  v11));
      }
      else {
        int v21 = &stru_1008A57D8;
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Do you want to retrieve the crash log from %@%@, then open Tap-to-Radar to report the crash?  Audio quality may be poor during retrieval (~30 sec).",  v10,  v21));
      id v23 = sub_1002E95B8(@"CONTENT", v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

      loggingQueue = self->_loggingQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100640470;
      block[3] = &unk_1008A4CC8;
      block[4] = self;
      id v29 = v20;
      id v30 = v24;
      int v32 = v8;
      __int16 v33 = WORD2(v8);
      id v31 = v10;
      id v26 = v24;
      id v27 = v20;
      dispatch_async(loggingQueue, block);
    }

    goto LABEL_19;
  }

  operator delete(*(void **)buf);
  if (!v16) {
    goto LABEL_15;
  }
LABEL_11:
  int v12 = (os_log_s *)qword_1008F7578;
  if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    BOOL v13 = "Warning: showFoundAccessoryCrashAlert: Suppressing popup for automation";
    goto LABEL_13;
  }

- (void)showFoundAccessoryLogAlert:(id)a3 isCrash:(BOOL)a4 pid:(unint64_t)a5 accessoryName:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  char v37 = 0;
  if (![v10 count])
  {
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_ERROR)) {
      sub_1006A08FC();
    }
    goto LABEL_13;
  }

  uint64_t v12 = sub_1002E6E00();
  sub_10002418C(buf, "AccessoryLogging");
  sub_10002418C(__p, "SuppressAllPopups");
  int v13 = (*(uint64_t (**)(uint64_t, uint8_t *, void **, char *))(*(void *)v12 + 72LL))(v12, buf, __p, &v37);
  if (v37) {
    int v14 = v13;
  }
  else {
    int v14 = 0;
  }
  if (v34 < 0) {
    operator delete(__p[0]);
  }
  if (v36 < 0)
  {
    operator delete(*(void **)buf);
    if (v14)
    {
LABEL_9:
      int v15 = (os_log_s *)qword_1008F7578;
      if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Warning: showFoundAccessoryLogAlert: Suppressing popup for automation",  buf,  2u);
      }

- (void)showFileRadarNotification:(id)a3 reason:(int)a4 pid:(unint64_t)a5
{
  char v41 = 0;
  if (self->_isPopupInQueue)
  {
    int v5 = (os_log_s *)qword_1008F7578;
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v6 = "Warning: showFileRadarNotification: Suppressing duplicate popup";
LABEL_21:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, buf, 2u);
      goto LABEL_22;
    }

    goto LABEL_22;
  }

  uint64_t v9 = *(void *)a3.var0;
  uint64_t v11 = sub_1002E6E00();
  if (((*(uint64_t (**)(uint64_t))(*(void *)v11 + 8LL))(v11) & 1) == 0)
  {
    int v5 = (os_log_s *)qword_1008F7578;
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v6 = "Warning: showFileRadarNotification: Suppressing popup on external build";
      goto LABEL_21;
    }

    goto LABEL_22;
  }

  if (qword_1008D60E0 != -1) {
    dispatch_once(&qword_1008D60E0, &stru_1008A4E20);
  }
  if (!sub_100234F9C((uint64_t)off_1008D60D8, v9 & 0xFFFFFFFFFFFFLL))
  {
    int v5 = (os_log_s *)qword_1008F7578;
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      int v6 = "Warning: showFileRadarNotification: No AACP connection";
      goto LABEL_21;
    }

    goto LABEL_22;
  }

  uint64_t v12 = sub_1002E6E00();
  sub_10002418C(buf, "AccessoryLogging");
  sub_10002418C(__p, "SuppressAllPopups");
  int v13 = (*(uint64_t (**)(uint64_t, uint8_t *, void **, char *))(*(void *)v12 + 72LL))(v12, buf, __p, &v41);
  if (v41) {
    int v14 = v13;
  }
  else {
    int v14 = 0;
  }
  if (v38 < 0) {
    operator delete(__p[0]);
  }
  if (v40 < 0)
  {
    operator delete(*(void **)buf);
    if (v14)
    {
LABEL_15:
      int v5 = (os_log_s *)qword_1008F7578;
      if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        int v6 = "showFileRadarNotification: Suppressing popup for automation";
        goto LABEL_21;
      }

- (void)openTapToRadarWithAccessoryLogs:(id)a3 reason:(int)a4 pid:(unint64_t)a5
{
  id v7 = a3;
  BOOL v8 = objc_opt_new(&OBJC_CLASS___NSURLComponents);
  uint64_t v9 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  -[NSURLComponents setScheme:](v8, "setScheme:", @"tap-to-radar");
  -[NSURLComponents setHost:](v8, "setHost:", @"new");
  v48 = (void *)objc_claimAutoreleasedReturnValue( +[CBAccessoryLogging getProductNameFromProductID:]( &OBJC_CLASS___CBAccessoryLogging,  "getProductNameFromProductID:",  a5));
  if ((a4 - 2) < 4)
  {
    if ([v7 count]) {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"AutoDiagnostics",  @"sysdiagnose-only"));
    }
    else {
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"ExtensionIdentifiers",  @"com.apple.DiagnosticExtensions.BluetoothHeadset"));
    }
    -[NSMutableArray addObject:](v9, "addObject:", v10);

    switch(a4)
    {
      case 2:
        int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"Title",  @"Please enter your title here"));
        -[NSMutableArray addObject:](v9, "addObject:", v13);
        break;
      case 4:
        id v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"Classification",  @"Serious Bug"));
        -[NSMutableArray addObject:](v9, "addObject:", v20);

        uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%@] A2DP Stream Start Failure: ",  v48));
        id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"Title",  v21));
        -[NSMutableArray addObject:](v9, "addObject:", v22);

        id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Please describe what you were doing with your %@ here",  v48));
        id v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"Description",  v23));
        -[NSMutableArray addObject:](v9, "addObject:", v24);

        int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"Keywords",  @"1474196"));
        -[NSMutableArray addObject:](v9, "addObject:", v13);
        break;
      case 5:
        id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"Classification",  @"Serious Bug"));
        -[NSMutableArray addObject:](v9, "addObject:", v15);

        int v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[%@] IED anomaly: ",  v48));
        id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"Title",  v16));
        -[NSMutableArray addObject:](v9, "addObject:", v17);

        id v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Please describe the current bud state of your %@ (Are the buds in-ear, in-case, in hand, in pocket, sitting on a table, something else):\n\nPlease describe what you are doing with the buds (including body movement like exercising, or mouth movement like talking):",  v48));
        id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"Description",  v18));
        -[NSMutableArray addObject:](v9, "addObject:", v19);

        int v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"Keywords",  @"1521114"));
        -[NSMutableArray addObject:](v9, "addObject:", v13);
        break;
      default:
        goto LABEL_33;
    }

    goto LABEL_15;
  }

  if (a4 == 1)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"ExtensionIdentifiers",  @"com.apple.DiagnosticExtensions.BluetoothHeadset"));
    -[NSMutableArray addObject:](v9, "addObject:", v11);

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"Classification",  @"Crash/Hang/Data Loss"));
    -[NSMutableArray addObject:](v9, "addObject:", v12);

    int v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ Crash: ", v48));
    int v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"Title",  v13));
    -[NSMutableArray addObject:](v9, "addObject:", v14);

LABEL_15:
    uint64_t v25 = sub_1002E6BF0();
    if ((*(unsigned int (**)(uint64_t))(*(void *)v25 + 424LL))(v25))
    {
      id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"ComponentID",  @"1336450"));
      -[NSMutableArray addObject:](v9, "addObject:", v26);

      id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"ComponentName",  @"ULLA (New Bugs)"));
      -[NSMutableArray addObject:](v9, "addObject:", v27);

      id v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"ComponentVersion",  @"N301 Non-UI"));
      -[NSMutableArray addObject:](v9, "addObject:", v28);
    }

    else
    {
      if (a4 == 5)
      {
        id v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%lu",  +[CBAccessoryLogging getComponentIDFromRadarReason:]( &OBJC_CLASS___CBAccessoryLogging,  "getComponentIDFromRadarReason:",  5LL)));
        id v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"ComponentID",  v29));
        -[NSMutableArray addObject:](v9, "addObject:", v30);

        id v31 = (void *)objc_claimAutoreleasedReturnValue( +[CBAccessoryLogging getComponentNameFromRadarReason:]( &OBJC_CLASS___CBAccessoryLogging,  "getComponentNameFromRadarReason:",  5LL));
        id v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"ComponentName",  v31));
        -[NSMutableArray addObject:](v9, "addObject:", v32);

        id v28 = (void *)objc_claimAutoreleasedReturnValue( +[CBAccessoryLogging getComponentVersionFromRadarReason:]( &OBJC_CLASS___CBAccessoryLogging,  "getComponentVersionFromRadarReason:",  5LL));
      }

      else
      {
        int v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%lu",  +[CBAccessoryLogging getComponentIDFromProductID:]( &OBJC_CLASS___CBAccessoryLogging,  "getComponentIDFromProductID:",  a5)));
        int v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"ComponentID",  v34));
        -[NSMutableArray addObject:](v9, "addObject:", v35);

        __int16 v36 = (void *)objc_claimAutoreleasedReturnValue( +[CBAccessoryLogging getComponentNameFromProductID:]( &OBJC_CLASS___CBAccessoryLogging,  "getComponentNameFromProductID:",  a5));
        char v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"ComponentName",  v36));
        -[NSMutableArray addObject:](v9, "addObject:", v37);

        id v28 = (void *)objc_claimAutoreleasedReturnValue( +[CBAccessoryLogging getComponentVersionFromProductID:]( &OBJC_CLASS___CBAccessoryLogging,  "getComponentVersionFromProductID:",  a5));
      }

      unint64_t v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"ComponentVersion",  v28));
      -[NSMutableArray addObject:](v9, "addObject:", v33);
    }

    if ([v7 count])
    {
      char v38 = objc_opt_new(&OBJC_CLASS___NSMutableString);
      __int128 v51 = 0u;
      __int128 v52 = 0u;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      id v39 = v7;
      id v40 = [v39 countByEnumeratingWithState:&v49 objects:v55 count:16];
      if (v40)
      {
        uint64_t v41 = *(void *)v50;
        do
        {
          for (i = 0LL; i != v40; i = (char *)i + 1)
          {
            if (*(void *)v50 != v41) {
              objc_enumerationMutation(v39);
            }
            -[NSMutableString appendString:](v38, "appendString:", *(void *)(*((void *)&v49 + 1) + 8LL * (void)i));
            -[NSMutableString appendString:](v38, "appendString:", @",");
          }

          id v40 = [v39 countByEnumeratingWithState:&v49 objects:v55 count:16];
        }

        while (v40);
      }

      v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSURLQueryItem queryItemWithName:value:]( &OBJC_CLASS___NSURLQueryItem,  "queryItemWithName:value:",  @"Attachments",  v38));
      -[NSMutableArray addObject:](v9, "addObject:", v43);
    }

    -[NSURLComponents setQueryItems:](v8, "setQueryItems:", v9);
    v44 = (os_log_s *)qword_1008F7578;
    if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_DEFAULT))
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents string](v8, "string"));
      *(_DWORD *)buf = 138543362;
      v54 = v45;
      _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "openTapToRadarWithAccessoryLogs: Launch Tap-to-Radar, URL = %{public}@",  buf,  0xCu);
    }

    v46 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLComponents URL](v8, "URL"));
    [v46 openURL:v47 configuration:0 completionHandler:&stru_1008A4D38];

    goto LABEL_33;
  }

  if (os_log_type_enabled((os_log_t)qword_1008F7578, OS_LOG_TYPE_ERROR)) {
    sub_1006A09EC();
  }
LABEL_33:
}

- (void)btControllerTapToRadar:(int)a3 reason:(id)a4 cid:(id)a5 cname:(id)a6 cvers:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  loggingQueue = self->_loggingQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100641E14;
  block[3] = &unk_1008A4D80;
  int v26 = a3;
  id v22 = v12;
  id v23 = v13;
  id v24 = v14;
  id v25 = v15;
  id v17 = v15;
  id v18 = v14;
  id v19 = v13;
  id v20 = v12;
  dispatch_async(loggingQueue, block);
}

- (void).cxx_destruct
{
}

@end