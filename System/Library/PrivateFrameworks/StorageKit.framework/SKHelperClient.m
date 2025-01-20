@interface SKHelperClient
+ (id)sharedClient;
- (BOOL)_isRecachingDiskAbuse:(id)a3;
- (NSMutableDictionary)completionHandlers;
- (NSMutableDictionary)recacheAbuseLimiterInfo;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)xpcQueue;
- (SKHelperClient)init;
- (id)_parameters:(id)a3 valueAtIndex:(unint64_t)a4;
- (id)_scheduleCompletionUUID:(id)a3 forFunction:(const char *)a4 blocking:(BOOL)a5 withBlock:(id)a6;
- (id)_scheduleSyncCompletionUUID:(id)a3 forFunction:(const char *)a4 withBlock:(id)a5;
- (id)eraseWithEraser:(id)a3 completionBlock:(id)a4;
- (id)queueWithBlocking:(BOOL)a3;
- (id)remoteObjectWithUUID:(id)a3 errorHandler:(id)a4;
- (id)resize:(id)a3 toSize:(unint64_t)a4 completionBlock:(id)a5;
- (void)_abortAllCalls;
- (void)_scheduleCompletionUUID:(id)a3 forFunction:(const char *)a4 withBlock:(id)a5;
- (void)_scheduleCompletionUUID:(id)a3 progress:(id)a4 forFunction:(const char *)a5 withBlock:(id)a6;
- (void)childDisksForWholeDisk:(id)a3 blocking:(BOOL)a4 withCallbackBlock:(id)a5;
- (void)childDisksForWholeDisk:(id)a3 withCallbackBlock:(id)a4;
- (void)createXPCConnection;
- (void)diskForPath:(id)a3 blocking:(BOOL)a4 withCallbackBlock:(id)a5;
- (void)diskForPath:(id)a3 withCallbackBlock:(id)a4;
- (void)disksAppeared:(id)a3;
- (void)disksChanged:(id)a3;
- (void)disksDisappeared:(id)a3;
- (void)ejectDisk:(id)a3 blocking:(BOOL)a4 withCompletionBlock:(id)a5;
- (void)ejectDisk:(id)a3 withCompletionBlock:(id)a4;
- (void)filesystemsWithBlocking:(BOOL)a3 callbackBlock:(id)a4;
- (void)filesystemsWithCallbackBlock:(id)a3;
- (void)initialPopulateComplete;
- (void)isBusy:(id)a3;
- (void)isBusyWithBlocking:(BOOL)a3 completionBlock:(id)a4;
- (void)managerResumed;
- (void)managerStalled;
- (void)mountDisk:(id)a3 options:(id)a4 blocking:(BOOL)a5 completionBlock:(id)a6;
- (void)mountDisk:(id)a3 options:(id)a4 completionBlock:(id)a5;
- (void)physicalStoresForAPFSVolume:(id)a3 blocking:(BOOL)a4 completionBlock:(id)a5;
- (void)physicalStoresForAPFSVolume:(id)a3 completionBlock:(id)a4;
- (void)recacheDisk:(id)a3 options:(unint64_t)a4 blocking:(BOOL)a5 callbackBlock:(id)a6;
- (void)recacheDisk:(id)a3 options:(unint64_t)a4 callbackBlock:(id)a5;
- (void)renameDisk:(id)a3 to:(id)a4 withCompletionBlock:(id)a5;
- (void)requestWithUUID:(id)a3 didCompleteWithResult:(id)a4;
- (void)setCallbackQueue:(id)a3;
- (void)setDaemonOptionsWithLanguage:(id)a3 authRef:(unsigned __int8)a4 withCompletionBlock:(id)a5;
- (void)setRecacheAbuseLimiterInfo:(id)a3;
- (void)syncAllDisksWithBlocking:(BOOL)a3 completionBlock:(id)a4;
- (void)syncAllDisksWithCompletionBlock:(id)a3;
- (void)unmountDisk:(id)a3 options:(id)a4 blocking:(BOOL)a5 withCompletionBlock:(id)a6;
- (void)unmountDisk:(id)a3 options:(id)a4 withCompletionBlock:(id)a5;
- (void)unmountDisk:(id)a3 withCompletionBlock:(id)a4;
- (void)updateUUID:(id)a3 progress:(float)a4 message:(id)a5;
- (void)volumesForAPFSPS:(id)a3 blocking:(BOOL)a4 completionBlock:(id)a5;
- (void)volumesForAPFSPS:(id)a3 completionBlock:(id)a4;
- (void)wholeDiskForDisk:(id)a3 blocking:(BOOL)a4 withCallbackBlock:(id)a5;
- (void)wholeDiskForDisk:(id)a3 withCallbackBlock:(id)a4;
@end

@implementation SKHelperClient

+ (id)sharedClient
{
  if (sharedClient_once != -1) {
    dispatch_once(&sharedClient_once, &__block_literal_global_10);
  }
  return (id)sSharedClient;
}

void __30__SKHelperClient_sharedClient__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___SKHelperClient);
  v1 = (void *)sSharedClient;
  sSharedClient = (uint64_t)v0;
}

- (SKHelperClient)init
{
  v17.receiver = self;
  v17.super_class = (Class)&OBJC_CLASS___SKHelperClient;
  v2 = -[SKHelperClient init](&v17, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    completionHandlers = v2->_completionHandlers;
    v2->_completionHandlers = v3;

    id v5 = objc_alloc_init(MEMORY[0x189603FC8]);
    -[SKHelperClient setRecacheAbuseLimiterInfo:](v2, "setRecacheAbuseLimiterInfo:", v5);

    -[SKHelperClient createXPCConnection](v2, "createXPCConnection");
    v6 = -[SKHelperClient xpcConnection](v2, "xpcConnection");
    uint64_t v7 = [v6 _queue];
    xpcQueue = v2->_xpcQueue;
    v2->_xpcQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.StorageKit.Callbacks", 0LL);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v9;

    uint64_t v12 = MEMORY[0x1895F87A8];
    uint64_t v13 = 3221225472LL;
    v14 = __22__SKHelperClient_init__block_invoke;
    v15 = &unk_18A3239C8;
    v16 = @"English";
    -[SKHelperClient setDaemonOptionsWithLanguage:authRef:withCompletionBlock:]( v2,  "setDaemonOptionsWithLanguage:authRef:withCompletionBlock:");
  }

  return v2;
}

void __22__SKHelperClient_init__block_invoke(uint64_t a1, int a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (a2)
  {
    SKGetOSLog();
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v10 = 138543362;
      uint64_t v11 = v4;
      id v5 = "Connected to daemon. Language set to: %{public}@";
      v6 = v3;
      os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
      uint32_t v8 = 12;
LABEL_6:
      _os_log_impl(&dword_188F75000, v6, v7, v5, (uint8_t *)&v10, v8);
    }
  }

  else
  {
    +[SKBaseManager sharedManager](&OBJC_CLASS___SKBaseManager, "sharedManager");
    dispatch_queue_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 logEvent:@"com.apple.StorageKit.log.fault" eventPayloadBuilder:&__block_literal_global_54];

    SKGetOSLog();
    v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v10) = 0;
      id v5 = "Daemon failed to respond.";
      v6 = v3;
      os_log_type_t v7 = OS_LOG_TYPE_FAULT;
      uint32_t v8 = 2;
      goto LABEL_6;
    }
  }
}

id __22__SKHelperClient_init__block_invoke_52()
{
  v4[1] = *MEMORY[0x1895F89C0];
  v3 = @"faultCode";
  base64Encode((uint64_t)"SKHelperClient.m", 145LL);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  [MEMORY[0x189603F68] dictionaryWithObjects:v4 forKeys:&v3 count:1];
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (id)queueWithBlocking:(BOOL)a3
{
  if (a3) {
    -[SKHelperClient xpcQueue](self, "xpcQueue");
  }
  else {
    -[SKHelperClient callbackQueue](self, "callbackQueue");
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)syncAllDisksWithBlocking:(BOOL)a3 completionBlock:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [MEMORY[0x189607AB8] UUID];
  os_log_type_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 UUIDString];
  uint32_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v9 = MEMORY[0x1895F87A8];
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __59__SKHelperClient_syncAllDisksWithBlocking_completionBlock___block_invoke;
  v17[3] = &unk_18A3239F0;
  id v19 = v6;
  v17[4] = self;
  id v10 = v8;
  id v18 = v10;
  id v11 = v6;
  -[SKHelperClient _scheduleCompletionUUID:forFunction:blocking:withBlock:]( self,  "_scheduleCompletionUUID:forFunction:blocking:withBlock:",  v10,  "-[SKHelperClient syncAllDisksWithBlocking:completionBlock:]",  v4,  v17);
  uint64_t v12 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472LL;
  v15[2] = __59__SKHelperClient_syncAllDisksWithBlocking_completionBlock___block_invoke_2;
  v15[3] = &unk_18A323A18;
  v15[4] = self;
  id v13 = v10;
  id v16 = v13;
  v14 = -[SKHelperClient remoteObjectWithUUID:errorHandler:](self, "remoteObjectWithUUID:errorHandler:", v13, v15);
  [v14 syncAllDisksWithCompletionUUID:v13];

  if (v12) {
    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __59__SKHelperClient_syncAllDisksWithBlocking_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  [*(id *)(a1 + 32) completionHandlers];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 semaphore];
  id v6 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue();
  os_log_type_t v7 = v6;
  if (v6) {
    dispatch_semaphore_signal(v6);
  }
}

