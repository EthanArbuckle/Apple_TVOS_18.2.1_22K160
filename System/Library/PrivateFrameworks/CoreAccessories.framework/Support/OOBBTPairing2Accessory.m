@interface OOBBTPairing2Accessory
+ (id)accessoryForUID:(id)a3;
+ (id)accessoryList;
+ (id)accessoryListLock;
+ (id)processingQueue;
+ (void)addAccessory:(id)a3;
+ (void)removeAccessoryForUID:(id)a3;
- (ACCUserNotification)userNotification;
- (BOOL)carPlaySupported;
- (BOOL)checkAlreadyPairedComponent:(id)a3;
- (NSDictionary)accInfo;
- (NSMutableDictionary)componentList;
- (NSString)accessoryUID;
- (NSString)activeComponentUID;
- (NSString)displayName;
- (NSString)fwVer;
- (NSString)hwVer;
- (NSString)manufacturer;
- (NSString)model;
- (NSString)name;
- (NSString)serialNum;
- (NSXPCConnection)connectionToACCBluetoothPairingService;
- (OOBBTPairing2Accessory)initWithUID:(id)a3 accInfo:(id)a4;
- (OS_dispatch_source)waitForBeginPairingTimer;
- (id)getComponentForUID:(id)a3;
- (id)getDeviceMacAddress;
- (id)getPendingComponent;
- (int)checkComponentsAlreadyPaired;
- (void)addComponent:(id)a3;
- (void)cancelPairing:(id)a3;
- (void)checkDeviceSupportsContactsSync:(id)a3 withReply:(id)a4;
- (void)connectToACCBluetoothPairingService;
- (void)disconnectFromACCBluetoothPairingService;
- (void)removeComponent:(id)a3;
- (void)setAccInfo:(id)a3;
- (void)setAccessoryUID:(id)a3;
- (void)setActiveComponentUID:(id)a3;
- (void)setComponentList:(id)a3;
- (void)setConnectionToACCBluetoothPairingService:(id)a3;
- (void)setUserNotification:(id)a3;
- (void)setWaitForBeginPairingTimer:(id)a3;
- (void)showContactsSyncAlert:(id)a3 accessoryUID:(id)a4 macAddr:(id)a5;
- (void)startPairing:(id)a3 macAddr:(id)a4 pairingDataP192:(id)a5 pairingDataP256:(id)a6;
@end

@implementation OOBBTPairing2Accessory

- (OOBBTPairing2Accessory)initWithUID:(id)a3 accInfo:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v41.receiver = self;
  v41.super_class = (Class)&OBJC_CLASS___OOBBTPairing2Accessory;
  id v9 = -[OOBBTPairing2Accessory init](&v41, "init");
  if (v9)
  {
    v10 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    v11 = (void *)*((void *)v9 + 1);
    *((void *)v9 + 1) = v10;

    objc_storeStrong((id *)v9 + 2, a3);
    objc_storeStrong((id *)v9 + 3, a4);
    v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( +[OOBBTPairing2Accessory processingQueue]( &OBJC_CLASS___OOBBTPairing2Accessory,  "processingQueue"));
    dispatch_source_t v13 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, v12);
    v14 = (void *)*((void *)v9 + 7);
    *((void *)v9 + 7) = v13;

    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v9);
    v15 = (dispatch_source_s *)*((void *)v9 + 7);
    handler = _NSConcreteStackBlock;
    uint64_t v36 = 3221225472LL;
    v37 = __46__OOBBTPairing2Accessory_initWithUID_accInfo___block_invoke;
    v38 = &unk_1001FDB98;
    objc_copyWeak(&v39, &location);
    dispatch_source_set_event_handler(v15, &handler);
    dispatch_source_set_timer(*((dispatch_source_t *)v9 + 7), 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    dispatch_resume(*((dispatch_object_t *)v9 + 7));
    uint64_t v17 = acc_strings_bundle(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue( [v18 localizedStringForKey:@"“%@” would like to pair with your %@." value:&stru_100200A40 table:0]);

    v20 = (void *)objc_claimAutoreleasedReturnValue([v9 name]);
    v21 = (void *)MGCopyAnswer(@"DeviceClass", 0LL);
    v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  v19,  v20,  v21,  handler,  v36,  v37,  v38));

    uint64_t v24 = acc_strings_bundle(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 localizedStringForKey:@"Allow" value:&stru_100200A40 table:0]);

    uint64_t v28 = acc_strings_bundle(v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue([v29 localizedStringForKey:@"Cancel" value:&stru_100200A40 table:0]);

    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"oobPairing2-%@",  v7));
    v32 = objc_alloc_init(&OBJC_CLASS___ACCUserNotification);
    v33 = (void *)*((void *)v9 + 5);
    *((void *)v9 + 5) = v32;

    [*((id *)v9 + 5) setType:0];
    [*((id *)v9 + 5) setTitle:@"Accessory Bluetooth Pairing Request"];
    [*((id *)v9 + 5) setMessage:v22];
    [*((id *)v9 + 5) setDefaultButtonName:v26];
    [*((id *)v9 + 5) setOtherButtonName:v30];
    [*((id *)v9 + 5) setIconURL:0];
    [*((id *)v9 + 5) setIsModal:1];
    [*((id *)v9 + 5) setTimeout:0.0];
    [*((id *)v9 + 5) setIdentifier:v31];
    [*((id *)v9 + 5) setGroupIdentifier:v7];

    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);
  }

  return (OOBBTPairing2Accessory *)v9;
}

