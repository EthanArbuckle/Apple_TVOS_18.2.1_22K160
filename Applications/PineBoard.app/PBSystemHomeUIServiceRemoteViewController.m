@interface PBSystemHomeUIServiceRemoteViewController
+ (double)_transitionDuration;
- (BOOL)acceptsEventFocus;
- (BOOL)expectsEventForwarding;
- (BOOL)hasScene;
- (BOOL)isInterruptible;
- (BOOL)requestsVisibility;
- (BOOL)sendActions:(id)a3;
- (BSAction)cameraPreparedAction;
- (BSWatchdog)cameraPreparedWatchdog;
- (FBSSceneDefinition)sceneDefinition;
- (FBSceneWorkspace)sceneWorkspace;
- (NSArray)transitionActions;
- (PBApplicationSceneViewController)sceneViewController;
- (PBSSystemHomeUIStreamState)streamState;
- (PBSceneHandle)sceneHandle;
- (PBSystemHomeUIServiceRemoteViewController)initWithSceneWorkspace:(id)a3 sceneDefinition:(id)a4 layoutLevel:(int64_t)a5;
- (PBSystemHomeUIServiceRemoteViewControllerDelegate)delegate;
- (PBSystemOverlayContentDelegate)contentDelegate;
- (PBUISystemHomeServiceCameraSceneClientSettingsDiffInspector)clientSettingsDiffInspector;
- (id)cameraPreparedCompletionBlock;
- (id)preferredFocusEnvironments;
- (int64_t)layoutLevel;
- (void)_activateSceneWithCompletion:(id)a3;
- (void)_dismissAnimated:(BOOL)a3 withError:(id)a4;
- (void)_receivedScenePreparedAction:(id)a3 forScene:(id)a4;
- (void)_transitionWithAnimations:(id)a3 completion:(id)a4;
- (void)_updateRequestsVisibilityStateWithScene:(id)a3;
- (void)_updateSceneSettingsWithBlock:(id)a3;
- (void)_updateStreamStateWithScene:(id)a3;
- (void)_userInterfaceStyleDidChange;
- (void)dealloc;
- (void)dismissContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5;
- (void)prepareUIForSystemOverlayPresentationWithCompletion:(id)a3;
- (void)presentContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5;
- (void)scene:(id)a3 didReceiveActions:(id)a4;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneDidDeactivate:(id)a3 withError:(id)a4;
- (void)setAcceptsEventFocus:(BOOL)a3;
- (void)setCameraPreparedCompletionBlock:(id)a3;
- (void)setContentDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTransitionActions:(id)a3;
@end

@implementation PBSystemHomeUIServiceRemoteViewController

- (PBSystemHomeUIServiceRemoteViewController)initWithSceneWorkspace:(id)a3 sceneDefinition:(id)a4 layoutLevel:(int64_t)a5
{
  id v10 = a3;
  id v11 = a4;
  if (!v10)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"sceneWorkspace != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100270D38(a2);
    }
    _bs_set_crash_log_message([v22 UTF8String]);
    __break(0);
    JUMPOUT(0x100020680LL);
  }

  v12 = v11;
  if (!v11)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"sceneDefinition != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100270DE4(a2);
    }
    _bs_set_crash_log_message([v23 UTF8String]);
    __break(0);
    JUMPOUT(0x1000206E4LL);
  }

  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___PBSystemHomeUIServiceRemoteViewController;
  v13 = -[PBSystemHomeUIServiceRemoteViewController initWithNibName:bundle:](&v24, "initWithNibName:bundle:", 0LL, 0LL);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_sceneWorkspace, a3);
    v15 = (FBSSceneDefinition *)[v12 copy];
    sceneDefinition = v14->_sceneDefinition;
    v14->_sceneDefinition = v15;

    v14->_layoutLevel = a5;
    uint64_t v17 = objc_claimAutoreleasedReturnValue(+[NSArray array](&OBJC_CLASS___NSArray, "array"));
    transitionActions = v14->_transitionActions;
    v14->_transitionActions = (NSArray *)v17;

    uint64_t v25 = objc_opt_class(&OBJC_CLASS___UITraitUserInterfaceStyle);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v25, 1LL));
    id v20 =  -[PBSystemHomeUIServiceRemoteViewController registerForTraitChanges:withAction:]( v14,  "registerForTraitChanges:withAction:",  v19,  "_userInterfaceStyleDidChange");
  }

  return v14;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists"));
  [v3 invalidate];

  -[BSWatchdog invalidate](self->_cameraPreparedWatchdog, "invalidate");
  -[BSAction invalidate](self->_cameraPreparedAction, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___PBSystemHomeUIServiceRemoteViewController;
  -[PBSystemHomeUIServiceRemoteViewController dealloc](&v4, "dealloc");
}

