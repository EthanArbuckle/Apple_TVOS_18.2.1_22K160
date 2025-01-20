@interface SCATDriver
- (AXDispatchTimer)idleTimer;
- (BOOL)_canAutomaticallyPauseScanner;
- (BOOL)_canTransitionToPhase:(int)a3;
- (BOOL)_fireSelectActionWithCount:(unint64_t)a3 preferrsMenuOnFirstPress:(BOOL)a4;
- (BOOL)_handleActivateAction;
- (BOOL)_handleRunAction;
- (BOOL)_handleSelectAction;
- (BOOL)_handleSelectAndResumeAutoscanningAction;
- (BOOL)_handleStepNextAction;
- (BOOL)_handleStepPreviousAction;
- (BOOL)_handleStopAction;
- (BOOL)_shouldFocusToEscapeParentGroup:(id)a3 elementManager:(id)a4;
- (BOOL)actionHandler:(id)a3 shouldActImmediatelyOnActionCount:(unint64_t)a4;
- (BOOL)handleInputAction:(id)a3;
- (BOOL)hasIdleTimeExpired;
- (BOOL)isActive;
- (BOOL)isActiveScannerDriver;
- (BOOL)isGroupingEnabled;
- (BOOL)isInactive;
- (BOOL)isPaused;
- (BOOL)isSpeakingFocusContext;
- (BOOL)pauseScanningForPointPickerNumberOfCycles:(unint64_t)a3;
- (SCATDriver)init;
- (SCATDriver)initWithDelegate:(id)a3;
- (SCATDriverDelegate)delegate;
- (SCATElementManager)activeElementManager;
- (SCATFocusContext)currentSpeechFocusContext;
- (SCATFocusContext)focusContext;
- (id)_drillOutFocusContextForParentGroupOfFocusContext:(id)a3;
- (id)_focusContextAdjacentToSource:(int)a3 direction:(int64_t)a4 fromContext:(id)a5 checkedSources:(unint64_t)a6;
- (id)_focusContextForSource:(int)a3 inDirection:(int64_t)a4 currentContext:(id)a5;
- (id)_focusContextFromPrimaryContext:(id)a3 inDirection:(int64_t)a4 didWrap:(BOOL *)a5;
- (id)description;
- (id)firstFocusContext;
- (id)nextFocusContextFromContext:(id)a3 inDirection:(int64_t)a4 didWrap:(BOOL *)a5;
- (id)scannerManager;
- (id)selectActionHandler;
- (id)selectAndResumeAutoscanningActionHandler;
- (int)_nextFocusSourceFromSource:(int)a3 inDirection:(int64_t)a4;
- (int)_preferredBehaviorForSelectCount:(unint64_t)a3 focusContext:(id)a4;
- (int)_sourceForFocusContext:(id)a3;
- (int)phase;
- (int64_t)lastWrapDirection;
- (void)_cancelIdleTimer;
- (void)_didTransitionToPhase:(int)a3;
- (void)_didWrapInDirection:(int64_t)a3;
- (void)_resetIdleTimer;
- (void)_stepToNextFocusContextInDirection:(int64_t)a3;
- (void)actionHandlerDidFireAction:(id)a3;
- (void)beginScanningWithFocusContext:(id)a3;
- (void)continueScanningWithFocusContext:(id)a3;
- (void)endScanning;
- (void)handleDrillInOnGroup:(id)a3 elementManager:(id)a4;
- (void)handleDrillOutOnGroup:(id)a3 elementManager:(id)a4;
- (void)outputManager:(id)a3 didSpeakFocusContext:(id)a4;
- (void)outputManager:(id)a3 willSpeakFocusContext:(id)a4;
- (void)pauseScanning;
- (void)resumeScanning;
- (void)setCurrentSpeechFocusContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFocusContext:(id)a3;
- (void)setHasIdleTimeExpired:(BOOL)a3;
- (void)setIdleTimer:(id)a3;
- (void)setLastWrapDirection:(int64_t)a3;
- (void)setPhase:(int)a3;
@end

@implementation SCATDriver

- (SCATDriver)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___SCATDriver;
  v5 = -[SCATDriver init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_phase = 0;
    v7 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  &_dispatch_main_q);
    idleTimer = v6->_idleTimer;
    v6->_idleTimer = v7;

    -[AXDispatchTimer setLabel:](v6->_idleTimer, "setLabel:", @"Idle");
    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:]( v6->_idleTimer,  "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:",  1LL);
  }

  return v6;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class(self, a2);
  id v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SCATDriver hasIdleTimeExpired](self, "hasIdleTimeExpired")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver activeElementManager](self, "activeElementManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( &OBJC_CLASS___NSNumber,  "numberWithBool:",  -[SCATDriver isActiveScannerDriver](self, "isActiveScannerDriver")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver focusContext](self, "focusContext"));
  objc_super v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@<%p>. idleTimeExpired:%@ ActiveManager:(%@) isActiveDriver:%@ FocusContext:(%@)",  v5,  self,  v6,  v7,  v8,  v9));

  return v10;
}

- (SCATFocusContext)focusContext
{
  return self->_focusContext;
}

