@interface SUCoreSpace
+ (BOOL)_isUserVolume:(id)a3;
+ (id)cacheDeleteUrgencyName:(int)a3;
+ (id)sharedSpaceManager;
+ (void)_checkMinimumRequiredSpace:(unint64_t)a3 purgingFromBase:(id)a4 userInitiated:(BOOL)a5 totalRequiredFreeSpace:(unint64_t)a6 freeSpaceAvailable:(unint64_t)a7 checkAvailableSpaceTransaction:(id)a8 withCompletionQueue:(id)a9 completion:(id)a10;
+ (void)_issueAppOffloadPurgeCompetion:(id)a3 withCompletionQueue:(id)a4 result:(BOOL)a5 spacePurged:(int64_t)a6 error:(id)a7 releasingTransaction:(id)a8;
+ (void)_issueSpaceCheckCompletion:(id)a3 withCompletionQueue:(id)a4 haveEnoughSpace:(BOOL)a5 haveTotalRequired:(BOOL)a6 freeSpaceAvailable:(unint64_t)a7 error:(id)a8 releasingTransaction:(id)a9;
+ (void)_issueSpacePurgeableCompetion:(id)a3 withCompletionQueue:(id)a4 result:(BOOL)a5 spacePurgeable:(int64_t)a6 error:(id)a7 releasingTransaction:(id)a8;
+ (void)_spaceCheckPhaseError:(id)a3 checkingFromBase:(id)a4 withIdentier:(id)a5 completion:(id)a6;
+ (void)_trackSpaceBegin:(id)a3;
+ (void)_trackSpaceBegin:(id)a3 withIdentifier:(id)a4;
+ (void)_trackSpaceEnd:(id)a3 withIdentifier:(id)a4 withResult:(int64_t)a5 withError:(id)a6;
+ (void)_trackSpaceEnd:(id)a3 withResult:(int64_t)a4 withError:(id)a5;
+ (void)cacheDeletePurge:(unint64_t)a3 cacheDeleteUrgency:(int)a4 withCompletionQueue:(id)a5 completion:(id)a6;
+ (void)cacheDeletePurge:(unint64_t)a3 fromBasePath:(id)a4 cacheDeleteUrgency:(int)a5 completion:(id)a6;
+ (void)cacheDeletePurge:(unint64_t)a3 fromBasePath:(id)a4 cacheDeleteUrgency:(int)a5 timeout:(int)a6 withCompletionQueue:(id)a7 completion:(id)a8;
+ (void)cacheDeletePurge:(unint64_t)a3 fromBasePath:(id)a4 cacheDeleteUrgency:(int)a5 withCompletionQueue:(id)a6 completion:(id)a7;
+ (void)checkAvailableFreeSpace:(unint64_t)a3 checkingFromBase:(id)a4 withIdentifier:(id)a5 userInitiated:(BOOL)a6 completion:(id)a7;
+ (void)checkAvailableSpace:(unint64_t)a3 allowPurgeWithUrgency:(int)a4 purgingFromBase:(id)a5 minimalRequiredFreeSpace:(unint64_t)a6 completion:(id)a7;
+ (void)checkAvailableSpace:(unint64_t)a3 allowPurgeWithUrgency:(int)a4 purgingFromBase:(id)a5 minimalRequiredFreeSpace:(unint64_t)a6 withCompletionQueue:(id)a7 completion:(id)a8;
+ (void)checkPurgeableSpaceCacheDelete:(unint64_t)a3 cacheDeleteUrgency:(int)a4 withCompletionQueue:(id)a5 completion:(id)a6;
+ (void)checkPurgeableSpaceCacheDelete:(unint64_t)a3 fromBasePath:(id)a4 cacheDeleteUrgency:(int)a5 timeout:(int)a6 additionalOptions:(id)a7 withCompletionQueue:(id)a8 completion:(id)a9;
+ (void)checkPurgeableSpaceCacheDelete:(unint64_t)a3 fromBasePath:(id)a4 cacheDeleteUrgency:(int)a5 withCompletionQueue:(id)a6 completion:(id)a7;
+ (void)checkPurgeableSpaceOffloadApps:(unint64_t)a3 cacheDeleteUrgency:(int64_t)a4 withCompletionQueue:(id)a5 completion:(id)a6;
+ (void)checkPurgeableSpaceOffloadApps:(unint64_t)a3 fromBasePath:(id)a4 cacheDeleteUrgency:(int64_t)a5 withCompletionQueue:(id)a6 completion:(id)a7;
+ (void)offloadAppsPurge:(unint64_t)a3 cacheDeleteUrgency:(int64_t)a4 withCompletionQueue:(id)a5 completion:(id)a6;
+ (void)offloadAppsPurge:(unint64_t)a3 fromBasePath:(id)a4 cacheDeleteUrgency:(int64_t)a5 withCompletionQueue:(id)a6 completion:(id)a7;
- (OS_dispatch_queue)spaceQueue;
- (SUCoreSpace)init;
@end

@implementation SUCoreSpace

+ (id)sharedSpaceManager
{
  if (sharedSpaceManager_spaceManagerOnce != -1) {
    dispatch_once(&sharedSpaceManager_spaceManagerOnce, &__block_literal_global_12);
  }
  return (id)sharedSpaceManager_spaceManager;
}

uint64_t __33__SUCoreSpace_sharedSpaceManager__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___SUCoreSpace);
  v1 = (void *)sharedSpaceManager_spaceManager;
  sharedSpaceManager_spaceManager = (uint64_t)v0;

  [MEMORY[0x189612780] associateLayer:151 withDomain:@"CacheDeleteErrorDomain"];
  [MEMORY[0x189612780] attributesOfSUCoreErrorCode:8600 indicating:4];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"CacheDeleteErrorDomain" withCode:1 codeName:@"CacheDeleteErrorConnectionInterrupted"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"CacheDeleteErrorDomain" withCode:2 codeName:@"CacheDeleteErrorConnectionInvalidated"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"CacheDeleteErrorDomain" withCode:3 codeName:@"CacheDeleteErrorConnectionCancelled"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"CacheDeleteErrorDomain" withCode:4 codeName:@"CacheDeleteErrorMissingEntitlement"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"CacheDeleteErrorDomain" withCode:5 codeName:@"CacheDeleteErrorInsufficientPermissions"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"CacheDeleteErrorDomain" withCode:6 codeName:@"CacheDeleteErrorFailedToConnect"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"CacheDeleteErrorDomain" withCode:7 codeName:@"CacheDeleteErrorDuplicateService"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"CacheDeleteErrorDomain" withCode:8 codeName:@"CacheDeleteErrorUnresponsiveService"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"CacheDeleteErrorDomain" withCode:9 codeName:@"CacheDeleteErrorTimeout"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"CacheDeleteErrorDomain" withCode:10 codeName:@"CacheDeleteErrorInvalidVolume"];
  return [MEMORY[0x189612780] attributesOfErrorForDomain:@"CacheDeleteErrorDomain" withCode:11 codeName:@"CacheDeleteErrorInvalidParams"];
}

- (SUCoreSpace)init
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___SUCoreSpace;
  v2 = -[SUCoreSpace init](&v16, sel_init);
  if (v2)
  {
    id v3 = objc_alloc(NSString);
    [MEMORY[0x189612760] sharedCore];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 commonDomain];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)[v3 initWithFormat:@"%@.%@", v5, @"core.space.operation"];

    id v7 = v6;
    v8 = (const char *)[v7 UTF8String];
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v10 = dispatch_queue_create(v8, v9);
    spaceQueue = v2->_spaceQueue;
    v2->_spaceQueue = (OS_dispatch_queue *)v10;

    if (v2->_spaceQueue)
    {
      [MEMORY[0x1896127A0] sharedLogger];
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 oslog];
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v18 = v7;
        _os_log_impl( &dword_187A54000,  v13,  OS_LOG_TYPE_DEFAULT,  "[SPACE] DISPATCH: created dispatch queue domain(%{public}@)",  buf,  0xCu);
      }
    }

    else
    {
      [MEMORY[0x189612778] sharedDiag];
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)[objc_alloc(NSString) initWithFormat:@"unable to create dispatch queue domain(%@)", v7];
      -[os_log_s trackError:forReason:withResult:withError:]( v13,  "trackError:forReason:withResult:withError:",  @"[SPACE]",  v14,  8100LL,  0LL);
    }
  }

  return v2;
}

+ (void)checkAvailableSpace:(unint64_t)a3 allowPurgeWithUrgency:(int)a4 purgingFromBase:(id)a5 minimalRequiredFreeSpace:(unint64_t)a6 completion:(id)a7
{
}

+ (void)checkAvailableSpace:(unint64_t)a3 allowPurgeWithUrgency:(int)a4 purgingFromBase:(id)a5 minimalRequiredFreeSpace:(unint64_t)a6 withCompletionQueue:(id)a7 completion:(id)a8
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  v12 = (__CFString *)a5;
  id v13 = a7;
  id v14 = a8;
  +[SUCoreSpace _trackSpaceBegin:withIdentifier:]( &OBJC_CLASS___SUCoreSpace,  "_trackSpaceBegin:withIdentifier:",  @"checkAvailableSpace",  @"total");
  [MEMORY[0x189612760] beginTransactionWithName:@"space.CheckAvailableSpace"];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x1896127A0] sharedLogger];
  objc_super v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 oslog];
  v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = @"NIL";
    if (v12) {
      id v18 = v12;
    }
    *(_DWORD *)buf = 138412546;
    v35 = v18;
    __int16 v36 = 2048;
    unint64_t v37 = a3;
    _os_log_impl( &dword_187A54000,  v17,  OS_LOG_TYPE_DEFAULT,  "[SPACE] Checking available space from base path %@.  Required free space: %lld",  buf,  0x16u);
  }

  BOOL v19 = a4 == 4;

  v25[0] = MEMORY[0x1895F87A8];
  v25[1] = 3221225472LL;
  v25[2] = __129__SUCoreSpace_checkAvailableSpace_allowPurgeWithUrgency_purgingFromBase_minimalRequiredFreeSpace_withCompletionQueue_completion___block_invoke;
  v25[3] = &unk_18A0F1B18;
  id v26 = v13;
  id v27 = v15;
  int v32 = a4;
  unint64_t v30 = a3;
  unint64_t v31 = a6;
  v28 = v12;
  id v29 = v14;
  BOOL v33 = a4 == 4;
  v20 = v12;
  id v21 = v15;
  id v22 = v13;
  id v23 = v14;
  +[SUCoreSpace checkAvailableFreeSpace:checkingFromBase:withIdentifier:userInitiated:completion:]( &OBJC_CLASS___SUCoreSpace,  "checkAvailableFreeSpace:checkingFromBase:withIdentifier:userInitiated:completion:",  a3,  v20,  @"total",  v19,  v25);
}

