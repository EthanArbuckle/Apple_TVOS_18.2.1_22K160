@interface TVSSBannerManager
- (BNBannerController)bannerController;
- (BNBannerSourceListener)bannerSourceListener;
- (BOOL)bannerSourceListener:(id)a3 recommendsSuspending:(BOOL)a4 forReason:(id)a5 revokingCurrent:(BOOL)a6 error:(id *)a7;
- (BOOL)bannerSourceListener:(id)a3 requestsPostingPresentable:(id)a4 options:(unint64_t)a5 userInfo:(id)a6 error:(id *)a7;
- (BOOL)bannerSourceListenerShouldEnablePresentableContextInterface:(id)a3;
- (BOOL)isDictating;
- (BOOL)isDoNotDisturbEnabled;
- (BOOL)postPresentable:(id)a3 options:(unint64_t)a4 userInfo:(id)a5 error:(id *)a6;
- (BOOL)setSuspended:(BOOL)a3 forReason:(id)a4 revokingCurrent:(BOOL)a5 error:(id *)a6;
- (NSTimer)interactiveModeSuspensionTimer;
- (TVSSBannerAuthority)bannerAuthority;
- (TVSSBannerManager)init;
- (TVSSBannerManagerDelegate)delegate;
- (TVSSBannerPresenter)presenter;
- (TVSSBannerQueue)bannerQueue;
- (TVSSMenuModeController)menuModeController;
- (TVSSMenuModeStateContributing)bannerPresenterMenuModeStateContributor;
- (id)bannerSourceListener:(id)a3 layoutDescriptionWithError:(id *)a4;
- (id)bannerSourceListener:(id)a3 newBannerSourceListenerPresentableForBannerSpecification:(id)a4 serviceDomain:(id)a5 scene:(id)a6 readyCompletion:(id)a7;
- (id)bannerSourceListener:(id)a3 requestsRevokingPresentablesWithIdentification:(id)a4 reason:(id)a5 animated:(BOOL)a6 userInfo:(id)a7 error:(id *)a8;
- (id)bannerSourceListener:(id)a3 sceneSpecificationForBannerSceneWithIdentifier:(id)a4 forProcess:(id)a5 userInfo:(id)a6;
- (id)revokePresentablesWithIdentification:(id)a3 reason:(id)a4 animated:(BOOL)a5 error:(id *)a6;
- (int64_t)siriPresentationVisibility;
- (void)bannerSourceListener:(id)a3 didUpdateInitialSceneSettingsWithParameters:(id)a4;
- (void)handleExternalGesture:(id)a3;
- (void)makeReadyToPresentBanners;
- (void)menuModeControllerModeDidChange:(id)a3 withTransitionContext:(id)a4;
- (void)presenter:(id)a3 didDismissPresentable:(id)a4;
- (void)presenter:(id)a3 didPresentPresentable:(id)a4;
- (void)presenter:(id)a3 requestsDismissPresentable:(id)a4 reason:(id)a5 animated:(BOOL)a6;
- (void)relinquishFocus;
- (void)requestFocusAndRelinquishExternalGestures;
- (void)revokeCurrentBannersForDismissMenuRequest;
- (void)revokeCurrentBannersForMenuModeInteractive;
- (void)setBannerAuthority:(id)a3;
- (void)setBannerController:(id)a3;
- (void)setBannerQueue:(id)a3;
- (void)setBannerSourceListener:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDictating:(BOOL)a3;
- (void)setDoNotDisturbEnabled:(BOOL)a3;
- (void)setInteractiveModeSuspensionTimer:(id)a3;
- (void)setMenuModeController:(id)a3;
- (void)setPresenter:(id)a3;
- (void)setSiriPresentationVisibility:(int64_t)a3;
@end

@implementation TVSSBannerManager

