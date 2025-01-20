@interface TVSettingsAppsViewController
- (TSKAppIconPreviewViewController)appIconPreviewViewController;
- (TSKSettingItem)lastFocusedItem;
- (TVSettingsAppsFacade)appsFacade;
- (TVSettingsAppsViewController)initWithStyle:(int64_t)a3;
- (id)loadSettingGroups;
- (id)previewForItemAtIndexPath:(id)a3;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setAppIconPreviewViewController:(id)a3;
- (void)setAppsFacade:(id)a3;
- (void)setLastFocusedItem:(id)a3;
- (void)tableView:(id)a3 didReceivePhysicalPlayForItemAtIndexPath:(id)a4;
@end

@implementation TVSettingsAppsViewController

- (TVSettingsAppsViewController)initWithStyle:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVSettingsAppsViewController;
  v3 = -[TVSettingsAppsViewController initWithStyle:](&v7, "initWithStyle:", a3);
  if (v3)
  {
    uint64_t v4 = objc_claimAutoreleasedReturnValue(+[TVSettingsAppsFacade sharedInstance](&OBJC_CLASS___TVSettingsAppsFacade, "sharedInstance"));
    appsFacade = v3->_appsFacade;
    v3->_appsFacade = (TVSettingsAppsFacade *)v4;

    -[TVSettingsAppsFacade addObserver:forKeyPath:options:context:]( v3->_appsFacade,  "addObserver:forKeyPath:options:context:",  v3,  @"userAppsWithSettings",  0LL,  off_1001DFFA8);
  }

  return v3;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TVSettingsAppsViewController;
  -[TVSettingsAppsViewController dealloc](&v3, "dealloc");
}

- (id)loadSettingGroups
{
  v2 = -[TSKSettingGroup initWithTitle:](objc_alloc(&OBJC_CLASS___TSKSettingGroup), "initWithTitle:", 0LL);
  objc_super v3 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v4 = -[TVSettingsPreferenceFacade initWithDomain:notifyChanges:]( objc_alloc(&OBJC_CLASS___TVSettingsPreferenceFacade),  "initWithDomain:notifyChanges:",  @"com.apple.itunesstored",  0LL);
  uint64_t v5 = TSKLocString(@"AutoUpdateAppsTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v72 = v4;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v6,  0LL,  v4,  @"AutoUpdatesEnabled",  0LL,  0LL));

  [v7 setDefaultValue:&__kCFBooleanTrue];
  -[NSMutableArray addObject:](v3, "addObject:", v7);
  uint64_t v8 = objc_claimAutoreleasedReturnValue(+[TVSettingsITMSFacade sharedInstance](&OBJC_CLASS___TVSettingsITMSFacade, "sharedInstance"));
  uint64_t v9 = TSKLocString(@"AppsAutoDownloadTitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = TSKLocString(@"AppsAutoDownloadDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v70 = (void *)v8;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v10,  v12,  v8,  @"autoDownloadApps",  0LL,  0LL));

  [v13 setUpdateBlock:&stru_100192520];
  -[NSMutableArray addObject:](v3, "addObject:", v13);
  v14 = -[TVSettingsPreferenceFacade initWithDomain:notifyChanges:]( objc_alloc(&OBJC_CLASS___TVSettingsPreferenceFacade),  "initWithDomain:notifyChanges:",  @"com.apple.appstored",  0LL);
  uint64_t v15 = TSKLocString(@"AppsAutoOffloadTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  uint64_t v17 = TSKLocString(@"AppsAutoOffloadDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v69 = v14;
  v19 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v16,  v18,  v14,  @"OffloadUnusedApps",  0LL,  0LL));

  [v19 setDefaultValue:&__kCFBooleanFalse];
  -[NSMutableArray addObject:](v3, "addObject:", v19);
  v73 = v3;
  v74 = v2;
  -[TSKSettingGroup setSettingItems:](v2, "setSettingItems:", v3);
  v20 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v21 = TSKLocString(@"AppsBuiltInSectionTitle");
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = -[TSKSettingGroup initWithTitle:](v20, "initWithTitle:", v22);

  v24 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if (![v25 fileExistsAtPath:@"/System/Library/PreferenceBundles/TVAppSettings.bundle"])
  {
    v29 = &OBJC_CLASS___RBSProcessPredicate_ptr;
    goto LABEL_5;
  }

  unsigned int v26 = +[TVSettingsAppsFacade isAppEnabledForBundleID:]( &OBJC_CLASS___TVSettingsAppsFacade,  "isAppEnabledForBundleID:",  @"com.apple.TVWatchList");

  if (v26)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppInfoController sharedInstance](&OBJC_CLASS___PBSAppInfoController, "sharedInstance"));
    v28 = (void *)objc_claimAutoreleasedReturnValue([v27 appInfos]);
    v25 = (void *)objc_claimAutoreleasedReturnValue([v28 objectForKey:@"com.apple.TVWatchList"]);

    v29 = &OBJC_CLASS___RBSProcessPredicate_ptr;
    v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithPath:]( &OBJC_CLASS___NSBundle,  "bundleWithPath:",  @"/System/Library/PreferenceBundles/TVAppSettings.bundle"));
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithBundle:representedObject:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithBundle:representedObject:",  v30,  v25));

    [v31 setDeepLinkKey:@"com.apple.TVWatchList"];
    -[NSMutableArray addObject:](v24, "addObject:", v31);
    v19 = v31;
