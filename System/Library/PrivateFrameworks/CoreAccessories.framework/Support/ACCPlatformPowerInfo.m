@interface ACCPlatformPowerInfo
- (ACCPlatformPowerInfo)initWithEndpointUID:(id)a3 andBitmask:(unint64_t)a4 andOldBitmask:(unint64_t)a5;
- (ACCPowerManager)accessoryPowerManager;
- (ACCPowerSiphoningControl)siphoningControl;
- (BOOL)holdingApplePencilSleepAssertion;
- (BOOL)isDeviceBatteryCharging;
- (BOOL)isExternalChargerConnected;
- (BOOL)isFirstSent_AccessoryChargingCurrent;
- (BOOL)isFirstSent_AvailableCurrent;
- (BOOL)isFirstSent_BatteryChargeLevel;
- (BOOL)isFirstSent_BatteryChargingState;
- (BOOL)isFirstSent_DeviceBatteryCharging;
- (BOOL)isFirstSent_ExternalChargerConnected;
- (BOOL)isOldUpdateTypeEnabled:(int)a3;
- (BOOL)isUpdateTypeEnabled:(int)a3;
- (BOOL)powerUpdateSentDueToSleep;
- (BOOL)requestSleepUpdate;
- (BOOL)systemAsleep;
- (NSString)applePencilBatteryNotificationClientUUID;
- (NSString)batteryNotificationClientUUID;
- (NSString)connectionUID;
- (NSString)endpointUID;
- (NSString)sleepNotificationClientUUID;
- (int)batteryChargingState;
- (unint64_t)oldUpdateTypesBitmask;
- (unint64_t)updateTypesBitmask;
- (unsigned)accessoryChargingCurrent;
- (unsigned)availableCurrent;
- (unsigned)batteryChargeLevel;
- (void)dealloc;
- (void)powerInfoChangeNotificationHandler:(id)a3;
- (void)setAccessoryChargingCurrent:(unsigned __int16)a3;
- (void)setApplePencilBatteryNotificationClientUUID:(id)a3;
- (void)setBatteryNotificationClientUUID:(id)a3;
- (void)setHoldingApplePencilSleepAssertion:(BOOL)a3;
- (void)setOldUpdateTypesBitmask:(unint64_t)a3;
- (void)setPowerUpdateSentDueToSleep:(BOOL)a3;
- (void)setRequestSleepUpdate:(BOOL)a3;
- (void)setSleepNotificationClientUUID:(id)a3;
- (void)setSystemAsleep:(BOOL)a3;
- (void)setUpdateTypesBitmask:(unint64_t)a3;
- (void)startPowerUpdates;
- (void)startSiphoningControl;
- (void)stopPowerUpdates;
- (void)systemHasPoweredOnNotificationHandler:(id)a3;
- (void)systemWillSleepNotificationHandler:(id)a3;
@end

@implementation ACCPlatformPowerInfo

- (ACCPlatformPowerInfo)initWithEndpointUID:(id)a3 andBitmask:(unint64_t)a4 andOldBitmask:(unint64_t)a5
{
  id v9 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___ACCPlatformPowerInfo;
  v10 = -[ACCPlatformPowerInfo init](&v20, "init");
  if (v10)
  {
    EndpointWithUUID = (void ***)acc_manager_getEndpointWithUUID(v9);
    objc_storeStrong((id *)v10 + 4, a3);
    else {
      v12 = 0LL;
    }
    objc_storeStrong((id *)v10 + 5, v12);
    [v10 setUpdateTypesBitmask:a4];
    [v10 setOldUpdateTypesBitmask:a5];
    v13 = (void *)*((void *)v10 + 7);
    *((void *)v10 + 7) = 0LL;

    *(_WORD *)(v10 + 15) = 0;
    *(_DWORD *)(v10 + 11) = 0;
    v14 = objc_alloc_init(&OBJC_CLASS___ACCPowerManager);
    v15 = (void *)*((void *)v10 + 6);
    *((void *)v10 + 6) = v14;

    v10[17] = 0;
    v16 = (void *)*((void *)v10 + 10);
    *((void *)v10 + 10) = 0LL;

    v10[18] = 0;
    v17 = (void *)*((void *)v10 + 11);
    *((void *)v10 + 11) = 0LL;

    v18 = (void *)*((void *)v10 + 12);
    *((void *)v10 + 12) = 0LL;

    v10[19] = 0;
  }

  return (ACCPlatformPowerInfo *)v10;
}