- (void)setFocusContext:(id)a3
{
  v5 = (SCATFocusContext *)a3;
  p_focusContext = &self->_focusContext;
  if (self->_focusContext != v5)
  {
    v27 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver delegate](self, "delegate"));
    char v8 = objc_opt_respondsToSelector(v7, "driver:willFocusOnContext:");

    if ((v8 & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver delegate](self, "delegate"));
      [v9 driver:self willFocusOnContext:v27];
    }

    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATFocusContext elementManager](v27, "elementManager"));
    char v11 = objc_opt_respondsToSelector(v10, "driver:willFocusOnContext:");

    if ((v11 & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[SCATFocusContext elementManager](v27, "elementManager"));
      [v12 driver:self willFocusOnContext:v27];
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver delegate](self, "delegate"));
    char v14 = objc_opt_respondsToSelector(v13, "driver:willUnfocusFromContext:");

    if ((v14 & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver delegate](self, "delegate"));
      [v15 driver:self willUnfocusFromContext:self->_focusContext];
    }

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[SCATFocusContext elementManager](*p_focusContext, "elementManager"));
    char v17 = objc_opt_respondsToSelector(v16, "driver:willUnfocusFromContext:");

    if ((v17 & 1) != 0)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[SCATFocusContext elementManager](self->_focusContext, "elementManager"));
      [v18 driver:self willUnfocusFromContext:self->_focusContext];
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[SCATFocusContext element](*p_focusContext, "element"));
    if ([v19 scatIndicatesOwnFocus]
      && (objc_opt_respondsToSelector(v19, "scatDidBecomeFocused:") & 1) != 0)
    {
      [v19 scatDidBecomeFocused:0];
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver delegate](self, "delegate"));
    char v21 = objc_opt_respondsToSelector(v20, "driver:didFocusOnContext:oldContext:");

    if ((v21 & 1) != 0)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver delegate](self, "delegate"));
      [v22 driver:self didFocusOnContext:v27 oldContext:self->_focusContext];
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[SCATFocusContext elementManager](v27, "elementManager"));
    char v24 = objc_opt_respondsToSelector(v23, "driver:didFocusOnContext:oldContext:");

    if ((v24 & 1) != 0)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[SCATFocusContext elementManager](v27, "elementManager"));
      [v25 driver:self didFocusOnContext:v27 oldContext:self->_focusContext];
    }

    objc_storeStrong((id *)&self->_focusContext, a3);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[SCATFocusContext element](v27, "element"));
    if ([v26 scatIndicatesOwnFocus]
      && (objc_opt_respondsToSelector(v26, "scatDidBecomeFocused:") & 1) != 0)
    {
      [v26 scatDidBecomeFocused:1];
    }

    v5 = v27;
  }
}

- (id)scannerManager
{
  return +[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager");
}

- (SCATElementManager)activeElementManager
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver delegate](self, "delegate"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 activeElementManagerForDriver:self]);

  return (SCATElementManager *)v4;
}

- (BOOL)isGroupingEnabled
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned __int8 v3 = [v2 assistiveTouchGroupElementsEnabled];

  return v3;
}

- (id)selectActionHandler
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 selectActionHandler]);

  return v3;
}

- (id)selectAndResumeAutoscanningActionHandler
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 selectAndResumeAutoscanningActionHandler]);

  return v3;
}

- (BOOL)isActive
{
  return self->_phase == 1;
}

- (BOOL)isInactive
{
  return self->_phase == 0;
}

- (BOOL)isPaused
{
  return self->_phase == 2;
}

- (BOOL)isActiveScannerDriver
{
  v2 = self;
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver delegate](self, "delegate"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 activeScannerDriver]);
  LOBYTE(v2) = -[SCATDriver isEqual:](v2, "isEqual:", v4);

  return (char)v2;
}

- (void)beginScanningWithFocusContext:(id)a3
{
  id v5 = a3;
  if (-[SCATDriver _canTransitionToPhase:](self, "_canTransitionToPhase:", 1LL))
  {
    -[SCATDriver _willTransitionToPhase:](self, "_willTransitionToPhase:", 1LL);
    id v4 = v5;
    if (!v5) {
      id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver firstFocusContext](self, "firstFocusContext"));
    }
    id v5 = v4;
    [v4 setFirstInSequence:1];
    -[SCATDriver setFocusContext:](self, "setFocusContext:", v5);
    -[SCATDriver _didTransitionToPhase:](self, "_didTransitionToPhase:", 1LL);
  }
}

- (void)continueScanningWithFocusContext:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_phase != 1)
  {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATDriver.m",  201LL,  "-[SCATDriver continueScanningWithFocusContext:]",  @"Should not have tried to call continueScanningWithFocusContext: when not already active.");
    id v4 = v5;
  }

  if (!v4)
  {
    _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATDriver.m",  202LL,  "-[SCATDriver continueScanningWithFocusContext:]",  @"Should only be using continueScanningWithFocusContext: to update the current focus context, not to restart from the beginning.");
    id v4 = v5;
  }

  if (self->_phase == 1)
  {
    [v4 suppressAudioOutput];
    -[SCATDriver setFocusContext:](self, "setFocusContext:", v5);
  }

  else
  {
    -[SCATDriver beginScanningWithFocusContext:](self, "beginScanningWithFocusContext:", v5);
  }
}

