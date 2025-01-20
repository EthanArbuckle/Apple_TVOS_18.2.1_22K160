@interface TVSSBannerBulletinBridgeManager
- (BOOL)_isHomeUIVideoBulletin:(id)a3;
- (BOOL)_isSupportedBulletin:(id)a3;
- (PBSBulletin)activeBulletin;
- (TVHMBannerCameraPresentableViewController)activePresentable;
- (TVSSBannerBulletinBridgeManager)initWithBannerManager:(id)a3 scene:(id)a4;
- (TVSSBannerBulletinBridgeManager)initWithScene:(id)a3;
- (TVSSBannerManager)bannerManager;
- (UIScene)_scene;
- (UIViewController)fullScreenCameraPresenterViewController;
- (id)_actionRespondersForScene:(id)a3;
- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6;
- (id)fullScreenPresenterForBannerCameraViewController:(id)a3;
- (void)_cleanup;
- (void)_handleSendBulletinAction:(id)a3;
- (void)_sendObservingActionWithBulletin:(id)a3 state:(int64_t)a4 reason:(id)a5;
- (void)_setScene:(id)a3;
- (void)_updatePresentable:(id)a3 withBulletin:(id)a4;
- (void)bannerCameraViewController:(id)a3 needsRevocationWithReason:(id)a4;
- (void)bannerCameraViewControllerDidDismissFullScreen:(id)a3;
- (void)bannerCameraViewControllerWillPresentFullScreen:(id)a3;
- (void)presentableDidAppearAsBanner:(id)a3;
- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4;
- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4;
- (void)setActiveBulletin:(id)a3;
- (void)setActivePresentable:(id)a3;
- (void)setBannerManager:(id)a3;
- (void)setFullScreenCameraPresenterViewController:(id)a3;
@end

@implementation TVSSBannerBulletinBridgeManager

- (TVSSBannerBulletinBridgeManager)initWithBannerManager:(id)a3 scene:(id)a4
{
  v34 = self;
  SEL v33 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  id v31 = 0LL;
  objc_storeStrong(&v31, a4);
  if (!location)
  {
    v30 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"bannerManager");
    id v29 = &_os_log_default;
    char v28 = 16;
    if (os_log_type_enabled((os_log_t)v29, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v29;
      os_log_type_t type = v28;
      v18 = NSStringFromSelector(v33);
      v14 = v18;
      v27 = v14;
      v4 = (objc_class *)objc_opt_class(v34);
      v17 = NSStringFromClass(v4);
      v26 = v17;
      sub_10000583C( (uint64_t)v36,  (uint64_t)v14,  (uint64_t)v26,  (uint64_t)v34,  (uint64_t)@"TVSSBannerBulletinBridgeManager.m",  42,  (uint64_t)v30);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v36,  0x3Au);

      objc_storeStrong((id *)&v26, 0LL);
      objc_storeStrong((id *)&v27, 0LL);
    }

    objc_storeStrong(&v29, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v30, "UTF8String"));
    __break(0);
    JUMPOUT(0x10006003CLL);
  }

  if (!v31)
  {
    v25 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"scene");
    id v24 = &_os_log_default;
    char v23 = 16;
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_ERROR))
    {
      v10 = (os_log_s *)v24;
      os_log_type_t v11 = v23;
      v13 = NSStringFromSelector(v33);
      v9 = v13;
      v22 = v9;
      v5 = (objc_class *)objc_opt_class(v34);
      v12 = NSStringFromClass(v5);
      v21 = v12;
      sub_10000583C( (uint64_t)v35,  (uint64_t)v9,  (uint64_t)v21,  (uint64_t)v34,  (uint64_t)@"TVSSBannerBulletinBridgeManager.m",  43,  (uint64_t)v25);
      _os_log_error_impl( (void *)&_mh_execute_header,  v10,  v11,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v35,  0x3Au);

      objc_storeStrong((id *)&v21, 0LL);
      objc_storeStrong((id *)&v22, 0LL);
    }

    objc_storeStrong(&v24, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v25, "UTF8String"));
    __break(0);
    JUMPOUT(0x1000601F0LL);
  }

  v6 = v34;
  v34 = 0LL;
  v20.receiver = v6;
  v20.super_class = (Class)&OBJC_CLASS___TVSSBannerBulletinBridgeManager;
  v34 = -[TVSSBannerBulletinBridgeManager init](&v20, "init");
  objc_storeStrong((id *)&v34, v34);
  if (v34)
  {
    objc_storeWeak((id *)&v34->_scene, v31);
    objc_storeStrong((id *)&v34->_bannerManager, location);
  }

  v8 = v34;
  objc_storeStrong(&v31, 0LL);
  objc_storeStrong(&location, 0LL);
  objc_storeStrong((id *)&v34, 0LL);
  return v8;
}