- (TVSSBannerManager)init
{
  SEL v25 = a2;
  v26 = 0LL;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___TVSSBannerManager;
  v26 = -[TVSSBannerManager init](&v24, "init");
  objc_storeStrong((id *)&v26, v26);
  if (v26)
  {
    v16 = objc_alloc(&OBJC_CLASS___BNBannerSourceListener);
    v19 = +[UIScreen mainScreen](&OBJC_CLASS___UIScreen, "mainScreen");
    id v18 = -[UIScreen displayConfiguration](v19, "displayConfiguration");
    v17 = sub_10006DFDC((uint64_t)&OBJC_CLASS___TVSSBannerManager);
    v2 = -[BNBannerSourceListener initWithServiceDomain:displayConfiguration:authorizedBundleIDs:]( v16,  "initWithServiceDomain:displayConfiguration:authorizedBundleIDs:",  @"com.apple.TVSystemUIService.Notifications",  v18);
    bannerSourceListener = v26->_bannerSourceListener;
    v26->_bannerSourceListener = v2;

    -[BNBannerSourceListener setDelegate:](v26->_bannerSourceListener, "setDelegate:", v26);
    v4 = objc_alloc_init(&OBJC_CLASS___TVSSBannerAuthority);
    bannerAuthority = v26->_bannerAuthority;
    v26->_bannerAuthority = v4;

    v6 = objc_alloc_init(&OBJC_CLASS___TVSSBannerPresenter);
    presenter = v26->_presenter;
    v26->_presenter = v6;

    -[TVSSBannerPresenter setDelegate:](v26->_presenter, "setDelegate:", v26);
    v8 = objc_alloc_init(&OBJC_CLASS___TVSSBannerQueue);
    bannerQueue = v26->_bannerQueue;
    v26->_bannerQueue = v8;

    v10 = objc_alloc(&OBJC_CLASS___BNBannerController);
    v11 = -[BNBannerController initWithAuthority:pender:presenter:]( v10,  "initWithAuthority:pender:presenter:",  v26->_bannerAuthority,  v26->_bannerQueue,  v26->_presenter);
    bannerController = v26->_bannerController;
    v26->_bannerController = v11;

    id v23 = 0LL;
    v13 = v26->_bannerController;
    id v22 = 0LL;
    unsigned __int8 v20 = -[BNBannerController setSuspended:forReason:revokingCurrent:error:]( v13,  "setSuspended:forReason:revokingCurrent:error:",  1LL,  @"TVSSBannerSuspensionReasonPresenterAvailability",  0LL,  &v22);
    objc_storeStrong(&v23, v22);
    if ((v20 & 1) == 0)
    {
      id v21 = BannerManagerLog();
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
      {
        sub_10001AEB8((uint64_t)v27, (uint64_t)v23);
        _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)v21,  OS_LOG_TYPE_ERROR,  "Failed to suspend the banner controller for its initial state. {error=%{public}@}",  v27,  0xCu);
      }

      objc_storeStrong(&v21, 0LL);
    }

    objc_storeStrong(&v23, 0LL);
  }

  v15 = v26;
  objc_storeStrong((id *)&v26, 0LL);
  return v15;
}

- (void)makeReadyToPresentBanners
{
  v12 = self;
  location[1] = (id)a2;
  location[0] = BannerManagerLog();
  char v10 = 1;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_INFO))
  {
    log = (os_log_s *)location[0];
    os_log_type_t type = v10;
    sub_100010524(v9);
    _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "Making ready to present banner, starting up the banner queue.",  v9,  2u);
  }

  objc_storeStrong(location, 0LL);
  id v8 = 0LL;
  bannerController = v12->_bannerController;
  id v7 = 0LL;
  unsigned __int8 v3 = -[BNBannerController setSuspended:forReason:revokingCurrent:error:]( bannerController,  "setSuspended:forReason:revokingCurrent:error:",  0LL,  @"TVSSBannerSuspensionReasonPresenterAvailability",  0LL,  &v7);
  objc_storeStrong(&v8, v7);
  if ((v3 & 1) == 0)
  {
    os_log_t oslog = (os_log_t)BannerManagerLog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_10001AEB8((uint64_t)v13, (uint64_t)v8);
      _os_log_error_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_ERROR,  "Failed to resume banner queue. {error=%{public}@}",  v13,  0xCu);
    }

    objc_storeStrong((id *)&oslog, 0LL);
  }

  objc_storeStrong(&v8, 0LL);
}

