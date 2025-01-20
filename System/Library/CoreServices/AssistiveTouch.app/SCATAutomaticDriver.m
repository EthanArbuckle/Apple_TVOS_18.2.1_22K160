@interface SCATAutomaticDriver
- (AXDispatchTimer)focusTimer;
- (BOOL)_handleRunAction;
- (BOOL)_handleSelectAction;
- (BOOL)_handleStopAction;
- (BOOL)forcePause;
- (BOOL)pauseScanningForPointPickerNumberOfCycles:(unint64_t)a3;
- (BOOL)shouldScanToNextFocusContextAfterSpeaking;
- (SCATAutomaticDriver)initWithDelegate:(id)a3;
- (double)focusInterval;
- (id)description;
- (int)driverType;
- (int64_t)currentCycleCount;
- (unint64_t)maxAutoscanCycles;
- (void)_autoscanToNextFocusContext;
- (void)_didTransitionToPhase:(int)a3;
- (void)_didWrapInDirection:(int64_t)a3;
- (void)_endAutoscanning;
- (void)_idleTimerDidFire;
- (void)_pauseForMaximumNumberOfCycles;
- (void)_willStepToNextFocusContext:(id)a3 inDirection:(int64_t)a4;
- (void)actionHandlerDidCancelPendingAction:(id)a3;
- (void)actionHandlerDidFireAction:(id)a3;
- (void)dealloc;
- (void)outputManager:(id)a3 didSpeakFocusContext:(id)a4;
- (void)pauseAutoscanning;
- (void)resumeAutoscanning:(BOOL)a3;
- (void)setCurrentCycleCount:(int64_t)a3;
- (void)setFocusTimer:(id)a3;
- (void)setForcePause:(BOOL)a3;
- (void)setShouldScanToNextFocusContextAfterSpeaking:(BOOL)a3;
- (void)willDrillIntoGroup;
- (void)willDrillOutOfGroup;
- (void)willFinishAsScannerDriver;
@end

@implementation SCATAutomaticDriver

- (SCATAutomaticDriver)initWithDelegate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SCATAutomaticDriver;
  v3 = -[SCATDriver initWithDelegate:](&v6, "initWithDelegate:", a3);
  if (v3)
  {
    v4 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  &_dispatch_main_q);
    -[AXDispatchTimer setLabel:](v4, "setLabel:", @"FocusTimer");
    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:]( v4,  "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:",  1LL);
    -[SCATAutomaticDriver setFocusTimer:](v3, "setFocusTimer:", v4);
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAutomaticDriver focusTimer](self, "focusTimer"));
  [v3 cancel];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SCATAutomaticDriver;
  -[SCATAutomaticDriver dealloc](&v4, "dealloc");
}

- (id)description
{
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___SCATAutomaticDriver;
  id v3 = -[SCATDriver description](&v12, "description");
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInteger:]( &OBJC_CLASS___NSNumber,  "numberWithInteger:",  -[SCATAutomaticDriver currentCycleCount](self, "currentCycleCount")));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAutomaticDriver focusTimer](self, "focusTimer"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v6 isPending]));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAutomaticDriver focusTimer](self, "focusTimer"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v8 isActive]));
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ cycle:%@ focusTimer:p%@:a%@",  v4,  v5,  v7,  v9));

  return v10;
}

- (void)willFinishAsScannerDriver
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SCATAutomaticDriver;
  -[SCATDriver willFinishAsScannerDriver](&v3, "willFinishAsScannerDriver");
}

- (void)willDrillIntoGroup
{
}

- (void)willDrillOutOfGroup
{
}

- (BOOL)pauseScanningForPointPickerNumberOfCycles:(unint64_t)a3
{
  BOOL v5 = -[SCATDriver _canAutomaticallyPauseScanner](self, "_canAutomaticallyPauseScanner");
  if (v5)
  {
    if (-[SCATAutomaticDriver maxAutoscanCycles](self, "maxAutoscanCycles") <= a3)
    {
      -[SCATAutomaticDriver _pauseForMaximumNumberOfCycles](self, "_pauseForMaximumNumberOfCycles");
      LOBYTE(v5) = 1;
    }

    else
    {
      LOBYTE(v5) = 0;
    }
  }

  return v5;
}

- (int)driverType
{
  return 0;
}

