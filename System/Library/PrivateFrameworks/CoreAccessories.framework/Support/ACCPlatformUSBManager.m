@interface ACCPlatformUSBManager
+ (id)sharedManager;
- (ACCPlatformUSBManager)init;
- (BOOL)sendUSBNotificationForEndpointUUID:(id)a3 withMode:(id)a4 andFault:(id)a5 force:(BOOL)a6;
- (BOOL)setUSBFaultMonitoringForEndpointUUID:(id)a3 withState:(BOOL)a4;
- (BOOL)setUSBModeForEndpointUUID:(id)a3 newMode:(int)a4;
- (BOOL)setUSBModeMonitoringForEndpointUUID:(id)a3 withState:(BOOL)a4;
- (NSMutableArray)usbFaultSubscribers;
- (NSMutableArray)usbModeSubscribers;
- (NSMutableDictionary)subscriberList;
- (int)getCachedUSBFaultForEndpointUUID:(id)a3;
- (int)getCachedUSBModeForEndpointUUID:(id)a3;
- (int)getUSBModeForEndpointUUID:(id)a3;
- (void)addSubscriberForEndpointUUID:(id)a3 andFeature:(id)a4;
- (void)removeSubscriberForEndpointUUID:(id)a3 andFeature:(id)a4;
- (void)setSubscriberList:(id)a3;
- (void)setUsbFaultSubscribers:(id)a3;
- (void)setUsbModeSubscribers:(id)a3;
- (void)updateSubscriberForEndpointUUID:(id)a3 forFeature:(id)a4;
- (void)usbFaultOccurredHandler:(id)a3;
- (void)usbModeChangedHandler:(id)a3;
@end

@implementation ACCPlatformUSBManager

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __38__ACCPlatformUSBManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once_9 != -1) {
    dispatch_once(&sharedManager_once_9, block);
  }
  return (id)sharedManager_sharedInstance_9;
}

void __38__ACCPlatformUSBManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_sharedInstance_9;
  sharedManager_sharedInstance_9 = (uint64_t)v1;
}

- (ACCPlatformUSBManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ACCPlatformUSBManager;
  v2 = -[ACCPlatformUSBManager init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __29__ACCPlatformUSBManager_init__block_invoke;
    block[3] = &unk_1001F96F8;
    v6 = v2;
    if (init_onceToken != -1) {
      dispatch_once(&init_onceToken, block);
    }
  }

  return v3;
}

id __29__ACCPlatformUSBManager_init__block_invoke(uint64_t a1)
{
  v2 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  v5 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  uint64_t v6 = *(void *)(a1 + 32);
  objc_super v7 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v5;

  v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v9 = *(void *)(a1 + 32);
  v10 = *(void **)(v9 + 24);
  *(void *)(v9 + 24) = v8;

  [*(id *)(*(void *)(a1 + 32) + 24) setObject:*(void *)(*(void *)(a1 + 32) + 8) forKey:@"USBModeSubscribers"];
  return [*(id *)(*(void *)(a1 + 32) + 24) setObject:*(void *)(*(void *)(a1 + 32) + 16) forKey:@"USBFaultSubscribers"];
}

- (void)addSubscriberForEndpointUUID:(id)a3 andFeature:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (__CFString *)a4;
  objc_super v7 = v6;
  if (v5 && v6)
  {
    if (v6 == @"USBModeSubscribers")
    {
      v35 = @"USBModeCachedState";
      id USBModePluginInstance = _getUSBModePluginInstance();
      v17 = (void *)objc_claimAutoreleasedReturnValue(USBModePluginInstance);
      v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithInt:]( NSNumber,  "numberWithInt:",  [v17 USBModeForEndpointUUID:v5]));
      v36 = v18;
      v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v36,  &v35,  1LL));

      id v33 = v5;
      v34 = v10;
      v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v34,  &v33,  1LL));
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[ACCPlatformUSBManager sharedManager](&OBJC_CLASS___ACCPlatformUSBManager, "sharedManager"));
      v20 = (void *)objc_claimAutoreleasedReturnValue([v19 usbModeSubscribers]);
      [v20 addObject:v13];

      v21 = (void *)objc_claimAutoreleasedReturnValue(+[ACCPlatformUSBManager sharedManager](&OBJC_CLASS___ACCPlatformUSBManager, "sharedManager"));
      v22 = (void *)objc_claimAutoreleasedReturnValue([v21 subscriberList]);
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[ACCPlatformUSBManager sharedManager](&OBJC_CLASS___ACCPlatformUSBManager, "sharedManager"));
      v24 = (void *)objc_claimAutoreleasedReturnValue([v23 usbModeSubscribers]);
      [v22 setObject:v24 forKey:@"USBModeSubscribers"];
