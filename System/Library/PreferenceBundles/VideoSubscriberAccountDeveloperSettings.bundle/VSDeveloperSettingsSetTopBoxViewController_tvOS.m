@interface VSDeveloperSettingsSetTopBoxViewController_tvOS
- (BOOL)tableView:(id)a3 shouldHandleLongPressForItemAtIndexPath:(id)a4;
- (NSOperationQueue)privateQueue;
- (VSDeveloperSettingsFacade)facade;
- (VSDeveloperSettingsSetTopBoxViewController_tvOS)initWithCoder:(id)a3;
- (VSDeveloperSettingsSetTopBoxViewController_tvOS)initWithStyle:(int64_t)a3;
- (VSDeveloperSettingsSetTopBoxViewModel)viewModel;
- (VSDevice)device;
- (id)loadSettingGroups;
- (void)_startObservingViewModel:(id)a3;
- (void)_stopObservingViewModel:(id)a3;
- (void)clearSubscription;
- (void)dealloc;
- (void)deviceSetTopBoxProfileChanged:(id)a3;
- (void)didUpdateSetTopBoxBundleIdentifierFrom:(id)a3 to:(id)a4;
- (void)didUpdateSetTopBoxModeEnabledFrom:(BOOL)a3 to:(BOOL)a4;
- (void)didUpdateSetTopBoxSupportsOptOutFrom:(BOOL)a3 to:(BOOL)a4;
- (void)didUpdateSetTopBoxUseProfileTokenFrom:(BOOL)a3 to:(BOOL)a4;
- (void)didUpdateSetTopBoxUserTokenDisplayValue:(id)a3;
- (void)didUpdateSetTopBoxUserTokenFrom:(id)a3 to:(id)a4;
- (void)identityProviderPickerViewController:(id)a3 didPickIdentityProvider:(id)a4;
- (void)identityProviderPickerViewControllerDidCancel:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)selectDeveloperIdentityProvider;
- (void)setDevice:(id)a3;
- (void)setFacade:(id)a3;
- (void)setPrivateQueue:(id)a3;
- (void)setViewModel:(id)a3;
- (void)settingsFacadeSettingsDidChangeNotification:(id)a3;
- (void)subscriptionsDidChangeNotification:(id)a3;
- (void)tableView:(id)a3 didReceiveLongPressForItemAtIndexPath:(id)a4;
- (void)testSetup;
- (void)updateSubscription;
- (void)viewSubscription;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation VSDeveloperSettingsSetTopBoxViewController_tvOS

- (VSDeveloperSettingsSetTopBoxViewController_tvOS)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VSDeveloperSettingsSetTopBoxViewController_tvOS;
  v3 = -[VSDeveloperSettingsSetTopBoxViewController_tvOS initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3) {
    sub_519C(v3);
  }
  return v4;
}

- (VSDeveloperSettingsSetTopBoxViewController_tvOS)initWithStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___VSDeveloperSettingsSetTopBoxViewController_tvOS;
  v3 = -[VSDeveloperSettingsSetTopBoxViewController_tvOS initWithStyle:](&v6, "initWithStyle:", a3);
  v4 = v3;
  if (v3) {
    sub_519C(v3);
  }
  return v4;
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsSetTopBoxViewController_tvOS device](self, "device"));
  [v3 unregisterObserver:self];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsSetTopBoxViewController_tvOS viewModel](self, "viewModel"));
  -[VSDeveloperSettingsSetTopBoxViewController_tvOS _stopObservingViewModel:](self, "_stopObservingViewModel:", v4);

  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___VSDeveloperSettingsSetTopBoxViewController_tvOS;
  -[VSDeveloperSettingsSetTopBoxViewController_tvOS dealloc](&v5, "dealloc");
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___VSDeveloperSettingsSetTopBoxViewController_tvOS;
  -[VSDeveloperSettingsSetTopBoxViewController_tvOS viewWillAppear:](&v4, "viewWillAppear:", a3);
  -[VSDeveloperSettingsSetTopBoxViewController_tvOS updateSubscription](self, "updateSubscription");
}

