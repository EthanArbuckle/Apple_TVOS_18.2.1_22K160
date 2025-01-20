@interface TVSSSceneDelegate
- (NSString)dictationDeviceIdentifier;
- (TVSSAnalyticsManager)analyticsManager;
- (TVSSAttentionMonitor)attentionMonitor;
- (TVSSSceneDelegate)init;
- (UIWindow)window;
- (id)_uiServiceWindowScene;
- (void)_bringFocusToSystemUIServiceForReason:(id)a3;
- (void)_dismissDictationUI;
- (void)_dismissUIIfNeeded;
- (void)_handleLogOverlord;
- (void)_setupDictationWindow;
- (void)_tearDownDictationWindow;
- (void)_unfocusSystemUIServiceIfNeeded;
- (void)_updateForDictationChange;
- (void)_updateWithCurrentServiceSystemState;
- (void)attentionMonitorDidRequestDismissal:(id)a3;
- (void)bannerManager:(id)a3 relinquishesExternalGestures:(id)a4;
- (void)bannerManager:(id)a3 requestsExternalGestures:(id)a4;
- (void)bannerManagerRelinquishesFocus:(id)a3;
- (void)bannerManagerRequestsFocus:(id)a3;
- (void)dealloc;
- (void)dictationViewControllerDidFinishDictating:(id)a3;
- (void)doNotDisturbControllerDidUpdate:(id)a3;
- (void)menuModeControllerModeDidChange:(id)a3 withTransitionContext:(id)a4;
- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5;
- (void)sceneDidBecomeActive:(id)a3;
- (void)sceneDidDisconnect:(id)a3;
- (void)sceneDidEnterBackground:(id)a3;
- (void)sceneWillEnterForeground:(id)a3;
- (void)sceneWillResignActive:(id)a3;
- (void)setDictationDeviceIdentifier:(id)a3;
- (void)setWindow:(id)a3;
- (void)statusBarMonitor:(id)a3 requestsVisibility:(BOOL)a4 withTransitionContext:(id)a5;
- (void)windowScene:(id)a3 didReceiveDismissMenuRequestWithOptions:(id)a4;
- (void)windowScene:(id)a3 didReceivePresentMenuRequestWithOptions:(id)a4;
- (void)windowScene:(id)a3 didReceiveUpdatedSystemState:(id)a4 previousState:(id)a5 withAnimationSettings:(id)a6;
- (void)windowScene:(id)a3 handleExternalGesture:(id)a4;
@end

@implementation TVSSSceneDelegate

