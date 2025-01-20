@interface TVSSMenuDataSourceControllerOverlord
- (NSSet)controllers;
- (NSString)debugDescription;
- (NSString)description;
- (TVSSDoNotDisturbController)doNotDisturbController;
- (TVSSMenuDataSourceControllerOverlord)initWithMenuModeController:(id)a3 privacyController:(id)a4 doNotDisturbController:(id)a5 nowPlayingController:(id)a6;
- (TVSSMenuModeController)menuModeController;
- (TVSSPrivacyController)privacyController;
- (id)_interactiveProviderForIdentifier:(id)a3;
- (id)controllerForMode:(unint64_t)a3;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)stateDumpBuilder;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)_updateActiveModeAwareProviders;
- (void)dealloc;
- (void)dismissBannerWithPresentable:(id)a3 bannerContext:(id)a4;
- (void)menuModeControllerModeDidChange:(id)a3 withTransitionContext:(id)a4;
- (void)presentBannerWithPresentable:(id)a3 bannerContext:(id)a4;
@end

@implementation TVSSMenuDataSourceControllerOverlord

- (TVSSMenuDataSourceControllerOverlord)initWithMenuModeController:(id)a3 privacyController:(id)a4 doNotDisturbController:(id)a5 nowPlayingController:(id)a6
{
  id v104 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v102 = 0LL;
  objc_storeStrong(&v102, a4);
  id v101 = 0LL;
  objc_storeStrong(&v101, a5);
  id v100 = 0LL;
  objc_storeStrong(&v100, a6);
  id v6 = v104;
  id v104 = 0LL;
  v99.receiver = v6;
  v99.super_class = (Class)&OBJC_CLASS___TVSSMenuDataSourceControllerOverlord;
  id v104 = -[TVSSMenuDataSourceControllerOverlord init](&v99, "init");
  objc_storeStrong(&v104, v104);
  if (v104)
  {
    id v98 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    objc_storeStrong((id *)v104 + 16, location[0]);
    [*((id *)v104 + 16) addControllerObserver:v104];
    objc_storeStrong((id *)v104 + 17, v102);
    objc_storeStrong((id *)v104 + 4, v101);
    objc_storeStrong((id *)v104 + 1, v100);
    v63 = (void *)*((void *)v104 + 1);
    aClass = (objc_class *)objc_opt_class(v104);
    v62 = NSStringFromClass(aClass);
    v61 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ - %p", v62, v104);
    objc_msgSend(v63, "addActivationReason:");

    v60 = objc_alloc_init(&OBJC_CLASS___TVSSBluetoothRemoteController);
    v7 = (void *)*((void *)v104 + 2);
    *((void *)v104 + 2) = v60;

    v59 = objc_alloc_init(&OBJC_CLASS___TVSSHomeKitController);
    v8 = (void *)*((void *)v104 + 5);
    *((void *)v104 + 5) = v59;

    v58 = objc_alloc_init(&OBJC_CLASS___TVSSSensorActivityController);
    v9 = (void *)*((void *)v104 + 6);
    *((void *)v104 + 6) = v58;

    v57 = objc_alloc(&OBJC_CLASS___TVSSSleepTimerController);
    v56 = -[TVSSSleepTimerController initWithMenuModeController:](v57, "initWithMenuModeController:", location[0]);
    v10 = (void *)*((void *)v104 + 7);
    *((void *)v104 + 7) = v56;

    v55 = objc_alloc_init(&OBJC_CLASS___TVSSSystemOutputDeviceRouteController);
    v11 = (void *)*((void *)v104 + 8);
    *((void *)v104 + 8) = v55;

    v54 = objc_alloc_init(&OBJC_CLASS___TVSSNetworkController);
    v12 = (void *)*((void *)v104 + 9);
    *((void *)v104 + 9) = v54;

    v53 = objc_alloc(&OBJC_CLASS___TVSSCriticalInfoController);
    v52 = -[TVSSCriticalInfoController initWithBluetoothRemoteController:sensorActivityController:]( v53,  "initWithBluetoothRemoteController:sensorActivityController:",  *((void *)v104 + 2),  *((void *)v104 + 6));
    v13 = (void *)*((void *)v104 + 3);
    *((void *)v104 + 3) = v52;

    v51 = objc_alloc(&OBJC_CLASS___TVSSNowPlayingMenuItemProvider);
    v50 = -[TVSSNowPlayingMenuItemProvider initWithAudioNowPlayingController:outputDeviceRouteController:initialMode:]( v51,  "initWithAudioNowPlayingController:outputDeviceRouteController:initialMode:",  *((void *)v104 + 1),  *((void *)v104 + 8),  [location[0] mode]);
    v14 = (void *)*((void *)v104 + 10);
    *((void *)v104 + 10) = v50;

    id v97 = objc_alloc_init(&OBJC_CLASS___TVSSClockItemProvider);
    v49 = objc_alloc(&OBJC_CLASS___TVSSHeadphonesMenuItemProvider);
    v48 = -[TVSSHeadphonesMenuItemProvider initWithSystemOutputDeviceRouteController:audioNowPlayingController:menuModeController:]( v49,  "initWithSystemOutputDeviceRouteController:audioNowPlayingController:menuModeController:",  *((void *)v104 + 8),  *((void *)v104 + 1),  location[0]);
    v15 = (void *)*((void *)v104 + 13);
    *((void *)v104 + 13) = v48;

    v47 = objc_alloc(&OBJC_CLASS___TVSSVPNMenuItemProvider);
    id v96 = -[TVSSVPNMenuItemProvider initWithNetworkController:]( v47,  "initWithNetworkController:",  *((void *)v104 + 9));
    id v95 = objc_alloc_init(&OBJC_CLASS___TVSSCurrentUserMenuItemProvider);
    v46 = objc_alloc(&OBJC_CLASS___TVSSControlCenterMenuItemProvider);
    id v94 = -[TVSSControlCenterMenuItemProvider initWithSleepTimerController:criticalInfoController:systemOutputDeviceRouteController:]( v46,  "initWithSleepTimerController:criticalInfoController:systemOutputDeviceRouteController:",  *((void *)v104 + 7),  *((void *)v104 + 3),  *((void *)v104 + 8));
    id v45 = -[TVSSFaceTimeMenuItemProvider initForPrivacyPlus:]( objc_alloc(&OBJC_CLASS___TVSSFaceTimeMenuItemProvider),  "initForPrivacyPlus:",  0LL);
    v16 = (void *)*((void *)v104 + 11);
    *((void *)v104 + 11) = v45;

    id v44 = -[TVSSFaceTimeMenuItemProvider initForPrivacyPlus:]( objc_alloc(&OBJC_CLASS___TVSSFaceTimeMenuItemProvider),  "initForPrivacyPlus:",  1LL);
    v17 = (void *)*((void *)v104 + 12);
    *((void *)v104 + 12) = v44;

    id v93 = objc_alloc_init(&OBJC_CLASS___TVSSVideoMicMenuItemProvider);
    v43 = objc_alloc(&OBJC_CLASS___TVSSPrivacyMenuItemProvider);
    id v92 = -[TVSSPrivacyMenuItemProvider initWithPrivacyController:]( v43,  "initWithPrivacyController:",  *((void *)v104 + 17));
    v91[1] = (id)3;
    v42 = objc_alloc(&OBJC_CLASS___TVSSHomeKitMenuItemProvider);
    v91[0] = -[TVSSHomeKitMenuItemProvider initWithHomeKitController:]( v42,  "initWithHomeKitController:",  *((void *)v104 + 5));
    v41 = objc_alloc(&OBJC_CLASS___TVSSMenuDataSourceController);
    v108[0] = v97;
    v108[1] = v96;
    v108[2] = *((void *)v104 + 13);
    v108[3] = *((void *)v104 + 10);
    v108[4] = *((void *)v104 + 11);
    v108[5] = v93;
    v108[6] = v91[0];
    v108[7] = v94;
    v108[8] = v95;
    v40 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v108, 9LL);
    id v90 = -[TVSSMenuDataSourceController initWithMode:providers:](v41, "initWithMode:providers:", 3LL);

    [v98 setObject:v90 forKeyedSubscript:&off_1001C8D20];
    objc_storeStrong(&v90, 0LL);
    objc_storeStrong(v91, 0LL);
    v89[1] = (id)2;
    v39 = objc_alloc(&OBJC_CLASS___TVSSNetworkStateMenuItemProvider);
    v89[0] = -[TVSSNetworkStateMenuItemProvider initWithNetworkController:]( v39,  "initWithNetworkController:",  *((void *)v104 + 9));
    v38 = objc_alloc(&OBJC_CLASS___TVSSPassiveVPNMenuItemProvider);
    id v88 = -[TVSSPassiveVPNMenuItemProvider initWithNetworkController:]( v38,  "initWithNetworkController:",  *((void *)v104 + 9));
    id v87 = objc_alloc_init(&OBJC_CLASS___TVSSPeripheralsMenuItemProvider);
    v37 = objc_alloc(&OBJC_CLASS___TVSSPassiveNowPlayingMenuItemProvider);
    id v86 = -[TVSSPassiveNowPlayingMenuItemProvider initWithNowPlayingProvider:audioNowPlayingController:]( v37,  "initWithNowPlayingProvider:audioNowPlayingController:",  *((void *)v104 + 10),  *((void *)v104 + 1));
    v36 = objc_alloc(&OBJC_CLASS___TVSSSleepTimerMenuItemProvider);
    id v85 = -[TVSSSleepTimerMenuItemProvider initWithSleepTimerController:]( v36,  "initWithSleepTimerController:",  *((void *)v104 + 7));
    id v84 = objc_alloc_init(&OBJC_CLASS___TVSSRestrictionsMenuItemProvider);
    v35 = objc_alloc(&OBJC_CLASS___TVSSStatusMenuItemProvider);
    id v83 = -[TVSSStatusMenuItemProvider initWithDoNotDisturbController:bluetoothRemoteController:sensorActivityController:]( v35,  "initWithDoNotDisturbController:bluetoothRemoteController:sensorActivityController:",  *((void *)v104 + 4),  *((void *)v104 + 2),  *((void *)v104 + 6));
    v34 = objc_alloc(&OBJC_CLASS___NSMutableArray);
    v107[0] = v97;
    v107[1] = v89[0];
    v107[2] = v88;
    v107[3] = v87;
    v107[4] = *((void *)v104 + 13);
    v107[5] = v86;
    v107[6] = v85;
    v107[7] = v84;
    v107[8] = *((void *)v104 + 11);
    v107[9] = v93;
    v107[10] = v83;
    v107[11] = v92;
    v107[12] = v95;
    v33 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v107, 13LL);
    id v82 = -[NSMutableArray initWithArray:](v34, "initWithArray:");

    if ((TVSSDebugIncludeExampleProviderInPassiveModeEnabled() & 1) != 0)
    {
      id v81 = objc_alloc_init(&OBJC_CLASS___TVSSExampleMenuItemProvider);
      objc_msgSend(v82, "insertObject:atIndex:", v81, (char *)objc_msgSend(v82, "count") - 1);
      objc_storeStrong(&v81, 0LL);
    }

    v32 = objc_alloc(&OBJC_CLASS___TVSSMenuDataSourceController);
    id v80 = -[TVSSMenuDataSourceController initWithMode:providers:](v32, "initWithMode:providers:", 2LL, v82);
    [v98 setObject:v80 forKeyedSubscript:&off_1001C8D38];
    objc_storeStrong(&v80, 0LL);
    objc_storeStrong(&v82, 0LL);
    objc_storeStrong(&v83, 0LL);
    objc_storeStrong(&v84, 0LL);
    objc_storeStrong(&v85, 0LL);
    objc_storeStrong(&v86, 0LL);
    objc_storeStrong(&v87, 0LL);
    objc_storeStrong(&v88, 0LL);
    objc_storeStrong(v89, 0LL);
    v79[1] = (id)5;
    v31 = objc_alloc(&OBJC_CLASS___TVSSMenuDataSourceController);
    v106[0] = *((void *)v104 + 12);
    v106[1] = v92;
    v30 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v106, 2LL);
    v79[0] = -[TVSSMenuDataSourceController initWithMode:providers:](v31, "initWithMode:providers:", 5LL);

    [v98 setObject:v79[0] forKeyedSubscript:&off_1001C8D50];
    objc_storeStrong(v79, 0LL);
    v78[1] = (id)4;
    v29 = objc_alloc(&OBJC_CLASS___TVSSMenuDataSourceController);
    id v105 = v92;
    v28 = +[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v105, 1LL);
    v78[0] = -[TVSSMenuDataSourceController initWithMode:providers:](v29, "initWithMode:providers:", 4LL);

    [v98 setObject:v78[0] forKeyedSubscript:&off_1001C8D68];
    objc_storeStrong(v78, 0LL);
    v77[1] = 0LL;
    v77[0] = -[TVSSMenuDataSourceController initWithMode:providers:]( objc_alloc(&OBJC_CLASS___TVSSMenuDataSourceController),  "initWithMode:providers:",  0LL,  &__NSArray0__struct);
    [v98 setObject:v77[0] forKeyedSubscript:&off_1001C8D80];
    objc_storeStrong(v77, 0LL);
    v76[1] = (id)1;
    v76[0] = -[TVSSMenuDataSourceController initWithMode:providers:]( objc_alloc(&OBJC_CLASS___TVSSMenuDataSourceController),  "initWithMode:providers:",  1LL,  &__NSArray0__struct);
    [v98 setObject:v76[0] forKeyedSubscript:&off_1001C8D98];
    objc_storeStrong(v76, 0LL);
    id v27 = [v98 copy];
    v18 = (void *)*((void *)v104 + 14);
    *((void *)v104 + 14) = v27;

    objc_initWeak(&from, v104);
    v26 = (objc_class *)objc_opt_class(v104);
    v25 = NSStringFromClass(v26);
    id v74 =  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"TVSystemUIService - %@",  v25);

    v23 = &_dispatch_main_q;
    id v24 = v74;
    v68 = _NSConcreteStackBlock;
    int v69 = -1073741824;
    int v70 = 0;
    v71 = sub_10010FEE0;
    v72 = &unk_1001B6330;
    objc_copyWeak(&v73, &from);
    id v19 = (id)BSLogAddStateCaptureBlockForUserRequestsOnlyWithTitle(v23, v24, &v68);
    v20 = (void *)*((void *)v104 + 15);
    *((void *)v104 + 15) = v19;

    objc_destroyWeak(&v73);
    objc_storeStrong(&v74, 0LL);
    objc_destroyWeak(&from);
    objc_storeStrong(&v92, 0LL);
    objc_storeStrong(&v93, 0LL);
    objc_storeStrong(&v94, 0LL);
    objc_storeStrong(&v95, 0LL);
    objc_storeStrong(&v96, 0LL);
    objc_storeStrong(&v97, 0LL);
    objc_storeStrong(&v98, 0LL);
  }

  v22 = (TVSSMenuDataSourceControllerOverlord *)v104;
  objc_storeStrong(&v100, 0LL);
  objc_storeStrong(&v101, 0LL);
  objc_storeStrong(&v102, 0LL);
  objc_storeStrong(location, 0LL);
  objc_storeStrong(&v104, 0LL);
  return v22;
}

