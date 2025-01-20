@interface AppleDeviceQueryInternalSupportAssistantSupport
+ (BOOL)isInternalAssistant;
+ (NSMutableArray)cacheList;
+ (_opaque_pthread_mutex_t)recursiveMutex;
+ (id)armoryClassName;
+ (id)classList;
+ (id)getInternalSupportPath;
+ (id)getXpcProxyWithError:(id *)a3;
+ (id)serviceXpcName;
+ (id)xpcProxy;
+ (void)dylibHandler;
+ (void)executeCacheRefresh;
+ (void)getDylibHandlerWithError:(id *)a3;
+ (void)registerCacheRefresh:(id)a3;
+ (void)setCacheList:(id)a3;
+ (void)setDylibHandler:(void *)a3;
+ (void)setXpcProxy:(id)a3;
@end

@implementation AppleDeviceQueryInternalSupportAssistantSupport

+ (_opaque_pthread_mutex_t)recursiveMutex
{
  if (recursiveMutex_aToken != -1) {
    dispatch_once(&recursiveMutex_aToken, &__block_literal_global_2);
  }
  return (_opaque_pthread_mutex_t *)&_recursiveMutex;
}

uint64_t __65__AppleDeviceQueryInternalSupportAssistantSupport_recursiveMutex__block_invoke()
{
  return initPthreadRecursiveMutex(&_recursiveMutex);
}

+ (void)setDylibHandler:(void *)a3
{
  _dylibHandler = (uint64_t)a3;
}

+ (void)dylibHandler
{
  return (void *)_dylibHandler;
}

+ (void)setXpcProxy:(id)a3
{
}

+ (id)xpcProxy
{
  return (id)_xpcProxy;
}

+ (void)setCacheList:(id)a3
{
}

+ (NSMutableArray)cacheList
{
  return (NSMutableArray *)(id)_cacheList;
}

+ (BOOL)isInternalAssistant
{
  return 1;
}

+ (id)classList
{
  return &unk_18A34EE20;
}

+ (id)armoryClassName
{
  return @"OBJC_CLASS_$_ZhuGeInternalArmory";
}

+ (id)serviceXpcName
{
  return @"com.apple.ZhuGeInternalService";
}

+ (void)executeCacheRefresh
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  pthread_mutex_lock((pthread_mutex_t *)[a1 recursiveMutex]);
  if ([a1 dylibHandler])
  {
    dlclose((void *)[a1 dylibHandler]);
    [a1 setDylibHandler:0];
  }

  [a1 setXpcProxy:0];
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  objc_msgSend(a1, "cacheList", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0LL;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) clearCache];
      }

      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }

    while (v5);
  }

  pthread_mutex_unlock((pthread_mutex_t *)[a1 recursiveMutex]);
}