- (void)_userInterfaceStyleDidChange
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemHomeUIServiceRemoteViewController traitCollection](self, "traitCollection"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1000207E0;
  v4[3] = &unk_1003D0BE0;
  v4[4] = [v3 userInterfaceStyle];
  -[PBSystemHomeUIServiceRemoteViewController _updateSceneSettingsWithBlock:]( self,  "_updateSceneSettingsWithBlock:",  v4);
}

- (id)preferredFocusEnvironments
{
  if (self->_sceneViewController)
  {
    sceneViewController = self->_sceneViewController;
    v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSArray arrayWithObjects:count:]( &OBJC_CLASS___NSArray,  "arrayWithObjects:count:",  &sceneViewController,  1LL));
  }

  else
  {
    v5.receiver = self;
    v5.super_class = (Class)&OBJC_CLASS___PBSystemHomeUIServiceRemoteViewController;
    id v3 = -[PBSystemHomeUIServiceRemoteViewController preferredFocusEnvironments](&v5, "preferredFocusEnvironments");
    v2 = (void *)objc_claimAutoreleasedReturnValue(v3);
  }

  return v2;
}

- (void)prepareUIForSystemOverlayPresentationWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100020ABC;
  v22[3] = &unk_1003D0300;
  objc_copyWeak(&v24, &location);
  id v5 = v4;
  id v23 = v5;
  v6 = objc_retainBlock(v22);
  v7 = objc_retainBlock(v6);
  id cameraPreparedCompletionBlock = self->_cameraPreparedCompletionBlock;
  self->_id cameraPreparedCompletionBlock = v7;

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100020B10;
  v19[3] = &unk_1003D0C08;
  v9 = v6;
  id v20 = v9;
  objc_copyWeak(&v21, &location);
  id v10 = objc_retainBlock(v19);
  id v11 = objc_alloc(&OBJC_CLASS___BSWatchdog);
  v12 = &_dispatch_main_q;
  v13 = -[BSWatchdog initWithTimeout:queue:completion:]( v11,  "initWithTimeout:queue:completion:",  &_dispatch_main_q,  v10,  1.0);
  cameraPreparedWatchdog = self->_cameraPreparedWatchdog;
  self->_cameraPreparedWatchdog = v13;

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100020B8C;
  v16[3] = &unk_1003D0C30;
  objc_copyWeak(&v18, &location);
  id v15 = v5;
  id v17 = v15;
  -[PBSystemHomeUIServiceRemoteViewController _activateSceneWithCompletion:](self, "_activateSceneWithCompletion:", v16);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

- (BOOL)expectsEventForwarding
{
  return 1;
}

- (BOOL)isInterruptible
{
  return 0;
}

- (void)presentContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5
{
  BOOL v5 = a3;
  id v7 = a5;
  -[PBSystemHomeUIServiceRemoteViewController setAcceptsEventFocus:](self, "setAcceptsEventFocus:", 1LL);
  v8 = -[PBApplicationSceneViewController initWithSceneHandle:layoutLevel:]( objc_alloc(&OBJC_CLASS___PBApplicationSceneViewController),  "initWithSceneHandle:layoutLevel:",  self->_sceneHandle,  self->_layoutLevel);
  sceneViewController = self->_sceneViewController;
  self->_sceneViewController = v8;

  id v10 = self->_cameraPreparedAction;
  cameraPreparedAction = self->_cameraPreparedAction;
  self->_cameraPreparedAction = 0LL;

  v12 = self->_sceneViewController;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100020D64;
  v15[3] = &unk_1003D0C80;
  v16 = v10;
  id v17 = v7;
  v15[4] = self;
  BOOL v18 = v5;
  v13 = v10;
  id v14 = v7;
  -[PBSystemHomeUIServiceRemoteViewController bs_addChildViewController:animated:transitionBlock:]( self,  "bs_addChildViewController:animated:transitionBlock:",  v12,  v5,  v15);
}

