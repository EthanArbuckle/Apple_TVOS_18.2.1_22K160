@interface PBScreenSaverManager
+ (PBDependencyDescription)dependencyDescription;
+ (id)_sceneWorkspace;
+ (id)sharedInstance;
- (BOOL)dismissScreenSaver;
- (BOOL)dismissScreenSaverWithCompletion:(id)a3;
- (BOOL)holdOffForMusicEnabled;
- (BOOL)isPresenting;
- (BSInvalidatable)suppressSiriAssertion;
- (NSHashTable)observers;
- (PBConferenceRoomDisplayManager)conferenceRoomDisplayManager;
- (PBDialogHiddenAssertion)hideDialogAssertion;
- (PBScreenSaverContentPresentingViewController)contentViewController;
- (PBScreenSaverManager)init;
- (PBSystemGestureHandle)dismissGesture;
- (PBSystemGestureHandle)playPauseGesture;
- (PBSystemOverlayController)overlayController;
- (TVSPreferences)screenSaverPrefs;
- (double)screenSaverActivationDelayInMinutes;
- (id)_screenSaverAppBundleID;
- (id)_screenSaverApplication;
- (void)_activateScreenSaverForReason:(unint64_t)a3 forPosterBundleID:(id)a4 completion:(id)a5;
- (void)_addConferenceRoomdDisplayManagerRestrictionCheckToViewController:(id)a3;
- (void)_handleSiriDidChangeVisibleState:(int64_t)a3;
- (void)_launchDemoAppIfNeededWithCompletion:(id)a3;
- (void)_notifyPhotosSourcesDaemon;
- (void)_postSystemDidChangeIdleState:(BOOL)a3;
- (void)_updateActivationDelay;
- (void)activateScreenSaverForReason:(unint64_t)a3 forPosterBundleID:(id)a4 completion:(id)a5;
- (void)addObserver:(id)a3;
- (void)appTransitioner:(id)a3 willBeginAppTransition:(id)a4;
- (void)dealloc;
- (void)fetchInitialPhotoAssets;
- (void)overlayController:(id)a3 didDismissSession:(id)a4;
- (void)overlayController:(id)a3 didPresentSession:(id)a4;
- (void)overlayController:(id)a3 willDismissSession:(id)a4 withContext:(id)a5;
- (void)overlayController:(id)a3 willPresentSession:(id)a4;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
- (void)removeObserver:(id)a3;
- (void)setConferenceRoomDisplayManager:(id)a3;
- (void)setContentViewController:(id)a3;
- (void)setHoldOffForMusicEnabled:(BOOL)a3;
- (void)setScreenSaverActivationDelayInMinutes:(double)a3;
- (void)siriManager:(id)a3 didUpdateVisibleState:(int64_t)a4;
- (void)siriManagerDidUnhideSiriWindow:(id)a3;
@end

@implementation PBScreenSaverManager

+ (PBDependencyDescription)dependencyDescription
{
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10003275C;
  v17[3] = &unk_1003CFF78;
  v17[4] = a1;
  v2 = -[PBDependencyDescription initWithInstanceProvider:]( objc_alloc(&OBJC_CLASS___PBDependencyDescription),  "initWithInstanceProvider:",  v17);
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___PBDefaultOpenAppTransitioner, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v18[0] = v5;
  uint64_t v7 = objc_opt_self(&OBJC_CLASS___PBWindowManager, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v18[1] = v8;
  uint64_t v10 = objc_opt_self(&OBJC_CLASS___PBSiriManager, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v18[2] = v11;
  uint64_t v13 = objc_opt_self(&OBJC_CLASS___PBConferenceRoomDisplayManager, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v18[3] = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v18, 4LL));
  -[PBDependencyDescription addDependencies:](v2, "addDependencies:", v15);

  return v2;
}

+ (id)sharedInstance
{
  if (qword_100470050 != -1) {
    dispatch_once(&qword_100470050, &stru_1003D15C0);
  }
  return (id)qword_100470048;
}

+ (id)_sceneWorkspace
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100032864;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_100470060 != -1) {
    dispatch_once(&qword_100470060, block);
  }
  return (id)qword_100470058;
}