void __129__SUCoreSpace_checkAvailableSpace_allowPurgeWithUrgency_purgingFromBase_minimalRequiredFreeSpace_withCompletionQueue_completion___block_invoke( uint64_t a1,  char a2,  uint64_t a3,  void *a4)
{
  id v7 = a4;
  v8 = +[SUCoreSpace sharedSpaceManager](&OBJC_CLASS___SUCoreSpace, "sharedSpaceManager");
  [v8 spaceQueue];
  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __129__SUCoreSpace_checkAvailableSpace_allowPurgeWithUrgency_purgingFromBase_minimalRequiredFreeSpace_withCompletionQueue_completion___block_invoke_2;
  block[3] = &unk_18A0F1AF0;
  id v15 = v7;
  id v19 = *(id *)(a1 + 56);
  id v16 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  char v24 = a2;
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v12 = *(void *)(a1 + 72);
  id v17 = v10;
  uint64_t v20 = v11;
  uint64_t v21 = a3;
  int v23 = *(_DWORD *)(a1 + 80);
  uint64_t v22 = v12;
  id v18 = *(id *)(a1 + 48);
  char v25 = *(_BYTE *)(a1 + 84);
  id v13 = v7;
  dispatch_async(v9, block);
}

void __129__SUCoreSpace_checkAvailableSpace_allowPurgeWithUrgency_purgingFromBase_minimalRequiredFreeSpace_withCompletionQueue_completion___block_invoke_2( uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    +[SUCoreSpace _trackSpaceEnd:withIdentifier:withResult:withError:]( SUCoreSpace,  "_trackSpaceEnd:withIdentifier:withResult:withError:",  @"checkAvailableSpace",  @"total",  [v2 code],  *(void *)(a1 + 32));
    +[SUCoreSpace _issueSpaceCheckCompletion:withCompletionQueue:haveEnoughSpace:haveTotalRequired:freeSpaceAvailable:error:releasingTransaction:]( &OBJC_CLASS___SUCoreSpace,  "_issueSpaceCheckCompletion:withCompletionQueue:haveEnoughSpace:haveTotalRequired:freeSpaceAvailable:error:releasingTransaction:",  *(void *)(a1 + 64),  *(void *)(a1 + 40),  0LL,  0LL,  0LL,  *(void *)(a1 + 32),  *(void *)(a1 + 48));
    return;
  }

  if (*(_BYTE *)(a1 + 100))
  {
    +[SUCoreSpace _trackSpaceEnd:withIdentifier:withResult:withError:]( &OBJC_CLASS___SUCoreSpace,  "_trackSpaceEnd:withIdentifier:withResult:withError:",  @"checkAvailableSpace",  @"total",  0LL,  0LL);
    [MEMORY[0x1896127A0] sharedLogger];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 oslog];
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 72);
      uint64_t v6 = *(void *)(a1 + 80);
      *(_DWORD *)buf = 134218240;
      v44 = v5;
      __int16 v45 = 2048;
      uint64_t v46 = v6;
      _os_log_impl( &dword_187A54000,  v4,  OS_LOG_TYPE_DEFAULT,  "[SPACE] total disk space available: need %llu and %llu is available (have enough space)",  buf,  0x16u);
    }

    uint64_t v7 = *(void *)(a1 + 64);
    uint64_t v8 = *(void *)(a1 + 80);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v33 = *(void *)(a1 + 48);
    uint64_t v10 = 1LL;
LABEL_7:
    +[SUCoreSpace _issueSpaceCheckCompletion:withCompletionQueue:haveEnoughSpace:haveTotalRequired:freeSpaceAvailable:error:releasingTransaction:]( &OBJC_CLASS___SUCoreSpace,  "_issueSpaceCheckCompletion:withCompletionQueue:haveEnoughSpace:haveTotalRequired:freeSpaceAvailable:error:releasingTransaction:",  v7,  v9,  1LL,  v10,  v8,  0LL,  v33);
    return;
  }

  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 oslog];
  uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = *(void **)(a1 + 72);
    uint64_t v14 = *(void *)(a1 + 80);
    *(_DWORD *)buf = 134218240;
    v44 = v13;
    __int16 v45 = 2048;
    uint64_t v46 = v14;
    _os_log_impl( &dword_187A54000,  v12,  OS_LOG_TYPE_DEFAULT,  "[SPACE] not enough free space for total required: need %llu and %llu is available",  buf,  0x16u);
  }

  if (*(_DWORD *)(a1 + 96) == -1)
  {
    unint64_t v20 = *(void *)(a1 + 88);
    if (v20)
    {
      if (*(void *)(a1 + 80) >= v20)
      {
        +[SUCoreSpace _trackSpaceEnd:withIdentifier:withResult:withError:]( &OBJC_CLASS___SUCoreSpace,  "_trackSpaceEnd:withIdentifier:withResult:withError:",  @"checkAvailableSpace",  @"total",  0LL,  0LL);
        [MEMORY[0x1896127A0] sharedLogger];
        id v29 = (void *)objc_claimAutoreleasedReturnValue();
        [v29 oslog];
        unint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v32 = *(void *)(a1 + 80);
          unint64_t v31 = *(void **)(a1 + 88);
          *(_DWORD *)buf = 134218240;
          v44 = v31;
          __int16 v45 = 2048;
          uint64_t v46 = v32;
          _os_log_impl( &dword_187A54000,  v30,  OS_LOG_TYPE_DEFAULT,  "[SPACE] not enough total but have minimal (did not try cache delete): need %llu and %llu is available",  buf,  0x16u);
        }

        uint64_t v7 = *(void *)(a1 + 64);
        uint64_t v8 = *(void *)(a1 + 80);
        uint64_t v9 = *(void *)(a1 + 40);
        uint64_t v33 = *(void *)(a1 + 48);
        uint64_t v10 = 0LL;
        goto LABEL_7;
      }

      uint64_t v21 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"not enough minimal space (did not try cache delete): need %llu and %llu is available",  *(void *)(a1 + 88),  *(void *)(a1 + 80));
      [MEMORY[0x189612760] sharedCore];
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v22 buildError:8600 underlying:0 description:v21];
      int v23 = (void *)objc_claimAutoreleasedReturnValue();

      +[SUCoreSpace _trackSpaceEnd:withIdentifier:withResult:withError:]( SUCoreSpace,  "_trackSpaceEnd:withIdentifier:withResult:withError:",  @"checkAvailableSpace",  @"total",  [v23 code],  v23);
      [MEMORY[0x1896127A0] sharedLogger];
      char v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 oslog];
      char v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v44 = v21;
        _os_log_impl(&dword_187A54000, v25, OS_LOG_TYPE_DEFAULT, "[SPACE] %{public}@", buf, 0xCu);
      }
    }

    else
    {
      uint64_t v21 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"not enough total space (did not try cache delete): need %llu and %llu is available",  *(void *)(a1 + 72),  *(void *)(a1 + 80));
      [MEMORY[0x189612760] sharedCore];
      id v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v26 buildError:8600 underlying:0 description:v21];
      int v23 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x1896127A0] sharedLogger];
      id v27 = (void *)objc_claimAutoreleasedReturnValue();
      [v27 oslog];
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v44 = v21;
        _os_log_impl(&dword_187A54000, v28, OS_LOG_TYPE_DEFAULT, "[SPACE] %{public}@", buf, 0xCu);
      }

      +[SUCoreSpace _trackSpaceEnd:withIdentifier:withResult:withError:]( SUCoreSpace,  "_trackSpaceEnd:withIdentifier:withResult:withError:",  @"checkAvailableSpace",  @"total",  [v23 code],  v23);
    }

    +[SUCoreSpace _issueSpaceCheckCompletion:withCompletionQueue:haveEnoughSpace:haveTotalRequired:freeSpaceAvailable:error:releasingTransaction:]( &OBJC_CLASS___SUCoreSpace,  "_issueSpaceCheckCompletion:withCompletionQueue:haveEnoughSpace:haveTotalRequired:freeSpaceAvailable:error:releasingTransaction:",  *(void *)(a1 + 64),  *(void *)(a1 + 40),  0LL,  0LL,  *(void *)(a1 + 80),  v23,  *(void *)(a1 + 48));

    return;
  }

  +[SUCoreSpace _trackSpaceEnd:withIdentifier:withResult:withError:]( &OBJC_CLASS___SUCoreSpace,  "_trackSpaceEnd:withIdentifier:withResult:withError:",  @"checkAvailableSpace",  @"total",  0LL,  0LL);
  +[SUCorePower setPowerAssertion:forIdentifierDomain:]( &OBJC_CLASS___SUCorePower,  "setPowerAssertion:forIdentifierDomain:",  1LL,  @"space.CheckAvailableSpace");
  v34[0] = MEMORY[0x1895F87A8];
  v34[1] = 3221225472LL;
  v34[2] = __129__SUCoreSpace_checkAvailableSpace_allowPurgeWithUrgency_purgingFromBase_minimalRequiredFreeSpace_withCompletionQueue_completion___block_invoke_54;
  v34[3] = &unk_18A0F1AC8;
  __int128 v39 = *(_OWORD *)(a1 + 72);
  id v38 = *(id *)(a1 + 64);
  id v35 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 48);
  uint64_t v16 = *(void *)(a1 + 88);
  id v36 = v15;
  uint64_t v40 = v16;
  id v37 = *(id *)(a1 + 56);
  char v42 = *(_BYTE *)(a1 + 101);
  int v41 = *(_DWORD *)(a1 + 96);
  id v17 = (void *)MEMORY[0x1895B1904](v34);
  uint64_t v18 = *(void *)(a1 + 56);
  uint64_t v19 = *(void *)(a1 + 72) - *(void *)(a1 + 80);
  if (v18) {
    +[SUCoreSpace cacheDeletePurge:fromBasePath:cacheDeleteUrgency:completion:]( &OBJC_CLASS___SUCoreSpace,  "cacheDeletePurge:fromBasePath:cacheDeleteUrgency:completion:",  v19,  v18,  *(unsigned int *)(a1 + 96),  v17);
  }
  else {
    +[SUCoreSpace cacheDeletePurge:cacheDeleteUrgency:withCompletionQueue:completion:]( &OBJC_CLASS___SUCoreSpace,  "cacheDeletePurge:cacheDeleteUrgency:withCompletionQueue:completion:",  v19,  *(unsigned int *)(a1 + 96),  0LL,  v17);
  }
}

