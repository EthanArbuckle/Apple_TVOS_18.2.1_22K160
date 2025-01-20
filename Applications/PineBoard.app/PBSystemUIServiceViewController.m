@interface PBSystemUIServiceViewController
+ (id)keyPathsForValuesAffectingPresentingSystemMenu;
+ (id)workspace;
+ (unint64_t)_systemGestureForExternalGesture:(id)a3;
- (BOOL)acceptsEventFocus;
- (BOOL)expectsEventForwarding;
- (BOOL)isInterruptible;
- (BOOL)scenePresentationBinderShouldPresentSceneOnlyWhenLayersExist:(id)a3;
- (FBScene)scene;
- (NSMutableDictionary)externalGestureHandles;
- (PBSceneDeferralTargetAssertion)deferralTargetAssertion;
- (PBSystemOverlayContentDelegate)contentDelegate;
- (PBSystemUIServiceConduit)conduit;
- (PBSystemUIServiceViewController)initWithWorkspace:(id)a3 application:(id)a4 conduit:(id)a5 delegate:(id)a6;
- (PBSystemUIServiceViewControllerDelegate)delegate;
- (PBWorkspaceHandle)workspace;
- (UIScenePresentationBinder)scenePresentationBinder;
- (id)scene:(id)a3 handleActions:(id)a4;
- (void)_handleBulletinObservingAction:(id)a3;
- (void)_handleCameraHandoffAction:(id)a3;
- (void)_handleSystemGestureAction:(id)a3 forExternalGesture:(id)a4;
- (void)_serviceBeganPresentingSystemMenu;
- (void)_serviceEndedPresentingSystemMenu;
- (void)_updateDictationOverlayVisibility;
- (void)_updateEventFocus;
- (void)_updateSceneSettings:(id)a3;
- (void)_updateSystemGestures;
- (void)_userInterfaceStyleDidChange;
- (void)dealloc;
- (void)dismissContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)presentContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5;
- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6;
- (void)sceneDidActivate:(id)a3;
- (void)sceneDidDeactivate:(id)a3 withError:(id)a4;
- (void)sceneDidInvalidate:(id)a3;
- (void)sendActions:(id)a3;
- (void)setAcceptsEventFocus:(BOOL)a3;
- (void)setContentDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
- (void)viewDidUnload;
@end

@implementation PBSystemUIServiceViewController

+ (id)workspace
{
  if (qword_100471038 != -1) {
    dispatch_once(&qword_100471038, &stru_1003D8CE8);
  }
  return (id)qword_100471030;
}

- (PBSystemUIServiceViewController)initWithWorkspace:(id)a3 application:(id)a4 conduit:(id)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"workspace != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100285714();
    }
    _bs_set_crash_log_message([v36 UTF8String]);
    __break(0);
    JUMPOUT(0x10013F508LL);
  }

  v15 = v14;
  id v16 = v12;
  Class v17 = NSClassFromString(@"PBApplication");
  if (!v16)
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002857C4();
    }
    _bs_set_crash_log_message([v37 UTF8String]);
    __break(0);
    JUMPOUT(0x10013F56CLL);
  }

  if ((objc_opt_isKindOfClass(v16, v17) & 1) == 0)
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:PBApplicationClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002857C4();
    }
    _bs_set_crash_log_message([v38 UTF8String]);
    __break(0);
    JUMPOUT(0x10013F5D0LL);
  }

  id v18 = v13;
  Class v19 = NSClassFromString(@"PBSystemUIServiceConduit");
  if (!v18)
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100285874();
    }
    _bs_set_crash_log_message([v39 UTF8String]);
    __break(0);
    JUMPOUT(0x10013F634LL);
  }

  if ((objc_opt_isKindOfClass(v18, v19) & 1) == 0)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:PBSystemUIServiceConduitClass]"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100285874();
    }
    _bs_set_crash_log_message([v40 UTF8String]);
    __break(0);
    JUMPOUT(0x10013F698LL);
  }

  v46.receiver = self;
  v46.super_class = (Class)&OBJC_CLASS___PBSystemUIServiceViewController;
  v20 = -[PBSystemUIServiceViewController initWithNibName:bundle:](&v46, "initWithNibName:bundle:", 0LL, 0LL);
  v21 = v20;
  if (v20)
  {
    p_workspace = (id *)&v20->_workspace;
    objc_storeStrong((id *)&v20->_workspace, a3);
    objc_storeWeak((id *)&v21->_delegate, v15);
    objc_storeStrong((id *)&v21->_conduit, a5);
    -[PBSystemUIServiceConduit addObserver:forKeyPath:options:context:]( v21->_conduit,  "addObserver:forKeyPath:options:context:",  v21,  @"systemState",  0LL,  &off_1003D8D08);
    id v23 = [(id)objc_opt_class(v21) workspace];
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472LL;
    v44[2] = sub_10013F6A0;
    v44[3] = &unk_1003D0D48;
    id v45 = v16;
    uint64_t v25 = objc_claimAutoreleasedReturnValue([v24 createScene:v44]);
    scene = v21->_scene;
    v21->_scene = (FBScene *)v25;

    -[FBScene setDelegate:](v21->_scene, "setDelegate:", v21);
    [*p_workspace registerScene:v21->_scene];
    id v27 = *p_workspace;
    v28 = v21->_scene;
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472LL;
    v41[2] = sub_10013F724;
    v41[3] = &unk_1003D0DD8;
    id v42 = v27;
    v29 = v21;
    v43 = v29;
    id v30 = v27;
    -[FBScene configureParameters:](v28, "configureParameters:", v41);
    v31 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    externalGestureHandles = v29->_externalGestureHandles;
    v29->_externalGestureHandles = v31;

    uint64_t v47 = objc_opt_class(&OBJC_CLASS___UITraitUserInterfaceStyle);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v47, 1LL));
    id v34 =  -[PBSystemUIServiceViewController registerForTraitChanges:withAction:]( v29,  "registerForTraitChanges:withAction:",  v33,  "_userInterfaceStyleDidChange");
  }

  return v21;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBSystemUIServiceViewController;
  -[PBSystemUIServiceViewController dealloc](&v3, "dealloc");
}

