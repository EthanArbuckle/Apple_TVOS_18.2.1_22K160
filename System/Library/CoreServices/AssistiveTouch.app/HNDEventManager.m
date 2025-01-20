@interface HNDEventManager
+ (id)sharedManager;
- (AXAssertion)disableDashBoardGesturesAssertion;
- (AXAssertion)disableSystemGesturesAssertion;
- (AXNotificationObserver)notificationObserver;
- (BOOL)_shouldSwitchControlIgnoreHIDEvent:(__IOHIDEvent *)a3;
- (BOOL)isCapturingEvents;
- (BOOL)isVoiceControlRunning;
- (BOOL)nubbitMoving;
- (BOOL)orientationLocked;
- (BOOL)shouldCaptureEvent:(__IOHIDEvent *)a3;
- (BOOL)sideSwitchUsedForOrientation;
- (BSInvalidatable)disableIdleTimerAssertion;
- (CPDistributedMessagingCenter)messagingCenter;
- (HNDEventManager)init;
- (HNDEventManagerDelegate)delegate;
- (__IOHIDEventSystemClient)ioSystemClient;
- (double)volumeLevel;
- (void)_disableIOFilter;
- (void)_handleIOHIDEvent:(id)a3;
- (void)_initializeASTNotificationCenter;
- (void)_registerIOHIDUsage;
- (void)_startDistributedThread;
- (void)_startIOThread;
- (void)_unregisterIOFilter;
- (void)dealloc;
- (void)keyboardStatusChanged:(id)a3 userInfo:(id)a4;
- (void)manipulateDimTimer:(BOOL)a3;
- (void)notifyUserEventOccurred;
- (void)observer:(id)a3 didObserveNotification:(int)a4 notificationData:(void *)a5;
- (void)openCreateCustomGestureForAST;
- (void)openCreateCustomGestureForSCAT;
- (void)resetEventManager;
- (void)ringerSwitchChanged;
- (void)rotationLockChanged;
- (void)setCaptureEvents:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableDashBoardGesturesAssertion:(id)a3;
- (void)setDisableIdleTimerAssertion:(id)a3;
- (void)setDisableSystemGesturesAssertion:(id)a3;
- (void)setMessagingCenter:(id)a3;
- (void)setNotificationObserver:(id)a3;
- (void)setNubbitMoving:(BOOL)a3;
- (void)setOrientationLocked:(BOOL)a3;
- (void)substantialTransitionOccurred;
- (void)systemServerRestarted;
- (void)wakeDeviceFromSleepIfNecessary;
@end

@implementation HNDEventManager

+ (id)sharedManager
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 eventManager]);

  return v3;
}

- (HNDEventManager)init
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___HNDEventManager;
  v2 = -[HNDEventManager init](&v12, "init");
  v3 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  &_dispatch_main_q);
  keyboardStatusCoalesce = v2->_keyboardStatusCoalesce;
  v2->_keyboardStatusCoalesce = v3;

  v5 = -[NSThread initWithTarget:selector:object:]( objc_alloc(&OBJC_CLASS___NSThread),  "initWithTarget:selector:object:",  v2,  "_startDistributedThread",  0LL);
  distributedMessagingThread = v2->_distributedMessagingThread;
  v2->_distributedMessagingThread = v5;

  -[NSThread setName:](v2->_distributedMessagingThread, "setName:", @"Distributed messaging thread");
  -[NSThread start](v2->_distributedMessagingThread, "start");
  -[HNDEventManager performSelector:onThread:withObject:waitUntilDone:]( v2,  "performSelector:onThread:withObject:waitUntilDone:",  "_initializeASTNotificationCenter",  v2->_distributedMessagingThread,  0LL,  0LL);
  dispatch_queue_t v7 = dispatch_queue_create("HNDEventManager-DisableIdleTimer", 0LL);
  disableIdleTimerAssertionQueue = v2->_disableIdleTimerAssertionQueue;
  v2->_disableIdleTimerAssertionQueue = (OS_dispatch_queue *)v7;

  if (_AXSMossdeepEnabled())
  {
    v9 = -[AXNotificationObserver initWithNotifications:]( objc_alloc(&OBJC_CLASS___AXNotificationObserver),  "initWithNotifications:",  &off_10012F550);
    -[HNDEventManager setNotificationObserver:](v2, "setNotificationObserver:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[HNDEventManager notificationObserver](v2, "notificationObserver"));
    [v10 setDelegate:v2];
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___HNDEventManager;
  -[HNDEventManager dealloc](&v3, "dealloc");
}

- (void)_startDistributedThread
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
  [v2 timeIntervalSinceReferenceDate];
  double v4 = v3;

  while (1)
  {
    v5 = objc_autoreleasePoolPush();
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    CFRunLoopRunSpecific(Current, kCFRunLoopDefaultMode, 1LL, v4);
    objc_autoreleasePoolPop(v5);
  }

- (void)systemServerRestarted
{
}

- (void)substantialTransitionOccurred
{
  double v3 = (void *)objc_claimAutoreleasedReturnValue(-[HNDEventManager delegate](self, "delegate"));
  [v3 substantialTransitionOccurred];

  id v4 = (id)objc_claimAutoreleasedReturnValue(-[HNDEventManager delegate](self, "delegate"));
  [v4 mediaControlsChanged:0];
}

- (void)ringerSwitchChanged
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[HNDEventManager delegate](self, "delegate"));
  [v2 ringerSwitchChanged];
}