- (void)setMenuModeController:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)BannerManagerLog();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    sub_10003F4DC((uint64_t)v6, (uint64_t)location[0], (uint64_t)v5->_menuModeController);
    _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_INFO,  "Setting menu mode controller. {newMenuModeController=%p, oldMenuModeController=%p}",  v6,  0x16u);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  if (location[0] != v5->_menuModeController)
  {
    -[TVSSMenuModeController removeControllerObserver:](v5->_menuModeController, "removeControllerObserver:", v5);
    objc_storeStrong((id *)&v5->_menuModeController, location[0]);
    [location[0] addControllerObserver:v5];
    -[TVSSBannerAuthority setMenuModeController:](v5->_bannerAuthority, "setMenuModeController:", location[0]);
    sub_10006E3FC((id *)&v5->super.isa);
  }

  objc_storeStrong(location, 0LL);
}

- (void)setDoNotDisturbEnabled:(BOOL)a3
{
  v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  if (self->_doNotDisturbEnabled != a3)
  {
    os_log_t oslog = (os_log_t)BannerManagerLog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      sub_10003EC58((uint64_t)v7, v4);
      _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_INFO,  "Updating Do Not Disturb state. {isEnabling=%{BOOL}d}",  v7,  8u);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    v6->_doNotDisturbEnabled = v4;
    -[TVSSBannerAuthority setDoNotDisturbEnabled:](v6->_bannerAuthority, "setDoNotDisturbEnabled:", v4);
    sub_10006E94C((uint64_t)v6, v4, 1LL);
  }

- (void)setSiriPresentationVisibility:(int64_t)a3
{
  v11 = self;
  SEL v10 = a2;
  int64_t v9 = a3;
  if (self->_siriPresentationVisibility != a3)
  {
    id v8 = BannerManagerLog();
    char v7 = 1;
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_INFO))
    {
      log = (os_log_s *)v8;
      os_log_type_t type = v7;
      id v5 = (id)PBSystemUISiriPresentationVisibilityDescription(v9);
      id v6 = v5;
      sub_10000D28C((uint64_t)v12, (uint64_t)v6);
      _os_log_impl((void *)&_mh_execute_header, log, type, "Updating Siri Presentation Visibility: %@", v12, 0xCu);

      objc_storeStrong(&v6, 0LL);
    }

    objc_storeStrong(&v8, 0LL);
    v11->_siriPresentationVisibility = v9;
    -[BNBannerController setSuspended:forReason:revokingCurrent:error:]( v11->_bannerController,  "setSuspended:forReason:revokingCurrent:error:",  v11->_siriPresentationVisibility == 2,  @"TVSSBannerSuspensionReasonSiriOrbAndSnippets",  1LL,  0LL);
  }

