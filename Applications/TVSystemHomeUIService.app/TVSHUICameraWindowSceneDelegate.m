@interface TVSHUICameraWindowSceneDelegate
- (BSInvalidatable)sceneVisibilityAssertion;
- (TVSHUICameraRootViewController)rootViewController;
- (UIWindow)window;
- (id)_FBSScene;
- (void)_didPrepareForPresentationWithCompletion:(id)a3;
- (void)_dismissScene;
- (void)_sendAction:(id)a3;
- (void)cameraRootViewController:(id)a3 didPrepareForPresentationWithCompletion:(id)a4;
- (void)cameraRootViewControllerRequestsDismissal:(id)a3;
- (void)cameraWindowScene:(id)a3 didReceiveCameraActivationContext:(id)a4;
- (void)dealloc;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)setWindow:(id)a3;
@end

@implementation TVSHUICameraWindowSceneDelegate

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  -[BSInvalidatable invalidate](self->_sceneVisibilityAssertion, "invalidate");
  v2.receiver = v4;
  v2.super_class = (Class)&OBJC_CLASS___TVSHUICameraWindowSceneDelegate;
  -[TVSHUICameraWindowSceneDelegate dealloc](&v2, "dealloc");
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  v51 = self;
  SEL v50 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  id v48 = 0LL;
  objc_storeStrong(&v48, a4);
  id v47 = 0LL;
  objc_storeStrong(&v47, a5);
  id v46 = location;
  id v45 = 0LL;
  Class v44 = NSClassFromString(@"UIWindowScene");
  if (!v46)
  {
    v43 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil");
    id v42 = &_os_log_default;
    char v41 = 16;
    if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v42;
      os_log_type_t type = v41;
      v25 = NSStringFromSelector(v50);
      v21 = v25;
      v40 = v21;
      v5 = (objc_class *)objc_opt_class(v51);
      v24 = NSStringFromClass(v5);
      v39 = v24;
      sub_1000056C8( (uint64_t)v53,  (uint64_t)v21,  (uint64_t)v39,  (uint64_t)v51,  (uint64_t)@"TVSHUICameraWindowSceneDelegate.m",  40,  (uint64_t)v43);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v53,  0x3Au);

      objc_storeStrong((id *)&v39, 0LL);
      objc_storeStrong((id *)&v40, 0LL);
    }

    objc_storeStrong(&v42, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v43, "UTF8String"));
    __break(0);
    JUMPOUT(0x100006A44LL);
  }

  if (((objc_opt_isKindOfClass(v46, v44) ^ 1) & 1) != 0)
  {
    id v38 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:UIWindowSceneClass]");
    os_log_t oslog = &_os_log_default;
    os_log_type_t v36 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v17 = oslog;
      os_log_type_t v18 = v36;
      v20 = NSStringFromSelector(v50);
      v16 = v20;
      v35 = v16;
      v6 = (objc_class *)objc_opt_class(v51);
      v19 = NSStringFromClass(v6);
      v34 = v19;
      sub_1000056C8( (uint64_t)v52,  (uint64_t)v16,  (uint64_t)v34,  (uint64_t)v51,  (uint64_t)@"TVSHUICameraWindowSceneDelegate.m",  40,  (uint64_t)v38);
      _os_log_error_impl( (void *)&_mh_execute_header,  v17,  v18,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v52,  0x3Au);

      objc_storeStrong((id *)&v34, 0LL);
      objc_storeStrong((id *)&v35, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    _bs_set_crash_log_message([v38 UTF8String]);
    __break(0);
    JUMPOUT(0x100006BFCLL);
  }

  objc_storeStrong(&v45, 0LL);
  objc_storeStrong(&v46, 0LL);
  id v33 = location;
  v7 = objc_alloc(&OBJC_CLASS___UIWindow);
  v8 = -[UIWindow initWithWindowScene:](v7, "initWithWindowScene:", v33);
  window = v51->_window;
  v51->_window = v8;

  id v14 = location;
  uint64_t v10 = objc_opt_class(&OBJC_CLASS___PBUISystemHomeServiceCameraWindowScene);
  id v31 = sub_100006EB8(v14, v10);
  id v32 = v31;
  v30 = v51->_sceneVisibilityAssertion;
  v11 = (BSInvalidatable *)[v32 requestVisibilityForReason:@"SceneConnection"];
  sceneVisibilityAssertion = v51->_sceneVisibilityAssertion;
  v51->_sceneVisibilityAssertion = v11;

  -[BSInvalidatable invalidate](v30, "invalidate");
  id v15 =  +[TVSystemHomeUIServiceApplication sharedApplication]( &OBJC_CLASS___TVSystemHomeUIServiceApplication,  "sharedApplication");
  [v15 refreshItemManager];

  v13 = objc_alloc(&OBJC_CLASS___TVSHUICameraRootViewController);
  id v29 = -[TVSHUICameraRootViewController initWithWindowScene:](v13, "initWithWindowScene:", v32);
  [v29 setDelegate:v51];
  objc_storeWeak((id *)&v51->_rootViewController, v29);
  id v28 = objc_msgSend(v47, "pbui_cameraActivationContext");
  [v29 presentCameraWithContext:v28];
  -[UIWindow setRootViewController:](v51->_window, "setRootViewController:", v29);
  -[UIWindow makeKeyAndVisible](v51->_window, "makeKeyAndVisible");
  objc_storeStrong(&v28, 0LL);
  objc_storeStrong(&v29, 0LL);
  objc_storeStrong((id *)&v30, 0LL);
  objc_storeStrong(&v32, 0LL);
  objc_storeStrong(&v33, 0LL);
  objc_storeStrong(&v47, 0LL);
  objc_storeStrong(&v48, 0LL);
  objc_storeStrong(&location, 0LL);
}

