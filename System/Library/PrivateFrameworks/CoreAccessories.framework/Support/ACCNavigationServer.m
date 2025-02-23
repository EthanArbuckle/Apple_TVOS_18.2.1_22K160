@interface ACCNavigationServer
+ (id)sharedServer;
- (ACCNavigationServer)initWithXPCServiceName:(id)a3 andFeatureNotification:(const char *)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)shouldAcceptXPCConnection:(id)a3;
- (NSMutableDictionary)navigationProviderInfoList;
- (NSMutableDictionary)navigationProviderInfoListByProviderUID;
- (NSMutableDictionary)registeredAccessoryConnections;
- (_ACCNavigationProviderInfo)navigationProviderInfo;
- (void)accessoryNavigationAttached:(id)a3 componentList:(id)a4;
- (void)accessoryNavigationDetached:(id)a3;
- (void)accessoryNavigationObjectDetectionUpdateInfo:(id)a3 componentIdList:(id)a4 updateInfo:(id)a5;
- (void)accessoryNavigationStartRouteGuidance:(id)a3 componentIdList:(id)a4 options:(unint64_t)a5;
- (void)accessoryNavigationStopRouteGuidance:(id)a3 componentIdList:(id)a4;
- (void)dealloc;
- (void)iterateAttachedConnectionsSync:(id)a3;
- (void)iterateNavigationProviderListSync:(id)a3;
- (void)notifyOfProvider:(id)a3 connection:(id)a4;
- (void)setNavigationProviderInfo:(id)a3;
@end

@implementation ACCNavigationServer

- (ACCNavigationServer)initWithXPCServiceName:(id)a3 andFeatureNotification:(const char *)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___ACCNavigationServer;
  v7 = -[ACCFeatureServer initWithXPCServiceName:andFeatureNotification:]( &v18,  "initWithXPCServiceName:andFeatureNotification:",  v6,  a4);
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 5;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v10 = (os_log_s *)&_os_log_default;
    id v9 = &_os_log_default;
  }

  else
  {
    v10 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v20 = v6;
    __int16 v21 = 2080;
    v22 = a4;
    __int16 v23 = 2112;
    v24 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[#Navigation] initWithXPCServiceName: serviceName='%@' notification='%s' self=%@",  buf,  0x20u);
  }

  if (v7)
  {
    v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    navigationProviderInfoList = v7->_navigationProviderInfoList;
    v7->_navigationProviderInfoList = v11;

    v13 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    navigationProviderInfoListByProviderUID = v7->_navigationProviderInfoListByProviderUID;
    v7->_navigationProviderInfoListByProviderUID = v13;

    v15 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    registeredAccessoryConnections = v7->_registeredAccessoryConnections;
    v7->_registeredAccessoryConnections = v15;
  }

  return v7;
}

- (void)dealloc
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 5;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v5 = (os_log_s *)&_os_log_default;
    id v4 = &_os_log_default;
  }

  else
  {
    v5 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[#Navigation] dealloc: self=%@", buf, 0xCu);
  }

  navigationProviderInfoList = self->_navigationProviderInfoList;
  self->_navigationProviderInfoList = 0LL;

  navigationProviderInfoListByProviderUID = self->_navigationProviderInfoListByProviderUID;
  self->_navigationProviderInfoListByProviderUID = 0LL;

  registeredAccessoryConnections = self->_registeredAccessoryConnections;
  self->_registeredAccessoryConnections = 0LL;

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ACCNavigationServer;
  -[ACCFeatureServer dealloc](&v9, "dealloc");
}