- (void)_startObservingViewModel:(id)a3
{
  objc_super v4 = off_19F08;
  id v5 = a3;
  [v5 addObserver:self forKeyPath:@"setTopBoxUserToken" options:3 context:v4];
  [v5 addObserver:self forKeyPath:@"setTopBoxUserTokenDisplayValue" options:1 context:off_19F10];
  [v5 addObserver:self forKeyPath:@"setTopBoxBundleIdentifier" options:3 context:off_19F18];
  [v5 addObserver:self forKeyPath:@"setTopBoxModeEnabled" options:3 context:off_19F20];
  [v5 addObserver:self forKeyPath:@"setTopBoxSupportsOptOut" options:3 context:off_19F28];
  [v5 addObserver:self forKeyPath:@"setTopBoxUseProfileToken" options:3 context:off_19F30];
}

- (void)_stopObservingViewModel:(id)a3
{
  objc_super v4 = off_19F08;
  id v5 = a3;
  [v5 removeObserver:self forKeyPath:@"setTopBoxUserToken" context:v4];
  [v5 removeObserver:self forKeyPath:@"setTopBoxUserTokenDisplayValue" context:off_19F10];
  [v5 removeObserver:self forKeyPath:@"setTopBoxBundleIdentifier" context:off_19F18];
  [v5 removeObserver:self forKeyPath:@"setTopBoxModeEnabled" context:off_19F20];
  [v5 removeObserver:self forKeyPath:@"setTopBoxSupportsOptOut" context:off_19F28];
  [v5 removeObserver:self forKeyPath:@"setTopBoxUseProfileToken" context:off_19F30];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = v12;
  if (off_19F08 == a6)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:NSKeyValueChangeOldKey]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:NSKeyValueChangeNewKey]);
    -[VSDeveloperSettingsSetTopBoxViewController_tvOS didUpdateSetTopBoxUserTokenFrom:to:]( self,  "didUpdateSetTopBoxUserTokenFrom:to:",  v14,  v15);
LABEL_11:

    goto LABEL_12;
  }

  if (off_19F10 == a6)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:NSKeyValueChangeNewKey]);
    -[VSDeveloperSettingsSetTopBoxViewController_tvOS didUpdateSetTopBoxUserTokenDisplayValue:]( self,  "didUpdateSetTopBoxUserTokenDisplayValue:",  v14);
LABEL_12:

    goto LABEL_13;
  }

  if (off_19F18 == a6)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:NSKeyValueChangeOldKey]);
    v15 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:NSKeyValueChangeNewKey]);
    -[VSDeveloperSettingsSetTopBoxViewController_tvOS didUpdateSetTopBoxBundleIdentifierFrom:to:]( self,  "didUpdateSetTopBoxBundleIdentifierFrom:to:",  v14,  v15);
    goto LABEL_11;
  }

  if (off_19F20 == a6)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:NSKeyValueChangeOldKey]);
    id v17 = [v16 BOOLValue];

    v18 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:NSKeyValueChangeNewKey]);
    id v19 = [v18 BOOLValue];

    -[VSDeveloperSettingsSetTopBoxViewController_tvOS didUpdateSetTopBoxModeEnabledFrom:to:]( self,  "didUpdateSetTopBoxModeEnabledFrom:to:",  v17,  v19);
  }

  else if (off_19F28 == a6)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:NSKeyValueChangeOldKey]);
    id v21 = [v20 BOOLValue];

    v22 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:NSKeyValueChangeNewKey]);
    id v23 = [v22 BOOLValue];

    -[VSDeveloperSettingsSetTopBoxViewController_tvOS didUpdateSetTopBoxSupportsOptOutFrom:to:]( self,  "didUpdateSetTopBoxSupportsOptOutFrom:to:",  v21,  v23);
  }

  else if (off_19F30 == a6)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKey:NSKeyValueChangeOldKey]);
    id v25 = [v24 BOOLValue];

    v26 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:NSKeyValueChangeNewKey]);
    id v27 = [v26 BOOLValue];

    -[VSDeveloperSettingsSetTopBoxViewController_tvOS didUpdateSetTopBoxUseProfileTokenFrom:to:]( self,  "didUpdateSetTopBoxUseProfileTokenFrom:to:",  v25,  v27);
  }

  else
  {
    v28.receiver = self;
    v28.super_class = (Class)&OBJC_CLASS___VSDeveloperSettingsSetTopBoxViewController_tvOS;
    -[VSDeveloperSettingsSetTopBoxViewController_tvOS observeValueForKeyPath:ofObject:change:context:]( &v28,  "observeValueForKeyPath:ofObject:change:context:",  v10,  v11,  v12,  a6);
  }

