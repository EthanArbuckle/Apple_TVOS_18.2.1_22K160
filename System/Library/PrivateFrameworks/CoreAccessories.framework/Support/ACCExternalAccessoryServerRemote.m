@interface ACCExternalAccessoryServerRemote
- (ACCExternalAccessoryClientInfo)clientInfo;
- (ACCExternalAccessoryServerRemote)initWithClientInfo:(id)a3;
- (NSLock)remoteExternalAccessoryServerLock;
- (void)activateLocationForUUID:(id)a3;
- (void)clientCloseExternalAccessorySession:(id)a3;
- (void)createExternalAccessorySessionForProtocol:(id)a3 accessoryUUID:(id)a4 withReply:(id)a5;
- (void)destinationInformation:(id)a3 forUUID:(id)a4;
- (void)initConnectionToServer:(id)a3;
- (void)openSocketFromAccessoryToApp:(id)a3;
- (void)openSocketFromAppToAccessory:(id)a3;
- (void)processOutgoingExternalAccessoryData:(id)a3 forEASessionIdentifier:(id)a4 withReply:(id)a5;
- (void)registerClientInformation:(id)a3 onInstantiation:(BOOL)a4 withReply:(id)a5;
- (void)requestAccessoryWiFiCredentials:(id)a3;
- (void)sendDeviceIdentifierNotification:(id)a3 usbIdentifier:(id)a4 forUUID:(id)a5;
- (void)sendGPRMCDataStatus:(BOOL)a3 ValueV:(BOOL)a4 ValueX:(BOOL)a5 forUUID:(id)a6;
- (void)sendNMEAFilterList:(id)a3 forUUID:(id)a4;
- (void)sendWiredCarPlayAvailable:(id)a3 usbIdentifier:(id)a4 wirelessAvailable:(id)a5 bluetoothIdentifier:(id)a6 forUUID:(id)a7;
- (void)setClientInfo:(id)a3;
- (void)stopLocationForUUID:(id)a3;
- (void)vehicleInformationForUUID:(id)a3 withReply:(id)a4;
- (void)verifyAccessoryConnectionStatus:(id)a3 legacyConnectionID:(id)a4 withReply:(id)a5;
@end

@implementation ACCExternalAccessoryServerRemote

- (ACCExternalAccessoryServerRemote)initWithClientInfo:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ACCExternalAccessoryServerRemote;
  v5 = -[ACCExternalAccessoryServerRemote init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      objc_storeWeak((id *)&v5->_clientInfo, v4);
      v7 = objc_alloc_init(&OBJC_CLASS___NSLock);
      remoteExternalAccessoryServerLock = v6->_remoteExternalAccessoryServerLock;
      v6->_remoteExternalAccessoryServerLock = v7;
    }

    else
    {
      remoteExternalAccessoryServerLock = v5;
      v6 = 0LL;
    }
  }

  return v6;
}

- (void)initConnectionToServer:(id)a3
{
  id v4 = (void (**)(id, BOOL))a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ACCExternalAccessoryServer sharedServer](&OBJC_CLASS___ACCExternalAccessoryServer, "sharedServer"));
  if ((objc_opt_respondsToSelector(v5, "shouldAcceptXPCConnection:") & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessoryServerRemote clientInfo](self, "clientInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue([v6 XPCConnection]);
    BOOL v8 = [v5 performSelector:"shouldAcceptXPCConnection:" withObject:v7] != 0;
  }

  else
  {
    BOOL v8 = 0LL;
  }

  if (gLogObjects) {
    BOOL v9 = gNumLogObjects < 10;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v11 = (os_log_s *)&_os_log_default;
    id v10 = &_os_log_default;
  }

  else
  {
    v11 = (os_log_s *)*(id *)(gLogObjects + 72);
  }

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14[0]) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "ExternalAccessory provider has called initConnectionToServer method!",  (uint8_t *)v14,  2u);
  }

  if (gLogObjects && gNumLogObjects >= 10)
  {
    v12 = (os_log_s *)*(id *)(gLogObjects + 72);
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
    v14[0] = 67109120;
    v14[1] = v8;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "shouldStayConnected: %d", (uint8_t *)v14, 8u);
  }

  v4[2](v4, v8);
}

