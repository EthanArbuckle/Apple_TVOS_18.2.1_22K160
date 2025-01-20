@interface PBAirPlayManager
+ (PBDependencyDescription)dependencyDescription;
+ (id)sharedInstance;
- (BOOL)dismissAirPlay;
- (BOOL)isActivePiP;
- (BOOL)isPresenting;
- (PBAirPlayManager)init;
- (PBCoordinatedTransitionToken)coordinatedTransitionToken;
- (PBDialogHiddenAssertion)hideDialogAssertion;
- (PBProcessLaunchAgent)processLaunchAgent;
- (PBSceneHandle)sceneHandle;
- (PBSystemOverlayController)overlayController;
- (id)launchAirPlayProcessForReason:(id)a3;
- (id)sceneIdentifierForActivity:(id)a3 withProcess:(id)a4;
- (id)transitionCoordinator:(id)a3 willDismissTransitionWithToken:(id)a4 withContext:(id)a5;
- (int64_t)presentingLayoutLevel;
- (void)_dismissWithReason:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_presentAuxiliaryScene:(id)a3;
- (void)_updateAirPlayPresenting;
- (void)_updateAirPlayUIForActiveState:(BOOL)a3;
- (void)_updateHideDialogAssertion;
- (void)appTransitioner:(id)a3 willBeginAppTransition:(id)a4;
- (void)dealloc;
- (void)dismissAuxiliaryScene:(id)a3 completion:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)overlayController:(id)a3 didDismissSession:(id)a4;
- (void)overlayController:(id)a3 didPresentSession:(id)a4;
- (void)overlayController:(id)a3 willDismissSession:(id)a4 withContext:(id)a5;
- (void)overlayController:(id)a3 willPresentSession:(id)a4;
- (void)pictureInPictureManager:(id)a3 didCancelPictureInPictureForApplication:(id)a4;
- (void)pictureInPictureManager:(id)a3 didStopPictureInPictureForApplication:(id)a4;
- (void)pictureInPictureManager:(id)a3 didUpdateState:(id)a4;
- (void)presentAuxiliaryScene:(id)a3;
- (void)presentUIProvider:(id)a3 completion:(id)a4;
- (void)sceneHandle:(id)a3 didDestroyScene:(id)a4;
- (void)screenSaverManagerDidPresentScreenSaver:(id)a3;
@end

@implementation PBAirPlayManager

+ (PBDependencyDescription)dependencyDescription
{
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100053DF0;
  v20[3] = &unk_1003CFF78;
  v20[4] = a1;
  v2 = -[PBDependencyDescription initWithInstanceProvider:]( objc_alloc(&OBJC_CLASS___PBDependencyDescription),  "initWithInstanceProvider:",  v20);
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___PBDefaultOpenAppTransitioner, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v21[0] = v5;
  uint64_t v7 = objc_opt_self(&OBJC_CLASS___PBWindowManager, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v21[1] = v8;
  uint64_t v10 = objc_opt_self(&OBJC_CLASS___PBPictureInPictureManager, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v21[2] = v11;
  uint64_t v13 = objc_opt_self(&OBJC_CLASS___PBSceneManager, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v21[3] = v14;
  uint64_t v16 = objc_opt_self(&OBJC_CLASS___PBScreenSaverManager, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v21[4] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v21, 5LL));
  -[PBDependencyDescription addDependencies:](v2, "addDependencies:", v18);

  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100053E88;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_100470140 != -1) {
    dispatch_once(&qword_100470140, block);
  }
  return (id)qword_100470138;
}

- (PBAirPlayManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBAirPlayManager;
  v2 = -[PBAirPlayManager init](&v7, "init");
  uint64_t v3 = v2;
  if (v2)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100053F4C;
    v5[3] = &unk_1003D0FA8;
    uint64_t v6 = v2;
    +[PBDependencyCoordinator registerInstance:dependencyBlock:]( &OBJC_CLASS___PBDependencyCoordinator,  "registerInstance:dependencyBlock:",  v6,  v5);
  }

  return v3;
}

