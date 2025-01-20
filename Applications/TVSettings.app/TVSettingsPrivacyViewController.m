@interface TVSettingsPrivacyViewController
- (BOOL)diagnosticIdentifierVisible;
- (BOOL)runningSysdiagnose;
- (TVSettingsPrivacyViewController)initWithStyle:(int64_t)a3;
- (id)loadSettingGroups;
- (void)_generateSysdiagnose:(id)a3;
- (void)_showLocationServicesViewController;
- (void)_updateSendDataItem:(id)a3 value:(id)a4;
- (void)dealloc;
- (void)prepareForDeepLinkWithURL:(id)a3;
- (void)setDiagnosticIdentifierVisible:(BOOL)a3;
- (void)setRunningSysdiagnose:(BOOL)a3;
- (void)showAppAnalyticsDialog:(id)a3;
- (void)showProfileViewController:(id)a3;
- (void)showSendDataDialog:(id)a3;
- (void)toggleShowDiagnosticIdentifier:(id)a3;
@end

@implementation TVSettingsPrivacyViewController

- (TVSettingsPrivacyViewController)initWithStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___TVSettingsPrivacyViewController;
  v3 = -[TVSettingsPrivacyViewController initWithStyle:](&v6, "initWithStyle:", a3);
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v4 addObserver:v3 selector:"internetAvailabilityChanged:" name:kATVInternetAvailabilityChanged object:0];
  }

  return v3;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___TVSettingsPrivacyViewController;
  -[TVSettingsPrivacyViewController dealloc](&v4, "dealloc");
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TVSettingsDeviceFacade sharedInstance](&OBJC_CLASS___TVSettingsDeviceFacade, "sharedInstance"));
  v95 = self;
  objc_initWeak(location, self);
  v93 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v94 = -[TSKSettingGroup initWithTitle:](objc_alloc(&OBJC_CLASS___TSKSettingGroup), "initWithTitle:", 0LL);
  objc_super v4 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v5 = TSKLocString(@"LocationServicesTitle");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = TSKLocString(@"LocationServicesDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v6,  v8,  objc_opt_class(&OBJC_CLASS___CLLocationManager),  @"locationServicesEnabled",  self,  "_showLocationServicesViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  [v10 setAccessoryTypes:1];
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[TSKBoolFormatter onOffFormatter](&OBJC_CLASS___TSKBoolFormatter, "onOffFormatter"));
  [v10 setLocalizedValueFormatter:v11];

  -[NSMutableArray addObject:](v4, "addObject:", v10);
  uint64_t v12 = TSKLocString(@"CrossAppTrackingTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v13,  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___TVSettingsCrossAppTrackingViewController));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  -[NSMutableArray addObject:](v4, "addObject:", v15);
  uint64_t v16 = TSKLocString(@"PhotosServiceTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  uint64_t v18 = TSKLocString(@"PhotosServiceDescription");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  id v20 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v17,  v19,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___TVSettingsPhotosTCCViewController));
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

  -[NSMutableArray addObject:](v4, "addObject:", v21);
  uint64_t v22 = TSKLocString(@"BluetoothServiceTitle");
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  uint64_t v24 = TSKLocString(@"BluetoothServiceDescription");
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  id v26 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v23,  v25,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___TVSettingsBluetoothTCCViewController));
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);

  -[NSMutableArray addObject:](v4, "addObject:", v27);
  if (_os_feature_enabled_impl("TelephonyUtilities", "Laguna"))
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v29 = TSKLocStringFromBundleCachingKey(@"MicrophoneServiceTitle", v28, 1LL, 0LL, @"Localizable-Laguna");
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v32 = TSKLocStringFromBundleCachingKey( @"MicrophoneServiceDescription",  v31,  1LL,  0LL,  @"Localizable-Laguna");
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    id v34 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v30,  v33,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___TVSettingsMicrophoneTCCViewController));
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);

    -[NSMutableArray addObject:](v4, "addObject:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v37 = TSKLocStringFromBundleCachingKey(@"CameraServiceTitle", v36, 1LL, 0LL, @"Localizable-Laguna");
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
    uint64_t v40 = TSKLocStringFromBundleCachingKey( @"CameraServiceDescription",  v39,  1LL,  0LL,  @"Localizable-Laguna");
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    id v42 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v38,  v41,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___TVSettingsCameraTCCViewController));
    v27 = (void *)objc_claimAutoreleasedReturnValue(v42);

    -[NSMutableArray addObject:](v4, "addObject:", v27);
  }

  uint64_t v43 = TSKLocString(@"HomeKitServiceTitle");
  v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
  uint64_t v45 = TSKLocString(@"HomeKitServiceDescription");
  v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
  id v47 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v44,  v46,  0LL,  0LL,  objc_opt_class(0x1001DD000LL));
  v48 = (void *)objc_claimAutoreleasedReturnValue(v47);

  -[NSMutableArray addObject:](v4, "addObject:", v48);
  uint64_t v49 = TSKLocString(@"MediaLibraryServiceTitle");
  v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
  uint64_t v51 = TSKLocString(@"MediaLibraryServiceDescription");
  v52 = (void *)objc_claimAutoreleasedReturnValue(v51);
  id v53 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v50,  v52,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___TVSettingsMediaLibraryTCCViewController));
  v54 = (void *)objc_claimAutoreleasedReturnValue(v53);

  -[NSMutableArray addObject:](v4, "addObject:", v54);
  uint64_t v55 = TSKLocString(@"UserServiceTitle");
  v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
  uint64_t v57 = TSKLocString(@"UserServiceDescription");
  v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
  id v59 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v56,  v58,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___TVSettingsUserTCCViewController));
  v60 = (void *)objc_claimAutoreleasedReturnValue(v59);

  -[NSMutableArray addObject:](v4, "addObject:", v60);
  -[TSKSettingGroup setSettingItems:](v94, "setSettingItems:", v4);
  -[NSMutableArray addObject:](v93, "addObject:", v94);
  v61 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v62 = TSKLocString(@"GeneralDiagnosticSectionTitle");
  v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
  v92 = -[TSKSettingGroup initWithTitle:](v61, "initWithTitle:", v63);

  v64 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v65 = TSKLocString(@"DiagnosticSendToAppleTitle");
  v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
  v67 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v66,  0LL,  v3,  @"shouldSendDataToApple",  v95,  "showSendDataDialog:"));

  v68 = (void *)objc_claimAutoreleasedReturnValue(+[TSKBoolFormatter onOffFormatter](&OBJC_CLASS___TSKBoolFormatter, "onOffFormatter"));
  [v67 setLocalizedValueFormatter:v68];

  [v67 setPlayButtonAction:"showProfileViewController:"];
  [v67 setRightButtonAction:"toggleShowDiagnosticIdentifier:"];
  v103[0] = _NSConcreteStackBlock;
  v103[1] = 3221225472LL;
  v103[2] = sub_10009C154;
  v103[3] = &unk_10018E9B0;
  objc_copyWeak(&v104, location);
  [v67 setUpdateBlock:v103];
  [v67 setEnabledInStoreDemoMode:0];
  -[NSMutableArray addObject:](v64, "addObject:", v67);
  uint64_t v69 = TSKLocString(@"DiagnosticSendToDevelopersTitle");
  v70 = (void *)objc_claimAutoreleasedReturnValue(v69);
  v71 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v70,  0LL,  v3,  @"shouldSendAppAnalytics",  v95,  "showAppAnalyticsDialog:"));

  v72 = (void *)objc_claimAutoreleasedReturnValue(+[TSKBoolFormatter onOffFormatter](&OBJC_CLASS___TSKBoolFormatter, "onOffFormatter"));
  [v71 setLocalizedValueFormatter:v72];

  v101[0] = _NSConcreteStackBlock;
  v101[1] = 3221225472LL;
  v101[2] = sub_10009C1F0;
  v101[3] = &unk_10018E608;
  id v73 = v3;
  id v102 = v73;
  [v71 setUpdateBlock:v101];
  -[NSMutableArray addObject:](v64, "addObject:", v71);
  v74 = (void *)objc_claimAutoreleasedReturnValue(+[TVCSSiriSettings sharedInstance](&OBJC_CLASS___TVCSSiriSettings, "sharedInstance"));
  uint64_t v75 = TSKLocString(@"DiagnosticSiriDataSharingTitle");
  v76 = (void *)objc_claimAutoreleasedReturnValue(v75);
  uint64_t v77 = TSKLocString(@"DiagnosticSiriDataSharingDescription");
  v78 = (void *)objc_claimAutoreleasedReturnValue(v77);
  id v79 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v76,  v78,  v74,  @"dataSharingOptInStatus",  objc_opt_class(&OBJC_CLASS___TVSettingsSiriDataSharingViewController));
  v80 = (void *)objc_claimAutoreleasedReturnValue(v79);

  v81 = (void *)objc_claimAutoreleasedReturnValue( +[TVCSSiriSettings tvsettings_dataSharingStatusFormatter]( &OBJC_CLASS___TVCSSiriSettings,  "tvsettings_dataSharingStatusFormatter"));
  [v80 setLocalizedValueFormatter:v81];

  v99[0] = _NSConcreteStackBlock;
  v99[1] = 3221225472LL;
  v99[2] = sub_10009C270;
  v99[3] = &unk_10018E608;
  id v82 = v74;
  id v100 = v82;
  [v80 setUpdateBlock:v99];
  -[NSMutableArray addObject:](v64, "addObject:", v80);
  uint64_t v83 = TSKLocString(@"DiagnosticDataTitle");
  v84 = (void *)objc_claimAutoreleasedReturnValue(v83);
  id v85 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v84,  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___TVSettingsPrivacyDataViewController));
  v86 = (void *)objc_claimAutoreleasedReturnValue(v85);

  v96[0] = _NSConcreteStackBlock;
  v96[1] = 3221225472LL;
  v96[2] = sub_10009C2B4;
  v96[3] = &unk_1001912E0;
  id v87 = v73;
  id v97 = v87;
  objc_copyWeak(&v98, location);
  [v86 setUpdateBlock:v96];
  v88 = (void *)objc_claimAutoreleasedReturnValue( +[TSKKonamiCode codeWithSequence:action:]( &OBJC_CLASS___TSKKonamiCode,  "codeWithSequence:action:",  &off_1001AF070,  "_generateSysdiagnose:"));
  [v86 addKonamiCode:v88];
  [v86 setTarget:v95];
  -[NSMutableArray addObject:](v64, "addObject:", v86);
  v89 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem privacyItemWithIdentifier:]( &OBJC_CLASS___TSKSettingItem,  "privacyItemWithIdentifier:",  @"com.apple.onboarding.analyticsdevice"));

  [v89 setShouldPresentChildController:1];
  -[NSMutableArray addObject:](v64, "addObject:", v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem privacyItemWithIdentifier:]( &OBJC_CLASS___TSKSettingItem,  "privacyItemWithIdentifier:",  @"com.apple.onboarding.analyticsapp"));

  [v90 setShouldPresentChildController:1];
  -[NSMutableArray addObject:](v64, "addObject:", v90);
  -[TSKSettingGroup setSettingItems:](v92, "setSettingItems:", v64);
  -[NSMutableArray addObject:](v93, "addObject:", v92);

  objc_destroyWeak(&v98);
  objc_destroyWeak(&v104);

  objc_destroyWeak(location);
  return v93;
}

