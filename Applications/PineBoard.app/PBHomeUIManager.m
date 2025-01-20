@interface PBHomeUIManager
+ (PBDependencyDescription)dependencyDescription;
+ (id)_sceneWorkspace;
+ (id)_systemHomeUIServiceApplication;
+ (id)sharedInstance;
- (BOOL)_tryActivatingCameraUsingExistingSceneWithContext:(id)a3;
- (BOOL)dismissWithCompletion:(id)a3;
- (BOOL)isPresenting;
- (PBCoordinatedTransitionToken)coordinatedTransitionToken;
- (PBHomeUIManager)init;
- (PBProcessLaunchAgent)processLaunchAgent;
- (PBSSystemHomeUIStreamState)currentStreamState;
- (PBSystemHomeUIServiceRemoteViewController)remoteViewController;
- (PBSystemOverlayController)overlayController;
- (TVSObserverSet)observers;
- (id)addObserver:(id)a3;
- (id)preheatSystemHomeUIServiceForReason:(id)a3;
- (id)transitionCoordinator:(id)a3 willDismissTransitionWithToken:(id)a4 withContext:(id)a5;
- (void)_dismiss:(id)a3;
- (void)_notifyObserversStreamStateDidUpdate:(id)a3;
- (void)_updateIsPresenting;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)overlayController:(id)a3 didDismissSession:(id)a4;
- (void)overlayController:(id)a3 willPresentSession:(id)a4;
- (void)pictureInPictureManager:(id)a3 didCancelPictureInPictureForApplication:(id)a4;
- (void)presentCameraWithContext:(id)a3 withCompletion:(id)a4;
- (void)remoteViewController:(id)a3 didUpdateRequestsVisibility:(BOOL)a4;
- (void)remoteViewController:(id)a3 didUpdateStreamState:(id)a4;
@end

@implementation PBHomeUIManager

+ (PBDependencyDescription)dependencyDescription
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1000C1B00;
  v5[3] = &unk_1003CFF78;
  v5[4] = a1;
  v2 = -[PBDependencyDescription initWithInstanceProvider:]( objc_alloc(&OBJC_CLASS___PBDependencyDescription),  "initWithInstanceProvider:",  v5);
  v6[0] = objc_opt_class(&OBJC_CLASS___PBWindowManager);
  v6[1] = objc_opt_class(&OBJC_CLASS___PBPictureInPictureManager);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v6, 2LL));
  -[PBDependencyDescription addDependencies:](v2, "addDependencies:", v3);

  return v2;
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C1B98;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_100470A10 != -1) {
    dispatch_once(&qword_100470A10, block);
  }
  return (id)qword_100470A08;
}

- (PBHomeUIManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___PBHomeUIManager;
  v2 = -[PBHomeUIManager init](&v8, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___TVSObserverSet);
    observers = v2->_observers;
    v2->_observers = v3;

    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    void v6[2] = sub_1000C1C74;
    v6[3] = &unk_1003D0FA8;
    v7 = v2;
    +[PBDependencyCoordinator registerInstance:dependencyBlock:]( &OBJC_CLASS___PBDependencyCoordinator,  "registerInstance:dependencyBlock:",  v7,  v6);
  }

  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBHomeUIManager;
  -[PBHomeUIManager dealloc](&v3, "dealloc");
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &off_1003D5890)
  {
    -[PBHomeUIManager _updateIsPresenting](self, "_updateIsPresenting", a3, a4, a5);
  }

  else
  {
    v6.receiver = self;
    v6.super_class = (Class)&OBJC_CLASS___PBHomeUIManager;
    -[PBHomeUIManager observeValueForKeyPath:ofObject:change:context:]( &v6,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (PBSSystemHomeUIStreamState)currentStreamState
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteViewController);
  v4 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained streamState]);
  v5 = v4;
  if (v4) {
    id v6 = v4;
  }
  else {
    id v6 = (id)objc_claimAutoreleasedReturnValue(+[PBSSystemHomeUIStreamState inactiveState](&OBJC_CLASS___PBSSystemHomeUIStreamState, "inactiveState"));
  }
  v7 = v6;

  return (PBSSystemHomeUIStreamState *)v7;
}