- (PBScreenSaverManager)init
{
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___PBScreenSaverManager;
  v2 = -[PBScreenSaverManager init](&v29, "init");
  if (v2)
  {
    uint64_t v3 = objc_claimAutoreleasedReturnValue(+[TVSPreferences sharedScreenSaverPreferences](&OBJC_CLASS___TVSPreferences, "sharedScreenSaverPreferences"));
    screenSaverPrefs = v2->_screenSaverPrefs;
    v2->_screenSaverPrefs = (TVSPreferences *)v3;

    v5 = -[NSHashTable initWithOptions:capacity:]( objc_alloc(&OBJC_CLASS___NSHashTable),  "initWithOptions:capacity:",  5LL,  0LL);
    observers = v2->_observers;
    v2->_observers = v5;

    uint64_t v7 = (uint64_t)-[TVSPreferences activationDelay](v2->_screenSaverPrefs, "activationDelay");
    double v8 = (double)v7;
    if (v7 < 1) {
      double v8 = -1.0;
    }
    v2->_screenSaverActivationDelayInMinutes = v8;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100032B9C;
    v27[3] = &unk_1003D0FA8;
    uint64_t v9 = v2;
    v28 = v9;
    +[PBDependencyCoordinator registerInstance:dependencyBlock:]( &OBJC_CLASS___PBDependencyCoordinator,  "registerInstance:dependencyBlock:",  v9,  v27);
    objc_initWeak(&location, v9);
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[TVSPreferences domain](v2->_screenSaverPrefs, "domain"));
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100032D18;
    v24[3] = &unk_1003D0890;
    objc_copyWeak(&v25, &location);
    id v11 =  +[TVSPreferences addObserverForDomain:withDistributedSynchronizationHandler:]( &OBJC_CLASS___TVSPreferences,  "addObserverForDomain:withDistributedSynchronizationHandler:",  v10,  v24);

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemGestureManager sharedInstance](&OBJC_CLASS___PBSystemGestureManager, "sharedInstance"));
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = sub_100032DF0;
    v22[3] = &unk_1003D1020;
    objc_copyWeak(&v23, &location);
    uint64_t v13 = (PBSystemGestureHandle *)[v12 newHandleForSystemGesture:34 actionHandler:v22];
    dismissGesture = v9->_dismissGesture;
    v9->_dismissGesture = v13;

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[PBSystemGestureManager sharedInstance](&OBJC_CLASS___PBSystemGestureManager, "sharedInstance"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = sub_100032E1C;
    v20[3] = &unk_1003D1020;
    objc_copyWeak(&v21, &location);
    v16 = (PBSystemGestureHandle *)[v15 newHandleForSystemGesture:35 actionHandler:v20];
    playPauseGesture = v9->_playPauseGesture;
    v9->_playPauseGesture = v16;

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    [v18 registerObserver:v9];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[PBDefaultOpenAppTransitioner sharedInstance]( &OBJC_CLASS___PBDefaultOpenAppTransitioner,  "sharedInstance"));
  [v3 removeObserver:self];

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSiriManager sharedInstance](&OBJC_CLASS___PBSiriManager, "sharedInstance"));
  [v4 removeObserver:self];

  -[BSInvalidatable invalidate](self->_suppressSiriAssertion, "invalidate");
  -[PBSystemGestureHandle invalidate](self->_dismissGesture, "invalidate");
  -[PBSystemGestureHandle invalidate](self->_playPauseGesture, "invalidate");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  [v5 unregisterObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBScreenSaverManager;
  -[PBScreenSaverManager dealloc](&v6, "dealloc");
}

- (void)fetchInitialPhotoAssets
{
}

- (void)activateScreenSaverForReason:(unint64_t)a3 forPosterBundleID:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_initWeak(&location, self);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_100033018;
  v12[3] = &unk_1003D15E8;
  id v10 = v9;
  id v14 = v10;
  objc_copyWeak(v15, &location);
  v15[1] = (id)a3;
  id v11 = v8;
  id v13 = v11;
  -[PBScreenSaverManager _launchDemoAppIfNeededWithCompletion:](self, "_launchDemoAppIfNeededWithCompletion:", v12);

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
}