- (void)prepareForDeepLinkWithURL:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue([a3 resourceSpecifier]);
  unsigned int v5 = [v4 containsString:@"LOCATION_SERVICES"];

  if (v5) {
    -[TVSettingsPrivacyViewController _showLocationServicesViewController](self, "_showLocationServicesViewController");
  }
}

- (void)toggleShowDiagnosticIdentifier:(id)a3
{
  self->_diagnosticIdentifierVisible ^= 1u;
  -[TVSettingsPrivacyViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded", a3);
}

- (void)showProfileViewController:(id)a3
{
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsUtilities deviceManagementBundlePath]( &OBJC_CLASS___TVSettingsUtilities,  "deviceManagementBundlePath",  a3));
  id v8 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](&OBJC_CLASS___NSBundle, "bundleWithPath:", v4));

  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(+[TSKBundleLoader loaderWithBundle:](&OBJC_CLASS___TSKBundleLoader, "loaderWithBundle:", v8));
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue([v5 loadViewController]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPrivacyViewController navigationController](self, "navigationController"));
  [v7 pushViewController:v6 animated:1];
}

- (void)showAppAnalyticsDialog:(id)a3
{
  id v4 = a3;
  uint64_t v5 = TSKLocString(@"DiagnosticSendToDevelopersTitle");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = TSKLocString(@"DiagnosticSendToDevelopersText");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v6,  v8,  1LL));

  uint64_t v10 = TSKLocString(@"SendDataOkButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10009C674;
  v25[3] = &unk_10018F018;
  id v12 = v4;
  id v26 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v11,  0LL,  v25));

  [v9 addAction:v13];
  uint64_t v14 = TSKLocString(@"SendDataNoThanksButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472LL;
  uint64_t v22 = sub_10009C690;
  v23 = &unk_10018F018;
  id v24 = v12;
  id v16 = v12;
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v15,  0LL,  &v20));

  objc_msgSend(v9, "addAction:", v17, v20, v21, v22, v23);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  0LL,  1LL,  0LL));
  [v9 addAction:v18];
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPrivacyViewController navigationController](self, "navigationController"));
  [v19 presentViewController:v9 animated:1 completion:0];
}

