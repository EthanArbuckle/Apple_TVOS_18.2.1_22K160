@interface ACCTransportServer
+ (id)sharedServer;
- (ACCTransportServer)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)receivedSecureTunnelData:(id)a3 forEndpointWithUUID:(id)a4 connectionUUID:(id)a5;
- (BOOL)receivedSecureTunnelData:(id)a3 forEndpointWithUUID:(id)a4 connectionUUID:(id)a5 toClient:(id)a6;
- (BOOL)sendOutgoingData:(id)a3 forEndpointWithUUID:(id)a4 connectionUUID:(id)a5;
- (BOOL)sendOutgoingData:(id)a3 forEndpointWithUUID:(id)a4 connectionUUID:(id)a5 toClient:(id)a6;
- (NSLock)clientConnectionsLock;
- (NSMutableSet)clientConnections;
- (NSXPCListener)listener;
- (id)clientInfoForConnectionWithUUID:(id)a3;
- (void)authStateDidChange:(int)a3 forConnectionWithUUID:(id)a4 previousAuthState:(int)a5 authType:(int)a6 connectionIsAuthenticated:(BOOL)a7 connectionWasAuthenticated:(BOOL)a8;
- (void)dealloc;
- (void)propertiesDidChange:(id)a3 forConnectionWithUUID:(id)a4 previousProperties:(id)a5;
- (void)propertiesDidChange:(id)a3 forEndpointWithUUID:(id)a4 previousProperties:(id)a5 connectionUUID:(id)a6;
- (void)receivedSecureTunnelDataHandler:(void *)a3 forEndpointWithUUID:(id)a4 connectionUUID:(id)a5;
- (void)setClientConnections:(id)a3;
- (void)setClientConnectionsLock:(id)a3;
- (void)setListener:(id)a3;
- (void)startServer;
- (void)suspendServer;
@end

@implementation ACCTransportServer

- (ACCTransportServer)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ACCTransportServer;
  v2 = -[ACCTransportServer init](&v10, "init");
  if (v2)
  {
    v3 = -[NSXPCListener initWithMachServiceName:]( objc_alloc(&OBJC_CLASS___NSXPCListener),  "initWithMachServiceName:",  @"com.apple.accessories.transport-server");
    listener = v2->_listener;
    v2->_listener = v3;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
    clientConnections = v2->_clientConnections;
    v2->_clientConnections = v5;

    v7 = objc_alloc_init(&OBJC_CLASS___NSLock);
    clientConnectionsLock = v2->_clientConnectionsLock;
    v2->_clientConnectionsLock = v7;

    v2->_token = -1;
    notify_register_check("com.apple.accessories.transport-server.availability-changed", &v2->_token);
  }

  return v2;
}

- (void)dealloc
{
  int token = self->_token;
  if ((token & 0x80000000) == 0) {
    notify_cancel(token);
  }
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___ACCTransportServer;
  -[ACCTransportServer dealloc](&v4, "dealloc");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 3;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    objc_super v10 = (os_log_s *)&_os_log_default;
    id v9 = &_os_log_default;
  }

  else
  {
    objc_super v10 = (os_log_s *)*(id *)(gLogObjects + 16);
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v29 = @"com.apple.accessories.transport-server";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "New XPC connection for: %@", buf, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ACCTransportXPCServerProtocol));
  [v7 setExportedInterface:v11];

  v12 = -[ACCTransportClientInfo initWithXPCConnection:]( objc_alloc(&OBJC_CLASS___ACCTransportClientInfo),  "initWithXPCConnection:",  v7);
  v13 = -[ACCTransportServerRemote initWithClientInfo:]( objc_alloc(&OBJC_CLASS___ACCTransportServerRemote),  "initWithClientInfo:",  v12);
  [v7 setExportedObject:v13];

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ACCTransportXPCClientProtocol));
  [v7 setRemoteObjectInterface:v14];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id from = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&from, v7);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472LL;
  v23[2] = __57__ACCTransportServer_listener_shouldAcceptNewConnection___block_invoke;
  v23[3] = &unk_1001FAC10;
  objc_copyWeak(&v24, &from);
  objc_copyWeak(&v25, &location);
  v23[4] = self;
  [v7 setInvalidationHandler:v23];
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ACCTransportServer clientConnectionsLock](self, "clientConnectionsLock"));
  [v15 lock];

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ACCTransportServer clientConnections](self, "clientConnections"));
  [v16 addObject:v12];

  if (gLogObjects && gNumLogObjects >= 3)
  {
    v17 = (os_log_s *)*(id *)(gLogObjects + 16);
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
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ACCTransportServer clientConnections](self, "clientConnections"));
    v20 = (const __CFString *)[v19 count];
    *(_DWORD *)buf = 134217984;
    v29 = v20;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "There are now %lu client(s).", buf, 0xCu);
  }

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[ACCTransportServer clientConnectionsLock](self, "clientConnectionsLock"));
  [v21 unlock];

  [v7 resume];
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