- (void)didUpdateSetTopBoxModeEnabledFrom:(BOOL)a3 to:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsSetTopBoxViewController_tvOS facade](self, "facade"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 settings]);
  id v9 = [v8 copy];

  if ([v9 isInSetTopBoxMode] != v4)
  {
    [v9 setIsInSetTopBoxMode:v4];
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsSetTopBoxViewController_tvOS facade](self, "facade"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_59EC;
    v11[3] = &unk_14440;
    v11[4] = self;
    BOOL v12 = a3;
    [v10 updateDeveloperSettings:v9 withCompletionHandler:v11];
  }
}

- (void)didUpdateSetTopBoxBundleIdentifierFrom:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsSetTopBoxViewController_tvOS facade](self, "facade"));
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 settings]);
  id v10 = [(id)v9 copy];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 setTopBoxBundleIdentifier]);
  LOBYTE(v9) = [v11 isEqualToString:v7];

  if ((v9 & 1) == 0)
  {
    [v10 setSetTopBoxBundleIdentifier:v7];
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsSetTopBoxViewController_tvOS facade](self, "facade"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_5C10;
    v13[3] = &unk_14490;
    v13[4] = self;
    id v14 = v6;
    [v12 updateDeveloperSettings:v10 withCompletionHandler:v13];
  }
}

- (void)didUpdateSetTopBoxUserTokenFrom:(id)a3 to:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsSetTopBoxViewController_tvOS facade](self, "facade"));
  uint64_t v9 = objc_claimAutoreleasedReturnValue([v8 settings]);
  id v10 = [(id)v9 copy];

  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 setTopBoxUserToken]);
  LOBYTE(v9) = [v11 isEqualToString:v7];

  if ((v9 & 1) == 0)
  {
    [v10 setSetTopBoxUserToken:v7];
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsSetTopBoxViewController_tvOS facade](self, "facade"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_5E58;
    v13[3] = &unk_144E0;
    v13[4] = self;
    id v14 = v7;
    id v15 = v6;
    [v12 updateDeveloperSettings:v10 withCompletionHandler:v13];
  }
}

- (void)didUpdateSetTopBoxSupportsOptOutFrom:(BOOL)a3 to:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsSetTopBoxViewController_tvOS facade](self, "facade"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 settings]);
  id v9 = [v8 copy];

  if ([v9 setTopBoxSupportsOptOut] != v4)
  {
    [v9 setSetTopBoxSupportsOptOut:v4];
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsSetTopBoxViewController_tvOS facade](self, "facade"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_60CC;
    v11[3] = &unk_14440;
    v11[4] = self;
    BOOL v12 = a3;
    [v10 updateDeveloperSettings:v9 withCompletionHandler:v11];
  }
}

- (void)didUpdateSetTopBoxUserTokenDisplayValue:(id)a3
{
  id v7 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsSetTopBoxViewController_tvOS viewModel](self, "viewModel"));
  unsigned __int8 v5 = [v4 setTopBoxUseProfileToken];

  if ((v5 & 1) == 0)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsSetTopBoxViewController_tvOS viewModel](self, "viewModel"));
    [v6 setSetTopBoxUserToken:v7];
  }
}