- (void)iterateNavigationProviderListSync:(id)a3
{
  id v4 = (void (**)(id, void, char *))a3;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_navigationProviderInfoList, "allValues"));
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
      char v11 = 1;
      v4[2](v4, v10, &v11);
      if (!v11) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)iterateAttachedConnectionsSync:(id)a3
{
  id v4 = (void (**)(id, void *, char *))a3;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_registeredAccessoryConnections, "allValues"));
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
LABEL_3:
    uint64_t v9 = 0LL;
    while (1)
    {
      if (*(void *)v14 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
      char v12 = 1;
      char v11 = (void *)objc_claimAutoreleasedReturnValue([v10 accessoryUID]);
      v4[2](v4, v11, &v12);

      if (!v12) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 5;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v9 = (os_log_s *)&_os_log_default;
    id v8 = &_os_log_default;
  }

  else
  {
    uint64_t v9 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    xpcServiceName = self->super._xpcServiceName;
    *(_DWORD *)buf = 138412290;
    v31 = (_ACCNavigationProviderInfo *)xpcServiceName;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[#Navigation] New XPC connection for: %@",  buf,  0xCu);
  }

  char v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ACCNavigationXPCServerProtocol));
  [v6 setExportedInterface:v11];

  char v12 = -[ACCNavigationServerRemote initWithXPCConnection:]( objc_alloc(&OBJC_CLASS___ACCNavigationServerRemote),  "initWithXPCConnection:",  v6);
  [v6 setExportedObject:v12];
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ACCNavigationXPCClientProtocol));
  [v6 setRemoteObjectInterface:v13];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id from = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&from, v6);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472LL;
  v25[2] = __58__ACCNavigationServer_listener_shouldAcceptNewConnection___block_invoke;
  v25[3] = &unk_1001FB0E0;
  objc_copyWeak(&v26, &from);
  objc_copyWeak(&v27, &location);
  [v6 setInvalidationHandler:v25];
  __int128 v14 = objc_alloc_init(&OBJC_CLASS____ACCNavigationProviderInfo);
  -[_ACCNavigationProviderInfo setConnection:](v14, "setConnection:", v6);
  -[_ACCNavigationProviderInfo setServerRemote:](v14, "setServerRemote:", v12);
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_37]);
  -[_ACCNavigationProviderInfo setRemoteObject:](v14, "setRemoteObject:", v15);

  __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v6 hash]));
  -[NSMutableDictionary setObject:forKey:](self->_navigationProviderInfoList, "setObject:forKey:", v14, v16);
  objc_storeStrong((id *)&self->_navigationProviderInfo, v14);
  if (gLogObjects && gNumLogObjects >= 5)
  {
    v17 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v17 = (os_log_s *)&_os_log_default;
    id v18 = &_os_log_default;
  }

  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    navigationProviderInfo = self->_navigationProviderInfo;
    *(_DWORD *)buf = 138412290;
    v31 = navigationProviderInfo;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[#Navigation] providerInfo=%@", buf, 0xCu);
  }

  [v6 resume];
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  __int16 v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __58__ACCNavigationServer_listener_shouldAcceptNewConnection___block_invoke_141;
  block[3] = &unk_1001F96F8;
  block[4] = self;
  dispatch_async(v21, block);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

void __58__ACCNavigationServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 5;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v4 = (os_log_s *)&_os_log_default;
    id v3 = &_os_log_default;
  }

  else
  {
    id v4 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v6 = objc_loadWeakRetained((id *)(a1 + 40));
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 navigationProviderInfo]);
    int v15 = 138412546;
    id v16 = WeakRetained;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[#Navigation] XPC connection invalidated! %@ providerInfo=%@",  (uint8_t *)&v15,  0x16u);
  }

  id v8 = objc_loadWeakRetained((id *)(a1 + 32));
  [v8 setInvalidationHandler:0];

  id v9 = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( NSNumber,  "numberWithUnsignedInteger:",  [v9 hash]));

  char v11 = (id *)(a1 + 40);
  id v12 = objc_loadWeakRetained(v11);
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue([v12 navigationProviderInfoList]);
  [v13 removeObjectForKey:v10];

  id v14 = objc_loadWeakRetained(v11);
  [v14 setNavigationProviderInfo:0];
}

