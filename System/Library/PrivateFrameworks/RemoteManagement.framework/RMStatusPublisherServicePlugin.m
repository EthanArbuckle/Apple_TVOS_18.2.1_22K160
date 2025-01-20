@interface RMStatusPublisherServicePlugin
+ (BOOL)_validPluginWithURL:(id)a3;
+ (id)loadPlugins;
- (NSDictionary)statusKeysByXPCEvent;
- (NSSet)statusKeys;
- (NSString)identifier;
- (NSURL)url;
- (RMStatusPublisherServicePlugin)initWithURL:(id)a3;
- (RMStatusPublisherServicePlugin)initWithURL:(id)a3 identifier:(id)a4 statusKeysByXPCEvent:(id)a5 statusKeys:(id)a6;
- (id)_serviceConnection;
- (id)reportDetails;
- (void)publishStatusKeys:(id)a3 storeIdentifier:(id)a4;
- (void)setStatusKeys:(id)a3;
- (void)setStatusKeysByXPCEvent:(id)a3;
@end

@implementation RMStatusPublisherServicePlugin

+ (id)loadPlugins
{
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10005C150;
  v17[3] = &unk_1000B9808;
  v17[4] = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[RMPluginDiscovery discoverPluginsWithType:checkValidURL:]( &OBJC_CLASS___RMPluginDiscovery,  "discoverPluginsWithType:checkValidURL:",  @"status",  v17));
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
        v10 = objc_alloc(&OBJC_CLASS___RMStatusPublisherServicePlugin);
        v11 = -[RMStatusPublisherServicePlugin initWithURL:](v10, "initWithURL:", v9, (void)v13);
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
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](&OBJC_CLASS___NSBundle, "bundleWithURL:", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v15 infoDictionary]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue( +[RMStatusPublisherDescription descriptionWithServiceDictionary:]( &OBJC_CLASS___RMStatusPublisherDescription,  "descriptionWithServiceDictionary:",  v3));

  id v5 = +[RMModelSharedDefinitions currentPlatform](&OBJC_CLASS___RMModelSharedDefinitions, "currentPlatform");
  id v6 = +[RMBundle managementScope](&OBJC_CLASS___RMBundle, "managementScope");
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 statusKeys]);
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v17;
LABEL_3:
    uint64_t v11 = 0LL;
    while (1)
    {
      if (*(void *)v17 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
      BOOL v13 = +[RMFeatureFlags isAllowedStatusItem:](&OBJC_CLASS___RMFeatureFlags, "isAllowedStatusItem:", v12);
      if (!v13
        || (+[RMModelStatusBase isSupportedStatusItem:platform:scope:]( &OBJC_CLASS___RMModelStatusBase,  "isSupportedStatusItem:platform:scope:",  v12,  v5,  v6) & 1) != 0)
      {
        break;
      }

      if (v9 == (id)++v11)
      {
        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        LOBYTE(v13) = 0;
        if (v9) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  else
  {
    LOBYTE(v13) = 0;
  }

  return v13;
}

- (RMStatusPublisherServicePlugin)initWithURL:(id)a3
{
  id v5 = a3;
  v29.receiver = self;
  v29.super_class = (Class)&OBJC_CLASS___RMStatusPublisherServicePlugin;
  id v6 = -[RMStatusPublisherServicePlugin init](&v29, "init");
  if (v6)
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](&OBJC_CLASS___NSBundle, "bundleWithURL:", v5));
    uint64_t v8 = objc_claimAutoreleasedReturnValue([v7 bundleIdentifier]);
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v8;

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 infoDictionary]);
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue( +[RMStatusPublisherDescription descriptionWithServiceDictionary:]( &OBJC_CLASS___RMStatusPublisherDescription,  "descriptionWithServiceDictionary:",  v10));

    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 statusKeys]);
    if (v12)
    {
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v11 statusKeysByXPCEvent]);
      __int128 v14 = (NSDictionary *)[v13 copy];
      statusKeysByXPCEvent = v6->_statusKeysByXPCEvent;
      v6->_statusKeysByXPCEvent = v14;

      __int128 v16 = (NSSet *)objc_claimAutoreleasedReturnValue([v11 statusKeys]);
      __int128 v17 = (NSSet *)-[NSSet copy](v16, "copy");
      statusKeys = v6->_statusKeys;
      v6->_statusKeys = v17;
    }

    else
    {
      __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog statusPublisherServicePlugin](&OBJC_CLASS___RMLog, "statusPublisherServicePlugin"));
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_100024B28(v5, v19);
      }

      v20 = objc_opt_new(&OBJC_CLASS___NSDictionary);
      v21 = v6->_statusKeysByXPCEvent;
      v6->_statusKeysByXPCEvent = v20;

      v22 = objc_opt_new(&OBJC_CLASS___NSSet);
      __int128 v16 = v6->_statusKeys;
      v6->_statusKeys = v22;
    }

    objc_storeStrong((id *)&v6->_url, a3);
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog statusPublisherServicePlugin](&OBJC_CLASS___RMLog, "statusPublisherServicePlugin"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue([v5 lastPathComponent]);
      v26 = v6->_identifier;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet allObjects](v6->_statusKeys, "allObjects"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "componentsJoinedByString:", @", "));
      *(_DWORD *)buf = 138543874;
      v31 = v25;
      __int16 v32 = 2114;
      v33 = v26;
      __int16 v34 = 2114;
      v35 = v28;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEBUG,  "Created XPC service plugin: %{public}@ %{public}@ %{public}@",  buf,  0x20u);
    }
  }

  return v6;
}

