@interface PBScreenSaverContentPresentingViewController
- (BOOL)acceptsEventFocus;
- (BOOL)allowsInteraction;
- (BOOL)expectsEventForwarding;
- (BOOL)isInterruptible;
- (BSAction)screenSaverPreparedAction;
- (BSWatchdog)screenSaverPreparedWatchdog;
- (FBSSceneDefinition)sceneDefinition;
- (FBSceneWorkspace)sceneWorkspace;
- (NSArray)transitionActions;
- (PBApplicationSceneViewController)sceneViewController;
- (PBCoordinatedTransitionToken)coordinatedTransitionToken;
- (PBSceneHandle)sceneHandle;
- (PBScreenSaverContentPresentingViewController)initWithCoder:(id)a3;
- (PBScreenSaverContentPresentingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PBScreenSaverContentPresentingViewController)initWithSceneWorkspace:(id)a3 sceneDefinition:(id)a4 layoutLevel:(int64_t)a5;
- (PBScreenSaverDismissalTransaction)dismissalTransaction;
- (PBScreenSaverPresentationTransaction)presentationTransaction;
- (PBSystemOverlayContentDelegate)contentDelegate;
- (UIApplicationSceneDeactivationAssertion)screensaverSceneDeactivationAssertion;
- (UIImageView)snapshotImageView;
- (UIViewController)childViewController;
- (id)scene:(id)a3 handleActions:(id)a4;
- (id)screenSaverPreparedCompletionBlock;
- (id)shouldDismissHandler;
- (id)transitionCoordinator:(id)a3 willDismissTransitionWithToken:(id)a4 withContext:(id)a5;
- (int64_t)layoutLevel;
- (void)_activateSceneWithCompletion:(id)a3;
- (void)_createDismissalTransactionAnimated:(BOOL)a3 shouldUpdateWallpaper:(BOOL)a4 shouldApplyStartValues:(BOOL)a5 withCompletion:(id)a6;
- (void)_receivedScenePreparedAction:(id)a3 forScene:(id)a4;
- (void)_updateSceneSettingsWithBlock:(id)a3;
- (void)_userInterfaceStyleDidChange;
- (void)dealloc;
- (void)dismissContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5;
- (void)prepareUIForSystemOverlayPresentationWithCompletion:(id)a3;
- (void)presentContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5;
- (void)sceneDidDeactivate:(id)a3 withError:(id)a4;
- (void)sceneWillDeactivate:(id)a3 withError:(id)a4;
- (void)screenSaverTransitionShowSnapshotImage:(id)a3;
- (void)screenSaverTransitionUpdatedAcceptEvents:(BOOL)a3;
- (void)setAcceptsEventFocus:(BOOL)a3;
- (void)setContentDelegate:(id)a3;
- (void)setScreenSaverPreparedCompletionBlock:(id)a3;
- (void)setScreensaverSceneDeactivationAssertion:(id)a3;
- (void)setShouldDismissHandler:(id)a3;
- (void)setTransitionActions:(id)a3;
@end

@implementation PBScreenSaverContentPresentingViewController

- (PBScreenSaverContentPresentingViewController)initWithSceneWorkspace:(id)a3 sceneDefinition:(id)a4 layoutLevel:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___PBScreenSaverContentPresentingViewController;
  v11 = -[PBScreenSaverContentPresentingViewController initWithNibName:bundle:]( &v20,  "initWithNibName:bundle:",  0LL,  0LL);
  v12 = v11;
  if (v11)
  {
    v11->_interruptible = 1;
    v11->_acceptsEventFocus = 0;
    objc_storeStrong((id *)&v11->_sceneWorkspace, a3);
    v13 = (FBSSceneDefinition *)[v10 copy];
    sceneDefinition = v12->_sceneDefinition;
    v12->_sceneDefinition = v13;

    v12->_layoutLevel = a5;
    uint64_t v15 = objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    transitionActions = v12->_transitionActions;
    v12->_transitionActions = (NSArray *)v15;

    uint64_t v21 = objc_opt_class(&OBJC_CLASS___UITraitUserInterfaceStyle);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
    id v18 =  -[PBScreenSaverContentPresentingViewController registerForTraitChanges:withAction:]( v12,  "registerForTraitChanges:withAction:",  v17,  "_userInterfaceStyleDidChange");
  }

  return v12;
}

- (PBScreenSaverContentPresentingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return 0LL;
}

- (PBScreenSaverContentPresentingViewController)initWithCoder:(id)a3
{
  return 0LL;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists"));
  [v3 invalidate];

  -[BSWatchdog invalidate](self->_screenSaverPreparedWatchdog, "invalidate");
  -[BSAction invalidate](self->_screenSaverPreparedAction, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBScreenSaverContentPresentingViewController;
  -[PBScreenSaverContentPresentingViewController dealloc](&v4, "dealloc");
}

- (BOOL)expectsEventForwarding
{
  return 1;
}

- (UIApplicationSceneDeactivationAssertion)screensaverSceneDeactivationAssertion
{
  screensaverSceneDeactivationAssertion = self->_screensaverSceneDeactivationAssertion;
  if (!screensaverSceneDeactivationAssertion)
  {
    objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
    v5 = (void *)objc_claimAutoreleasedReturnValue([v4 sceneDeactivationManager]);
    v6 = (UIApplicationSceneDeactivationAssertion *)[v5 newAssertionWithReason:7];
    v7 = self->_screensaverSceneDeactivationAssertion;
    self->_screensaverSceneDeactivationAssertion = v6;

    screensaverSceneDeactivationAssertion = self->_screensaverSceneDeactivationAssertion;
  }

  return screensaverSceneDeactivationAssertion;
}

- (UIViewController)childViewController
{
  return (UIViewController *)self->_sceneViewController;
}

- (void)screenSaverTransitionShowSnapshotImage:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBScreenSaverContentPresentingViewController view](self, "view"));
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  v14 = -[UIImageView initWithFrame:](objc_alloc(&OBJC_CLASS___UIImageView), "initWithFrame:", v7, v9, v11, v13);
  -[UIImageView setImage:](v14, "setImage:", v4);

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[PBScreenSaverContentPresentingViewController view](self, "view"));
  [v15 addSubview:v14];

  -[PBApplicationSceneViewController willMoveToParentViewController:]( self->_sceneViewController,  "willMoveToParentViewController:",  0LL);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneViewController view](self->_sceneViewController, "view"));
  [v16 removeFromSuperview];

  -[PBApplicationSceneViewController removeFromParentViewController]( self->_sceneViewController,  "removeFromParentViewController");
}

- (void)screenSaverTransitionUpdatedAcceptEvents:(BOOL)a3
{
  if (self->_acceptsEventFocus != a3)
  {
    BOOL v3 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue( -[PBScreenSaverContentPresentingViewController screensaverSceneDeactivationAssertion]( self,  "screensaverSceneDeactivationAssertion"));
    double v6 = v5;
    if (v3)
    {
      [v5 acquireWithPredicate:&stru_1003D66E0 transitionContext:0];

      id v7 = sub_100083C30();
      double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        double v9 = (void *)objc_claimAutoreleasedReturnValue( -[PBScreenSaverContentPresentingViewController screensaverSceneDeactivationAssertion]( self,  "screensaverSceneDeactivationAssertion"));
        uint64_t v10 = UIApplicationSceneDeactivationReasonDescription([v9 reason]);
        double v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
        int v15 = 138543362;
        v16 = v11;
        double v12 = "Acquired scene assertion for reason: %{public}@";
LABEL_7:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v15, 0xCu);
      }
    }

    else
    {
      [v5 relinquish];

      id v13 = sub_100083C30();
      double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        double v9 = (void *)objc_claimAutoreleasedReturnValue( -[PBScreenSaverContentPresentingViewController screensaverSceneDeactivationAssertion]( self,  "screensaverSceneDeactivationAssertion"));
        uint64_t v14 = UIApplicationSceneDeactivationReasonDescription([v9 reason]);
        double v11 = (void *)objc_claimAutoreleasedReturnValue(v14);
        int v15 = 138543362;
        v16 = v11;
        double v12 = "Relinquished scene assertion for reason: %{public}@";
        goto LABEL_7;
      }
    }

    -[PBScreenSaverContentPresentingViewController setAcceptsEventFocus:](self, "setAcceptsEventFocus:", v3);
  }