LABEL_17:

      goto LABEL_18;
    }

    if (v6 == @"USBFaultSubscribers")
    {
      id USBFaultPluginInstance = _getUSBFaultPluginInstance();
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(USBFaultPluginInstance);
      v10 = v9;
      if (v9)
      {
        else {
          uint64_t v11 = 0LL;
        }
        uint64_t v12 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v11));
        v31 = @"USBFaultCachedState";
        if (v12)
        {
          v13 = (void *)v12;
          int v14 = 0;
          v15 = (void *)v12;
LABEL_14:
          v32 = v15;
          v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v32,  &v31,  1LL));
          if (v14) {

          }
          id v29 = v5;
          v30 = v21;
          v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v30,  &v29,  1LL));
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[ACCPlatformUSBManager sharedManager](&OBJC_CLASS___ACCPlatformUSBManager, "sharedManager"));
          v26 = (void *)objc_claimAutoreleasedReturnValue([v25 usbFaultSubscribers]);
          [v26 addObject:v22];

          v23 = (void *)objc_claimAutoreleasedReturnValue(+[ACCPlatformUSBManager sharedManager](&OBJC_CLASS___ACCPlatformUSBManager, "sharedManager"));
          v24 = (void *)objc_claimAutoreleasedReturnValue([v23 subscriberList]);
          v27 = (void *)objc_claimAutoreleasedReturnValue(+[ACCPlatformUSBManager sharedManager](&OBJC_CLASS___ACCPlatformUSBManager, "sharedManager"));
          v28 = (void *)objc_claimAutoreleasedReturnValue([v27 usbFaultSubscribers]);
          [v24 setObject:v28 forKey:@"USBFaultSubscribers"];

          goto LABEL_17;
        }
      }

      else
      {
        v31 = @"USBFaultCachedState";
      }

      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](&OBJC_CLASS___NSNull, "null"));
      v13 = 0LL;
      int v14 = 1;
      goto LABEL_14;
    }
  }

- (void)removeSubscriberForEndpointUUID:(id)a3 andFeature:(id)a4
{
  id v5 = a3;
  uint64_t v6 = (__CFString *)a4;
  objc_super v7 = v6;
  if (v5 && v6)
  {
    if (v6 == @"USBModeSubscribers")
    {
      __int128 v36 = 0u;
      __int128 v37 = 0u;
      __int128 v34 = 0u;
      __int128 v35 = 0u;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[ACCPlatformUSBManager sharedManager](&OBJC_CLASS___ACCPlatformUSBManager, "sharedManager"));
      v16 = (void *)objc_claimAutoreleasedReturnValue([v15 usbModeSubscribers]);

      id v10 = [v16 countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v10)
      {
        uint64_t v17 = *(void *)v35;
        while (2)
        {
          for (i = 0LL; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v35 != v17) {
              objc_enumerationMutation(v16);
            }
            v19 = *(void **)(*((void *)&v34 + 1) + 8LL * (void)i);
            v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKey:v5]);

            if (v20)
            {
              id v10 = v19;
              goto LABEL_24;
            }
          }

          id v10 = [v16 countByEnumeratingWithState:&v34 objects:v39 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }

- (void)updateSubscriberForEndpointUUID:(id)a3 forFeature:(id)a4
{
  if (a3)
  {
    if (a4)
    {
      id v6 = a4;
      id v7 = a3;
      -[ACCPlatformUSBManager removeSubscriberForEndpointUUID:andFeature:]( self,  "removeSubscriberForEndpointUUID:andFeature:",  v7,  v6);
      -[ACCPlatformUSBManager addSubscriberForEndpointUUID:andFeature:]( self,  "addSubscriberForEndpointUUID:andFeature:",  v7,  v6);
    }
  }

- (int)getCachedUSBModeForEndpointUUID:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    __int128 v18 = 0u;
    __int128 v19 = 0u;
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[ACCPlatformUSBManager sharedManager](&OBJC_CLASS___ACCPlatformUSBManager, "sharedManager", 0LL));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 usbModeSubscribers]);

    id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v17;
      while (2)
      {
        for (i = 0LL; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v16 + 1) + 8 * (void)i) objectForKey:v3]);
          uint64_t v11 = v10;
          if (v10)
          {
            uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKey:@"USBModeCachedState"]);
            if (v12)
            {
              int v14 = v12;
              int v13 = [v12 intValue];

              goto LABEL_13;
            }
          }
        }

        id v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    int v13 = -1;
LABEL_13:
  }

  else
  {
    int v13 = -1;
  }

  return v13;
}