void __46__OOBBTPairing2Accessory_initWithUID_accInfo___block_invoke(uint64_t a1)
{
  if (gLogObjects && gNumLogObjects >= 51)
  {
    v2 = (os_log_s *)*(id *)(gLogObjects + 400);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v2 = (os_log_s *)&_os_log_default;
    id v3 = &_os_log_default;
  }

  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __46__OOBBTPairing2Accessory_initWithUID_accInfo___block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue([WeakRetained accessoryUID]);
  platform_oobBtPairing2_startOobBtPairingHandler(v5);
}

- (NSString)name
{
  return (NSString *)-[NSDictionary objectForKey:](self->_accInfo, "objectForKey:", @"ACCOOBBTPairingAccName");
}

- (NSString)displayName
{
  return (NSString *)-[NSDictionary objectForKey:](self->_accInfo, "objectForKey:", @"ACCOOBBTPairingDisplayName");
}

- (NSString)model
{
  return (NSString *)-[NSDictionary objectForKey:](self->_accInfo, "objectForKey:", @"ACCOOBBTPairingAccModel");
}

- (NSString)manufacturer
{
  return (NSString *)-[NSDictionary objectForKey:]( self->_accInfo,  "objectForKey:",  @"ACCOOBBTPairingAccManufacturer");
}

- (NSString)serialNum
{
  return (NSString *)-[NSDictionary objectForKey:]( self->_accInfo,  "objectForKey:",  @"ACCOOBBTPairingAccSerialNum");
}

- (NSString)fwVer
{
  return (NSString *)-[NSDictionary objectForKey:](self->_accInfo, "objectForKey:", @"ACCOOBBTPairingAccFwVer");
}

- (NSString)hwVer
{
  return (NSString *)-[NSDictionary objectForKey:](self->_accInfo, "objectForKey:", @"ACCOOBBTPairingAccHwVer");
}

- (BOOL)carPlaySupported
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( -[NSDictionary objectForKey:]( self->_accInfo,  "objectForKey:",  @"ACCOOBBTPairingCarPlaySupported"));
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

- (id)getComponentForUID:(id)a3
{
  return -[NSMutableDictionary objectForKey:](self->_componentList, "objectForKey:", a3);
}

- (id)getPendingComponent
{
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_componentList, "allValues", 0LL));
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0LL; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v8 + 1) + 8LL * (void)i);
        if (![v6 status])
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }

      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

- (void)addComponent:(id)a3
{
  componentList = self->_componentList;
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue([v4 componentUID]);
  -[NSMutableDictionary setObject:forKey:](componentList, "setObject:forKey:", v4, v5);
}

- (void)removeComponent:(id)a3
{
}

- (void)connectToACCBluetoothPairingService
{
}

- (void)disconnectFromACCBluetoothPairingService
{
}

