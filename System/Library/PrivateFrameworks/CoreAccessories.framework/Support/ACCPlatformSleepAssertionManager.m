@interface ACCPlatformSleepAssertionManager
+ (id)sharedManager;
- (ACCPlatformSleepAssertionManager)init;
- (BOOL)chargingTypeExternalIsInductive;
- (BOOL)isOnAC;
- (NSMutableDictionary)sleepAssertionTimersForUUIDs;
- (NSMutableSet)sleepAssertionUUIDs;
- (NSString)batteryNotificationClientUUID;
- (OS_dispatch_queue)sleepAssertionUUIDsLock;
- (void)_addSleepAssertionForUUID:(id)a3;
- (void)_removeSleepAssertionForUUID:(id)a3 expiredOnly:(BOOL)a4;
- (void)addSleepAssertionForUUID:(id)a3;
- (void)dealloc;
- (void)powerInfoChangeNotificationHandler:(id)a3;
- (void)removeExpiredSleepAssertionForUUID:(id)a3;
- (void)removeSleepAssertionForUUID:(id)a3;
- (void)setBatteryNotificationClientUUID:(id)a3;
- (void)setChargingTypeExternalIsInductive:(BOOL)a3;
- (void)setIsOnAC:(BOOL)a3;
- (void)setSleepAssertionTimersForUUIDs:(id)a3;
- (void)setSleepAssertionUUIDs:(id)a3;
- (void)setSleepAssertionUUIDsLock:(id)a3;
- (void)updateAssertions;
@end

@implementation ACCPlatformSleepAssertionManager

- (ACCPlatformSleepAssertionManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ACCPlatformSleepAssertionManager;
  v2 = -[ACCPlatformSleepAssertionManager init](&v10, "init");
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.accessoryd.sleepAssertionUUIDsLock", 0LL);
    sleepAssertionUUIDsLock = v2->_sleepAssertionUUIDsLock;
    v2->_sleepAssertionUUIDsLock = (OS_dispatch_queue *)v3;

    sleepAssertionUUIDs = v2->_sleepAssertionUUIDs;
    v2->_sleepAssertionUUIDs = 0LL;

    sleepAssertionTimersForUUIDs = v2->_sleepAssertionTimersForUUIDs;
    v2->_sleepAssertionTimersForUUIDs = 0LL;

    batteryNotificationClientUUID = v2->_batteryNotificationClientUUID;
    v2->_batteryNotificationClientUUID = 0LL;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v8 addObserver:v2 selector:"powerInfoChangeNotificationHandler:" name:ACCPlatformIOKitPowerPlugin_BatteryChargingTypeChanged object:0];
  }

  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self name:ACCPlatformIOKitPowerPlugin_IsExternalChargerConnected object:0];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v4 removeObserver:self name:ACCPlatformIOKitPowerPlugin_BatteryChargingTypeChanged object:0];

  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformSleepAssertionManager sleepAssertionUUIDs](self, "sleepAssertionUUIDs"));
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      v9 = 0LL;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8LL * (void)v9);
        v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( -[ACCPlatformSleepAssertionManager sleepAssertionUUIDsLock]( self,  "sleepAssertionUUIDsLock"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = __43__ACCPlatformSleepAssertionManager_dealloc__block_invoke;
        block[3] = &unk_1001F96F8;
        block[4] = v10;
        dispatch_sync(v11, block);

        v9 = (char *)v9 + 1;
      }

      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }

    while (v7);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformSleepAssertionManager sleepAssertionTimersForUUIDs](self, "sleepAssertionTimersForUUIDs"));
  [v12 removeAllObjects];

  -[ACCPlatformSleepAssertionManager setSleepAssertionTimersForUUIDs:](self, "setSleepAssertionTimersForUUIDs:", 0LL);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformSleepAssertionManager sleepAssertionUUIDs](self, "sleepAssertionUUIDs"));
  [v13 removeAllObjects];

  -[ACCPlatformSleepAssertionManager setSleepAssertionUUIDs:](self, "setSleepAssertionUUIDs:", 0LL);
  v14.receiver = self;
  v14.super_class = (Class)&OBJC_CLASS___ACCPlatformSleepAssertionManager;
  -[ACCPlatformSleepAssertionManager dealloc](&v14, "dealloc");
}

