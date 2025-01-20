@interface ACCCommunicationsServer
+ (id)sharedServer;
- (ACCCommunicationsServer)initWithXPCServiceName:(id)a3 andFeatureNotification:(const char *)a4;
- (ACCCommunicationsXPCClientProtocol)remoteObject;
- (BOOL)acceptCallWithAction:(int)a3 callUUID:(id)a4;
- (BOOL)endAllCalls;
- (BOOL)endCallWithAction:(int)a3 callUUID:(id)a4;
- (BOOL)initiateCallToDestination:(id)a3 withService:(int)a4 addressBookID:(id)a5;
- (BOOL)initiateCallToVoicemail;
- (BOOL)initiateRedial;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)mergeCalls;
- (BOOL)sendDTMF:(int)a3 forCallWithUUID:(id)a4;
- (BOOL)shouldAcceptXPCConnection:(id)a3;
- (BOOL)swapCalls;
- (BOOL)updateHoldStatus:(BOOL)a3 forCallWithUUID:(id)a4;
- (BOOL)updateMuteStatus:(BOOL)a3;
- (NSMutableArray)clientConnections;
- (NSXPCConnection)activeConnection;
- (unint64_t)invokeBlockOnClients:(id)a3 synchronous:(BOOL)a4;
- (void)refreshClientData;
- (void)sendUpdatedSubscriberList;
- (void)setActiveConnection:(id)a3;
- (void)setClientConnections:(id)a3;
- (void)setRemoteObject:(id)a3;
- (void)triggerCallStateUpdates;
- (void)triggerCommunicationsUpdate;
- (void)triggerUpdateForListType:(int)a3 coalesce:(BOOL)a4;
@end

@implementation ACCCommunicationsServer

- (ACCCommunicationsServer)initWithXPCServiceName:(id)a3 andFeatureNotification:(const char *)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ACCCommunicationsServer;
  v4 = -[ACCFeatureServer initWithXPCServiceName:andFeatureNotification:]( &v10,  "initWithXPCServiceName:andFeatureNotification:",  a3,  a4);
  if (v4)
  {
    v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    clientConnections = v4->_clientConnections;
    v4->_clientConnections = v5;

    activeConnection = v4->_activeConnection;
    v4->_activeConnection = 0LL;

    remoteObject = v4->_remoteObject;
    v4->_remoteObject = 0LL;
  }

  return v4;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
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
    objc_super v10 = (os_log_s *)&_os_log_default;
    id v9 = &_os_log_default;
  }

  else
  {
    objc_super v10 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    xpcServiceName = self->super._xpcServiceName;
    *(_DWORD *)buf = 138412290;
    v34 = xpcServiceName;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[#Communications] New XPC connection for: %@",  buf,  0xCu);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ACCCommunicationsXPCServerProtocol));
  [v7 setExportedInterface:v12];

  v13 = -[ACCCommunicationsServerRemote initWithXPCConnection:]( objc_alloc(&OBJC_CLASS___ACCCommunicationsServerRemote),  "initWithXPCConnection:",  v7);
  [v7 setExportedObject:v13];

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___ACCCommunicationsXPCClientProtocol));
  [v7 setRemoteObjectInterface:v14];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id from = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&from, v7);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = __62__ACCCommunicationsServer_listener_shouldAcceptNewConnection___block_invoke;
  v28[3] = &unk_1001F9A28;
  objc_copyWeak(&v29, &from);
  v28[4] = self;
  objc_copyWeak(&v30, &location);
  [v7 setInvalidationHandler:v28];
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ACCCommunicationsServer clientConnections](self, "clientConnections"));
  [v15 addObject:v7];

  if (gLogObjects && gNumLogObjects >= 5)
  {
    v16 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v16 = (os_log_s *)&_os_log_default;
    id v17 = &_os_log_default;
  }

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ACCCommunicationsServer clientConnections](self, "clientConnections"));
    v19 = (NSString *)[v18 count];
    *(_DWORD *)buf = 134217984;
    v34 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[#Communications] There are now %lu client(s).",  buf,  0xCu);
  }

  [v7 resume];
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ACCCommunicationsServer clientConnections](self, "clientConnections"));
  BOOL v21 = [v20 count] == (id)1;

  if (v21)
  {
    -[ACCCommunicationsServer setActiveConnection:](self, "setActiveConnection:", v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ACCCommunicationsServer activeConnection](self, "activeConnection"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 remoteObjectProxyWithErrorHandler:&__block_literal_global_41]);
    -[ACCCommunicationsServer setRemoteObject:](self, "setRemoteObject:", v23);

    if (gLogObjects && gNumLogObjects >= 5)
    {
      v24 = (os_log_s *)*(id *)(gLogObjects + 32);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v24 = (os_log_s *)&_os_log_default;
      id v25 = &_os_log_default;
    }

    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[ACCCommunicationsServer remoteObject](self, "remoteObject"));
      -[ACCCommunicationsServer listener:shouldAcceptNewConnection:].cold.1(v26, (uint64_t)buf, v24);
    }
  }

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