- (void)_activateScreenSaverForReason:(unint64_t)a3 forPosterBundleID:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, void))a5;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBScreenSaverManager _screenSaverApplication](self, "_screenSaverApplication"));
  id v11 = v10;
  if (v10)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleIdentifier]);
    v34 = (void *)objc_claimAutoreleasedReturnValue( +[FBSSceneIdentity pb_identityForApplicationIdentifier:role:]( &OBJC_CLASS___FBSSceneIdentity,  "pb_identityForApplicationIdentifier:role:",  v12,  @"screensaver"));

    id v13 = [(id)objc_opt_class(self) _sceneWorkspace];
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[FBSMutableSceneDefinition definition](&OBJC_CLASS___FBSMutableSceneDefinition, "definition"));
    [v15 setIdentity:v34];
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "fbs_sceneClientIdentity"));
    [v15 setClientIdentity:v16];

    v17 = (void *)objc_claimAutoreleasedReturnValue([v11 defaultSceneSpecification]);
    [v15 setSpecification:v17];

    v18 = (void *)objc_claimAutoreleasedReturnValue( +[PBUIScreenSaverActivationContext contextWithActivationReason:previewPosterBundleID:]( &OBJC_CLASS___PBUIScreenSaverActivationContext,  "contextWithActivationReason:previewPosterBundleID:",  a3,  v8));
    v19 = -[PBScreenSaverContentPresentingViewController initWithSceneWorkspace:sceneDefinition:layoutLevel:]( objc_alloc(&OBJC_CLASS___PBScreenSaverContentPresentingViewController),  "initWithSceneWorkspace:sceneDefinition:layoutLevel:",  v14,  v15,  -[PBSystemOverlayController layoutLevel](self->_overlayController, "layoutLevel"));
    contentViewController = self->_contentViewController;
    self->_contentViewController = v19;

    -[PBScreenSaverManager _addConferenceRoomdDisplayManagerRestrictionCheckToViewController:]( self,  "_addConferenceRoomdDisplayManagerRestrictionCheckToViewController:",  self->_contentViewController);
    id v21 = self->_contentViewController;
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[PBUIScreenSaverActivationAction actionWithScreenSaverActivationContext:]( &OBJC_CLASS___PBUIScreenSaverActivationAction,  "actionWithScreenSaverActivationContext:",  v18));
    v35 = v22;
    id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v35, 1LL));
    -[PBScreenSaverContentPresentingViewController setTransitionActions:](v21, "setTransitionActions:", v23);

    v24 = objc_alloc_init(&OBJC_CLASS___PBMutableSystemOverlayPresentationRequest);
    id v25 = (objc_class *)objc_opt_class(self);
    v26 = NSStringFromClass(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    -[PBMutableSystemOverlayPresentationRequest setIdentifier:](v24, "setIdentifier:", v27);

    -[PBMutableSystemOverlayPresentationRequest setAnimated:](v24, "setAnimated:", 1LL);
    -[PBMutableSystemOverlayPresentationRequest setProvider:](v24, "setProvider:", self->_contentViewController);
    id v28 = sub_1000F7DD4();
    objc_super v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    -[PBMutableSystemOverlayPresentationRequest setSignpostLog:](v24, "setSignpostLog:", v29);

    overlayController = self->_overlayController;
    id v31 = -[PBMutableSystemOverlayPresentationRequest copy](v24, "copy");
    -[PBSystemOverlayController presentWithRequest:completion:]( overlayController,  "presentWithRequest:completion:",  v31,  v9);
  }

  else
  {
    id v32 = sub_100083D98();
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
      sub_100272D84(self, v33);
    }

    if (v9) {
      v9[2](v9, 0LL);
    }
  }
}

- (void)_addConferenceRoomdDisplayManagerRestrictionCheckToViewController:(id)a3
{
  id v4 = a3;
  objc_copyWeak(&to, (id *)&self->_conferenceRoomDisplayManager);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100033430;
  v5[3] = &unk_1003D1638;
  objc_copyWeak(&v6, &to);
  [v4 setShouldDismissHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&to);
}

- (BOOL)dismissScreenSaver
{
  return -[PBScreenSaverManager dismissScreenSaverWithCompletion:](self, "dismissScreenSaverWithCompletion:", 0LL);
}