LABEL_5:

    goto LABEL_7;
  }

  v29 = &OBJC_CLASS___RBSProcessPredicate_ptr;
LABEL_7:
  if (+[TVSettingsAppsFacade isAppEnabledForBundleID:]( &OBJC_CLASS___TVSettingsAppsFacade,  "isAppEnabledForBundleID:",  @"com.apple.TVMusic"))
  {
    id v32 =  +[TVSettingsCloudMediaLibraryFacade sharedInstance]( &OBJC_CLASS___TVSettingsCloudMediaLibraryFacade,  "sharedInstance");
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppInfoController sharedInstance](&OBJC_CLASS___PBSAppInfoController, "sharedInstance"));
    v34 = (void *)objc_claimAutoreleasedReturnValue([v33 appInfos]);
    v35 = (void *)objc_claimAutoreleasedReturnValue([v34 objectForKey:@"com.apple.TVMusic"]);

    v36 = v29[31];
    uint64_t v37 = TSKLocString(@"AppsMusicTitle");
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    id v39 = [v36 childPaneItemWithTitle:v38 description:0 representedObject:v35 keyPath:0 childControllerClass:objc_opt_class(TVSettingsMusicViewController)];
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);

    [v40 setDeepLinkKey:@"com.apple.TVMusic"];
    -[NSMutableArray addObject:](v24, "addObject:", v40);

    v19 = v40;
  }

  if (+[TVSettingsAppsFacade isAppEnabledForBundleID:]( &OBJC_CLASS___TVSettingsAppsFacade,  "isAppEnabledForBundleID:",  @"com.apple.TVMovies"))
  {
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppInfoController sharedInstance](&OBJC_CLASS___PBSAppInfoController, "sharedInstance"));
    v42 = (void *)objc_claimAutoreleasedReturnValue([v41 appInfos]);
    v43 = (void *)objc_claimAutoreleasedReturnValue([v42 objectForKey:@"com.apple.TVMovies"]);

    v44 = v29[31];
    uint64_t v45 = TSKLocString(@"AppsMoviesAndTVTitle");
    v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
    id v47 = [v44 childPaneItemWithTitle:v46 description:0 representedObject:v43 keyPath:0 childControllerClass:objc_opt_class(TVSettingsMoviesViewController)];
    v48 = (void *)objc_claimAutoreleasedReturnValue(v47);

    [v48 setDeepLinkKey:@"com.apple.TVMovies"];
    -[NSMutableArray addObject:](v24, "addObject:", v48);

    v19 = v48;
  }

  v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  if ([v49 fileExistsAtPath:@"/System/Library/PreferenceBundles/TVHomeSharingAppSettings.bundle"])
  {
    unsigned int v50 = +[TVSettingsAppsFacade isAppEnabledForBundleID:]( &OBJC_CLASS___TVSettingsAppsFacade,  "isAppEnabledForBundleID:",  @"com.apple.TVHomeSharing");

    if (!v50) {
      goto LABEL_15;
    }
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppInfoController sharedInstance](&OBJC_CLASS___PBSAppInfoController, "sharedInstance"));
    v52 = (void *)objc_claimAutoreleasedReturnValue([v51 appInfos]);
    v49 = (void *)objc_claimAutoreleasedReturnValue([v52 objectForKey:@"com.apple.TVHomeSharing"]);

    v53 = v29[31];
    v54 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithPath:]( &OBJC_CLASS___NSBundle,  "bundleWithPath:",  @"/System/Library/PreferenceBundles/TVHomeSharingAppSettings.bundle"));
    v55 = (void *)objc_claimAutoreleasedReturnValue([v53 childPaneItemWithBundle:v54 representedObject:v49]);

    [v55 setDeepLinkKey:@"com.apple.TVHomeSharing"];
    -[NSMutableArray addObject:](v24, "addObject:", v55);
    v19 = v55;
  }

