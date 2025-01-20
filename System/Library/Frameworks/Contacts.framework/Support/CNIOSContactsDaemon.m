@interface CNIOSContactsDaemon
+ (void)enterSandbox;
- (id)XPCActivities;
- (id)XPCListenerPairs;
- (id)applicationUnregisteredListeners;
- (id)notifydListeners;
@end

@implementation CNIOSContactsDaemon

+ (void)enterSandbox
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CNIOSContactsDaemon;
  objc_msgSendSuper2(&v2, "enterSandbox");
  +[CNIOSDaemonSandboxer enterSandbox](&OBJC_CLASS___CNIOSDaemonSandboxer, "enterSandbox");
}

- (id)XPCListenerPairs
{
  uint64_t v13 = 0LL;
  v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  v16 = sub_10000A710;
  v17 = sub_10000A720;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CNIOSContactsDaemon;
  objc_super v2 = -[CNContactsDaemon XPCListenerPairs](&v12, "XPCListenerPairs");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  id v18 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v3));

  v19[0] = CNDataMapperServiceName;
  v4 = objc_opt_new(&OBJC_CLASS___ContactsServiceDelegate);
  v20[0] = v4;
  v19[1] = CNDataMapperContactProviderServiceName;
  v5 = objc_opt_new(&OBJC_CLASS___ContactsServiceDelegate);
  v20[1] = v5;
  v19[2] = CNContactsSupportServiceName;
  v6 = objc_opt_new(&OBJC_CLASS___ContactsSupportServiceDelegate);
  v20[2] = v6;
  v19[3] = CNApplicationProxyServiceName;
  v7 = objc_opt_new(&OBJC_CLASS___CNLaunchServicesProxyServiceDelegate);
  v20[3] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v20,  v19,  4LL));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10000A728;
  v11[3] = &unk_100018DF0;
  v11[4] = &v13;
  objc_msgSend(v8, "_cn_each:", v11);
  id v9 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v9;
}

- (id)notifydListeners
{
  v3 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___CNIOSContactsDaemon;
  v4 = -[CNContactsDaemon notifydListeners](&v16, "notifydListeners");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = -[NSMutableArray initWithArray:](v3, "initWithArray:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CNEnvironment currentEnvironment](&OBJC_CLASS___CNEnvironment, "currentEnvironment"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 featureFlags]);
  unsigned int v9 = [v8 isFeatureEnabled:9];

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[CNDLimitedAccessSyncService sharedInstance]( &OBJC_CLASS___CNDLimitedAccessSyncService,  "sharedInstance"));
    -[NSMutableArray addObject:](v6, "addObject:", v10);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CNEnvironment currentEnvironment](&OBJC_CLASS___CNEnvironment, "currentEnvironment"));
  objc_super v12 = (void *)objc_claimAutoreleasedReturnValue([v11 featureFlags]);
  unsigned int v13 = [v12 isFeatureEnabled:19];

  if (v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[CNAnalyzeDatabaseService sharedInstance](&OBJC_CLASS___CNAnalyzeDatabaseService, "sharedInstance"));
    -[NSMutableArray addObject:](v6, "addObject:", v14);
  }

  return v6;
}

- (id)applicationUnregisteredListeners
{
  v3 = objc_alloc(&OBJC_CLASS___NSMutableArray);
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___CNIOSContactsDaemon;
  v4 = -[CNContactsDaemon applicationUnregisteredListeners](&v12, "applicationUnregisteredListeners");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = -[NSMutableArray initWithArray:](v3, "initWithArray:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CNEnvironment currentEnvironment](&OBJC_CLASS___CNEnvironment, "currentEnvironment"));
  v8 = (void *)objc_claimAutoreleasedReturnValue([v7 featureFlags]);
  unsigned int v9 = [v8 isFeatureEnabled:9];

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[CNDLimitedAccessSyncService sharedInstance]( &OBJC_CLASS___CNDLimitedAccessSyncService,  "sharedInstance"));
    -[NSMutableArray addObject:](v6, "addObject:", v10);
  }

  return v6;
}

- (id)XPCActivities
{
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[CNContactsDaemonLogs xpc](&OBJC_CLASS___CNContactsDaemonLogs, "xpc"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10000E3FC(v3);
  }

  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___CNIOSContactsDaemon;
  v4 = -[CNContactsDaemon XPCActivities](&v10, "XPCActivities");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](&OBJC_CLASS___NSMutableArray, "arrayWithArray:", v5));

  objc_msgSend(v6, "addObject:", objc_opt_class(BackupConfigurationService, v7, v8));
  return v6;
}

@end