void __129__SUCoreSpace_checkAvailableSpace_allowPurgeWithUrgency_purgingFromBase_minimalRequiredFreeSpace_withCompletionQueue_completion___block_invoke_54( uint64_t a1,  int a2,  uint64_t a3,  uint64_t a4)
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  +[SUCorePower setPowerAssertion:forIdentifierDomain:]( &OBJC_CLASS___SUCorePower,  "setPowerAssertion:forIdentifierDomain:",  0LL,  @"space.CheckAvailableSpace");
  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 oslog];
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (!a4 && a2)
  {
    if (v10)
    {
      uint64_t v11 = *(void *)(a1 + 64);
      uint64_t v12 = *(void *)(a1 + 72);
      *(_DWORD *)buf = 134218496;
      uint64_t v37 = v11;
      __int16 v38 = 2048;
      uint64_t v39 = v12;
      __int16 v40 = 2048;
      uint64_t v41 = a3;
      _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "[SPACE] After cache delete: need %llu total: had %llu free space, was able to free up %llu after cache delete (e nough space to install update)",  buf,  0x20u);
    }

    +[SUCoreSpace _issueSpaceCheckCompletion:withCompletionQueue:haveEnoughSpace:haveTotalRequired:freeSpaceAvailable:error:releasingTransaction:]( &OBJC_CLASS___SUCoreSpace,  "_issueSpaceCheckCompletion:withCompletionQueue:haveEnoughSpace:haveTotalRequired:freeSpaceAvailable:error:releasingTransaction:",  *(void *)(a1 + 56),  *(void *)(a1 + 32),  1LL,  1LL,  *(void *)(a1 + 72) + a3,  0LL,  *(void *)(a1 + 40));
    return;
  }

  if (v10)
  {
    uint64_t v13 = *(void *)(a1 + 64);
    uint64_t v14 = *(void *)(a1 + 72);
    *(_DWORD *)buf = 134218496;
    uint64_t v37 = v13;
    __int16 v38 = 2048;
    uint64_t v39 = v14;
    __int16 v40 = 2048;
    uint64_t v41 = a3;
    _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "[SPACE] After cache delete: need %llu total: had %llu free space, was able to free up %llu after cache delete.  No t enough space to install update.",  buf,  0x20u);
  }

  [MEMORY[0x189612770] sharedDevice];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 deviceClass];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v16 isEqualToString:@"AppleTV"])
  {

    goto LABEL_15;
  }

  int v17 = _os_feature_enabled_impl();

  if (!v17)
  {
LABEL_15:
    +[SUCoreSpace _checkMinimumRequiredSpace:purgingFromBase:userInitiated:totalRequiredFreeSpace:freeSpaceAvailable:checkAvailableSpaceTransaction:withCompletionQueue:completion:]( &OBJC_CLASS___SUCoreSpace,  "_checkMinimumRequiredSpace:purgingFromBase:userInitiated:totalRequiredFreeSpace:freeSpaceAvailable:checkAvailableS paceTransaction:withCompletionQueue:completion:",  *(void *)(a1 + 80),  *(void *)(a1 + 48),  *(unsigned __int8 *)(a1 + 92),  *(void *)(a1 + 64),  *(void *)(a1 + 72),  *(void *)(a1 + 40),  *(void *)(a1 + 32),  *(void *)(a1 + 56));
    return;
  }

  uint64_t v18 = *(void *)(a1 + 64) - (*(void *)(a1 + 72) + a3);
  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 oslog];
  unint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v21 = *(void *)(a1 + 64);
    uint64_t v22 = *(void *)(a1 + 72);
    *(_DWORD *)buf = 134218752;
    uint64_t v37 = v21;
    __int16 v38 = 2048;
    uint64_t v39 = v22;
    __int16 v40 = 2048;
    uint64_t v41 = a3;
    __int16 v42 = 2048;
    uint64_t v43 = v18;
    _os_log_impl( &dword_187A54000,  v20,  OS_LOG_TYPE_DEFAULT,  "[SPACE] Before AppStore App Offload: need %llu total, had %llu free space, was able to free up %llu after cache de lete, but still need %llu.  Attempting to offload AppStore apps",  buf,  0x2Au);
  }

  v27[0] = MEMORY[0x1895F87A8];
  v27[1] = 3221225472LL;
  v27[2] = __129__SUCoreSpace_checkAvailableSpace_allowPurgeWithUrgency_purgingFromBase_minimalRequiredFreeSpace_withCompletionQueue_completion___block_invoke_60;
  v27[3] = &unk_18A0F1AA0;
  __int128 v32 = *(_OWORD *)(a1 + 64);
  uint64_t v33 = a3;
  id v31 = *(id *)(a1 + 56);
  id v28 = *(id *)(a1 + 32);
  id v23 = *(id *)(a1 + 40);
  uint64_t v24 = *(void *)(a1 + 80);
  id v29 = v23;
  uint64_t v34 = v24;
  id v30 = *(id *)(a1 + 48);
  char v35 = *(_BYTE *)(a1 + 92);
  char v25 = (void *)MEMORY[0x1895B1904](v27);
  uint64_t v26 = *(void *)(a1 + 48);
  if (v26) {
    +[SUCoreSpace offloadAppsPurge:fromBasePath:cacheDeleteUrgency:withCompletionQueue:completion:]( &OBJC_CLASS___SUCoreSpace,  "offloadAppsPurge:fromBasePath:cacheDeleteUrgency:withCompletionQueue:completion:",  v18,  v26,  *(int *)(a1 + 88),  0LL,  v25);
  }
  else {
    +[SUCoreSpace offloadAppsPurge:cacheDeleteUrgency:withCompletionQueue:completion:]( &OBJC_CLASS___SUCoreSpace,  "offloadAppsPurge:cacheDeleteUrgency:withCompletionQueue:completion:",  v18,  *(int *)(a1 + 88),  0LL,  v25);
  }
}

uint64_t __129__SUCoreSpace_checkAvailableSpace_allowPurgeWithUrgency_purgingFromBase_minimalRequiredFreeSpace_withCompletionQueue_completion___block_invoke_60( uint64_t a1,  int a2,  uint64_t a3,  uint64_t a4)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 oslog];
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (a4 || !a2)
  {
    if (v10)
    {
      uint64_t v15 = *(void *)(a1 + 64);
      uint64_t v16 = *(void *)(a1 + 72);
      uint64_t v17 = *(void *)(a1 + 80);
      *(_DWORD *)buf = 134218752;
      uint64_t v19 = v15;
      __int16 v20 = 2048;
      uint64_t v21 = v16;
      __int16 v22 = 2048;
      uint64_t v23 = v17;
      __int16 v24 = 2048;
      uint64_t v25 = a3;
      _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "[SPACE] After AppStore App Offload: need %llu total: had %llu free space, was able to free up %llu after cache d elete and %llu after AppStore app offload.  Not enough space to install update.",  buf,  0x2Au);
    }

    return +[SUCoreSpace _checkMinimumRequiredSpace:purgingFromBase:userInitiated:totalRequiredFreeSpace:freeSpaceAvailable:checkAvailableSpaceTransaction:withCompletionQueue:completion:]( &OBJC_CLASS___SUCoreSpace,  "_checkMinimumRequiredSpace:purgingFromBase:userInitiated:totalRequiredFreeSpace:freeSpaceAvailable:checkAva ilableSpaceTransaction:withCompletionQueue:completion:",  *(void *)(a1 + 88),  *(void *)(a1 + 48),  *(unsigned __int8 *)(a1 + 96),  *(void *)(a1 + 64),  *(void *)(a1 + 72),  *(void *)(a1 + 40),  *(void *)(a1 + 32),  *(void *)(a1 + 56));
  }

  else
  {
    if (v10)
    {
      uint64_t v11 = *(void *)(a1 + 64);
      uint64_t v12 = *(void *)(a1 + 72);
      uint64_t v13 = *(void *)(a1 + 80);
      *(_DWORD *)buf = 134218752;
      uint64_t v19 = v11;
      __int16 v20 = 2048;
      uint64_t v21 = v12;
      __int16 v22 = 2048;
      uint64_t v23 = v13;
      __int16 v24 = 2048;
      uint64_t v25 = a3;
      _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "[SPACE] After AppStore App offload: need %llu total, had %llu free space, able to free up %llu after cache delet e and %llu after AppStore app offload. (enough space to install update)",  buf,  0x2Au);
    }

    return +[SUCoreSpace _issueSpaceCheckCompletion:withCompletionQueue:haveEnoughSpace:haveTotalRequired:freeSpaceAvailable:error:releasingTransaction:]( &OBJC_CLASS___SUCoreSpace,  "_issueSpaceCheckCompletion:withCompletionQueue:haveEnoughSpace:haveTotalRequired:freeSpaceAvailable:error:r eleasingTransaction:",  *(void *)(a1 + 56),  *(void *)(a1 + 32),  1LL,  1LL,  *(void *)(a1 + 72) + a3 + *(void *)(a1 + 80),  0LL,  *(void *)(a1 + 40));
  }

+ (void)checkAvailableFreeSpace:(unint64_t)a3 checkingFromBase:(id)a4 withIdentifier:(id)a5 userInitiated:(BOOL)a6 completion:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  +[SUCoreSpace sharedSpaceManager](&OBJC_CLASS___SUCoreSpace, "sharedSpaceManager");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 spaceQueue];
  uint64_t v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __96__SUCoreSpace_checkAvailableFreeSpace_checkingFromBase_withIdentifier_userInitiated_completion___block_invoke;
  block[3] = &unk_18A0F1B68;
  id v20 = v11;
  id v21 = v12;
  BOOL v24 = a6;
  id v22 = v13;
  unint64_t v23 = a3;
  id v16 = v13;
  id v17 = v12;
  id v18 = v11;
  dispatch_async(v15, block);
}

