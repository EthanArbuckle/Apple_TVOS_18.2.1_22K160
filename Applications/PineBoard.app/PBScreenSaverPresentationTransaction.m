@interface PBScreenSaverPresentationTransaction
- ($307AF99ED8495AD501ABB6C009BFDA17)context;
- (BOOL)_canBeInterrupted;
- (BOOL)isAnimated;
- (BSInvalidatable)workspaceTransitionLock;
- (NSDictionary)options;
- (PBScreenSaverContentPresentingViewController)screenSaverViewController;
- (PBScreenSaverPresentationTransaction)initWithScreenSaverViewController:(id)a3 workspace:(id)a4 animated:(BOOL)a5 options:(id)a6;
- (PBWorkspace)workspace;
- (id)_defaultAppAnimationTransaction;
- (id)_defaultAppAnimationTransactionWithSplitViewActive:(BOOL)a3;
- (void)_begin;
- (void)_didComplete;
- (void)_prepareKioskAnimationInTransaction:(id)a3 completion:(id)a4;
@end

@implementation PBScreenSaverPresentationTransaction

- (PBScreenSaverPresentationTransaction)initWithScreenSaverViewController:(id)a3 workspace:(id)a4 animated:(BOOL)a5 options:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___PBScreenSaverPresentationTransaction;
  v14 = -[PBScreenSaverPresentationTransaction init](&v19, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_screenSaverViewController, a3);
    objc_storeStrong((id *)&v15->_workspace, a4);
    v16 = (NSDictionary *)[v13 copy];
    options = v15->_options;
    v15->_options = v16;

    v15->_animated = a5;
  }

  return v15;
}

- (BOOL)_canBeInterrupted
{
  return 1;
}

- (void)_begin
{
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___PBScreenSaverPresentationTransaction;
  -[PBScreenSaverPresentationTransaction _begin](&v21, "_begin");
  BOOL v3 = -[PBWorkspace isLayoutStyleActive:](self->_workspace, "isLayoutStyleActive:", 1LL);
  if (v3
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance")),
        v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentApplicationSceneHandle]),
        unsigned int v6 = [v5 isDefaultKioskAppScene],
        v5,
        v4,
        !v6))
  {
    v15 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue( -[PBWorkspace acquireEventQueueLockForReason:]( self->_workspace,  "acquireEventQueueLockForReason:",  @"screen saver presentation"));
    workspaceTransitionLock = self->_workspaceTransitionLock;
    self->_workspaceTransitionLock = v15;

LABEL_7:
    id v13 = (PBWaitForDefaultKioskSceneTransaction *)objc_claimAutoreleasedReturnValue( -[PBScreenSaverPresentationTransaction _defaultAppAnimationTransactionWithSplitViewActive:]( self,  "_defaultAppAnimationTransactionWithSplitViewActive:",  v3));
    -[PBScreenSaverPresentationTransaction addChildTransaction:withSchedulingPolicy:]( self,  "addChildTransaction:withSchedulingPolicy:",  v13,  1LL);
    goto LABEL_8;
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBAppSwitcherManager defaultManager](&OBJC_CLASS___PBAppSwitcherManager, "defaultManager"));
  unsigned __int8 v8 = [v7 isActive];

  v9 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue( -[PBWorkspace acquireEventQueueLockForReason:]( self->_workspace,  "acquireEventQueueLockForReason:",  @"screen saver presentation"));
  v10 = self->_workspaceTransitionLock;
  self->_workspaceTransitionLock = v9;

  if ((v8 & 1) != 0 || (sub_1001C9EB0() & 1) != 0) {
    goto LABEL_7;
  }
  id v11 = objc_alloc_init(&OBJC_CLASS___PBWaitForDefaultKioskSceneTransaction);
  -[PBScreenSaverPresentationTransaction addChildTransaction:withSchedulingPolicy:]( self,  "addChildTransaction:withSchedulingPolicy:",  v11,  0LL);
  objc_initWeak(&location, self);
  id v12 = objc_alloc(&OBJC_CLASS___TVSBlockTransaction);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10015FEA0;
  v17[3] = &unk_1003D22F0;
  objc_copyWeak(&v19, &location);
  id v13 = v11;
  v18 = v13;
  id v14 = [v12 initWithBlock:v17 failsForChildTransaction:&stru_1003D9A38];
  -[PBScreenSaverPresentationTransaction addChildTransaction:withSchedulingPolicy:]( self,  "addChildTransaction:withSchedulingPolicy:",  v14,  1LL);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
