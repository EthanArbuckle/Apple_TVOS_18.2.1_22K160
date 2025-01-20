@interface RMConfigurationSubscriberServicePlugin
+ (BOOL)_validPluginWithURL:(id)a3;
+ (id)loadPlugins;
- (NSSet)configurationTypes;
- (NSString)identifier;
- (NSURL)url;
- (RMConfigurationSubscriberServicePlugin)initWithURL:(id)a3;
- (RMConfigurationSubscriberServicePlugin)initWithURL:(id)a3 identifier:(id)a4 configurationTypes:(id)a5;
- (id)_serviceConnection;
- (id)reportDetails;
- (void)applyChangedConfigurationsTypes:(id)a3;
- (void)fetchMissingConfigurationUIs;
@end

@implementation RMConfigurationSubscriberServicePlugin

+ (id)loadPlugins
{
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_100023FC4;
  v17[3] = &unk_1000B9808;
  v17[4] = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[RMPluginDiscovery discoverPluginsWithType:checkValidURL:]( &OBJC_CLASS___RMPluginDiscovery,  "discoverPluginsWithType:checkValidURL:",  @"configuration",  v17));
  v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableArray arrayWithCapacity:]( NSMutableArray,  "arrayWithCapacity:",  [v2 count]));
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  id v4 = v2;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      v8 = 0LL;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8LL * (void)v8);
        v10 = objc_alloc(&OBJC_CLASS___RMConfigurationSubscriberServicePlugin);
        v11 = -[RMConfigurationSubscriberServicePlugin initWithURL:](v10, "initWithURL:", v9, (void)v13);
        [v3 addObject:v11];

        v8 = (char *)v8 + 1;
      }

      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }

    while (v6);
  }

  return v3;
}

+ (BOOL)_validPluginWithURL:(id)a3
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](&OBJC_CLASS___NSBundle, "bundleWithURL:", a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 infoDictionary]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[RMConfigurationSubscriberDescription descriptionWithServiceDictionary:]( &OBJC_CLASS___RMConfigurationSubscriberDescription,  "descriptionWithServiceDictionary:",  v4));

  id v6 = +[RMModelSharedDefinitions currentPlatform](&OBJC_CLASS___RMModelSharedDefinitions, "currentPlatform");
  id v7 = +[RMBundle managementScope](&OBJC_CLASS___RMBundle, "managementScope");
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue([v5 types]);
  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    __int128 v16 = v3;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8LL * (void)i);
        if (+[RMFeatureFlags isAllowedDeclarationType:](&OBJC_CLASS___RMFeatureFlags, "isAllowedDeclarationType:", v13)
          && (+[RMModelDeclarationBase isSupportedDeclaration:platform:scope:]( &OBJC_CLASS___RMModelDeclarationBase,  "isSupportedDeclaration:platform:scope:",  v13,  v6,  v7) & 1) != 0)
        {
          BOOL v14 = 1;
          goto LABEL_12;
        }
      }

      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }

    BOOL v14 = 0;
LABEL_12:
    v3 = v16;
  }

  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (RMConfigurationSubscriberServicePlugin)initWithURL:(id)a3
{
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___RMConfigurationSubscriberServicePlugin;
  id v6 = -[RMConfigurationSubscriberServicePlugin init](&v24, "init");
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](&OBJC_CLASS___NSBundle, "bundleWithURL:", v5));
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v8;

    id v10 = (void *)objc_claimAutoreleasedReturnValue([v7 infoDictionary]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[RMConfigurationSubscriberDescription descriptionWithServiceDictionary:]( &OBJC_CLASS___RMConfigurationSubscriberDescription,  "descriptionWithServiceDictionary:",  v10));

    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 types]);
    if (v12)
    {
      uint64_t v13 = (NSSet *)objc_claimAutoreleasedReturnValue([v11 types]);
      uint64_t v14 = objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v13));
      configurationTypes = v6->_configurationTypes;
      v6->_configurationTypes = (NSSet *)v14;
    }

    else
    {
      __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[RMLog configurationSubscriberServicePlugin]( &OBJC_CLASS___RMLog,  "configurationSubscriberServicePlugin"));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_100024B28(v5, v16);
      }

      __int128 v17 = objc_opt_new(&OBJC_CLASS___NSSet);
      uint64_t v13 = v6->_configurationTypes;
      v6->_configurationTypes = v17;
    }

    objc_storeStrong((id *)&v6->_url, a3);
    __int128 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[RMLog configurationSubscriberServicePlugin]( &OBJC_CLASS___RMLog,  "configurationSubscriberServicePlugin"));
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue([v5 lastPathComponent]);
      v21 = v6->_identifier;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet allObjects](v6->_configurationTypes, "allObjects"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "componentsJoinedByString:", @", "));
      *(_DWORD *)buf = 138543874;
      v26 = v20;
      __int16 v27 = 2114;
      v28 = v21;
      __int16 v29 = 2114;
      v30 = v23;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "Created XPC service plugin: %{public}@ %{public}@ %{public}@",  buf,  0x20u);
    }
  }

  return v6;
}