- (TVSSSceneDelegate)init
{
  SEL v50 = a2;
  id location = 0LL;
  v49.receiver = self;
  v49.super_class = (Class)&OBJC_CLASS___TVSSSceneDelegate;
  id location = -[TVSSSceneDelegate init](&v49, "init");
  objc_storeStrong(&location, location);
  if (location)
  {
    v35 = +[TVSPSystemStatusBarMonitor sharedInstance](&OBJC_CLASS___TVSPSystemStatusBarMonitor, "sharedInstance");
    -[TVSPSystemStatusBarMonitor registerObserver:](v35, "registerObserver:", location);

    v34 = objc_alloc_init(&OBJC_CLASS___TVSSFaceTimeMenuModeStateContributor);
    v2 = (void *)*((void *)location + 10);
    *((void *)location + 10) = v34;

    v33 = objc_alloc_init(&OBJC_CLASS___TVSSSensorActivityController);
    v3 = (void *)*((void *)location + 11);
    *((void *)location + 11) = v33;

    v32 = -[TVSSPrivacyStatusMenuModeStateContributor initWithSensorActivityController:]( objc_alloc(&OBJC_CLASS___TVSSPrivacyStatusMenuModeStateContributor),  "initWithSensorActivityController:",  *((void *)location + 11));
    v4 = (void *)*((void *)location + 12);
    *((void *)location + 12) = v32;

    id v48 = objc_alloc_init(&OBJC_CLASS___TVSSAttentionAwarenessMenuModeStateContributor);
    id v47 = objc_alloc_init(&OBJC_CLASS___TVSSDisplayLayoutMenuModeStateContributor);
    v31 = objc_alloc_init(&OBJC_CLASS___TVSSSceneDelegateMenuModeStateContributor);
    v5 = (void *)*((void *)location + 9);
    *((void *)location + 9) = v31;

    v30 = (void *)*((void *)location + 9);
    v29 = +[TVSPSystemStatusBarMonitor sharedInstance](&OBJC_CLASS___TVSPSystemStatusBarMonitor, "sharedInstance");
    objc_msgSend( v30,  "setHeadboardRequestedVisibility:",  (unint64_t)-[TVSPSystemStatusBarMonitor requestsVisibility](v29, "requestsVisibility") & 1);

    id v28 = +[TVSSAppDelegate sharedApplicationDelegate](&OBJC_CLASS___TVSSAppDelegate, "sharedApplicationDelegate");
    id v46 = [v28 bannerManager];

    id v45 = [v46 bannerPresenterMenuModeStateContributor];
    id v44 = +[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array");
    v52[0] = v48;
    v52[1] = v47;
    v52[2] = *((void *)location + 9);
    v52[3] = *((void *)location + 12);
    v52[4] = *((void *)location + 10);
    v52[5] = v45;
    v27 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v52, 6LL);
    objc_msgSend(v44, "addObjectsFromArray:");

    id v43 = -[TVSSMenuModeStateProvider initWithContributors:]( objc_alloc(&OBJC_CLASS___TVSSMenuModeStateProvider),  "initWithContributors:",  v44);
    v26 = -[TVSSMenuModeController initWithMenuModeStateProvider:]( objc_alloc(&OBJC_CLASS___TVSSMenuModeController),  "initWithMenuModeStateProvider:",  v43);
    v6 = (void *)*((void *)location + 6);
    *((void *)location + 6) = v26;

    [*((id *)location + 6) addControllerObserver:location];
    v25 = -[TVSSAttentionMonitor initWithMenuModeController:]( objc_alloc(&OBJC_CLASS___TVSSAttentionMonitor),  "initWithMenuModeController:",  *((void *)location + 6));
    v7 = (void *)*((void *)location + 16);
    *((void *)location + 16) = v25;

    [*((id *)location + 16) setDelegate:location];
    v24 = -[TVSSPrivacyController initWithMenuModeController:sensorActivityController:]( objc_alloc(&OBJC_CLASS___TVSSPrivacyController),  "initWithMenuModeController:sensorActivityController:",  *((void *)location + 6),  *((void *)location + 11));
    v8 = (void *)*((void *)location + 7);
    *((void *)location + 7) = v24;

    v23 = objc_alloc_init(&OBJC_CLASS___TVSSDoNotDisturbController);
    v9 = (void *)*((void *)location + 13);
    *((void *)location + 13) = v23;

    objc_msgSend( v46,  "setDoNotDisturbEnabled:",  (unint64_t)objc_msgSend(*((id *)location + 13), "isEnabled") & 1);
    [*((id *)location + 13) addObserver:location];
    v22 = objc_alloc(&OBJC_CLASS___TVSSMenuDataSourceControllerOverlord);
    uint64_t v19 = *((void *)location + 6);
    uint64_t v20 = *((void *)location + 7);
    uint64_t v21 = *((void *)location + 13);
    v17 =  +[TVSSAudioNowPlayingController sharedInstance]( &OBJC_CLASS___TVSSAudioNowPlayingController,  "sharedInstance");
    v18 = -[TVSSMenuDataSourceControllerOverlord initWithMenuModeController:privacyController:doNotDisturbController:nowPlayingController:]( v22,  "initWithMenuModeController:privacyController:doNotDisturbController:nowPlayingController:",  v19,  v20,  v21);
    v10 = (void *)*((void *)location + 5);
    *((void *)location + 5) = v18;

    v16 = -[TVSSAnalyticsManager initWithDataSourceControllerOverlord:]( objc_alloc(&OBJC_CLASS___TVSSAnalyticsManager),  "initWithDataSourceControllerOverlord:",  *((void *)location + 5));
    v11 = (void *)*((void *)location + 15);
    *((void *)location + 15) = v16;

    if ((TVSSIsInternalVariant() & 1) != 0)
    {
      objc_initWeak(&from, location);
      out_token = (int *)((char *)location + 8);
      queue = &_dispatch_main_q;
      handler = _NSConcreteStackBlock;
      int v37 = -1073741824;
      int v38 = 0;
      v39 = sub_1000EAC6C;
      v40 = &unk_1001B6AF8;
      objc_copyWeak(&v41, &from);
      notify_register_dispatch("log_overlord", out_token, queue, &handler);

      objc_destroyWeak(&v41);
      objc_destroyWeak(&from);
    }

    objc_storeStrong(&v43, 0LL);
    objc_storeStrong(&v44, 0LL);
    objc_storeStrong(&v45, 0LL);
    objc_storeStrong(&v46, 0LL);
    objc_storeStrong(&v47, 0LL);
    objc_storeStrong(&v48, 0LL);
  }

  v13 = (TVSSSceneDelegate *)location;
  objc_storeStrong(&location, 0LL);
  return v13;
}