id __62__ACCCommunicationsServer_listener_shouldAcceptNewConnection___block_invoke(id *a1)
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
    v4 = (os_log_s *)&_os_log_default;
    id v3 = &_os_log_default;
  }

  else
  {
    v4 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 5);
    int v21 = 138412290;
    id v22 = WeakRetained;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[#Communications] XPC connection invalidated: %@",  (uint8_t *)&v21,  0xCu);
  }

  id v6 = objc_loadWeakRetained(a1 + 5);
  [v6 setInvalidationHandler:0];

  id v7 = objc_loadWeakRetained(a1 + 5);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([a1[4] activeConnection]);
  unsigned int v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = objc_loadWeakRetained(a1 + 6);
    [v10 setActiveConnection:0];

    id v11 = objc_loadWeakRetained(a1 + 6);
    [v11 setRemoteObject:0];
  }

  id v12 = objc_loadWeakRetained(a1 + 6);
  v13 = (void *)objc_claimAutoreleasedReturnValue([v12 clientConnections]);
  id v14 = objc_loadWeakRetained(a1 + 5);
  [v13 removeObject:v14];

  if (gLogObjects && gNumLogObjects >= 5)
  {
    v15 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v15 = (os_log_s *)&_os_log_default;
    id v16 = &_os_log_default;
  }

  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = objc_loadWeakRetained(a1 + 6);
    v18 = (void *)objc_claimAutoreleasedReturnValue([v17 clientConnections]);
    id v19 = [v18 count];
    int v21 = 134217984;
    id v22 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[#Communications] There are now %lu client(s).",  (uint8_t *)&v21,  0xCu);
  }

  return [a1[4] refreshClientData];
}

void __62__ACCCommunicationsServer_listener_shouldAcceptNewConnection___block_invoke_82(id a1, NSError *a2)
{
  BOOL v2 = a2;
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
    v5 = (os_log_s *)&_os_log_default;
    id v4 = &_os_log_default;
  }

  else
  {
    v5 = (os_log_s *)*(id *)(gLogObjects + 16);
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __62__ACCCommunicationsServer_listener_shouldAcceptNewConnection___block_invoke_82_cold_1();
  }
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  return 1;
}

- (unint64_t)invokeBlockOnClients:(id)a3 synchronous:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (void (**)(id, uint64_t))a3;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACCCommunicationsServer clientConnections](self, "clientConnections"));
  id v8 = [v7 copy];

  if (gLogObjects) {
    BOOL v9 = gNumLogObjects < 5;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v11 = (os_log_s *)&_os_log_default;
    id v10 = &_os_log_default;
  }

  else
  {
    id v11 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v28 = [v8 count];
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "[#Communications] Invoking block on %lu client(s)...",  buf,  0xCu);
  }

  __int128 v24 = 0u;
  __int128 v25 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v12 = v8;
  id v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    id v14 = v13;
    unint64_t v15 = 0LL;
    uint64_t v16 = *(void *)v23;
    do
    {
      for (i = 0LL; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v12);
        }
        v18 = *(void **)(*((void *)&v22 + 1) + 8LL * (void)i);
        if (v4) {
          uint64_t v19 = objc_claimAutoreleasedReturnValue([v18 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_84]);
        }
        else {
          uint64_t v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_86_0, (void)v22));
        }
        v20 = (void *)v19;
        if (v6)
        {
          v6[2](v6, v19);
          ++v15;
        }
      }

      id v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v14);
  }

  else
  {
    unint64_t v15 = 0LL;
  }

  return v15;
}

void __60__ACCCommunicationsServer_invokeBlockOnClients_synchronous___block_invoke(id a1, NSError *a2)
{
  BOOL v2 = a2;
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
    v5 = (os_log_s *)&_os_log_default;
    id v4 = &_os_log_default;
  }

  else
  {
    v5 = (os_log_s *)*(id *)(gLogObjects + 16);
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __62__ACCCommunicationsServer_listener_shouldAcceptNewConnection___block_invoke_82_cold_1();
  }
}