- (void)selectDeveloperIdentityProvider
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[VSViewControllerFactory sharedFactory](&OBJC_CLASS___VSViewControllerFactory, "sharedFactory"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsSetTopBoxViewController_tvOS facade](self, "facade"));
  unsigned __int8 v5 = (void *)objc_claimAutoreleasedReturnValue([v4 providers]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v3 identityProviderPickerViewControllerWithIdentityProviders:v5]);

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_62FC;
  v7[3] = &unk_14548;
  v7[4] = self;
  [v6 conditionallyUnwrapObject:v7 otherwise:&stru_14568];
}

- (void)viewSubscription
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsSetTopBoxViewController_tvOS viewModel](self, "viewModel"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue([v3 currentSubscription]);

  if (v4)
  {
    id v5 = (id)objc_claimAutoreleasedReturnValue([v4 subscriptionInfo]);
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 dataUsingEncoding:4]);
    id v22 = 0LL;
    uint64_t v7 = objc_claimAutoreleasedReturnValue( +[NSJSONSerialization JSONObjectWithData:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "JSONObjectWithData:options:error:",  v6,  0LL,  &v22));
    id v8 = v22;
    id v9 = (NSString *)v5;
    if (!v8)
    {
      uint64_t v21 = 0LL;
      id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSJSONSerialization dataWithJSONObject:options:error:]( &OBJC_CLASS___NSJSONSerialization,  "dataWithJSONObject:options:error:",  v7,  1LL,  &v21));
      id v11 = v10;
      id v9 = (NSString *)v5;
      if (v10)
      {
        id v12 = v10;
        id v9 = -[NSString initWithData:encoding:](objc_alloc(&OBJC_CLASS___NSString), "initWithData:encoding:", v12, 4LL);
      }
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"DEVELOPER_STB_VIEW_SUBSCRIPTION_ALERT_TITLE_FORMAT" value:0 table:0]);

    v20 = v5;
    id v15 = (void *)v7;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsSetTopBoxViewController_tvOS viewModel](self, "viewModel"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 setTopBoxBundleIdentifier]);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v14, v17));

    id v19 = [[TVSUITextAlertController alloc] initWithTitle:v18 text:v9];
    -[VSDeveloperSettingsSetTopBoxViewController_tvOS presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v19,  1LL,  0LL);
  }
}

- (void)clearSubscription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsSetTopBoxViewController_tvOS viewModel](self, "viewModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 currentSubscription]);

  if (v3)
  {
    id v4 = v3;
    id v5 = (void *)objc_claimAutoreleasedReturnValue( +[VSSubscriptionRegistrationCenter defaultSubscriptionRegistrationCenter]( &OBJC_CLASS___VSSubscriptionRegistrationCenter,  "defaultSubscriptionRegistrationCenter"));
    id v7 = v4;
    id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v7, 1LL));

    [v5 removeSubscriptions:v6];
  }
}

- (void)didUpdateSetTopBoxUseProfileTokenFrom:(BOOL)a3 to:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsSetTopBoxViewController_tvOS facade](self, "facade"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 settings]);
  id v9 = [v8 copy];

  if ([v9 setTopBoxUseDeviceProfile] != v4)
  {
    [v9 setSetTopBoxUseDeviceProfile:v4];
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsSetTopBoxViewController_tvOS viewModel](self, "viewModel"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsSetTopBoxViewController_tvOS facade](self, "facade"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_6770;
    v13[3] = &unk_145B8;
    id v14 = v10;
    id v15 = self;
    BOOL v16 = a3;
    id v12 = v10;
    [v11 updateDeveloperSettings:v9 withCompletionHandler:v13];
  }
}

