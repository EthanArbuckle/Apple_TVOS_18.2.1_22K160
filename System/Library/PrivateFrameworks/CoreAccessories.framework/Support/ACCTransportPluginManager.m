@interface ACCTransportPluginManager
+ (id)sharedManager;
- (ACCTransportPluginManager)init;
- (BOOL)destroyConnectionWithUUID:(id)a3;
- (BOOL)destroyEndpointWithUUID:(id)a3;
- (BOOL)processIncomingData:(id)a3 forEndpointWithUUID:(id)a4;
- (BOOL)publishConnectionWithUUID:(id)a3;
- (BOOL)sendOutgoingData:(id)a3 forEndpointWithUUID:(id)a4 connectionUUID:(id)a5;
- (BOOL)setAccessoryInfo:(id)a3 forEndpointWithUUID:(id)a4;
- (BOOL)setAuthenticationStatus:(int)a3 andCertificateData:(id)a4 authCTA:(BOOL)a5 forConnectionWithUUID:(id)a6;
- (BOOL)setProperties:(id)a3 forConnectionWithUUID:(id)a4;
- (BOOL)setProperties:(id)a3 forEndpointWithUUID:(id)a4;
- (BOOL)setSupervisedTransportsRestricted:(BOOL)a3 forConnectionWithUUID:(id)a4;
- (NSMutableDictionary)endpointDataOutHandlers;
- (id)allConnectionUUIDs;
- (id)allEndpointsUUIDs;
- (id)certificateCapabilitiesForConnectionWithUUID:(id)a3;
- (id)certificateDataForConnectionWithUUID:(id)a3;
- (id)certificateSerialForConnectionWithUUID:(id)a3;
- (id)certificateSerialStringForConnectionWithUUID:(id)a3;
- (id)connectionUUIDForEndpointWithUUID:(id)a3;
- (id)createConnectionWithType:(int)a3 andIdentifier:(id)a4;
- (id)createEndpointWithTransportType:(int)a3 andProtocol:(int)a4 andIdentifier:(id)a5 dataOutHandler:(id)a6 forConnectionWithUUID:(id)a7;
- (id)endpointUUIDsForConnectionWithUUID:(id)a3;
- (id)identifierForConnectionWithUUID:(id)a3;
- (id)identifierForEndpointWithUUID:(id)a3;
- (id)initClass:(Class)a3;
- (id)propertiesForConnectionWithUUID:(id)a3;
- (id)propertiesForEndpointWithUUID:(id)a3;
- (int)authStatusForConnectionWithUUID:(id)a3 authType:(int)a4;
- (int)connectionTypeForConnectionWithUUID:(id)a3;
- (int)protocolForEndpointWithUUID:(id)a3;
- (int)transportTypeForEndpointWithUUID:(id)a3;
- (unint64_t)addTransportPlugInBundleSearchPaths;
- (unint64_t)initAllPlugIns;
- (unint64_t)loadAllBundles;
- (unint64_t)startAllPlugIns;
- (unint64_t)stopAllPlugIns;
- (void)addTransportPlugInBundleSearchPaths;
- (void)initAllPlugIns;
- (void)loadAllBundles;
- (void)setEndpointDataOutHandlers:(id)a3;
@end

@implementation ACCTransportPluginManager

- (ACCTransportPluginManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ACCTransportPluginManager;
  v2 = -[ACCPluginManager init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    -[ACCTransportPluginManager addTransportPlugInBundleSearchPaths](v2, "addTransportPlugInBundleSearchPaths");
    v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    endpointDataOutHandlers = v3->_endpointDataOutHandlers;
    v3->_endpointDataOutHandlers = v4;
  }

  return v3;
}

- (unint64_t)addTransportPlugInBundleSearchPaths
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ACCTransportPluginManager;
  id v3 = -[ACCPluginManager addBundleSearchPath:recursive:]( &v8,  "addBundleSearchPath:recursive:",  @"/System/Library/CoreAccessories/PlugIns/Transports",  0LL);
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 2;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v6 = (os_log_s *)&_os_log_default;
    id v5 = &_os_log_default;
  }

  else
  {
    v6 = (os_log_s *)*(id *)(gLogObjects + 8);
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ACCTransportPluginManager addTransportPlugInBundleSearchPaths].cold.1(self);
  }

  return (unint64_t)v3;
}

- (unint64_t)loadAllBundles
{
  id v3 = (objc_class *)objc_opt_class(&OBJC_CLASS___ACCTransportPlugin);
  BOOL v4 = NSStringFromClass(v3);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v17 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ACCTransportPluginManager;
  id v7 = -[ACCPluginManager loadBundlesWithExtension:andClasses:]( &v14,  "loadBundlesWithExtension:andClasses:",  @"transport",  v6);

  if (gLogObjects && gNumLogObjects >= 2)
  {
    objc_super v8 = (os_log_s *)*(id *)(gLogObjects + 8);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    objc_super v8 = (os_log_s *)&_os_log_default;
    id v9 = &_os_log_default;
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Loaded %lu transport plugin bundle(s)", buf, 0xCu);
  }

  if (gLogObjects && gNumLogObjects >= 2)
  {
    v10 = (os_log_s *)*(id *)(gLogObjects + 8);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v10 = (os_log_s *)&_os_log_default;
    id v11 = &_os_log_default;
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[ACCTransportPluginManager loadAllBundles].cold.1(self, &v13);
  }

  return (unint64_t)v7;
}

