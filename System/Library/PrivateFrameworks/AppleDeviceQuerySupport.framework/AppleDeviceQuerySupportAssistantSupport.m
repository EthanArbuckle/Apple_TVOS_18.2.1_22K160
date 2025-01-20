@interface AppleDeviceQuerySupportAssistantSupport
+ (BOOL)isInternalAssistant;
+ (id)armoryClassName;
+ (id)classList;
+ (id)getSharedInstanceByName:(id)a3 withError:(id *)a4;
+ (id)getXpcProxyWithError:(id *)a3;
+ (id)isKey:(id)a3 withError:(id *)a4;
+ (id)serviceXpcName;
+ (void)getDylibHandlerWithError:(id *)a3;
@end

@implementation AppleDeviceQuerySupportAssistantSupport

+ (BOOL)isInternalAssistant
{
  return 0;
}

+ (id)classList
{
  return &unk_18A34EE08;
}

+ (id)armoryClassName
{
  return @"OBJC_CLASS_$_AppleDeviceQueryArmory";
}

+ (id)serviceXpcName
{
  return @"com.apple.AppleDeviceQueryService";
}

+ (void)getDylibHandlerWithError:(id *)a3
{
  if (a3)
  {
    *a3 = 0LL;
    if (getDylibHandlerWithError__aToken != -1) {
      dispatch_once(&getDylibHandlerWithError__aToken, &__block_literal_global_0);
    }
    *a3 = (id) getDylibHandlerWithError__anError;
  }

  else
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m",  "+[AppleDeviceQuerySupportAssistantSupport getDylibHandlerWithError:]",  60LL,  @"error p-pointer is nil!",  v3,  v4,  v5,  v8);
  }

  return (void *)getDylibHandlerWithError__ZhuGeArmoryHandler;
}

void __68__AppleDeviceQuerySupportAssistantSupport_getDylibHandlerWithError___block_invoke()
{
  getDylibHandlerWithError__ZhuGeArmoryHandler = (uint64_t)dlopen( (const char *)[@"/System/Library/PrivateFrameworks/AppleDeviceQuerySupport.framework/libAppleDeviceQueryArmory.dylib" UTF8String],  1);
  if (!getDylibHandlerWithError__ZhuGeArmoryHandler)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m",  "+[AppleDeviceQuerySupportAssistantSupport getDylibHandlerWithError:]_block_invoke",  69LL,  @"Failed to dlopen ZhuGe armory dylib!",  v0,  v1,  v2,  vars0);
    uint64_t v3 = [MEMORY[0x189607870] errorWithZhuGeErrorCode:13 underlyingError:0];
    uint64_t v4 = (void *)getDylibHandlerWithError__anError;
    getDylibHandlerWithError__anError = v3;
  }

+ (id)getSharedInstanceByName:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  if (!a4)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m",  "+[AppleDeviceQuerySupportAssistantSupport getSharedInstanceByName:withError:]",  95LL,  @"error p-pointer is nil!",  v7,  v8,  v9,  v31);
LABEL_10:
    id v19 = 0LL;
    v15 = 0LL;
    goto LABEL_15;
  }

  *a4 = 0LL;
  [a1 classList];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  char v11 = [v10 containsObject:v6];

  if ((v11 & 1) == 0)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m",  "+[AppleDeviceQuerySupportAssistantSupport getSharedInstanceByName:withError:]",  101LL,  @"Unknown class name!",  v12,  v13,  v14,  v31);
    [MEMORY[0x189607870] errorWithZhuGeErrorCode:38 underlyingError:0];
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    id v19 = 0LL;
LABEL_12:
    v15 = 0LL;
LABEL_14:
    *a4 = v29;
    goto LABEL_15;
  }

  id v32 = 0LL;
  v15 = (void *)[a1 getDylibHandlerWithError:&v32];
  id v19 = v32;
  if (!v15)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m",  "+[AppleDeviceQuerySupportAssistantSupport getSharedInstanceByName:withError:]",  109LL,  @"Failed to get ZhuGe armory handler!",  v16,  v17,  v18,  v31);
    id v29 = v19;
    id v19 = v29;
    goto LABEL_14;
  }

  id v20 = v6;
  v21 = dlsym(v15, (const char *)[v20 UTF8String]);
  if (!v21)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m",  "+[AppleDeviceQuerySupportAssistantSupport getSharedInstanceByName:withError:]",  116LL,  @"Failed to find class symbol for %@!",  v22,  v23,  v24,  (uint64_t)v20);
    [MEMORY[0x189607870] errorWithZhuGeErrorCode:13 underlyingError:0];
    id v29 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }

  [v21 sharedInstance];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m",  "+[AppleDeviceQuerySupportAssistantSupport getSharedInstanceByName:withError:]",  123LL,  @"Failed to have shared instance for %@!",  v25,  v26,  v27,  (uint64_t)v20);
    uint64_t v28 = [MEMORY[0x189607870] errorWithZhuGeErrorCode:38 underlyingError:0];

    id v19 = (id)v28;
  }

