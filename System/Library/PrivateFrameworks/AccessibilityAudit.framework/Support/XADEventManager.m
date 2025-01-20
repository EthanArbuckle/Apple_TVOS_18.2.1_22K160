@interface XADEventManager
+ (id)sharedManager;
- (AXEventProcessor)_eventProcessor;
- (BOOL)_atvEventFilter:(id)a3;
- (BOOL)_initializeAXObserverIfNeeded;
- (BOOL)_iosEventFilter:(id)a3;
- (BOOL)_registeredForNotifications;
- (BOOL)snarfingEvents;
- (BOOL)stopSnarfingOnTouchUp;
- (BSInvalidatable)_disableIdleTimerAssertion;
- (XADEventManager)init;
- (XADEventManagerDelegate)delegate;
- (__AXObserver)_axEventObserver;
- (id)_accessibilityNotificationsToObserve;
- (id)_localizedNotificationString:(int)a3;
- (id)_preprocessEventForSimulator:(id)a3;
- (void)_handleAccessibilityNotification:(int)a3 forElement:(__AXUIElement *)a4;
- (void)_handleFocusMovedToElement:(id)a3;
- (void)_handleIOHIDEvent:(id)a3;
- (void)_handleNativeFocusItemChangedNotification:(__CFData *)a3;
- (void)_registerForAXNotifications:(BOOL)a3;
- (void)_registerForNotifications:(BOOL)a3;
- (void)_setLockScreenDimTimerEnabled:(BOOL)a3;
- (void)_startListening;
- (void)_stopListening;
- (void)_touchedElementAtPoint:(CGPoint)a3;
- (void)connectionInterrupted;
- (void)dealloc;
- (void)deviceDidGetTargeted;
- (void)setDelegate:(id)a3;
- (void)setSnarfingEvents:(BOOL)a3;
- (void)setStopSnarfingOnTouchUp:(BOOL)a3;
- (void)set_axEventObserver:(__AXObserver *)a3;
- (void)set_disableIdleTimerAssertion:(id)a3;
- (void)set_eventProcessor:(id)a3;
- (void)set_registeredForNotifications:(BOOL)a3;
@end

@implementation XADEventManager

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100001BD0;
  block[3] = &unk_100014868;
  block[4] = a1;
  if (qword_10001A2A8 != -1) {
    dispatch_once(&qword_10001A2A8, block);
  }
  return (id)qword_10001A2A0;
}

- (XADEventManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___XADEventManager;
  v2 = -[XADEventManager init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100001C88;
    block[3] = &unk_100014890;
    v6 = v2;
    dispatch_async(&_dispatch_main_q, block);
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___XADEventManager;
  -[XADEventManager dealloc](&v3, "dealloc");
}

- (void)_touchedElementAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[XADEventManager delegate](self, "delegate"));
  objc_msgSend(v6, "eventManager:eventToHighlightPoint:", self, x, y);
}