void __57__ACCTransportServer_listener_shouldAcceptNewConnection___block_invoke(id *a1)
{
  v2 = a1 + 5;
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  [WeakRetained setInvalidationHandler:0];

  id v4 = objc_loadWeakRetained(v2);
  [v4 setExportedObject:0];

  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 3;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v7 = (os_log_s *)&_os_log_default;
    id v6 = &_os_log_default;
  }

  else
  {
    id v7 = (os_log_s *)*(id *)(gLogObjects + 16);
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_loadWeakRetained(v2);
    *(_DWORD *)buf = 138412290;
    id v49 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated: %@", buf, 0xCu);
  }

  id v9 = a1 + 6;
  id v10 = objc_loadWeakRetained(a1 + 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue([v10 clientConnectionsLock]);
  [v11 lock];

  v12 = (void *)objc_claimAutoreleasedReturnValue([a1[4] clientConnections]);
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472LL;
  v44[2] = __57__ACCTransportServer_listener_shouldAcceptNewConnection___block_invoke_113;
  v44[3] = &unk_1001FA2B0;
  id location = &v45;
  objc_copyWeak(&v45, v2);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectsPassingTest:v44]);

  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  id obj = v13;
  int v14 = 0;
  id v15 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v41;
    do
    {
      for (i = 0LL; i != v15; i = (char *)i + 1)
      {
        if (*(void *)v41 != v16) {
          objc_enumerationMutation(obj);
        }
        id v18 = *(void **)(*((void *)&v40 + 1) + 8LL * (void)i);
        __int128 v36 = 0u;
        __int128 v37 = 0u;
        __int128 v38 = 0u;
        __int128 v39 = 0u;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "connectionUUIDs", location));
        id v20 = [v19 countByEnumeratingWithState:&v36 objects:v46 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v37;
          do
          {
            v22 = 0LL;
            v14 += (int)v20;
            do
            {
              if (*(void *)v37 != v21) {
                objc_enumerationMutation(v19);
              }
              acc_manager_removeConnectionWithUUID(*(void **)(*((void *)&v36 + 1) + 8LL * (void)v22));
              v22 = (char *)v22 + 1;
            }

            while (v20 != v22);
            id v20 = [v19 countByEnumeratingWithState:&v36 objects:v46 count:16];
          }

          while (v20);
        }

        id v23 = objc_loadWeakRetained(v9);
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 clientConnections]);
        [v24 removeObject:v18];
      }

      id v15 = [obj countByEnumeratingWithState:&v40 objects:v47 count:16];
    }

    while (v15);
  }

  if (gLogObjects && gNumLogObjects >= 3)
  {
    id v25 = (os_log_s *)*(id *)(gLogObjects + 16);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v25 = (os_log_s *)&_os_log_default;
    id v26 = &_os_log_default;
  }

  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v49) = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "Cleaned up %u connection(s) left behind by transport client...",  buf,  8u);
  }

  if (gLogObjects && gNumLogObjects >= 3)
  {
    v27 = (os_log_s *)*(id *)(gLogObjects + 16);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v27 = (os_log_s *)&_os_log_default;
    id v28 = &_os_log_default;
  }

  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    id v29 = objc_loadWeakRetained(v9);
    v30 = (void *)objc_claimAutoreleasedReturnValue([v29 clientConnections]);
    id v31 = [v30 count];
    *(_DWORD *)buf = 134217984;
    id v49 = v31;
    _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "There are now %lu transport client(s).",  buf,  0xCu);
  }

  id v32 = objc_loadWeakRetained(v9);
  v33 = (void *)objc_claimAutoreleasedReturnValue([v32 clientConnectionsLock]);
  [v33 unlock];

  objc_destroyWeak(location);
}