- (void)dealloc
{
  endpointUID = self->_endpointUID;
  self->_endpointUID = 0LL;

  siphoningControl = self->_siphoningControl;
  self->_siphoningControl = 0LL;

  accessoryPowerManager = self->_accessoryPowerManager;
  self->_accessoryPowerManager = 0LL;

  -[ACCPlatformPowerInfo setUpdateTypesBitmask:](self, "setUpdateTypesBitmask:", 0LL);
  -[ACCPlatformPowerInfo setOldUpdateTypesBitmask:](self, "setOldUpdateTypesBitmask:", 0LL);
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___ACCPlatformPowerInfo;
  -[ACCPlatformPowerInfo dealloc](&v6, "dealloc");
}

- (void)startSiphoningControl
{
  if (!self->_siphoningControl)
  {
    v3 = -[ACCPowerSiphoningControl initWithDelegate:]( objc_alloc(&OBJC_CLASS___ACCPowerSiphoningControl),  "initWithDelegate:",  self);
    siphoningControl = self->_siphoningControl;
    self->_siphoningControl = v3;
  }

- (BOOL)isUpdateTypeEnabled:(int)a3
{
  return (-[ACCPlatformPowerInfo updateTypesBitmask](self, "updateTypesBitmask") & (1 << a3)) != 0;
}

- (BOOL)isOldUpdateTypeEnabled:(int)a3
{
  return (-[ACCPlatformPowerInfo oldUpdateTypesBitmask](self, "oldUpdateTypesBitmask") & (1 << a3)) != 0;
}

- (void)startPowerUpdates
{
  v4[0] = 67111424;
  v4[1] = 3;
  __int16 v5 = 1024;
  unsigned int v6 = [a1 isUpdateTypeEnabled:3];
  __int16 v7 = 1024;
  int v8 = 8;
  __int16 v9 = 1024;
  unsigned int v10 = [a1 isUpdateTypeEnabled:8];
  __int16 v11 = 1024;
  int v12 = 9;
  __int16 v13 = 1024;
  unsigned int v14 = [a1 isUpdateTypeEnabled:9];
  __int16 v15 = 1024;
  int v16 = 10;
  __int16 v17 = 1024;
  unsigned int v18 = [a1 isUpdateTypeEnabled:10];
  __int16 v19 = 1024;
  int v20 = 11;
  __int16 v21 = 1024;
  unsigned int v22 = [a1 isUpdateTypeEnabled:11];
  _os_log_debug_impl( (void *)&_mh_execute_header,  a2,  OS_LOG_TYPE_DEBUG,  "[#Power] startSiphoningControl %d:%d %d:%d %d:%d %d:%d %d:%d",  (uint8_t *)v4,  0x3Eu);
}

- (void)stopPowerUpdates
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  [v3 removeObserver:self];

  if (-[ACCPlatformPowerInfo isUpdateTypeEnabled:](self, "isUpdateTypeEnabled:", 7LL))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformPowerInfo sleepNotificationClientUUID](self, "sleepNotificationClientUUID"));

    if (v4)
    {
      id IOKitPowerPluginInstance = _getIOKitPowerPluginInstance();
      unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(IOKitPowerPluginInstance);
      __int16 v7 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformPowerInfo sleepNotificationClientUUID](self, "sleepNotificationClientUUID"));
      [v6 destroySleepNotificationsForClient:v7];

      -[ACCPlatformPowerInfo setSleepNotificationClientUUID:](self, "setSleepNotificationClientUUID:", 0LL);
    }
  }

  else if (-[ACCPlatformPowerInfo isUpdateTypeEnabled:](self, "isUpdateTypeEnabled:", 4LL) {
         || -[ACCPlatformPowerInfo isUpdateTypeEnabled:](self, "isUpdateTypeEnabled:", 5LL)
  }
         || -[ACCPlatformPowerInfo isUpdateTypeEnabled:](self, "isUpdateTypeEnabled:", 6LL))
  {
    id v8 = _getIOKitPowerPluginInstance();
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformPowerInfo batteryNotificationClientUUID](self, "batteryNotificationClientUUID"));
    [v9 destroyBatteryNotificationsForClient:v10];

    -[ACCPlatformPowerInfo setBatteryNotificationClientUUID:](self, "setBatteryNotificationClientUUID:", 0LL);
  }