- (void)showSendDataDialog:(id)a3
{
  id v4 = a3;
  uint64_t v5 = TSKLocString(@"DiagnosticSendToAppleTitle");
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  uint64_t v7 = TSKLocString(@"SendDataDescriptionText");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v6,  v8,  1LL));

  uint64_t v10 = TSKLocString(@"SendDataOkButton");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = sub_10009C8A8;
  v25[3] = &unk_10018F018;
  id v12 = v4;
  id v26 = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v11,  0LL,  v25));

  [v9 addAction:v13];
  uint64_t v14 = TSKLocString(@"SendDataNoThanksButton");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  id v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472LL;
  uint64_t v22 = sub_10009C8C4;
  v23 = &unk_10018F018;
  id v24 = v12;
  id v16 = v12;
  v17 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v15,  0LL,  &v20));

  objc_msgSend(v9, "addAction:", v17, v20, v21, v22, v23);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  0LL,  1LL,  0LL));
  [v9 addAction:v18];
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPrivacyViewController navigationController](self, "navigationController"));
  [v19 presentViewController:v9 animated:1 completion:0];
}

- (void)_showLocationServicesViewController
{
  v3 = objc_alloc_init(&OBJC_CLASS___TVSettingsLocationServicesViewController);
  uint64_t v4 = TSKLocString(@"LocationServicesTitle");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[TVSettingsLocationServicesViewController setTitle:](v3, "setTitle:", v5);

  objc_initWeak(&location, self);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[PBSRestrictionService sharedInstance](&OBJC_CLASS___PBSRestrictionService, "sharedInstance"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_10009CA0C;
  v9[3] = &unk_10018FC18;
  objc_copyWeak(&v11, &location);
  uint64_t v7 = v3;
  uint64_t v10 = v7;
  id v8 = [v6 validateRestrictionForSetting:4 allowInteraction:1 withCompletion:v9];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_generateSysdiagnose:(id)a3
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Starting user-triggered sysdiagnose.",  (uint8_t *)buf,  2u);
  }

  -[TVSettingsPrivacyViewController setRunningSysdiagnose:](self, "setRunningSysdiagnose:", 1LL);
  -[TVSettingsPrivacyViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
  objc_initWeak(buf, self);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10009CC00;
  v6[3] = &unk_100192C10;
  uint64_t v7 = &off_1001AF750;
  objc_copyWeak(&v8, buf);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(buf);
}

- (void)_updateSendDataItem:(id)a3 value:(id)a4
{
  id v14 = a3;
  if (self->_diagnosticIdentifierVisible)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[TVSDevice inverseUniqueID](&OBJC_CLASS___TVSDevice, "inverseUniqueID"));
    uint64_t v6 = TSKLocString(@"DeviceDiagnosticID");
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    if ([v5 length])
    {
      int v8 = 4;
      do
      {
        else {
          uint64_t v9 = (uint64_t)[v5 length];
        }
        uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v5 substringToIndex:v9]);
        id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ %@",  v7,  v10));

        if (!v8)
        {
          uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@\n", v11));

          id v11 = (void *)v12;
        }

        v13 = (void *)objc_claimAutoreleasedReturnValue([v5 substringFromIndex:v9]);

        --v8;
        uint64_t v7 = v11;
        uint64_t v5 = v13;
      }

      while ([v13 length]);
    }

    else
    {
      v13 = v5;
      id v11 = v7;
    }
  }

  else
  {
    id v11 = 0LL;
  }

  [v14 setLocalizedDescription:v11];
}

- (BOOL)diagnosticIdentifierVisible
{
  return self->_diagnosticIdentifierVisible;
}

- (void)setDiagnosticIdentifierVisible:(BOOL)a3
{
  self->_diagnosticIdentifierVisible = a3;
}

- (BOOL)runningSysdiagnose
{
  return self->_runningSysdiagnose;
}

- (void)setRunningSysdiagnose:(BOOL)a3
{
  self->_runningSysdiagnose = a3;
}

@end