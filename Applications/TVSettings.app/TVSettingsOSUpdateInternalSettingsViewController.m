@interface TVSettingsOSUpdateInternalSettingsViewController
- (BOOL)_shouldShowAdvancedSettings;
- (NSDictionary)colorMap;
- (NSDictionary)trainMap;
- (id)_descriptionForConfiguration:(id)a3;
- (id)loadSettingGroups;
- (unint64_t)configurationLoadingState;
- (void)_clearNumericSettingItem:(id)a3;
- (void)_configurationDidChange:(id)a3;
- (void)_configurationWillChange:(id)a3;
- (void)_fetchBackupLocalConfigurations;
- (void)_fetchCurrentConfiguration;
- (void)_setShouldShowAdvancedSettings:(BOOL)a3;
- (void)_toggleAdvancedSettingsItems:(id)a3;
- (void)_updateAppleConnectItem:(id)a3;
- (void)_updateVPNItem:(id)a3;
- (void)setColorMap:(id)a3;
- (void)setConfigurationLoadingState:(unint64_t)a3;
- (void)setTrainMap:(id)a3;
- (void)viewDidLoad;
@end

@implementation TVSettingsOSUpdateInternalSettingsViewController

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TVSettingsOSUpdateInternalSettingsViewController;
  -[TVSettingsOSUpdateInternalSettingsViewController viewDidLoad](&v7, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 addObserver:self selector:"_configurationWillChange:" name:off_1001DFB50 object:0];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 addObserver:self selector:"_configurationDidChange:" name:off_1001DFB58 object:0];

  v5 = -[UITapGestureRecognizer initWithTarget:action:]( objc_alloc(&OBJC_CLASS___UITapGestureRecognizer),  "initWithTarget:action:",  self,  "_toggleAdvancedSettingsItems:");
  -[UITapGestureRecognizer setAllowedPressTypes:](v5, "setAllowedPressTypes:", &off_1001AF208);
  -[UITapGestureRecognizer setNumberOfTapsRequired:](v5, "setNumberOfTapsRequired:", 4LL);
  -[UITapGestureRecognizer setAllowedTouchTypes:](v5, "setAllowedTouchTypes:", &__NSArray0__struct);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSUpdateInternalSettingsViewController tableView](self, "tableView"));
  [v6 addGestureRecognizer:v5];

  -[TVSettingsOSUpdateInternalSettingsViewController _fetchBackupLocalConfigurations]( self,  "_fetchBackupLocalConfigurations");
  -[TVSettingsOSUpdateInternalSettingsViewController _fetchCurrentConfiguration](self, "_fetchCurrentConfiguration");
}

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSOSUpdateSettings sharedInstance](&OBJC_CLASS___PBSOSUpdateSettings, "sharedInstance"));
  v44 = -[TSKSettingGroup initWithTitle:](objc_alloc(&OBJC_CLASS___TSKSettingGroup), "initWithTitle:", 0LL);
  v45 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  objc_initWeak(&location, self);
  uint64_t v4 = TSKLocString(@"AccountsAppleConnectSettingsTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v5,  0LL,  0LL,  0LL,  &stru_100193750));

  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472LL;
  v64[2] = sub_1000B175C;
  v64[3] = &unk_10018E9B0;
  objc_copyWeak(&v65, &location);
  [v6 setUpdateBlock:v64];
  -[NSMutableArray addObject:](v45, "addObject:", v6);
  uint64_t v7 = TSKLocString(@"SettingsVPNTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v8,  0LL,  0LL,  0LL,  &stru_100193770));

  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472LL;
  v62[2] = sub_1000B17F4;
  v62[3] = &unk_10018E9B0;
  objc_copyWeak(&v63, &location);
  [v9 setUpdateBlock:v62];
  -[NSMutableArray addObject:](v45, "addObject:", v9);
  uint64_t v10 = TSKLocString(@"SettingsOSUpdateConfigurationTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  uint64_t v12 = objc_opt_class(&OBJC_CLASS___TVSettingsOSUpdateConfigurationManager);
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472LL;
  v60[2] = sub_1000B183C;
  v60[3] = &unk_10018E9D8;
  objc_copyWeak(&v61, &location);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v11,  0LL,  v12,  @"currentConfiguration",  v60));

  v58[0] = _NSConcreteStackBlock;
  v58[1] = 3221225472LL;
  v58[2] = sub_1000B18EC;
  v58[3] = &unk_10018E9B0;
  objc_copyWeak(&v59, &location);
  [v13 setUpdateBlock:v58];
  -[NSMutableArray addObject:](v45, "addObject:", v13);
  -[TSKSettingGroup setSettingItems:](v44, "setSettingItems:", v45);
  v14 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v15 = TSKLocString(@"OSUpdateMenuSectionAdvanced");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v43 = -[TSKSettingGroup initWithTitle:](v14, "initWithTitle:", v16);

  v17 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v18 = objc_alloc_init(&OBJC_CLASS___NSNumberFormatter);
  -[NSNumberFormatter setNumberStyle:](v18, "setNumberStyle:", 1LL);
  -[NSNumberFormatter setMinimum:](v18, "setMinimum:", &off_1001AD818);
  -[NSNumberFormatter setGroupingSize:](v18, "setGroupingSize:", 0LL);
  -[NSNumberFormatter setAllowsFloats:](v18, "setAllowsFloats:", 0LL);
  uint64_t v19 = TSKLocString(@"OSUpdateMenuItemCheckInterval");
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue( +[TSKTextInputSettingItem textInputItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKTextInputSettingItem,  "textInputItemWithTitle:description:representedObject:keyPath:",  v20,  0LL,  v3,  @"periodicCheckInterval"));

  [v21 setKeyboardType:4];
  [v21 setPlayButtonAction:"_clearNumericSettingItem:"];
  [v21 setTarget:self];
  uint64_t v22 = TSKLocString(@"OSUpdateTextClearNumberValue");
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  [v21 setLocalizedDescription:v23];

  [v21 setLocalizedValueFormatter:v18];
  v56[0] = _NSConcreteStackBlock;
  v56[1] = 3221225472LL;
  v56[2] = sub_1000B19E4;
  v56[3] = &unk_10018E9B0;
  objc_copyWeak(&v57, &location);
  [v21 setUpdateBlock:v56];
  -[NSMutableArray addObject:](v17, "addObject:", v21);
  uint64_t v24 = TSKLocString(@"OSUpdateMenuItemSleepDelay");
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[TSKTextInputSettingItem textInputItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKTextInputSettingItem,  "textInputItemWithTitle:description:representedObject:keyPath:",  v25,  0LL,  v3,  @"sleepCheckDelay"));

  [v26 setKeyboardType:4];
  [v26 setPlayButtonAction:"_clearNumericSettingItem:"];
  [v26 setTarget:self];
  uint64_t v27 = TSKLocString(@"OSUpdateTextClearNumberValue");
  v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
  [v26 setLocalizedDescription:v28];

  [v26 setLocalizedValueFormatter:v18];
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472LL;
  v54[2] = sub_1000B1A34;
  v54[3] = &unk_10018E9B0;
  objc_copyWeak(&v55, &location);
  [v26 setUpdateBlock:v54];
  -[NSMutableArray addObject:](v17, "addObject:", v26);
  uint64_t v29 = TSKLocString(@"OSUpdateMenuItemSkipUpdate");
  v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
  v31 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v30,  0LL,  v3,  @"shouldSkipUpdate",  0LL,  0LL));

  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472LL;
  v52[2] = sub_1000B1A84;
  v52[3] = &unk_10018E9B0;
  objc_copyWeak(&v53, &location);
  [v31 setUpdateBlock:v52];
  -[NSMutableArray addObject:](v17, "addObject:", v31);
  uint64_t v32 = TSKLocString(@"OSUpdateMenuItemAllowReflash");
  v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
  v34 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v33,  0LL,  v3,  @"allowReflashSameVersion",  0LL,  0LL));

  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472LL;
  v50[2] = sub_1000B1AD4;
  v50[3] = &unk_10018E9B0;
  objc_copyWeak(&v51, &location);
  [v34 setUpdateBlock:v50];
  -[NSMutableArray addObject:](v17, "addObject:", v34);
  uint64_t v35 = TSKLocString(@"OSUpdateMenuItemAllowRollback");
  v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
  v37 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v36,  0LL,  v3,  @"allowFlashRollbackVersion",  0LL,  0LL));

  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472LL;
  v48[2] = sub_1000B1B24;
  v48[3] = &unk_10018E9B0;
  objc_copyWeak(&v49, &location);
  [v37 setUpdateBlock:v48];
  -[NSMutableArray addObject:](v17, "addObject:", v37);
  uint64_t v38 = TSKLocString(@"OSUpdateMenuItemSkipObliterate");
  v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v39,  0LL,  v3,  @"shouldSkipObliterate",  0LL,  0LL));

  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472LL;
  v46[2] = sub_1000B1B74;
  v46[3] = &unk_10018E9B0;
  objc_copyWeak(&v47, &location);
  [v40 setUpdateBlock:v46];
  -[NSMutableArray addObject:](v17, "addObject:", v40);
  -[TSKSettingGroup setSettingItems:](v43, "setSettingItems:", v17);
  v67[0] = v44;
  v67[1] = v43;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v67, 2LL));
  objc_destroyWeak(&v47);
  objc_destroyWeak(&v49);
  objc_destroyWeak(&v51);
  objc_destroyWeak(&v53);
  objc_destroyWeak(&v55);
  objc_destroyWeak(&v57);

  objc_destroyWeak(&v59);
  objc_destroyWeak(&v61);
  objc_destroyWeak(&v63);
  objc_destroyWeak(&v65);
  objc_destroyWeak(&location);

  return v41;
}

