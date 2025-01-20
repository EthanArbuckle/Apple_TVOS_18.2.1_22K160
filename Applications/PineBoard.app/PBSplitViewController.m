@interface PBSplitViewController
+ (CGRect)_boundsForSidebarInWorkspaceGeometry:(id)a3;
+ (id)_animationSettings;
+ (id)keyPathsForValuesAffectingIsPresenting;
- (BOOL)controlsViewControllerShouldShowStartPictureInPicture:(id)a3;
- (BOOL)isPresenting;
- (BOOL)isVisible;
- (PBApplication)activeApplication;
- (PBSplitViewController)initWithPresentationHandler:(id)a3 systemGestureManager:(id)a4 workspace:(id)a5;
- (PBSplitViewControllerDelegate)delegate;
- (PBSplitViewControlsViewController)controlsViewController;
- (PBSplitViewInwardSizing)geometry;
- (id)stateDumpBuilder;
- (void)_notifyDelegateDidDismiss;
- (void)_notifyDelegateDidHide;
- (void)_notifyDelegateWillDismiss;
- (void)_notifyDelegateWillHide;
- (void)_notifyDelegateWillPresent;
- (void)_notifyDelegateWillUnhide;
- (void)_performWorkspaceLayout:(int64_t)a3 transitionRequestWithCompletion:(id)a4;
- (void)controlsViewController:(id)a3 didToggleVisibility:(BOOL)a4;
- (void)controlsViewControllerDidRequestClosing:(id)a3;
- (void)controlsViewControllerDidRequestExpanding:(id)a3;
- (void)controlsViewControllerDidRequestHiding:(id)a3;
- (void)controlsViewControllerDidRequestStartPictureInPicture:(id)a3;
- (void)dealloc;
- (void)dismissWithCompletion:(id)a3;
- (void)overlayController:(id)a3 didDismissSession:(id)a4;
- (void)overlayController:(id)a3 didPresentSession:(id)a4;
- (void)overlayController:(id)a3 willDismissSession:(id)a4 withContext:(id)a5;
- (void)overlayController:(id)a3 willPresentSession:(id)a4;
- (void)presentApplication:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)splitViewPresentationViewControllerRequestsDismissal:(id)a3 animated:(BOOL)a4;
- (void)splitViewStateMachine:(id)a3 dismissWithContext:(id)a4 completion:(id)a5;
- (void)splitViewStateMachine:(id)a3 hideWithCompletion:(id)a4;
- (void)splitViewStateMachine:(id)a3 invalidateWithCompletion:(id)a4;
- (void)splitViewStateMachine:(id)a3 prepareWithContext:(id)a4 completion:(id)a5;
- (void)splitViewStateMachine:(id)a3 presentWithContext:(id)a4 completion:(id)a5;
- (void)splitViewStateMachine:(id)a3 unhideWithCompletion:(id)a4;
@end

@implementation PBSplitViewController

- (PBSplitViewController)initWithPresentationHandler:(id)a3 systemGestureManager:(id)a4 workspace:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"presentationHandler != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100283BD0(a2);
    }