void __96__SUCoreSpace_checkAvailableFreeSpace_checkingFromBase_withIdentifier_userInitiated_completion___block_invoke( uint64_t a1)
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  v2 = (__CFString *)*(id *)(a1 + 32);
  if (v2) {
    id v3 = v2;
  }
  else {
    id v3 = @"/var/mobile/";
  }
  bzero(&v38, 0x878uLL);
  v4 = v3;
  if (statfs((const char *)-[__CFString fileSystemRepresentation](v4, "fileSystemRepresentation"), &v38))
  {
    v5 = (void *)[objc_alloc(NSString) initWithFormat:@"check for available space failed (unable to statfs basePath=%@)", v4];
    [MEMORY[0x189612760] sharedCore];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 buildError:8602 underlying:0 description:v5];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

    +[SUCoreSpace _spaceCheckPhaseError:checkingFromBase:withIdentier:completion:]( &OBJC_CLASS___SUCoreSpace,  "_spaceCheckPhaseError:checkingFromBase:withIdentier:completion:",  v7,  v4,  *(void *)(a1 + 40),  *(void *)(a1 + 48));
  }

  else
  {
    [NSString stringWithCString:v38.f_mntonname encoding:4];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      uint64_t v27 = 0LL;
      uint64_t v9 = (void *)CacheDeleteCopyAvailableSpaceForVolume();
      BOOL v10 = v9;
      if (v9)
      {
        unint64_t v12 = [v9 unsignedLongLongValue];
        unint64_t v13 = *(void *)(a1 + 56);
        [MEMORY[0x1896127A0] sharedLogger];
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 oslog];
        uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = *(void *)(a1 + 40);
          uint64_t v17 = *(void *)(a1 + 56);
          id v18 = @"NO";
          if (v12 >= v13) {
            id v18 = @"YES";
          }
          *(_DWORD *)buf = 138544386;
          id v29 = v8;
          __int16 v30 = 2114;
          uint64_t v31 = v16;
          __int16 v32 = 2048;
          uint64_t v33 = v17;
          __int16 v34 = 2048;
          unint64_t v35 = v12;
          __int16 v36 = 2114;
          uint64_t v37 = v18;
          _os_log_impl( &dword_187A54000,  v15,  OS_LOG_TYPE_DEFAULT,  "[SPACE] checked space on %{public}@ (%{public}@): required %llu and %llu is available | haveEnoughSpace:%{public}@",  buf,  0x34u);
        }

        [MEMORY[0x189612760] sharedCore];
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v19 completionQueue];
        id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 3221225472LL;
        block[2] = __96__SUCoreSpace_checkAvailableFreeSpace_checkingFromBase_withIdentifier_userInitiated_completion___block_invoke_76;
        block[3] = &unk_18A0F1B40;
        id v21 = *(id *)(a1 + 48);
        BOOL v26 = v12 >= v13;
        id v24 = v21;
        unint64_t v25 = v12;
        dispatch_async(v20, block);

        v5 = 0LL;
        uint64_t v7 = 0LL;
      }

      else
      {
        v5 = (void *)[objc_alloc(NSString) initWithFormat:@"check for available space failed (unable to determine available space through cache delete for basePath=%@)", v4];
        [MEMORY[0x189612760] sharedCore];
        id v22 = (void *)objc_claimAutoreleasedReturnValue();
        [v22 buildError:8602 underlying:0 description:v5];
        uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

        +[SUCoreSpace _spaceCheckPhaseError:checkingFromBase:withIdentier:completion:]( &OBJC_CLASS___SUCoreSpace,  "_spaceCheckPhaseError:checkingFromBase:withIdentier:completion:",  v7,  v4,  *(void *)(a1 + 40),  *(void *)(a1 + 48));
      }
    }

    else
    {
      v5 = (void *)[objc_alloc(NSString) initWithFormat:@"check for available space failed (unable to determine volume name from basePath=%@)", v4];
      [MEMORY[0x189612760] sharedCore];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 buildError:8602 underlying:0 description:v5];
      uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

      +[SUCoreSpace _spaceCheckPhaseError:checkingFromBase:withIdentier:completion:]( &OBJC_CLASS___SUCoreSpace,  "_spaceCheckPhaseError:checkingFromBase:withIdentier:completion:",  v7,  v4,  *(void *)(a1 + 40),  *(void *)(a1 + 48));
    }
  }
}

uint64_t __96__SUCoreSpace_checkAvailableFreeSpace_checkingFromBase_withIdentifier_userInitiated_completion___block_invoke_76( uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(unsigned __int8 *)(a1 + 48),  *(void *)(a1 + 40),  0LL);
}

+ (void)cacheDeletePurge:(unint64_t)a3 fromBasePath:(id)a4 cacheDeleteUrgency:(int)a5 completion:(id)a6
{
}

+ (void)cacheDeletePurge:(unint64_t)a3 fromBasePath:(id)a4 cacheDeleteUrgency:(int)a5 withCompletionQueue:(id)a6 completion:(id)a7
{
}

+ (void)cacheDeletePurge:(unint64_t)a3 fromBasePath:(id)a4 cacheDeleteUrgency:(int)a5 timeout:(int)a6 withCompletionQueue:(id)a7 completion:(id)a8
{
  uint64_t v11 = *(void *)&a5;
  v35[4] = *MEMORY[0x1895F89C0];
  unint64_t v13 = (__CFString *)a4;
  id v14 = a7;
  id v15 = a8;
  uint64_t v28 = 0LL;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000LL;
  uint64_t v31 = 0LL;
  if (v13) {
    uint64_t v16 = v13;
  }
  else {
    uint64_t v16 = @"/var/mobile/";
  }
  if (a6 >= 1) {
    uint64_t v17 = a6;
  }
  else {
    uint64_t v17 = 300LL;
  }
  v35[0] = v16;
  v34[0] = @"CACHE_DELETE_VOLUME";
  v34[1] = @"CACHE_DELETE_AMOUNT";
  [MEMORY[0x189607968] numberWithLongLong:a3];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v18;
  v34[2] = @"CACHE_DELETE_URGENCY_LIMIT";
  [MEMORY[0x189607968] numberWithInt:v11];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v19;
  v34[3] = @"CACHE_DELETE_PURGE_TIMEOUT";
  [MEMORY[0x189607968] numberWithInt:v17];
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v20;
  [MEMORY[0x189603F68] dictionaryWithObjects:v35 forKeys:v34 count:4];
  id v21 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x1896127A0] sharedLogger];
  id v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 oslog];
  unint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v33 = v21;
    _os_log_impl( &dword_187A54000,  v23,  OS_LOG_TYPE_DEFAULT,  "[SPACE] triggering CacheDeletePurge with info: %{public}@",  buf,  0xCu);
  }

  +[SUCoreSpace _trackSpaceBegin:]( &OBJC_CLASS___SUCoreSpace,  "_trackSpaceBegin:",  @"CacheDeletePurgeSpaceWithInfo");
  [MEMORY[0x189612760] beginTransactionWithName:@"space.CacheDeletePurge"];
  id v24 = (void *)objc_claimAutoreleasedReturnValue();
  id v27 = v15;
  id v25 = v14;
  id v26 = v24;
  v29[3] = CacheDeletePurgeSpaceWithInfo();

  _Block_object_dispose(&v28, 8);
}

void __103__SUCoreSpace_cacheDeletePurge_fromBasePath_cacheDeleteUrgency_timeout_withCompletionQueue_completion___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  valuePtr = 0LL;
  if (!a2)
  {
    uint64_t v11 = @"no results provided on cache delete purge complete";
LABEL_12:
    uint64_t v12 = 8601LL;
LABEL_15:
    [MEMORY[0x189612760] sharedCore];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 buildError:v12 underlying:0 description:v11];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }

  id v3 = a2;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (TypeID != CFGetTypeID(v3))
  {
    [MEMORY[0x189612778] sharedDiag];
    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 trackAnomaly:@"cacheDeletePurge" forReason:@"result provided by CacheDeletePurgeSpaceWithInfo is not CFDictionary type - ignored" withResult:8112 withError:0];

    uint64_t v11 = @"invalid results type provided on cache delete purge complete";
    goto LABEL_12;
  }

  [MEMORY[0x1896127A0] sharedLogger];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 oslog];
  uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v29 = v3;
    _os_log_impl(&dword_187A54000, v6, OS_LOG_TYPE_DEFAULT, "[PURGE] cache delete purge results: %@", buf, 0xCu);
  }

  Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)v3, @"CACHE_DELETE_AMOUNT");
  if (!Value)
  {
    uint64_t v11 = @"no amount of space purged provided on cache delete purge complete";
    uint64_t v12 = 8601LL;
    goto LABEL_14;
  }

  CFNumberGetValue(Value, kCFNumberLongLongType, &valuePtr);
  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 oslog];
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v29 = valuePtr;
    _os_log_impl(&dword_187A54000, v9, OS_LOG_TYPE_DEFAULT, "[SPACE] purged %lld bytes", buf, 0xCu);
  }

  if ((unint64_t)valuePtr < *(void *)(a1 + 64))
  {
    id v10 = objc_alloc(NSString);
    uint64_t v11 = (__CFString *)objc_msgSend( v10,  "initWithFormat:",  @"purged %lld but needed to purge %lld (not enough space)",  valuePtr,  *(void *)(a1 + 64));
    uint64_t v12 = 8600LL;
LABEL_14:

    goto LABEL_15;
  }

  [MEMORY[0x1896127A0] sharedLogger];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 oslog];
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v20 = *(void *)(a1 + 64);
    *(_DWORD *)buf = 134218240;
    id v29 = valuePtr;
    __int16 v30 = 2048;
    uint64_t v31 = v20;
    _os_log_impl( &dword_187A54000,  v19,  OS_LOG_TYPE_DEFAULT,  "[SPACE] purged %lld when needed to purge %lld (have enough space)",  buf,  0x16u);
  }

  uint64_t v12 = 0LL;
  uint64_t v11 = 0LL;
  id v14 = 0LL;
LABEL_16:

  +[SUCoreSpace _trackSpaceEnd:withResult:withError:]( &OBJC_CLASS___SUCoreSpace,  "_trackSpaceEnd:withResult:withError:",  @"CacheDeletePurgeSpaceWithInfo",  v12,  v14);
  if (*(void *)(a1 + 48))
  {
    [MEMORY[0x189612760] sharedCore];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 selectCompletionQueue:*(void *)(a1 + 32)];
    uint64_t v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __103__SUCoreSpace_cacheDeletePurge_fromBasePath_cacheDeleteUrgency_timeout_withCompletionQueue_completion___block_invoke_101;
    block[3] = &unk_18A0F1B90;
    id v24 = *(id *)(a1 + 48);
    uint64_t v25 = v12;
    id v26 = valuePtr;
    id v22 = v14;
    id v23 = *(id *)(a1 + 40);
    dispatch_async(v16, block);
  }

  else
  {
    [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"space.CacheDeletePurge"];
  }

  uint64_t v17 = *(const void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL);
  if (v17)
  {
    CFRelease(v17);
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 0LL;
  }
}

uint64_t __103__SUCoreSpace_cacheDeletePurge_fromBasePath_cacheDeleteUrgency_timeout_withCompletionQueue_completion___block_invoke_101( void *a1)
{
  (*(void (**)(void, BOOL, void, void))(a1[6] + 16LL))(a1[6], a1[7] == 0LL, a1[8], a1[4]);
  return [MEMORY[0x189612760] endTransaction:a1[5] withName:@"space.CacheDeletePurge"];
}

+ (void)cacheDeletePurge:(unint64_t)a3 cacheDeleteUrgency:(int)a4 withCompletionQueue:(id)a5 completion:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v9 = a5;
  id v10 = a6;
  if (+[SUCoreSpace _isUserVolume:](&OBJC_CLASS___SUCoreSpace, "_isUserVolume:", @"/var/mobile/"))
  {
    [MEMORY[0x189612760] beginTransactionWithName:@"space.CacheDeletePurge"];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUCoreSpace sharedSpaceManager](&OBJC_CLASS___SUCoreSpace, "sharedSpaceManager");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 spaceQueue];
    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __82__SUCoreSpace_cacheDeletePurge_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke;
    v15[3] = &unk_18A0F1C08;
    id v18 = v10;
    id v16 = v9;
    id v17 = v11;
    id v14 = v11;
    +[SUCoreSpace cacheDeletePurge:fromBasePath:cacheDeleteUrgency:timeout:withCompletionQueue:completion:]( &OBJC_CLASS___SUCoreSpace,  "cacheDeletePurge:fromBasePath:cacheDeleteUrgency:timeout:withCompletionQueue:completion:",  a3,  @"/var/mobile/",  v7,  300LL,  v13,  v15);
  }

  else
  {
    +[SUCoreSpace cacheDeletePurge:fromBasePath:cacheDeleteUrgency:withCompletionQueue:completion:]( &OBJC_CLASS___SUCoreSpace,  "cacheDeletePurge:fromBasePath:cacheDeleteUrgency:withCompletionQueue:completion:",  a3,  @"/var/mobile/",  v7,  v9,  v10);
  }
}

