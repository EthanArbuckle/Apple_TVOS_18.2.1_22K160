@interface PBSplitViewPresentationViewController
+ (id)_defaultAnimationSettings;
+ (id)_sceneWorkspace;
- (BOOL)acceptsEventFocus;
- (BOOL)expectsEventForwarding;
- (BOOL)isInterruptible;
- (PBApplication)application;
- (PBSplitViewPresentationViewController)initWithApplication:(id)a3 workspace:(id)a4 geometry:(id)a5 delegate:(id)a6;
- (PBSplitViewPresentationViewControllerDelegate)delegate;
- (PBSystemOverlayContentDelegate)contentDelegate;
- (id)scene:(id)a3 handleActions:(id)a4;
- (id)sceneDeactivationPredicate;
- (void)_updateSceneSafeAreaInsets;
- (void)_userInterfaceStyleDidChange;
- (void)dealloc;
- (void)dismissContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5;
- (void)hideEditingHint;
- (void)hideSplitViewWithAnimationSettings:(id)a3 completion:(id)a4;
- (void)loadView;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pipEditingHintViewControllerDidDismiss:(id)a3;
- (void)prepareUIForSystemOverlayPresentationWithCompletion:(id)a3;
- (void)presentContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5;
- (void)sceneDidActivate:(id)a3;
- (void)sceneDidDeactivate:(id)a3 withError:(id)a4;
- (void)sceneWillDeactivate:(id)a3 withError:(id)a4;
- (void)showEditingHint;
- (void)unhideSplitViewWithAnimationSettings:(id)a3 completion:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillMoveToWindow:(id)a3;
@end

@implementation PBSplitViewPresentationViewController

- (PBSplitViewPresentationViewController)initWithApplication:(id)a3 workspace:(id)a4 geometry:(id)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (!v11)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"application != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100284694();
    }
    _bs_set_crash_log_message([v21 UTF8String]);
    __break(0);
    JUMPOUT(0x100130CF8LL);
  }

  if (!v12)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"workspace != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028473C();
    }
    _bs_set_crash_log_message([v22 UTF8String]);
    __break(0);
    JUMPOUT(0x100130D5CLL);
  }

  if (!v13)
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"geometry != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_1002847E4();
    }
    _bs_set_crash_log_message([v23 UTF8String]);
    __break(0);
    JUMPOUT(0x100130DC0LL);
  }

  v15 = v14;
  if (!v14)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"delegate != ((void *)0)"));
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_10028488C();
    }
    _bs_set_crash_log_message([v24 UTF8String]);
    __break(0);
    JUMPOUT(0x100130E24LL);
  }

  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___PBSplitViewPresentationViewController;
  v16 = -[PBSplitViewPresentationViewController initWithNibName:bundle:](&v25, "initWithNibName:bundle:", 0LL, 0LL);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_application, a3);
    objc_storeStrong((id *)&v17->_workspace, a4);
    objc_storeStrong((id *)&v17->_geometry, a5);
    objc_storeWeak((id *)&v17->_delegate, v15);
    -[PBSplitViewOutwardSizing addObserverForSafeAreaInsets:](v17->_geometry, "addObserverForSafeAreaInsets:", v17);
    uint64_t v26 = objc_opt_class(&OBJC_CLASS___UITraitUserInterfaceStyle);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v26, 1LL));
    id v19 =  -[PBSplitViewPresentationViewController registerForTraitChanges:withAction:]( v17,  "registerForTraitChanges:withAction:",  v18,  "_userInterfaceStyleDidChange");
  }

  return v17;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___PBSplitViewPresentationViewController;
  -[PBSplitViewPresentationViewController dealloc](&v3, "dealloc");
}

- (id)sceneDeactivationPredicate
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_100130F30;
  v4[3] = &unk_1003D8A00;
  objc_copyWeak(&v5, &location);
  v2 = objc_retainBlock(v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
  return v2;
}

- (void)loadView
{
  objc_super v3 = objc_alloc(&OBJC_CLASS___PBSplitViewPresentationView);
  v4 = (void *)objc_claimAutoreleasedReturnValue( +[PBAppIconCache sharedAppSwitcherIconCache]( &OBJC_CLASS___PBAppIconCache,  "sharedAppSwitcherIconCache"));
  id v5 = -[PBSplitViewPresentationView initWithApplicationIconProvider:](v3, "initWithApplicationIconProvider:", v4);

  -[PBSplitViewPresentationViewController setView:](self, "setView:", v5);
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PBSplitViewPresentationViewController;
  -[PBSplitViewPresentationViewController viewDidLoad](&v6, "viewDidLoad");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSplitViewPresentationViewController view](self, "view"));
  [v3 setApplication:self->_application];
  -[PBSplitViewOutwardSizing safeAreaInsetsForEdges:](self->_geometry, "safeAreaInsetsForEdges:", 10LL);
  objc_msgSend(v3, "setScenePresentationInsets:");
  scenePresenter = self->_scenePresenter;
  if (scenePresenter)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[UIScenePresenter presentationView](scenePresenter, "presentationView"));
    [v3 setScenePresentationView:v5];

    -[UIScenePresenter activate](self->_scenePresenter, "activate");
  }
}

