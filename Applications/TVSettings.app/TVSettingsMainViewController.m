@interface TVSettingsMainViewController
- (FLTVSettingsController)followUpController;
- (NSURL)lastDeepLinkURL;
- (TSKBundleLoader)developerBundleLoader;
- (TVSettingsMainViewController)initWithStyle:(int64_t)a3;
- (id)_accessibilitySettingsBundlePath;
- (id)_supervisionDescription;
- (id)loadSettingGroups;
- (id)title;
- (void)_handleCFUAction:(id)a3;
- (void)_showAirPlayViewController;
- (void)_sleepNow:(id)a3;
- (void)_updateDeveloperBundleLoader;
- (void)dealloc;
- (void)setDeveloperBundleLoader:(id)a3;
- (void)setFollowUpController:(id)a3;
- (void)setLastDeepLinkURL:(id)a3;
@end

@implementation TVSettingsMainViewController

- (TVSettingsMainViewController)initWithStyle:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TVSettingsMainViewController;
  v3 = -[TVSettingsMainViewController initWithStyle:](&v9, "initWithStyle:", a3);
  if (v3)
  {
    v4 = objc_alloc_init(&OBJC_CLASS___FLTVSettingsController);
    followUpController = v3->_followUpController;
    v3->_followUpController = v4;

    -[TVSettingsMainViewController _updateDeveloperBundleLoader](v3, "_updateDeveloperBundleLoader");
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( DarwinNotifyCenter,  v3,  (CFNotificationCallback)sub_10002DD44,  @"com.apple.mobile.developer_image_mounted",  0LL,  CFNotificationSuspensionBehaviorDrop);
    v7 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver( v7,  v3,  (CFNotificationCallback)sub_10002DD44,  @"com.apple.mobile.personalized_image_mounted",  0LL,  CFNotificationSuspensionBehaviorDrop);
  }

  return v3;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.mobile.developer_image_mounted", 0LL);
  v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, @"com.apple.mobile.personalized_image_mounted", 0LL);
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___TVSettingsMainViewController;
  -[TVSettingsMainViewController dealloc](&v5, "dealloc");
}

- (id)title
{
  return (id)TSKLocString(@"SettingsTitle");
}