- (id)getDeviceMacAddress
{
  uint64_t v20 = 0LL;
  v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = __Block_byref_object_copy__4;
  uint64_t v24 = __Block_byref_object_dispose__4;
  id v25 = 0LL;
  -[OOBBTPairing2Accessory connectToACCBluetoothPairingService](self, "connectToACCBluetoothPairingService");
  if (self->_connectionToACCBluetoothPairingService)
  {
    dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
    connectionToACCBluetoothPairingService = self->_connectionToACCBluetoothPairingService;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = __45__OOBBTPairing2Accessory_getDeviceMacAddress__block_invoke;
    v18[3] = &unk_1001FDBC0;
    uint64_t v5 = v3;
    v19 = v5;
    uint8_t v6 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( connectionToACCBluetoothPairingService,  "remoteObjectProxyWithErrorHandler:",  v18));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = __45__OOBBTPairing2Accessory_getDeviceMacAddress__block_invoke_78;
    v15[3] = &unk_1001FDBE8;
    uint64_t v17 = &v20;
    id v7 = v5;
    uint64_t v16 = v7;
    [v6 getDeviceBTMacAddress:v15];

    dispatch_time_t v8 = dispatch_time(0LL, 1000000000LL);
    if (dispatch_semaphore_wait(v7, v8))
    {
      if (gLogObjects && gNumLogObjects >= 51)
      {
        __int128 v9 = (os_log_s *)*(id *)(gLogObjects + 400);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        __int128 v9 = (os_log_s *)&_os_log_default;
        id v10 = &_os_log_default;
      }

      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v14 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Timed out waiting for getDeviceBTMacAddress completion handler callback!",  (uint8_t *)&v14,  2u);
      }
    }
  }

  else
  {
    if (gLogObjects && gNumLogObjects >= 51)
    {
      id v7 = (dispatch_semaphore_s *)*(id *)(gLogObjects + 400);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v7 = (dispatch_semaphore_s *)&_os_log_default;
      id v11 = &_os_log_default;
    }

    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v7,  OS_LOG_TYPE_DEFAULT,  "No connection to ACCBluetoothPairingService!",  (uint8_t *)&v14,  2u);
    }
  }

  id v12 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v12;
}

void __45__OOBBTPairing2Accessory_getDeviceMacAddress__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (gLogObjects && gNumLogObjects >= 51)
  {
    uint64_t v4 = (os_log_s *)*(id *)(gLogObjects + 400);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v4 = (os_log_s *)&_os_log_default;
    id v5 = &_os_log_default;
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __45__OOBBTPairing2Accessory_getDeviceMacAddress__block_invoke_cold_1();
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __45__OOBBTPairing2Accessory_getDeviceMacAddress__block_invoke_78(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (gLogObjects && gNumLogObjects >= 51)
  {
    uint64_t v4 = (os_log_s *)*(id *)(gLogObjects + 400);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v4 = (os_log_s *)&_os_log_default;
    id v5 = &_os_log_default;
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412290;
    id v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "deviceMacAddr = %@", (uint8_t *)&v11, 0xCu);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0LL;

  if (v3)
  {
    id v8 = [v3 copy];
    uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

- (BOOL)checkAlreadyPairedComponent:(id)a3
{
  id v4 = a3;
  uint64_t v24 = 0LL;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  char v27 = 0;
  -[OOBBTPairing2Accessory connectToACCBluetoothPairingService](self, "connectToACCBluetoothPairingService");
  if (self->_connectionToACCBluetoothPairingService)
  {
    dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
    connectionToACCBluetoothPairingService = self->_connectionToACCBluetoothPairingService;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472LL;
    v22[2] = __54__OOBBTPairing2Accessory_checkAlreadyPairedComponent___block_invoke;
    v22[3] = &unk_1001FDBC0;
    id v7 = v5;
    uint64_t v23 = v7;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( connectionToACCBluetoothPairingService,  "remoteObjectProxyWithErrorHandler:",  v22));
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 macAddr]);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472LL;
    v18[2] = __54__OOBBTPairing2Accessory_checkAlreadyPairedComponent___block_invoke_80;
    v18[3] = &unk_1001FDC10;
    id v19 = v4;
    v21 = &v24;
    id v10 = v7;
    uint64_t v20 = v10;
    [v8 checkAlreadyPaired:v9 completionHandler:v18];

    dispatch_time_t v11 = dispatch_time(0LL, 1000000000LL);
    if (dispatch_semaphore_wait(v10, v11))
    {
      if (gLogObjects && gNumLogObjects >= 51)
      {
        id v12 = (os_log_s *)*(id *)(gLogObjects + 400);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        id v12 = (os_log_s *)&_os_log_default;
        id v13 = &_os_log_default;
      }

      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Timed out waiting for checkAlreadyPaired completion handler callback!",  v17,  2u);
      }
    }
  }

  else
  {
    if (gLogObjects && gNumLogObjects >= 51)
    {
      id v10 = (dispatch_semaphore_s *)*(id *)(gLogObjects + 400);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v10 = (dispatch_semaphore_s *)&_os_log_default;
      id v14 = &_os_log_default;
    }

    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v10,  OS_LOG_TYPE_DEFAULT,  "No connection to ACCBluetoothPairingService!",  v17,  2u);
    }
  }

  char v15 = *((_BYTE *)v25 + 24);
  _Block_object_dispose(&v24, 8);

  return v15;
}

