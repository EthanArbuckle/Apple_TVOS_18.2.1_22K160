@interface PBSystemUIServicePresenter
+ (id)keyPathsForValuesAffectingIsSystemMenuPresenting;
+ (int64_t)layoutLevel;
- (BOOL)dismissSystemMenuAnimated:(BOOL)a3;
- (BOOL)isEnabled;
- (BOOL)isSystemMenuIdleTimerActive;
- (BOOL)isSystemMenuPresenting;
- (NSTimer)pendingHintPresentationTimer;
- (PBBulletinService)bulletinService;
- (PBControlCenterPresentingDelegate)controlCenterPresenterDelegate;
- (PBCoordinatedTransitionToken)coordinatedTransitionToken;
- (PBHomeUIManager)systemHomeUIManager;
- (PBSceneDeactivationManager)sceneDeactivationManager;
- (PBSceneManager)sceneManager;
- (PBSystemOverlayController)overlayController;
- (PBSystemUIServiceConduit)conduit;
- (PBSystemUIServiceHintManager)systemUIServiceHintManager;
- (PBSystemUIServicePresenter)initWithPresentationHandler:(id)a3 sceneManager:(id)a4 pictureInPictureManager:(id)a5 systemHomeUIManager:(id)a6 dictationManager:(id)a7 siriManager:(id)a8 userProfileManager:(id)a9 scheduledSleepManager:(id)a10;
- (PBSystemUIServiceViewController)activePresentation;
- (PBUserProfileManager)userProfileManager;
- (id)_currentUserID;
- (id)transactionForDismissingSystemMenuAnimated:(BOOL)a3;
- (int64_t)systemMenuLayoutLevel;
- (void)_dismissWithCompletion:(id)a3;
- (void)_presentHintBulletinIfAppropriate;
- (void)_presentWithCompletion:(id)a3;
- (void)_startPendingHintBulletinTimer;
- (void)dealloc;
- (void)overlayController:(id)a3 willDismissSession:(id)a4 withContext:(id)a5;
- (void)presentSystemMenuWithActivationReason:(unint64_t)a3;
- (void)sceneManager:(id)a3 didChangeFocusFromScene:(id)a4 toScene:(id)a5;
- (void)sceneManager:(id)a3 didUpdatePlaybackControlState:(int64_t)a4 forFocusedScene:(id)a5;
- (void)sendAction:(id)a3;
- (void)sendActions:(id)a3;
- (void)setControlCenterPresenterDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setPendingHintPresentationTimer:(id)a3;
- (void)systemUIServiceBeganPresentingSystemMenu:(id)a3;
- (void)systemUIServiceEndedPresentingSystemMenu:(id)a3;
- (void)systemUIServiceRequestedCameraHandoffWithIdentifier:(id)a3 completion:(id)a4;
@end

@implementation PBSystemUIServicePresenter

+ (int64_t)layoutLevel
{
  return 12LL;
}

- (PBSystemUIServicePresenter)initWithPresentationHandler:(id)a3 sceneManager:(id)a4 pictureInPictureManager:(id)a5 systemHomeUIManager:(id)a6 dictationManager:(id)a7 siriManager:(id)a8 userProfileManager:(id)a9 scheduledSleepManager:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  if (!v16)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"presentationHandler != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100284B00();
    }