- (TVSSBannerBulletinBridgeManager)initWithScene:(id)a3
{
  v17 = self;
  SEL v16 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  v14 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Not implemented. Use -initWithBannerManager:scene:");
  os_log_t oslog = &_os_log_default;
  os_log_type_t type = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
  {
    log = oslog;
    os_log_type_t v7 = type;
    v9 = NSStringFromSelector(v16);
    v5 = v9;
    os_log_type_t v11 = v5;
    v3 = (objc_class *)objc_opt_class(v17);
    v8 = NSStringFromClass(v3);
    v10 = v8;
    sub_10000583C( (uint64_t)v18,  (uint64_t)v5,  (uint64_t)v10,  (uint64_t)v17,  (uint64_t)@"TVSSBannerBulletinBridgeManager.m",  61,  (uint64_t)v14);
    _os_log_error_impl( (void *)&_mh_execute_header,  log,  v7,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v18,  0x3Au);

    objc_storeStrong((id *)&v10, 0LL);
    objc_storeStrong((id *)&v11, 0LL);
  }

  objc_storeStrong((id *)&oslog, 0LL);
  _bs_set_crash_log_message(-[NSString UTF8String](v14, "UTF8String"));
  result = (TVSSBannerBulletinBridgeManager *)&v14;
  __break(0);
  return result;
}

- (id)_actionRespondersForScene:(id)a3
{
  v21 = self;
  SEL v20 = a2;
  id location = 0LL;
  objc_storeStrong(&location, a3);
  id v12 = location;
  id WeakRetained = objc_loadWeakRetained((id *)&v21->_scene);
  BOOL v13 = v12 != WeakRetained;

  if (v13)
  {
    v18 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Invalid condition not satisfying: %@",  @"scene == _scene");
    id v17 = &_os_log_default;
    char v16 = 16;
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v17;
      os_log_type_t type = v16;
      os_log_type_t v11 = NSStringFromSelector(v20);
      os_log_type_t v7 = v11;
      v15 = v7;
      v4 = (objc_class *)objc_opt_class(v21);
      v10 = NSStringFromClass(v4);
      v14 = v10;
      sub_10000583C( (uint64_t)v23,  (uint64_t)v7,  (uint64_t)v14,  (uint64_t)v21,  (uint64_t)@"TVSSBannerBulletinBridgeManager.m",  67,  (uint64_t)v18);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@",  v23,  0x3Au);

      objc_storeStrong((id *)&v14, 0LL);
      objc_storeStrong((id *)&v15, 0LL);
    }

    objc_storeStrong(&v17, 0LL);
    _bs_set_crash_log_message(-[NSString UTF8String](v18, "UTF8String"));
    __break(0);
    JUMPOUT(0x10006070CLL);
  }

  v22 = v21;
  v6 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v22, 1LL);
  objc_storeStrong(&location, 0LL);
  return v6;
}

