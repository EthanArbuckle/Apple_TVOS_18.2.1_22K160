@interface ZOTWorkspace
+ (id)workspace;
+ (void)disableZoom;
+ (void)enableZoom;
+ (void)initialize;
- (AXDispatchTimer)followCursorTimer;
- (BOOL)currentlyTouchingToSpeak;
- (BOOL)followsKeyboardFocus;
- (BOOL)smoothScalingDisabled;
- (BOOL)touchToSpeakModeEnabled;
- (BOOL)zoomEnabled;
- (NSString)eventTapIdentifier;
- (NSString)springboardActionHandlerIdentifer;
- (SCRCThreadKey)threadKey;
- (ZOTWorkspace)init;
- (ZoomServices)zoomServices;
- (void)_conflictAlert:(id)a3;
- (void)_delayedHandleApplicationActivated;
- (void)_handleApplicationActivated;
- (void)_initializeZoom;
- (void)_registerForZoomConflict;
- (void)_runThread;
- (void)_setAccessibilityAnimationOffset:(id)a3;
- (void)_setCaptureEvents:(BOOL)a3;
- (void)_setZoomEnabled:(BOOL)a3;
- (void)_showAppConflictAlertIfNecessary;
- (void)_voiceOverEnabled;
- (void)_zoomConflictRegistered:(id)a3;
- (void)conflictAlertDidDismissWithButtonIndex:(int64_t)a3;
- (void)dealloc;
- (void)sendUserEventToSpringBoard;
- (void)setCurrentlyTouchingToSpeak:(BOOL)a3;
- (void)setFollowCursorTimer:(id)a3;
- (void)setFollowsKeyboardFocus:(BOOL)a3;
- (void)setSmoothScalingDisabled:(BOOL)a3;
- (void)setSpringboardActionHandlerIdentifer:(id)a3;
- (void)setTouchToSpeakModeEnabled:(BOOL)a3;
- (void)setZoomServices:(id)a3;
- (void)tripleClickAlertDidDismissWithButtonIndex:(int64_t)a3;
- (void)zoomConflictRegistered:(id)a3;
@end

@implementation ZOTWorkspace

+ (id)workspace
{
  return (id)ZOTSharedWorkspace;
}

+ (void)initialize
{
  if ((id)objc_opt_class(&OBJC_CLASS___ZOTWorkspace, a2) == a1) {
    ZOTInitializeUtilities();
  }
}

- (void)_runThread
{
  v3 = objc_autoreleasePoolPush();
  self->_runLoopEnabled = 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](&OBJC_CLASS___NSRunLoop, "currentRunLoop"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMachPort port](&OBJC_CLASS___NSMachPort, "port"));
  [v4 addPort:v5 forMode:NSDefaultRunLoopMode];

  do
  {
    v6 = objc_autoreleasePoolPush();
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate distantFuture](&OBJC_CLASS___NSDate, "distantFuture"));
    [v4 runMode:NSDefaultRunLoopMode beforeDate:v7];

    objc_autoreleasePoolPop(v6);
  }

  while (self->_runLoopEnabled);

  objc_autoreleasePoolPop(v3);
}

+ (void)enableZoom
{
  v2 = (void *)ZOTSharedWorkspace;
  if (!ZOTSharedWorkspace)
  {
    id v3 = [objc_allocWithZone((Class)ZOTWorkspace) init];
    v4 = (void *)ZOTSharedWorkspace;
    ZOTSharedWorkspace = (uint64_t)v3;

    v2 = (void *)ZOTSharedWorkspace;
  }

  id v5 = (id)objc_claimAutoreleasedReturnValue([v2 zoomServices]);
  [v5 showZoomLens];
}

+ (void)disableZoom
{
  id v2 = (id)objc_claimAutoreleasedReturnValue([(id)ZOTSharedWorkspace zoomServices]);
  [v2 hideZoomLens];
}