id __57__ACCTransportServer_listener_shouldAcceptNewConnection___block_invoke_113(uint64_t a1, void *a2)
{
  if (!a2) {
    return 0LL;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue([a2 XPCConnection]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [v3 isEqual:WeakRetained];

  return v5;
}

- (void)startServer
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACCTransportServer listener](self, "listener"));
  [v3 resume];

  int token = self->_token;
  if ((token & 0x80000000) == 0) {
    notify_set_state(token, 1uLL);
  }
  notify_post("com.apple.accessories.transport-server.availability-changed");
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 3;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v7 = (os_log_s *)&_os_log_default;
    id v6 = &_os_log_default;
  }

  else
  {
    id v7 = (os_log_s *)*(id *)(gLogObjects + 16);
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Started accessory transport server!", v8, 2u);
  }
}

- (void)suspendServer
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACCTransportServer listener](self, "listener"));
  [v3 suspend];

  int token = self->_token;
  if ((token & 0x80000000) == 0) {
    notify_set_state(token, 0LL);
  }
  notify_post("com.apple.accessories.transport-server.availability-changed");
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 3;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v7 = (os_log_s *)&_os_log_default;
    id v6 = &_os_log_default;
  }

  else
  {
    id v7 = (os_log_s *)*(id *)(gLogObjects + 16);
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Suspended accessory transport server!", v8, 2u);
  }
}

- (BOOL)sendOutgoingData:(id)a3 forEndpointWithUUID:(id)a4 connectionUUID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ACCTransportServer clientInfoForConnectionWithUUID:](self, "clientInfoForConnectionWithUUID:", v8));
  LOBYTE(self) = -[ACCTransportServer sendOutgoingData:forEndpointWithUUID:connectionUUID:toClient:]( self,  "sendOutgoingData:forEndpointWithUUID:connectionUUID:toClient:",  v10,  v9,  v8,  v11);

  return (char)self;
}

- (BOOL)sendOutgoingData:(id)a3 forEndpointWithUUID:(id)a4 connectionUUID:(id)a5 toClient:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v9) {
    BOOL v12 = v10 == 0LL;
  }
  else {
    BOOL v12 = 1;
  }
  BOOL v13 = v12 || a6 == 0LL;
  BOOL v14 = !v13;
  if (!v13)
  {
    id v15 = a3;
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([a6 XPCConnection]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 remoteObjectProxyWithErrorHandler:&__block_literal_global_32]);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = __83__ACCTransportServer_sendOutgoingData_forEndpointWithUUID_connectionUUID_toClient___block_invoke_117;
    v19[3] = &unk_1001FD778;
    id v20 = v9;
    id v21 = v11;
    [v17 sendOutgoingData:v15 forEndpointWithUUID:v20 connectionUUID:v21 withReply:v19];
  }

  return v14;
}

void __83__ACCTransportServer_sendOutgoingData_forEndpointWithUUID_connectionUUID_toClient___block_invoke( id a1,  NSError *a2)
{
  v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 3;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    BOOL v5 = (os_log_s *)&_os_log_default;
    id v4 = &_os_log_default;
  }

  else
  {
    BOOL v5 = (os_log_s *)*(id *)(gLogObjects + 16);
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __86__ACCConnectionInfoServer_accessoryConnectionAttached_type_info_properties_forClient___block_invoke_cold_1();
  }
}

void __83__ACCTransportServer_sendOutgoingData_forEndpointWithUUID_connectionUUID_toClient___block_invoke_117( uint64_t a1,  char a2)
{
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 3;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v6 = (os_log_s *)&_os_log_default;
    id v5 = &_os_log_default;
  }

  else
  {
    id v6 = (os_log_s *)*(id *)(gLogObjects + 16);
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __83__ACCTransportServer_sendOutgoingData_forEndpointWithUUID_connectionUUID_toClient___block_invoke_117_cold_1( a1,  a2,  v6);
  }
}

- (BOOL)receivedSecureTunnelData:(id)a3 forEndpointWithUUID:(id)a4 connectionUUID:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[ACCTransportServer clientInfoForConnectionWithUUID:](self, "clientInfoForConnectionWithUUID:", v8));
  LOBYTE(self) = -[ACCTransportServer receivedSecureTunnelData:forEndpointWithUUID:connectionUUID:toClient:]( self,  "receivedSecureTunnelData:forEndpointWithUUID:connectionUUID:toClient:",  v10,  v9,  v8,  v11);

  return (char)self;
}