- (id)_respondToActions:(id)a3 forFBSScene:(id)a4 inUIScene:(id)a5 fromTransitionContext:(id)a6
{
  char v28 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v26 = 0LL;
  objc_storeStrong(&v26, a4);
  id v25 = 0LL;
  objc_storeStrong(&v25, a5);
  id v24 = 0LL;
  objc_storeStrong(&v24, a6);
  id v23 = BannerBulletinBridgeManagerLog();
  os_log_type_t v22 = OS_LOG_TYPE_DEBUG;
  if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEBUG))
  {
    sub_10000D28C((uint64_t)v30, (uint64_t)location[0]);
    _os_log_debug_impl( (void *)&_mh_execute_header,  (os_log_t)v23,  v22,  "Responding to scene actions. {actions=%@}",  v30,  0xCu);
  }

  objc_storeStrong(&v23, 0LL);
  id v21 = [location[0] mutableCopy];
  memset(__b, 0, sizeof(__b));
  id v14 = location[0];
  id v15 = [v14 countByEnumeratingWithState:__b objects:v29 count:16];
  if (v15)
  {
    uint64_t v11 = *(void *)__b[2];
    uint64_t v12 = 0LL;
    id v13 = v15;
    while (1)
    {
      uint64_t v10 = v12;
      if (*(void *)__b[2] != v11) {
        objc_enumerationMutation(v14);
      }
      uint64_t v20 = *(void *)(__b[1] + 8 * v12);
      uint64_t v9 = v20;
      uint64_t v6 = objc_opt_class(&OBJC_CLASS___PBSystemUIServiceSendBulletinAction);
      if ((objc_opt_isKindOfClass(v9, v6) & 1) != 0)
      {
        -[TVSSBannerBulletinBridgeManager _handleSendBulletinAction:](v28, "_handleSendBulletinAction:", v20);
        [v21 removeObject:v20];
      }

      ++v12;
      if (v10 + 1 >= (unint64_t)v13)
      {
        uint64_t v12 = 0LL;
        id v13 = [v14 countByEnumeratingWithState:__b objects:v29 count:16];
        if (!v13) {
          break;
        }
      }
    }
  }

  id v8 = v21;
  objc_storeStrong(&v21, 0LL);
  objc_storeStrong(&v24, 0LL);
  objc_storeStrong(&v25, 0LL);
  objc_storeStrong(&v26, 0LL);
  objc_storeStrong(location, 0LL);
  return v8;
}

- (void)presentableDidAppearAsBanner:(id)a3
{
  uint64_t v12 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v10 = BannerBulletinBridgeManagerLog();
  os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v10;
    os_log_type_t type = v9;
    id v7 = (id)BNEffectivePresentableDescription(location[0]);
    id v8 = v7;
    sub_10001AEB8((uint64_t)v13, (uint64_t)v8);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Presentable did appear. {presentable=%{public}@}", v13, 0xCu);

    objc_storeStrong(&v8, 0LL);
  }

  objc_storeStrong(&v10, 0LL);
  v3 = v12;
  v4 = -[TVSSBannerBulletinBridgeManager activeBulletin](v12, "activeBulletin");
  -[TVSSBannerBulletinBridgeManager _sendObservingActionWithBulletin:state:reason:]( v3,  "_sendObservingActionWithBulletin:state:reason:");

  objc_storeStrong(location, 0LL);
}