- (void)_fetchBackupLocalConfigurations
{
  id v5 = (id)objc_claimAutoreleasedReturnValue( +[TVSettingsOSUpdateConfigurationManager backupLocalConfigurations]( &OBJC_CLASS___TVSettingsOSUpdateConfigurationManager,  "backupLocalConfigurations"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSUpdateInternalSettingsViewController colorMap](self, "colorMap"));
  id v4 = [v3 count];

  if (!v4) {
    -[TVSettingsOSUpdateInternalSettingsViewController setColorMap:](self, "setColorMap:", v5);
  }
}

- (void)_fetchCurrentConfiguration
{
  dispatch_time_t v3 = dispatch_time(0LL, 500000000LL);
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(21LL, 0LL);
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000B1CDC;
  block[3] = &unk_10018E440;
  block[4] = self;
  dispatch_after(v3, v5, block);
}

- (void)_configurationWillChange:(id)a3
{
}

- (void)_configurationDidChange:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsOSUpdateInternalSettingsViewController trainMap](self, "trainMap", a3));

  if (v4) {
    -[TVSettingsOSUpdateInternalSettingsViewController setConfigurationLoadingState:]( self,  "setConfigurationLoadingState:",  0LL);
  }
  -[TVSettingsOSUpdateInternalSettingsViewController reloadSettingsIfNeeded](self, "reloadSettingsIfNeeded");
}