- (void)endScanning
{
  if (-[SCATDriver _canTransitionToPhase:](self, "_canTransitionToPhase:", 0LL))
  {
    -[SCATDriver _willTransitionToPhase:](self, "_willTransitionToPhase:", 0LL);
    -[SCATDriver setFocusContext:](self, "setFocusContext:", 0LL);
    -[SCATDriver _didTransitionToPhase:](self, "_didTransitionToPhase:", 0LL);
  }

- (void)pauseScanning
{
  if (-[SCATDriver _canTransitionToPhase:](self, "_canTransitionToPhase:", 2LL))
  {
    -[SCATDriver _willTransitionToPhase:](self, "_willTransitionToPhase:", 2LL);
    -[SCATDriver _didTransitionToPhase:](self, "_didTransitionToPhase:", 2LL);
  }

- (void)resumeScanning
{
  if (-[SCATDriver _canTransitionToPhase:](self, "_canTransitionToPhase:", 1LL))
  {
    -[SCATDriver _willTransitionToPhase:](self, "_willTransitionToPhase:", 1LL);
    -[SCATDriver _didTransitionToPhase:](self, "_didTransitionToPhase:", 1LL);
  }

- (BOOL)pauseScanningForPointPickerNumberOfCycles:(unint64_t)a3
{
  BOOL v5 = -[SCATDriver _canAutomaticallyPauseScanner](self, "_canAutomaticallyPauseScanner");
  if (v5)
  {
    BOOL v5 = -[SCATDriver hasIdleTimeExpired](self, "hasIdleTimeExpired");
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver delegate](self, "delegate"));
      id v7 = [v6 minimumPointPickerNumberOfCyclesForDriver:self];

      if ((unint64_t)v7 <= a3)
      {
        -[SCATDriver pauseScanning](self, "pauseScanning");
        LOBYTE(v5) = 1;
      }

      else
      {
        LOBYTE(v5) = 0;
      }
    }
  }

  return v5;
}

- (int)_preferredBehaviorForSelectCount:(unint64_t)a3 focusContext:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (a3 != 2)
  {
    if (a3 != 1)
    {
      int v10 = 0;
      goto LABEL_9;
    }

    id v7 = (void *)objc_claimAutoreleasedReturnValue([v5 element]);
    unsigned __int8 v8 = [v7 scatSupportsAction:2010];

    if ((v8 & 1) != 0)
    {
      int v9 = 1;
      goto LABEL_12;
    }

    if ([v6 isGroup])
    {
      int v9 = 3;
      goto LABEL_12;
    }
  }

  int v10 = 2;
LABEL_9:
  char v11 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v12 = [v11 switchControlHasEmptyTopLevelMenu];

  if (v12) {
    int v9 = 1;
  }
  else {
    int v9 = v10;
  }
LABEL_12:

  return v9;
}

- (int)_sourceForFocusContext:(id)a3
{
  return [a3 selectBehavior] == 4;
}

- (int)_nextFocusSourceFromSource:(int)a3 inDirection:(int64_t)a4
{
  return a3 != 1;
}

- (id)_focusContextForSource:(int)a3 inDirection:(int64_t)a4 currentContext:(id)a5
{
  id v8 = a5;
  unsigned int v17 = 0;
  if (!a3)
  {
    int v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver activeElementManager](self, "activeElementManager"));
    if ([v8 selectBehavior] == 4)
    {
      char v11 = (void *)objc_claimAutoreleasedReturnValue([v8 element]);
      unsigned int v12 = v11;
      if (a4 == 1) {
        uint64_t v13 = objc_claimAutoreleasedReturnValue([v11 lastChild]);
      }
      else {
        uint64_t v13 = objc_claimAutoreleasedReturnValue([v11 firstChild]);
      }
      v15 = (void *)v13;

      if (v15)
      {
LABEL_10:
        int v9 = (void *)objc_claimAutoreleasedReturnValue( +[SCATFocusContext focusContextWithElement:elementManager:selectBehavior:options:]( &OBJC_CLASS___SCATFocusContext,  "focusContextWithElement:elementManager:selectBehavior:options:",  v15,  v10,  0LL,  v17));
LABEL_14:

        goto LABEL_15;
      }
    }

    else
    {
      if (a4 == 1) {
        uint64_t v14 = objc_claimAutoreleasedReturnValue([v10 lastElementWithOptions:&v17]);
      }
      else {
        uint64_t v14 = objc_claimAutoreleasedReturnValue([v10 firstElementWithOptions:&v17]);
      }
      v15 = (void *)v14;
      if (v14) {
        goto LABEL_10;
      }
    }

    int v9 = 0LL;
    goto LABEL_14;
  }

  int v9 = (void *)objc_claimAutoreleasedReturnValue( -[SCATDriver _drillOutFocusContextForParentGroupOfFocusContext:]( self,  "_drillOutFocusContextForParentGroupOfFocusContext:",  v8));
LABEL_15:

  return v9;
}

- (id)_focusContextAdjacentToSource:(int)a3 direction:(int64_t)a4 fromContext:(id)a5 checkedSources:(unint64_t)a6
{
  uint64_t v8 = *(void *)&a3;
  id v10 = a5;
  uint64_t v11 = -[SCATDriver _nextFocusSourceFromSource:inDirection:](self, "_nextFocusSourceFromSource:inDirection:", v8, a4);
  uint64_t v12 = objc_claimAutoreleasedReturnValue( -[SCATDriver _focusContextForSource:inDirection:currentContext:]( self,  "_focusContextForSource:inDirection:currentContext:",  v11,  a4,  v10));
  uint64_t v13 = (void *)v12;
  if (a6 <= 1 && !v12) {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[SCATDriver _focusContextAdjacentToSource:direction:fromContext:checkedSources:]( self,  "_focusContextAdjacentToSource:direction:fromContext:checkedSources:",  v11,  a4,  v10,  a6 + 1));
  }

  return v13;
}

- (id)_drillOutFocusContextForParentGroupOfFocusContext:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 element]);
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 parentGroup]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 elementManager]);
  LODWORD(self) = -[SCATDriver _shouldFocusToEscapeParentGroup:elementManager:]( self,  "_shouldFocusToEscapeParentGroup:elementManager:",  v6,  v7);

  if (!(_DWORD)self)
  {
    uint64_t v14 = 0LL;
    goto LABEL_8;
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v6 firstChild]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 findGroupableMatchingGroupable:v6]);

  if (!v10)
  {
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 nativeFocusElement]);
    [v9 centerPoint];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "elementAtPoint:"));
    uint64_t v12 = objc_claimAutoreleasedReturnValue([v11 parentGroup]);

    v6 = (void *)v12;
