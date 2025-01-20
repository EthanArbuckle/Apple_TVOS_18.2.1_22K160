@interface MAAutoAssetControl
+ (id)activeJobSummary:(BOOL)a3 error:(id *)a4;
+ (id)activeJobSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 error:(id *)a5;
+ (id)assetSelectorOrAllSelector:(id)a3;
+ (id)autoAssetControl;
+ (id)availableForStagingAssetSummary:(id *)a3;
+ (id)controlStatistics:(BOOL)a3 error:(id *)a4;
+ (id)defaultDispatchQueue;
+ (id)forceGlobalAbandon:(id)a3;
+ (id)forceGlobalForget:(id)a3;
+ (id)forceGlobalPurge:(id)a3 forcingUnlock:(BOOL)a4;
+ (id)forceGlobalUnlock:(id)a3;
+ (id)frameworkDispatchQueue;
+ (id)frameworkInstanceUUID;
+ (id)knownAssetSummary:(BOOL)a3 error:(id *)a4;
+ (id)knownAssetSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 error:(id *)a5;
+ (id)lockedAssetSummary:(BOOL)a3 error:(id *)a4;
+ (id)lockedAssetSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 error:(id *)a5;
+ (id)pushNotificationHistory:(BOOL)a3 error:(id *)a4;
+ (id)scheduledJobSummary:(BOOL)a3 error:(id *)a4;
+ (id)scheduledJobSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 error:(id *)a5;
+ (id)simulateSetJobOperation:(int64_t)a3 withEndEvent:(int64_t)a4 forSelector:(id)a5;
+ (id)stagedAssetSummary:(BOOL)a3 error:(id *)a4;
+ (id)stagedAssetSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 error:(id *)a5;
+ (int64_t)simulateCacheDeleteDetermineReclaimableSpace:(id)a3 withUrgency:(int)a4 error:(id *)a5;
+ (int64_t)simulateCacheDeleteReclaimSpace:(id)a3 withUrgency:(int)a4 targetingPurgeAmount:(int64_t)a5 error:(id *)a6;
+ (int64_t)waitOnSemaphore:(id)a3 withTimeout:(int64_t)a4;
+ (void)frameworkInstanceSetLogDomain;
- (MAAutoAssetControl)init;
- (NSString)controlClientName;
- (NSString)controlClientProcessName;
- (OS_dispatch_queue)completionDispatchQueue;
- (SUCoreConnectClient)connectionClient;
- (int64_t)controlClientProcessID;
- (void)_activeJobSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 completion:(id)a5;
- (void)_availableForStagingAssetSummary:(id)a3;
- (void)_controlStatistics:(BOOL)a3 completion:(id)a4;
- (void)_failedControl:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7;
- (void)_failedControlLockSummary:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7;
- (void)_failedControlStatistics:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7;
- (void)_failedControlSummary:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7;
- (void)_failedSimulateCacheDeleteOperation:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7;
- (void)_forceGlobalAbandon:(id)a3 completion:(id)a4;
- (void)_forceGlobalForget:(id)a3 completion:(id)a4;
- (void)_forceGlobalPurge:(id)a3 forcingUnlock:(BOOL)a4 completion:(id)a5;
- (void)_forceGlobalUnlock:(id)a3 completion:(id)a4;
- (void)_knownAssetSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 completion:(id)a5;
- (void)_lockedAssetSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 completion:(id)a5;
- (void)_scheduledJobSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 completion:(id)a5;
- (void)_simulateCacheDeleteDetermineReclaimableSpace:(id)a3 withUrgency:(int)a4 error:(id *)a5 completion:(id)a6;
- (void)_simulateCacheDeleteReclaimSpace:(id)a3 withUrgency:(int)a4 targetingPurgeAmount:(int64_t)a5 error:(id *)a6 completion:(id)a7;
- (void)_simulateSetJobOperation:(int64_t)a3 withEndEvent:(int64_t)a4 forSelector:(id)a5 completion:(id)a6;
- (void)_stagedAssetSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 completion:(id)a5;
- (void)_successControl:(id)a3 completion:(id)a4;
- (void)_successControlLockSummary:(id)a3 withLockSummaryEntries:(id)a4 completion:(id)a5;
- (void)_successControlStatistics:(id)a3 withControlStatistics:(id)a4 completion:(id)a5;
- (void)_successControlSummary:(id)a3 withJobSummaryEntries:(id)a4 completion:(id)a5;
- (void)_successSimulateCacheDeleteOperation:(id)a3 withReclaimableSpace:(int64_t)a4 completion:(id)a5;
- (void)connectToServerFrameworkCompletion:(id)a3;
- (void)setConnectionClient:(id)a3;
@end

@implementation MAAutoAssetControl

- (MAAutoAssetControl)init
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___MAAutoAssetControl;
  v2 = -[MAAutoAssetControl init](&v9, sel_init);
  if (v2)
  {
    +[MAAutoAssetControl frameworkInstanceSetLogDomain]( &OBJC_CLASS___MAAutoAssetControl,  "frameworkInstanceSetLogDomain");
    controlClientName = v2->_controlClientName;
    v2->_controlClientName = (NSString *)@"auto-control-client";

    uint64_t v4 = objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"%s", getprogname());
    controlClientProcessName = v2->_controlClientProcessName;
    v2->_controlClientProcessName = (NSString *)v4;

    v2->_controlClientProcessID = getpid();
    uint64_t v6 = +[MAAutoAssetControl defaultDispatchQueue](&OBJC_CLASS___MAAutoAssetControl, "defaultDispatchQueue");
    completionDispatchQueue = v2->_completionDispatchQueue;
    v2->_completionDispatchQueue = (OS_dispatch_queue *)v6;
  }

  return v2;
}

+ (id)controlStatistics:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  +[MAAutoAssetControl autoAssetControl](&OBJC_CLASS___MAAutoAssetControl, "autoAssetControl");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v30 = 0LL;
  v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  v33 = __Block_byref_object_copy__6;
  v34 = __Block_byref_object_dispose__6;
  id v35 = 0LL;
  uint64_t v24 = 0LL;
  v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  v27 = __Block_byref_object_copy__6;
  v28 = __Block_byref_object_dispose__6;
  id v29 = 0LL;
  v22[0] = 0LL;
  v22[1] = v22;
  v22[2] = 0x2020000000LL;
  char v23 = 0;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x2020000000LL;
  char v21 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
  uint64_t v8 = MEMORY[0x1895F87A8];
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __46__MAAutoAssetControl_controlStatistics_error___block_invoke;
  v14[3] = &unk_189FFB1C8;
  v16 = v20;
  v17 = &v30;
  v18 = &v24;
  v19 = v22;
  objc_super v9 = v7;
  v15 = v9;
  [v6 _controlStatistics:v5 completion:v14];
  if (+[MAAutoAssetControl waitOnSemaphore:withTimeout:]( &OBJC_CLASS___MAAutoAssetControl,  "waitOnSemaphore:withTimeout:",  v9,  -2LL))
  {
    +[MAAutoAssetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetControl, "frameworkDispatchQueue");
    v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    v13[1] = 3221225472LL;
    v13[2] = __46__MAAutoAssetControl_controlStatistics_error___block_invoke_3;
    v13[3] = &unk_189FF94B0;
    v13[4] = v22;
    v13[5] = v20;
    v13[6] = &v24;
    dispatch_sync(v10, v13);
  }

  if (a4) {
    *a4 = (id) v25[5];
  }
  id v11 = (id)v31[5];

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v11;
}

void __46__MAAutoAssetControl_controlStatistics_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  +[MAAutoAssetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetControl, "frameworkDispatchQueue");
  dispatch_semaphore_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)v10 = *(_OWORD *)(a1 + 32);
  __int128 v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __46__MAAutoAssetControl_controlStatistics_error___block_invoke_2;
  block[3] = &unk_189FF9460;
  id v12 = v5;
  id v13 = v6;
  uint64_t v16 = *(void *)(a1 + 64);
  id v8 = v10[0];
  __int128 v14 = *(_OWORD *)v10;
  id v9 = v6;
  v10[0] = v5;
  dispatch_sync(v7, block);
}

uint64_t __46__MAAutoAssetControl_controlStatistics_error___block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 56) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 64) + 8LL) + 40LL), *(id *)(result + 32));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 72) + 8LL) + 40LL), *(id *)(v1 + 40));
    *(_BYTE *)(*(void *)(*(void *)(v1 + 80) + 8LL) + 24LL) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 48));
  }

  return result;
}

void __46__MAAutoAssetControl_controlStatistics_error___block_invoke_3(void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto-control(controlStatistics)",  0LL,  @"timeout (at framework layer) while waiting for control-statistics to complete");
    uint64_t v3 = *(void *)(a1[6] + 8LL);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }

- (void)_controlStatistics:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  dispatch_semaphore_t v7 = v6;
  if (v6)
  {
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    id v10[2] = __52__MAAutoAssetControl__controlStatistics_completion___block_invoke;
    v10[3] = &unk_189FFB1F0;
    BOOL v12 = a3;
    v10[4] = self;
    id v11 = v6;
    -[MAAutoAssetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v10);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _controlStatistics:completion:].cold.1();
    }
  }
}

void __52__MAAutoAssetControl__controlStatistics_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _failedControlStatistics:@"controlStatistics" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 40)];
  }

  else
  {
    id v3 = -[MAAutoAssetInfoControl initClearingAfter:]( objc_alloc(&OBJC_CLASS___MAAutoAssetInfoControl),  "initClearingAfter:",  *(unsigned __int8 *)(a1 + 48));
    id v4 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAssetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetControl, "frameworkInstanceUUID");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 UUIDString];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[MAAutoAssetControl assetSelectorOrAllSelector:]( &OBJC_CLASS___MAAutoAssetControl,  "assetSelectorOrAllSelector:",  0LL);
    dispatch_semaphore_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    [*(id *)(a1 + 32) controlClientName];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) controlClientProcessName];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [*(id *)(a1 + 32) controlClientProcessID];
    +[MAAutoAssetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetControl, "frameworkInstanceUUID");
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v8,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  v9,  v10,  v11,  v7,  v12);

    [v4 setSafeObject:v13 forKey:@"instance"];
    [v4 setSafeObject:v3 forKey:@"control"];
    __int128 v14 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-CONTROL:CONTROL_STATISTICS" clientID:v6 version:0 message:v4];
    [*(id *)(a1 + 32) connectionClient];
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __52__MAAutoAssetControl__controlStatistics_completion___block_invoke_2;
    v17[3] = &unk_189FF94D8;
    uint64_t v16 = *(void **)(a1 + 40);
    v17[4] = *(void *)(a1 + 32);
    id v18 = v16;
    [v15 connectClientSendServerMessage:v14 proxyObject:0 withReply:v17];
  }

void __52__MAAutoAssetControl__controlStatistics_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (!v12 || v5)
  {
    if (v5)
    {
      id v9 = @"failure reported by server";
      uint64_t v10 = 0LL;
      id v11 = v5;
    }

    else
    {
      id v9 = @"no response message from server";
      uint64_t v10 = 6104LL;
      id v11 = 0LL;
    }

    [*(id *)(a1 + 32) _failedControlStatistics:@"controlStatistics" withErrorCode:v10 withResponseError:v11 description:v9 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v12 message];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 safeObjectForKey:@"controlStatistics" ofClass:objc_opt_class()];
    dispatch_semaphore_t v7 = (void *)objc_claimAutoreleasedReturnValue();

    id v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 _successControlStatistics:@"controlStatistics" withControlStatistics:v7 completion:*(void *)(a1 + 40)];
    }
    else {
      [v8 _failedControlStatistics:@"controlStatistics" withErrorCode:6110 withResponseError:0 description:@"no control-statistics provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

+ (id)knownAssetSummary:(BOOL)a3 error:(id *)a4
{
  return +[MAAutoAssetControl knownAssetSummary:limitedToAssetTypes:error:]( &OBJC_CLASS___MAAutoAssetControl,  "knownAssetSummary:limitedToAssetTypes:error:",  a3,  0LL,  a4);
}

+ (id)availableForStagingAssetSummary:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v28 = 0LL;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  v31 = __Block_byref_object_copy__6;
  uint64_t v32 = __Block_byref_object_dispose__6;
  id v33 = 0LL;
  uint64_t v22 = 0LL;
  char v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  v25 = __Block_byref_object_copy__6;
  uint64_t v26 = __Block_byref_object_dispose__6;
  id v27 = 0LL;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x2020000000LL;
  char v21 = 0;
  v18[0] = 0LL;
  v18[1] = v18;
  v18[2] = 0x2020000000LL;
  char v19 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  uint64_t v6 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __54__MAAutoAssetControl_availableForStagingAssetSummary___block_invoke;
  v12[3] = &unk_189FF9488;
  __int128 v14 = v18;
  __int128 v15 = &v28;
  uint64_t v16 = &v22;
  v17 = v20;
  dispatch_semaphore_t v7 = v5;
  id v13 = v7;
  [v4 _availableForStagingAssetSummary:v12];
  if (+[MAAutoAssetControl waitOnSemaphore:withTimeout:]( &OBJC_CLASS___MAAutoAssetControl,  "waitOnSemaphore:withTimeout:",  v7,  -2LL))
  {
    +[MAAutoAssetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetControl, "frameworkDispatchQueue");
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v11[1] = 3221225472LL;
    v11[2] = __54__MAAutoAssetControl_availableForStagingAssetSummary___block_invoke_3;
    v11[3] = &unk_189FF94B0;
    v11[4] = v20;
    v11[5] = v18;
    v11[6] = &v22;
    dispatch_sync(v8, v11);
  }

  if (a3) {
    *a3 = (id) v23[5];
  }
  id v9 = (id)v29[5];

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v9;
}

void __54__MAAutoAssetControl_availableForStagingAssetSummary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  +[MAAutoAssetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetControl, "frameworkDispatchQueue");
  dispatch_semaphore_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)uint64_t v10 = *(_OWORD *)(a1 + 32);
  __int128 v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __54__MAAutoAssetControl_availableForStagingAssetSummary___block_invoke_2;
  block[3] = &unk_189FF9460;
  id v12 = v5;
  id v13 = v6;
  uint64_t v16 = *(void *)(a1 + 64);
  id v8 = v10[0];
  __int128 v14 = *(_OWORD *)v10;
  id v9 = v6;
  v10[0] = v5;
  dispatch_sync(v7, block);
}

uint64_t __54__MAAutoAssetControl_availableForStagingAssetSummary___block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 56) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 64) + 8LL) + 40LL), *(id *)(result + 32));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 72) + 8LL) + 40LL), *(id *)(v1 + 40));
    *(_BYTE *)(*(void *)(*(void *)(v1 + 80) + 8LL) + 24LL) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 48));
  }

  return result;
}

void __54__MAAutoAssetControl_availableForStagingAssetSummary___block_invoke_3(void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto-control(availableForStagingAssetSummary)",  0LL,  @"timeout (at framework layer) while waiting for known-asset-summary to complete");
    uint64_t v3 = *(void *)(a1[6] + 8LL);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }

+ (id)knownAssetSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  +[MAAutoAssetControl autoAssetControl](&OBJC_CLASS___MAAutoAssetControl, "autoAssetControl");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v32 = 0LL;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  id v35 = __Block_byref_object_copy__6;
  v36 = __Block_byref_object_dispose__6;
  id v37 = 0LL;
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  id v29 = __Block_byref_object_copy__6;
  uint64_t v30 = __Block_byref_object_dispose__6;
  id v31 = 0LL;
  v24[0] = 0LL;
  v24[1] = v24;
  v24[2] = 0x2020000000LL;
  char v25 = 0;
  v22[0] = 0LL;
  v22[1] = v22;
  v22[2] = 0x2020000000LL;
  char v23 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
  uint64_t v10 = MEMORY[0x1895F87A8];
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __66__MAAutoAssetControl_knownAssetSummary_limitedToAssetTypes_error___block_invoke;
  v16[3] = &unk_189FF9488;
  id v18 = v22;
  char v19 = &v32;
  v20 = &v26;
  char v21 = v24;
  id v11 = v9;
  v17 = v11;
  [v8 _knownAssetSummary:v6 limitedToAssetTypes:v7 completion:v16];
  if (+[MAAutoAssetControl waitOnSemaphore:withTimeout:]( &OBJC_CLASS___MAAutoAssetControl,  "waitOnSemaphore:withTimeout:",  v11,  -2LL))
  {
    +[MAAutoAssetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetControl, "frameworkDispatchQueue");
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v10;
    block[1] = 3221225472LL;
    block[2] = __66__MAAutoAssetControl_knownAssetSummary_limitedToAssetTypes_error___block_invoke_3;
    block[3] = &unk_189FF94B0;
    void block[4] = v24;
    block[5] = v22;
    block[6] = &v26;
    dispatch_sync(v12, block);
  }

  if (a5) {
    *a5 = (id) v27[5];
  }
  id v13 = (id)v33[5];

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v13;
}

void __66__MAAutoAssetControl_knownAssetSummary_limitedToAssetTypes_error___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  +[MAAutoAssetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetControl, "frameworkDispatchQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)uint64_t v10 = *(_OWORD *)(a1 + 32);
  __int128 v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __66__MAAutoAssetControl_knownAssetSummary_limitedToAssetTypes_error___block_invoke_2;
  block[3] = &unk_189FF9460;
  id v12 = v5;
  id v13 = v6;
  uint64_t v16 = *(void *)(a1 + 64);
  id v8 = v10[0];
  __int128 v14 = *(_OWORD *)v10;
  id v9 = v6;
  v10[0] = v5;
  dispatch_sync(v7, block);
}

uint64_t __66__MAAutoAssetControl_knownAssetSummary_limitedToAssetTypes_error___block_invoke_2( uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 56) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 64) + 8LL) + 40LL), *(id *)(result + 32));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 72) + 8LL) + 40LL), *(id *)(v1 + 40));
    *(_BYTE *)(*(void *)(*(void *)(v1 + 80) + 8LL) + 24LL) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 48));
  }

  return result;
}

void __66__MAAutoAssetControl_knownAssetSummary_limitedToAssetTypes_error___block_invoke_3(void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto-control(knownAssetSummary)",  0LL,  @"timeout (at framework layer) while waiting for known-asset-summary to complete");
    uint64_t v3 = *(void *)(a1[6] + 8LL);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }

- (void)_availableForStagingAssetSummary:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __55__MAAutoAssetControl__availableForStagingAssetSummary___block_invoke;
    v8[3] = &unk_189FFAC50;
    v8[4] = self;
    id v9 = v4;
    -[MAAutoAssetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v8);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 oslog];
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _availableForStagingAssetSummary:].cold.1();
    }
  }
}

void __55__MAAutoAssetControl__availableForStagingAssetSummary___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _failedControlSummary:@"availableForStagingAssetSummary" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 40)];
  }

  else
  {
    id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAssetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetControl, "frameworkInstanceUUID");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 UUIDString];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[MAAutoAssetControl assetSelectorOrAllSelector:]( &OBJC_CLASS___MAAutoAssetControl,  "assetSelectorOrAllSelector:",  0LL);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v7 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    [*(id *)(a1 + 32) controlClientName];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) controlClientProcessName];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [*(id *)(a1 + 32) controlClientProcessID];
    +[MAAutoAssetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetControl, "frameworkInstanceUUID");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v7,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  v8,  v9,  v10,  v6,  v11);

    [v3 setSafeObject:v12 forKey:@"instance"];
    id v13 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-CONTROL:AVAILABLE_FOR_STAGING_ASSET_SUMMARY" clientID:v5 version:0 message:v3];
    [*(id *)(a1 + 32) connectionClient];
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __55__MAAutoAssetControl__availableForStagingAssetSummary___block_invoke_2;
    v16[3] = &unk_189FF94D8;
    __int128 v15 = *(void **)(a1 + 40);
    void v16[4] = *(void *)(a1 + 32);
    id v17 = v15;
    [v14 connectClientSendServerMessage:v13 proxyObject:0 withReply:v16];
  }

void __55__MAAutoAssetControl__availableForStagingAssetSummary___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (!v12 || v5)
  {
    if (v5)
    {
      id v9 = @"failure reported by server";
      uint64_t v10 = 0LL;
      id v11 = v5;
    }

    else
    {
      id v9 = @"no response message from server";
      uint64_t v10 = 6104LL;
      id v11 = 0LL;
    }

    [*(id *)(a1 + 32) _failedControlSummary:@"availableForStagingAssetSummary" withErrorCode:v10 withResponseError:v11 description:v9 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v12 message];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 safeObjectForKey:@"jobSummary" ofClass:objc_opt_class()];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    id v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 _successControlSummary:@"availableForStagingAssetSummary" withJobSummaryEntries:v7 completion:*(void *)(a1 + 40)];
    }
    else {
      [v8 _failedControlSummary:@"availableForStagingAssetSummary" withErrorCode:6110 withResponseError:0 description:@"no auto-stage-status provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

- (void)_knownAssetSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __72__MAAutoAssetControl__knownAssetSummary_limitedToAssetTypes_completion___block_invoke;
    v12[3] = &unk_189FF9500;
    BOOL v16 = a3;
    id v13 = (os_log_s *)v8;
    __int128 v14 = self;
    id v15 = v9;
    -[MAAutoAssetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v12);

    uint64_t v10 = v13;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 oslog];
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _knownAssetSummary:limitedToAssetTypes:completion:].cold.1();
    }
  }
}

void __72__MAAutoAssetControl__knownAssetSummary_limitedToAssetTypes_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 40) _failedControlSummary:@"knownAssetSummary" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 48)];
  }

  else
  {
    id v3 = -[MAAutoAssetInfoControl initClearingAfter:limitedToAssetTypes:]( objc_alloc(&OBJC_CLASS___MAAutoAssetInfoControl),  "initClearingAfter:limitedToAssetTypes:",  *(unsigned __int8 *)(a1 + 56),  *(void *)(a1 + 32));
    id v4 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAssetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetControl, "frameworkInstanceUUID");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 UUIDString];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[MAAutoAssetControl assetSelectorOrAllSelector:]( &OBJC_CLASS___MAAutoAssetControl,  "assetSelectorOrAllSelector:",  0LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    [*(id *)(a1 + 40) controlClientName];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) controlClientProcessName];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [*(id *)(a1 + 40) controlClientProcessID];
    +[MAAutoAssetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetControl, "frameworkInstanceUUID");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v8,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  v9,  v10,  v11,  v7,  v12);

    [v4 setSafeObject:v13 forKey:@"instance"];
    [v4 setSafeObject:v3 forKey:@"control"];
    __int128 v14 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-CONTROL:KNOWN_ASSET_SUMMARY" clientID:v6 version:0 message:v4];
    [*(id *)(a1 + 40) connectionClient];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __72__MAAutoAssetControl__knownAssetSummary_limitedToAssetTypes_completion___block_invoke_2;
    v17[3] = &unk_189FF94D8;
    BOOL v16 = *(void **)(a1 + 48);
    v17[4] = *(void *)(a1 + 40);
    id v18 = v16;
    [v15 connectClientSendServerMessage:v14 proxyObject:0 withReply:v17];
  }

void __72__MAAutoAssetControl__knownAssetSummary_limitedToAssetTypes_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (!v12 || v5)
  {
    if (v5)
    {
      id v9 = @"failure reported by server";
      uint64_t v10 = 0LL;
      id v11 = v5;
    }

    else
    {
      id v9 = @"no response message from server";
      uint64_t v10 = 6104LL;
      id v11 = 0LL;
    }

    [*(id *)(a1 + 32) _failedControlSummary:@"knownAssetSummary" withErrorCode:v10 withResponseError:v11 description:v9 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v12 message];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 safeObjectForKey:@"jobSummary" ofClass:objc_opt_class()];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    id v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 _successControlSummary:@"knownAssetSummary" withJobSummaryEntries:v7 completion:*(void *)(a1 + 40)];
    }
    else {
      [v8 _failedControlSummary:@"knownAssetSummary" withErrorCode:6110 withResponseError:0 description:@"no known-asset-summary provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

+ (id)lockedAssetSummary:(BOOL)a3 error:(id *)a4
{
  return +[MAAutoAssetControl lockedAssetSummary:limitedToAssetTypes:error:]( &OBJC_CLASS___MAAutoAssetControl,  "lockedAssetSummary:limitedToAssetTypes:error:",  a3,  0LL,  a4);
}

+ (id)lockedAssetSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  +[MAAutoAssetControl autoAssetControl](&OBJC_CLASS___MAAutoAssetControl, "autoAssetControl");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v32 = 0LL;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  id v35 = __Block_byref_object_copy__6;
  v36 = __Block_byref_object_dispose__6;
  id v37 = 0LL;
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  id v29 = __Block_byref_object_copy__6;
  uint64_t v30 = __Block_byref_object_dispose__6;
  id v31 = 0LL;
  v24[0] = 0LL;
  v24[1] = v24;
  v24[2] = 0x2020000000LL;
  char v25 = 0;
  v22[0] = 0LL;
  v22[1] = v22;
  v22[2] = 0x2020000000LL;
  char v23 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
  uint64_t v10 = MEMORY[0x1895F87A8];
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __67__MAAutoAssetControl_lockedAssetSummary_limitedToAssetTypes_error___block_invoke;
  v16[3] = &unk_189FF9488;
  id v18 = v22;
  char v19 = &v32;
  v20 = &v26;
  char v21 = v24;
  id v11 = v9;
  id v17 = v11;
  [v8 _lockedAssetSummary:v6 limitedToAssetTypes:v7 completion:v16];
  if (+[MAAutoAssetControl waitOnSemaphore:withTimeout:]( &OBJC_CLASS___MAAutoAssetControl,  "waitOnSemaphore:withTimeout:",  v11,  -2LL))
  {
    +[MAAutoAssetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetControl, "frameworkDispatchQueue");
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v10;
    block[1] = 3221225472LL;
    block[2] = __67__MAAutoAssetControl_lockedAssetSummary_limitedToAssetTypes_error___block_invoke_3;
    block[3] = &unk_189FF94B0;
    void block[4] = v24;
    block[5] = v22;
    block[6] = &v26;
    dispatch_sync(v12, block);
  }

  if (a5) {
    *a5 = (id) v27[5];
  }
  id v13 = (id)v33[5];

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v13;
}

void __67__MAAutoAssetControl_lockedAssetSummary_limitedToAssetTypes_error___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  +[MAAutoAssetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetControl, "frameworkDispatchQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)uint64_t v10 = *(_OWORD *)(a1 + 32);
  __int128 v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __67__MAAutoAssetControl_lockedAssetSummary_limitedToAssetTypes_error___block_invoke_2;
  block[3] = &unk_189FF9460;
  id v12 = v5;
  id v13 = v6;
  uint64_t v16 = *(void *)(a1 + 64);
  id v8 = v10[0];
  __int128 v14 = *(_OWORD *)v10;
  id v9 = v6;
  v10[0] = v5;
  dispatch_sync(v7, block);
}

uint64_t __67__MAAutoAssetControl_lockedAssetSummary_limitedToAssetTypes_error___block_invoke_2( uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 56) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 64) + 8LL) + 40LL), *(id *)(result + 32));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 72) + 8LL) + 40LL), *(id *)(v1 + 40));
    *(_BYTE *)(*(void *)(*(void *)(v1 + 80) + 8LL) + 24LL) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 48));
  }

  return result;
}

void __67__MAAutoAssetControl_lockedAssetSummary_limitedToAssetTypes_error___block_invoke_3(void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto-control(lockedAssetSummary)",  0LL,  @"timeout (at framework layer) while waiting for locked-asset-summary to complete");
    uint64_t v3 = *(void *)(a1[6] + 8LL);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }

- (void)_lockedAssetSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __73__MAAutoAssetControl__lockedAssetSummary_limitedToAssetTypes_completion___block_invoke;
    v12[3] = &unk_189FF9500;
    BOOL v16 = a3;
    id v13 = (os_log_s *)v8;
    __int128 v14 = self;
    id v15 = v9;
    -[MAAutoAssetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v12);

    uint64_t v10 = v13;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 oslog];
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _lockedAssetSummary:limitedToAssetTypes:completion:].cold.1();
    }
  }
}

void __73__MAAutoAssetControl__lockedAssetSummary_limitedToAssetTypes_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 40) _failedControlLockSummary:@"lockedAssetSummary" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 48)];
  }

  else
  {
    id v3 = -[MAAutoAssetInfoControl initClearingAfter:limitedToAssetTypes:]( objc_alloc(&OBJC_CLASS___MAAutoAssetInfoControl),  "initClearingAfter:limitedToAssetTypes:",  *(unsigned __int8 *)(a1 + 56),  *(void *)(a1 + 32));
    id v4 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAssetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetControl, "frameworkInstanceUUID");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 UUIDString];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[MAAutoAssetControl assetSelectorOrAllSelector:]( &OBJC_CLASS___MAAutoAssetControl,  "assetSelectorOrAllSelector:",  0LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    [*(id *)(a1 + 40) controlClientName];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) controlClientProcessName];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [*(id *)(a1 + 40) controlClientProcessID];
    +[MAAutoAssetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetControl, "frameworkInstanceUUID");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v8,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  v9,  v10,  v11,  v7,  v12);

    [v4 setSafeObject:v13 forKey:@"instance"];
    [v4 setSafeObject:v3 forKey:@"control"];
    __int128 v14 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-CONTROL:LOCKED_ASSET_SUMMARY" clientID:v6 version:0 message:v4];
    [*(id *)(a1 + 40) connectionClient];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __73__MAAutoAssetControl__lockedAssetSummary_limitedToAssetTypes_completion___block_invoke_2;
    v17[3] = &unk_189FF94D8;
    BOOL v16 = *(void **)(a1 + 48);
    v17[4] = *(void *)(a1 + 40);
    id v18 = v16;
    [v15 connectClientSendServerMessage:v14 proxyObject:0 withReply:v17];
  }