+ (id)isKey:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  if (!a4)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m",  "+[AppleDeviceQuerySupportAssistantSupport isKey:withError:]",  146LL,  @"error p-pointer is nil!",  v7,  v8,  v9,  v24);
LABEL_9:
    id v17 = 0LL;
    id v15 = 0LL;
    char v11 = 0LL;
    uint64_t v14 = 0LL;
    goto LABEL_11;
  }

  *a4 = 0LL;
  [a1 armoryClassName];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v26 = 0LL;
  [a1 getSharedInstanceByName:v10 withError:&v26];
  char v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = v26;

  if (v11)
  {
    [v11 helper];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v25 = v12;
    [v13 getConfigOfKey:v6 withError:&v25];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    id v15 = v25;

    uint64_t v16 = (void *)MEMORY[0x189604A88];
    if (!v14) {
      uint64_t v16 = (void *)MEMORY[0x189604A80];
    }
    id v17 = v16;
  }

  else
  {
    [a1 armoryClassName];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m",  "+[AppleDeviceQuerySupportAssistantSupport isKey:withError:]",  154LL,  @"Failed to get a shared instance for %@!",  v19,  v20,  v21,  (uint64_t)v18);

    id v15 = v12;
    id v17 = 0LL;
    char v11 = 0LL;
    uint64_t v14 = 0LL;
    *a4 = v15;
  }

+ (id)getXpcProxyWithError:(id *)a3
{
  if (!a3)
  {
    uint64_t v8 = @"error p-pointer is nil!";
    int v9 = 1040;
    uint64_t v10 = 181LL;
    goto LABEL_9;
  }

  *a3 = 0LL;
  if (getXpcProxyWithError__aToken != -1) {
    dispatch_once(&getXpcProxyWithError__aToken, &__block_literal_global_23);
  }
  pthread_mutex_lock(&getXpcProxyWithError__aRecursiveMutex);
  if (getXpcProxyWithError__aProxy)
  {
    uint64_t v8 = @"XPC proxy is already available";
    int v9 = 524544;
    uint64_t v10 = 193LL;
LABEL_9:
    ZhuGeLog( v9,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m",  "+[AppleDeviceQuerySupportAssistantSupport getXpcProxyWithError:]",  v10,  v8,  v5,  v6,  v7,  v42);
LABEL_10:
    char v11 = 0LL;
    id v12 = 0LL;
    goto LABEL_11;
  }

  id v15 = objc_alloc(MEMORY[0x189607B30]);
  [a1 serviceXpcName];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  char v11 = (void *)[v15 initWithServiceName:v16];

  if (!v11)
  {
    [a1 serviceXpcName];
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m",  "+[AppleDeviceQuerySupportAssistantSupport getXpcProxyWithError:]",  200LL,  @"Failed to connect %@!",  v39,  v40,  v41,  (uint64_t)v38);

    [MEMORY[0x189607870] errorWithZhuGeErrorCode:67 underlyingError:0];
    id v37 = (id)objc_claimAutoreleasedReturnValue();
    char v11 = 0LL;
    id v12 = 0LL;
    goto LABEL_18;
  }

  if (isZhuGeInRestoreOS())
  {
    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C778A30];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 setExportedInterface:v17];

    uint64_t v18 = (void *)objc_opt_new();
    [v11 setExportedObject:v18];
  }

  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C77A9A0];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 setRemoteObjectInterface:v19];

  v46 = (void *)MEMORY[0x189604010];
  uint64_t v45 = objc_opt_class();
  uint64_t v44 = objc_opt_class();
  uint64_t v43 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  objc_msgSend(v46, "setWithObjects:", v45, v44, v43, v20, v21, v22, v23, v24, v25, objc_opt_class(), 0);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 remoteObjectInterface];
  id v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v26 setClasses:v12 forSelector:sel_setBulkKeys_getValuesAndError_ argumentIndex:0 ofReply:1];

  [v11 remoteObjectInterface];
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v27 setClasses:v12 forSelector:sel_setBulkInternalKeys_getValuesAndError_ argumentIndex:0 ofReply:1];

  [v11 remoteObjectInterface];
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v28 setClasses:v12 forSelector:sel_setBulkMGKeys_getValuesAndError_ argumentIndex:0 ofReply:1];

  [v11 remoteObjectInterface];
  id v29 = (void *)objc_claimAutoreleasedReturnValue();
  [v29 setClasses:v12 forSelector:sel_setBulkInternalMGKeys_getValuesAndError_ argumentIndex:0 ofReply:1];

  uint64_t v30 = MEMORY[0x1895F87A8];
  v48[0] = MEMORY[0x1895F87A8];
  v48[1] = 3221225472LL;
  v48[2] = __64__AppleDeviceQuerySupportAssistantSupport_getXpcProxyWithError___block_invoke_2;
  v48[3] = &__block_descriptor_40_e5_v8__0l;
  v48[4] = a1;
  [v11 setInvalidationHandler:v48];
  v47[0] = v30;
  v47[1] = 3221225472LL;
  v47[2] = __64__AppleDeviceQuerySupportAssistantSupport_getXpcProxyWithError___block_invoke_3;
  v47[3] = &__block_descriptor_40_e5_v8__0l;
  v47[4] = a1;
  [v11 setInterruptionHandler:v47];
  [v11 activate];
  uint64_t v31 = [v11 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_65];
  id v32 = (void *)getXpcProxyWithError__aProxy;
  getXpcProxyWithError__aProxy = v31;

  if (!getXpcProxyWithError__aProxy)
  {
    [a1 serviceXpcName];
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m",  "+[AppleDeviceQuerySupportAssistantSupport getXpcProxyWithError:]",  257LL,  @"Failed to get proxy for %@!",  v34,  v35,  v36,  (uint64_t)v33);

    [MEMORY[0x189607870] errorWithZhuGeErrorCode:66 underlyingError:0];
    id v37 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:
    *a3 = v37;
  }