- (id)addObserver:(id)a3
{
  return (id)objc_claimAutoreleasedReturnValue(-[TVSObserverSet addObserver:](self->_observers, "addObserver:", a3));
}

- (void)presentCameraWithContext:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, uint64_t))a4;
  unsigned int v8 = -[PBHomeUIManager _tryActivatingCameraUsingExistingSceneWithContext:]( self,  "_tryActivatingCameraUsingExistingSceneWithContext:",  v6);
  id v9 = sub_10008303C();
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138543362;
      id v35 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Requested presentation using existing scene {context=%{public}@}",  buf,  0xCu);
    }

    if (v7) {
      v7[2](v7, 1LL);
    }
  }

  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 138543362;
      id v35 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Requesting presentation {context=%{public}@}",  buf,  0xCu);
    }

    id v12 = [(id)objc_opt_class(self) _systemHomeUIServiceApplication];
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleIdentifier]);
    v32 = (void *)objc_claimAutoreleasedReturnValue( +[FBSSceneIdentity pb_identityForApplicationIdentifier:role:]( &OBJC_CLASS___FBSSceneIdentity,  "pb_identityForApplicationIdentifier:role:",  v14,  @"default"));

    id v15 = [(id)objc_opt_class(self) _sceneWorkspace];
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[FBSMutableSceneDefinition definition](&OBJC_CLASS___FBSMutableSceneDefinition, "definition"));
    [v17 setIdentity:v32];
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fbs_sceneClientIdentity"));
    [v17 setClientIdentity:v18];

    v19 = (void *)objc_claimAutoreleasedReturnValue([v13 defaultSceneSpecification]);
    [v17 setSpecification:v19];

    v20 = -[PBSystemHomeUIServiceRemoteViewController initWithSceneWorkspace:sceneDefinition:layoutLevel:]( objc_alloc(&OBJC_CLASS___PBSystemHomeUIServiceRemoteViewController),  "initWithSceneWorkspace:sceneDefinition:layoutLevel:",  v16,  v17,  -[PBSystemOverlayController layoutLevel](self->_overlayController, "layoutLevel"));
    -[PBSystemHomeUIServiceRemoteViewController setDelegate:](v20, "setDelegate:", self);
    objc_storeWeak((id *)&self->_remoteViewController, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[PBUISystemHomeServiceCameraActivationAction actionWithCameraActivationContext:]( &OBJC_CLASS___PBUISystemHomeServiceCameraActivationAction,  "actionWithCameraActivationContext:",  v6));
    v33 = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v33, 1LL));
    -[PBSystemHomeUIServiceRemoteViewController setTransitionActions:](v20, "setTransitionActions:", v22);

    v23 = -[PBCoordinatedTransitionFragmentDescriptor initWithType:provider:]( objc_alloc(&OBJC_CLASS___PBCoordinatedTransitionFragmentDescriptor),  "initWithType:provider:",  @"DismissFullscreenCamera",  self);
    v24 = objc_alloc_init(&OBJC_CLASS___PBCoordinatedTransitionToken);
    coordinatedTransitionToken = self->_coordinatedTransitionToken;
    self->_coordinatedTransitionToken = v24;

    -[PBCoordinatedTransitionToken setRespondingFragmentDescriptor:]( self->_coordinatedTransitionToken,  "setRespondingFragmentDescriptor:",  v23);
    v26 = objc_alloc_init(&OBJC_CLASS___PBMutableSystemOverlayPresentationRequest);
    v27 = (objc_class *)objc_opt_class(self);
    v28 = NSStringFromClass(v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    -[PBMutableSystemOverlayPresentationRequest setIdentifier:](v26, "setIdentifier:", v29);

    -[PBMutableSystemOverlayPresentationRequest setAnimated:](v26, "setAnimated:", 1LL);
    -[PBMutableSystemOverlayPresentationRequest setCoordinatedTransitionToken:]( v26,  "setCoordinatedTransitionToken:",  self->_coordinatedTransitionToken);
    -[PBMutableSystemOverlayPresentationRequest setProvider:](v26, "setProvider:", v20);
    -[PBMutableSystemOverlayPresentationRequest setSceneDeactivationReasons:]( v26,  "setSceneDeactivationReasons:",  1152LL);
    overlayController = self->_overlayController;
    id v31 = -[PBMutableSystemOverlayPresentationRequest copy](v26, "copy");
    -[PBSystemOverlayController presentWithRequest:completion:]( overlayController,  "presentWithRequest:completion:",  v31,  v7);
  }
}

