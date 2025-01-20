@interface ACCAssistiveTouchServer
+ (id)sharedServer;
- (ACCAssistiveTouchServer)initWithXPCServiceName:(id)a3 andFeatureNotification:(const char *)a4;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)shouldAcceptXPCConnection:(id)a3;
- (NSLock)registeredAccessoryConnectionsLock;
- (NSMutableDictionary)registeredAccessoryConnections;
- (_ACCAssistiveTouchProviderInfo)assistiveTouchProviderInfo;
- (void)accessoryAssistiveTouchAttached:(id)a3;
- (void)accessoryAssistiveTouchDetached:(id)a3;
- (void)dealloc;
- (void)iterateAttachedConnectionsSync:(id)a3;
- (void)requestState:(id)a3;
- (void)setAssistiveTouchProviderInfo:(id)a3;
- (void)setEnabled:(id)a3 flag:(BOOL)a4;
@end

@implementation ACCAssistiveTouchServer

- (ACCAssistiveTouchServer)initWithXPCServiceName:(id)a3 andFeatureNotification:(const char *)a4
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___ACCAssistiveTouchServer;
  v7 = -[ACCFeatureServer initWithXPCServiceName:andFeatureNotification:]( &v17,  "initWithXPCServiceName:andFeatureNotification:",  v6,  a4);
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
    id v19 = v6;
    __int16 v20 = 2080;
    v21 = a4;
    __int16 v22 = 2112;
    v23 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "initWithXPCServiceName: serviceName='%@' notification='%s' self=%@",  buf,  0x20u);
  }

  if (v7)
  {
    assistiveTouchProviderInfo = v7->_assistiveTouchProviderInfo;
    v7->_assistiveTouchProviderInfo = 0LL;

    v12 = objc_alloc_init(&OBJC_CLASS___NSLock);
    registeredAccessoryConnectionsLock = v7->_registeredAccessoryConnectionsLock;
    v7->_registeredAccessoryConnectionsLock = v12;

    v14 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    registeredAccessoryConnections = v7->_registeredAccessoryConnections;
    v7->_registeredAccessoryConnections = v14;
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
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "dealloc: self=%@", buf, 0xCu);
  }

  assistiveTouchProviderInfo = self->_assistiveTouchProviderInfo;
  self->_assistiveTouchProviderInfo = 0LL;

  registeredAccessoryConnections = self->_registeredAccessoryConnections;
  self->_registeredAccessoryConnections = 0LL;

  registeredAccessoryConnectionsLock = self->_registeredAccessoryConnectionsLock;
  self->_registeredAccessoryConnectionsLock = 0LL;

  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___ACCAssistiveTouchServer;
  -[ACCFeatureServer dealloc](&v9, "dealloc");
}

- (void)iterateAttachedConnectionsSync:(id)a3
{
  id v4 = (void (**)(id, void *, char *))a3;
  -[NSLock lock](self->_registeredAccessoryConnectionsLock, "lock");
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
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
      v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
      char v12 = 1;
      v11 = (void *)objc_claimAutoreleasedReturnValue([v10 accessoryUID]);
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

  -[NSLock unlock](self->_registeredAccessoryConnectionsLock, "unlock");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v22 = a3;
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
    v30 = (_ACCAssistiveTouchProviderInfo *)xpcServiceName;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "New XPC connection for: %@", buf, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ACCAssistiveTouchXPCServerProtocol));
  [v6 setExportedInterface:v11];

  char v12 = -[ACCAssistiveTouchServerRemote initWithXPCConnection:]( objc_alloc(&OBJC_CLASS___ACCAssistiveTouchServerRemote),  "initWithXPCConnection:",  v6);
  [v6 setExportedObject:v12];
  __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ACCAssistiveTouchXPCClientProtocol));
  [v6 setRemoteObjectInterface:v13];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id from = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&from, v6);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472LL;
  v24[2] = __62__ACCAssistiveTouchServer_listener_shouldAcceptNewConnection___block_invoke;
  v24[3] = &unk_1001FB0E0;
  objc_copyWeak(&v25, &from);
  objc_copyWeak(&v26, &location);
  [v6 setInvalidationHandler:v24];
  __int128 v14 = objc_alloc_init(&OBJC_CLASS____ACCAssistiveTouchProviderInfo);
  -[_ACCAssistiveTouchProviderInfo setConnection:](v14, "setConnection:", v6);
  -[_ACCAssistiveTouchProviderInfo setServerRemote:](v14, "setServerRemote:", v12);
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue([v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_30]);
  -[_ACCAssistiveTouchProviderInfo setRemoteObject:](v14, "setRemoteObject:", v15);

  objc_storeStrong((id *)&self->_assistiveTouchProviderInfo, v14);
  if (gLogObjects && gNumLogObjects >= 5)
  {
    __int128 v16 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    __int128 v16 = (os_log_s *)&_os_log_default;
    id v17 = &_os_log_default;
  }

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    assistiveTouchProviderInfo = self->_assistiveTouchProviderInfo;
    *(_DWORD *)buf = 138412290;
    v30 = assistiveTouchProviderInfo;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "providerInfo=%@", buf, 0xCu);
  }

  [v6 resume];
  dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
  __int16 v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __62__ACCAssistiveTouchServer_listener_shouldAcceptNewConnection___block_invoke_109;
  block[3] = &unk_1001F96F8;
  block[4] = self;
  dispatch_async(v20, block);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