void __54__OOBBTPairing2Accessory_checkAlreadyPairedComponent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (gLogObjects && gNumLogObjects >= 51)
  {
    id v4 = (os_log_s *)*(id *)(gLogObjects + 400);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v4 = (os_log_s *)&_os_log_default;
    id v5 = &_os_log_default;
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    __45__OOBBTPairing2Accessory_getDeviceMacAddress__block_invoke_cold_1();
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __54__OOBBTPairing2Accessory_checkAlreadyPairedComponent___block_invoke_80(uint64_t a1, int a2)
{
  if (gLogObjects && gNumLogObjects >= 51)
  {
    id v4 = (os_log_s *)*(id *)(gLogObjects + 400);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v4 = (os_log_s *)&_os_log_default;
    id v5 = &_os_log_default;
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) macAddr]);
    int v8 = 138412546;
    uint64_t v9 = v6;
    __int16 v10 = 1024;
    int v11 = a2;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "component.macAddr = %@, alreadyPaired = %d",  (uint8_t *)&v8,  0x12u);
  }

  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (int)checkComponentsAlreadyPaired
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_componentList, "allValues", 0LL));
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    int v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8LL * (void)i);
        if (-[OOBBTPairing2Accessory checkAlreadyPairedComponent:](self, "checkAlreadyPairedComponent:", v9)) {
          [v9 setStatus:3];
        }
        else {
          ++v6;
        }
      }

      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }

    while (v5);
  }

  else
  {
    int v6 = 0;
  }

  return v6;
}

- (void)checkDeviceSupportsContactsSync:(id)a3 withReply:(id)a4
{
  id v6 = a4;
  connectionToACCBluetoothPairingService = self->_connectionToACCBluetoothPairingService;
  id v8 = a3;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( connectionToACCBluetoothPairingService,  "remoteObjectProxyWithErrorHandler:",  &__block_literal_global_39));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = __68__OOBBTPairing2Accessory_checkDeviceSupportsContactsSync_withReply___block_invoke_82;
  v11[3] = &unk_1001FBA40;
  id v12 = v6;
  id v10 = v6;
  [v9 deviceSupportsContactsSync:v8 withReply:v11];
}

void __68__OOBBTPairing2Accessory_checkDeviceSupportsContactsSync_withReply___block_invoke(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (gLogObjects && gNumLogObjects >= 51)
  {
    id v3 = (os_log_s *)*(id *)(gLogObjects + 400);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v3 = (os_log_s *)&_os_log_default;
    id v4 = &_os_log_default;
  }

  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __45__OOBBTPairing2Accessory_getDeviceMacAddress__block_invoke_cold_1();
  }
}

