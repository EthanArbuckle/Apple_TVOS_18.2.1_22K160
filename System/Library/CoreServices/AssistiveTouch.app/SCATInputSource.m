@interface SCATInputSource
- (AXAccessQueue)queue;
- (AXDispatchTimer)longPressTimer;
- (BOOL)inputHoldEnabled;
- (BOOL)isRunning;
- (BOOL)longPressEnabled;
- (NSDictionary)actions;
- (SCATInputSource)init;
- (SCATInputSourceDelegate)delegate;
- (double)buttonDownStartTime;
- (double)inputHoldDuration;
- (double)longPressDuration;
- (double)totalLongPressDuration;
- (id)_interDeviceActionForIdentifier:(id)a3;
- (id)_switchEventWithAction:(id)a3 longPressAction:(id)a4 start:(BOOL)a5 switchIdentifier:(id)a6 switchDisplayName:(id)a7;
- (id)fallbackActionBlock;
- (int64_t)_identifierForInterDeviceAction:(id)a3;
- (int64_t)longPressActionIdentifier;
- (void)_clearActions;
- (void)_handleAction:(id)a3 longPressAction:(id)a4 start:(BOOL)a5 switchIdentifier:(id)a6 switchDisplayName:(id)a7;
- (void)_handleInterDeviceBailOut;
- (void)beginSimulatedLongPressForInputSource:(id)a3;
- (void)endSimulatedLongPressForInputSource:(id)a3;
- (void)setActions:(id)a3;
- (void)setButtonDownStartTime:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegate:(id)a3 queue:(id)a4;
- (void)setFallbackActionBlock:(id)a3;
- (void)setLongPressActionIdentifier:(int64_t)a3;
- (void)setLongPressTimer:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)updateWithSwitches:(id)a3 recipe:(id)a4;
@end

@implementation SCATInputSource

- (SCATInputSource)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___SCATInputSource;
  v2 = -[SCATInputSource init](&v8, "init");
  v3 = v2;
  if (v2)
  {
    -[SCATInputSource setLongPressActionIdentifier:](v2, "setLongPressActionIdentifier:", 0LL);
    -[SCATInputSource setButtonDownStartTime:](v3, "setButtonDownStartTime:", -9.22337204e18);
    v4 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  &_dispatch_main_q);
    -[SCATInputSource setLongPressTimer:](v3, "setLongPressTimer:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource longPressTimer](v3, "longPressTimer"));
    [v5 setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:1];

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource longPressTimer](v3, "longPressTimer"));
    [v6 setLabel:@"input long press timer"];
  }

  return v3;
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v6)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue(+[AXAccessQueue mainAccessQueue](&OBJC_CLASS___AXAccessQueue, "mainAccessQueue"));

    if (v8 != v6) {
      *(void *)&double v7 = _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATInputSource.m",  62LL,  "-[SCATInputSource setDelegate:queue:]",  @"We used to handle input on different threads but that was a problem for latency, so now we only support using the main thread.").n128_u64[0];
    }
  }

  -[SCATInputSource setDelegate:](self, "setDelegate:", v9, v7);
  -[SCATInputSource setQueue:](self, "setQueue:", v6);
}

- (void)_clearActions
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource actions](self, "actions"));
  objc_opt_class(&OBJC_CLASS___NSMutableDictionary, v4);
  char isKindOfClass = objc_opt_isKindOfClass(v3, v5);

  if ((isKindOfClass & 1) != 0)
  {
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource actions](self, "actions"));
    [v7 removeAllObjects];
  }

  -[SCATInputSource setActions:](self, "setActions:", 0LL);
  -[SCATInputSource setLongPressActionIdentifier:](self, "setLongPressActionIdentifier:", 0LL);
  -[SCATInputSource setFallbackActionBlock:](self, "setFallbackActionBlock:", 0LL);
}

- (BOOL)longPressEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned __int8 v3 = [v2 assistiveTouchLongPressEnabled];

  return v3;
}