uint64_t __64__AppleDeviceQuerySupportAssistantSupport_getXpcProxyWithError___block_invoke()
{
  return initPthreadRecursiveMutex(&getXpcProxyWithError__aRecursiveMutex);
}

uint64_t __64__AppleDeviceQuerySupportAssistantSupport_getXpcProxyWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m",  "+[AppleDeviceQuerySupportAssistantSupport getXpcProxyWithError:]_block_invoke_2",  235LL,  @"Connection to %@ invalidated!",  v3,  v4,  v5,  (uint64_t)v2);

  uint64_t v6 = (void *)getXpcProxyWithError__aProxy;
  getXpcProxyWithError__aProxy = 0LL;

  return pthread_mutex_unlock(&getXpcProxyWithError__aRecursiveMutex);
}

uint64_t __64__AppleDeviceQuerySupportAssistantSupport_getXpcProxyWithError___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m",  "+[AppleDeviceQuerySupportAssistantSupport getXpcProxyWithError:]_block_invoke_3",  241LL,  @"Connection to %@ interrupted!",  v3,  v4,  v5,  (uint64_t)v2);

  uint64_t v6 = (void *)getXpcProxyWithError__aProxy;
  getXpcProxyWithError__aProxy = 0LL;

  return pthread_mutex_unlock(&getXpcProxyWithError__aRecursiveMutex);
}

uint64_t __64__AppleDeviceQuerySupportAssistantSupport_getXpcProxyWithError___block_invoke_4( uint64_t a1,  void *a2)
{
  id v2 = a2;
  pthread_mutex_lock(&getXpcProxyWithError__aRecursiveMutex);
  ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeSupport/ZhuGeSupportAssistant.m",  "+[AppleDeviceQuerySupportAssistantSupport getXpcProxyWithError:]_block_invoke_4",  251LL,  @"Connection failed to provide a synchronized proxy, error : %@!",  v3,  v4,  v5,  (uint64_t)v2);

  uint64_t v6 = (void *)getXpcProxyWithError__aProxy;
  getXpcProxyWithError__aProxy = 0LL;

  return pthread_mutex_unlock(&getXpcProxyWithError__aRecursiveMutex);
}

@end