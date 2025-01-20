@interface SCATActionHandler
- (AXDispatchTimer)actionTimeoutTimer;
- (BOOL)_shouldHandleSelectActionImmediately;
- (BOOL)isPending;
- (BOOL)shouldShowMenuOnFirstSelectAction;
- (SCATActionHandler)initWithAction:(int64_t)a3 timeoutDuration:(double)a4;
- (SCATActionHandlerDelegate)delegate;
- (SCATActionHandlerUIDelegate)uiDelegate;
- (double)timeoutDuration;
- (int64_t)action;
- (unint64_t)actionCount;
- (void)_handleFireActionAndResumeAutoscanning:(BOOL)a3;
- (void)_resetWithActionSource:(id)a3;
- (void)cancelPendingAction;
- (void)notifyDidReceiveAction:(id)a3;
- (void)setAction:(int64_t)a3;
- (void)setActionCount:(unint64_t)a3;
- (void)setActionTimeoutTimer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTimeoutDuration:(double)a3;
- (void)setUiDelegate:(id)a3;
@end

@implementation SCATActionHandler

- (SCATActionHandler)initWithAction:(int64_t)a3 timeoutDuration:(double)a4
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___SCATActionHandler;
  v6 = -[SCATActionHandler init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    v6->_action = a3;
    v6->_timeoutDuration = a4;
    v8 = -[AXDispatchTimer initWithTargetSerialQueue:]( objc_alloc(&OBJC_CLASS___AXDispatchTimer),  "initWithTargetSerialQueue:",  &_dispatch_main_q);
    actionTimeoutTimer = v7->_actionTimeoutTimer;
    v7->_actionTimeoutTimer = v8;

    -[AXDispatchTimer setLabel:](v7->_actionTimeoutTimer, "setLabel:", @"ActionTimeout");
    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:]( v7->_actionTimeoutTimer,  "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:",  1LL);
  }

  return v7;
}

- (BOOL)shouldShowMenuOnFirstSelectAction
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  BOOL v3 = [v2 switchControlTapBehavior] != (id)1;

  return v3;
}

- (BOOL)_shouldHandleSelectActionImmediately
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
  if ([v2 switchControlTapBehavior] == (id)1)
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[AXSettings sharedInstance](&OBJC_CLASS___AXSettings, "sharedInstance"));
    unsigned __int8 v4 = [v3 switchControlHasEmptyTopLevelMenu];
  }

  else
  {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (void)notifyDidReceiveAction:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATActionHandler delegate](self, "delegate"));
  unsigned __int8 v6 = [v5 isEqual:v4];

  if ((v6 & 1) == 0) {
    -[SCATActionHandler _resetWithActionSource:](self, "_resetWithActionSource:", v4);
  }
  -[SCATActionHandler setActionCount:]( self,  "setActionCount:",  (char *)-[SCATActionHandler actionCount](self, "actionCount") + 1);
  int64_t v7 = -[SCATActionHandler action](self, "action");
  int64_t v8 = v7;
  if (v7 == 109 || v7 == 103) {
    unsigned __int8 v9 = -[SCATActionHandler _shouldHandleSelectActionImmediately](self, "_shouldHandleSelectActionImmediately");
  }
  else {
    unsigned __int8 v9 = 0;
  }
  BOOL v10 = v8 == 109;
  if (v8 == 100
    || (v9 & 1) != 0
    || (objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[SCATActionHandler delegate](self, "delegate")),
        unsigned int v12 = objc_msgSend( v11,  "actionHandler:shouldActImmediatelyOnActionCount:",  self,  -[SCATActionHandler actionCount](self, "actionCount")),  v11,  v12))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[SCATActionHandler actionTimeoutTimer](self, "actionTimeoutTimer"));
    [v13 cancel];

    -[SCATActionHandler _handleFireActionAndResumeAutoscanning:]( self,  "_handleFireActionAndResumeAutoscanning:",  v8 == 109);
  }

  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SCATActionHandler uiDelegate](self, "uiDelegate"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[SCATActionHandler delegate](self, "delegate"));
    v16 = (void *)objc_claimAutoreleasedReturnValue([v15 focusContextForActionHandler:self]);
    objc_msgSend( v14,  "actionHandlerForUI:willPerformDelayedActionOnContext:withCount:",  self,  v16,  -[SCATActionHandler actionCount](self, "actionCount"));

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SCATActionHandler actionTimeoutTimer](self, "actionTimeoutTimer"));
    -[SCATActionHandler timeoutDuration](self, "timeoutDuration");
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1000707B0;
    v18[3] = &unk_100121F58;
    v18[4] = self;
    BOOL v19 = v10;
    objc_msgSend(v17, "afterDelay:processBlock:", v18);
  }
}