- (unint64_t)initAllPlugIns
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ACCTransportPluginManager;
  id v3 = -[ACCPluginManager initAllPlugIns](&v11, "initAllPlugIns");
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 2;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v6 = (os_log_s *)&_os_log_default;
    id v5 = &_os_log_default;
  }

  else
  {
    v6 = (os_log_s *)*(id *)(gLogObjects + 8);
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Initialized %lu transport plugin(s)", buf, 0xCu);
  }

  if (gLogObjects && gNumLogObjects >= 2)
  {
    id v7 = (os_log_s *)*(id *)(gLogObjects + 8);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v7 = (os_log_s *)&_os_log_default;
    id v8 = &_os_log_default;
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ACCTransportPluginManager initAllPlugIns].cold.1(self, &v10);
  }

  return (unint64_t)v3;
}

- (unint64_t)startAllPlugIns
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ACCTransportPluginManager;
  id v2 = -[ACCPluginManager startAllPlugIns](&v7, "startAllPlugIns");
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 2;
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
    id v5 = (os_log_s *)*(id *)(gLogObjects + 8);
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v9 = v2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Started %lu transport plugin(s)", buf, 0xCu);
  }

  return (unint64_t)v2;
}

- (unint64_t)stopAllPlugIns
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ACCTransportPluginManager;
  id v2 = -[ACCPluginManager stopAllPlugIns](&v7, "stopAllPlugIns");
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 2;
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
    id v5 = (os_log_s *)*(id *)(gLogObjects + 8);
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v9 = v2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Stopped %lu transport plugin(s)", buf, 0xCu);
  }

  return (unint64_t)v2;
}

- (id)initClass:(Class)a3
{
  if (-[objc_class isSubclassOfClass:]( a3,  "isSubclassOfClass:",  objc_opt_class(&OBJC_CLASS___ACCTransportPlugin))) {
    id v5 = [[a3 alloc] initWithDelegate:self];
  }
  else {
    id v5 = objc_alloc_init(a3);
  }
  v6 = v5;

  return v6;
}

- (BOOL)sendOutgoingData:(id)a3 forEndpointWithUUID:(id)a4 connectionUUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[ACCTransportPluginManager endpointDataOutHandlers](self, "endpointDataOutHandlers"));
  v12 = (uint64_t (**)(void, void, void, void))objc_claimAutoreleasedReturnValue([v11 objectForKey:v9]);

  if (v12) {
    char v13 = ((uint64_t (**)(void, id, id, id))v12)[2](v12, v10, v9, v8);
  }
  else {
    char v13 = 0;
  }

  return v13;
}

- (id)createConnectionWithType:(int)a3 andIdentifier:(id)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __68__ACCTransportPluginManager_createConnectionWithType_andIdentifier___block_invoke;
  v6[3] = &unk_1001FADC0;
  v6[4] = self;
  id v4 = acc_manager_newConnection(a3, a4, v6);
  if (v4) {
    id v4 = (id)*v4;
  }
  return v4;
}

id __68__ACCTransportPluginManager_createConnectionWithType_andIdentifier___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4)
{
  return [*(id *)(a1 + 32) sendOutgoingData:a4 forEndpointWithUUID:a3 connectionUUID:a2];
}

- (BOOL)setSupervisedTransportsRestricted:(BOOL)a3 forConnectionWithUUID:(id)a4
{
  uint64_t v14 = 0LL;
  v15 = &v14;
  uint64_t v16 = 0x2020000000LL;
  char v17 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __85__ACCTransportPluginManager_setSupervisedTransportsRestricted_forConnectionWithUUID___block_invoke;
  v10[3] = &unk_1001FADE8;
  id v5 = a4;
  BOOL v13 = a3;
  id v11 = v5;
  v12 = &v14;
  if ((acc_manager_protectedConnectionCall(v5, 0, 0LL, v10) & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v6 = (os_log_s *)*(id *)(gLogObjects + 8);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v6 = (os_log_s *)&_os_log_default;
      id v7 = &_os_log_default;
    }

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v19 = "-[ACCTransportPluginManager setSupervisedTransportsRestricted:forConnectionWithUUID:]";
      __int16 v20 = 2112;
      id v21 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: didn't find connectionUUID %@",  buf,  0x16u);
    }
  }

  BOOL v8 = *((_BYTE *)v15 + 24) != 0;

  _Block_object_dispose(&v14, 8);
  return v8;
}

uint64_t __85__ACCTransportPluginManager_setSupervisedTransportsRestricted_forConnectionWithUUID___block_invoke( uint64_t a1,  uint64_t *a2)
{
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 2;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v6 = (os_log_s *)&_os_log_default;
    id v5 = &_os_log_default;
  }

  else
  {
    v6 = (os_log_s *)*(id *)(gLogObjects + 8);
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __85__ACCTransportPluginManager_setSupervisedTransportsRestricted_forConnectionWithUUID___block_invoke_cold_1();
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = acc_connection_setSupervisedTransportsRestricted( a2,  *(unsigned __int8 *)(a1 + 48));
  return 1LL;
}

- (BOOL)setProperties:(id)a3 forConnectionWithUUID:(id)a4
{
  id v5 = a3;
  uint64_t v16 = 0LL;
  char v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = __65__ACCTransportPluginManager_setProperties_forConnectionWithUUID___block_invoke;
  v12[3] = &unk_1001FAE10;
  id v6 = a4;
  id v13 = v6;
  id v7 = v5;
  id v14 = v7;
  v15 = &v16;
  if ((acc_manager_protectedConnectionCall(v6, 0, 0LL, v12) & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      BOOL v8 = (os_log_s *)*(id *)(gLogObjects + 8);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      BOOL v8 = (os_log_s *)&_os_log_default;
      id v9 = &_os_log_default;
    }

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v21 = "-[ACCTransportPluginManager setProperties:forConnectionWithUUID:]";
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: didn't find connectionUUID %@",  buf,  0x16u);
    }
  }

  BOOL v10 = *((_BYTE *)v17 + 24) != 0;

  _Block_object_dispose(&v16, 8);
  return v10;
}