- (void)dealloc
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBPictureInPictureManager sharedInstance](&OBJC_CLASS___PBPictureInPictureManager, "sharedInstance"));
  [v3 removeObserver:self];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[PBDefaultOpenAppTransitioner sharedInstance]( &OBJC_CLASS___PBDefaultOpenAppTransitioner,  "sharedInstance"));
  [v4 removeObserver:self];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBScreenSaverManager sharedInstance](&OBJC_CLASS___PBScreenSaverManager, "sharedInstance"));
  [v5 removeObserver:self];

  -[PBSystemOverlayController removeObserver:forKeyPath:context:]( self->_overlayController,  "removeObserver:forKeyPath:context:",  self,  @"hasActivePresentation",  off_100469368);
  -[PBDialogHiddenAssertion invalidate](self->_hideDialogAssertion, "invalidate");
  hideDialogAssertion = self->_hideDialogAssertion;
  self->_hideDialogAssertion = 0LL;

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBAirPlayManager;
  -[PBAirPlayManager dealloc](&v7, "dealloc");
}

- (BOOL)isActivePiP
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PBPictureInPictureManager sharedInstance](&OBJC_CLASS___PBPictureInPictureManager, "sharedInstance"));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 activePictureInPictureApplicationBundleIDs]);
  unsigned __int8 v4 = [v3 containsObject:@"com.apple.TVAirPlay"];

  return v4;
}

- (void)presentUIProvider:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if (+[PBOverlayTransitionCoordinator isCoordinatedTransitionsEnabled]( &OBJC_CLASS___PBOverlayTransitionCoordinator,  "isCoordinatedTransitionsEnabled"))
  {
    v8 = -[PBCoordinatedTransitionFragmentDescriptor initWithType:provider:]( objc_alloc(&OBJC_CLASS___PBCoordinatedTransitionFragmentDescriptor),  "initWithType:provider:",  @"DismissAirPlay",  self);
    uint64_t v9 = objc_alloc_init(&OBJC_CLASS___PBCoordinatedTransitionToken);
    coordinatedTransitionToken = self->_coordinatedTransitionToken;
    self->_coordinatedTransitionToken = v9;

    -[PBCoordinatedTransitionToken setRespondingFragmentDescriptor:]( self->_coordinatedTransitionToken,  "setRespondingFragmentDescriptor:",  v8);
  }

  v11 = objc_alloc_init(&OBJC_CLASS___PBMutableSystemOverlayPresentationRequest);
  uint64_t v12 = (objc_class *)objc_opt_class(self);
  uint64_t v13 = NSStringFromClass(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  -[PBMutableSystemOverlayPresentationRequest setIdentifier:](v11, "setIdentifier:", v14);

  -[PBMutableSystemOverlayPresentationRequest setAnimated:](v11, "setAnimated:", 1LL);
  -[PBMutableSystemOverlayPresentationRequest setProvider:](v11, "setProvider:", v7);

  -[PBMutableSystemOverlayPresentationRequest setSceneDeactivationReasons:](v11, "setSceneDeactivationReasons:", 512LL);
  -[PBMutableSystemOverlayPresentationRequest setCoordinatedTransitionToken:]( v11,  "setCoordinatedTransitionToken:",  self->_coordinatedTransitionToken);
  overlayController = self->_overlayController;
  id v16 = -[PBMutableSystemOverlayPresentationRequest copy](v11, "copy");
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000543E4;
  v18[3] = &unk_1003CFF30;
  id v19 = v6;
  id v17 = v6;
  -[PBSystemOverlayController presentWithRequest:completion:]( overlayController,  "presentWithRequest:completion:",  v16,  v18);
}

- (BOOL)dismissAirPlay
{
  BOOL v3 = -[PBAirPlayManager isPresenting](self, "isPresenting");
  if (v3) {
    -[PBAirPlayManager _dismissWithReason:animated:completion:]( self,  "_dismissWithReason:animated:completion:",  @"Undefined",  1LL,  0LL);
  }
  return v3;
}