LABEL_15:
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  unsigned int v57 = [v56 fileExistsAtPath:@"/System/Library/PreferenceBundles/TVFactoryTestSettings.bundle"];

  if (v57)
  {
    v58 = (void *)objc_claimAutoreleasedReturnValue( +[NSBundle bundleWithPath:]( &OBJC_CLASS___NSBundle,  "bundleWithPath:",  @"/System/Library/PreferenceBundles/TVFactoryTestSettings.bundle"));
    v59 = (void *)objc_claimAutoreleasedReturnValue([v29[31] childPaneItemWithBundle:v58]);

    [v59 setDeepLinkKey:@"/System/Library/PreferenceBundles/TVFactoryTestSettings.bundle"];
    -[NSMutableArray addObject:](v24, "addObject:", v59);

    v68 = v59;
  }

  else
  {
    v68 = v19;
  }

  -[TSKSettingGroup setSettingItems:](v23, "setSettingItems:", v24);
  v60 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  self->_appsFacade,  @"systemAppsWithSettings",  &stru_100192560));
  uint64_t v61 = TSKLocString(@"AppsBuiltInSectionTitle");
  v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
  v76[0] = v23;
  v76[1] = v60;
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v76, 2LL));
  v64 = (void *)objc_claimAutoreleasedReturnValue( +[TSKAggregateSettingGroup groupWithTitle:settingGroups:]( &OBJC_CLASS___TSKAggregateSettingGroup,  "groupWithTitle:settingGroups:",  v62,  v63));

  v65 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  0LL,  self->_appsFacade,  @"userAppsWithSettings",  &stru_100192560));
  v75[0] = v74;
  v75[1] = v64;
  v75[2] = v65;
  v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v75, 3LL));

  return v66;
}

- (id)previewForItemAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (TSKSettingItem *)objc_claimAutoreleasedReturnValue(-[TVSettingsAppsViewController settingItemAtIndexPath:](self, "settingItemAtIndexPath:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TSKSettingItem representedObject](v5, "representedObject"));
  uint64_t v7 = objc_opt_self(&OBJC_CLASS___PBSAppInfo);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  char isKindOfClass = objc_opt_isKindOfClass(v6, v8);

  if ((isKindOfClass & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItemUtilities localizedDescriptionForItemInViewController:atIndexPath:]( &OBJC_CLASS___TSKSettingItemUtilities,  "localizedDescriptionForItemInViewController:atIndexPath:",  self,  v4));

    if (self->_lastFocusedItem == v5)
    {
      -[TSKAppIconPreviewViewController setDescriptionText:]( self->_appIconPreviewViewController,  "setDescriptionText:",  v10);
      uint64_t v15 = self->_appIconPreviewViewController;
    }

    else
    {
      id v11 = v6;
      v12 = objc_alloc(&OBJC_CLASS___TSKAppIconPreviewViewController);
      v13 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleIdentifier]);

      v14 = -[TSKAppIconPreviewViewController initWithApplicationBundleIdentifier:]( v12,  "initWithApplicationBundleIdentifier:",  v13);
      -[TSKAppIconPreviewViewController setDescriptionText:](v14, "setDescriptionText:", v10);
      uint64_t v15 = v14;
      objc_storeStrong((id *)&self->_lastFocusedItem, v5);
      appIconPreviewViewController = self->_appIconPreviewViewController;
      self->_appIconPreviewViewController = v15;
    }
  }

  else
  {
    v20.receiver = self;
    v20.super_class = (Class)&OBJC_CLASS___TVSettingsAppsViewController;
    id v17 = -[TVSettingsAppsViewController previewForItemAtIndexPath:](&v20, "previewForItemAtIndexPath:", v4);
    uint64_t v15 = (TSKAppIconPreviewViewController *)objc_claimAutoreleasedReturnValue(v17);
  }

  v18 = v15;

  return v18;
}

- (void)tableView:(id)a3 didReceivePhysicalPlayForItemAtIndexPath:(id)a4
{
  id v6 = a4;
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVSettingsAppsViewController;
  -[TVSettingsAppsViewController tableView:didReceivePhysicalPlayForItemAtIndexPath:]( &v7,  "tableView:didReceivePhysicalPlayForItemAtIndexPath:",  a3,  v6);
  if (![v6 section] && !objc_msgSend(v6, "row")) {
    -[TVSettingsAppsFacade knockForEntry](self->_appsFacade, "knockForEntry");
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (off_1001DFFA8 == a6)
  {
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsAppsViewController navigationController](self, "navigationController", a3, a4, a5));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 viewControllers]);

    uint64_t v9 = (TVSettingsAppsViewController *)[v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
    v10 = 0LL;
    if (v9)
    {
      uint64_t v11 = *(void *)v30;
      while (2)
      {
        v12 = 0LL;
        v13 = v10;
        do
        {
          if (*(void *)v30 != v11) {
            objc_enumerationMutation(v8);
          }
          v14 = (TVSettingsAppsViewController *)*(id *)(*((void *)&v29 + 1) + 8LL * (void)v12);
          v10 = v14;
          if (v13 == self)
          {
            uint64_t v9 = v14;
            v10 = self;
            goto LABEL_13;
          }

          v12 = (TVSettingsAppsViewController *)((char *)v12 + 1);
          v13 = v10;
        }

        while (v9 != v12);
        uint64_t v9 = (TVSettingsAppsViewController *)[v8 countByEnumeratingWithState:&v29 objects:v33 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

- (TVSettingsAppsFacade)appsFacade
{
  return self->_appsFacade;
}

- (void)setAppsFacade:(id)a3
{
}

- (TSKSettingItem)lastFocusedItem
{
  return self->_lastFocusedItem;
}

- (void)setLastFocusedItem:(id)a3
{
}

- (TSKAppIconPreviewViewController)appIconPreviewViewController
{
  return self->_appIconPreviewViewController;
}

- (void)setAppIconPreviewViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end