void __73__MAAutoAssetControl__lockedAssetSummary_limitedToAssetTypes_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (!v12 || v5)
  {
    if (v5)
    {
      id v9 = @"failure reported by server";
      uint64_t v10 = 0LL;
      id v11 = v5;
    }

    else
    {
      id v9 = @"no response message from server";
      uint64_t v10 = 6104LL;
      id v11 = 0LL;
    }

    [*(id *)(a1 + 32) _failedControlLockSummary:@"lockedAssetSummary" withErrorCode:v10 withResponseError:v11 description:v9 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v12 message];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 safeObjectForKey:@"lockSummary" ofClass:objc_opt_class()];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    id v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 _successControlLockSummary:@"lockedAssetSummary" withLockSummaryEntries:v7 completion:*(void *)(a1 + 40)];
    }
    else {
      [v8 _failedControlLockSummary:@"lockedAssetSummary" withErrorCode:6110 withResponseError:0 description:@"no locked-asset-summary provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

+ (id)stagedAssetSummary:(BOOL)a3 error:(id *)a4
{
  return +[MAAutoAssetControl stagedAssetSummary:limitedToAssetTypes:error:]( &OBJC_CLASS___MAAutoAssetControl,  "stagedAssetSummary:limitedToAssetTypes:error:",  a3,  0LL,  a4);
}

+ (id)stagedAssetSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  +[MAAutoAssetControl autoAssetControl](&OBJC_CLASS___MAAutoAssetControl, "autoAssetControl");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v32 = 0LL;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  id v35 = __Block_byref_object_copy__6;
  v36 = __Block_byref_object_dispose__6;
  id v37 = 0LL;
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  id v29 = __Block_byref_object_copy__6;
  uint64_t v30 = __Block_byref_object_dispose__6;
  id v31 = 0LL;
  v24[0] = 0LL;
  v24[1] = v24;
  v24[2] = 0x2020000000LL;
  char v25 = 0;
  v22[0] = 0LL;
  v22[1] = v22;
  v22[2] = 0x2020000000LL;
  char v23 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
  uint64_t v10 = MEMORY[0x1895F87A8];
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __67__MAAutoAssetControl_stagedAssetSummary_limitedToAssetTypes_error___block_invoke;
  v16[3] = &unk_189FF9488;
  id v18 = v22;
  char v19 = &v32;
  v20 = &v26;
  char v21 = v24;
  id v11 = v9;
  id v17 = v11;
  [v8 _stagedAssetSummary:v6 limitedToAssetTypes:v7 completion:v16];
  if (+[MAAutoAssetControl waitOnSemaphore:withTimeout:]( &OBJC_CLASS___MAAutoAssetControl,  "waitOnSemaphore:withTimeout:",  v11,  -2LL))
  {
    +[MAAutoAssetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetControl, "frameworkDispatchQueue");
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v10;
    block[1] = 3221225472LL;
    block[2] = __67__MAAutoAssetControl_stagedAssetSummary_limitedToAssetTypes_error___block_invoke_3;
    block[3] = &unk_189FF94B0;
    void block[4] = v24;
    block[5] = v22;
    block[6] = &v26;
    dispatch_sync(v12, block);
  }

  if (a5) {
    *a5 = (id) v27[5];
  }
  id v13 = (id)v33[5];

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v13;
}

void __67__MAAutoAssetControl_stagedAssetSummary_limitedToAssetTypes_error___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  +[MAAutoAssetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetControl, "frameworkDispatchQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)uint64_t v10 = *(_OWORD *)(a1 + 32);
  __int128 v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __67__MAAutoAssetControl_stagedAssetSummary_limitedToAssetTypes_error___block_invoke_2;
  block[3] = &unk_189FF9460;
  id v12 = v5;
  id v13 = v6;
  uint64_t v16 = *(void *)(a1 + 64);
  id v8 = v10[0];
  __int128 v14 = *(_OWORD *)v10;
  id v9 = v6;
  v10[0] = v5;
  dispatch_sync(v7, block);
}

uint64_t __67__MAAutoAssetControl_stagedAssetSummary_limitedToAssetTypes_error___block_invoke_2( uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 56) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 64) + 8LL) + 40LL), *(id *)(result + 32));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 72) + 8LL) + 40LL), *(id *)(v1 + 40));
    *(_BYTE *)(*(void *)(*(void *)(v1 + 80) + 8LL) + 24LL) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 48));
  }

  return result;
}

void __67__MAAutoAssetControl_stagedAssetSummary_limitedToAssetTypes_error___block_invoke_3(void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto-control(stagedAssetSummary)",  0LL,  @"timeout (at framework layer) while waiting for staged-asset-summary to complete");
    uint64_t v3 = *(void *)(a1[6] + 8LL);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }

- (void)_stagedAssetSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __73__MAAutoAssetControl__stagedAssetSummary_limitedToAssetTypes_completion___block_invoke;
    v12[3] = &unk_189FF9500;
    BOOL v16 = a3;
    id v13 = (os_log_s *)v8;
    __int128 v14 = self;
    id v15 = v9;
    -[MAAutoAssetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v12);

    uint64_t v10 = v13;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 oslog];
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _stagedAssetSummary:limitedToAssetTypes:completion:].cold.1();
    }
  }
}

void __73__MAAutoAssetControl__stagedAssetSummary_limitedToAssetTypes_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 40) _failedControlSummary:@"stagedAssetSummary" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 48)];
  }

  else
  {
    id v3 = -[MAAutoAssetInfoControl initClearingAfter:limitedToAssetTypes:]( objc_alloc(&OBJC_CLASS___MAAutoAssetInfoControl),  "initClearingAfter:limitedToAssetTypes:",  *(unsigned __int8 *)(a1 + 56),  *(void *)(a1 + 32));
    id v4 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAssetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetControl, "frameworkInstanceUUID");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 UUIDString];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[MAAutoAssetControl assetSelectorOrAllSelector:]( &OBJC_CLASS___MAAutoAssetControl,  "assetSelectorOrAllSelector:",  0LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    [*(id *)(a1 + 40) controlClientName];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) controlClientProcessName];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [*(id *)(a1 + 40) controlClientProcessID];
    +[MAAutoAssetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetControl, "frameworkInstanceUUID");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v8,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  v9,  v10,  v11,  v7,  v12);

    [v4 setSafeObject:v13 forKey:@"instance"];
    [v4 setSafeObject:v3 forKey:@"control"];
    __int128 v14 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-CONTROL:STAGED_ASSET_SUMMARY" clientID:v6 version:0 message:v4];
    [*(id *)(a1 + 40) connectionClient];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __73__MAAutoAssetControl__stagedAssetSummary_limitedToAssetTypes_completion___block_invoke_2;
    v17[3] = &unk_189FF94D8;
    BOOL v16 = *(void **)(a1 + 48);
    v17[4] = *(void *)(a1 + 40);
    id v18 = v16;
    [v15 connectClientSendServerMessage:v14 proxyObject:0 withReply:v17];
  }

void __73__MAAutoAssetControl__stagedAssetSummary_limitedToAssetTypes_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (!v12 || v5)
  {
    if (v5)
    {
      id v9 = @"failure reported by server";
      uint64_t v10 = 0LL;
      id v11 = v5;
    }

    else
    {
      id v9 = @"no response message from server";
      uint64_t v10 = 6104LL;
      id v11 = 0LL;
    }

    [*(id *)(a1 + 32) _failedControlSummary:@"stagedAssetSummary" withErrorCode:v10 withResponseError:v11 description:v9 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v12 message];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 safeObjectForKey:@"jobSummary" ofClass:objc_opt_class()];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    id v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 _successControlSummary:@"stagedAssetSummary" withJobSummaryEntries:v7 completion:*(void *)(a1 + 40)];
    }
    else {
      [v8 _failedControlSummary:@"stagedAssetSummary" withErrorCode:6110 withResponseError:0 description:@"no staged-asset-summary provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

+ (id)activeJobSummary:(BOOL)a3 error:(id *)a4
{
  return +[MAAutoAssetControl activeJobSummary:limitedToAssetTypes:error:]( &OBJC_CLASS___MAAutoAssetControl,  "activeJobSummary:limitedToAssetTypes:error:",  a3,  0LL,  a4);
}

+ (id)activeJobSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  +[MAAutoAssetControl autoAssetControl](&OBJC_CLASS___MAAutoAssetControl, "autoAssetControl");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v32 = 0LL;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  id v35 = __Block_byref_object_copy__6;
  v36 = __Block_byref_object_dispose__6;
  id v37 = 0LL;
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  id v29 = __Block_byref_object_copy__6;
  uint64_t v30 = __Block_byref_object_dispose__6;
  id v31 = 0LL;
  v24[0] = 0LL;
  v24[1] = v24;
  v24[2] = 0x2020000000LL;
  char v25 = 0;
  v22[0] = 0LL;
  v22[1] = v22;
  v22[2] = 0x2020000000LL;
  char v23 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
  uint64_t v10 = MEMORY[0x1895F87A8];
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __65__MAAutoAssetControl_activeJobSummary_limitedToAssetTypes_error___block_invoke;
  v16[3] = &unk_189FF9488;
  id v18 = v22;
  char v19 = &v32;
  v20 = &v26;
  char v21 = v24;
  id v11 = v9;
  id v17 = v11;
  [v8 _activeJobSummary:v6 limitedToAssetTypes:v7 completion:v16];
  if (+[MAAutoAssetControl waitOnSemaphore:withTimeout:]( &OBJC_CLASS___MAAutoAssetControl,  "waitOnSemaphore:withTimeout:",  v11,  -2LL))
  {
    +[MAAutoAssetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetControl, "frameworkDispatchQueue");
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v10;
    block[1] = 3221225472LL;
    block[2] = __65__MAAutoAssetControl_activeJobSummary_limitedToAssetTypes_error___block_invoke_3;
    block[3] = &unk_189FF94B0;
    void block[4] = v24;
    block[5] = v22;
    block[6] = &v26;
    dispatch_sync(v12, block);
  }

  if (a5) {
    *a5 = (id) v27[5];
  }
  id v13 = (id)v33[5];

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v13;
}

void __65__MAAutoAssetControl_activeJobSummary_limitedToAssetTypes_error___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  +[MAAutoAssetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetControl, "frameworkDispatchQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)uint64_t v10 = *(_OWORD *)(a1 + 32);
  __int128 v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __65__MAAutoAssetControl_activeJobSummary_limitedToAssetTypes_error___block_invoke_2;
  block[3] = &unk_189FF9460;
  id v12 = v5;
  id v13 = v6;
  uint64_t v16 = *(void *)(a1 + 64);
  id v8 = v10[0];
  __int128 v14 = *(_OWORD *)v10;
  id v9 = v6;
  v10[0] = v5;
  dispatch_sync(v7, block);
}

uint64_t __65__MAAutoAssetControl_activeJobSummary_limitedToAssetTypes_error___block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 56) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 64) + 8LL) + 40LL), *(id *)(result + 32));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 72) + 8LL) + 40LL), *(id *)(v1 + 40));
    *(_BYTE *)(*(void *)(*(void *)(v1 + 80) + 8LL) + 24LL) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 48));
  }

  return result;
}

void __65__MAAutoAssetControl_activeJobSummary_limitedToAssetTypes_error___block_invoke_3(void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto-control(activeJobSummary)",  0LL,  @"timeout (at framework layer) while waiting for active-job-summary to complete");
    uint64_t v3 = *(void *)(a1[6] + 8LL);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }

- (void)_activeJobSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __71__MAAutoAssetControl__activeJobSummary_limitedToAssetTypes_completion___block_invoke;
    v12[3] = &unk_189FF9500;
    BOOL v16 = a3;
    id v13 = (os_log_s *)v8;
    __int128 v14 = self;
    id v15 = v9;
    -[MAAutoAssetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v12);

    uint64_t v10 = v13;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 oslog];
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _activeJobSummary:limitedToAssetTypes:completion:].cold.1();
    }
  }
}

void __71__MAAutoAssetControl__activeJobSummary_limitedToAssetTypes_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 40) _failedControlSummary:@"activeJobSummary" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 48)];
  }

  else
  {
    id v3 = -[MAAutoAssetInfoControl initClearingAfter:limitedToAssetTypes:]( objc_alloc(&OBJC_CLASS___MAAutoAssetInfoControl),  "initClearingAfter:limitedToAssetTypes:",  *(unsigned __int8 *)(a1 + 56),  *(void *)(a1 + 32));
    id v4 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAssetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetControl, "frameworkInstanceUUID");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 UUIDString];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[MAAutoAssetControl assetSelectorOrAllSelector:]( &OBJC_CLASS___MAAutoAssetControl,  "assetSelectorOrAllSelector:",  0LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    [*(id *)(a1 + 40) controlClientName];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) controlClientProcessName];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [*(id *)(a1 + 40) controlClientProcessID];
    +[MAAutoAssetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetControl, "frameworkInstanceUUID");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v8,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  v9,  v10,  v11,  v7,  v12);

    [v4 setSafeObject:v13 forKey:@"instance"];
    [v4 setSafeObject:v3 forKey:@"control"];
    __int128 v14 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-CONTROL:ACTIVE_JOB_SUMMARY" clientID:v6 version:0 message:v4];
    [*(id *)(a1 + 40) connectionClient];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __71__MAAutoAssetControl__activeJobSummary_limitedToAssetTypes_completion___block_invoke_2;
    v17[3] = &unk_189FF94D8;
    BOOL v16 = *(void **)(a1 + 48);
    v17[4] = *(void *)(a1 + 40);
    id v18 = v16;
    [v15 connectClientSendServerMessage:v14 proxyObject:0 withReply:v17];
  }

void __71__MAAutoAssetControl__activeJobSummary_limitedToAssetTypes_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (!v12 || v5)
  {
    if (v5)
    {
      id v9 = @"failure reported by server";
      uint64_t v10 = 0LL;
      id v11 = v5;
    }

    else
    {
      id v9 = @"no response message from server";
      uint64_t v10 = 6104LL;
      id v11 = 0LL;
    }

    [*(id *)(a1 + 32) _failedControlSummary:@"activeJobSummary" withErrorCode:v10 withResponseError:v11 description:v9 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v12 message];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 safeObjectForKey:@"jobSummary" ofClass:objc_opt_class()];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    id v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 _successControlSummary:@"activeJobSummary" withJobSummaryEntries:v7 completion:*(void *)(a1 + 40)];
    }
    else {
      [v8 _failedControlSummary:@"activeJobSummary" withErrorCode:6110 withResponseError:0 description:@"no active-job-summary provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

+ (id)scheduledJobSummary:(BOOL)a3 error:(id *)a4
{
  return +[MAAutoAssetControl scheduledJobSummary:limitedToAssetTypes:error:]( &OBJC_CLASS___MAAutoAssetControl,  "scheduledJobSummary:limitedToAssetTypes:error:",  a3,  0LL,  a4);
}

+ (id)scheduledJobSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  +[MAAutoAssetControl autoAssetControl](&OBJC_CLASS___MAAutoAssetControl, "autoAssetControl");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v32 = 0LL;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  id v35 = __Block_byref_object_copy__6;
  v36 = __Block_byref_object_dispose__6;
  id v37 = 0LL;
  uint64_t v26 = 0LL;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  id v29 = __Block_byref_object_copy__6;
  uint64_t v30 = __Block_byref_object_dispose__6;
  id v31 = 0LL;
  v24[0] = 0LL;
  v24[1] = v24;
  v24[2] = 0x2020000000LL;
  char v25 = 0;
  v22[0] = 0LL;
  v22[1] = v22;
  v22[2] = 0x2020000000LL;
  char v23 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
  uint64_t v10 = MEMORY[0x1895F87A8];
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __68__MAAutoAssetControl_scheduledJobSummary_limitedToAssetTypes_error___block_invoke;
  v16[3] = &unk_189FF9488;
  id v18 = v22;
  char v19 = &v32;
  v20 = &v26;
  char v21 = v24;
  id v11 = v9;
  id v17 = v11;
  [v8 _scheduledJobSummary:v6 limitedToAssetTypes:v7 completion:v16];
  if (+[MAAutoAssetControl waitOnSemaphore:withTimeout:]( &OBJC_CLASS___MAAutoAssetControl,  "waitOnSemaphore:withTimeout:",  v11,  -2LL))
  {
    +[MAAutoAssetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetControl, "frameworkDispatchQueue");
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v10;
    block[1] = 3221225472LL;
    block[2] = __68__MAAutoAssetControl_scheduledJobSummary_limitedToAssetTypes_error___block_invoke_3;
    block[3] = &unk_189FF94B0;
    void block[4] = v24;
    block[5] = v22;
    block[6] = &v26;
    dispatch_sync(v12, block);
  }

  if (a5) {
    *a5 = (id) v27[5];
  }
  id v13 = (id)v33[5];

  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v26, 8);

  _Block_object_dispose(&v32, 8);
  return v13;
}

