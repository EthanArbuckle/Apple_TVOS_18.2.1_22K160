@interface PBNowPlayingManager
+ (PBDependencyDescription)dependencyDescription;
+ (id)sharedInstance;
- (BOOL)_dismissWithCompletion:(id)a3;
- (BOOL)dismissNowPlaying;
- (BOOL)isPresenting;
- (BOOL)nowPlayingAppFocused;
- (PBCoordinatedTransitionToken)coordinatedTransitionToken;
- (PBNowPlayingManager)init;
- (PBSystemOverlayController)overlayController;
- (id)transitionCoordinator:(id)a3 willDismissTransitionWithToken:(id)a4 withContext:(id)a5;
- (void)_updateNowPlayingAppFocused;
- (void)_updateNowPlayingAppFocusedUsingMediaRemoteObserver:(id)a3 siriManager:(id)a4 airPlayManager:(id)a5 sceneManager:(id)a6 processManager:(id)a7;
- (void)activateNowPlayingForReason:(unint64_t)a3 options:(id)a4;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)overlayController:(id)a3 willDismissSession:(id)a4 withContext:(id)a5;
- (void)sceneManager:(id)a3 didChangeCurrentApplicationFromSceneHandle:(id)a4 toSceneHandle:(id)a5;
- (void)setOverlayController:(id)a3;
@end

@implementation PBNowPlayingManager

+ (PBDependencyDescription)dependencyDescription
{
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = sub_10013590C;
  v23[3] = &unk_1003CFF78;
  v23[4] = a1;
  v2 = -[PBDependencyDescription initWithInstanceProvider:]( objc_alloc(&OBJC_CLASS___PBDependencyDescription),  "initWithInstanceProvider:",  v23);
  uint64_t v4 = objc_opt_self(&OBJC_CLASS___PBAirPlayManager, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v24[0] = v5;
  uint64_t v7 = objc_opt_self(&OBJC_CLASS___PBMediaRemoteObserver, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v24[1] = v8;
  uint64_t v10 = objc_opt_self(&OBJC_CLASS___PBProcessManager, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v24[2] = v11;
  uint64_t v13 = objc_opt_self(&OBJC_CLASS___PBSceneManager, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v24[3] = v14;
  uint64_t v16 = objc_opt_self(&OBJC_CLASS___PBSiriManager, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v24[4] = v17;
  uint64_t v19 = objc_opt_self(&OBJC_CLASS___PBWindowManager, v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v24[5] = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 6LL));
  -[PBDependencyDescription addDependencies:](v2, "addDependencies:", v21);

  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1001359A4;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_100471000 != -1) {
    dispatch_once(&qword_100471000, block);
  }
  return (id)qword_100470FF8;
}

- (PBNowPlayingManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___PBNowPlayingManager;
  v2 = -[PBNowPlayingManager init](&v7, "init");
  if (v2)
  {
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v3 addObserver:v2 selector:"_updateNowPlayingAppFocused" name:UIWindowDidBecomeKeyNotification object:0];

    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_100135AA0;
    v5[3] = &unk_1003D0FA8;
    uint64_t v6 = v2;
    +[PBDependencyCoordinator registerInstance:dependencyBlock:]( &OBJC_CLASS___PBDependencyCoordinator,  "registerInstance:dependencyBlock:",  v6,  v5);
  }

  return v2;
}

- (void)dealloc
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBAirPlayManager sharedInstance](&OBJC_CLASS___PBAirPlayManager, "sharedInstance"));
  [v3 removeObserver:self forKeyPath:@"presenting" context:off_10046C170];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSiriManager sharedInstance](&OBJC_CLASS___PBSiriManager, "sharedInstance"));
  [v4 removeObserver:self forKeyPath:@"presenting" context:off_10046C178];
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBNowPlayingManager;
  -[PBNowPlayingManager dealloc](&v6, "dealloc");
}

- (void)_updateNowPlayingAppFocusedUsingMediaRemoteObserver:(id)a3 siriManager:(id)a4 airPlayManager:(id)a5 sceneManager:(id)a6 processManager:(id)a7
{
  id v12 = a6;
  id v13 = a7;
  id v14 = a5;
  id v15 = a4;
  id v16 = [a3 nowPlayingProcessPID];
  unsigned int v17 = [v15 isPresenting];

  unsigned int v18 = [v14 isPresenting];
  if (v17)
  {
    unsigned int v19 = [v13 isSiriViewServicePID:v16];
LABEL_5:
    BOOL v20 = v19;
    goto LABEL_10;
  }

  if (v18)
  {
    unsigned int v19 = [v13 isAirPlayViewServicePID:v16];
    goto LABEL_5;
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue([v12 currentApplicationSceneHandle]);
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 sceneIfExists]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 clientProcess]);

  if (v23) {
    BOOL v20 = (_DWORD)v16 == [v23 pid];
  }
  else {
    BOOL v20 = 0;
  }