void __43__ACCPlatformSleepAssertionManager_dealloc__block_invoke(uint64_t a1)
{
  id SleepAssertionPluginInstance = _getSleepAssertionPluginInstance();
  id v3 = (id)objc_claimAutoreleasedReturnValue(SleepAssertionPluginInstance);
  [v3 destroySleepAssertionForUUID:*(void *)(a1 + 32)];
}

- (void)_addSleepAssertionForUUID:(id)a3
{
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 7;
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
    id v7 = (os_log_s *)*(id *)(gLogObjects + 48);
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v55 = (uint64_t)v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[#SleepAssertions] _addSleepAssertionForUUID: uuid %@",  buf,  0xCu);
  }

  if (v4)
  {
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformSleepAssertionManager sleepAssertionUUIDs](self, "sleepAssertionUUIDs"));

    if (!v8)
    {
      v9 = objc_alloc_init(&OBJC_CLASS___NSMutableSet);
      -[ACCPlatformSleepAssertionManager setSleepAssertionUUIDs:](self, "setSleepAssertionUUIDs:", v9);
    }

    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( -[ACCPlatformSleepAssertionManager sleepAssertionTimersForUUIDs]( self,  "sleepAssertionTimersForUUIDs"));

    if (!v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
      -[ACCPlatformSleepAssertionManager setSleepAssertionTimersForUUIDs:]( self,  "setSleepAssertionTimersForUUIDs:",  v11);
    }

    ConnectionWithUUID = acc_manager_getConnectionWithUUID(v4);
    if (ConnectionWithUUID)
    {
      int Type = acc_connection_getType((uint64_t)ConnectionWithUUID);
      BOOL v13 = Type == 4;
    }

    else
    {
      BOOL v13 = 0;
      int Type = 11;
    }

    objc_super v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0LL, 0LL, &_dispatch_main_q);
    dispatch_source_set_timer(v14, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0LL);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472LL;
    handler[2] = __62__ACCPlatformSleepAssertionManager__addSleepAssertionForUUID___block_invoke;
    handler[3] = &unk_1001F9798;
    handler[4] = self;
    id v15 = v4;
    id v53 = v15;
    dispatch_source_set_event_handler(v14, handler);
    dispatch_activate(v14);
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue( -[ACCPlatformSleepAssertionManager sleepAssertionTimersForUUIDs]( self,  "sleepAssertionTimersForUUIDs"));
    [v16 setObject:v14 forKey:v15];

    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformSleepAssertionManager sleepAssertionUUIDs](self, "sleepAssertionUUIDs"));
    [v17 addObject:v15];

    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformSleepAssertionManager sleepAssertionUUIDs](self, "sleepAssertionUUIDs"));
    id v19 = [v18 count];

    if (v19 == (id)1)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v20 addObserver:self selector:"powerInfoChangeNotificationHandler:" name:ACCPlatformIOKitPowerPlugin_IsExternalChargerConnected object:0];

      id ACPowerPluginInstance = _getACPowerPluginInstance();
      v22 = (void *)objc_claimAutoreleasedReturnValue(ACPowerPluginInstance);
      v23 = (void *)objc_claimAutoreleasedReturnValue([v22 createBatteryNotificationClient]);
      -[ACCPlatformSleepAssertionManager setBatteryNotificationClientUUID:]( self,  "setBatteryNotificationClientUUID:",  v23);

      id v24 = _getACPowerPluginInstance();
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      -[ACCPlatformSleepAssertionManager setIsOnAC:]( self,  "setIsOnAC:",  [v25 isExternalChargerConnected]);

      id v26 = _getACPowerPluginInstance();
      v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
      -[ACCPlatformSleepAssertionManager setChargingTypeExternalIsInductive:]( self,  "setChargingTypeExternalIsInductive:",  [v27 getExternalBatteryChargingTypeIsInductive]);
    }

    if (-[ACCPlatformSleepAssertionManager isOnAC](self, "isOnAC")) {
      unsigned int v28 = acc_userDefaults_BOOLForKey((uint64_t)@"IgnoreIsOnAC") ^ 1;
    }
    else {
      unsigned int v28 = 0;
    }
    if (gLogObjects && gNumLogObjects >= 7)
    {
      v29 = (os_log_s *)*(id *)(gLogObjects + 48);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      v29 = (os_log_s *)&_os_log_default;
      id v30 = &_os_log_default;
    }

    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v31 = -[ACCPlatformSleepAssertionManager isOnAC](self, "isOnAC");
      unsigned int v32 = -[ACCPlatformSleepAssertionManager chargingTypeExternalIsInductive](self, "chargingTypeExternalIsInductive");
      *(_DWORD *)buf = 138413314;
      uint64_t v55 = (uint64_t)v15;
      __int16 v56 = 1024;
      unsigned int v57 = v31;
      __int16 v58 = 1024;
      unsigned int v59 = v28;
      __int16 v60 = 1024;
      unsigned int v61 = v32;
      __int16 v62 = 1024;
      BOOL v63 = v13;
      _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "[#SleepAssertions] Addded sleep assertion timer for uuid %@, isOnAC %d -> %d, chargingTypeExternalIsInductive %d , bIsInductiveConnection %d",  buf,  0x24u);
    }

    if (v28
      && !-[ACCPlatformSleepAssertionManager chargingTypeExternalIsInductive](self, "chargingTypeExternalIsInductive"))
    {
      id SleepAssertionPluginInstance = _getSleepAssertionPluginInstance();
      v48 = (void *)objc_claimAutoreleasedReturnValue(SleepAssertionPluginInstance);
      [v48 createSleepAssertionForUUID:v15];

      if ((v13 | platform_systemInfo_isWatch()) != 1)
      {
LABEL_44:
        if (gLogObjects && gNumLogObjects >= 7)
        {
          v44 = (os_log_s *)*(id *)(gLogObjects + 48);
        }

        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
          v44 = (os_log_s *)&_os_log_default;
          id v45 = &_os_log_default;
        }

        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformSleepAssertionManager sleepAssertionUUIDs](self, "sleepAssertionUUIDs"));
          *(_DWORD *)buf = 138412290;
          uint64_t v55 = (uint64_t)v46;
          _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_INFO,  "[#SleepAssertions] sleepAssertionUUIDs: %@",  buf,  0xCu);
        }

        goto LABEL_53;
      }

      if (gLogObjects && gNumLogObjects >= 7)
      {
        id v35 = *(id *)(gLogObjects + 48);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        id v35 = &_os_log_default;
        id v49 = &_os_log_default;
      }

      int64_t v37 = 300000000000LL;
      if (!os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_DEFAULT))
      {
LABEL_43:

        v41 = (void *)objc_claimAutoreleasedReturnValue( -[ACCPlatformSleepAssertionManager sleepAssertionTimersForUUIDs]( self,  "sleepAssertionTimersForUUIDs"));
        v42 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v41 objectForKey:v15]);
        dispatch_time_t v43 = dispatch_time(0LL, v37);
        dispatch_source_set_timer(v42, v43, 0xFFFFFFFFFFFFFFFFLL, 0LL);

        goto LABEL_44;
      }

      unsigned int v50 = -[ACCPlatformSleepAssertionManager chargingTypeExternalIsInductive](self, "chargingTypeExternalIsInductive");
      *(_DWORD *)buf = 134218496;
      uint64_t v55 = 300LL;
      __int16 v56 = 1024;
      unsigned int v57 = Type;
      __int16 v58 = 1024;
      unsigned int v59 = v50;
      v38 = "[#SleepAssertions] Holding sleep assertion for [%lld] secs on connectionType:%{coreacc:ACCConnection_Type_t}"
            "d, externalIsInductive %d";
      v39 = (os_log_s *)v35;
      uint32_t v40 = 24;
    }

    else
    {
      id v33 = _getSleepAssertionPluginInstance();
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      [v34 createSleepAssertionForUUID:v15];

      if (gLogObjects && gNumLogObjects >= 7)
      {
        id v35 = *(id *)(gLogObjects + 48);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        id v35 = &_os_log_default;
        id v36 = &_os_log_default;
      }

      int64_t v37 = 5000000000LL;
      if (!os_log_type_enabled((os_log_t)v35, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_43;
      }
      *(_DWORD *)buf = 134218240;
      uint64_t v55 = 5LL;
      __int16 v56 = 1024;
      unsigned int v57 = Type;
      v38 = "[#SleepAssertions] Holding temporary sleep assertion for [%lld] secs on connectionType:%{coreacc:ACCConnection_Type_t}d";
      v39 = (os_log_s *)v35;
      uint32_t v40 = 18;
    }

    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, v38, buf, v40);
    goto LABEL_43;
  }