void __82__SUCoreSpace_cacheDeletePurge_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke( uint64_t a1,  char a2,  uint64_t a3,  void *a4)
{
  id v7 = a4;
  if (*(void *)(a1 + 48))
  {
    [MEMORY[0x189612760] sharedCore];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 selectCompletionQueue:*(void *)(a1 + 32)];
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __82__SUCoreSpace_cacheDeletePurge_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke_2;
    block[3] = &unk_18A0F1BE0;
    id v10 = *(id *)(a1 + 48);
    char v16 = a2;
    id v14 = v10;
    uint64_t v15 = a3;
    id v12 = v7;
    id v13 = *(id *)(a1 + 40);
    dispatch_async(v9, block);
  }

  else
  {
    [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"space.CacheDeletePurge"];
  }
}

uint64_t __82__SUCoreSpace_cacheDeletePurge_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke_2( uint64_t a1)
{
  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"space.CacheDeletePurge"];
}

+ (void)checkPurgeableSpaceCacheDelete:(unint64_t)a3 fromBasePath:(id)a4 cacheDeleteUrgency:(int)a5 withCompletionQueue:(id)a6 completion:(id)a7
{
}

+ (void)checkPurgeableSpaceCacheDelete:(unint64_t)a3 fromBasePath:(id)a4 cacheDeleteUrgency:(int)a5 timeout:(int)a6 additionalOptions:(id)a7 withCompletionQueue:(id)a8 completion:(id)a9
{
  v59[3] = *MEMORY[0x1895F89C0];
  id v13 = a4;
  id v14 = a7;
  id v46 = a8;
  id v15 = a9;
  +[SUCoreSpace _trackSpaceBegin:]( &OBJC_CLASS___SUCoreSpace,  "_trackSpaceBegin:",  @"CacheDeleteCopyPurgeableSpaceWithInfo");
  [MEMORY[0x189612760] beginTransactionWithName:@"space.CacheDeletePurgeable"];
  __int16 v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (a6 >= 1) {
    uint64_t v16 = a6;
  }
  else {
    uint64_t v16 = 300LL;
  }
  uint64_t v47 = v13;
  v59[0] = v13;
  v58[0] = @"CACHE_DELETE_VOLUME";
  v58[1] = @"CACHE_DELETE_URGENCY";
  [MEMORY[0x189607968] numberWithLongLong:a5];
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v17;
  v58[2] = @"CACHE_DELETE_PURGE_TIMEOUT";
  [MEMORY[0x189607968] numberWithInt:v16];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  v59[2] = v18;
  [MEMORY[0x189603F68] dictionaryWithObjects:v59 forKeys:v58 count:3];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v20 = (void *)[v19 mutableCopy];

  if (v14) {
    [v20 addEntriesFromDictionary:v14];
  }
  [MEMORY[0x1896127A0] sharedLogger];
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 oslog];
  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    unint64_t v55 = (unint64_t)v20;
    _os_log_impl( &dword_187A54000,  v22,  OS_LOG_TYPE_DEFAULT,  "[SPACE] triggering cache delete purgeable check with options: %{public}@",  buf,  0xCu);
  }

  uint64_t v23 = CacheDeleteCopyPurgeableSpaceWithInfo();
  unint64_t v24 = 0x189612000LL;
  if (!v23)
  {
    uint64_t v33 = v14;
    unint64_t v30 = 0LL;
    uint64_t v31 = @"no results provided on cache delete purgeable complete";
LABEL_18:
    uint64_t v32 = 8603LL;
LABEL_21:
    [*(id *)(v24 + 1888) sharedCore];
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 buildError:v32 underlying:0 description:v31];
    unint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }

  uint64_t v25 = (void *)v23;
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (TypeID != CFGetTypeID(v25))
  {
    uint64_t v33 = v14;
    [MEMORY[0x189612778] sharedDiag];
    __int16 v34 = (void *)objc_claimAutoreleasedReturnValue();
    [v34 trackAnomaly:@"cacheDeletePurgeable" forReason:@"result provided by CacheDeleteCopyPurgeableSpaceWithInfo is not CFDictionary type - ignored" withResult:8112 withError:0];

    CFRelease(v25);
    unint64_t v30 = 0LL;
    uint64_t v31 = @"invalid results type provided on cache delete purgeable complete";
    goto LABEL_18;
  }

  [MEMORY[0x1896127A0] sharedLogger];
  id v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v27 oslog];
  uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    unint64_t v55 = (unint64_t)v25;
    _os_log_impl(&dword_187A54000, v28, OS_LOG_TYPE_DEFAULT, "[SPACE] cache delete purgeable results: %@", buf, 0xCu);
  }

  [v25 objectForKey:@"CACHE_DELETE_AMOUNT"];
  id v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v29 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    unint64_t v30 = 0LL;
    uint64_t v31 = @"no amount of purgeable space provided on cache delete purgeable complete";
    uint64_t v32 = 8603LL;
    goto LABEL_20;
  }

  unint64_t v30 = [v29 unsignedLongLongValue];
  if (v30 < a3)
  {
    uint64_t v31 = (__CFString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"purgeable %lld but needed to purge %lld (not enough space)",  v30,  a3);
    uint64_t v32 = 8600LL;
LABEL_20:
    uint64_t v33 = v14;

    unint64_t v24 = 0x189612000uLL;
    goto LABEL_21;
  }

  uint64_t v33 = v14;
  [MEMORY[0x1896127A0] sharedLogger];
  __int16 v42 = (void *)objc_claimAutoreleasedReturnValue();
  [v42 oslog];
  uint64_t v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    unint64_t v55 = v30;
    __int16 v56 = 2048;
    unint64_t v57 = a3;
    _os_log_impl( &dword_187A54000,  v43,  OS_LOG_TYPE_DEFAULT,  "[SPACE] purgeable %lld when needed to purge %lld (have enough space)",  buf,  0x16u);
  }

  uint64_t v32 = 0LL;
  uint64_t v31 = 0LL;
  unint64_t v35 = 0LL;
  unint64_t v24 = 0x189612000LL;
LABEL_22:

  +[SUCoreSpace _trackSpaceEnd:withResult:withError:]( &OBJC_CLASS___SUCoreSpace,  "_trackSpaceEnd:withResult:withError:",  @"CacheDeleteCopyPurgeableSpaceWithInfo",  v32,  v35);
  __int16 v36 = *(void **)(v24 + 1888);
  uint64_t v37 = v15;
  if (v15)
  {
    [v36 sharedCore];
    statfs v38 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v39 = v46;
    [v38 selectCompletionQueue:v46];
    __int16 v40 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __135__SUCoreSpace_checkPurgeableSpaceCacheDelete_fromBasePath_cacheDeleteUrgency_timeout_additionalOptions_withCompletionQueue_completion___block_invoke;
    block[3] = &unk_18A0F1B90;
    id v51 = v37;
    uint64_t v52 = v32;
    unint64_t v53 = v30;
    id v49 = v35;
    uint64_t v41 = v45;
    id v50 = v45;
    dispatch_async(v40, block);
  }

  else
  {
    uint64_t v41 = v45;
    [v36 endTransaction:v45 withName:@"space.CacheDeletePurgeable"];
    uint64_t v39 = v46;
  }
}

uint64_t __135__SUCoreSpace_checkPurgeableSpaceCacheDelete_fromBasePath_cacheDeleteUrgency_timeout_additionalOptions_withCompletionQueue_completion___block_invoke( void *a1)
{
  (*(void (**)(void, BOOL, void, void))(a1[6] + 16LL))(a1[6], a1[7] == 0LL, a1[8], a1[4]);
  return [MEMORY[0x189612760] endTransaction:a1[5] withName:@"space.CacheDeletePurgeable"];
}

+ (void)checkPurgeableSpaceCacheDelete:(unint64_t)a3 cacheDeleteUrgency:(int)a4 withCompletionQueue:(id)a5 completion:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v9 = a5;
  id v10 = a6;
  if (+[SUCoreSpace _isUserVolume:](&OBJC_CLASS___SUCoreSpace, "_isUserVolume:", @"/var/mobile/"))
  {
    [MEMORY[0x189612760] beginTransactionWithName:@"space.CacheDeletePurgeable"];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUCoreSpace sharedSpaceManager](&OBJC_CLASS___SUCoreSpace, "sharedSpaceManager");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 spaceQueue];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __96__SUCoreSpace_checkPurgeableSpaceCacheDelete_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke;
    v15[3] = &unk_18A0F1C08;
    id v18 = v10;
    id v16 = v9;
    id v17 = v11;
    id v14 = v11;
    +[SUCoreSpace checkPurgeableSpaceCacheDelete:fromBasePath:cacheDeleteUrgency:timeout:additionalOptions:withCompletionQueue:completion:]( &OBJC_CLASS___SUCoreSpace,  "checkPurgeableSpaceCacheDelete:fromBasePath:cacheDeleteUrgency:timeout:additionalOptions:withCompletionQueue:completion:",  a3,  @"/var/mobile/",  v7,  300LL,  0LL,  v13,  v15);
  }

  else
  {
    +[SUCoreSpace checkPurgeableSpaceCacheDelete:fromBasePath:cacheDeleteUrgency:withCompletionQueue:completion:]( &OBJC_CLASS___SUCoreSpace,  "checkPurgeableSpaceCacheDelete:fromBasePath:cacheDeleteUrgency:withCompletionQueue:completion:",  a3,  @"/var/mobile/",  v7,  v9,  v10);
  }
}

void __96__SUCoreSpace_checkPurgeableSpaceCacheDelete_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke( uint64_t a1,  char a2,  uint64_t a3,  void *a4)
{
  id v7 = a4;
  if (*(void *)(a1 + 48))
  {
    [MEMORY[0x189612760] sharedCore];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 selectCompletionQueue:*(void *)(a1 + 32)];
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __96__SUCoreSpace_checkPurgeableSpaceCacheDelete_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke_2;
    block[3] = &unk_18A0F1BE0;
    id v10 = *(id *)(a1 + 48);
    char v16 = a2;
    id v14 = v10;
    uint64_t v15 = a3;
    id v12 = v7;
    id v13 = *(id *)(a1 + 40);
    dispatch_async(v9, block);
  }

  else
  {
    [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"space.CacheDeletePurgeable"];
  }
}

uint64_t __96__SUCoreSpace_checkPurgeableSpaceCacheDelete_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke_2( uint64_t a1)
{
  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"space.CacheDeletePurgeable"];
}

+ (id)cacheDeleteUrgencyName:(int)a3
{
  else {
    return *(&off_18A0F1CF0 + a3 + 1);
  }
}