LABEL_8:
}

- (void)_didComplete
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBScreenSaverPresentationTransaction;
  -[PBScreenSaverPresentationTransaction _didComplete](&v4, "_didComplete");
  -[BSInvalidatable invalidate](self->_workspaceTransitionLock, "invalidate");
  workspaceTransitionLock = self->_workspaceTransitionLock;
  self->_workspaceTransitionLock = 0LL;
}

- (id)_defaultAppAnimationTransaction
{
  return (id)objc_claimAutoreleasedReturnValue( -[PBScreenSaverPresentationTransaction _defaultAppAnimationTransactionWithSplitViewActive:]( self,  "_defaultAppAnimationTransactionWithSplitViewActive:",  0LL));
}

- (id)_defaultAppAnimationTransactionWithSplitViewActive:(BOOL)a3
{
  objc_super v4 = &off_1003CE3F8;
  id v5 = objc_alloc_init(*v4);
  [v5 setScreenSaverViewController:self->_screenSaverViewController];
  [v5 setAnimated:self->_animated];
  return v5;
}

- (void)_prepareKioskAnimationInTransaction:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  if (-[FBScene isActive](self->_context.defaultKioskScene, "isActive"))
  {
    objc_initWeak(location, self);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_1001602A8;
    v16[3] = &unk_1003D9A60;
    objc_copyWeak(&v19, location);
    id v17 = v6;
    v18 = v7;
    unsigned __int8 v8 = (void *)objc_claimAutoreleasedReturnValue( +[BSActionResponder responderWithHandler:]( &OBJC_CLASS___BSActionResponder,  "responderWithHandler:",  v16));
    v9 = &_dispatch_main_q;
    [v8 setQueue:&_dispatch_main_q];

    id v10 = [[PBSPrepareKioskScreenSaverAnimationAction alloc] initWithAnimationDirection:0 responder:v8];
    defaultKioskScene = self->_context.defaultKioskScene;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v10));
    -[FBScene sendActions:](defaultKioskScene, "sendActions:", v12);

    objc_destroyWeak(&v19);
    objc_destroyWeak(location);
  }

  else
  {
    id v13 = sub_100083CA8();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "The kiosk app is not ready to animate, reverting to default animation",  (uint8_t *)location,  2u);
    }

    v15 = (void *)objc_claimAutoreleasedReturnValue( -[PBScreenSaverPresentationTransaction _defaultAppAnimationTransaction]( self,  "_defaultAppAnimationTransaction"));
    [v6 addChildTransaction:v15 withSchedulingPolicy:1];

    v7[2](v7);
  }
}

- (PBScreenSaverContentPresentingViewController)screenSaverViewController
{
  return self->_screenSaverViewController;
}

- (PBWorkspace)workspace
{
  return self->_workspace;
}

- (NSDictionary)options
{
  return self->_options;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- ($307AF99ED8495AD501ABB6C009BFDA17)context
{
  return ($307AF99ED8495AD501ABB6C009BFDA17)self->_context.defaultKioskScene;
}

- (BSInvalidatable)workspaceTransitionLock
{
  return self->_workspaceTransitionLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0LL);
  objc_storeStrong((id *)&self->_workspace, 0LL);
  objc_storeStrong((id *)&self->_screenSaverViewController, 0LL);
}

@end