- (id)_uiServiceWindowScene
{
  v3 = -[TVSSSceneDelegate window](self, "window");
  id v4 = -[UIWindow windowScene](v3, "windowScene");

  return v4;
}

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v45 = self;
  SEL v44 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  id v42 = 0LL;
  objc_storeStrong(&v42, a4);
  id v41 = 0LL;
  objc_storeStrong(&v41, a5);
  id v40 = location;
  id v39 = 0LL;
  Class v38 = NSClassFromString(@"PBSystemUIServiceWindowScene");
  if (!v40)
  {
    int v37 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"_bs_assert_object != nil");
    id v36 = &_os_log_default;
    char v35 = 16;
    if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v36;
      os_log_type_t type = v35;
      v22 = NSStringFromSelector(v44);
      v18 = v22;
      v34 = v18;
      v5 = (objc_class *)objc_opt_class(v45);
      uint64_t v21 = NSStringFromClass(v5);
      v33 = v21;
      sub_10000583C( (uint64_t)v47,  (uint64_t)v18,  (uint64_t)v33,  (uint64_t)v45,  (uint64_t)@"TVSSSceneDelegate.m",  135,  (uint64_t)v37);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v47,  0x3Au);

      objc_storeStrong((id *)&v33, 0LL);
      objc_storeStrong((id *)&v34, 0LL);
    }

    objc_storeStrong(&v36, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v37, "UTF8String"));
    __break(0);
    JUMPOUT(0x1000EAF34LL);
  }

  if (((objc_opt_isKindOfClass(v40, v38) ^ 1) & 1) != 0)
  {
    id v32 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"[_bs_assert_object isKindOfClass:PBSystemUIServiceWindowSceneClass]");
    os_log_t oslog = &_os_log_default;
    os_log_type_t v30 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v14 = oslog;
      os_log_type_t v15 = v30;
      v17 = NSStringFromSelector(v44);
      v13 = v17;
      v29 = v13;
      v6 = (objc_class *)objc_opt_class(v45);
      v16 = NSStringFromClass(v6);
      id v28 = v16;
      sub_10000583C( (uint64_t)v46,  (uint64_t)v13,  (uint64_t)v28,  (uint64_t)v45,  (uint64_t)@"TVSSSceneDelegate.m",  135,  (uint64_t)v32);
      _os_log_error_impl( (void *)&_mh_execute_header,  v14,  v15,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v46,  0x3Au);

      objc_storeStrong((id *)&v28, 0LL);
      objc_storeStrong((id *)&v29, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    _bs_set_crash_log_message([v32 UTF8String]);
    __break(0);
    JUMPOUT(0x1000EB0ECLL);
  }

  objc_storeStrong(&v39, 0LL);
  objc_storeStrong(&v40, 0LL);
  v7 = objc_alloc(&OBJC_CLASS___UIWindow);
  v27 = -[UIWindow initWithWindowScene:](v7, "initWithWindowScene:", location);
  -[TVSSSceneDelegate setWindow:](v45, "setWindow:", v27);
  v8 = objc_alloc(&OBJC_CLASS___TVSSMainViewController);
  v9 = -[TVSSMainViewController initWithDataSourceControllerOverlord:]( v8,  "initWithDataSourceControllerOverlord:",  v45->_dataSourceControllerOverlord);
  mainViewController = v45->_mainViewController;
  v45->_mainViewController = v9;

  -[UIWindow setRootViewController:](v27, "setRootViewController:", v45->_mainViewController);
  -[UIWindow makeKeyAndVisible](v27, "makeKeyAndVisible");
  id v12 = +[TVSSAppDelegate sharedApplicationDelegate](&OBJC_CLASS___TVSSAppDelegate, "sharedApplicationDelegate");
  id v26 = [v12 bannerManager];

  [v26 setDelegate:v45];
  [v26 setMenuModeController:v45->_menuModeController];
  v11 = objc_alloc(&OBJC_CLASS___TVSSBannerBulletinBridgeManager);
  v25 = -[TVSSBannerBulletinBridgeManager initWithBannerManager:scene:]( v11,  "initWithBannerManager:scene:",  v26,  location);
  -[TVSSBannerBulletinBridgeManager setFullScreenCameraPresenterViewController:]( v25,  "setFullScreenCameraPresenterViewController:",  v45->_mainViewController);
  [location _registerSceneComponent:v25 forKey:@"com.apple.TVSystemUIService.BannerBulletinBridgeManager"];
  [v26 makeReadyToPresentBanners];
  -[TVSSSceneDelegate _updateWithCurrentServiceSystemState](v45, "_updateWithCurrentServiceSystemState");
  objc_storeStrong((id *)&v25, 0LL);
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong((id *)&v27, 0LL);
  objc_storeStrong(&v41, 0LL);
  objc_storeStrong(&v42, 0LL);
  objc_storeStrong(&location, 0LL);
}