- (void)cameraRootViewController:(id)a3 didPrepareForPresentationWithCompletion:(id)a4
{
  v22 = self;
  SEL v21 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  id v19 = 0LL;
  objc_storeStrong(&v19, a4);
  id v11 = location;
  id WeakRetained = objc_loadWeakRetained((id *)&v22->_rootViewController);
  BOOL v12 = v11 != WeakRetained;

  if (v12)
  {
    os_log_type_t v18 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"viewController == _rootViewController");
    id v17 = &_os_log_default;
    char v16 = 16;
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v17;
      os_log_type_t type = v16;
      uint64_t v10 = NSStringFromSelector(v21);
      v6 = v10;
      id v15 = v6;
      v5 = (objc_class *)objc_opt_class(v22);
      v9 = NSStringFromClass(v5);
      id v14 = v9;
      sub_1000056C8( (uint64_t)v23,  (uint64_t)v6,  (uint64_t)v14,  (uint64_t)v22,  (uint64_t)@"TVSHUICameraWindowSceneDelegate.m",  69,  (uint64_t)v18);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v23,  0x3Au);

      objc_storeStrong((id *)&v14, 0LL);
      objc_storeStrong((id *)&v15, 0LL);
    }

    objc_storeStrong(&v17, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v18, "UTF8String"));
    __break(0);
    JUMPOUT(0x100007194LL);
  }

  -[TVSHUICameraWindowSceneDelegate _didPrepareForPresentationWithCompletion:]( v22,  "_didPrepareForPresentationWithCompletion:",  v19);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&location, 0LL);
}

- (void)cameraRootViewControllerRequestsDismissal:(id)a3
{
  id v19 = self;
  SEL v18 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  id v10 = location;
  id WeakRetained = objc_loadWeakRetained((id *)&v19->_rootViewController);
  BOOL v11 = v10 != WeakRetained;

  if (v11)
  {
    char v16 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"viewController == _rootViewController");
    id v15 = &_os_log_default;
    char v14 = 16;
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v15;
      os_log_type_t type = v14;
      v9 = NSStringFromSelector(v18);
      v5 = v9;
      v13 = v5;
      v4 = (objc_class *)objc_opt_class(v19);
      v8 = NSStringFromClass(v4);
      BOOL v12 = v8;
      sub_1000056C8( (uint64_t)v20,  (uint64_t)v5,  (uint64_t)v12,  (uint64_t)v19,  (uint64_t)@"TVSHUICameraWindowSceneDelegate.m",  76,  (uint64_t)v16);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v20,  0x3Au);

      objc_storeStrong((id *)&v12, 0LL);
      objc_storeStrong((id *)&v13, 0LL);
    }

    objc_storeStrong(&v15, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v16, "UTF8String"));
    __break(0);
    JUMPOUT(0x100007420LL);
  }

  -[TVSHUICameraWindowSceneDelegate _dismissScene](v19, "_dismissScene");
  objc_storeStrong(&location, 0LL);
}

