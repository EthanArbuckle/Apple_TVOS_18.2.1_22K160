@interface PBSystemMenuServicePresenter
+ (id)keyPathsForValuesAffectingIsSystemMenuPresenting;
- (BOOL)dismissSystemMenuAnimated:(BOOL)a3;
- (BOOL)isSystemMenuIdleTimerActive;
- (BOOL)isSystemMenuPresenting;
- (BSInvalidatable)idleAction;
- (BSInvalidatable)systemHomeUIServicePreheatAssertion;
- (BSInvalidatable)teachableMomentIdleAction;
- (PBControlCenterPresentingDelegate)controlCenterPresenterDelegate;
- (PBControlCenterRemoteViewController)remoteViewController;
- (PBCoordinatedTransitionToken)coordinatedTransitionToken;
- (PBSceneManager)sceneManager;
- (PBSystemGestureHandle)dismissTeachableMomentGesture;
- (PBSystemMenuServicePresenter)initWithPresentationHandler:(id)a3 sceneManager:(id)a4;
- (PBSystemOverlayController)overlayController;
- (id)_presentationOptionsWithActivationReason:(unint64_t)a3;
- (id)transactionForDismissingSystemMenuAnimated:(BOOL)a3;
- (int64_t)systemMenuLayoutLevel;
- (void)_invalidateDismissTeachableMomentGesture;
- (void)_invalidateIdleTimer;
- (void)_invalidateTeachableMomentIdleTimer;
- (void)_showTeachableMomentOverlayIfNeeded;
- (void)_startIdleTimer;
- (void)_startTeachableMomentTimer;
- (void)controlCenterContentPresentingViewController:(id)a3 handleDismissWithResult:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)overlayController:(id)a3 didDismissSession:(id)a4;
- (void)overlayController:(id)a3 willDismissSession:(id)a4 withContext:(id)a5;
- (void)overlayController:(id)a3 willPresentSession:(id)a4;
- (void)prepareUIForSystemOverlayPresentationWithCompletion:(id)a3;
- (void)presentSystemMenuWithActivationReason:(unint64_t)a3;
- (void)requestTeachableMomentOverlayDismissal;
- (void)sceneManager:(id)a3 didChangeFocusFromScene:(id)a4 toScene:(id)a5;
- (void)setControlCenterPresenterDelegate:(id)a3;
- (void)setRemoteViewController:(id)a3;
- (void)setSystemMenuIdleTimerActive:(BOOL)a3;
@end

@implementation PBSystemMenuServicePresenter

- (PBSystemMenuServicePresenter)initWithPresentationHandler:(id)a3 sceneManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"presentationHandler != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027763C(a2);
    }
LABEL_11:
    _bs_set_crash_log_message([v19 UTF8String]);
    __break(0);
    JUMPOUT(0x100077C58LL);
  }

  v9 = v8;
  if (!v8)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"sceneManager != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002776F8(a2);
    }
    goto LABEL_11;
  }

  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___PBSystemMenuServicePresenter;
  v10 = -[PBSystemMenuServicePresenter init](&v20, "init");
  if (v10)
  {
    v11 = objc_alloc(&OBJC_CLASS___PBSystemOverlayController);
    v12 = (objc_class *)objc_opt_class(v10);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = -[PBSystemOverlayController initWithName:layoutLevel:presentationHandler:delegate:]( v11,  "initWithName:layoutLevel:presentationHandler:delegate:",  v14,  12LL,  v7,  v10);
    overlayController = v10->_overlayController;
    v10->_overlayController = v15;

    id v17 = objc_storeWeak((id *)&v10->_sceneManager, v9);
    [v9 addObserver:v10];
  }

  return v10;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneManager);
  [WeakRetained removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBSystemMenuServicePresenter;
  -[PBSystemMenuServicePresenter dealloc](&v4, "dealloc");
}

- (BOOL)isSystemMenuPresenting
{
  return -[PBSystemOverlayController hasActivePresentation](self->_overlayController, "hasActivePresentation");
}

