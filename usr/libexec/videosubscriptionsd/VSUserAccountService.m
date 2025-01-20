@interface VSUserAccountService
- (VSPreferences)preferences;
- (VSUserAccountRegistry)registry;
- (VSUserAccountService)init;
- (id)_securityTaskForCurrentConnection;
- (void)setPreferences:(id)a3;
- (void)setRegistry:(id)a3;
- (void)userAccountRegistry:(id)a3 didFinishUpdatingUserAccountsWithManager:(id)a4;
- (void)userAccountRegistry:(id)a3 willPerformMigrationIfRequiredWithBlock:(id)a4;
@end

@implementation VSUserAccountService

- (VSUserAccountService)init
{
  v3 = objc_autoreleasePoolPush();
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___VSUserAccountService;
  v4 = -[VSUserAccountService init](&v14, "init");
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___VSPreferences);
    preferences = v4->_preferences;
    v4->_preferences = v5;

    v7 = -[VSUserAccountRegistry initWithDelegate:]( objc_alloc(&OBJC_CLASS___VSUserAccountRegistry),  "initWithDelegate:",  v4);
    registry = v4->_registry;
    v4->_registry = v7;

    v15[0] = VSEntitlementNameSmootSubscriptionService;
    v15[1] = VSEntitlementNameInternalSubscriptionService;
    v15[2] = VSEntitlementNameSubscriptionRegistration;
    v15[3] = VSEntitlementNameSubscriptionServiceFetchFromAllSources;
    v15[4] = VSEntitlementNameSubscriptionServiceReadWriteWebSources;
    v15[5] = VSEntitlementNameUserAccountService;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v15, 6LL));
    uint64_t v10 = VSUserAccountServiceInterface(-[VSUserAccountService setEntitlementNames:](v4, "setEntitlementNames:", v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[VSUserAccountService setExportedInterface:](v4, "setExportedInterface:", v11);

    -[VSUserAccountService setExportedObject:](v4, "setExportedObject:", v4->_registry);
  }

  v12 = v4;
  objc_autoreleasePoolPop(v3);

  return v12;
}

- (id)_securityTaskForCurrentConnection
{
  return +[VSSecurityTask currentSecurityTask](&OBJC_CLASS___VSSecurityTask, "currentSecurityTask");
}

- (void)userAccountRegistry:(id)a3 willPerformMigrationIfRequiredWithBlock:(id)a4
{
  id v4 = a4;
  uint64_t v8 = VSDefaultLogObject(v4, v5, v6, v7);
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "-[VSUserAccountService userAccountRegistry:willPerformMigrationIfRequiredWithBlock:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  id v10 = objc_alloc_init(&OBJC_CLASS___VSSubscriptionRegistry);
  v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKey:]( v11,  "setObject:forKey:",  &stru_100014F40,  VSSubscriptionFetchOptionSubscriberIdentifierHashModifier);
  -[NSMutableDictionary setObject:forKey:]( v11,  "setObject:forKey:",  &__kCFBooleanFalse,  VSSubscriptionFetchOptionExcludeUninstalledApps);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_10000C46C;
  v13[3] = &unk_100014798;
  id v14 = v4;
  id v12 = v4;
  [v10 fetchActiveSubscriptionsWithOptions:v11 completionHandler:v13];
}

- (void)userAccountRegistry:(id)a3 didFinishUpdatingUserAccountsWithManager:(id)a4
{
  uint64_t v4 = VSDefaultLogObject(self, a2, a3, a4);
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[VSUserAccountService userAccountRegistry:didFinishUpdatingUserAccountsWithManager:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v6, 0xCu);
  }
}

- (VSPreferences)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
}

- (VSUserAccountRegistry)registry
{
  return self->_registry;
}

- (void)setRegistry:(id)a3
{
}

- (void).cxx_destruct
{
}

@end