- (void)prepareUIForSystemOverlayPresentationWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_1000E8804;
  v22[3] = &unk_1003D0300;
  objc_copyWeak(&v24, &location);
  id v5 = v4;
  id v23 = v5;
  double v6 = objc_retainBlock(v22);
  id v7 = objc_retainBlock(v6);
  id screenSaverPreparedCompletionBlock = self->_screenSaverPreparedCompletionBlock;
  self->_id screenSaverPreparedCompletionBlock = v7;

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_1000E8858;
  v19[3] = &unk_1003D0C08;
  double v9 = v6;
  id v20 = v9;
  objc_copyWeak(&v21, &location);
  uint64_t v10 = objc_retainBlock(v19);
  double v11 = objc_alloc(&OBJC_CLASS___BSWatchdog);
  double v12 = &_dispatch_main_q;
  id v13 = -[BSWatchdog initWithTimeout:queue:completion:]( v11,  "initWithTimeout:queue:completion:",  &_dispatch_main_q,  v10,  1.0);
  screenSaverPreparedWatchdog = self->_screenSaverPreparedWatchdog;
  self->_screenSaverPreparedWatchdog = v13;

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_1000E88D4;
  v16[3] = &unk_1003D0C30;
  objc_copyWeak(&v18, &location);
  id v15 = v5;
  id v17 = v15;
  -[PBScreenSaverContentPresentingViewController _activateSceneWithCompletion:]( self,  "_activateSceneWithCompletion:",  v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

- (void)presentContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = -[PBScreenSaverContentPresentingViewController view](self, "view");
  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists"));
  if (v11)
  {
    double v12 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 sceneDeactivationManager]);

    [v13 beginTrackingScene:v11];
  }

  uint64_t v14 = -[PBApplicationSceneViewController initWithSceneHandle:layoutLevel:]( objc_alloc(&OBJC_CLASS___PBApplicationSceneViewController),  "initWithSceneHandle:layoutLevel:",  self->_sceneHandle,  self->_layoutLevel);
  sceneViewController = self->_sceneViewController;
  self->_sceneViewController = v14;

  -[PBApplicationSceneViewController setWallpaperEnabled:](self->_sceneViewController, "setWallpaperEnabled:", 0LL);
  -[PBApplicationSceneViewController setAllowSnapshots:](self->_sceneViewController, "setAllowSnapshots:", 0LL);
  -[PBScreenSaverContentPresentingViewController addChildViewController:]( self,  "addChildViewController:",  self->_sceneViewController);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PBScreenSaverContentPresentingViewController view](self, "view"));
  [v16 bounds];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneViewController view](self->_sceneViewController, "view"));
  objc_msgSend(v25, "setBounds:", v18, v20, v22, v24);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneViewController view](self->_sceneViewController, "view"));
  v43.origin.x = v18;
  v43.origin.y = v20;
  v43.size.width = v22;
  v43.size.height = v24;
  double MidX = CGRectGetMidX(v43);
  v44.origin.x = v18;
  v44.origin.y = v20;
  v44.size.width = v22;
  v44.size.height = v24;
  objc_msgSend(v26, "setCenter:", MidX, CGRectGetMidY(v44));

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[PBScreenSaverContentPresentingViewController view](self, "view"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplicationSceneViewController view](self->_sceneViewController, "view"));
  [v28 addSubview:v29];

  -[PBApplicationSceneViewController didMoveToParentViewController:]( self->_sceneViewController,  "didMoveToParentViewController:",  self);
  v30 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplication](&OBJC_CLASS___PineBoard, "sharedApplication"));
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 mainWorkspace]);

  v32 = -[PBScreenSaverPresentationTransaction initWithScreenSaverViewController:workspace:animated:options:]( objc_alloc(&OBJC_CLASS___PBScreenSaverPresentationTransaction),  "initWithScreenSaverViewController:workspace:animated:options:",  self,  v31,  v6,  v9);
  if (+[PBOverlayTransitionCoordinator isCoordinatedTransitionsEnabled]( &OBJC_CLASS___PBOverlayTransitionCoordinator,  "isCoordinatedTransitionsEnabled"))
  {
    v33 = -[PBCoordinatedTransitionFragmentDescriptor initWithType:provider:]( objc_alloc(&OBJC_CLASS___PBCoordinatedTransitionFragmentDescriptor),  "initWithType:provider:",  @"DismissScreenSaverFragment",  self);
    v34 = objc_alloc_init(&OBJC_CLASS___PBCoordinatedTransitionToken);
    coordinatedTransitionToken = self->_coordinatedTransitionToken;
    self->_coordinatedTransitionToken = v34;

    -[PBCoordinatedTransitionToken setRespondingFragmentDescriptor:]( self->_coordinatedTransitionToken,  "setRespondingFragmentDescriptor:",  v33);
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"DismissDialogFragment",  @"DismissDictationOverlay",  @"DismissNowPlayingOverlay",  @"DismissPiPEditingControls",  @"DismissRoutingUI",  0LL));
    -[PBCoordinatedTransitionToken setCoordinatedFragmentTypes:]( self->_coordinatedTransitionToken,  "setCoordinatedFragmentTypes:",  v36);
    -[PBCoordinatedTransition setCoordinatedTransitionToken:]( v32,  "setCoordinatedTransitionToken:",  self->_coordinatedTransitionToken);
  }

  presentationTransaction = self->_presentationTransaction;
  self->_presentationTransaction = v32;
  v38 = v32;

  v39 = self->_presentationTransaction;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_1000E8D2C;
  v41[3] = &unk_1003D6708;
  v41[4] = self;
  id v42 = v8;
  id v40 = v8;
  -[PBScreenSaverPresentationTransaction setCompletionBlock:](v39, "setCompletionBlock:", v41);
  -[PBScreenSaverPresentationTransaction begin](self->_presentationTransaction, "begin");
}