LABEL_31:
    _bs_set_crash_log_message([v52 UTF8String]);
    __break(0);
    JUMPOUT(0x100134280LL);
  }

  if (!v17)
  {
    v53 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"sceneManager != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100284BA8();
    }
    _bs_set_crash_log_message([v53 UTF8String]);
    __break(0);
    JUMPOUT(0x1001342E4LL);
  }

  if (!v18)
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"pictureInPictureManager != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100284C50();
    }
    _bs_set_crash_log_message([v54 UTF8String]);
    __break(0);
    JUMPOUT(0x100134348LL);
  }

  if (!v19)
  {
    v55 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"systemHomeUIManager != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100284CF8();
    }
    _bs_set_crash_log_message([v55 UTF8String]);
    __break(0);
    JUMPOUT(0x1001343ACLL);
  }

  if (!v21)
  {
    v56 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"siriManager != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100284DA0();
    }
    _bs_set_crash_log_message([v56 UTF8String]);
    __break(0);
    JUMPOUT(0x100134410LL);
  }

  if (!v20)
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"dictationManager != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100284E48();
    }
    _bs_set_crash_log_message([v57 UTF8String]);
    __break(0);
    JUMPOUT(0x100134474LL);
  }

  v24 = v23;
  if (!v23)
  {
    v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"scheduledSleepManager != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100284EF0();
    }
    goto LABEL_31;
  }

  v59.receiver = self;
  v59.super_class = (Class)&OBJC_CLASS___PBSystemUIServicePresenter;
  v25 = -[PBSystemUIServicePresenter init](&v59, "init");
  v26 = v25;
  if (v25)
  {
    id v27 = objc_storeWeak((id *)&v25->_sceneManager, v17);
    [v17 addObserver:v26];

    uint64_t v28 = objc_claimAutoreleasedReturnValue([v17 sceneDeactivationManager]);
    sceneDeactivationManager = v26->_sceneDeactivationManager;
    v26->_sceneDeactivationManager = (PBSceneDeactivationManager *)v28;

    id v58 = v17;
    v30 = v24;
    id v31 = v21;
    id v32 = v20;
    id v33 = v19;
    id v34 = v18;
    id v35 = v16;
    id v36 = v22;
    v37 = objc_alloc(&OBJC_CLASS___PBSystemOverlayController);
    v38 = (objc_class *)objc_opt_class(v26);
    v39 = NSStringFromClass(v38);
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    id v41 = [(id)objc_opt_class(v26) layoutLevel];
    v42 = v37;
    id v22 = v36;
    id v16 = v35;
    id v18 = v34;
    id v19 = v33;
    id v20 = v32;
    id v21 = v31;
    v24 = v30;
    id v17 = v58;
    v43 = -[PBSystemOverlayController initWithName:layoutLevel:presentationHandler:delegate:]( v42,  "initWithName:layoutLevel:presentationHandler:delegate:",  v40,  v41,  v16,  v26);
    overlayController = v26->_overlayController;
    v26->_overlayController = v43;

    v45 = objc_alloc_init(&OBJC_CLASS___PBSystemUIServiceConduit);
    conduit = v26->_conduit;
    v26->_conduit = v45;

    [v18 setSplitViewStatePublisher:v26->_conduit];
    [v21 setSiriPresentationStatePublisher:v26->_conduit];
    [v20 setDictationPresentationStatePublisher:v26->_conduit];
    [v24 setCurrentScheduledSleepPublisher:v26->_conduit];
    objc_storeWeak((id *)&v26->_systemHomeUIManager, v19);
    v47 = objc_alloc_init(&OBJC_CLASS___PBSystemUIServiceHintManager);
    systemUIServiceHintManager = v26->_systemUIServiceHintManager;
    v26->_systemUIServiceHintManager = v47;

    objc_storeStrong((id *)&v26->_userProfileManager, a9);
    v49 = -[PBBulletinService initWithRemoteConnection:]( objc_alloc(&OBJC_CLASS___PBBulletinService),  "initWithRemoteConnection:",  0LL);
    bulletinService = v26->_bulletinService;
    v26->_bulletinService = v49;
  }

  return v26;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activePresentation);
  [WeakRetained removeObserver:self forKeyPath:@"acceptsEventFocus"];

  id v4 = objc_loadWeakRetained((id *)&self->_sceneManager);
  [v4 removeObserver:self];

  -[NSTimer invalidate](self->_pendingHintPresentationTimer, "invalidate");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PBSystemUIServicePresenter;
  -[PBSystemUIServicePresenter dealloc](&v5, "dealloc");
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    if (a3) {
      -[PBSystemUIServicePresenter _presentWithCompletion:](self, "_presentWithCompletion:", 0LL);
    }
    else {
      -[PBSystemUIServicePresenter _dismissWithCompletion:](self, "_dismissWithCompletion:", 0LL);
    }
  }