- (int)getCachedUSBFaultForEndpointUUID:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    __int128 v16 = 0u;
    __int128 v17 = 0u;
    __int128 v14 = 0u;
    __int128 v15 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[ACCPlatformUSBManager sharedManager](&OBJC_CLASS___ACCPlatformUSBManager, "sharedManager", 0LL));
    id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 usbModeSubscribers]);

    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      while (2)
      {
        for (i = 0LL; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v14 + 1) + 8 * (void)i) objectForKey:v3]);
          id v10 = v9;
          if (v9)
          {
            uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKey:@"USBFaultCachedState"]);
            if (v11)
            {
              uint64_t v12 = v11;
              LODWORD(v6) = [v11 BOOLValue];

              goto LABEL_13;
            }
          }
        }

        id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

- (BOOL)sendUSBNotificationForEndpointUUID:(id)a3 withMode:(id)a4 andFault:(id)a5 force:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  char v13 = 0;
  if (v10 && v11)
  {
    unsigned int v14 = -[ACCPlatformUSBManager getCachedUSBModeForEndpointUUID:](self, "getCachedUSBModeForEndpointUUID:", v10);
    unsigned int v15 = -[ACCPlatformUSBManager getCachedUSBFaultForEndpointUUID:](self, "getCachedUSBFaultForEndpointUUID:", v10);
    unsigned int v16 = [v11 intValue];
    if (v16 == -1 || (unsigned int v17 = v16, v14 == v16) && !a6 && v15 == [v12 intValue])
    {
      char v13 = 0;
    }

    else
    {
      if (v17 == 2) {
        unsigned int v18 = 1;
      }
      else {
        unsigned int v18 = -1;
      }
      if (v17 == 1) {
        uint64_t v19 = 0LL;
      }
      else {
        uint64_t v19 = v18;
      }
      char v13 = platform_usb_send_notification( v10,  +[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", v19),  v12);
      -[ACCPlatformUSBManager updateSubscriberForEndpointUUID:forFeature:]( self,  "updateSubscriberForEndpointUUID:forFeature:",  v10,  @"USBModeSubscribers");
      -[ACCPlatformUSBManager updateSubscriberForEndpointUUID:forFeature:]( self,  "updateSubscriberForEndpointUUID:forFeature:",  v10,  @"USBFaultSubscribers");
    }
  }

  return v13;
}

- (int)getUSBModeForEndpointUUID:(id)a3
{
  id v3 = a3;
  id USBModePluginInstance = _getUSBModePluginInstance();
  id v5 = (void *)objc_claimAutoreleasedReturnValue(USBModePluginInstance);
  id v6 = v5;
  if (v5)
  {
    unsigned int v7 = [v5 USBModeForEndpointUUID:v3];
    if (v7 == 2) {
      int v8 = 1;
    }
    else {
      int v8 = -1;
    }
    if (v7 >= 2) {
      int v9 = v8;
    }
    else {
      int v9 = 0;
    }
  }

  else
  {
    int v9 = -1;
  }

  if (gLogObjects) {
    BOOL v10 = gNumLogObjects < 8;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      _parseIdentificationParams_cold_2();
    }
    id v12 = (os_log_s *)&_os_log_default;
    id v11 = &_os_log_default;
  }

  else
  {
    id v12 = (os_log_s *)*(id *)(gLogObjects + 56);
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412802;
    id v15 = v3;
    __int16 v16 = 2112;
    unsigned int v17 = v6;
    __int16 v18 = 1024;
    int v19 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "[#USB] getUSBModeForEndpointUUID: %@, usbModePluginInstance=%@ usbMode=%d",  (uint8_t *)&v14,  0x1Cu);
  }

  return v9;
}

- (BOOL)setUSBModeForEndpointUUID:(id)a3 newMode:(int)a4
{
  id v6 = a3;
  id USBModePluginInstance = _getUSBModePluginInstance();
  int v8 = (void *)objc_claimAutoreleasedReturnValue(USBModePluginInstance);
  if (gLogObjects) {
    BOOL v9 = gNumLogObjects < 8;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      _parseIdentificationParams_cold_2();
    }
    id v11 = (os_log_s *)&_os_log_default;
    id v10 = &_os_log_default;
  }

  else
  {
    id v11 = (os_log_s *)*(id *)(gLogObjects + 56);
  }

  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412802;
    id v24 = v6;
    __int16 v25 = 1024;
    int v26 = a4;
    __int16 v27 = 2112;
    v28 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "[#USB] setUSBModeForEndpointUUID: %@ usbModeToSet=%d, usbModePluginInstance=%@",  buf,  0x1Cu);
  }

  if (!v8) {
    goto LABEL_20;
  }
  unsigned int v12 = [v8 USBModeForEndpointUUID:v6];
  unsigned int v13 = v12;
  if ((a4 != 1 || v12 != 2) && (a4 || v12 != 1))
  {
    if (a4 == 1)
    {
      unsigned int v17 = v8;
      uint64_t v18 = 1LL;
LABEL_22:
      unsigned __int8 v16 = [v17 setUSBMode:v18 forEndpointUUID:v6];
      goto LABEL_23;
    }

    if (!a4)
    {
      unsigned int v17 = v8;
      uint64_t v18 = 0LL;
      goto LABEL_22;
    }

void __59__ACCPlatformUSBManager_setUSBModeForEndpointUUID_newMode___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", *(unsigned int *)(a1 + 48)));
  [v1 sendUSBNotificationForEndpointUUID:v2 withMode:v3 andFault:0 force:1];
}