- (void)setDictating:(BOOL)a3
{
  if (self->_dictating != a3)
  {
    self->_dictating = a3;
    -[BNBannerController setSuspended:forReason:revokingCurrent:error:]( self->_bannerController,  "setSuspended:forReason:revokingCurrent:error:",  a3,  @"TVSSBannerSuspensionReasonDictation",  1LL,  0LL);
  }

- (TVSSMenuModeStateContributing)bannerPresenterMenuModeStateContributor
{
  return (TVSSMenuModeStateContributing *)self->_presenter;
}

- (void)handleExternalGesture:(id)a3
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  if ([location[0] isEqual:PBSystemUIServiceGestureMenuSingleTap])
  {
    sub_10006F0A4((uint64_t)v14, @"TVSSBannerRevocationReasonMenuOut");
  }

  else if (([location[0] isEqual:PBSystemUIServiceGestureTVSingleTap] & 1) != 0 {
         || ([location[0] isEqual:PBSystemUIServiceGestureGameControllerHome] & 1) != 0)
  }
  {
    id v12 = sub_10006F340((uint64_t)v14);
    if ((objc_opt_respondsToSelector(v12, "sendActionWithExternalGesture:") & 1) != 0) {
      [v12 sendActionWithExternalGesture:location[0]];
    }
    else {
      [v12 handleTemplateContentEvent:0];
    }
    id v6 = [v12 presentableUserInfo];
    id v5 = [v6 objectForKey:TVSPBannerPresentableKeyAutoDismissOnAction];
    uint64_t v3 = objc_opt_class(&OBJC_CLASS___NSNumber);
    id v7 = sub_10006F468(v5, v3);

    id v10 = v7;
    id v11 = v7;
    if (v7) {
      unsigned int v4 = [v11 BOOLValue] & 1;
    }
    else {
      unsigned int v4 = 1;
    }
    BOOL v9 = v4 != 0;
    if (v4) {
      sub_10006F0A4((uint64_t)v14, @"TVSSBannerRevocationReasonPrimaryActionTriggered");
    }
    objc_storeStrong(&v11, 0LL);
    objc_storeStrong(&v12, 0LL);
  }

  else
  {
    os_log_t oslog = (os_log_t)BannerManagerLog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_10001AEB8((uint64_t)v15, (uint64_t)location[0]);
      _os_log_error_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_ERROR,  "Unknown external gesture. {gesture=%{public}@}",  v15,  0xCu);
    }

    objc_storeStrong((id *)&oslog, 0LL);
  }

  objc_storeStrong(location, 0LL);
}

- (BOOL)postPresentable:(id)a3 options:(unint64_t)a4 userInfo:(id)a5 error:(id *)a6
{
  v14 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  unint64_t v12 = a4;
  id v11 = 0LL;
  objc_storeStrong(&v11, a5);
  char v10 = sub_10006F5D8((uint64_t)v14, location[0], v12, v11, (uint64_t)a6);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(location, 0LL);
  return v10 & 1;
}

- (id)revokePresentablesWithIdentification:(id)a3 reason:(id)a4 animated:(BOOL)a5 error:(id *)a6
{
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v11 = 0LL;
  objc_storeStrong(&v11, a4);
  id v10 =  -[BNBannerController revokePresentablesWithIdentification:reason:options:animated:userInfo:error:]( v13->_bannerController,  "revokePresentablesWithIdentification:reason:options:animated:userInfo:error:",  location[0],  v11,  0LL,  a5,  0LL,  a6);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(location, 0LL);
  return v10;
}

- (void)requestFocusAndRelinquishExternalGestures
{
  id v6 = self;
  v5[1] = (id)a2;
  v5[0] = objc_loadWeakRetained((id *)&self->_delegate);
  [v5[0] bannerManagerRequestsFocus:v6];
  id v3 = v5[0];
  v2 = v6;
  unsigned int v4 = sub_10006F844((uint64_t)v6);
  objc_msgSend(v3, "bannerManager:relinquishesExternalGestures:", v2);

  objc_storeStrong(v5, 0LL);
}

- (void)relinquishFocus
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained bannerManagerRelinquishesFocus:self];
}

- (void)revokeCurrentBannersForMenuModeInteractive
{
}

- (void)revokeCurrentBannersForDismissMenuRequest
{
}