- (id)loadSettingGroups
{
  v65 = -[TSKSettingGroup initWithTitle:](objc_alloc(&OBJC_CLASS___TSKSettingGroup), "initWithTitle:", 0LL);
  v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v4 = TSKLocString(@"GeneralTitle");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v5,  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___TVSettingsGeneralViewController));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472LL;
  v70[2] = sub_10002E6A0;
  v70[3] = &unk_10018E9B0;
  objc_copyWeak(&v71, &location);
  [v7 setUpdateBlock:v70];
  -[NSMutableArray addObject:](v3, "addObject:", v7);
  v8 = self->_followUpController;
  uint64_t v9 = TSKLocString(@"AccountsTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472LL;
  v68[2] = sub_10002E6FC;
  v68[3] = &unk_10018EC30;
  v64 = v8;
  v69 = v64;
  v11 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v10,  0LL,  0LL,  0LL,  v68));

  [v11 setUpdateBlock:&stru_10018FB50];
  -[NSMutableArray addObject:](v3, "addObject:", v11);
  uint64_t v12 = TSKLocString(@"AudioVideoTitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v13,  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___TVSettingsAudioVideoViewController));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  -[NSMutableArray addObject:](v3, "addObject:", v15);
  if (_os_feature_enabled_impl("IdleScreen", "Fizzgig"))
  {
    uint64_t v16 = TSKLocString(@"ScreenSaverTitle");
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v18 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v17,  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___TVSettingsAmbientViewController));
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);

    -[NSMutableArray addObject:](v3, "addObject:", v19);
    v15 = (void *)v19;
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsNotificationsFacade sharedInstance]( &OBJC_CLASS___TVSettingsNotificationsFacade,  "sharedInstance"));
  uint64_t v21 = TSKLocString(@"NotificationsTitle");
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  id v23 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v22,  0LL,  v20,  @"notificationSettings",  objc_opt_class(&OBJC_CLASS___TVSettingsNotificationsViewController));
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);

  [v24 setUpdateBlock:&stru_10018FB70];
  -[NSMutableArray addObject:](v3, "addObject:", v24);
  uint64_t v25 = TSKLocString(@"AirPlayTitle");
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v26,  0LL,  0LL,  0LL,  self,  "_showAirPlayViewController"));

  [v27 setAccessoryTypes:1];
  -[NSMutableArray addObject:](v3, "addObject:", v27);
  uint64_t v28 = TSKLocString(@"RemotesTitle");
  v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
  id v30 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v29,  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___TVSettingsRemotesViewController));
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);

  -[NSMutableArray addObject:](v3, "addObject:", v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue( -[TVSettingsMainViewController _accessibilitySettingsBundlePath]( self,  "_accessibilitySettingsBundlePath"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](&OBJC_CLASS___NSBundle, "bundleWithPath:", v32));
  v34 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithBundle:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithBundle:",  v33));

  uint64_t v35 = TSKLocString(@"AccessibilityTitle");
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  [v34 setLocalizedTitle:v36];

  -[NSMutableArray addObject:](v3, "addObject:", v34);
  uint64_t v37 = TSKLocString(@"AppsTitle");
  v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
  id v39 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v38,  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___TVSettingsAppsViewController));
  v40 = (void *)objc_claimAutoreleasedReturnValue(v39);

  -[NSMutableArray addObject:](v3, "addObject:", v40);
  uint64_t v41 = TSKLocString(@"NetworkTitle");
  v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
  id v43 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v42,  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___TVSettingsNetworkViewController));
  v44 = (void *)objc_claimAutoreleasedReturnValue(v43);

  -[NSMutableArray addObject:](v3, "addObject:", v44);
  uint64_t v45 = TSKLocString(@"SystemTitle");
  v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
  id v47 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v46,  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___TVSettingsSetupViewController));
  v48 = (void *)objc_claimAutoreleasedReturnValue(v47);

  -[NSMutableArray addObject:](v3, "addObject:", v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithBundle:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithBundle:",  0LL));

  uint64_t v50 = TSKLocString(@"DeveloperTitle");
  v51 = (void *)objc_claimAutoreleasedReturnValue(v50);
  [v49 setLocalizedTitle:v51];

  v66[0] = _NSConcreteStackBlock;
  v66[1] = 3221225472LL;
  v66[2] = sub_10002E7E8;
  v66[3] = &unk_10018E9B0;
  objc_copyWeak(&v67, &location);
  [v49 setUpdateBlock:v66];
  -[NSMutableArray addObject:](v3, "addObject:", v49);
  v52 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithPath:]( &OBJC_CLASS___NSBundle,  "bundleWithPath:",  @"/System/Library/PreferenceBundles/IDSExternalSettingsAppleTV.bundle"));
  v53 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithBundle:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithBundle:",  v52));

  [v53 setUpdateBlock:&stru_10018FB90];
  -[NSMutableArray addObject:](v3, "addObject:", v53);
  if (+[TVSDevice runningAnInternalBuild](&OBJC_CLASS___TVSDevice, "runningAnInternalBuild"))
  {
    id v54 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  @"Internal",  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___TVSettingsInternalViewController));
    v55 = (void *)objc_claimAutoreleasedReturnValue(v54);

    [v55 setDeepLinkKey:@"INTERNAL"];
    [v55 setUpdateBlock:&stru_10018FBB0];
    -[NSMutableArray addObject:](v3, "addObject:", v55);
  }

  else
  {
    v55 = v53;
  }

  uint64_t v56 = TSKLocString(@"SleepTitle");
  v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
  v58 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v57,  0LL,  0LL,  0LL,  self,  "_sleepNow:"));

  -[NSMutableArray addObject:](v3, "addObject:", v58);
  -[TSKSettingGroup setSettingItems:](v65, "setSettingItems:", v3);
  v59 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  0LL,  0LL,  self->_followUpController,  @"itemModel",  self,  "_handleCFUAction:"));
  [v59 setUpdateBlock:&stru_10018FBF0];
  v74 = v59;
  v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v74, 1LL));
  v61 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v60));

  [v61 setAutoHide:1];
  v73[0] = v61;
  v73[1] = v65;
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v73, 2LL));

  objc_destroyWeak(&v67);
  objc_destroyWeak(&v71);

  objc_destroyWeak(&location);
  return v62;
}

- (void)_sleepNow:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance", a3));
  [v3 sleepSystemForReason:PBSSleepReasonUserSettingsMenu];
}

- (void)_handleCFUAction:(id)a3
{
}