- (void)_setLockScreenDimTimerEnabled:(BOOL)a3
{
  if (byte_10001A0A8 != a3)
  {
    byte_10001A0A8 = a3;
    if (a3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[XADEventManager _disableIdleTimerAssertion](self, "_disableIdleTimerAssertion"));
      [v4 invalidate];

      -[XADEventManager set_disableIdleTimerAssertion:](self, "set_disableIdleTimerAssertion:", 0LL);
    }

    else
    {
      id v10 = (id)objc_claimAutoreleasedReturnValue(+[AXUserEventTimer sharedInstance](&OBJC_CLASS___AXUserEventTimer, "sharedInstance"));
      id v6 = (objc_class *)objc_opt_class(self, v5);
      objc_super v7 = NSStringFromClass(v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue([v10 acquireAssertionToDisableIdleTimerWithReason:v8]);
      -[XADEventManager set_disableIdleTimerAssertion:](self, "set_disableIdleTimerAssertion:", v9);
    }
  }

- (void)_handleIOHIDEvent:(id)a3
{
  uint64_t v5 = objc_autoreleasePoolPush();
  id v20 = (id)objc_claimAutoreleasedReturnValue([a3 denormalizedEventRepresentation:0 descale:1]);
  if ([v20 type] == 3001)
  {
    if (-[XADEventManager stopSnarfingOnTouchUp](self, "stopSnarfingOnTouchUp")
      && (id v6 = (void *)objc_claimAutoreleasedReturnValue([v20 handInfo]),
          unsigned int v7 = [v6 currentFingerCount],
          v6,
          !v7))
    {
      -[XADEventManager setSnarfingEvents:](self, "setSnarfingEvents:", 0LL);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[XADEventManager delegate](self, "delegate"));
      [v19 eventManager:self stoppedSnarfingEvents:1];
    }

    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue([v20 handInfo]);
      unsigned int v9 = [v8 eventType];

      if (v9 != 10)
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v20 handInfo]);
        unsigned int v11 = [v10 eventType];

        if (v11 != 11)
        {
          [v20 neuterUpdates];
          -[XADEventManager _setLockScreenDimTimerEnabled:](self, "_setLockScreenDimTimerEnabled:", 0LL);
          v12 = (void *)objc_claimAutoreleasedReturnValue([v20 handInfo]);
          v13 = (void *)objc_claimAutoreleasedReturnValue([v12 paths]);
          v14 = (void *)objc_claimAutoreleasedReturnValue([v13 firstPath]);
          [v14 pathLocation];
          double v16 = v15;
          double v18 = v17;

          -[XADEventManager _touchedElementAtPoint:](self, "_touchedElementAtPoint:", v16, v18);
        }
      }
    }
  }

  objc_autoreleasePoolPop(v5);
}

- (id)_preprocessEventForSimulator:(id)a3
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([a3 denormalizedEventRepresentation:1 descale:1]);
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 handInfo]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 paths]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 firstPath]);
  [v6 pathLocation];
  double v8 = v7;
  double v10 = v9;

  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[AXBackBoardServer server](&OBJC_CLASS___AXBackBoardServer, "server"));
  id v12 = objc_msgSend(v11, "contextIdForPosition:", v8, v10);

  [v3 setContextId:v12];
  return v3;
}

- (BOOL)_atvEventFilter:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3
    && [v3 type]
    && [v4 senderID] != (id)0x8000000817319373
    && [v4 senderID] != (id)0x8000000817319375
    && [v4 type] != 3001
    && [v4 type] != 1032
    && [v4 type] != 1033
    && [v4 type] != 1220
    && [v4 type] != 1218
    && [v4 type] != 1221)
  {
    [v4 type];
  }

  return 0;
}

- (BOOL)_iosEventFilter:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4
    && [v4 type]
    && (AXEventTypeIsVolumeButtonPress([v5 type]) & 1) == 0
    && [v5 senderID] != (id)0x8000000817319375
    && [v5 type] == 3001)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 handInfo]);
    double v7 = (void *)objc_claimAutoreleasedReturnValue([v6 paths]);

    if ([v7 count]) {
      -[XADEventManager performSelectorOnMainThread:withObject:waitUntilDone:]( self,  "performSelectorOnMainThread:withObject:waitUntilDone:",  "_handleIOHIDEvent:",  v5,  0LL);
    }

    BOOL v8 = 1;
  }

  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_stopListening
{
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[XADEventManager _eventProcessor](self, "_eventProcessor"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[XADEventManager _eventProcessor](self, "_eventProcessor"));

  if (v3)
  {
    -[XADEventManager set_eventProcessor:](self, "set_eventProcessor:", 0LL);
    [v4 endHandlingHIDEventsForReason:@"AccessibilityAudit"];
  }
}

- (void)connectionInterrupted
{
}

- (void)deviceDidGetTargeted
{
}