uint64_t __65__ACCTransportPluginManager_setProperties_forConnectionWithUUID___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 2;
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
    id v6 = (os_log_s *)*(id *)(gLogObjects + 8);
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __65__ACCTransportPluginManager_setProperties_forConnectionWithUUID___block_invoke_cold_1();
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = acc_connection_setProperties( a2,  *(const __CFDictionary **)(a1 + 40));
  return 1LL;
}

- (BOOL)setAuthenticationStatus:(int)a3 andCertificateData:(id)a4 authCTA:(BOOL)a5 forConnectionWithUUID:(id)a6
{
  id v9 = a4;
  uint64_t v22 = 0LL;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000LL;
  char v25 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472LL;
  v16[2] = __102__ACCTransportPluginManager_setAuthenticationStatus_andCertificateData_authCTA_forConnectionWithUUID___block_invoke;
  v16[3] = &unk_1001FAE38;
  id v10 = a6;
  id v17 = v10;
  BOOL v21 = a5;
  int v20 = a3;
  id v11 = v9;
  id v18 = v11;
  char v19 = &v22;
  if ((acc_manager_protectedConnectionCall(v10, 0, 0LL, v16) & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      v12 = (os_log_s *)*(id *)(gLogObjects + 8);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v12 = (os_log_s *)&_os_log_default;
      id v13 = &_os_log_default;
    }

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[ACCTransportPluginManager setAuthenticationStatus:andCertificateData:authCTA:forConnectionWithUUID:]";
      __int16 v28 = 2112;
      id v29 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s: didn't find connectionUUID %@",  buf,  0x16u);
    }
  }

  BOOL v14 = *((_BYTE *)v23 + 24) != 0;

  _Block_object_dispose(&v22, 8);
  return v14;
}

uint64_t __102__ACCTransportPluginManager_setAuthenticationStatus_andCertificateData_authCTA_forConnectionWithUUID___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 2;
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
    id v6 = (os_log_s *)*(id *)(gLogObjects + 8);
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __102__ACCTransportPluginManager_setAuthenticationStatus_andCertificateData_authCTA_forConnectionWithUUID___block_invoke_cold_1( a1,  v6);
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = acc_connection_setAuthCertData( a2,  *(const void **)(a1 + 40));
  BOOL v7 = acc_connection_setAuthCTAAAllowed(a2, *(_BYTE *)(a1 + 60));
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8LL);
  if (*(_BYTE *)(v8 + 24)) {
    BOOL v9 = v7;
  }
  else {
    BOOL v9 = 0;
  }
  *(_BYTE *)(v8 + 24) = v9;
  char v10 = acc_connection_setAuthStatus(a2, 0LL, *(_DWORD *)(a1 + 56));
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8LL);
  if (*(_BYTE *)(v11 + 24)) {
    char v12 = v10;
  }
  else {
    char v12 = 0;
  }
  *(_BYTE *)(v11 + 24) = v12;
  return 1LL;
}

- (id)createEndpointWithTransportType:(int)a3 andProtocol:(int)a4 andIdentifier:(id)a5 dataOutHandler:(id)a6 forConnectionWithUUID:(id)a7
{
  id v12 = a6;
  id v13 = (id *)acc_manager_newEndpointForConnectionWithUUID(a7, a3, a4, a5);
  if (v13)
  {
    id v14 = v13[2];
    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[ACCTransportPluginManager endpointDataOutHandlers](self, "endpointDataOutHandlers"));
      id v16 = objc_retainBlock(v12);
      [v15 setObject:v16 forKey:v14];
    }
  }

  else
  {
    id v14 = 0LL;
  }

  return v14;
}

- (BOOL)setAccessoryInfo:(id)a3 forEndpointWithUUID:(id)a4
{
  id v5 = a3;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = __66__ACCTransportPluginManager_setAccessoryInfo_forEndpointWithUUID___block_invoke;
  v12[3] = &unk_1001FAE60;
  id v6 = a4;
  id v13 = v6;
  id v7 = v5;
  id v14 = v7;
  v15 = &v16;
  if ((acc_manager_protectedEndpointCall(v6, 0, 0LL, v12) & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      uint64_t v8 = (os_log_s *)*(id *)(gLogObjects + 8);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      uint64_t v8 = (os_log_s *)&_os_log_default;
      id v9 = &_os_log_default;
    }

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v21 = "-[ACCTransportPluginManager setAccessoryInfo:forEndpointWithUUID:]";
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: didn't find endpointUUID %@", buf, 0x16u);
    }
  }

  BOOL v10 = *((_BYTE *)v17 + 24) != 0;

  _Block_object_dispose(&v16, 8);
  return v10;
}

uint64_t __66__ACCTransportPluginManager_setAccessoryInfo_forEndpointWithUUID___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 2;
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
    id v6 = (os_log_s *)*(id *)(gLogObjects + 8);
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __66__ACCTransportPluginManager_setAccessoryInfo_forEndpointWithUUID___block_invoke_cold_1();
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = acc_endpoint_setAccessoryInfoOverridesWithDictionary( a2,  *(const void **)(a1 + 40));
  return 1LL;
}

- (BOOL)setProperties:(id)a3 forEndpointWithUUID:(id)a4
{
  id v5 = a3;
  uint64_t v16 = 0LL;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000LL;
  char v19 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = __63__ACCTransportPluginManager_setProperties_forEndpointWithUUID___block_invoke;
  v12[3] = &unk_1001FAE60;
  id v6 = a4;
  id v13 = v6;
  id v7 = v5;
  id v14 = v7;
  v15 = &v16;
  if ((acc_manager_protectedEndpointCall(v6, 0, 0LL, v12) & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      uint64_t v8 = (os_log_s *)*(id *)(gLogObjects + 8);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      uint64_t v8 = (os_log_s *)&_os_log_default;
      id v9 = &_os_log_default;
    }

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      BOOL v21 = "-[ACCTransportPluginManager setProperties:forEndpointWithUUID:]";
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: didn't find endpointUUID %@", buf, 0x16u);
    }
  }

  BOOL v10 = *((_BYTE *)v17 + 24) != 0;

  _Block_object_dispose(&v16, 8);
  return v10;
}