void __68__MAAutoAssetControl_scheduledJobSummary_limitedToAssetTypes_error___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  +[MAAutoAssetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetControl, "frameworkDispatchQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)uint64_t v10 = *(_OWORD *)(a1 + 32);
  __int128 v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __68__MAAutoAssetControl_scheduledJobSummary_limitedToAssetTypes_error___block_invoke_2;
  block[3] = &unk_189FF9460;
  id v12 = v5;
  id v13 = v6;
  uint64_t v16 = *(void *)(a1 + 64);
  id v8 = v10[0];
  __int128 v14 = *(_OWORD *)v10;
  id v9 = v6;
  v10[0] = v5;
  dispatch_sync(v7, block);
}

uint64_t __68__MAAutoAssetControl_scheduledJobSummary_limitedToAssetTypes_error___block_invoke_2( uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 56) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 64) + 8LL) + 40LL), *(id *)(result + 32));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 72) + 8LL) + 40LL), *(id *)(v1 + 40));
    *(_BYTE *)(*(void *)(*(void *)(v1 + 80) + 8LL) + 24LL) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 48));
  }

  return result;
}

void __68__MAAutoAssetControl_scheduledJobSummary_limitedToAssetTypes_error___block_invoke_3(void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto-control(scheduledJobSummary)",  0LL,  @"timeout (at framework layer) while waiting for scheduled-job-summary to complete");
    uint64_t v3 = *(void *)(a1[6] + 8LL);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }

- (void)_scheduledJobSummary:(BOOL)a3 limitedToAssetTypes:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __74__MAAutoAssetControl__scheduledJobSummary_limitedToAssetTypes_completion___block_invoke;
    v12[3] = &unk_189FF9500;
    BOOL v16 = a3;
    id v13 = (os_log_s *)v8;
    __int128 v14 = self;
    id v15 = v9;
    -[MAAutoAssetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v12);

    uint64_t v10 = v13;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 oslog];
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _scheduledJobSummary:limitedToAssetTypes:completion:].cold.1();
    }
  }
}

void __74__MAAutoAssetControl__scheduledJobSummary_limitedToAssetTypes_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 40) _failedControlSummary:@"scheduledJobSummary" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 48)];
  }

  else
  {
    id v3 = -[MAAutoAssetInfoControl initClearingAfter:limitedToAssetTypes:]( objc_alloc(&OBJC_CLASS___MAAutoAssetInfoControl),  "initClearingAfter:limitedToAssetTypes:",  *(unsigned __int8 *)(a1 + 56),  *(void *)(a1 + 32));
    id v4 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAssetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetControl, "frameworkInstanceUUID");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 UUIDString];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[MAAutoAssetControl assetSelectorOrAllSelector:]( &OBJC_CLASS___MAAutoAssetControl,  "assetSelectorOrAllSelector:",  0LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    [*(id *)(a1 + 40) controlClientName];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) controlClientProcessName];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [*(id *)(a1 + 40) controlClientProcessID];
    +[MAAutoAssetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetControl, "frameworkInstanceUUID");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v8,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  v9,  v10,  v11,  v7,  v12);

    [v4 setSafeObject:v13 forKey:@"instance"];
    [v4 setSafeObject:v3 forKey:@"control"];
    __int128 v14 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-CONTROL:SCHEDULED_JOB_SUMMARY" clientID:v6 version:0 message:v4];
    [*(id *)(a1 + 40) connectionClient];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __74__MAAutoAssetControl__scheduledJobSummary_limitedToAssetTypes_completion___block_invoke_2;
    v17[3] = &unk_189FF94D8;
    BOOL v16 = *(void **)(a1 + 48);
    v17[4] = *(void *)(a1 + 40);
    id v18 = v16;
    [v15 connectClientSendServerMessage:v14 proxyObject:0 withReply:v17];
  }

void __74__MAAutoAssetControl__scheduledJobSummary_limitedToAssetTypes_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if (!v12 || v5)
  {
    if (v5)
    {
      id v9 = @"failure reported by server";
      uint64_t v10 = 0LL;
      id v11 = v5;
    }

    else
    {
      id v9 = @"no response message from server";
      uint64_t v10 = 6104LL;
      id v11 = 0LL;
    }

    [*(id *)(a1 + 32) _failedControlSummary:@"scheduledJobSummary" withErrorCode:v10 withResponseError:v11 description:v9 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v12 message];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 safeObjectForKey:@"jobSummary" ofClass:objc_opt_class()];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    id v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 _successControlSummary:@"scheduledJobSummary" withJobSummaryEntries:v7 completion:*(void *)(a1 + 40)];
    }
    else {
      [v8 _failedControlSummary:@"scheduledJobSummary" withErrorCode:6110 withResponseError:0 description:@"no scheduled-job-summary provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

+ (id)forceGlobalUnlock:(id)a3
{
  id v3 = a3;
  +[MAAutoAssetControl autoAssetControl](&OBJC_CLASS___MAAutoAssetControl, "autoAssetControl");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  uint64_t v24 = __Block_byref_object_copy__6;
  char v25 = __Block_byref_object_dispose__6;
  id v26 = 0LL;
  v19[0] = 0LL;
  v19[1] = v19;
  v19[2] = 0x2020000000LL;
  char v20 = 0;
  v17[0] = 0LL;
  v17[1] = v17;
  v17[2] = 0x2020000000LL;
  char v18 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  uint64_t v6 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __40__MAAutoAssetControl_forceGlobalUnlock___block_invoke;
  v12[3] = &unk_189FFB100;
  __int128 v14 = v17;
  id v15 = &v21;
  BOOL v16 = v19;
  id v7 = v5;
  id v13 = v7;
  [v4 _forceGlobalUnlock:v3 completion:v12];
  if (+[MAAutoAssetControl waitOnSemaphore:withTimeout:]( &OBJC_CLASS___MAAutoAssetControl,  "waitOnSemaphore:withTimeout:",  v7,  -2LL))
  {
    +[MAAutoAssetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetControl, "frameworkDispatchQueue");
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v6;
    block[1] = 3221225472LL;
    block[2] = __40__MAAutoAssetControl_forceGlobalUnlock___block_invoke_3;
    block[3] = &unk_189FF94B0;
    void block[4] = v19;
    block[5] = v17;
    block[6] = &v21;
    dispatch_sync(v8, block);
  }

  id v9 = (id)v22[5];

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __40__MAAutoAssetControl_forceGlobalUnlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  +[MAAutoAssetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetControl, "frameworkDispatchQueue");
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)uint64_t v6 = *(_OWORD *)(a1 + 32);
  __int128 v10 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __40__MAAutoAssetControl_forceGlobalUnlock___block_invoke_2;
  block[3] = &unk_189FFAEA8;
  id v8 = v3;
  id v5 = v6[0];
  __int128 v9 = *(_OWORD *)v6;
  v6[0] = v3;
  dispatch_sync(v4, block);
}

uint64_t __40__MAAutoAssetControl_forceGlobalUnlock___block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 48) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 56) + 8LL) + 40LL), *(id *)(result + 32));
    *(_BYTE *)(*(void *)(*(void *)(v1 + 64) + 8LL) + 24LL) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 40));
  }

  return result;
}

void __40__MAAutoAssetControl_forceGlobalUnlock___block_invoke_3(void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto-control(forceGlobalUnlock)",  0LL,  @"timeout (at framework layer) while waiting for force-global-unlock to complete");
    uint64_t v3 = *(void *)(a1[6] + 8LL);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }

- (void)_forceGlobalUnlock:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    id v10[2] = __52__MAAutoAssetControl__forceGlobalUnlock_completion___block_invoke;
    v10[3] = &unk_189FF9578;
    id v11 = (os_log_s *)v6;
    id v12 = self;
    id v13 = v7;
    -[MAAutoAssetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v10);

    id v8 = v11;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 oslog];
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _forceGlobalUnlock:completion:].cold.1();
    }
  }
}

void __52__MAAutoAssetControl__forceGlobalUnlock_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 40) _failedControl:@"forceGlobalUnlock" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 48)];
  }

  else
  {
    id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAssetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetControl, "frameworkInstanceUUID");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 UUIDString];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[MAAutoAssetControl assetSelectorOrAllSelector:]( &OBJC_CLASS___MAAutoAssetControl,  "assetSelectorOrAllSelector:",  *(void *)(a1 + 32));
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v7 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    [*(id *)(a1 + 40) controlClientName];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) controlClientProcessName];
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [*(id *)(a1 + 40) controlClientProcessID];
    +[MAAutoAssetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetControl, "frameworkInstanceUUID");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v7,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  v8,  v9,  v10,  v6,  v11);

    [v3 setSafeObject:v12 forKey:@"instance"];
    id v13 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-CONTROL:FORCE_GLOBAL_UNLOCK" clientID:v5 version:0 message:v3];
    [*(id *)(a1 + 40) connectionClient];
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __52__MAAutoAssetControl__forceGlobalUnlock_completion___block_invoke_2;
    v16[3] = &unk_189FF94D8;
    id v15 = *(void **)(a1 + 48);
    void v16[4] = *(void *)(a1 + 40);
    id v17 = v15;
    [v14 connectClientSendServerMessage:v13 proxyObject:0 withReply:v16];
  }

void __52__MAAutoAssetControl__forceGlobalUnlock_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (!v10 || v5)
  {
    if (v5)
    {
      id v7 = @"failure reported by server";
      uint64_t v8 = 0LL;
      id v9 = v5;
    }

    else
    {
      id v7 = @"no response message from server";
      uint64_t v8 = 6104LL;
      id v9 = 0LL;
    }

    [v6 _failedControl:@"forceGlobalUnlock" withErrorCode:v8 withResponseError:v9 description:v7 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v6 _successControl:@"forceGlobalUnlock" completion:*(void *)(a1 + 40)];
  }
}

+ (id)forceGlobalForget:(id)a3
{
  id v3 = a3;
  +[MAAutoAssetControl autoAssetControl](&OBJC_CLASS___MAAutoAssetControl, "autoAssetControl");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  uint64_t v24 = __Block_byref_object_copy__6;
  char v25 = __Block_byref_object_dispose__6;
  id v26 = 0LL;
  v19[0] = 0LL;
  v19[1] = v19;
  v19[2] = 0x2020000000LL;
  char v20 = 0;
  v17[0] = 0LL;
  v17[1] = v17;
  v17[2] = 0x2020000000LL;
  char v18 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  uint64_t v6 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __40__MAAutoAssetControl_forceGlobalForget___block_invoke;
  v12[3] = &unk_189FFB100;
  __int128 v14 = v17;
  id v15 = &v21;
  BOOL v16 = v19;
  id v7 = v5;
  id v13 = v7;
  [v4 _forceGlobalForget:v3 completion:v12];
  if (+[MAAutoAssetControl waitOnSemaphore:withTimeout:]( &OBJC_CLASS___MAAutoAssetControl,  "waitOnSemaphore:withTimeout:",  v7,  -2LL))
  {
    +[MAAutoAssetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetControl, "frameworkDispatchQueue");
    uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v6;
    block[1] = 3221225472LL;
    block[2] = __40__MAAutoAssetControl_forceGlobalForget___block_invoke_3;
    block[3] = &unk_189FF94B0;
    void block[4] = v19;
    block[5] = v17;
    block[6] = &v21;
    dispatch_sync(v8, block);
  }

  id v9 = (id)v22[5];

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __40__MAAutoAssetControl_forceGlobalForget___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  +[MAAutoAssetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetControl, "frameworkDispatchQueue");
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)uint64_t v6 = *(_OWORD *)(a1 + 32);
  __int128 v10 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __40__MAAutoAssetControl_forceGlobalForget___block_invoke_2;
  block[3] = &unk_189FFAEA8;
  id v8 = v3;
  id v5 = v6[0];
  __int128 v9 = *(_OWORD *)v6;
  v6[0] = v3;
  dispatch_sync(v4, block);
}

uint64_t __40__MAAutoAssetControl_forceGlobalForget___block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 48) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 56) + 8LL) + 40LL), *(id *)(result + 32));
    *(_BYTE *)(*(void *)(*(void *)(v1 + 64) + 8LL) + 24LL) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 40));
  }

  return result;
}

void __40__MAAutoAssetControl_forceGlobalForget___block_invoke_3(void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto-control(forceGlobalForget)",  0LL,  @"timeout (at framework layer) while waiting for force-global-forget to complete");
    uint64_t v3 = *(void *)(a1[6] + 8LL);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }

- (void)_forceGlobalForget:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    id v10[2] = __52__MAAutoAssetControl__forceGlobalForget_completion___block_invoke;
    v10[3] = &unk_189FF9578;
    id v11 = (os_log_s *)v6;
    id v12 = self;
    id v13 = v7;
    -[MAAutoAssetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v10);

    id v8 = v11;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 oslog];
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _forceGlobalForget:completion:].cold.1();
    }
  }
}

void __52__MAAutoAssetControl__forceGlobalForget_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 40) _failedControl:@"forceGlobalForget" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 48)];
  }

  else
  {
    id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAssetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetControl, "frameworkInstanceUUID");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 UUIDString];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    +[MAAutoAssetControl assetSelectorOrAllSelector:]( &OBJC_CLASS___MAAutoAssetControl,  "assetSelectorOrAllSelector:",  *(void *)(a1 + 32));
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v7 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    [*(id *)(a1 + 40) controlClientName];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) controlClientProcessName];
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [*(id *)(a1 + 40) controlClientProcessID];
    +[MAAutoAssetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetControl, "frameworkInstanceUUID");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v7,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  v8,  v9,  v10,  v6,  v11);

    [v3 setSafeObject:v12 forKey:@"instance"];
    id v13 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-CONTROL:FORCE_GLOBAL_FORGET" clientID:v5 version:0 message:v3];
    [*(id *)(a1 + 40) connectionClient];
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __52__MAAutoAssetControl__forceGlobalForget_completion___block_invoke_2;
    v16[3] = &unk_189FF94D8;
    id v15 = *(void **)(a1 + 48);
    void v16[4] = *(void *)(a1 + 40);
    id v17 = v15;
    [v14 connectClientSendServerMessage:v13 proxyObject:0 withReply:v16];
  }

void __52__MAAutoAssetControl__forceGlobalForget_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (!v10 || v5)
  {
    if (v5)
    {
      id v7 = @"failure reported by server";
      uint64_t v8 = 0LL;
      id v9 = v5;
    }

    else
    {
      id v7 = @"no response message from server";
      uint64_t v8 = 6104LL;
      id v9 = 0LL;
    }

    [v6 _failedControl:@"forceGlobalForget" withErrorCode:v8 withResponseError:v9 description:v7 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v6 _successControl:@"forceGlobalForget" completion:*(void *)(a1 + 40)];
  }
}