- (void)testSetup
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsSetTopBoxViewController_tvOS viewModel](self, "viewModel"));
  [v3 setPreparingForSetupTesting:1];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_6A00;
  v9[3] = &unk_14608;
  id v10 = objc_alloc_init(&OBJC_CLASS___VSTestSetupPreparationOperation);
  id v11 = self;
  id v12 = v3;
  id v4 = v3;
  id v5 = v10;
  uint64_t v6 = VSMainThreadOperationWithBlock(v9);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  [v7 addDependency:v5];
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsSetTopBoxViewController_tvOS privateQueue](self, "privateQueue"));
  [v8 addOperation:v5];

  VSEnqueueCompletionOperation(v7);
}

- (void)updateSubscription
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsSetTopBoxViewController_tvOS viewModel](self, "viewModel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 setTopBoxBundleIdentifier]);
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    uint64_t OptionsForAppWithBundleIdentifier = VSSubscriptionFetchOptionsForAppWithBundleIdentifier();
    id v7 = (void *)objc_claimAutoreleasedReturnValue(OptionsForAppWithBundleIdentifier);
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[VSSubscriptionRegistrationCenter defaultSubscriptionRegistrationCenter]( &OBJC_CLASS___VSSubscriptionRegistrationCenter,  "defaultSubscriptionRegistrationCenter"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472LL;
    v10[2] = sub_6D8C;
    v10[3] = &unk_14630;
    id v11 = v5;
    id v12 = v2;
    id v9 = v5;
    [v8 fetchActiveSubscriptionsWithOptions:v7 completionHandler:v10];
  }

  else
  {
    [v2 setCurrentSubscription:0];
  }
}

