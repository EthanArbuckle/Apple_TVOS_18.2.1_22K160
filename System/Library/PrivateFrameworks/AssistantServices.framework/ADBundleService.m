@interface ADBundleService
+ (id)requiredInfoDictionaryKeys;
- (ADBundleService)initWithBundlePath:(id)a3 infoDictionary:(id)a4 instanceContext:(id)a5;
- (BOOL)_isValidRestrictionsDomainInfo:(id)a3;
- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4;
- (id)_connection;
- (id)_informCommandCenter:(id)a3 willPerformLaunchApp:(id)a4;
- (id)commandsForDomain:(id)a3;
- (id)domains;
- (id)handle;
- (id)lockRestrictedCommands;
- (id)syncKeys;
- (void)_parseInfoDictionary:(id)a3;
- (void)beginSyncForInfo:(id)a3 chunkHandler:(id)a4;
- (void)clearDomainObjects;
- (void)fetchSyncSnapshotForInfo:(id)a3 handler:(id)a4;
- (void)getInfoWithCompletion:(id)a3;
- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6;
- (void)preheatDomain:(id)a3;
- (void)reload;
- (void)resetExternalResources;
- (void)runMaintenanceWorkWithCompletion:(id)a3;
- (void)serviceConnectionTimedoutForSync;
@end

@implementation ADBundleService

- (id)lockRestrictedCommands
{
  return self->_lockRestrictedCommands;
}

- (void)_parseInfoDictionary:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:@"AssistantDomains"]);
  v6 = &CFNotificationCenterGetDarwinNotifyCenter_ptr;
  uint64_t v7 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) == 0)
  {
    id v24 = 0LL;
    if (v5) {
      goto LABEL_26;
    }
LABEL_29:
    if (v24)
    {
      v28 = (NSDictionary *)[v24 copy];
      domains = self->_domains;
      self->_domains = v28;
    }

    goto LABEL_31;
  }

  __int128 v126 = 0u;
  __int128 v127 = 0u;
  __int128 v124 = 0u;
  __int128 v125 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v124 objects:v137 count:16];
  if (!v9)
  {
LABEL_20:

    id v24 = v8;
    if (v5) {
      goto LABEL_26;
    }
    goto LABEL_29;
  }

  uint64_t v10 = *(void *)v125;
  uint64_t v101 = *(void *)v125;
LABEL_4:
  v11 = 0LL;
  id v102 = v9;
  while (1)
  {
    if (*(void *)v125 != v10) {
      objc_enumerationMutation(v8);
    }
    uint64_t v12 = *(void *)(*((void *)&v124 + 1) + 8LL * (void)v11);
    id v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v12, v101));
    uint64_t v14 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v12, v14) & 1) == 0) {
      break;
    }
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___NSDictionary);
    if ((objc_opt_isKindOfClass(v13, v15) & 1) == 0) {
      break;
    }
    __int128 v122 = 0u;
    __int128 v123 = 0u;
    __int128 v120 = 0u;
    __int128 v121 = 0u;
    id v13 = v13;
    id v16 = [v13 countByEnumeratingWithState:&v120 objects:v136 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v121;
      id v103 = v4;
      v104 = self;
      while (2)
      {
        for (i = 0LL; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v121 != v18) {
            objc_enumerationMutation(v13);
          }
          uint64_t v20 = *(void *)(*((void *)&v120 + 1) + 8LL * (void)i);
          v21 = (void *)objc_claimAutoreleasedReturnValue([v13 objectForKey:v20]);
          uint64_t v22 = objc_opt_class(&OBJC_CLASS___NSString);
          if ((objc_opt_isKindOfClass(v20, v22) & 1) == 0
            || (uint64_t v23 = objc_opt_class(&OBJC_CLASS___NSString), (objc_opt_isKindOfClass(v21, v23) & 1) == 0))
          {

            id v4 = v103;
            self = v104;
            v6 = &CFNotificationCenterGetDarwinNotifyCenter_ptr;
            goto LABEL_25;
          }
        }

        id v17 = [v13 countByEnumeratingWithState:&v120 objects:v136 count:16];
        id v4 = v103;
        self = v104;
        v6 = &CFNotificationCenterGetDarwinNotifyCenter_ptr;
        if (v17) {
          continue;
        }
        break;
      }
    }

    v11 = (char *)v11 + 1;
    uint64_t v10 = v101;
    if (v11 == v102)
    {
      id v9 = [v8 countByEnumeratingWithState:&v124 objects:v137 count:16];
      if (v9) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }

- (BOOL)_isValidRestrictionsDomainInfo:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSDictionary);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v29;
      id v9 = &CFNotificationCenterGetDarwinNotifyCenter_ptr;
      uint64_t v23 = *(void *)v29;
      while (2)
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v29 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void *)(*((void *)&v28 + 1) + 8LL * (void)i);
          id v12 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKey:v11]);
          uint64_t v13 = objc_opt_class(&OBJC_CLASS___NSString);
          if ((objc_opt_isKindOfClass(v11, v13) & 1) == 0
            || (uint64_t v14 = objc_opt_class(v9[470]), (objc_opt_isKindOfClass(v12, v14) & 1) == 0))
          {
LABEL_22:

            BOOL v21 = 0;
            goto LABEL_24;
          }

          __int128 v26 = 0u;
          __int128 v27 = 0u;
          __int128 v24 = 0u;
          __int128 v25 = 0u;
          id v12 = v12;
          id v15 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v15)
          {
            id v16 = v15;
            uint64_t v17 = *(void *)v25;
            while (2)
            {
              for (j = 0LL; j != v16; j = (char *)j + 1)
              {
                if (*(void *)v25 != v17) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v19 = *(void *)(*((void *)&v24 + 1) + 8LL * (void)j);
                uint64_t v20 = objc_opt_class(&OBJC_CLASS___NSString);
                if ((objc_opt_isKindOfClass(v19, v20) & 1) == 0)
                {

                  goto LABEL_22;
                }
              }

              id v16 = [v12 countByEnumeratingWithState:&v24 objects:v32 count:16];
              if (v16) {
                continue;
              }
              break;
            }
          }

          uint64_t v8 = v23;
          id v9 = &CFNotificationCenterGetDarwinNotifyCenter_ptr;
        }

        id v7 = [v5 countByEnumeratingWithState:&v28 objects:v33 count:16];
        BOOL v21 = 1;
        if (v7) {
          continue;
        }
        break;
      }
    }

    else
    {
      BOOL v21 = 1;
    }

- (id)_connection
{
  if (!self->_connection)
  {
    uint64_t v14 = objc_alloc(&OBJC_CLASS___ADServiceConnection);
    id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ADService identifier](self, "identifier"));
    path = self->_path;
    domains = self->_domains;
    syncKeys = self->_syncKeys;
    clearsDomainObjectsClassName = self->_clearsDomainObjectsClassName;
    maintenanceClassName = self->_maintenanceClassName;
    instanceContext = self->_instanceContext;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedQueue](&OBJC_CLASS___ADCommandCenter, "sharedQueue"));
    uint64_t v11 = -[ADServiceConnection initWithIdentifier:path:commandMap:anchorMap:clearingClass:maintenanceClass:instanceContext:queue:]( v14,  "initWithIdentifier:path:commandMap:anchorMap:clearingClass:maintenanceClass:instanceContext:queue:",  v3,  path,  domains,  syncKeys,  clearsDomainObjectsClassName,  maintenanceClassName,  instanceContext,  v10);
    connection = self->_connection;
    self->_connection = v11;

    if (self->_connectionNeedsContextCleared)
    {
      self->_connectionNeedsContextCleared = 0;
      -[ADServiceConnection sendClearDomainObjects](self->_connection, "sendClearDomainObjects");
    }
  }

  return self->_connection;
}