- (void)cancelPendingAction
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[SCATActionHandler actionTimeoutTimer](self, "actionTimeoutTimer"));
  unsigned int v4 = [v3 isPending];

  if (v4)
  {
    -[SCATActionHandler setActionCount:](self, "setActionCount:", 0LL);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATActionHandler actionTimeoutTimer](self, "actionTimeoutTimer"));
    [v5 cancel];

    unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATActionHandler uiDelegate](self, "uiDelegate"));
    [v6 actionHandlerForUIDidCancelPendingAction:self];

    int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[SCATActionHandler delegate](self, "delegate"));
    char v8 = objc_opt_respondsToSelector(v7, "actionHandlerDidCancelPendingAction:");

    if ((v8 & 1) != 0)
    {
      id v9 = (id)objc_claimAutoreleasedReturnValue(-[SCATActionHandler delegate](self, "delegate"));
      [v9 actionHandlerDidCancelPendingAction:self];
    }
  }

- (BOOL)isPending
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SCATActionHandler actionTimeoutTimer](self, "actionTimeoutTimer"));
  unsigned __int8 v3 = [v2 isPending];

  return v3;
}

- (void)_handleFireActionAndResumeAutoscanning:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SCATActionHandler uiDelegate](self, "uiDelegate"));
  [v5 actionHandlerForUIWillFireAction:self];

  unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[SCATActionHandler delegate](self, "delegate"));
  char v7 = objc_opt_respondsToSelector(v6, "actionHandlerDidFireAction:");

  if ((v7 & 1) != 0)
  {
    char v8 = (void *)objc_claimAutoreleasedReturnValue(-[SCATActionHandler delegate](self, "delegate"));
    [v8 actionHandlerDidFireAction:self];
  }

  -[SCATActionHandler setActionCount:](self, "setActionCount:", 0LL);
  if (v3)
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue(+[SCATScannerManager sharedManager](&OBJC_CLASS___SCATScannerManager, "sharedManager"));
    [v9 resumeAutoscanning];
  }

- (void)_resetWithActionSource:(id)a3
{
  id v4 = a3;
  -[SCATActionHandler setActionCount:](self, "setActionCount:", 0LL);
  -[SCATActionHandler setDelegate:](self, "setDelegate:", v4);
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (SCATActionHandlerDelegate)delegate
{
  return (SCATActionHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (SCATActionHandlerUIDelegate)uiDelegate
{
  return (SCATActionHandlerUIDelegate *)objc_loadWeakRetained((id *)&self->_uiDelegate);
}

- (void)setUiDelegate:(id)a3
{
}

- (AXDispatchTimer)actionTimeoutTimer
{
  return self->_actionTimeoutTimer;
}

- (void)setActionTimeoutTimer:(id)a3
{
}

- (unint64_t)actionCount
{
  return self->_actionCount;
}

- (void)setActionCount:(unint64_t)a3
{
  self->_actionCount = a3;
}

- (double)timeoutDuration
{
  return self->_timeoutDuration;
}

- (void)setTimeoutDuration:(double)a3
{
  self->_timeoutDuration = a3;
}

- (void).cxx_destruct
{
}

@end