void __58__ACCNavigationServer_listener_shouldAcceptNewConnection___block_invoke_139(id a1, NSError *a2)
{
  BOOL v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 5;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v5 = (os_log_s *)&_os_log_default;
    id v4 = &_os_log_default;
  }

  else
  {
    v5 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[#Navigation] XPC connection error!",  (uint8_t *)&v8,  2u);
  }

  if (gLogObjects && gNumLogObjects >= 5)
  {
    id v6 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v6 = (os_log_s *)&_os_log_default;
    id v7 = &_os_log_default;
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v2;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[#Navigation] %@", (uint8_t *)&v8, 0xCu);
  }
}

void __58__ACCNavigationServer_listener_shouldAcceptNewConnection___block_invoke_141(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 5;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v4 = (os_log_s *)&_os_log_default;
    id v3 = &_os_log_default;
  }

  else
  {
    id v4 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 80LL);
    *(_DWORD *)buf = 138412290;
    uint64_t v20 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[#Navigation] Inform provider of attached accessories %@",  buf,  0xCu);
  }

  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*(void *)(a1 + 32) + 80) allValues]);
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8LL * (void)i);
        id v12 = *(void **)(a1 + 32);
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472LL;
        v13[2] = __58__ACCNavigationServer_listener_shouldAcceptNewConnection___block_invoke_142;
        v13[3] = &unk_1001FDA88;
        v13[4] = v11;
        [v12 iterateNavigationProviderListSync:v13];
      }

      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }

    while (v8);
  }
}

void __58__ACCNavigationServer_listener_shouldAcceptNewConnection___block_invoke_142( uint64_t a1,  void *a2,  _BYTE *a3)
{
  id v4 = a2;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteObject]);

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteObject]);
    char v7 = objc_opt_respondsToSelector(v6, "accessoryNavigationAttached:componentList:");

    if ((v7 & 1) != 0)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteObject]);
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) accessoryUID]);
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) componentList]);
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 allValues]);
      [v8 accessoryNavigationAttached:v9 componentList:v11];
    }

    id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) startedComponentList]);
    if (gLogObjects && gNumLogObjects >= 5)
    {
      __int128 v13 = (os_log_s *)*(id *)(gLogObjects + 32);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      __int128 v13 = (os_log_s *)&_os_log_default;
      id v14 = &_os_log_default;
    }

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) accessoryUID]);
      *(_DWORD *)buf = 138412546;
      v41 = v15;
      __int16 v42 = 2112;
      v43 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[#Navigation] Inform provider of pending start for accessory %@, startedComponentList %@",  buf,  0x16u);
    }

    id v16 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) componentList]);
    if ([v16 count])
    {
      __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteObject]);
      char v18 = objc_opt_respondsToSelector(v17, "accessoryNavigationStartRouteGuidance:componentIdList:options:");

      if ((v18 & 1) == 0)
      {
LABEL_26:

        goto LABEL_27;
      }

      __int128 v37 = 0u;
      __int128 v38 = 0u;
      __int128 v35 = 0u;
      __int128 v36 = 0u;
      id v16 = v12;
      id v19 = [v16 countByEnumeratingWithState:&v35 objects:v39 count:16];
      if (v19)
      {
        id v20 = v19;
        v31 = v12;
        v32 = a3;
        uint64_t v21 = *(void *)v36;
        id obj = v16;
        do
        {
          for (i = 0LL; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v36 != v21) {
              objc_enumerationMutation(obj);
            }
            id v23 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
            v24 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKey:ACCNav_DispComp_ComponentID]);
            v25 = (void *)objc_claimAutoreleasedReturnValue([v23 objectForKey:__kComponentOptionsKey]);
            id v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:](&OBJC_CLASS___NSArray, "arrayWithObjects:", v24, 0LL));
            id v27 = v4;
            v28 = (void *)objc_claimAutoreleasedReturnValue([v4 remoteObject]);
            v29 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) accessoryUID]);
            if ([v26 count]) {
              v30 = v26;
            }
            else {
              v30 = 0LL;
            }
            objc_msgSend( v28,  "accessoryNavigationStartRouteGuidance:componentIdList:options:",  v29,  v30,  objc_msgSend(v25, "unsignedLongLongValue"));

            id v4 = v27;
          }

          id v16 = obj;
          id v20 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
        }

        while (v20);
        id v12 = v31;
        a3 = v32;
      }
    }

    goto LABEL_26;
  }

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  return 1;
}