- (id)_informCommandCenter:(id)a3 willPerformLaunchApp:(id)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a4 launchId]);
  [v5 willProcessAppLaunchWithBundleIdentifier:v6];
  objc_initWeak(&location, v5);

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_1002CFBF0;
  v10[3] = &unk_1004FA7E8;
  objc_copyWeak(&v12, &location);
  id v11 = v6;
  id v7 = v6;
  uint64_t v8 = objc_retainBlock(v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  return v8;
}

- (ADBundleService)initWithBundlePath:(id)a3 infoDictionary:(id)a4 instanceContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___ADBundleService;
  id v11 = -[ADBundleService init](&v20, "init");
  if (v11)
  {
    id v12 = (NSString *)[v8 copy];
    path = v11->_path;
    v11->_path = v12;

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:kCFBundleIdentifierKey]);
    id v15 = v10;
    if (!v10) {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(+[AFInstanceContext defaultContext](&OBJC_CLASS___AFInstanceContext, "defaultContext"));
    }
    objc_storeStrong((id *)&v11->_instanceContext, v15);
    if (!v10) {

    }
    uint64_t v16 = objc_opt_class(&OBJC_CLASS___NSString);
    if ((objc_opt_isKindOfClass(v14, v16) & 1) != 0) {
      -[ADService setIdentifier:](v11, "setIdentifier:", v14);
    }
    -[ADBundleService _parseInfoDictionary:](v11, "_parseInfoDictionary:", v9);
    dispatch_group_t v17 = dispatch_group_create();
    group = v11->_group;
    v11->_group = (OS_dispatch_group *)v17;
  }

  return v11;
}

- (id)handle
{
  return self->_path;
}

- (id)domains
{
  return -[NSDictionary allKeys](self->_domains, "allKeys");
}

- (id)commandsForDomain:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](self->_domains, "objectForKey:", a3));
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v3 allKeys]);

  return v4;
}

- (BOOL)implementsCommand:(id)a3 forDomain:(id)a4
{
  domains = self->_domains;
  id v6 = a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKey:](domains, "objectForKey:", a4));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:v6]);

  return v8 != 0LL;
}

- (id)syncKeys
{
  return -[NSDictionary allKeys](self->_syncKeys, "allKeys");
}

- (void)preheatDomain:(id)a3
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[ADBundleService _connection](self, "_connection", a3));
  [v3 preheatServiceBundle];
}

- (void)handleCommand:(id)a3 forDomain:(id)a4 executionContext:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[ADBundleService _connection](self, "_connection"));
  uint64_t v15 = objc_opt_class(&OBJC_CLASS___SAAppsLaunchApp);
  if ((objc_opt_isKindOfClass(v10, v15) & 1) != 0)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedCommandCenter](&OBJC_CLASS___ADCommandCenter, "sharedCommandCenter"));
    dispatch_group_t v17 = (void *)objc_claimAutoreleasedReturnValue( -[ADBundleService _informCommandCenter:willPerformLaunchApp:]( self,  "_informCommandCenter:willPerformLaunchApp:",  v16,  v10));

    if (!v14) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }

  dispatch_group_t v17 = 0LL;
  if (v14)
  {
LABEL_5:
    dispatch_group_enter((dispatch_group_t)self->_group);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = sub_1002CFB6C;
    v18[3] = &unk_1004FA740;
    v18[4] = self;
    id v19 = v13;
    id v20 = v17;
    [v14 sendClientBoundCommand:v10 domain:v11 executionContext:v12 reply:v18];
  }