- (ZOTWorkspace)init
{
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___ZOTWorkspace;
  id v3 = -[ZOTWorkspace init](&v16, "init");
  if (v3)
  {
    v4 = -[SCRCThreadKey initWithObject:](objc_alloc(&OBJC_CLASS___SCRCThreadKey), "initWithObject:", v3);
    threadKey = v3->_threadKey;
    v3->_threadKey = v4;

    v6 = -[NSThread initWithTarget:selector:object:]( objc_alloc(&OBJC_CLASS___NSThread),  "initWithTarget:selector:object:",  v3,  "_runThread",  0LL);
    workspaceThread = v3->_workspaceThread;
    v3->_workspaceThread = v6;

    -[NSThread setName:](v3->_workspaceThread, "setName:", @"workspaceThread");
    -[NSThread start](v3->_workspaceThread, "start");
    objc_storeStrong((id *)&ZOTSharedWorkspace, v3);
    -[ZOTWorkspace performSelector:withObject:afterDelay:]( v3,  "performSelector:withObject:afterDelay:",  "_initializeZoom",  0LL,  0.0);
    -[ZOTWorkspace setFollowsKeyboardFocus:](v3, "setFollowsKeyboardFocus:", 1LL);
    double v8 = ZOTTimeUnset;
    *(void *)&v3->_lastEventTime = ZOTTimeUnset;
    v3->_accessibilityAnimationOffset = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[ZoomServices sharedInstance](&OBJC_CLASS___ZoomServices, "sharedInstance"));
    -[ZOTWorkspace setZoomServices:](v3, "setZoomServices:", v9);
    v10 = v3->_workspaceThread;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = __20__ZOTWorkspace_init__block_invoke;
    v14[3] = &unk_8300;
    v11 = v3;
    v15 = v11;
    ZOTDispatchEventThread(v10, v14);
    v12 = v11;
  }

  return v3;
}

id __20__ZOTWorkspace_init__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _registerForZoomConflict];
}

- (void)_registerForZoomConflict
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"zoomConflictRegistered:" name:UIAXZoomRegisterConflict object:0];
}

- (void)zoomConflictRegistered:(id)a3
{
  id v4 = a3;
  workspaceThread = self->_workspaceThread;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __39__ZOTWorkspace_zoomConflictRegistered___block_invoke;
  v7[3] = &unk_8328;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  ZOTDispatchEventThread(workspaceThread, v7);
}

id __39__ZOTWorkspace_zoomConflictRegistered___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _zoomConflictRegistered:*(void *)(a1 + 40)];
}

- (void)_conflictAlert:(id)a3
{
  self->_conflictAlertVisible = 1;
}

- (void)tripleClickAlertDidDismissWithButtonIndex:(int64_t)a3
{
  if (a3 == 1)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 4LL));
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](&OBJC_CLASS___NSArray, "arrayWithObject:", v5));

    _AXSSetTripleClickOptions(v3);
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[ZOTConfiguration configurationManager](&OBJC_CLASS___ZOTConfiguration, "configurationManager"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    [v4 setValue:v6 forKey:@"AskedAboutTripleClick"];

    goto LABEL_5;
  }

  if (!a3)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[ZOTConfiguration configurationManager](&OBJC_CLASS___ZOTConfiguration, "configurationManager"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 1LL));
    [v3 setValue:v4 forKey:@"AskedAboutTripleClick"];
LABEL_5:
  }

  _AXSZoomTouchSetEnabled(0LL, a2);
}