- (id)launchAirPlayProcessForReason:(id)a3
{
  id v4 = a3;
  processLaunchAgent = self->_processLaunchAgent;
  if (!processLaunchAgent)
  {
    id v6 = sub_1000F66DC();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplicationController](&OBJC_CLASS___PineBoard, "sharedApplicationController"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 airPlayApplication]);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 processIdentity]);

    if (v10)
    {
      v11 = -[PBProcessLaunchAgent initWithProcessIdentity:]( objc_alloc(&OBJC_CLASS___PBProcessLaunchAgent),  "initWithProcessIdentity:",  v10);
      uint64_t v12 = self->_processLaunchAgent;
      self->_processLaunchAgent = v11;

      uint64_t v13 = self->_processLaunchAgent;
      id v14 = sub_1000F66DC();
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      sub_1001623AC((id *)&v13->super.isa, (uint64_t)v15);

      id v16 = self->_processLaunchAgent;
      id v17 = (void *)objc_claimAutoreleasedReturnValue( +[RBSSubordinateProcessAttribute attribute]( &OBJC_CLASS___RBSSubordinateProcessAttribute,  "attribute"));
      v21 = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v21, 1LL));
      -[PBProcessLaunchAgent appendAttributes:](v16, "appendAttributes:", v18);

      -[PBProcessLaunchAgent setRelaunchProcessOnExit:](self->_processLaunchAgent, "setRelaunchProcessOnExit:", 1LL);
    }

    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      sub_100274574(v7);
    }

    processLaunchAgent = self->_processLaunchAgent;
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[PBProcessLaunchAgent launchProcessForReason:](processLaunchAgent, "launchProcessForReason:", v4));

  return v19;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_100469368 == a6)
  {
    -[PBAirPlayManager _updateAirPlayPresenting](self, "_updateAirPlayPresenting", a3, a4, a5);
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___PBAirPlayManager;
    -[PBAirPlayManager observeValueForKeyPath:ofObject:change:context:]( &v6,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)_updateAirPlayPresenting
{
  if (-[PBSystemOverlayController hasActivePresentation](self->_overlayController, "hasActivePresentation")) {
    unsigned int v3 = !-[PBAirPlayManager isActivePiP](self, "isActivePiP");
  }
  else {
    unsigned int v3 = 0;
  }
  if (self->_presenting != v3)
  {
    id v4 = sub_1000F6664();
    v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109376;
      v6[1] = v3;
      __int16 v7 = 1024;
      unsigned int v8 = -[PBAirPlayManager isActivePiP](self, "isActivePiP");
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "PBAirPlayManager - Updating presenting property to %{BOOL}d, (isPip=%{BOOL}d)",  (uint8_t *)v6,  0xEu);
    }

    -[PBAirPlayManager willChangeValueForKey:](self, "willChangeValueForKey:", @"presenting");
    self->_presenting = v3;
    -[PBAirPlayManager didChangeValueForKey:](self, "didChangeValueForKey:", @"presenting");
    -[PBAirPlayManager _updateHideDialogAssertion](self, "_updateHideDialogAssertion");
  }

- (void)_updateHideDialogAssertion
{
  unsigned int v3 = -[PBAirPlayManager isPresenting](self, "isPresenting");
  hideDialogAssertion = self->_hideDialogAssertion;
  if (v3)
  {
    if (hideDialogAssertion) {
      return;
    }
    v5 = -[PBDialogHiddenAssertion initWithReason:]( objc_alloc(&OBJC_CLASS___PBDialogHiddenAssertion),  "initWithReason:",  @"AirPlay");
  }

  else
  {
    if (!hideDialogAssertion) {
      return;
    }
    -[PBDialogHiddenAssertion invalidate](hideDialogAssertion, "invalidate");
    v5 = 0LL;
  }

  objc_super v6 = self->_hideDialogAssertion;
  self->_hideDialogAssertion = v5;
}