- (void)registerClientInformation:(id)a3 onInstantiation:(BOOL)a4 withReply:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  BOOL v9 = (void (**)(id, uint64_t, void *))a5;
  id v10 = &startLogsNotificationObservers;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 10;
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
    id v13 = (os_log_s *)*(id *)(gLogObjects + 72);
  }

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v55 = (uint64_t)v8;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "[#ExternalAccessory] EA client %@ registering",  buf,  0xCu);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessoryServerRemote clientInfo](self, "clientInfo"));
  [v14 addClientRegistrationInformation:v8];

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[ACCExternalAccessoryServer sharedServer](&OBJC_CLASS___ACCExternalAccessoryServer, "sharedServer"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
  if (v6)
  {
    v45 = v9;
    id v46 = v8;
    v47 = self;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessoryServerRemote clientInfo](self, "clientInfo"));
    v44 = v15;
    v18 = (void *)objc_claimAutoreleasedReturnValue([v15 externalAccessoryClientConnected:v17]);

    __int128 v52 = 0u;
    __int128 v53 = 0u;
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    id obj = v18;
    id v19 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v51;
      v22 = (os_log_s *)&_os_log_default;
      do
      {
        v23 = 0LL;
        id v48 = v20;
        do
        {
          if (*(void *)v51 != v21) {
            objc_enumerationMutation(obj);
          }
          v24 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v50 + 1) + 8 * (void)v23) EAAccessoryDictionary]);
          uint64_t v25 = v10[353];
          int v26 = gNumLogObjects;
          if (v25) {
            BOOL v27 = gNumLogObjects < 10;
          }
          else {
            BOOL v27 = 1;
          }
          if (v27)
          {
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              uint64_t v55 = v25;
              __int16 v56 = 1024;
              LODWORD(v57) = v26;
              _os_log_error_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_ERROR,  "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d",  buf,  0x12u);
            }

            v28 = v22;
            v29 = v22;
          }

          else
          {
            v29 = (os_log_s *)*(id *)(v25 + 72);
          }

          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v30 = v21;
            v31 = v22;
            v32 = v16;
            v33 = v10;
            v34 = (void *)objc_claimAutoreleasedReturnValue( +[ACCExternalAccessory accessoryDictionaryForLogging:]( &OBJC_CLASS___ACCExternalAccessory,  "accessoryDictionaryForLogging:",  v24));
            v35 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessoryServerRemote clientInfo](v47, "clientInfo"));
            v36 = (void *)objc_claimAutoreleasedReturnValue([v35 bundleID]);
            *(_DWORD *)buf = 138412546;
            uint64_t v55 = (uint64_t)v34;
            __int16 v56 = 2112;
            v57 = v36;
            _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "[#ExternalAccessory] initial accEADict %@ connected for EA client %@!",  buf,  0x16u);

            id v10 = v33;
            v16 = v32;
            v22 = v31;
            uint64_t v21 = v30;
            id v20 = v48;
          }

          [v16 addObject:v24];
          v23 = (char *)v23 + 1;
        }

        while (v20 != v23);
        id v20 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
      }

      while (v20);
    }

    BOOL v9 = v45;
    v45[2](v45, 1LL, v16);
    id v8 = v46;
    self = v47;
    v15 = v44;
  }

  else
  {
    v9[2](v9, 1LL, v16);
    if (gLogObjects && gNumLogObjects >= 10)
    {
      v37 = (os_log_s *)*(id *)(gLogObjects + 72);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v37 = (os_log_s *)&_os_log_default;
      id v38 = &_os_log_default;
    }

    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessoryServerRemote clientInfo](self, "clientInfo"));
      v40 = (void *)objc_claimAutoreleasedReturnValue([v39 bundleID]);
      *(_DWORD *)buf = 138412290;
      uint64_t v55 = (uint64_t)v40;
      _os_log_impl( (void *)&_mh_execute_header,  v37,  OS_LOG_TYPE_DEFAULT,  "[#ExternalAccessory] client %@ connected to EA XPC Server, sending notification of any EAAccessories",  buf,  0xCu);
    }

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessoryServerRemote clientInfo](self, "clientInfo"));
    [v15 notifyClientOfConnectedAccessories:v41];
  }

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessoryServerRemote clientInfo](self, "clientInfo"));
  [v15 notifyClientOfConnectedDestinationSharingAccessories:v42];

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessoryServerRemote clientInfo](self, "clientInfo"));
  [v15 notifyClientOfConnectedVehicleStatus:v43];
}