- (void)accessoryNavigationAttached:(id)a3 componentList:(id)a4
{
  id v6 = a3;
  char v7 = (_ACCNavigationAccessoryInfo *)a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 5;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v10 = (os_log_s *)&_os_log_default;
    id v9 = &_os_log_default;
  }

  else
  {
    uint64_t v10 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v19 = v6;
    __int16 v20 = 2112;
    uint64_t v21 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[#Navigation] Navigation server, accessoryNavigationAttached: %@, componentList=%@",  buf,  0x16u);
  }

  uint64_t v11 = (_ACCNavigationAccessoryInfo *)objc_claimAutoreleasedReturnValue( -[NSMutableDictionary objectForKey:]( self->_registeredAccessoryConnections,  "objectForKey:",  v6));
  if (gLogObjects && gNumLogObjects >= 5)
  {
    id v12 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v12 = (os_log_s *)&_os_log_default;
    id v13 = &_os_log_default;
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    navigationProviderInfo = self->_navigationProviderInfo;
    *(_DWORD *)buf = 138412802;
    id v19 = v6;
    __int16 v20 = 2112;
    uint64_t v21 = v11;
    __int16 v22 = 2112;
    id v23 = navigationProviderInfo;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEBUG,  "[#Navigation] Navigation server, accessoryNavigationAttached: %@, accessory=%@ _navigationProviderInfo=%@",  buf,  0x20u);
  }

  if (v11
    || (uint64_t v11 = -[_ACCNavigationAccessoryInfo initWithUID:componentList:]( objc_alloc(&OBJC_CLASS____ACCNavigationAccessoryInfo),  "initWithUID:componentList:",  v6,  v7),  -[NSMutableDictionary setObject:forKey:](self->_registeredAccessoryConnections, "setObject:forKey:", v11, v6),  v11))
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = __65__ACCNavigationServer_accessoryNavigationAttached_componentList___block_invoke;
    v15[3] = &unk_1001FDAB0;
    id v16 = v6;
    __int128 v17 = v7;
    -[ACCNavigationServer iterateNavigationProviderListSync:](self, "iterateNavigationProviderListSync:", v15);
  }
}

void __65__ACCNavigationServer_accessoryNavigationAttached_componentList___block_invoke( uint64_t a1,  void *a2,  _BYTE *a3)
{
  id v10 = a2;
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v10 remoteObject]);
  if (v5)
  {
    id v6 = (void *)v5;
    char v7 = (void *)objc_claimAutoreleasedReturnValue([v10 remoteObject]);
    char v8 = objc_opt_respondsToSelector(v7, "accessoryNavigationAttached:componentList:");

    if ((v8 & 1) != 0)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v10 remoteObject]);
      [v9 accessoryNavigationAttached:*(void *)(a1 + 32) componentList:*(void *)(a1 + 40)];
    }
  }

  *a3 = 1;
}

- (void)accessoryNavigationDetached:(id)a3
{
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 5;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    char v7 = (os_log_s *)&_os_log_default;
    id v6 = &_os_log_default;
  }

  else
  {
    char v7 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[#Navigation] Navigation server, accessoryNavigationDetached: %@",  buf,  0xCu);
  }

  char v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_registeredAccessoryConnections, "objectForKey:", v4));
  if (gLogObjects && gNumLogObjects >= 5)
  {
    id v9 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v9 = (os_log_s *)&_os_log_default;
    id v10 = &_os_log_default;
  }

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    navigationProviderInfo = self->_navigationProviderInfo;
    *(_DWORD *)buf = 138412802;
    id v16 = v4;
    __int16 v17 = 2112;
    char v18 = v8;
    __int16 v19 = 2112;
    __int16 v20 = navigationProviderInfo;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "[#Navigation] Navigation server, accessoryNavigationDetached: %@, accessory=%@ _navigationProviderInfo=%@",  buf,  0x20u);
  }

  if (v8) {
    -[NSMutableDictionary removeObjectForKey:](self->_registeredAccessoryConnections, "removeObjectForKey:", v4);
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = __51__ACCNavigationServer_accessoryNavigationDetached___block_invoke;
  v13[3] = &unk_1001FDA88;
  id v14 = v4;
  id v11 = v4;
  -[ACCNavigationServer iterateNavigationProviderListSync:](self, "iterateNavigationProviderListSync:", v13);
}