- (void)dealloc
{
  v5 = self;
  SEL v4 = a2;
  v2 = +[TVSPSystemStatusBarMonitor sharedInstance](&OBJC_CLASS___TVSPSystemStatusBarMonitor, "sharedInstance");
  -[TVSPSystemStatusBarMonitor unregisterObserver:](v2, "unregisterObserver:", v5);

  -[TVSSMenuModeController removeControllerObserver:](v5->_menuModeController, "removeControllerObserver:", v5);
  -[TVSSDoNotDisturbController removeObserver:](v5->_doNotDisturbController, "removeObserver:", v5);
  -[BSInvalidatable invalidate](v5->_focusHandle, "invalidate");
  -[BSInvalidatable invalidate](v5->_dictationFocusHandle, "invalidate");
  if ((TVSSIsInternalVariant() & 1) != 0) {
    notify_cancel(v5->_logToken);
  }
  v3.receiver = v5;
  v3.super_class = (Class)&OBJC_CLASS___TVSSSceneDelegate;
  -[TVSSSceneDelegate dealloc](&v3, "dealloc");
}

- (void)_handleLogOverlord
{
  v8 = self;
  v7[1] = (id)a2;
  v7[0] = SceneDelegateLog();
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v7[0], OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v7[0];
    os_log_type_t type = v6;
    id v4 =  -[TVSSMenuDataSourceControllerOverlord succinctDescription]( v8->_dataSourceControllerOverlord,  "succinctDescription");
    id v5 = v4;
    sub_10000D28C((uint64_t)v9, (uint64_t)v5);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Overlord: %@", v9, 0xCu);

    objc_storeStrong(&v5, 0LL);
  }

  objc_storeStrong(v7, 0LL);
}

- (void)setDictationDeviceIdentifier:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ((BSEqualObjects(v4->_dictationDeviceIdentifier, location[0]) & 1) == 0)
  {
    objc_storeStrong((id *)&v4->_dictationDeviceIdentifier, location[0]);
    -[TVSSSceneDelegate _updateForDictationChange](v4, "_updateForDictationChange");
  }

  objc_storeStrong(location, 0LL);
}