LABEL_15:
    _bs_set_crash_log_message([v34 UTF8String]);
    __break(0);
    JUMPOUT(0x100126814LL);
  }

  if (!v10)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"systemGestureManager != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100283C7C(a2);
    }
    _bs_set_crash_log_message([v35 UTF8String]);
    __break(0);
    JUMPOUT(0x100126878LL);
  }

  v12 = v11;
  if (!v11)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"workspace != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100283D28(a2);
    }
    goto LABEL_15;
  }

  v36.receiver = self;
  v36.super_class = (Class)&OBJC_CLASS___PBSplitViewController;
  v13 = -[PBSplitViewController init](&v36, "init");
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_workspace, a5);
    objc_storeStrong((id *)&v14->_systemGestureManager, a4);
    id v15 = sub_10007BE74();
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    geometry = v14->_geometry;
    v14->_geometry = (PBSplitViewOutwardSizing *)v16;

    v18 = v14->_geometry;
    [(id)objc_opt_class(v14) _boundsForSidebarInWorkspaceGeometry:v14->_workspace];
    -[PBSplitViewOutwardSizing setFrame:](v18, "setFrame:");
    v19 = -[PBSplitViewStateMachine initWithTransitionHandler:]( objc_alloc(&OBJC_CLASS___PBSplitViewStateMachine),  "initWithTransitionHandler:",  v14);
    stateMachine = v14->_stateMachine;
    v14->_stateMachine = v19;

    v21 = v14->_stateMachine;
    id v22 = sub_1000F7384();
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    -[PBSplitViewStateMachine setLog:](v21, "setLog:", v23);

    v24 = objc_alloc(&OBJC_CLASS___PBSystemOverlayController);
    v25 = (objc_class *)objc_opt_class(v14);
    v26 = NSStringFromClass(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v28 = -[PBSystemOverlayController initWithName:layoutLevel:presentationHandler:delegate:]( v24,  "initWithName:layoutLevel:presentationHandler:delegate:",  v27,  5LL,  v9,  v14);
    overlayController = v14->_overlayController;
    v14->_overlayController = v28;

    id v30 = sub_1000F7E4C(&_dispatch_main_q, v14);
    uint64_t v31 = objc_claimAutoreleasedReturnValue(v30);
    stateCaptureHandle = v14->_stateCaptureHandle;
    v14->_stateCaptureHandle = (BSInvalidatable *)v31;
  }

  return v14;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBSplitViewController;
  -[PBSplitViewController dealloc](&v3, "dealloc");
}

- (BOOL)isPresenting
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlayController activeSession](self->_overlayController, "activeSession"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

+ (id)keyPathsForValuesAffectingIsPresenting
{
  return (id)objc_claimAutoreleasedReturnValue( +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  @"overlayController.activeSession"));
}

- (BOOL)isVisible
{
  return -[PBSplitViewStateMachine isPresented](self->_stateMachine, "isPresented");
}

- (PBApplication)activeApplication
{
  if (-[PBSplitViewController isPresenting](self, "isPresenting"))
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationViewController);
    v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained application]);
  }

  else
  {
    v4 = 0LL;
  }

  return (PBApplication *)v4;
}

- (void)presentApplication:(id)a3 completion:(id)a4
{
}

- (void)dismissWithCompletion:(id)a3
{
}

- (void)splitViewStateMachine:(id)a3 prepareWithContext:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(void))a5;
  id v10 = a4;
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 application]);
  id v12 = sub_1000F7384();
  v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleIdentifier]);
    *(_DWORD *)buf = 138412290;
    v27 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Presenting application {bundleID=%@}",  buf,  0xCu);
  }

  id v15 = -[PBSplitViewPresentationViewController initWithApplication:workspace:geometry:delegate:]( objc_alloc(&OBJC_CLASS___PBSplitViewPresentationViewController),  "initWithApplication:workspace:geometry:delegate:",  v11,  self->_workspace,  self->_geometry,  self);
  [v10 setViewController:v15];

  objc_storeWeak((id *)&self->_presentationViewController, v15);
  uint64_t v16 = -[PBSplitViewControlsViewController initWithGeometry:delegate:]( objc_alloc(&OBJC_CLASS___PBSplitViewControlsViewController),  "initWithGeometry:delegate:",  self->_geometry,  self);
  controlsViewController = self->_controlsViewController;
  self->_controlsViewController = v16;

  systemGestureManager = self->_systemGestureManager;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = sub_100126C18;
  v24[3] = &unk_1003D65B8;
  id v25 = v8;
  id v19 = v8;
  v20 = -[PBSystemGestureManager newHandleForSystemGesture:actionHandler:]( systemGestureManager,  "newHandleForSystemGesture:actionHandler:",  51LL,  v24);
  unhideGesture = self->_unhideGesture;
  self->_unhideGesture = v20;

  id v22 = -[PBWorkspaceHandle newApplicationSceneDeactivationAssertionWithReason:]( self->_workspace,  "newApplicationSceneDeactivationAssertionWithReason:",  10LL);
  stashedSceneDeactivationAssertion = self->_stashedSceneDeactivationAssertion;
  self->_stashedSceneDeactivationAssertion = v22;

  v9[2](v9);
}