- (BOOL)setUSBModeMonitoringForEndpointUUID:(id)a3 withState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  int v8 = (void *)objc_claimAutoreleasedReturnValue(+[ACCPlatformUSBManager sharedManager](&OBJC_CLASS___ACCPlatformUSBManager, "sharedManager"));
  if (v4)
  {
    [v7 addObserver:v8 selector:"usbModeChangedHandler:" name:ACCPlatformUSBModePlugin_USBModeDidChangeNotification object:0];

    -[ACCPlatformUSBManager addSubscriberForEndpointUUID:andFeature:]( self,  "addSubscriberForEndpointUUID:andFeature:",  v6,  @"USBModeSubscribers");
  }

  else
  {
    [v7 removeObserver:v8 name:ACCPlatformUSBModePlugin_USBModeDidChangeNotification object:0];

    -[ACCPlatformUSBManager removeSubscriberForEndpointUUID:andFeature:]( self,  "removeSubscriberForEndpointUUID:andFeature:",  v6,  @"USBModeSubscribers");
  }

  return 1;
}

- (BOOL)setUSBFaultMonitoringForEndpointUUID:(id)a3 withState:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id USBFaultPluginInstance = _getUSBFaultPluginInstance();
  int v8 = (void *)objc_claimAutoreleasedReturnValue(USBFaultPluginInstance);
  BOOL v9 = v8;
  if (v8)
  {
    [v8 usbFaultMonitor:v4 forUUID:v6];
    id v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[ACCPlatformUSBManager sharedManager](&OBJC_CLASS___ACCPlatformUSBManager, "sharedManager"));
    if (v4)
    {
      [v10 addObserver:v11 selector:"usbFaultOccurredHandler:" name:ACCPlatformUSBFaultPlugin_USBFaultNotification object:0];

      -[ACCPlatformUSBManager addSubscriberForEndpointUUID:andFeature:]( self,  "addSubscriberForEndpointUUID:andFeature:",  v6,  @"USBFaultSubscribers");
    }

    else
    {
      [v10 removeObserver:v11 name:ACCPlatformUSBFaultPlugin_USBFaultNotification object:0];

      -[ACCPlatformUSBManager removeSubscriberForEndpointUUID:andFeature:]( self,  "removeSubscriberForEndpointUUID:andFeature:",  v6,  @"USBFaultSubscribers");
    }
  }

  return v9 != 0LL;
}

- (void)usbModeChangedHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v8 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKey:ACCPlatformUSBModePlugin_USBMode]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:ACCPlatformUSBModePlugin_ConnectionUUID]);

  -[ACCPlatformUSBManager sendUSBNotificationForEndpointUUID:withMode:andFault:force:]( self,  "sendUSBNotificationForEndpointUUID:withMode:andFault:force:",  v7,  v8,  0LL,  0LL);
}

- (void)usbFaultOccurredHandler:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  id v11 = (id)objc_claimAutoreleasedReturnValue([v5 objectForKey:ACCPlatformUSBFaultPlugin_USBFaultNotification_ConnectionUUIDKey]);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:ACCPlatformUSBFaultPlugin_USBFaultNotification_FaultTypeKey]);

  id USBModePluginInstance = _getUSBModePluginInstance();
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(USBModePluginInstance);
  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithBool:]( NSNumber,  "numberWithBool:",  [v9 USBModeForEndpointUUID:v11] != 0));
  -[ACCPlatformUSBManager sendUSBNotificationForEndpointUUID:withMode:andFault:force:]( self,  "sendUSBNotificationForEndpointUUID:withMode:andFault:force:",  v11,  v10,  v7,  0LL);
}

- (NSMutableArray)usbModeSubscribers
{
  return self->_usbModeSubscribers;
}

- (void)setUsbModeSubscribers:(id)a3
{
}

- (NSMutableArray)usbFaultSubscribers
{
  return self->_usbFaultSubscribers;
}

- (void)setUsbFaultSubscribers:(id)a3
{
}

- (NSMutableDictionary)subscriberList
{
  return self->_subscriberList;
}

- (void)setSubscriberList:(id)a3
{
}

- (void).cxx_destruct
{
}

@end