- (void)cameraWindowScene:(id)a3 didReceiveCameraActivationContext:(id)a4
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v6 = 0LL;
  objc_storeStrong(&v6, a4);
  id WeakRetained = objc_loadWeakRetained((id *)&v8->_rootViewController);
  [WeakRetained presentCameraWithContext:v6];

  objc_storeStrong(&v6, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_didPrepareForPresentationWithCompletion:(id)a3
{
  char v16 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  char v14 = 0LL;
  if (location[0])
  {
    v13 = v16->_sceneVisibilityAssertion;
    objc_storeStrong((id *)&v16->_sceneVisibilityAssertion, 0LL);
    id v6 = _NSConcreteStackBlock;
    int v7 = -1073741824;
    int v8 = 0;
    v9 = sub_1000076E0;
    id v10 = &unk_1000145A8;
    id v12 = location[0];
    BOOL v11 = v13;
    SEL v3 = +[BSActionResponder responderWithHandler:](&OBJC_CLASS___BSActionResponder, "responderWithHandler:", &v6);
    v4 = v14;
    char v14 = v3;

    objc_storeStrong((id *)&v11, 0LL);
    objc_storeStrong(&v12, 0LL);
    objc_storeStrong((id *)&v13, 0LL);
  }

  id v5 = objc_msgSend([PBUISystemHomeServiceCameraPreparedAction alloc], "initWithInfo:responder:");
  -[TVSHUICameraWindowSceneDelegate _sendAction:](v16, "_sendAction:", v5);
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong((id *)&v14, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_dismissScene
{
  SEL v3 = self;
  v2[1] = (id)a2;
  v2[0] = objc_msgSend([UIDismissSceneAction alloc], "initWithInfo:responder:", 0);
  -[TVSHUICameraWindowSceneDelegate _sendAction:](v3, "_sendAction:", v2[0]);
  objc_storeStrong(v2, 0LL);
}

- (void)_sendAction:(id)a3
{
  id v32 = self;
  SEL v31 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  id v29 = location;
  id v28 = 0LL;
  Class v27 = NSClassFromString(@"BSAction");
  if (!v29)
  {
    v26 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil");
    id v25 = &_os_log_default;
    char v24 = 16;
    if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v25;
      os_log_type_t type = v24;
      char v16 = NSStringFromSelector(v31);
      id v12 = v16;
      v23 = v12;
      SEL v3 = (objc_class *)objc_opt_class(v32);
      id v15 = NSStringFromClass(v3);
      v22 = v15;
      sub_1000056C8( (uint64_t)v34,  (uint64_t)v12,  (uint64_t)v22,  (uint64_t)v32,  (uint64_t)@"TVSHUICameraWindowSceneDelegate.m",  117,  (uint64_t)v26);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v34,  0x3Au);

      objc_storeStrong((id *)&v22, 0LL);
      objc_storeStrong((id *)&v23, 0LL);
    }

    objc_storeStrong(&v25, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v26, "UTF8String"));
    __break(0);
    JUMPOUT(0x100007AA0LL);
  }

  if (((objc_opt_isKindOfClass(v29, v27) ^ 1) & 1) != 0)
  {
    SEL v21 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:BSActionClass]");
    os_log_t oslog = &_os_log_default;
    os_log_type_t v19 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      int v8 = oslog;
      os_log_type_t v9 = v19;
      BOOL v11 = NSStringFromSelector(v31);
      int v7 = v11;
      SEL v18 = v7;
      v4 = (objc_class *)objc_opt_class(v32);
      id v10 = NSStringFromClass(v4);
      id v17 = v10;
      sub_1000056C8( (uint64_t)v33,  (uint64_t)v7,  (uint64_t)v17,  (uint64_t)v32,  (uint64_t)@"TVSHUICameraWindowSceneDelegate.m",  117,  (uint64_t)v21);
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  v9,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v33,  0x3Au);

      objc_storeStrong((id *)&v17, 0LL);
      objc_storeStrong((id *)&v18, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v21, "UTF8String"));
    __break(0);
    JUMPOUT(0x100007C58LL);
  }

  objc_storeStrong(&v28, 0LL);
  objc_storeStrong(&v29, 0LL);
  id v6 = -[TVSHUICameraWindowSceneDelegate _FBSScene](v32, "_FBSScene");
  id v5 = +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", location);
  objc_msgSend(v6, "sendActions:");

  objc_storeStrong(&location, 0LL);
}

- (id)_FBSScene
{
  id v3 = -[UIWindow windowScene](self->_window, "windowScene");
  id v4 = [v3 _FBSScene];

  return v4;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (TVSHUICameraRootViewController)rootViewController
{
  return (TVSHUICameraRootViewController *)objc_loadWeakRetained((id *)&self->_rootViewController);
}

- (BSInvalidatable)sceneVisibilityAssertion
{
  return self->_sceneVisibilityAssertion;
}

- (void).cxx_destruct
{
}

@end