- (void)systemWillSleepNotificationHandler:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 name]);
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 8;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    __int16 v7 = (os_log_s *)&_os_log_default;
    id v6 = &_os_log_default;
  }

  else
  {
    __int16 v7 = (os_log_s *)*(id *)(gLogObjects + 56);
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformPowerInfo endpointUID](self, "endpointUID"));
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformPowerInfo connectionUID](self, "connectionUID"));
    int v28 = 138412802;
    *(void *)v29 = v4;
    *(_WORD *)&v29[8] = 2112;
    v30 = v8;
    __int16 v31 = 2112;
    v32 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "[#Power] Received notification: %@, endpointUUID: %@\n, connectionUUID: %@\n",  (uint8_t *)&v28,  0x20u);
  }

  -[ACCPlatformPowerInfo setSystemAsleep:](self, "setSystemAsleep:", 1LL);
  if (-[ACCPlatformPowerInfo requestSleepUpdate](self, "requestSleepUpdate")) {
    platform_power_sendSleepUpdate(-[ACCPlatformPowerInfo endpointUID](self, "endpointUID"));
  }
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformPowerInfo endpointUID](self, "endpointUID"));
  unsigned int v11 = platform_power_powerDuringSleepEnabled(v10);

  if (v11)
  {
    int v12 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformPowerInfo endpointUID](self, "endpointUID"));
    BOOL isModelNumberConnected = _isModelNumberConnected(v12, @"A1603");

    if (isModelNumberConnected)
    {
      unsigned int v14 = -[ACCPlatformPowerInfo accessoryChargingCurrent](self, "accessoryChargingCurrent");
      id PowerPluginInstance = _getPowerPluginInstance();
      int v16 = (void *)objc_claimAutoreleasedReturnValue(PowerPluginInstance);
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformPowerInfo connectionUID](self, "connectionUID"));
      -[ACCPlatformPowerInfo setAccessoryChargingCurrent:]( self,  "setAccessoryChargingCurrent:",  (unsigned __int16)[v16 sleepPowerCurrentLimitInmA:v17]);

      if (gLogObjects && gNumLogObjects >= 8)
      {
        unsigned int v18 = (os_log_s *)*(id *)(gLogObjects + 56);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        unsigned int v18 = (os_log_s *)&_os_log_default;
        id v22 = &_os_log_default;
      }

      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v23 = -[ACCPlatformPowerInfo accessoryChargingCurrent](self, "accessoryChargingCurrent");
        int v28 = 67109376;
        *(_DWORD *)v29 = v14;
        *(_WORD *)&v29[4] = 1024;
        *(_DWORD *)&v29[6] = v23;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[#Power] systemWillSleepNotificationHandler oldLimit: %d, accessoryChargingCurrent: %d\n",  (uint8_t *)&v28,  0xEu);
      }

      if (v14 != -[ACCPlatformPowerInfo accessoryChargingCurrent](self, "accessoryChargingCurrent"))
      {
        if (gLogObjects && gNumLogObjects >= 8)
        {
          v24 = (os_log_s *)*(id *)(gLogObjects + 56);
        }

        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
          v24 = (os_log_s *)&_os_log_default;
          id v25 = &_os_log_default;
        }

        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v26 = -[ACCPlatformPowerInfo accessoryChargingCurrent](self, "accessoryChargingCurrent");
          unsigned int v27 = -[ACCPlatformPowerInfo accessoryChargingCurrent](self, "accessoryChargingCurrent");
          int v28 = 67109632;
          *(_DWORD *)v29 = 7;
          *(_WORD *)&v29[4] = 1024;
          *(_DWORD *)&v29[6] = v26;
          LOWORD(v30) = 1024;
          *(_DWORD *)((char *)&v30 + 2) = v27;
          _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "[#Power] Sending Power Update (for sleep): %d: %d->%d\n",  (uint8_t *)&v28,  0x14u);
        }

        platform_power_sendPowerUpdate( -[ACCPlatformPowerInfo endpointUID](self, "endpointUID"),  7,  -[ACCPlatformPowerInfo accessoryChargingCurrent](self, "accessoryChargingCurrent"),  13,  0);
        -[ACCPlatformPowerInfo setPowerUpdateSentDueToSleep:](self, "setPowerUpdateSentDueToSleep:", 1LL);
      }
    }

    else
    {
      id IOKitPowerPluginInstance = _getIOKitPowerPluginInstance();
      int v20 = (void *)objc_claimAutoreleasedReturnValue(IOKitPowerPluginInstance);
      __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformPowerInfo sleepNotificationClientUUID](self, "sleepNotificationClientUUID"));
      [v20 clientHandledSleepNotification:v21];
    }
  }
}

