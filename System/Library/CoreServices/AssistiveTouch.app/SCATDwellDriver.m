@interface SCATDwellDriver
- (BOOL)_actuallyHandleSelectAction;
- (BOOL)_handleStepAction:(int64_t)a3;
- (BOOL)_handleStepNextAction;
- (BOOL)_handleStepPreviousAction;
- (BOOL)_shouldUseDwellSelection;
- (BOOL)_shouldUseScanAbortTimer;
- (BOOL)handleInputAction:(id)a3;
- (BOOL)isReadyForSelect;
- (double)dwellDelay;
- (int)driverType;
- (void)_cancelDwellRelatedTimers;
- (void)_didTransitionToPhase:(int)a3;
- (void)_dwellTimerFired;
- (void)_idleTimerDidFire;
- (void)_resetDwellTimer;
- (void)_scanAbortTimerFired;
- (void)_startDwellTimer;
- (void)_startScanAbortTimer;
- (void)outputManager:(id)a3 didSpeakFocusContext:(id)a4;
- (void)setIsReadyForSelect:(BOOL)a3;
@end

@implementation SCATDwellDriver

- (int)driverType
{
  return 2;
}

- (BOOL)handleInputAction:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SCATDwellDriver;
  BOOL v4 = -[SCATDriver handleInputAction:](&v6, "handleInputAction:", a3);
  -[SCATDwellDriver _resetDwellTimer](self, "_resetDwellTimer");
  return v4;
}

- (BOOL)_actuallyHandleSelectAction
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___SCATDwellDriver;
  return -[SCATDriver _handleSelectAction](&v3, "_handleSelectAction");
}

- (BOOL)_handleStepAction:(int64_t)a3
{
  if (-[SCATDwellDriver isReadyForSelect](self, "isReadyForSelect")) {
    -[SCATDwellDriver _actuallyHandleSelectAction](self, "_actuallyHandleSelectAction");
  }
  else {
    -[SCATDriver _stepToNextFocusContextInDirection:](self, "_stepToNextFocusContextInDirection:", a3);
  }
  return 1;
}

- (BOOL)_handleStepNextAction
{
  if (-[SCATDwellDriver _shouldUseDwellSelection](self, "_shouldUseDwellSelection")) {
    return -[SCATDwellDriver _handleStepAction:](self, "_handleStepAction:", 0LL);
  }
  else {
    return -[SCATDwellDriver _actuallyHandleSelectAction](self, "_actuallyHandleSelectAction");
  }
}

- (BOOL)_handleStepPreviousAction
{
  if (-[SCATDwellDriver _shouldUseDwellSelection](self, "_shouldUseDwellSelection")) {
    return -[SCATDwellDriver _handleStepAction:](self, "_handleStepAction:", 1LL);
  }
  else {
    return -[SCATDwellDriver _actuallyHandleSelectAction](self, "_actuallyHandleSelectAction");
  }
}

- (BOOL)_shouldUseDwellSelection
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver activeElementManager](self, "activeElementManager"));
  unsigned __int8 v3 = [v2 allowsDwellSelection];

  return v3;
}

- (BOOL)_shouldUseScanAbortTimer
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver focusContext](self, "focusContext"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 element]);

  objc_opt_class(&OBJC_CLASS___SCATMenuItemElement, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver focusContext](self, "focusContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue([v7 element]);
    unsigned __int8 v9 = [v8 allowsDwellScanningToAbortAfterTimeout];

    if ((v9 & 1) != 0)
    {
      int v10 = 0;
      goto LABEL_6;
    }
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver activeElementManager](self, "activeElementManager"));
  if ([v7 allowsDwellScanningToAbortAfterTimeout])
  {
    int v10 = 1;
LABEL_6:
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver focusContext](self, "focusContext"));
    BOOL v12 = [v11 selectBehavior] != 4;

    if (!v10) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }

  BOOL v12 = 0;
LABEL_9:

LABEL_10:
  return v12;
}