uint64_t __59__SKHelperClient_syncAllDisksWithBlocking_completionBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) requestWithUUID:*(void *)(a1 + 40) didCompleteWithResult:&unk_18A3300F0];
}

- (void)syncAllDisksWithCompletionBlock:(id)a3
{
}

- (void)setDaemonOptionsWithLanguage:(id)a3 authRef:(unsigned __int8)a4 withCompletionBlock:(id)a5
{
  uint64_t v5 = a4;
  id v8 = a5;
  uint64_t v9 = (void *)MEMORY[0x189607AB8];
  id v10 = a3;
  [v9 UUID];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 UUIDString];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v13 = MEMORY[0x1895F87A8];
  v23[0] = MEMORY[0x1895F87A8];
  v23[1] = 3221225472LL;
  v23[2] = __75__SKHelperClient_setDaemonOptionsWithLanguage_authRef_withCompletionBlock___block_invoke;
  v23[3] = &unk_18A323A40;
  v23[4] = self;
  id v24 = v8;
  id v14 = v8;
  -[SKHelperClient _scheduleCompletionUUID:forFunction:withBlock:]( self,  "_scheduleCompletionUUID:forFunction:withBlock:",  v12,  "-[SKHelperClient setDaemonOptionsWithLanguage:authRef:withCompletionBlock:]",  v23);
  uint64_t v17 = v13;
  uint64_t v18 = 3221225472LL;
  id v19 = __75__SKHelperClient_setDaemonOptionsWithLanguage_authRef_withCompletionBlock___block_invoke_2;
  v20 = &unk_18A323A18;
  v21 = self;
  id v22 = v12;
  id v15 = v12;
  -[SKHelperClient remoteObjectWithUUID:errorHandler:](self, "remoteObjectWithUUID:errorHandler:", v15, &v17);
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDaemonOptionsWithLanguage:authRef:withCompletionUUID:", v10, v5, v15, v17, v18, v19, v20, v21);
}

uint64_t __75__SKHelperClient_setDaemonOptionsWithLanguage_authRef_withCompletionBlock___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 BOOLValue];

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v4);
  }
  return result;
}

uint64_t __75__SKHelperClient_setDaemonOptionsWithLanguage_authRef_withCompletionBlock___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 32) requestWithUUID:*(void *)(a1 + 40) didCompleteWithResult:&unk_18A330108];
}

- (void)renameDisk:(id)a3 to:(id)a4 withCompletionBlock:(id)a5
{
  id v8 = a5;
  uint64_t v9 = (void *)MEMORY[0x189607AB8];
  id v10 = a4;
  id v11 = a3;
  [v9 UUID];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 UUIDString];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v14 = MEMORY[0x1895F87A8];
  v25[0] = MEMORY[0x1895F87A8];
  v25[1] = 3221225472LL;
  v25[2] = __52__SKHelperClient_renameDisk_to_withCompletionBlock___block_invoke;
  v25[3] = &unk_18A323A68;
  v25[4] = self;
  id v26 = v8;
  id v15 = v8;
  -[SKHelperClient _scheduleCompletionUUID:forFunction:withBlock:]( self,  "_scheduleCompletionUUID:forFunction:withBlock:",  v13,  "-[SKHelperClient renameDisk:to:withCompletionBlock:]",  v25);
  uint64_t v19 = v14;
  uint64_t v20 = 3221225472LL;
  v21 = __52__SKHelperClient_renameDisk_to_withCompletionBlock___block_invoke_2;
  id v22 = &unk_18A323A18;
  v23 = self;
  id v24 = v13;
  id v16 = v13;
  -[SKHelperClient remoteObjectWithUUID:errorHandler:](self, "remoteObjectWithUUID:errorHandler:", v16, &v19);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "minimalDictionaryRepresentation", v19, v20, v21, v22, v23);
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();

  [v17 renameDisk:v18 to:v10 withCompletionUUID:v16];
}

void __52__SKHelperClient_renameDisk_to_withCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 40))
  {
    [*(id *)(a1 + 32) _parameters:a2 valueAtIndex:0];
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

void __52__SKHelperClient_renameDisk_to_withCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  os_log_type_t v7 = a2;
  uint64_t v4 = (void *)MEMORY[0x189603F18];
  id v5 = a2;
  [v4 arrayWithObjects:&v7 count:1];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestWithUUID:didCompleteWithResult:", v3, v6, v7, v8);
}

- (void)recacheDisk:(id)a3 options:(unint64_t)a4 blocking:(BOOL)a5 callbackBlock:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a6;
  if ((a4 & 2) != 0 || v7 || !-[SKHelperClient _isRecachingDiskAbuse:](self, "_isRecachingDiskAbuse:", v10))
  {
    [MEMORY[0x189607AB8] UUID];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 UUIDString];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v17 = MEMORY[0x1895F87A8];
    v28[0] = MEMORY[0x1895F87A8];
    v28[1] = 3221225472LL;
    v28[2] = __61__SKHelperClient_recacheDisk_options_blocking_callbackBlock___block_invoke_66;
    v28[3] = &unk_18A3239F0;
    id v30 = v11;
    v28[4] = self;
    id v18 = v16;
    id v29 = v18;
    id v14 = v11;
    -[SKHelperClient _scheduleCompletionUUID:forFunction:blocking:withBlock:]( self,  "_scheduleCompletionUUID:forFunction:blocking:withBlock:",  v18,  "-[SKHelperClient recacheDisk:options:blocking:callbackBlock:]",  v7,  v28);
    uint64_t v19 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = v17;
    uint64_t v23 = 3221225472LL;
    id v24 = __61__SKHelperClient_recacheDisk_options_blocking_callbackBlock___block_invoke_2;
    v25 = &unk_18A323A18;
    id v26 = self;
    id v13 = v18;
    id v27 = v13;
    -[SKHelperClient remoteObjectWithUUID:errorHandler:](self, "remoteObjectWithUUID:errorHandler:", v13, &v22);
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "minimalDictionaryRepresentation", v22, v23, v24, v25, v26);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 recacheDisk:v21 options:a4 withCompletionUUID:v13];

    if (v19) {
      dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
    }
  }

  else
  {
    -[SKHelperClient callbackQueue](self, "callbackQueue");
    uint64_t v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __61__SKHelperClient_recacheDisk_options_blocking_callbackBlock___block_invoke;
    block[3] = &unk_18A323230;
    id v32 = v11;
    id v13 = v11;
    dispatch_async(v12, block);

    id v14 = v32;
  }
}

uint64_t __61__SKHelperClient_recacheDisk_options_blocking_callbackBlock___block_invoke(uint64_t a1)
{
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl( &dword_188F75000,  v2,  OS_LOG_TYPE_ERROR,  "Caller has hit recacheDisk: abuse limit. Disk data may be stale",  v4,  2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __61__SKHelperClient_recacheDisk_options_blocking_callbackBlock___block_invoke_66(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }
  [*(id *)(a1 + 32) completionHandlers];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 semaphore];
  id v6 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue();
  BOOL v7 = v6;
  if (v6) {
    dispatch_semaphore_signal(v6);
  }
}

uint64_t __61__SKHelperClient_recacheDisk_options_blocking_callbackBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) requestWithUUID:*(void *)(a1 + 40) didCompleteWithResult:MEMORY[0x189604A58]];
}

- (void)recacheDisk:(id)a3 options:(unint64_t)a4 callbackBlock:(id)a5
{
}