- (void)_updateForDictationChange
{
  v25 = self;
  SEL v24 = a2;
  v2 = -[TVSSSceneDelegate dictationDeviceIdentifier](self, "dictationDeviceIdentifier");
  BOOL v15 = v2 != 0LL;

  BOOL v23 = v15;
  if (v15)
  {
    id location = SceneDelegateLog();
    char v21 = 2;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
    {
      log = (os_log_s *)location;
      os_log_type_t v14 = v21;
      sub_100010524(v20);
      _os_log_debug_impl( (void *)&_mh_execute_header,  log,  v14,  "Received non-nil dictationDeviceIdentifier. Setting up and displaying dictation overlay window.",  v20,  2u);
    }

    objc_storeStrong(&location, 0LL);
    -[TVSSSceneDelegate _setupDictationWindow](v25, "_setupDictationWindow");
    -[TVSSSceneDelegate _unfocusSystemUIServiceIfNeeded](v25, "_unfocusSystemUIServiceIfNeeded");
    -[TVSSSceneDelegateMenuModeStateContributor setInteractionRequestReason:]( v25->_sceneDelegateMenuModeStateContributor,  "setInteractionRequestReason:",  0LL);
    id v9 = +[TVSSAppDelegate sharedApplicationDelegate](&OBJC_CLASS___TVSSAppDelegate, "sharedApplicationDelegate");
    id v8 = [v9 bannerManager];
    [v8 revokeCurrentBannersForDismissMenuRequest];

    v11 = -[TVSSSceneDelegate window](v25, "window");
    v10 = -[UIWindow rootViewController](v11, "rootViewController");
    -[UIViewController dismissViewControllerAnimated:completion:]( v10,  "dismissViewControllerAnimated:completion:",  0LL,  0LL);

    -[BSInvalidatable invalidate](v25->_dictationFocusHandle, "invalidate");
    id v12 = -[TVSSSceneDelegate _uiServiceWindowScene](v25, "_uiServiceWindowScene");
    objc_super v3 = (BSInvalidatable *)[v12 requestEventFocusForReason:@"dictation"];
    dictationFocusHandle = v25->_dictationFocusHandle;
    v25->_dictationFocusHandle = v3;
  }

  else
  {
    id v19 = SceneDelegateLog();
    char v18 = 2;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEBUG))
    {
      os_log_type_t v6 = (os_log_s *)v19;
      os_log_type_t type = v18;
      sub_100010524(v17);
      _os_log_debug_impl( (void *)&_mh_execute_header,  v6,  type,  "Received nil dictationDeviceIdentifier. Tearing down dictation overlay window.",  v17,  2u);
    }

    objc_storeStrong(&v19, 0LL);
    -[TVSSSceneDelegate _dismissDictationUI](v25, "_dismissDictationUI");
  }

  id v5 = +[TVSSAppDelegate sharedApplicationDelegate](&OBJC_CLASS___TVSSAppDelegate, "sharedApplicationDelegate");
  id v16 = [v5 bannerManager];

  [v16 setDictating:v23];
  -[TVSSSceneDelegateMenuModeStateContributor setDictating:]( v25->_sceneDelegateMenuModeStateContributor,  "setDictating:",  v23);
  objc_storeStrong(&v16, 0LL);
}

- (void)_setupDictationWindow
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = objc_alloc_init(&OBJC_CLASS___TVSSDictationViewController);
  id v5 = -[TVSSSceneDelegate dictationDeviceIdentifier](v16, "dictationDeviceIdentifier");
  objc_msgSend(location[0], "setDictationDeviceIdentifier:");

  id v9 = -[TVSSMenuModeController provider](v16->_menuModeController, "provider");
  id v8 = -[TVSSMenuModeStateProvider state](v9, "state");
  v7 = -[TVSSMenuModeState focusedApp](v8, "focusedApp");
  id v6 = -[FBSDisplayLayoutElement bundleIdentifier](v7, "bundleIdentifier");
  objc_msgSend(location[0], "setFocusedAppIdentifier:");

  [location[0] setDelegate:v16];
  v10 = objc_alloc(&OBJC_CLASS___UIWindow);
  id v12 = -[TVSSSceneDelegate window](v16, "window");
  id v11 = -[UIWindow windowScene](v12, "windowScene");
  v2 = -[UIWindow initWithWindowScene:](v10, "initWithWindowScene:");
  dictationWindow = v16->_dictationWindow;
  v16->_dictationWindow = v2;

  -[UIWindow setRootViewController:](v16->_dictationWindow, "setRootViewController:", location[0]);
  -[UIWindow makeKeyAndVisible](v16->_dictationWindow, "makeKeyAndVisible");
  id v13 = -[TVSSSceneDelegate _uiServiceWindowScene](v16, "_uiServiceWindowScene");
  char v14 = objc_opt_respondsToSelector(v13, "setDictationOverlayVisibility:");

  if ((v14 & 1) != 0)
  {
    id v4 = -[TVSSSceneDelegate _uiServiceWindowScene](v16, "_uiServiceWindowScene");
    [v4 setDictationOverlayVisibility:1];
  }

  objc_storeStrong(location, 0LL);
}

- (void)_dismissDictationUI
{
  v4[2] = self;
  v4[1] = (id)a2;
  v4[0] = -[UIWindow rootViewController](self->_dictationWindow, "rootViewController");
  uint64_t v2 = objc_opt_class(&OBJC_CLASS___TVSSDictationViewController);
  if ((objc_opt_isKindOfClass(v4[0], v2) & 1) != 0)
  {
    id v3 = v4[0];
    [v3 dismissDictationPlatter];
    objc_storeStrong(&v3, 0LL);
  }

  objc_storeStrong(v4, 0LL);
}