- (RMConfigurationSubscriberServicePlugin)initWithURL:(id)a3 identifier:(id)a4 configurationTypes:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___RMConfigurationSubscriberServicePlugin;
  v12 = -[RMConfigurationSubscriberServicePlugin init](&v20, "init");
  uint64_t v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_url, a3);
    objc_storeStrong((id *)&v13->_identifier, a4);
    objc_storeStrong((id *)&v13->_configurationTypes, a5);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[RMLog configurationSubscriberServicePlugin]( &OBJC_CLASS___RMLog,  "configurationSubscriberServicePlugin"));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      __int128 v16 = (void *)objc_claimAutoreleasedReturnValue([v9 lastPathComponent]);
      identifier = v13->_identifier;
      __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet allObjects](v13->_configurationTypes, "allObjects"));
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "componentsJoinedByString:", @", "));
      *(_DWORD *)buf = 138543874;
      v22 = v16;
      __int16 v23 = 2114;
      objc_super v24 = identifier;
      __int16 v25 = 2114;
      v26 = v19;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "Created XPC service plugin: %{public}@ %{public}@ %{public}@",  buf,  0x20u);
    }
  }

  return v13;
}

- (void)applyChangedConfigurationsTypes:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMConfigurationSubscriberServicePlugin _serviceConnection](self, "_serviceConnection", a3));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100024654;
  v7[3] = &unk_1000B9830;
  v7[4] = self;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 synchronousRemoteObjectProxyWithErrorHandler:v7]);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000246BC;
  v6[3] = &unk_1000B9830;
  v6[4] = self;
  objc_msgSend( v5,  "fetchThenApplyConfigurationsWithScope:completionHandler:",  +[RMStoreHelper storeScope](RMStoreHelper, "storeScope"),  v6);
  [v4 invalidate];
}

- (void)fetchMissingConfigurationUIs
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMConfigurationSubscriberServicePlugin _serviceConnection](self, "_serviceConnection"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100024810;
  v6[3] = &unk_1000B9830;
  v6[4] = self;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 synchronousRemoteObjectProxyWithErrorHandler:v6]);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100024878;
  v5[3] = &unk_1000B9830;
  v5[4] = self;
  objc_msgSend( v4,  "fetchThenUpdateConfigurationUIsWithScope:completionHandler:",  +[RMStoreHelper storeScope](RMStoreHelper, "storeScope"),  v5);
  [v3 invalidate];
}

- (id)reportDetails
{
  v11[0] = @"Location";
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMConfigurationSubscriberServicePlugin url](self, "url"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
  v12[0] = v4;
  v11[1] = @"Identifier";
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMConfigurationSubscriberServicePlugin identifier](self, "identifier"));
  v12[1] = v5;
  v11[2] = @"ConfigurationTypes";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMConfigurationSubscriberServicePlugin configurationTypes](self, "configurationTypes"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);
  v12[2] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  3LL));

  return v9;
}

- (id)_serviceConnection
{
  v3 = objc_alloc(&OBJC_CLASS___NSXPCConnection);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMConfigurationSubscriberServicePlugin identifier](self, "identifier"));
  id v5 = -[NSXPCConnection initWithServiceName:](v3, "initWithServiceName:", v4);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___RMConfigurationSubscriberXPCService));
  -[NSXPCConnection setRemoteObjectInterface:](v5, "setRemoteObjectInterface:", v6);
  -[NSXPCConnection resume](v5, "resume");

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSSet)configurationTypes
{
  return self->_configurationTypes;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
}

@end