- (void)diskForPath:(id)a3 blocking:(BOOL)a4 withCallbackBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  uint64_t v9 = (void *)MEMORY[0x189607AB8];
  id v10 = a3;
  [v9 UUID];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 UUIDString];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v13 = MEMORY[0x1895F87A8];
  v25[0] = MEMORY[0x1895F87A8];
  v25[1] = 3221225472LL;
  v25[2] = __57__SKHelperClient_diskForPath_blocking_withCallbackBlock___block_invoke;
  v25[3] = &unk_18A323AB8;
  v25[4] = self;
  id v14 = v12;
  id v26 = v14;
  id v27 = v8;
  BOOL v28 = v5;
  id v15 = v8;
  -[SKHelperClient _scheduleCompletionUUID:forFunction:blocking:withBlock:]( self,  "_scheduleCompletionUUID:forFunction:blocking:withBlock:",  v14,  "-[SKHelperClient diskForPath:blocking:withCallbackBlock:]",  v5,  v25);
  id v16 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = v13;
  uint64_t v20 = 3221225472LL;
  v21 = __57__SKHelperClient_diskForPath_blocking_withCallbackBlock___block_invoke_3;
  uint64_t v22 = &unk_18A323A18;
  uint64_t v23 = self;
  id v17 = v14;
  id v24 = v17;
  -[SKHelperClient remoteObjectWithUUID:errorHandler:](self, "remoteObjectWithUUID:errorHandler:", v17, &v19);
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "diskForPath:withCompletionUUID:", v10, v17, v19, v20, v21, v22, v23);

  if (v16) {
    dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __57__SKHelperClient_diskForPath_blocking_withCallbackBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) completionHandlers];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 semaphore];
  id v6 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue();

  if (*(void *)(a1 + 48))
  {
    [*(id *)(a1 + 32) _parameters:v3 valueAtIndex:0];
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKManager sharedManager](&OBJC_CLASS___SKManager, "sharedManager");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __57__SKHelperClient_diskForPath_blocking_withCallbackBlock___block_invoke_2;
    v10[3] = &unk_18A323A90;
    id v12 = *(id *)(a1 + 48);
    id v11 = v6;
    objc_msgSend( *(id *)(a1 + 32),  "queueWithBlocking:",  *(unsigned __int8 *)(a1 + 56),  v10[0],  3221225472,  __57__SKHelperClient_diskForPath_blocking_withCallbackBlock___block_invoke_2,  &unk_18A323A90);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 knownDiskForDictionary:v7 notify:v10 onQueue:v9];
  }

  else if (v6)
  {
    dispatch_semaphore_signal(v6);
  }
}

dispatch_semaphore_s *__57__SKHelperClient_diskForPath_blocking_withCallbackBlock___block_invoke_2( uint64_t a1)
{
  uint64_t result = *(dispatch_semaphore_s **)(a1 + 32);
  if (result) {
    return (dispatch_semaphore_s *)dispatch_semaphore_signal(result);
  }
  return result;
}

void __57__SKHelperClient_diskForPath_blocking_withCallbackBlock___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  SKGetOSLog();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SKHelperClient diskForPath:blocking:withCallbackBlock:]_block_invoke_3";
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_188F75000, v4, OS_LOG_TYPE_ERROR, "%s ** error: %@", buf, 0x16u);
  }

  id v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  [MEMORY[0x189603FE8] null];
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = v7;
  [MEMORY[0x189603F18] arrayWithObjects:&v9 count:1];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 requestWithUUID:v5 didCompleteWithResult:v8];
}

- (void)diskForPath:(id)a3 withCallbackBlock:(id)a4
{
}

- (void)wholeDiskForDisk:(id)a3 blocking:(BOOL)a4 withCallbackBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  uint64_t v9 = (void *)MEMORY[0x189607AB8];
  id v10 = a3;
  [v9 UUID];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 UUIDString];
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v13 = MEMORY[0x1895F87A8];
  v26[0] = MEMORY[0x1895F87A8];
  v26[1] = 3221225472LL;
  v26[2] = __62__SKHelperClient_wholeDiskForDisk_blocking_withCallbackBlock___block_invoke;
  v26[3] = &unk_18A323AB8;
  v26[4] = self;
  id v14 = v12;
  id v27 = v14;
  id v28 = v8;
  BOOL v29 = v5;
  id v15 = v8;
  -[SKHelperClient _scheduleCompletionUUID:forFunction:blocking:withBlock:]( self,  "_scheduleCompletionUUID:forFunction:blocking:withBlock:",  v14,  "-[SKHelperClient wholeDiskForDisk:blocking:withCallbackBlock:]",  v5,  v26);
  id v16 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = v13;
  uint64_t v21 = 3221225472LL;
  uint64_t v22 = __62__SKHelperClient_wholeDiskForDisk_blocking_withCallbackBlock___block_invoke_3;
  uint64_t v23 = &unk_18A323A18;
  id v24 = self;
  id v17 = v14;
  id v25 = v17;
  -[SKHelperClient remoteObjectWithUUID:errorHandler:](self, "remoteObjectWithUUID:errorHandler:", v17, &v20);
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minimalDictionaryRepresentation", v20, v21, v22, v23, v24);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

  [v18 wholeDiskForDiskDictionary:v19 withCompletionUUID:v17];
  if (v16) {
    dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __62__SKHelperClient_wholeDiskForDisk_blocking_withCallbackBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) completionHandlers];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 semaphore];
  id v6 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue();

  if (*(void *)(a1 + 48))
  {
    [*(id *)(a1 + 32) _parameters:v3 valueAtIndex:0];
    BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKManager sharedManager](&OBJC_CLASS___SKManager, "sharedManager");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __62__SKHelperClient_wholeDiskForDisk_blocking_withCallbackBlock___block_invoke_2;
    v10[3] = &unk_18A323A90;
    id v12 = *(id *)(a1 + 48);
    id v11 = v6;
    objc_msgSend( *(id *)(a1 + 32),  "queueWithBlocking:",  *(unsigned __int8 *)(a1 + 56),  v10[0],  3221225472,  __62__SKHelperClient_wholeDiskForDisk_blocking_withCallbackBlock___block_invoke_2,  &unk_18A323A90);
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 knownDiskForDictionary:v7 notify:v10 onQueue:v9];
  }

  else if (v6)
  {
    dispatch_semaphore_signal(v6);
  }
}

dispatch_semaphore_s *__62__SKHelperClient_wholeDiskForDisk_blocking_withCallbackBlock___block_invoke_2( uint64_t a1)
{
  uint64_t result = *(dispatch_semaphore_s **)(a1 + 32);
  if (result) {
    return (dispatch_semaphore_s *)dispatch_semaphore_signal(result);
  }
  return result;
}

void __62__SKHelperClient_wholeDiskForDisk_blocking_withCallbackBlock___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  SKGetOSLog();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SKHelperClient wholeDiskForDisk:blocking:withCallbackBlock:]_block_invoke_3";
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_188F75000, v4, OS_LOG_TYPE_ERROR, "%s ** error: %@", buf, 0x16u);
  }

  id v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  [MEMORY[0x189603FE8] null];
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = v7;
  [MEMORY[0x189603F18] arrayWithObjects:&v9 count:1];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 requestWithUUID:v5 didCompleteWithResult:v8];
}

- (void)wholeDiskForDisk:(id)a3 withCallbackBlock:(id)a4
{
}

- (void)childDisksForWholeDisk:(id)a3 blocking:(BOOL)a4 withCallbackBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  uint64_t v9 = (void *)MEMORY[0x189607AB8];
  id v10 = a3;
  [v9 UUID];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 UUIDString];
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v13 = MEMORY[0x1895F87A8];
  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  v22[2] = __68__SKHelperClient_childDisksForWholeDisk_blocking_withCallbackBlock___block_invoke;
  v22[3] = &unk_18A3239F0;
  id v24 = v8;
  v22[4] = self;
  id v14 = v12;
  id v23 = v14;
  id v15 = v8;
  -[SKHelperClient _scheduleCompletionUUID:forFunction:blocking:withBlock:]( self,  "_scheduleCompletionUUID:forFunction:blocking:withBlock:",  v14,  "-[SKHelperClient childDisksForWholeDisk:blocking:withCallbackBlock:]",  v5,  v22);
  id v16 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue();
  v20[0] = v13;
  v20[1] = 3221225472LL;
  v20[2] = __68__SKHelperClient_childDisksForWholeDisk_blocking_withCallbackBlock___block_invoke_2;
  v20[3] = &unk_18A323A18;
  v20[4] = self;
  id v17 = v14;
  id v21 = v17;
  -[SKHelperClient remoteObjectWithUUID:errorHandler:](self, "remoteObjectWithUUID:errorHandler:", v17, v20);
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 minimalDictionaryRepresentation];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();

  [v18 childDisksForWholeDisk:v19 withCompletionUUID:v17];
  if (v16) {
    dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __68__SKHelperClient_childDisksForWholeDisk_blocking_withCallbackBlock___block_invoke( uint64_t a1,  void *a2)
{
  id v11 = a2;
  if (*(void *)(a1 + 48))
  {
    [*(id *)(a1 + 32) _parameters:v11 valueAtIndex:0];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v4 = *(void *)(a1 + 48);
    +[SKManager sharedManager](&OBJC_CLASS___SKManager, "sharedManager");
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 knownDisksForDictionaries:v3];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v6);
  }

  [*(id *)(a1 + 32) completionHandlers];
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 semaphore];
  uint64_t v9 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue();
  id v10 = v9;
  if (v9) {
    dispatch_semaphore_signal(v9);
  }
}