- (void)dismissContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5
{
  BOOL v5 = a3;
  id v7 = a5;
  id v8 = -[PBScreenSaverContentPresentingViewController view](self, "view");
  id v9 = self->_presentationTransaction;
  id v10 = v9;
  if (v9 && (-[PBScreenSaverPresentationTransaction isComplete](v9, "isComplete") & 1) == 0)
  {
    -[PBScreenSaverPresentationTransaction interruptWithReason:](v10, "interruptWithReason:", @"Dismissal");
    BOOL v12 = 0LL;
    uint64_t v11 = 0LL;
  }

  else
  {
    uint64_t v11 = 1LL;
    BOOL v12 = v5;
  }

  dismissalTransaction = self->_dismissalTransaction;
  if (!dismissalTransaction
    || (-[PBScreenSaverDismissalTransaction isComplete](dismissalTransaction, "isComplete") & 1) != 0)
  {
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 sceneDeactivationManager]);
    id v16 = [v15 newAssertionWithReason:5];

    [v16 acquire];
    double v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472LL;
    double v23 = sub_1000E9008;
    double v24 = &unk_1003D6730;
    v25 = self;
    id v26 = v16;
    id v27 = v7;
    id v17 = v16;
    -[PBScreenSaverContentPresentingViewController _createDismissalTransactionAnimated:shouldUpdateWallpaper:shouldApplyStartValues:withCompletion:]( self,  "_createDismissalTransactionAnimated:shouldUpdateWallpaper:shouldApplyStartValues:withCompletion:",  v5,  v12,  v11,  &v21);
    -[PBScreenSaverDismissalTransaction begin](self->_dismissalTransaction, "begin", v21, v22, v23, v24, v25);

LABEL_12:
    goto LABEL_13;
  }

  id v18 = sub_100083D98();
  double v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "Ignoring dismissal request because a dismissal transaction is already in flight",  buf,  2u);
  }

  if (v7)
  {
    double v20 = self->_dismissalTransaction;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472LL;
    v28[2] = sub_1000E8F7C;
    v28[3] = &unk_1003D08E0;
    id v29 = v7;
    -[PBScreenSaverDismissalTransaction registerBlockObserver:](v20, "registerBlockObserver:", v28);
    id v17 = v29;
    goto LABEL_12;
  }