+ (id)getInternalSupportPath
{
  uint64_t v45 = *MEMORY[0x1895F89C0];
  pthread_mutex_lock((pthread_mutex_t *)[a1 recursiveMutex]);
  [MEMORY[0x1896078A8] defaultManager];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v43 = 0;
  if (isZhuGeInRestoreOS())
  {
    ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m",  "+[AppleDeviceQueryInternalSupportAssistantSupport getInternalSupportPath]",  135LL,  @"Skip retrieving internal support path in restoreOS",  v4,  v5,  v6,  v37);
    id v7 = 0LL;
    __int128 v8 = 0LL;
LABEL_27:
    id v33 = 0LL;
    goto LABEL_28;
  }

  if ([v3 fileExistsAtPath:getInternalSupportPath_oldInternalSupportPath isDirectory:&v43]) {
    BOOL v9 = v43 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    __int128 v8 = (__CFString *)(id)getInternalSupportPath_oldInternalSupportPath;
    ZhuGeLog( 262400,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m",  "+[AppleDeviceQueryInternalSupportAssistantSupport getInternalSupportPath]",  142LL,  @"Retrieving unchanged internal supported path: %@",  v29,  v30,  v31,  (uint64_t)v8);
    id v7 = 0LL;
    goto LABEL_27;
  }

  __int128 v8 = @"/usr/local/ZhuGe/ZhuGeInternalSupport";
  if ([v3 fileExistsAtPath:@"/usr/local/ZhuGe/ZhuGeInternalSupport" isDirectory:&v43]) {
    BOOL v17 = v43 == 0;
  }
  else {
    BOOL v17 = 1;
  }
  if (v17)
  {
    id v42 = 0LL;
    getZhuGeFDIPathsWithError(&v42, v10, v11, v12, v13, v14, v15, v16);
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = v42;
    if (v33)
    {
      __int128 v40 = 0u;
      __int128 v41 = 0u;
      __int128 v38 = 0u;
      __int128 v39 = 0u;
      id v33 = v33;
      uint64_t v21 = [v33 countByEnumeratingWithState:&v38 objects:v44 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v39;
        do
        {
          for (uint64_t i = 0LL; i != v22; ++i)
          {
            if (*(void *)v39 != v23) {
              objc_enumerationMutation(v33);
            }
            v25 = v8;
            [NSString stringWithFormat:@"%@%@", *(void *)(*((void *)&v38 + 1) + 8 * i), v8, (void)v38];
            __int128 v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
            else {
              BOOL v26 = 1;
            }
            if (!v26)
            {

              goto LABEL_29;
            }

            __int128 v8 = v25;
          }

          uint64_t v22 = [v33 countByEnumeratingWithState:&v38 objects:v44 count:16];
        }

        while (v22);
      }

      v27 = @"Didn't find ZhuGe internal Support Path";
      uint64_t v28 = 167LL;
    }

    else
    {
      v27 = @"Failed to get FDI paths";
      uint64_t v28 = 155LL;
    }

    ZhuGeLog( 262656,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m",  "+[AppleDeviceQueryInternalSupportAssistantSupport getInternalSupportPath]",  v28,  v27,  v18,  v19,  v20,  v37);
    __int128 v8 = 0LL;
  }

  else
  {
    id v7 = 0LL;
    id v33 = 0LL;
LABEL_29:
    objc_storeStrong((id *)&getInternalSupportPath_oldInternalSupportPath, v8);
    ZhuGeLog( 524544,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m",  "+[AppleDeviceQueryInternalSupportAssistantSupport getInternalSupportPath]",  174LL,  @"ZhuGe internal support path is updated to: %@",  v34,  v35,  v36,  (uint64_t)v8);
    [a1 executeCacheRefresh];
  }

+ (void)getDylibHandlerWithError:(id *)a3
{
  v24[2] = *MEMORY[0x1895F89C0];
  pthread_mutex_lock((pthread_mutex_t *)[a1 recursiveMutex]);
  if (a3)
  {
    *a3 = 0LL;
    __int128 v8 = 0LL;
    id v9 = 0LL;
    if (![a1 dylibHandler])
    {
      uint64_t v10 = [a1 getInternalSupportPath];
      __int128 v8 = (void *)v10;
      if (!v10)
      {
        ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m",  "+[AppleDeviceQueryInternalSupportAssistantSupport getDylibHandlerWithError:]",  207LL,  @"Failed to get ZhuGe internal support path for dylib handler!",  v11,  v12,  v13,  v23);
        [MEMORY[0x189607870] errorWithZhuGeErrorCode:43 underlyingError:0];
        id v20 = (id)objc_claimAutoreleasedReturnValue();
        id v9 = 0LL;
        goto LABEL_10;
      }

      uint64_t v14 = (void *)NSString;
      v24[0] = v10;
      v24[1] = @"libZhuGeInternalArmory.dylib";
      [MEMORY[0x189603F18] arrayWithObjects:v24 count:2];
      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 pathWithComponents:v15];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

      if ([a1 dylibHandler])
      {
        dlclose((void *)[a1 dylibHandler]);
        [a1 setDylibHandler:0];
      }

      id v9 = v16;
      objc_msgSend(a1, "setDylibHandler:", dlopen((const char *)objc_msgSend(v9, "UTF8String"), 1));
      if (![a1 dylibHandler])
      {
        ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m",  "+[AppleDeviceQueryInternalSupportAssistantSupport getDylibHandlerWithError:]",  218LL,  @"Failed to dlopen ZhuGe internal armory dylib!",  v17,  v18,  v19,  v23);
        [MEMORY[0x189607870] errorWithZhuGeErrorCode:13 underlyingError:0];
        id v20 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
        *a3 = v20;
      }
    }
  }

  else
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m",  "+[AppleDeviceQueryInternalSupportAssistantSupport getDylibHandlerWithError:]",  194LL,  @"error p-pointer is nil!",  v5,  v6,  v7,  v23);
    __int128 v8 = 0LL;
    id v9 = 0LL;
  }

  pthread_mutex_unlock((pthread_mutex_t *)[a1 recursiveMutex]);
  uint64_t v21 = (void *)[a1 dylibHandler];

  return v21;
}

+ (void)registerCacheRefresh:(id)a3
{
  id v9 = a3;
  pthread_mutex_lock((pthread_mutex_t *)[a1 recursiveMutex]);
  if ((isZhuGeInRestoreOS() & 1) == 0)
  {
    [a1 cacheList];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x189603FA8]);
      [a1 setCacheList:v5];
    }

    [a1 cacheList];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    char v7 = [v6 containsObject:v9];

    if ((v7 & 1) == 0)
    {
      [a1 cacheList];
      __int128 v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 addObject:v9];
    }
  }

  pthread_mutex_unlock((pthread_mutex_t *)[a1 recursiveMutex]);
}