void __68__SKHelperClient_childDisksForWholeDisk_blocking_withCallbackBlock___block_invoke_2( uint64_t a1,  void *a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  SKGetOSLog();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SKHelperClient childDisksForWholeDisk:blocking:withCallbackBlock:]_block_invoke_2";
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_188F75000, v4, OS_LOG_TYPE_ERROR, "%s ** error: %@", buf, 0x16u);
  }

  id v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  [MEMORY[0x189603FE8] null];
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = v7;
  [MEMORY[0x189603F18] arrayWithObjects:&v9 count:1];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 requestWithUUID:v5 didCompleteWithResult:v8];
}

- (void)childDisksForWholeDisk:(id)a3 withCallbackBlock:(id)a4
{
}

- (void)isBusyWithBlocking:(BOOL)a3 completionBlock:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [MEMORY[0x189607AB8] UUID];
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 UUIDString];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v9 = MEMORY[0x1895F87A8];
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __53__SKHelperClient_isBusyWithBlocking_completionBlock___block_invoke;
  v17[3] = &unk_18A3239F0;
  id v19 = v6;
  v17[4] = self;
  id v10 = v8;
  id v18 = v10;
  id v11 = v6;
  -[SKHelperClient _scheduleCompletionUUID:forFunction:blocking:withBlock:]( self,  "_scheduleCompletionUUID:forFunction:blocking:withBlock:",  v10,  "-[SKHelperClient isBusyWithBlocking:completionBlock:]",  v4,  v17);
  __int16 v12 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472LL;
  v15[2] = __53__SKHelperClient_isBusyWithBlocking_completionBlock___block_invoke_2;
  v15[3] = &unk_18A323A18;
  v15[4] = self;
  id v13 = v10;
  id v16 = v13;
  -[SKHelperClient remoteObjectWithUUID:errorHandler:](self, "remoteObjectWithUUID:errorHandler:", v13, v15);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 isBusyWithCompletionUUID:v13];

  if (v12) {
    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __53__SKHelperClient_isBusyWithBlocking_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (*(void *)(a1 + 48))
  {
    [*(id *)(a1 + 32) _parameters:v8 valueAtIndex:0];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 BOOLValue];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  [*(id *)(a1 + 32) completionHandlers];
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 semaphore];
  id v6 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue();
  BOOL v7 = v6;
  if (v6) {
    dispatch_semaphore_signal(v6);
  }
}

uint64_t __53__SKHelperClient_isBusyWithBlocking_completionBlock___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) requestWithUUID:*(void *)(a1 + 40) didCompleteWithResult:&unk_18A330120];
}

- (void)isBusy:(id)a3
{
}

- (void)filesystemsWithBlocking:(BOOL)a3 callbackBlock:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [MEMORY[0x189607AB8] UUID];
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 UUIDString];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v9 = MEMORY[0x1895F87A8];
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __56__SKHelperClient_filesystemsWithBlocking_callbackBlock___block_invoke;
  v17[3] = &unk_18A323AE0;
  v17[4] = self;
  id v19 = v6;
  id v10 = v8;
  id v18 = v10;
  id v11 = v6;
  -[SKHelperClient _scheduleCompletionUUID:forFunction:blocking:withBlock:]( self,  "_scheduleCompletionUUID:forFunction:blocking:withBlock:",  v10,  "-[SKHelperClient filesystemsWithBlocking:callbackBlock:]",  v4,  v17);
  __int16 v12 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472LL;
  v15[2] = __56__SKHelperClient_filesystemsWithBlocking_callbackBlock___block_invoke_2;
  v15[3] = &unk_18A323A18;
  v15[4] = self;
  id v13 = v10;
  id v16 = v13;
  -[SKHelperClient remoteObjectWithUUID:errorHandler:](self, "remoteObjectWithUUID:errorHandler:", v13, v15);
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 filesystemsWithCompletionUUID:v13];

  if (v12) {
    dispatch_semaphore_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __56__SKHelperClient_filesystemsWithBlocking_callbackBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) _parameters:a2 valueAtIndex:0];
  uint64_t v4 = *(void *)(a1 + 48);
  id v9 = (id)v3;
  if (v4) {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v3);
  }
  [*(id *)(a1 + 32) completionHandlers];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 semaphore];
  BOOL v7 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
  if (v7) {
    dispatch_semaphore_signal(v7);
  }
}

void __56__SKHelperClient_filesystemsWithBlocking_callbackBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  SKGetOSLog();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SKHelperClient filesystemsWithBlocking:callbackBlock:]_block_invoke_2";
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_188F75000, v4, OS_LOG_TYPE_ERROR, "%s ** error: %@", buf, 0x16u);
  }

  id v6 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  [MEMORY[0x189603FE8] null];
  BOOL v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = v7;
  [MEMORY[0x189603F18] arrayWithObjects:&v9 count:1];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 requestWithUUID:v5 didCompleteWithResult:v8];
}

- (void)filesystemsWithCallbackBlock:(id)a3
{
}

- (void)physicalStoresForAPFSVolume:(id)a3 blocking:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = (void *)MEMORY[0x189607AB8];
  id v10 = a3;
  [v9 UUID];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 UUIDString];
  __int16 v12 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v13 = MEMORY[0x1895F87A8];
  v26[0] = MEMORY[0x1895F87A8];
  v26[1] = 3221225472LL;
  v26[2] = __71__SKHelperClient_physicalStoresForAPFSVolume_blocking_completionBlock___block_invoke;
  v26[3] = &unk_18A323AB8;
  v26[4] = self;
  id v14 = v12;
  BOOL v29 = v5;
  id v27 = v14;
  id v28 = v8;
  id v15 = v8;
  -[SKHelperClient _scheduleCompletionUUID:forFunction:blocking:withBlock:]( self,  "_scheduleCompletionUUID:forFunction:blocking:withBlock:",  v14,  "-[SKHelperClient physicalStoresForAPFSVolume:blocking:completionBlock:]",  v5,  v26);
  id v16 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = v13;
  uint64_t v21 = 3221225472LL;
  uint64_t v22 = __71__SKHelperClient_physicalStoresForAPFSVolume_blocking_completionBlock___block_invoke_5;
  id v23 = &unk_18A323A18;
  id v24 = self;
  id v17 = v14;
  id v25 = v17;
  -[SKHelperClient remoteObjectWithUUID:errorHandler:](self, "remoteObjectWithUUID:errorHandler:", v17, &v20);
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minimalDictionaryRepresentation", v20, v21, v22, v23, v24);
  id v19 = (void *)objc_claimAutoreleasedReturnValue();

  [v18 physicalStoresForAPFSVolume:v19 withCompletionUUID:v17];
  if (v16) {
    dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __71__SKHelperClient_physicalStoresForAPFSVolume_blocking_completionBlock___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v17 = a2;
  [*(id *)(a1 + 32) completionHandlers];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 semaphore];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) _parameters:v17 valueAtIndex:0];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = 0LL;
  v33[1] = v33;
  v33[2] = 0x3032000000LL;
  v33[3] = __Block_byref_object_copy__3;
  v33[4] = __Block_byref_object_dispose__3;
  id v34 = (id)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  id v6 = dispatch_queue_create("com.apple.storagekitd.diskeval", 0LL);
  BOOL v7 = dispatch_group_create();
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
  uint64_t v9 = MEMORY[0x1895F87A8];
  if (v8)
  {
    uint64_t v10 = *(void *)v30;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        dispatch_group_enter(v7);
        block[0] = v9;
        block[1] = 3221225472LL;
        block[2] = __71__SKHelperClient_physicalStoresForAPFSVolume_blocking_completionBlock___block_invoke_74;
        block[3] = &unk_18A323B08;
        void block[4] = v12;
        id v28 = v33;
        id v27 = v7;
        dispatch_async(v6, block);
      }

      uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v35 count:16];
    }

    while (v8);
  }

  v19[0] = v9;
  v19[1] = 3221225472LL;
  v19[2] = __71__SKHelperClient_physicalStoresForAPFSVolume_blocking_completionBlock___block_invoke_3;
  v19[3] = &unk_18A323B58;
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v20 = v7;
  uint64_t v21 = v13;
  char v25 = *(_BYTE *)(a1 + 56);
  id v23 = *(id *)(a1 + 48);
  id v24 = v33;
  id v22 = v16;
  id v14 = v16;
  id v15 = v7;
  dispatch_sync(v6, v19);

  _Block_object_dispose(v33, 8);
}