- (void)dealloc
{
  v8 = self;
  SEL v7 = a2;
  audioNowPlayingController = self->_audioNowPlayingController;
  v2 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v2);
  v4 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ - %p", v5, v8);
  -[TVSSAudioNowPlayingController removeActivationReason:](audioNowPlayingController, "removeActivationReason:");

  -[TVSSMenuModeController removeControllerObserver:](v8->_menuModeController, "removeControllerObserver:", v8);
  -[BSInvalidatable invalidate](v8->_stateCaptureHandle, "invalidate");
  objc_storeStrong((id *)&v8->_stateCaptureHandle, 0LL);
  v6.receiver = v8;
  v6.super_class = (Class)&OBJC_CLASS___TVSSMenuDataSourceControllerOverlord;
  -[TVSSMenuDataSourceControllerOverlord dealloc](&v6, "dealloc");
}

- (NSSet)controllers
{
  v3 = -[NSDictionary allValues](self->_dataSourceControllerByMenuMode, "allValues");
  v4 = +[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:");

  return v4;
}

- (id)controllerForMode:(unint64_t)a3
{
  dataSourceControllerByMenuMode = self->_dataSourceControllerByMenuMode;
  v5 = +[NSNumber numberWithUnsignedInteger:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInteger:", a3);
  id v6 = -[NSDictionary objectForKey:](dataSourceControllerByMenuMode, "objectForKey:");

  return v6;
}

- (void)presentBannerWithPresentable:(id)a3 bannerContext:(id)a4
{
  v16 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v14 = 0LL;
  objc_storeStrong(&v14, a4);
  id v13 = [location[0] targetProviderIdentifier];
  id v12 =  -[TVSSMenuDataSourceControllerOverlord _interactiveProviderForIdentifier:]( v16,  "_interactiveProviderForIdentifier:",  v13);
  if (v12)
  {
    [location[0] presentableWillAppearAsBanner:location[0]];
    [v12 presentBannerWithPresentable:location[0]];
    [location[0] presentableDidAppearAsBanner:location[0]];
  }

  else
  {
    id v11 = BannerOverlordRoutingLog();
    char v10 = 16;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
    {
      log = (os_log_s *)v11;
      os_log_type_t type = v10;
      id v7 = (id)BNEffectivePresentableDescription(location[0]);
      id v9 = v7;
      sub_10002F860((uint64_t)v17, (uint64_t)v9, (uint64_t)v13);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  type,  "Attempted to present banner as menu item without target provider. {presentable=%{public}@, targetProviderIdentifier=%{public}@}",  v17,  0x16u);

      objc_storeStrong(&v9, 0LL);
    }

    objc_storeStrong(&v11, 0LL);
    [location[0] presentableWillNotAppearAsBanner:location[0] withReason:@"TVSSBannerRejectionReasonNoTargetProvider"];
  }

  id v4 = [v14 transitionObserver];
  [v4 menuModeBannerContextDidCompleteTransition:v14];

  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)dismissBannerWithPresentable:(id)a3 bannerContext:(id)a4
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v15 = 0LL;
  objc_storeStrong(&v15, a4);
  id v14 = [v15 dismissalReason];
  id v13 = [location[0] targetProviderIdentifier];
  id v12 =  -[TVSSMenuDataSourceControllerOverlord _interactiveProviderForIdentifier:]( v17,  "_interactiveProviderForIdentifier:",  v13);
  if (v12)
  {
    [location[0] presentableWillDisappearAsBanner:location[0] withReason:v14];
    [v12 dismissBannerWithPresentable:location[0]];
    [location[0] presentableDidDisappearAsBanner:location[0] withReason:v14];
  }

  else
  {
    os_log_t oslog = (os_log_t)BannerOverlordRoutingLog();
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      log = oslog;
      os_log_type_t v6 = type;
      id v7 = (id)BNEffectivePresentableDescription(location[0]);
      id v9 = v7;
      sub_10002F860((uint64_t)v18, (uint64_t)v9, (uint64_t)v13);
      _os_log_error_impl( (void *)&_mh_execute_header,  log,  v6,  "Attempted to dismiss banner from menu item without target provider. {presentable=%{public}@, targetProviderIdent ifier=%{public}@}",  v18,  0x16u);

      objc_storeStrong(&v9, 0LL);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    [location[0] presentableDidDisappearAsBanner:location[0] withReason:v14];
  }

  id v4 = [v15 transitionObserver];
  [v4 menuModeBannerContextDidCompleteTransition:v15];

  objc_storeStrong(&v12, 0LL);
  objc_storeStrong(&v13, 0LL);
  objc_storeStrong(&v14, 0LL);
  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(location, 0LL);
}