- (BOOL)dismissWithCompletion:(id)a3
{
  v4 = (void (**)(id, void))a3;
  BOOL v5 = -[PBHomeUIManager isPresenting](self, "isPresenting");
  if (v5)
  {
    -[PBHomeUIManager _dismiss:](self, "_dismiss:", v4);
  }

  else if (v4)
  {
    v4[2](v4, 0LL);
  }

  return v5;
}

- (id)preheatSystemHomeUIServiceForReason:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    processLaunchAgent = self->_processLaunchAgent;
    if (!processLaunchAgent)
    {
      id v8 = [(id)objc_opt_class(self) _systemHomeUIServiceApplication];
      id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = objc_alloc(&OBJC_CLASS___PBProcessLaunchAgent);
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v9 processIdentity]);
      id v12 = -[PBProcessLaunchAgent initWithProcessIdentity:](v10, "initWithProcessIdentity:", v11);
      v13 = self->_processLaunchAgent;
      self->_processLaunchAgent = v12;

      v14 = self->_processLaunchAgent;
      id v15 = sub_10008303C();
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      sub_1001623AC((id *)&v14->super.isa, (uint64_t)v16);

      processLaunchAgent = self->_processLaunchAgent;
    }

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PBProcessLaunchAgent launchProcessForReason:](processLaunchAgent, "launchProcessForReason:", v6));

    return v17;
  }

  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"reason != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10027C1B8(a2, (uint64_t)self, (uint64_t)v19);
    }
    id result = (id) _bs_set_crash_log_message([v19 UTF8String]);
    __break(0);
  }

  return result;
}

- (void)_updateIsPresenting
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteViewController);
  if (-[PBSystemOverlayController hasActivePresentation](self->_overlayController, "hasActivePresentation"))
  {
    else {
      unsigned int v4 = 1;
    }
  }

  else
  {
    unsigned int v4 = 0;
  }

  if (self->_presenting != v4)
  {
    -[PBHomeUIManager willChangeValueForKey:](self, "willChangeValueForKey:", @"presenting");
    self->_presenting = v4;
    -[PBHomeUIManager didChangeValueForKey:](self, "didChangeValueForKey:", @"presenting");
  }
}

- (void)_dismiss:(id)a3
{
  id v4 = a3;
  id v5 = sub_10008303C();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Dismissing active presentation",  (uint8_t *)buf,  2u);
  }

  v7 = objc_alloc_init(&OBJC_CLASS___PBMutableSystemOverlayDismissalRequest);
  id v8 = (objc_class *)objc_opt_class(self);
  id v9 = NSStringFromClass(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  -[PBMutableSystemOverlayDismissalRequest setIdentifier:](v7, "setIdentifier:", v10);

  -[PBMutableSystemOverlayDismissalRequest setAnimated:](v7, "setAnimated:", 1LL);
  objc_initWeak(buf, self);
  overlayController = self->_overlayController;
  id v12 = -[PBMutableSystemOverlayDismissalRequest copy](v7, "copy");
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000C25FC;
  v14[3] = &unk_1003D1660;
  objc_copyWeak(&v16, buf);
  id v13 = v4;
  id v15 = v13;
  -[PBSystemOverlayController dismissWithRequest:completion:]( overlayController,  "dismissWithRequest:completion:",  v12,  v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(buf);
}

- (BOOL)_tryActivatingCameraUsingExistingSceneWithContext:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteViewController);
  unsigned int v6 = -[PBSystemOverlayController hasActivePresentation](self->_overlayController, "hasActivePresentation");
  if (WeakRetained) {
    BOOL v7 = v6;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[PBUISystemHomeServiceCameraActivationAction actionWithCameraActivationContext:]( &OBJC_CLASS___PBUISystemHomeServiceCameraActivationAction,  "actionWithCameraActivationContext:",  v4));
    BOOL v11 = v8;
    id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v11, 1LL));
    [WeakRetained sendActions:v9];
  }

  return v7;
}