uint64_t __63__ACCTransportPluginManager_setProperties_forEndpointWithUUID___block_invoke( uint64_t a1,  pthread_mutex_t *a2)
{
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 2;
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
    id v6 = (os_log_s *)*(id *)(gLogObjects + 8);
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __63__ACCTransportPluginManager_setProperties_forEndpointWithUUID___block_invoke_cold_1();
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = acc_endpoint_setProperties( a2,  *(const __CFDictionary **)(a1 + 40));
  return 1LL;
}

- (BOOL)publishConnectionWithUUID:(id)a3
{
  return acc_manager_publishConnectionWithUUID(a3);
}

- (BOOL)destroyEndpointWithUUID:(id)a3
{
  return acc_manager_removeEndpointWithUUID(a3);
}

- (BOOL)destroyConnectionWithUUID:(id)a3
{
  return acc_manager_removeConnectionWithUUID(a3);
}

- (id)connectionUUIDForEndpointWithUUID:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0LL;
  BOOL v10 = &v9;
  uint64_t v11 = 0x3032000000LL;
  id v12 = __Block_byref_object_copy__0;
  id v13 = __Block_byref_object_dispose__0;
  id v14 = 0LL;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __63__ACCTransportPluginManager_connectionUUIDForEndpointWithUUID___block_invoke;
  v8[3] = &unk_1001FAE88;
  v8[4] = &v9;
  if ((acc_manager_protectedEndpointCall(v3, 0, 0LL, v8) & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      BOOL v4 = (os_log_s *)*(id *)(gLogObjects + 8);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      BOOL v4 = (os_log_s *)&_os_log_default;
      id v5 = &_os_log_default;
    }

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v16 = "-[ACCTransportPluginManager connectionUUIDForEndpointWithUUID:]";
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: didn't find endpointUUID %@", buf, 0x16u);
    }
  }

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

uint64_t __63__ACCTransportPluginManager_connectionUUIDForEndpointWithUUID___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (*(void *)a2) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 40LL), *(id *)(a2 + 8));
  }
  return 1LL;
}

- (id)allConnectionUUIDs
{
  CFDictionaryRef v2 = acc_manager_copyAllConnections();
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary allKeys](v2, "allKeys"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v3));

  return v4;
}

- (id)allEndpointsUUIDs
{
  CFDictionaryRef v2 = acc_manager_copyAllEndpoints();
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary allKeys](v2, "allKeys"));
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](&OBJC_CLASS___NSSet, "setWithArray:", v3));

  return v4;
}

- (id)endpointUUIDsForConnectionWithUUID:(id)a3
{
  return acc_manager_copyEndpointUUIDsForConnection(a3);
}

- (int)authStatusForConnectionWithUUID:(id)a3 authType:(int)a4
{
  id v5 = a3;
  uint64_t v15 = 0LL;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  int v18 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = __70__ACCTransportPluginManager_authStatusForConnectionWithUUID_authType___block_invoke;
  v13[3] = &unk_1001FAEB0;
  v13[4] = &v15;
  int v14 = a4;
  if ((acc_manager_protectedConnectionCall(v5, 0, 0LL, v13) & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      id v6 = (os_log_s *)*(id *)(gLogObjects + 8);
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
      *(_DWORD *)buf = 136315394;
      int v20 = "-[ACCTransportPluginManager authStatusForConnectionWithUUID:authType:]";
      __int16 v21 = 2112;
      id v22 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: didn't find connectionUUID %@",  buf,  0x16u);
    }
  }

  if (gLogObjects && gNumLogObjects >= 2)
  {
    uint64_t v8 = (os_log_s *)*(id *)(gLogObjects + 8);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v8 = (os_log_s *)&_os_log_default;
    id v9 = &_os_log_default;
  }

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v12 = *((_DWORD *)v16 + 6);
    *(_DWORD *)buf = 136315906;
    int v20 = "-[ACCTransportPluginManager authStatusForConnectionWithUUID:authType:]";
    __int16 v21 = 2112;
    id v22 = v5;
    __int16 v23 = 1024;
    int v24 = a4;
    __int16 v25 = 1024;
    int v26 = v12;
    _os_log_debug_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "%s: connectionUUID %@, authType %{coreacc:ACCAuthInfo_Type_t}d, authStatus %{coreacc:ACCAuthInfo_Status_t}d",  buf,  0x22u);
  }

  int v10 = *((_DWORD *)v16 + 6);
  _Block_object_dispose(&v15, 8);

  return v10;
}

uint64_t __70__ACCTransportPluginManager_authStatusForConnectionWithUUID_authType___block_invoke( uint64_t a1,  uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = acc_connection_getAuthStatus( a2,  *(unsigned int *)(a1 + 40));
  return 1LL;
}