LABEL_10:
  id v24 = sub_1000F721C();
  v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26[0] = 67109888;
    v26[1] = (_DWORD)v16;
    __int16 v27 = 1024;
    unsigned int v28 = v17;
    __int16 v29 = 1024;
    unsigned int v30 = v18;
    __int16 v31 = 1024;
    BOOL v32 = v20;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Now playing PID: %d, Siri Presenting: %{BOOL}d, AirPlay Presenting: %{BOOL}d, focused? %{BOOL}d",  (uint8_t *)v26,  0x1Au);
  }

  if (self->_nowPlayingAppFocused != v20)
  {
    -[PBNowPlayingManager willChangeValueForKey:](self, "willChangeValueForKey:", @"nowPlayingAppFocused");
    self->_nowPlayingAppFocused = v20;
    -[PBNowPlayingManager didChangeValueForKey:](self, "didChangeValueForKey:", @"nowPlayingAppFocused");
  }
}

- (void)_updateNowPlayingAppFocused
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBMediaRemoteObserver sharedInstance](&OBJC_CLASS___PBMediaRemoteObserver, "sharedInstance"));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSiriManager sharedInstance](&OBJC_CLASS___PBSiriManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PBAirPlayManager sharedInstance](&OBJC_CLASS___PBAirPlayManager, "sharedInstance"));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBProcessManager sharedInstance](&OBJC_CLASS___PBProcessManager, "sharedInstance"));
  -[PBNowPlayingManager _updateNowPlayingAppFocusedUsingMediaRemoteObserver:siriManager:airPlayManager:sceneManager:processManager:]( self,  "_updateNowPlayingAppFocusedUsingMediaRemoteObserver:siriManager:airPlayManager:sceneManager:processManager:",  v3,  v4,  v5,  v6,  v7);
}

- (void)activateNowPlayingForReason:(unint64_t)a3 options:(id)a4
{
  id v70 = a4;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "tvs_stringForKey:", PBSNowPlayingUIOptionBundleIdentifier));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBMediaRemoteObserver sharedInstance](&OBJC_CLASS___PBMediaRemoteObserver, "sharedInstance"));
  id v7 = [v6 nowPlayingProcessPID];

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBMediaRemoteObserver sharedInstance](&OBJC_CLASS___PBMediaRemoteObserver, "sharedInstance"));
  BOOL v9 = ([v8 nowPlayingMediaTypeAudioOnly] & 1) == 0
    && +[PBSSystemStatus systemPlayingState](&OBJC_CLASS___PBSSystemStatus, "systemPlayingState") != 0LL;

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[PBMediaRemoteObserver sharedInstance](&OBJC_CLASS___PBMediaRemoteObserver, "sharedInstance"));
  LODWORD(v65) = [v10 isMusicAppPlaying];

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlayController activeSession](self->_overlayController, "activeSession"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 identifier]);

  if (v12)
  {
    id v13 = (objc_class *)objc_opt_class(self);
    id v14 = NSStringFromClass(v13);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    unsigned __int8 v16 = [v12 isEqualToString:v15];
  }

  else
  {
    unsigned __int8 v16 = 0;
  }

  v69 = v12;
  if (v5)
  {
    int v17 = (int)v7;
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
    unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue([v18 currentApplicationSceneHandle]);
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([v19 clientProcessBundleIdentifier]);

    v21 = (void *)v5;
    unsigned int v22 = [v20 isEqual:v5];
  }

  else
  {
    v21 = 0LL;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[FBProcessManager sharedInstance](&OBJC_CLASS___FBProcessManager, "sharedInstance"));
    int v17 = (int)v7;
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 processForPID:v7]);
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([v24 bundleIdentifier]);

    unsigned int v22 = -[PBNowPlayingManager nowPlayingAppFocused](self, "nowPlayingAppFocused");
  }

  unsigned int v25 = v22;
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[PBPictureInPictureManager sharedInstance]( &OBJC_CLASS___PBPictureInPictureManager,  "sharedInstance",  v65));
  __int16 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 activePictureInPictureApplicationBundleIDs]);

  unsigned int v28 = [v27 containsObject:v20];
  if (v25)
  {
    __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(+[PBAppSwitcherManager defaultManager](&OBJC_CLASS___PBAppSwitcherManager, "defaultManager"));
    unsigned int v30 = [v29 isActive];

    id v31 = sub_1000F721C();
    BOOL v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    BOOL v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT);
    v34 = v70;
    v35 = v21;
    if (!v30)
    {
      if (v33)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Now Playing service is already focused, ignoring gesture",  buf,  2u);
      }

      goto LABEL_28;
    }

    if (v33)
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v32,  OS_LOG_TYPE_DEFAULT,  "Now Playing service is active behind app switcher, moving to NP",  buf,  2u);
    }