- (void)sendAction:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", a3));
  -[PBSystemUIServicePresenter sendActions:](self, "sendActions:", v4);
}

- (void)sendActions:(id)a3
{
  id v4 = a3;
  p_activePresentation = &self->_activePresentation;
  id WeakRetained = objc_loadWeakRetained((id *)p_activePresentation);

  if (WeakRetained)
  {
    id v7 = objc_loadWeakRetained((id *)p_activePresentation);
    [v7 sendActions:v4];
  }

  else
  {
    id v8 = sub_1000F6B14();
    id v7 = (id)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_FAULT)) {
      sub_100284F98((uint64_t)v4, (os_log_s *)v7);
    }
  }
}

- (BOOL)isSystemMenuPresenting
{
  if (!-[PBSystemOverlayController hasActivePresentation](self->_overlayController, "hasActivePresentation")) {
    return 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activePresentation);
  unsigned __int8 v4 = [WeakRetained acceptsEventFocus];

  return v4;
}

+ (id)keyPathsForValuesAffectingIsSystemMenuPresenting
{
  return (id)objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"overlayController.activeSession",  @"activePresentation.acceptsEventFocus",  0LL));
}

- (int64_t)systemMenuLayoutLevel
{
  return -[PBSystemOverlayController layoutLevel](self->_overlayController, "layoutLevel");
}

- (BOOL)isSystemMenuIdleTimerActive
{
  return 0;
}

- (void)presentSystemMenuWithActivationReason:(unint64_t)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001347CC;
  v5[3] = &unk_1003D04E0;
  objc_copyWeak(v6, &location);
  v6[1] = (id)a3;
  v5[4] = self;
  -[PBSystemUIServicePresenter _presentWithCompletion:](self, "_presentWithCompletion:", v5);
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

- (BOOL)dismissSystemMenuAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  p_activePresentation = &self->_activePresentation;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activePresentation);

  if (WeakRetained)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue( +[PBSystemUIServiceDismissMenuOptions optionsWithAnimated:]( &OBJC_CLASS___PBSystemUIServiceDismissMenuOptions,  "optionsWithAnimated:",  v3));
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[PBSystemUIServiceDismissMenuAction actionWithOptions:]( &OBJC_CLASS___PBSystemUIServiceDismissMenuAction,  "actionWithOptions:",  v6));
    id v8 = objc_loadWeakRetained((id *)p_activePresentation);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v7));
    [v8 sendActions:v9];
  }

  return 0;
}

- (id)transactionForDismissingSystemMenuAnimated:(BOOL)a3
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlayController activeSession](self->_overlayController, "activeSession", a3));
  if (v4)
  {
    objc_initWeak(&location, self);
    id v5 = objc_alloc(&OBJC_CLASS___BSBlockTransaction);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472LL;
    v8[2] = sub_100134A74;
    v8[3] = &unk_1003D24A8;
    objc_copyWeak(&v9, &location);
    id v6 = [v5 initWithBlock:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (void)overlayController:(id)a3 willDismissSession:(id)a4 withContext:(id)a5
{
  p_activePresentation = &self->_activePresentation;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activePresentation);
  [WeakRetained setDelegate:0];

  objc_storeWeak((id *)p_activePresentation, 0LL);
}

- (void)systemUIServiceBeganPresentingSystemMenu:(id)a3
{
  p_controlCenterPresenterDelegate = &self->_controlCenterPresenterDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controlCenterPresenterDelegate);
  id v6 = (PBCoordinatedTransitionToken *)objc_claimAutoreleasedReturnValue( [WeakRetained coordinatedTransitionTokenForControlCenterPresenter:self]);
  coordinatedTransitionToken = self->_coordinatedTransitionToken;
  self->_coordinatedTransitionToken = v6;

  id v8 = objc_alloc_init(&OBJC_CLASS___PBCoordinatedTransition);
  -[PBCoordinatedTransition setCoordinatedTransitionToken:]( v8,  "setCoordinatedTransitionToken:",  self->_coordinatedTransitionToken);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[PBOverlayTransitionCoordinator sharedInstance]( &OBJC_CLASS___PBOverlayTransitionCoordinator,  "sharedInstance"));
  [v9 registerTransition:v8];

  -[PBCoordinatedTransition begin](v8, "begin");
  id v10 = objc_loadWeakRetained((id *)p_controlCenterPresenterDelegate);
  [v10 controlCenterPresenterWillPresent:self];

  -[PBSceneDeactivationManager addAndAcquireDeactivationAssertionsWithReasons:atLevel:]( self->_sceneDeactivationManager,  "addAndAcquireDeactivationAssertionsWithReasons:atLevel:",  4,  [(id)objc_opt_class(self) layoutLevel]);
}