- (void)splitViewStateMachine:(id)a3 presentWithContext:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 viewController]);
  id v10 = objc_alloc_init(&OBJC_CLASS___PBMutableSystemOverlayPresentationRequest);
  id v11 = (objc_class *)objc_opt_class(self);
  id v12 = NSStringFromClass(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  -[PBMutableSystemOverlayPresentationRequest setIdentifier:](v10, "setIdentifier:", v13);

  id v14 = [v8 animated];
  -[PBMutableSystemOverlayPresentationRequest setAnimated:](v10, "setAnimated:", v14);
  -[PBMutableSystemOverlayPresentationRequest setProvider:](v10, "setProvider:", v9);
  v23 = @"kAnimationSettings";
  id v15 = [(id)objc_opt_class(self) _animationSettings];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v24 = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v24,  &v23,  1LL));
  -[PBMutableSystemOverlayPresentationRequest setClientOptions:](v10, "setClientOptions:", v17);

  overlayController = self->_overlayController;
  id v19 = -[PBMutableSystemOverlayPresentationRequest copy](v10, "copy");
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472LL;
  v21[2] = sub_100126DD8;
  v21[3] = &unk_1003CFF30;
  id v22 = v7;
  id v20 = v7;
  -[PBSystemOverlayController presentWithRequest:completion:]( overlayController,  "presentWithRequest:completion:",  v19,  v21);
}

- (void)splitViewStateMachine:(id)a3 dismissWithContext:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = sub_1000F7384();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Dismissing active presentation", buf, 2u);
  }

  -[PBSplitViewController _notifyDelegateWillDismiss](self, "_notifyDelegateWillDismiss");
  id v11 = objc_alloc_init(&OBJC_CLASS___PBMutableSystemOverlayDismissalRequest);
  id v12 = (objc_class *)objc_opt_class(self);
  v13 = NSStringFromClass(v12);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  -[PBMutableSystemOverlayDismissalRequest setIdentifier:](v11, "setIdentifier:", v14);

  id v15 = [v8 animated];
  -[PBMutableSystemOverlayDismissalRequest setAnimated:](v11, "setAnimated:", v15);
  id v25 = @"kAnimationSettings";
  id v16 = [(id)objc_opt_class(self) _animationSettings];
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v26 = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v26,  &v25,  1LL));
  -[PBMutableSystemOverlayDismissalRequest setClientOptions:](v11, "setClientOptions:", v18);

  overlayController = self->_overlayController;
  id v20 = -[PBMutableSystemOverlayDismissalRequest copy](v11, "copy");
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100126FCC;
  v22[3] = &unk_1003CFF30;
  id v23 = v7;
  id v21 = v7;
  -[PBSystemOverlayController dismissWithRequest:completion:]( overlayController,  "dismissWithRequest:completion:",  v20,  v22);
}

- (void)splitViewStateMachine:(id)a3 hideWithCompletion:(id)a4
{
  id v5 = a4;
  -[PBSystemGestureHandle acquire](self->_unhideGesture, "acquire");
  stashedSceneDeactivationAssertion = self->_stashedSceneDeactivationAssertion;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationViewController);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained sceneDeactivationPredicate]);
  -[UIApplicationSceneDeactivationAssertion acquireWithPredicate:transitionContext:]( stashedSceneDeactivationAssertion,  "acquireWithPredicate:transitionContext:",  v8,  0LL);

  -[PBSplitViewController _notifyDelegateWillHide](self, "_notifyDelegateWillHide");
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100127180;
  v19[3] = &unk_1003D86C0;
  v19[4] = self;
  id v20 = v5;
  id v9 = v5;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_1001271B4;
  v17[3] = &unk_1003CFF08;
  id v10 = (id)objc_claimAutoreleasedReturnValue( +[BSBlockSentinel sentinelWithSignalCount:signalHandler:]( &OBJC_CLASS___BSBlockSentinel,  "sentinelWithSignalCount:signalHandler:",  2LL,  v19));
  id v18 = v10;
  -[PBSplitViewController _performWorkspaceLayout:transitionRequestWithCompletion:]( self,  "_performWorkspaceLayout:transitionRequestWithCompletion:",  0LL,  v17);
  id v11 = objc_loadWeakRetained((id *)&self->_presentationViewController);
  id v12 = [(id)objc_opt_class(self) _animationSettings];
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_1001271CC;
  v15[3] = &unk_1003CFEB8;
  v15[4] = self;
  id v16 = v10;
  id v14 = v10;
  [v11 hideSplitViewWithAnimationSettings:v13 completion:v15];
}