- (void)viewWillMoveToWindow:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___PBSplitViewPresentationViewController;
  id v4 = a3;
  -[PBSplitViewPresentationViewController viewWillMoveToWindow:](&v5, "viewWillMoveToWindow:", v4);
  -[PBSplitViewOutwardSizing setCoordinateSpace:]( self->_geometry,  "setCoordinateSpace:",  v4,  v5.receiver,  v5.super_class);
}

- (void)viewDidLayoutSubviews
{
  v22.receiver = self;
  v22.super_class = (Class)&OBJC_CLASS___PBSplitViewPresentationViewController;
  -[PBSplitViewPresentationViewController viewDidLayoutSubviews](&v22, "viewDidLayoutSubviews");
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSplitViewPresentationViewController view](self, "view"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 window]);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v3 scenePresentationView]);
  [v5 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  objc_msgSend(v3, "convertRect:toCoordinateSpace:", v4, v7, v9, v11, v13);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  -[PBSplitViewOutwardSizing setCoordinateSpace:](self->_geometry, "setCoordinateSpace:", v4);
  -[PBSplitViewOutwardSizing setInsetFrame:forEdges:]( self->_geometry,  "setInsetFrame:forEdges:",  10LL,  v15,  v17,  v19,  v21);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (&off_1003D3180 == a6)
  {
    -[PBSplitViewPresentationViewController _updateSceneSafeAreaInsets](self, "_updateSceneSafeAreaInsets", a3, a4, a5);
    double v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBSplitViewPresentationViewController viewIfLoaded](self, "viewIfLoaded"));
    -[PBSplitViewOutwardSizing safeAreaInsetsForEdges:](self->_geometry, "safeAreaInsetsForEdges:", 10LL);
    objc_msgSend(v7, "setScenePresentationInsets:");
  }

  else
  {
    v8.receiver = self;
    v8.super_class = (Class)&OBJC_CLASS___PBSplitViewPresentationViewController;
    -[PBSplitViewPresentationViewController observeValueForKeyPath:ofObject:change:context:]( &v8,  "observeValueForKeyPath:ofObject:change:context:",  a3,  a4,  a5);
  }

- (void)prepareUIForSystemOverlayPresentationWithCompletion:(id)a3
{
  id v4 = (void (**)(id, PBSplitViewPresentationViewController *, void))a3;
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(-[PBApplication bundleIdentifier](self->_application, "bundleIdentifier"));
  double v6 = (void *)objc_claimAutoreleasedReturnValue( +[FBSSceneIdentity pb_identityForApplicationIdentifier:role:]( &OBJC_CLASS___FBSSceneIdentity,  "pb_identityForApplicationIdentifier:role:",  v5,  @"sidebar"));

  id v7 = [(id)objc_opt_class(self) _sceneWorkspace];
  objc_super v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472LL;
  v55[2] = sub_1001315F8;
  v55[3] = &unk_1003D6780;
  id v9 = v6;
  id v56 = v9;
  v57 = self;
  double v10 = (FBScene *)objc_claimAutoreleasedReturnValue([v8 createScene:v55]);
  scene = self->_scene;
  self->_scene = v10;

  -[FBScene setDelegate:](self->_scene, "setDelegate:", self);
  double v12 = (void *)objc_claimAutoreleasedReturnValue(-[PBWorkspaceHandle displayConfiguration](self->_workspace, "displayConfiguration"));
  -[PBSplitViewOutwardSizing insetBoundsForEdges:](self->_geometry, "insetBoundsForEdges:", 10LL);
  uint64_t v40 = v13;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  uint64_t v19 = v18;
  -[PBSplitViewOutwardSizing safeAreaInsetsForEdges:](self->_geometry, "safeAreaInsetsForEdges:", 5LL);
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[PBSplitViewPresentationViewController traitCollection](self, "traitCollection"));
  id v29 = [v28 userInterfaceStyle];

  objc_initWeak(&location, self);
  v30 = self->_scene;
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_100131688;
  v43[3] = &unk_1003D8A28;
  id v31 = v12;
  id v44 = v31;
  uint64_t v45 = v40;
  uint64_t v46 = v15;
  uint64_t v47 = v17;
  uint64_t v48 = v19;
  uint64_t v49 = v21;
  uint64_t v50 = v23;
  uint64_t v51 = v25;
  uint64_t v52 = v27;
  id v53 = v29;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_100131750;
  v41[3] = &unk_1003D01C0;
  objc_copyWeak(&v42, &location);
  -[FBScene performUpdate:withCompletion:](v30, "performUpdate:withCompletion:", v43, v41);
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[FBScene uiPresentationManager](self->_scene, "uiPresentationManager"));
  v33 = (objc_class *)objc_opt_class(self);
  v34 = NSStringFromClass(v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
  v36 = (UIScenePresenter *)objc_claimAutoreleasedReturnValue([v32 createPresenterWithIdentifier:v35]);
  scenePresenter = self->_scenePresenter;
  self->_scenePresenter = v36;

  if (-[PBSplitViewPresentationViewController isViewLoaded](self, "isViewLoaded"))
  {
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[PBSplitViewPresentationViewController view](self, "view"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[UIScenePresenter presentationView](self->_scenePresenter, "presentationView"));
    [v38 setScenePresentationView:v39];

    -[UIScenePresenter activate](self->_scenePresenter, "activate");
  }

  v4[2](v4, self, 0LL);
  objc_destroyWeak(&v42);

  objc_destroyWeak(&location);
}