+ (id)keyPathsForValuesAffectingIsSystemMenuPresenting
{
  return (id)objc_claimAutoreleasedReturnValue( +[NSSet setWithObject:]( &OBJC_CLASS___NSSet,  "setWithObject:",  @"overlayController.hasActivePresentation"));
}

- (int64_t)systemMenuLayoutLevel
{
  return -[PBSystemOverlayController layoutLevel](self->_overlayController, "layoutLevel");
}

- (BOOL)isSystemMenuIdleTimerActive
{
  return self->_idleAction != 0LL;
}

- (void)setSystemMenuIdleTimerActive:(BOOL)a3
{
  idleAction = self->_idleAction;
  if (a3)
  {
    if (!idleAction) {
      -[PBSystemMenuServicePresenter _startIdleTimer](self, "_startIdleTimer");
    }
  }

  else if (idleAction)
  {
    -[PBSystemMenuServicePresenter _invalidateIdleTimer](self, "_invalidateIdleTimer");
  }

- (void)presentSystemMenuWithActivationReason:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controlCenterPresenterDelegate);
  v6 = (PBCoordinatedTransitionToken *)objc_claimAutoreleasedReturnValue( [WeakRetained coordinatedTransitionTokenForControlCenterPresenter:self]);
  coordinatedTransitionToken = self->_coordinatedTransitionToken;
  self->_coordinatedTransitionToken = v6;

  objc_initWeak(&location, self);
  id v8 = objc_alloc_init(&OBJC_CLASS___PBMutableSystemOverlayPresentationRequest);
  v9 = (objc_class *)objc_opt_class(self);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[PBMutableSystemOverlayPresentationRequest setIdentifier:](v8, "setIdentifier:", v11);

  -[PBMutableSystemOverlayPresentationRequest setAnimated:](v8, "setAnimated:", 1LL);
  -[PBMutableSystemOverlayPresentationRequest setSceneDeactivationReasons:](v8, "setSceneDeactivationReasons:", 4LL);
  v12 = (void *)objc_claimAutoreleasedReturnValue( -[PBSystemMenuServicePresenter _presentationOptionsWithActivationReason:]( self,  "_presentationOptionsWithActivationReason:",  a3));
  -[PBMutableSystemOverlayPresentationRequest setClientOptions:](v8, "setClientOptions:", v12);

  -[PBMutableSystemOverlayPresentationRequest setProvider:](v8, "setProvider:", self);
  -[PBMutableSystemOverlayPresentationRequest setCoordinatedTransitionToken:]( v8,  "setCoordinatedTransitionToken:",  self->_coordinatedTransitionToken);
  id v13 = sub_1000F7CE4();
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  -[PBMutableSystemOverlayPresentationRequest setSignpostLog:](v8, "setSignpostLog:", v14);

  overlayController = self->_overlayController;
  id v16 = -[PBMutableSystemOverlayPresentationRequest copy](v8, "copy");
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472LL;
  objc_super v20 = sub_100077F98;
  v21 = &unk_1003D1228;
  objc_copyWeak(&v22, &location);
  -[PBSystemOverlayController presentWithRequest:completion:]( overlayController,  "presentWithRequest:completion:",  v16,  &v18);

  if (a3 == 1)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSUserDefaults standardUserDefaults]( &OBJC_CLASS___NSUserDefaults,  "standardUserDefaults",  v18,  v19,  v20,  v21));
    [v17 setControlCenterTeachableMomentShouldSkip:1];
  }

  objc_destroyWeak(&v22);

  objc_destroyWeak(&location);
}

- (BOOL)dismissSystemMenuAnimated:(BOOL)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue( -[PBSystemMenuServicePresenter transactionForDismissingSystemMenuAnimated:]( self,  "transactionForDismissingSystemMenuAnimated:",  a3));
  [v3 begin];

  return v3 != 0LL;
}