- (void)_notifyObserversStreamStateDidUpdate:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000C27B8;
  v7[3] = &unk_1003D58A0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[TVSObserverSet enumerateObserversUsingBlock:](observers, "enumerateObserversUsingBlock:", v7);
}

+ (id)_systemHomeUIServiceApplication
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplicationController](&OBJC_CLASS___PineBoard, "sharedApplicationController"));
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([v2 systemHomeUIServiceApplication]);

  return v3;
}

+ (id)_sceneWorkspace
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000C2890;
  block[3] = &unk_1003D0680;
  block[4] = a1;
  if (qword_100470A20 != -1) {
    dispatch_once(&qword_100470A20, block);
  }
  return (id)qword_100470A18;
}

- (void)overlayController:(id)a3 willPresentSession:(id)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBScreenSaverManager sharedInstance](&OBJC_CLASS___PBScreenSaverManager, "sharedInstance", a3, a4));
  [v4 dismissScreenSaver];
}

- (void)overlayController:(id)a3 didDismissSession:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBHomeUIManager currentStreamState](self, "currentStreamState", a3, a4));
  -[PBHomeUIManager _notifyObserversStreamStateDidUpdate:](self, "_notifyObserversStreamStateDidUpdate:", v5);
}

- (void)remoteViewController:(id)a3 didUpdateRequestsVisibility:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = sub_10008303C();
  BOOL v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v10[0] = 67109120;
    v10[1] = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Requested visibility change {requestsVisibility=%{BOOL}d}",  (uint8_t *)v10,  8u);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBWindowManager sharedInstance](&OBJC_CLASS___PBWindowManager, "sharedInstance"));
  int64_t v9 = -[PBSystemOverlayController layoutLevel](self->_overlayController, "layoutLevel");
  if (v4) {
    [v8 unhideSystemUIAtLevel:v9 animated:0 completion:0];
  }
  else {
    [v8 hideSystemUIAtLevel:v9 animated:1 completion:0];
  }

  -[PBHomeUIManager _updateIsPresenting](self, "_updateIsPresenting");
}

- (void)remoteViewController:(id)a3 didUpdateStreamState:(id)a4
{
}

- (void)pictureInPictureManager:(id)a3 didCancelPictureInPictureForApplication:(id)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "bundleIdentifier", a3));
  unsigned int v6 = [v5 isEqual:@"com.apple.TVSystemHomeUIService"];

  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteViewController);
    id v8 = WeakRetained;
  }

- (id)transitionCoordinator:(id)a3 willDismissTransitionWithToken:(id)a4 withContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  id v11 = objc_alloc(&OBJC_CLASS___BSBlockTransaction);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_1000C2BF0;
  v14[3] = &unk_1003D24A8;
  objc_copyWeak(&v15, &location);
  id v12 = [v11 initWithBlock:v14];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v12;
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

- (TVSObserverSet)observers
{
  return self->_observers;
}

- (PBSystemHomeUIServiceRemoteViewController)remoteViewController
{
  return (PBSystemHomeUIServiceRemoteViewController *)objc_loadWeakRetained((id *)&self->_remoteViewController);
}

- (PBProcessLaunchAgent)processLaunchAgent
{
  return self->_processLaunchAgent;
}

- (void).cxx_destruct
{
}

@end