LABEL_5:
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v4 elementManager]);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue( +[SCATFocusContext focusContextWithElement:elementManager:selectBehavior:options:]( &OBJC_CLASS___SCATFocusContext,  "focusContextWithElement:elementManager:selectBehavior:options:",  v6,  v13,  4LL,  0LL));

LABEL_8:
  return v14;
}

- (id)_focusContextFromPrimaryContext:(id)a3 inDirection:(int64_t)a4 didWrap:(BOOL *)a5
{
  unsigned int v18 = 0;
  BOOL v17 = 0;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 elementManager]);
  int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 element]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 siblingOfElement:v9 inDirection:a4 didWrap:&v17 options:&v18]);

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 elementManager]);
  if (!v10)
  {
    uint64_t v12 = 0LL;
    if (!a5) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue( +[SCATFocusContext focusContextWithElement:elementManager:selectBehavior:options:]( &OBJC_CLASS___SCATFocusContext,  "focusContextWithElement:elementManager:selectBehavior:options:",  v10,  v11,  0LL,  v18));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 menu]);

  if ([v14 isVisible])
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue([v14 element]);
    [v12 setMenuElement:v15];
  }

  if (a5) {
LABEL_5:
  }
    *a5 = v17;
LABEL_6:

  return v12;
}

- (id)nextFocusContextFromContext:(id)a3 inDirection:(int64_t)a4 didWrap:(BOOL *)a5
{
  id v8 = a3;
  int v9 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav sharedInstance](&OBJC_CLASS___AXSubsystemSCElementNav, "sharedInstance"));
  unsigned __int8 v10 = [v9 ignoreLogging];

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
    uint64_t v12 = AXLoggerForFacility();
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);

    os_log_type_t v14 = AXOSLogLevelFromAXLogLevel(3LL);
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v15 = AXColorizeFormatLog(3LL, @"Getting next focus context from %{public}@");
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v77 = (void *)objc_claimAutoreleasedReturnValue([v8 elemLog]);
      uint64_t v17 = _AXStringForArgs(v16);
      unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

      if (os_log_type_enabled(v13, v14))
      {
        *(_DWORD *)buf = 138543362;
        v86 = v18;
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "%{public}@", buf, 0xCu);
      }
    }
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver _focusedElementManagerForContext:](self, "_focusedElementManagerForContext:", v8));
  if (v19)
  {
    uint64_t v20 = -[SCATDriver _sourceForFocusContext:](self, "_sourceForFocusContext:", v8);
    char v84 = 0;
    int64_t v83 = a4;
    if ((_DWORD)v20)
    {
      char v21 = a5;
      v22 = 0LL;
    }

    else
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue( -[SCATDriver _focusContextFromPrimaryContext:inDirection:didWrap:]( self,  "_focusContextFromPrimaryContext:inDirection:didWrap:",  v8,  a4,  &v84));
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav sharedInstance](&OBJC_CLASS___AXSubsystemSCElementNav, "sharedInstance"));
      unsigned __int8 v36 = [v35 ignoreLogging];

      if ((v36 & 1) != 0)
      {
        char v21 = a5;
      }

      else
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
        uint64_t v38 = AXLoggerForFacility();
        v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);

        os_log_type_t v40 = AXOSLogLevelFromAXLogLevel(3LL);
        if (os_log_type_enabled(v39, v40))
        {
          uint64_t v41 = AXColorizeFormatLog(3LL, @"Next focus context from primary context was %{public}@");
          uint64_t v42 = objc_claimAutoreleasedReturnValue(v41);
          v79 = (void *)objc_claimAutoreleasedReturnValue([v22 elemLog]);
          v43 = (void *)v42;
          uint64_t v44 = _AXStringForArgs(v42);
          v45 = (void *)objc_claimAutoreleasedReturnValue(v44);

          if (os_log_type_enabled(v39, v40))
          {
            *(_DWORD *)buf = 138543362;
            v86 = v45;
            _os_log_impl((void *)&_mh_execute_header, v39, v40, "%{public}@", buf, 0xCu);
          }
        }

        char v21 = a5;
      }
    }

    v46 = (void *)objc_claimAutoreleasedReturnValue([v8 element]);
    v47 = (void *)objc_claimAutoreleasedReturnValue([v22 menuElement]);

    if (v46 == v47)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav sharedInstance](&OBJC_CLASS___AXSubsystemSCElementNav, "sharedInstance"));
      unsigned __int8 v49 = [v48 ignoreLogging];

      if ((v49 & 1) == 0)
      {
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
        uint64_t v51 = AXLoggerForFacility();
        v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v51);

        os_log_type_t v53 = AXOSLogLevelFromAXLogLevel(3LL);
        if (os_log_type_enabled(v52, v53))
        {
          uint64_t v54 = AXColorizeFormatLog(3LL, @"Just scanned menu exit action element, so going back into the menu");
          v81 = (void *)objc_claimAutoreleasedReturnValue(v54);
          uint64_t v55 = _AXStringForArgs(v81);
          v82 = (void *)objc_claimAutoreleasedReturnValue(v55);
          if (os_log_type_enabled(v52, v53))
          {
            *(_DWORD *)buf = 138543362;
            v86 = v82;
            _os_log_impl((void *)&_mh_execute_header, v52, v53, "%{public}@", buf, 0xCu);
          }
        }
      }
    }

    a5 = v21;
    if (v22 && (!v84 || v46 == v47))
    {
      v33 = v22;
    }

    else
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue( -[SCATDriver _focusContextAdjacentToSource:direction:fromContext:checkedSources:]( self,  "_focusContextAdjacentToSource:direction:fromContext:checkedSources:",  v20,  v83,  v8,  0LL));

      v56 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav sharedInstance](&OBJC_CLASS___AXSubsystemSCElementNav, "sharedInstance"));
      unsigned __int8 v57 = [v56 ignoreLogging];

      if ((v57 & 1) == 0)
      {
        v58 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
        uint64_t v59 = AXLoggerForFacility();
        v60 = (os_log_s *)objc_claimAutoreleasedReturnValue(v59);

        os_log_type_t v61 = AXOSLogLevelFromAXLogLevel(3LL);
        if (os_log_type_enabled(v60, v61))
        {
          uint64_t v62 = AXColorizeFormatLog( 3LL,  @"Needed to go to adjacent source.  Next focus context from adjacent source was %{public}@");
          v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
          v80 = (void *)objc_claimAutoreleasedReturnValue([v33 elemLog]);
          uint64_t v64 = _AXStringForArgs(v63);
          v65 = (void *)objc_claimAutoreleasedReturnValue(v64);

          if (os_log_type_enabled(v60, v61))
          {
            *(_DWORD *)buf = 138543362;
            v86 = v65;
            _os_log_impl((void *)&_mh_execute_header, v60, v61, "%{public}@", buf, 0xCu);
          }
        }
      }
    }

    BOOL v34 = v84 != 0;
    if (!v33)
    {
LABEL_43:
      v66 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav sharedInstance](&OBJC_CLASS___AXSubsystemSCElementNav, "sharedInstance"));
      unsigned __int8 v67 = [v66 ignoreLogging];

      if ((v67 & 1) == 0)
      {
        v68 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
        uint64_t v69 = AXLoggerForFacility();
        v70 = (os_log_s *)objc_claimAutoreleasedReturnValue(v69);

        os_log_type_t v71 = AXOSLogLevelFromAXLogLevel(2LL);
        if (os_log_type_enabled(v70, v71))
        {
          uint64_t v72 = AXColorizeFormatLog( 2LL,  @"siblingElement was nil for context:%{public}@. will scan first context instead");
          v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
          uint64_t v74 = _AXStringForArgs(v73);
          v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
          if (os_log_type_enabled(v70, v71))
          {
            *(_DWORD *)buf = 138543362;
            v86 = v75;
            _os_log_impl((void *)&_mh_execute_header, v70, v71, "%{public}@", buf, 0xCu);
          }
        }
      }

      v33 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver firstFocusContext](self, "firstFocusContext"));
    }
  }

  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav sharedInstance](&OBJC_CLASS___AXSubsystemSCElementNav, "sharedInstance"));
    unsigned __int8 v24 = [v23 ignoreLogging];

    if ((v24 & 1) == 0)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
      uint64_t v26 = AXLoggerForFacility();
      v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);

      os_log_type_t v28 = AXOSLogLevelFromAXLogLevel(3LL);
      if (os_log_type_enabled(v27, v28))
      {
        uint64_t v29 = AXColorizeFormatLog( 3LL,  @"focusedElementManager was not the same as manager from context:%{public}@. Using:%{public}@");
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        v78 = (void *)objc_claimAutoreleasedReturnValue([v8 elementManager]);
        uint64_t v31 = _AXStringForArgs(v30);
        v32 = (void *)objc_claimAutoreleasedReturnValue(v31);

        if (os_log_type_enabled(v27, v28))
        {
          *(_DWORD *)buf = 138543362;
          v86 = v32;
          _os_log_impl((void *)&_mh_execute_header, v27, v28, "%{public}@", buf, 0xCu);
        }
      }
    }

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver firstFocusContext](self, "firstFocusContext"));
    BOOL v34 = 0;
    if (!v33) {
      goto LABEL_43;
    }
  }

  if (a5) {
    *a5 = v34;
  }

  return v33;
}