- (BOOL)dismissScreenSaverWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  BOOL v5 = -[PBScreenSaverManager isPresenting](self, "isPresenting");
  if (v5)
  {
    objc_initWeak(&location, self);
    v17 = _NSConcreteStackBlock;
    uint64_t v18 = 3221225472LL;
    v19 = sub_10003375C;
    v20 = &unk_1003D1660;
    objc_copyWeak(&v22, &location);
    id v21 = v4;
    id v6 = objc_retainBlock(&v17);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue( -[PBSystemOverlayController activeSession]( self->_overlayController,  "activeSession",  v17,  v18,  v19,  v20));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[PBSystemOverlayDismissalRequest dismissalRequestForSession:]( &OBJC_CLASS___PBMutableSystemOverlayDismissalRequest,  "dismissalRequestForSession:",  v7));

    id v9 = (objc_class *)objc_opt_class(self);
    id v10 = NSStringFromClass(v9);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    [v8 setIdentifier:v11];

    [v8 setAnimated:1];
    overlayController = self->_overlayController;
    id v13 = [v8 copy];
    -[PBSystemOverlayController dismissWithRequest:completion:]( overlayController,  "dismissWithRequest:completion:",  v13,  v6);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  else if (v4)
  {
    v4[2](v4);
  }

  id v14 = sub_100083D98();
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(location) = 67109120;
    HIDWORD(location) = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "dismissScreenSaver handled: %d",  (uint8_t *)&location,  8u);
  }

  return v5;
}

- (void)setHoldOffForMusicEnabled:(BOOL)a3
{
  if (self->_holdOffForMusicEnabled != a3)
  {
    self->_holdOffForMusicEnabled = a3;
    -[PBScreenSaverManager _updateActivationDelay](self, "_updateActivationDelay");
  }

- (BOOL)isPresenting
{
  return -[PBSystemOverlayController hasActivePresentation](self->_overlayController, "hasActivePresentation");
}

- (void)overlayController:(id)a3 willPresentSession:(id)a4
{
  BOOL v5 = -[PBDialogHiddenAssertion initWithReason:]( objc_alloc(&OBJC_CLASS___PBDialogHiddenAssertion),  "initWithReason:",  @"ScreenSaver");
  hideDialogAssertion = self->_hideDialogAssertion;
  self->_hideDialogAssertion = v5;

  -[PBSystemGestureHandle acquire](self->_dismissGesture, "acquire");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBMediaRemoteObserver sharedInstance](&OBJC_CLASS___PBMediaRemoteObserver, "sharedInstance"));
  unsigned __int8 v8 = [v7 nowPlayingMediaTypeAudioOnly];

  if ((v8 & 1) == 0) {
    -[PBSystemGestureHandle acquire](self->_playPauseGesture, "acquire");
  }
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[PBSiriManager sharedInstance](&OBJC_CLASS___PBSiriManager, "sharedInstance"));
  id v10 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue( [v9 suppressSiriWithReason:@"PBScreenSaverTransitionSiriSuppressionReason"]);
  suppressSiriAssertion = self->_suppressSiriAssertion;
  self->_suppressSiriAssertion = v10;

  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBScreenSaverManager observers](self, "observers", 0LL));
  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v17, "screenSaverManagerWillPresentScreenSaver:") & 1) != 0) {
          [v17 screenSaverManagerWillPresentScreenSaver:self];
        }
      }

      id v14 = [v12 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }

    while (v14);
  }
}

- (void)overlayController:(id)a3 didPresentSession:(id)a4
{
  suppressSiriAssertion = self->_suppressSiriAssertion;
  self->_suppressSiriAssertion = 0LL;

  -[PBScreenSaverManager _postSystemDidChangeIdleState:](self, "_postSystemDidChangeIdleState:", 1LL);
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBScreenSaverManager observers](self, "observers", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v11, "screenSaverManagerDidPresentScreenSaver:") & 1) != 0) {
          [v11 screenSaverManagerDidPresentScreenSaver:self];
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }
}

- (void)overlayController:(id)a3 willDismissSession:(id)a4 withContext:(id)a5
{
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBScreenSaverManager observers](self, "observers", a3, a4, a5, 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v11, "screenSaverManagerWillDismissScreenSaver:") & 1) != 0) {
          [v11 screenSaverManagerWillDismissScreenSaver:self];
        }
      }

      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v8);
  }
}

