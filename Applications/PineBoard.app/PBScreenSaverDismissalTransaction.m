@interface PBScreenSaverDismissalTransaction
- ($307AF99ED8495AD501ABB6C009BFDA17)context;
- (BOOL)_canBeInterrupted;
- (BOOL)isAnimated;
- (BOOL)shouldApplyStartValues;
- (BOOL)shouldUpdateWallpaper;
- (BSInvalidatable)workspaceTransitionLock;
- (FBSceneSnapshot)sceneSnapshot;
- (PBScreenSaverContentPresentingViewController)screenSaverViewController;
- (PBScreenSaverDismissalTransaction)initWithScreenSaverViewController:(id)a3 sceneSnapshot:(id)a4 workspace:(id)a5 animated:(BOOL)a6 updateWallpaper:(BOOL)a7 applyStartValues:(BOOL)a8;
- (PBWorkspace)workspace;
- (id)_createScreenshotTransaction;
- (id)_defaultAppAnimationTransaction;
- (id)_defaultAppAnimationTransactionWithSplitViewActive:(BOOL)a3;
- (void)_begin;
- (void)_didComplete;
- (void)_didFinishWork;
- (void)_prepareKioskAnimationInTransaction:(id)a3 completion:(id)a4;
@end

@implementation PBScreenSaverDismissalTransaction

- (PBScreenSaverDismissalTransaction)initWithScreenSaverViewController:(id)a3 sceneSnapshot:(id)a4 workspace:(id)a5 animated:(BOOL)a6 updateWallpaper:(BOOL)a7 applyStartValues:(BOOL)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___PBScreenSaverDismissalTransaction;
  v18 = -[PBScreenSaverDismissalTransaction init](&v21, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_screenSaverViewController, a3);
    objc_storeStrong((id *)&v19->_sceneSnapshot, a4);
    objc_storeStrong((id *)&v19->_workspace, a5);
    v19->_animated = a6;
    v19->_shouldUpdateWallpaper = a7;
    v19->_shouldApplyStartValues = a8;
  }

  return v19;
}

- (BOOL)_canBeInterrupted
{
  return 0;
}

- (void)_begin
{
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___PBScreenSaverDismissalTransaction;
  -[PBScreenSaverDismissalTransaction _begin](&v20, "_begin");
  BOOL v3 = -[PBWorkspace isLayoutStyleActive:](self->_workspace, "isLayoutStyleActive:", 1LL);
  if (v3
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance")),
        v5 = (void *)objc_claimAutoreleasedReturnValue([v4 currentApplicationSceneHandle]),
        unsigned int v6 = [v5 isDefaultKioskAppScene],
        v5,
        v4,
        !v6))
  {
    unsigned int v8 = 0;
  }

  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBAppSwitcherManager defaultManager](&OBJC_CLASS___PBAppSwitcherManager, "defaultManager"));
    unsigned int v8 = [v7 isActive] ^ 1;
  }

  v9 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue( -[PBWorkspace acquireEventQueueLockForReason:]( self->_workspace,  "acquireEventQueueLockForReason:",  @"screen saver dismissal"));
  workspaceTransitionLock = self->_workspaceTransitionLock;
  self->_workspaceTransitionLock = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue( -[PBScreenSaverDismissalTransaction _createScreenshotTransaction]( self,  "_createScreenshotTransaction"));
  -[PBScreenSaverDismissalTransaction addChildTransaction:withSchedulingPolicy:]( self,  "addChildTransaction:withSchedulingPolicy:",  v11,  0LL);
  if (v8 && (sub_1001C9EB0() & 1) == 0)
  {
    v13 = objc_alloc_init(&OBJC_CLASS___PBWaitForDefaultKioskSceneTransaction);
    -[PBScreenSaverDismissalTransaction addChildTransaction:withSchedulingPolicy:]( self,  "addChildTransaction:withSchedulingPolicy:",  v13,  0LL);
    objc_initWeak(&location, self);
    id v14 = objc_alloc(&OBJC_CLASS___TVSBlockTransaction);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100127F18;
    v16[3] = &unk_1003D22F0;
    objc_copyWeak(&v18, &location);
    v12 = v13;
    id v17 = v12;
    id v15 = [v14 initWithBlock:v16 failsForChildTransaction:&stru_1003D8728];
    -[PBScreenSaverDismissalTransaction addChildTransaction:withSchedulingPolicy:]( self,  "addChildTransaction:withSchedulingPolicy:",  v15,  1LL);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  else
  {
    v12 = (PBWaitForDefaultKioskSceneTransaction *)objc_claimAutoreleasedReturnValue( -[PBScreenSaverDismissalTransaction _defaultAppAnimationTransactionWithSplitViewActive:]( self,  "_defaultAppAnimationTransactionWithSplitViewActive:",  v3));
    -[PBScreenSaverDismissalTransaction addChildTransaction:withSchedulingPolicy:]( self,  "addChildTransaction:withSchedulingPolicy:",  v12,  1LL);
  }
}