- (void)dismissContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  -[PBSystemHomeUIServiceRemoteViewController setAcceptsEventFocus:](self, "setAcceptsEventFocus:", 0LL);
  objc_initWeak(&location, self);
  sceneViewController = self->_sceneViewController;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10002106C;
  v12[3] = &unk_1003D0CD0;
  v12[4] = self;
  id v11 = v9;
  id v13 = v11;
  objc_copyWeak(&v14, &location);
  BOOL v15 = v6;
  -[PBSystemHomeUIServiceRemoteViewController bs_removeChildViewController:animated:transitionBlock:]( self,  "bs_removeChildViewController:animated:transitionBlock:",  sceneViewController,  v6,  v12);
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
}

- (void)scene:(id)a3 didReceiveActions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v23 = 0LL;
  v24[0] = &v23;
  v24[1] = 0x3032000000LL;
  v24[2] = sub_100021538;
  v24[3] = sub_100021548;
  id v25 = 0LL;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100021560;
  v22[3] = &unk_1003D0CF8;
  void v22[4] = &v23;
  id v8 = objc_retainBlock(v22);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    do
    {
      v12 = 0LL;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v18 + 1) + 8LL * (void)v12);
        uint64_t v14 = objc_opt_class(&OBJC_CLASS___PBUISystemHomeServiceCameraPreparedAction);
        if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
        {
          -[PBSystemHomeUIServiceRemoteViewController _receivedScenePreparedAction:forScene:]( self,  "_receivedScenePreparedAction:forScene:",  v13,  v6);
        }

        else
        {
          uint64_t v15 = objc_opt_class(&OBJC_CLASS___UIDismissSceneAction);
          if ((objc_opt_isKindOfClass(v13, v15) & 1) != 0 || objc_msgSend(v13, "UIActionType", (void)v18) == (id)12) {
            -[PBSystemHomeUIServiceRemoteViewController _dismissAnimated:withError:]( self,  "_dismissAnimated:withError:",  1LL,  0LL,  (void)v18);
          }
          else {
            ((void (*)(void *, void *))v8[2])(v8, v13);
          }
        }

        v12 = (char *)v12 + 1;
      }

      while (v10 != v12);
      id v10 = [v9 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }

    while (v10);
  }

  if ([*(id *)(v24[0] + 40) count])
  {
    id v16 = sub_1000830B4();
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      sub_100270ED0((uint64_t)v24, v17);
    }
  }

  _Block_object_dispose(&v23, 8);
}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  clientSettingsDiffInspector = self->_clientSettingsDiffInspector;
  if (!clientSettingsDiffInspector)
  {
    uint64_t v15 = objc_alloc_init(&OBJC_CLASS___PBUISystemHomeServiceCameraSceneClientSettingsDiffInspector);
    id v16 = self->_clientSettingsDiffInspector;
    self->_clientSettingsDiffInspector = v15;

    objc_initWeak(&location, self);
    id v17 = self->_clientSettingsDiffInspector;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = sub_100021778;
    v21[3] = &unk_1003D0D20;
    objc_copyWeak(&v22, &location);
    -[PBUISystemHomeServiceCameraSceneClientSettingsDiffInspector observeRequestsVisibilityWithBlock:]( v17,  "observeRequestsVisibilityWithBlock:",  v21);
    __int128 v18 = self->_clientSettingsDiffInspector;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_1000217AC;
    v19[3] = &unk_1003D0D20;
    objc_copyWeak(&v20, &location);
    -[PBUISystemHomeServiceCameraSceneClientSettingsDiffInspector observeStreamStateWithBlock:]( v18,  "observeStreamStateWithBlock:",  v19);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    clientSettingsDiffInspector = self->_clientSettingsDiffInspector;
  }

  [v11 evaluateWithInspector:clientSettingsDiffInspector context:v10];
}

- (BOOL)sendActions:(id)a3
{
  sceneHandle = self->_sceneHandle;
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneHandle sceneIfExists](sceneHandle, "sceneIfExists"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v4));

  [v5 sendActions:v6];
  return v5 != 0LL;
}

- (BOOL)hasScene
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists"));
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (BOOL)requestsVisibility
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 clientSettings]);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___PBUISystemHomeServiceCameraSceneClientSettings);
  id v5 = v3;
  id v6 = v5;
  if (v4)
  {
    if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0) {
      id v7 = v6;
    }
    else {
      id v7 = 0LL;
    }
  }

  else
  {
    id v7 = 0LL;
  }

  id v8 = v7;

  unsigned __int8 v9 = [v8 requestsVisibility];
  return v9;
}