+ (id)forceGlobalPurge:(id)a3 forcingUnlock:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  +[MAAutoAssetControl autoAssetControl](&OBJC_CLASS___MAAutoAssetControl, "autoAssetControl");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v23 = 0LL;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  id v26 = __Block_byref_object_copy__6;
  id v27 = __Block_byref_object_dispose__6;
  id v28 = 0LL;
  v21[0] = 0LL;
  v21[1] = v21;
  v21[2] = 0x2020000000LL;
  char v22 = 0;
  v19[0] = 0LL;
  v19[1] = v19;
  v19[2] = 0x2020000000LL;
  char v20 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
  uint64_t v8 = MEMORY[0x1895F87A8];
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __53__MAAutoAssetControl_forceGlobalPurge_forcingUnlock___block_invoke;
  v14[3] = &unk_189FFB100;
  BOOL v16 = v19;
  id v17 = &v23;
  char v18 = v21;
  id v9 = v7;
  id v15 = v9;
  [v6 _forceGlobalPurge:v5 forcingUnlock:v4 completion:v14];
  if (+[MAAutoAssetControl waitOnSemaphore:withTimeout:]( &OBJC_CLASS___MAAutoAssetControl,  "waitOnSemaphore:withTimeout:",  v9,  -2LL))
  {
    +[MAAutoAssetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetControl, "frameworkDispatchQueue");
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v8;
    block[1] = 3221225472LL;
    block[2] = __53__MAAutoAssetControl_forceGlobalPurge_forcingUnlock___block_invoke_3;
    block[3] = &unk_189FF94B0;
    void block[4] = v21;
    block[5] = v19;
    block[6] = &v23;
    dispatch_sync(v10, block);
  }

  id v11 = (id)v24[5];

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __53__MAAutoAssetControl_forceGlobalPurge_forcingUnlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  +[MAAutoAssetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetControl, "frameworkDispatchQueue");
  BOOL v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)id v6 = *(_OWORD *)(a1 + 32);
  __int128 v10 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __53__MAAutoAssetControl_forceGlobalPurge_forcingUnlock___block_invoke_2;
  block[3] = &unk_189FFAEA8;
  id v8 = v3;
  id v5 = v6[0];
  __int128 v9 = *(_OWORD *)v6;
  v6[0] = v3;
  dispatch_sync(v4, block);
}

uint64_t __53__MAAutoAssetControl_forceGlobalPurge_forcingUnlock___block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 48) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 56) + 8LL) + 40LL), *(id *)(result + 32));
    *(_BYTE *)(*(void *)(*(void *)(v1 + 64) + 8LL) + 24LL) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 40));
  }

  return result;
}

void __53__MAAutoAssetControl_forceGlobalPurge_forcingUnlock___block_invoke_3(void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto-control(forceGlobalPurge)",  0LL,  @"timeout (at framework layer) while waiting for force-global-purge to complete");
    uint64_t v3 = *(void *)(a1[6] + 8LL);
    BOOL v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }

- (void)_forceGlobalPurge:(id)a3 forcingUnlock:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __65__MAAutoAssetControl__forceGlobalPurge_forcingUnlock_completion___block_invoke;
    v12[3] = &unk_189FF9500;
    BOOL v16 = a4;
    id v13 = (os_log_s *)v8;
    __int128 v14 = self;
    id v15 = v9;
    -[MAAutoAssetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v12);

    __int128 v10 = v13;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 oslog];
    __int128 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _forceGlobalPurge:forcingUnlock:completion:].cold.1();
    }
  }
}

void __65__MAAutoAssetControl__forceGlobalPurge_forcingUnlock_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 40) _failedControl:@"forceGlobalPurge" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 48)];
  }

  else
  {
    id v3 = -[MAAutoAssetInfoControl initForcingUnlock:]( objc_alloc(&OBJC_CLASS___MAAutoAssetInfoControl),  "initForcingUnlock:",  *(unsigned __int8 *)(a1 + 56));
    id v4 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAssetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetControl, "frameworkInstanceUUID");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 UUIDString];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[MAAutoAssetControl assetSelectorOrAllSelector:]( &OBJC_CLASS___MAAutoAssetControl,  "assetSelectorOrAllSelector:",  *(void *)(a1 + 32));
    dispatch_semaphore_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    [*(id *)(a1 + 40) controlClientName];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) controlClientProcessName];
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [*(id *)(a1 + 40) controlClientProcessID];
    +[MAAutoAssetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetControl, "frameworkInstanceUUID");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v8,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  v9,  v10,  v11,  v7,  v12);

    [v4 setSafeObject:v13 forKey:@"instance"];
    [v4 setSafeObject:v3 forKey:@"control"];
    __int128 v14 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-CONTROL:FORCE_GLOBAL_PURGE" clientID:v6 version:0 message:v4];
    [*(id *)(a1 + 40) connectionClient];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __65__MAAutoAssetControl__forceGlobalPurge_forcingUnlock_completion___block_invoke_2;
    void v17[3] = &unk_189FF94D8;
    BOOL v16 = *(void **)(a1 + 48);
    v17[4] = *(void *)(a1 + 40);
    id v18 = v16;
    [v15 connectClientSendServerMessage:v14 proxyObject:0 withReply:v17];
  }

void __65__MAAutoAssetControl__forceGlobalPurge_forcingUnlock_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (!v10 || v5)
  {
    if (v5)
    {
      dispatch_semaphore_t v7 = @"failure reported by server";
      uint64_t v8 = 0LL;
      id v9 = v5;
    }

    else
    {
      dispatch_semaphore_t v7 = @"no response message from server";
      uint64_t v8 = 6104LL;
      id v9 = 0LL;
    }

    [v6 _failedControl:@"forceGlobalPurge" withErrorCode:v8 withResponseError:v9 description:v7 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v6 _successControl:@"forceGlobalPurge" completion:*(void *)(a1 + 40)];
  }
}

+ (id)forceGlobalAbandon:(id)a3
{
  id v3 = a3;
  +[MAAutoAssetControl autoAssetControl](&OBJC_CLASS___MAAutoAssetControl, "autoAssetControl");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = 0LL;
  char v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  uint64_t v24 = __Block_byref_object_copy__6;
  uint64_t v25 = __Block_byref_object_dispose__6;
  id v26 = 0LL;
  v19[0] = 0LL;
  v19[1] = v19;
  v19[2] = 0x2020000000LL;
  char v20 = 0;
  v17[0] = 0LL;
  v17[1] = v17;
  v17[2] = 0x2020000000LL;
  char v18 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  uint64_t v6 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __41__MAAutoAssetControl_forceGlobalAbandon___block_invoke;
  v12[3] = &unk_189FFB100;
  __int128 v14 = v17;
  id v15 = &v21;
  BOOL v16 = v19;
  dispatch_semaphore_t v7 = v5;
  id v13 = v7;
  [v4 _forceGlobalAbandon:v3 completion:v12];
  if (+[MAAutoAssetControl waitOnSemaphore:withTimeout:]( &OBJC_CLASS___MAAutoAssetControl,  "waitOnSemaphore:withTimeout:",  v7,  -2LL))
  {
    +[MAAutoAssetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetControl, "frameworkDispatchQueue");
    uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v6;
    block[1] = 3221225472LL;
    block[2] = __41__MAAutoAssetControl_forceGlobalAbandon___block_invoke_3;
    block[3] = &unk_189FF94B0;
    void block[4] = v19;
    block[5] = v17;
    block[6] = &v21;
    dispatch_sync(v8, block);
  }

  id v9 = (id)v22[5];

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __41__MAAutoAssetControl_forceGlobalAbandon___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  +[MAAutoAssetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetControl, "frameworkDispatchQueue");
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)uint64_t v6 = *(_OWORD *)(a1 + 32);
  __int128 v10 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __41__MAAutoAssetControl_forceGlobalAbandon___block_invoke_2;
  block[3] = &unk_189FFAEA8;
  id v8 = v3;
  id v5 = v6[0];
  __int128 v9 = *(_OWORD *)v6;
  v6[0] = v3;
  dispatch_sync(v4, block);
}

uint64_t __41__MAAutoAssetControl_forceGlobalAbandon___block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 48) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 56) + 8LL) + 40LL), *(id *)(result + 32));
    *(_BYTE *)(*(void *)(*(void *)(v1 + 64) + 8LL) + 24LL) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 40));
  }

  return result;
}

void __41__MAAutoAssetControl_forceGlobalAbandon___block_invoke_3(void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto-control(forceGlobalAbandon)",  0LL,  @"timeout (at framework layer) while waiting for force-global-abandon to complete");
    uint64_t v3 = *(void *)(a1[6] + 8LL);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }

- (void)_forceGlobalAbandon:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    id v10[2] = __53__MAAutoAssetControl__forceGlobalAbandon_completion___block_invoke;
    v10[3] = &unk_189FF9578;
    void v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    -[MAAutoAssetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v10);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    __int128 v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _forceGlobalAbandon:completion:].cold.1();
    }
  }
}

void __53__MAAutoAssetControl__forceGlobalAbandon_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _failedControl:@"forceGlobalAbandon" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 48)];
  }

  else
  {
    uint64_t v3 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    [*(id *)(a1 + 32) controlClientName];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) controlClientProcessName];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [*(id *)(a1 + 32) controlClientProcessID];
    uint64_t v7 = *(void *)(a1 + 40);
    +[MAAutoAssetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetControl, "frameworkInstanceUUID");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v3,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  v4,  v5,  v6,  v7,  v8);

    id v10 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAssetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetControl, "frameworkInstanceUUID");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 UUIDString];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();

    [v10 setSafeObject:v9 forKey:@"instance"];
    id v13 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-CONTROL:FORCE_GLOBAL_ABANDON" clientID:v12 version:0 message:v10];
    [*(id *)(a1 + 32) connectionClient];
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __53__MAAutoAssetControl__forceGlobalAbandon_completion___block_invoke_2;
    v15[3] = &unk_189FF94D8;
    v15[4] = *(void *)(a1 + 32);
    id v16 = *(id *)(a1 + 48);
    [v14 connectClientSendServerMessage:v13 proxyObject:0 withReply:v15];
  }

void __53__MAAutoAssetControl__forceGlobalAbandon_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  if (!v10 || v5)
  {
    if (v5)
    {
      uint64_t v7 = @"failure reported by server";
      uint64_t v8 = 0LL;
      id v9 = v5;
    }

    else
    {
      uint64_t v7 = @"no response message from server";
      uint64_t v8 = 6104LL;
      id v9 = 0LL;
    }

    [v6 _failedControl:@"forceGlobalAbandon" withErrorCode:v8 withResponseError:v9 description:v7 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v6 _successControl:@"forceGlobalAbandon" completion:*(void *)(a1 + 40)];
  }
}

+ (int64_t)simulateCacheDeleteDetermineReclaimableSpace:(id)a3 withUrgency:(int)a4 error:(id *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v7 = a3;
  +[MAAutoAssetControl autoAssetControl](&OBJC_CLASS___MAAutoAssetControl, "autoAssetControl");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v33 = 0LL;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2020000000LL;
  uint64_t v36 = 0LL;
  uint64_t v27 = 0LL;
  id v28 = (id *)&v27;
  uint64_t v29 = 0x3032000000LL;
  uint64_t v30 = __Block_byref_object_copy__6;
  id v31 = __Block_byref_object_dispose__6;
  id v32 = 0LL;
  v25[0] = 0LL;
  v25[1] = v25;
  v25[2] = 0x2020000000LL;
  char v26 = 0;
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x2020000000LL;
  char v24 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
  id v10 = v28;
  id obj = v28[5];
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __85__MAAutoAssetControl_simulateCacheDeleteDetermineReclaimableSpace_withUrgency_error___block_invoke;
  v16[3] = &unk_189FFB240;
  char v18 = v23;
  char v19 = &v33;
  char v20 = &v27;
  uint64_t v21 = v25;
  id v11 = v9;
  id v17 = v11;
  [v8 _simulateCacheDeleteDetermineReclaimableSpace:v7 withUrgency:v6 error:&obj completion:v16];
  objc_storeStrong(v10 + 5, obj);
  if (+[MAAutoAssetControl waitOnSemaphore:withTimeout:]( &OBJC_CLASS___MAAutoAssetControl,  "waitOnSemaphore:withTimeout:",  v11,  -2LL))
  {
    +[MAAutoAssetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetControl, "frameworkDispatchQueue");
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __85__MAAutoAssetControl_simulateCacheDeleteDetermineReclaimableSpace_withUrgency_error___block_invoke_3;
    v15[3] = &unk_189FF94B0;
    v15[4] = v25;
    void v15[5] = v23;
    v15[6] = &v27;
    dispatch_sync(v12, v15);
  }

  if (a5) {
    *a5 = v28[5];
  }
  int64_t v13 = v34[3];

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v13;
}

void __85__MAAutoAssetControl_simulateCacheDeleteDetermineReclaimableSpace_withUrgency_error___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v5 = a3;
  +[MAAutoAssetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetControl, "frameworkDispatchQueue");
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)uint64_t v8 = *(_OWORD *)(a1 + 32);
  __int128 v12 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __85__MAAutoAssetControl_simulateCacheDeleteDetermineReclaimableSpace_withUrgency_error___block_invoke_2;
  block[3] = &unk_189FFB218;
  id v10 = v5;
  uint64_t v13 = *(void *)(a1 + 64);
  uint64_t v14 = a2;
  id v7 = v8[0];
  __int128 v11 = *(_OWORD *)v8;
  v8[0] = v5;
  dispatch_sync(v6, block);
}

uint64_t __85__MAAutoAssetControl_simulateCacheDeleteDetermineReclaimableSpace_withUrgency_error___block_invoke_2( uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 48) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    *(void *)(*(void *)(*(void *)(result + 56) + 8LL) + 24LL) = *(void *)(result + 80);
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 64) + 8LL) + 40LL), *(id *)(result + 32));
    *(_BYTE *)(*(void *)(*(void *)(v1 + 72) + 8LL) + 24LL) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 40));
  }

  return result;
}

void __85__MAAutoAssetControl_simulateCacheDeleteDetermineReclaimableSpace_withUrgency_error___block_invoke_3( void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto-control(simulateCacheDeleteDetermineReclaimableSpace)",  0LL,  @"timeout (at framework layer) while waiting for simulated-cache-delete-operation to complete");
    uint64_t v3 = *(void *)(a1[6] + 8LL);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }

- (void)_simulateCacheDeleteDetermineReclaimableSpace:(id)a3 withUrgency:(int)a4 error:(id *)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  if (v10)
  {
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __97__MAAutoAssetControl__simulateCacheDeleteDetermineReclaimableSpace_withUrgency_error_completion___block_invoke;
    v13[3] = &unk_189FFB268;
    int v17 = a4;
    uint64_t v14 = (os_log_s *)v9;
    id v15 = self;
    id v16 = v10;
    -[MAAutoAssetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v13);

    __int128 v11 = v14;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 oslog];
    __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _simulateCacheDeleteDetermineReclaimableSpace:withUrgency:error:completion:].cold.1();
    }
  }
}