- (void)setSnarfingEvents:(BOOL)a3
{
  self->_snarfingEvents = a3;
  if (a3)
  {
    -[XADEventManager _startListening](self, "_startListening");
  }

  else
  {
    -[XADEventManager _setLockScreenDimTimerEnabled:](self, "_setLockScreenDimTimerEnabled:", 1LL);
    -[XADEventManager _stopListening](self, "_stopListening");
  }

- (void)_startListening
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[XADEventManager _eventProcessor](self, "_eventProcessor"));

  if (!v3)
  {
    id v4 = -[AXEventProcessor initWithHIDTapIdentifier:HIDEventTapPriority:systemEventTapIdentifier:systemEventTapPriority:]( objc_alloc(&OBJC_CLASS___AXEventProcessor),  "initWithHIDTapIdentifier:HIDEventTapPriority:systemEventTapIdentifier:systemEventTapPriority:",  @"AccessibilityAudit",  30LL,  0LL,  30LL);
    -[XADEventManager set_eventProcessor:](self, "set_eventProcessor:", v4);

    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[XADEventManager _eventProcessor](self, "_eventProcessor"));
    [v5 setHIDEventFilterMask:256];

    v10[0] = 0LL;
    v10[1] = v10;
    v10[2] = 0x3032000000LL;
    v10[3] = sub_100002424;
    v10[4] = sub_100002434;
    id v6 = self;
    unsigned int v11 = v6;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_10000243C;
    v9[3] = &unk_1000148B8;
    v9[4] = v10;
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[XADEventManager _eventProcessor](v6, "_eventProcessor"));
    [v7 setHIDEventHandler:v9];

    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[XADEventManager _eventProcessor](v6, "_eventProcessor"));
    [v8 beginHandlingHIDEventsForReason:@"AccessibilityAudit"];

    _Block_object_dispose(v10, 8);
  }

- (void)_registerForNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  if (-[XADEventManager _registeredForNotifications](self, "_registeredForNotifications") != a3)
  {
    -[XADEventManager set_registeredForNotifications:](self, "set_registeredForNotifications:", v3);
    -[XADEventManager _registerForAXNotifications:](self, "_registerForAXNotifications:", v3);
  }

- (BOOL)_initializeAXObserverIfNeeded
{
  if (-[XADEventManager _axEventObserver](self, "_axEventObserver")) {
    goto LABEL_5;
  }
  AXUIElementRegisterSystemWideServerDeathCallback(nullsub_1, self);
  AXUIElementGetPid( (AXUIElementRef)+[AXUIElement systemWideAXUIElement](&OBJC_CLASS___AXUIElement, "systemWideAXUIElement"),  &pid);
  if (!-[XADEventManager _axEventObserver](self, "_axEventObserver"))
  {
    AXObserverRef v7 = 0LL;
    if (AXObserverCreate(pid, (AXObserverCallback)sub_100002560, &v7))
    {
      LOBYTE(RunLoopSource) = 0;
      return (char)RunLoopSource;
    }

    -[XADEventManager set_axEventObserver:](self, "set_axEventObserver:", v7);
  }

  CFRunLoopSourceRef RunLoopSource = AXObserverGetRunLoopSource(-[XADEventManager _axEventObserver](self, "_axEventObserver"));
  if (RunLoopSource)
  {
    id v4 = RunLoopSource;
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, v4, kCFRunLoopDefaultMode);
LABEL_5:
    LOBYTE(RunLoopSource) = 1;
  }

  return (char)RunLoopSource;
}

- (id)_accessibilityNotificationsToObserve
{
  return &off_100015A88;
}