- (void)_tearDownDictationWindow
{
  id v3 = -[TVSSSceneDelegate _uiServiceWindowScene](self, "_uiServiceWindowScene");
  char v4 = objc_opt_respondsToSelector(v3, "setDictationOverlayVisibility:");

  if ((v4 & 1) != 0)
  {
    id v2 = -[TVSSSceneDelegate _uiServiceWindowScene](self, "_uiServiceWindowScene");
    [v2 setDictationOverlayVisibility:0];
  }

- (void)sceneDidDisconnect:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0LL);
}

- (void)sceneDidBecomeActive:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0LL);
}

- (void)sceneWillResignActive:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0LL);
}

- (void)sceneWillEnterForeground:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0LL);
}

- (void)sceneDidEnterBackground:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0LL);
}

- (void)windowScene:(id)a3 didReceivePresentMenuRequestWithOptions:(id)a4
{
  char v18 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v16 = 0LL;
  objc_storeStrong(&v16, a4);
  id v15 = 0LL;
  if (v16) {
    id v15 = [v16 reason];
  }
  id v14 = SceneDelegateLog();
  char v13 = 1;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_INFO))
  {
    log = (os_log_s *)v14;
    os_log_type_t type = v13;
    id v10 = (id)PBSystemUIServicePresentMenuReasonName(v15);
    id v12 = v10;
    sub_10001AEB8((uint64_t)v19, (uint64_t)v12);
    _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "didReceivePresentMenuRequestWithOptions: %{public}@",  v19,  0xCu);

    objc_storeStrong(&v12, 0LL);
  }

  objc_storeStrong(&v14, 0LL);
  sceneDelegateMenuModeStateContributor = v18->_sceneDelegateMenuModeStateContributor;
  id v5 = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", v15);
  -[TVSSSceneDelegateMenuModeStateContributor setInteractionRequestReason:]( sceneDelegateMenuModeStateContributor,  "setInteractionRequestReason:");

  id v7 = +[TVSSAppDelegate sharedApplicationDelegate](&OBJC_CLASS___TVSSAppDelegate, "sharedApplicationDelegate");
  id v6 = [v7 bannerManager];
  [v6 revokeCurrentBannersForMenuModeInteractive];

  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)windowScene:(id)a3 didReceiveDismissMenuRequestWithOptions:(id)a4
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v10 = 0LL;
  objc_storeStrong(&v10, a4);
  id v9 = SceneDelegateLog();
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v9;
    os_log_type_t type = v8;
    sub_100010524(v7);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Dismiss with DismissMenuRequest action", v7, 2u);
  }

  objc_storeStrong(&v9, 0LL);
  -[TVSSSceneDelegate _dismissUIIfNeeded](v12, "_dismissUIIfNeeded");
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)windowScene:(id)a3 handleExternalGesture:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = 0LL;
  objc_storeStrong(&v7, a4);
  id v6 = +[TVSSAppDelegate sharedApplicationDelegate](&OBJC_CLASS___TVSSAppDelegate, "sharedApplicationDelegate");
  id v5 = [v6 bannerManager];
  [v5 handleExternalGesture:v7];

  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)windowScene:(id)a3 didReceiveUpdatedSystemState:(id)a4 previousState:(id)a5 withAnimationSettings:(id)a6
{
  char v13 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v11 = 0LL;
  objc_storeStrong(&v11, a4);
  id v10 = 0LL;
  objc_storeStrong(&v10, a5);
  id v9 = 0LL;
  objc_storeStrong(&v9, a6);
  -[TVSSSceneDelegate _updateWithCurrentServiceSystemState](v13, "_updateWithCurrentServiceSystemState");
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)statusBarMonitor:(id)a3 requestsVisibility:(BOOL)a4 withTransitionContext:(id)a5
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v8 = a4;
  id v7 = 0LL;
  objc_storeStrong(&v7, a5);
  -[TVSSSceneDelegateMenuModeStateContributor setHeadboardRequestedVisibility:]( v10->_sceneDelegateMenuModeStateContributor,  "setHeadboardRequestedVisibility:",  v8);
  objc_storeStrong(&v7, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)bannerManager:(id)a3 requestsExternalGestures:(id)a4
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v14 = 0LL;
  objc_storeStrong(&v14, a4);
  memset(__b, 0, sizeof(__b));
  id v10 = v14;
  id v11 = [v10 countByEnumeratingWithState:__b objects:v17 count:16];
  if (v11)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0LL;
    id v8 = v11;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(v10);
      }
      uint64_t v13 = *(void *)(__b[1] + 8 * v7);
      id v4 = -[TVSSSceneDelegate _uiServiceWindowScene](v16, "_uiServiceWindowScene");
      [v4 setEnabled:1 forExternalGesture:v13];

      ++v7;
      if (v5 + 1 >= (unint64_t)v8)
      {
        uint64_t v7 = 0LL;
        id v8 = [v10 countByEnumeratingWithState:__b objects:v17 count:16];
        if (!v8) {
          break;
        }
      }
    }
  }

  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)bannerManager:(id)a3 relinquishesExternalGestures:(id)a4
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v14 = 0LL;
  objc_storeStrong(&v14, a4);
  memset(__b, 0, sizeof(__b));
  id v10 = v14;
  id v11 = [v10 countByEnumeratingWithState:__b objects:v17 count:16];
  if (v11)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0LL;
    id v8 = v11;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(v10);
      }
      uint64_t v13 = *(void *)(__b[1] + 8 * v7);
      id v4 = -[TVSSSceneDelegate _uiServiceWindowScene](v16, "_uiServiceWindowScene");
      [v4 setEnabled:0 forExternalGesture:v13];

      ++v7;
      if (v5 + 1 >= (unint64_t)v8)
      {
        uint64_t v7 = 0LL;
        id v8 = [v10 countByEnumeratingWithState:__b objects:v17 count:16];
        if (!v8) {
          break;
        }
      }
    }
  }

  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)bannerManagerRequestsFocus:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSSceneDelegate _bringFocusToSystemUIServiceForReason:]( v4,  "_bringFocusToSystemUIServiceForReason:",  @"Banner Manager Requesting");
  objc_storeStrong(location, 0LL);
}