- (void)verifyAccessoryConnectionStatus:(id)a3 legacyConnectionID:(id)a4 withReply:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = (void (**)(id, uint64_t))a5;
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects < 10;
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
    id v12 = (os_log_s *)*(id *)(gLogObjects + 72);
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[#ExternalAccessory] verifyAccessoryConnectionStatus: %@ legacyConnectionID: %@",  (uint8_t *)&v16,  0x16u);
  }

  uint64_t v13 = platform_externalAccessory_verifyPrimaryEndpointConnected((uint64_t)v7, v8);
  if (gLogObjects && gNumLogObjects >= 10)
  {
    v14 = (os_log_s *)*(id *)(gLogObjects + 72);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v14 = (os_log_s *)&_os_log_default;
    id v15 = &_os_log_default;
  }

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412802;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v8;
    __int16 v20 = 1024;
    int v21 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "[#ExternalAccessory] verifyAccessoryConnectionStatus: %@ legacyConnectionID: %@... accessoryConnected %d",  (uint8_t *)&v16,  0x1Cu);
  }

  v9[2](v9, v13);
}

- (void)createExternalAccessorySessionForProtocol:(id)a3 accessoryUUID:(id)a4 withReply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = (void (**)(id, uint64_t, id, id, void *))a5;
  if (gLogObjects) {
    BOOL v11 = gNumLogObjects < 10;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v13 = (os_log_s *)&_os_log_default;
    id v12 = &_os_log_default;
  }

  else
  {
    uint64_t v13 = (os_log_s *)*(id *)(gLogObjects + 72);
  }

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessoryServerRemote clientInfo](self, "clientInfo"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 bundleID]);
    *(_DWORD *)buf = 138412802;
    v36 = v15;
    __int16 v37 = 2112;
    id v38 = v8;
    __int16 v39 = 2112;
    id v40 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "App %@ wants to create EA session for protocol %@, primary accessory UUID %@",  buf,  0x20u);
  }

  char v34 = 0;
  int v16 = (void *)objc_claimAutoreleasedReturnValue( +[ACCExternalAccessorySessionManager sharedManager]( &OBJC_CLASS___ACCExternalAccessorySessionManager,  "sharedManager"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessoryServerRemote clientInfo](self, "clientInfo"));
  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue( [v16 createSessionForProtocol:v8 fromPrimaryAccessoryUUID:v9 fromClient:v17 result:&v34]);

  if (v34)
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessoryServerRemote clientInfo](self, "clientInfo"));
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v19 eaSessionUUIDs]);
    uint64_t v21 = kACCExternalAccessorySessionUUIDKey;
    v22 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:kACCExternalAccessorySessionUUIDKey]);
    [v20 addObject:v22];

    v23 = (__CFString *)objc_claimAutoreleasedReturnValue([v18 objectForKey:kACCExternalAccessoryProtocolEndpointUUIDKey]);
    platform_externalAccessory_openExternalAccessorySession(v23, v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:kACCExternalAccessorySessionIDKey]);
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:kACCExternalAccessorySessionUsesSocketInterfaceKey]);
    int v26 = v25;
    if (v25) {
      id v27 = [v25 BOOLValue];
    }
    else {
      id v27 = 0LL;
    }
    id v29 = [v24 unsignedLongValue];
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKey:v21]);
    v10[2](v10, 1LL, v27, v29, v30);
  }

  else
  {
    if (gLogObjects && gNumLogObjects >= 10)
    {
      v28 = (os_log_s *)*(id *)(gLogObjects + 72);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v28 = (os_log_s *)&_os_log_default;
      id v31 = &_os_log_default;
    }

    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessoryServerRemote clientInfo](self, "clientInfo"));
      v33 = (void *)objc_claimAutoreleasedReturnValue([v32 bundleID]);
      *(_DWORD *)buf = 138412802;
      v36 = v33;
      __int16 v37 = 2112;
      id v38 = v8;
      __int16 v39 = 2112;
      id v40 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "App %@ could not create ea session for eaProtocol %@ and accessoryUUID %@",  buf,  0x20u);
    }

    v10[2](v10, 0LL, 0LL, 0LL, &stru_100200A40);
  }
}