- (id)_interactiveProviderForIdentifier:(id)a3
{
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v16 = -[TVSSMenuDataSourceControllerOverlord controllerForMode:](v18, "controllerForMode:", 3LL);
  id v15 = [v16 providers];
  memset(__b, 0, sizeof(__b));
  id obj = v15;
  id v9 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
  if (v9)
  {
    uint64_t v5 = *(void *)__b[2];
    uint64_t v6 = 0LL;
    id v7 = v9;
    while (1)
    {
      uint64_t v4 = v6;
      if (*(void *)__b[2] != v5) {
        objc_enumerationMutation(obj);
      }
      id v14 = *(id *)(__b[1] + 8 * v6);
      id v12 = [v14 identifier];
      if ([v12 isEqual:location[0]])
      {
        id v19 = v14;
        int v11 = 1;
      }

      else
      {
        int v11 = 0;
      }

      objc_storeStrong(&v12, 0LL);
      if (v11) {
        break;
      }
      ++v6;
      if (v4 + 1 >= (unint64_t)v7)
      {
        uint64_t v6 = 0LL;
        id v7 = [obj countByEnumeratingWithState:__b objects:v21 count:16];
        if (!v7) {
          goto LABEL_11;
        }
      }
    }
  }

  else
  {
LABEL_11:
    int v11 = 0;
  }

  if (!v11)
  {
    os_log_t oslog = (os_log_t)BannerOverlordRoutingLog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_10001AEB8((uint64_t)v20, (uint64_t)location[0]);
      _os_log_impl( (void *)&_mh_execute_header,  oslog,  OS_LOG_TYPE_DEFAULT,  "Unable to find provider with identifier '%{public}@'",  v20,  0xCu);
    }

    objc_storeStrong((id *)&oslog, 0LL);
    id v19 = 0LL;
    int v11 = 1;
  }

  objc_storeStrong(&v15, 0LL);
  objc_storeStrong(&v16, 0LL);
  objc_storeStrong(location, 0LL);
  return v19;
}