- (void)conflictAlertDidDismissWithButtonIndex:(int64_t)a3
{
  self->_conflictAlertVisible = 0;
  v23 = self->_conflictAlertData;
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSDictionary, v5);
  if ((objc_opt_isKindOfClass(v23, v6) & 1) == 0)
  {
    conflictAlertData = self->_conflictAlertData;
    self->_conflictAlertData = 0LL;

    NSLog(@"What happened to our user dictionary?");
    goto LABEL_19;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](v23, "objectForKey:", @"BundleID"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[ZOTConfiguration configurationManager](&OBJC_CLASS___ZOTConfiguration, "configurationManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 valueForKey:@"AppConflicts"]);
  id v10 = [v9 mutableCopyWithZone:0];

  if (!v10) {
    id v10 = [objc_allocWithZone(NSMutableDictionary) init];
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:v7]);
  id v12 = [v11 mutableCopyWithZone:0];

  if (!v12) {
    id v12 = [objc_allocWithZone(NSMutableDictionary) init];
  }
  [v10 setObject:v12 forKey:v7];
  if (a3)
  {
    if (a3 != 1)
    {
      [v12 setObject:v23 forKey:@"AskAgainData"];
      goto LABEL_13;
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", 0LL));
    [v12 setObject:v13 forKey:@"DisableZoom"];

    [v12 removeObjectForKey:@"AskAgainData"];
  }

  else
  {
    [v12 setObject:v23 forKey:@"AskAgainData"];
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
  [v12 setObject:v15 forKey:@"DateRegistered"];

LABEL_13:
  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue(+[ZOTConfiguration configurationManager](&OBJC_CLASS___ZOTConfiguration, "configurationManager"));
  [v16 setValue:v10 forKey:@"AppConflicts"];

  if (!a3)
  {
    v17 = (void *)_AXSTripleClickCopyOptions();
    if ([v17 count]
      || (v18 = (void *)objc_claimAutoreleasedReturnValue( +[ZOTConfiguration configurationManager]( ZOTConfiguration,  "configurationManager")),  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 valueForKey:@"AskedAboutTripleClick"]),  unsigned __int8 v20 = objc_msgSend(v19, "BOOLValue"),  v19,  v18,  (v20 & 1) != 0))
    {

      _AXSZoomTouchSetEnabled(0LL, v21);
    }

    else
    {
    }
  }

  v22 = self->_conflictAlertData;
  self->_conflictAlertData = 0LL;

LABEL_19:
}

- (void)_zoomConflictRegistered:(id)a3
{
  v15 = (void *)objc_claimAutoreleasedReturnValue([a3 userInfo]);
  uint64_t v5 = objc_opt_class(&OBJC_CLASS___NSDictionary, v4);
  char isKindOfClass = objc_opt_isKindOfClass(v15, v5);
  v7 = v15;
  if ((isKindOfClass & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue([v15 objectForKey:@"BundleID"]);
    if (v9)
    {
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___NSString, v8);
      if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[ZOTConfiguration configurationManager](&OBJC_CLASS___ZOTConfiguration, "configurationManager"));
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 valueForKey:@"AppConflicts"]);

        v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v9]);
        v14 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:@"DateRegistered"]);

        if (!v14) {
          -[ZOTWorkspace performSelectorOnMainThread:withObject:waitUntilDone:]( self,  "performSelectorOnMainThread:withObject:waitUntilDone:",  "_conflictAlert:",  v15,  0LL);
        }
      }
    }

    v7 = v15;
  }
}

