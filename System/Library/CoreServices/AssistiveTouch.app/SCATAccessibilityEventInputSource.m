@interface SCATAccessibilityEventInputSource
- (AXEventProcessor)eventProcessor;
- (BOOL)_handleAccessibilityEvent:(id)a3;
- (BOOL)_handleAutomationEvent:(int64_t)a3;
- (BOOL)_handleHandGestureEvent:(int64_t)a3;
- (SCATAccessibilityEventInputSource)init;
- (id)_actionIdentifierForSwitch:(id)a3;
- (id)_axSwitchForAccessibilitySwitchSource:(id)a3 eventUsagePage:(int64_t)a4 eventUsage:(int64_t)a5;
- (void)_didReceiveActionWithIdentifier:(id)a3 start:(BOOL)a4 ignoreInputHold:(BOOL)a5;
- (void)_setupLogging;
- (void)_startAccessibilityEventProcessor;
- (void)_stopAccessibilityEventProcessor;
- (void)dealloc;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setEventProcessor:(id)a3;
- (void)startRunning;
- (void)stopRunning;
- (void)updateWithSwitches:(id)a3 recipe:(id)a4;
@end

@implementation SCATAccessibilityEventInputSource

- (SCATAccessibilityEventInputSource)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SCATAccessibilityEventInputSource;
  v2 = -[SCATInputSource init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    -[SCATAccessibilityEventInputSource _startAccessibilityEventProcessor](v2, "_startAccessibilityEventProcessor");
    -[SCATAccessibilityEventInputSource _setupLogging](v3, "_setupLogging");
  }

  return v3;
}

- (void)_setupLogging
{
  dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_DEFAULT, 0);
  v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
  objc_super v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.accessibility.scat.voice_triggers.analytics", v4);
  analyticsQueue = self->_analyticsQueue;
  self->_analyticsQueue = v5;

  self->_analyticsTracker = 0LL;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000688B0;
  v9[3] = &unk_100123C38;
  objc_copyWeak(&v10, &location);
  v7 = (NSTimer *)objc_claimAutoreleasedReturnValue( +[NSTimer timerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "timerWithTimeInterval:repeats:block:",  1LL,  v9,  86400.0));
  analyticsTimer = self->_analyticsTimer;
  self->_analyticsTimer = v7;

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_startAccessibilityEventProcessor
{
  dispatch_queue_attr_t v3 = -[AXEventProcessor initWithHIDTapIdentifier:HIDEventTapPriority:systemEventTapIdentifier:systemEventTapPriority:]( objc_alloc(&OBJC_CLASS___AXEventProcessor),  "initWithHIDTapIdentifier:HIDEventTapPriority:systemEventTapIdentifier:systemEventTapPriority:",  @"Switch Control",  25LL,  0LL,  25LL);
  -[SCATAccessibilityEventInputSource setEventProcessor:](self, "setEventProcessor:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAccessibilityEventInputSource eventProcessor](self, "eventProcessor"));
  [v4 setHIDEventFilterMask:32];

  objc_initWeak(&location, self);
  objc_copyWeak(&v8, &location);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( -[SCATAccessibilityEventInputSource eventProcessor]( self,  "eventProcessor",  _NSConcreteStackBlock,  3221225472LL,  sub_100068AAC,  &unk_100123BE8));
  [v5 setHIDEventHandler:&v7];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAccessibilityEventInputSource eventProcessor](self, "eventProcessor"));
  [v6 beginHandlingHIDEventsForReason:@"Switch Control Accessibility Event Handler"];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_stopAccessibilityEventProcessor
{
  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAccessibilityEventInputSource eventProcessor](self, "eventProcessor"));
  [v3 endHandlingHIDEventsForReason:@"Switch Control Accessibility Event Handler"];

  -[SCATAccessibilityEventInputSource setEventProcessor:](self, "setEventProcessor:", 0LL);
}

- (BOOL)_handleAccessibilityEvent:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 accessibilityData]);
  if ([v4 page] == (id)5)
  {
    unsigned __int8 v5 = -[SCATAccessibilityEventInputSource _handleAutomationEvent:]( self,  "_handleAutomationEvent:",  [v4 usage]);
  }

  else
  {
    if ([v4 page] != (id)2)
    {
      BOOL v6 = 0;
      goto LABEL_7;
    }

    unsigned __int8 v5 = -[SCATAccessibilityEventInputSource _handleHandGestureEvent:]( self,  "_handleHandGestureEvent:",  [v4 usage]);
  }

  BOOL v6 = v5;
LABEL_7:

  return v6;
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SCATAccessibilityEventInputSource;
  -[SCATInputSource setDelegate:queue:](&v4, "setDelegate:queue:", a3, a4);
}