uint64_t __68__OOBBTPairing2Accessory_checkDeviceSupportsContactsSync_withReply___block_invoke_82(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)showContactsSyncAlert:(id)a3 accessoryUID:(id)a4 macAddr:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = acc_strings_bundle(a4);
  __int128 v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if (v8)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( [v11 localizedStringForKey:@"The accessory %@ may request your contacts, phone favorites, and recent phone calls over Bluetooth. Do you wish to allow this?", &stru_100200A40, 0 value table]);
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", v12, v8));
  }

  else
  {
    __int128 v13 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v11,  "localizedStringForKey:value:table:",  @"An unknown accessory may request your contacts, phone favorites, and recent phone calls over Bluetooth. Do you wish to allow this?",  &stru_100200A40,  0));
  }

  uint64_t v15 = acc_strings_bundle(v14);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue( [v16 localizedStringForKey:@"Allow Contacts and Favorites Sync?" value:&stru_100200A40 table:0]);

  uint64_t v19 = acc_strings_bundle(v18);
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue([v20 localizedStringForKey:@"Allow" value:&stru_100200A40 table:0]);

  uint64_t v23 = acc_strings_bundle(v22);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 localizedStringForKey:@"Don’t Allow" value:&stru_100200A40 table:0]);

  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"oobPairing-contact-sync-%@",  a4));
  char v27 = objc_alloc_init(&OBJC_CLASS___ACCUserNotification);
  -[ACCUserNotification setType:](v27, "setType:", 0LL);
  -[ACCUserNotification setTitle:](v27, "setTitle:", v17);
  -[ACCUserNotification setMessage:](v27, "setMessage:", v13);
  -[ACCUserNotification setDefaultButtonName:](v27, "setDefaultButtonName:", v21);
  -[ACCUserNotification setOtherButtonName:](v27, "setOtherButtonName:", v25);
  -[ACCUserNotification setIconURL:](v27, "setIconURL:", 0LL);
  -[ACCUserNotification setIsModal:](v27, "setIsModal:", 1LL);
  -[ACCUserNotification setTimeout:](v27, "setTimeout:", 0.0);
  -[ACCUserNotification setIdentifier:](v27, "setIdentifier:", v26);
  -[ACCUserNotification setGroupIdentifier:](v27, "setGroupIdentifier:", a4);

  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(+[ACCUserNotificationManager sharedManager](&OBJC_CLASS___ACCUserNotificationManager, "sharedManager"));
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472LL;
  v30[2] = __69__OOBBTPairing2Accessory_showContactsSyncAlert_accessoryUID_macAddr___block_invoke;
  v30[3] = &unk_1001FB500;
  v30[4] = self;
  id v31 = v9;
  id v29 = v9;
  [v28 presentNotification:v27 completionHandler:v30];
}

void __69__OOBBTPairing2Accessory_showContactsSyncAlert_accessoryUID_macAddr___block_invoke( uint64_t a1,  int a2)
{
  if (a2 == 1)
  {
    if (gLogObjects && gNumLogObjects >= 51)
    {
      id v4 = (os_log_s *)*(id *)(gLogObjects + 400);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v4 = (os_log_s *)&_os_log_default;
      id v6 = &_os_log_default;
    }

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "BTDeviceConnect Contact Sync Alert - user declined",  v7,  2u);
    }
  }

  else
  {
    if (a2) {
      return;
    }
    if (gLogObjects && gNumLogObjects >= 51)
    {
      id v3 = (os_log_s *)*(id *)(gLogObjects + 400);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v3 = (os_log_s *)&_os_log_default;
      id v5 = &_os_log_default;
    }

    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "BTDeviceConnect Contact Sync Alert - user accepted",  buf,  2u);
    }

    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue( [*(id *)(*(void *)(a1 + 32) + 48) remoteObjectProxyWithErrorHandler:&__block_literal_global_95]);
    -[os_log_s setBTDeviceSyncSettings:](v4, "setBTDeviceSyncSettings:", *(void *)(a1 + 40));
  }
}

void __69__OOBBTPairing2Accessory_showContactsSyncAlert_accessoryUID_macAddr___block_invoke_94( id a1,  NSError *a2)
{
  uint64_t v2 = a2;
  if (gLogObjects && gNumLogObjects >= 51)
  {
    id v3 = (os_log_s *)*(id *)(gLogObjects + 400);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v3 = (os_log_s *)&_os_log_default;
    id v4 = &_os_log_default;
  }

  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __45__OOBBTPairing2Accessory_getDeviceMacAddress__block_invoke_cold_1();
  }
}

