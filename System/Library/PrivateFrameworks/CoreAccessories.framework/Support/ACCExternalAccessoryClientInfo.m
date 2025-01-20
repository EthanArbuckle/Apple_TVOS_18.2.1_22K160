@interface ACCExternalAccessoryClientInfo
- (ACCExternalAccessoryClientInfo)initWithXPCConnection:(id)a3;
- (BOOL)accessibilityEntitlement;
- (BOOL)allAccessoryNotificationsEntitlement;
- (BOOL)canSendConnectionEventForAccessory:(id)a3;
- (BOOL)canSendLaunchEvent;
- (BOOL)clientLocationEnabled;
- (BOOL)containsLocationAccessoryUUID:(id)a3;
- (BOOL)vehicleInfoEnabled;
- (NSArray)protocolStrings;
- (NSMutableArray)activeLocationAccessoryUUIDs;
- (NSMutableSet)eaSessionUUIDs;
- (NSString)bundleID;
- (OS_dispatch_queue)locationAccessoryUUIDsQueue;
- (int)clientCapabilities;
- (int)clientPid;
- (void)_determineEntitlementsForXPCConnection;
- (void)addClientRegistrationInformation:(id)a3;
- (void)addLocationAccessoryUUID:(id)a3;
- (void)canSendLaunchEvent;
- (void)dealloc;
- (void)removeLocationAccessoryUUID:(id)a3;
- (void)setActiveLocationAccessoryUUIDs:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setClientCapabilities:(int)a3;
- (void)setClientLocationEnabled:(BOOL)a3;
- (void)setClientPid:(int)a3;
- (void)setEaSessionUUIDs:(id)a3;
- (void)setLocationAccessoryUUIDsQueue:(id)a3;
- (void)setProtocolStrings:(id)a3;
- (void)setVehicleInfoEnabled:(BOOL)a3;
@end

@implementation ACCExternalAccessoryClientInfo

- (ACCExternalAccessoryClientInfo)initWithXPCConnection:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ACCExternalAccessoryClientInfo;
  v5 = -[XPCConnectionInfo initWithXPCConnection:](&v14, "initWithXPCConnection:", v4);
  v6 = v5;
  if (v5)
  {
    -[ACCExternalAccessoryClientInfo _determineEntitlementsForXPCConnection]( v5,  "_determineEntitlementsForXPCConnection");
    v6->_clientLocationEnabled = 0;
    v6->_vehicleInfoEnabled = 0;
    uint64_t v7 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
    eaSessionUUIDs = v6->_eaSessionUUIDs;
    v6->_eaSessionUUIDs = (NSMutableSet *)v7;

    uint64_t v9 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](&OBJC_CLASS___NSMutableArray, "array"));
    activeLocationAccessoryUUIDs = v6->_activeLocationAccessoryUUIDs;
    v6->_activeLocationAccessoryUUIDs = (NSMutableArray *)v9;

    v6->_clientPid = [v4 processIdentifier];
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.accessoryd.ea.uuidQueue", 0LL);
    locationAccessoryUUIDsQueue = v6->_locationAccessoryUUIDsQueue;
    v6->_locationAccessoryUUIDsQueue = (OS_dispatch_queue *)v11;
  }

  return v6;
}

- (void)dealloc
{
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 10;
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
    v5 = (os_log_s *)*(id *)(gLogObjects + 72);
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessoryClientInfo bundleID](self, "bundleID"));
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "client %@ released", buf, 0xCu);
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ACCExternalAccessoryClientInfo;
  -[ACCExternalAccessoryClientInfo dealloc](&v7, "dealloc");
}

- (void)_determineEntitlementsForXPCConnection
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[XPCConnectionInfo XPCConnection](self, "XPCConnection"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue( [v3 valueForEntitlement:@"com.apple.private.externalaccessory.showallaccessories"]);

  if (v4) {
    self->_allAccessoryNotificationsEntitlement = 1;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[XPCConnectionInfo XPCConnection](self, "XPCConnection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 valueForEntitlement:@"com.apple.iapd.accessibility"]);

  if (v6) {
    self->_accessibilityEntitlement = 1;
  }
}

- (void)addClientRegistrationInformation:(id)a3
{
  uint64_t v4 = kACCExternalAccessoryClientBundleIDKey;
  id v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v4]);
  objc_super v7 = (NSString *)[v6 copy];

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
    v10 = (os_log_s *)&_os_log_default;
    id v9 = &_os_log_default;
  }

  else
  {
    v10 = (os_log_s *)*(id *)(gLogObjects + 72);
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    v18 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "EA client %@ registering",  (uint8_t *)&v17,  0xCu);
  }

  bundleID = self->_bundleID;
  self->_bundleID = v7;
  v12 = v7;

  v13 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:kACCExternalAccessoryClientEAProtocolsKey]);
  objc_super v14 = (NSArray *)[v13 copy];
  protocolStrings = self->_protocolStrings;
  self->_protocolStrings = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:kACCExternalAccessoryClientEACapablitiesKey]);
  self->_clientCapabilities = [v16 unsignedLongLongValue];
}