void __62__ACCAssistiveTouchServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
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
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 assistiveTouchProviderInfo]);
    int v10 = 138412546;
    id v11 = WeakRetained;
    __int16 v12 = 2112;
    __int128 v13 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "XPC connection invalidated! %@ providerInfo=%@",  (uint8_t *)&v10,  0x16u);
  }

  id v8 = objc_loadWeakRetained((id *)(a1 + 32));
  [v8 setInvalidationHandler:0];

  id v9 = objc_loadWeakRetained((id *)(a1 + 40));
  [v9 setAssistiveTouchProviderInfo:0];
}

void __62__ACCAssistiveTouchServer_listener_shouldAcceptNewConnection___block_invoke_107(id a1, NSError *a2)
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
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "XPC connection error!", (uint8_t *)&v8, 2u);
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
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v8, 0xCu);
  }
}

id __62__ACCAssistiveTouchServer_listener_shouldAcceptNewConnection___block_invoke_109(uint64_t a1)
{
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  BOOL v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(void *)(a1 + 32) + 64), "allValues", 0));
  id v3 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v13;
    do
    {
      id v6 = 0LL;
      do
      {
        if (*(void *)v13 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*(void *)(a1 + 32) + 56LL);
        if (v7)
        {
          int v8 = *(void **)(*((void *)&v12 + 1) + 8LL * (void)v6);
          id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 remoteObject]);
          int v10 = (void *)objc_claimAutoreleasedReturnValue([v8 accessoryUID]);
          [v9 accessoryAssistiveTouchAttached:v10];
        }

        id v6 = (char *)v6 + 1;
      }

      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }

    while (v4);
  }

  return [*(id *)(*(void *)(a1 + 32) + 72) unlock];
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  id v4 = a3;
  assistiveTouchProviderInfo = self->_assistiveTouchProviderInfo;
  if (assistiveTouchProviderInfo)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[_ACCAssistiveTouchProviderInfo connection](assistiveTouchProviderInfo, "connection"));
    unsigned int v7 = [v6 isEqual:v4];
  }

  else
  {
    unsigned int v7 = 0;
  }

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
    int v10 = (os_log_s *)&_os_log_default;
    id v9 = &_os_log_default;
  }

  else
  {
    int v10 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    id v11 = self->_assistiveTouchProviderInfo;
    v13[0] = 67109634;
    v13[1] = v7;
    __int16 v14 = 2112;
    __int128 v15 = v11;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "AssistiveTouch server, shouldAcceptConnection=%d _assistiveTouchProviderInfo=%@ connection=%@",  (uint8_t *)v13,  0x1Cu);
  }

  return v7;
}

- (void)accessoryAssistiveTouchAttached:(id)a3
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
    unsigned int v7 = (os_log_s *)&_os_log_default;
    id v6 = &_os_log_default;
  }

  else
  {
    unsigned int v7 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "AssistiveTouch server, accessoryAssistiveTouchAttached: %@",  (uint8_t *)&v13,  0xCu);
  }

  -[NSLock lock](self->_registeredAccessoryConnectionsLock, "lock");
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_registeredAccessoryConnections, "objectForKey:", v4));

  if (!v8)
  {
    id v9 = -[_ACCAssistiveTouchAccessoryInfo initWithUID:]( objc_alloc(&OBJC_CLASS____ACCAssistiveTouchAccessoryInfo),  "initWithUID:",  v4);
    -[NSMutableDictionary setObject:forKey:](self->_registeredAccessoryConnections, "setObject:forKey:", v9, v4);
  }

  -[NSLock unlock](self->_registeredAccessoryConnectionsLock, "unlock");
  if (gLogObjects && gNumLogObjects >= 5)
  {
    int v10 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    int v10 = (os_log_s *)&_os_log_default;
    id v11 = &_os_log_default;
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ACCAssistiveTouchServer accessoryAssistiveTouchAttached:].cold.1();
  }

  __int128 v12 = (void *)objc_claimAutoreleasedReturnValue(-[_ACCAssistiveTouchProviderInfo remoteObject](self->_assistiveTouchProviderInfo, "remoteObject"));
  [v12 accessoryAssistiveTouchAttached:v4];
}