- (void)startPairing:(id)a3 macAddr:(id)a4 pairingDataP192:(id)a5 pairingDataP256:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (gLogObjects && gNumLogObjects >= 51)
  {
    uint64_t v14 = (os_log_s *)*(id *)(gLogObjects + 400);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    uint64_t v14 = (os_log_s *)&_os_log_default;
    id v15 = &_os_log_default;
  }

  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue([v10 componentUID]);
    *(_DWORD *)buf = 138413058;
    id v40 = v16;
    __int16 v41 = 2112;
    id v42 = v11;
    __int16 v43 = 2112;
    id v44 = v12;
    __int16 v45 = 2112;
    id v46 = v13;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "startPairing: %@ macAddr: %@ pairingDataP192: %@ pairingDataP256: %@",  buf,  0x2Au);
  }

  if ([v11 length] == (id)6
    && [v12 length] == (id)32
    && (!v13 || [v13 length] == (id)32))
  {
    -[OOBBTPairing2Accessory connectToACCBluetoothPairingService](self, "connectToACCBluetoothPairingService");
    if (self->_connectionToACCBluetoothPairingService)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "subdataWithRange:", 0, 16));
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "subdataWithRange:", 16, 16));
      id v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "subdataWithRange:", 0, 16));
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "subdataWithRange:", 16, 16));
      if (gLogObjects && gNumLogObjects >= 51)
      {
        uint64_t v19 = (os_log_s *)*(id *)(gLogObjects + 400);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        uint64_t v19 = (os_log_s *)&_os_log_default;
        id v23 = &_os_log_default;
      }

      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413314;
        id v40 = v11;
        __int16 v41 = 2112;
        id v42 = v30;
        __int16 v43 = 2112;
        id v44 = v17;
        __int16 v45 = 2112;
        id v46 = v29;
        __int16 v47 = 2112;
        v48 = v18;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "call service startBTOOBPairing: accessoryMacAddr: %@ pdC192: %@ pR192: %@ pdC256: %@ pR256: %@",  buf,  0x34u);
      }

      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( self->_connectionToACCBluetoothPairingService,  "remoteObjectProxyWithErrorHandler:",  &__block_literal_global_97));
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472LL;
      v31[2] = __79__OOBBTPairing2Accessory_startPairing_macAddr_pairingDataP192_pairingDataP256___block_invoke_98;
      v31[3] = &unk_1001FDC98;
      id v32 = v11;
      id v33 = v30;
      id v34 = v17;
      id v35 = v29;
      id v36 = v18;
      id v37 = v10;
      v38 = self;
      id v24 = v18;
      id v25 = v29;
      id v26 = v17;
      uint64_t v20 = v30;
      [v28 startBTOOBPairing:v32 pairingDataC192:v20 pairingDataR192:v26 pairingDataC256:v25 pairingDataR256:v24 completionHandler:v31];
    }

    else
    {
      if (gLogObjects && gNumLogObjects >= 51)
      {
        uint64_t v20 = (os_log_s *)*(id *)(gLogObjects + 400);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        uint64_t v20 = (os_log_s *)&_os_log_default;
        id v27 = &_os_log_default;
      }

      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "No connection to ACCBluetoothPairingService!",  buf,  2u);
      }
    }
  }

  else
  {
    if (gLogObjects && gNumLogObjects >= 51)
    {
      uint64_t v20 = (os_log_s *)*(id *)(gLogObjects + 400);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      uint64_t v20 = (os_log_s *)&_os_log_default;
      id v21 = &_os_log_default;
    }

    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v10 componentUID]);
      *(_DWORD *)buf = 138413058;
      id v40 = v22;
      __int16 v41 = 2112;
      id v42 = v11;
      __int16 v43 = 2112;
      id v44 = v12;
      __int16 v45 = 2112;
      id v46 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "startPairing: %@ macAddr: %@ pairingDataP192: %@ pairingDataP256: %@, invalid parameter found, skip!",  buf,  0x2Au);
    }
  }
}

void __79__OOBBTPairing2Accessory_startPairing_macAddr_pairingDataP192_pairingDataP256___block_invoke( id a1,  NSError *a2)
{
  uint64_t v2 = a2;
  if (gLogObjects && gNumLogObjects >= 51)
  {
    id v3 = (os_log_s *)*(id *)(gLogObjects + 400);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v3 = (os_log_s *)&_os_log_default;
    id v4 = &_os_log_default;
  }

  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __45__OOBBTPairing2Accessory_getDeviceMacAddress__block_invoke_cold_1();
  }
}

