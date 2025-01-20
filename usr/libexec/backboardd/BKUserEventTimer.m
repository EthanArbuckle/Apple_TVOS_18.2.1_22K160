@interface BKUserEventTimer
+ (id)sharedInstance;
- (BKUserEventTimer)init;
- (BOOL)isSafeToResetIdleTimer;
- (double)lastUserEventTime;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_queue_clearTimer;
- (void)_queue_postNotification:(__CFString *)a3;
- (void)_queue_scheduleTimerWithTimeInterval:(double)a3;
- (void)_queue_userEventOccurredInIdleMode;
- (void)_queue_userEventOccurredInPresenceMode;
- (void)dealloc;
- (void)notifyOnNextUserEvent;
- (void)resetTimer:(double)a3 mode:(int)a4;
- (void)systemShellDidFinishLaunching:(id)a3;
- (void)userEventOccurredOnDisplay:(id)a3;
@end

@implementation BKUserEventTimer

- (BKUserEventTimer)init
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___BKUserEventTimer;
  v2 = -[BKUserEventTimer init](&v21, "init");
  v3 = v2;
  if (v2)
  {
    *(void *)&v2->_currentTimeout = BKSHIDServicesUserEventTimerIntervalForever;
    v2->_currentMode = 0;
    v2->_lastUserEvent = CACurrentMediaTime();
    v3->_lastResetTimerRequest = CACurrentMediaTime();
    v3->_isIdle = 1;
    uint64_t Serial = BSDispatchQueueCreateSerial(@"com.apple.backboardd.idletimer");
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)Serial;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKSystemShellSentinel sharedInstance](&OBJC_CLASS___BKSystemShellSentinel, "sharedInstance"));
    v7 = (id *)objc_claimAutoreleasedReturnValue([v6 systemShellState]);

    if (v7)
    {
      id v8 = v7[2];
      if (v8)
      {
        id v9 = v7[4];
        v3->_safeToResetIdleTimer = [v9 containsObject:v8];
      }
    }

    else
    {
      id v8 = 0LL;
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[BKSystemShellSentinel sharedInstance](&OBJC_CLASS___BKSystemShellSentinel, "sharedInstance"));
    uint64_t v11 = objc_claimAutoreleasedReturnValue([v10 addSystemShellObserver:v3 reason:@"BKUserEventTimer"]);
    systemShellObserving = v3->_systemShellObserving;
    v3->_systemShellObserving = (BSInvalidatable *)v11;

    objc_initWeak(&location, v3);
    v13 = &_dispatch_main_q;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_10002F524;
    v18[3] = &unk_1000B76D8;
    objc_copyWeak(&v19, &location);
    uint64_t v14 = BSLogAddStateCaptureBlockWithTitle(&_dispatch_main_q, @"BKUserEventTimer", v18);
    uint64_t v15 = objc_claimAutoreleasedReturnValue(v14);
    stateCaptureAssertion = v3->_stateCaptureAssertion;
    v3->_stateCaptureAssertion = (BSInvalidatable *)v15;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v3;
}

- (void)dealloc
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
  [v4 handleFailureInMethod:a2 object:self file:@"BKUserEventTimer.m" lineNumber:88 description:@"this object should never deallocate"];

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___BKUserEventTimer;
  -[BKUserEventTimer dealloc](&v5, "dealloc");
}

- (id)succinctDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKUserEventTimer succinctDescriptionBuilder](self, "succinctDescriptionBuilder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 build]);

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[BKUserEventTimer descriptionBuilderWithMultilinePrefix:]( self,  "descriptionBuilderWithMultilinePrefix:",  a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 build]);

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKUserEventTimer succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3));
  uint64_t v5 = NSStringFromBKSHIDServicesUserEventTimerMode(self->_currentMode);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = [v4 appendObject:v6 withName:@"currentMode"];

  id v8 =  [v4 appendTimeInterval:@"currentTimeout" withName:0 decomposeUnits:self->_currentTimeout];
  id v9 =  [v4 appendTimeInterval:@"lastUserEventTime" withName:0 decomposeUnits:self->_lastUserEvent];
  id v10 =  [v4 appendTimeInterval:@"lastResetTimerRequestTime" withName:0 decomposeUnits:self->_lastResetTimerRequest];
  id v11 = [v4 appendBool:self->_isIdle withName:@"_isIdle"];
  id v12 = [v4 appendBool:self->_shouldNotify withName:@"_shouldNotify"];
  id v13 = [v4 appendBool:self->_safeToResetIdleTimer withName:@"_safeToResetIdleTimer"];
  return v4;
}