- (void)openSocketFromAccessoryToApp:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[ACCExternalAccessorySessionManager sharedManager]( &OBJC_CLASS___ACCExternalAccessorySessionManager,  "sharedManager"));
  [v4 openSocketFromAccessoryToApp:v3];
}

- (void)openSocketFromAppToAccessory:(id)a3
{
  id v3 = a3;
  id v4 = (id)objc_claimAutoreleasedReturnValue( +[ACCExternalAccessorySessionManager sharedManager]( &OBJC_CLASS___ACCExternalAccessorySessionManager,  "sharedManager"));
  [v4 openSocketFromAppToAccessory:v3];
}

- (void)clientCloseExternalAccessorySession:(id)a3
{
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 10;
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
    id v7 = (os_log_s *)*(id *)(gLogObjects + 72);
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessoryServerRemote clientInfo](self, "clientInfo"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 bundleID]);
    int v15 = 138412546;
    id v16 = v9;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Client app %@ is closing EA session for eaSessionUUID %@",  (uint8_t *)&v15,  0x16u);
  }

  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[ACCExternalAccessorySessionManager sharedManager]( &OBJC_CLASS___ACCExternalAccessorySessionManager,  "sharedManager"));
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 closeSessionForEASessionUUID:v4]);

  if (v11)
  {
    id v12 = (id)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessoryServerRemote clientInfo](self, "clientInfo"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 eaSessionUUIDs]);
    [v13 removeObject:v4];
  }

  else
  {
    if (gLogObjects && gNumLogObjects >= 10)
    {
      id v12 = *(id *)(gLogObjects + 72);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v12 = &_os_log_default;
      id v14 = &_os_log_default;
    }

    if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412290;
      id v16 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v12,  OS_LOG_TYPE_DEFAULT,  "Session could not be closed or already closed for eaSessionUUID %@",  (uint8_t *)&v15,  0xCu);
    }
  }
}

- (void)processOutgoingExternalAccessoryData:(id)a3 forEASessionIdentifier:(id)a4 withReply:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t))a5;
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue( +[ACCExternalAccessorySessionManager sharedManager]( &OBJC_CLASS___ACCExternalAccessorySessionManager,  "sharedManager"));
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 sessionInfoDictionaryForSessionUUID:v8]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSMutableDictionary dictionaryWithDictionary:]( &OBJC_CLASS___NSMutableDictionary,  "dictionaryWithDictionary:",  v11));

  if (v12)
  {
    uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue([v12 objectForKey:kACCExternalAccessoryProtocolEndpointUUIDKey]);
    [v12 setObject:v7 forKey:kACCExternalAccessorySessionDataKey];
    uint64_t v14 = platform_externalAccessory_sendOutgoingEADataFromClient(v13, v12);

    if (v9) {
LABEL_3:
    }
      v9[2](v9, v14);
  }

  else
  {
    if (gLogObjects && gNumLogObjects >= 10)
    {
      int v15 = (os_log_s *)*(id *)(gLogObjects + 72);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      int v15 = (os_log_s *)&_os_log_default;
      id v16 = &_os_log_default;
    }

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 138412290;
      id v18 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "No session for %@ to send outgoing data",  (uint8_t *)&v17,  0xCu);
    }

    uint64_t v14 = 0LL;
    if (v9) {
      goto LABEL_3;
    }
  }
}

- (void)requestAccessoryWiFiCredentials:(id)a3
{
  id v3 = a3;
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 10;
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
    id v6 = (os_log_s *)*(id *)(gLogObjects + 72);
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Received request for accessory wifi Info for endpointUUID %@",  (uint8_t *)&v7,  0xCu);
  }

  platform_wifisharing_request_accessory_wifi_information(v3);
}