+ (id)getXpcProxyWithError:(id *)a3
{
  v49[2] = *MEMORY[0x1895F89C0];
  pthread_mutex_lock((pthread_mutex_t *)[a1 recursiveMutex]);
  if ((isZhuGeInRestoreOS() & 1) != 0) {
    goto LABEL_9;
  }
  if (!a3)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m",  "+[AppleDeviceQueryInternalSupportAssistantSupport getXpcProxyWithError:]",  273LL,  @"error p-pointer is nil!",  v5,  v6,  v7,  v40);
LABEL_9:
    id v9 = 0LL;
    id v10 = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v12 = 0LL;
    goto LABEL_10;
  }

  *a3 = 0LL;
  [a1 xpcProxy];
  __int128 v8 = (void *)objc_claimAutoreleasedReturnValue();

  id v9 = 0LL;
  id v10 = 0LL;
  uint64_t v11 = 0LL;
  uint64_t v12 = 0LL;
  if (v8) {
    goto LABEL_10;
  }
  uint64_t v13 = [a1 getInternalSupportPath];
  id v9 = (void *)v13;
  if (!v13)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m",  "+[AppleDeviceQueryInternalSupportAssistantSupport getXpcProxyWithError:]",  286LL,  @"Failed to get ZhuGe internal support path for xpc proxy!",  v14,  v15,  v16,  v40);
    [MEMORY[0x189607870] errorWithZhuGeErrorCode:43 underlyingError:0];
    id v37 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = 0LL;
    uint64_t v11 = 0LL;