- (void)systemShellDidFinishLaunching:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002F4EC;
  block[3] = &unk_1000B8058;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (double)lastUserEventTime
{
  uint64_t v6 = 0LL;
  id v7 = (double *)&v6;
  uint64_t v8 = 0x2020000000LL;
  uint64_t v9 = 0LL;
  queue = (dispatch_queue_s *)self->_queue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_10002F4D8;
  v5[3] = &unk_1000B8080;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  double v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)resetTimer:(double)a3 mode:(int)a4
{
  if (BKSHIDServicesUserEventTimerIntervalForever <= a3 || a4 == 0 || a3 < 0.0) {
    double v8 = BKSHIDServicesUserEventTimerIntervalForever;
  }
  else {
    double v8 = a3;
  }
  CFTimeInterval v9 = CACurrentMediaTime();
  queue = (dispatch_queue_s *)self->_queue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10002F34C;
  v11[3] = &unk_1000B6A30;
  int v12 = a4;
  v11[4] = self;
  *(double *)&v11[5] = v8;
  *(CFTimeInterval *)&v11[6] = v9;
  dispatch_async(queue, v11);
}

- (void)userEventOccurredOnDisplay:(id)a3
{
  if (!a3)
  {
    v8[8] = v3;
    v8[9] = v4;
    CFTimeInterval v6 = CACurrentMediaTime();
    queue = (dispatch_queue_s *)self->_queue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10002F2D8;
    v8[3] = &unk_1000B7ED8;
    v8[4] = self;
    *(CFTimeInterval *)&v8[5] = v6;
    dispatch_async(queue, v8);
  }

- (void)notifyOnNextUserEvent
{
  queue = (dispatch_queue_s *)self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10002F2C8;
  block[3] = &unk_1000B8058;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)isSafeToResetIdleTimer
{
  return self->_safeToResetIdleTimer;
}

- (void)_queue_postNotification:(__CFString *)a3
{
  id v4 = sub_10003F2F4();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138543362;
    double v8 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "postNotification: %{public}@",  (uint8_t *)&v7,  0xCu);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, a3, 0LL, 0LL, 1u);
}

- (void)_queue_userEventOccurredInIdleMode
{
  if (self->_isIdle)
  {
    self->_isIdle = 0;
    -[BKUserEventTimer _queue_postNotification:](self, "_queue_postNotification:", kBKSHIDServicesUserEventUnIdled);
  }

- (void)_queue_userEventOccurredInPresenceMode
{
  if (self->_timer)
  {
    if (self->_isIdle)
    {
      self->_isIdle = 0;
      -[BKUserEventTimer _queue_postNotification:](self, "_queue_postNotification:", kBKSHIDServicesUserEventPresent);
    }
  }

- (void)_queue_scheduleTimerWithTimeInterval:(double)a3
{
  if (BKSHIDServicesUserEventTimerIntervalForever == a3)
  {
    id v5 = sub_10003F2F4();
    CFTimeInterval v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Disabling timer because scheduled interval exceeds 'forever' threshold",  buf,  2u);
    }
  }

  else
  {
    int v7 = objc_alloc(&OBJC_CLASS___BSTimer);
    queue = self->_queue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10002F154;
    v11[3] = &unk_1000B7ED8;
    *(double *)&v11[5] = a3;
    v11[4] = self;
    CFTimeInterval v9 = -[BSTimer initWithFireInterval:queue:handler:](v7, "initWithFireInterval:queue:handler:", queue, v11, a3);
    timer = self->_timer;
    self->_timer = v9;

    -[BSTimer schedule](self->_timer, "schedule");
  }

- (void)_queue_clearTimer
{
  timer = self->_timer;
  self->_timer = 0LL;
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  if (qword_1000DC000 != -1) {
    dispatch_once(&qword_1000DC000, &stru_1000B6560);
  }
  return (id)qword_1000DBFF8;
}

@end