- (id)loadSettingGroups
{
  uint64_t v3 = VSDefaultLogObject(self);
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v87 = "-[VSDeveloperSettingsSetTopBoxViewController_tvOS loadSettingGroups]";
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsSetTopBoxViewController_tvOS facade](self, "facade"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsSetTopBoxViewController_tvOS viewModel](self, "viewModel"));
  objc_initWeak((id *)buf, self);
  v67 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  id v6 = objc_alloc_init(&OBJC_CLASS___TSKSettingGroup);
  -[NSMutableArray addObject:](v67, "addObject:", v6);
  v56 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  v63 = (void *)objc_claimAutoreleasedReturnValue( [v7 localizedStringForKey:@"DEVELOPER_PROVIDER_STB_BUNDLE_ID_TITLE" value:0 table:0]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  v62 = (void *)objc_claimAutoreleasedReturnValue( [v8 localizedStringForKey:@"DEVELOPER_STB_BUNDLE_ID_DESCRIPTION" value:0 table:0]);

  v66 = (void *)objc_claimAutoreleasedReturnValue( +[TSKTextInputSettingItem textInputItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKTextInputSettingItem,  "textInputItemWithTitle:description:representedObject:keyPath:",  v63,  v62,  v5,  @"setTopBoxBundleIdentifier"));
  v82[0] = _NSConcreteStackBlock;
  v82[1] = 3221225472LL;
  v82[2] = sub_7AC0;
  v82[3] = &unk_14658;
  objc_copyWeak(&v83, (id *)buf);
  [v66 setUpdateBlock:v82];
  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  v61 = (void *)objc_claimAutoreleasedReturnValue( [v9 localizedStringForKey:@"DEVELOPER_PROVIDER_STB_USER_TOKEN_TITLE" value:0 table:0]);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  v59 = (void *)objc_claimAutoreleasedReturnValue( [v10 localizedStringForKey:@"DEVELOPER_STB_USER_TOKEN_DESCRIPTION" value:0 table:0]);

  v65 = (void *)objc_claimAutoreleasedReturnValue( +[TSKTextInputSettingItem textInputItemWithTitle:description:representedObject:keyPath:]( &OBJC_CLASS___TSKTextInputSettingItem,  "textInputItemWithTitle:description:representedObject:keyPath:",  v61,  v59,  v5,  @"setTopBoxUserTokenDisplayValue"));
  v79[0] = _NSConcreteStackBlock;
  v79[1] = 3221225472LL;
  v79[2] = sub_7B38;
  v79[3] = &unk_14680;
  objc_copyWeak(&v81, (id *)buf);
  id v11 = v5;
  id v80 = v11;
  [v65 setUpdateBlock:v79];
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  v58 = (void *)objc_claimAutoreleasedReturnValue([v12 localizedStringForKey:@"TV_PROVIDER_TITLE" value:0 table:0]);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  v57 = (void *)objc_claimAutoreleasedReturnValue( [v13 localizedStringForKey:@"DEVELOPER_STV_PROVIDER_DESCRIPTION" value:0 table:0]);

  v64 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v58,  v57,  v60,  @"setTopBoxProviderDisplayName",  self,  "selectDeveloperIdentityProvider"));
  v77[0] = _NSConcreteStackBlock;
  v77[1] = 3221225472LL;
  v77[2] = sub_7BA4;
  v77[3] = &unk_14658;
  objc_copyWeak(&v78, (id *)buf);
  [v64 setUpdateBlock:v77];
  id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  v55 = (void *)objc_claimAutoreleasedReturnValue( [v14 localizedStringForKey:@"DEVELOPER_SET_TOP_BOX_MODE_ENABLE" value:0 table:0]);

  id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  v54 = (void *)objc_claimAutoreleasedReturnValue( [v15 localizedStringForKey:@"DEVELOPER_SET_TOP_BOX_MODE_ENABLE_DESCRIPTION" value:0 table:0]);

  v53 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v55,  v54,  v11,  @"setTopBoxModeEnabled",  0LL,  0LL));
  v75[0] = _NSConcreteStackBlock;
  v75[1] = 3221225472LL;
  v75[2] = sub_7C1C;
  v75[3] = &unk_14658;
  objc_copyWeak(&v76, (id *)buf);
  [v53 setUpdateBlock:v75];
  v85[0] = v64;
  v85[1] = v65;
  v85[2] = v66;
  v85[3] = v53;
  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v85, 4LL));
  [v56 setSettingItems:v16];

  id v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  v52 = (void *)objc_claimAutoreleasedReturnValue([v17 localizedStringForKey:@"STB_TESTING_SECTION_TITLE" value:0 table:0]);

  id v18 = [[TSKSettingGroup alloc] initWithTitle:v52];
  -[NSMutableArray addObject:](v67, "addObject:", v18);
  v45 = v18;
  id v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  v51 = (void *)objc_claimAutoreleasedReturnValue( [v19 localizedStringForKey:@"DEVELOPER_STB_USE_DEVICE_PROFILE_TITLE" value:0 table:0]);

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  v50 = (void *)objc_claimAutoreleasedReturnValue( [v20 localizedStringForKey:@"DEVELOPER_STB_USE_DEVICE_PROFILE_DESCRIPTION" value:0 table:0]);

  v44 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v51,  v50,  v11,  @"setTopBoxUseProfileToken",  0LL,  0LL));
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  v49 = (void *)objc_claimAutoreleasedReturnValue([v21 localizedStringForKey:@"STB_OPT_OUT_TITLE" value:0 table:0]);

  id v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  v48 = (void *)objc_claimAutoreleasedReturnValue( [v22 localizedStringForKey:@"DEVELOPER_STB_SUPPORTS_OPT_OUT_DESCRIPTION" value:0 table:0]);

  v43 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:]( &OBJC_CLASS___TSKSettingItem,  "toggleItemWithTitle:description:representedObject:keyPath:onTitle:offTitle:",  v49,  v48,  v11,  @"setTopBoxSupportsOptOut",  0LL,  0LL));
  id v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  v47 = (void *)objc_claimAutoreleasedReturnValue( [v23 localizedStringForKey:@"DEVELOPER_STB_TEST_SETUP_TITLE" value:0 table:0]);

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  v46 = (void *)objc_claimAutoreleasedReturnValue( [v24 localizedStringForKey:@"DEVELOPER_STB_TEST_SETUP_DESCRIPTION" value:0 table:0]);

  id v25 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v47,  v46,  v11,  @"preparingForSetupTesting",  self,  "testSetup"));
  v73[0] = _NSConcreteStackBlock;
  v73[1] = 3221225472LL;
  v73[2] = sub_7CA4;
  v73[3] = &unk_14658;
  objc_copyWeak(&v74, (id *)buf);
  [v25 setUpdateBlock:v73];
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  id v27 = (void *)objc_claimAutoreleasedReturnValue( [v26 localizedStringForKey:@"DEVELOPER_STB_VIEW_SUBSCRIPTION_TITLE" value:0 table:0]);

  objc_super v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  v29 = (void *)objc_claimAutoreleasedReturnValue( [v28 localizedStringForKey:@"DEVELOPER_STB_VIEW_SUBSCRIPTION_DESCRIPTION" value:0 table:0]);

  v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  v31 = (void *)objc_claimAutoreleasedReturnValue([v30 localizedStringForKey:@"EMPTY" value:0 table:0]);

  v32 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v27,  v29,  v11,  @"currentSubscriptionHash",  self,  "viewSubscription"));
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472LL;
  v70[2] = sub_7D78;
  v70[3] = &unk_146A8;
  id v33 = v11;
  id v71 = v33;
  id v34 = v31;
  id v72 = v34;
  [v32 setUpdateBlock:v70];
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  v36 = (void *)objc_claimAutoreleasedReturnValue( [v35 localizedStringForKey:@"DEVELOPER_STB_CLEAR_SUBSCRIPTION_TITLE" value:0 table:0]);

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
  v38 = (void *)objc_claimAutoreleasedReturnValue( [v37 localizedStringForKey:@"DEVELOPER_STB_CLEAR_SUBSCRIPTION_DESCRIPTION" value:0 table:0]);

  v39 = (void *)objc_claimAutoreleasedReturnValue( +[TSKSettingItem actionItemWithTitle:description:representedObject:keyPath:target:action:]( &OBJC_CLASS___TSKSettingItem,  "actionItemWithTitle:description:representedObject:keyPath:target:action:",  v36,  v38,  v33,  @"currentSubscriptionHash",  self,  "clearSubscription"));
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472LL;
  v68[2] = sub_7E34;
  v68[3] = &unk_146D0;
  id v40 = v33;
  id v69 = v40;
  [v39 setUpdateBlock:v68];
  v84[0] = v44;
  v84[1] = v43;
  v84[2] = v32;
  v84[3] = v39;
  v84[4] = v25;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v84, 5LL));
  [v45 setSettingItems:v41];

  objc_destroyWeak(&v74);
  objc_destroyWeak(&v76);

  objc_destroyWeak(&v78);
  objc_destroyWeak(&v81);

  objc_destroyWeak(&v83);
  objc_destroyWeak((id *)buf);

  return v67;
}