- (void)presentableDidDisappearAsBanner:(id)a3 withReason:(id)a4
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v13 = 0LL;
  objc_storeStrong(&v13, a4);
  id v12 = BannerBulletinBridgeManagerLog();
  os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v12;
    os_log_type_t type = v11;
    id v8 = (id)BNEffectivePresentableDescription(location[0]);
    id v10 = v8;
    sub_10001AEB8((uint64_t)v16, (uint64_t)v10);
    _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "Presentable did disappear. {presentable=%{public}@}",  v16,  0xCu);

    objc_storeStrong(&v10, 0LL);
  }

  objc_storeStrong(&v12, 0LL);
  v4 = v15;
  v5 = -[TVSSBannerBulletinBridgeManager activeBulletin](v15, "activeBulletin");
  -[TVSSBannerBulletinBridgeManager _sendObservingActionWithBulletin:state:reason:]( v4,  "_sendObservingActionWithBulletin:state:reason:");

  -[TVSSBannerBulletinBridgeManager _cleanup](v15, "_cleanup");
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)presentableWillNotAppearAsBanner:(id)a3 withReason:(id)a4
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v13 = 0LL;
  objc_storeStrong(&v13, a4);
  id v12 = BannerBulletinBridgeManagerLog();
  os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
  {
    log = (os_log_s *)v12;
    os_log_type_t type = v11;
    id v8 = (id)BNEffectivePresentableDescription(location[0]);
    id v10 = v8;
    sub_10001AEB8((uint64_t)v16, (uint64_t)v10);
    _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "Presentable will not appear. {presentable=%{public}@}",  v16,  0xCu);

    objc_storeStrong(&v10, 0LL);
  }

  objc_storeStrong(&v12, 0LL);
  v4 = v15;
  v5 = -[TVSSBannerBulletinBridgeManager activeBulletin](v15, "activeBulletin");
  -[TVSSBannerBulletinBridgeManager _sendObservingActionWithBulletin:state:reason:]( v4,  "_sendObservingActionWithBulletin:state:reason:");

  -[TVSSBannerBulletinBridgeManager _cleanup](v15, "_cleanup");
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)bannerCameraViewController:(id)a3 needsRevocationWithReason:(id)a4
{
  v19 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v17 = 0LL;
  objc_storeStrong(&v17, a4);
  id v16 =  +[TVSSBannerIdentification uniqueIdentificationForPresentable:]( &OBJC_CLASS___TVSSBannerIdentification,  "uniqueIdentificationForPresentable:",  location[0]);
  id v15 = 0LL;
  bannerManager = v19->_bannerManager;
  id v13 = 0LL;
  id v9 =  -[TVSSBannerManager revokePresentablesWithIdentification:reason:animated:error:]( bannerManager,  "revokePresentablesWithIdentification:reason:animated:error:",  v16,  v17,  1LL,  &v13);
  objc_storeStrong(&v15, v13);

  BOOL v14 = v9 != 0LL;
  if (!v9)
  {
    os_log_t oslog = (os_log_t)BannerBulletinBridgeManagerLog();
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v6 = type;
      id v7 = (id)BNEffectivePresentableDescription(location[0]);
      id v10 = v7;
      sub_10002F860((uint64_t)v20, (uint64_t)v10, (uint64_t)v15);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  v6,  "Failed to revoke camera banner. {presentable=%{public}@, error=%{public}@}",  v20,  0x16u);

      objc_storeStrong(&v10, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
  }

  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(&v17, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)fullScreenPresenterForBannerCameraViewController:(id)a3
{
  os_log_type_t v6 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&v6->_fullScreenCameraPresenterViewController);
  objc_storeStrong(location, 0LL);
  return WeakRetained;
}

- (void)bannerCameraViewControllerWillPresentFullScreen:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSBannerManager requestFocusAndRelinquishExternalGestures]( v4->_bannerManager,  "requestFocusAndRelinquishExternalGestures");
  objc_storeStrong(location, 0LL);
}

- (void)bannerCameraViewControllerDidDismissFullScreen:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  -[TVSSBannerManager relinquishFocus](v4->_bannerManager, "relinquishFocus");
  objc_storeStrong(location, 0LL);
}