- (void)systemUIServiceEndedPresentingSystemMenu:(id)a3
{
  coordinatedTransitionToken = self->_coordinatedTransitionToken;
  self->_coordinatedTransitionToken = 0LL;

  -[PBSceneDeactivationManager removeAndRelinquishDeactivationAssertionsAtLevel:]( self->_sceneDeactivationManager,  "removeAndRelinquishDeactivationAssertionsAtLevel:",  [(id)objc_opt_class(self) layoutLevel]);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_controlCenterPresenterDelegate);
  [WeakRetained controlCenterPresenterWillDismiss:self];

  id v6 = objc_loadWeakRetained((id *)&self->_controlCenterPresenterDelegate);
  [v6 controlCenterPresenterDidDismiss:self];
}

- (void)systemUIServiceRequestedCameraHandoffWithIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000F6B14();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);
    *(_DWORD *)buf = 138543362;
    id v16 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Received camera handoff request {camera.identifier=%{public}@}",  buf,  0xCu);
  }

  id v14 = v6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v14, 1LL));
  v12 = (void *)objc_claimAutoreleasedReturnValue( +[PBUISystemHomeServiceCameraActivationContext contextWithAccessoryIdentifiers:]( &OBJC_CLASS___PBUISystemHomeServiceCameraActivationContext,  "contextWithAccessoryIdentifiers:",  v11));

  id WeakRetained = objc_loadWeakRetained((id *)&self->_systemHomeUIManager);
  [WeakRetained presentCameraWithContext:v12 withCompletion:v7];
}

- (void)sceneManager:(id)a3 didUpdatePlaybackControlState:(int64_t)a4 forFocusedScene:(id)a5
{
}

- (void)sceneManager:(id)a3 didChangeFocusFromScene:(id)a4 toScene:(id)a5
{
  id v6 = a5;
  id v7 = -[PBSceneHandle initWithScene:](objc_alloc(&OBJC_CLASS___PBSceneHandle), "initWithScene:", v6);

  unsigned int v8 = -[PBSceneHandle isDefaultKioskAppScene](v7, "isDefaultKioskAppScene");
  systemUIServiceHintManager = self->_systemUIServiceHintManager;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemUIServicePresenter _currentUserID](self, "_currentUserID"));
  if (v8)
  {
    -[PBSystemUIServiceHintManager setHeadBoardActive:forUserID:]( systemUIServiceHintManager,  "setHeadBoardActive:forUserID:",  1LL,  v10);

    -[NSTimer invalidate](self->_pendingHintPresentationTimer, "invalidate");
    pendingHintPresentationTimer = self->_pendingHintPresentationTimer;
    self->_pendingHintPresentationTimer = 0LL;

    v12 = self->_systemUIServiceHintManager;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemUIServicePresenter _currentUserID](self, "_currentUserID"));
    LODWORD(v12) = -[PBSystemUIServiceHintManager shouldDisplayHintForUserID:](v12, "shouldDisplayHintForUserID:", v13);

    if ((_DWORD)v12) {
      -[PBSystemUIServicePresenter _startPendingHintBulletinTimer](self, "_startPendingHintBulletinTimer");
    }
  }

  else
  {
    -[PBSystemUIServiceHintManager setHeadBoardActive:forUserID:]( systemUIServiceHintManager,  "setHeadBoardActive:forUserID:",  0LL,  v10);

    -[NSTimer invalidate](self->_pendingHintPresentationTimer, "invalidate");
    id v14 = self->_pendingHintPresentationTimer;
    self->_pendingHintPresentationTimer = 0LL;
  }
}