- (id)scene:(id)a3 handleActions:(id)a4
{
  id v22 = a3;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  id v6 = a4;
  id v7 = 0LL;
  id v8 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v29;
    do
    {
      id v10 = 0LL;
      do
      {
        if (*(void *)v29 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v28 + 1) + 8LL * (void)v10);
        uint64_t v12 = objc_opt_class(&OBJC_CLASS___PBUIScreenSaverPreparedAction);
        if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
        {
          id v27 = v7;
          PBUISAddToMutableSet(&v27, v11);
          id v13 = v27;

          -[PBScreenSaverContentPresentingViewController _receivedScenePreparedAction:forScene:]( self,  "_receivedScenePreparedAction:forScene:",  v11,  v22);
          id v7 = v13;
        }

        else if (((unint64_t)[v11 UIActionType] | 0x20) == 0x2C)
        {
          id v26 = v7;
          PBUISAddToMutableSet(&v26, v11);
          id v14 = v26;

          objc_initWeak(&location, self);
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472LL;
          v23[2] = sub_1000E9440;
          v23[3] = &unk_1003D1228;
          objc_copyWeak(&v24, &location);
          id v15 = objc_retainBlock(v23);
          shouldDismissHandler = (void (**)(id, id))self->_shouldDismissHandler;
          if (shouldDismissHandler) {
            shouldDismissHandler[2](shouldDismissHandler, v15);
          }
          else {
            ((void (*)(void *, uint64_t))v15[2])(v15, 1LL);
          }

          objc_destroyWeak(&v24);
          objc_destroyWeak(&location);
          id v7 = v14;
        }

        id v10 = (char *)v10 + 1;
      }

      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }

    while (v8);
  }

  id v17 = [v7 count];
  if (v17 != [v6 count])
  {
    id v18 = [v6 mutableCopy];
    [v18 minusSet:v7];
    id v19 = sub_100083D98();
    double v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      sub_10027F47C((uint64_t)v18, v20);
    }
  }

  return v7;
}

- (void)sceneWillDeactivate:(id)a3 withError:(id)a4
{
  id v6 = a4;
  [a3 setParentScene:0];
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBScreenSaverContentPresentingViewController contentDelegate](self, "contentDelegate"));
  [v7 contentPresenting:self willDismissContentWithResult:0 error:v6];
}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    dismissalTransaction = self->_dismissalTransaction;
    if (dismissalTransaction
      && !-[PBScreenSaverDismissalTransaction isComplete](dismissalTransaction, "isComplete"))
    {
      id v9 = sub_100083D98();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "Ignoring dismissal request because a dismissal transaction is already in flight",  v12,  2u);
      }
    }

    else
    {
      -[PBScreenSaverContentPresentingViewController _createDismissalTransactionAnimated:shouldUpdateWallpaper:shouldApplyStartValues:withCompletion:]( self,  "_createDismissalTransactionAnimated:shouldUpdateWallpaper:shouldApplyStartValues:withCompletion:",  0LL,  0LL,  1LL,  0LL);
      -[PBScreenSaverDismissalTransaction begin](self->_dismissalTransaction, "begin");
    }
  }

  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBScreenSaverContentPresentingViewController contentDelegate](self, "contentDelegate"));
  [v11 contentPresentingDidDismissContent:self];
}

- (void)_userInterfaceStyleDidChange
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBScreenSaverContentPresentingViewController traitCollection](self, "traitCollection"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000E963C;
  v4[3] = &unk_1003D0BE0;
  v4[4] = [v3 userInterfaceStyle];
  -[PBScreenSaverContentPresentingViewController _updateSceneSettingsWithBlock:]( self,  "_updateSceneSettingsWithBlock:",  v4);
}