- (void)bannerManagerRelinquishesFocus:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSSceneDelegate _unfocusSystemUIServiceIfNeeded](v4, "_unfocusSystemUIServiceIfNeeded");
  objc_storeStrong(location, 0LL);
}

- (void)menuModeControllerModeDidChange:(id)a3 withTransitionContext:(id)a4
{
  uint64_t v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  if ([location[0] mode] == (id)3) {
    -[TVSSSceneDelegate _bringFocusToSystemUIServiceForReason:]( v7,  "_bringFocusToSystemUIServiceForReason:",  @"Entering Interactive Mode");
  }
  else {
    -[TVSSSceneDelegate _unfocusSystemUIServiceIfNeeded](v7, "_unfocusSystemUIServiceIfNeeded");
  }
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)doNotDisturbControllerDidUpdate:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v3 = +[TVSSAppDelegate sharedApplicationDelegate](&OBJC_CLASS___TVSSAppDelegate, "sharedApplicationDelegate");
  id v4 = [v3 bannerManager];

  objc_msgSend(v4, "setDoNotDisturbEnabled:", (unint64_t)objc_msgSend(location[0], "isEnabled") & 1);
  objc_storeStrong(&v4, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)attentionMonitorDidRequestDismissal:(id)a3
{
  id v9 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v7 = SceneDelegateLog();
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v7;
    os_log_type_t type = v6;
    sub_100010524(v5);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Dismiss with attention monitor timeout", v5, 2u);
  }

  objc_storeStrong(&v7, 0LL);
  -[TVSSSceneDelegate _dismissUIIfNeeded](v9, "_dismissUIIfNeeded");
  objc_storeStrong(location, 0LL);
}

- (void)_bringFocusToSystemUIServiceForReason:(id)a3
{
  id v8 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if (v8->_focusHandle)
  {
    os_log_t oslog = (os_log_t)SceneDelegateLog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_10001AEB8((uint64_t)v9, (uint64_t)location[0]);
      _os_log_error_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_ERROR,  "TVSystemUIService already has an active focus handle. Attempted to focus for reason '%{public}@'",  v9,  0xCu);
    }

    objc_storeStrong((id *)&oslog, 0LL);
  }

  else
  {
    id v5 = -[TVSSSceneDelegate _uiServiceWindowScene](v8, "_uiServiceWindowScene");
    id v3 = (BSInvalidatable *)[v5 requestEventFocusForReason:location[0]];
    focusHandle = v8->_focusHandle;
    v8->_focusHandle = v3;
  }

  objc_storeStrong(location, 0LL);
}