void __62__ACCPlatformSleepAssertionManager__addSleepAssertionForUUID___block_invoke(uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 7;
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
    id v4 = (os_log_s *)*(id *)(gLogObjects + 48);
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[#SleepAssertions] Sleep assertion timer fired!!  Cleaning up held sleep assertion.",  v7,  2u);
  }

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) sleepAssertionTimersForUUIDs]);
  id v6 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue([v5 objectForKey:*(void *)(a1 + 40)]);

  if (v6) {
    dispatch_source_set_timer(v6, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0LL);
  }
  [*(id *)(a1 + 32) removeExpiredSleepAssertionForUUID:*(void *)(a1 + 40)];
}

- (void)addSleepAssertionForUUID:(id)a3
{
  id v4 = a3;
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 7;
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
    id v7 = (os_log_s *)*(id *)(gLogObjects + 48);
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[#SleepAssertions] addSleepAssertionForUUID: uuid %@",  buf,  0xCu);
  }

  if (v4)
  {
    uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( -[ACCPlatformSleepAssertionManager sleepAssertionUUIDsLock]( self,  "sleepAssertionUUIDsLock"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472LL;
    v9[2] = __61__ACCPlatformSleepAssertionManager_addSleepAssertionForUUID___block_invoke;
    v9[3] = &unk_1001F9798;
    v9[4] = self;
    id v10 = v4;
    dispatch_sync(v8, v9);
  }
}

id __61__ACCPlatformSleepAssertionManager_addSleepAssertionForUUID___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addSleepAssertionForUUID:*(void *)(a1 + 40)];
}