- (void)splitViewStateMachine:(id)a3 unhideWithCompletion:(id)a4
{
  id v5 = a4;
  -[UIApplicationSceneDeactivationAssertion relinquish](self->_stashedSceneDeactivationAssertion, "relinquish");
  -[PBSystemGestureHandle relinquish](self->_unhideGesture, "relinquish");
  -[PBSplitViewController _notifyDelegateWillUnhide](self, "_notifyDelegateWillUnhide");
  -[PBSystemOverlayController resume](self->_overlayController, "resume");
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100127368;
  v16[3] = &unk_1003D86E8;
  id v17 = v5;
  id v6 = v5;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100127388;
  v14[3] = &unk_1003CFF08;
  id v7 = (id)objc_claimAutoreleasedReturnValue( +[BSBlockSentinel sentinelWithSignalCount:signalHandler:]( &OBJC_CLASS___BSBlockSentinel,  "sentinelWithSignalCount:signalHandler:",  2LL,  v16));
  id v15 = v7;
  -[PBSplitViewController _performWorkspaceLayout:transitionRequestWithCompletion:]( self,  "_performWorkspaceLayout:transitionRequestWithCompletion:",  1LL,  v14);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationViewController);
  id v9 = [(id)objc_opt_class(self) _animationSettings];
  id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1001273A0;
  v12[3] = &unk_1003CFF08;
  id v13 = v7;
  id v11 = v7;
  [WeakRetained unhideSplitViewWithAnimationSettings:v10 completion:v12];
}

- (void)splitViewStateMachine:(id)a3 invalidateWithCompletion:(id)a4
{
  overlayController = self->_overlayController;
  id v6 = (void (**)(void))a4;
  -[PBSystemOverlayController resume](overlayController, "resume");
  stashedSceneDeactivationAssertion = self->_stashedSceneDeactivationAssertion;
  self->_stashedSceneDeactivationAssertion = 0LL;

  -[PBSystemGestureHandle invalidate](self->_unhideGesture, "invalidate");
  unhideGesture = self->_unhideGesture;
  self->_unhideGesture = 0LL;

  controlsViewController = self->_controlsViewController;
  self->_controlsViewController = 0LL;

  objc_storeWeak((id *)&self->_presentationViewController, 0LL);
  v6[2](v6);
}

- (void)overlayController:(id)a3 willPresentSession:(id)a4
{
}

- (void)overlayController:(id)a3 didPresentSession:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationViewController);
  [WeakRetained showEditingHint];
}

- (void)overlayController:(id)a3 willDismissSession:(id)a4 withContext:(id)a5
{
}

- (void)overlayController:(id)a3 didDismissSession:(id)a4
{
}

- (void)splitViewPresentationViewControllerRequestsDismissal:(id)a3 animated:(BOOL)a4
{
  if (a4) {
    uint64_t v5 = -[PBSystemOverlayController isPaused](self->_overlayController, "isPaused", a3) ^ 1;
  }
  else {
    uint64_t v5 = 0LL;
  }
  -[PBSplitViewStateMachine dismissAnimated:completion:](self->_stateMachine, "dismissAnimated:completion:", v5, 0LL);
}

- (void)controlsViewController:(id)a3 didToggleVisibility:(BOOL)a4
{
  if (a4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationViewController);
    [WeakRetained hideEditingHint];
  }

- (void)controlsViewControllerDidRequestHiding:(id)a3
{
}

- (void)controlsViewControllerDidRequestExpanding:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationViewController);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained application]);

  -[PBSplitViewStateMachine dismissAnimated:completion:](self->_stateMachine, "dismissAnimated:completion:", 1LL, 0LL);
  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 splitViewController:self requestsApplicationLaunch:v5];
  }
}

- (void)controlsViewControllerDidRequestClosing:(id)a3
{
}