- (BOOL)setSuspended:(BOOL)a3 forReason:(id)a4 revokingCurrent:(BOOL)a5 error:(id *)a6
{
  v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  id location = 0LL;
  objc_storeStrong(&location, a4);
  unsigned __int8 v9 = -[BNBannerController setSuspended:forReason:revokingCurrent:error:]( v13->_bannerController,  "setSuspended:forReason:revokingCurrent:error:",  v11,  location,  a5,  a6);
  objc_storeStrong(&location, 0LL);
  return v9 & 1;
}

- (id)bannerSourceListener:(id)a3 layoutDescriptionWithError:(id *)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  +[TVSSConstants bannerMinimumSize](&OBJC_CLASS___TVSSConstants, "bannerMinimumSize");
  double v10 = v4;
  double v11 = v5;
  +[TVSSConstants bannerMaximumSize](&OBJC_CLASS___TVSSConstants, "bannerMaximumSize");
  unsigned __int8 v9 =  +[BNBannerSourceLayoutDescription bannerSourceLayoutDescriptionWithPresentationSize:containerSize:]( &OBJC_CLASS___BNBannerSourceLayoutDescription,  "bannerSourceLayoutDescriptionWithPresentationSize:containerSize:",  v10,  v11,  v6,  v7);
  objc_storeStrong(location, 0LL);
  return v9;
}

- (BOOL)bannerSourceListener:(id)a3 requestsPostingPresentable:(id)a4 options:(unint64_t)a5 userInfo:(id)a6 error:(id *)a7
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v15 = 0LL;
  objc_storeStrong(&v15, a4);
  unint64_t v14 = a5;
  id v13 = 0LL;
  objc_storeStrong(&v13, a6);
  char v12 = sub_10006F5D8((uint64_t)v17, v15, v14, v13, (uint64_t)a7);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
  return v12 & 1;
}

- (id)bannerSourceListener:(id)a3 requestsRevokingPresentablesWithIdentification:(id)a4 reason:(id)a5 animated:(BOOL)a6 userInfo:(id)a7 error:(id *)a8
{
  id v21 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v19 = 0LL;
  objc_storeStrong(&v19, a4);
  id v18 = 0LL;
  objc_storeStrong(&v18, a5);
  BOOL v17 = a6;
  id v16 = 0LL;
  objc_storeStrong(&v16, a7);
  v15[1] = a8;
  v15[0] =  -[BNBannerController revokePresentablesWithIdentification:reason:options:animated:userInfo:error:]( v21->_bannerController,  "revokePresentablesWithIdentification:reason:options:animated:userInfo:error:",  v19,  v18,  0LL,  v17,  v16,  a8);
  id v14 = v15[0];
  objc_storeStrong(v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(location, 0LL);
  return v14;
}

- (BOOL)bannerSourceListener:(id)a3 recommendsSuspending:(BOOL)a4 forReason:(id)a5 revokingCurrent:(BOOL)a6 error:(id *)a7
{
  id v19 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  BOOL v17 = a4;
  id v16 = 0LL;
  objc_storeStrong(&v16, a5);
  BOOL v15 = a6;
  id v14 = a7;
  os_log_t oslog = (os_log_t)BannerManagerLog();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
  {
    sub_10006FEA0((uint64_t)v20, v17, (uint64_t)v16, v15);
    _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_INFO,  "Banner source listener suspension recommendation. {shouldSuspend=%{BOOL}d, reason=%{public}@, shouldRevokeCurrent=%{BOOL}d}",  v20,  0x18u);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  uint64_t v8 = -[BNBannerController setSuspended:forReason:revokingCurrent:error:]( v19->_bannerController,  "setSuspended:forReason:revokingCurrent:error:",  v17,  v16,  v15,  v14);
  objc_storeStrong(&v16, (id)HIDWORD(v8));
  objc_storeStrong(location, (id)HIDWORD(v8));
  return v8 & 1;
}

- (BOOL)bannerSourceListenerShouldEnablePresentableContextInterface:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  objc_storeStrong(location, 0LL);
  return 1;
}