- (void)_initializeZoom
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  0LL,  (CFNotificationCallback)_appTransitionOccurred,  @"com.apple.mobile.SubstantialTransition",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  id v3 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( v3,  0LL,  (CFNotificationCallback)_smoothScalingDisabledChanged,  kAXSZoomTouchSmoothScalingNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterAddObserver( LocalCenter,  0LL,  (CFNotificationCallback)_voiceOverEnabled,  kAXSVoiceOverTouchEnabledNotification,  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  if ((_touchToSpeakChanged_DidCheckAppAccessibility & 1) == 0)
  {
    _AXSAppAccessibilityOnBefore = _AXSApplicationAccessibilityEnabled() != 0;
    _touchToSpeakChanged_DidCheckAppAccessibility = 1;
  }

  if ([(id)ZOTSharedWorkspace touchToSpeakModeEnabled])
  {
    uint64_t v5 = 1LL;
LABEL_5:
    _AXSApplicationAccessibilitySetEnabled(v5);
    return;
  }

  if (!_AXSAppAccessibilityOnBefore
    && _AXSApplicationAccessibilityEnabled()
    && _AXSCanDisableApplicationAccessibility())
  {
    uint64_t v5 = 0LL;
    goto LABEL_5;
  }

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  -[ZOTWorkspace _setZoomEnabled:](self, "_setZoomEnabled:", 0LL);
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ZOTWorkspace;
  -[ZOTWorkspace dealloc](&v4, "dealloc");
}

- (void)_setCaptureEvents:(BOOL)a3
{
  if (!a3)
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXEventTapManager sharedManager](&OBJC_CLASS___AXEventTapManager, "sharedManager"));
    [v4 removeEventTap:self->_eventTapIdentifier];

    eventTapIdentifier = self->_eventTapIdentifier;
    self->_eventTapIdentifier = 0LL;
LABEL_6:

    return;
  }

  if (!self->_eventTapIdentifier)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[AXEventTapManager sharedManager](&OBJC_CLASS___AXEventTapManager, "sharedManager"));
    uint64_t v6 = (NSString *)objc_claimAutoreleasedReturnValue([v8 installEventTap:&__block_literal_global identifier:@"Zoom" type:0]);
    v7 = self->_eventTapIdentifier;
    self->_eventTapIdentifier = v6;

    eventTapIdentifier = (NSString *)v8;
    goto LABEL_6;
  }

BOOL __34__ZOTWorkspace__setCaptureEvents___block_invoke(id a1, AXEventRepresentation *a2)
{
  id v2 = a2;
  id v3 = v2;
  if (v2 && operator|| && -[AXEventRepresentation type](v2, "type") == 10)
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[ZOTWorkspace workspace](&OBJC_CLASS___ZOTWorkspace, "workspace"));
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 followCursorTimer]);

    if (!v5)
    {
      uint64_t v6 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  &_dispatch_main_q);
      [v4 setFollowCursorTimer:v6];
      -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:]( v6,  "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:",  1LL);
    }

    [v4 setFollowsKeyboardFocus:1];
    v7 = (void *)objc_claimAutoreleasedReturnValue([v4 followCursorTimer]);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = ___accessibilityEventTapCallback_block_invoke;
    v10[3] = &unk_8300;
    id v11 = v4;
    id v8 = v4;
    [v7 afterDelay:v10 processBlock:1.0];
  }

  return 0;
}

- (void)_voiceOverEnabled
{
  if (self->_eventTapIdentifier)
  {
    int v3 = _AXSVoiceOverTouchEnabled();
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXEventTapManager sharedManager](&OBJC_CLASS___AXEventTapManager, "sharedManager"));
    id v6 = v4;
    if (v3) {
      uint64_t v5 = 50LL;
    }
    else {
      uint64_t v5 = 30LL;
    }
    [v4 setEventTapPriority:self->_eventTapIdentifier priority:v5];
  }

- (BOOL)zoomEnabled
{
  return operator||;
}

- (void)_delayedHandleApplicationActivated
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[ZOTWorkspace threadKey](self, "threadKey"));
  -[ZOTWorkspace performSelector:withThreadKey:count:objects:]( self,  "performSelector:withThreadKey:count:objects:",  "_handleApplicationActivated",  v3,  0LL,  0LL);
}

- (void)_setZoomEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  operator|| = a3;
  -[ZOTWorkspace _setCaptureEvents:](self, "_setCaptureEvents:");
  if (v3)
  {
    -[ZOTWorkspace performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_delayedHandleApplicationActivated",  0LL,  0.0);
    AXPerformBlockOnMainThreadAfterDelay(&__block_literal_global_231, 3.0);
  }

  else
  {
    -[ZOTWorkspace setSpringboardActionHandlerIdentifer:](self, "setSpringboardActionHandlerIdentifer:", 0LL);
  }

  -[ZOTWorkspace _voiceOverEnabled](self, "_voiceOverEnabled");
}