- (void)sendActions:(id)a3
{
}

+ (id)keyPathsForValuesAffectingPresentingSystemMenu
{
  return (id)objc_claimAutoreleasedReturnValue( +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  @"acceptsEventFocus",  0LL));
}

- (void)loadView
{
  objc_super v3 = objc_alloc_init(&OBJC_CLASS___UIView);
  -[PBSystemUIServiceViewController setView:](self, "setView:", v3);
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@(%p)", v6, self));

  v8 = -[UIScenePresentationBinder initWithIdentifier:priority:rootView:appearanceStyle:]( objc_alloc(&OBJC_CLASS___UIScenePresentationBinder),  "initWithIdentifier:priority:rootView:appearanceStyle:",  v7,  10LL,  v3,  2LL);
  scenePresentationBinder = self->_scenePresentationBinder;
  self->_scenePresentationBinder = v8;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBSystemUIServiceViewController;
  -[PBSystemUIServiceViewController viewDidLoad](&v3, "viewDidLoad");
  -[UIScenePresentationBinder addScene:](self->_scenePresentationBinder, "addScene:", self->_scene);
}

- (void)viewDidUnload
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBSystemUIServiceViewController;
  -[PBSystemUIServiceViewController viewDidUnload](&v3, "viewDidUnload");
  -[UIScenePresentationBinder removeScene:](self->_scenePresentationBinder, "removeScene:", self->_scene);
}

- (BOOL)scenePresentationBinderShouldPresentSceneOnlyWhenLayersExist:(id)a3
{
  return 1;
}

- (void)sceneDidActivate:(id)a3
{
  self->_activatedOnce = 1;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10013FBE0;
  block[3] = &unk_1003CFF08;
  block[4] = self;
  dispatch_async(&_dispatch_main_q, block);
}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  id v5 = a3;
  -[PBSystemUIServiceViewController setAcceptsEventFocus:](self, "setAcceptsEventFocus:", 0LL);
  -[PBSceneDeferralTargetAssertion invalidate](self->_deferralTargetAssertion, "invalidate");
  deferralTargetAssertion = self->_deferralTargetAssertion;
  self->_deferralTargetAssertion = 0LL;

  if (self->_activatedOnce)
  {
    [v5 configureParameters:&stru_1003D8D90];
    [v5 activateWithTransitionContext:0];
  }
}

- (void)sceneDidInvalidate:(id)a3
{
  self->_activatedOnce = 0;
  p_contentDelegate = &self->_contentDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentDelegate);
  [WeakRetained contentPresenting:self willDismissContentWithResult:0 error:0];

  id v6 = objc_loadWeakRetained((id *)p_contentDelegate);
  [v6 contentPresentingDidDismissContent:self];
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v7 = a4;
  id v8 = objc_alloc_init(&OBJC_CLASS___PBSystemUIServiceSceneClientSettingsDiffInspector);
  [v8 observeRequestsEventFocusWithBlock:&stru_1003D8DD0];
  [v8 observeExternalGesturesWithBlock:&stru_1003D8DF0];
  [v8 observeDictationOverlayVisibilityWithBlock:&stru_1003D8E10];
  char v10 = 0;
  __int16 v9 = 0;
  [v8 inspectDiff:v7 withContext:&v9];

  if ((_BYTE)v9) {
    -[PBSystemUIServiceViewController _updateEventFocus](self, "_updateEventFocus");
  }
  if (HIBYTE(v9)) {
    -[PBSystemUIServiceViewController _updateSystemGestures](self, "_updateSystemGestures");
  }
  if (v10) {
    -[PBSystemUIServiceViewController _updateDictationOverlayVisibility](self, "_updateDictationOverlayVisibility");
  }
}