- (void)_removeSleepAssertionForUUID:(id)a3 expiredOnly:(BOOL)a4
{
  id v7 = a3;
  if (v7)
  {
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( -[ACCPlatformSleepAssertionManager sleepAssertionUUIDsLock]( self,  "sleepAssertionUUIDsLock"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __77__ACCPlatformSleepAssertionManager__removeSleepAssertionForUUID_expiredOnly___block_invoke;
    block[3] = &unk_1001F97C0;
    id v9 = v7;
    id v10 = self;
    BOOL v11 = a4;
    dispatch_sync(v6, block);
  }
}

void __77__ACCPlatformSleepAssertionManager__removeSleepAssertionForUUID_expiredOnly___block_invoke( uint64_t a1)
{
  if (gLogObjects) {
    BOOL v2 = gNumLogObjects < 7;
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
    id v4 = (os_log_s *)*(id *)(gLogObjects + 48);
  }

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = *(void **)(a1 + 32);
    int v19 = 138412290;
    v20 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "[#SleepAssertions] Remove sleep assertion timer for uuid %@",  (uint8_t *)&v19,  0xCu);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) sleepAssertionTimersForUUIDs]);
  [v6 removeObjectForKey:*(void *)(a1 + 32)];

  if (!*(_BYTE *)(a1 + 48))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) sleepAssertionUUIDs]);
    [v7 removeObject:*(void *)(a1 + 32)];
  }

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) sleepAssertionUUIDs]);
  id v9 = [v8 count];

  if (!v9)
  {
    id ACPowerPluginInstance = _getACPowerPluginInstance();
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(ACPowerPluginInstance);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) batteryNotificationClientUUID]);
    [v11 destroyBatteryNotificationsForClient:v12];

    [*(id *)(a1 + 40) setBatteryNotificationClientUUID:0];
    BOOL v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    [v13 removeObserver:*(void *)(a1 + 40) name:ACCPlatformIOKitPowerPlugin_IsExternalChargerConnected object:0];
  }

  id SleepAssertionPluginInstance = _getSleepAssertionPluginInstance();
  id v15 = (void *)objc_claimAutoreleasedReturnValue(SleepAssertionPluginInstance);
  [v15 destroySleepAssertionForUUID:*(void *)(a1 + 32)];

  if (gLogObjects && gNumLogObjects >= 7)
  {
    __int128 v16 = (os_log_s *)*(id *)(gLogObjects + 48);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    __int128 v16 = (os_log_s *)&_os_log_default;
    id v17 = &_os_log_default;
  }

  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) sleepAssertionUUIDs]);
    int v19 = 138412290;
    v20 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_INFO,  "[#SleepAssertions] sleepAssertionUUIDs: %@",  (uint8_t *)&v19,  0xCu);
  }
}