- (void)menuModeControllerModeDidChange:(id)a3 withTransitionContext:(id)a4
{
  id v13 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v11 = 0LL;
  objc_storeStrong(&v11, a4);
  -[TVSSMenuDataSourceControllerOverlord _updateActiveModeAwareProviders](v13, "_updateActiveModeAwareProviders");
  id v10 = [location[0] mode];
  id v9 = [location[0] bannerContext];
  id v8 = [v9 transitioningBannerPresentable];
  id v7 = [v9 bannerPresentationState];
  BOOL v6 = 1;
  if (v7 != (id)1) {
    BOOL v6 = v7 == (id)3;
  }
  BOOL v4 = 0;
  if (v10 == (id)3)
  {
    BOOL v4 = 0;
  }

  if (v4)
  {
    if (v7 == (id)1)
    {
      -[TVSSMenuDataSourceControllerOverlord presentBannerWithPresentable:bannerContext:]( v13,  "presentBannerWithPresentable:bannerContext:",  v8,  v9);
    }

    else if (v7 == (id)3)
    {
      -[TVSSMenuDataSourceControllerOverlord dismissBannerWithPresentable:bannerContext:]( v13,  "dismissBannerWithPresentable:bannerContext:",  v8,  v9);
    }
  }

  objc_storeStrong(&v8, 0LL);
  objc_storeStrong(&v9, 0LL);
  objc_storeStrong(&v11, 0LL);
  objc_storeStrong(location, 0LL);
}