- (id)scene:(id)a3 handleActions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (!v8)
  {
    id v11 = 0LL;
    goto LABEL_23;
  }

  id v9 = v8;
  id v23 = v6;
  char v10 = 0;
  id v11 = 0LL;
  uint64_t v12 = *(void *)v28;
  do
  {
    for (i = 0LL; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v28 != v12) {
        objc_enumerationMutation(v7);
      }
      id v14 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
      if (objc_msgSend(v14, "pb_systemUIServiceActionType"))
      {
        id v15 = objc_msgSend(v14, "pb_systemUIServiceActionType");
        id v16 = v15;
        if (v15 == (id)6)
        {
          -[PBSystemUIServiceViewController _handleCameraHandoffAction:](self, "_handleCameraHandoffAction:", v14);
          id v25 = v11;
          PBUISAddToMutableSet(&v25, v14);
          id v17 = v25;
        }

        else
        {
          if (v15 == (id)5)
          {
            -[PBSystemUIServiceViewController _handleBulletinObservingAction:]( self,  "_handleBulletinObservingAction:",  v14);
            id v26 = v11;
            PBUISAddToMutableSet(&v26, v14);
            id v17 = v26;
            goto LABEL_16;
          }

          id v17 = v11;
        }

        id v18 = sub_1000F7834();
        id v11 = (void *)objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          id v32 = v16;
          _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v11,  OS_LOG_TYPE_ERROR,  "Unhandled SystemUIServiceAction {action.type=%ld}",  buf,  0xCu);
        }

        goto LABEL_16;
      }

      id v24 = v11;
      PBUISAddToMutableSet(&v24, v14);
      id v17 = v24;
      char v10 = 1;
LABEL_16:

      id v11 = v17;
    }

    id v9 = [v7 countByEnumeratingWithState:&v27 objects:v33 count:16];
  }

  while (v9);
  if ((v10 & 1) != 0)
  {
    Class v19 = (void *)objc_claimAutoreleasedReturnValue( +[PBSystemUIServiceDismissMenuOptions optionsWithAnimated:]( &OBJC_CLASS___PBSystemUIServiceDismissMenuOptions,  "optionsWithAnimated:",  1LL));
    v20 = (void *)objc_claimAutoreleasedReturnValue( +[PBSystemUIServiceDismissMenuAction actionWithOptions:]( &OBJC_CLASS___PBSystemUIServiceDismissMenuAction,  "actionWithOptions:",  v19));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v20));
    -[PBSystemUIServiceViewController sendActions:](self, "sendActions:", v21);
  }

  id v6 = v23;
LABEL_23:

  return v11;
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
  id v6 = (void (**)(void))a5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sceneDeactivationManager]);

  [v8 beginTrackingScene:self->_scene];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemUIServiceViewController traitCollection](self, "traitCollection"));
  id v10 = [v9 userInterfaceStyle];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemUIServiceConduit systemState](self->_conduit, "systemState"));
  scene = self->_scene;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100140218;
  v14[3] = &unk_1003D8E38;
  id v15 = v11;
  id v16 = v10;
  id v13 = v11;
  -[FBScene performUpdate:](scene, "performUpdate:", v14);
  v6[2](v6);
}