void __79__OOBBTPairing2Accessory_startPairing_macAddr_pairingDataP192_pairingDataP256___block_invoke_98( uint64_t a1,  int a2)
{
  if (gLogObjects && gNumLogObjects >= 51)
  {
    id v4 = (os_log_s *)*(id *)(gLogObjects + 400);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v4 = (os_log_s *)&_os_log_default;
    id v5 = &_os_log_default;
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 64);
    unsigned int v11 = [*(id *)(a1 + 72) status];
    unsigned int v12 = [*(id *)(a1 + 72) accessoryStatus];
    *(_DWORD *)buf = 138414082;
    id v24 = v6;
    __int16 v25 = 2112;
    *(void *)id v26 = v7;
    *(_WORD *)&v26[8] = 2112;
    uint64_t v27 = v8;
    __int16 v28 = 2112;
    uint64_t v29 = v9;
    __int16 v30 = 2112;
    uint64_t v31 = v10;
    __int16 v32 = 1024;
    int v33 = a2;
    __int16 v34 = 1024;
    unsigned int v35 = v11;
    __int16 v36 = 1024;
    unsigned int v37 = v12;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_INFO,  "startPairing: %@ pdC192: %@ pR192: %@ pdC256: %@ pR256: %@, success = %d, component.status = %d, .accessoryStatus = %d",  buf,  0x46u);
  }

  if ([*(id *)(a1 + 72) status] == 1)
  {
    if (a2) {
      uint64_t v13 = 2LL;
    }
    else {
      uint64_t v13 = 4LL;
    }
    [*(id *)(a1 + 72) setStatus:v13];
    if ([*(id *)(a1 + 72) status] == 4
      || [*(id *)(a1 + 72) accessoryStatus] >= 2)
    {
      _sendStopOOBBTPairing(*(void **)(a1 + 80), *(void **)(a1 + 72), (int)[*(id *)(a1 + 72) status]);
    }

    if ([*(id *)(a1 + 72) status] == 2
      && ([*(id *)(a1 + 80) carPlaySupported] & 1) == 0)
    {
      uint64_t v14 = *(void **)(a1 + 80);
      id v15 = *(void **)(a1 + 32);
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472LL;
      v21[2] = __79__OOBBTPairing2Accessory_startPairing_macAddr_pairingDataP192_pairingDataP256___block_invoke_99;
      v21[3] = &unk_1001FD778;
      v21[4] = v14;
      id v22 = v15;
      [v14 checkDeviceSupportsContactsSync:v22 withReply:v21];
    }
  }

  else
  {
    if (gLogObjects && gNumLogObjects >= 51)
    {
      uint64_t v16 = (os_log_s *)*(id *)(gLogObjects + 400);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      uint64_t v16 = (os_log_s *)&_os_log_default;
      id v17 = &_os_log_default;
    }

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 72) componentUID]);
      unsigned int v19 = [*(id *)(a1 + 72) status];
      unsigned int v20 = [*(id *)(a1 + 72) accessoryStatus];
      *(_DWORD *)buf = 138412802;
      id v24 = v18;
      __int16 v25 = 1024;
      *(_DWORD *)id v26 = v19;
      *(_WORD *)&v26[4] = 1024;
      *(_DWORD *)&v26[6] = v20;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "WARNING: component %@ is not in a valid state, accessory already cancelled?  status %d, accessoryStatus %d",  buf,  0x18u);
    }
  }

void __79__OOBBTPairing2Accessory_startPairing_macAddr_pairingDataP192_pairingDataP256___block_invoke_99( uint64_t a1,  int a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = (id)objc_claimAutoreleasedReturnValue([v3 displayName]);
    [v3 showContactsSyncAlert:v4 accessoryUID:*(void *)(*(void *)(a1 + 32) + 16) macAddr:*(void *)(a1 + 40)];
  }

- (void)cancelPairing:(id)a3
{
  id v4 = a3;
  if (gLogObjects && gNumLogObjects >= 51)
  {
    id v5 = (os_log_s *)*(id *)(gLogObjects + 400);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v5 = (os_log_s *)&_os_log_default;
    id v6 = &_os_log_default;
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v4 componentUID]);
    int v16 = 138412290;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "cancelPairing: %@", (uint8_t *)&v16, 0xCu);
  }

  -[OOBBTPairing2Accessory connectToACCBluetoothPairingService](self, "connectToACCBluetoothPairingService");
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects <= 50;
  }
  else {
    BOOL v8 = 1;
  }
  int v9 = !v8;
  if (self->_connectionToACCBluetoothPairingService)
  {
    if (v9)
    {
      uint64_t v10 = (os_log_s *)*(id *)(gLogObjects + 400);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      uint64_t v10 = (os_log_s *)&_os_log_default;
      id v12 = &_os_log_default;
    }

    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "call service cancelBTOOBPairing: component: %@",  (uint8_t *)&v16,  0xCu);
    }

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( -[NSXPCConnection remoteObjectProxyWithErrorHandler:]( self->_connectionToACCBluetoothPairingService,  "remoteObjectProxyWithErrorHandler:",  &__block_literal_global_100));
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 macAddr]);
    [v13 cancelBTOOBPairing:v14];

    [v4 setStatus:4];
  }

  else
  {
    if (v9)
    {
      unsigned int v11 = (os_log_s *)*(id *)(gLogObjects + 400);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      unsigned int v11 = (os_log_s *)&_os_log_default;
      id v15 = &_os_log_default;
    }

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "No connection to ACCBluetoothPairingService!",  (uint8_t *)&v16,  2u);
    }
  }
}