- (void)removeExpiredSleepAssertionForUUID:(id)a3
{
}

- (void)removeSleepAssertionForUUID:(id)a3
{
}

- (void)powerInfoChangeNotificationHandler:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 name]);
  if (([v4 isEqualToString:ACCPlatformIOKitPowerPlugin_IsExternalChargerConnected] & 1) != 0
    || [v4 isEqualToString:ACCPlatformIOKitPowerPlugin_BatteryChargingTypeChanged])
  {
    unsigned int v5 = -[ACCPlatformSleepAssertionManager isOnAC](self, "isOnAC");
    unsigned int v6 = -[ACCPlatformSleepAssertionManager chargingTypeExternalIsInductive](self, "chargingTypeExternalIsInductive");
    id ACPowerPluginInstance = _getACPowerPluginInstance();
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(ACPowerPluginInstance);
    -[ACCPlatformSleepAssertionManager setIsOnAC:](self, "setIsOnAC:", [v8 isExternalChargerConnected]);

    id v9 = _getACPowerPluginInstance();
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    -[ACCPlatformSleepAssertionManager setChargingTypeExternalIsInductive:]( self,  "setChargingTypeExternalIsInductive:",  [v10 getExternalBatteryChargingTypeIsInductive]);

    if (gLogObjects && gNumLogObjects >= 7)
    {
      BOOL v11 = (os_log_s *)*(id *)(gLogObjects + 48);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      BOOL v11 = (os_log_s *)&_os_log_default;
      id v12 = &_os_log_default;
    }

    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v13 = 138413314;
      objc_super v14 = v4;
      __int16 v15 = 1024;
      unsigned int v16 = -[ACCPlatformSleepAssertionManager isOnAC](self, "isOnAC");
      __int16 v17 = 1024;
      unsigned int v18 = v5;
      __int16 v19 = 1024;
      unsigned int v20 = -[ACCPlatformSleepAssertionManager chargingTypeExternalIsInductive](self, "chargingTypeExternalIsInductive");
      __int16 v21 = 1024;
      unsigned int v22 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "[#SleepAssertions] Received notification: %@, isOnAC: %d, oldVal: %d, chargingTypeExternalIsInductive: %d, oldEx tInductive: %d\n",  (uint8_t *)&v13,  0x24u);
    }

    if (v5 != -[ACCPlatformSleepAssertionManager isOnAC](self, "isOnAC")
      || v6 != -[ACCPlatformSleepAssertionManager chargingTypeExternalIsInductive]( self,  "chargingTypeExternalIsInductive"))
    {
      -[ACCPlatformSleepAssertionManager updateAssertions](self, "updateAssertions");
    }
  }
}