- (int)connectionTypeForConnectionWithUUID:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0LL;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  int v14 = 11;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __65__ACCTransportPluginManager_connectionTypeForConnectionWithUUID___block_invoke;
  v10[3] = &unk_1001FAED8;
  void v10[4] = &v11;
  if ((acc_manager_protectedConnectionCall(v3, 0, 0LL, v10) & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      BOOL v4 = (os_log_s *)*(id *)(gLogObjects + 8);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      BOOL v4 = (os_log_s *)&_os_log_default;
      id v5 = &_os_log_default;
    }

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v16 = "-[ACCTransportPluginManager connectionTypeForConnectionWithUUID:]";
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: didn't find connectionUUID %@",  buf,  0x16u);
    }
  }

  if (gLogObjects && gNumLogObjects >= 2)
  {
    id v6 = (os_log_s *)*(id *)(gLogObjects + 8);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v6 = (os_log_s *)&_os_log_default;
    id v7 = &_os_log_default;
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ACCTransportPluginManager connectionTypeForConnectionWithUUID:].cold.1();
  }

  int v8 = *((_DWORD *)v12 + 6);
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __65__ACCTransportPluginManager_connectionTypeForConnectionWithUUID___block_invoke( uint64_t a1,  uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = acc_connection_getType(a2);
  return 1LL;
}

- (id)certificateDataForConnectionWithUUID:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0LL;
  int v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  int v14 = __Block_byref_object_copy__0;
  uint64_t v15 = __Block_byref_object_dispose__0;
  id v16 = 0LL;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __66__ACCTransportPluginManager_certificateDataForConnectionWithUUID___block_invoke;
  v10[3] = &unk_1001FAED8;
  void v10[4] = &v11;
  if ((acc_manager_protectedConnectionCall(v3, 0, 0LL, v10) & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      BOOL v4 = (os_log_s *)*(id *)(gLogObjects + 8);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      BOOL v4 = (os_log_s *)&_os_log_default;
      id v5 = &_os_log_default;
    }

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v18 = "-[ACCTransportPluginManager certificateDataForConnectionWithUUID:]";
      __int16 v19 = 2112;
      id v20 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: didn't find connectionUUID %@",  buf,  0x16u);
    }
  }

  if (gLogObjects && gNumLogObjects >= 2)
  {
    id v6 = (os_log_s *)*(id *)(gLogObjects + 8);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v6 = (os_log_s *)&_os_log_default;
    id v7 = &_os_log_default;
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ACCTransportPluginManager certificateDataForConnectionWithUUID:].cold.1();
  }

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __66__ACCTransportPluginManager_certificateDataForConnectionWithUUID___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t AuthInfo = acc_connection_getAuthInfo(a2);
  if (AuthInfo)
  {
    CFDataRef v4 = oobPairing_endpoint_copyCachedOOBPairingInfo(AuthInfo);
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }

  return 1LL;
}

- (id)certificateSerialForConnectionWithUUID:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0LL;
  int v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  int v14 = __Block_byref_object_copy__0;
  uint64_t v15 = __Block_byref_object_dispose__0;
  id v16 = 0LL;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __68__ACCTransportPluginManager_certificateSerialForConnectionWithUUID___block_invoke;
  v10[3] = &unk_1001FAED8;
  void v10[4] = &v11;
  if ((acc_manager_protectedConnectionCall(v3, 0, 0LL, v10) & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      CFDataRef v4 = (os_log_s *)*(id *)(gLogObjects + 8);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      CFDataRef v4 = (os_log_s *)&_os_log_default;
      id v5 = &_os_log_default;
    }

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v18 = "-[ACCTransportPluginManager certificateSerialForConnectionWithUUID:]";
      __int16 v19 = 2112;
      id v20 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: didn't find connectionUUID %@",  buf,  0x16u);
    }
  }

  if (gLogObjects && gNumLogObjects >= 2)
  {
    id v6 = (os_log_s *)*(id *)(gLogObjects + 8);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v6 = (os_log_s *)&_os_log_default;
    id v7 = &_os_log_default;
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ACCTransportPluginManager certificateSerialForConnectionWithUUID:].cold.1();
  }

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __68__ACCTransportPluginManager_certificateSerialForConnectionWithUUID___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t AuthInfo = acc_connection_getAuthInfo(a2);
  if (AuthInfo)
  {
    CFDataRef v4 = oobPairing_endpoint_copyCachedOOBPairingData(AuthInfo);
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }

  return 1LL;
}

- (id)certificateSerialStringForConnectionWithUUID:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0LL;
  int v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  int v14 = __Block_byref_object_copy__0;
  uint64_t v15 = __Block_byref_object_dispose__0;
  id v16 = 0LL;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __74__ACCTransportPluginManager_certificateSerialStringForConnectionWithUUID___block_invoke;
  v10[3] = &unk_1001FAED8;
  void v10[4] = &v11;
  if ((acc_manager_protectedConnectionCall(v3, 0, 0LL, v10) & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      CFDataRef v4 = (os_log_s *)*(id *)(gLogObjects + 8);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      CFDataRef v4 = (os_log_s *)&_os_log_default;
      id v5 = &_os_log_default;
    }

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v18 = "-[ACCTransportPluginManager certificateSerialStringForConnectionWithUUID:]";
      __int16 v19 = 2112;
      id v20 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: didn't find connectionUUID %@",  buf,  0x16u);
    }
  }

  if (gLogObjects && gNumLogObjects >= 2)
  {
    id v6 = (os_log_s *)*(id *)(gLogObjects + 8);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v6 = (os_log_s *)&_os_log_default;
    id v7 = &_os_log_default;
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ACCTransportPluginManager certificateSerialStringForConnectionWithUUID:].cold.1();
  }

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __74__ACCTransportPluginManager_certificateSerialStringForConnectionWithUUID___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t AuthInfo = acc_connection_getAuthInfo(a2);
  if (AuthInfo)
  {
    CFStringRef v4 = acc_authInfo_copyCertSerialString(AuthInfo);
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }

  return 1LL;
}