void __71__SKHelperClient_physicalStoresForAPFSVolume_blocking_completionBlock___block_invoke_74(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __71__SKHelperClient_physicalStoresForAPFSVolume_blocking_completionBlock___block_invoke_2;
  v7[3] = &unk_18A3232A8;
  __int128 v6 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v6;
  __int128 v8 = v6;
  dispatch_get_global_queue(0LL, 0LL);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 knownDiskForDictionary:v3 notify:v7 onQueue:v5];
}

void __71__SKHelperClient_physicalStoresForAPFSVolume_blocking_completionBlock___block_invoke_2( uint64_t a1,  void *a2)
{
  id v4 = a2;
  id v3 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
  objc_sync_enter(v3);
  if (v4) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v4];
  }
  objc_sync_exit(v3);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __71__SKHelperClient_physicalStoresForAPFSVolume_blocking_completionBlock___block_invoke_3(uint64_t a1)
{
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __71__SKHelperClient_physicalStoresForAPFSVolume_blocking_completionBlock___block_invoke_4;
  block[3] = &unk_18A323B30;
  id v3 = *(id *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  id v7 = v3;
  uint64_t v8 = v4;
  id v6 = *(id *)(a1 + 48);
  dispatch_async(v2, block);
}

dispatch_semaphore_s *__71__SKHelperClient_physicalStoresForAPFSVolume_blocking_completionBlock___block_invoke_4( void *a1)
{
  uint64_t v2 = a1[5];
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(*(void *)(a1[6] + 8LL) + 40LL));
  }
  uint64_t result = (dispatch_semaphore_s *)a1[4];
  if (result) {
    return (dispatch_semaphore_s *)dispatch_semaphore_signal(result);
  }
  return result;
}

void __71__SKHelperClient_physicalStoresForAPFSVolume_blocking_completionBlock___block_invoke_5( uint64_t a1,  void *a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  SKGetOSLog();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "-[SKHelperClient physicalStoresForAPFSVolume:blocking:completionBlock:]_block_invoke_5";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_188F75000, v4, OS_LOG_TYPE_ERROR, "%s ** error: %@", (uint8_t *)&v5, 0x16u);
  }

  [*(id *)(a1 + 32) requestWithUUID:*(void *)(a1 + 40) didCompleteWithResult:&unk_18A330138];
}

- (void)physicalStoresForAPFSVolume:(id)a3 completionBlock:(id)a4
{
}

- (void)volumesForAPFSPS:(id)a3 blocking:(BOOL)a4 completionBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  uint64_t v9 = (void *)MEMORY[0x189607AB8];
  id v10 = a3;
  [v9 UUID];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 UUIDString];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v13 = MEMORY[0x1895F87A8];
  v26[0] = MEMORY[0x1895F87A8];
  v26[1] = 3221225472LL;
  v26[2] = __60__SKHelperClient_volumesForAPFSPS_blocking_completionBlock___block_invoke;
  v26[3] = &unk_18A323AB8;
  v26[4] = self;
  id v14 = v12;
  BOOL v29 = v5;
  id v27 = v14;
  id v28 = v8;
  id v15 = v8;
  -[SKHelperClient _scheduleCompletionUUID:forFunction:blocking:withBlock:]( self,  "_scheduleCompletionUUID:forFunction:blocking:withBlock:",  v14,  "-[SKHelperClient volumesForAPFSPS:blocking:completionBlock:]",  v5,  v26);
  id v16 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = v13;
  uint64_t v21 = 3221225472LL;
  id v22 = __60__SKHelperClient_volumesForAPFSPS_blocking_completionBlock___block_invoke_6;
  id v23 = &unk_18A323A18;
  id v24 = self;
  id v17 = v14;
  id v25 = v17;
  -[SKHelperClient remoteObjectWithUUID:errorHandler:](self, "remoteObjectWithUUID:errorHandler:", v17, &v20);
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minimalDictionaryRepresentation", v20, v21, v22, v23, v24);
  id v19 = (void *)objc_claimAutoreleasedReturnValue();

  [v18 volumesForAPFSPS:v19 withCompletionUUID:v17];
  if (v16) {
    dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __60__SKHelperClient_volumesForAPFSPS_blocking_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v15 = a2;
  [*(id *)(a1 + 32) completionHandlers];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 semaphore];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) _parameters:v15 valueAtIndex:0];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = 0LL;
  v29[1] = v29;
  v29[2] = 0x3032000000LL;
  v29[3] = __Block_byref_object_copy__3;
  v29[4] = __Block_byref_object_dispose__3;
  id v30 = (id)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  id v6 = dispatch_queue_create("com.apple.storagekitd.diskeval", 0LL);
  __int16 v7 = dispatch_group_create();
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  __int128 v27 = 0u;
  __int128 v28 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
  uint64_t v9 = MEMORY[0x1895F87A8];
  if (v8)
  {
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        dispatch_group_enter(v7);
        block[0] = v9;
        block[1] = 3221225472LL;
        block[2] = __60__SKHelperClient_volumesForAPFSPS_blocking_completionBlock___block_invoke_2;
        block[3] = &unk_18A323B08;
        void block[4] = v12;
        id v24 = v29;
        id v23 = v7;
        dispatch_async(v6, block);
      }

      uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v31 count:16];
    }

    while (v8);
  }

  dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v17[0] = v9;
  v17[1] = 3221225472LL;
  v17[2] = __60__SKHelperClient_volumesForAPFSPS_blocking_completionBlock___block_invoke_4;
  v17[3] = &unk_18A323B80;
  v17[4] = *(void *)(a1 + 32);
  char v21 = *(_BYTE *)(a1 + 56);
  id v19 = *(id *)(a1 + 48);
  uint64_t v20 = v29;
  id v18 = v14;
  id v13 = v14;
  dispatch_sync(v6, v17);

  _Block_object_dispose(v29, 8);
}

void __60__SKHelperClient_volumesForAPFSPS_blocking_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __60__SKHelperClient_volumesForAPFSPS_blocking_completionBlock___block_invoke_3;
  v7[3] = &unk_18A3232A8;
  __int128 v6 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v6;
  __int128 v8 = v6;
  dispatch_get_global_queue(0LL, 0LL);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 knownDiskForDictionary:v3 notify:v7 onQueue:v5];
}

void __60__SKHelperClient_volumesForAPFSPS_blocking_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v3 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL);
    objc_sync_enter(v3);
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v4];
    objc_sync_exit(v3);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __60__SKHelperClient_volumesForAPFSPS_blocking_completionBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __60__SKHelperClient_volumesForAPFSPS_blocking_completionBlock___block_invoke_5;
  block[3] = &unk_18A323B30;
  id v3 = *(id *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  id v7 = v3;
  uint64_t v8 = v4;
  id v6 = *(id *)(a1 + 40);
  dispatch_async(v2, block);
}

dispatch_semaphore_s *__60__SKHelperClient_volumesForAPFSPS_blocking_completionBlock___block_invoke_5( void *a1)
{
  uint64_t v2 = a1[5];
  if (v2) {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(*(void *)(a1[6] + 8LL) + 40LL));
  }
  uint64_t result = (dispatch_semaphore_s *)a1[4];
  if (result) {
    return (dispatch_semaphore_s *)dispatch_semaphore_signal(result);
  }
  return result;
}