- (void)systemHasPoweredOnNotificationHandler:(id)a3
{
  v4 = (void *)objc_claimAutoreleasedReturnValue([a3 name]);
  if (gLogObjects) {
    BOOL v5 = gNumLogObjects < 8;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    __int16 v7 = (os_log_s *)&_os_log_default;
    id v6 = &_os_log_default;
  }

  else
  {
    __int16 v7 = (os_log_s *)*(id *)(gLogObjects + 56);
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformPowerInfo endpointUID](self, "endpointUID"));
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformPowerInfo connectionUID](self, "connectionUID"));
    int v24 = 138412802;
    *(void *)id v25 = v4;
    *(_WORD *)&v25[8] = 2112;
    unsigned int v26 = v8;
    __int16 v27 = 2112;
    int v28 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "[#Power] Received notification: %@, endpointUUID: %@\n, connectionUUID: %@\n",  (uint8_t *)&v24,  0x20u);
  }

  -[ACCPlatformPowerInfo setSystemAsleep:](self, "setSystemAsleep:", 0LL);
  if (-[ACCPlatformPowerInfo requestSleepUpdate](self, "requestSleepUpdate")) {
    platform_power_sendWakeUpdate(-[ACCPlatformPowerInfo endpointUID](self, "endpointUID"));
  }
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformPowerInfo endpointUID](self, "endpointUID"));
  unsigned int v11 = platform_power_powerDuringSleepEnabled(v10);

  if (v11)
  {
    int v12 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformPowerInfo endpointUID](self, "endpointUID"));
    BOOL isModelNumberConnected = _isModelNumberConnected(v12, @"A1603");

    if (isModelNumberConnected)
    {
      unsigned int v14 = -[ACCPlatformPowerInfo accessoryChargingCurrent](self, "accessoryChargingCurrent");
      id PowerPluginInstance = _getPowerPluginInstance();
      int v16 = (void *)objc_claimAutoreleasedReturnValue(PowerPluginInstance);
      __int16 v17 = (void *)objc_claimAutoreleasedReturnValue(-[ACCPlatformPowerInfo connectionUID](self, "connectionUID"));
      -[ACCPlatformPowerInfo setAccessoryChargingCurrent:]( self,  "setAccessoryChargingCurrent:",  (unsigned __int16)[v16 accessoryChargingCurrentInmA:v17]);

      if (gLogObjects && gNumLogObjects >= 8)
      {
        unsigned int v18 = (os_log_s *)*(id *)(gLogObjects + 56);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        unsigned int v18 = (os_log_s *)&_os_log_default;
        id v19 = &_os_log_default;
      }

      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v20 = -[ACCPlatformPowerInfo accessoryChargingCurrent](self, "accessoryChargingCurrent");
        int v24 = 67109376;
        *(_DWORD *)id v25 = v14;
        *(_WORD *)&v25[4] = 1024;
        *(_DWORD *)&v25[6] = v20;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "[#Power] systemHasPoweredOnNotificationHandler oldLimit: %d, accessoryChargingCurrent: %d\n",  (uint8_t *)&v24,  0xEu);
      }

      if (v14 != -[ACCPlatformPowerInfo accessoryChargingCurrent](self, "accessoryChargingCurrent"))
      {
        if (gLogObjects && gNumLogObjects >= 8)
        {
          __int16 v21 = (os_log_s *)*(id *)(gLogObjects + 56);
        }

        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
          __int16 v21 = (os_log_s *)&_os_log_default;
          id v22 = &_os_log_default;
        }

        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v23 = -[ACCPlatformPowerInfo accessoryChargingCurrent](self, "accessoryChargingCurrent");
          int v24 = 67109632;
          *(_DWORD *)id v25 = 7;
          *(_WORD *)&v25[4] = 1024;
          *(_DWORD *)&v25[6] = v14;
          LOWORD(v26) = 1024;
          *(_DWORD *)((char *)&v26 + 2) = v23;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "[#Power] Sending Power Update (for wake): %d: %d->%d\n",  (uint8_t *)&v24,  0x14u);
        }

        platform_power_sendPowerUpdate( -[ACCPlatformPowerInfo endpointUID](self, "endpointUID"),  7,  -[ACCPlatformPowerInfo accessoryChargingCurrent](self, "accessoryChargingCurrent"),  13,  0);
      }
    }
  }
}

- (void)powerInfoChangeNotificationHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 name]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);

  __int16 v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:ACCPlatformPowerPlugin_ConnectionUUID]);
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
    unsigned int v10 = (os_log_s *)&_os_log_default;
    id v9 = &_os_log_default;
  }

  else
  {
    unsigned int v10 = (os_log_s *)*(id *)(gLogObjects + 56);
  }

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v79 = 136315394;
    *(void *)v80 = "-[ACCPlatformPowerInfo powerInfoChangeNotificationHandler:]";
    *(_WORD *)&v80[8] = 2112;
    *(void *)v81 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "[#Power] %s: Received notification: %@\n",  (uint8_t *)&v79,  0x16u);
  }

  if ([v5 isEqualToString:ACCPlatformPowerPlugin_USBCurrentLimitDidChangeNotification])
  {
    p_int availableCurrent = &self->_availableCurrent;
    int availableCurrent = self->_availableCurrent;
    id PowerPluginInstance = _getPowerPluginInstance();
    unsigned int v14 = (void *)objc_claimAutoreleasedReturnValue(PowerPluginInstance);
    self->_int availableCurrent = (unsigned __int16)[v14 USBCurrentLimitInmA:v7];

    if ((iAP2MsgPreSendCtlProcess() & 1) != 0)
    {
      if (availableCurrent == *p_availableCurrent && self->_isFirstSent_AvailableCurrent)
      {
        if (gLogObjects && gNumLogObjects >= 8)
        {
          __int16 v15 = (os_log_s *)*(id *)(gLogObjects + 56);
        }

        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
          __int16 v15 = (os_log_s *)&_os_log_default;
          id v48 = &_os_log_default;
        }

        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_118;
        }
        int v49 = self->_availableCurrent;
        BOOL isFirstSent_AvailableCurrent = self->_isFirstSent_AvailableCurrent;
        int v79 = 67109888;
        *(_DWORD *)v80 = 0;
        *(_WORD *)&v80[4] = 1024;
        *(_DWORD *)&v80[6] = availableCurrent;
        *(_WORD *)v81 = 1024;
        *(_DWORD *)&v81[2] = v49;
        *(_WORD *)&v81[6] = 1024;
        *(_DWORD *)&v81[8] = isFirstSent_AvailableCurrent;
        goto LABEL_117;
      }

      self->_BOOL isFirstSent_AvailableCurrent = 1;
      if (gLogObjects && gNumLogObjects >= 8)
      {
        id v19 = (os_log_s *)*(id *)(gLogObjects + 56);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        id v19 = (os_log_s *)&_os_log_default;
        id v33 = &_os_log_default;
      }

      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[ACCPlatformPowerInfo powerInfoChangeNotificationHandler:].cold.1();
      }
    }

    else
    {
      self->_BOOL isFirstSent_AvailableCurrent = 1;
      if (gLogObjects && gNumLogObjects >= 8)
      {
        id v19 = (os_log_s *)*(id *)(gLogObjects + 56);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        id v19 = (os_log_s *)&_os_log_default;
        id v24 = &_os_log_default;
      }

      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        int v25 = *p_availableCurrent;
        int v79 = 136316162;
        *(void *)v80 = "-[ACCPlatformPowerInfo powerInfoChangeNotificationHandler:]";
        *(_WORD *)&v80[8] = 1024;
        *(_DWORD *)v81 = 1047;
        *(_WORD *)&v81[4] = 1024;
        *(_DWORD *)&v81[6] = 0;
        *(_WORD *)&v81[10] = 1024;
        int v82 = availableCurrent;
        __int16 v83 = 1024;
        int v84 = v25;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_INFO,  "[#Power] %s:%d Sending Power Update: %d: %d->%d\n",  (uint8_t *)&v79,  0x24u);
      }
    }

    v34 = -[ACCPlatformPowerInfo endpointUID](self, "endpointUID");
    int v35 = self->_availableCurrent;
    int v36 = 0;
    goto LABEL_106;
  }

  if ([v5 isEqualToString:ACCPlatformPowerPlugin_BatteryPackModeDidChangeNotification])
  {
    BOOL isDeviceBatteryCharging = self->_isDeviceBatteryCharging;
    id v17 = _getPowerPluginInstance();
    unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    self->_BOOL isDeviceBatteryCharging = [v18 isBatteryPackModeEnabled:v7] ^ 1;

    if ((iAP2MsgPreSendCtlProcess() & 1) != 0)
    {
      if (isDeviceBatteryCharging == self->_isDeviceBatteryCharging && self->_isFirstSent_DeviceBatteryCharging)
      {
        if (gLogObjects && gNumLogObjects >= 8)
        {
          __int16 v15 = (os_log_s *)*(id *)(gLogObjects + 56);
        }

        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
          __int16 v15 = (os_log_s *)&_os_log_default;
          id v59 = &_os_log_default;
        }

        if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_118;
        }
        BOOL v60 = self->_isDeviceBatteryCharging;
        BOOL isFirstSent_DeviceBatteryCharging = self->_isFirstSent_DeviceBatteryCharging;
        int v79 = 67109888;
        *(_DWORD *)v80 = 1;
        *(_WORD *)&v80[4] = 1024;
        *(_DWORD *)&v80[6] = isDeviceBatteryCharging;
        *(_WORD *)v81 = 1024;
        *(_DWORD *)&v81[2] = v60;
        *(_WORD *)&v81[6] = 1024;
        *(_DWORD *)&v81[8] = isFirstSent_DeviceBatteryCharging;
        goto LABEL_117;
      }

      self->_BOOL isFirstSent_DeviceBatteryCharging = 1;
      if (gLogObjects && gNumLogObjects >= 8)
      {
        unsigned int v23 = (os_log_s *)*(id *)(gLogObjects + 56);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        unsigned int v23 = (os_log_s *)&_os_log_default;
        id v46 = &_os_log_default;
      }

      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        -[ACCPlatformPowerInfo powerInfoChangeNotificationHandler:].cold.5();
      }
    }

    else
    {
      self->_BOOL isFirstSent_DeviceBatteryCharging = 1;
      if (gLogObjects && gNumLogObjects >= 8)
      {
        unsigned int v23 = (os_log_s *)*(id *)(gLogObjects + 56);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        unsigned int v23 = (os_log_s *)&_os_log_default;
        id v37 = &_os_log_default;
      }

      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        -[ACCPlatformPowerInfo powerInfoChangeNotificationHandler:].cold.8( isDeviceBatteryCharging,  (unsigned __int8 *)&self->_isDeviceBatteryCharging,  v23);
      }
    }

    v34 = -[ACCPlatformPowerInfo endpointUID](self, "endpointUID");
    int v35 = self->_isDeviceBatteryCharging;
    int v36 = 1;