- (void)_unfocusSystemUIServiceIfNeeded
{
  id v12 = self;
  location[1] = (id)a2;
  if (self->_focusHandle)
  {
    location[0] = SceneDelegateLog();
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      log = (os_log_s *)location[0];
      os_log_type_t v5 = v10;
      sub_100010524(v9);
      _os_log_impl((void *)&_mh_execute_header, log, v5, "Unfocusing TVSystemUIService", v9, 2u);
    }

    objc_storeStrong(location, 0LL);
    -[BSInvalidatable invalidate](v12->_focusHandle, "invalidate");
    objc_storeStrong((id *)&v12->_focusHandle, 0LL);
  }

  else
  {
    id v8 = SceneDelegateLog();
    char v7 = 1;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_INFO))
    {
      id v2 = (os_log_s *)v8;
      os_log_type_t type = v7;
      sub_100010524(v6);
      _os_log_impl( (void *)&_mh_execute_header,  v2,  type,  "Requested Unfocusing of TVSystemUIService but it's already unfocused",  v6,  2u);
    }

    objc_storeStrong(&v8, 0LL);
  }

- (void)_updateWithCurrentServiceSystemState
{
  id v14 = self;
  v13[1] = (id)a2;
  id v5 = -[TVSSSceneDelegate _uiServiceWindowScene](self, "_uiServiceWindowScene");
  v13[0] = [v5 systemState];

  -[TVSSSceneDelegateMenuModeStateContributor setPlaybackControlsState:]( v14->_sceneDelegateMenuModeStateContributor,  "setPlaybackControlsState:",  [v13[0] playbackControlsState]);
  BOOL v12 = [v13[0] splitViewVisibility] == (id)1;
  -[TVSSSceneDelegateMenuModeStateContributor setSplitViewVisible:]( v14->_sceneDelegateMenuModeStateContributor,  "setSplitViewVisible:",  v12);
  id v11 = [v13[0] siriPresentationVisibility];
  -[TVSSSceneDelegateMenuModeStateContributor setSiriPresentationVisibility:]( v14->_sceneDelegateMenuModeStateContributor,  "setSiriPresentationVisibility:",  v11);
  id v10 = [v13[0] currentScheduledSleep];
  -[TVSSSceneDelegateMenuModeStateContributor setCurrentScheduledSleep:]( v14->_sceneDelegateMenuModeStateContributor,  "setCurrentScheduledSleep:",  v10);
  BOOL v9 = v11 == (id)2;
  -[TVSSPrivacyController setRequireIndicatorsOutsideMenuBar:]( v14->_privacyController,  "setRequireIndicatorsOutsideMenuBar:",  v11 == (id)2);
  id v6 = +[TVSSAppDelegate sharedApplicationDelegate](&OBJC_CLASS___TVSSAppDelegate, "sharedApplicationDelegate");
  id v8 = [v6 bannerManager];

  [v8 setSiriPresentationVisibility:v11];
  id location = SceneDelegateLog();
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEBUG))
  {
    id v4 = [v13[0] dictationDeviceIdentifier];
    sub_10000D28C((uint64_t)v15, (uint64_t)v4);
    _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)location,  OS_LOG_TYPE_DEBUG,  "Updating current service system state. Dictation device identifier: %@",  v15,  0xCu);
  }

  objc_storeStrong(&location, 0LL);
  id v2 = v14;
  id v3 = [v13[0] dictationDeviceIdentifier];
  -[TVSSSceneDelegate setDictationDeviceIdentifier:](v2, "setDictationDeviceIdentifier:");

  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(&v10, 0LL);
  objc_storeStrong(v13, 0LL);
}

- (void)_dismissUIIfNeeded
{
  id v3 = +[TVSSAppDelegate sharedApplicationDelegate](&OBJC_CLASS___TVSSAppDelegate, "sharedApplicationDelegate");
  id v2 = [v3 bannerManager];
  [v2 revokeCurrentBannersForDismissMenuRequest];

  id v5 = -[TVSSSceneDelegate window](self, "window");
  id v4 = -[UIWindow rootViewController](v5, "rootViewController");
  -[UIViewController dismissViewControllerAnimated:completion:]( v4,  "dismissViewControllerAnimated:completion:",  0LL,  0LL);
}

- (void)dictationViewControllerDidFinishDictating:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSSceneDelegate _tearDownDictationWindow](v4, "_tearDownDictationWindow");
  objc_storeStrong(location, 0LL);
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
}

- (TVSSAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (TVSSAttentionMonitor)attentionMonitor
{
  return self->_attentionMonitor;
}

- (NSString)dictationDeviceIdentifier
{
  return self->_dictationDeviceIdentifier;
}

- (void).cxx_destruct
{
}

@end