- (RMStatusPublisherServicePlugin)initWithURL:(id)a3 identifier:(id)a4 statusKeysByXPCEvent:(id)a5 statusKeys:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___RMStatusPublisherServicePlugin;
  __int128 v15 = -[RMStatusPublisherServicePlugin init](&v25, "init");
  __int128 v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_url, a3);
    objc_storeStrong((id *)&v16->_identifier, a4);
    objc_storeStrong((id *)&v16->_statusKeysByXPCEvent, a5);
    __int128 v17 = (NSSet *)[v14 copy];
    statusKeys = v16->_statusKeys;
    v16->_statusKeys = v17;

    __int128 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[RMLog statusPublisherServicePlugin](&OBJC_CLASS___RMLog, "statusPublisherServicePlugin"));
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue([v11 lastPathComponent]);
      identifier = v16->_identifier;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[NSSet allObjects](v16->_statusKeys, "allObjects"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "componentsJoinedByString:", @", "));
      *(_DWORD *)buf = 138543874;
      v27 = v21;
      __int16 v28 = 2114;
      objc_super v29 = identifier;
      __int16 v30 = 2114;
      v31 = v24;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEBUG,  "Created XPC service plugin: %{public}@ %{public}@ %{public}@",  buf,  0x20u);
    }
  }

  return v16;
}

- (void)publishStatusKeys:(id)a3 storeIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusPublisherServicePlugin _serviceConnection](self, "_serviceConnection"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10005C874;
  v12[3] = &unk_1000B9830;
  v12[4] = self;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 synchronousRemoteObjectProxyWithErrorHandler:v12]);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v7 allObjects]);

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10005C8DC;
  v11[3] = &unk_1000B9830;
  v11[4] = self;
  objc_msgSend( v9,  "publishStatusKeys:storeIdentifier:scope:completionHandler:",  v10,  v6,  +[RMStoreHelper storeScope](RMStoreHelper, "storeScope"),  v11);

  [v8 invalidate];
}

- (id)reportDetails
{
  v11[0] = @"Location";
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusPublisherServicePlugin url](self, "url"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 path]);
  v12[0] = v4;
  v11[1] = @"Identifier";
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusPublisherServicePlugin identifier](self, "identifier"));
  v12[1] = v5;
  v11[2] = @"StatusItems";
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusPublisherServicePlugin statusKeys](self, "statusKeys"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 allObjects]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 sortedArrayUsingSelector:"caseInsensitiveCompare:"]);
  v12[2] = v8;
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v12,  v11,  3LL));

  return v9;
}

- (id)_serviceConnection
{
  v3 = objc_alloc(&OBJC_CLASS___NSXPCConnection);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[RMStatusPublisherServicePlugin identifier](self, "identifier"));
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

- (NSURL)url
{
  return self->_url;
}

- (NSDictionary)statusKeysByXPCEvent
{
  return self->_statusKeysByXPCEvent;
}

- (void)setStatusKeysByXPCEvent:(id)a3
{
}

- (NSSet)statusKeys
{
  return self->_statusKeys;
}

- (void)setStatusKeys:(id)a3
{
}

- (void).cxx_destruct
{
}

@end