- (void)overlayController:(id)a3 didDismissSession:(id)a4
{
  hideDialogAssertion = self->_hideDialogAssertion;
  self->_hideDialogAssertion = 0LL;

  -[BSInvalidatable invalidate](self->_suppressSiriAssertion, "invalidate");
  suppressSiriAssertion = self->_suppressSiriAssertion;
  self->_suppressSiriAssertion = 0LL;

  -[PBSystemGestureHandle relinquish](self->_dismissGesture, "relinquish");
  -[PBSystemGestureHandle relinquish](self->_playPauseGesture, "relinquish");
  -[PBScreenSaverManager _postSystemDidChangeIdleState:](self, "_postSystemDidChangeIdleState:", 0LL);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBScreenSaverManager observers](self, "observers", 0LL));
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        __int128 v12 = *(void **)(*((void *)&v13 + 1) + 8LL * (void)i);
        if ((objc_opt_respondsToSelector(v12, "screenSaverManagerDidDismissScreenSaver:") & 1) != 0) {
          [v12 screenSaverManagerDidDismissScreenSaver:self];
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }

    while (v9);
  }
}

- (void)appTransitioner:(id)a3 willBeginAppTransition:(id)a4
{
  id v5 = a4;
  if (-[PBScreenSaverManager isPresenting](self, "isPresenting"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 openRequest]);
    if ([v6 isForeground])
    {
      unsigned __int8 v7 = +[PBOverlayTransitionCoordinator isCoordinatedTransitionsEnabled]( &OBJC_CLASS___PBOverlayTransitionCoordinator,  "isCoordinatedTransitionsEnabled");

      if ((v7 & 1) == 0)
      {
        id v8 = sub_100083CA8();
        id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)uint64_t v10 = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Dismissing screensaver for app launch",  v10,  2u);
        }

        -[PBScreenSaverManager dismissScreenSaver](self, "dismissScreenSaver");
      }
    }

    else
    {
    }
  }
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)_launchDemoAppIfNeededWithCompletion:(id)a3
{
  uint64_t v3 = (void (**)(id, void))a3;
  unsigned int v4 = sub_1001C9CD8();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedAppInfoStore](&OBJC_CLASS___PineBoard, "sharedAppInfoStore"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 appLibrary]);
  unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 installedApplicationWithBundleIdentifier:@"com.apple.ist.DemoLoop-TV"]);

  if (v4 && !v7)
  {
    id v8 = sub_100083D98();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100272E18((uint64_t)@"com.apple.ist.DemoLoop-TV", v9);
    }

    goto LABEL_11;
  }

  if (!v4 || !v7)
  {
LABEL_11:
    v3[2](v3, 0LL);
    goto LABEL_12;
  }

  id v10 = sub_100083D98();
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    __int128 v16 = "-[PBScreenSaverManager _launchDemoAppIfNeededWithCompletion:]";
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s - Attempting to show demo app instead of screen saver on enrolled device",  buf,  0xCu);
  }

  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(+[PBProcessManager sharedInstance](&OBJC_CLASS___PBProcessManager, "sharedInstance"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100034020;
  v13[3] = &unk_1003D1688;
  __int128 v14 = v3;
  [v12 openApplication:@"com.apple.ist.DemoLoop-TV" launchURL:0 options:0 suspended:0 completion:v13];

LABEL_12:
}

- (void)_postSystemDidChangeIdleState:(BOOL)a3
{
  BOOL v3 = a3;
  if (qword_100470078 != -1) {
    dispatch_once(&qword_100470078, &stru_1003D16A8);
  }
  if (byte_100470068)
  {
    [(id)qword_100470070 lock];
    uint32_t v4 = notify_set_state(dword_100468C48, v3);
    if (v4)
    {
      int v5 = v4;
      [(id)qword_100470070 unlock];
      id v6 = sub_100083D98();
      unsigned __int8 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100272F08(v3, v5, v7);
      }
    }

    else
    {
      uint64_t v8 = notify_post("com.apple.appletv.backgroundstate");
      [(id)qword_100470070 unlock];
      if (!(_DWORD)v8) {
        return;
      }
      id v9 = sub_100083D98();
      unsigned __int8 v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100272EA0(v8, v7, v10, v11, v12, v13, v14, v15);
      }
    }
  }

