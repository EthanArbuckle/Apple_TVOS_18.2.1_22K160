@interface ACCPlatformPluginManager
+ (id)sharedManager;
- (ACCPlatformPluginManager)init;
- (id)initClass:(Class)a3;
- (id)pluginInstanceWithProtocol:(id)a3 fallbackToTransportPlugins:(BOOL)a4;
- (id)pluginInstancesWithProtocol:(id)a3 includeTransportPlugins:(BOOL)a4;
- (unint64_t)addPlatformPlugInBundleSearchPaths;
- (unint64_t)initAllPlugIns;
- (unint64_t)loadAllBundles;
- (unint64_t)startAllPlugIns;
- (unint64_t)stopAllPlugIns;
- (void)addPlatformPlugInBundleSearchPaths;
- (void)initAllPlugIns;
- (void)loadAllBundles;
@end

@implementation ACCPlatformPluginManager

- (ACCPlatformPluginManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___ACCPlatformPluginManager;
  v2 = -[ACCPluginManager init](&v5, "init");
  v3 = v2;
  if (v2) {
    -[ACCPlatformPluginManager addPlatformPlugInBundleSearchPaths](v2, "addPlatformPlugInBundleSearchPaths");
  }
  return v3;
}

- (unint64_t)addPlatformPlugInBundleSearchPaths
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ACCPlatformPluginManager;
  id v3 = -[ACCPluginManager addBundleSearchPath:recursive:]( &v8,  "addBundleSearchPath:recursive:",  @"/System/Library/CoreAccessories/PlugIns/Platform",  0LL);
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 6;
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
    v6 = (os_log_s *)*(id *)(gLogObjects + 40);
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ACCPlatformPluginManager addPlatformPlugInBundleSearchPaths].cold.1(self);
  }

  return (unint64_t)v3;
}

- (unint64_t)loadAllBundles
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ACCPlatformPluginManager;
  id v3 = -[ACCPluginManager loadBundlesWithExtension:](&v11, "loadBundlesWithExtension:", @"platform");
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 6;
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
    v6 = (os_log_s *)*(id *)(gLogObjects + 40);
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Loaded %lu platform plugin bundle(s)", buf, 0xCu);
  }

  if (gLogObjects && gNumLogObjects >= 6)
  {
    v7 = (os_log_s *)*(id *)(gLogObjects + 40);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v7 = (os_log_s *)&_os_log_default;
    id v8 = &_os_log_default;
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ACCPlatformPluginManager loadAllBundles].cold.1(self, &v10);
  }

  return (unint64_t)v3;
}

- (unint64_t)initAllPlugIns
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ACCPlatformPluginManager;
  id v3 = -[ACCPluginManager initAllPlugIns](&v11, "initAllPlugIns");
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 6;
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
    v6 = (os_log_s *)*(id *)(gLogObjects + 40);
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Initialized %lu platform plugin(s)", buf, 0xCu);
  }

  if (gLogObjects && gNumLogObjects >= 6)
  {
    v7 = (os_log_s *)*(id *)(gLogObjects + 40);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    v7 = (os_log_s *)&_os_log_default;
    id v8 = &_os_log_default;
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ACCPlatformPluginManager initAllPlugIns].cold.1(self, &v10);
  }

  return (unint64_t)v3;
}

- (unint64_t)startAllPlugIns
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ACCPlatformPluginManager;
  id v2 = -[ACCPluginManager startAllPlugIns](&v7, "startAllPlugIns");
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 6;
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
    id v5 = (os_log_s *)*(id *)(gLogObjects + 40);
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v9 = v2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Started %lu platform plugin(s)", buf, 0xCu);
  }

  return (unint64_t)v2;
}

- (unint64_t)stopAllPlugIns
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ACCPlatformPluginManager;
  id v2 = -[ACCPluginManager stopAllPlugIns](&v7, "stopAllPlugIns");
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 6;
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
    id v5 = (os_log_s *)*(id *)(gLogObjects + 40);
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v9 = v2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Stopped %lu platform plugin(s)", buf, 0xCu);
  }

  return (unint64_t)v2;
}

- (id)pluginInstanceWithProtocol:(id)a3 fallbackToTransportPlugins:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = (Protocol *)a3;
  v30 = v6;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v30, 1LL));
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[ACCPluginManager pluginInstancesWithProtocols:matchAny:]( self,  "pluginInstancesWithProtocols:matchAny:",  v7,  0LL));

  if (v8 && [v8 count])
  {
    if (gLogObjects && gNumLogObjects >= 6)
    {
      id v9 = (os_log_s *)*(id *)(gLogObjects + 40);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      id v9 = (os_log_s *)&_os_log_default;
      id v15 = &_os_log_default;
    }

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ACCPlatformPluginManager pluginInstanceWithProtocol:fallbackToTransportPlugins:].cold.6(v6);
    }
    goto LABEL_36;
  }

  if (v4)
  {
    if (gLogObjects && gNumLogObjects >= 6)
    {
      objc_super v10 = (os_log_s *)*(id *)(gLogObjects + 40);
    }

    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        platform_connectionInfo_configStreamCategoryListReady_cold_1();
      }
      objc_super v10 = (os_log_s *)&_os_log_default;
      id v11 = &_os_log_default;
    }

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[ACCPlatformPluginManager pluginInstanceWithProtocol:fallbackToTransportPlugins:].cold.4(v6);
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportPluginManager sharedManager](&OBJC_CLASS___ACCTransportPluginManager, "sharedManager"));
    v29 = v6;
    id v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v29, 1LL));
    v14 = (void *)objc_claimAutoreleasedReturnValue([v12 pluginInstancesWithProtocols:v13 matchAny:0]);

    if (v14)
    {
      if ([v14 count])
      {
        if ((unint64_t)[v14 count] < 2)
        {
          id v8 = v14;
          goto LABEL_37;
        }

        if (gLogObjects && gNumLogObjects >= 6)
        {
          id v9 = (os_log_s *)*(id *)(gLogObjects + 40);
        }

        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            platform_connectionInfo_configStreamCategoryListReady_cold_1();
          }
          id v9 = (os_log_s *)&_os_log_default;
          id v16 = &_os_log_default;
        }

        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          -[ACCPlatformPluginManager pluginInstanceWithProtocol:fallbackToTransportPlugins:].cold.2(v6);
        }
        id v8 = v14;