- (double)longPressDuration
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v2 assistiveTouchLongPressDuration];
  double v4 = v3;

  return v4;
}

- (BOOL)inputHoldEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned __int8 v3 = [v2 assistiveTouchInputHoldEnabled];

  return v3;
}

- (double)inputHoldDuration
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v2 assistiveTouchInputHoldDuration];
  double v4 = v3;

  return v4;
}

- (double)totalLongPressDuration
{
  double v3 = 0.0;
  if (-[SCATInputSource inputHoldEnabled](self, "inputHoldEnabled"))
  {
    -[SCATInputSource inputHoldDuration](self, "inputHoldDuration");
    double v3 = v4;
  }

  -[SCATInputSource longPressDuration](self, "longPressDuration");
  return v3 + v5;
}

- (id)_interDeviceActionForIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v4 = (uint64_t)[v3 action];
  double v5 = 0LL;
  if (v4 <= 199)
  {
    switch(v4)
    {
      case 'd':
        id v6 = (id *)&AXSSSwitchActionActivate;
        goto LABEL_34;
      case 'e':
        id v6 = (id *)&AXSSSwitchActionMenu;
        goto LABEL_34;
      case 'f':
        id v6 = (id *)&AXSSSwitchActionRun;
        goto LABEL_34;
      case 'g':
        id v6 = (id *)&AXSSSwitchActionSelect;
        goto LABEL_34;
      case 'h':
        id v6 = (id *)&AXSSSwitchActionMoveToNextItem;
        goto LABEL_34;
      case 'i':
        id v6 = (id *)&AXSSSwitchActionMoveToPreviousItem;
        goto LABEL_34;
      case 'j':
        id v6 = (id *)&AXSSSwitchActionStop;
        goto LABEL_34;
      case 'k':
        id v6 = (id *)&AXSSSwitchActionSiriShortcutsMenu;
LABEL_34:
        double v5 = (__CFString *)*v6;
        break;
      case 'l':
        break;
      case 'm':
        double v5 = @"selectandresumeautoscanning";
        break;
      default:
        if (!v4)
        {
          id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( NSNumber,  "numberWithInteger:",  [v3 action]));
          char v8 = 1;
          _AXLogWithFacility(0LL, 0LL, 1LL, 0LL, 0LL, 0LL, 0LL, 0LL, 0.0, v8, @"unhandled action: %@");

          double v5 = 0LL;
        }

        break;
    }
  }

  else
  {
    switch(v4)
    {
      case 200LL:
        id v6 = (id *)&AXSSSwitchActionAppSwitcher;
        goto LABEL_34;
      case 201LL:
        id v6 = (id *)&AXSSSwitchActionHome;
        goto LABEL_34;
      case 202LL:
        id v6 = (id *)&AXSSSwitchActionNotificationCenter;
        goto LABEL_34;
      case 203LL:
        id v6 = (id *)&AXSSSwitchActionSiri;
        goto LABEL_34;
      case 204LL:
        id v6 = (id *)&AXSSSwitchActionVolumeDown;
        goto LABEL_34;
      case 205LL:
        id v6 = (id *)&AXSSSwitchActionVolumeUp;
        goto LABEL_34;
      case 206LL:
        id v6 = (id *)&AXSSSwitchActionForceTouch;
        goto LABEL_34;
      case 207LL:
        id v6 = (id *)&AXSSSwitchActionDictation;
        goto LABEL_34;
      case 208LL:
        id v6 = (id *)&AXSSSwitchActionTripleClick;
        goto LABEL_34;
      case 209LL:
        id v6 = (id *)&AXSSSwitchActionControlCenter;
        goto LABEL_34;
      default:
        switch(v4)
        {
          case 300LL:
            id v6 = (id *)&AXSSSwitchActionATVSelect;
            goto LABEL_34;
          case 301LL:
            id v6 = (id *)&AXSSSwitchActionATVMenu;
            goto LABEL_34;
          case 302LL:
            id v6 = (id *)&AXSSSwitchActionATVHome;
            goto LABEL_34;
          case 303LL:
            id v6 = (id *)&AXSSSwitchActionATVPlayPause;
            goto LABEL_34;
          case 304LL:
            id v6 = (id *)&AXSSSwitchActionATVArrowUp;
            goto LABEL_34;
          case 305LL:
            id v6 = (id *)&AXSSSwitchActionATVArrowDown;
            goto LABEL_34;
          case 306LL:
            id v6 = (id *)&AXSSSwitchActionATVArrowLeft;
            goto LABEL_34;
          case 307LL:
            id v6 = (id *)&AXSSSwitchActionATVArrowRight;
            goto LABEL_34;
          default:
            goto LABEL_35;
        }
    }
  }