- (void)rotationLockChanged
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[HNDEventManager delegate](self, "delegate"));
  [v2 rotationLockChanged];
}

- (void)resetEventManager
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_100028038;
  v3[3] = &unk_100121D18;
  v3[4] = self;
  AXPerformBlockAsynchronouslyOnMainThread(v3);
}

- (void)keyboardStatusChanged:(id)a3 userInfo:(id)a4
{
  id v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"visible"]);
  unsigned __int8 v7 = [v6 BOOLValue];

  v8 = (NSString *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"frame"]);
  v9 = v8;
  if (v8)
  {
    CGRect v21 = CGRectFromString(v8);
    CGFloat x = v21.origin.x;
    CGFloat y = v21.origin.y;
    CGFloat width = v21.size.width;
    CGFloat height = v21.size.height;
  }

  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }

  uint64_t v14 = ASTLogCommon(v8);
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "AST keyboard update: %{public}@", buf, 0xCu);
  }

  -[AXDispatchTimer cancel](self->_keyboardStatusCoalesce, "cancel");
  keyboardStatusCoalesce = self->_keyboardStatusCoalesce;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100028210;
  v17[3] = &unk_100122998;
  v17[4] = self;
  unsigned __int8 v18 = v7;
  *(CGFloat *)&v17[5] = x;
  *(CGFloat *)&v17[6] = y;
  *(CGFloat *)&v17[7] = width;
  *(CGFloat *)&v17[8] = height;
  -[AXDispatchTimer afterDelay:processBlock:](keyboardStatusCoalesce, "afterDelay:processBlock:", v17, 0.0);
}

- (void)_initializeASTNotificationCenter
{
  if (+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread"))
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"));
    [v4 handleFailureInMethod:a2 object:self file:@"HNDEventManager.m" lineNumber:345 description:@"Make sure we don't start this on main thread"];
  }

  id v5 = (id)objc_claimAutoreleasedReturnValue( +[CPDistributedMessagingCenter centerNamed:]( &OBJC_CLASS___CPDistributedMessagingCenter,  "centerNamed:",  @"UIASTNotificationCenter"));
  [v5 runServerOnCurrentThread];
  [v5 registerForMessageName:@"UIAXASTKeyboardStatus" target:self selector:"keyboardStatusChanged:userInfo:"];
  -[HNDEventManager setMessagingCenter:](self, "setMessagingCenter:", v5);
}

- (void)manipulateDimTimer:(BOOL)a3
{
  if (a3)
  {
    disableIdleTimerAssertionQueue = (dispatch_queue_s *)self->_disableIdleTimerAssertionQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100028414;
    block[3] = &unk_100121D18;
    block[4] = self;
    dispatch_async(disableIdleTimerAssertionQueue, block);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    [v5 _setIdleTimerDisabled:1 forReason:@"AssistiveTouch"];
  }

  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](&OBJC_CLASS___UIApplication, "sharedApplication"));
    [v6 _setIdleTimerDisabled:0 forReason:@"AssistiveTouch"];

    unsigned __int8 v7 = (dispatch_queue_s *)self->_disableIdleTimerAssertionQueue;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_10002849C;
    v8[3] = &unk_100121D18;
    v8[4] = self;
    dispatch_async(v7, v8);
  }

- (BOOL)nubbitMoving
{
  return self->_nubbitMoving;
}