void __60__SKHelperClient_volumesForAPFSPS_blocking_completionBlock___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  SKGetOSLog();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "-[SKHelperClient volumesForAPFSPS:blocking:completionBlock:]_block_invoke_6";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_188F75000, v4, OS_LOG_TYPE_ERROR, "%s ** error: %@", (uint8_t *)&v5, 0x16u);
  }

  [*(id *)(a1 + 32) requestWithUUID:*(void *)(a1 + 40) didCompleteWithResult:&unk_18A330150];
}

- (void)volumesForAPFSPS:(id)a3 completionBlock:(id)a4
{
}

- (void)updateUUID:(id)a3 progress:(float)a4 message:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  -[SKHelperClient completionHandlers](self, "completionHandlers");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 objectForKeyedSubscript:v9];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    [v11 progressBlock];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      [v11 progressBlock];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SKHelperClient callbackQueue](self, "callbackQueue");
      id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __46__SKHelperClient_updateUUID_progress_message___block_invoke;
      block[3] = &unk_18A323BA8;
      id v18 = v13;
      float v19 = a4;
      id v17 = v8;
      id v15 = v13;
      dispatch_async(v14, block);
    }
  }
}

uint64_t __46__SKHelperClient_updateUUID_progress_message___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, float))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  *(float *)(a1 + 48));
}

- (void)requestWithUUID:(id)a3 didCompleteWithResult:(id)a4
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  -[SKHelperClient completionHandlers](self, "completionHandlers");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 objectForKeyedSubscript:v6];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  SKGetOSLog();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v21 = v6;
      __int16 v22 = 2082;
      uint64_t v23 = [v9 functionName];
      _os_log_impl( &dword_188F75000,  v11,  OS_LOG_TYPE_DEFAULT,  "Reached XPC reply for %{public}@ %{public}s",  buf,  0x16u);
    }

    [v9 setProgressBlock:0];
    [v9 semaphore];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      [v9 completionBlock];
      id v13 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
      ((void (**)(void, id))v13)[2](v13, v7);

      SKGetOSLog();
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v21 = v6;
        _os_log_impl( &dword_188F75000,  v14,  OS_LOG_TYPE_DEFAULT,  "Completion block directly executed for: %{public}@",  buf,  0xCu);
      }
    }

    else
    {
      -[SKHelperClient callbackQueue](self, "callbackQueue");
      id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __56__SKHelperClient_requestWithUUID_didCompleteWithResult___block_invoke;
      block[3] = &unk_18A323BD0;
      id v17 = (os_log_s *)v6;
      id v18 = v9;
      id v19 = v7;
      dispatch_async(v15, block);

      id v14 = v17;
    }

    -[SKHelperClient completionHandlers](self, "completionHandlers");
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    -[os_log_s setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", 0LL, v6);
  }

  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    id v21 = v6;
    _os_log_impl(&dword_188F75000, v11, OS_LOG_TYPE_ERROR, "Error: no completion handler for %{public}@", buf, 0xCu);
  }
}

void __56__SKHelperClient_requestWithUUID_didCompleteWithResult___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  SKGetOSLog();
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v3;
    _os_log_impl( &dword_188F75000,  v2,  OS_LOG_TYPE_DEFAULT,  "Completion callback for: %{public}@ - start",  (uint8_t *)&v7,  0xCu);
  }

  [*(id *)(a1 + 40) completionBlock];
  uint64_t v4 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
  v4[2](v4, *(void *)(a1 + 48));

  SKGetOSLog();
  int v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl( &dword_188F75000,  v5,  OS_LOG_TYPE_DEFAULT,  "Completion callback for: %{public}@ - end",  (uint8_t *)&v7,  0xCu);
  }
}

- (void)initialPopulateComplete
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 initialPopulateComplete];
}

- (void)disksAppeared:(id)a3
{
  id v3 = a3;
  +[SKManager sharedManager](&OBJC_CLASS___SKManager, "sharedManager");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 disksAppeared:v3];
}

- (void)disksChanged:(id)a3
{
  id v3 = a3;
  +[SKManager sharedManager](&OBJC_CLASS___SKManager, "sharedManager");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 disksChanged:v3];
}

- (void)disksDisappeared:(id)a3
{
  id v3 = a3;
  +[SKManager sharedManager](&OBJC_CLASS___SKManager, "sharedManager");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 disksDisappeared:v3];
}

- (void)managerStalled
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 managerStalled];
}

- (void)managerResumed
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 managerResumed];
}

- (id)remoteObjectWithUUID:(id)a3 errorHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[SKHelperClient xpcQueue](self, "xpcQueue");
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __52__SKHelperClient_remoteObjectWithUUID_errorHandler___block_invoke;
  block[3] = &unk_18A323BF8;
  void block[4] = self;
  id v15 = v6;
  id v16 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);

  -[SKHelperClient xpcConnection](self, "xpcConnection");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 remoteObjectProxyWithErrorHandler:v9];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __52__SKHelperClient_remoteObjectWithUUID_errorHandler___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) completionHandlers];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    [v3 setErrorBlock:*(void *)(a1 + 48)];
  }

  else
  {
    SKGetOSLog();
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v6 = 136315394;
      id v7 = "-[SKHelperClient remoteObjectWithUUID:errorHandler:]_block_invoke";
      __int16 v8 = 2114;
      uint64_t v9 = v5;
      _os_log_impl( &dword_188F75000,  v4,  OS_LOG_TYPE_ERROR,  "%s: No completion handler set for %{public}@, cannot set error block",  (uint8_t *)&v6,  0x16u);
    }
  }
}

- (void)createXPCConnection
{
  id v3 = (NSXPCConnection *)[objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:@"com.apple.storagekitd" options:4096];
  xpcConnection = self->_xpcConnection;
  self->_xpcConnection = v3;

  SKHelperConnectionInterface();
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_xpcConnection, "setRemoteObjectInterface:", v5);

  -[NSXPCConnection setExportedObject:](self->_xpcConnection, "setExportedObject:", self);
  SKHelperClientInterface();
  int v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setExportedInterface:](self->_xpcConnection, "setExportedInterface:", v6);

  objc_initWeak(&location, self);
  id v7 = self->_xpcConnection;
  uint64_t v8 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __37__SKHelperClient_createXPCConnection__block_invoke;
  v12[3] = &unk_18A323C20;
  objc_copyWeak(&v13, &location);
  -[NSXPCConnection setInterruptionHandler:](v7, "setInterruptionHandler:", v12);
  uint64_t v9 = self->_xpcConnection;
  v10[0] = v8;
  v10[1] = 3221225472LL;
  v10[2] = __37__SKHelperClient_createXPCConnection__block_invoke_82;
  v10[3] = &unk_18A323C20;
  objc_copyWeak(&v11, &location);
  -[NSXPCConnection setInvalidationHandler:](v9, "setInvalidationHandler:", v10);
  -[NSXPCConnection resume](self->_xpcConnection, "resume");
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __37__SKHelperClient_createXPCConnection__block_invoke(uint64_t a1)
{
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_188F75000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _abortAllCalls];
}

void __37__SKHelperClient_createXPCConnection__block_invoke_82(uint64_t a1)
{
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_188F75000, v2, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _abortAllCalls];
}

- (void)_abortAllCalls
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189607870] errorWithDomain:*MEMORY[0x189607688] code:35 userInfo:0];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  -[SKHelperClient completionHandlers](self, "completionHandlers");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 allKeys];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        SKGetOSLog();
        id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v22 = v10;
          _os_log_impl( &dword_188F75000,  v11,  OS_LOG_TYPE_DEFAULT,  "Calling completion handler to abort UUID: %{public}@",  buf,  0xCu);
        }

        -[SKHelperClient completionHandlers](self, "completionHandlers");
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v12 objectForKeyedSubscript:v10];
        id v13 = (void *)objc_claimAutoreleasedReturnValue();

        [v13 errorBlock];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          [v13 errorBlock];
          id v15 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
          ((void (**)(void, void *))v15)[2](v15, v3);
        }
      }

      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }

    while (v7);
  }

  -[SKHelperClient completionHandlers](self, "completionHandlers");
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 removeAllObjects];
}

- (void)_scheduleCompletionUUID:(id)a3 progress:(id)a4 forFunction:(const char *)a5 withBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  -[SKHelperClient xpcQueue](self, "xpcQueue");
  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __73__SKHelperClient__scheduleCompletionUUID_progress_forFunction_withBlock___block_invoke;
  block[3] = &unk_18A323C48;
  id v21 = v11;
  uint64_t v22 = a5;
  id v18 = v10;
  __int128 v19 = self;
  id v20 = v12;
  id v14 = v11;
  id v15 = v12;
  id v16 = v10;
  dispatch_async(v13, block);
}