- (id)certificateCapabilitiesForConnectionWithUUID:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0LL;
  int v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  int v14 = __Block_byref_object_copy__0;
  uint64_t v15 = __Block_byref_object_dispose__0;
  id v16 = 0LL;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __74__ACCTransportPluginManager_certificateCapabilitiesForConnectionWithUUID___block_invoke;
  v10[3] = &unk_1001FAED8;
  void v10[4] = &v11;
  if ((acc_manager_protectedConnectionCall(v3, 0, 0LL, v10) & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      CFStringRef v4 = (os_log_s *)*(id *)(gLogObjects + 8);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      CFStringRef v4 = (os_log_s *)&_os_log_default;
      id v5 = &_os_log_default;
    }

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v18 = "-[ACCTransportPluginManager certificateCapabilitiesForConnectionWithUUID:]";
      __int16 v19 = 2112;
      id v20 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: didn't find connectionUUID %@",  buf,  0x16u);
    }
  }

  if (gLogObjects && gNumLogObjects >= 2)
  {
    id v6 = (os_log_s *)*(id *)(gLogObjects + 8);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v6 = (os_log_s *)&_os_log_default;
    id v7 = &_os_log_default;
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ACCTransportPluginManager certificateCapabilitiesForConnectionWithUUID:].cold.1();
  }

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __74__ACCTransportPluginManager_certificateCapabilitiesForConnectionWithUUID___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t AuthInfo = acc_connection_getAuthInfo(a2);
  if (AuthInfo)
  {
    CFDataRef v4 = acc_authInfo_copyCertCapabilities(AuthInfo);
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8LL);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }

  return 1LL;
}

- (int)transportTypeForEndpointWithUUID:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0LL;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  int v14 = 17;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __62__ACCTransportPluginManager_transportTypeForEndpointWithUUID___block_invoke;
  v10[3] = &unk_1001FAE88;
  void v10[4] = &v11;
  if ((acc_manager_protectedEndpointCall(v3, 0, 0LL, v10) & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      CFDataRef v4 = (os_log_s *)*(id *)(gLogObjects + 8);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      CFDataRef v4 = (os_log_s *)&_os_log_default;
      id v5 = &_os_log_default;
    }

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v16 = "-[ACCTransportPluginManager transportTypeForEndpointWithUUID:]";
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: didn't find endpointUUID %@", buf, 0x16u);
    }
  }

  if (gLogObjects && gNumLogObjects >= 2)
  {
    id v6 = (os_log_s *)*(id *)(gLogObjects + 8);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v6 = (os_log_s *)&_os_log_default;
    id v7 = &_os_log_default;
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ACCTransportPluginManager transportTypeForEndpointWithUUID:].cold.1();
  }

  int v8 = *((_DWORD *)v12 + 6);
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __62__ACCTransportPluginManager_transportTypeForEndpointWithUUID___block_invoke( uint64_t a1,  uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = acc_endpoint_getTransportType(a2);
  return 1LL;
}

- (int)protocolForEndpointWithUUID:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0LL;
  int v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  int v14 = 18;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __57__ACCTransportPluginManager_protocolForEndpointWithUUID___block_invoke;
  v10[3] = &unk_1001FAE88;
  void v10[4] = &v11;
  if ((acc_manager_protectedEndpointCall(v3, 0, 0LL, v10) & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      CFDataRef v4 = (os_log_s *)*(id *)(gLogObjects + 8);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      CFDataRef v4 = (os_log_s *)&_os_log_default;
      id v5 = &_os_log_default;
    }

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v16 = "-[ACCTransportPluginManager protocolForEndpointWithUUID:]";
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: didn't find endpointUUID %@", buf, 0x16u);
    }
  }

  if (gLogObjects && gNumLogObjects >= 2)
  {
    id v6 = (os_log_s *)*(id *)(gLogObjects + 8);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v6 = (os_log_s *)&_os_log_default;
    id v7 = &_os_log_default;
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ACCTransportPluginManager protocolForEndpointWithUUID:].cold.1();
  }

  int v8 = *((_DWORD *)v12 + 6);
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __57__ACCTransportPluginManager_protocolForEndpointWithUUID___block_invoke(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = acc_endpoint_getProtocol(a2);
  return 1LL;
}

- (id)identifierForConnectionWithUUID:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0LL;
  int v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  int v14 = __Block_byref_object_copy__0;
  uint64_t v15 = __Block_byref_object_dispose__0;
  id v16 = 0LL;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __61__ACCTransportPluginManager_identifierForConnectionWithUUID___block_invoke;
  v10[3] = &unk_1001FAED8;
  void v10[4] = &v11;
  if ((acc_manager_protectedConnectionCall(v3, 0, 0LL, v10) & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      CFDataRef v4 = (os_log_s *)*(id *)(gLogObjects + 8);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      CFDataRef v4 = (os_log_s *)&_os_log_default;
      id v5 = &_os_log_default;
    }

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v18 = "-[ACCTransportPluginManager identifierForConnectionWithUUID:]";
      __int16 v19 = 2112;
      id v20 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: didn't find connectionUUID %@",  buf,  0x16u);
    }
  }

  if (gLogObjects && gNumLogObjects >= 2)
  {
    id v6 = (os_log_s *)*(id *)(gLogObjects + 8);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v6 = (os_log_s *)&_os_log_default;
    id v7 = &_os_log_default;
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ACCTransportPluginManager identifierForConnectionWithUUID:].cold.1();
  }

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __61__ACCTransportPluginManager_identifierForConnectionWithUUID___block_invoke( uint64_t a1,  uint64_t a2)
{
  CFTypeRef v3 = acc_connection_copyIdentifier(a2);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 1LL;
}