- (id)bannerSourceListener:(id)a3 sceneSpecificationForBannerSceneWithIdentifier:(id)a4 forProcess:(id)a5 userInfo:(id)a6
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v20 = 0LL;
  objc_storeStrong(&v20, a4);
  id v19 = 0LL;
  objc_storeStrong(&v19, a5);
  id v18 = 0LL;
  objc_storeStrong(&v18, a6);
  v17[8] = 0;
  id v14 = [v18 objectForKeyedSubscript:TVSPBannerPresentableKeyHostedBannerWantsGestureForAction];
  uint64_t v6 = objc_opt_class(&OBJC_CLASS___NSNumber);
  id v15 = sub_10006F468(v14, v6);

  unsigned __int8 v16 = [v15 BOOLValue];
  *(void *)BOOL v17 = v16 & 1;
  if ((v16 & 1) != 0)
  {
    id v7 =  +[BNBannerSourceApplicationSceneSpecification specification]( &OBJC_CLASS___BNBannerSourceApplicationSceneSpecification,  "specification");
    uint64_t v8 = *(void **)&v17[1];
    *(void *)&v17[1] = v7;
  }

  id v10 = *(id *)&v17[1];
  objc_storeStrong((id *)&v17[1], 0LL);
  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(&v19, 0LL);
  objc_storeStrong(&v20, 0LL);
  objc_storeStrong(location, 0LL);
  return v10;
}

- (void)bannerSourceListener:(id)a3 didUpdateInitialSceneSettingsWithParameters:(id)a4
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  [v5 updateSettingsWithBlock:&stru_1001B89E8];
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)bannerSourceListener:(id)a3 newBannerSourceListenerPresentableForBannerSpecification:(id)a4 serviceDomain:(id)a5 scene:(id)a6 readyCompletion:(id)a7
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v26 = 0LL;
  objc_storeStrong(&v26, a4);
  id v25 = 0LL;
  objc_storeStrong(&v25, a5);
  id v24 = 0LL;
  objc_storeStrong(&v24, a6);
  id v23 = 0LL;
  objc_storeStrong(&v23, a7);
  id v22 = 0LL;
  id v20 = [v26 contentBehavior];
  if (v20)
  {
    if (v20 == (id)1)
    {
      id v10 = objc_alloc(&OBJC_CLASS___TVSSBannerTemplatePresentableViewController);
      double v11 = -[TVSSBannerTemplatePresentableViewController initWithSpecification:serviceDomain:readyCompletion:]( v10,  "initWithSpecification:serviceDomain:readyCompletion:",  v26,  v25,  v23);
      id v12 = v22;
      id v22 = v11;
    }

    else
    {
      os_log_t oslog = (os_log_t)BannerManagerLog();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        id v13 = [v26 contentBehavior];
        sub_100070488((uint64_t)v28, (uint64_t)v13, (uint64_t)v26);
        _os_log_error_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_ERROR,  "Cannot create new presentable listener, unknown banner specification. {contentBehavior=%ld, specification=%@}",  v28,  0x16u);
      }

      objc_storeStrong((id *)&oslog, 0LL);
    }
  }

  else
  {
    id v7 = objc_alloc(&OBJC_CLASS___TVSSBannerHostedPresentableViewController);
    uint64_t v8 = -[TVSSBannerHostedPresentableViewController initWithSpecification:serviceDomain:scene:readyCompletion:]( v7,  "initWithSpecification:serviceDomain:scene:readyCompletion:",  v26,  v25,  v24,  v23);
    id v9 = v22;
    id v22 = v8;
  }

  id v15 = v22;
  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(&v23, 0LL);
  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(&v25, 0LL);
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(location, 0LL);
  return v15;
}