- (void)dismissContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5
{
  id v6 = (void (**)(void))a5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[PBSceneManager sharedInstance](&OBJC_CLASS___PBSceneManager, "sharedInstance"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sceneDeactivationManager]);

  [v8 endTrackingScene:self->_scene];
  -[FBScene deactivateWithTransitionContext:](self->_scene, "deactivateWithTransitionContext:", 0LL);
  v6[2](v6);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == &off_1003D8D08)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemUIServiceConduit systemState](self->_conduit, "systemState", a3, a4, a5));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1001403A0;
    v10[3] = &unk_1003D8E60;
    id v11 = v7;
    id v8 = v7;
    -[PBSystemUIServiceViewController _updateSceneSettings:](self, "_updateSceneSettings:", v10);
  }

  else
  {
    v9.receiver = self;
    v9.super_class = (Class)&OBJC_CLASS___PBSystemUIServiceViewController;
    -[PBSystemUIServiceViewController observeValueForKeyPath:ofObject:change:context:]( &v9,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)setAcceptsEventFocus:(BOOL)a3
{
  if (self->__acceptsEventFocus != a3)
  {
    -[PBSystemUIServiceViewController willChangeValueForKey:]( self,  "willChangeValueForKey:",  @"acceptsEventFocus");
    self->__acceptsEventFocus = a3;
    -[PBSystemUIServiceViewController didChangeValueForKey:](self, "didChangeValueForKey:", @"acceptsEventFocus");
    if (self->__acceptsEventFocus) {
      -[PBSystemUIServiceViewController _serviceBeganPresentingSystemMenu](self, "_serviceBeganPresentingSystemMenu");
    }
    else {
      -[PBSystemUIServiceViewController _serviceEndedPresentingSystemMenu](self, "_serviceEndedPresentingSystemMenu");
    }
  }

- (void)_userInterfaceStyleDidChange
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSystemUIServiceViewController traitCollection](self, "traitCollection"));
  id v4 = [v3 userInterfaceStyle];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_1001404B4;
  v5[3] = &unk_1003D8E80;
  v5[4] = v4;
  -[PBSystemUIServiceViewController _updateSceneSettings:](self, "_updateSceneSettings:", v5);
}

- (void)_updateSceneSettings:(id)a3
{
  id v4 = a3;
  unsigned int v5 = -[FBScene isActive](self->_scene, "isActive");
  scene = self->_scene;
  if (v5)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472LL;
    v12[2] = sub_1001405B4;
    v12[3] = &unk_1003D8B68;
    id v7 = &v13;
    id v13 = v4;
    id v8 = v4;
    -[FBScene performUpdate:](scene, "performUpdate:", v12);
  }

  else
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_1001405D0;
    v10[3] = &unk_1003D8B90;
    id v7 = &v11;
    id v11 = v4;
    id v9 = v4;
    -[FBScene configureParameters:](scene, "configureParameters:", v10);
  }
}

- (void)_updateEventFocus
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBScene pb_systemUIServiceSceneClientSettings](self->_scene, "pb_systemUIServiceSceneClientSettings"));
  -[PBSystemUIServiceViewController setAcceptsEventFocus:]( self,  "setAcceptsEventFocus:",  [v3 requestsEventFocus]);
}

- (void)_serviceBeganPresentingSystemMenu
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained systemUIServiceBeganPresentingSystemMenu:self];

  id v4 = -[PBSceneHandle initWithScene:](objc_alloc(&OBJC_CLASS___PBSceneHandle), "initWithScene:", self->_scene);
  unsigned int v5 = -[PBSceneDeferralTargetAssertion initWithSceneHandle:reason:]( objc_alloc(&OBJC_CLASS___PBSceneDeferralTargetAssertion),  "initWithSceneHandle:reason:",  v4,  @"RequestsEventFocus");
  deferralTargetAssertion = self->_deferralTargetAssertion;
  self->_deferralTargetAssertion = v5;
}

- (void)_serviceEndedPresentingSystemMenu
{
  deferralTargetAssertion = self->_deferralTargetAssertion;
  self->_deferralTargetAssertion = 0LL;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained systemUIServiceEndedPresentingSystemMenu:self];
}

- (void)_updateSystemGestures
{
  id v17 = (void *)objc_claimAutoreleasedReturnValue( -[FBScene pb_systemUIServiceSceneClientSettings]( self->_scene,  "pb_systemUIServiceSceneClientSettings"));
  __int128 v25 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v22 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue([v17 externalGestures]);
  id v4 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_externalGestureHandles, "objectForKey:", v7));
        BOOL v9 = v8 == 0LL;

        if (v9)
        {
          id v10 = [(id)objc_opt_class(self) _systemGestureForExternalGesture:v7];
          if (v10)
          {
            objc_initWeak(location, self);
            id v11 = (void *)objc_claimAutoreleasedReturnValue( +[PBSystemGestureManager sharedInstance]( &OBJC_CLASS___PBSystemGestureManager,  "sharedInstance"));
            v20[0] = _NSConcreteStackBlock;
            v20[1] = 3221225472LL;
            v20[2] = sub_100140AA4;
            v20[3] = &unk_1003D8EA8;
            objc_copyWeak(&v21, location);
            v20[4] = v7;
            id v12 = [v11 newHandleForSystemGesture:v10 actionHandler:v20];

            -[NSMutableDictionary setObject:forKey:](self->_externalGestureHandles, "setObject:forKey:", v12, v7);
            objc_destroyWeak(&v21);
            objc_destroyWeak(location);
          }

          else
          {
            id v13 = sub_1000F7834();
            id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
            {
              LODWORD(location[0]) = 138543362;
              *(id *)((char *)location + 4) = v7;
              _os_log_fault_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_FAULT,  "Invalid external gesture {gesture=%{public}@}",  (uint8_t *)location,  0xCu);
            }
          }
        }
      }

      id v4 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }

    while (v4);
  }

  externalGestureHandles = self->_externalGestureHandles;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100140AF4;
  v18[3] = &unk_1003D8ED0;
  id v19 = v3;
  id v16 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( externalGestureHandles,  "enumerateKeysAndObjectsUsingBlock:",  v18);
}