- (void)updateAssertions
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue( -[ACCPlatformSleepAssertionManager sleepAssertionUUIDsLock]( self,  "sleepAssertionUUIDsLock"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __52__ACCPlatformSleepAssertionManager_updateAssertions__block_invoke;
  block[3] = &unk_1001F96F8;
  void block[4] = self;
  dispatch_sync(v3, block);
}

void __52__ACCPlatformSleepAssertionManager_updateAssertions__block_invoke(uint64_t a1)
{
  id SleepAssertionPluginInstance = _getSleepAssertionPluginInstance();
  dispatch_time_t v43 = (void *)objc_claimAutoreleasedReturnValue(SleepAssertionPluginInstance);
  else {
    unsigned int v3 = 0;
  }
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 7;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    unsigned int v6 = (os_log_s *)&_os_log_default;
    id v5 = &_os_log_default;
  }

  else
  {
    unsigned int v6 = (os_log_s *)*(id *)(gLogObjects + 48);
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = [*(id *)(a1 + 32) isOnAC];
    unsigned int v8 = [*(id *)(a1 + 32) chargingTypeExternalIsInductive];
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)id v49 = v7;
    *(_WORD *)&v49[4] = 1024;
    *(_DWORD *)&v49[6] = v3;
    LOWORD(v50) = 1024;
    *(_DWORD *)((char *)&v50 + 2) = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "[#SleepAssertions] updateAssertions: isOnAC %d -> %d, chargingTypeExternalIsInductive %d",  buf,  0x14u);
  }

  id v9 = objc_alloc(&OBJC_CLASS___NSSet);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) sleepAssertionUUIDs]);
  BOOL v11 = -[NSSet initWithSet:copyItems:](v9, "initWithSet:copyItems:", v10, 0LL);

  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v44 = 0u;
  __int128 v45 = 0u;
  obj = v11;
  id v12 = -[NSSet countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v44,  v51,  16LL);
  if (v12)
  {
    id v14 = v12;
    uint64_t v15 = *(void *)v45;
    *(void *)&__int128 v13 = 134218240LL;
    __int128 v41 = v13;
    do
    {
      unsigned int v16 = 0LL;
      do
      {
        if (*(void *)v45 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v44 + 1) + 8LL * (void)v16);
        unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "sleepAssertionTimersForUUIDs", v41));
        __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 objectForKey:v17]);

        if (v19
          || ([*(id *)(a1 + 32) _addSleepAssertionForUUID:v17],
              unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) sleepAssertionTimersForUUIDs]),
              __int16 v19 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 objectForKey:v17]),
              v20,
              v19))
        {
          if (!v3 || ([*(id *)(a1 + 32) chargingTypeExternalIsInductive] & 1) != 0)
          {
            [v43 destroySleepAssertionForUUID:v17];
            uint64_t v21 = gLogObjects;
            int v22 = gNumLogObjects;
            if (gLogObjects && gNumLogObjects >= 7)
            {
              v23 = (os_log_s *)*(id *)(gLogObjects + 48);
            }

            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v41;
                *(void *)id v49 = v21;
                *(_WORD *)&v49[8] = 1024;
                LODWORD(v50) = v22;
                _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d",  buf,  0x12u);
              }

              id v24 = &_os_log_default;
              v23 = (os_log_s *)&_os_log_default;
            }

            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)id v49 = v17;
              v25 = v23;
              id v26 = "[#SleepAssertions] Disable sleep assertion for uuid %@";
              goto LABEL_31;
            }

            goto LABEL_32;
          }

          [v43 createSleepAssertionForUUID:v17];
          unsigned int v29 = platform_systemInfo_isWatch();
          uint64_t v30 = gLogObjects;
          int v31 = gNumLogObjects;
          if (gLogObjects) {
            BOOL v32 = gNumLogObjects <= 6;
          }
          else {
            BOOL v32 = 1;
          }
          int v33 = !v32;
          if (v29)
          {
            if (v33)
            {
              v34 = (os_log_s *)*(id *)(gLogObjects + 48);
            }

            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v41;
                *(void *)id v49 = v30;
                *(_WORD *)&v49[8] = 1024;
                LODWORD(v50) = v31;
                _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d",  buf,  0x12u);
              }

              id v38 = &_os_log_default;
              v34 = (os_log_s *)&_os_log_default;
            }

            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218242;
              *(void *)id v49 = 300LL;
              *(_WORD *)&v49[8] = 2112;
              uint64_t v50 = v17;
              _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "[#SleepAssertions] Holding sleep assertion for [%lld] secs for uuid %@",  buf,  0x16u);
            }

            dispatch_time_t v28 = dispatch_time(0LL, 300000000000LL);
            v27 = (dispatch_source_s *)v19;
          }

          else
          {
            if (v33)
            {
              v23 = (os_log_s *)*(id *)(gLogObjects + 48);
            }

            else
            {
              if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v41;
                *(void *)id v49 = v30;
                *(_WORD *)&v49[8] = 1024;
                LODWORD(v50) = v31;
                _os_log_error_impl( (void *)&_mh_execute_header,  (os_log_t)&_os_log_default,  OS_LOG_TYPE_ERROR,  "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d",  buf,  0x12u);
              }

              id v39 = &_os_log_default;
              v23 = (os_log_s *)&_os_log_default;
            }

            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)id v49 = v17;
              v25 = v23;
              id v26 = "[#SleepAssertions] Holding sleep assertion (no timeout) for uuid %@";