- (PBSSystemHomeUIStreamState)streamState
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PBSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 clientSettings]);
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___PBUISystemHomeServiceCameraSceneClientSettings);
  id v5 = v3;
  id v6 = v5;
  if (v4)
  {
    if ((objc_opt_isKindOfClass(v5, v4) & 1) != 0) {
      id v7 = v6;
    }
    else {
      id v7 = 0LL;
    }
  }

  else
  {
    id v7 = 0LL;
  }

  id v8 = v7;

  unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 streamState]);
  return (PBSSystemHomeUIStreamState *)v9;
}

- (void)_activateSceneWithCompletion:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBSSceneDefinition identity](self->_sceneDefinition, "identity"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);

    unsigned __int8 v9 = (void *)objc_claimAutoreleasedReturnValue(-[FBSceneWorkspace sceneWithIdentifier:](self->_sceneWorkspace, "sceneWithIdentifier:", v8));
    id v10 = v9;
    if (!v9 || ([v9 isValid] & 1) == 0)
    {
      uint64_t v23 = v8;
      id v11 = (void *)objc_claimAutoreleasedReturnValue(+[PineBoard sharedApplication](&OBJC_CLASS___PineBoard, "sharedApplication"));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 mainWorkspace]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 geometry]);

      uint64_t v14 = self->_sceneDefinition;
      sceneWorkspace = self->_sceneWorkspace;
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472LL;
      v31[2] = sub_100021C98;
      v31[3] = &unk_1003D0D48;
      v32 = v14;
      id v16 = v14;
      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[FBSceneWorkspace createScene:](sceneWorkspace, "createScene:", v31));

      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_100021D44;
      v28[3] = &unk_1003D0DD8;
      id v29 = v13;
      v30 = self;
      id v18 = v13;
      [v17 configureParameters:v28];
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
      [v17 addObserver:v19];

      id v8 = v23;
      id v10 = v17;
    }

    [v10 setDelegate:self];
    id v26 = v6;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_100021F6C;
    v27[3] = &unk_1003D0E00;
    v27[4] = self;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_100021FC4;
    v24[3] = &unk_1003D0E50;
    id v25 = v10;
    id v20 = v10;
    id v21 = v6;
    [v20 performUpdate:v27 withCompletion:v24];
  }

  else
  {
    id v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"completion != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100270F4C(a2);
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
  v7[2] = sub_100022148;
  v7[3] = &unk_1003D0E78;
  id v8 = v4;
  id v6 = v4;
  [v5 updateSettingsWithBlock:v7];
}

- (void)_receivedScenePreparedAction:(id)a3 forScene:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000830B4();
  unsigned __int8 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Scene did prepare", v14, 2u);
  }

  if ((-[BSWatchdog hasFired](self->_cameraPreparedWatchdog, "hasFired") & 1) != 0
    || !self->_cameraPreparedWatchdog)
  {
    [v6 invalidate];

    id v6 = 0LL;
  }

  if ([v6 canSendResponse])
  {
    -[BSAction invalidate](self->_cameraPreparedAction, "invalidate");
    objc_storeStrong((id *)&self->_cameraPreparedAction, v6);
  }

  id cameraPreparedCompletionBlock = (void (**)(void))self->_cameraPreparedCompletionBlock;
  if (cameraPreparedCompletionBlock)
  {
    if (!self->_sceneHandle)
    {
      id v11 = -[PBSceneHandle initWithScene:](objc_alloc(&OBJC_CLASS___PBSceneHandle), "initWithScene:", v7);
      sceneHandle = self->_sceneHandle;
      self->_sceneHandle = v11;

      id cameraPreparedCompletionBlock = (void (**)(void))self->_cameraPreparedCompletionBlock;
    }

    cameraPreparedCompletionBlock[2]();
    id v13 = self->_cameraPreparedCompletionBlock;
    self->_id cameraPreparedCompletionBlock = 0LL;
  }

  -[BSWatchdog invalidate](self->_cameraPreparedWatchdog, "invalidate");
}