void __73__SKHelperClient__scheduleCompletionUUID_progress_forFunction_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  SKGetOSLog();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 64);
    uint64_t v4 = *(void *)(a1 + 32);
    int v7 = 136315394;
    uint64_t v8 = v3;
    __int16 v9 = 2114;
    uint64_t v10 = v4;
    _os_log_impl( &dword_188F75000,  v2,  OS_LOG_TYPE_DEFAULT,  "Setting completion callback for (%s) to: %{public}@",  (uint8_t *)&v7,  0x16u);
  }

  uint64_t v5 = -[SKCompletionHandler initWithCompletionBlock:progressBlock:function:]( objc_alloc(&OBJC_CLASS___SKCompletionHandler),  "initWithCompletionBlock:progressBlock:function:",  *(void *)(a1 + 48),  *(void *)(a1 + 56),  *(void *)(a1 + 64));
  [*(id *)(a1 + 40) completionHandlers];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v5 forKeyedSubscript:*(void *)(a1 + 32)];
}

- (void)_scheduleCompletionUUID:(id)a3 forFunction:(const char *)a4 withBlock:(id)a5
{
}

- (id)_scheduleSyncCompletionUUID:(id)a3 forFunction:(const char *)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0LL);
  -[SKHelperClient xpcQueue](self, "xpcQueue");
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __68__SKHelperClient__scheduleSyncCompletionUUID_forFunction_withBlock___block_invoke;
  block[3] = &unk_18A323C70;
  id v21 = v9;
  uint64_t v22 = a4;
  id v18 = v8;
  id v12 = v10;
  __int128 v19 = v12;
  id v20 = self;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(v11, block);

  id v15 = v12;
  return v15;
}

void __68__SKHelperClient__scheduleSyncCompletionUUID_forFunction_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  SKGetOSLog();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 64);
    uint64_t v4 = *(void *)(a1 + 32);
    int v7 = 136315394;
    uint64_t v8 = v3;
    __int16 v9 = 2114;
    uint64_t v10 = v4;
    _os_log_impl( &dword_188F75000,  v2,  OS_LOG_TYPE_DEFAULT,  "Setting sync completion callback for (%s) to: %{public}@",  (uint8_t *)&v7,  0x16u);
  }

  uint64_t v5 = -[SKCompletionHandler initWithCompletionBlock:progressBlock:function:]( objc_alloc(&OBJC_CLASS___SKCompletionHandler),  "initWithCompletionBlock:progressBlock:function:",  *(void *)(a1 + 56),  0LL,  *(void *)(a1 + 64));
  -[SKCompletionHandler setSemaphore:](v5, "setSemaphore:", *(void *)(a1 + 40));
  [*(id *)(a1 + 48) completionHandlers];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setObject:v5 forKeyedSubscript:*(void *)(a1 + 32)];
}

- (id)_scheduleCompletionUUID:(id)a3 forFunction:(const char *)a4 blocking:(BOOL)a5 withBlock:(id)a6
{
  if (a5)
  {
    -[SKHelperClient _scheduleSyncCompletionUUID:forFunction:withBlock:]( self,  "_scheduleSyncCompletionUUID:forFunction:withBlock:",  a3,  a4,  a6);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    -[SKHelperClient _scheduleCompletionUUID:progress:forFunction:withBlock:]( self,  "_scheduleCompletionUUID:progress:forFunction:withBlock:",  a3,  0LL,  a4,  a6);
    uint64_t v6 = 0LL;
  }

  return v6;
}

- (id)_parameters:(id)a3 valueAtIndex:(unint64_t)a4
{
  id v5 = a3;
  if ([v5 count] <= a4) {
    goto LABEL_4;
  }
  [v5 objectAtIndex:a4];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189603FE8] null];
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  int v8 = [v6 isEqual:v7];

  if (v8)
  {

LABEL_4:
    uint64_t v6 = 0LL;
  }

  return v6;
}

- (BOOL)_isRecachingDiskAbuse:(id)a3
{
  v24[2] = *MEMORY[0x1895F89C0];
  [a3 minimalDictionaryRepresentation];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKHelperClient recacheAbuseLimiterInfo](self, "recacheAbuseLimiterInfo");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 objectForKey:v4];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    [v6 objectForKey:@"FirstCallTime"];
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 objectForKey:@"CallCount"];
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603F50] date];
    __int16 v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 timeIntervalSinceDate:v7];
    double v11 = v10;

    if (v11 >= 60.0)
    {
      v23[0] = @"FirstCallTime";
      [MEMORY[0x189603F50] date];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      v23[1] = @"CallCount";
      v24[0] = v13;
      v24[1] = &unk_18A3300D8;
      uint64_t v14 = [MEMORY[0x189603F68] dictionaryWithObjects:v24 forKeys:v23 count:2];

      BOOL v12 = 0;
      uint64_t v6 = (void *)v14;
    }

    else
    {
      BOOL v12 = [v8 integerValue] > 3;
    }
  }

  else
  {
    v21[0] = @"FirstCallTime";
    [MEMORY[0x189603F50] date];
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = @"CallCount";
    v22[0] = v7;
    v22[1] = &unk_18A3300D8;
    [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:v21 count:2];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v12 = 0;
  }

  [v6 objectForKey:@"CallCount"];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [v15 integerValue] + 1;
  __int128 v17 = (void *)[v6 mutableCopy];
  [MEMORY[0x189607968] numberWithInteger:v16];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 setObject:v18 forKey:@"CallCount"];

  -[SKHelperClient recacheAbuseLimiterInfo](self, "recacheAbuseLimiterInfo");
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 setObject:v17 forKey:v4];

  return v12;
}

- (void)unmountDisk:(id)a3 withCompletionBlock:(id)a4
{
}

- (void)unmountDisk:(id)a3 options:(id)a4 blocking:(BOOL)a5 withCompletionBlock:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  double v11 = (void *)MEMORY[0x189607AB8];
  id v12 = a4;
  id v13 = a3;
  [v11 UUID];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 UUIDString];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v16 = MEMORY[0x1895F87A8];
  v25[0] = MEMORY[0x1895F87A8];
  v25[1] = 3221225472LL;
  v25[2] = __67__SKHelperClient_unmountDisk_options_blocking_withCompletionBlock___block_invoke;
  v25[3] = &unk_18A3239F0;
  id v27 = v10;
  v25[4] = self;
  id v17 = v15;
  id v26 = v17;
  id v18 = v10;
  -[SKHelperClient _scheduleCompletionUUID:forFunction:blocking:withBlock:]( self,  "_scheduleCompletionUUID:forFunction:blocking:withBlock:",  v17,  "-[SKHelperClient unmountDisk:options:blocking:withCompletionBlock:]",  v6,  v25);
  __int128 v19 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue();
  v23[0] = v16;
  v23[1] = 3221225472LL;
  void v23[2] = __67__SKHelperClient_unmountDisk_options_blocking_withCompletionBlock___block_invoke_2;
  v23[3] = &unk_18A323A18;
  v23[4] = self;
  id v20 = v17;
  id v24 = v20;
  -[SKHelperClient remoteObjectWithUUID:errorHandler:](self, "remoteObjectWithUUID:errorHandler:", v20, v23);
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 minimalDictionaryRepresentation];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

  [v21 unmountDisk:v22 options:v12 withCompletionUUID:v20];
  if (v19) {
    dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __67__SKHelperClient_unmountDisk_options_blocking_withCompletionBlock___block_invoke( uint64_t a1,  void *a2)
{
  id v8 = a2;
  if (*(void *)(a1 + 48))
  {
    [*(id *)(a1 + 32) _parameters:v8 valueAtIndex:0];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  [*(id *)(a1 + 32) completionHandlers];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 semaphore];
  BOOL v6 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue();
  int v7 = v6;
  if (v6) {
    dispatch_semaphore_signal(v6);
  }
}

void __67__SKHelperClient_unmountDisk_options_blocking_withCompletionBlock___block_invoke_2( uint64_t a1,  void *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v7 = a2;
  uint64_t v4 = (void *)MEMORY[0x189603F18];
  id v5 = a2;
  [v4 arrayWithObjects:&v7 count:1];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestWithUUID:didCompleteWithResult:", v3, v6, v7, v8);
}

- (void)unmountDisk:(id)a3 options:(id)a4 withCompletionBlock:(id)a5
{
}

- (void)mountDisk:(id)a3 options:(id)a4 blocking:(BOOL)a5 completionBlock:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  double v11 = (void *)MEMORY[0x189607AB8];
  id v12 = a4;
  id v13 = a3;
  [v11 UUID];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 UUIDString];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v16 = MEMORY[0x1895F87A8];
  v25[0] = MEMORY[0x1895F87A8];
  v25[1] = 3221225472LL;
  v25[2] = __61__SKHelperClient_mountDisk_options_blocking_completionBlock___block_invoke;
  v25[3] = &unk_18A3239F0;
  id v27 = v10;
  v25[4] = self;
  id v17 = v15;
  id v26 = v17;
  id v18 = v10;
  -[SKHelperClient _scheduleCompletionUUID:forFunction:blocking:withBlock:]( self,  "_scheduleCompletionUUID:forFunction:blocking:withBlock:",  v17,  "-[SKHelperClient mountDisk:options:blocking:completionBlock:]",  v6,  v25);
  __int128 v19 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue();
  v23[0] = v16;
  v23[1] = 3221225472LL;
  void v23[2] = __61__SKHelperClient_mountDisk_options_blocking_completionBlock___block_invoke_2;
  v23[3] = &unk_18A323A18;
  v23[4] = self;
  id v20 = v17;
  id v24 = v20;
  -[SKHelperClient remoteObjectWithUUID:errorHandler:](self, "remoteObjectWithUUID:errorHandler:", v20, v23);
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 minimalDictionaryRepresentation];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

  [v21 mountDisk:v22 options:v12 withCompletionUUID:v20];
  if (v19) {
    dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __61__SKHelperClient_mountDisk_options_blocking_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (*(void *)(a1 + 48))
  {
    [*(id *)(a1 + 32) _parameters:v8 valueAtIndex:0];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  [*(id *)(a1 + 32) completionHandlers];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 semaphore];
  BOOL v6 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue();
  int v7 = v6;
  if (v6) {
    dispatch_semaphore_signal(v6);
  }
}

