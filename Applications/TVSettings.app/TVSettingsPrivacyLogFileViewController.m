@interface TVSettingsPrivacyLogFileViewController
- (BOOL)allowViewing;
- (NSString)logPath;
- (TVSettingsDiagnosticLogsFacade)logsFacade;
- (id)loadSettingGroups;
- (void)_airDropItem:(id)a3;
- (void)_deleteItem:(id)a3;
- (void)_viewItem:(id)a3;
- (void)setAllowViewing:(BOOL)a3;
- (void)setLogPath:(id)a3;
- (void)setLogsFacade:(id)a3;
@end

@implementation TVSettingsPrivacyLogFileViewController

- (id)loadSettingGroups
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPrivacyLogFileViewController logPath](self, "logPath"));
  id v29 = 0LL;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v3 attributesOfItemAtPath:v4 error:&v29]);
  id v6 = v29;

  id v7 = [v5 fileSize];
  if (v7)
  {
    uint64_t v8 = objc_claimAutoreleasedReturnValue( +[NSByteCountFormatter stringFromByteCount:countStyle:]( &OBJC_CLASS___NSByteCountFormatter,  "stringFromByteCount:countStyle:",  v7,  0LL));
  }

  else
  {
    uint64_t v9 = TSKLocString(@"PrivacyLogFileUnknownFileSizeText");
    uint64_t v8 = objc_claimAutoreleasedReturnValue(v9);
  }

  v10 = (void *)v8;
  uint64_t v11 = TSKLocString(@"PrivacyLogFileInstructionText");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](&OBJC_CLASS___UIDevice, "currentDevice"));
  v14 = (void *)objc_claimAutoreleasedReturnValue([v13 name]);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v12, v10, v14));

  v16 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  if (-[TVSettingsPrivacyLogFileViewController allowViewing](self, "allowViewing"))
  {
    uint64_t v17 = TSKLocString(@"PrivacyLogFileViewMenuitem");
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v18,  0LL,  0LL,  0LL,  self,  "_viewItem:"));

    [v19 setLocalizedDescription:v15];
    [v19 setEnabledInStoreDemoMode:1];
    -[NSMutableArray addObject:](v16, "addObject:", v19);
  }

  uint64_t v20 = TSKLocString(@"PrivacyLogFileExportMenuitem");
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v21,  0LL,  0LL,  0LL,  self,  "_airDropItem:"));

  [v22 setLocalizedDescription:v15];
  [v22 setEnabledInStoreDemoMode:1];
  -[NSMutableArray addObject:](v16, "addObject:", v22);
  uint64_t v23 = TSKLocString(@"PrivacyLogFileDeleteMenuItem");
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v24,  0LL,  0LL,  0LL,  self,  "_deleteItem:"));

  [v25 setLocalizedDescription:v15];
  -[NSMutableArray addObject:](v16, "addObject:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  0LL,  v16));
  v30 = v26;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL));

  return v27;
}

- (void)_viewItem:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPrivacyLogFileViewController logPath](self, "logPath", a3));
  unsigned int v5 = +[TVSettingsDiagnosticLogsFacade filePathIsPowerLog:]( &OBJC_CLASS___TVSettingsDiagnosticLogsFacade,  "filePathIsPowerLog:",  v4);

  if (v5)
  {
    v14 = objc_alloc_init(&OBJC_CLASS___TVSettingsPrivacyPowerLogViewController);
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPrivacyLogFileViewController logPath](self, "logPath"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 lastPathComponent]);
    -[TVSettingsPrivacyPowerLogViewController setTitle:](v14, "setTitle:", v7);

    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPrivacyLogFileViewController logPath](self, "logPath"));
    -[TVSettingsPrivacyPowerLogViewController setLogPath:](v14, "setLogPath:", v8);
  }

  else
  {
    id v9 = objc_alloc(&OBJC_CLASS___TVSUITextAlertController);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPrivacyLogFileViewController logPath](self, "logPath"));
    v10 = (void *)objc_claimAutoreleasedReturnValue([v8 lastPathComponent]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPrivacyLogFileViewController logPath](self, "logPath"));
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[TVSettingsDiagnosticLogsFacade textForContentsOfLog:]( &OBJC_CLASS___TVSettingsDiagnosticLogsFacade,  "textForContentsOfLog:",  v11));
    v14 = (TVSettingsPrivacyPowerLogViewController *)[v9 initWithTitle:v10 text:v12];
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPrivacyLogFileViewController navigationController](self, "navigationController"));
  [v13 presentViewController:v14 animated:1 completion:0];
}

- (void)_airDropItem:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPrivacyLogFileViewController logPath](self, "logPath"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](&OBJC_CLASS___NSURL, "fileURLWithPath:", v5));

  id v7 = objc_alloc(&OBJC_CLASS___SFAirDropSharingViewControllerTV);
  v16 = v6;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v16, 1LL));
  id v9 = [v7 initWithSharingItems:v8];

  objc_initWeak(&location, v9);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000C5874;
  v12[3] = &unk_10018F5A0;
  id v10 = v6;
  id v13 = v10;
  objc_copyWeak(&v14, &location);
  [v9 setCompletionHandler:v12];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPrivacyLogFileViewController navigationController](self, "navigationController"));
  [v11 presentViewController:v9 animated:1 completion:0];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)_deleteItem:(id)a3
{
  id v4 = a3;
  unsigned int v5 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPrivacyLogFileViewController logPath](self, "logPath"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 lastPathComponent]);

  uint64_t v7 = TSKLocString(@"PrivacyLogFileDeleteAlertTitle");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v8, v6));

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertController alertControllerWithTitle:message:preferredStyle:]( &OBJC_CLASS___UIAlertController,  "alertControllerWithTitle:message:preferredStyle:",  0LL,  v9,  1LL));
  objc_initWeak(&location, self);
  uint64_t v11 = TSKLocString(@"PrivacyLogFileDeleteMenuItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472LL;
  v18[2] = sub_1000C5B64;
  v18[3] = &unk_10018F4E8;
  objc_copyWeak(&v19, &location);
  id v13 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v12,  2LL,  v18));

  [v10 addAction:v13];
  uint64_t v14 = TSKLocString(@"Cancel");
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue( +[UIAlertAction actionWithTitle:style:handler:]( &OBJC_CLASS___UIAlertAction,  "actionWithTitle:style:handler:",  v15,  1LL,  0LL));

  [v10 addAction:v16];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[TVSettingsPrivacyLogFileViewController navigationController](self, "navigationController"));
  [v17 presentViewController:v10 animated:1 completion:0];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

- (NSString)logPath
{
  return self->_logPath;
}

- (void)setLogPath:(id)a3
{
}

- (TVSettingsDiagnosticLogsFacade)logsFacade
{
  return self->_logsFacade;
}

- (void)setLogsFacade:(id)a3
{
}

- (BOOL)allowViewing
{
  return self->_allowViewing;
}

- (void)setAllowViewing:(BOOL)a3
{
  self->_allowViewing = a3;
}

- (void).cxx_destruct
{
}

@end