- (BOOL)canSendConnectionEventForAccessory:(id)a3
{
  id v4 = a3;
  id v5 = [v4 copyExternalAccessoryProtocols];
  uint64_t v17 = 0LL;
  v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 0;
  if ([v5 count])
  {
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = __69__ACCExternalAccessoryClientInfo_canSendConnectionEventForAccessory___block_invoke;
    v16[3] = &unk_1001FC2A0;
    v16[4] = self;
    v16[5] = &v17;
    [v5 enumerateObjectsUsingBlock:v16];
    if (!*((_BYTE *)v18 + 24))
    {
      if (gLogObjects && gNumLogObjects >= 10)
      {
        v6 = (os_log_s *)*(id *)(gLogObjects + 72);
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
        BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessoryClientInfo bundleID](self, "bundleID"));
        *(_DWORD *)buf = 138412290;
        v22 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "No protocols found for client %@",  buf,  0xCu);
      }
    }
  }

  BOOL v9 = *((_BYTE *)v18 + 24)
    || -[ACCExternalAccessoryClientInfo allAccessoryNotificationsEntitlement]( self,  "allAccessoryNotificationsEntitlement");
  if (gLogObjects && gNumLogObjects >= 10)
  {
    v10 = (os_log_s *)*(id *)(gLogObjects + 72);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v10 = (os_log_s *)&_os_log_default;
    id v11 = &_os_log_default;
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessoryClientInfo bundleID](self, "bundleID"));
    unsigned int v13 = -[ACCExternalAccessoryClientInfo allAccessoryNotificationsEntitlement]( self,  "allAccessoryNotificationsEntitlement");
    int v14 = *((unsigned __int8 *)v18 + 24);
    *(_DWORD *)buf = 138413058;
    v22 = v12;
    __int16 v23 = 1024;
    unsigned int v24 = v13;
    __int16 v25 = 1024;
    int v26 = v14;
    __int16 v27 = 1024;
    BOOL v28 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "bundleID %@, _entitlementForAllAccessories = %d, anyProtocolFound = %d, canSendConnectionEvent = %d",  buf,  0x1Eu);
  }

  _Block_object_dispose(&v17, 8);
  return v9;
}

void __69__ACCExternalAccessoryClientInfo_canSendConnectionEventForAccessory___block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  id v6 = a2;
  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) protocolStrings]);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472LL;
  v13[2] = __69__ACCExternalAccessoryClientInfo_canSendConnectionEventForAccessory___block_invoke_2;
  v13[3] = &unk_1001FC278;
  id v8 = v6;
  id v14 = v8;
  id v9 = [v7 indexOfObjectPassingTest:v13];

  if (v9 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    if (gLogObjects && gNumLogObjects >= 10)
    {
      v10 = (os_log_s *)*(id *)(gLogObjects + 72);
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
      __69__ACCExternalAccessoryClientInfo_canSendConnectionEventForAccessory___block_invoke_cold_1( (uint64_t)v8,  v10,  v12);
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
    *a4 = 1;
  }
}

BOOL __69__ACCExternalAccessoryClientInfo_canSendConnectionEventForAccessory___block_invoke_2( uint64_t a1,  void *a2)
{
  return [a2 caseInsensitiveCompare:*(void *)(a1 + 32)] == 0;
}

- (BOOL)canSendLaunchEvent
{
  if ((-[ACCExternalAccessoryClientInfo clientCapabilities](self, "clientCapabilities") & 0x10) != 0
    && platform_system_unlockedSinceBoot())
  {
    if (gLogObjects) {
      BOOL v3 = gNumLogObjects < 10;
    }
    else {
      BOOL v3 = 1;
    }
    if (v3)
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v11 = (os_log_s *)&_os_log_default;
      id v4 = &_os_log_default;
    }

    else
    {
      id v11 = (os_log_s *)*(id *)(gLogObjects + 72);
    }

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[ACCExternalAccessoryClientInfo canSendLaunchEvent].cold.2(self, v11);
    }
    BOOL v10 = 1;
  }

  else
  {
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
      id v11 = (os_log_s *)&_os_log_default;
      id v6 = &_os_log_default;
    }

    else
    {
      id v11 = (os_log_s *)*(id *)(gLogObjects + 72);
    }

    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACCExternalAccessoryClientInfo bundleID](self, "bundleID"));
      if ((-[ACCExternalAccessoryClientInfo clientCapabilities](self, "clientCapabilities") & 0x10) != 0) {
        id v8 = @"yes";
      }
      else {
        id v8 = @"no";
      }
      int v13 = 138412802;
      else {
        id v9 = @"no";
      }
      id v14 = v7;
      __int16 v15 = 2112;
      v16 = v8;
      __int16 v17 = 2112;
      v18 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Don't send launch event for bundleID %@ ... supports EA in background = %@, unlockedSinceBoot = %@, or app is al ready in foreground",  (uint8_t *)&v13,  0x20u);
    }

    BOOL v10 = 0;
  }

  return v10;
}