- (BOOL)receivedSecureTunnelData:(id)a3 forEndpointWithUUID:(id)a4 connectionUUID:(id)a5 toClient:(id)a6
{
  if (a4) {
    BOOL v6 = a5 == 0LL;
  }
  else {
    BOOL v6 = 1;
  }
  BOOL v7 = v6 || a6 == 0LL;
  BOOL v8 = !v7;
  if (!v7)
  {
    id v11 = a4;
    id v12 = a3;
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([a6 XPCConnection]);
    BOOL v14 = (void *)objc_claimAutoreleasedReturnValue([v13 remoteObjectProxyWithErrorHandler:&__block_literal_global_119]);
    [v14 receivedSecureTunnelData:v12 forEndpoint:v11];
  }

  return v8;
}

void __91__ACCTransportServer_receivedSecureTunnelData_forEndpointWithUUID_connectionUUID_toClient___block_invoke( id a1,  NSError *a2)
{
  v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 3;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v5 = (os_log_s *)&_os_log_default;
    id v4 = &_os_log_default;
  }

  else
  {
    id v5 = (os_log_s *)*(id *)(gLogObjects + 16);
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __86__ACCConnectionInfoServer_accessoryConnectionAttached_type_info_properties_forClient___block_invoke_cold_1();
  }
}

- (void)authStateDidChange:(int)a3 forConnectionWithUUID:(id)a4 previousAuthState:(int)a5 authType:(int)a6 connectionIsAuthenticated:(BOOL)a7 connectionWasAuthenticated:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  uint64_t v10 = *(void *)&a6;
  uint64_t v11 = *(void *)&a5;
  uint64_t v12 = *(void *)&a3;
  id v18 = a4;
  BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(-[ACCTransportServer clientInfoForConnectionWithUUID:](self, "clientInfoForConnectionWithUUID:"));
  id v15 = v14;
  if (v14)
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v14 XPCConnection]);
    v17 = (void *)objc_claimAutoreleasedReturnValue([v16 remoteObjectProxyWithErrorHandler:&__block_literal_global_120_0]);
    [v17 authStateDidChange:v12 forConnectionWithUUID:v18 previousAuthState:v11 authType:v10 connectionIsAuthenticated:v9 connectionWasAuthenticated:v8];
  }
}

void __143__ACCTransportServer_authStateDidChange_forConnectionWithUUID_previousAuthState_authType_connectionIsAuthenticated_connectionWasAuthenticated___block_invoke( id a1,  NSError *a2)
{
  v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 3;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v5 = (os_log_s *)&_os_log_default;
    id v4 = &_os_log_default;
  }

  else
  {
    id v5 = (os_log_s *)*(id *)(gLogObjects + 16);
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __86__ACCConnectionInfoServer_accessoryConnectionAttached_type_info_properties_forClient___block_invoke_cold_1();
  }
}

- (void)propertiesDidChange:(id)a3 forConnectionWithUUID:(id)a4 previousProperties:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[ACCTransportServer clientInfoForConnectionWithUUID:](self, "clientInfoForConnectionWithUUID:", v8));
  uint64_t v11 = v10;
  if (v10)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 XPCConnection]);
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue([v12 remoteObjectProxyWithErrorHandler:&__block_literal_global_121_0]);
    [v13 propertiesDidChange:v14 forConnectionWithUUID:v8 previousProperties:v9];
  }
}

void __83__ACCTransportServer_propertiesDidChange_forConnectionWithUUID_previousProperties___block_invoke( id a1,  NSError *a2)
{
  v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 3;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v5 = (os_log_s *)&_os_log_default;
    id v4 = &_os_log_default;
  }

  else
  {
    id v5 = (os_log_s *)*(id *)(gLogObjects + 16);
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __86__ACCConnectionInfoServer_accessoryConnectionAttached_type_info_properties_forClient___block_invoke_cold_1();
  }
}

- (void)propertiesDidChange:(id)a3 forEndpointWithUUID:(id)a4 previousProperties:(id)a5 connectionUUID:(id)a6
{
  id v17 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(-[ACCTransportServer clientInfoForConnectionWithUUID:](self, "clientInfoForConnectionWithUUID:", v12));
  id v14 = v13;
  if (v13)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 XPCConnection]);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v15 remoteObjectProxyWithErrorHandler:&__block_literal_global_122_0]);
    [v16 propertiesDidChange:v17 forEndpointWithUUID:v10 previousProperties:v11 connectionUUID:v12];
  }
}