- (id)transitionCoordinator:(id)a3 willDismissTransitionWithToken:(id)a4 withContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dismissalTransaction = self->_dismissalTransaction;
  if (dismissalTransaction
    && (-[PBScreenSaverDismissalTransaction isComplete](dismissalTransaction, "isComplete") & 1) == 0)
  {
    id v20 = sub_100083D98();
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "Ignoring coordinated dismissal request because a dismissal transaction is already in flight",  buf,  2u);
    }

    id v19 = 0LL;
  }

  else
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBScreenSaverContentPresentingViewController contentDelegate](self, "contentDelegate"));
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[PBSceneHandle sceneIdentity](self->_sceneHandle, "sceneIdentity"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s identifier](v13, "identifier"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[FBSceneWorkspace sceneWithIdentifier:](self->_sceneWorkspace, "sceneWithIdentifier:", v14));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1000E9818;
    v22[3] = &unk_1003D6758;
    id v23 = v15;
    id v24 = v14;
    id v25 = v12;
    id v26 = self;
    id v16 = v12;
    id v17 = v14;
    id v18 = v15;
    -[PBScreenSaverContentPresentingViewController _createDismissalTransactionAnimated:shouldUpdateWallpaper:shouldApplyStartValues:withCompletion:]( self,  "_createDismissalTransactionAnimated:shouldUpdateWallpaper:shouldApplyStartValues:withCompletion:",  1LL,  1LL,  1LL,  v22);
    id v19 = self->_dismissalTransaction;
  }

  return v19;
}

- (void)_activateSceneWithCompletion:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 UUIDString]);

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBSSceneDefinition identity](self->_sceneDefinition, "identity"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 identifier]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@-%@", v10, v8));

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[FBSceneWorkspace sceneWithIdentifier:](self->_sceneWorkspace, "sceneWithIdentifier:", v11));
    id v13 = v12;
    if (!v12 || ([v12 isValid] & 1) == 0)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplication](&OBJC_CLASS___PineBoard, "sharedApplication"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 mainWorkspace]);
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 geometry]);

      sceneWorkspace = self->_sceneWorkspace;
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472LL;
      v30[2] = sub_1000E9BC0;
      v30[3] = &unk_1003D6780;
      id v31 = v11;
      v32 = self;
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[FBSceneWorkspace createScene:](sceneWorkspace, "createScene:", v30));

      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472LL;
      v27[2] = sub_1000E9C4C;
      v27[3] = &unk_1003D0DD8;
      id v28 = v16;
      __int128 v29 = self;
      id v19 = v16;
      [v18 configureParameters:v27];

      id v13 = v18;
    }

    [v13 setDelegate:self];
    id v25 = v6;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = sub_1000E9E20;
    v26[3] = &unk_1003D0E00;
    v26[4] = self;
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472LL;
    v23[2] = sub_1000E9E78;
    v23[3] = &unk_1003D0E50;
    id v24 = v13;
    id v20 = v13;
    id v21 = v6;
    [v20 performUpdate:v26 withCompletion:v23];
  }

  else
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"completion != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027F4F0(a2);
    }
    _bs_set_crash_log_message([v22 UTF8String]);
    __break(0);
  }

- (void)_updateSceneSettingsWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000E9F40;
  v7[3] = &unk_1003D0E78;
  id v8 = v4;
  id v6 = v4;
  [v5 updateSettingsWithBlock:v7];
}

- (void)_receivedScenePreparedAction:(id)a3 forScene:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100083D98();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Scene did prepare", v14, 2u);
  }

  if ((-[BSWatchdog hasFired](self->_screenSaverPreparedWatchdog, "hasFired") & 1) != 0
    || !self->_screenSaverPreparedWatchdog)
  {
    [v6 invalidate];

    id v6 = 0LL;
  }

  if ([v6 canSendResponse])
  {
    -[BSAction invalidate](self->_screenSaverPreparedAction, "invalidate");
    objc_storeStrong((id *)&self->_screenSaverPreparedAction, v6);
  }

  id screenSaverPreparedCompletionBlock = (void (**)(void))self->_screenSaverPreparedCompletionBlock;
  if (screenSaverPreparedCompletionBlock)
  {
    if (!self->_sceneHandle)
    {
      uint64_t v11 = -[PBSceneHandle initWithScene:](objc_alloc(&OBJC_CLASS___PBSceneHandle), "initWithScene:", v7);
      sceneHandle = self->_sceneHandle;
      self->_sceneHandle = v11;

      id screenSaverPreparedCompletionBlock = (void (**)(void))self->_screenSaverPreparedCompletionBlock;
    }

    screenSaverPreparedCompletionBlock[2]();
    id v13 = self->_screenSaverPreparedCompletionBlock;
    self->_id screenSaverPreparedCompletionBlock = 0LL;
  }

  -[BSWatchdog invalidate](self->_screenSaverPreparedWatchdog, "invalidate");
}

