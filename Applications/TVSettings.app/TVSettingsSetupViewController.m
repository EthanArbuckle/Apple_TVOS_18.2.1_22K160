@interface TVSettingsSetupViewController
- (id)_resetViewController;
- (id)loadSettingGroups;
- (void)_handleResetAllSettings;
- (void)_handleRestart;
- (void)_showConfirmReset;
- (void)_showConfirmRestore;
- (void)_showFailureWithText:(id)a3;
@end

@implementation TVSettingsSetupViewController

- (id)loadSettingGroups
{
  v3 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v4 = TSKLocString(@"SetupInfoSectionTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = -[TSKSettingGroup initWithTitle:](v3, "initWithTitle:", v5);

  v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v8 = TSKLocString(@"TroubleshootingTitle");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v9,  0LL,  0LL,  0LL,  &stru_100191608));

  [v10 setShouldPresentChildController:1];
  -[NSMutableArray addObject:](v7, "addObject:", v10);
  uint64_t v11 = TSKLocString(@"WhatsNewTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v12,  0LL,  0LL,  0LL,  &stru_100191628));

  [v13 setShouldPresentChildController:1];
  -[NSMutableArray addObject:](v7, "addObject:", v13);
  -[TSKSettingGroup setSettingItems:](v6, "setSettingItems:", v7);
  v14 = objc_alloc(&OBJC_CLASS___TSKSettingGroup);
  uint64_t v15 = TSKLocString(@"SetupMaintenanceSectionTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = -[TSKSettingGroup initWithTitle:](v14, "initWithTitle:", v16);

  v18 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  uint64_t v19 = TSKLocString(@"SoftwareUpdateTitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  id v21 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v20,  0LL,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS___TVSettingsSoftwareUpdatesViewController));
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

  -[NSMutableArray addObject:](v18, "addObject:", v22);
  objc_initWeak(&location, self);
  uint64_t v23 = TSKLocString(@"ResetTitle");
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_10007101C;
  v31[3] = &unk_10018E9D8;
  objc_copyWeak(&v32, &location);
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:",  v24,  0LL,  0LL,  0LL,  v31));

  [v25 setShouldPresentChildController:1];
  [v25 setEnabledInStoreDemoMode:0];
  -[NSMutableArray addObject:](v18, "addObject:", v25);
  uint64_t v26 = TSKLocString(@"RestartTitle");
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v27,  0LL,  0LL,  0LL,  self,  "_handleRestart"));

  -[NSMutableArray addObject:](v18, "addObject:", v28);
  -[TSKSettingGroup setSettingItems:](v17, "setSettingItems:", v18);
  v34[0] = v6;
  v34[1] = v17;
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v34, 2LL));
  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);

  return v29;
}

- (id)_resetViewController
{
  uint64_t v3 = TSKLocString(@"ResetTitle");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = TSKLocString(@"ResetDescriptionText");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  v4,  v6,  1LL));

  uint64_t v8 = TSKLocString(@"ResetAllSettingsButton");
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_100071220;
  v19[3] = &unk_10018F018;
  v19[4] = self;
  v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v9,  2LL,  v19));

  [v7 addAction:v10];
  uint64_t v11 = TSKLocString(@"RestoreButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_100071228;
  v18[3] = &unk_10018F018;
  v18[4] = self;
  v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v12,  2LL,  v18));

  [v7 addAction:v13];
  uint64_t v14 = TSKLocString(@"ResetCancelButton");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v15,  1LL,  0LL));

  [v7 addAction:v16];
  [v7 setPreferredAction:v16];

  return v7;
}

- (void)_showConfirmReset
{
  uint64_t v3 = TSKLocString(@"ResetConfirmationText");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  0LL,  v4,  1LL));

  uint64_t v6 = TSKLocString(@"ResetAllSettingsButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100071398;
  v13[3] = &unk_10018F018;
  v13[4] = self;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v7,  2LL,  v13));

  [v5 addAction:v8];
  uint64_t v9 = TSKLocString(@"ResetCancelButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v10,  1LL,  0LL));

  [v5 addAction:v11];
  [v5 setPreferredAction:v11];
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsSetupViewController navigationController](self, "navigationController"));
  [v12 presentViewController:v5 animated:1 completion:0];
}

- (void)_showConfirmRestore
{
  uint64_t v3 = TSKLocString(@"RestoreConfirmationText");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  0LL,  v4,  1LL));

  uint64_t v6 = TSKLocString(@"RestoreButton");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_100071508;
  v13[3] = &unk_10018F018;
  v13[4] = self;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v7,  2LL,  v13));

  [v5 addAction:v8];
  uint64_t v9 = TSKLocString(@"ResetCancelButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v10,  1LL,  0LL));

  [v5 addAction:v11];
  [v5 setPreferredAction:v11];
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsSetupViewController navigationController](self, "navigationController"));
  [v12 presentViewController:v5 animated:1 completion:0];
}

- (void)_showFailureWithText:(id)a3
{
  id v8 = (id)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  0LL,  a3,  1LL));
  uint64_t v4 = TSKLocString(@"SettingsOK");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v5,  1LL,  0LL));

  [v8 addAction:v6];
  [v8 setPreferredAction:v6];
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsSetupViewController navigationController](self, "navigationController"));
  [v7 presentViewController:v8 animated:1 completion:0];
}

- (void)_handleResetAllSettings
{
  id v3 = objc_alloc_init(&OBJC_CLASS___TVCSActivityIndicatorViewController);
  [v3 setAllowMenuToDismiss:0];
  [v3 setActivityIndicatorDelay:0.0];
  uint64_t v4 = TSKLocString(@"ResetAllWaitForRebootText");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  [v3 setActivityText:v5];

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsSetupViewController navigationController](self, "navigationController"));
  [v6 presentViewController:v3 animated:1 completion:0];

  +[TVSBluetoothRemoteUtilities resetToFactoryDefault]( &OBJC_CLASS___TVSBluetoothRemoteUtilities,  "resetToFactoryDefault");
  +[TVCSMetrics reportAction:](&OBJC_CLASS___TVCSMetrics, "reportAction:", 4LL);
  v7 = (void *)objc_claimAutoreleasedReturnValue( +[PBSSystemServiceConnection sharedConnection]( &OBJC_CLASS___PBSSystemServiceConnection,  "sharedConnection"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 osUpdateServiceProxy]);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100071768;
  v10[3] = &unk_100191650;
  id v11 = v3;
  v12 = self;
  id v9 = v3;
  [v8 obliterateDataPreservingPaths:0 withCompletion:v10];
}

- (void)_handleRestart
{
  id v2 = (id)objc_claimAutoreleasedReturnValue(+[PBSSystemService sharedInstance](&OBJC_CLASS___PBSSystemService, "sharedInstance"));
  [v2 reboot];
}

@end