- (void)sendUserEventToSpringBoard
{
}

- (void)_handleApplicationActivated
{
  BOOL v3 = (__CFString *)objc_claimAutoreleasedReturnValue( +[ZOTSystemInterface topApplicationBundleId]( &OBJC_CLASS___ZOTSystemInterface,  "topApplicationBundleId"));
  -[__CFString isEqual:](v3, "isEqual:", @"com.apple.mobilephone");
  if (v3) {
    objc_super v4 = v3;
  }
  else {
    objc_super v4 = @"SystemServer";
  }
  v9 = (__CFString *)v4;
  -[ZOTWorkspace _showAppConflictAlertIfNecessary](self, "_showAppConflictAlertIfNecessary");
  uint64_t v5 = (NSString *)[objc_allocWithZone(NSString) initWithFormat:@"ZoomInfo.%@", v9];
  applicationKey = self->_applicationKey;
  self->_applicationKey = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue( -[NSString stringByReplacingOccurrencesOfString:withString:]( self->_applicationKey,  "stringByReplacingOccurrencesOfString:withString:",  @"ZoomInfo.",  &stru_86D0));
  unsigned __int8 v8 = [v7 isEqualToString:@"LockScreen"];

  self->_isInLockScreen = v8;
}

- (void)_showAppConflictAlertIfNecessary
{
  id v7 = (id)objc_claimAutoreleasedReturnValue( -[NSString stringByReplacingOccurrencesOfString:withString:]( self->_applicationKey,  "stringByReplacingOccurrencesOfString:withString:",  @"ZoomInfo.",  &stru_86D0));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[ZOTConfiguration configurationManager](&OBJC_CLASS___ZOTConfiguration, "configurationManager"));
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([v3 valueForKey:@"AppConflicts"]);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v7]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"AskAgainData"]);
  if (v6) {
    -[ZOTWorkspace _conflictAlert:](self, "_conflictAlert:", v6);
  }
}

- (void)_setAccessibilityAnimationOffset:(id)a3
{
  self->_accessibilityAnimationOffset = v4;
}

- (BOOL)followsKeyboardFocus
{
  return self->_followsKeyboardFocus;
}

- (void)setFollowsKeyboardFocus:(BOOL)a3
{
  self->_followsKeyboardFocus = a3;
}

- (BOOL)touchToSpeakModeEnabled
{
  return self->_touchToSpeakModeEnabled;
}

- (void)setTouchToSpeakModeEnabled:(BOOL)a3
{
  self->_touchToSpeakModeEnabled = a3;
}

- (BOOL)currentlyTouchingToSpeak
{
  return self->_currentlyTouchingToSpeak;
}

- (void)setCurrentlyTouchingToSpeak:(BOOL)a3
{
  self->_currentlyTouchingToSpeak = a3;
}

- (BOOL)smoothScalingDisabled
{
  return self->_smoothScalingDisabled;
}

- (void)setSmoothScalingDisabled:(BOOL)a3
{
  self->_smoothScalingDisabled = a3;
}

- (NSString)eventTapIdentifier
{
  return self->_eventTapIdentifier;
}

- (AXDispatchTimer)followCursorTimer
{
  return self->_followCursorTimer;
}

- (void)setFollowCursorTimer:(id)a3
{
}

- (SCRCThreadKey)threadKey
{
  return self->_threadKey;
}

- (ZoomServices)zoomServices
{
  return self->_zoomServices;
}

- (void)setZoomServices:(id)a3
{
}

- (NSString)springboardActionHandlerIdentifer
{
  return self->_springboardActionHandlerIdentifer;
}

- (void)setSpringboardActionHandlerIdentifer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end