void __60__ACCCommunicationsServer_invokeBlockOnClients_synchronous___block_invoke_85(id a1, NSError *a2)
{
  BOOL v2 = a2;
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
    v5 = (os_log_s *)&_os_log_default;
    id v4 = &_os_log_default;
  }

  else
  {
    v5 = (os_log_s *)*(id *)(gLogObjects + 16);
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __62__ACCCommunicationsServer_listener_shouldAcceptNewConnection___block_invoke_82_cold_1();
  }
}

- (void)refreshClientData
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
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[#Communications] Refreshing client data...",  v16,  2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACCFeatureServer subFeatureSubscribers](self, "subFeatureSubscribers"));
  unsigned int v7 = [v6 containsObject:@"CallStateUpdates"];

  if (v7) {
    -[ACCCommunicationsServer triggerCallStateUpdates](self, "triggerCallStateUpdates");
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACCFeatureServer subFeatureSubscribers](self, "subFeatureSubscribers"));
  unsigned int v9 = [v8 containsObject:@"CommunicationsUpdates"];

  if (v9) {
    -[ACCCommunicationsServer triggerCommunicationsUpdate](self, "triggerCommunicationsUpdate");
  }
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[ACCFeatureServer subFeatureSubscribers](self, "subFeatureSubscribers"));
  unsigned int v11 = [v10 containsObject:@"ListUpdates_Recents"];

  if (v11) {
    -[ACCCommunicationsServer triggerUpdateForListType:coalesce:](self, "triggerUpdateForListType:coalesce:", 0LL, 0LL);
  }
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[ACCFeatureServer subFeatureSubscribers](self, "subFeatureSubscribers"));
  unsigned int v13 = [v12 containsObject:@"ListUpdates_Recents_Coalesced"];

  if (v13) {
    -[ACCCommunicationsServer triggerUpdateForListType:coalesce:](self, "triggerUpdateForListType:coalesce:", 0LL, 1LL);
  }
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[ACCFeatureServer subFeatureSubscribers](self, "subFeatureSubscribers"));
  unsigned int v15 = [v14 containsObject:@"ListUpdates_Favorites"];

  if (v15) {
    -[ACCCommunicationsServer triggerUpdateForListType:coalesce:](self, "triggerUpdateForListType:coalesce:", 1LL, 0LL);
  }
}

- (void)sendUpdatedSubscriberList
{
}

void __52__ACCCommunicationsServer_sendUpdatedSubscriberList__block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v2 subFeatureSubscribers]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 allObjects]);
  [v3 updateSubscriberList:v4 withReply:&__block_literal_global_88_0];
}

void __52__ACCCommunicationsServer_sendUpdatedSubscriberList__block_invoke_2(id a1, BOOL a2)
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
    id v5 = (os_log_s *)&_os_log_default;
    id v4 = &_os_log_default;
  }

  else
  {
    id v5 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __52__ACCCommunicationsServer_sendUpdatedSubscriberList__block_invoke_2_cold_1(a2, v5);
  }
}

- (void)triggerCallStateUpdates
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = __50__ACCCommunicationsServer_triggerCallStateUpdates__block_invoke;
  v4[3] = &unk_1001FE2B0;
  v4[4] = &v5;
  -[ACCCommunicationsServer invokeBlockOnClients:synchronous:](self, "invokeBlockOnClients:synchronous:", v4, 1LL);
  if (!*((_BYTE *)v6 + 24))
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_async(v3, &__block_literal_global_90);
  }

  _Block_object_dispose(&v5, 8);
}

id __50__ACCCommunicationsServer_triggerCallStateUpdates__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = __50__ACCCommunicationsServer_triggerCallStateUpdates__block_invoke_2;
  v3[3] = &unk_1001FE288;
  v3[4] = *(void *)(a1 + 32);
  return [a2 triggerCallStateUpdatesWithReply:v3];
}

uint64_t __50__ACCCommunicationsServer_triggerCallStateUpdates__block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 1;
  }
  return result;
}

void __50__ACCCommunicationsServer_triggerCallStateUpdates__block_invoke_3(id a1)
{
  if (gLogObjects) {
    BOOL v1 = gNumLogObjects < 5;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    BOOL v3 = (os_log_s *)&_os_log_default;
    id v2 = &_os_log_default;
  }

  else
  {
    BOOL v3 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[#Communications] No clients handle call state updates, sending default call state...",  v5,  2u);
  }

  id v4 = (const void *)platform_communications_copyDefaultCallState();
  platform_communications_callStateUpdate((uint64_t)v4);
  if (v4) {
    CFRelease(v4);
  }
}

- (void)triggerCommunicationsUpdate
{
  uint64_t v5 = 0LL;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000LL;
  char v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = __54__ACCCommunicationsServer_triggerCommunicationsUpdate__block_invoke;
  v4[3] = &unk_1001FE2B0;
  v4[4] = &v5;
  -[ACCCommunicationsServer invokeBlockOnClients:synchronous:](self, "invokeBlockOnClients:synchronous:", v4, 1LL);
  if (!*((_BYTE *)v6 + 24))
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    dispatch_async(v3, &__block_literal_global_91);
  }

  _Block_object_dispose(&v5, 8);
}