void __97__MAAutoAssetControl__simulateCacheDeleteDetermineReclaimableSpace_withUrgency_error_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 40) _failedSimulateCacheDeleteOperation:@"simulateCacheDeleteDetermineReclaimableSpace" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 48)];
  }

  else
  {
    uint64_t v3 = -[MAAutoAssetInfoControl initWithVolumeToReclaim:withUrgency:targetingPurgeAmount:]( objc_alloc(&OBJC_CLASS___MAAutoAssetInfoControl),  "initWithVolumeToReclaim:withUrgency:targetingPurgeAmount:",  *(void *)(a1 + 32),  *(unsigned int *)(a1 + 56),  0LL);
    id v4 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAssetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetControl, "frameworkInstanceUUID");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 UUIDString];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[MAAutoAssetControl assetSelectorOrAllSelector:]( &OBJC_CLASS___MAAutoAssetControl,  "assetSelectorOrAllSelector:",  0LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    [*(id *)(a1 + 40) controlClientName];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) controlClientProcessName];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [*(id *)(a1 + 40) controlClientProcessID];
    +[MAAutoAssetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetControl, "frameworkInstanceUUID");
    __int128 v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v8,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  v9,  v10,  v11,  v7,  v12);

    [v4 setSafeObject:v13 forKey:@"instance"];
    [v4 setSafeObject:v3 forKey:@"control"];
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-CONTROL:SIM_CACHE_DELETE_DETERMINE_RECLAIMABLE" clientID:v6 version:0 message:v4];
    [*(id *)(a1 + 40) connectionClient];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __97__MAAutoAssetControl__simulateCacheDeleteDetermineReclaimableSpace_withUrgency_error_completion___block_invoke_2;
    void v17[3] = &unk_189FF94D8;
    id v16 = *(void **)(a1 + 48);
    v17[4] = *(void *)(a1 + 40);
    id v18 = v16;
    [v15 connectClientSendServerMessage:v14 proxyObject:0 withReply:v17];
  }

void __97__MAAutoAssetControl__simulateCacheDeleteDetermineReclaimableSpace_withUrgency_error_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (!v11 || v5)
  {
    if (v5)
    {
      uint64_t v8 = @"failure reported by server";
      uint64_t v9 = 0LL;
      id v10 = v5;
    }

    else
    {
      uint64_t v8 = @"no response message from server";
      uint64_t v9 = 6104LL;
      id v10 = 0LL;
    }

    [*(id *)(a1 + 32) _failedSimulateCacheDeleteOperation:@"simulateCacheDeleteDetermineReclaimableSpace" withErrorCode:v9 withResponseError:v10 description:v8 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v11 message];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 safeObjectForKey:@"control" ofClass:objc_opt_class()];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7) {
      objc_msgSend( *(id *)(a1 + 32),  "_successSimulateCacheDeleteOperation:withReclaimableSpace:completion:",  @"simulateCacheDeleteDetermineReclaimableSpace",  objc_msgSend(v7, "targetingPurgeAmount"),  *(void *)(a1 + 40));
    }
    else {
      [*(id *)(a1 + 32) _failedSimulateCacheDeleteOperation:@"simulateCacheDeleteDetermineReclaimableSpace" withErrorCode:6111 withResponseError:0 description:@"no control results information provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

+ (int64_t)simulateCacheDeleteReclaimSpace:(id)a3 withUrgency:(int)a4 targetingPurgeAmount:(int64_t)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a4;
  id v8 = a3;
  +[MAAutoAssetControl autoAssetControl](&OBJC_CLASS___MAAutoAssetControl, "autoAssetControl");
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v36 = 0LL;
  id v37 = &v36;
  uint64_t v38 = 0x2020000000LL;
  uint64_t v39 = 0LL;
  uint64_t v30 = 0LL;
  id v31 = (id *)&v30;
  uint64_t v32 = 0x3032000000LL;
  uint64_t v33 = __Block_byref_object_copy__6;
  uint64_t v34 = __Block_byref_object_dispose__6;
  id v35 = 0LL;
  v28[0] = 0LL;
  v28[1] = v28;
  v28[2] = 0x2020000000LL;
  char v29 = 0;
  v26[0] = 0LL;
  v26[1] = v26;
  v26[2] = 0x2020000000LL;
  char v27 = 0;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0LL);
  id v11 = v31;
  id obj = v31[5];
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = __93__MAAutoAssetControl_simulateCacheDeleteReclaimSpace_withUrgency_targetingPurgeAmount_error___block_invoke;
  void v19[3] = &unk_189FFB240;
  uint64_t v21 = v26;
  char v22 = &v36;
  uint64_t v23 = &v30;
  char v24 = v28;
  __int128 v12 = v8;
  id v13 = v10;
  char v20 = v13;
  [v9 _simulateCacheDeleteReclaimSpace:v8 withUrgency:v7 targetingPurgeAmount:a5 error:&obj completion:v19];
  objc_storeStrong(v11 + 5, obj);
  if (+[MAAutoAssetControl waitOnSemaphore:withTimeout:]( &OBJC_CLASS___MAAutoAssetControl,  "waitOnSemaphore:withTimeout:",  v13,  -2LL))
  {
    +[MAAutoAssetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetControl, "frameworkDispatchQueue");
    uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __93__MAAutoAssetControl_simulateCacheDeleteReclaimSpace_withUrgency_targetingPurgeAmount_error___block_invoke_3;
    block[3] = &unk_189FF94B0;
    void block[4] = v28;
    block[5] = v26;
    block[6] = &v30;
    dispatch_sync(v14, block);
  }

  if (a6) {
    *a6 = v31[5];
  }
  int64_t v15 = v37[3];

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  return v15;
}

void __93__MAAutoAssetControl_simulateCacheDeleteReclaimSpace_withUrgency_targetingPurgeAmount_error___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v5 = a3;
  +[MAAutoAssetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetControl, "frameworkDispatchQueue");
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)id v8 = *(_OWORD *)(a1 + 32);
  __int128 v12 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __93__MAAutoAssetControl_simulateCacheDeleteReclaimSpace_withUrgency_targetingPurgeAmount_error___block_invoke_2;
  block[3] = &unk_189FFB218;
  id v10 = v5;
  uint64_t v13 = *(void *)(a1 + 64);
  uint64_t v14 = a2;
  id v7 = v8[0];
  __int128 v11 = *(_OWORD *)v8;
  v8[0] = v5;
  dispatch_sync(v6, block);
}

uint64_t __93__MAAutoAssetControl_simulateCacheDeleteReclaimSpace_withUrgency_targetingPurgeAmount_error___block_invoke_2( uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 48) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    *(void *)(*(void *)(*(void *)(result + 56) + 8LL) + 24LL) = *(void *)(result + 80);
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 64) + 8LL) + 40LL), *(id *)(result + 32));
    *(_BYTE *)(*(void *)(*(void *)(v1 + 72) + 8LL) + 24LL) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 40));
  }

  return result;
}

void __93__MAAutoAssetControl_simulateCacheDeleteReclaimSpace_withUrgency_targetingPurgeAmount_error___block_invoke_3( void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto-control(simulateCacheDeleteReclaimSpace)",  0LL,  @"timeout (at framework layer) while waiting for simulated-cache-delete-operation to complete");
    uint64_t v3 = *(void *)(a1[6] + 8LL);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }

- (void)_simulateCacheDeleteReclaimSpace:(id)a3 withUrgency:(int)a4 targetingPurgeAmount:(int64_t)a5 error:(id *)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a7;
  if (v12)
  {
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __105__MAAutoAssetControl__simulateCacheDeleteReclaimSpace_withUrgency_targetingPurgeAmount_error_completion___block_invoke;
    v15[3] = &unk_189FFB290;
    int v20 = a4;
    int64_t v19 = a5;
    id v16 = (os_log_s *)v11;
    int v17 = self;
    id v18 = v12;
    -[MAAutoAssetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v15);

    uint64_t v13 = v16;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 oslog];
    uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _simulateCacheDeleteReclaimSpace:withUrgency:targetingPurgeAmount:error:completion:].cold.1();
    }
  }
}

void __105__MAAutoAssetControl__simulateCacheDeleteReclaimSpace_withUrgency_targetingPurgeAmount_error_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 40) _failedSimulateCacheDeleteOperation:@"simulateCacheDeleteReclaimSpace" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 48)];
  }

  else
  {
    uint64_t v3 = -[MAAutoAssetInfoControl initWithVolumeToReclaim:withUrgency:targetingPurgeAmount:]( objc_alloc(&OBJC_CLASS___MAAutoAssetInfoControl),  "initWithVolumeToReclaim:withUrgency:targetingPurgeAmount:",  *(void *)(a1 + 32),  *(unsigned int *)(a1 + 64),  *(void *)(a1 + 56));
    id v4 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAssetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetControl, "frameworkInstanceUUID");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 UUIDString];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

    +[MAAutoAssetControl assetSelectorOrAllSelector:]( &OBJC_CLASS___MAAutoAssetControl,  "assetSelectorOrAllSelector:",  0LL);
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    [*(id *)(a1 + 40) controlClientName];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) controlClientProcessName];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [*(id *)(a1 + 40) controlClientProcessID];
    +[MAAutoAssetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetControl, "frameworkInstanceUUID");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v8,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  v9,  v10,  v11,  v7,  v12);

    [v4 setSafeObject:v13 forKey:@"instance"];
    [v4 setSafeObject:v3 forKey:@"control"];
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-CONTROL:SIM_CACHE_DELETE_RECLAIM_SPACE" clientID:v6 version:0 message:v4];
    [*(id *)(a1 + 40) connectionClient];
    int64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __105__MAAutoAssetControl__simulateCacheDeleteReclaimSpace_withUrgency_targetingPurgeAmount_error_completion___block_invoke_2;
    void v17[3] = &unk_189FF94D8;
    id v16 = *(void **)(a1 + 48);
    v17[4] = *(void *)(a1 + 40);
    id v18 = v16;
    [v15 connectClientSendServerMessage:v14 proxyObject:0 withReply:v17];
  }

void __105__MAAutoAssetControl__simulateCacheDeleteReclaimSpace_withUrgency_targetingPurgeAmount_error_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (!v11 || v5)
  {
    if (v5)
    {
      id v8 = @"failure reported by server";
      uint64_t v9 = 0LL;
      id v10 = v5;
    }

    else
    {
      id v8 = @"no response message from server";
      uint64_t v9 = 6104LL;
      id v10 = 0LL;
    }

    [*(id *)(a1 + 32) _failedSimulateCacheDeleteOperation:@"simulateCacheDeleteReclaimSpace" withErrorCode:v9 withResponseError:v10 description:v8 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v11 message];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 safeObjectForKey:@"control" ofClass:objc_opt_class()];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7) {
      objc_msgSend( *(id *)(a1 + 32),  "_successSimulateCacheDeleteOperation:withReclaimableSpace:completion:",  @"simulateCacheDeleteReclaimSpace",  objc_msgSend(v7, "targetingPurgeAmount"),  *(void *)(a1 + 40));
    }
    else {
      [*(id *)(a1 + 32) _failedSimulateCacheDeleteOperation:@"simulateCacheDeleteReclaimSpace" withErrorCode:6111 withResponseError:0 description:@"no control results information provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

+ (id)simulateSetJobOperation:(int64_t)a3 withEndEvent:(int64_t)a4 forSelector:(id)a5
{
  id v7 = a5;
  +[MAAutoAssetControl autoAssetControl](&OBJC_CLASS___MAAutoAssetControl, "autoAssetControl");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v25 = 0LL;
  char v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  id v28 = __Block_byref_object_copy__6;
  char v29 = __Block_byref_object_dispose__6;
  id v30 = 0LL;
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x2020000000LL;
  char v24 = 0;
  v21[0] = 0LL;
  v21[1] = v21;
  v21[2] = 0x2020000000LL;
  char v22 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
  uint64_t v10 = MEMORY[0x1895F87A8];
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __71__MAAutoAssetControl_simulateSetJobOperation_withEndEvent_forSelector___block_invoke;
  v16[3] = &unk_189FFB100;
  id v18 = v21;
  int64_t v19 = &v25;
  int v20 = v23;
  id v11 = v9;
  int v17 = v11;
  [v8 _simulateSetJobOperation:a3 withEndEvent:a4 forSelector:v7 completion:v16];
  if (+[MAAutoAssetControl waitOnSemaphore:withTimeout:]( &OBJC_CLASS___MAAutoAssetControl,  "waitOnSemaphore:withTimeout:",  v11,  -2LL))
  {
    +[MAAutoAssetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetControl, "frameworkDispatchQueue");
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v10;
    block[1] = 3221225472LL;
    block[2] = __71__MAAutoAssetControl_simulateSetJobOperation_withEndEvent_forSelector___block_invoke_3;
    block[3] = &unk_189FF94B0;
    void block[4] = v23;
    block[5] = v21;
    block[6] = &v25;
    dispatch_sync(v12, block);
  }

  id v13 = (id)v26[5];

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);

  return v13;
}

void __71__MAAutoAssetControl_simulateSetJobOperation_withEndEvent_forSelector___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  +[MAAutoAssetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetControl, "frameworkDispatchQueue");
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)uint64_t v6 = *(_OWORD *)(a1 + 32);
  __int128 v10 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __71__MAAutoAssetControl_simulateSetJobOperation_withEndEvent_forSelector___block_invoke_2;
  block[3] = &unk_189FFAEA8;
  id v8 = v3;
  id v5 = v6[0];
  __int128 v9 = *(_OWORD *)v6;
  v6[0] = v3;
  dispatch_sync(v4, block);
}

uint64_t __71__MAAutoAssetControl_simulateSetJobOperation_withEndEvent_forSelector___block_invoke_2( uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 48) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 56) + 8LL) + 40LL), *(id *)(result + 32));
    *(_BYTE *)(*(void *)(*(void *)(v1 + 64) + 8LL) + 24LL) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 40));
  }

  return result;
}

void __71__MAAutoAssetControl_simulateSetJobOperation_withEndEvent_forSelector___block_invoke_3(void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto-control(simulateSetJobOperation)",  0LL,  @"timeout (at framework layer) while waiting for simulate-job-operation to complete");
    uint64_t v3 = *(void *)(a1[6] + 8LL);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }

- (void)_simulateSetJobOperation:(int64_t)a3 withEndEvent:(int64_t)a4 forSelector:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  if (v11)
  {
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __83__MAAutoAssetControl__simulateSetJobOperation_withEndEvent_forSelector_completion___block_invoke;
    v14[3] = &unk_189FFB2B8;
    void v14[4] = self;
    id v15 = v10;
    int64_t v17 = a3;
    int64_t v18 = a4;
    id v16 = v11;
    -[MAAutoAssetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v14);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 oslog];
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _simulateSetJobOperation:withEndEvent:forSelector:completion:].cold.1();
    }
  }
}