- (void)_idleTimerDidFire
{
  if (!-[SCATDwellDriver _shouldUseDwellSelection](self, "_shouldUseDwellSelection"))
  {
    if (-[SCATDriver _canAutomaticallyPauseScanner](self, "_canAutomaticallyPauseScanner")) {
      -[SCATDriver endScanning](self, "endScanning");
    }
  }

- (void)_didTransitionToPhase:(int)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SCATDwellDriver;
  -[SCATDriver _didTransitionToPhase:](&v4, "_didTransitionToPhase:", *(void *)&a3);
  -[SCATDwellDriver _resetDwellTimer](self, "_resetDwellTimer");
}

- (void)_resetDwellTimer
{
  if (-[SCATDriver isActive](self, "isActive")
    && -[SCATDwellDriver _shouldUseDwellSelection](self, "_shouldUseDwellSelection"))
  {
    -[SCATDwellDriver _startDwellTimer](self, "_startDwellTimer");
  }

  else
  {
    -[SCATDwellDriver _cancelDwellRelatedTimers](self, "_cancelDwellRelatedTimers");
  }

- (void)_startDwellTimer
{
}

- (void)_startScanAbortTimer
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver delegate](self, "delegate"));
  [v3 driver:self indicateDwellScanningWillAbort:1];

  id v4 = (id)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v4 assistiveTouchScanTimeout];
  -[SCATDwellDriver performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_scanAbortTimerFired",  0LL);
}

- (void)_dwellTimerFired
{
  if (-[SCATDwellDriver _shouldUseScanAbortTimer](self, "_shouldUseScanAbortTimer"))
  {
    -[SCATDwellDriver _startScanAbortTimer](self, "_startScanAbortTimer");
  }

  else
  {
    -[SCATDwellDriver _actuallyHandleSelectAction](self, "_actuallyHandleSelectAction");
    -[SCATDwellDriver _resetDwellTimer](self, "_resetDwellTimer");
  }

- (void)_scanAbortTimerFired
{
  if (!-[SCATDriver isSpeakingFocusContext](self, "isSpeakingFocusContext"))
  {
    -[SCATDwellDriver _cancelDwellRelatedTimers](self, "_cancelDwellRelatedTimers");
    if (-[SCATDriver _canAutomaticallyPauseScanner](self, "_canAutomaticallyPauseScanner")) {
      -[SCATDriver endScanning](self, "endScanning");
    }
  }

- (void)_cancelDwellRelatedTimers
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver delegate](self, "delegate"));
  [v3 driver:self indicateDwellScanningWillAbort:0];

  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_dwellTimerFired",  0LL);
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:]( &OBJC_CLASS___NSObject,  "cancelPreviousPerformRequestsWithTarget:selector:object:",  self,  "_scanAbortTimerFired",  0LL);
}

- (double)dwellDelay
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  if ([v3 assistiveTouchDelayAfterInputEnabled]
    && (id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver focusContext](self, "focusContext")),
        unsigned int v5 = [v4 isFirstInSequence],
        v4,
        v5))
  {
    [v3 switchControlDwellTime];
    double v7 = v6;
    [v3 assistiveTouchDelayAfterInput];
    double v9 = v7 + v8;
  }

  else
  {
    [v3 switchControlDwellTime];
    double v9 = v10;
  }

  return v9;
}

- (void)outputManager:(id)a3 didSpeakFocusContext:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___SCATDwellDriver;
  -[SCATDriver outputManager:didSpeakFocusContext:](&v6, "outputManager:didSpeakFocusContext:", a3, a4);
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  [v5 assistiveTouchScanTimeout];
  -[SCATDwellDriver performSelector:withObject:afterDelay:]( self,  "performSelector:withObject:afterDelay:",  "_scanAbortTimerFired",  0LL);
}

- (BOOL)isReadyForSelect
{
  return self->_isReadyForSelect;
}

- (void)setIsReadyForSelect:(BOOL)a3
{
  self->_isReadyForSelect = a3;
}

@end