- (id)firstFocusContext
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver activeElementManager](self, "activeElementManager"));
  unsigned int v6 = 0;
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue([v2 firstElementWithOptions:&v6]);
  if (v3) {
    id v4 = (void *)objc_claimAutoreleasedReturnValue( +[SCATFocusContext focusContextWithElement:elementManager:selectBehavior:options:]( &OBJC_CLASS___SCATFocusContext,  "focusContextWithElement:elementManager:selectBehavior:options:",  v3,  v2,  0LL,  v6));
  }
  else {
    id v4 = 0LL;
  }

  return v4;
}

- (void)_stepToNextFocusContextInDirection:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver focusContext](self, "focusContext"));
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver _focusedElementManagerForContext:](self, "_focusedElementManagerForContext:", v5));

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver focusContext](self, "focusContext"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 elementManager]);

  if ([v6 isEqual:v8])
  {
    char v17 = 0;
    int v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver focusContext](self, "focusContext"));
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue( -[SCATDriver nextFocusContextFromContext:inDirection:didWrap:]( self,  "nextFocusContextFromContext:inDirection:didWrap:",  v9,  a3,  &v17));

    if (v17) {
      -[SCATDriver _didWrapInDirection:](self, "_didWrapInDirection:", a3);
    }
  }

  else
  {
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver firstFocusContext](self, "firstFocusContext"));
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 menu]);
  unsigned int v13 = [v12 isVisible];

  if (v13)
  {
    os_log_type_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 menu]);
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 element]);
    [v10 setMenuElement:v16];
  }

  -[SCATDriver _willStepToNextFocusContext:inDirection:](self, "_willStepToNextFocusContext:inDirection:", v10, a3);
  if (v10) {
    -[SCATDriver setFocusContext:](self, "setFocusContext:", v10);
  }
}