id __54__ACCCommunicationsServer_triggerCommunicationsUpdate__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = __54__ACCCommunicationsServer_triggerCommunicationsUpdate__block_invoke_2;
  v3[3] = &unk_1001FE288;
  v3[4] = *(void *)(a1 + 32);
  return [a2 triggerCommunicationsUpdateWithReply:v3];
}

uint64_t __54__ACCCommunicationsServer_triggerCommunicationsUpdate__block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 1;
  }
  return result;
}

void __54__ACCCommunicationsServer_triggerCommunicationsUpdate__block_invoke_3(id a1)
{
  if (gLogObjects) {
    BOOL v1 = gNumLogObjects < 5;
  }
  else {
    BOOL v1 = 1;
  }
  if (v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    BOOL v3 = (os_log_s *)&_os_log_default;
    id v2 = &_os_log_default;
  }

  else
  {
    BOOL v3 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "[#Communications] No clients handle communications updates, sending default communications state...",  v5,  2u);
  }

  id v4 = (const void *)platform_communications_copyDefaultCommunicationsState();
  platform_communications_communicationsUpdate((uint64_t)v4);
  if (v4) {
    CFRelease(v4);
  }
}

- (void)triggerUpdateForListType:(int)a3 coalesce:(BOOL)a4
{
  uint64_t v14 = 0LL;
  unsigned int v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = __61__ACCCommunicationsServer_triggerUpdateForListType_coalesce___block_invoke;
  v11[3] = &unk_1001FE318;
  int v12 = a3;
  BOOL v13 = a4;
  v11[4] = &v14;
  -[ACCCommunicationsServer invokeBlockOnClients:synchronous:](self, "invokeBlockOnClients:synchronous:", v11, 1LL);
  if (!*((_BYTE *)v15 + 24))
  {
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __61__ACCCommunicationsServer_triggerUpdateForListType_coalesce___block_invoke_3;
    block[3] = &__block_descriptor_37_e5_v8__0l;
    int v9 = a3;
    BOOL v10 = a4;
    dispatch_async(v7, block);
  }

  _Block_object_dispose(&v14, 8);
}

id __61__ACCCommunicationsServer_triggerUpdateForListType_coalesce___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(unsigned int *)(a1 + 40);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 44);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = __61__ACCCommunicationsServer_triggerUpdateForListType_coalesce___block_invoke_2;
  v5[3] = &unk_1001FE288;
  v5[4] = *(void *)(a1 + 32);
  return [a2 triggerUpdateForListType:v2 coalesce:v3 withReply:v5];
}

uint64_t __61__ACCCommunicationsServer_triggerUpdateForListType_coalesce___block_invoke_2( uint64_t result,  int a2)
{
  if (a2) {
    *(_BYTE *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 1;
  }
  return result;
}

uint64_t __61__ACCCommunicationsServer_triggerUpdateForListType_coalesce___block_invoke_3(uint64_t a1)
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
    int v5 = *(_DWORD *)(a1 + 32);
    v7[0] = 67109120;
    v7[1] = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[#Communications] No clients handle %{coreacc:ACCCommunications_ListUpdate_Type_t}d list updates, sending list not available...",  (uint8_t *)v7,  8u);
  }

  return platform_communications_listUpdate(*(_DWORD *)(a1 + 32), 0LL, *(unsigned __int8 *)(a1 + 36));
}

- (BOOL)initiateCallToDestination:(id)a3 withService:(int)a4 addressBookID:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[ACCCommunicationsServer remoteObject](self, "remoteObject"));

  if (v10)
  {
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[ACCCommunicationsServer remoteObject](self, "remoteObject"));
    [v11 initiateCallToDestination:v8 withService:v6 addressBookID:v9];
  }

  return 1;
}

- (BOOL)initiateCallToVoicemail
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACCCommunicationsServer remoteObject](self, "remoteObject"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ACCCommunicationsServer remoteObject](self, "remoteObject"));
    [v4 initiateCallToVoicemail];
  }

  return 1;
}