- (id)identifierForEndpointWithUUID:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0LL;
  int v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  int v14 = __Block_byref_object_copy__0;
  uint64_t v15 = __Block_byref_object_dispose__0;
  id v16 = 0LL;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __59__ACCTransportPluginManager_identifierForEndpointWithUUID___block_invoke;
  v10[3] = &unk_1001FAE88;
  void v10[4] = &v11;
  if ((acc_manager_protectedEndpointCall(v3, 0, 0LL, v10) & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      uint64_t v4 = (os_log_s *)*(id *)(gLogObjects + 8);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      uint64_t v4 = (os_log_s *)&_os_log_default;
      id v5 = &_os_log_default;
    }

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v18 = "-[ACCTransportPluginManager identifierForEndpointWithUUID:]";
      __int16 v19 = 2112;
      id v20 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: didn't find endpointUUID %@", buf, 0x16u);
    }
  }

  if (gLogObjects && gNumLogObjects >= 2)
  {
    id v6 = (os_log_s *)*(id *)(gLogObjects + 8);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v6 = (os_log_s *)&_os_log_default;
    id v7 = &_os_log_default;
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ACCTransportPluginManager identifierForEndpointWithUUID:].cold.1();
  }

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __59__ACCTransportPluginManager_identifierForEndpointWithUUID___block_invoke(uint64_t a1, uint64_t a2)
{
  CFTypeRef v3 = acc_endpoint_copyIdentifier(a2);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 1LL;
}

- (id)propertiesForConnectionWithUUID:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0LL;
  int v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  int v14 = __Block_byref_object_copy__0;
  uint64_t v15 = __Block_byref_object_dispose__0;
  id v16 = 0LL;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __61__ACCTransportPluginManager_propertiesForConnectionWithUUID___block_invoke;
  v10[3] = &unk_1001FAED8;
  void v10[4] = &v11;
  if ((acc_manager_protectedConnectionCall(v3, 0, 0LL, v10) & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      uint64_t v4 = (os_log_s *)*(id *)(gLogObjects + 8);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      uint64_t v4 = (os_log_s *)&_os_log_default;
      id v5 = &_os_log_default;
    }

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v18 = "-[ACCTransportPluginManager propertiesForConnectionWithUUID:]";
      __int16 v19 = 2112;
      id v20 = v3;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: didn't find connectionUUID %@",  buf,  0x16u);
    }
  }

  if (gLogObjects && gNumLogObjects >= 2)
  {
    id v6 = (os_log_s *)*(id *)(gLogObjects + 8);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v6 = (os_log_s *)&_os_log_default;
    id v7 = &_os_log_default;
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ACCTransportPluginManager propertiesForConnectionWithUUID:].cold.1();
  }

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __61__ACCTransportPluginManager_propertiesForConnectionWithUUID___block_invoke( uint64_t a1,  const __CFDictionary *a2)
{
  id v3 = acc_connection_copyProperties(a2);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 1LL;
}

- (id)propertiesForEndpointWithUUID:(id)a3
{
  id v3 = a3;
  uint64_t v11 = 0LL;
  int v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  int v14 = __Block_byref_object_copy__0;
  uint64_t v15 = __Block_byref_object_dispose__0;
  id v16 = 0LL;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = __59__ACCTransportPluginManager_propertiesForEndpointWithUUID___block_invoke;
  v10[3] = &unk_1001FAE88;
  void v10[4] = &v11;
  if ((acc_manager_protectedEndpointCall(v3, 0, 0LL, v10) & 1) == 0)
  {
    if (gLogObjects && gNumLogObjects >= 2)
    {
      uint64_t v4 = (os_log_s *)*(id *)(gLogObjects + 8);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      uint64_t v4 = (os_log_s *)&_os_log_default;
      id v5 = &_os_log_default;
    }

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v18 = "-[ACCTransportPluginManager propertiesForEndpointWithUUID:]";
      __int16 v19 = 2112;
      id v20 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: didn't find endpointUUID %@", buf, 0x16u);
    }
  }

  if (gLogObjects && gNumLogObjects >= 2)
  {
    id v6 = (os_log_s *)*(id *)(gLogObjects + 8);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v6 = (os_log_s *)&_os_log_default;
    id v7 = &_os_log_default;
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ACCTransportPluginManager propertiesForEndpointWithUUID:].cold.1();
  }

  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __59__ACCTransportPluginManager_propertiesForEndpointWithUUID___block_invoke( uint64_t a1,  pthread_mutex_t *a2)
{
  id v3 = acc_endpoint_copyProperties(a2);
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8LL);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  return 1LL;
}

- (BOOL)processIncomingData:(id)a3 forEndpointWithUUID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5 && v6)
  {
    id v8 = v5;
    BOOL v9 = acc_manager_processIncomingDataForEndpointWithUUID(v7, (uint64_t)v8);
    CFRelease(v8);
  }

  else
  {
    if (gLogObjects) {
      BOOL v10 = gNumLogObjects < 2;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      int v12 = (os_log_s *)&_os_log_default;
      id v11 = &_os_log_default;
    }

    else
    {
      int v12 = (os_log_s *)*(id *)(gLogObjects + 8);
    }

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ACCTransportPluginManager processIncomingData:forEndpointWithUUID:].cold.1(v12);
    }

    BOOL v9 = 0;
  }

  return v9;
}

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __42__ACCTransportPluginManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once_0 != -1) {
    dispatch_once(&sharedManager_once_0, block);
  }
  return (id)sharedManager_sharedInstance_0;
}

void __42__ACCTransportPluginManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  CFDictionaryRef v2 = (void *)sharedManager_sharedInstance_0;
  sharedManager_sharedInstance_0 = (uint64_t)v1;
}

- (NSMutableDictionary)endpointDataOutHandlers
{
  return self->_endpointDataOutHandlers;
}

- (void)setEndpointDataOutHandlers:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

- (void)addTransportPlugInBundleSearchPaths
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 pluginBundleSearchPaths]);
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v2, v3, "Added bundle search paths: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_6_2();
}