- (void)_updateAirPlayUIForActiveState:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_100470148 != -1) {
    dispatch_once(&qword_100470148, &stru_1003D20B8);
  }
  if (notify_is_valid_token(dword_100469370))
  {
    notify_set_state(dword_100469370, v3);
    notify_post(PBSAirPlayUIActiveChangedNotification);
  }

- (void)_dismissWithReason:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v7 = a4;
  id v9 = a3;
  uint64_t v10 = (void (**)(void))a5;
  v11 = _os_activity_create( (void *)&_mh_execute_header,  "airplay/dismiss",  (os_activity_t)&_os_activity_current,  OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v11, &state);

  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlayController activeSession](self->_overlayController, "activeSession"));
  id v13 = sub_1000F6664();
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v24 = v9;
    __int16 v25 = 2048;
    v26 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Requested AirPlay dismissal with reason: %{public}@ {activeSession=%p}",  buf,  0x16u);
  }

  if (v12)
  {
    if (v10)
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472LL;
      v20[2] = sub_100054B08;
      v20[3] = &unk_1003CFF30;
      uint64_t v15 = v20;
      v5 = (id *)&v21;
      v21 = v10;
    }

    else
    {
      uint64_t v15 = 0LL;
    }

    id v16 = objc_retainBlock(v15);
    id v17 = (void *)objc_claimAutoreleasedReturnValue( +[PBSystemOverlayDismissalRequest dismissalRequestForSession:]( &OBJC_CLASS___PBMutableSystemOverlayDismissalRequest,  "dismissalRequestForSession:",  v12));
    [v17 setAnimated:v7];
    overlayController = self->_overlayController;
    id v19 = [v17 copy];
    -[PBSystemOverlayController dismissWithRequest:completion:]( overlayController,  "dismissWithRequest:completion:",  v19,  v16);

    if (v10) {
  }
    }

  else if (v10)
  {
    v10[2](v10);
  }

  os_activity_scope_leave(&state);
}

- (void)overlayController:(id)a3 willPresentSession:(id)a4
{
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[PBControlCenterManager sharedInstance]( &OBJC_CLASS___PBControlCenterManager,  "sharedInstance",  a3,  a4));
  [v5 dismissControlCenter];

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBScreenSaverManager sharedInstance](&OBJC_CLASS___PBScreenSaverManager, "sharedInstance"));
  [v6 dismissScreenSaver];

  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSoftwareUpdateService sharedInstance](&OBJC_CLASS___PBSoftwareUpdateService, "sharedInstance"));
  [v7 notePlaybackStateChanged];

  -[PBAirPlayManager _updateAirPlayUIForActiveState:](self, "_updateAirPlayUIForActiveState:", 1LL);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
  [v8 unhideSystemUIAtLevel:8 animated:0 completion:0];
}

- (void)overlayController:(id)a3 didPresentSession:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBBulletinManager sharedInstance](&OBJC_CLASS___PBBulletinManager, "sharedInstance", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplication](&OBJC_CLASS___PineBoard, "sharedApplication"));
  [v5 userActivityTriggeredForReason:@"AirPlay"];
}

- (void)overlayController:(id)a3 willDismissSession:(id)a4 withContext:(id)a5
{
  coordinatedTransitionToken = self->_coordinatedTransitionToken;
  self->_coordinatedTransitionToken = 0LL;
}

