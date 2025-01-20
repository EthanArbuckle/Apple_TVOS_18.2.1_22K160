@interface VSDeveloperSettingsViewController_tvOS
- (VSDeveloperSettingsFacade)facade;
- (VSDeveloperSettingsViewController_tvOS)initWithCoder:(id)a3;
- (VSDeveloperSettingsViewController_tvOS)initWithStyle:(int64_t)a3;
- (VSDeveloperSettingsViewModel)viewModel;
- (id)loadSettingGroups;
- (void)_startObservingViewModel:(id)a3;
- (void)_stopObservingViewModel:(id)a3;
- (void)dealloc;
- (void)didUpdateIsCacheBusterEnabledFrom:(BOOL)a3 to:(BOOL)a4;
- (void)didUpdateRequestTimeoutsDisabledFrom:(BOOL)a3 to:(BOOL)a4;
- (void)didUpdateSimulateExpiredTokenFrom:(BOOL)a3 to:(BOOL)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setFacade:(id)a3;
- (void)setViewModel:(id)a3;
- (void)settingsFacadeSettingsDidChangeNotification:(id)a3;
@end

@implementation VSDeveloperSettingsViewController_tvOS

- (VSDeveloperSettingsViewController_tvOS)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VSDeveloperSettingsViewController_tvOS;
  v3 = -[VSDeveloperSettingsViewController_tvOS initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3) {
    sub_BE30(v3);
  }
  return v4;
}

- (VSDeveloperSettingsViewController_tvOS)initWithStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VSDeveloperSettingsViewController_tvOS;
  v3 = -[VSDeveloperSettingsViewController_tvOS initWithStyle:](&v6, "initWithStyle:", a3);
  v4 = v3;
  if (v3) {
    sub_BE30(v3);
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___VSDeveloperSettingsViewController_tvOS;
  -[VSDeveloperSettingsViewController_tvOS dealloc](&v3, "dealloc");
}

- (void)_startObservingViewModel:(id)a3
{
  v4 = off_1A0D8;
  id v5 = a3;
  [v5 addObserver:self forKeyPath:@"cacheBusterEnabled" options:3 context:v4];
  [v5 addObserver:self forKeyPath:@"requestTimeoutsDisabled" options:3 context:off_1A0E0];
  [v5 addObserver:self forKeyPath:@"simulateExpiredToken" options:3 context:off_1A0E8];
}

- (void)_stopObservingViewModel:(id)a3
{
  v4 = off_1A0D8;
  id v5 = a3;
  [v5 removeObserver:self forKeyPath:@"cacheBusterEnabled" context:v4];
  [v5 removeObserver:self forKeyPath:@"requestTimeoutsDisabled" context:off_1A0E0];
  [v5 removeObserver:self forKeyPath:@"simulateExpiredToken" context:off_1A0E8];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (off_1A0D8 == a6)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:NSKeyValueChangeOldKey]);
    id v15 = [v14 BOOLValue];

    v16 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:NSKeyValueChangeNewKey]);
    id v17 = [v16 BOOLValue];

    -[VSDeveloperSettingsViewController_tvOS didUpdateIsCacheBusterEnabledFrom:to:]( self,  "didUpdateIsCacheBusterEnabledFrom:to:",  v15,  v17);
  }

  else if (off_1A0E0 == a6)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:NSKeyValueChangeOldKey]);
    id v19 = [v18 BOOLValue];

    v20 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:NSKeyValueChangeNewKey]);
    id v21 = [v20 BOOLValue];

    -[VSDeveloperSettingsViewController_tvOS didUpdateRequestTimeoutsDisabledFrom:to:]( self,  "didUpdateRequestTimeoutsDisabledFrom:to:",  v19,  v21);
  }

  else if (off_1A0E8 == a6)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:NSKeyValueChangeOldKey]);
    id v23 = [v22 BOOLValue];

    v24 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:NSKeyValueChangeNewKey]);
    id v25 = [v24 BOOLValue];

    -[VSDeveloperSettingsViewController_tvOS didUpdateSimulateExpiredTokenFrom:to:]( self,  "didUpdateSimulateExpiredTokenFrom:to:",  v23,  v25);
  }

  else
  {
    v26.receiver = self;
    v26.super_class = (Class)&OBJC_CLASS___VSDeveloperSettingsViewController_tvOS;
    -[VSDeveloperSettingsViewController_tvOS observeValueForKeyPath:ofObject:change:context:]( &v26,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
  }
}