- (void)_handleSendBulletinAction:(id)a3
{
  v64 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v62 = [location[0] bulletinData];
  id v61 = 0LL;
  uint64_t v3 = objc_opt_class(&OBJC_CLASS___PBSBulletin);
  id v59 = v61;
  id v33 =  +[NSKeyedUnarchiver unarchivedObjectOfClass:fromData:error:]( &OBJC_CLASS___NSKeyedUnarchiver,  "unarchivedObjectOfClass:fromData:error:",  v3,  v62,  &v59);
  objc_storeStrong(&v61, v59);
  id v60 = v33;
  char v57 = 0;
  BOOL v34 = 0;
  if (v33)
  {
    BOOL v34 = 0;
    if (-[TVSSBannerBulletinBridgeManager _isSupportedBulletin:](v64, "_isSupportedBulletin:", v60))
    {
      id v58 = [location[0] requesterIdentifier];
      char v57 = 1;
      BOOL v34 = v58 != 0LL;
    }
  }

  if ((v57 & 1) != 0) {

  }
  if (v34)
  {
    id v32 = [v60 identifier];
    id v31 = [location[0] requesterIdentifier];
    id v56 =  +[TVSSBannerIdentification identificationWithRequesterIdentifier:requestIdentifier:]( &OBJC_CLASS___TVSSBannerIdentification,  "identificationWithRequesterIdentifier:requestIdentifier:",  v32);

    id v55 = -[TVSSBannerBulletinBridgeManager activePresentable](v64, "activePresentable");
    if (v55)
    {
      os_log_t v41 = (os_log_t)BannerBulletinBridgeManagerLog();
      os_log_type_t v40 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        id v17 = v41;
        os_log_type_t v18 = v40;
        id v19 = [v60 identifier];
        id v39 = v19;
        sub_100061BC8((uint64_t)v66, (uint64_t)v39, (uint64_t)v60);
        _os_log_impl( (void *)&_mh_execute_header,  v17,  v18,  "Updating existing presentable for bulletin. {bulletinIdentifier=%{public}@, bulletin=%@}",  v66,  0x16u);

        objc_storeStrong(&v39, 0LL);
      }

      objc_storeStrong((id *)&v41, 0LL);
      id v15 = [v60 identifier];
      BOOL v14 = -[TVSSBannerBulletinBridgeManager activeBulletin](v64, "activeBulletin");
      id v13 = -[PBSBulletin identifier](v14, "identifier");
      unsigned __int8 v16 = objc_msgSend(v15, "isEqualToString:");

      if ((v16 & 1) == 0)
      {
        os_log_type_t v11 = v64;
        id v12 = -[TVSSBannerBulletinBridgeManager activeBulletin](v64, "activeBulletin");
        -[TVSSBannerBulletinBridgeManager _sendObservingActionWithBulletin:state:reason:]( v11,  "_sendObservingActionWithBulletin:state:reason:");
      }

      -[TVSSBannerBulletinBridgeManager setActiveBulletin:](v64, "setActiveBulletin:", v60);
      -[TVSSBannerBulletinBridgeManager _updatePresentable:withBulletin:]( v64,  "_updatePresentable:withBulletin:",  v55,  v60);
      id v38 = objc_msgSend( [PBSystemUIServiceSendBulletinActionResponse alloc],  "initWithResult:error:",  1);
      [location[0] sendResponse:v38];
      objc_storeStrong(&v38, 0LL);
    }

    else
    {
      id v54 = BannerBulletinBridgeManagerLog();
      os_log_type_t v53 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v54, OS_LOG_TYPE_DEFAULT))
      {
        log = (os_log_s *)v54;
        os_log_type_t type = v53;
        id v30 = [v60 identifier];
        id v52 = v30;
        sub_100061BC8((uint64_t)v68, (uint64_t)v52, (uint64_t)v60);
        _os_log_impl( (void *)&_mh_execute_header,  log,  type,  "Creating new presentable for bulletin. {bulletinIdentifier=%{public}@, bulletin=%@}",  v68,  0x16u);

        objc_storeStrong(&v52, 0LL);
      }

      objc_storeStrong(&v54, 0LL);
      id v24 = objc_alloc(&OBJC_CLASS___TVHMBannerCameraPresentableViewController);
      id v26 = [v56 requestIdentifier];
      id v25 = [v56 requesterIdentifier];
      v4 = -[TVHMBannerCameraPresentableViewController initWithRequestIdentifier:requesterIdentifier:]( v24,  "initWithRequestIdentifier:requesterIdentifier:",  v26);
      id v5 = v55;
      id v55 = v4;

      -[TVSSBannerBulletinBridgeManager _updatePresentable:withBulletin:]( v64,  "_updatePresentable:withBulletin:",  v55,  v60);
      -[TVSSBannerBulletinBridgeManager setActivePresentable:](v64, "setActivePresentable:", v55);
      -[TVSSBannerBulletinBridgeManager setActiveBulletin:](v64, "setActiveBulletin:", v60);
      [v55 setDelegate:v64];
      os_log_type_t v6 = objc_alloc(&OBJC_CLASS___TVSSBannerInternalPresentableViewController);
      id v51 = -[TVSSBannerInternalPresentableViewController initWithContentViewController:]( v6,  "initWithContentViewController:",  v55);
      [v51 addPresentableObserver:v64];
      id v27 = [location[0] presentableUserInfo];
      id v50 = [v27 mutableCopy];

      if (-[TVSSBannerBulletinBridgeManager _isHomeUIVideoBulletin:](v64, "_isHomeUIVideoBulletin:", v60))
      {
        [v50 setObject:&off_1001C89F0 forKeyedSubscript:TVSPBannerPresentableKeyTimeout];
        [v50 setObject:&__kCFBooleanFalse forKeyedSubscript:TVSPBannerPresentableKeyAutoDismissOnAction];
      }

      id v49 = 0LL;
      bannerManager = v64->_bannerManager;
      id obj = 0LL;
      uint64_t v23 = -[TVSSBannerManager postPresentable:options:userInfo:error:]( bannerManager,  "postPresentable:options:userInfo:error:",  v51);
      objc_storeStrong(&v49, 0LL);
      uint64_t v8 = HIDWORD(v23);
      char v48 = v23 & 1;
      if ((v23 & 1) != 0) {
        uint64_t v8 = 1LL;
      }
      uint64_t v46 = v8;
      if ((v48 & 1) == 0)
      {
        os_log_t oslog = (os_log_t)BannerBulletinBridgeManagerLog();
        os_log_type_t v44 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          uint64_t v20 = oslog;
          os_log_type_t v21 = v44;
          id v22 = (id)BNEffectivePresentableDescription(v55);
          id v43 = v22;
          sub_100061C1C((uint64_t)v67, (uint64_t)v43, (uint64_t)location[0], (uint64_t)v49);
          _os_log_error_impl( (void *)&_mh_execute_header,  v20,  v21,  "Failed to post presentable for send bulletin action. {presentable=%{public}@, action=%@, error=%{public}@}",  v67,  0x20u);

          objc_storeStrong(&v43, 0LL);
        }

        objc_storeStrong((id *)&oslog, 0LL);
        -[TVSSBannerBulletinBridgeManager _cleanup](v64, "_cleanup");
      }

      id v9 = objc_alloc(&OBJC_CLASS___PBSystemUIServiceSendBulletinActionResponse);
      id v42 = [v9 initWithResult:v46 error:v49];
      [location[0] sendResponse:v42];
      objc_storeStrong(&v42, 0LL);
      objc_storeStrong(&v49, 0LL);
      objc_storeStrong(&v50, 0LL);
      objc_storeStrong(&v51, 0LL);
    }

    objc_storeStrong(&v55, 0LL);
    objc_storeStrong(&v56, 0LL);
  }

  else
  {
    os_log_t v37 = (os_log_t)BannerBulletinBridgeManagerLog();
    os_log_type_t v36 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      sub_100061C88((uint64_t)v65, (uint64_t)location[0], (uint64_t)v62, (uint64_t)v61);
      _os_log_error_impl( (void *)&_mh_execute_header,  v37,  v36,  "Missing or invalid bulletin from send bulletin action. {action=%@, bulletinData=%p, error=%{public}@}",  v65,  0x20u);
    }

    objc_storeStrong((id *)&v37, 0LL);
    id v10 = objc_alloc(&OBJC_CLASS___PBSystemUIServiceSendBulletinActionResponse);
    id v35 = [v10 initWithResult:0 error:v61];
    [location[0] sendResponse:v35];
    objc_storeStrong(&v35, 0LL);
  }

  objc_storeStrong(&v60, 0LL);
  objc_storeStrong(&v61, 0LL);
  objc_storeStrong(&v62, 0LL);
  objc_storeStrong(location, 0LL);
}