- (void)_presentWithCompletion:(id)a3
{
  unsigned __int8 v4 = (void (**)(id, uint64_t))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplicationController](&OBJC_CLASS___PineBoard, "sharedApplicationController"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 systemUIServiceApplication]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlayController activeSession](self->_overlayController, "activeSession"));
  if (v7)
  {
    if (v4) {
      v4[2](v4, 1LL);
    }
  }

  else if (v6)
  {
    unsigned int v8 = objc_alloc_init(&OBJC_CLASS___PBMutableSystemOverlayPresentationRequest);
    id v9 = (objc_class *)objc_opt_class(self);
    id v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[PBMutableSystemOverlayPresentationRequest setIdentifier:](v8, "setIdentifier:", v11);

    -[PBMutableSystemOverlayPresentationRequest setAnimated:](v8, "setAnimated:", 0LL);
    objc_initWeak(&location, self);
    v12 = objc_alloc(&OBJC_CLASS___PBBlockSystemOverlayUIProvider);
    id v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472LL;
    id v18 = sub_100135090;
    id v19 = &unk_1003D8AD8;
    id v20 = v6;
    id v21 = self;
    objc_copyWeak(&v22, &location);
    v13 = -[PBBlockSystemOverlayUIProvider initWithBlock:](v12, "initWithBlock:", &v16);
    -[PBMutableSystemOverlayPresentationRequest setProvider:](v8, "setProvider:", v13, v16, v17, v18, v19);
    overlayController = self->_overlayController;
    id v15 = -[PBMutableSystemOverlayPresentationRequest copy](v8, "copy");
    -[PBSystemOverlayController presentWithRequest:completion:]( overlayController,  "presentWithRequest:completion:",  v15,  v4);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  else if (v4)
  {
    v4[2](v4, 0LL);
  }
}

- (void)_dismissWithCompletion:(id)a3
{
  unsigned __int8 v4 = (void (**)(id, void))a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlayController activeSession](self->_overlayController, "activeSession"));

  if (v5)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___PBMutableSystemOverlayDismissalRequest);
    id v7 = (objc_class *)objc_opt_class(self);
    unsigned int v8 = NSStringFromClass(v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[PBMutableSystemOverlayDismissalRequest setIdentifier:](v6, "setIdentifier:", v9);

    -[PBMutableSystemOverlayDismissalRequest setAnimated:](v6, "setAnimated:", 0LL);
    -[PBSystemOverlayController dismissWithRequest:completion:]( self->_overlayController,  "dismissWithRequest:completion:",  v6,  v4);
  }

  else if (v4)
  {
    v4[2](v4, 0LL);
  }
}

- (void)_presentHintBulletinIfAppropriate
{
  systemUIServiceHintManager = self->_systemUIServiceHintManager;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemUIServicePresenter _currentUserID](self, "_currentUserID"));
  LODWORD(systemUIServiceHintManager) = -[PBSystemUIServiceHintManager shouldDisplayHintForUserID:]( systemUIServiceHintManager,  "shouldDisplayHintForUserID:",  v4);

  if ((_DWORD)systemUIServiceHintManager)
  {
    id v5 = (NSTimer *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlayController activeSession](self->_overlayController, "activeSession"));
    if (!v5) {
      goto LABEL_4;
    }
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlayController activeSession](self->_overlayController, "activeSession"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    unsigned int v8 = (objc_class *)objc_opt_class(self);
    id v9 = NSStringFromClass(v8);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    unsigned __int8 v11 = [v7 isEqualToString:v10];

    if ((v11 & 1) == 0)
    {
      -[PBSystemUIServicePresenter _startPendingHintBulletinTimer](self, "_startPendingHintBulletinTimer");
    }

    else
    {
LABEL_4:
      -[NSTimer invalidate](self->_pendingHintPresentationTimer, "invalidate");
      pendingHintPresentationTimer = self->_pendingHintPresentationTimer;
      self->_pendingHintPresentationTimer = 0LL;

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      id v14 = sub_1001C307C(@"ControlCenterHintMessageFormatString", 0LL);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      id v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  v15,  PBSSystemBulletinTextImageIDTVButton));
      [v13 setObject:v16 forKeyedSubscript:PBSSystemBulletinMessageKey];

      [v13 setObject:&off_1003FDC08 forKeyedSubscript:PBSSystemBulletinTimeoutKey];
      uint64_t v17 = objc_alloc_init(&OBJC_CLASS___PBSBulletin);
      -[PBSBulletin setServiceIdentifier:](v17, "setServiceIdentifier:", PBSSystemBulletinServiceName);
      -[PBSBulletin setViewControllerClassName:]( v17,  "setViewControllerClassName:",  PBSSystemBulletinViewControllerClassName);
      -[PBSBulletin setMessage:](v17, "setMessage:", v13);
      -[PBBulletinService presentBulletin:withCompletion:]( self->_bulletinService,  "presentBulletin:withCompletion:",  v17,  0LL);
      id v18 = self->_systemUIServiceHintManager;
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemUIServicePresenter _currentUserID](self, "_currentUserID"));
      -[PBSystemUIServiceHintManager didShowHintForUserID:](v18, "didShowHintForUserID:", v19);
    }
  }

  else
  {
    -[NSTimer invalidate](self->_pendingHintPresentationTimer, "invalidate");
    id v5 = self->_pendingHintPresentationTimer;
    self->_pendingHintPresentationTimer = 0LL;
  }
}