void __96__ACCTransportServer_propertiesDidChange_forEndpointWithUUID_previousProperties_connectionUUID___block_invoke( id a1,  NSError *a2)
{
  v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 3;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v5 = (os_log_s *)&_os_log_default;
    id v4 = &_os_log_default;
  }

  else
  {
    id v5 = (os_log_s *)*(id *)(gLogObjects + 16);
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __86__ACCConnectionInfoServer_accessoryConnectionAttached_type_info_properties_forClient___block_invoke_cold_1();
  }
}

- (void)receivedSecureTunnelDataHandler:(void *)a3 forEndpointWithUUID:(id)a4 connectionUUID:(id)a5
{
  id v13 = a4;
  id v8 = a5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ACCTransportServer clientInfoForConnectionWithUUID:](self, "clientInfoForConnectionWithUUID:", v8));
  id v10 = v9;
  if (v9)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v9 XPCConnection]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 remoteObjectProxyWithErrorHandler:&__block_literal_global_123]);
    [v12 receivedSecureTunnelDataHandler:a3 forEndpointWithUUID:v13 connectionUUID:v8];
  }
}

void __89__ACCTransportServer_receivedSecureTunnelDataHandler_forEndpointWithUUID_connectionUUID___block_invoke( id a1,  NSError *a2)
{
  v2 = a2;
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 3;
  }
  else {
    BOOL v3 = 1;
  }
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v5 = (os_log_s *)&_os_log_default;
    id v4 = &_os_log_default;
  }

  else
  {
    id v5 = (os_log_s *)*(id *)(gLogObjects + 16);
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __86__ACCConnectionInfoServer_accessoryConnectionAttached_type_info_properties_forClient___block_invoke_cold_1();
  }
}

- (id)clientInfoForConnectionWithUUID:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACCTransportServer clientConnectionsLock](self, "clientConnectionsLock"));
    [v5 lock];

    BOOL v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACCTransportServer clientConnections](self, "clientConnections"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = __54__ACCTransportServer_clientInfoForConnectionWithUUID___block_invoke;
    v11[3] = &unk_1001FA7E8;
    id v12 = v4;
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectsPassingTest:v11]);

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACCTransportServer clientConnectionsLock](self, "clientConnectionsLock"));
    [v8 unlock];

    id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 anyObject]);
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

uint64_t __54__ACCTransportServer_clientInfoForConnectionWithUUID___block_invoke( uint64_t a1,  void *a2,  _BYTE *a3)
{
  id v5 = a2;
  BOOL v6 = v5;
  if (v5)
  {
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue([v5 connectionUUIDs]);
    uint64_t v8 = (uint64_t)[v7 containsObject:*(void *)(a1 + 32)];

    if ((_DWORD)v8)
    {
      uint64_t v8 = 1LL;
      *a3 = 1;
    }
  }

  else
  {
    uint64_t v8 = 0LL;
  }

  return v8;
}

+ (id)sharedServer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __34__ACCTransportServer_sharedServer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedServer_once_10 != -1) {
    dispatch_once(&sharedServer_once_10, block);
  }
  return (id)sharedServer_sharedInstance_10;
}

void __34__ACCTransportServer_sharedServer__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedServer_sharedInstance_10;
  sharedServer_sharedInstance_10 = (uint64_t)v1;
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (NSMutableSet)clientConnections
{
  return self->_clientConnections;
}

- (void)setClientConnections:(id)a3
{
}

- (NSLock)clientConnectionsLock
{
  return self->_clientConnectionsLock;
}

- (void)setClientConnectionsLock:(id)a3
{
}

- (void).cxx_destruct
{
}

void __83__ACCTransportServer_sendOutgoingData_forEndpointWithUUID_connectionUUID_toClient___block_invoke_117_cold_1( uint64_t a1,  char a2,  os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  int v5 = 138412802;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  __int16 v9 = 1024;
  int v10 = a2 & 1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Send outgoing data for endpoint: %@, connection: %@, result: %d",  (uint8_t *)&v5,  0x1Cu);
}

@end