- (void)loadAllBundles
{
  a2->receiver = a1;
  a2->super_class = (Class)&OBJC_CLASS___ACCTransportPluginManager;
  id v2 = -[objc_super pluginBundles](a2, "pluginBundles");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_3( (void *)&_mh_execute_header,  v4,  v5,  "ACCTransportPluginManager.pluginBundles: %@",  v6,  v7,  v8,  v9,  2u);

  OUTLINED_FUNCTION_6_2();
}

- (void)initAllPlugIns
{
  a2->receiver = a1;
  a2->super_class = (Class)&OBJC_CLASS___ACCTransportPluginManager;
  id v2 = -[objc_super pluginInstances](a2, "pluginInstances");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_3( (void *)&_mh_execute_header,  v4,  v5,  "ACCTransportPluginManager.pluginInstances: %@",  v6,  v7,  v8,  v9,  2u);

  OUTLINED_FUNCTION_6_2();
}

void __85__ACCTransportPluginManager_setSupervisedTransportsRestricted_forConnectionWithUUID___block_invoke_cold_1()
{
  v2[0] = 136315650;
  OUTLINED_FUNCTION_13_1();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_DEBUG,  "%s: connectionUUID %@, supervisedTransportsRestricted %d",  (uint8_t *)v2,  0x1Cu);
  OUTLINED_FUNCTION_6_2();
}

void __65__ACCTransportPluginManager_setProperties_forConnectionWithUUID___block_invoke_cold_1()
{
  v3[0] = 136315650;
  OUTLINED_FUNCTION_13_1();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_debug_impl( (void *)&_mh_execute_header,  v2,  OS_LOG_TYPE_DEBUG,  "%s: connectionUUID %@, properties %@",  (uint8_t *)v3,  0x20u);
  OUTLINED_FUNCTION_6_2();
}

void __102__ACCTransportPluginManager_setAuthenticationStatus_andCertificateData_authCTA_forConnectionWithUUID___block_invoke_cold_1( uint64_t a1,  os_log_s *a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 60);
  int v3 = *(_DWORD *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  int v6 = 136316162;
  uint64_t v7 = "-[ACCTransportPluginManager setAuthenticationStatus:andCertificateData:authCTA:forConnectionWithUUID:]_block_invoke";
  __int16 v8 = 2112;
  uint64_t v9 = v4;
  __int16 v10 = 1024;
  int v11 = v2;
  __int16 v12 = 1024;
  int v13 = v3;
  __int16 v14 = 2112;
  uint64_t v15 = v5;
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "%s: connectionUUID %@, bAuthCTAAllowed %d, authStatus %{coreacc:ACCAuthInfo_Status_t}d, certData %@",  (uint8_t *)&v6,  0x2Cu);
}

void __66__ACCTransportPluginManager_setAccessoryInfo_forEndpointWithUUID___block_invoke_cold_1()
{
}

void __63__ACCTransportPluginManager_setProperties_forEndpointWithUUID___block_invoke_cold_1()
{
}

- (void)connectionTypeForConnectionWithUUID:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_8_4( (void *)&_mh_execute_header,  v0,  v1,  "%s: connectionUUID %@, connectionType %{coreacc:ACCConnection_Type_t}d ",  v2);
  OUTLINED_FUNCTION_6_2();
}

- (void)certificateDataForConnectionWithUUID:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_4_7((void *)&_mh_execute_header, v0, v1, "%s: connectionUUID %@, certData %@ ", v2);
  OUTLINED_FUNCTION_6_2();
}

- (void)certificateSerialForConnectionWithUUID:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_4_7((void *)&_mh_execute_header, v0, v1, "%s: connectionUUID %@, certSerial %@ ", v2);
  OUTLINED_FUNCTION_6_2();
}

- (void)certificateSerialStringForConnectionWithUUID:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_4_7((void *)&_mh_execute_header, v0, v1, "%s: connectionUUID %@, certSerialString %@ ", v2);
  OUTLINED_FUNCTION_6_2();
}

- (void)certificateCapabilitiesForConnectionWithUUID:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_4_7((void *)&_mh_execute_header, v0, v1, "%s: connectionUUID %@, certCapabilities %@ ", v2);
  OUTLINED_FUNCTION_6_2();
}

- (void)transportTypeForEndpointWithUUID:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_8_4( (void *)&_mh_execute_header,  v0,  v1,  "%s: endpointUUID %@, transportType %{coreacc:ACCEndpoint_TransportType_t}d ",  v2);
  OUTLINED_FUNCTION_6_2();
}

- (void)protocolForEndpointWithUUID:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_7_5();
  OUTLINED_FUNCTION_8_4( (void *)&_mh_execute_header,  v0,  v1,  "%s: endpointUUID %@, protocol %{coreacc:ACCEndpoint_Protocol_t}d ",  v2);
  OUTLINED_FUNCTION_6_2();
}

- (void)identifierForConnectionWithUUID:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_4_7((void *)&_mh_execute_header, v0, v1, "%s: connectionUUID %@, identifier %@ ", v2);
  OUTLINED_FUNCTION_6_2();
}

- (void)identifierForEndpointWithUUID:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_4_7((void *)&_mh_execute_header, v0, v1, "%s: endpointUUID %@, identifier %@ ", v2);
  OUTLINED_FUNCTION_6_2();
}

- (void)propertiesForConnectionWithUUID:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_4_7((void *)&_mh_execute_header, v0, v1, "%s: connectionUUID %@, properties %@ ", v2);
  OUTLINED_FUNCTION_6_2();
}

- (void)propertiesForEndpointWithUUID:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_3_6();
  OUTLINED_FUNCTION_4_7((void *)&_mh_execute_header, v0, v1, "%s: endpointUUID %@, properties %@ ", v2);
  OUTLINED_FUNCTION_6_2();
}

- (void)processIncomingData:(os_log_t)log forEndpointWithUUID:.cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "dataIn or endpointUUID is nil!", v1, 2u);
}

@end