- (void)_dismissAnimated:(BOOL)a3 withError:(id)a4
{
  BOOL v4 = a3;
  p_contentDelegate = &self->_contentDelegate;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_contentDelegate);
  [WeakRetained contentPresenting:self willDismissContentWithResult:0 error:v7];

  if (v4)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = sub_1000223EC;
    v9[3] = &unk_1003CFEB8;
    id v10 = WeakRetained;
    id v11 = self;
    -[PBSystemHomeUIServiceRemoteViewController dismissContentAnimated:clientOptions:withCompletion:]( self,  "dismissContentAnimated:clientOptions:withCompletion:",  1LL,  0LL,  v9);
  }

  else
  {
    [WeakRetained contentPresentingDidDismissContent:self];
  }
}

- (void)_transitionWithAnimations:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(id)objc_opt_class(self) _transitionDuration];
  double v9 = v8;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000224C4;
  v11[3] = &unk_1003CFF30;
  id v12 = v6;
  id v10 = v6;
  +[UIView animateWithDuration:animations:completion:]( &OBJC_CLASS___UIView,  "animateWithDuration:animations:completion:",  v7,  v11,  v9);
}

- (void)_updateRequestsVisibilityStateWithScene:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[PBSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists"));
  id v6 = (void *)v5;
  if (v5) {
    id v7 = (void *)v5;
  }
  else {
    id v7 = v4;
  }
  id v8 = v7;

  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 clientSettings]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___PBUISystemHomeServiceCameraSceneClientSettings);
  id v11 = v9;
  id v12 = v11;
  if (v10)
  {
    if ((objc_opt_isKindOfClass(v11, v10) & 1) != 0) {
      id v13 = v12;
    }
    else {
      id v13 = 0LL;
    }
  }

  else
  {
    id v13 = 0LL;
  }

  id v14 = v13;

  if (v14)
  {
    id v15 = [v14 requestsVisibility];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained remoteViewController:self didUpdateRequestsVisibility:v15];

    -[PBApplicationSceneViewController setEligibleForFocus:](self->_sceneViewController, "setEligibleForFocus:", v15);
  }
}

- (void)_updateStreamStateWithScene:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_claimAutoreleasedReturnValue(-[PBSceneHandle sceneIfExists](self->_sceneHandle, "sceneIfExists"));
  id v6 = (void *)v5;
  if (v5) {
    id v7 = (void *)v5;
  }
  else {
    id v7 = v4;
  }
  id v8 = v7;

  double v9 = (void *)objc_claimAutoreleasedReturnValue([v8 clientSettings]);
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___PBUISystemHomeServiceCameraSceneClientSettings);
  id v11 = v9;
  id v12 = v11;
  if (v10)
  {
    if ((objc_opt_isKindOfClass(v11, v10) & 1) != 0) {
      id v13 = v12;
    }
    else {
      id v13 = 0LL;
    }
  }

  else
  {
    id v13 = 0LL;
  }

  id v14 = v13;

  if (v14)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 streamState]);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_initWeak(&location, self);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = sub_100022780;
    v19[3] = &unk_1003D0EA0;
    id v20 = WeakRetained;
    id v17 = WeakRetained;
    objc_copyWeak(&v22, &location);
    id v21 = v15;
    id v18 = v15;
    dispatch_async(&_dispatch_main_q, v19);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
}

+ (double)_transitionDuration
{
  return 0.3;
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

- (PBSystemHomeUIServiceRemoteViewControllerDelegate)delegate
{
  return (PBSystemHomeUIServiceRemoteViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)transitionActions
{
  return self->_transitionActions;
}

- (void)setTransitionActions:(id)a3
{
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

- (id)cameraPreparedCompletionBlock
{
  return self->_cameraPreparedCompletionBlock;
}

- (void)setCameraPreparedCompletionBlock:(id)a3
{
}

- (BSWatchdog)cameraPreparedWatchdog
{
  return self->_cameraPreparedWatchdog;
}

- (BSAction)cameraPreparedAction
{
  return self->_cameraPreparedAction;
}

- (PBSceneHandle)sceneHandle
{
  return self->_sceneHandle;
}

- (PBApplicationSceneViewController)sceneViewController
{
  return self->_sceneViewController;
}

- (PBUISystemHomeServiceCameraSceneClientSettingsDiffInspector)clientSettingsDiffInspector
{
  return self->_clientSettingsDiffInspector;
}

- (void).cxx_destruct
{
}

@end