LABEL_31:
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v26, buf, 0xCu);
            }

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __49__ACCPlatformSleepAssertionManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedManager_once != -1) {
    dispatch_once(&sharedManager_once, block);
  }
  return (id)sharedManager_sharedInstance;
}

void __49__ACCPlatformSleepAssertionManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  BOOL v2 = (void *)sharedManager_sharedInstance;
  sharedManager_sharedInstance = (uint64_t)v1;
}

- (NSMutableSet)sleepAssertionUUIDs
{
  return self->_sleepAssertionUUIDs;
}

- (void)setSleepAssertionUUIDs:(id)a3
{
}

- (NSMutableDictionary)sleepAssertionTimersForUUIDs
{
  return self->_sleepAssertionTimersForUUIDs;
}

- (void)setSleepAssertionTimersForUUIDs:(id)a3
{
}

- (OS_dispatch_queue)sleepAssertionUUIDsLock
{
  return self->_sleepAssertionUUIDsLock;
}

- (void)setSleepAssertionUUIDsLock:(id)a3
{
}

- (BOOL)isOnAC
{
  return self->_isOnAC;
}

- (void)setIsOnAC:(BOOL)a3
{
  self->_isOnAC = a3;
}

- (BOOL)chargingTypeExternalIsInductive
{
  return self->_chargingTypeExternalIsInductive;
}

- (void)setChargingTypeExternalIsInductive:(BOOL)a3
{
  self->_chargingTypeExternalIsInductive = a3;
}

- (NSString)batteryNotificationClientUUID
{
  return self->_batteryNotificationClientUUID;
}

- (void)setBatteryNotificationClientUUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end