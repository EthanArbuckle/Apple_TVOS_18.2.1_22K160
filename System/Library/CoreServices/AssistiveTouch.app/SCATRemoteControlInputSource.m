@interface SCATRemoteControlInputSource
- (AXEventProcessor)eventProcessor;
- (BOOL)_handleAXEvent:(id)a3;
- (BOOL)_handleRemoteControlEvent:(int64_t)a3;
- (SCATRemoteControlInputSource)init;
- (void)_didReceiveActionWithIdentifier:(id)a3 start:(BOOL)a4 ignoreInputHold:(BOOL)a5;
- (void)_startRemoteControlEventProcessor;
- (void)_stopRemoteControlEventProcessor;
- (void)dealloc;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setEventProcessor:(id)a3;
- (void)startRunning;
- (void)stopRunning;
@end

@implementation SCATRemoteControlInputSource

- (SCATRemoteControlInputSource)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SCATRemoteControlInputSource;
  v2 = -[SCATInputSource init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[SCATRemoteControlInputSource _startRemoteControlEventProcessor](v2, "_startRemoteControlEventProcessor");
  }
  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SCATRemoteControlInputSource;
  -[SCATRemoteControlInputSource dealloc](&v3, "dealloc");
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SCATRemoteControlInputSource;
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

- (void)_startRemoteControlEventProcessor
{
  objc_super v3 = -[AXEventProcessor initWithHIDTapIdentifier:HIDEventTapPriority:systemEventTapIdentifier:systemEventTapPriority:]( objc_alloc(&OBJC_CLASS___AXEventProcessor),  "initWithHIDTapIdentifier:HIDEventTapPriority:systemEventTapIdentifier:systemEventTapPriority:",  @"Switch Control - Remote Control",  25LL,  0LL,  25LL);
  -[SCATRemoteControlInputSource setEventProcessor:](self, "setEventProcessor:", v3);

  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATRemoteControlInputSource eventProcessor](self, "eventProcessor"));
  [v4 setHIDEventFilterMask:32];

  objc_initWeak(&location, self);
  objc_copyWeak(&v8, &location);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue( -[SCATRemoteControlInputSource eventProcessor]( self,  "eventProcessor",  _NSConcreteStackBlock,  3221225472LL,  sub_1000637D8,  &unk_100123BE8));
  [v5 setHIDEventHandler:&v7];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATRemoteControlInputSource eventProcessor](self, "eventProcessor"));
  [v6 beginHandlingHIDEventsForReason:@"Switch Control Remote Control Event Handler"];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_stopRemoteControlEventProcessor
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATRemoteControlInputSource eventProcessor](self, "eventProcessor"));
  [v3 endHandlingHIDEventsForReason:@"Switch Control Remote Control Event Handler"];

  -[SCATRemoteControlInputSource setEventProcessor:](self, "setEventProcessor:", 0LL);
}

- (BOOL)_handleAXEvent:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([a3 accessibilityData]);
  if ([v4 page] == (id)6) {
    BOOL v5 = -[SCATRemoteControlInputSource _handleRemoteControlEvent:]( self,  "_handleRemoteControlEvent:",  [v4 usage]);
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_handleRemoteControlEvent:(int64_t)a3
{
  uint64_t v5 = AXParameterizedLocalizedString(2LL, @"SWITCH_SOURCE_REMOTE_CONTROL");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100063994;
  v8[3] = &unk_100123C10;
  v8[4] = self;
  v9 = @"SWITCH_SOURCE_REMOTE_CONTROL";
  id v10 = (id)objc_claimAutoreleasedReturnValue(v5);
  int64_t v11 = a3;
  id v6 = v10;
  AXPerformBlockOnMainThread(v8);

  return 1;
}

- (void)_didReceiveActionWithIdentifier:(id)a3 start:(BOOL)a4 ignoreInputHold:(BOOL)a5
{
  id v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource delegate](self, "delegate"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource queue](self, "queue"));
  if (v10
    && (objc_opt_respondsToSelector( v9,  "remoteControlInputSource:didReceiveActionWithIdentifier:start:ignoreInputHold:") & 1) != 0)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_100063AF8;
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