- (void)setNubbitMoving:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = ASTLogCommon(self);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v11[0] = 67109120;
    v11[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Setting nubbit moving: %d", (uint8_t *)v11, 8u);
  }

  if (v3)
  {
    -[HNDEventManager manipulateDimTimer:](self, "manipulateDimTimer:", 1LL);
    if (+[AXAssertion isSupported](&OBJC_CLASS___AXAssertion, "isSupported"))
    {
      unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[HNDEventManager disableSystemGesturesAssertion](self, "disableSystemGesturesAssertion"));

      if (!v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue( +[AXAssertion assertionWithType:identifier:]( &OBJC_CLASS___AXAssertion,  "assertionWithType:identifier:",  AXAssertionTypeDisableSystemGestures,  @"AST Nubbit Moving"));
        -[HNDEventManager setDisableSystemGesturesAssertion:](self, "setDisableSystemGesturesAssertion:", v8);
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[HNDEventManager disableDashBoardGesturesAssertion](self, "disableDashBoardGesturesAssertion"));

      if (!v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue( +[AXAssertion assertionWithType:identifier:]( &OBJC_CLASS___AXAssertion,  "assertionWithType:identifier:",  AXAssertionTypeDisableDashboardSystemGestures,  @"AST Nubbit Moving"));
        -[HNDEventManager setDisableDashBoardGesturesAssertion:](self, "setDisableDashBoardGesturesAssertion:", v10);
      }
    }
  }

  else
  {
    -[HNDEventManager manipulateDimTimer:](self, "manipulateDimTimer:", 0LL);
    -[HNDEventManager setDisableDashBoardGesturesAssertion:](self, "setDisableDashBoardGesturesAssertion:", 0LL);
    -[HNDEventManager setDisableSystemGesturesAssertion:](self, "setDisableSystemGesturesAssertion:", 0LL);
  }

  self->_nubbitMoving = v3;
}

- (double)volumeLevel
{
  return 1.0;
}

- (BOOL)isVoiceControlRunning
{
  return 0;
}

- (void)wakeDeviceFromSleepIfNecessary
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[AXSystemAppServer server](&OBJC_CLASS___AXSystemAppServer, "server"));
  [v2 wakeUpDeviceIfNecessary];
}

- (void)_handleIOHIDEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_autoreleasePoolPush();
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[HNDHandManager sharedManager](&OBJC_CLASS___HNDHandManager, "sharedManager"));
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 currentDisplayManager]);
  [v7 portraitUpScreenBounds];
  uint64_t v9 = v8;
  uint64_t v11 = v10;

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100028888;
  v13[3] = &unk_1001229B8;
  v13[4] = v9;
  v13[5] = v11;
  [v4 modifyPoints:v13];
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue(-[HNDEventManager delegate](self, "delegate"));
  [v12 handleRealEvent:v4];

  objc_autoreleasePoolPop(v5);
}

- (BOOL)_shouldSwitchControlIgnoreHIDEvent:(__IOHIDEvent *)a3
{
  return 0;
}

- (void)_unregisterIOFilter
{
}

- (void)_startIOThread
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
  [v2 timeIntervalSinceReferenceDate];
  double v4 = v3;

  while (1)
  {
    uint64_t v5 = objc_autoreleasePoolPush();
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    CFRunLoopRunSpecific(Current, kCFRunLoopDefaultMode, 1LL, v4);
    objc_autoreleasePoolPop(v5);
  }

- (void)_registerIOHIDUsage
{
  if (self->_ioSystemFilterClient)
  {
    AXSetThreadPriority(63LL);
    ioSystemFilterClient = self->_ioSystemFilterClient;
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    IOHIDEventSystemClientScheduleWithRunLoop(ioSystemFilterClient, Current, kCFRunLoopDefaultMode);
    v14[0] = @"DeviceUsagePage";
    v14[1] = @"DeviceUsage";
    v15[0] = &off_10012F7D8;
    v15[1] = &off_10012F7F0;
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v15,  v14,  2LL));
    v12[0] = @"DeviceUsagePage";
    v12[1] = @"DeviceUsage";
    v13[0] = &off_10012F7D8;
    v13[1] = &off_10012F808;
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v13,  v12,  2LL));
    v10[0] = @"DeviceUsagePage";
    v10[1] = @"DeviceUsage";
    v11[0] = &off_10012F7D8;
    v11[1] = &off_10012F820;
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  2LL));
    if (_AXSAssistiveTouchScannerEnabled(v7, v8))
    {
      IOHIDEventSystemClientSetMatchingMultiple(self->_ioSystemFilterClient, 0LL);
    }

    else
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
      [v9 addObject:v5];
      [v9 addObject:v7];
      IOHIDEventSystemClientSetMatchingMultiple(self->_ioSystemFilterClient, v9);
    }

    IOHIDEventSystemClientRegisterEventFilterCallbackWithPriority( self->_ioSystemFilterClient,  25LL,  sub_100028BA4,  self,  0LL);
  }