LABEL_13:
    uint64_t v12 = 0LL;
    goto LABEL_14;
  }

  uint64_t v17 = (void *)NSString;
  v49[0] = v13;
  v49[1] = @"ZhuGeInternalService.xpc";
  [MEMORY[0x189603F18] arrayWithObjects:v49 count:2];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 pathWithComponents:v18];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

  id v10 = v19;
  [v10 UTF8String];
  xpc_add_bundle();
  uint64_t v11 = (void *)[objc_alloc(MEMORY[0x189607B30]) initWithServiceName:@"com.apple.ZhuGeInternalService"];
  if (!v11)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m",  "+[AppleDeviceQueryInternalSupportAssistantSupport getXpcProxyWithError:]",  297LL,  @"Failed to connect %@!",  v20,  v21,  v22,  (uint64_t)@"com.apple.ZhuGeInternalService");
    [MEMORY[0x189607870] errorWithZhuGeErrorCode:67 underlyingError:0];
    id v37 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }

  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C77AA88];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 setRemoteObjectInterface:v23];

  uint64_t v45 = (void *)MEMORY[0x189604010];
  uint64_t v44 = objc_opt_class();
  uint64_t v43 = objc_opt_class();
  uint64_t v42 = objc_opt_class();
  uint64_t v41 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  uint64_t v26 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  uint64_t v28 = objc_opt_class();
  objc_msgSend(v45, "setWithObjects:", v44, v43, v42, v41, v24, v25, v26, v27, v28, objc_opt_class(), 0);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 remoteObjectInterface];
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
  [v29 setClasses:v12 forSelector:sel_setBulkKeys_getValuesAndError_ argumentIndex:0 ofReply:1];

  [v11 remoteObjectInterface];
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v30 setClasses:v12 forSelector:sel_setBulkMGKeys_getValuesAndError_ argumentIndex:0 ofReply:1];

  uint64_t v31 = MEMORY[0x1895F87A8];
  v48[0] = MEMORY[0x1895F87A8];
  v48[1] = 3221225472LL;
  v48[2] = __72__AppleDeviceQueryInternalSupportAssistantSupport_getXpcProxyWithError___block_invoke;
  v48[3] = &__block_descriptor_40_e5_v8__0l;
  v48[4] = a1;
  [v11 setInvalidationHandler:v48];
  v47[0] = v31;
  v47[1] = 3221225472LL;
  v47[2] = __72__AppleDeviceQueryInternalSupportAssistantSupport_getXpcProxyWithError___block_invoke_2;
  v47[3] = &__block_descriptor_40_e5_v8__0l;
  v47[4] = a1;
  [v11 setInterruptionHandler:v47];
  [v11 activate];
  v46[0] = v31;
  v46[1] = 3221225472LL;
  v46[2] = __72__AppleDeviceQueryInternalSupportAssistantSupport_getXpcProxyWithError___block_invoke_3;
  v46[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v46[4] = a1;
  [v11 synchronousRemoteObjectProxyWithErrorHandler:v46];
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  [a1 setXpcProxy:v32];

  [a1 xpcProxy];
  id v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v33)
  {
    ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m",  "+[AppleDeviceQueryInternalSupportAssistantSupport getXpcProxyWithError:]",  339LL,  @"Failed to get proxy for %@!",  v34,  v35,  v36,  (uint64_t)@"com.apple.ZhuGeInternalService");
    [MEMORY[0x189607870] errorWithZhuGeErrorCode:66 underlyingError:0];
    id v37 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:
    *a3 = v37;
  }

uint64_t __72__AppleDeviceQueryInternalSupportAssistantSupport_getXpcProxyWithError___block_invoke( uint64_t a1)
{
  return pthread_mutex_unlock((pthread_mutex_t *)[*(id *)(a1 + 32) recursiveMutex]);
}

uint64_t __72__AppleDeviceQueryInternalSupportAssistantSupport_getXpcProxyWithError___block_invoke_2( uint64_t a1)
{
  return pthread_mutex_unlock((pthread_mutex_t *)[*(id *)(a1 + 32) recursiveMutex]);
}

uint64_t __72__AppleDeviceQueryInternalSupportAssistantSupport_getXpcProxyWithError___block_invoke_3( uint64_t a1,  void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  pthread_mutex_lock((pthread_mutex_t *)[v3 recursiveMutex]);
  ZhuGeLog( 1040,  "/Library/Caches/com.apple.xbs/Sources/ZhuGe/ZhuGeInternalSupport/ZhuGeInternalSupportAssistant.m",  "+[AppleDeviceQueryInternalSupportAssistantSupport getXpcProxyWithError:]_block_invoke_3",  333LL,  @"Internal connection failed to provide a synchronized proxy, error : %@!",  v5,  v6,  v7,  (uint64_t)v4);

  [*(id *)(a1 + 32) setXpcProxy:0];
  return pthread_mutex_unlock((pthread_mutex_t *)[*(id *)(a1 + 32) recursiveMutex]);
}

@end