LABEL_27:
    BOOL v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PBProcessManager sharedInstance](&OBJC_CLASS___PBProcessManager, "sharedInstance"));
    -[os_log_s openApplication:launchURL:options:suspended:completion:]( v32,  "openApplication:launchURL:options:suspended:completion:",  v20,  0LL,  0LL,  0LL,  0LL);
LABEL_28:
    v42 = v69;
    goto LABEL_29;
  }

  if (v28)
  {
    id v36 = sub_1000F721C();
    v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v72[0] = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "Now playing app %@ is in PiP, expanding PiP",  buf,  0xCu);
    }

    v38 = (void *)objc_claimAutoreleasedReturnValue( +[PBPictureInPictureManager sharedInstance]( &OBJC_CLASS___PBPictureInPictureManager,  "sharedInstance"));
    [v38 expandPictureInPicture];

    BOOL v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PBScreenSaverManager sharedInstance](&OBJC_CLASS___PBScreenSaverManager, "sharedInstance"));
    -[os_log_s dismissScreenSaver](v32, "dismissScreenSaver");
    v34 = v70;
    v35 = v21;
    goto LABEL_28;
  }

  char v39 = !v9;
  if (a3) {
    char v39 = 1;
  }
  if ((v39 & 1) == 0)
  {
    id v40 = sub_1000F721C();
    v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    v34 = v70;
    v35 = v21;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v72[0] = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_DEFAULT,  "Opening %@ because it's playing video",  buf,  0xCu);
    }

    goto LABEL_27;
  }

  char v43 = v66 ^ 1;
  if (a3) {
    char v43 = 1;
  }
  char v44 = v43 | v16;
  v34 = v70;
  v35 = v21;
  if ((v44 & 1) != 0)
  {
    BOOL v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
    uint64_t v45 = (uint64_t)-[os_log_s activeLayoutLevel](v32, "activeLayoutLevel");
    if (v45 >= 4 && v45 != 12) {
      -[os_log_s dismissSystemUIAtLevel:animated:transitionBlock:]( v32,  "dismissSystemUIAtLevel:animated:transitionBlock:",  v45,  1LL,  0LL);
    }
    id v46 = sub_1000F721C();
    v47 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      LODWORD(v72[0]) = v17;
      WORD2(v72[0]) = 2114;
      *(void *)((char *)v72 + 6) = v35;
      _os_log_impl( (void *)&_mh_execute_header,  v47,  OS_LOG_TYPE_DEFAULT,  "Presenting now playing UI. nowPlayingProcessPID=%d, preferredBundleIdentifier=%{public}@",  buf,  0x12u);
    }

    if (v70) {
      v48 = (NSMutableDictionary *)[v70 mutableCopy];
    }
    else {
      v48 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    }
    v52 = v48;
    v67 = v48;
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", a3 == 0));
    -[NSMutableDictionary setObject:forKey:](v52, "setObject:forKey:", v53, PBSNowPlayingUIOptionShowActiveEndpoint);

    v54 = objc_alloc_init(&OBJC_CLASS___PBMutableSystemOverlayPresentationRequest);
    v55 = (objc_class *)objc_opt_class(self);
    v56 = NSStringFromClass(v55);
    v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
    -[PBMutableSystemOverlayPresentationRequest setIdentifier:](v54, "setIdentifier:", v57);

    -[PBMutableSystemOverlayPresentationRequest setAnimated:](v54, "setAnimated:", 1LL);
    -[PBMutableSystemOverlayPresentationRequest setClientOptions:](v54, "setClientOptions:", v52);
    -[PBMutableSystemOverlayPresentationRequest setSceneDeactivationReasons:]( v54,  "setSceneDeactivationReasons:",  1152LL);
    v58 = objc_alloc_init(&OBJC_CLASS___PBNowPlayingSystemOverlayUIProvider);
    -[PBNowPlayingSystemOverlayUIProvider setPreferredBundleIdentifier:](v58, "setPreferredBundleIdentifier:", v35);
    -[PBMutableSystemOverlayPresentationRequest setProvider:](v54, "setProvider:", v58);
    v59 = -[PBCoordinatedTransitionFragmentDescriptor initWithType:provider:]( objc_alloc(&OBJC_CLASS___PBCoordinatedTransitionFragmentDescriptor),  "initWithType:provider:",  @"DismissNowPlayingOverlay",  self);
    v60 = objc_alloc_init(&OBJC_CLASS___PBCoordinatedTransitionToken);
    coordinatedTransitionToken = self->_coordinatedTransitionToken;
    self->_coordinatedTransitionToken = v60;

    -[PBCoordinatedTransitionToken setRespondingFragmentDescriptor:]( self->_coordinatedTransitionToken,  "setRespondingFragmentDescriptor:",  v59);
    -[PBMutableSystemOverlayPresentationRequest setCoordinatedTransitionToken:]( v54,  "setCoordinatedTransitionToken:",  self->_coordinatedTransitionToken);
    overlayController = self->_overlayController;
    v63 = v35;
    id v64 = -[PBMutableSystemOverlayPresentationRequest copy](v54, "copy");
    -[PBSystemOverlayController presentWithRequest:completion:]( overlayController,  "presentWithRequest:completion:",  v64,  0LL);

    v35 = v63;
    goto LABEL_28;
  }

  id v49 = sub_1000F721C();
  v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
  v42 = v69;
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "Opening Music's NowPlaying view with user action",  buf,  2u);
  }

  BOOL v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](&OBJC_CLASS___NSURL, "URLWithString:", @"music://nowplaying"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[PBProcessManager sharedInstance](&OBJC_CLASS___PBProcessManager, "sharedInstance"));
  [v51 openApplication:v20 launchURL:v32 options:0 suspended:0 completion:0];