void __51__ACCNavigationServer_accessoryNavigationDetached___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v10 = a2;
  uint64_t v5 = objc_claimAutoreleasedReturnValue([v10 remoteObject]);
  if (v5)
  {
    id v6 = (void *)v5;
    char v7 = (void *)objc_claimAutoreleasedReturnValue([v10 remoteObject]);
    char v8 = objc_opt_respondsToSelector(v7, "accessoryNavigationDetached:");

    if ((v8 & 1) != 0)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v10 remoteObject]);
      [v9 accessoryNavigationDetached:*(void *)(a1 + 32)];
    }
  }

  *a3 = 1;
}

- (void)accessoryNavigationStartRouteGuidance:(id)a3 componentIdList:(id)a4 options:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects < 5;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v12 = (os_log_s *)&_os_log_default;
    id v11 = &_os_log_default;
  }

  else
  {
    id v12 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v37 = v8;
    __int16 v38 = 2112;
    id v39 = v9;
    __int16 v40 = 2048;
    unint64_t v41 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[#Navigation] Navigation server, accessoryNavigationStartRouteGuidance: %@, componentIdList=%@, options=%llxh",  buf,  0x20u);
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_registeredAccessoryConnections, "objectForKey:", v8));
  if (gLogObjects && gNumLogObjects >= 5)
  {
    id v14 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v14 = (os_log_s *)&_os_log_default;
    id v15 = &_os_log_default;
  }

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    navigationProviderInfo = self->_navigationProviderInfo;
    *(_DWORD *)buf = 138412802;
    id v37 = v8;
    __int16 v38 = 2112;
    id v39 = v13;
    __int16 v40 = 2112;
    unint64_t v41 = (unint64_t)navigationProviderInfo;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "[#Navigation] Navigation server, accessoryNavigationStartRouteGuidance: %@, accessory=%@ _navigationProviderInfo=%@",  buf,  0x20u);
  }

  if (v13)
  {
    v25 = self;
    id v16 = v9;
    __int16 v17 = v16;
    if (!v16) {
      id v16 = (id)objc_claimAutoreleasedReturnValue([v13 componentIdList]);
    }
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id v18 = v16;
    id v19 = [v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v32;
      do
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v32 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v31 + 1) + 8LL * (void)i);
          [v13 setComponent:v23 options:a5];
          [v13 setComponent:v23 started:1];
        }

        id v20 = [v18 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }

      while (v20);
    }

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472LL;
    v26[2] = __85__ACCNavigationServer_accessoryNavigationStartRouteGuidance_componentIdList_options___block_invoke;
    v26[3] = &unk_1001FDAD8;
    id v27 = v8;
    id v28 = v17;
    unint64_t v30 = a5;
    id v29 = v13;
    -[ACCNavigationServer iterateNavigationProviderListSync:](v25, "iterateNavigationProviderListSync:", v26);
  }
}

void __85__ACCNavigationServer_accessoryNavigationStartRouteGuidance_componentIdList_options___block_invoke( void *a1,  void *a2,  _BYTE *a3)
{
  id v5 = a2;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteObject]);

  if (v6)
  {
    char v7 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteObject]);
    char v8 = objc_opt_respondsToSelector(v7, "accessoryNavigationStartRouteGuidance:componentIdList:options:");

    if ((v8 & 1) != 0)
    {
      id v9 = (id)objc_claimAutoreleasedReturnValue([v5 remoteObject]);
      [v9 accessoryNavigationStartRouteGuidance:a1[4] componentIdList:a1[5] options:a1[7]];
    }

    else
    {
      if (gLogObjects && gNumLogObjects >= 5)
      {
        id v9 = *(id *)(gLogObjects + 32);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        id v9 = &_os_log_default;
        id v10 = &_os_log_default;
      }

      if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEBUG)) {
        __85__ACCNavigationServer_accessoryNavigationStartRouteGuidance_componentIdList_options___block_invoke_cold_1();
      }
    }
  }

  *a3 = 1;
}