- (void)_createDismissalTransactionAnimated:(BOOL)a3 shouldUpdateWallpaper:(BOOL)a4 shouldApplyStartValues:(BOOL)a5 withCompletion:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v11 = a6;
  dismissalTransaction = self->_dismissalTransaction;
  if (dismissalTransaction
    && (-[PBScreenSaverDismissalTransaction isComplete](dismissalTransaction, "isComplete") & 1) == 0)
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_dismissalTransaction == nil || [_dismissalTransaction isComplete]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027F5AC(a2);
    }
    _bs_set_crash_log_message([v21 UTF8String]);
    __break(0);
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplication](&OBJC_CLASS___PineBoard, "sharedApplication"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 mainWorkspace]);

    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 createSnapshot]);

    id v17 = -[PBScreenSaverDismissalTransaction initWithScreenSaverViewController:sceneSnapshot:workspace:animated:updateWallpaper:applyStartValues:]( objc_alloc(&OBJC_CLASS___PBScreenSaverDismissalTransaction),  "initWithScreenSaverViewController:sceneSnapshot:workspace:animated:updateWallpaper:applyStartValues:",  self,  v16,  v14,  v8,  v7,  v6);
    objc_initWeak(&location, self);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_1000EA35C;
    v24[3] = &unk_1003D0A28;
    objc_copyWeak(&v25, &location);
    -[PBScreenSaverDismissalTransaction registerBlockObserver:](v17, "registerBlockObserver:", v24);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_1000EA444;
    v22[3] = &unk_1003D1610;
    void v22[4] = self;
    id v18 = v11;
    id v23 = v18;
    -[PBScreenSaverDismissalTransaction setCompletionBlock:](v17, "setCompletionBlock:", v22);
    id v19 = self->_dismissalTransaction;
    self->_dismissalTransaction = v17;
    id v20 = v17;

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

- (BOOL)isInterruptible
{
  return self->_interruptible;
}

- (PBSystemOverlayContentDelegate)contentDelegate
{
  return (PBSystemOverlayContentDelegate *)objc_loadWeakRetained((id *)&self->_contentDelegate);
}

- (void)setContentDelegate:(id)a3
{
}

- (BOOL)acceptsEventFocus
{
  return self->_acceptsEventFocus;
}

- (void)setAcceptsEventFocus:(BOOL)a3
{
  self->_acceptsEventFocus = a3;
}

- (NSArray)transitionActions
{
  return self->_transitionActions;
}

- (void)setTransitionActions:(id)a3
{
}

- (id)shouldDismissHandler
{
  return self->_shouldDismissHandler;
}

- (void)setShouldDismissHandler:(id)a3
{
}

- (BOOL)allowsInteraction
{
  return self->_allowsInteraction;
}

- (UIImageView)snapshotImageView
{
  return self->_snapshotImageView;
}

- (void)setScreensaverSceneDeactivationAssertion:(id)a3
{
}

- (id)screenSaverPreparedCompletionBlock
{
  return self->_screenSaverPreparedCompletionBlock;
}

- (void)setScreenSaverPreparedCompletionBlock:(id)a3
{
}

- (BSWatchdog)screenSaverPreparedWatchdog
{
  return self->_screenSaverPreparedWatchdog;
}

- (BSAction)screenSaverPreparedAction
{
  return self->_screenSaverPreparedAction;
}

- (PBCoordinatedTransitionToken)coordinatedTransitionToken
{
  return self->_coordinatedTransitionToken;
}

- (PBScreenSaverPresentationTransaction)presentationTransaction
{
  return self->_presentationTransaction;
}

- (PBScreenSaverDismissalTransaction)dismissalTransaction
{
  return self->_dismissalTransaction;
}

- (PBApplicationSceneViewController)sceneViewController
{
  return self->_sceneViewController;
}

- (PBSceneHandle)sceneHandle
{
  return self->_sceneHandle;
}

- (FBSceneWorkspace)sceneWorkspace
{
  return self->_sceneWorkspace;
}

- (FBSSceneDefinition)sceneDefinition
{
  return self->_sceneDefinition;
}

- (int64_t)layoutLevel
{
  return self->_layoutLevel;
}

- (void).cxx_destruct
{
}

@end