- (void)sendDeviceIdentifierNotification:(id)a3 usbIdentifier:(id)a4 forUUID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects < 10;
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
    id v12 = (os_log_s *)*(id *)(gLogObjects + 72);
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Received sendDeviceIdentifierNotification for endpointUUID %@",  (uint8_t *)&v13,  0xCu);
  }
}

- (void)sendWiredCarPlayAvailable:(id)a3 usbIdentifier:(id)a4 wirelessAvailable:(id)a5 bluetoothIdentifier:(id)a6 forUUID:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (gLogObjects) {
    BOOL v16 = gNumLogObjects < 10;
  }
  else {
    BOOL v16 = 1;
  }
  if (v16)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v18 = (os_log_s *)&_os_log_default;
    id v17 = &_os_log_default;
  }

  else
  {
    id v18 = (os_log_s *)*(id *)(gLogObjects + 72);
  }

  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    int v28 = 138413314;
    id v29 = v15;
    __int16 v30 = 2112;
    id v31 = v11;
    __int16 v32 = 2112;
    id v33 = v12;
    __int16 v34 = 2112;
    id v35 = v13;
    __int16 v36 = 2112;
    id v37 = v14;
    _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "[#CarPlay] Received CarPlayAvailability for accessory UUID %@, wiredAvailable %@, usbIdentifier %@, wirelessAvaila ble %@, bluetoothIdentifier %@",  (uint8_t *)&v28,  0x34u);
  }

  id v19 = -[NSUserDefaults initWithSuiteName:]( objc_alloc(&OBJC_CLASS___NSUserDefaults),  "initWithSuiteName:",  @"com.apple.airplay");
  uint64_t v20 = objc_claimAutoreleasedReturnValue(-[NSUserDefaults objectForKey:](v19, "objectForKey:", @"enableNewDiscoveryMode"));
  if (v20
    && (uint64_t v21 = (void *)v20,
        unsigned __int8 v22 = -[NSUserDefaults BOOLForKey:](v19, "BOOLForKey:", @"enableNewDiscoveryMode"),
        v21,
        (v22 & 1) == 0))
  {
    if (gLogObjects && gNumLogObjects >= 10)
    {
      int v26 = (os_log_s *)*(id *)(gLogObjects + 72);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      int v26 = (os_log_s *)&_os_log_default;
      id v27 = &_os_log_default;
    }

    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "[#CarPlay] CarPlay New Discovery Mode is currently unavailable.",  (uint8_t *)&v28,  2u);
    }
  }

  else
  {
    if (gLogObjects && gNumLogObjects >= 10)
    {
      v23 = (os_log_s *)*(id *)(gLogObjects + 72);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v23 = (os_log_s *)&_os_log_default;
      id v24 = &_os_log_default;
    }

    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "[#CarPlay] CarPlay New Discovery Mode is available.",  (uint8_t *)&v28,  2u);
    }

    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
    int v26 = v25;
    if (v11) {
      -[os_log_s setObject:forKey:](v25, "setObject:forKey:", v11, @"wiredAvailable");
    }
    if (v12) {
      -[os_log_s setObject:forKey:](v26, "setObject:forKey:", v12, @"usbIdentifier");
    }
    if (v13) {
      -[os_log_s setObject:forKey:](v26, "setObject:forKey:", v13, @"wirelessAvailable");
    }
    if (v14) {
      -[os_log_s setObject:forKey:](v26, "setObject:forKey:", v14, @"bluetoothIdentifier");
    }
    platform_CarPlay_availability((uint64_t)v15, (uint64_t)v26);
  }
}

- (void)destinationInformation:(id)a3 forUUID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 10;
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
    id v9 = (os_log_s *)*(id *)(gLogObjects + 72);
  }

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[ACCExternalAccessoryServerRemote destinationInformation:forUUID:].cold.1((uint64_t)v5, (uint64_t)v6, v9);
  }

  platform_destinationSharing_destinationInformation(v6, (uint64_t)v5);
}