- (void)overlayController:(id)a3 didDismissSession:(id)a4
{
  sceneHandle = self->_sceneHandle;
  if (sceneHandle)
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneHandle sceneIdentifier](sceneHandle, "sceneIdentifier"));
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[FBSceneManager sharedInstance](&OBJC_CLASS___FBSceneManager, "sharedInstance"));
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sceneWithIdentifier:v6]);

    if (v8)
    {
      id v9 = objc_alloc(&OBJC_CLASS___UIDestroySceneAction);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneHandle sceneIdentifier](self->_sceneHandle, "sceneIdentifier"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v10));
      id v12 = [v9 initWithPersistedIdentifiers:v11 preferredAnimationType:1 callbackQueue:0 completion:0];

      id v13 = objc_alloc_init(&OBJC_CLASS___FBSSceneTransitionContext);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v12));
      -[FBSSceneTransitionContext setActions:](v13, "setActions:", v14);
    }

    else
    {
      id v13 = 0LL;
    }

    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(+[FBSceneManager sharedInstance](&OBJC_CLASS___FBSceneManager, "sharedInstance"));
    [v15 destroyScene:v6 withTransitionContext:v13];

    id v16 = self->_sceneHandle;
    id v17 = self->_sceneHandle;
    self->_sceneHandle = 0LL;

    v20 = _NSConcreteStackBlock;
    uint64_t v21 = 3221225472LL;
    v22 = sub_100054E94;
    v23 = &unk_1003CFEB8;
    id v24 = v16;
    __int16 v25 = self;
    v18 = v16;
    dispatch_async(&_dispatch_main_q, &v20);
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance", v20, v21, v22, v23));
  [v19 unhideSystemUIAtLevel:8 animated:0 completion:0];
}

- (id)transitionCoordinator:(id)a3 willDismissTransitionWithToken:(id)a4 withContext:(id)a5
{
  id v6 = a5;
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 transitionHint]);
  uint64_t v8 = objc_opt_class(&OBJC_CLASS___PBDismissAirPlayTransitionHint);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 transitionHint]);
    unsigned int v10 = [v9 requiresFullscreenPresentation];

    int v11 = v10 ^ 1;
  }

  else
  {
    int v11 = 1;
  }

  if (-[PBAirPlayManager isPresenting](self, "isPresenting")
    && ((v11 | -[PBAirPlayManager isActivePiP](self, "isActivePiP")) & 1) == 0)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100054FB8;
    v14[3] = &unk_1003D20E0;
    v14[4] = self;
    id v12 = [[BSBlockTransaction alloc] initWithBlock:v14];
  }

  else
  {
    id v12 = 0LL;
  }

  return v12;
}

- (void)appTransitioner:(id)a3 willBeginAppTransition:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 openRequest]);
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 launchReason]);

  unsigned int v8 = [v7 isEqual:@"ForegroundProcessTerminatedUnexpectedly"];
  if (-[PBAirPlayManager isPresenting](self, "isPresenting"))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 openRequest]);
    if (([v9 isForeground] ^ 1 | v8) == 1)
    {
    }

    else
    {
      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( +[PBPictureInPictureManager sharedInstance]( &OBJC_CLASS___PBPictureInPictureManager,  "sharedInstance"));
      unsigned __int8 v11 = [v10 isSwapping];

      if ((v11 & 1) == 0) {
        -[PBAirPlayManager _dismissWithReason:animated:completion:]( self,  "_dismissWithReason:animated:completion:",  @"Open app transition",  1LL,  0LL);
      }
    }
  }
}

- (void)screenSaverManagerDidPresentScreenSaver:(id)a3
{
  if (-[PBAirPlayManager isPresenting](self, "isPresenting", a3)) {
    -[PBAirPlayManager _dismissWithReason:animated:completion:]( self,  "_dismissWithReason:animated:completion:",  @"IdleScreen presentation",  1LL,  0LL);
  }
}

- (int64_t)presentingLayoutLevel
{
  return -[PBSystemOverlayController layoutLevel](self->_overlayController, "layoutLevel");
}