- (int64_t)_identifierForInterDeviceAction:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:AXSSSwitchActionRun])
  {
    int64_t v4 = 102LL;
  }

  else if ([v3 isEqualToString:AXSSSwitchActionStop])
  {
    int64_t v4 = 106LL;
  }

  else if ([v3 isEqualToString:AXSSSwitchActionSelect])
  {
    int64_t v4 = 103LL;
  }

  else if ([v3 isEqualToString:@"selectandresumeautoscanning"])
  {
    int64_t v4 = 109LL;
  }

  else if ([v3 isEqualToString:AXSSSwitchActionMoveToNextItem])
  {
    int64_t v4 = 104LL;
  }

  else if ([v3 isEqualToString:AXSSSwitchActionMoveToPreviousItem])
  {
    int64_t v4 = 105LL;
  }

  else if ([v3 isEqualToString:AXSSSwitchActionActivate])
  {
    int64_t v4 = 100LL;
  }

  else if ([v3 isEqualToString:AXSSSwitchActionMenu])
  {
    int64_t v4 = 101LL;
  }

  else if ([v3 isEqualToString:AXSSSwitchActionAppSwitcher])
  {
    int64_t v4 = 200LL;
  }

  else if ([v3 isEqualToString:AXSSSwitchActionHome])
  {
    int64_t v4 = 201LL;
  }

  else if ([v3 isEqualToString:AXSSSwitchActionSiri])
  {
    int64_t v4 = 203LL;
  }

  else if ([v3 isEqualToString:AXSSSwitchActionVolumeDown])
  {
    int64_t v4 = 204LL;
  }

  else if ([v3 isEqualToString:AXSSSwitchActionVolumeUp])
  {
    int64_t v4 = 205LL;
  }

  else if ([v3 isEqualToString:AXSSSwitchActionForceTouch])
  {
    int64_t v4 = 206LL;
  }

  else if ([v3 isEqualToString:AXSSSwitchActionDictation])
  {
    int64_t v4 = 207LL;
  }

  else if ([v3 isEqualToString:AXSSSwitchActionTripleClick])
  {
    int64_t v4 = 208LL;
  }

  else if ([v3 isEqualToString:AXSSSwitchActionControlCenter])
  {
    int64_t v4 = 209LL;
  }

  else if ([v3 isEqualToString:AXSSSwitchActionATVSelect])
  {
    int64_t v4 = 300LL;
  }

  else if ([v3 isEqualToString:AXSSSwitchActionATVMenu])
  {
    int64_t v4 = 301LL;
  }

  else if ([v3 isEqualToString:AXSSSwitchActionATVHome])
  {
    int64_t v4 = 302LL;
  }

  else if ([v3 isEqualToString:AXSSSwitchActionATVPlayPause])
  {
    int64_t v4 = 303LL;
  }

  else if ([v3 isEqualToString:AXSSSwitchActionATVArrowUp])
  {
    int64_t v4 = 304LL;
  }

  else if ([v3 isEqualToString:AXSSSwitchActionATVArrowDown])
  {
    int64_t v4 = 305LL;
  }

  else if ([v3 isEqualToString:AXSSSwitchActionATVArrowLeft])
  {
    int64_t v4 = 306LL;
  }

  else if ([v3 isEqualToString:AXSSSwitchActionATVArrowRight])
  {
    int64_t v4 = 307LL;
  }

  else
  {
    int64_t v4 = 0LL;
  }

  return v4;
}