- (void)activateLocationForUUID:(id)a3
{
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 10;
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
    BOOL v7 = (os_log_s *)*(id *)(gLogObjects + 72);
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[#Location] Starting location for endpoint UUID %@",  (uint8_t *)&v10,  0xCu);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessoryServerRemote clientInfo](self, "clientInfo"));
  [v8 setClientLocationEnabled:1];

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessoryServerRemote clientInfo](self, "clientInfo"));
  [v9 addLocationAccessoryUUID:v4];

  platform_location_start((uint64_t)v4);
}

- (void)sendNMEAFilterList:(id)a3 forUUID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (gLogObjects) {
    BOOL v7 = gNumLogObjects < 10;
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
    id v9 = (os_log_s *)*(id *)(gLogObjects + 72);
  }

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "[#Location] Sending NMEA filter list to endpoint UUID %@",  (uint8_t *)&v10,  0xCu);
  }

  platform_location_sendNMEAFilterList((uint64_t)v6, (uint64_t)v5);
}

- (void)sendGPRMCDataStatus:(BOOL)a3 ValueV:(BOOL)a4 ValueX:(BOOL)a5 forUUID:(id)a6
{
  BOOL v6 = a5;
  BOOL v7 = a4;
  BOOL v8 = a3;
  id v9 = a6;
  if (gLogObjects) {
    BOOL v10 = gNumLogObjects < 10;
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
    id v12 = (os_log_s *)*(id *)(gLogObjects + 72);
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109890;
    v13[1] = v8;
    __int16 v14 = 1024;
    BOOL v15 = v7;
    __int16 v16 = 1024;
    BOOL v17 = v6;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "[#Location] Sending GPRMC Data Status ValueA: %d, ValueV: %d, ValueX: %d to endpoint UUID %@",  (uint8_t *)v13,  0x1Eu);
  }

  platform_location_sendGPRMCDataStatus((uint64_t)v9, v8, v7, v6);
}

- (void)stopLocationForUUID:(id)a3
{
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 10;
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
    BOOL v7 = (os_log_s *)*(id *)(gLogObjects + 72);
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[#Location] Stopping location for endpoint UUID %@",  (uint8_t *)&v9,  0xCu);
  }

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessoryServerRemote clientInfo](self, "clientInfo"));
  [v8 removeLocationAccessoryUUID:v4];

  platform_location_stop((uint64_t)v4);
}

- (void)vehicleInformationForUUID:(id)a3 withReply:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, id))a4;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 10;
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
    id v10 = (os_log_s *)*(id *)(gLogObjects + 72);
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[#VehicleInfoStatus] Requesting vehicle information for endpoint UUID %@",  (uint8_t *)&v14,  0xCu);
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue( -[ACCExternalAccessoryServerRemote remoteExternalAccessoryServerLock]( self,  "remoteExternalAccessoryServerLock"));
  [v11 lock];

  id v12 = platform_externalAccessory_copyVehicleInformationForEndpointUUID((uint64_t)v6);
  if (v7) {
    v7[2](v7, v12);
  }
  id v13 = (void *)objc_claimAutoreleasedReturnValue( -[ACCExternalAccessoryServerRemote remoteExternalAccessoryServerLock]( self,  "remoteExternalAccessoryServerLock"));
  [v13 unlock];
}

- (ACCExternalAccessoryClientInfo)clientInfo
{
  return (ACCExternalAccessoryClientInfo *)objc_loadWeakRetained((id *)&self->_clientInfo);
}

- (void)setClientInfo:(id)a3
{
}

- (NSLock)remoteExternalAccessoryServerLock
{
  return self->_remoteExternalAccessoryServerLock;
}

- (void).cxx_destruct
{
}

- (void)destinationInformation:(os_log_t)log forUUID:.cold.1( uint64_t a1,  uint64_t a2,  os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl( (void *)&_mh_execute_header,  log,  OS_LOG_TYPE_DEBUG,  "Received destination info %@ accessory UUID %@",  (uint8_t *)&v3,  0x16u);
  OUTLINED_FUNCTION_2();
}

@end