- (id)transactionForDismissingSystemMenuAnimated:(BOOL)a3
{
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlayController activeSession](self->_overlayController, "activeSession"));
  if (v5)
  {
    objc_initWeak(&location, self);
    id v6 = objc_alloc(&OBJC_CLASS___BSBlockTransaction);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100078108;
    v9[3] = &unk_1003D3020;
    BOOL v13 = a3;
    id v10 = v5;
    v11 = self;
    objc_copyWeak(&v12, &location);
    id v7 = [v6 initWithBlock:v9];
    objc_destroyWeak(&v12);

    objc_destroyWeak(&location);
  }

  else
  {
    id v7 = 0LL;
  }

  return v7;
}

- (void)overlayController:(id)a3 willPresentSession:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controlCenterPresenterDelegate);
  [WeakRetained controlCenterPresenterWillPresent:self];

  -[BSInvalidatable invalidate](self->_systemHomeUIServicePreheatAssertion, "invalidate");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBHomeUIManager sharedInstance](&OBJC_CLASS___PBHomeUIManager, "sharedInstance"));
  id v7 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue([v6 preheatSystemHomeUIServiceForReason:@"TVSystemMenuService"]);
  systemHomeUIServicePreheatAssertion = self->_systemHomeUIServicePreheatAssertion;
  self->_systemHomeUIServicePreheatAssertion = v7;
}

- (void)overlayController:(id)a3 willDismissSession:(id)a4 withContext:(id)a5
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controlCenterPresenterDelegate);
  [WeakRetained controlCenterPresenterWillDismiss:self];

  -[PBSystemMenuServicePresenter _invalidateDismissTeachableMomentGesture]( self,  "_invalidateDismissTeachableMomentGesture");
}

- (void)overlayController:(id)a3 didDismissSession:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controlCenterPresenterDelegate);
  [WeakRetained controlCenterPresenterDidDismiss:self];

  -[BSInvalidatable invalidate](self->_systemHomeUIServicePreheatAssertion, "invalidate");
}

- (void)sceneManager:(id)a3 didChangeFocusFromScene:(id)a4 toScene:(id)a5
{
  id v6 = a5;
  id v7 = -[PBSceneHandle initWithScene:](objc_alloc(&OBJC_CLASS___PBSceneHandle), "initWithScene:", v6);

  if (-[PBSceneHandle isDefaultKioskAppScene](v7, "isDefaultKioskAppScene")) {
    -[PBSystemMenuServicePresenter _startTeachableMomentTimer](self, "_startTeachableMomentTimer");
  }
  else {
    -[PBSystemMenuServicePresenter _invalidateTeachableMomentIdleTimer](self, "_invalidateTeachableMomentIdleTimer");
  }
}

- (void)prepareUIForSystemOverlayPresentationWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100078554;
  v7[3] = &unk_1003D3048;
  objc_copyWeak(&v9, &location);
  id v5 = v4;
  id v8 = v5;
  id v6 =  +[PBControlCenterRemoteViewController requestViewController:fromServiceWithBundleIdentifier:connectionHandler:]( &OBJC_CLASS___PBControlCenterRemoteViewController,  "requestViewController:fromServiceWithBundleIdentifier:connectionHandler:",  @"TVSMHostViewController",  @"com.apple.TVSystemMenuService",  v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)controlCenterContentPresentingViewController:(id)a3 handleDismissWithResult:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_class(&OBJC_CLASS___PBSSystemMenuServiceStartCameraPiPResult);
  id v12 = v9;
  BOOL v13 = v12;
  if (v11)
  {
    if ((objc_opt_isKindOfClass(v12, v11) & 1) != 0) {
      v14 = v13;
    }
    else {
      v14 = 0LL;
    }
  }

  else
  {
    v14 = 0LL;
  }

  id v15 = v14;

  id v16 = (id)objc_claimAutoreleasedReturnValue([v8 remoteViewController]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteViewController);
  BOOL v19 = v16 == WeakRetained && v15 != 0LL;

  if (v19)
  {
    objc_super v20 = (void *)objc_claimAutoreleasedReturnValue([v15 cameraIdentifier]);
    v28 = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v28, 1LL));
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[PBUISystemHomeServiceCameraActivationContext contextWithAccessoryIdentifiers:]( &OBJC_CLASS___PBUISystemHomeServiceCameraActivationContext,  "contextWithAccessoryIdentifiers:",  v21));

    objc_initWeak(&location, self);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[PBHomeUIManager sharedInstance](&OBJC_CLASS___PBHomeUIManager, "sharedInstance"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_10007891C;
    v24[3] = &unk_1003D1660;
    objc_copyWeak(&v26, &location);
    id v25 = v10;
    [v23 presentCameraWithContext:v22 withCompletion:v24];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  else
  {
    (*((void (**)(id, uint64_t))v10 + 2))(v10, 1LL);
  }
}