- (void)addLocationAccessoryUUID:(id)a3
{
  id v4 = a3;
  locationAccessoryUUIDsQueue = (dispatch_queue_s *)self->_locationAccessoryUUIDsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __59__ACCExternalAccessoryClientInfo_addLocationAccessoryUUID___block_invoke;
  block[3] = &unk_1001F9798;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(locationAccessoryUUIDsQueue, block);
}

id __59__ACCExternalAccessoryClientInfo_addLocationAccessoryUUID___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) addObject:*(void *)(a1 + 40)];
}

- (void)removeLocationAccessoryUUID:(id)a3
{
  id v4 = a3;
  locationAccessoryUUIDsQueue = (dispatch_queue_s *)self->_locationAccessoryUUIDsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __62__ACCExternalAccessoryClientInfo_removeLocationAccessoryUUID___block_invoke;
  block[3] = &unk_1001F9798;
  block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(locationAccessoryUUIDsQueue, block);
}

id __62__ACCExternalAccessoryClientInfo_removeLocationAccessoryUUID___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 56) removeObject:*(void *)(a1 + 40)];
}

- (BOOL)containsLocationAccessoryUUID:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0LL;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  locationAccessoryUUIDsQueue = (dispatch_queue_s *)self->_locationAccessoryUUIDsQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __64__ACCExternalAccessoryClientInfo_containsLocationAccessoryUUID___block_invoke;
  block[3] = &unk_1001F9748;
  id v9 = v4;
  BOOL v10 = &v11;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(locationAccessoryUUIDsQueue, block);
  LOBYTE(locationAccessoryUUIDsQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)locationAccessoryUUIDsQueue;
}

id __64__ACCExternalAccessoryClientInfo_containsLocationAccessoryUUID___block_invoke(void *a1)
{
  id result = [*(id *)(a1[4] + 56) containsObject:a1[5]];
  *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = (_BYTE)result;
  return result;
}

- (NSMutableSet)eaSessionUUIDs
{
  return self->_eaSessionUUIDs;
}

- (void)setEaSessionUUIDs:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (NSArray)protocolStrings
{
  return self->_protocolStrings;
}

- (void)setProtocolStrings:(id)a3
{
}

- (int)clientCapabilities
{
  return self->_clientCapabilities;
}

- (void)setClientCapabilities:(int)a3
{
  self->_clientCapabilities = a3;
}

- (BOOL)allAccessoryNotificationsEntitlement
{
  return self->_allAccessoryNotificationsEntitlement;
}

- (BOOL)accessibilityEntitlement
{
  return self->_accessibilityEntitlement;
}

- (BOOL)clientLocationEnabled
{
  return self->_clientLocationEnabled;
}

- (void)setClientLocationEnabled:(BOOL)a3
{
  self->_clientLocationEnabled = a3;
}

- (NSMutableArray)activeLocationAccessoryUUIDs
{
  return self->_activeLocationAccessoryUUIDs;
}

- (void)setActiveLocationAccessoryUUIDs:(id)a3
{
}

- (BOOL)vehicleInfoEnabled
{
  return self->_vehicleInfoEnabled;
}

- (void)setVehicleInfoEnabled:(BOOL)a3
{
  self->_vehicleInfoEnabled = a3;
}

- (int)clientPid
{
  return self->_clientPid;
}

- (void)setClientPid:(int)a3
{
  self->_clientPid = a3;
}

- (OS_dispatch_queue)locationAccessoryUUIDsQueue
{
  return self->_locationAccessoryUUIDsQueue;
}

- (void)setLocationAccessoryUUIDsQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

void __69__ACCExternalAccessoryClientInfo_canSendConnectionEventForAccessory___block_invoke_cold_1( uint64_t a1,  os_log_s *a2,  uint64_t a3)
{
  int v3 = 138412290;
  uint64_t v4 = a1;
  OUTLINED_FUNCTION_5_6((void *)&_mh_execute_header, a2, a3, "protocol %@ found from accessory", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

- (void)canSendLaunchEvent
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue([a1 bundleID]);
  int v5 = 138412290;
  id v6 = v3;
  OUTLINED_FUNCTION_5_6((void *)&_mh_execute_header, a2, v4, "Can send launch event for bundleID %@", (uint8_t *)&v5);
}

@end