void __61__SKHelperClient_mountDisk_options_blocking_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v7 = a2;
  uint64_t v4 = (void *)MEMORY[0x189603F18];
  id v5 = a2;
  [v4 arrayWithObjects:&v7 count:1];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestWithUUID:didCompleteWithResult:", v3, v6, v7, v8);
}

- (void)mountDisk:(id)a3 options:(id)a4 completionBlock:(id)a5
{
}

- (void)ejectDisk:(id)a3 blocking:(BOOL)a4 withCompletionBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  __int16 v9 = (void *)MEMORY[0x189607AB8];
  id v10 = a3;
  [v9 UUID];
  double v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 UUIDString];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v13 = MEMORY[0x1895F87A8];
  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  void v22[2] = __57__SKHelperClient_ejectDisk_blocking_withCompletionBlock___block_invoke;
  v22[3] = &unk_18A3239F0;
  id v24 = v8;
  v22[4] = self;
  id v14 = v12;
  id v23 = v14;
  id v15 = v8;
  -[SKHelperClient _scheduleCompletionUUID:forFunction:blocking:withBlock:]( self,  "_scheduleCompletionUUID:forFunction:blocking:withBlock:",  v14,  "-[SKHelperClient ejectDisk:blocking:withCompletionBlock:]",  v5,  v22);
  uint64_t v16 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue();
  v20[0] = v13;
  v20[1] = 3221225472LL;
  v20[2] = __57__SKHelperClient_ejectDisk_blocking_withCompletionBlock___block_invoke_2;
  v20[3] = &unk_18A323A18;
  v20[4] = self;
  id v17 = v14;
  id v21 = v17;
  -[SKHelperClient remoteObjectWithUUID:errorHandler:](self, "remoteObjectWithUUID:errorHandler:", v17, v20);
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 minimalDictionaryRepresentation];
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue();

  [v18 ejectDisk:v19 withCompletionUUID:v17];
  if (v16) {
    dispatch_semaphore_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
  }
}

void __57__SKHelperClient_ejectDisk_blocking_withCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (*(void *)(a1 + 48))
  {
    [*(id *)(a1 + 32) _parameters:v8 valueAtIndex:0];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  [*(id *)(a1 + 32) completionHandlers];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:*(void *)(a1 + 40)];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 semaphore];
  BOOL v6 = (dispatch_semaphore_s *)objc_claimAutoreleasedReturnValue();
  int v7 = v6;
  if (v6) {
    dispatch_semaphore_signal(v6);
  }
}

void __57__SKHelperClient_ejectDisk_blocking_withCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  int v7 = a2;
  uint64_t v4 = (void *)MEMORY[0x189603F18];
  id v5 = a2;
  [v4 arrayWithObjects:&v7 count:1];
  BOOL v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestWithUUID:didCompleteWithResult:", v3, v6, v7, v8);
}

- (void)ejectDisk:(id)a3 withCompletionBlock:(id)a4
{
}

- (id)eraseWithEraser:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[SKHelperClient xpcConnection](self, "xpcConnection");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = MEMORY[0x1895F87A8];
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __50__SKHelperClient_eraseWithEraser_completionBlock___block_invoke;
  v17[3] = &unk_18A323C98;
  v17[4] = self;
  id v10 = v6;
  id v18 = v10;
  [v8 remoteObjectProxyWithErrorHandler:v17];
  double v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472LL;
  v15[2] = __50__SKHelperClient_eraseWithEraser_completionBlock___block_invoke_3;
  v15[3] = &unk_18A323A40;
  v15[4] = self;
  id v16 = v10;
  id v12 = v10;
  [v11 eraseWithEraser:v7 reply:v15];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __50__SKHelperClient_eraseWithEraser_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) callbackQueue];
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __50__SKHelperClient_eraseWithEraser_completionBlock___block_invoke_2;
  v7[3] = &unk_18A323258;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __50__SKHelperClient_eraseWithEraser_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  *(void *)(a1 + 32));
}

void __50__SKHelperClient_eraseWithEraser_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 _parameters:v4 valueAtIndex:0];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) _parameters:v4 valueAtIndex:1];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    +[SKManager sharedManager](&OBJC_CLASS___SKManager, "sharedManager");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __50__SKHelperClient_eraseWithEraser_completionBlock___block_invoke_4;
    v9[3] = &unk_18A323A90;
    id v11 = *(id *)(a1 + 40);
    id v10 = v6;
    objc_msgSend( *(id *)(a1 + 32),  "callbackQueue",  v9[0],  3221225472,  __50__SKHelperClient_eraseWithEraser_completionBlock___block_invoke_4,  &unk_18A323A90);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 knownDiskForDictionary:v5 notify:v9 onQueue:v8];
  }
}

void __50__SKHelperClient_eraseWithEraser_completionBlock___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  SKGetOSLog();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    id v6 = "-[SKHelperClient eraseWithEraser:completionBlock:]_block_invoke_4";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl( &dword_188F75000,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: Erase completed successfully: %@",  (uint8_t *)&v5,  0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (id)resize:(id)a3 toSize:(unint64_t)a4 completionBlock:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  -[SKHelperClient xpcConnection](self, "xpcConnection");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = MEMORY[0x1895F87A8];
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __48__SKHelperClient_resize_toSize_completionBlock___block_invoke;
  v20[3] = &unk_18A323C98;
  v20[4] = self;
  id v12 = v8;
  id v21 = v12;
  [v10 remoteObjectProxyWithErrorHandler:v20];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 minimalDictionaryRepresentation];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = v11;
  v18[1] = 3221225472LL;
  v18[2] = __48__SKHelperClient_resize_toSize_completionBlock___block_invoke_3;
  v18[3] = &unk_18A323C98;
  v18[4] = self;
  id v19 = v12;
  id v15 = v12;
  [v13 resizeDisk:v14 size:a4 reply:v18];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __48__SKHelperClient_resize_toSize_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) callbackQueue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __48__SKHelperClient_resize_toSize_completionBlock___block_invoke_2;
  v7[3] = &unk_18A323258;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __48__SKHelperClient_resize_toSize_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

void __48__SKHelperClient_resize_toSize_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) callbackQueue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __48__SKHelperClient_resize_toSize_completionBlock___block_invoke_4;
  v7[3] = &unk_18A323258;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __48__SKHelperClient_resize_toSize_completionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

- (NSMutableDictionary)completionHandlers
{
  return self->_completionHandlers;
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (OS_dispatch_queue)xpcQueue
{
  return self->_xpcQueue;
}

- (OS_dispatch_queue)callbackQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setCallbackQueue:(id)a3
{
}

- (NSMutableDictionary)recacheAbuseLimiterInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setRecacheAbuseLimiterInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end