- (void)_startIdleTimer
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  [v3 controlCenterTimeoutInSeconds];
  double v5 = v4;

  if (v5 > 0.0)
  {
    objc_initWeak(&location, self);
    id v6 = &_dispatch_main_q;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_100078A88;
    v9[3] = &unk_1003D0890;
    objc_copyWeak(&v10, &location);
    id v7 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue( +[PBAttentionMonitor afterIdleInterval:reason:queue:perform:]( &OBJC_CLASS___PBAttentionMonitor,  "afterIdleInterval:reason:queue:perform:",  @"Dismiss Control Center",  &_dispatch_main_q,  v9,  v5));
    idleAction = self->_idleAction;
    self->_idleAction = v7;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

- (void)_invalidateIdleTimer
{
  idleAction = self->_idleAction;
  self->_idleAction = 0LL;
}

- (void)_startTeachableMomentTimer
{
  v3 = &_dispatch_main_q;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100078BE8;
  v6[3] = &unk_1003D0890;
  objc_copyWeak(&v7, &location);
  double v4 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue( +[PBAttentionMonitor afterIdleInterval:reason:queue:perform:]( &OBJC_CLASS___PBAttentionMonitor,  "afterIdleInterval:reason:queue:perform:",  @"Control Center Teachable Moment",  &_dispatch_main_q,  v6,  5.0));
  teachableMomentIdleAction = self->_teachableMomentIdleAction;
  self->_teachableMomentIdleAction = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_invalidateTeachableMomentIdleTimer
{
  teachableMomentIdleAction = self->_teachableMomentIdleAction;
  self->_teachableMomentIdleAction = 0LL;
}

- (void)_showTeachableMomentOverlayIfNeeded
{
  if ((+[UIApplication tvsui_isRunningInStoreDemoMode]( &OBJC_CLASS___UIApplication,  "tvsui_isRunningInStoreDemoMode") & 1) == 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
    if (([v3 controlCenterTeachableMomentShouldSkip] & 1) == 0)
    {
      double v4 = (void *)objc_claimAutoreleasedReturnValue([v3 controlCenterTeachableMomentFirstExposureTimestamp]);
      double v5 = objc_opt_new(&OBJC_CLASS___NSDate);
      if (v4)
      {
        id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeInterval:sinceDate:]( &OBJC_CLASS___NSDate,  "dateWithTimeInterval:sinceDate:",  v4,  259200.0));
        id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](&OBJC_CLASS___NSCalendar, "currentCalendar"));
        id v8 = [v7 compareDate:v5 toDate:v6 toUnitGranularity:128];

        if (v8 != (id)-1LL)
        {
          [v3 setControlCenterTeachableMomentShouldSkip:1];
          [v3 setControlCenterTeachableMomentFirstExposureTimestamp:0];
          -[PBSystemMenuServicePresenter presentSystemMenuWithActivationReason:]( self,  "presentSystemMenuWithActivationReason:",  3LL);
          dismissTeachableMomentGesture = self->_dismissTeachableMomentGesture;
          if (!dismissTeachableMomentGesture)
          {
            objc_initWeak(&location, self);
            id v10 = (void *)objc_claimAutoreleasedReturnValue( +[PBSystemGestureManager sharedInstance]( &OBJC_CLASS___PBSystemGestureManager,  "sharedInstance"));
            BOOL v13 = _NSConcreteStackBlock;
            uint64_t v14 = 3221225472LL;
            id v15 = sub_100078E28;
            id v16 = &unk_1003D1020;
            objc_copyWeak(&v17, &location);
            uint64_t v11 = (PBSystemGestureHandle *)[v10 newHandleForSystemGesture:31 actionHandler:&v13];
            id v12 = self->_dismissTeachableMomentGesture;
            self->_dismissTeachableMomentGesture = v11;

            objc_destroyWeak(&v17);
            objc_destroyWeak(&location);
            dismissTeachableMomentGesture = self->_dismissTeachableMomentGesture;
          }

          -[PBSystemGestureHandle acquire](dismissTeachableMomentGesture, "acquire", v13, v14, v15, v16);
        }
      }

      else
      {
        [v3 setControlCenterTeachableMomentFirstExposureTimestamp:v5];
      }
    }
  }