+ (void)checkPurgeableSpaceOffloadApps:(unint64_t)a3 fromBasePath:(id)a4 cacheDeleteUrgency:(int64_t)a5 withCompletionQueue:(id)a6 completion:(id)a7
{
  uint64_t v34 = *MEMORY[0x1895F89C0];
  id v11 = a6;
  id v12 = a7;
  id v13 = (__CFString *)a4;
  +[SUCoreSpace _trackSpaceBegin:](&OBJC_CLASS___SUCoreSpace, "_trackSpaceBegin:", @"ASDPurgeableAppRequest");
  [MEMORY[0x189612760] beginTransactionWithName:@"space.AppOffloadPurgeable"];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = objc_alloc(MEMORY[0x18960CEC0]);
  if (v13) {
    char v16 = v13;
  }
  else {
    char v16 = @"/var/mobile/";
  }
  id v17 = (void *)[v15 initWithVolume:v16 urgency:a5];

  [v17 setPerformAvailablityCheck:1];
  [MEMORY[0x189612770] sharedDevice];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 deviceClass];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v19 isEqualToString:@"AppleTV"])
  {
    int v20 = _os_feature_enabled_impl();

    if (v20) {
      [v17 setSkipLaunchCheck:1];
    }
  }

  else
  {
  }

  [MEMORY[0x1896127A0] sharedLogger];
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 oslog];
  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v33 = v17;
    _os_log_impl( &dword_187A54000,  v22,  OS_LOG_TYPE_DEFAULT,  "[SPACE] triggering app offload purgeable check with options: %{public}@",  buf,  0xCu);
  }

  uint64_t v23 = (void *)[objc_alloc(MEMORY[0x18960CEB8]) initWithOptions:v17];
  if (v23)
  {
    v27[0] = MEMORY[0x1895F87A8];
    v27[1] = 3221225472LL;
    v27[2] = __109__SUCoreSpace_checkPurgeableSpaceOffloadApps_fromBasePath_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke;
    v27[3] = &unk_18A0F1C30;
    unint64_t v31 = a3;
    id v30 = v12;
    id v28 = v11;
    id v29 = v14;
    [v23 startWithCompletionBlock:v27];

    unint64_t v24 = v30;
  }

  else
  {
    [MEMORY[0x189612778] sharedDiag];
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 trackAnomaly:@"ASDPurgeableAppRequest" forReason:@"Failed to create ASDPurgeableAppRequest instance" withResult:8100 withError:0];

    [MEMORY[0x189612760] sharedCore];
    id v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v26 buildError:8605 underlying:0 description:@"Failed to create ASDPurgeAppsRequest instance"];
    unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();

    +[SUCoreSpace _trackSpaceEnd:withResult:withError:]( &OBJC_CLASS___SUCoreSpace,  "_trackSpaceEnd:withResult:withError:",  @"ASDPurgeAppsRequest",  8605LL,  v24);
    +[SUCoreSpace _issueSpacePurgeableCompetion:withCompletionQueue:result:spacePurgeable:error:releasingTransaction:]( &OBJC_CLASS___SUCoreSpace,  "_issueSpacePurgeableCompetion:withCompletionQueue:result:spacePurgeable:error:releasingTransaction:",  v12,  v11,  0LL,  0LL,  v24,  v14);
  }
}

void __109__SUCoreSpace_checkPurgeableSpaceOffloadApps_fromBasePath_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke( void *a1,  int a2,  void *a3,  void *a4)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    unint64_t v9 = 0LL;
    id v12 = @"ASDPurgeableAppRequest returned null response";
    uint64_t v13 = 8605LL;
    goto LABEL_12;
  }

  unint64_t v9 = [v7 purgeableSize];
  [MEMORY[0x1896127A0] sharedLogger];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 oslog];
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    unint64_t v20 = v9;
    _os_log_impl( &dword_187A54000,  v11,  OS_LOG_TYPE_DEFAULT,  "[SPACE] app offload purgeable space %lld bytes",  buf,  0xCu);
  }

  if (v9 < a1[7])
  {
    id v12 = (__CFString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"purgeable %lld is less than requested %lld (not enough space)",  v9,  a1[7]);
    uint64_t v13 = 8600LL;
LABEL_12:
    [MEMORY[0x189612760] sharedCore];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 buildError:v13 underlying:v8 description:v12];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = 0LL;
    goto LABEL_13;
  }

  if (!a2)
  {
    id v12 = @"ASDPurgeableAppRequest returned result=NO";
    uint64_t v13 = 8606LL;
    goto LABEL_12;
  }

  [MEMORY[0x1896127A0] sharedLogger];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 oslog];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = a1[7];
    *(_DWORD *)buf = 134218240;
    unint64_t v20 = v9;
    __int16 v21 = 2048;
    uint64_t v22 = v16;
    _os_log_impl( &dword_187A54000,  (os_log_t)v15,  OS_LOG_TYPE_DEFAULT,  "[SPACE] app offload purgeable %lld when needed to purge %lld (have enough space)",  buf,  0x16u);
  }

  uint64_t v13 = 0LL;
  id v12 = 0LL;
  id v17 = 0LL;
  uint64_t v18 = 1LL;
LABEL_13:

  +[SUCoreSpace _trackSpaceEnd:withResult:withError:]( &OBJC_CLASS___SUCoreSpace,  "_trackSpaceEnd:withResult:withError:",  @"ASDPurgeableAppRequest",  v13,  v17);
  +[SUCoreSpace _issueSpacePurgeableCompetion:withCompletionQueue:result:spacePurgeable:error:releasingTransaction:]( &OBJC_CLASS___SUCoreSpace,  "_issueSpacePurgeableCompetion:withCompletionQueue:result:spacePurgeable:error:releasingTransaction:",  a1[6],  a1[4],  v18,  v9,  v17,  a1[5]);
}

+ (void)checkPurgeableSpaceOffloadApps:(unint64_t)a3 cacheDeleteUrgency:(int64_t)a4 withCompletionQueue:(id)a5 completion:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  if (+[SUCoreSpace _isUserVolume:](&OBJC_CLASS___SUCoreSpace, "_isUserVolume:", @"/var/mobile/"))
  {
    [MEMORY[0x189612760] beginTransactionWithName:@"space.AppOffloadPurgeable"];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189612760] sharedCore];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 selectCompletionQueue:v9];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __96__SUCoreSpace_checkPurgeableSpaceOffloadApps_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke;
    v15[3] = &unk_18A0F1C08;
    id v18 = v10;
    id v16 = v9;
    id v17 = v11;
    id v14 = v11;
    +[SUCoreSpace checkPurgeableSpaceOffloadApps:fromBasePath:cacheDeleteUrgency:withCompletionQueue:completion:]( &OBJC_CLASS___SUCoreSpace,  "checkPurgeableSpaceOffloadApps:fromBasePath:cacheDeleteUrgency:withCompletionQueue:completion:",  a3,  @"/var/mobile/",  a4,  v13,  v15);
  }

  else
  {
    +[SUCoreSpace checkPurgeableSpaceOffloadApps:cacheDeleteUrgency:withCompletionQueue:completion:]( &OBJC_CLASS___SUCoreSpace,  "checkPurgeableSpaceOffloadApps:cacheDeleteUrgency:withCompletionQueue:completion:",  a3,  a4,  v9,  v10);
  }
}

void __96__SUCoreSpace_checkPurgeableSpaceOffloadApps_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke( uint64_t a1,  char a2,  uint64_t a3,  void *a4)
{
  id v7 = a4;
  if (*(void *)(a1 + 48))
  {
    [MEMORY[0x189612760] sharedCore];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 selectCompletionQueue:*(void *)(a1 + 32)];
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __96__SUCoreSpace_checkPurgeableSpaceOffloadApps_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke_2;
    block[3] = &unk_18A0F1BE0;
    id v10 = *(id *)(a1 + 48);
    char v16 = a2;
    id v14 = v10;
    uint64_t v15 = a3;
    id v12 = v7;
    id v13 = *(id *)(a1 + 40);
    dispatch_async(v9, block);
  }

  else
  {
    [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"space.AppOffloadPurgeable"];
  }
}

uint64_t __96__SUCoreSpace_checkPurgeableSpaceOffloadApps_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke_2( uint64_t a1)
{
  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"space.AppOffloadPurgeable"];
}

+ (void)offloadAppsPurge:(unint64_t)a3 fromBasePath:(id)a4 cacheDeleteUrgency:(int64_t)a5 withCompletionQueue:(id)a6 completion:(id)a7
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  id v11 = a6;
  id v12 = a7;
  id v13 = (__CFString *)a4;
  +[SUCoreSpace _trackSpaceBegin:](&OBJC_CLASS___SUCoreSpace, "_trackSpaceBegin:", @"ASDPurgeAppsRequest");
  [MEMORY[0x189612760] beginTransactionWithName:@"space.AppOffloadPurge"];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = objc_alloc(MEMORY[0x18960CEB0]);
  if (v13) {
    char v16 = v13;
  }
  else {
    char v16 = @"/var/mobile/";
  }
  id v17 = (void *)[v15 initWithVolume:v16 urgency:a5];

  [MEMORY[0x189607968] numberWithUnsignedLongLong:a3];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 setDesiredPurgeAmount:v18];

  [MEMORY[0x189612770] sharedDevice];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 deviceClass];
  unint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v20 isEqualToString:@"AppleTV"])
  {
    int v21 = _os_feature_enabled_impl();

    if (v21) {
      [v17 setSkipLaunchCheck:1];
    }
  }

  else
  {
  }

  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 oslog];
  uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v34 = v17;
    _os_log_impl( &dword_187A54000,  v23,  OS_LOG_TYPE_DEFAULT,  "[SPACE] triggering app offload purge with options: %{public}@",  buf,  0xCu);
  }

  unint64_t v24 = (void *)[objc_alloc(MEMORY[0x18960CEA8]) initWithOptions:v17];
  if (v24)
  {
    v28[0] = MEMORY[0x1895F87A8];
    v28[1] = 3221225472LL;
    v28[2] = __95__SUCoreSpace_offloadAppsPurge_fromBasePath_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke;
    v28[3] = &unk_18A0F1C58;
    unint64_t v32 = a3;
    id v31 = v12;
    id v29 = v11;
    id v30 = v14;
    [v24 startWithCompletionBlock:v28];

    uint64_t v25 = v31;
  }

  else
  {
    [MEMORY[0x189612778] sharedDiag];
    id v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v26 trackAnomaly:@"ASDPurgeAppsRequest" forReason:@"Failed to create ASDPurgeAppsRequest instance" withResult:8100 withError:0];

    [MEMORY[0x189612760] sharedCore];
    id v27 = (void *)objc_claimAutoreleasedReturnValue();
    [v27 buildError:8607 underlying:0 description:@"Failed to create ASDPurgeAppsRequest instance"];
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();

    +[SUCoreSpace _trackSpaceEnd:withResult:withError:]( &OBJC_CLASS___SUCoreSpace,  "_trackSpaceEnd:withResult:withError:",  @"ASDPurgeAppsRequest",  8607LL,  v25);
    +[SUCoreSpace _issueAppOffloadPurgeCompetion:withCompletionQueue:result:spacePurged:error:releasingTransaction:]( &OBJC_CLASS___SUCoreSpace,  "_issueAppOffloadPurgeCompetion:withCompletionQueue:result:spacePurged:error:releasingTransaction:",  v12,  v11,  0LL,  0LL,  v25,  v14);
  }
}