- (id)sceneIdentifierForActivity:(id)a3 withProcess:(id)a4
{
  id v4 = a4;
  if ([v4 hasEntitlement:@"com.apple.appletv.pbs.airplay-service-access"])
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[FBSSceneIdentity pb_identityForApplicationIdentifier:role:]( &OBJC_CLASS___FBSSceneIdentity,  "pb_identityForApplicationIdentifier:role:",  v5,  @"airplay"));
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (void)presentAuxiliaryScene:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  _DWORD v6[2] = sub_1000552FC;
  v6[3] = &unk_1003D0418;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  -[PBAirPlayManager _dismissWithReason:animated:completion:]( self,  "_dismissWithReason:animated:completion:",  @"New presentation",  1LL,  v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_presentAuxiliaryScene:(id)a3
{
  id v4 = a3;
  id v5 = -[PBSceneHandle initWithScene:](objc_alloc(&OBJC_CLASS___PBSceneHandle), "initWithScene:", v4);

  -[PBSceneHandle addObserver:](v5, "addObserver:", self);
  objc_storeStrong((id *)&self->_sceneHandle, v5);
  id v6 = objc_alloc(&OBJC_CLASS___PBBlockSystemOverlayUIProvider);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100055414;
  v9[3] = &unk_1003D2108;
  unsigned int v10 = v5;
  id v7 = v5;
  id v8 = -[PBBlockSystemOverlayUIProvider initWithBlock:](v6, "initWithBlock:", v9);
  -[PBAirPlayManager presentUIProvider:completion:](self, "presentUIProvider:completion:", v8, 0LL);
}

- (void)dismissAuxiliaryScene:(id)a3 completion:(id)a4
{
  sceneHandle = self->_sceneHandle;
  self->_sceneHandle = 0LL;
  id v6 = a4;

  -[PBAirPlayManager _dismissWithReason:animated:completion:]( self,  "_dismissWithReason:animated:completion:",  @"Requested scene destruction",  1LL,  v6);
}

- (void)pictureInPictureManager:(id)a3 didUpdateState:(id)a4
{
  if (objc_msgSend(a4, "isPictureInPictureActive", a3)
    && -[PBAirPlayManager isActivePiP](self, "isActivePiP"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
    [v5 hideSystemUIAtLevel:8 animated:1 completion:0];
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
    [v5 unhideSystemUIAtLevel:8 animated:0 completion:0];
  }

  -[PBAirPlayManager _updateAirPlayPresenting](self, "_updateAirPlayPresenting");
}

- (void)pictureInPictureManager:(id)a3 didStopPictureInPictureForApplication:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a4 bundleIdentifier]);
  unsigned int v7 = [v6 isEqual:@"com.apple.TVAirPlay"];

  if (!v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
    [v8 hideSystemUIAtLevel:8 animated:0 completion:0];
    goto LABEL_5;
  }

  if (([v5 isSwapping] & 1) == 0)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
    [v8 unhideSystemUIAtLevel:8 animated:1 completion:0];
LABEL_5:
  }
}

- (void)pictureInPictureManager:(id)a3 didCancelPictureInPictureForApplication:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "bundleIdentifier", a3));
  unsigned int v6 = [v5 isEqual:@"com.apple.TVAirPlay"];

  if (v6) {
    -[PBAirPlayManager _dismissWithReason:animated:completion:]( self,  "_dismissWithReason:animated:completion:",  @"PiP cancellation",  1LL,  0LL);
  }
}

- (void)sceneHandle:(id)a3 didDestroyScene:(id)a4
{
  if (self->_sceneHandle == a3) {
    -[PBAirPlayManager _dismissWithReason:animated:completion:]( self,  "_dismissWithReason:animated:completion:",  @"Requested scene destruction",  0LL,  0LL);
  }
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

- (PBCoordinatedTransitionToken)coordinatedTransitionToken
{
  return self->_coordinatedTransitionToken;
}

- (PBSystemOverlayController)overlayController
{
  return self->_overlayController;
}

- (PBDialogHiddenAssertion)hideDialogAssertion
{
  return self->_hideDialogAssertion;
}

- (PBSceneHandle)sceneHandle
{
  return self->_sceneHandle;
}

- (PBProcessLaunchAgent)processLaunchAgent
{
  return self->_processLaunchAgent;
}

- (void).cxx_destruct
{
}

@end