- (double)focusInterval
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  if ([v3 assistiveTouchDelayAfterInputEnabled]
    && (objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver focusContext](self, "focusContext")),
        unsigned int v5 = [v4 isFirstInSequence],
        v4,
        v5))
  {
    [v3 assistiveTouchStepInterval];
    double v7 = v6;
    [v3 assistiveTouchDelayAfterInput];
    double v9 = v7 + v8;
  }

  else
  {
    [v3 assistiveTouchStepInterval];
    double v9 = v10;
  }

  if (v9 < 0.4)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver activeElementManager](self, "activeElementManager"));
    objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v11 numberOfItemsInCurrentScanCycle]);
    v13 = (char *)[v12 unsignedIntegerValue];
  }

  return v9;
}

- (unint64_t)maxAutoscanCycles
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  id v3 = [v2 assistiveTouchScanCycles];

  return (unint64_t)v3;
}

- (void)_didTransitionToPhase:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (a3 == 1)
  {
    -[SCATAutomaticDriver setCurrentCycleCount:](self, "setCurrentCycleCount:", 0LL);
    -[SCATAutomaticDriver _autoscanToNextFocusContext](self, "_autoscanToNextFocusContext");
  }

  else
  {
    -[SCATAutomaticDriver _endAutoscanning](self, "_endAutoscanning");
  }

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___SCATAutomaticDriver;
  -[SCATDriver _didTransitionToPhase:](&v5, "_didTransitionToPhase:", v3);
}

- (void)_autoscanToNextFocusContext
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAutomaticDriver focusTimer](self, "focusTimer"));
  -[SCATAutomaticDriver focusInterval](self, "focusInterval");
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10002EE94;
  v4[3] = &unk_100121D18;
  v4[4] = self;
  objc_msgSend(v3, "afterDelay:processBlock:", v4);
}

- (void)_endAutoscanning
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAutomaticDriver focusTimer](self, "focusTimer"));
  [v3 cancel];

  -[SCATAutomaticDriver setShouldScanToNextFocusContextAfterSpeaking:]( self,  "setShouldScanToNextFocusContextAfterSpeaking:",  0LL);
}

- (void)outputManager:(id)a3 didSpeakFocusContext:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___SCATAutomaticDriver;
  -[SCATDriver outputManager:didSpeakFocusContext:](&v7, "outputManager:didSpeakFocusContext:", a3, a4);
  if (-[SCATAutomaticDriver shouldScanToNextFocusContextAfterSpeaking]( self,  "shouldScanToNextFocusContextAfterSpeaking"))
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATAutomaticDriver focusTimer](self, "focusTimer"));
    unsigned __int8 v6 = [v5 isPending];

    if ((v6 & 1) == 0)
    {
      -[SCATDriver _stepToNextFocusContextInDirection:](self, "_stepToNextFocusContextInDirection:", 0LL);
      -[SCATAutomaticDriver _autoscanToNextFocusContext](self, "_autoscanToNextFocusContext");
    }

    -[SCATAutomaticDriver setShouldScanToNextFocusContextAfterSpeaking:]( self,  "setShouldScanToNextFocusContextAfterSpeaking:",  0LL);
  }

- (BOOL)_handleSelectAction
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SCATAutomaticDriver;
  return -[SCATDriver _handleSelectAction](&v4, "_handleSelectAction");
}

- (BOOL)_handleRunAction
{
  return 1;
}

- (BOOL)_handleStopAction
{
  return 1;
}

- (void)_didWrapInDirection:(int64_t)a3
{
  if (-[SCATDriver lastWrapDirection](self, "lastWrapDirection") == a3) {
    objc_super v5 = (char *)-[SCATAutomaticDriver currentCycleCount](self, "currentCycleCount") + 1;
  }
  else {
    objc_super v5 = 0LL;
  }
  -[SCATAutomaticDriver setCurrentCycleCount:](self, "setCurrentCycleCount:", v5);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SCATAutomaticDriver;
  -[SCATDriver _didWrapInDirection:](&v6, "_didWrapInDirection:", a3);
}

- (void)_idleTimerDidFire
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___SCATAutomaticDriver;
  -[SCATDriver _idleTimerDidFire](&v2, "_idleTimerDidFire");
}