- (void)startRunning
{
  if (!-[SCATInputSource isRunning](self, "isRunning")) {
    -[SCATInputSource setRunning:](self, "setRunning:", 1LL);
  }
}

- (void)stopRunning
{
  if (-[SCATInputSource isRunning](self, "isRunning")) {
    -[SCATInputSource setRunning:](self, "setRunning:", 0LL);
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SCATAccessibilityEventInputSource;
  -[SCATAccessibilityEventInputSource dealloc](&v3, "dealloc");
}

- (void)_didReceiveActionWithIdentifier:(id)a3 start:(BOOL)a4 ignoreInputHold:(BOOL)a5
{
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource delegate](self, "delegate"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource queue](self, "queue"));
  if (v10
    && (objc_opt_respondsToSelector( v9,  "accessibilityEventInputSource:didReceiveActionWithIdentifier:start:ignoreInputHold:") & 1) != 0)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100068DE0;
    v12[3] = &unk_100123840;
    id v13 = v9;
    v14 = self;
    id v11 = v8;
    id v15 = v11;
    BOOL v16 = a4;
    BOOL v17 = a5;
    [v10 performAsynchronousWritingBlock:v12];
    HNDTestingSetLastFiredAction(v11);
  }
}

- (id)_actionIdentifierForSwitch:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource actions](self, "actions"));
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKeyedSubscript:v6]);

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource actions](self, "actions"));
    v9 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKeyedSubscript:v9]);
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue( +[SCATActionItem fromSwitch:longPress:]( &OBJC_CLASS___SCATActionItem,  "fromSwitch:longPress:",  v4,  0LL));
  }

  return v10;
}

- (id)_axSwitchForAccessibilitySwitchSource:(id)a3 eventUsagePage:(int64_t)a4 eventUsage:(int64_t)a5
{
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue([v8 assistiveTouchSwitches]);

  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  id v10 = v9;
  id v11 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v21;
    do
    {
      for (i = 0LL; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v21 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "source", (void)v20));
        if ([v16 isEqualToString:v7]
          && [v15 accessibilityEventUsagePage] == (id)a4)
        {
          id v17 = [v15 accessibilityEventUsage];

          if (v17 == (id)a5)
          {
            id v18 = v15;
            goto LABEL_14;
          }
        }

        else
        {
        }
      }

      id v12 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }

    while (v12);
  }

  id v18 = 0LL;
LABEL_14:

  return v18;
}

- (BOOL)_handleAutomationEvent:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[SCATAccessibilityEventInputSource _axSwitchForAccessibilitySwitchSource:eventUsagePage:eventUsage:]( self,  "_axSwitchForAccessibilitySwitchSource:eventUsagePage:eventUsage:",  SCATSwitchSourceAutomation,  5LL,  a3));
  if (v4)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100069130;
    v7[3] = &unk_1001220B8;
    v7[4] = self;
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[SCATAccessibilityEventInputSource _actionIdentifierForSwitch:](self, "_actionIdentifierForSwitch:", v4));
    id v9 = v4;
    id v5 = v8;
    AXPerformBlockOnMainThread(v7);
  }

  return v4 != 0LL;
}

- (BOOL)_handleHandGestureEvent:(int64_t)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[SCATAccessibilityEventInputSource _axSwitchForAccessibilitySwitchSource:eventUsagePage:eventUsage:]( self,  "_axSwitchForAccessibilitySwitchSource:eventUsagePage:eventUsage:",  SCATSwitchSourceHandGestures,  2LL,  a3));
  if (v4)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_1000692C4;
    v7[3] = &unk_1001220B8;
    v7[4] = self;
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[SCATAccessibilityEventInputSource _actionIdentifierForSwitch:](self, "_actionIdentifierForSwitch:", v4));
    id v9 = v4;
    id v5 = v8;
    AXPerformBlockOnMainThread(v7);
  }

  return v4 != 0LL;
}

- (void)updateWithSwitches:(id)a3 recipe:(id)a4
{
  id v6 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SCATAccessibilityEventInputSource;
  id v7 = a3;
  -[SCATInputSource updateWithSwitches:recipe:](&v16, "updateWithSwitches:recipe:", v7, v6);
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472LL;
  id v12 = sub_100069478;
  uint64_t v13 = &unk_100123C60;
  id v14 = v6;
  id v15 = -[NSMutableDictionary initWithCapacity:]( objc_alloc(&OBJC_CLASS___NSMutableDictionary),  "initWithCapacity:",  2LL);
  id v8 = v15;
  id v9 = v6;
  [v7 enumerateObjectsUsingBlock:&v10];

  -[SCATInputSource setActions:](self, "setActions:", v8, v10, v11, v12, v13);
}

- (AXEventProcessor)eventProcessor
{
  return self->_eventProcessor;
}

- (void)setEventProcessor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end