- (void)_didFinishWork
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBScreenSaverDismissalTransaction;
  -[PBScreenSaverDismissalTransaction _didFinishWork](&v4, "_didFinishWork");
  sceneSnapshot = self->_sceneSnapshot;
  self->_sceneSnapshot = 0LL;
}

- (void)_didComplete
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBScreenSaverDismissalTransaction;
  -[PBScreenSaverDismissalTransaction _didComplete](&v4, "_didComplete");
  -[BSInvalidatable invalidate](self->_workspaceTransitionLock, "invalidate");
  workspaceTransitionLock = self->_workspaceTransitionLock;
  self->_workspaceTransitionLock = 0LL;
}

- (id)_defaultAppAnimationTransaction
{
  return (id)objc_claimAutoreleasedReturnValue( -[PBScreenSaverDismissalTransaction _defaultAppAnimationTransactionWithSplitViewActive:]( self,  "_defaultAppAnimationTransactionWithSplitViewActive:",  0LL));
}

- (id)_defaultAppAnimationTransactionWithSplitViewActive:(BOOL)a3
{
  objc_super v4 = off_1003CE3F0;
  id v5 = objc_alloc_init(*v4);
  [v5 setScreenSaverViewController:self->_screenSaverViewController];
  [v5 setAnimated:self->_animated];
  [v5 setShouldApplyStartValues:self->_shouldApplyStartValues];
  return v5;
}

- (void)_prepareKioskAnimationInTransaction:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(void))a4;
  if (-[FBScene isActive](self->_context.defaultKioskScene, "isActive"))
  {
    objc_initWeak(location, self);
    id v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472LL;
    id v18 = sub_10012838C;
    v19 = &unk_1003D8750;
    objc_copyWeak(&v23, location);
    objc_super v20 = self;
    id v21 = v6;
    v22 = v7;
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[BSActionResponder responderWithHandler:]( &OBJC_CLASS___BSActionResponder,  "responderWithHandler:",  &v16));
    v9 = &_dispatch_main_q;
    objc_msgSend(v8, "setQueue:", &_dispatch_main_q, v16, v17, v18, v19, v20);

    id v10 = [[PBSPrepareKioskScreenSaverAnimationAction alloc] initWithAnimationDirection:1 responder:v8];
    defaultKioskScene = self->_context.defaultKioskScene;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v10));
    -[FBScene sendActions:](defaultKioskScene, "sendActions:", v12);

    objc_destroyWeak(&v23);
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

    id v15 = (void *)objc_claimAutoreleasedReturnValue( -[PBScreenSaverDismissalTransaction _defaultAppAnimationTransaction]( self,  "_defaultAppAnimationTransaction"));
    [v6 addChildTransaction:v15 withSchedulingPolicy:1];

    v7[2](v7);
  }
}

- (id)_createScreenshotTransaction
{
  return  -[_PBScreenSaverDismissalScreenshotTransaction initWithScreenSaverViewController:sceneSnapshot:shouldUpdateWallpaper:]( objc_alloc(&OBJC_CLASS____PBScreenSaverDismissalScreenshotTransaction),  "initWithScreenSaverViewController:sceneSnapshot:shouldUpdateWallpaper:",  self->_screenSaverViewController,  self->_sceneSnapshot,  self->_shouldUpdateWallpaper);
}

- (PBScreenSaverContentPresentingViewController)screenSaverViewController
{
  return self->_screenSaverViewController;
}

- (FBSceneSnapshot)sceneSnapshot
{
  return self->_sceneSnapshot;
}

- (PBWorkspace)workspace
{
  return self->_workspace;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (BOOL)shouldUpdateWallpaper
{
  return self->_shouldUpdateWallpaper;
}

- (BOOL)shouldApplyStartValues
{
  return self->_shouldApplyStartValues;
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
  objc_storeStrong((id *)&self->_workspace, 0LL);
  objc_storeStrong((id *)&self->_sceneSnapshot, 0LL);
  objc_storeStrong((id *)&self->_screenSaverViewController, 0LL);
}

@end