- (void)identityProviderPickerViewControllerDidCancel:(id)a3
{
  uint64_t v4 = VSDefaultLogObject(self);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[VSDeveloperSettingsSetTopBoxViewController_tvOS identityProviderPickerViewControllerDidCancel:]";
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v7, 0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsSetTopBoxViewController_tvOS navigationController](self, "navigationController"));
  [v6 dismissViewControllerAnimated:1 completion:0];
}

- (void)identityProviderPickerViewController:(id)a3 didPickIdentityProvider:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsSetTopBoxViewController_tvOS facade](self, "facade"));
  int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 settings]);
  id v8 = [v7 copy];

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 uniqueID]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 forceUnwrapObject]);
  [v8 setSetTopBoxIdentityProviderID:v10];

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsSetTopBoxViewController_tvOS facade](self, "facade"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_809C;
  v12[3] = &unk_14740;
  v12[4] = self;
  [v11 updateDeveloperSettings:v8 withCompletionHandler:v12];
}

- (BOOL)tableView:(id)a3 shouldHandleLongPressForItemAtIndexPath:(id)a4
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[VSDeveloperSettingsSetTopBoxViewController_tvOS settingItemAtIndexPath:]( self,  "settingItemAtIndexPath:",  a4));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 keyPath]);
  unsigned __int8 v6 = [v5 isEqualToString:@"setTopBoxUseProfileToken"];

  if (v4) {
    BOOL v7 = v6;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)tableView:(id)a3 didReceiveLongPressForItemAtIndexPath:(id)a4
{
  id v13 = (id)objc_claimAutoreleasedReturnValue( -[VSDeveloperSettingsSetTopBoxViewController_tvOS settingItemAtIndexPath:]( self,  "settingItemAtIndexPath:",  a4));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v13 keyPath]);
  unsigned int v6 = [v5 isEqualToString:@"setTopBoxUseProfileToken"];

  if (v13 && v6)
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle vs_frameworkBundle](&OBJC_CLASS___NSBundle, "vs_frameworkBundle"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue( [v7 localizedStringForKey:@"DEVELOPER_STB_VIEW_PROFILE_TOKEN_ALERT_TITLE" value:0 table:0]);

    id v9 = objc_alloc(&OBJC_CLASS___TVSUITextAlertController);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsSetTopBoxViewController_tvOS viewModel](self, "viewModel"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 profileUserToken]);
    id v12 = [v9 initWithTitle:v8 text:v11];

    -[VSDeveloperSettingsSetTopBoxViewController_tvOS presentViewController:animated:completion:]( self,  "presentViewController:animated:completion:",  v12,  1LL,  0LL);
  }
}