- (void)accessoryNavigationStopRouteGuidance:(id)a3 componentIdList:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 5;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v10 = (os_log_s *)&_os_log_default;
    id v9 = &_os_log_default;
  }

  else
  {
    id v10 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v29 = v6;
    __int16 v30 = 2112;
    id v31 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[#Navigation] Navigation server, accessoryNavigationStopRouteGuidance: %@, componentIdList=%@",  buf,  0x16u);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_registeredAccessoryConnections, "objectForKey:", v6));
  if (v11)
  {
    id v12 = v7;
    id v13 = v12;
    if (!v12) {
      id v12 = (id)objc_claimAutoreleasedReturnValue([v11 componentIdList]);
    }
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    id v14 = v12;
    id v15 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v24;
      do
      {
        for (i = 0LL; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v24 != v17) {
            objc_enumerationMutation(v14);
          }
          [v11 setComponent:*(void *)(*((void *)&v23 + 1) + 8 * (void)i) started:0];
        }

        id v16 = [v14 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }

      while (v16);
    }

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = __76__ACCNavigationServer_accessoryNavigationStopRouteGuidance_componentIdList___block_invoke;
    v19[3] = &unk_1001FDB00;
    id v20 = v6;
    id v21 = v13;
    id v22 = v11;
    -[ACCNavigationServer iterateNavigationProviderListSync:](self, "iterateNavigationProviderListSync:", v19);
  }
}

void __76__ACCNavigationServer_accessoryNavigationStopRouteGuidance_componentIdList___block_invoke( uint64_t a1,  void *a2,  _BYTE *a3)
{
  id v5 = a2;
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 remoteObject]);
  if (v6
    && (id v7 = (void *)v6,
        BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteObject]),
        char v9 = objc_opt_respondsToSelector(v8, "accessoryNavigationStopRouteGuidance:componentIdList:"),
        v8,
        v7,
        (v9 & 1) != 0))
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue([v5 remoteObject]);
    [v10 accessoryNavigationStopRouteGuidance:*(void *)(a1 + 32) componentIdList:*(void *)(a1 + 40)];
  }

  else
  {
    if (gLogObjects) {
      BOOL v11 = gNumLogObjects < 5;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v10 = &_os_log_default;
      id v12 = &_os_log_default;
    }

    else
    {
      id v10 = *(id *)(gLogObjects + 32);
    }

    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEBUG)) {
      __76__ACCNavigationServer_accessoryNavigationStopRouteGuidance_componentIdList___block_invoke_cold_1();
    }
  }

  *a3 = 1;
}

- (void)accessoryNavigationObjectDetectionUpdateInfo:(id)a3 componentIdList:(id)a4 updateInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 5;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v13 = (os_log_s *)&_os_log_default;
    id v12 = &_os_log_default;
  }

  else
  {
    id v13 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v21 = v8;
    __int16 v22 = 2112;
    id v23 = v9;
    __int16 v24 = 2112;
    id v25 = v10;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_INFO,  "[#Navigation] Navigation server, accessoryNavigationObjectDetectionUpdateInfo: %@, componentIdList=%@, updateInfo=%@",  buf,  0x20u);
  }

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_registeredAccessoryConnections, "objectForKey:", v8));
  if (v14)
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = __95__ACCNavigationServer_accessoryNavigationObjectDetectionUpdateInfo_componentIdList_updateInfo___block_invoke;
    v15[3] = &unk_1001FDB28;
    id v16 = v8;
    id v17 = v9;
    id v18 = v10;
    id v19 = v14;
    -[ACCNavigationServer iterateNavigationProviderListSync:](self, "iterateNavigationProviderListSync:", v15);
  }
}