- (void)_showAirPlayViewController
{
  id v3 = objc_alloc_init(&OBJC_CLASS___TVSettingsAirPlayViewController);
  uint64_t v4 = TSKLocString(@"AirPlayTitle");
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  -[TVSettingsAirPlayViewController setTitle:](v3, "setTitle:", v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSURL absoluteString](self->_lastDeepLinkURL, "absoluteString"));
  if ([v6 containsString:@"root=Home"]
    && [v6 containsString:@"cfuAction=finishSetup"])
  {
    -[TVSettingsAirPlayViewController setLastDeepLinkURL:](v3, "setLastDeepLinkURL:", self->_lastDeepLinkURL);
    lastDeepLinkURL = self->_lastDeepLinkURL;
    self->_lastDeepLinkURL = 0LL;
  }

  objc_initWeak(&location, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PBSRestrictionService sharedInstance](&OBJC_CLASS___PBSRestrictionService, "sharedInstance"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10002EC04;
  v11[3] = &unk_10018FC18;
  objc_copyWeak(&v13, &location);
  uint64_t v9 = v3;
  uint64_t v12 = v9;
  id v10 = [v8 validateRestrictionForSetting:2 allowInteraction:1 withCompletion:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_updateDeveloperBundleLoader
{
  uint64_t v3 = SFDeveloperSettingsBundlePath(self, a2);
  id v20 = (id)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned __int8 v5 = [v4 fileExistsAtPath:v20];

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 contentsOfDirectoryAtPath:@"/Developer" error:0]);

  if (v7) {
    BOOL v8 = [v7 count] != 0;
  }
  else {
    BOOL v8 = 0;
  }
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 contentsOfDirectoryAtPath:@"/System/Developer" error:0]);

  if (v10)
  {
    BOOL v11 = [v10 count] != 0;
    if ((v5 & 1) != 0) {
      goto LABEL_6;
    }
LABEL_14:
    LOBYTE(v12) = 0;
    p_developerBundleLoader = &self->_developerBundleLoader;
    developerBundleLoader = self->_developerBundleLoader;
    BOOL v15 = developerBundleLoader == 0LL;
    goto LABEL_15;
  }

  BOOL v11 = 0;
  if ((v5 & 1) == 0) {
    goto LABEL_14;
  }
LABEL_6:
  int v12 = v8 || v11;
  p_developerBundleLoader = &self->_developerBundleLoader;
  developerBundleLoader = self->_developerBundleLoader;
  BOOL v15 = developerBundleLoader == 0LL;
  if (developerBundleLoader) {
    BOOL v16 = 1;
  }
  else {
    BOOL v16 = v12 == 0;
  }
  if (!v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](&OBJC_CLASS___NSBundle, "bundleWithPath:", v20));
    if (v17)
    {
      uint64_t v18 = objc_claimAutoreleasedReturnValue(+[TSKBundleLoader loaderWithBundle:](&OBJC_CLASS___TSKBundleLoader, "loaderWithBundle:", v17));
      uint64_t v19 = *p_developerBundleLoader;
      *p_developerBundleLoader = (TSKBundleLoader *)v18;

      -[TVSettingsMainViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
    }

    goto LABEL_18;
  }

- (id)_supervisionDescription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned int v3 = [v2 isProvisionallyEnrolled];

  if (v3)
  {
    uint64_t v4 = TSKLocString(@"ProvesionalDEPEnrollment");
    unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }

  else
  {
    unsigned __int8 v5 = 0LL;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
  unsigned int v7 = [v6 isSupervised];

  if (v7)
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](&OBJC_CLASS___MCProfileConnection, "sharedConnection"));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 cloudConfigurationDetails]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:kMCCCOrganizationNameKey]);

    if ([v10 length])
    {
      uint64_t v11 = TSKLocString(@"SupervisedDeviceOrgDescriptionFormat");
      int v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v12, v10));
    }

    else
    {
      uint64_t v14 = TSKLocString(@"SupervisedDeviceDescription");
      id v13 = (void *)objc_claimAutoreleasedReturnValue(v14);
    }

    if ([v5 length]) {
      id v15 = (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@\n\n%@", v5, v13));
    }
    else {
      id v15 = v13;
    }
    id v16 = v15;

    unsigned __int8 v5 = v16;
  }

  return v5;
}

- (id)_accessibilitySettingsBundlePath
{
  return objc_msgSend( (id)GSSystemRootDirectory(self, a2),  "stringByAppendingPathComponent:",  @"System/Library/PreferenceBundles/AccessibilitySettings.bundle");
}

- (NSURL)lastDeepLinkURL
{
  return self->_lastDeepLinkURL;
}

- (void)setLastDeepLinkURL:(id)a3
{
}

- (TSKBundleLoader)developerBundleLoader
{
  return self->_developerBundleLoader;
}

- (void)setDeveloperBundleLoader:(id)a3
{
}

- (FLTVSettingsController)followUpController
{
  return self->_followUpController;
}

- (void)setFollowUpController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end