LABEL_36:

LABEL_37:
        v17 = (void *)objc_claimAutoreleasedReturnValue([v8 anyObject]);
        if (v17) {
          goto LABEL_49;
        }
        goto LABEL_38;
      }

      id v8 = v14;
    }

    else
    {
      id v8 = 0LL;
    }
  }

- (id)pluginInstancesWithProtocol:(id)a3 includeTransportPlugins:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_super v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](&OBJC_CLASS___NSMutableSet, "set"));
  id v18 = v6;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v18, 1LL));
  id v9 = (void *)objc_claimAutoreleasedReturnValue( -[ACCPluginManager pluginInstancesWithProtocols:matchAny:]( self,  "pluginInstancesWithProtocols:matchAny:",  v8,  0LL));

  if (v9)
  {
    objc_super v10 = (void *)objc_claimAutoreleasedReturnValue([v9 allObjects]);
    [v7 addObjectsFromArray:v10];
  }

  if (v4)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[ACCTransportPluginManager sharedManager](&OBJC_CLASS___ACCTransportPluginManager, "sharedManager"));
    id v17 = v6;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v17, 1LL));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v11 pluginInstancesWithProtocols:v12 matchAny:0]);

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue([v13 allObjects]);
      [v7 addObjectsFromArray:v14];
    }
  }

  if ([v7 count]) {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithSet:](&OBJC_CLASS___NSSet, "setWithSet:", v7));
  }
  else {
    id v15 = 0LL;
  }

  return v15;
}

- (id)initClass:(Class)a3
{
  id v4 = objc_alloc_init(a3);

  return v4;
}

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __41__ACCPlatformPluginManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once_2 != -1) {
    dispatch_once(&sharedManager_once_2, block);
  }
  return (id)sharedManager_sharedInstance_2;
}

void __41__ACCPlatformPluginManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  id v2 = (void *)sharedManager_sharedInstance_2;
  sharedManager_sharedInstance_2 = (uint64_t)v1;
}

- (void)addPlatformPlugInBundleSearchPaths
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 pluginBundleSearchPaths]);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v2, v3, "Added bundle search paths: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

- (void)loadAllBundles
{
  a2->receiver = a1;
  a2->super_class = (Class)&OBJC_CLASS___ACCPlatformPluginManager;
  id v2 = -[objc_super pluginBundles](a2, "pluginBundles");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3( (void *)&_mh_execute_header,  v4,  v5,  "ACCPlatformPluginManager.pluginBundles: %@",  v6,  v7,  v8,  v9,  v10);

  OUTLINED_FUNCTION_4();
}

- (void)initAllPlugIns
{
  a2->receiver = a1;
  a2->super_class = (Class)&OBJC_CLASS___ACCPlatformPluginManager;
  id v2 = -[objc_super pluginInstances](a2, "pluginInstances");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3( (void *)&_mh_execute_header,  v4,  v5,  "ACCPlatformPluginManager.pluginInstances: %@",  v6,  v7,  v8,  v9,  v10);

  OUTLINED_FUNCTION_4();
}

- (void)pluginInstanceWithProtocol:(Protocol *)a1 fallbackToTransportPlugins:.cold.2(Protocol *a1)
{
  id v1 = NSStringFromProtocol(a1);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0( (void *)&_mh_execute_header,  v3,  v4,  "Multiple transport plugins found with protocol: %@\nChoosing one at random...",  v5,  v6,  v7,  v8,  v9);

  OUTLINED_FUNCTION_4();
}

- (void)pluginInstanceWithProtocol:(Protocol *)a1 fallbackToTransportPlugins:.cold.4(Protocol *a1)
{
  id v1 = NSStringFromProtocol(a1);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3( (void *)&_mh_execute_header,  v3,  v4,  "Couldn't find a platform plugin conforming to protocol: %@\nFalling back to searching transport plugins...",  v5,  v6,  v7,  v8,  v9);

  OUTLINED_FUNCTION_4();
}

- (void)pluginInstanceWithProtocol:(Protocol *)a1 fallbackToTransportPlugins:.cold.6(Protocol *a1)
{
  id v1 = NSStringFromProtocol(a1);
  id v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_3_0( (void *)&_mh_execute_header,  v3,  v4,  "Multiple platform plugins found with protocol: %@\nChoosing one at random...",  v5,  v6,  v7,  v8,  v9);

  OUTLINED_FUNCTION_4();
}

@end