void __95__SUCoreSpace_offloadAppsPurge_fromBasePath_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke( void *a1,  int a2,  void *a3,  void *a4)
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a4;
  [MEMORY[0x1896127A0] sharedLogger];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 oslog];
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (!v7)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      id v46 = @"ASDPurgeAppsRequest returned null response";
      _os_log_impl(&dword_187A54000, v10, OS_LOG_TYPE_DEFAULT, "[SPACE] App Offload callback: %@", buf, 0xCu);
    }

    unint64_t v29 = 0LL;
    id v30 = @"ASDPurgeAppsRequest returned null response";
    uint64_t v31 = 8607LL;
    goto LABEL_27;
  }

  if (v11)
  {
    *(_DWORD *)buf = 134217984;
    id v46 = (const __CFString *)[v7 purgedSize];
    _os_log_impl( &dword_187A54000,  v10,  OS_LOG_TYPE_DEFAULT,  "[SPACE] App Offload callback: purged size %lld bytes",  buf,  0xCu);
  }

  int v37 = a2;
  statfs v38 = a1;
  id v39 = v8;

  [MEMORY[0x1896127A0] sharedLogger];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 oslog];
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    [v7 purgedApps];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    int v15 = [v14 count];
    *(_DWORD *)buf = 67109120;
    LODWORD(v46) = v15;
    _os_log_impl( &dword_187A54000,  v13,  OS_LOG_TYPE_DEFAULT,  "[SPACE] App Offload callback: number of purgedApps: %d",  buf,  8u);
  }

  __int128 v43 = 0u;
  __int128 v44 = 0u;
  __int128 v41 = 0u;
  __int128 v42 = 0u;
  __int16 v40 = v7;
  [v7 purgedApps];
  char v16 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v16 countByEnumeratingWithState:&v41 objects:v53 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v42;
    do
    {
      for (uint64_t i = 0LL; i != v18; ++i)
      {
        if (*(void *)v42 != v19) {
          objc_enumerationMutation(v16);
        }
        int v21 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        [v21 bundleID];
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          [MEMORY[0x1896127A0] sharedLogger];
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
          [v23 oslog];
          unint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            [v21 bundleID];
            uint64_t v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
            [v21 purgeableReason];
            id v26 = (void *)objc_claimAutoreleasedReturnValue();
            int v27 = [v21 purgeableType];
            uint64_t v28 = [v21 staticDiskUsage];
            *(_DWORD *)buf = 138413058;
            id v46 = v25;
            __int16 v47 = 2112;
            v48 = v26;
            __int16 v49 = 1024;
            int v50 = v27;
            __int16 v51 = 2048;
            uint64_t v52 = v28;
            _os_log_impl( &dword_187A54000,  v24,  OS_LOG_TYPE_DEFAULT,  "[SPACE] App Offload purged app bundleID: '%@'; reason: '%@'; purgeableType: '%d'; diskUsage: '%lld'",
              buf,
              0x26u);
          }
        }
      }

      uint64_t v18 = [v16 countByEnumeratingWithState:&v41 objects:v53 count:16];
    }

    while (v18);
  }

  id v7 = v40;
  unint64_t v29 = [v40 purgedSize];
  a1 = v38;
  if (v29 < v38[7])
  {
    id v30 = (__CFString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"purged %lld but needed to purge %lld (not enough space)",  v29,  v38[7]);
    uint64_t v31 = 8600LL;
    id v8 = v39;
LABEL_27:
    [MEMORY[0x189612760] sharedCore];
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    [v33 buildError:v31 underlying:v8 description:v30];
    uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v36 = 0LL;
    goto LABEL_28;
  }

  id v8 = v39;
  if (!v37)
  {
    id v30 = @"ASDPurgeAppsRequest returned result=NO";
    uint64_t v31 = 8608LL;
    goto LABEL_27;
  }

  [MEMORY[0x1896127A0] sharedLogger];
  unint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
  [v32 oslog];
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v34 = (void *)v38[7];
    *(_DWORD *)buf = 134218240;
    id v46 = (const __CFString *)v29;
    __int16 v47 = 2048;
    v48 = v34;
    _os_log_impl( &dword_187A54000,  (os_log_t)v33,  OS_LOG_TYPE_DEFAULT,  "[SPACE] purged %lld when needed to purge %lld (have enough space)",  buf,  0x16u);
  }

  uint64_t v31 = 0LL;
  id v30 = 0LL;
  uint64_t v35 = 0LL;
  uint64_t v36 = 1LL;
LABEL_28:

  +[SUCoreSpace _trackSpaceEnd:withResult:withError:]( &OBJC_CLASS___SUCoreSpace,  "_trackSpaceEnd:withResult:withError:",  @"ASDPurgeAppsRequest",  v31,  v35);
  +[SUCoreSpace _issueAppOffloadPurgeCompetion:withCompletionQueue:result:spacePurged:error:releasingTransaction:]( &OBJC_CLASS___SUCoreSpace,  "_issueAppOffloadPurgeCompetion:withCompletionQueue:result:spacePurged:error:releasingTransaction:",  a1[6],  a1[4],  v36,  v29,  v35,  a1[5]);
}

+ (void)offloadAppsPurge:(unint64_t)a3 cacheDeleteUrgency:(int64_t)a4 withCompletionQueue:(id)a5 completion:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  if (+[SUCoreSpace _isUserVolume:](&OBJC_CLASS___SUCoreSpace, "_isUserVolume:", @"/var/mobile/"))
  {
    [MEMORY[0x189612760] beginTransactionWithName:@"space.AppOffloadPurge"];
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUCoreSpace sharedSpaceManager](&OBJC_CLASS___SUCoreSpace, "sharedSpaceManager");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 spaceQueue];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __82__SUCoreSpace_offloadAppsPurge_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke;
    v15[3] = &unk_18A0F1C08;
    id v18 = v10;
    id v16 = v9;
    id v17 = v11;
    id v14 = v11;
    +[SUCoreSpace offloadAppsPurge:fromBasePath:cacheDeleteUrgency:withCompletionQueue:completion:]( &OBJC_CLASS___SUCoreSpace,  "offloadAppsPurge:fromBasePath:cacheDeleteUrgency:withCompletionQueue:completion:",  a3,  @"/var/mobile/",  a4,  v13,  v15);
  }

  else
  {
    +[SUCoreSpace offloadAppsPurge:fromBasePath:cacheDeleteUrgency:withCompletionQueue:completion:]( &OBJC_CLASS___SUCoreSpace,  "offloadAppsPurge:fromBasePath:cacheDeleteUrgency:withCompletionQueue:completion:",  a3,  @"/var/mobile/",  a4,  v9,  v10);
  }
}

void __82__SUCoreSpace_offloadAppsPurge_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke( uint64_t a1,  char a2,  uint64_t a3,  void *a4)
{
  id v7 = a4;
  if (*(void *)(a1 + 48))
  {
    [MEMORY[0x189612760] sharedCore];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 selectCompletionQueue:*(void *)(a1 + 32)];
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __82__SUCoreSpace_offloadAppsPurge_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke_2;
    block[3] = &unk_18A0F1BE0;
    id v10 = *(id *)(a1 + 48);
    char v16 = a2;
    id v14 = v10;
    uint64_t v15 = a3;
    id v12 = v7;
    id v13 = *(id *)(a1 + 40);
    dispatch_async(v9, block);
  }

  else
  {
    [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"space.AppOffloadPurge"];
  }
}

uint64_t __82__SUCoreSpace_offloadAppsPurge_cacheDeleteUrgency_withCompletionQueue_completion___block_invoke_2( uint64_t a1)
{
  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"space.AppOffloadPurge"];
}

+ (void)_issueAppOffloadPurgeCompetion:(id)a3 withCompletionQueue:(id)a4 result:(BOOL)a5 spacePurged:(int64_t)a6 error:(id)a7 releasingTransaction:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  if (v13)
  {
    [MEMORY[0x189612760] sharedCore];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 selectCompletionQueue:v14];
    id v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __112__SUCoreSpace__issueAppOffloadPurgeCompetion_withCompletionQueue_result_spacePurged_error_releasingTransaction___block_invoke;
    block[3] = &unk_18A0F1BE0;
    BOOL v24 = a5;
    id v22 = v13;
    int64_t v23 = a6;
    id v20 = v15;
    id v21 = v16;
    dispatch_async(v18, block);
  }

  else
  {
    [MEMORY[0x189612760] endTransaction:v16 withName:@"space.AppOffloadPurge"];
  }
}

uint64_t __112__SUCoreSpace__issueAppOffloadPurgeCompetion_withCompletionQueue_result_spacePurged_error_releasingTransaction___block_invoke( uint64_t a1)
{
  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"space.AppOffloadPurge"];
}

+ (void)_issueSpacePurgeableCompetion:(id)a3 withCompletionQueue:(id)a4 result:(BOOL)a5 spacePurgeable:(int64_t)a6 error:(id)a7 releasingTransaction:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  id v16 = a8;
  if (v13)
  {
    [MEMORY[0x189612760] sharedCore];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 selectCompletionQueue:v14];
    id v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __114__SUCoreSpace__issueSpacePurgeableCompetion_withCompletionQueue_result_spacePurgeable_error_releasingTransaction___block_invoke;
    block[3] = &unk_18A0F1BE0;
    BOOL v24 = a5;
    id v22 = v13;
    int64_t v23 = a6;
    id v20 = v15;
    id v21 = v16;
    dispatch_async(v18, block);
  }

  else
  {
    [MEMORY[0x189612760] endTransaction:v16 withName:@"space.AppOffloadPurgeable"];
  }
}

uint64_t __114__SUCoreSpace__issueSpacePurgeableCompetion_withCompletionQueue_result_spacePurgeable_error_releasingTransaction___block_invoke( uint64_t a1)
{
  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"space.AppOffloadPurgeable"];
}