- (void)didUpdateIsCacheBusterEnabledFrom:(BOOL)a3 to:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsViewController_tvOS facade](self, "facade"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 settings]);
  id v9 = [v8 copy];

  if ([v9 cacheBusterEnabled] != v4)
  {
    [v9 setCacheBusterEnabled:v4];
    objc_initWeak(&location, self);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsViewController_tvOS facade](self, "facade"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_C44C;
    v11[3] = &unk_14A40;
    objc_copyWeak(&v12, &location);
    BOOL v13 = a3;
    [v10 updateDeveloperSettings:v9 withCompletionHandler:v11];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)didUpdateRequestTimeoutsDisabledFrom:(BOOL)a3 to:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsViewController_tvOS facade](self, "facade"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 settings]);
  id v9 = [v8 copy];

  if ([v9 requestTimeoutsDisabled] != v4)
  {
    [v9 setRequestTimeoutsDisabled:v4];
    objc_initWeak(&location, self);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsViewController_tvOS facade](self, "facade"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_C684;
    v11[3] = &unk_14A40;
    objc_copyWeak(&v12, &location);
    BOOL v13 = a3;
    [v10 updateDeveloperSettings:v9 withCompletionHandler:v11];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (void)didUpdateSimulateExpiredTokenFrom:(BOOL)a3 to:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsViewController_tvOS facade](self, "facade"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 settings]);
  id v9 = [v8 copy];

  if ([v9 simulateExpiredToken] != v4)
  {
    [v9 setSimulateExpiredToken:v4];
    objc_initWeak(&location, self);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsViewController_tvOS facade](self, "facade"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_C8BC;
    v11[3] = &unk_14A40;
    objc_copyWeak(&v12, &location);
    BOOL v13 = a3;
    [v10 updateDeveloperSettings:v9 withCompletionHandler:v11];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

- (id)loadSettingGroups
{
  uint64_t v3 = VSDefaultLogObject(self);
  BOOL v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v48 = "-[VSDeveloperSettingsViewController_tvOS loadSettingGroups]";
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  v42 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsViewController_tvOS facade](self, "facade"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsViewController_tvOS viewModel](self, "viewModel"));
  v40 = (void *)objc_claimAutoreleasedReturnValue( +[TSKListSettingGroup listGroupWithTitle:representedObject:keyPath:configurationBlock:]( &OBJC_CLASS___TSKListSettingGroup,  "listGroupWithTitle:representedObject:keyPath:configurationBlock:",  @"Providers",  v39,  @"providers",  &stru_14AC0));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  v37 = (void *)objc_claimAutoreleasedReturnValue([v5 localizedStringForKey:@"DEVELOPER_PROVIDERS_TITLE" value:0 table:0]);

  [v40 setLocalizedTitle:v37];
  -[NSMutableArray addObject:](v42, "addObject:", v40);
  id v38 = objc_alloc_init(&OBJC_CLASS___TSKSettingGroup);
  -[NSMutableArray addObject:](v42, "addObject:", v38);
  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue( [v6 localizedStringForKey:@"IDENTITY_PROVIDER_PICKER_OTHER_PROVIDERS_ROW_TITLE_DEVELOPER" value:0 table:0]);

  v44[1] = _NSConcreteStackBlock;
  v44[2] = (id)3221225472LL;
  v44[3] = sub_D1B8;
  v44[4] = &unk_14AE8;
  id v45 = v7;
  id v30 = v45;
  v36 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerBlock:"));
  v46 = v36;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v46, 1LL));
  [v38 setSettingItems:v8];

  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  v35 = (void *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:@"DEVELOPER_SET_TOP_BOX_MODE_OPTION_TITLE" value:0 table:0]);

  id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  v34 = (void *)objc_claimAutoreleasedReturnValue( [v11 localizedStringForKey:@"DEVELOPER_SET_TOP_BOX_MODE_OPTION_DESCRIPTION" value:0 table:0]);

  id v12 = +[TSKSettingItem childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:]( &OBJC_CLASS___TSKSettingItem,  "childPaneItemWithTitle:description:representedObject:keyPath:childControllerClass:",  v35,  v34,  v39,  @"isSetTopBoxEnabledStatus",  objc_opt_class(&OBJC_CLASS___VSDeveloperSettingsSetTopBoxViewController_tvOS));
  v33 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_initWeak((id *)buf, self);
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472LL;
  v43[2] = sub_D1F8;
  v43[3] = &unk_14658;
  objc_copyWeak(v44, (id *)buf);
  [v33 setUpdateBlock:v43];
  -[NSMutableArray addObject:](v9, "addObject:", v33);
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  v32 = (void *)objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"DEVELOPER_IS_CACHEBUSTER_ENABLED_ACTION_TITLE" value:0 table:0]);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  v31 = (void *)objc_claimAutoreleasedReturnValue( [v14 localizedStringForKey:@"DEVELOPER_IS_CACHEBUSTER_ENABLED_ACTION_DESCRIPTION" value:0 table:0]);

  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v32,  v31,  v41,  @"cacheBusterEnabled",  0LL,  0LL));
  -[NSMutableArray addObject:](v9, "addObject:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue( [v16 localizedStringForKey:@"DEVELOPER_REQUEST_TIMEOUTS_TITLE" value:0 table:0]);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  id v19 = (void *)objc_claimAutoreleasedReturnValue( [v18 localizedStringForKey:@"DEVELOPER_REQUEST_TIMEOUTS_DESCRIPTION" value:0 table:0]);

  v20 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v17,  v19,  v41,  @"requestTimeoutsDisabled",  0LL,  0LL));
  -[NSMutableArray addObject:](v9, "addObject:", v20);
  id v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  v22 = (void *)objc_claimAutoreleasedReturnValue( [v21 localizedStringForKey:@"DEVELOPER_SIMULATE_EXPIRED_TOKEN_TITLE" value:0 table:0]);

  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  v24 = (void *)objc_claimAutoreleasedReturnValue( [v23 localizedStringForKey:@"DEVELOPER_SIMULATE_EXPIRED_TOKEN_DESCRIPTION" value:0 table:0]);

  id v25 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v22,  v24,  v41,  @"simulateExpiredToken",  0LL,  0LL));
  -[NSMutableArray addObject:](v9, "addObject:", v25);
  objc_super v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  v27 = (void *)objc_claimAutoreleasedReturnValue( [v26 localizedStringForKey:@"DEVELOPER_OPTIONS_GROUP_TITLE" value:0 table:0]);

  v28 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingGroup groupWithTitle:settingItems:]( &OBJC_CLASS___TSKSettingGroup,  "groupWithTitle:settingItems:",  v27,  v9));
  -[NSMutableArray addObject:](v42, "addObject:", v28);

  objc_destroyWeak(v44);
  objc_destroyWeak((id *)buf);

  return v42;
}

- (void)settingsFacadeSettingsDidChangeNotification:(id)a3
{
  uint64_t v4 = VSDefaultLogObject(self);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315138;
    id v12 = "-[VSDeveloperSettingsViewController_tvOS settingsFacadeSettingsDidChangeNotification:]";
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v11, 0xCu);
  }

  objc_super v6 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsViewController_tvOS facade](self, "facade"));
  v7 = (void *)objc_claimAutoreleasedReturnValue([v6 settings]);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsViewController_tvOS viewModel](self, "viewModel"));
  LODWORD(v6) = [v8 cacheBusterEnabled];
  unsigned int v9 = [v8 requestTimeoutsDisabled];
  unsigned int v10 = [v8 simulateExpiredToken];
}

- (VSDeveloperSettingsFacade)facade
{
  return self->_facade;
}

- (void)setFacade:(id)a3
{
}

- (VSDeveloperSettingsViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end