- (BOOL)_isSupportedBulletin:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v12 = [location[0] identifier];
  char v19 = 0;
  unsigned __int8 v13 = 0;
  if (v12)
  {
    id v20 = [location[0] viewControllerClassName];
    char v19 = 1;
    unsigned __int8 v13 = [v20 isEqual:PBSVideoSystemBulletinViewControllerClassName];
  }

  if ((v19 & 1) != 0) {

  }
  char v21 = v13 & 1;
  if ((v13 & 1) == 0)
  {
    id v18 = BannerBulletinBridgeManagerLog();
    char v17 = 16;
    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v18;
      os_log_type_t type = v17;
      id v11 = [location[0] identifier];
      id v5 = v11;
      id v16 = v5;
      id v10 = [location[0] viewControllerClassName];
      id v6 = v10;
      id v15 = v6;
      id v9 = [location[0] serviceIdentifier];
      id v14 = v9;
      sub_100061F9C((uint64_t)v23, (uint64_t)v5, (uint64_t)v6, (uint64_t)v14, (uint64_t)location[0]);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "Received unsupported bulletin. {bulletinIdentifier=%{public}@, viewControllerClassName=%{public}@, serviceIdenti fier=%{public}@, bulletin=%@}",  v23,  0x2Au);

      objc_storeStrong(&v14, 0LL);
      objc_storeStrong(&v15, 0LL);
      objc_storeStrong(&v16, 0LL);
    }

    objc_storeStrong(&v18, 0LL);
  }

  char v4 = v21;
  objc_storeStrong(location, 0LL);
  return v4 & 1;
}