- (void)requestTeachableMomentOverlayDismissal
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteViewController);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100078F14;
  v4[3] = &unk_1003D3070;
  objc_copyWeak(&v5, &location);
  [WeakRetained messageViewServiceWithMessage:&off_1003FECE0 reply:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_invalidateDismissTeachableMomentGesture
{
  dismissTeachableMomentGesture = self->_dismissTeachableMomentGesture;
  self->_dismissTeachableMomentGesture = 0LL;
}

- (id)_presentationOptionsWithActivationReason:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sceneManager);
  id v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained currentApplicationSceneHandle]);
  id v6 = (__CFString *)objc_claimAutoreleasedReturnValue([v5 clientProcessBundleIdentifier]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBAirPlayManager sharedInstance](&OBJC_CLASS___PBAirPlayManager, "sharedInstance"));
  LODWORD(v5) = [v7 isPresenting];

  if ((_DWORD)v5)
  {
    id v8 = @"com.apple.TVAirPlay";

    id v6 = v8;
  }

  id v9 = objc_alloc(&OBJC_CLASS___NSMutableDictionary);
  id v15 = @"TVSMShowTeachableMoment";
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](&OBJC_CLASS___NSNumber, "numberWithBool:", a3 == 3));
  id v16 = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v16,  &v15,  1LL));
  id v12 = -[NSMutableDictionary initWithDictionary:](v9, "initWithDictionary:", v11);

  -[NSMutableDictionary bs_setSafeObject:forKey:](v12, "bs_setSafeObject:forKey:", v6, @"ForegroundApp");
  id v13 = -[NSMutableDictionary copy](v12, "copy");

  return v13;
}

- (PBControlCenterPresentingDelegate)controlCenterPresenterDelegate
{
  return (PBControlCenterPresentingDelegate *)objc_loadWeakRetained((id *)&self->_controlCenterPresenterDelegate);
}

- (void)setControlCenterPresenterDelegate:(id)a3
{
}

- (PBSceneManager)sceneManager
{
  return (PBSceneManager *)objc_loadWeakRetained((id *)&self->_sceneManager);
}

- (PBControlCenterRemoteViewController)remoteViewController
{
  return (PBControlCenterRemoteViewController *)objc_loadWeakRetained((id *)&self->_remoteViewController);
}

- (void)setRemoteViewController:(id)a3
{
}

- (PBSystemOverlayController)overlayController
{
  return self->_overlayController;
}

- (BSInvalidatable)idleAction
{
  return self->_idleAction;
}

- (PBCoordinatedTransitionToken)coordinatedTransitionToken
{
  return self->_coordinatedTransitionToken;
}

- (PBSystemGestureHandle)dismissTeachableMomentGesture
{
  return self->_dismissTeachableMomentGesture;
}

- (BSInvalidatable)teachableMomentIdleAction
{
  return self->_teachableMomentIdleAction;
}

- (BSInvalidatable)systemHomeUIServicePreheatAssertion
{
  return self->_systemHomeUIServicePreheatAssertion;
}

- (void).cxx_destruct
{
}

@end