- (void)settingsFacadeSettingsDidChangeNotification:(id)a3
{
  uint64_t v4 = VSDefaultLogObject(self);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136315138;
    v20 = "-[VSDeveloperSettingsSetTopBoxViewController_tvOS settingsFacadeSettingsDidChangeNotification:]";
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v19, 0xCu);
  }

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsSetTopBoxViewController_tvOS facade](self, "facade"));
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 settings]);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsSetTopBoxViewController_tvOS viewModel](self, "viewModel"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 setTopBoxBundleIdentifier]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 setTopBoxBundleIdentifier]);
  unsigned __int8 v11 = [v9 isEqualToString:v10];

  if ((v11 & 1) == 0)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v7 setTopBoxBundleIdentifier]);
    [v8 setSetTopBoxBundleIdentifier:v12];
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v8 setTopBoxUserToken]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 setTopBoxUserToken]);
  unsigned __int8 v15 = [v13 isEqualToString:v14];

  if ((v15 & 1) == 0)
  {
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v7 setTopBoxUserToken]);
    [v8 setSetTopBoxUserToken:v16];
  }

  unsigned int v17 = [v8 setTopBoxSupportsOptOut];
  unsigned int v18 = [v8 setTopBoxUseProfileToken];
  -[VSDeveloperSettingsSetTopBoxViewController_tvOS reloadSettings](self, "reloadSettings");
}

- (void)subscriptionsDidChangeNotification:(id)a3
{
  uint64_t v4 = VSDefaultLogObject(self);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v6 = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Did receive local subscriptions did change notification.", v6, 2u);
  }

  -[VSDeveloperSettingsSetTopBoxViewController_tvOS updateSubscription](self, "updateSubscription");
}

- (void)deviceSetTopBoxProfileChanged:(id)a3
{
  uint64_t v4 = VSDefaultLogObject(self);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Device set-top box profile did update.", buf, 2u);
  }

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[VSDeveloperSettingsSetTopBoxViewController_tvOS device](self, "device"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_8694;
  v7[3] = &unk_14768;
  v7[4] = self;
  [v6 fetchDeviceManagedSetTopBoxProfileWithCompletion:v7];
}

- (VSDeveloperSettingsFacade)facade
{
  return self->_facade;
}

- (void)setFacade:(id)a3
{
}

- (VSDeveloperSettingsSetTopBoxViewModel)viewModel
{
  return self->_viewModel;
}

- (void)setViewModel:(id)a3
{
}

- (NSOperationQueue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (VSDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

@end