- (BOOL)controlsViewControllerShouldShowStartPictureInPicture:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationViewController);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained application]);

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    unsigned __int8 v7 = [v6 splitViewController:self shouldShowStartPictureInPictureForApplication:v5];
  }

  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)controlsViewControllerDidRequestStartPictureInPicture:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationViewController);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained application]);

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    unsigned int v7 = [v6 splitViewController:self startPictureInPictureForApplication:v5];

    if (v7) {
      -[PBSplitViewStateMachine dismissAnimated:completion:]( self->_stateMachine,  "dismissAnimated:completion:",  1LL,  0LL);
    }
  }
}

- (id)stateDumpBuilder
{
  id v3 = objc_alloc_init(&OBJC_CLASS___TVSStateDumpBuilder);
  id v4 = [v3 appendObject:self->_geometry withKey:@"geometry"];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlayController activeSession](self->_overlayController, "activeSession"));
  id v6 = [v3 appendObject:v5 withKey:@"overlayController.activeSession"];

  return v3;
}

- (void)_notifyDelegateWillPresent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained splitViewControllerWillPresent:self];
}

- (void)_notifyDelegateWillDismiss
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained splitViewControllerWillDismiss:self];
}

- (void)_notifyDelegateDidDismiss
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained splitViewControllerDidDismiss:self];
}

- (void)_notifyDelegateWillHide
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained splitViewControllerWillHide:self];
}

- (void)_notifyDelegateDidHide
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained splitViewControllerDidHide:self];
}

- (void)_notifyDelegateWillUnhide
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained splitViewControllerWillUnhide:self];
}

- (void)_performWorkspaceLayout:(int64_t)a3 transitionRequestWithCompletion:(id)a4
{
  id v6 = a4;
  unsigned int v7 = objc_alloc_init(&OBJC_CLASS___PBWorkspaceTransitionRequest);
  -[PBWorkspaceTransitionRequest setLayout:](v7, "setLayout:", a3);
  id v8 = [(id)objc_opt_class(self) _animationSettings];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[PBWorkspaceTransitionRequest setAnimationSettings:](v7, "setAnimationSettings:", v9);

  if (v6)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_100127958;
    v10[3] = &unk_1003CFF30;
    id v11 = v6;
    -[PBWorkspaceTransitionRequest addCompletionBlock:](v7, "addCompletionBlock:", v10);
  }

  -[PBWorkspaceHandle executeTransitionRequest:](self->_workspace, "executeTransitionRequest:", v7);
}

+ (CGRect)_boundsForSidebarInWorkspaceGeometry:(id)a3
{
  id v3 = a3;
  id v4 = sub_1000E3C90(1LL, v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 attributesForKey:@"application"]);
  [v3 bounds];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  if (sub_1001C9E00())
  {
    [v3 fullDisplayBounds];
    CGFloat v8 = v15;
    CGFloat v10 = v16;
    CGFloat v12 = v17;
    CGFloat v14 = v18;
  }

  double v19 = sub_100058BCC(v6, 0, v8, v10, v12, v14, v8, v10, v12);
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  v33.origin.double x = v8;
  v33.origin.CGFloat y = v10;
  v33.size.width = v12;
  v33.size.height = v14;
  double MaxX = CGRectGetMaxX(v33);
  v34.origin.double x = v19;
  v34.origin.CGFloat y = v21;
  v34.size.width = v23;
  v34.size.height = v25;
  double v27 = MaxX - CGRectGetMaxX(v34);
  CGFloat y = CGRectZero.origin.y;

  double x = CGRectZero.origin.x;
  double v30 = y;
  double v31 = v27;
  double v32 = v25;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.CGFloat y = v30;
  result.origin.double x = x;
  return result;
}

+ (id)_animationSettings
{
  return (id)objc_claimAutoreleasedReturnValue( +[BSSpringAnimationSettings settingsWithMass:stiffness:damping:]( &OBJC_CLASS___BSSpringAnimationSettings,  "settingsWithMass:stiffness:damping:",  1.0,  155.0,  28.0));
}

- (PBSplitViewInwardSizing)geometry
{
  return self->_geometry;
}

- (PBSplitViewControllerDelegate)delegate
{
  return (PBSplitViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (PBSplitViewControlsViewController)controlsViewController
{
  return self->_controlsViewController;
}

- (void).cxx_destruct
{
}

@end