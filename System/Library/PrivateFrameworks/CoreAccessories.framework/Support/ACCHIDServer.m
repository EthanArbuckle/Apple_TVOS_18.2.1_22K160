@interface ACCHIDServer
+ (id)sharedServer;
- (ACCHIDServer)initWithXPCServiceName:(id)a3 andFeatureNotification:(const char *)a4;
- (AccessoryHIDXPCClientProtocol)remoteObject;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)shouldAcceptXPCConnection:(id)a3;
- (NSMutableArray)clientConnections;
- (NSXPCConnection)activeConnection;
- (void)getReportResponse:(id)a3 componentID:(unsigned __int16)a4 reportType:(unsigned __int8)a5 reportID:(unsigned __int8)a6 report:(id)a7;
- (void)inReport:(id)a3 componentID:(unsigned __int16)a4 report:(id)a5;
- (void)registerHIDDescriptor:(id)a3 componentID:(unsigned __int16)a4 dictionary:(id)a5;
- (void)setActiveConnection:(id)a3;
- (void)setClientConnections:(id)a3;
- (void)setRemoteObject:(id)a3;
- (void)unregisterAllDescriptors:(id)a3;
- (void)unregisterHIDDescriptor:(id)a3 componentID:(unsigned __int16)a4;
@end

@implementation ACCHIDServer

- (ACCHIDServer)initWithXPCServiceName:(id)a3 andFeatureNotification:(const char *)a4
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ACCHIDServer;
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
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[#HID] New XPC connection for: %@", buf, 0xCu);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___AccessoryHIDXPCServerProtocol));
  [v7 setExportedInterface:v12];

  v13 = -[ACCHIDServerRemote initWithXPCConnection:]( objc_alloc(&OBJC_CLASS___ACCHIDServerRemote),  "initWithXPCConnection:",  v7);
  [v7 setExportedObject:v13];

  v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSXPCInterface interfaceWithProtocol:]( &OBJC_CLASS___NSXPCInterface,  "interfaceWithProtocol:",  &OBJC_PROTOCOL___AccessoryHIDXPCClientProtocol));
  [v7 setRemoteObjectInterface:v14];

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id from = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&from, v7);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = __51__ACCHIDServer_listener_shouldAcceptNewConnection___block_invoke;
  v28[3] = &unk_1001F9A28;
  objc_copyWeak(&v29, &from);
  v28[4] = self;
  objc_copyWeak(&v30, &location);
  [v7 setInvalidationHandler:v28];
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ACCHIDServer clientConnections](self, "clientConnections"));
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
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[ACCHIDServer clientConnections](self, "clientConnections"));
    v19 = (NSString *)[v18 count];
    *(_DWORD *)buf = 134217984;
    v34 = v19;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "[#HID] There are now %lu client(s).",  buf,  0xCu);
  }

  [v7 resume];
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ACCHIDServer clientConnections](self, "clientConnections"));
  BOOL v21 = [v20 count] == (id)1;

  if (v21)
  {
    -[ACCHIDServer setActiveConnection:](self, "setActiveConnection:", v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ACCHIDServer activeConnection](self, "activeConnection"));
    v23 = (void *)objc_claimAutoreleasedReturnValue([v22 remoteObjectProxyWithErrorHandler:&__block_literal_global_6]);
    -[ACCHIDServer setRemoteObject:](self, "setRemoteObject:", v23);

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
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[ACCHIDServer remoteObject](self, "remoteObject"));
      -[ACCHIDServer listener:shouldAcceptNewConnection:].cold.1(v26, buf, v24);
    }
  }

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return 1;
}

void __51__ACCHIDServer_listener_shouldAcceptNewConnection___block_invoke(id *a1)
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
    int v22 = 138412290;
    id v23 = WeakRetained;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[#HID] XPC connection invalidated: %@",  (uint8_t *)&v22,  0xCu);
  }

  id v6 = a1 + 5;
  id v7 = objc_loadWeakRetained(a1 + 5);
  [v7 setInvalidationHandler:0];

  id v8 = objc_loadWeakRetained(a1 + 5);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([a1[4] activeConnection]);
  unsigned int v10 = [v8 isEqual:v9];

  if (v10)
  {
    id v11 = objc_loadWeakRetained(a1 + 6);
    [v11 setActiveConnection:0];

    id v12 = objc_loadWeakRetained(a1 + 6);
    [v12 setRemoteObject:0];
  }

  v13 = a1 + 6;
  id v14 = objc_loadWeakRetained(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue([v14 clientConnections]);
  id v16 = objc_loadWeakRetained(v6);
  [v15 removeObject:v16];

  if (gLogObjects && gNumLogObjects >= 5)
  {
    id v17 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v17 = (os_log_s *)&_os_log_default;
    id v18 = &_os_log_default;
  }

  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = objc_loadWeakRetained(v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue([v19 clientConnections]);
    id v21 = [v20 count];
    int v22 = 134217984;
    id v23 = v21;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "[#HID] There are now %lu client(s).",  (uint8_t *)&v22,  0xCu);
  }
}