- (void)_updatePresentable:(id)a3 withBulletin:(id)a4
{
  id v20 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v18 = 0LL;
  objc_storeStrong(&v18, a4);
  if (-[TVSSBannerBulletinBridgeManager _isHomeUIVideoBulletin:](v20, "_isHomeUIVideoBulletin:", v18))
  {
    id v11 = (id)TVHMBannerConfigurationForBulletin(v18);
    objc_msgSend(location[0], "setConfiguration:");
  }

  else
  {
    id v17 = BannerBulletinBridgeManagerLog();
    char v16 = 17;
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_FAULT))
    {
      log = (os_log_s *)v17;
      os_log_type_t type = v16;
      id v10 = [v18 identifier];
      id v4 = v10;
      id v15 = v4;
      id v9 = [v18 viewControllerClassName];
      id v5 = v9;
      id v14 = v5;
      id v8 = [v18 serviceIdentifier];
      id v13 = v8;
      sub_100061F9C((uint64_t)v21, (uint64_t)v4, (uint64_t)v5, (uint64_t)v13, (uint64_t)v18);
      _os_log_fault_impl( (void *)&_mh_execute_header,  log,  type,  "Attempt to update presentable with unknown bulletin. {bulletinIdentifier=%{public}@, viewControllerClassName=%{p ublic}@, serviceIdentifier=%{public}@, bulletin=%@}",  v21,  0x2Au);

      objc_storeStrong(&v13, 0LL);
      objc_storeStrong(&v14, 0LL);
      objc_storeStrong(&v15, 0LL);
    }

    objc_storeStrong(&v17, 0LL);
  }

  objc_storeStrong(&v18, 0LL);
  objc_storeStrong(location, 0LL);
}