- (PBSystemOverlayContentDelegate)contentDelegate
{
  return 0LL;
}

- (BOOL)isInterruptible
{
  return 0;
}

- (void)presentContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  id v9 = a4;
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBSplitViewPresentationViewController view](self, "view"));
  double v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"kAnimationSettings"]);

  if (v11)
  {
    id v12 = v11;
  }

  else
  {
    id v13 = [(id)objc_opt_class(self) _defaultAnimationSettings];
    id v12 = (id)objc_claimAutoreleasedReturnValue(v13);
  }

  uint64_t v14 = v12;

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100131934;
  v16[3] = &unk_1003D0110;
  id v17 = v8;
  id v15 = v8;
  [v10 setScenePresentationViewHidden:0 animated:v6 animationSettings:v14 completion:v16];
}

- (void)dismissContentAnimated:(BOOL)a3 clientOptions:(id)a4 withCompletion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  double v10 = (void *)objc_claimAutoreleasedReturnValue(-[PBSplitViewPresentationViewController viewIfLoaded](self, "viewIfLoaded"));
  if (v10)
  {
    double v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:@"kAnimationSettings"]);
    id v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }

    else
    {
      id v14 = [(id)objc_opt_class(self) _defaultAnimationSettings];
      id v13 = (id)objc_claimAutoreleasedReturnValue(v14);
    }

    id v15 = v13;

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = sub_100131A70;
    v16[3] = &unk_1003D2560;
    void v16[4] = self;
    id v17 = v9;
    [v10 setScenePresentationViewHidden:1 animated:v6 animationSettings:v15 completion:v16];
  }

  else if (v9)
  {
    v9[2](v9);
  }
}

- (void)hideSplitViewWithAnimationSettings:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBSplitViewPresentationViewController viewIfLoaded](self, "viewIfLoaded"));
  id v9 = v8;
  if (v8) {
    [v8 setScenePresentationViewHidden:1 animated:1 animationSettings:v6 completion:v7];
  }
  else {
    v7[2](v7);
  }
}

- (void)unhideSplitViewWithAnimationSettings:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[PBSplitViewPresentationViewController viewIfLoaded](self, "viewIfLoaded"));
  id v9 = v8;
  if (v8) {
    [v8 setScenePresentationViewHidden:0 animated:1 animationSettings:v6 completion:v7];
  }
  else {
    v7[2](v7);
  }
}

- (BOOL)acceptsEventFocus
{
  return 0;
}

- (BOOL)expectsEventForwarding
{
  return 1;
}

- (id)scene:(id)a3 handleActions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    id v9 = v8;
    char v10 = 0;
    double v11 = 0LL;
    uint64_t v12 = *(void *)v20;
    do
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v7);
        }
        id v14 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        if ([v14 UIActionType] == (id)44)
        {
          id v18 = v11;
          PBUISAddToMutableSet(&v18, v14);
          id v15 = v18;

          char v10 = 1;
          double v11 = v15;
        }
      }

      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }

    while (v9);
    if ((v10 & 1) != 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained splitViewPresentationViewControllerRequestsDismissal:self animated:1];
    }
  }

  else
  {
    double v11 = 0LL;
  }

  return v11;
}

- (void)sceneDidActivate:(id)a3
{
}

- (void)sceneWillDeactivate:(id)a3 withError:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_1000F7384();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  char v10 = v9;
  if (v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10028499C((uint64_t)v6, v10, v11, v12, v13, v14, v15, v16);
    }
  }

  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Scene deactivated", v17, 2u);
  }

  -[PBWorkspaceHandle unregisterScene:](self->_workspace, "unregisterScene:", v7);
}