- (void)handleDrillInOnGroup:(id)a3 elementManager:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver focusContext](self, "focusContext"));
    id v6 = (id)objc_claimAutoreleasedReturnValue([v7 elementManager]);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v10 firstChild]);
  int v9 = (void *)objc_claimAutoreleasedReturnValue( +[SCATFocusContext focusContextWithElement:elementManager:selectBehavior:options:]( &OBJC_CLASS___SCATFocusContext,  "focusContextWithElement:elementManager:selectBehavior:options:",  v8,  v6,  0LL,  0LL));
  [v9 setFirstInSequence:1];
  -[SCATDriver willDrillIntoGroup](self, "willDrillIntoGroup");
  -[SCATDriver setFocusContext:](self, "setFocusContext:", v9);
}

- (void)handleDrillOutOnGroup:(id)a3 elementManager:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver focusContext](self, "focusContext"));
    id v6 = (id)objc_claimAutoreleasedReturnValue([v7 elementManager]);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 focusContextAfterDrillOutOnGroup:v9]);
  [v8 setFirstInSequence:1];
  -[SCATDriver willDrillOutOfGroup](self, "willDrillOutOfGroup");
  -[SCATDriver setFocusContext:](self, "setFocusContext:", v8);
}

- (BOOL)handleInputAction:(id)a3
{
  id v4 = a3;
  if ([v4 action] != (id)103 && objc_msgSend(v4, "action") != (id)109)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver selectActionHandler](self, "selectActionHandler"));
    [v5 cancelPendingAction];
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver focusContext](self, "focusContext"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 element]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver activeElementManager](self, "activeElementManager"));
  unsigned int v9 = [v8 handleInputAction:v4 withElement:v7];

  if (v9)
  {
    -[SCATDriver _resetIdleTimer](self, "_resetIdleTimer");
LABEL_6:
    BOOL v10 = 1;
  }

  else
  {
    BOOL v10 = 0;
    switch((unint64_t)[v4 action])
    {
      case 'd':
        if (-[SCATDriver _handleActivateAction](self, "_handleActivateAction")) {
          goto LABEL_6;
        }
        goto LABEL_9;
      case 'f':
        unsigned __int8 v11 = -[SCATDriver _handleRunAction](self, "_handleRunAction");
        goto LABEL_15;
      case 'g':
LABEL_9:
        unsigned __int8 v11 = -[SCATDriver _handleSelectAction](self, "_handleSelectAction");
        goto LABEL_15;
      case 'h':
        unsigned __int8 v11 = -[SCATDriver _handleStepNextAction](self, "_handleStepNextAction");
        goto LABEL_15;
      case 'i':
        unsigned __int8 v11 = -[SCATDriver _handleStepPreviousAction](self, "_handleStepPreviousAction");
        goto LABEL_15;
      case 'j':
        unsigned __int8 v11 = -[SCATDriver _handleStopAction](self, "_handleStopAction");
        goto LABEL_15;
      case 'm':
        unsigned __int8 v11 = -[SCATDriver _handleSelectAndResumeAutoscanningAction](self, "_handleSelectAndResumeAutoscanningAction");
LABEL_15:
        BOOL v10 = v11;
        break;
      default:
        break;
    }
  }

  return v10;
}

- (BOOL)_handleActivateAction
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver focusContext](self, "focusContext"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 element]);

  if (!v4) {
    goto LABEL_10;
  }
  if ([v4 isGroup])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver focusContext](self, "focusContext"));
    unsigned int v6 = [v5 selectBehavior];

    if (v6 == 4)
    {
      -[SCATDriver handleDrillOutOnGroup:elementManager:](self, "handleDrillOutOnGroup:elementManager:", v4, 0LL);
      goto LABEL_8;
    }

    if (v6 == 3)
    {
      -[SCATDriver handleDrillInOnGroup:elementManager:](self, "handleDrillInOnGroup:elementManager:", v4, 0LL);
LABEL_8:
      unsigned __int8 v8 = 1;
      goto LABEL_11;
    }

    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver focusContext](self, "focusContext"));
    _AXLogWithFacility( 3LL,  0LL,  1LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0.0,  1,  @"activate was called on a group, but the behavior was not drill in or drill out. That's not good... :%@");

LABEL_10:
    unsigned __int8 v8 = 0;
    goto LABEL_11;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  unsigned __int8 v8 = [v7 activateElement:v4];

LABEL_11:
  return v8;
}

- (BOOL)_fireSelectActionWithCount:(unint64_t)a3 preferrsMenuOnFirstPress:(BOOL)a4
{
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver focusContext](self, "focusContext"));
  unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue([v7 element]);
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v8 menu]);
  unsigned __int8 v11 = (void *)objc_claimAutoreleasedReturnValue([v10 element]);
  if (v9 == v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 menu]);
    unsigned int v13 = [v12 isVisible];

    if (v13)
    {
      os_log_type_t v14 = (void *)objc_claimAutoreleasedReturnValue([v8 menu]);
      [v14 hideWithCompletion:0];

      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[HNDAccessibilityManager sharedManager](&OBJC_CLASS___HNDAccessibilityManager, "sharedManager"));
      [v15 refreshElements];
LABEL_5:

LABEL_45:
      BOOL v23 = 1;
      goto LABEL_46;
    }
  }

  else
  {
  }

  unsigned int v16 = -[SCATDriver _preferredBehaviorForSelectCount:focusContext:]( self,  "_preferredBehaviorForSelectCount:focusContext:",  a3,  v7);
  unsigned int v17 = [v7 selectBehavior];
  if (v7)
  {
    if (v17 == 3 && v16 == 2) {
      int v19 = 2;
    }
    else {
      int v19 = v17;
    }
    else {
      int v20 = v19;
    }
    switch(v20)
    {
      case 0:
        char v21 = @"We should never actually get an automatic select behavior";
        uint64_t v22 = 777LL;
        goto LABEL_19;
      case 1:
        if (-[SCATDriver _handleActivateAction](self, "_handleActivateAction")) {
          goto LABEL_45;
        }
        BOOL v23 = -[SCATDriver _handleSelectAction](self, "_handleSelectAction");
        goto LABEL_46;
      case 2:
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v7 element]);
        unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
        v25 = (void *)objc_claimAutoreleasedReturnValue([v24 menu]);
        [v25 setIsWaitingToBePresented:1];

        if ([v15 scatIsAXElement])
        {
          [v15 setNativeFocus];
          UIAccessibilityPostNotification(0x41Du, 0LL);
        }

        goto LABEL_5;
      case 3:
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v7 element]);
        if (([v26 isGroup] & 1) == 0) {
          _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATDriver.m",  748LL,  "-[SCATDriver _fireSelectActionWithCount:preferrsMenuOnFirstPress:]",  @"element must be a group for drill in context behavior");
        }
        if ([v26 isGroup])
        {
          -[SCATDriver handleDrillInOnGroup:elementManager:](self, "handleDrillInOnGroup:elementManager:", v26, 0LL);
          goto LABEL_44;
        }

        v27 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemSCElementNav sharedInstance]( &OBJC_CLASS___AXSubsystemSCElementNav,  "sharedInstance"));
        unsigned __int8 v28 = [v27 ignoreLogging];

        if ((v28 & 1) != 0) {
          goto LABEL_44;
        }
        uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
        uint64_t v30 = AXLoggerForFacility();
        uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);

        os_log_type_t v32 = AXOSLogLevelFromAXLogLevel(3LL);
        if (!os_log_type_enabled(v31, v32)) {
          goto LABEL_43;
        }
        uint64_t v33 = AXColorizeFormatLog(3LL, @"Trying to drill into: %@\nContext: %@");
        BOOL v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
        uint64_t v35 = _AXStringForArgs(v34);
        unsigned __int8 v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
        if (!os_log_type_enabled(v31, v32)) {
          goto LABEL_42;
        }
        *(_DWORD *)buf = 138543362;
        v45 = v36;
        goto LABEL_41;
      case 4:
        uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue([v7 element]);
        if (([v26 isGroup] & 1) == 0) {
          _AXAssert( 0LL,  "/Library/Caches/com.apple.xbs/Sources/AssistiveTouch/Source/Scanner/SCATDriver.m",  763LL,  "-[SCATDriver _fireSelectActionWithCount:preferrsMenuOnFirstPress:]",  @"element must be a group for drill out context behavior");
        }
        if ([v26 isGroup])
        {
          -[SCATDriver handleDrillOutOnGroup:elementManager:](self, "handleDrillOutOnGroup:elementManager:", v26, 0LL);
        }

        else
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue( +[AXSubsystemSCElementNav sharedInstance]( &OBJC_CLASS___AXSubsystemSCElementNav,  "sharedInstance"));
          unsigned __int8 v38 = [v37 ignoreLogging];

          if ((v38 & 1) == 0)
          {
            v39 = (void *)objc_claimAutoreleasedReturnValue(+[AXSubsystemSCElementNav identifier](&OBJC_CLASS___AXSubsystemSCElementNav, "identifier"));
            uint64_t v40 = AXLoggerForFacility();
            uint64_t v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);

            os_log_type_t v32 = AXOSLogLevelFromAXLogLevel(3LL);
            if (os_log_type_enabled(v31, v32))
            {
              uint64_t v41 = AXColorizeFormatLog(3LL, @"Trying to drill into: %@\nContext: %@");
              BOOL v34 = (void *)objc_claimAutoreleasedReturnValue(v41);
              uint64_t v42 = _AXStringForArgs(v34);
              unsigned __int8 v36 = (void *)objc_claimAutoreleasedReturnValue(v42);
              if (os_log_type_enabled(v31, v32))
              {
                *(_DWORD *)buf = 138543362;
                v45 = v36;
LABEL_41:
                _os_log_impl((void *)&_mh_execute_header, v31, v32, "%{public}@", buf, 0xCu);
              }

- (BOOL)_handleSelectAction
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver selectActionHandler](self, "selectActionHandler"));
  [v3 notifyDidReceiveAction:self];

  return 1;
}

- (BOOL)_handleSelectAndResumeAutoscanningAction
{
  unsigned __int8 v3 = (void *)objc_claimAutoreleasedReturnValue( -[SCATDriver selectAndResumeAutoscanningActionHandler]( self,  "selectAndResumeAutoscanningActionHandler"));
  [v3 notifyDidReceiveAction:self];

  return 1;
}

- (BOOL)_handleRunAction
{
  return 0;
}

- (BOOL)_handleStopAction
{
  return 0;
}

- (BOOL)_handleStepNextAction
{
  return 0;
}

- (BOOL)_handleStepPreviousAction
{
  return 0;
}

- (BOOL)isSpeakingFocusContext
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver currentSpeechFocusContext](self, "currentSpeechFocusContext"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (void)outputManager:(id)a3 willSpeakFocusContext:(id)a4
{
}

- (void)outputManager:(id)a3 didSpeakFocusContext:(id)a4
{
  id v5 = a4;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[SCATDriver currentSpeechFocusContext](self, "currentSpeechFocusContext"));

  if (v6 == v5)
  {
    -[SCATDriver setCurrentSpeechFocusContext:](self, "setCurrentSpeechFocusContext:", 0LL);
    -[SCATDriver _resetIdleTimer](self, "_resetIdleTimer");
  }

- (void)_cancelIdleTimer
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(-[SCATDriver idleTimer](self, "idleTimer"));
  [v2 cancel];
}