- (void)_disableIOFilter
{
  ioSystemFilterClient = self->_ioSystemFilterClient;
  if (ioSystemFilterClient)
  {
    IOHIDEventSystemClientUnregisterEventFilterCallback(ioSystemFilterClient, sub_100028BA4, self, 0LL);
    double v4 = self->_ioSystemFilterClient;
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    IOHIDEventSystemClientUnscheduleWithRunLoop(v4, Current, kCFRunLoopDefaultMode);
    v6 = self->_ioSystemFilterClient;
    if (v6)
    {
      CFRelease(v6);
      self->_ioSystemFilterClient = 0LL;
    }
  }

- (void)setCaptureEvents:(BOOL)a3
{
  self->_isCapturingEvents = a3;
  if (!a3)
  {
    ioFilterThread = self->_ioFilterThread;
    if (!ioFilterThread) {
      return;
    }
    uint64_t v8 = "_disableIOFilter";
    goto LABEL_9;
  }

  if (self->_ioSystemFilterClient
    || (double v4 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreate(kCFAllocatorDefault, a2),
        (self->_ioSystemFilterClient = v4) != 0LL))
  {
    ioFilterThread = self->_ioFilterThread;
    if (!ioFilterThread)
    {
      v6 = -[NSThread initWithTarget:selector:object:]( objc_alloc(&OBJC_CLASS___NSThread),  "initWithTarget:selector:object:",  self,  "_startIOThread",  0LL);
      unsigned __int8 v7 = self->_ioFilterThread;
      self->_ioFilterThread = v6;

      -[NSThread start](self->_ioFilterThread, "start");
      ioFilterThread = self->_ioFilterThread;
    }

    uint64_t v8 = "_registerIOHIDUsage";
LABEL_9:
    -[HNDEventManager performSelector:onThread:withObject:waitUntilDone:]( self,  "performSelector:onThread:withObject:waitUntilDone:",  v8,  ioFilterThread,  0LL,  0LL);
    return;
  }

  _AXLogWithFacility( 1LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"Could not create system client, serious error");
}

- (BOOL)shouldCaptureEvent:(__IOHIDEvent *)a3
{
  return 1;
}

- (BOOL)sideSwitchUsedForOrientation
{
  return 0;
}

- (BOOL)orientationLocked
{
  return 1;
}

- (void)setOrientationLocked:(BOOL)a3
{
  char v3 = 1;
  _AXLogWithFacility( 1LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  v3,  @"locking orientation not supported on tvOS");
}

- (void)openCreateCustomGestureForAST
{
  char v2 = 1;
  _AXLogWithFacility( 1LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  v2,  @"openAssistiveTouchCustomGestureCreation not supported on tvOS");
}

- (void)openCreateCustomGestureForSCAT
{
  char v2 = 1;
  _AXLogWithFacility( 1LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  v2,  @"openSCATCustomGestureCreation not supported on tvOS");
}

- (void)notifyUserEventOccurred
{
  if (CFAbsoluteTimeGetCurrent() - *(double *)&qword_100157650 > 3.0)
  {
    char v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXUserEventTimer sharedInstance](&OBJC_CLASS___AXUserEventTimer, "sharedInstance"));
    [v2 userEventOccurred];

    qword_100157650 = CFAbsoluteTimeGetCurrent();
  }

- (void)observer:(id)a3 didObserveNotification:(int)a4 notificationData:(void *)a5
{
  if (a4 == 1028)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[AXEventRepresentation representationWithData:]( &OBJC_CLASS___AXEventRepresentation,  "representationWithData:",  a5));
    unsigned __int8 v7 = v6;
    if (v6)
    {
      uint64_t v10 = v6;
      unsigned int v8 = [v6 additionalFlags];
      unsigned __int8 v7 = v10;
      if ((v8 & 0x4000000) != 0)
      {
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[HNDEventManager delegate](self, "delegate"));
        [v9 handleRealEvent:v10];

        unsigned __int8 v7 = v10;
      }
    }
  }

- (BOOL)isCapturingEvents
{
  return self->_isCapturingEvents;
}

- (HNDEventManagerDelegate)delegate
{
  return (HNDEventManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (AXAssertion)disableSystemGesturesAssertion
{
  return self->_disableSystemGesturesAssertion;
}

- (void)setDisableSystemGesturesAssertion:(id)a3
{
}

- (AXAssertion)disableDashBoardGesturesAssertion
{
  return self->_disableDashBoardGesturesAssertion;
}

- (void)setDisableDashBoardGesturesAssertion:(id)a3
{
}

- (__IOHIDEventSystemClient)ioSystemClient
{
  return self->_ioSystemClient;
}

- (BSInvalidatable)disableIdleTimerAssertion
{
  return self->_disableIdleTimerAssertion;
}

- (void)setDisableIdleTimerAssertion:(id)a3
{
}

- (CPDistributedMessagingCenter)messagingCenter
{
  return self->_messagingCenter;
}

- (void)setMessagingCenter:(id)a3
{
}

- (AXNotificationObserver)notificationObserver
{
  return self->_notificationObserver;
}

- (void)setNotificationObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end