+ (void)_checkMinimumRequiredSpace:(unint64_t)a3 purgingFromBase:(id)a4 userInitiated:(BOOL)a5 totalRequiredFreeSpace:(unint64_t)a6 freeSpaceAvailable:(unint64_t)a7 checkAvailableSpaceTransaction:(id)a8 withCompletionQueue:(id)a9 completion:(id)a10
{
  BOOL v13 = a5;
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v15 = a4;
  id v16 = a8;
  id v17 = a9;
  id v18 = a10;
  if (a3)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 oslog];
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v32 = a3;
      _os_log_impl( &dword_187A54000,  v20,  OS_LOG_TYPE_DEFAULT,  "[SPACE] checking minimal disk space available: need %llu",  buf,  0xCu);
    }

    +[SUCoreSpace _trackSpaceBegin:withIdentifier:]( &OBJC_CLASS___SUCoreSpace,  "_trackSpaceBegin:withIdentifier:",  @"checkAvailableSpace",  @"minimal");
    v26[0] = MEMORY[0x1895F87A8];
    v26[1] = 3221225472LL;
    v26[2] = __176__SUCoreSpace__checkMinimumRequiredSpace_purgingFromBase_userInitiated_totalRequiredFreeSpace_freeSpaceAvailable_checkAvailableSpaceTransaction_withCompletionQueue_completion___block_invoke;
    v26[3] = &unk_18A0F1CA8;
    id v29 = v18;
    id v27 = v17;
    id v28 = v16;
    unint64_t v30 = a3;
    +[SUCoreSpace checkAvailableFreeSpace:checkingFromBase:withIdentifier:userInitiated:completion:]( &OBJC_CLASS___SUCoreSpace,  "checkAvailableFreeSpace:checkingFromBase:withIdentifier:userInitiated:completion:",  a3,  v15,  @"minimal",  v13,  v26);

    id v21 = v29;
  }

  else
  {
    id v21 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"not enough total space (no minimal): need %llu and %llu is available",  a6,  a7);
    [MEMORY[0x189612760] sharedCore];
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 buildError:8600 underlying:0 description:v21];
    int64_t v23 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x1896127A0] sharedLogger];
    BOOL v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 oslog];
    uint64_t v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      unint64_t v32 = (unint64_t)v21;
      _os_log_impl(&dword_187A54000, v25, OS_LOG_TYPE_DEFAULT, "[SPACE] %{public}@", buf, 0xCu);
    }

    +[SUCoreSpace _issueSpaceCheckCompletion:withCompletionQueue:haveEnoughSpace:haveTotalRequired:freeSpaceAvailable:error:releasingTransaction:]( &OBJC_CLASS___SUCoreSpace,  "_issueSpaceCheckCompletion:withCompletionQueue:haveEnoughSpace:haveTotalRequired:freeSpaceAvailable:error:releasingTransaction:",  v18,  v17,  0LL,  0LL,  a7,  v23,  v16);
  }
}

void __176__SUCoreSpace__checkMinimumRequiredSpace_purgingFromBase_userInitiated_totalRequiredFreeSpace_freeSpaceAvailable_checkAvailableSpaceTransaction_withCompletionQueue_completion___block_invoke( uint64_t a1,  char a2,  uint64_t a3,  void *a4)
{
  id v7 = a4;
  +[SUCoreSpace sharedSpaceManager](&OBJC_CLASS___SUCoreSpace, "sharedSpaceManager");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 spaceQueue];
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __176__SUCoreSpace__checkMinimumRequiredSpace_purgingFromBase_userInitiated_totalRequiredFreeSpace_freeSpaceAvailable_checkAvailableSpaceTransaction_withCompletionQueue_completion___block_invoke_2;
  block[3] = &unk_18A0F1C80;
  id v14 = v7;
  id v17 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  char v20 = a2;
  uint64_t v11 = *(void *)(a1 + 56);
  id v16 = v10;
  uint64_t v18 = v11;
  uint64_t v19 = a3;
  id v12 = v7;
  dispatch_async(v9, block);
}

void __176__SUCoreSpace__checkMinimumRequiredSpace_purgingFromBase_userInitiated_totalRequiredFreeSpace_freeSpaceAvailable_checkAvailableSpaceTransaction_withCompletionQueue_completion___block_invoke_2( uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    +[SUCoreSpace _trackSpaceEnd:withIdentifier:withResult:withError:]( SUCoreSpace,  "_trackSpaceEnd:withIdentifier:withResult:withError:",  @"checkAvailableSpace",  @"minimal",  [v2 code],  *(void *)(a1 + 32));
    +[SUCoreSpace _issueSpaceCheckCompletion:withCompletionQueue:haveEnoughSpace:haveTotalRequired:freeSpaceAvailable:error:releasingTransaction:]( &OBJC_CLASS___SUCoreSpace,  "_issueSpaceCheckCompletion:withCompletionQueue:haveEnoughSpace:haveTotalRequired:freeSpaceAvailable:error:releasingTransaction:",  *(void *)(a1 + 56),  *(void *)(a1 + 40),  0LL,  0LL,  0LL,  *(void *)(a1 + 32),  *(void *)(a1 + 48));
  }

  else if (*(_BYTE *)(a1 + 80))
  {
    +[SUCoreSpace _trackSpaceEnd:withIdentifier:withResult:withError:]( &OBJC_CLASS___SUCoreSpace,  "_trackSpaceEnd:withIdentifier:withResult:withError:",  @"checkAvailableSpace",  @"minimal",  0LL,  0LL);
    [MEMORY[0x1896127A0] sharedLogger];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 oslog];
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(void **)(a1 + 64);
      uint64_t v6 = *(void *)(a1 + 72);
      *(_DWORD *)buf = 134218240;
      BOOL v13 = v5;
      __int16 v14 = 2048;
      uint64_t v15 = v6;
      _os_log_impl( &dword_187A54000,  v4,  OS_LOG_TYPE_DEFAULT,  "[SPACE] minimal disk space available: need %llu and %llu is available (have enough space)",  buf,  0x16u);
    }

    +[SUCoreSpace _issueSpaceCheckCompletion:withCompletionQueue:haveEnoughSpace:haveTotalRequired:freeSpaceAvailable:error:releasingTransaction:]( &OBJC_CLASS___SUCoreSpace,  "_issueSpaceCheckCompletion:withCompletionQueue:haveEnoughSpace:haveTotalRequired:freeSpaceAvailable:error:releasingTransaction:",  *(void *)(a1 + 56),  *(void *)(a1 + 40),  1LL,  0LL,  *(void *)(a1 + 72),  0LL,  *(void *)(a1 + 48));
  }

  else
  {
    id v7 = (void *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"not enough minimal space to install update: need %llu and %llu is available",  *(void *)(a1 + 64),  *(void *)(a1 + 72));
    [MEMORY[0x1896127A0] sharedLogger];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      BOOL v13 = v7;
      _os_log_impl(&dword_187A54000, v9, OS_LOG_TYPE_DEFAULT, "[SPACE] %{public}@", buf, 0xCu);
    }

    [MEMORY[0x189612760] sharedCore];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 buildError:8600 underlying:0 description:v7];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

    +[SUCoreSpace _trackSpaceEnd:withIdentifier:withResult:withError:]( SUCoreSpace,  "_trackSpaceEnd:withIdentifier:withResult:withError:",  @"checkAvailableSpace",  @"minimal",  [v11 code],  v11);
    +[SUCoreSpace _issueSpaceCheckCompletion:withCompletionQueue:haveEnoughSpace:haveTotalRequired:freeSpaceAvailable:error:releasingTransaction:]( &OBJC_CLASS___SUCoreSpace,  "_issueSpaceCheckCompletion:withCompletionQueue:haveEnoughSpace:haveTotalRequired:freeSpaceAvailable:error:releasingTransaction:",  *(void *)(a1 + 56),  *(void *)(a1 + 40),  0LL,  0LL,  *(void *)(a1 + 72),  v11,  *(void *)(a1 + 48));
  }

+ (void)_spaceCheckPhaseError:(id)a3 checkingFromBase:(id)a4 withIdentier:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  uint64_t v11 = (void *)MEMORY[0x189612778];
  id v12 = a5;
  id v13 = a4;
  [v11 sharedDiag];
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = (void *)[objc_alloc(NSString) initWithFormat:@"space check from base(%@) phase(%@) failed", v13, v12];

  objc_msgSend(v14, "trackError:forReason:withResult:withError:", @"[SPACE]", v15, objc_msgSend(v9, "code"), v9);
  [MEMORY[0x189612760] sharedCore];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 completionQueue];
  id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __78__SUCoreSpace__spaceCheckPhaseError_checkingFromBase_withIdentier_completion___block_invoke;
  block[3] = &unk_18A0EFB00;
  id v21 = v9;
  id v22 = v10;
  id v18 = v9;
  id v19 = v10;
  dispatch_async(v17, block);
}

uint64_t __78__SUCoreSpace__spaceCheckPhaseError_checkingFromBase_withIdentier_completion___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  0LL,  *(void *)(a1 + 32));
}

+ (void)_issueSpaceCheckCompletion:(id)a3 withCompletionQueue:(id)a4 haveEnoughSpace:(BOOL)a5 haveTotalRequired:(BOOL)a6 freeSpaceAvailable:(unint64_t)a7 error:(id)a8 releasingTransaction:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  id v17 = a9;
  id v18 = v17;
  if (v14)
  {
    [MEMORY[0x189612760] sharedCore];
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 selectCompletionQueue:v15];
    char v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __142__SUCoreSpace__issueSpaceCheckCompletion_withCompletionQueue_haveEnoughSpace_haveTotalRequired_freeSpaceAvailable_error_releasingTransaction___block_invoke;
    block[3] = &unk_18A0F1CD0;
    BOOL v26 = a5;
    BOOL v27 = a6;
    id v24 = v14;
    unint64_t v25 = a7;
    id v22 = v16;
    id v23 = v18;
    dispatch_async(v20, block);
  }

  else if (v17)
  {
    [MEMORY[0x189612760] endTransaction:v17 withName:@"space.CheckAvailableSpace"];
  }
}

uint64_t __142__SUCoreSpace__issueSpaceCheckCompletion_withCompletionQueue_haveEnoughSpace_haveTotalRequired_freeSpaceAvailable_error_releasingTransaction___block_invoke( uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    return [MEMORY[0x189612760] endTransaction:v3 withName:@"space.CheckAvailableSpace"];
  }
  return result;
}

+ (BOOL)_isUserVolume:(id)a3
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  bzero(v8, 0x40CuLL);
  v7[2] = 0LL;
  v7[0] = 5LL;
  v7[1] = 2147491840LL;
  BOOL result = 0;
  if (getattrlist( (const char *)objc_msgSend(a3, "fileSystemRepresentation", 5, 2147491840, 0), v7, v8, 0x40CuLL, 0) != -1)
  {
    [NSString stringWithCString:(char *)v9 + v9[0] encoding:4];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    char v5 = [v4 isEqualToString:@"User"];

    if ((v5 & 1) != 0) {
      return 1;
    }
  }

  return result;
}

+ (void)_trackSpaceBegin:(id)a3
{
}

+ (void)_trackSpaceBegin:(id)a3 withIdentifier:(id)a4
{
  char v5 = (void *)MEMORY[0x189612778];
  id v6 = a4;
  id v7 = a3;
  [v5 sharedDiag];
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v8 trackBegin:v7 atLevel:1 forModule:@"space" withIdentifier:v6];
}

+ (void)_trackSpaceEnd:(id)a3 withResult:(int64_t)a4 withError:(id)a5
{
}

+ (void)_trackSpaceEnd:(id)a3 withIdentifier:(id)a4 withResult:(int64_t)a5 withError:(id)a6
{
  id v9 = (void *)MEMORY[0x189612778];
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  [v9 sharedDiag];
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  [v13 trackEnd:v12 atLevel:1 forModule:@"space" withIdentifier:v11 withResult:a5 withError:v10];
}

- (OS_dispatch_queue)spaceQueue
{
  return self->_spaceQueue;
}

- (void).cxx_destruct
{
}

@end