LABEL_29:
}

- (BOOL)dismissNowPlaying
{
  return -[PBNowPlayingManager _dismissWithCompletion:](self, "_dismissWithCompletion:", 0LL);
}

- (BOOL)_dismissWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, void))a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemOverlayController activeSession](self->_overlayController, "activeSession"));
  if (v5)
  {
    objc_super v6 = (void *)objc_claimAutoreleasedReturnValue( +[PBSystemOverlayDismissalRequest dismissalRequestForSession:]( &OBJC_CLASS___PBMutableSystemOverlayDismissalRequest,  "dismissalRequestForSession:",  v5));
    [v6 setAnimated:1];
    overlayController = self->_overlayController;
    id v8 = [v6 copy];
    -[PBSystemOverlayController dismissWithRequest:completion:]( overlayController,  "dismissWithRequest:completion:",  v8,  v4);
  }

  else if (v4)
  {
    v4[2](v4, 0LL);
  }

  return v5 != 0LL;
}

- (void)overlayController:(id)a3 willDismissSession:(id)a4 withContext:(id)a5
{
  coordinatedTransitionToken = self->_coordinatedTransitionToken;
  self->_coordinatedTransitionToken = 0LL;
}

- (id)transitionCoordinator:(id)a3 willDismissTransitionWithToken:(id)a4 withContext:(id)a5
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100136900;
  v6[3] = &unk_1003D20E0;
  v6[4] = self;
  return [[BSBlockTransaction alloc] initWithBlock:v6];
}

- (void)sceneManager:(id)a3 didChangeCurrentApplicationFromSceneHandle:(id)a4 toSceneHandle:(id)a5
{
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (off_10046C180 == a6 || off_10046C178 == a6 || off_10046C170 == a6)
  {
    -[PBNowPlayingManager _updateNowPlayingAppFocused](self, "_updateNowPlayingAppFocused");
  }

  else if (off_10046C168 == a6)
  {
    -[PBNowPlayingManager willChangeValueForKey:](self, "willChangeValueForKey:", @"presenting");
    self->_presenting = objc_msgSend(v12, "tvs_BOOLForKey:defaultValue:", NSKeyValueChangeNewKey, 0);
    -[PBNowPlayingManager didChangeValueForKey:](self, "didChangeValueForKey:", @"presenting");
  }

  else
  {
    v15.receiver = self;
    v15.super_class = (Class)&OBJC_CLASS___PBNowPlayingManager;
    -[PBNowPlayingManager observeValueForKeyPath:ofObject:change:context:]( &v15,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
  }
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

- (BOOL)nowPlayingAppFocused
{
  return self->_nowPlayingAppFocused;
}

- (PBCoordinatedTransitionToken)coordinatedTransitionToken
{
  return self->_coordinatedTransitionToken;
}

- (PBSystemOverlayController)overlayController
{
  return self->_overlayController;
}

- (void)setOverlayController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end