- (void)presenter:(id)a3 didPresentPresentable:(id)a4
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  sub_100070554(v7, v5);
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)presenter:(id)a3 didDismissPresentable:(id)a4
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  sub_100070750((id *)&v7->super.isa);
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)presenter:(id)a3 requestsDismissPresentable:(id)a4 reason:(id)a5 animated:(BOOL)a6
{
  v30 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v28 = 0LL;
  objc_storeStrong(&v28, a4);
  id v27 = 0LL;
  objc_storeStrong(&v27, a5);
  BOOL v26 = a6;
  id v25 = BannerManagerLog();
  os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v25, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v25;
    os_log_type_t type = v24;
    id v13 = (id)BNEffectivePresentableDescription(v28);
    id v23 = v13;
    sub_10002F860((uint64_t)v32, (uint64_t)v23, (uint64_t)v27);
    _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "Presenter asked to revoke banner. {presentable=%{public}@, reason=%{public}@}",  v32,  0x16u);

    objc_storeStrong(&v23, 0LL);
  }

  objc_storeStrong(&v25, 0LL);
  id v22 =  +[BNPresentableIdentification uniqueIdentificationForPresentable:]( &OBJC_CLASS___BNPresentableIdentification,  "uniqueIdentificationForPresentable:",  v28);
  id v21 = 0LL;
  bannerController = v30->_bannerController;
  id v20 = 0LL;
  id v7 =  -[BNBannerController revokePresentablesWithIdentification:reason:options:animated:userInfo:error:]( bannerController,  "revokePresentablesWithIdentification:reason:options:animated:userInfo:error:",  v22,  v27,  0LL,  v26,  0LL,  &v20);
  objc_storeStrong(&v21, v20);
  if (v21)
  {
    os_log_t oslog = (os_log_t)BannerManagerLog();
    os_log_type_t v18 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = oslog;
      os_log_type_t v9 = v18;
      id v10 = (id)BNEffectivePresentableDescription(v28);
      id v17 = v10;
      sub_100070C90((uint64_t)v31, (uint64_t)v17, (uint64_t)v27, (uint64_t)v21);
      _os_log_error_impl( (void *)&_mh_execute_header,  v8,  v9,  "Failed to revoke banner. {presentable=%{public}@, reason=%{public}@, error=%{public}@}",  v31,  0x20u);

      objc_storeStrong(&v17, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
  }

  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(&v27, 0LL);
  objc_storeStrong(&v28, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)menuModeControllerModeDidChange:(id)a3 withTransitionContext:(id)a4
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v5 = 0LL;
  objc_storeStrong(&v5, a4);
  sub_10006E3FC((id *)&v7->super.isa);
  objc_storeStrong(&v5, 0LL);
  objc_storeStrong(location, 0LL);
}

- (TVSSBannerManagerDelegate)delegate
{
  return (TVSSBannerManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (TVSSMenuModeController)menuModeController
{
  return self->_menuModeController;
}

- (BOOL)isDoNotDisturbEnabled
{
  return self->_doNotDisturbEnabled;
}

- (int64_t)siriPresentationVisibility
{
  return self->_siriPresentationVisibility;
}

- (BOOL)isDictating
{
  return self->_dictating;
}

- (TVSSBannerAuthority)bannerAuthority
{
  return self->_bannerAuthority;
}

- (void)setBannerAuthority:(id)a3
{
}

- (BNBannerController)bannerController
{
  return self->_bannerController;
}

- (void)setBannerController:(id)a3
{
}

- (BNBannerSourceListener)bannerSourceListener
{
  return self->_bannerSourceListener;
}

- (void)setBannerSourceListener:(id)a3
{
}

- (TVSSBannerPresenter)presenter
{
  return self->_presenter;
}

- (void)setPresenter:(id)a3
{
}

- (TVSSBannerQueue)bannerQueue
{
  return self->_bannerQueue;
}

- (void)setBannerQueue:(id)a3
{
}

- (NSTimer)interactiveModeSuspensionTimer
{
  return self->_interactiveModeSuspensionTimer;
}

- (void)setInteractiveModeSuspensionTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end