- (void)clearDomainObjects
{
  if (self->_clearsDomainObjectsClassName)
  {
    if (self->_connection)
    {
      id v5 = (id)objc_claimAutoreleasedReturnValue(-[ADBundleService _connection](self, "_connection"));
      [v5 sendClearDomainObjects];
    }

    else
    {
      id v3 = (os_log_s *)AFSiriLogContextDaemon;
      if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
      {
        path = self->_path;
        *(_DWORD *)buf = 136315394;
        id v7 = "-[ADBundleService clearDomainObjects]";
        __int16 v8 = 2112;
        id v9 = path;
        _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "%s Deferring context clearing until we have a valid connection for %@",  buf,  0x16u);
      }

      self->_connectionNeedsContextCleared = 1;
    }
  }

- (void)beginSyncForInfo:(id)a3 chunkHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  __int16 v8 = (void *)objc_claimAutoreleasedReturnValue(-[ADBundleService _connection](self, "_connection"));
  [v8 setDelegate:self];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ADBundleService _connection](self, "_connection"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = sub_1002CFB30;
  v13[3] = &unk_1004FA768;
  id v14 = v6;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1002CFB4C;
  v11[3] = &unk_1004FCC00;
  id v12 = v14;
  id v10 = v14;
  [v9 sendBeginSyncWithInfo:v7 chunkHandler:v13 completion:v11];
}

- (void)fetchSyncSnapshotForInfo:(id)a3 handler:(id)a4
{
  if (a4)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = (id)objc_claimAutoreleasedReturnValue(-[ADBundleService _connection](self, "_connection"));
    [v8 sendFetchSyncSnapshotForInfo:v7 completion:v6];
  }

- (void)resetExternalResources
{
  if ((AFIsNano(self) & 1) == 0)
  {
    objc_initWeak(&location, self);
    group = self->_group;
    uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(+[ADCommandCenter sharedQueue](&OBJC_CLASS___ADCommandCenter, "sharedQueue"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472LL;
    v5[2] = sub_1002CFAF4;
    v5[3] = &unk_1004FAF58;
    objc_copyWeak(&v6, &location);
    dispatch_group_notify((dispatch_group_t)group, v4, v5);

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }

- (void)getInfoWithCompletion:(id)a3
{
  v5[1] = 3221225472LL;
  v5[2] = sub_1002CFA20;
  v5[3] = &unk_1004FCA28;
  id v6 = self;
  id v7 = a3;
  v4.receiver = v6;
  v4.super_class = (Class)&OBJC_CLASS___ADBundleService;
  v5[0] = _NSConcreteStackBlock;
  id v3 = v7;
  -[ADService getInfoWithCompletion:](&v4, "getInfoWithCompletion:", v5);
}

- (void)runMaintenanceWorkWithCompletion:(id)a3
{
  id v6 = (void (**)(void))a3;
  objc_super v4 = (void *)objc_claimAutoreleasedReturnValue(-[ADBundleService _connection](self, "_connection"));
  id v5 = v4;
  if (v4)
  {
    [v4 runMaintenanceWorkWithCompletion:v6];
  }

  else if (v6)
  {
    v6[2]();
  }
}

- (void)reload
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[ADBundleService _connection](self, "_connection"));
  [v3 reloadServiceBundleAtPath:self->_path];
}

- (void)serviceConnectionTimedoutForSync
{
  id v3 = (id)objc_claimAutoreleasedReturnValue(-[ADService delegate](self, "delegate"));
  [v3 serviceTimedoutForSync:self];
}

- (void).cxx_destruct
{
}

+ (id)requiredInfoDictionaryKeys
{
  v5[0] = @"AssistantDomains";
  v5[1] = @"AssistantFirstUnlockRestrictedDomains";
  v5[2] = @"AssistantLockRestrictedDomains";
  v5[3] = @"AssistantControlCenterLockRestrictedDomains";
  void v5[4] = @"AssistantManagedStorageDomains";
  v5[5] = @"AssistantSyncAnchorKeys";
  v5[6] = @"AssistantClearsDomainObjects";
  v5[7] = @"AssistantMaintenance";
  v5[8] = @"AssistantRequiresBootMaintenance";
  v5[9] = kCFBundleIdentifierKey;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", v5, 10LL));
  id v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v2));

  return v3;
}

@end