- (id)_switchEventWithAction:(id)a3 longPressAction:(id)a4 start:(BOOL)a5 switchIdentifier:(id)a6 switchDisplayName:(id)a7
{
  BOOL v8 = a5;
  id v12 = a7;
  id v13 = a6;
  id v14 = a4;
  uint64_t v15 = objc_claimAutoreleasedReturnValue(-[SCATInputSource _interDeviceActionForIdentifier:](self, "_interDeviceActionForIdentifier:", a3));
  v16 = (void *)v15;
  if (v15)
  {
    uint64_t v25 = v15;
    v17 = &v25;
  }

  else
  {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATInputSource.m",  336LL,  "-[SCATInputSource _switchEventWithAction:longPressAction:start:switchIdentifier:switchDisplayName:]",  @"Should always have had a default action for a switch");
    uint64_t v26 = AXSSSwitchActionSelect;
    v17 = &v26;
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v17, 1LL));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource _interDeviceActionForIdentifier:](self, "_interDeviceActionForIdentifier:", v14));

  if (v19)
  {
    v24 = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v24, 1LL));
  }

  else
  {
    v20 = 0LL;
  }

  if (qword_100157758 != -1) {
    dispatch_once(&qword_100157758, &stru_1001246F8);
  }
  id v21 = objc_alloc(&OBJC_CLASS___AXSSInterDeviceSwitchEvent);
  id v22 = [v21 initWithSwitchIdentifier:v13 switchDisplayName:v12 deviceIdentifier:qword_100157750 actions:v18 longPressActions:v20 isDown:v8];

  return v22;
}

- (void)_handleInterDeviceBailOut
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[SCATInputSource delegate](self, "delegate"));
  [v3 handleInterDeviceBailOutForInputSource:self];
}