- (void)sceneDidDeactivate:(id)a3 withError:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained splitViewPresentationViewControllerRequestsDismissal:self animated:0];
}

- (void)showEditingHint
{
  if (!self->_editingHintViewController)
  {
    objc_super v3 = (void *)objc_claimAutoreleasedReturnValue([0 parentViewController]);
    objc_msgSend(v3, "bs_removeChildViewController:", self->_editingHintViewController);
  }

  id v4 = -[PBPIPEditingHintViewController initWithStyle:]( objc_alloc(&OBJC_CLASS___PBPIPEditingHintViewController),  "initWithStyle:",  0LL);
  editingHintViewController = self->_editingHintViewController;
  self->_editingHintViewController = v4;

  -[PBPIPEditingHintViewController setDelegate:](self->_editingHintViewController, "setDelegate:", self);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPEditingHintViewController view](self->_editingHintViewController, "view"));
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  -[PBSplitViewPresentationViewController bs_addChildViewController:]( self,  "bs_addChildViewController:",  self->_editingHintViewController);
  id v18 = (void *)objc_claimAutoreleasedReturnValue(-[PBSplitViewPresentationViewController view](self, "view"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBPIPEditingHintViewController view](self->_editingHintViewController, "view"));
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue([v7 topAnchor]);
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[PBSplitViewPresentationViewController view](self, "view"));
  __int128 v21 = (void *)objc_claimAutoreleasedReturnValue([v23 scenePresentationView]);
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v21 bottomAnchor]);
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v22 constraintEqualToAnchor:v20]);
  v24[0] = v19;
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v7 bottomAnchor]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v18 bottomAnchor]);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v17 constraintEqualToAnchor:v16]);
  v24[1] = v15;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 leadingAnchor]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v18 leadingAnchor]);
  char v10 = (void *)objc_claimAutoreleasedReturnValue([v8 constraintEqualToAnchor:v9]);
  v24[2] = v10;
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v7 trailingAnchor]);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v18 trailingAnchor]);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 constraintEqualToAnchor:v12]);
  v24[3] = v13;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v24, 4LL));
  +[NSLayoutConstraint activateConstraints:](&OBJC_CLASS___NSLayoutConstraint, "activateConstraints:", v14);

  -[PBPIPEditingHintViewController appearAnimated](self->_editingHintViewController, "appearAnimated");
}

- (void)hideEditingHint
{
}

- (void)pipEditingHintViewControllerDidDismiss:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue( -[PBPIPEditingHintViewController parentViewController]( self->_editingHintViewController,  "parentViewController",  a3));
  objc_msgSend(v4, "bs_removeChildViewController:", self->_editingHintViewController);

  editingHintViewController = self->_editingHintViewController;
  self->_editingHintViewController = 0LL;
}

- (void)_userInterfaceStyleDidChange
{
  objc_super v3 = (void *)objc_claimAutoreleasedReturnValue(-[PBSplitViewPresentationViewController traitCollection](self, "traitCollection"));
  id v4 = [v3 userInterfaceStyle];
  scene = self->_scene;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100132208;
  v6[3] = &unk_1003D8A48;
  v6[4] = v4;
  -[FBScene pb_updateSettings:](scene, "pb_updateSettings:", v6);
}

- (void)_updateSceneSafeAreaInsets
{
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  id v11 = sub_1000F7384();
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v19.top = v4;
    v19.left = v6;
    v19.bottom = v8;
    v19.right = v10;
    uint64_t v13 = NSStringFromUIEdgeInsets(v19);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    *(_DWORD *)buf = 138543362;
    id v18 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Safe area insets updated {insets=%{public}@}",  buf,  0xCu);
  }

  scene = self->_scene;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = sub_100132368;
  v16[3] = &unk_1003D8A68;
  *(CGFloat *)&void v16[4] = v4;
  *(CGFloat *)&void v16[5] = v6;
  *(CGFloat *)&v16[6] = v8;
  *(CGFloat *)&v16[7] = v10;
  -[FBScene pb_updateSettings:](scene, "pb_updateSettings:", v16);
}

+ (id)_defaultAnimationSettings
{
  return (id)objc_claimAutoreleasedReturnValue( +[BSAnimationSettings settingsWithDuration:]( &OBJC_CLASS___BSAnimationSettings,  "settingsWithDuration:",  0.5));
}

+ (id)_sceneWorkspace
{
  if (qword_100470FF0 != -1) {
    dispatch_once(&qword_100470FF0, &stru_1003D8A88);
  }
  return (id)qword_100470FE8;
}

- (PBSplitViewPresentationViewControllerDelegate)delegate
{
  return (PBSplitViewPresentationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PBApplication)application
{
  return self->_application;
}

- (void).cxx_destruct
{
}

@end