- (void)_updateActiveModeAwareProviders
{
  v2 = -[TVSSMenuDataSourceControllerOverlord menuModeController](self, "menuModeController");
  -[TVSSNowPlayingMenuItemProvider setMode:]( self->_nowPlayingMenuItemProvider,  "setMode:",  -[TVSSMenuModeController mode](v2, "mode"));

  v3 = -[TVSSMenuDataSourceControllerOverlord menuModeController](self, "menuModeController");
  -[TVSSHeadphonesMenuItemProvider setMode:]( self->_headphonesMenuItemProvider,  "setMode:",  -[TVSSMenuModeController mode](v3, "mode"));
}

- (id)succinctDescription
{
  id v3 = -[TVSSMenuDataSourceControllerOverlord succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  id v8 = self;
  v7[1] = (id)a2;
  v7[0] = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", self);
  id v3 = v7[0];
  uint64_t v5 = -[TVSSMenuDataSourceControllerOverlord controllers](v8, "controllers");
  id v4 = -[NSSet allObjects](v5, "allObjects");
  objc_msgSend(v3, "appendArraySection:withName:skipIfEmpty:objectTransformer:");

  id v6 = v7[0];
  objc_storeStrong(v7, 0LL);
  return v6;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v4 =  -[TVSSMenuDataSourceControllerOverlord descriptionBuilderWithMultilinePrefix:]( v7,  "descriptionBuilderWithMultilinePrefix:",  location[0]);
  id v5 = [v4 build];

  objc_storeStrong(location, 0LL);
  return v5;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0LL;
  objc_storeStrong(location, a3);
  id v8 = +[BSDescriptionBuilder builderWithObject:](&OBJC_CLASS___BSDescriptionBuilder, "builderWithObject:", v10);
  -[BSDescriptionBuilder setActiveMultilinePrefix:](v8, "setActiveMultilinePrefix:", location[0]);
  id v4 = v8;
  id v6 = -[TVSSMenuDataSourceControllerOverlord controllers](v10, "controllers");
  id v5 = -[NSSet allObjects](v6, "allObjects");
  -[BSDescriptionBuilder appendArraySection:withName:skipIfEmpty:](v4, "appendArraySection:withName:skipIfEmpty:");

  id v7 = v8;
  objc_storeStrong((id *)&v8, 0LL);
  objc_storeStrong(location, 0LL);
  return v7;
}

- (id)stateDumpBuilder
{
  id v9 = self;
  v8[1] = (id)a2;
  v8[0] = objc_alloc_init(&OBJC_CLASS___TVSStateDumpBuilder);
  id v4 = v8[0];
  id v6 = -[TVSSMenuDataSourceControllerOverlord controllers](v9, "controllers");
  id v5 = -[NSSet allObjects](v6, "allObjects");
  id v2 = objc_msgSend(v4, "appendArray:withKey:skipIfEmpty:");

  id v7 = v8[0];
  objc_storeStrong(v8, 0LL);
  return v7;
}

- (NSString)description
{
  return (NSString *)-[TVSSMenuDataSourceControllerOverlord succinctDescription](self, "succinctDescription", a2, self);
}

- (NSString)debugDescription
{
  return (NSString *)-[TVSSMenuDataSourceControllerOverlord descriptionWithMultilinePrefix:]( self,  "descriptionWithMultilinePrefix:",  0LL,  a2,  self);
}

- (TVSSMenuModeController)menuModeController
{
  return self->_menuModeController;
}

- (TVSSPrivacyController)privacyController
{
  return self->_privacyController;
}

- (TVSSDoNotDisturbController)doNotDisturbController
{
  return self->_doNotDisturbController;
}

- (void).cxx_destruct
{
}

@end