- (void)_handleAction:(id)a3 longPressAction:(id)a4 start:(BOOL)a5 switchIdentifier:(id)a6 switchDisplayName:(id)a7
{
  BOOL v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_handleInterDeviceBailOut",  0LL);
  if (!+[NSThread isMainThread](&OBJC_CLASS___NSThread, "isMainThread")) {
    *(void *)&double v16 = _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATInputSource.m",  381LL,  "-[SCATInputSource _handleAction:longPressAction:start:switchIdentifier:switchDisplayName:]",  @"All input stuff should be main threaded.").n128_u64[0];
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource queue](self, "queue", v16));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[AXAccessQueue mainAccessQueue](&OBJC_CLASS___AXAccessQueue, "mainAccessQueue"));

  if (v17 != v18) {
    *(void *)&double v19 = _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATInputSource.m",  382LL,  "-[SCATInputSource _handleAction:longPressAction:start:switchIdentifier:switchDisplayName:]",  @"All input stuff should be main threaded.").n128_u64[0];
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource delegate](self, "delegate", v19));
  unsigned int v21 = [v20 shouldForwardSwitchEventsForInputSource:self];

  if (!v21)
  {
    if (v9)
    {
      unsigned int v24 = -[SCATInputSource longPressEnabled](self, "longPressEnabled");
      -[SCATInputSource setButtonDownStartTime:](self, "setButtonDownStartTime:", CFAbsoluteTimeGetCurrent());
      if (v24 && [v13 action])
      {
        uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource delegate](self, "delegate"));
        [v25 didBeginLongPressForInputSource:self];

        objc_initWeak(&location, self);
        v45[0] = _NSConcreteStackBlock;
        v45[1] = 3221225472LL;
        v45[2] = sub_10008BC60;
        v45[3] = &unk_100122120;
        objc_copyWeak(&v47, &location);
        id v46 = v12;
        -[SCATInputSource setFallbackActionBlock:](self, "setFallbackActionBlock:", v45);
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource longPressTimer](self, "longPressTimer"));
        -[SCATInputSource totalLongPressDuration](self, "totalLongPressDuration");
        double v28 = v27;
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472LL;
        v42[2] = sub_10008BCA4;
        v42[3] = &unk_100122120;
        objc_copyWeak(&v44, &location);
        id v43 = v13;
        [v26 afterDelay:v42 processBlock:v28];

        objc_destroyWeak(&v44);
        objc_destroyWeak(&v47);
        objc_destroyWeak(&location);
        goto LABEL_24;
      }

      v39 = self;
      id v40 = v12;
      uint64_t v41 = 1LL;
    }

    else
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource longPressTimer](self, "longPressTimer"));
      unsigned int v30 = [v29 isPending];

      if (v30)
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource delegate](self, "delegate"));
        [v31 didEndLongPressForInputSource:self];

        v32 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource longPressTimer](self, "longPressTimer"));
        [v32 cancel];
      }

      double Current = CFAbsoluteTimeGetCurrent();
      -[SCATInputSource buttonDownStartTime](self, "buttonDownStartTime");
      double v35 = v34;
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource fallbackActionBlock](self, "fallbackActionBlock"));

      if (v36)
      {
        -[SCATInputSource inputHoldDuration](self, "inputHoldDuration");
        if (Current - v35 >= v37 || !-[SCATInputSource inputHoldEnabled](self, "inputHoldEnabled"))
        {
          v38 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[SCATInputSource fallbackActionBlock](self, "fallbackActionBlock"));
          v38[2]();
        }

        -[SCATInputSource setFallbackActionBlock:](self, "setFallbackActionBlock:", 0LL);
      }

      v39 = self;
      id v40 = v12;
      uint64_t v41 = 0LL;
    }

    -[SCATInputSource _didReceiveActionWithIdentifier:start:ignoreInputHold:]( v39,  "_didReceiveActionWithIdentifier:start:ignoreInputHold:",  v40,  v41,  0LL);
    goto LABEL_24;
  }

  if (v9) {
    -[SCATInputSource performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_handleInterDeviceBailOut",  0LL,  10.0);
  }
  if ([v12 action])
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[SCATInputSource delegate](self, "delegate"));
    v23 = (void *)objc_claimAutoreleasedReturnValue( -[SCATInputSource _switchEventWithAction:longPressAction:start:switchIdentifier:switchDisplayName:]( self,  "_switchEventWithAction:longPressAction:start:switchIdentifier:switchDisplayName:",  v12,  v13,  v9,  v14,  v15));
    [v22 inputSource:self forwardSwitchEvent:v23];
  }

- (void)updateWithSwitches:(id)a3 recipe:(id)a4
{
}

- (void)beginSimulatedLongPressForInputSource:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SCATInputSource delegate](self, "delegate"));
  [v5 didBeginLongPressForInputSource:v4];
}

- (void)endSimulatedLongPressForInputSource:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[SCATInputSource delegate](self, "delegate"));
  [v5 didEndLongPressForInputSource:v4];
}

- (NSDictionary)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (BOOL)isRunning
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (id)fallbackActionBlock
{
  return self->_fallbackActionBlock;
}

- (void)setFallbackActionBlock:(id)a3
{
}

- (AXDispatchTimer)longPressTimer
{
  return self->_longPressTimer;
}

- (void)setLongPressTimer:(id)a3
{
}

- (int64_t)longPressActionIdentifier
{
  return self->_longPressActionIdentifier;
}

- (void)setLongPressActionIdentifier:(int64_t)a3
{
  self->_longPressActionIdentifier = a3;
}

- (double)buttonDownStartTime
{
  return self->_buttonDownStartTime;
}

- (void)setButtonDownStartTime:(double)a3
{
  self->_buttonDownStartTime = a3;
}

- (SCATInputSourceDelegate)delegate
{
  return (SCATInputSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (AXAccessQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

@end