void __83__MAAutoAssetControl__simulateSetJobOperation_withEndEvent_forSelector_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _failedControl:@"simulateSetJobOperation" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 48)];
  }

  else
  {
    uint64_t v3 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    [*(id *)(a1 + 32) controlClientName];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) controlClientProcessName];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [*(id *)(a1 + 32) controlClientProcessID];
    uint64_t v7 = *(void *)(a1 + 40);
    +[MAAutoAssetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetControl, "frameworkInstanceUUID");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v3,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  v4,  v5,  v6,  v7,  v8);

    id v10 = -[MAAutoAssetInfoControl initForSimulateOperation:withSimulateEnd:]( objc_alloc(&OBJC_CLASS___MAAutoAssetInfoControl),  "initForSimulateOperation:withSimulateEnd:",  *(void *)(a1 + 56),  *(void *)(a1 + 64));
    id v11 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAssetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetControl, "frameworkInstanceUUID");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 UUIDString];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();

    [v11 setSafeObject:v9 forKey:@"instance"];
    [v11 setSafeObject:v10 forKey:@"control"];
    uint64_t v14 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-CONTROL:SIM_SET_JOB_OPERATION" clientID:v13 version:0 message:v11];
    [*(id *)(a1 + 32) connectionClient];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __83__MAAutoAssetControl__simulateSetJobOperation_withEndEvent_forSelector_completion___block_invoke_2;
    v16[3] = &unk_189FF94D8;
    void v16[4] = *(void *)(a1 + 32);
    id v17 = *(id *)(a1 + 48);
    [v15 connectClientSendServerMessage:v14 proxyObject:0 withReply:v16];
  }

void __83__MAAutoAssetControl__simulateSetJobOperation_withEndEvent_forSelector_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  if (!v10 || v5)
  {
    if (v5)
    {
      uint64_t v7 = @"failure reported by server";
      uint64_t v8 = 0LL;
      id v9 = v5;
    }

    else
    {
      uint64_t v7 = @"no response message from server";
      uint64_t v8 = 6104LL;
      id v9 = 0LL;
    }

    [v6 _failedControl:@"simulateSetJobOperation" withErrorCode:v8 withResponseError:v9 description:v7 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v6 _successControl:@"simulateSetJobOperation" completion:*(void *)(a1 + 40)];
  }
}

+ (id)defaultDispatchQueue
{
  if (defaultDispatchQueue_defaultQueueOnce_2 != -1) {
    dispatch_once(&defaultDispatchQueue_defaultQueueOnce_2, &__block_literal_global_10);
  }
  return (id)defaultDispatchQueue_defaultQueue_2;
}

void __42__MAAutoAssetControl_defaultDispatchQueue__block_invoke()
{
  v0 = (const char *)[@"com.apple.MobileAsset.autoassetcontrol.client" UTF8String];
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v1 = dispatch_queue_create(v0, v3);
  uint64_t v2 = (void *)defaultDispatchQueue_defaultQueue_2;
  defaultDispatchQueue_defaultQueue_2 = (uint64_t)v1;
}

+ (id)autoAssetControl
{
  if (autoAssetControl_dispatchOnceAutoAssetControl != -1) {
    dispatch_once(&autoAssetControl_dispatchOnceAutoAssetControl, &__block_literal_global_340);
  }
  return (id)autoAssetControl___autoAssetControl;
}

void __38__MAAutoAssetControl_autoAssetControl__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___MAAutoAssetControl);
  dispatch_queue_t v1 = (void *)autoAssetControl___autoAssetControl;
  autoAssetControl___autoAssetControl = (uint64_t)v0;
}

- (void)connectToServerFrameworkCompletion:(id)a3
{
  uint64_t v39 = (void (**)(id, void))a3;
  -[MAAutoAssetControl connectionClient](self, "connectionClient");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v39[2](v39, 0LL);
  }

  else
  {
    +[MAAutoAssetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetControl, "frameworkInstanceUUID");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 UUIDString];
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v36 = (void *)MEMORY[0x189604010];
    uint64_t v35 = objc_opt_class();
    uint64_t v34 = objc_opt_class();
    uint64_t v33 = objc_opt_class();
    uint64_t v32 = objc_opt_class();
    uint64_t v31 = objc_opt_class();
    uint64_t v30 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    uint64_t v27 = objc_opt_class();
    uint64_t v26 = objc_opt_class();
    uint64_t v25 = objc_opt_class();
    uint64_t v24 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    id v37 = self;
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    objc_msgSend( v36,  "setWithObjects:",  v35,  v34,  v33,  v32,  v31,  v30,  v29,  v28,  v27,  v26,  v25,  v24,  v23,  v22,  v21,  v20,  v19,  v6,  v7,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  v15,  objc_opt_class(),  0);
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL:CONTROL_STATISTICS"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL:KNOWN_ASSET_SUMMARY"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL:AVAILABLE_FOR_STAGING_ASSET_SUMMARY"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL:LOCKED_ASSET_SUMMARY"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL:STAGED_ASSET_SUMMARY"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL:ACTIVE_JOB_SUMMARY"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL:SCHEDULED_JOB_SUMMARY"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL:FORCE_GLOBAL_UNLOCK"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL:FORCE_GLOBAL_FORGET"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL:FORCE_GLOBAL_PURGE"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL:FORCE_GLOBAL_ABANDON"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL:SIM_CACHE_DELETE_DETERMINE_RECLAIMABLE"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL:SIM_CACHE_DELETE_RECLAIM_SPACE"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL:SIM_SET_JOB_OPERATION"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET:ALTER_ENTRIES_REPRESENTING_ATOMIC"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET:NEED_FOR_ATOMIC"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET:CHECK_ATOMIC"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET:LOCK_ATOMIC"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET:MAP_LOCKED_ATOMIC_ENTRY"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET:FORM_SUB_ATOMIC"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET:CONTINUE_ATOMIC_LOCK"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET:END_ATOMIC_LOCK"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET:END_ATOMIC_LOCKS_FOR_CLIENT"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET:ASSET_SET_FOR_STAGING"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET:CURRENT_SET_STATUS"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET:ELIMINATE_ATOMIC"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL(REPLY):CONTROL_STATISTICS"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL(REPLY):KNOWN_ASSET_SUMMARY"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL(REPLY):AVAILABLE_FOR_STAGING_ASSET_SUMMARY"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL(REPLY):LOCKED_ASSET_SUMMARY"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL(REPLY):STAGED_ASSET_SUMMARY"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL(REPLY):ACTIVE_JOB_SUMMARY"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL(REPLY):SCHEDULED_JOB_SUMMARY"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL(REPLY):FORCE_GLOBAL_UNLOCK"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL(REPLY):FORCE_GLOBAL_FORGET"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL(REPLY):FORCE_GLOBAL_PURGE"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL(REPLY):FORCE_GLOBAL_ABANDON"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL(REPLY):SIM_CACHE_DELETE_DETERMINE_RECLAIMABLE"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL(REPLY):SIM_CACHE_DELETE_RECLAIM_SPACE"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-CONTROL(REPLY):SIM_SET_JOB_OPERATION"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET-CONTROL:KNOWN_ASSET_SET_SUMMARY"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET-CONTROL:ACTIVE_SET_JOB_SUMMARY"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET-CONTROL:SCHEDULED_SET_JOB_SUMMARY"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET-CONTROL:LOCKED_ASSET_SET_SUMMARY"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET-CONTROL:STAGED_ASSET_SET_SUMMARY"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET(REPLY):ALTER_ENTRIES_REPRESENTING_ATOMIC"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET(REPLY):NEED_FOR_ATOMIC"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET(REPLY):CHECK_ATOMIC"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET(REPLY):LOCK_ATOMIC"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET(REPLY):MAP_LOCKED_ATOMIC_ENTRY"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET(REPLY):FORM_SUB_ATOMIC"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET(REPLY):CONTINUE_ATOMIC_LOCK"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET(REPLY):END_ATOMIC_LOCK"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET(REPLY):END_ATOMIC_LOCKS_FOR_CLIENT"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET(REPLY):ASSET_SET_FOR_STAGING"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET(REPLY):CURRENT_SET_STATUS"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET(REPLY):ELIMINATE_ATOMIC"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET-CONTROL(REPLY):ACTIVE_SET_JOB_SUMMARY"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET-CONTROL(REPLY):SCHEDULED_SET_JOB_SUMMARY"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET-CONTROL(REPLY):LOCKED_ASSET_SET_SUMMARY"];
    [MEMORY[0x189612748] setAllowlistedClasses:v16 forKey:@"MA-AUTO-SET-CONTROL(REPLY):STAGED_ASSET_SET_SUMMARY"];
    id v17 = (void *)[objc_alloc(MEMORY[0x189612748]) initForServiceName:@"com.apple.mobileasset.autoasset" delegate:v37 clientID:v38];
    int64_t v18 = (void *)[objc_alloc(MEMORY[0x189612740]) initWithClientPolicy:v17];
    -[MAAutoAssetControl setConnectionClient:](v37, "setConnectionClient:", v18);

    v39[2](v39, 0LL);
  }
}

+ (id)assetSelectorOrAllSelector:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3) {
    id v4 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:]( objc_alloc(&OBJC_CLASS___MAAutoAssetSelector),  "initForAssetType:withAssetSpecifier:",  @"MAAutoAssetControl-all-asset-types",  @"MAAutoAssetControl-all-asset-specifiers");
  }

  return v4;
}

- (void)_successControlStatistics:(id)a3 withControlStatistics:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    -[MAAutoAssetControl completionDispatchQueue](self, "completionDispatchQueue");
    uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __81__MAAutoAssetControl__successControlStatistics_withControlStatistics_completion___block_invoke;
    block[3] = &unk_189FF9650;
    uint64_t v15 = (os_log_s *)v8;
    id v17 = v10;
    id v16 = v9;
    dispatch_async(v11, block);

    uint64_t v12 = v15;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 oslog];
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _successControlStatistics:withControlStatistics:completion:].cold.1();
    }
  }
}

uint64_t __81__MAAutoAssetControl__successControlStatistics_withControlStatistics_completion___block_invoke( uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v4;
    _os_log_impl( &dword_18718F000,  v3,  OS_LOG_TYPE_DEFAULT,  "MA-auto-control{_successControlStatistics} | %{public}@ | SUCCESS",  (uint8_t *)&v6,  0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

- (void)_failedControlStatistics:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v15)
  {
    -[MAAutoAssetControl completionDispatchQueue](self, "completionDispatchQueue");
    id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __102__MAAutoAssetControl__failedControlStatistics_withErrorCode_withResponseError_description_completion___block_invoke;
    block[3] = &unk_189FF9628;
    id v24 = v13;
    int64_t v28 = a4;
    id v25 = v12;
    id v26 = v14;
    id v27 = v15;
    dispatch_async(v16, block);

    id v17 = v24;
  }

  else
  {
    id v18 = objc_alloc(NSString);
    if (v13)
    {
      [v13 checkedSummary];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = [v18 initWithFormat:@"%@ | error:%@", v14, v19];
    }

    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:]( &OBJC_CLASS___MAAutoAssetError,  "summaryForCode:fromOperation:",  a4,  v12);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = [v18 initWithFormat:@"%@ | result:%@", v14, v19];
    }

    id v17 = (void *)v20;

    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 oslog];
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _failedControlStatistics:withErrorCode:withResponseError:description:completion:].cold.1();
    }
  }
}

void __102__MAAutoAssetControl__failedControlStatistics_withErrorCode_withResponseError_description_completion___block_invoke( uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (!v2)
  {
    uint64_t v3 = *(void *)(a1 + 64);
    if (v3)
    {
      +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v3,  *(void *)(a1 + 40),  0LL,  *(void *)(a1 + 48));
      id v2 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v2 = 0LL;
    }
  }

  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 oslog];
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __102__MAAutoAssetControl__failedControlStatistics_withErrorCode_withResponseError_description_completion___block_invoke_cold_1( a1,  (uint64_t)v2,  v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

- (void)_successControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    -[MAAutoAssetControl completionDispatchQueue](self, "completionDispatchQueue");
    uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __49__MAAutoAssetControl__successControl_completion___block_invoke;
    v11[3] = &unk_189FF9600;
    id v12 = (os_log_s *)v6;
    id v13 = v7;
    dispatch_async(v8, v11);

    id v9 = v12;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _successControl:completion:].cold.1();
    }
  }
}

uint64_t __49__MAAutoAssetControl__successControl_completion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896127A0] sharedLogger];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v4;
    _os_log_impl( &dword_18718F000,  v3,  OS_LOG_TYPE_DEFAULT,  "MA-auto-control{_successControl} | %{public}@ | SUCCESS",  (uint8_t *)&v6,  0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)_failedControl:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v15)
  {
    -[MAAutoAssetControl completionDispatchQueue](self, "completionDispatchQueue");
    id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __92__MAAutoAssetControl__failedControl_withErrorCode_withResponseError_description_completion___block_invoke;
    block[3] = &unk_189FF9628;
    id v24 = v13;
    int64_t v28 = a4;
    id v25 = v12;
    id v26 = v14;
    id v27 = v15;
    dispatch_async(v16, block);

    id v17 = v24;
  }

  else
  {
    id v18 = objc_alloc(NSString);
    if (v13)
    {
      [v13 checkedSummary];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = [v18 initWithFormat:@"%@ | error:%@", v14, v19];
    }

    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:]( &OBJC_CLASS___MAAutoAssetError,  "summaryForCode:fromOperation:",  a4,  v12);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = [v18 initWithFormat:@"%@ | result:%@", v14, v19];
    }

    id v17 = (void *)v20;

    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 oslog];
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _failedControl:withErrorCode:withResponseError:description:completion:].cold.1();
    }
  }
}

void __92__MAAutoAssetControl__failedControl_withErrorCode_withResponseError_description_completion___block_invoke( uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (!v2)
  {
    uint64_t v3 = *(void *)(a1 + 64);
    if (v3)
    {
      +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v3,  *(void *)(a1 + 40),  0LL,  *(void *)(a1 + 48));
      id v2 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v2 = 0LL;
    }
  }

  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 oslog];
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __92__MAAutoAssetControl__failedControl_withErrorCode_withResponseError_description_completion___block_invoke_cold_1( a1,  (uint64_t)v2,  v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

- (void)_successControlSummary:(id)a3 withJobSummaryEntries:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    -[MAAutoAssetControl completionDispatchQueue](self, "completionDispatchQueue");
    uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __78__MAAutoAssetControl__successControlSummary_withJobSummaryEntries_completion___block_invoke;
    block[3] = &unk_189FF9650;
    id v15 = (os_log_s *)v8;
    id v17 = v10;
    id v16 = v9;
    dispatch_async(v11, block);

    id v12 = v15;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 oslog];
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _successControlSummary:withJobSummaryEntries:completion:].cold.1();
    }
  }
}

uint64_t __78__MAAutoAssetControl__successControlSummary_withJobSummaryEntries_completion___block_invoke( uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896127A0] sharedLogger];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v4;
    _os_log_impl( &dword_18718F000,  v3,  OS_LOG_TYPE_DEFAULT,  "MA-auto-control{_successControlSummary} | %{public}@ | SUCCESS",  (uint8_t *)&v6,  0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

- (void)_failedControlSummary:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v15)
  {
    -[MAAutoAssetControl completionDispatchQueue](self, "completionDispatchQueue");
    id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __99__MAAutoAssetControl__failedControlSummary_withErrorCode_withResponseError_description_completion___block_invoke;
    block[3] = &unk_189FF9628;
    id v24 = v13;
    int64_t v28 = a4;
    id v25 = v12;
    id v26 = v14;
    id v27 = v15;
    dispatch_async(v16, block);

    id v17 = v24;
  }

  else
  {
    id v18 = objc_alloc(NSString);
    if (v13)
    {
      [v13 checkedSummary];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = [v18 initWithFormat:@"%@ | error:%@", v14, v19];
    }

    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:]( &OBJC_CLASS___MAAutoAssetError,  "summaryForCode:fromOperation:",  a4,  v12);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = [v18 initWithFormat:@"%@ | result:%@", v14, v19];
    }

    id v17 = (void *)v20;

    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 oslog];
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _failedControlSummary:withErrorCode:withResponseError:description:completion:].cold.1();
    }
  }
}

