@interface ACCFeaturePluginManager
+ (id)sharedManager;
- (ACCFeaturePluginManager)init;
- (OS_dispatch_queue)queue;
- (unint64_t)addFeaturePlugInBundleSearchPaths;
- (unint64_t)initAllPlugIns;
- (unint64_t)loadAllBundles;
- (unint64_t)startAllPlugIns;
- (unint64_t)stopAllPlugIns;
- (void)addFeaturePlugInBundleSearchPaths;
- (void)initAllPlugIns;
- (void)loadAllBundles;
- (void)setQueue:(id)a3;
@end

@implementation ACCFeaturePluginManager

- (ACCFeaturePluginManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___ACCFeaturePluginManager;
  v2 = -[ACCPluginManager init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (objc_class *)objc_opt_class(v2);
    v5 = NSStringFromClass(v4);
    id v6 = objc_claimAutoreleasedReturnValue(v5);
    dispatch_queue_t v7 = dispatch_queue_create((const char *)[v6 UTF8String], 0);
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)v7;

    -[ACCFeaturePluginManager addFeaturePlugInBundleSearchPaths](v3, "addFeaturePlugInBundleSearchPaths");
  }

  return v3;
}

- (unint64_t)addFeaturePlugInBundleSearchPaths
{
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___ACCFeaturePluginManager;
  id v3 = -[ACCPluginManager addBundleSearchPath:recursive:]( &v8,  "addBundleSearchPath:recursive:",  @"/System/Library/CoreAccessories/PlugIns/Features",  0LL);
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 4;
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
    id v6 = (os_log_s *)*(id *)(gLogObjects + 24);
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[ACCFeaturePluginManager addFeaturePlugInBundleSearchPaths].cold.1(self);
  }

  return (unint64_t)v3;
}

- (unint64_t)loadAllBundles
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ACCFeaturePluginManager;
  id v3 = -[ACCPluginManager loadBundlesWithExtension:](&v11, "loadBundlesWithExtension:", @"feature");
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 4;
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
    id v6 = (os_log_s *)*(id *)(gLogObjects + 24);
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Loaded %lu feature plugin bundle(s)", buf, 0xCu);
  }

  if (gLogObjects && gNumLogObjects >= 4)
  {
    dispatch_queue_t v7 = (os_log_s *)*(id *)(gLogObjects + 24);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    dispatch_queue_t v7 = (os_log_s *)&_os_log_default;
    id v8 = &_os_log_default;
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ACCFeaturePluginManager loadAllBundles].cold.1(self, &v10);
  }

  return (unint64_t)v3;
}

- (unint64_t)initAllPlugIns
{
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___ACCFeaturePluginManager;
  id v3 = -[ACCPluginManager initAllPlugIns](&v11, "initAllPlugIns");
  if (gLogObjects) {
    BOOL v4 = gNumLogObjects < 4;
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
    id v6 = (os_log_s *)*(id *)(gLogObjects + 24);
  }

  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Initialized %lu feature plugin(s)", buf, 0xCu);
  }

  if (gLogObjects && gNumLogObjects >= 4)
  {
    dispatch_queue_t v7 = (os_log_s *)*(id *)(gLogObjects + 24);
  }

  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      platform_connectionInfo_configStreamCategoryListReady_cold_1();
    }
    dispatch_queue_t v7 = (os_log_s *)&_os_log_default;
    id v8 = &_os_log_default;
  }

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[ACCFeaturePluginManager initAllPlugIns].cold.1(self, &v10);
  }

  return (unint64_t)v3;
}

- (unint64_t)startAllPlugIns
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ACCFeaturePluginManager;
  id v2 = -[ACCPluginManager startAllPlugIns](&v7, "startAllPlugIns");
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 4;
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
    id v5 = (os_log_s *)*(id *)(gLogObjects + 24);
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v9 = v2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Started %lu feature plugin(s)", buf, 0xCu);
  }

  return (unint64_t)v2;
}

- (unint64_t)stopAllPlugIns
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___ACCFeaturePluginManager;
  id v2 = -[ACCPluginManager stopAllPlugIns](&v7, "stopAllPlugIns");
  if (gLogObjects) {
    BOOL v3 = gNumLogObjects < 4;
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
    id v5 = (os_log_s *)*(id *)(gLogObjects + 24);
  }

  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v9 = v2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Stopped %lu feature plugin(s)", buf, 0xCu);
  }

  return (unint64_t)v2;
}

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __40__ACCFeaturePluginManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once_3 != -1) {
    dispatch_once(&sharedManager_once_3, block);
  }
  return (id)sharedManager_sharedInstance_3;
}

void __40__ACCFeaturePluginManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  id v2 = (void *)sharedManager_sharedInstance_3;
  sharedManager_sharedInstance_3 = (uint64_t)v1;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)addFeaturePlugInBundleSearchPaths
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 pluginBundleSearchPaths]);
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v2, v3, "Added bundle search paths: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_4();
}

- (void)loadAllBundles
{
  a2->receiver = a1;
  a2->super_class = (Class)&OBJC_CLASS___ACCFeaturePluginManager;
  id v2 = -[objc_super pluginBundles](a2, "pluginBundles");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_3( (void *)&_mh_execute_header,  v4,  v5,  "ACCFeaturePluginManager.pluginBundles: %@",  v6,  v7,  v8,  v9,  2u);

  OUTLINED_FUNCTION_4();
}

- (void)initAllPlugIns
{
  a2->receiver = a1;
  a2->super_class = (Class)&OBJC_CLASS___ACCFeaturePluginManager;
  id v2 = -[objc_super pluginInstances](a2, "pluginInstances");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_3( (void *)&_mh_execute_header,  v4,  v5,  "ACCFeaturePluginManager.pluginInstances: %@",  v6,  v7,  v8,  v9,  2u);

  OUTLINED_FUNCTION_4();
}

@end