- (id)_currentUserID
{
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue( -[PBUserProfileManager _selectedUserProfileIdentifier]( self->_userProfileManager,  "_selectedUserProfileIdentifier"));
  BOOL v3 = v2;
  if (!v2) {
    v2 = @"DefaultUser";
  }
  unsigned __int8 v4 = v2;

  return v4;
}

- (void)_startPendingHintBulletinTimer
{
  if (!self->_pendingHintPresentationTimer)
  {
    objc_initWeak(&location, self);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100135510;
    v5[3] = &unk_1003D17D0;
    objc_copyWeak(&v6, &location);
    BOOL v3 = (NSTimer *)objc_claimAutoreleasedReturnValue( +[NSTimer scheduledTimerWithTimeInterval:repeats:block:]( &OBJC_CLASS___NSTimer,  "scheduledTimerWithTimeInterval:repeats:block:",  1LL,  v5,  10.0));
    pendingHintPresentationTimer = self->_pendingHintPresentationTimer;
    self->_pendingHintPresentationTimer = v3;

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }

- (PBControlCenterPresentingDelegate)controlCenterPresenterDelegate
{
  return (PBControlCenterPresentingDelegate *)objc_loadWeakRetained((id *)&self->_controlCenterPresenterDelegate);
}

- (void)setControlCenterPresenterDelegate:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (PBHomeUIManager)systemHomeUIManager
{
  return (PBHomeUIManager *)objc_loadWeakRetained((id *)&self->_systemHomeUIManager);
}

- (PBSystemUIServiceHintManager)systemUIServiceHintManager
{
  return self->_systemUIServiceHintManager;
}

- (PBUserProfileManager)userProfileManager
{
  return self->_userProfileManager;
}

- (PBBulletinService)bulletinService
{
  return self->_bulletinService;
}

- (NSTimer)pendingHintPresentationTimer
{
  return self->_pendingHintPresentationTimer;
}

- (void)setPendingHintPresentationTimer:(id)a3
{
}

- (PBSceneManager)sceneManager
{
  return (PBSceneManager *)objc_loadWeakRetained((id *)&self->_sceneManager);
}

- (PBSceneDeactivationManager)sceneDeactivationManager
{
  return self->_sceneDeactivationManager;
}

- (PBSystemOverlayController)overlayController
{
  return self->_overlayController;
}

- (PBSystemUIServiceConduit)conduit
{
  return self->_conduit;
}

- (PBSystemUIServiceViewController)activePresentation
{
  return (PBSystemUIServiceViewController *)objc_loadWeakRetained((id *)&self->_activePresentation);
}

- (PBCoordinatedTransitionToken)coordinatedTransitionToken
{
  return self->_coordinatedTransitionToken;
}

- (void).cxx_destruct
{
}

@end