- (void)_updateDictationOverlayVisibility
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FBScene pb_systemUIServiceSceneClientSettings](self->_scene, "pb_systemUIServiceSceneClientSettings"));
  if ([v2 isDictationOverlayVisible])
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSiriManager sharedInstance](&OBJC_CLASS___PBSiriManager, "sharedInstance"));
    [v3 disableSiriPresentGesture];
  }

  else
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBDictationManager sharedInstance](&OBJC_CLASS___PBDictationManager, "sharedInstance"));
    [v4 resetAfterDictation];

    id v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSiriManager sharedInstance](&OBJC_CLASS___PBSiriManager, "sharedInstance"));
    [v3 enableSiriPresentGesture];
  }
}

- (void)_handleSystemGestureAction:(id)a3 forExternalGesture:(id)a4
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[PBSystemUIServiceExternalGestureAction actionWithGesture:]( &OBJC_CLASS___PBSystemUIServiceExternalGestureAction,  "actionWithGesture:",  a4));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v5));
  -[FBScene sendActions:](self->_scene, "sendActions:", v6);
}

+ (unint64_t)_systemGestureForExternalGesture:(id)a3
{
  id v3 = a3;
  if (qword_100471048 != -1) {
    dispatch_once(&qword_100471048, &stru_1003D8EF0);
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue([(id)qword_100471040 objectForKey:v3]);
  uint64_t v5 = v4;
  if (v4) {
    id v6 = [v4 integerValue];
  }
  else {
    id v6 = 0LL;
  }

  return (unint64_t)v6;
}

- (void)_handleBulletinObservingAction:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 bulletinData]);
  id v15 = 0LL;
  id v5 = +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  objc_opt_class(&OBJC_CLASS___PBSBulletin),  v4,  &v15);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  id v7 = v15;
  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[PBBulletinService observingBulletinActionHandlerForBulletinWithIdentifier:]( &OBJC_CLASS___PBBulletinService,  "observingBulletinActionHandlerForBulletinWithIdentifier:",  v8));

    id v10 = sub_1000F7834();
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    id v12 = v11;
    if (v9)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue([v6 identifier]);
        *(_DWORD *)buf = 134218242;
        id v17 = v9;
        __int16 v18 = 2114;
        id v19 = v13;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Handling bulletin observing action. {adapter=%p, bulletinIdentifier=%{public}@}",  buf,  0x16u);
      }

      [v9 handleForwardedBulletinObservingAction:v3];
    }

    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1002859BC(v6, v3);
      }
    }
  }

  else
  {
    id v14 = sub_1000F7834();
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
      sub_100285924((uint64_t)v4, v3);
    }
  }
}

- (void)_handleCameraHandoffAction:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 cameraIdentifier]);
  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100141064;
  v8[3] = &unk_1003D8F18;
  id v7 = v4;
  id v9 = v7;
  objc_copyWeak(&v10, &location);
  [WeakRetained systemUIServiceRequestedCameraHandoffWithIdentifier:v5 completion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
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
  return self->__acceptsEventFocus;
}

- (PBSystemUIServiceViewControllerDelegate)delegate
{
  return (PBSystemUIServiceViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (PBWorkspaceHandle)workspace
{
  return self->_workspace;
}

- (PBSystemUIServiceConduit)conduit
{
  return self->_conduit;
}

- (FBScene)scene
{
  return self->_scene;
}

- (UIScenePresentationBinder)scenePresentationBinder
{
  return self->_scenePresentationBinder;
}

- (PBSceneDeferralTargetAssertion)deferralTargetAssertion
{
  return self->_deferralTargetAssertion;
}

- (NSMutableDictionary)externalGestureHandles
{
  return self->_externalGestureHandles;
}

- (void).cxx_destruct
{
}

@end