- (void)_resetIdleTimer
{
  self->_hasIdleTimeExpired = 0;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver idleTimer](self, "idleTimer"));
  [v3 cancel];

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  unsigned int v5 = [v4 assistiveTouchScanTimeoutEnabled];

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    [v6 assistiveTouchScanTimeout];
    double v8 = v7;

    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver idleTimer](self, "idleTimer"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100018D70;
    v10[3] = &unk_100121D18;
    v10[4] = self;
    [v9 afterDelay:v10 processBlock:v8];
  }

- (void)_didWrapInDirection:(int64_t)a3
{
}

- (BOOL)_canAutomaticallyPauseScanner
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver activeElementManager](self, "activeElementManager"));
  char v3 = [v2 shouldKeepScannerAwake] ^ 1;

  return v3;
}

- (BOOL)_shouldFocusToEscapeParentGroup:(id)a3 elementManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && -[SCATDriver isGroupingEnabled](self, "isGroupingEnabled")) {
    unsigned int v8 = [v6 isRootGroup] ^ 1;
  }
  else {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)_canTransitionToPhase:(int)a3
{
  return a3 != 2 || self->_phase == 1;
}

- (void)_didTransitionToPhase:(int)a3
{
  int phase = self->_phase;
  self->_int phase = a3;
  switch(a3)
  {
    case 0:
      -[SCATDriver _cancelIdleTimer](self, "_cancelIdleTimer");
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver delegate](self, "delegate"));
      char v8 = objc_opt_respondsToSelector(v7, "driverDidBecomeInactive:");

      if ((v8 & 1) == 0) {
        return;
      }
      id v11 = (id)objc_claimAutoreleasedReturnValue(-[SCATDriver delegate](self, "delegate"));
      [v11 driverDidBecomeInactive:self];
      goto LABEL_10;
    case 1:
      -[SCATDriver _resetIdleTimer](self, "_resetIdleTimer");
      unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver delegate](self, "delegate"));
      char v10 = objc_opt_respondsToSelector(v9, "driverDidBecomeActive:didChange:");

      if ((v10 & 1) == 0) {
        return;
      }
      id v11 = (id)objc_claimAutoreleasedReturnValue(-[SCATDriver delegate](self, "delegate"));
      [v11 driverDidBecomeActive:self didChange:phase != 1];
      goto LABEL_10;
    case 2:
      -[SCATDriver _cancelIdleTimer](self, "_cancelIdleTimer");
      unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver delegate](self, "delegate"));
      char v6 = objc_opt_respondsToSelector(v5, "driverDidPause:");

      if ((v6 & 1) != 0)
      {
        id v11 = (id)objc_claimAutoreleasedReturnValue(-[SCATDriver delegate](self, "delegate"));
        [v11 driverDidPause:self];
LABEL_10:
      }

      break;
  }

- (BOOL)actionHandler:(id)a3 shouldActImmediatelyOnActionCount:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver selectActionHandler](self, "selectActionHandler"));
  unsigned int v8 = [v6 isEqual:v7];

  if (!v8) {
    return 1;
  }
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver focusContext](self, "focusContext"));
  unsigned int v10 = [v9 selectBehavior];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver focusContext](self, "focusContext"));
  unsigned __int8 v12 = [v11 waitsForSelectAction];

  if (a4 != 1 || (v12 & 1) == 0)
  {
    if (v10 == 2)
    {
      os_log_type_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
      BOOL v13 = [v14 immediateSelectActionCount] == (id)a4;

      return v13;
    }

    return 1;
  }

  return 0;
}

- (void)actionHandlerDidFireAction:(id)a3
{
  id v7 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[SCATDriver selectActionHandler](self, "selectActionHandler"));
  if ([v7 isEqual:v4])
  {

LABEL_4:
    -[SCATDriver _fireSelectActionWithCount:preferrsMenuOnFirstPress:]( self,  "_fireSelectActionWithCount:preferrsMenuOnFirstPress:",  [v7 actionCount],  objc_msgSend(v7, "shouldShowMenuOnFirstSelectAction"));
    goto LABEL_5;
  }

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue( -[SCATDriver selectAndResumeAutoscanningActionHandler]( self,  "selectAndResumeAutoscanningActionHandler"));
  unsigned int v6 = [v7 isEqual:v5];

  if (v6) {
    goto LABEL_4;
  }
LABEL_5:
}

- (SCATDriverDelegate)delegate
{
  return (SCATDriverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (int)phase
{
  return self->_phase;
}

- (void)setPhase:(int)a3
{
  self->_int phase = a3;
}

- (AXDispatchTimer)idleTimer
{
  return self->_idleTimer;
}

- (void)setIdleTimer:(id)a3
{
}

- (BOOL)hasIdleTimeExpired
{
  return self->_hasIdleTimeExpired;
}

- (void)setHasIdleTimeExpired:(BOOL)a3
{
  self->_hasIdleTimeExpired = a3;
}

- (int64_t)lastWrapDirection
{
  return self->_lastWrapDirection;
}

- (void)setLastWrapDirection:(int64_t)a3
{
  self->_lastWrapDirection = a3;
}

- (SCATFocusContext)currentSpeechFocusContext
{
  return self->_currentSpeechFocusContext;
}

- (void)setCurrentSpeechFocusContext:(id)a3
{
  self->_currentSpeechFocusContext = (SCATFocusContext *)a3;
}

- (void).cxx_destruct
{
}

- (SCATDriver)init
{
  return 0LL;
}

@end