- (BOOL)initiateRedial
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACCCommunicationsServer remoteObject](self, "remoteObject"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[ACCCommunicationsServer remoteObject](self, "remoteObject"));
    [v4 initiateRedial];
  }

  return 1;
}

- (BOOL)acceptCallWithAction:(int)a3 callUUID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACCCommunicationsServer remoteObject](self, "remoteObject"));

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACCCommunicationsServer remoteObject](self, "remoteObject"));
    [v8 acceptCallWithAction:v4 callUUID:v6];
  }

  return 1;
}

- (BOOL)endCallWithAction:(int)a3 callUUID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACCCommunicationsServer remoteObject](self, "remoteObject"));

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACCCommunicationsServer remoteObject](self, "remoteObject"));
    [v8 endCallWithAction:v4 callUUID:v6];
  }

  return 1;
}

- (BOOL)endAllCalls
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACCCommunicationsServer remoteObject](self, "remoteObject"));

  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[ACCCommunicationsServer remoteObject](self, "remoteObject"));
    [v4 endAllCalls];
  }

  return 1;
}

- (BOOL)swapCalls
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACCCommunicationsServer remoteObject](self, "remoteObject"));

  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[ACCCommunicationsServer remoteObject](self, "remoteObject"));
    [v4 swapCalls];
  }

  return 1;
}

- (BOOL)mergeCalls
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACCCommunicationsServer remoteObject](self, "remoteObject"));

  if (v3)
  {
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[ACCCommunicationsServer remoteObject](self, "remoteObject"));
    [v4 mergeCalls];
  }

  return 1;
}

- (BOOL)updateHoldStatus:(BOOL)a3 forCallWithUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACCCommunicationsServer remoteObject](self, "remoteObject"));

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACCCommunicationsServer remoteObject](self, "remoteObject"));
    [v8 updateHoldStatus:v4 forCallWithUUID:v6];
  }

  return 1;
}

- (BOOL)updateMuteStatus:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACCCommunicationsServer remoteObject](self, "remoteObject"));

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACCCommunicationsServer remoteObject](self, "remoteObject"));
    [v6 updateMuteStatus:v3];
  }

  return 1;
}

- (BOOL)sendDTMF:(int)a3 forCallWithUUID:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACCCommunicationsServer remoteObject](self, "remoteObject"));

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACCCommunicationsServer remoteObject](self, "remoteObject"));
    [v8 sendDTMF:v4 forCallWithUUID:v6];
  }

  return 1;
}

- (NSXPCConnection)activeConnection
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACCCommunicationsServer clientConnections](self, "clientConnections"));
  id v4 = [v3 count];

  if (v4)
  {
    int v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACCCommunicationsServer clientConnections](self, "clientConnections"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectAtIndexedSubscript:0]);
  }

  else
  {
    id v6 = 0LL;
  }

  return (NSXPCConnection *)v6;
}

+ (id)sharedServer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __39__ACCCommunicationsServer_sharedServer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedServer_once_12 != -1) {
    dispatch_once(&sharedServer_once_12, block);
  }
  return (id)sharedServer_sharedInstance_12;
}

void __39__ACCCommunicationsServer_sharedServer__block_invoke(uint64_t a1)
{
  id v1 = [objc_alloc(*(Class *)(a1 + 32)) initWithXPCServiceName:@"com.apple.accessories.communications" andFeatureNotification:"com.apple.accessories.communications.availability-changed"];
  BOOL v2 = (void *)sharedServer_sharedInstance_12;
  sharedServer_sharedInstance_12 = (uint64_t)v1;
}

- (NSMutableArray)clientConnections
{
  return self->_clientConnections;
}

- (void)setClientConnections:(id)a3
{
}

- (void)setActiveConnection:(id)a3
{
}

- (ACCCommunicationsXPCClientProtocol)remoteObject
{
  return self->_remoteObject;
}

- (void)setRemoteObject:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)listener:(os_log_s *)a3 shouldAcceptNewConnection:.cold.1( void *a1,  uint64_t a2,  os_log_s *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_5_6( (void *)&_mh_execute_header,  a3,  (uint64_t)a3,  "[#Communications] Get remote object: %@",  (uint8_t *)a2);
}

void __62__ACCCommunicationsServer_listener_shouldAcceptNewConnection___block_invoke_82_cold_1()
{
}

void __52__ACCCommunicationsServer_sendUpdatedSubscriberList__block_invoke_2_cold_1(char a1, os_log_s *a2)
{
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "[#Communications] Update subscriber list result: %d",  (uint8_t *)v2,  8u);
}

@end