void __40__OOBBTPairing2Accessory_cancelPairing___block_invoke(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (gLogObjects && gNumLogObjects >= 51)
  {
    id v3 = (os_log_s *)*(id *)(gLogObjects + 400);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    id v3 = (os_log_s *)&_os_log_default;
    id v4 = &_os_log_default;
  }

  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    __45__OOBBTPairing2Accessory_getDeviceMacAddress__block_invoke_cold_1();
  }
}

+ (id)accessoryListLock
{
  if (accessoryListLock_onceToken != -1) {
    dispatch_once(&accessoryListLock_onceToken, &__block_literal_global_101);
  }
  return (id)accessoryListLock__accessoryListLock;
}

void __43__OOBBTPairing2Accessory_accessoryListLock__block_invoke(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___NSRecursiveLock);
  uint64_t v2 = (void *)accessoryListLock__accessoryListLock;
  accessoryListLock__accessoryListLock = (uint64_t)v1;
}

+ (id)accessoryList
{
  if (accessoryList_onceToken_0 != -1) {
    dispatch_once(&accessoryList_onceToken_0, &__block_literal_global_103);
  }
  return (id)accessoryList__attachedOOBBTPairing2AccessoryList;
}

void __39__OOBBTPairing2Accessory_accessoryList__block_invoke(id a1)
{
  uint64_t v1 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v2 = (void *)accessoryList__attachedOOBBTPairing2AccessoryList;
  accessoryList__attachedOOBBTPairing2AccessoryList = (uint64_t)v1;
}

+ (id)accessoryForUID:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[OOBBTPairing2Accessory accessoryList](&OBJC_CLASS___OOBBTPairing2Accessory, "accessoryList"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v3]);

  return v5;
}

+ (void)addAccessory:(id)a3
{
  id v3 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[OOBBTPairing2Accessory accessoryList](&OBJC_CLASS___OOBBTPairing2Accessory, "accessoryList"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 accessoryUID]);
  [v5 setObject:v3 forKey:v4];
}

+ (void)removeAccessoryForUID:(id)a3
{
  id v3 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(+[OOBBTPairing2Accessory accessoryList](&OBJC_CLASS___OOBBTPairing2Accessory, "accessoryList"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:v3]);
  [v5 removeObjectForKey:v3];

  [v4 disconnectFromACCBluetoothPairingService];
}

+ (id)processingQueue
{
  if (processingQueue_onceToken != -1) {
    dispatch_once(&processingQueue_onceToken, &__block_literal_global_104);
  }
  return (id)processingQueue__processingQueue;
}

void __41__OOBBTPairing2Accessory_processingQueue__block_invoke(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.acc.oobPairing2", 0LL);
  uint64_t v2 = (void *)processingQueue__processingQueue;
  processingQueue__processingQueue = (uint64_t)v1;
}

- (NSMutableDictionary)componentList
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setComponentList:(id)a3
{
}

- (NSString)accessoryUID
{
  return (NSString *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setAccessoryUID:(id)a3
{
}

- (NSDictionary)accInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setAccInfo:(id)a3
{
}

- (NSString)activeComponentUID
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setActiveComponentUID:(id)a3
{
}

- (ACCUserNotification)userNotification
{
  return (ACCUserNotification *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setUserNotification:(id)a3
{
}

- (NSXPCConnection)connectionToACCBluetoothPairingService
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setConnectionToACCBluetoothPairingService:(id)a3
{
}

- (OS_dispatch_source)waitForBeginPairingTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setWaitForBeginPairingTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

void __46__OOBBTPairing2Accessory_initWithUID_accInfo___block_invoke_cold_1()
{
}

void __45__OOBBTPairing2Accessory_getDeviceMacAddress__block_invoke_cold_1()
{
}

@end