- (id)_screenSaverAppBundleID
{
  v2 = &off_1003D7540;
  if ((_os_feature_enabled_impl("IdleScreen", "Fizzgig") & 1) == 0)
  {
    BOOL v3 = (void *)objc_claimAutoreleasedReturnValue( +[TVSPreferences sharedScreenSaverPreferences]( &OBJC_CLASS___TVSPreferences,  "sharedScreenSaverPreferences"));
    unsigned int v4 = [v3 idleScreenEnabled];

    if (!v4) {
      v2 = &off_1003D7570;
    }
  }

  return *v2;
}

- (id)_screenSaverApplication
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplicationController](&OBJC_CLASS___PineBoard, "sharedApplicationController"));
  unsigned int v4 = (void *)objc_claimAutoreleasedReturnValue(-[PBScreenSaverManager _screenSaverAppBundleID](self, "_screenSaverAppBundleID"));
  int v5 = (void *)objc_claimAutoreleasedReturnValue([v3 applicationForBundleIdentifier:v4]);

  return v5;
}

- (void)_updateActivationDelay
{
  if (!-[PBScreenSaverManager holdOffForMusicEnabled](self, "holdOffForMusicEnabled")
    || (v4 = -[TVSPreferences allowsScreenSaverOverMusic]( self->_screenSaverPrefs,  "allowsScreenSaverOverMusic"),  double v3 = 0.0,  v4))
  {
    double v3 = (double)(uint64_t)-[TVSPreferences activationDelay](self->_screenSaverPrefs, "activationDelay", v3);
  }

  if (v3 > 0.0) {
    double v5 = v3;
  }
  else {
    double v5 = -1.0;
  }
  -[PBScreenSaverManager screenSaverActivationDelayInMinutes](self, "screenSaverActivationDelayInMinutes");
  if (v6 != v5) {
    -[PBScreenSaverManager setScreenSaverActivationDelayInMinutes:](self, "setScreenSaverActivationDelayInMinutes:", v5);
  }
}

- (void)_notifyPhotosSourcesDaemon
{
}

- (void)siriManager:(id)a3 didUpdateVisibleState:(int64_t)a4
{
}

- (void)siriManagerDidUnhideSiriWindow:(id)a3
{
}

- (void)_handleSiriDidChangeVisibleState:(int64_t)a3
{
  unsigned int v5 = -[PBScreenSaverManager isPresenting](self, "isPresenting");
  if (a3 == 2)
  {
    if (v5)
    {
      objc_initWeak(&location, self);
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472LL;
      v6[2] = sub_1000344EC;
      v6[3] = &unk_1003D0890;
      objc_copyWeak(&v7, &location);
      BSDispatchMain(v6);
      objc_destroyWeak(&v7);
      objc_destroyWeak(&location);
    }
  }

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
}

- (double)screenSaverActivationDelayInMinutes
{
  return self->_screenSaverActivationDelayInMinutes;
}

- (void)setScreenSaverActivationDelayInMinutes:(double)a3
{
  self->_screenSaverActivationDelayInMinutes = a3;
}

- (BOOL)holdOffForMusicEnabled
{
  return self->_holdOffForMusicEnabled;
}

- (TVSPreferences)screenSaverPrefs
{
  return self->_screenSaverPrefs;
}

- (PBScreenSaverContentPresentingViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setContentViewController:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (PBSystemOverlayController)overlayController
{
  return self->_overlayController;
}

- (PBDialogHiddenAssertion)hideDialogAssertion
{
  return self->_hideDialogAssertion;
}

- (BSInvalidatable)suppressSiriAssertion
{
  return self->_suppressSiriAssertion;
}

- (PBSystemGestureHandle)dismissGesture
{
  return self->_dismissGesture;
}

- (PBSystemGestureHandle)playPauseGesture
{
  return self->_playPauseGesture;
}

- (PBConferenceRoomDisplayManager)conferenceRoomDisplayManager
{
  return (PBConferenceRoomDisplayManager *)objc_loadWeakRetained((id *)&self->_conferenceRoomDisplayManager);
}

- (void)setConferenceRoomDisplayManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end