- (BOOL)_isHomeUIVideoBulletin:(id)a3
{
  id location[2] = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 = [location[0] viewControllerClassName];
  unsigned __int8 v5 = [v4 isEqual:PBSVideoSystemBulletinViewControllerClassName];

  objc_storeStrong(location, 0LL);
  return v5 & 1;
}

- (void)_cleanup
{
  v2 = -[TVSSBannerBulletinBridgeManager activePresentable](self, "activePresentable");
  -[TVHMBannerCameraPresentableViewController setDelegate:](v2, "setDelegate:");

  -[TVSSBannerBulletinBridgeManager setActivePresentable:](self, "setActivePresentable:", 0LL);
  -[TVSSBannerBulletinBridgeManager setActiveBulletin:](self, "setActiveBulletin:", 0LL);
}

- (void)_sendObservingActionWithBulletin:(id)a3 state:(int64_t)a4 reason:(id)a5
{
  id v25 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  int64_t v23 = a4;
  id v22 = 0LL;
  objc_storeStrong(&v22, a5);
  if (location[0])
  {
    id v21 = 0LL;
    id v19 = 0LL;
    id v12 =  +[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:]( &OBJC_CLASS___NSKeyedArchiver,  "archivedDataWithRootObject:requiringSecureCoding:error:",  location[0],  1LL,  &v19);
    objc_storeStrong(&v21, v19);
    id v20 = v12;
    if (v12)
    {
      id v5 = objc_alloc(&OBJC_CLASS___PBSystemUIServiceBulletinObservingAction);
      id v18 = objc_msgSend(v5, "initWithBulletinData:state:reason:", v20, v23);
      id WeakRetained = objc_loadWeakRetained((id *)&v25->_scene);
      id v10 = [WeakRetained _FBSScene];
      id v9 = +[NSSet setWithObject:](&OBJC_CLASS___NSSet, "setWithObject:", v18);
      objc_msgSend(v10, "sendActions:");

      objc_storeStrong(&v18, 0LL);
    }

    else
    {
      id v17 = BannerBulletinBridgeManagerLog();
      char v16 = 16;
      if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR))
      {
        log = (os_log_s *)v17;
        os_log_type_t type = v16;
        id v8 = [location[0] identifier];
        id v15 = v8;
        sub_10002F860((uint64_t)v26, (uint64_t)v15, (uint64_t)v21);
        _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "Failed to send bulletin observing action, error archiving bulletin. {bulletinIdentifier=%{public}@, error=%{public}@}",  v26,  0x16u);

        objc_storeStrong(&v15, 0LL);
      }

      objc_storeStrong(&v17, 0LL);
    }

    objc_storeStrong(&v20, 0LL);
    objc_storeStrong(&v21, 0LL);
  }

  objc_storeStrong(&v22, 0LL);
  objc_storeStrong(location, 0LL);
}

- (UIScene)_scene
{
  return (UIScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (void)_setScene:(id)a3
{
}

- (UIViewController)fullScreenCameraPresenterViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_fullScreenCameraPresenterViewController);
}

- (void)setFullScreenCameraPresenterViewController:(id)a3
{
}

- (TVSSBannerManager)bannerManager
{
  return self->_bannerManager;
}

- (void)setBannerManager:(id)a3
{
}

- (PBSBulletin)activeBulletin
{
  return self->_activeBulletin;
}

- (void)setActiveBulletin:(id)a3
{
}

- (TVHMBannerCameraPresentableViewController)activePresentable
{
  return self->_activePresentable;
}

- (void)setActivePresentable:(id)a3
{
}

- (void).cxx_destruct
{
}

@end