- (void)accessoryAssistiveTouchDetached:(id)a3
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
    unsigned int v7 = (os_log_s *)&_os_log_default;
    id v6 = &_os_log_default;
  }

  else
  {
    unsigned int v7 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412290;
    id v13 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "AssistiveTouch server, accessoryAssistiveTouchDetached: %@",  (uint8_t *)&v12,  0xCu);
  }

  -[NSLock lock](self->_registeredAccessoryConnectionsLock, "lock");
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_registeredAccessoryConnections, "objectForKey:", v4));

  if (v8) {
    -[NSMutableDictionary removeObjectForKey:](self->_registeredAccessoryConnections, "removeObjectForKey:", v4);
  }
  -[NSLock unlock](self->_registeredAccessoryConnectionsLock, "unlock");
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

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[ACCAssistiveTouchServer accessoryAssistiveTouchDetached:].cold.1();
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[_ACCAssistiveTouchProviderInfo remoteObject](self->_assistiveTouchProviderInfo, "remoteObject"));
  [v11 accessoryAssistiveTouchDetached:v4];
}

- (void)setEnabled:(id)a3 flag:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
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
    id v9 = (os_log_s *)&_os_log_default;
    id v8 = &_os_log_default;
  }

  else
  {
    id v9 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412546;
    id v15 = v6;
    __int16 v16 = 1024;
    BOOL v17 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "AssistiveTouch server, setEnabled: %@, enabled %d",  (uint8_t *)&v14,  0x12u);
  }

  if (gLogObjects && gNumLogObjects >= 5)
  {
    id v10 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v10 = (os_log_s *)&_os_log_default;
    id v11 = &_os_log_default;
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    assistiveTouchProviderInfo = self->_assistiveTouchProviderInfo;
    int v14 = 138412802;
    id v15 = v6;
    __int16 v16 = 1024;
    BOOL v17 = v4;
    __int16 v18 = 2112;
    id v19 = assistiveTouchProviderInfo;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEBUG,  "AssistiveTouch server, setEnabled: %@, enabled %d, _assistiveTouchProviderInfo=%@",  (uint8_t *)&v14,  0x1Cu);
  }

  int v12 = (void *)objc_claimAutoreleasedReturnValue(-[_ACCAssistiveTouchProviderInfo remoteObject](self->_assistiveTouchProviderInfo, "remoteObject"));
  [v12 setEnabled:v6 flag:v4];
}

- (void)requestState:(id)a3
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
    BOOL v7 = (os_log_s *)&_os_log_default;
    id v6 = &_os_log_default;
  }

  else
  {
    BOOL v7 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "requestState: accessoryUID=%@",  (uint8_t *)&v11,  0xCu);
  }

  if (gLogObjects && gNumLogObjects >= 5)
  {
    id v8 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v8 = (os_log_s *)&_os_log_default;
    id v9 = &_os_log_default;
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[ACCAssistiveTouchServer requestState:].cold.1();
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[_ACCAssistiveTouchProviderInfo remoteObject](self->_assistiveTouchProviderInfo, "remoteObject"));
  [v10 requestState:v4];
}

+ (id)sharedServer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __39__ACCAssistiveTouchServer_sharedServer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedServer_once_8 != -1) {
    dispatch_once(&sharedServer_once_8, block);
  }
  return (id)sharedServer_sharedInstance_8;
}

void __39__ACCAssistiveTouchServer_sharedServer__block_invoke(uint64_t a1)
{
  id v1 = [objc_alloc(*(Class *)(a1 + 32)) initWithXPCServiceName:@"com.apple.accessories.assistivetouch" andFeatureNotification:"com.apple.accessories.assistivetouch.availability-changed"];
  BOOL v2 = (void *)sharedServer_sharedInstance_8;
  sharedServer_sharedInstance_8 = (uint64_t)v1;
}

- (_ACCAssistiveTouchProviderInfo)assistiveTouchProviderInfo
{
  return self->_assistiveTouchProviderInfo;
}

- (void)setAssistiveTouchProviderInfo:(id)a3
{
}

- (NSMutableDictionary)registeredAccessoryConnections
{
  return self->_registeredAccessoryConnections;
}

- (NSLock)registeredAccessoryConnectionsLock
{
  return self->_registeredAccessoryConnectionsLock;
}

- (void).cxx_destruct
{
}

  ;
}

- (void)accessoryAssistiveTouchAttached:.cold.1()
{
  OUTLINED_FUNCTION_5_0( (void *)&_mh_execute_header,  v0,  v1,  "AssistiveTouch server, accessoryAssistiveTouchAttached: %@, _assistiveTouchProviderInfo=%@");
  OUTLINED_FUNCTION_2();
}

- (void)accessoryAssistiveTouchDetached:.cold.1()
{
  OUTLINED_FUNCTION_5_0( (void *)&_mh_execute_header,  v0,  v1,  "AssistiveTouch server, accessoryAssistiveTouchDetached: %@, _assistiveTouchProviderInfo=%@");
  OUTLINED_FUNCTION_2();
}

- (void)requestState:.cold.1()
{
  OUTLINED_FUNCTION_5_0( (void *)&_mh_execute_header,  v0,  v1,  "AssistiveTouch server, requestState: %@, _assistiveTouchProviderInfo=%@");
  OUTLINED_FUNCTION_2();
}

@end