LABEL_106:
    platform_power_sendPowerUpdate(v34, v36, v35, 13, 0);
    goto LABEL_119;
  }

  if ([v5 isEqualToString:ACCPlatformIOKitPowerPlugin_IsExternalChargerConnected])
  {
    BOOL isExternalChargerConnected = self->_isExternalChargerConnected;
    id IOKitPowerPluginInstance = _getIOKitPowerPluginInstance();
    id v22 = (void *)objc_claimAutoreleasedReturnValue(IOKitPowerPluginInstance);
    self->_BOOL isExternalChargerConnected = [v22 isExternalChargerConnected];

    if (isExternalChargerConnected != self->_isExternalChargerConnected || !self->_isFirstSent_ExternalChargerConnected)
    {
      self->_BOOL isFirstSent_ExternalChargerConnected = 1;
      if (gLogObjects && gNumLogObjects >= 8)
      {
        v32 = (os_log_s *)*(id *)(gLogObjects + 56);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        v32 = (os_log_s *)&_os_log_default;
        id v47 = &_os_log_default;
      }

      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
        -[ACCPlatformPowerInfo powerInfoChangeNotificationHandler:].cold.10();
      }

      v34 = -[ACCPlatformPowerInfo endpointUID](self, "endpointUID");
      int v35 = self->_isExternalChargerConnected;
      int v36 = 4;
      goto LABEL_106;
    }

    if (gLogObjects && gNumLogObjects >= 8)
    {
      __int16 v15 = (os_log_s *)*(id *)(gLogObjects + 56);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      __int16 v15 = (os_log_s *)&_os_log_default;
      id v62 = &_os_log_default;
    }

    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_118;
    }
    BOOL v63 = self->_isExternalChargerConnected;
    BOOL isFirstSent_ExternalChargerConnected = self->_isFirstSent_ExternalChargerConnected;
    int v79 = 67109888;
    *(_DWORD *)v80 = 4;
    *(_WORD *)&v80[4] = 1024;
    *(_DWORD *)&v80[6] = isExternalChargerConnected;
    *(_WORD *)v81 = 1024;
    *(_DWORD *)&v81[2] = v63;
    *(_WORD *)&v81[6] = 1024;
    *(_DWORD *)&v81[8] = isFirstSent_ExternalChargerConnected;
LABEL_117:
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "[#Power] Skip Sending Power Update: %d: %d = %d, isFirst=%d",  (uint8_t *)&v79,  0x1Au);
    goto LABEL_118;
  }

  if ([v5 isEqualToString:ACCPlatformIOKitPowerPlugin_BatteryChargingState])
  {
    int batteryChargingState = self->_batteryChargingState;
    id v27 = _getIOKitPowerPluginInstance();
    int v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    self->_int batteryChargingState = [v28 getBatteryChargingState];

    if (batteryChargingState != self->_batteryChargingState || !self->_isFirstSent_BatteryChargingState)
    {
      self->_BOOL isFirstSent_BatteryChargingState = 1;
      if (gLogObjects && gNumLogObjects >= 8)
      {
        v45 = (os_log_s *)*(id *)(gLogObjects + 56);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        v45 = (os_log_s *)&_os_log_default;
        id v58 = &_os_log_default;
      }

      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
        -[ACCPlatformPowerInfo powerInfoChangeNotificationHandler:].cold.13();
      }

      v34 = -[ACCPlatformPowerInfo endpointUID](self, "endpointUID");
      int v35 = self->_batteryChargingState;
      int v36 = 5;
      goto LABEL_106;
    }

    id v29 = logObjectForModule_16();
    __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