- (void)_clearNumericSettingItem:(id)a3
{
}

- (BOOL)_shouldShowAdvancedSettings
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  dispatch_time_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 bundleIdentifier]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[TVSPreferences preferencesWithDomain:](&OBJC_CLASS___TVSPreferences, "preferencesWithDomain:", v3));

  LOBYTE(v2) = [v4 BOOLForKey:@"OSUpdateAdvancedSettingsEnabled" defaultValue:0];
  return (char)v2;
}

- (void)_setShouldShowAdvancedSettings:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](&OBJC_CLASS___NSBundle, "mainBundle"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleIdentifier]);
  id v6 = (id)objc_claimAutoreleasedReturnValue(+[TVSPreferences preferencesWithDomain:](&OBJC_CLASS___TVSPreferences, "preferencesWithDomain:", v5));

  if ([v6 BOOLForKey:@"OSUpdateAdvancedSettingsEnabled" defaultValue:0] != v3)
  {
    [v6 setBool:v3 forKey:@"OSUpdateAdvancedSettingsEnabled"];
    [v6 synchronize];
  }
}

- (void)_toggleAdvancedSettingsItems:(id)a3
{
}

- (void)_updateAppleConnectItem:(id)a3
{
  id v10 = a3;
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[PBSAppleConnectSettings sharedInstance](&OBJC_CLASS___PBSAppleConnectSettings, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 accountID]);
  if (![v4 length])
  {
    uint64_t v7 = @"OSUpdateAppleConnectNoAccountStatus";
    goto LABEL_5;
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 password]);
  id v6 = [v5 length];

  if (!v6)
  {
    uint64_t v7 = @"OSUpdateAppleConnectNoPasswordStatus";
LABEL_5:
    uint64_t v8 = TSKLocString(v7);
    uint64_t v9 = objc_claimAutoreleasedReturnValue(v8);

    id v4 = (void *)v9;
  }

  [v10 setLocalizedValue:v4];
}

- (void)_updateVPNItem:(id)a3
{
  id v3 = a3;
  id v13 = (id)objc_claimAutoreleasedReturnValue(+[PBSAppleConnectSettings sharedInstance](&OBJC_CLASS___PBSAppleConnectSettings, "sharedInstance"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[PBSVPNSettings sharedInstance](&OBJC_CLASS___PBSVPNSettings, "sharedInstance"));
  unsigned int v5 = [v4 isProfileLoaded];

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v13 accountID]);
  if ([v6 length])
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v13 password]);
    id v8 = [v7 length];

    if (v8) {
      char v9 = v5;
    }
    else {
      char v9 = 0;
    }
    if ((v9 & 1) != 0)
    {
      id v10 = @"OSUpdateVPNLoadedStatus";
      goto LABEL_11;
    }
  }

  else
  {
  }

  if (v5) {
    id v10 = @"OSUpdateVPNLoadedNoAppleConnectStatus";
  }
  else {
    id v10 = @"OSUpdateVPNNotLoadedStatus";
  }
LABEL_11:
  uint64_t v11 = TSKLocString(v10);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  [v3 setLocalizedValue:v12];
}

- (id)_descriptionForConfiguration:(id)a3
{
  if (a3)
  {
    id v3 = (void *)objc_claimAutoreleasedReturnValue([a3 longDescription]);
  }

  else
  {
    uint64_t v4 = TSKLocString(@"SettingsOSUpdateConfigurationNoTrainsError");
    id v3 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }

  return v3;
}

- (NSDictionary)trainMap
{
  return self->_trainMap;
}

- (void)setTrainMap:(id)a3
{
}

- (NSDictionary)colorMap
{
  return self->_colorMap;
}

- (void)setColorMap:(id)a3
{
}

- (unint64_t)configurationLoadingState
{
  return self->_configurationLoadingState;
}

- (void)setConfigurationLoadingState:(unint64_t)a3
{
  self->_configurationLoadingState = a3;
}

- (void).cxx_destruct
{
}

@end