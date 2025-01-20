@interface DriverKitSettingsBundleController
- (id)specifiersWithSpecifier:(id)a3;
- (void)approvalStateDidChange:(BOOL)a3;
- (void)load;
- (void)registerObserver;
- (void)unload;
- (void)unregisterObserver;
@end

@implementation DriverKitSettingsBundleController

- (void)registerObserver
{
  if (!self->_observerRegistered)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Registering observer", v5, 2u);
    }

    v3 = (void *)objc_claimAutoreleasedReturnValue(+[DriverManager sharedManager](&OBJC_CLASS___DriverManager, "sharedManager"));
    [v3 addObserver:self];

    v4 = (void *)objc_claimAutoreleasedReturnValue(+[DriverManager sharedManager](&OBJC_CLASS___DriverManager, "sharedManager"));
    [v4 refresh];

    self->_observerRegistered = 1;
  }

- (void)unregisterObserver
{
  if (self->_observerRegistered)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Unregistering observer", v4, 2u);
    }

    v3 = (void *)objc_claimAutoreleasedReturnValue(+[DriverManager sharedManager](&OBJC_CLASS___DriverManager, "sharedManager"));
    [v3 removeObserver:self];

    self->_observerRegistered = 0;
  }

- (void)load
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DriverKitSettingsBundleController;
  -[DriverKitSettingsBundleController load](&v3, "load");
}

- (void)unload
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___DriverKitSettingsBundleController;
  -[DriverKitSettingsBundleController unload](&v3, "unload");
}

- (id)specifiersWithSpecifier:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v6 = PSAppSettingsBundleIDKey;
  v7 = (void *)objc_claimAutoreleasedReturnValue([v4 propertyForKey:PSAppSettingsBundleIDKey]);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[DriverManager sharedManager](&OBJC_CLASS___DriverManager, "sharedManager"));
  [v8 thirdPartyDriverCount];

  -[DriverKitSettingsBundleController registerObserver](self, "registerObserver");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[DriverManager sharedManager](&OBJC_CLASS___DriverManager, "sharedManager"));
  v10 = v9;
  if (v7) {
    id v11 = [v9 driverCountForAppID:v7];
  }
  else {
    id v11 = [v9 thirdPartyDriverCount];
  }
  uint64_t v12 = (uint64_t)v11;

  if (v12 >= 1)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[PSSpecifier groupSpecifierWithID:]( &OBJC_CLASS___PSSpecifier,  "groupSpecifierWithID:",  @"DRIVERS_GROUP"));
    -[NSMutableArray addObject:](v5, "addObject:", v13);
    v14 = LocalizedString(@"DriverKitSettings_FormTitle");
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    id v16 = +[PSSpecifier preferenceSpecifierNamed:target:set:get:detail:cell:edit:]( &OBJC_CLASS___PSSpecifier,  "preferenceSpecifierNamed:target:set:get:detail:cell:edit:",  v15,  self,  0LL,  0LL,  objc_opt_class(&OBJC_CLASS____TtC17DriverKitSettings31DriverKitSettingsViewController),  2LL,  0LL);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

    [v17 setIdentifier:@"DRIVERS_LINK"];
    [v17 setProperty:v7 forKey:v6];
    -[NSMutableArray addObject:](v5, "addObject:", v17);
  }

  return v5;
}

- (void)approvalStateDidChange:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v5 = "was not";
    if (v3) {
      v5 = "was";
    }
    *(_DWORD *)buf = 136446210;
    v8 = v5;
    _os_log_impl( &dword_0,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_DEFAULT,  "Approval state changed, update %{public}s incremental",  buf,  0xCu);
  }

  if (!v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_2A8C;
    block[3] = &unk_8550;
    block[4] = self;
    dispatch_async(&_dispatch_main_q, block);
  }

@end