void __51__ACCHIDServer_listener_shouldAcceptNewConnection___block_invoke_71(id a1, NSError *a2)
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
    __51__ACCHIDServer_listener_shouldAcceptNewConnection___block_invoke_71_cold_1((uint64_t)v2, v5);
  }
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACCHIDServer clientConnections](self, "clientConnections"));
  if ([v5 count])
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACCHIDServer clientConnections](self, "clientConnections"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectAtIndexedSubscript:0]);
    unsigned __int8 v8 = [v7 isEqual:v4];
  }

  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (void)registerHIDDescriptor:(id)a3 componentID:(unsigned __int16)a4 dictionary:(id)a5
{
  uint64_t v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[ACCHIDServer remoteObject](self, "remoteObject"));
  [v10 registerHIDDescriptor:v9 componentID:v5 dictionary:v8 withReply:&__block_literal_global_74];
}

void __61__ACCHIDServer_registerHIDDescriptor_componentID_dictionary___block_invoke(id a1, NSString *a2)
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
    uint64_t v5 = (os_log_s *)&_os_log_default;
    id v4 = &_os_log_default;
  }

  else
  {
    uint64_t v5 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = v2;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_INFO,  "[#HID] registerHIDDescriptor descriptorUUID: %@",  (uint8_t *)&v6,  0xCu);
  }
}

- (void)unregisterHIDDescriptor:(id)a3 componentID:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = (id)objc_claimAutoreleasedReturnValue(-[ACCHIDServer remoteObject](self, "remoteObject"));
  [v7 unregisterHIDDescriptor:v6 componentID:v4 withReply:&__block_literal_global_76_0];
}

void __52__ACCHIDServer_unregisterHIDDescriptor_componentID___block_invoke(id a1, BOOL a2)
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
    uint64_t v4 = (os_log_s *)&_os_log_default;
    id v3 = &_os_log_default;
  }

  else
  {
    uint64_t v4 = (os_log_s *)*(id *)(gLogObjects + 32);
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __52__ACCHIDServer_unregisterHIDDescriptor_componentID___block_invoke_cold_1();
  }
}

- (void)unregisterAllDescriptors:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[ACCHIDServer remoteObject](self, "remoteObject"));
  [v5 unregisterAllDescriptors:v4 withReply:&__block_literal_global_77_0];
}

void __41__ACCHIDServer_unregisterAllDescriptors___block_invoke(id a1, BOOL a2)
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

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __41__ACCHIDServer_unregisterAllDescriptors___block_invoke_cold_1();
  }
}

- (void)inReport:(id)a3 componentID:(unsigned __int16)a4 report:(id)a5
{
  uint64_t v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = (id)objc_claimAutoreleasedReturnValue(-[ACCHIDServer remoteObject](self, "remoteObject"));
  [v10 inReport:v9 componentID:v5 report:v8 withReply:&__block_literal_global_78];
}

void __44__ACCHIDServer_inReport_componentID_report___block_invoke(id a1, BOOL a2)
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

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __44__ACCHIDServer_inReport_componentID_report___block_invoke_cold_1();
  }
}

- (void)getReportResponse:(id)a3 componentID:(unsigned __int16)a4 reportType:(unsigned __int8)a5 reportID:(unsigned __int8)a6 report:(id)a7
{
  uint64_t v7 = a6;
  uint64_t v8 = a5;
  uint64_t v9 = a4;
  id v12 = a7;
  id v13 = a3;
  id v14 = (id)objc_claimAutoreleasedReturnValue(-[ACCHIDServer remoteObject](self, "remoteObject"));
  [v14 getReportResponse:v13 componentID:v9 reportType:v8 reportID:v7 report:v12 withReply:&__block_literal_global_79_0];
}

void __73__ACCHIDServer_getReportResponse_componentID_reportType_reportID_report___block_invoke(id a1, BOOL a2)
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

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __73__ACCHIDServer_getReportResponse_componentID_reportType_reportID_report___block_invoke_cold_1();
  }
}

- (NSXPCConnection)activeConnection
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[ACCHIDServer clientConnections](self, "clientConnections"));
  id v4 = [v3 count];

  if (v4)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACCHIDServer clientConnections](self, "clientConnections"));
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
  block[2] = __28__ACCHIDServer_sharedServer__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedServer_once_1 != -1) {
    dispatch_once(&sharedServer_once_1, block);
  }
  return (id)sharedServer_sharedInstance_1;
}

void __28__ACCHIDServer_sharedServer__block_invoke(uint64_t a1)
{
  id v1 = [objc_alloc(*(Class *)(a1 + 32)) initWithXPCServiceName:@"com.apple.accessories.hid" andFeatureNotification:"com.apple.accessories.hid.availability-changed"];
  BOOL v2 = (void *)sharedServer_sharedInstance_1;
  sharedServer_sharedInstance_1 = (uint64_t)v1;
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

- (AccessoryHIDXPCClientProtocol)remoteObject
{
  return self->_remoteObject;
}

- (void)setRemoteObject:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)listener:(os_log_t)log shouldAcceptNewConnection:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "[#HID] Get remote object: %@", buf, 0xCu);
}

void __51__ACCHIDServer_listener_shouldAcceptNewConnection___block_invoke_71_cold_1( uint64_t a1,  os_log_s *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_ERROR,  "[#HID] XPC connection error: %@",  (uint8_t *)&v2,  0xCu);
  OUTLINED_FUNCTION_2();
}

void __52__ACCHIDServer_unregisterHIDDescriptor_componentID___block_invoke_cold_1()
{
}

void __41__ACCHIDServer_unregisterAllDescriptors___block_invoke_cold_1()
{
}

void __44__ACCHIDServer_inReport_componentID_report___block_invoke_cold_1()
{
}

void __73__ACCHIDServer_getReportResponse_componentID_reportType_reportID_report___block_invoke_cold_1()
{
}

@end