@interface ACCPlatformPowerManager
+ (id)sharedManager;
- (ACCPlatformPowerManager)init;
- (NSMutableDictionary)powerAccessories;
- (void)addAccessoryForEndpointUID:(id)a3 andBitmask:(unint64_t)a4 andOldBitmask:(unint64_t)a5;
- (void)removeAccessoryForEndpointUID:(id)a3;
- (void)setPowerAccessories:(id)a3;
@end

@implementation ACCPlatformPowerManager

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __40__ACCPlatformPowerManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once_1 != -1) {
    dispatch_once(&sharedManager_once_1, block);
  }
  return (id)sharedManager_sharedInstance_1;
}

void __40__ACCPlatformPowerManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_sharedInstance_1;
  sharedManager_sharedInstance_1 = (uint64_t)v1;
}

- (ACCPlatformPowerManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ACCPlatformPowerManager;
  v2 = -[ACCPlatformPowerManager init](&v5, "init");
  if (v2)
  {
    v3 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    -[ACCPlatformPowerManager setPowerAccessories:](v2, "setPowerAccessories:", v3);
  }

  return v2;
}

- (void)addAccessoryForEndpointUID:(id)a3 andBitmask:(unint64_t)a4 andOldBitmask:(unint64_t)a5
{
  id v7 = a3;
  if (gLogObjects) {
    BOOL v8 = gNumLogObjects < 8;
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
    v10 = (os_log_s *)*(id *)(gLogObjects + 56);
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v18 = 138412802;
    id v19 = v7;
    __int16 v20 = 2048;
    unint64_t v21 = a4;
    __int16 v22 = 2048;
    unint64_t v23 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_INFO,  "[#Power] addAccessoryForEndpointUID: endpointUID %@, updateTypesBitMask %llx, oldUpdateTypesBitmask %llx",  (uint8_t *)&v18,  0x20u);
  }

  if (v7)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[ACCPlatformPowerManager sharedManager](&OBJC_CLASS___ACCPlatformPowerManager, "sharedManager"));
    v12 = (void *)objc_claimAutoreleasedReturnValue([v11 powerAccessories]);
    v13 = (ACCPlatformPowerInfo *)objc_claimAutoreleasedReturnValue([v12 objectForKey:v7]);

    if (v13)
    {
      -[ACCPlatformPowerInfo stopPowerUpdates](v13, "stopPowerUpdates");
      -[ACCPlatformPowerInfo setUpdateTypesBitmask:](v13, "setUpdateTypesBitmask:", a4);
      -[ACCPlatformPowerInfo setOldUpdateTypesBitmask:](v13, "setOldUpdateTypesBitmask:", a5);
      v14 = (void *)objc_claimAutoreleasedReturnValue( -[ACCPlatformPowerInfo applePencilBatteryNotificationClientUUID]( v13,  "applePencilBatteryNotificationClientUUID"));

      if (!v14)
      {
LABEL_20:
        -[ACCPlatformPowerInfo startPowerUpdates](v13, "startPowerUpdates");
        goto LABEL_26;
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
      [v15 addObserver:v13 selector:"powerInfoChangeNotificationHandler:" name:ACCPlatformIOKitPowerPlugin_BatteryChargeLevel object:0];
    }

    else
    {
      v13 = -[ACCPlatformPowerInfo initWithEndpointUID:andBitmask:andOldBitmask:]( objc_alloc(&OBJC_CLASS___ACCPlatformPowerInfo),  "initWithEndpointUID:andBitmask:andOldBitmask:",  v7,  a4,  a5);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[ACCPlatformPowerManager sharedManager](&OBJC_CLASS___ACCPlatformPowerManager, "sharedManager"));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 powerAccessories]);
      [v16 setObject:v13 forKey:v7];
    }

    goto LABEL_20;
  }

  if (gLogObjects && gNumLogObjects >= 8)
  {
    v13 = (ACCPlatformPowerInfo *)*(id *)(gLogObjects + 56);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v13 = (ACCPlatformPowerInfo *)&_os_log_default;
    id v17 = &_os_log_default;
  }

  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = 0LL;
    _os_log_impl( (void *)&_mh_execute_header,  (os_log_t)v13,  OS_LOG_TYPE_DEFAULT,  "[#Power] addAccessoryForEndpointUID, invalid endpointUID passed in! endpointUID=%@",  (uint8_t *)&v18,  0xCu);
  }

- (void)removeAccessoryForEndpointUID:(id)a3
{
  id v8 = a3;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ACCPlatformPowerManager sharedManager](&OBJC_CLASS___ACCPlatformPowerManager, "sharedManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue([v3 powerAccessories]);
  objc_super v5 = (void *)objc_claimAutoreleasedReturnValue([v4 objectForKey:v8]);

  if (v5)
  {
    [v5 stopPowerUpdates];
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[ACCPlatformPowerManager sharedManager](&OBJC_CLASS___ACCPlatformPowerManager, "sharedManager"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 powerAccessories]);
    [v7 removeObjectForKey:v8];
  }
}

- (NSMutableDictionary)powerAccessories
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setPowerAccessories:(id)a3
{
}

- (void).cxx_destruct
{
}

@end