- (void)_willStepToNextFocusContext:(id)a3 inDirection:(int64_t)a4
{
  id v6 = a3;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___SCATAutomaticDriver;
  -[SCATDriver _willStepToNextFocusContext:inDirection:](&v26, "_willStepToNextFocusContext:inDirection:", v6, a4);
  unsigned int v7 = [v6 selectBehavior];
  if (-[SCATDriver _canAutomaticallyPauseScanner](self, "_canAutomaticallyPauseScanner") && v7 != 4)
  {
    double v8 = (void *)objc_claimAutoreleasedReturnValue([v6 element]);
    int v25 = 0;
    double v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver activeElementManager](self, "activeElementManager"));
    double v10 = v9;
    if (a4 == 1)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue([v9 lastElementWithOptions:&v25]);
      unsigned __int8 v12 = [v8 isEqual:v11];

      if ((v12 & 1) == 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue([v8 parentGroup]);
        if (!v13
          || (v14 = v13,
              v15 = (void *)objc_claimAutoreleasedReturnValue([v13 lastChild]),
              unsigned __int8 v16 = [v8 isEqual:v15],
              v15,
              v14,
              (v16 & 1) == 0))
        {
LABEL_13:

          goto LABEL_14;
        }
      }
    }

    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue([v9 firstElementWithOptions:&v25]);
      unsigned __int8 v18 = [v8 isEqual:v17];

      if ((v18 & 1) == 0)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue([v8 parentGroup]);
        if (!v19) {
          goto LABEL_13;
        }
        v20 = v19;
        v21 = (void *)objc_claimAutoreleasedReturnValue([v19 firstChild]);
        unsigned int v22 = [v8 isEqual:v21];

        if (!v22) {
          goto LABEL_13;
        }
      }
    }

    unint64_t v23 = -[SCATAutomaticDriver currentCycleCount](self, "currentCycleCount");
    unint64_t v24 = -[SCATAutomaticDriver maxAutoscanCycles](self, "maxAutoscanCycles");

    if (v23 >= v24) {
      -[SCATAutomaticDriver _pauseForMaximumNumberOfCycles](self, "_pauseForMaximumNumberOfCycles");
    }
  }

- (void)_pauseForMaximumNumberOfCycles
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver activeElementManager](self, "activeElementManager"));
  unsigned int v4 = [v3 isMenuElementManager];

  if (v4)
  {
    objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver activeElementManager](self, "activeElementManager"));
    [v5 closeCurrentScanningContext];

    -[SCATDriver endScanning](self, "endScanning");
  }

  else
  {
    -[SCATDriver pauseScanning](self, "pauseScanning");
  }

- (void)actionHandlerDidFireAction:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SCATAutomaticDriver;
  -[SCATDriver actionHandlerDidFireAction:](&v4, "actionHandlerDidFireAction:", a3);
  -[SCATAutomaticDriver _autoscanToNextFocusContext](self, "_autoscanToNextFocusContext");
}

- (void)actionHandlerDidCancelPendingAction:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SCATAutomaticDriver;
  -[SCATDriver actionHandlerDidCancelPendingAction:](&v4, "actionHandlerDidCancelPendingAction:", a3);
  -[SCATAutomaticDriver _autoscanToNextFocusContext](self, "_autoscanToNextFocusContext");
}

- (void)pauseAutoscanning
{
}

- (void)resumeAutoscanning:(BOOL)a3
{
  BOOL v3 = a3;
  -[SCATAutomaticDriver setForcePause:](self, "setForcePause:", 0LL);
  if (v3) {
    -[SCATAutomaticDriver _autoscanToNextFocusContext](self, "_autoscanToNextFocusContext");
  }
}

- (AXDispatchTimer)focusTimer
{
  return self->_focusTimer;
}

- (void)setFocusTimer:(id)a3
{
}

- (int64_t)currentCycleCount
{
  return self->_currentCycleCount;
}

- (void)setCurrentCycleCount:(int64_t)a3
{
  self->_currentCycleCount = a3;
}

- (BOOL)forcePause
{
  return self->_forcePause;
}

- (void)setForcePause:(BOOL)a3
{
  self->_forcePause = a3;
}

- (BOOL)shouldScanToNextFocusContextAfterSpeaking
{
  return self->_shouldScanToNextFocusContextAfterSpeaking;
}

- (void)setShouldScanToNextFocusContextAfterSpeaking:(BOOL)a3
{
  self->_shouldScanToNextFocusContextAfterSpeaking = a3;
}

- (void).cxx_destruct
{
}

@end