LABEL_118:

      goto LABEL_119;
    }

    int v30 = self->_batteryChargingState;
    BOOL isFirstSent_BatteryChargingState = self->_isFirstSent_BatteryChargingState;
    int v79 = 67109888;
    *(_DWORD *)v80 = 5;
    *(_WORD *)&v80[4] = 1024;
    *(_DWORD *)&v80[6] = batteryChargingState;
    *(_WORD *)v81 = 1024;
    *(_DWORD *)&v81[2] = v30;
    *(_WORD *)&v81[6] = 1024;
    *(_DWORD *)&v81[8] = isFirstSent_BatteryChargingState;
    goto LABEL_117;
  }

  if ([v5 isEqualToString:ACCPlatformIOKitPowerPlugin_BatteryChargeLevel])
  {
    int batteryChargeLevel = self->_batteryChargeLevel;
    id v39 = _getIOKitPowerPluginInstance();
    v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
    self->_int batteryChargeLevel = [v40 getBatteryChargeLevel];

    if (batteryChargeLevel == self->_batteryChargeLevel && self->_isFirstSent_BatteryChargeLevel)
    {
      id v41 = logObjectForModule_16();
      v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        int v43 = self->_batteryChargeLevel;
        BOOL isFirstSent_BatteryChargeLevel = self->_isFirstSent_BatteryChargeLevel;
        int v79 = 67109888;
        *(_DWORD *)v80 = 6;
        *(_WORD *)&v80[4] = 1024;
        *(_DWORD *)&v80[6] = batteryChargeLevel;
        *(_WORD *)v81 = 1024;
        *(_DWORD *)&v81[2] = v43;
        *(_WORD *)&v81[6] = 1024;
        *(_DWORD *)&v81[8] = isFirstSent_BatteryChargeLevel;
        _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "[#Power] Skip Sending Power Update: %d: %d = %d, isFirst=%d",  (uint8_t *)&v79,  0x1Au);
      }
    }

    else
    {
      self->_BOOL isFirstSent_BatteryChargeLevel = 1;
      if (gLogObjects && gNumLogObjects >= 8)
      {
        v57 = (os_log_s *)*(id *)(gLogObjects + 56);
      }

      else
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
          platform_connectionInfo_configStreamCategoryListReady_cold_1();
        }
        v57 = (os_log_s *)&_os_log_default;
        id v66 = &_os_log_default;
      }

      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG)) {
        -[ACCPlatformPowerInfo powerInfoChangeNotificationHandler:].cold.15();
      }

      platform_power_sendPowerUpdate( -[ACCPlatformPowerInfo endpointUID](self, "endpointUID"),  6,  self->_batteryChargeLevel,  13,  0);
    }

    __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[ACCPlatformPowerInfo endpointUID](self, "endpointUID"));
    if (!_isModelNumberConnected(v15, @"A1603")
      || !platform_systemInfo_isApplePencilSupported()
      || self->_batteryChargeLevel > 0xAu)
    {
      goto LABEL_118;
    }

    unsigned int v67 = -[ACCPlatformPowerInfo holdingApplePencilSleepAssertion](self, "holdingApplePencilSleepAssertion");

    if (v67)
    {
      platform_sleepAssertion_createForApplePencil(v68);
      -[ACCPlatformPowerInfo setHoldingApplePencilSleepAssertion:](self, "setHoldingApplePencilSleepAssertion:", 0LL);
    }

    goto LABEL_119;
  }

  if (![v5 isEqualToString:ACCPlatformPowerPlugin_PowerDidChangeNotification])
  {
    id v65 = logObjectForModule_16();
    v52 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      int v79 = 138412290;
      *(void *)v80 = v5;
      v53 = "[#Power] PowerInfoChangeNotifications: Unknown notification received: %@\n";
      v54 = v52;
      os_log_type_t v55 = OS_LOG_TYPE_DEFAULT;
      uint32_t v56 = 12;
      goto LABEL_122;
    }

- (NSString)endpointUID
{
  return (NSString *)objc_getProperty(self, a2, 32LL, 1);
}

- (NSString)connectionUID
{
  return (NSString *)objc_getProperty(self, a2, 40LL, 1);
}

- (ACCPowerManager)accessoryPowerManager
{
  return self->_accessoryPowerManager;
}

- (ACCPowerSiphoningControl)siphoningControl
{
  return self->_siphoningControl;
}

- (unint64_t)updateTypesBitmask
{
  return self->_updateTypesBitmask;
}