void __99__MAAutoAssetControl__failedControlSummary_withErrorCode_withResponseError_description_completion___block_invoke( uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (!v2)
  {
    uint64_t v3 = *(void *)(a1 + 64);
    if (v3)
    {
      +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v3,  *(void *)(a1 + 40),  0LL,  *(void *)(a1 + 48));
      id v2 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v2 = 0LL;
    }
  }

  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 oslog];
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __99__MAAutoAssetControl__failedControlSummary_withErrorCode_withResponseError_description_completion___block_invoke_cold_1( a1,  (uint64_t)v2,  v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

- (void)_successControlLockSummary:(id)a3 withLockSummaryEntries:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    -[MAAutoAssetControl completionDispatchQueue](self, "completionDispatchQueue");
    uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __83__MAAutoAssetControl__successControlLockSummary_withLockSummaryEntries_completion___block_invoke;
    block[3] = &unk_189FF9650;
    id v15 = (os_log_s *)v8;
    id v17 = v10;
    id v16 = v9;
    dispatch_async(v11, block);

    id v12 = v15;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 oslog];
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _successControlLockSummary:withLockSummaryEntries:completion:].cold.1();
    }
  }
}

uint64_t __83__MAAutoAssetControl__successControlLockSummary_withLockSummaryEntries_completion___block_invoke( uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896127A0] sharedLogger];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v4;
    _os_log_impl( &dword_18718F000,  v3,  OS_LOG_TYPE_DEFAULT,  "MA-auto-control{_successControlLockSummary} | %{public}@ | SUCCESS",  (uint8_t *)&v6,  0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

- (void)_failedControlLockSummary:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v15)
  {
    -[MAAutoAssetControl completionDispatchQueue](self, "completionDispatchQueue");
    id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __103__MAAutoAssetControl__failedControlLockSummary_withErrorCode_withResponseError_description_completion___block_invoke;
    block[3] = &unk_189FF9628;
    id v24 = v13;
    int64_t v28 = a4;
    id v25 = v12;
    id v26 = v14;
    id v27 = v15;
    dispatch_async(v16, block);

    id v17 = v24;
  }

  else
  {
    id v18 = objc_alloc(NSString);
    if (v13)
    {
      [v13 checkedSummary];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = [v18 initWithFormat:@"%@ | error:%@", v14, v19];
    }

    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:]( &OBJC_CLASS___MAAutoAssetError,  "summaryForCode:fromOperation:",  a4,  v12);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = [v18 initWithFormat:@"%@ | result:%@", v14, v19];
    }

    id v17 = (void *)v20;

    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 oslog];
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _failedControlLockSummary:withErrorCode:withResponseError:description:completion:].cold.1();
    }
  }
}

void __103__MAAutoAssetControl__failedControlLockSummary_withErrorCode_withResponseError_description_completion___block_invoke( uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (!v2)
  {
    uint64_t v3 = *(void *)(a1 + 64);
    if (v3)
    {
      +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v3,  *(void *)(a1 + 40),  0LL,  *(void *)(a1 + 48));
      id v2 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v2 = 0LL;
    }
  }

  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 oslog];
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __103__MAAutoAssetControl__failedControlLockSummary_withErrorCode_withResponseError_description_completion___block_invoke_cold_1( a1,  (uint64_t)v2,  v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

- (void)_successSimulateCacheDeleteOperation:(id)a3 withReclaimableSpace:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    -[MAAutoAssetControl completionDispatchQueue](self, "completionDispatchQueue");
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __91__MAAutoAssetControl__successSimulateCacheDeleteOperation_withReclaimableSpace_completion___block_invoke;
    block[3] = &unk_189FFB320;
    id v14 = (os_log_s *)v8;
    id v15 = v9;
    int64_t v16 = a4;
    dispatch_async(v10, block);

    uint64_t v11 = v14;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 oslog];
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _successSimulateCacheDeleteOperation:withReclaimableSpace:completion:].cold.1();
    }
  }
}

uint64_t __91__MAAutoAssetControl__successSimulateCacheDeleteOperation_withReclaimableSpace_completion___block_invoke( uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896127A0] sharedLogger];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138543362;
    uint64_t v7 = v4;
    _os_log_impl( &dword_18718F000,  v3,  OS_LOG_TYPE_DEFAULT,  "MA-auto-control{_successSimulateCacheDeleteOperation} | %{public}@ | SUCCESS",  (uint8_t *)&v6,  0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)_failedSimulateCacheDeleteOperation:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v15)
  {
    -[MAAutoAssetControl completionDispatchQueue](self, "completionDispatchQueue");
    int64_t v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __113__MAAutoAssetControl__failedSimulateCacheDeleteOperation_withErrorCode_withResponseError_description_completion___block_invoke;
    block[3] = &unk_189FF9628;
    id v24 = v13;
    int64_t v28 = a4;
    id v25 = v12;
    id v26 = v14;
    id v27 = v15;
    dispatch_async(v16, block);

    id v17 = v24;
  }

  else
  {
    id v18 = objc_alloc(NSString);
    if (v13)
    {
      [v13 checkedSummary];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = [v18 initWithFormat:@"%@ | error:%@", v14, v19];
    }

    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:]( &OBJC_CLASS___MAAutoAssetError,  "summaryForCode:fromOperation:",  a4,  v12);
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = [v18 initWithFormat:@"%@ | result:%@", v14, v19];
    }

    id v17 = (void *)v20;

    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 oslog];
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetControl _failedSimulateCacheDeleteOperation:withErrorCode:withResponseError:description:completion:].cold.1();
    }
  }
}

void __113__MAAutoAssetControl__failedSimulateCacheDeleteOperation_withErrorCode_withResponseError_description_completion___block_invoke( uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (!v2)
  {
    uint64_t v3 = *(void *)(a1 + 64);
    if (v3)
    {
      +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v3,  *(void *)(a1 + 40),  0LL,  *(void *)(a1 + 48));
      id v2 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v2 = 0LL;
    }
  }

  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 oslog];
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    __113__MAAutoAssetControl__failedSimulateCacheDeleteOperation_withErrorCode_withResponseError_description_completion___block_invoke_cold_1( a1,  (uint64_t)v2,  v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

+ (id)pushNotificationHistory:(BOOL)a3 error:(id *)a4
{
  return +[MAAutoAssetPushNotificationHistory sharedInstance]( &OBJC_CLASS___MAAutoAssetPushNotificationHistory,  "sharedInstance",  a3,  a4);
}

+ (void)frameworkInstanceSetLogDomain
{
  if (frameworkInstanceSetLogDomain_frameworkLogDomainOnce_1 != -1) {
    dispatch_once(&frameworkInstanceSetLogDomain_frameworkLogDomainOnce_1, &__block_literal_global_474);
  }
}

void __51__MAAutoAssetControl_frameworkInstanceSetLogDomain__block_invoke()
{
  id v1 = (id)[objc_alloc(NSString) initWithFormat:@"%@.%s", @"com.apple.MAAutoControlClient", getprogname()];
  [MEMORY[0x189612760] sharedCore];
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 useDomain:v1];
}

+ (id)frameworkDispatchQueue
{
  if (frameworkDispatchQueue_frameworkQueueOnce_1 != -1) {
    dispatch_once(&frameworkDispatchQueue_frameworkQueueOnce_1, &__block_literal_global_478);
  }
  return (id)frameworkDispatchQueue_frameworkQueue_1;
}

void __44__MAAutoAssetControl_frameworkDispatchQueue__block_invoke()
{
  v0 = (const char *)[@"com.apple.MobileAsset.autoassetcontrol.framework" UTF8String];
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v1 = dispatch_queue_create(v0, v3);
  id v2 = (void *)frameworkDispatchQueue_frameworkQueue_1;
  frameworkDispatchQueue_frameworkQueue_1 = (uint64_t)v1;
}

+ (id)frameworkInstanceUUID
{
  if (frameworkInstanceUUID_frameworkUUIDOnce_1 != -1) {
    dispatch_once(&frameworkInstanceUUID_frameworkUUIDOnce_1, &__block_literal_global_479);
  }
  return (id)frameworkInstanceUUID_frameworkUUID_1;
}

void __43__MAAutoAssetControl_frameworkInstanceUUID__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x189607AB8]);
  dispatch_queue_t v1 = (void *)frameworkInstanceUUID_frameworkUUID_1;
  frameworkInstanceUUID_frameworkUUID_1 = (uint64_t)v0;
}

+ (int64_t)waitOnSemaphore:(id)a3 withTimeout:(int64_t)a4
{
  return dispatch_semaphore_wait((dispatch_semaphore_t)a3, 0xFFFFFFFFFFFFFFFFLL);
}

- (NSString)controlClientName
{
  return self->_controlClientName;
}

- (NSString)controlClientProcessName
{
  return self->_controlClientProcessName;
}

- (int64_t)controlClientProcessID
{
  return self->_controlClientProcessID;
}

- (OS_dispatch_queue)completionDispatchQueue
{
  return self->_completionDispatchQueue;
}

- (SUCoreConnectClient)connectionClient
{
  return self->_connectionClient;
}

- (void)setConnectionClient:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_controlStatistics:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto-control{controlStatistics} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)_availableForStagingAssetSummary:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto-control{availableForStagingAssetSummary} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)_knownAssetSummary:limitedToAssetTypes:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto-control{knownAssetSummary} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)_lockedAssetSummary:limitedToAssetTypes:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto-control{lockedAssetSummary} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)_stagedAssetSummary:limitedToAssetTypes:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto-control{stagedAssetSummary} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)_activeJobSummary:limitedToAssetTypes:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto-control{activeJobSummary} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)_scheduledJobSummary:limitedToAssetTypes:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto-control{scheduledJobSummary} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)_forceGlobalUnlock:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto-control{forceGlobalUnlock} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)_forceGlobalForget:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto-control{forceGlobalForget} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)_forceGlobalPurge:forcingUnlock:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto-control{forceGlobalPurge} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)_forceGlobalAbandon:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto-control{forceGlobalAbandon} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)_simulateCacheDeleteDetermineReclaimableSpace:withUrgency:error:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto-control{simulateCacheDeleteDetermineReclaimableSpace} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)_simulateCacheDeleteReclaimSpace:withUrgency:targetingPurgeAmount:error:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto-control{simulateCacheDeleteReclaimSpace} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)_simulateSetJobOperation:withEndEvent:forSelector:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto-control{simulateSetJobOperation} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)_successControlStatistics:withControlStatistics:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1( &dword_18718F000,  v0,  v1,  "MA-auto-control{_successControlStatistics} | %{public}@ | no client completion block",  v2);
  OUTLINED_FUNCTION_8();
}

- (void)_failedControlStatistics:withErrorCode:withResponseError:description:completion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2( &dword_18718F000,  v0,  (uint64_t)v0,  "MA-auto-control{_failedControlStatistics} | %{public}@ | no client completion block | %{public}@",  v1);
  OUTLINED_FUNCTION_8();
}

void __102__MAAutoAssetControl__failedControlStatistics_withErrorCode_withResponseError_description_completion___block_invoke_cold_1( uint64_t a1,  uint64_t a2,  os_log_s *a3)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2( &dword_18718F000,  a3,  v5,  "MA-auto-control{_failedControlStatistics} | %{public}@ | error:%{public}@",  v6);

  OUTLINED_FUNCTION_6();
}

- (void)_successControl:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1( &dword_18718F000,  v0,  v1,  "MA-auto-control{_successControl} | %{public}@ | no client completion block",  v2);
  OUTLINED_FUNCTION_8();
}

- (void)_failedControl:withErrorCode:withResponseError:description:completion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2( &dword_18718F000,  v0,  (uint64_t)v0,  "MA-auto-control{_failedControl} | %{public}@ | no client completion block | %{public}@",  v1);
  OUTLINED_FUNCTION_8();
}

void __92__MAAutoAssetControl__failedControl_withErrorCode_withResponseError_description_completion___block_invoke_cold_1( uint64_t a1,  uint64_t a2,  os_log_s *a3)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_18718F000, a3, v5, "MA-auto-control{_failedControl} | %{public}@ | error:%{public}@", v6);

  OUTLINED_FUNCTION_6();
}

- (void)_successControlSummary:withJobSummaryEntries:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1( &dword_18718F000,  v0,  v1,  "MA-auto-control{_successControlSummary} | %{public}@ | no client completion block",  v2);
  OUTLINED_FUNCTION_8();
}

- (void)_failedControlSummary:withErrorCode:withResponseError:description:completion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2( &dword_18718F000,  v0,  (uint64_t)v0,  "MA-auto-control{_failedControlSummary} | %{public}@ | no client completion block | %{public}@",  v1);
  OUTLINED_FUNCTION_8();
}

void __99__MAAutoAssetControl__failedControlSummary_withErrorCode_withResponseError_description_completion___block_invoke_cold_1( uint64_t a1,  uint64_t a2,  os_log_s *a3)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2( &dword_18718F000,  a3,  v5,  "MA-auto-control{_failedControlSummary} | %{public}@ | error:%{public}@",  v6);

  OUTLINED_FUNCTION_6();
}

- (void)_successControlLockSummary:withLockSummaryEntries:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1( &dword_18718F000,  v0,  v1,  "MA-auto-control{_successControlLockSummary} | %{public}@ | no client completion block",  v2);
  OUTLINED_FUNCTION_8();
}

- (void)_failedControlLockSummary:withErrorCode:withResponseError:description:completion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2( &dword_18718F000,  v0,  (uint64_t)v0,  "MA-auto-control{_failedControlLockSummary} | %{public}@ | no client completion block | %{public}@",  v1);
  OUTLINED_FUNCTION_8();
}

void __103__MAAutoAssetControl__failedControlLockSummary_withErrorCode_withResponseError_description_completion___block_invoke_cold_1( uint64_t a1,  uint64_t a2,  os_log_s *a3)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2( &dword_18718F000,  a3,  v5,  "MA-auto-control{_failedControlLockSummary} | %{public}@ | error:%{public}@",  v6);

  OUTLINED_FUNCTION_6();
}

- (void)_successSimulateCacheDeleteOperation:withReclaimableSpace:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1( &dword_18718F000,  v0,  v1,  "MA-auto-control{_successSimulateCacheDeleteOperation} | %{public}@ | no client completion block",  v2);
  OUTLINED_FUNCTION_8();
}

- (void)_failedSimulateCacheDeleteOperation:withErrorCode:withResponseError:description:completion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2( &dword_18718F000,  v0,  (uint64_t)v0,  "MA-auto-control{_failedSimulateCacheDeleteOperation} | %{public}@ | no client completion block | %{public}@",  v1);
  OUTLINED_FUNCTION_8();
}

void __113__MAAutoAssetControl__failedSimulateCacheDeleteOperation_withErrorCode_withResponseError_description_completion___block_invoke_cold_1( uint64_t a1,  uint64_t a2,  os_log_s *a3)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2( &dword_18718F000,  a3,  v5,  "MA-auto-control{_failedSimulateCacheDeleteOperation} | %{public}@ | error:%{public}@",  v6);

  OUTLINED_FUNCTION_6();
}

@end