void __95__ACCNavigationServer_accessoryNavigationObjectDetectionUpdateInfo_componentIdList_updateInfo___block_invoke( void *a1,  void *a2,  _BYTE *a3)
{
  id v5 = a2;
  uint64_t v6 = objc_claimAutoreleasedReturnValue([v5 remoteObject]);
  if (v6
    && (id v7 = (void *)v6,
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 remoteObject]),
        char v9 = objc_opt_respondsToSelector(v8, "accessoryNavigationObjectDetection:componentIdList:updateInfo:"),
        v8,
        v7,
        (v9 & 1) != 0))
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue([v5 remoteObject]);
    [v10 accessoryNavigationObjectDetection:a1[4] componentIdList:a1[5] updateInfo:a1[6]];
  }

  else
  {
    if (gLogObjects) {
      BOOL v11 = gNumLogObjects < 5;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v10 = &_os_log_default;
      id v12 = &_os_log_default;
    }

    else
    {
      id v10 = *(id *)(gLogObjects + 32);
    }

    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEBUG)) {
      __95__ACCNavigationServer_accessoryNavigationObjectDetectionUpdateInfo_componentIdList_updateInfo___block_invoke_cold_1( (uint64_t)a1,  (uint64_t)v5,  (os_log_t)v10);
    }
  }

  *a3 = 1;
}

- (void)notifyOfProvider:(id)a3 connection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 5;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v10 = (os_log_s *)&_os_log_default;
    id v9 = &_os_log_default;
  }

  else
  {
    id v10 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    navigationProviderInfo = self->_navigationProviderInfo;
    int v17 = 138412802;
    id v18 = v6;
    __int16 v19 = 2112;
    id v20 = v7;
    __int16 v21 = 2112;
    __int16 v22 = navigationProviderInfo;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[#Navigation] Navigation server, notifyOfProvider: %@ connection: %@, _navigationProviderInfo=%@",  (uint8_t *)&v17,  0x20u);
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedLong:]( NSNumber,  "numberWithUnsignedLong:",  [v7 hash]));
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_navigationProviderInfoList, "objectForKey:", v12));
  id v14 = v13;
  if (v13)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 connection]);
    unsigned int v16 = [v15 isEqual:v7];

    if (v16) {
      [v14 setProviderUID:v6];
    }
  }
}

+ (id)sharedServer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __35__ACCNavigationServer_sharedServer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedServer_once_11 != -1) {
    dispatch_once(&sharedServer_once_11, block);
  }
  return (id)sharedServer_sharedInstance_11;
}

void __35__ACCNavigationServer_sharedServer__block_invoke(uint64_t a1)
{
  id v1 = [objc_alloc(*(Class *)(a1 + 32)) initWithXPCServiceName:@"com.apple.accessories.navigation" andFeatureNotification:"com.apple.accessories.navigation.availability-changed"];
  BOOL v2 = (void *)sharedServer_sharedInstance_11;
  sharedServer_sharedInstance_11 = (uint64_t)v1;
}

- (_ACCNavigationProviderInfo)navigationProviderInfo
{
  return self->_navigationProviderInfo;
}

- (void)setNavigationProviderInfo:(id)a3
{
}

- (NSMutableDictionary)navigationProviderInfoList
{
  return self->_navigationProviderInfoList;
}

- (NSMutableDictionary)navigationProviderInfoListByProviderUID
{
  return self->_navigationProviderInfoListByProviderUID;
}

- (NSMutableDictionary)registeredAccessoryConnections
{
  return self->_registeredAccessoryConnections;
}

- (void).cxx_destruct
{
}

  ;
}

void __85__ACCNavigationServer_accessoryNavigationStartRouteGuidance_componentIdList_options___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_21( (void *)&_mh_execute_header,  v0,  v1,  "[#Navigation] Navigation server, accessoryNavigationStartRouteGuidance: %@, Invalid accessory=%@ navInfo=%@, file: %s");
}

void __76__ACCNavigationServer_accessoryNavigationStopRouteGuidance_componentIdList___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_4_21( (void *)&_mh_execute_header,  v0,  v1,  "[#Navigation] Navigation server, accessoryNavigationStopRouteGuidance: %@, Invalid accessory=%@ navInfo=%@, file: %s");
}

void __95__ACCNavigationServer_accessoryNavigationObjectDetectionUpdateInfo_componentIdList_updateInfo___block_invoke_cold_1( uint64_t a1,  uint64_t a2,  os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 56);
  int v5 = 138412802;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "[#Navigation] Navigation server, accessoryNavigationStopRouteGuidance: %@, Invalid accessory=%@ navInfo=%@",  (uint8_t *)&v5,  0x20u);
}

@end