- (void)_registerForAXNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    -[XADEventManager _initializeAXObserverIfNeeded](self, "_initializeAXObserverIfNeeded");
  }
  if (-[XADEventManager _axEventObserver](self, "_axEventObserver"))
  {
    uint64_t v5 = (const __AXUIElement *)+[AXUIElement systemWideAXUIElement](&OBJC_CLASS___AXUIElement, "systemWideAXUIElement");
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v6 = (void *)objc_claimAutoreleasedReturnValue( -[XADEventManager _accessibilityNotificationsToObserve]( self,  "_accessibilityNotificationsToObserve",  0LL));
    id v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          unsigned int v11 = (const __CFString *)[*(id *)(*((void *)&v13 + 1) + 8 * (void)i) intValue];
          id v12 = -[XADEventManager _axEventObserver](self, "_axEventObserver");
          if (v3) {
            AXObserverAddNotification(v12, v5, v11, self);
          }
          else {
            AXObserverRemoveNotification(v12, v5, v11);
          }
        }

        id v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }

      while (v8);
    }
  }

- (void)_handleFocusMovedToElement:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[XADEventManager delegate](self, "delegate"));
  [v5 eventManager:self systemFocusDidMoveToElement:v4];
}

- (void)_handleNativeFocusItemChangedNotification:(__CFData *)a3
{
  if (a3 && (CFTypeID v5 = CFGetTypeID(a3), v5 == AXUIElementGetTypeID())) {
    id v6 = -[AXElement initWithAXUIElement:](objc_alloc(&OBJC_CLASS___AXElement), "initWithAXUIElement:", a3);
  }
  else {
    id v6 = 0LL;
  }
  id v7 = v6;
  -[XADEventManager _handleFocusMovedToElement:](self, "_handleFocusMovedToElement:", v6);
}

- (void)_handleAccessibilityNotification:(int)a3 forElement:(__AXUIElement *)a4
{
  uint64_t v5 = *(void *)&a3;
  id v19 = (id)objc_claimAutoreleasedReturnValue(-[XADEventManager _localizedNotificationString:](self, "_localizedNotificationString:"));
  id v7 = -[AXElement initWithAXUIElement:](objc_alloc(&OBJC_CLASS___AXElement), "initWithAXUIElement:", a4);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[AXElement label](v7, "label"));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[AXElement value](v7, "value"));
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[AXElement hint](v7, "hint"));
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[AXElement uiElement](v7, "uiElement"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectWithAXAttribute:5019]);

  id v13 = sub_100006390(a4, (const __CFString *)0x836);
  __int128 v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSArray, v15);
  if ((objc_opt_isKindOfClass(v14, v16) & 1) != 0 && [v14 count]) {
    double v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "componentsJoinedByString:", @", "));
  }
  else {
    double v17 = 0LL;
  }
  double v18 = (void *)objc_claimAutoreleasedReturnValue(-[XADEventManager delegate](self, "delegate"));
  [v18 eventManager:self notificationReceived:v5 notification:v19 traits:v17 label:v8 value:v9 hint:v10 identifier:v12];
}

- (id)_localizedNotificationString:(int)a3
{
  else {
    return off_1000148D8[a3 - 1000];
  }
}

- (XADEventManagerDelegate)delegate
{
  return (XADEventManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)snarfingEvents
{
  return self->_snarfingEvents;
}

- (BOOL)stopSnarfingOnTouchUp
{
  return self->_stopSnarfingOnTouchUp;
}

- (void)setStopSnarfingOnTouchUp:(BOOL)a3
{
  self->_stopSnarfingOnTouchUp = a3;
}

- (__AXObserver)_axEventObserver
{
  return self->__axEventObserver;
}

- (void)set_axEventObserver:(__AXObserver *)a3
{
  self->__axEventObserver = a3;
}

- (AXEventProcessor)_eventProcessor
{
  return self->__eventProcessor;
}

- (void)set_eventProcessor:(id)a3
{
}

- (BOOL)_registeredForNotifications
{
  return self->__registeredForNotifications;
}

- (void)set_registeredForNotifications:(BOOL)a3
{
  self->__registeredForNotifications = a3;
}

- (BSInvalidatable)_disableIdleTimerAssertion
{
  return self->__disableIdleTimerAssertion;
}

- (void)set_disableIdleTimerAssertion:(id)a3
{
}

- (void).cxx_destruct
{
}

@end