- (void)setUpdateTypesBitmask:(unint64_t)a3
{
  self->_updateTypesBitmask = a3;
}

- (unint64_t)oldUpdateTypesBitmask
{
  return self->_oldUpdateTypesBitmask;
}

- (void)setOldUpdateTypesBitmask:(unint64_t)a3
{
  self->_oldUpdateTypesBitmask = a3;
}

- (unsigned)availableCurrent
{
  return self->_availableCurrent;
}

- (BOOL)isDeviceBatteryCharging
{
  return self->_isDeviceBatteryCharging;
}

- (BOOL)isExternalChargerConnected
{
  return self->_isExternalChargerConnected;
}

- (int)batteryChargingState
{
  return self->_batteryChargingState;
}

- (unsigned)batteryChargeLevel
{
  return self->_batteryChargeLevel;
}

- (unsigned)accessoryChargingCurrent
{
  return self->_accessoryChargingCurrent;
}

- (void)setAccessoryChargingCurrent:(unsigned __int16)a3
{
  self->_int accessoryChargingCurrent = a3;
}

- (BOOL)isFirstSent_AvailableCurrent
{
  return self->_isFirstSent_AvailableCurrent;
}

- (BOOL)isFirstSent_DeviceBatteryCharging
{
  return self->_isFirstSent_DeviceBatteryCharging;
}

- (BOOL)isFirstSent_ExternalChargerConnected
{
  return self->_isFirstSent_ExternalChargerConnected;
}

- (BOOL)isFirstSent_BatteryChargingState
{
  return self->_isFirstSent_BatteryChargingState;
}

- (BOOL)isFirstSent_BatteryChargeLevel
{
  return self->_isFirstSent_BatteryChargeLevel;
}

- (BOOL)isFirstSent_AccessoryChargingCurrent
{
  return self->_isFirstSent_AccessoryChargingCurrent;
}

- (BOOL)systemAsleep
{
  return self->_systemAsleep;
}

- (void)setSystemAsleep:(BOOL)a3
{
  self->_systemAsleep = a3;
}

- (NSString)sleepNotificationClientUUID
{
  return self->_sleepNotificationClientUUID;
}

- (void)setSleepNotificationClientUUID:(id)a3
{
}

- (BOOL)holdingApplePencilSleepAssertion
{
  return self->_holdingApplePencilSleepAssertion;
}

- (void)setHoldingApplePencilSleepAssertion:(BOOL)a3
{
  self->_holdingApplePencilSleepAssertion = a3;
}

- (NSString)batteryNotificationClientUUID
{
  return self->_batteryNotificationClientUUID;
}

- (void)setBatteryNotificationClientUUID:(id)a3
{
}

- (NSString)applePencilBatteryNotificationClientUUID
{
  return self->_applePencilBatteryNotificationClientUUID;
}

- (void)setApplePencilBatteryNotificationClientUUID:(id)a3
{
}

- (BOOL)powerUpdateSentDueToSleep
{
  return self->_powerUpdateSentDueToSleep;
}

- (void)setPowerUpdateSentDueToSleep:(BOOL)a3
{
  self->_powerUpdateSentDueToSleep = a3;
}

- (BOOL)requestSleepUpdate
{
  return self->_requestSleepUpdate;
}

- (void)setRequestSleepUpdate:(BOOL)a3
{
  self->_requestSleepUpdate = a3;
}

- (void).cxx_destruct
{
}

- (void)powerInfoChangeNotificationHandler:.cold.1()
{
}

- (void)powerInfoChangeNotificationHandler:.cold.5()
{
}

- (void)powerInfoChangeNotificationHandler:(os_log_s *)a3 .cold.8( unsigned __int8 a1,  unsigned __int8 *a2,  os_log_s *a3)
{
  LOWORD(OUTLINED_FUNCTION_5_11( (void *)&_mh_execute_header,  v0,  v1,  "[#Power] Sending Power Update: %d: %d->%d\n",  67109632,  v2, v3) = 1024;
  HIWORD(OUTLINED_FUNCTION_5_11( (void *)&_mh_execute_header,  v0,  v1,  "[#Power] Sending Power Update: %d: %d->%d\n",  67109632,  v2, v3) = a1;
  OUTLINED_FUNCTION_5_11( (void *)&_mh_execute_header,  (uint64_t)a2,  a3,  "[#Power] Sending Power Update: %d: %d->%d\n",  67109632,  v3,  *a2);
  OUTLINED_FUNCTION_2();
}

- (void)powerInfoChangeNotificationHandler:.cold.10()
{
}

- (void)powerInfoChangeNotificationHandler:.cold.13()
{
}

- (void)powerInfoChangeNotificationHandler:.cold.15()
{
}

@end