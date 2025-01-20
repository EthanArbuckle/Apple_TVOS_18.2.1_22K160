@interface MAAutoAssetSetControl
+ (id)activeSetJobSummary:(BOOL)a3 error:(id *)a4;
+ (id)activeSetJobSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 error:(id *)a5;
+ (id)assetSetDescriptorInfo:(id)a3 error:(id *)a4;
+ (id)assetSetsOverview:(id *)a3;
+ (id)assetSetsOverview:(id)a3 limitedToSetIdentifiers:(id)a4 error:(id *)a5;
+ (id)autoAssetSetControl;
+ (id)defaultDispatchQueue;
+ (id)frameworkDispatchQueue;
+ (id)frameworkInstanceUUID;
+ (id)knownAssetSetSummary:(BOOL)a3 error:(id *)a4;
+ (id)knownAssetSetSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 error:(id *)a5;
+ (id)lockedAssetSetSummary:(BOOL)a3 error:(id *)a4;
+ (id)lockedAssetSetSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 error:(id *)a5;
+ (id)scheduledSetJobSummary:(BOOL)a3 error:(id *)a4;
+ (id)scheduledSetJobSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 error:(id *)a5;
+ (id)stagedAssetSetSummary:(BOOL)a3 error:(id *)a4;
+ (id)stagedAssetSetSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 error:(id *)a5;
+ (int64_t)waitOnSemaphore:(id)a3 withTimeout:(int64_t)a4;
+ (void)frameworkInstanceSetLogDomain;
- (MAAutoAssetSetControl)init;
- (NSString)controlClientDomainName;
- (NSString)controlClientName;
- (NSString)controlClientProcessName;
- (OS_dispatch_queue)completionDispatchQueue;
- (SUCoreConnectClient)connectionClient;
- (int64_t)controlClientProcessID;
- (void)_activeSetJobSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 completion:(id)a5;
- (void)_autoAssetInstanceInfo:(id)a3 completion:(id)a4;
- (void)_autoAssetsOverview:(id)a3 limitedToSetIdentifiers:(id)a4 completion:(id)a5;
- (void)_failedControl:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7;
- (void)_failedControlInstanceInfo:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7;
- (void)_failedControlLockSummary:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7;
- (void)_failedControlOverview:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7;
- (void)_failedControlSummary:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7;
- (void)_knownAssetSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 completion:(id)a5;
- (void)_lockedAssetSetSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 completion:(id)a5;
- (void)_scheduledSetJobSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 completion:(id)a5;
- (void)_stagedAssetSetSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 completion:(id)a5;
- (void)_successControl:(id)a3 completion:(id)a4;
- (void)_successControlInstanceInfo:(id)a3 withInstanceInfo:(id)a4 completion:(id)a5;
- (void)_successControlLockSummary:(id)a3 withLockSummaryEntries:(id)a4 completion:(id)a5;
- (void)_successControlOverview:(id)a3 withOverviewEntries:(id)a4 completion:(id)a5;
- (void)_successControlSummary:(id)a3 withJobSummaryEntries:(id)a4 completion:(id)a5;
- (void)connectToServerFrameworkCompletion:(id)a3;
- (void)setConnectionClient:(id)a3;
@end

@implementation MAAutoAssetSetControl

- (MAAutoAssetSetControl)init
{
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___MAAutoAssetSetControl;
  v2 = -[MAAutoAssetSetControl init](&v10, sel_init);
  if (v2)
  {
    +[MAAutoAssetSetControl frameworkInstanceSetLogDomain]( &OBJC_CLASS___MAAutoAssetSetControl,  "frameworkInstanceSetLogDomain");
    controlClientDomainName = v2->_controlClientDomainName;
    v2->_controlClientDomainName = (NSString *)@"com.apple.MobileAsset.AutoSetControl";

    controlClientName = v2->_controlClientName;
    v2->_controlClientName = (NSString *)@"auto-set-control-client";

    uint64_t v5 = objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"%s", getprogname());
    controlClientProcessName = v2->_controlClientProcessName;
    v2->_controlClientProcessName = (NSString *)v5;

    v2->_controlClientProcessID = getpid();
    uint64_t v7 = +[MAAutoAssetSetControl defaultDispatchQueue](&OBJC_CLASS___MAAutoAssetSetControl, "defaultDispatchQueue");
    completionDispatchQueue = v2->_completionDispatchQueue;
    v2->_completionDispatchQueue = (OS_dispatch_queue *)v7;
  }

  return v2;
}

+ (id)knownAssetSetSummary:(BOOL)a3 error:(id *)a4
{
  return +[MAAutoAssetSetControl knownAssetSetSummary:limitedToSetIdentifiers:error:]( &OBJC_CLASS___MAAutoAssetSetControl,  "knownAssetSetSummary:limitedToSetIdentifiers:error:",  a3,  0LL,  a4);
}

+ (id)knownAssetSetSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  v8 = +[MAAutoAssetSetControl autoAssetSetControl](&OBJC_CLASS___MAAutoAssetSetControl, "autoAssetSetControl");
  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  v35 = __Block_byref_object_copy_;
  v36 = __Block_byref_object_dispose_;
  id v37 = 0LL;
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
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
  v16[2] = __76__MAAutoAssetSetControl_knownAssetSetSummary_limitedToSetIdentifiers_error___block_invoke;
  v16[3] = &unk_189FF9488;
  v18 = v22;
  v19 = &v32;
  v20 = &v26;
  v21 = v24;
  v11 = v9;
  v17 = v11;
  [v8 _knownAssetSummary:v6 limitedToSetIdentifiers:v7 completion:v16];
  if (+[MAAutoAssetSetControl waitOnSemaphore:withTimeout:]( &OBJC_CLASS___MAAutoAssetSetControl,  "waitOnSemaphore:withTimeout:",  v11,  -2LL))
  {
    +[MAAutoAssetSetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSetControl, "frameworkDispatchQueue");
    v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v10;
    block[1] = 3221225472LL;
    block[2] = __76__MAAutoAssetSetControl_knownAssetSetSummary_limitedToSetIdentifiers_error___block_invoke_3;
    block[3] = &unk_189FF94B0;
    block[4] = v24;
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

void __76__MAAutoAssetSetControl_knownAssetSetSummary_limitedToSetIdentifiers_error___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  +[MAAutoAssetSetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSetControl, "frameworkDispatchQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)uint64_t v10 = *(_OWORD *)(a1 + 32);
  __int128 v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __76__MAAutoAssetSetControl_knownAssetSetSummary_limitedToSetIdentifiers_error___block_invoke_2;
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

uint64_t __76__MAAutoAssetSetControl_knownAssetSetSummary_limitedToSetIdentifiers_error___block_invoke_2( uint64_t result)
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

void __76__MAAutoAssetSetControl_knownAssetSetSummary_limitedToSetIdentifiers_error___block_invoke_3( void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto-control(knownAssetSummary)",  0LL,  @"timeout (at framework layer) while waiting for known-asset-summary to complete");
    uint64_t v3 = *(void *)(a1[6] + 8LL);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }

- (void)_knownAssetSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __79__MAAutoAssetSetControl__knownAssetSummary_limitedToSetIdentifiers_completion___block_invoke;
    v12[3] = &unk_189FF9500;
    BOOL v16 = a3;
    id v13 = (os_log_s *)v8;
    __int128 v14 = self;
    id v15 = v9;
    -[MAAutoAssetSetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v12);

    uint64_t v10 = v13;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 oslog];
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSetControl _knownAssetSummary:limitedToSetIdentifiers:completion:].cold.1();
    }
  }
}

void __79__MAAutoAssetSetControl__knownAssetSummary_limitedToSetIdentifiers_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 40) _failedControlSummary:@"knownAssetSummary" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset-set XPC service" completion:*(void *)(a1 + 48)];
  }

  else
  {
    id v17 = -[MAAutoAssetSetInfoControl initClearingAfter:limitedToSetIdentifiers:]( objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoControl),  "initClearingAfter:limitedToSetIdentifiers:",  *(unsigned __int8 *)(a1 + 56),  *(void *)(a1 + 32));
    id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
    v4 = +[MAAutoAssetSetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSetControl, "frameworkInstanceUUID");
    [v4 UUIDString];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    id v6 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoInstance);
    [*(id *)(a1 + 40) controlClientDomainName];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) controlClientName];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) controlClientProcessName];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [*(id *)(a1 + 40) controlClientProcessID];
    if (*(void *)(a1 + 32)) {
      v11 = @"LIMITED_INSTANCES";
    }
    else {
      v11 = @"ALL_INSTANCES";
    }
    +[MAAutoAssetSetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSetControl, "frameworkInstanceUUID");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:]( v6,  "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:co mprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:",  v7,  v8,  v9,  v10,  v11,  0LL,  0LL,  0LL,  v12);

    [v3 setSafeObject:v13 forKey:@"setInstance"];
    [v3 setSafeObject:v17 forKey:@"setControl"];
    __int128 v14 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-SET-CONTROL:KNOWN_ASSET_SET_SUMMARY" clientID:v5 version:0 message:v3];
    [*(id *)(a1 + 40) connectionClient];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __79__MAAutoAssetSetControl__knownAssetSummary_limitedToSetIdentifiers_completion___block_invoke_2;
    v18[3] = &unk_189FF94D8;
    BOOL v16 = *(void **)(a1 + 48);
    v18[4] = *(void *)(a1 + 40);
    id v19 = v16;
    [v15 connectClientSendServerMessage:v14 proxyObject:0 withReply:v18];
  }

void __79__MAAutoAssetSetControl__knownAssetSummary_limitedToSetIdentifiers_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
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
    [v6 safeObjectForKey:@"setJobSummary" ofClass:objc_opt_class()];
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

+ (id)lockedAssetSetSummary:(BOOL)a3 error:(id *)a4
{
  return +[MAAutoAssetSetControl lockedAssetSetSummary:limitedToSetIdentifiers:error:]( &OBJC_CLASS___MAAutoAssetSetControl,  "lockedAssetSetSummary:limitedToSetIdentifiers:error:",  a3,  0LL,  a4);
}

+ (id)lockedAssetSetSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  +[MAAutoAssetSetControl autoAssetSetControl](&OBJC_CLASS___MAAutoAssetSetControl, "autoAssetSetControl");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  v35 = __Block_byref_object_copy_;
  v36 = __Block_byref_object_dispose_;
  id v37 = 0LL;
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
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
  v16[2] = __77__MAAutoAssetSetControl_lockedAssetSetSummary_limitedToSetIdentifiers_error___block_invoke;
  v16[3] = &unk_189FF9488;
  v18 = v22;
  id v19 = &v32;
  v20 = &v26;
  v21 = v24;
  id v11 = v9;
  id v17 = v11;
  [v8 _lockedAssetSetSummary:v6 limitedToSetIdentifiers:v7 completion:v16];
  if (+[MAAutoAssetSetControl waitOnSemaphore:withTimeout:]( &OBJC_CLASS___MAAutoAssetSetControl,  "waitOnSemaphore:withTimeout:",  v11,  -2LL))
  {
    +[MAAutoAssetSetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSetControl, "frameworkDispatchQueue");
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v10;
    block[1] = 3221225472LL;
    block[2] = __77__MAAutoAssetSetControl_lockedAssetSetSummary_limitedToSetIdentifiers_error___block_invoke_3;
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

void __77__MAAutoAssetSetControl_lockedAssetSetSummary_limitedToSetIdentifiers_error___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  +[MAAutoAssetSetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSetControl, "frameworkDispatchQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)uint64_t v10 = *(_OWORD *)(a1 + 32);
  __int128 v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __77__MAAutoAssetSetControl_lockedAssetSetSummary_limitedToSetIdentifiers_error___block_invoke_2;
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

uint64_t __77__MAAutoAssetSetControl_lockedAssetSetSummary_limitedToSetIdentifiers_error___block_invoke_2( uint64_t result)
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

void __77__MAAutoAssetSetControl_lockedAssetSetSummary_limitedToSetIdentifiers_error___block_invoke_3( void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto-control(lockedAssetSetSummary)",  0LL,  @"timeout (at framework layer) while waiting for locked-asset-summary to complete");
    uint64_t v3 = *(void *)(a1[6] + 8LL);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }

- (void)_lockedAssetSetSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __83__MAAutoAssetSetControl__lockedAssetSetSummary_limitedToSetIdentifiers_completion___block_invoke;
    v12[3] = &unk_189FF9500;
    BOOL v16 = a3;
    id v13 = (os_log_s *)v8;
    __int128 v14 = self;
    id v15 = v9;
    -[MAAutoAssetSetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v12);

    uint64_t v10 = v13;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 oslog];
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSetControl _lockedAssetSetSummary:limitedToSetIdentifiers:completion:].cold.1();
    }
  }
}

void __83__MAAutoAssetSetControl__lockedAssetSetSummary_limitedToSetIdentifiers_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 40) _failedControlLockSummary:@"lockedAssetSetSummary" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset-set XPC service" completion:*(void *)(a1 + 48)];
  }

  else
  {
    id v17 = -[MAAutoAssetSetInfoControl initClearingAfter:limitedToSetIdentifiers:]( objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoControl),  "initClearingAfter:limitedToSetIdentifiers:",  *(unsigned __int8 *)(a1 + 56),  *(void *)(a1 + 32));
    id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
    v4 = +[MAAutoAssetSetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSetControl, "frameworkInstanceUUID");
    [v4 UUIDString];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    id v6 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoInstance);
    [*(id *)(a1 + 40) controlClientDomainName];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) controlClientName];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) controlClientProcessName];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [*(id *)(a1 + 40) controlClientProcessID];
    if (*(void *)(a1 + 32)) {
      id v11 = @"LIMITED_INSTANCES";
    }
    else {
      id v11 = @"ALL_INSTANCES";
    }
    +[MAAutoAssetSetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSetControl, "frameworkInstanceUUID");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:]( v6,  "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:co mprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:",  v7,  v8,  v9,  v10,  v11,  0LL,  0LL,  0LL,  v12);

    [v3 setSafeObject:v13 forKey:@"setInstance"];
    [v3 setSafeObject:v17 forKey:@"setControl"];
    __int128 v14 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-SET-CONTROL:LOCKED_ASSET_SET_SUMMARY" clientID:v5 version:0 message:v3];
    [*(id *)(a1 + 40) connectionClient];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __83__MAAutoAssetSetControl__lockedAssetSetSummary_limitedToSetIdentifiers_completion___block_invoke_2;
    v18[3] = &unk_189FF94D8;
    BOOL v16 = *(void **)(a1 + 48);
    v18[4] = *(void *)(a1 + 40);
    id v19 = v16;
    [v15 connectClientSendServerMessage:v14 proxyObject:0 withReply:v18];
  }

void __83__MAAutoAssetSetControl__lockedAssetSetSummary_limitedToSetIdentifiers_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
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

    [*(id *)(a1 + 32) _failedControlLockSummary:@"lockedAssetSetSummary" withErrorCode:v10 withResponseError:v11 description:v9 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v12 message];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 safeObjectForKey:@"setLockSummary" ofClass:objc_opt_class()];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    id v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 _successControlLockSummary:@"lockedAssetSetSummary" withLockSummaryEntries:v7 completion:*(void *)(a1 + 40)];
    }
    else {
      [v8 _failedControlLockSummary:@"lockedAssetSetSummary" withErrorCode:6110 withResponseError:0 description:@"no locked-asset-summary provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

+ (id)stagedAssetSetSummary:(BOOL)a3 error:(id *)a4
{
  return +[MAAutoAssetSetControl stagedAssetSetSummary:limitedToSetIdentifiers:error:]( &OBJC_CLASS___MAAutoAssetSetControl,  "stagedAssetSetSummary:limitedToSetIdentifiers:error:",  a3,  0LL,  a4);
}

+ (id)stagedAssetSetSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  +[MAAutoAssetSetControl autoAssetSetControl](&OBJC_CLASS___MAAutoAssetSetControl, "autoAssetSetControl");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  v35 = __Block_byref_object_copy_;
  v36 = __Block_byref_object_dispose_;
  id v37 = 0LL;
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
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
  v16[2] = __77__MAAutoAssetSetControl_stagedAssetSetSummary_limitedToSetIdentifiers_error___block_invoke;
  v16[3] = &unk_189FF9488;
  v18 = v22;
  id v19 = &v32;
  v20 = &v26;
  v21 = v24;
  id v11 = v9;
  id v17 = v11;
  [v8 _stagedAssetSetSummary:v6 limitedToSetIdentifiers:v7 completion:v16];
  if (+[MAAutoAssetSetControl waitOnSemaphore:withTimeout:]( &OBJC_CLASS___MAAutoAssetSetControl,  "waitOnSemaphore:withTimeout:",  v11,  -2LL))
  {
    +[MAAutoAssetSetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSetControl, "frameworkDispatchQueue");
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v10;
    block[1] = 3221225472LL;
    block[2] = __77__MAAutoAssetSetControl_stagedAssetSetSummary_limitedToSetIdentifiers_error___block_invoke_3;
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

void __77__MAAutoAssetSetControl_stagedAssetSetSummary_limitedToSetIdentifiers_error___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  +[MAAutoAssetSetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSetControl, "frameworkDispatchQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)uint64_t v10 = *(_OWORD *)(a1 + 32);
  __int128 v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __77__MAAutoAssetSetControl_stagedAssetSetSummary_limitedToSetIdentifiers_error___block_invoke_2;
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

uint64_t __77__MAAutoAssetSetControl_stagedAssetSetSummary_limitedToSetIdentifiers_error___block_invoke_2( uint64_t result)
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

void __77__MAAutoAssetSetControl_stagedAssetSetSummary_limitedToSetIdentifiers_error___block_invoke_3( void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto-control(stagedAssetSetSummary)",  0LL,  @"timeout (at framework layer) while waiting for staged-asset-set-summary to complete");
    uint64_t v3 = *(void *)(a1[6] + 8LL);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }

- (void)_stagedAssetSetSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __83__MAAutoAssetSetControl__stagedAssetSetSummary_limitedToSetIdentifiers_completion___block_invoke;
    v12[3] = &unk_189FF9500;
    BOOL v16 = a3;
    id v13 = (os_log_s *)v8;
    __int128 v14 = self;
    id v15 = v9;
    -[MAAutoAssetSetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v12);

    uint64_t v10 = v13;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 oslog];
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSetControl _stagedAssetSetSummary:limitedToSetIdentifiers:completion:].cold.1();
    }
  }
}

void __83__MAAutoAssetSetControl__stagedAssetSetSummary_limitedToSetIdentifiers_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 40) _failedControlSummary:@"stagedAssetSetSummary" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset-set XPC service" completion:*(void *)(a1 + 48)];
  }

  else
  {
    id v17 = -[MAAutoAssetSetInfoControl initClearingAfter:limitedToSetIdentifiers:]( objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoControl),  "initClearingAfter:limitedToSetIdentifiers:",  *(unsigned __int8 *)(a1 + 56),  *(void *)(a1 + 32));
    id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
    v4 = +[MAAutoAssetSetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSetControl, "frameworkInstanceUUID");
    [v4 UUIDString];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    id v6 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoInstance);
    [*(id *)(a1 + 40) controlClientDomainName];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) controlClientName];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) controlClientProcessName];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [*(id *)(a1 + 40) controlClientProcessID];
    if (*(void *)(a1 + 32)) {
      id v11 = @"LIMITED_INSTANCES";
    }
    else {
      id v11 = @"ALL_INSTANCES";
    }
    +[MAAutoAssetSetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSetControl, "frameworkInstanceUUID");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:]( v6,  "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:co mprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:",  v7,  v8,  v9,  v10,  v11,  0LL,  0LL,  0LL,  v12);

    [v3 setSafeObject:v13 forKey:@"setInstance"];
    [v3 setSafeObject:v17 forKey:@"setControl"];
    __int128 v14 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-SET-CONTROL:STAGED_ASSET_SET_SUMMARY" clientID:v5 version:0 message:v3];
    [*(id *)(a1 + 40) connectionClient];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __83__MAAutoAssetSetControl__stagedAssetSetSummary_limitedToSetIdentifiers_completion___block_invoke_2;
    v18[3] = &unk_189FF94D8;
    BOOL v16 = *(void **)(a1 + 48);
    v18[4] = *(void *)(a1 + 40);
    id v19 = v16;
    [v15 connectClientSendServerMessage:v14 proxyObject:0 withReply:v18];
  }

void __83__MAAutoAssetSetControl__stagedAssetSetSummary_limitedToSetIdentifiers_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
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

    [*(id *)(a1 + 32) _failedControlSummary:@"stagedAssetSetSummary" withErrorCode:v10 withResponseError:v11 description:v9 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v12 message];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 safeObjectForKey:@"setJobSummary" ofClass:objc_opt_class()];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    id v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 _successControlSummary:@"stagedAssetSetSummary" withJobSummaryEntries:v7 completion:*(void *)(a1 + 40)];
    }
    else {
      [v8 _failedControlSummary:@"stagedAssetSetSummary" withErrorCode:6110 withResponseError:0 description:@"no staged-asset-set-summary provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

+ (id)activeSetJobSummary:(BOOL)a3 error:(id *)a4
{
  return +[MAAutoAssetSetControl activeSetJobSummary:limitedToSetIdentifiers:error:]( &OBJC_CLASS___MAAutoAssetSetControl,  "activeSetJobSummary:limitedToSetIdentifiers:error:",  a3,  0LL,  a4);
}

+ (id)activeSetJobSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  +[MAAutoAssetSetControl autoAssetSetControl](&OBJC_CLASS___MAAutoAssetSetControl, "autoAssetSetControl");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  v35 = __Block_byref_object_copy_;
  v36 = __Block_byref_object_dispose_;
  id v37 = 0LL;
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
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
  v16[2] = __75__MAAutoAssetSetControl_activeSetJobSummary_limitedToSetIdentifiers_error___block_invoke;
  v16[3] = &unk_189FF9488;
  v18 = v22;
  id v19 = &v32;
  v20 = &v26;
  v21 = v24;
  id v11 = v9;
  id v17 = v11;
  [v8 _activeSetJobSummary:v6 limitedToSetIdentifiers:v7 completion:v16];
  if (+[MAAutoAssetSetControl waitOnSemaphore:withTimeout:]( &OBJC_CLASS___MAAutoAssetSetControl,  "waitOnSemaphore:withTimeout:",  v11,  -2LL))
  {
    +[MAAutoAssetSetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSetControl, "frameworkDispatchQueue");
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v10;
    block[1] = 3221225472LL;
    block[2] = __75__MAAutoAssetSetControl_activeSetJobSummary_limitedToSetIdentifiers_error___block_invoke_3;
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

void __75__MAAutoAssetSetControl_activeSetJobSummary_limitedToSetIdentifiers_error___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  +[MAAutoAssetSetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSetControl, "frameworkDispatchQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)uint64_t v10 = *(_OWORD *)(a1 + 32);
  __int128 v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __75__MAAutoAssetSetControl_activeSetJobSummary_limitedToSetIdentifiers_error___block_invoke_2;
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

uint64_t __75__MAAutoAssetSetControl_activeSetJobSummary_limitedToSetIdentifiers_error___block_invoke_2( uint64_t result)
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

void __75__MAAutoAssetSetControl_activeSetJobSummary_limitedToSetIdentifiers_error___block_invoke_3( void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto-control(activeSetJobSummary)",  0LL,  @"timeout (at framework layer) while waiting for active-set-job-summary to complete");
    uint64_t v3 = *(void *)(a1[6] + 8LL);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }

- (void)_activeSetJobSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __81__MAAutoAssetSetControl__activeSetJobSummary_limitedToSetIdentifiers_completion___block_invoke;
    v12[3] = &unk_189FF9500;
    BOOL v16 = a3;
    id v13 = (os_log_s *)v8;
    __int128 v14 = self;
    id v15 = v9;
    -[MAAutoAssetSetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v12);

    uint64_t v10 = v13;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 oslog];
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSetControl _activeSetJobSummary:limitedToSetIdentifiers:completion:].cold.1();
    }
  }
}

void __81__MAAutoAssetSetControl__activeSetJobSummary_limitedToSetIdentifiers_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 40) _failedControlSummary:@"activeSetJobSummary" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset-set XPC service" completion:*(void *)(a1 + 48)];
  }

  else
  {
    id v17 = -[MAAutoAssetSetInfoControl initClearingAfter:limitedToSetIdentifiers:]( objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoControl),  "initClearingAfter:limitedToSetIdentifiers:",  *(unsigned __int8 *)(a1 + 56),  *(void *)(a1 + 32));
    id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
    v4 = +[MAAutoAssetSetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSetControl, "frameworkInstanceUUID");
    [v4 UUIDString];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    id v6 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoInstance);
    [*(id *)(a1 + 40) controlClientDomainName];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) controlClientName];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) controlClientProcessName];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [*(id *)(a1 + 40) controlClientProcessID];
    if (*(void *)(a1 + 32)) {
      id v11 = @"LIMITED_INSTANCES";
    }
    else {
      id v11 = @"ALL_INSTANCES";
    }
    +[MAAutoAssetSetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSetControl, "frameworkInstanceUUID");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:]( v6,  "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:co mprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:",  v7,  v8,  v9,  v10,  v11,  0LL,  0LL,  0LL,  v12);

    [v3 setSafeObject:v13 forKey:@"setInstance"];
    [v3 setSafeObject:v17 forKey:@"setControl"];
    __int128 v14 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-SET-CONTROL:ACTIVE_SET_JOB_SUMMARY" clientID:v5 version:0 message:v3];
    [*(id *)(a1 + 40) connectionClient];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __81__MAAutoAssetSetControl__activeSetJobSummary_limitedToSetIdentifiers_completion___block_invoke_2;
    v18[3] = &unk_189FF94D8;
    BOOL v16 = *(void **)(a1 + 48);
    v18[4] = *(void *)(a1 + 40);
    id v19 = v16;
    [v15 connectClientSendServerMessage:v14 proxyObject:0 withReply:v18];
  }

void __81__MAAutoAssetSetControl__activeSetJobSummary_limitedToSetIdentifiers_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
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

    [*(id *)(a1 + 32) _failedControlSummary:@"activeSetJobSummary" withErrorCode:v10 withResponseError:v11 description:v9 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v12 message];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 safeObjectForKey:@"setJobSummary" ofClass:objc_opt_class()];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    id v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 _successControlSummary:@"activeSetJobSummary" withJobSummaryEntries:v7 completion:*(void *)(a1 + 40)];
    }
    else {
      [v8 _failedControlSummary:@"activeSetJobSummary" withErrorCode:6110 withResponseError:0 description:@"no active-set-job-summary provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

+ (id)scheduledSetJobSummary:(BOOL)a3 error:(id *)a4
{
  return +[MAAutoAssetSetControl scheduledSetJobSummary:limitedToSetIdentifiers:error:]( &OBJC_CLASS___MAAutoAssetSetControl,  "scheduledSetJobSummary:limitedToSetIdentifiers:error:",  a3,  0LL,  a4);
}

+ (id)scheduledSetJobSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v7 = a4;
  +[MAAutoAssetSetControl autoAssetSetControl](&OBJC_CLASS___MAAutoAssetSetControl, "autoAssetSetControl");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v32 = 0LL;
  v33 = &v32;
  uint64_t v34 = 0x3032000000LL;
  v35 = __Block_byref_object_copy_;
  v36 = __Block_byref_object_dispose_;
  id v37 = 0LL;
  uint64_t v26 = 0LL;
  v27 = &v26;
  uint64_t v28 = 0x3032000000LL;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
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
  v16[2] = __78__MAAutoAssetSetControl_scheduledSetJobSummary_limitedToSetIdentifiers_error___block_invoke;
  v16[3] = &unk_189FF9488;
  v18 = v22;
  id v19 = &v32;
  v20 = &v26;
  v21 = v24;
  id v11 = v9;
  id v17 = v11;
  [v8 _scheduledSetJobSummary:v6 limitedToSetIdentifiers:v7 completion:v16];
  if (+[MAAutoAssetSetControl waitOnSemaphore:withTimeout:]( &OBJC_CLASS___MAAutoAssetSetControl,  "waitOnSemaphore:withTimeout:",  v11,  -2LL))
  {
    +[MAAutoAssetSetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSetControl, "frameworkDispatchQueue");
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v10;
    block[1] = 3221225472LL;
    block[2] = __78__MAAutoAssetSetControl_scheduledSetJobSummary_limitedToSetIdentifiers_error___block_invoke_3;
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

void __78__MAAutoAssetSetControl_scheduledSetJobSummary_limitedToSetIdentifiers_error___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  +[MAAutoAssetSetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSetControl, "frameworkDispatchQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)uint64_t v10 = *(_OWORD *)(a1 + 32);
  __int128 v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __78__MAAutoAssetSetControl_scheduledSetJobSummary_limitedToSetIdentifiers_error___block_invoke_2;
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

uint64_t __78__MAAutoAssetSetControl_scheduledSetJobSummary_limitedToSetIdentifiers_error___block_invoke_2( uint64_t result)
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

void __78__MAAutoAssetSetControl_scheduledSetJobSummary_limitedToSetIdentifiers_error___block_invoke_3( void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto-control(scheduledSetJobSummary)",  0LL,  @"timeout (at framework layer) while waiting for scheduled-job-summary to complete");
    uint64_t v3 = *(void *)(a1[6] + 8LL);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }

- (void)_scheduledSetJobSummary:(BOOL)a3 limitedToSetIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __84__MAAutoAssetSetControl__scheduledSetJobSummary_limitedToSetIdentifiers_completion___block_invoke;
    v12[3] = &unk_189FF9500;
    BOOL v16 = a3;
    id v13 = (os_log_s *)v8;
    __int128 v14 = self;
    id v15 = v9;
    -[MAAutoAssetSetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v12);

    uint64_t v10 = v13;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 oslog];
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSetControl _scheduledSetJobSummary:limitedToSetIdentifiers:completion:].cold.1();
    }
  }
}

void __84__MAAutoAssetSetControl__scheduledSetJobSummary_limitedToSetIdentifiers_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 40) _failedControlSummary:@"scheduledSetJobSummary" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset-set XPC service" completion:*(void *)(a1 + 48)];
  }

  else
  {
    id v17 = -[MAAutoAssetSetInfoControl initClearingAfter:limitedToSetIdentifiers:]( objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoControl),  "initClearingAfter:limitedToSetIdentifiers:",  *(unsigned __int8 *)(a1 + 56),  *(void *)(a1 + 32));
    id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
    v4 = +[MAAutoAssetSetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSetControl, "frameworkInstanceUUID");
    [v4 UUIDString];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    id v6 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoInstance);
    [*(id *)(a1 + 40) controlClientDomainName];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) controlClientName];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) controlClientProcessName];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [*(id *)(a1 + 40) controlClientProcessID];
    if (*(void *)(a1 + 32)) {
      id v11 = @"LIMITED_INSTANCES";
    }
    else {
      id v11 = @"ALL_INSTANCES";
    }
    +[MAAutoAssetSetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSetControl, "frameworkInstanceUUID");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:]( v6,  "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:co mprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:",  v7,  v8,  v9,  v10,  v11,  0LL,  0LL,  0LL,  v12);

    [v3 setSafeObject:v13 forKey:@"setInstance"];
    [v3 setSafeObject:v17 forKey:@"setControl"];
    __int128 v14 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-SET-CONTROL:SCHEDULED_SET_JOB_SUMMARY" clientID:v5 version:0 message:v3];
    [*(id *)(a1 + 40) connectionClient];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __84__MAAutoAssetSetControl__scheduledSetJobSummary_limitedToSetIdentifiers_completion___block_invoke_2;
    v18[3] = &unk_189FF94D8;
    BOOL v16 = *(void **)(a1 + 48);
    v18[4] = *(void *)(a1 + 40);
    id v19 = v16;
    [v15 connectClientSendServerMessage:v14 proxyObject:0 withReply:v18];
  }

void __84__MAAutoAssetSetControl__scheduledSetJobSummary_limitedToSetIdentifiers_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
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

    [*(id *)(a1 + 32) _failedControlSummary:@"scheduledSetJobSummary" withErrorCode:v10 withResponseError:v11 description:v9 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v12 message];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 safeObjectForKey:@"setJobSummary" ofClass:objc_opt_class()];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    id v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 _successControlSummary:@"scheduledSetJobSummary" withJobSummaryEntries:v7 completion:*(void *)(a1 + 40)];
    }
    else {
      [v8 _failedControlSummary:@"scheduledSetJobSummary" withErrorCode:6110 withResponseError:0 description:@"no scheduled-job-summary provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

+ (id)assetSetsOverview:(id *)a3
{
  return +[MAAutoAssetSetControl assetSetsOverview:limitedToSetIdentifiers:error:]( &OBJC_CLASS___MAAutoAssetSetControl,  "assetSetsOverview:limitedToSetIdentifiers:error:",  0LL,  0LL,  a3);
}

+ (id)assetSetsOverview:(id)a3 limitedToSetIdentifiers:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  +[MAAutoAssetSetControl autoAssetSetControl](&OBJC_CLASS___MAAutoAssetSetControl, "autoAssetSetControl");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v33 = 0LL;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  v36 = __Block_byref_object_copy_;
  id v37 = __Block_byref_object_dispose_;
  id v38 = 0LL;
  uint64_t v27 = 0LL;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  v30 = __Block_byref_object_copy_;
  id v31 = __Block_byref_object_dispose_;
  id v32 = 0LL;
  v25[0] = 0LL;
  v25[1] = v25;
  v25[2] = 0x2020000000LL;
  char v26 = 0;
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x2020000000LL;
  char v24 = 0;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0LL);
  uint64_t v11 = MEMORY[0x1895F87A8];
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __73__MAAutoAssetSetControl_assetSetsOverview_limitedToSetIdentifiers_error___block_invoke;
  v17[3] = &unk_189FF9488;
  id v19 = v23;
  v20 = &v33;
  v21 = &v27;
  v22 = v25;
  id v12 = v10;
  v18 = v12;
  [v9 _autoAssetsOverview:v7 limitedToSetIdentifiers:v8 completion:v17];
  if (+[MAAutoAssetSetControl waitOnSemaphore:withTimeout:]( &OBJC_CLASS___MAAutoAssetSetControl,  "waitOnSemaphore:withTimeout:",  v12,  -2LL))
  {
    +[MAAutoAssetSetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSetControl, "frameworkDispatchQueue");
    id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v11;
    block[1] = 3221225472LL;
    block[2] = __73__MAAutoAssetSetControl_assetSetsOverview_limitedToSetIdentifiers_error___block_invoke_3;
    block[3] = &unk_189FF94B0;
    void block[4] = v25;
    block[5] = v23;
    block[6] = &v27;
    dispatch_sync(v13, block);
  }

  if (a5) {
    *a5 = (id) v28[5];
  }
  id v14 = (id)v34[5];

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  return v14;
}

void __73__MAAutoAssetSetControl_assetSetsOverview_limitedToSetIdentifiers_error___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  +[MAAutoAssetSetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSetControl, "frameworkDispatchQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)dispatch_semaphore_t v10 = *(_OWORD *)(a1 + 32);
  __int128 v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __73__MAAutoAssetSetControl_assetSetsOverview_limitedToSetIdentifiers_error___block_invoke_2;
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

uint64_t __73__MAAutoAssetSetControl_assetSetsOverview_limitedToSetIdentifiers_error___block_invoke_2( uint64_t result)
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

void __73__MAAutoAssetSetControl_assetSetsOverview_limitedToSetIdentifiers_error___block_invoke_3( void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto-control(assetSetsOverview)",  0LL,  @"timeout (at framework layer) while waiting for asset-sets-overview to complete");
    uint64_t v3 = *(void *)(a1[6] + 8LL);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }

- (void)_autoAssetsOverview:(id)a3 limitedToSetIdentifiers:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __80__MAAutoAssetSetControl__autoAssetsOverview_limitedToSetIdentifiers_completion___block_invoke;
    v13[3] = &unk_189FF9528;
    __int128 v14 = (os_log_s *)v8;
    id v15 = v9;
    uint64_t v16 = self;
    id v17 = v10;
    -[MAAutoAssetSetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v13);

    uint64_t v11 = v14;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 oslog];
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSetControl _autoAssetsOverview:limitedToSetIdentifiers:completion:].cold.1();
    }
  }
}

void __80__MAAutoAssetSetControl__autoAssetsOverview_limitedToSetIdentifiers_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 48) _failedControlOverview:@"assetSetsOverview" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset-set XPC service" completion:*(void *)(a1 + 56)];
  }

  else
  {
    id v17 = -[MAAutoAssetSetInfoControl initClearingAfter:limitedToClientDomains:limitedToSetIdentifiers:]( objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoControl),  "initClearingAfter:limitedToClientDomains:limitedToSetIdentifiers:",  0LL,  *(void *)(a1 + 32),  *(void *)(a1 + 40));
    id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
    v4 = +[MAAutoAssetSetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSetControl, "frameworkInstanceUUID");
    [v4 UUIDString];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    id v6 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoInstance);
    [*(id *)(a1 + 48) controlClientDomainName];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 48) controlClientName];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 48) controlClientProcessName];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [*(id *)(a1 + 48) controlClientProcessID];
    if (*(void *)(a1 + 40)) {
      uint64_t v11 = @"LIMITED_INSTANCES";
    }
    else {
      uint64_t v11 = @"ALL_INSTANCES";
    }
    +[MAAutoAssetSetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSetControl, "frameworkInstanceUUID");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:]( v6,  "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:co mprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:",  v7,  v8,  v9,  v10,  v11,  0LL,  0LL,  0LL,  v12);

    [v3 setSafeObject:v13 forKey:@"setInstance"];
    [v3 setSafeObject:v17 forKey:@"setControl"];
    __int128 v14 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-SET-CONTROL:ASSET_SETS_OVERVIEW" clientID:v5 version:0 message:v3];
    [*(id *)(a1 + 48) connectionClient];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __80__MAAutoAssetSetControl__autoAssetsOverview_limitedToSetIdentifiers_completion___block_invoke_2;
    v18[3] = &unk_189FF94D8;
    uint64_t v16 = *(void **)(a1 + 56);
    v18[4] = *(void *)(a1 + 48);
    id v19 = v16;
    [v15 connectClientSendServerMessage:v14 proxyObject:0 withReply:v18];
  }

void __80__MAAutoAssetSetControl__autoAssetsOverview_limitedToSetIdentifiers_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
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

    [*(id *)(a1 + 32) _failedControlOverview:@"assetSetsOverview" withErrorCode:v10 withResponseError:v11 description:v9 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v12 message];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 safeObjectForKey:@"setOverview" ofClass:objc_opt_class()];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    id v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 _successControlOverview:@"assetSetsOverview" withOverviewEntries:v7 completion:*(void *)(a1 + 40)];
    }
    else {
      [v8 _failedControlSummary:@"assetSetsOverview" withErrorCode:6110 withResponseError:0 description:@"no asset-sets-overview provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

+ (id)assetSetDescriptorInfo:(id)a3 error:(id *)a4
{
  id v5 = a3;
  +[MAAutoAssetSetControl autoAssetSetControl](&OBJC_CLASS___MAAutoAssetSetControl, "autoAssetSetControl");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v30 = 0LL;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  uint64_t v33 = __Block_byref_object_copy_;
  uint64_t v34 = __Block_byref_object_dispose_;
  id v35 = 0LL;
  uint64_t v24 = 0LL;
  char v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  uint64_t v27 = __Block_byref_object_copy_;
  uint64_t v28 = __Block_byref_object_dispose_;
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
  v14[2] = __54__MAAutoAssetSetControl_assetSetDescriptorInfo_error___block_invoke;
  v14[3] = &unk_189FF9550;
  uint64_t v16 = v20;
  id v17 = &v30;
  v18 = &v24;
  id v19 = v22;
  id v9 = v7;
  id v15 = v9;
  [v6 _autoAssetInstanceInfo:v5 completion:v14];
  if (+[MAAutoAssetSetControl waitOnSemaphore:withTimeout:]( &OBJC_CLASS___MAAutoAssetSetControl,  "waitOnSemaphore:withTimeout:",  v9,  -2LL))
  {
    +[MAAutoAssetSetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSetControl, "frameworkDispatchQueue");
    uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    v13[1] = 3221225472LL;
    v13[2] = __54__MAAutoAssetSetControl_assetSetDescriptorInfo_error___block_invoke_3;
    v13[3] = &unk_189FF94B0;
    void v13[4] = v22;
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

void __54__MAAutoAssetSetControl_assetSetDescriptorInfo_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  +[MAAutoAssetSetControl frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSetControl, "frameworkDispatchQueue");
  dispatch_semaphore_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)uint64_t v10 = *(_OWORD *)(a1 + 32);
  __int128 v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __54__MAAutoAssetSetControl_assetSetDescriptorInfo_error___block_invoke_2;
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

uint64_t __54__MAAutoAssetSetControl_assetSetDescriptorInfo_error___block_invoke_2(uint64_t result)
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

void __54__MAAutoAssetSetControl_assetSetDescriptorInfo_error___block_invoke_3(void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto-control(assetSetInstanceInfo)",  0LL,  @"timeout (at framework layer) while waiting for asset-set-instance-info to complete");
    uint64_t v3 = *(void *)(a1[6] + 8LL);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }

- (void)_autoAssetInstanceInfo:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    id v10[2] = __59__MAAutoAssetSetControl__autoAssetInstanceInfo_completion___block_invoke;
    v10[3] = &unk_189FF9578;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    -[MAAutoAssetSetControl connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v10);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSetControl _autoAssetInstanceInfo:completion:].cold.1();
    }
  }
}

void __59__MAAutoAssetSetControl__autoAssetInstanceInfo_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _failedControlInstanceInfo:@"autoAssetInstanceInfo" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset-set XPC service" completion:*(void *)(a1 + 48)];
  }

  else
  {
    id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
    v4 = +[MAAutoAssetSetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSetControl, "frameworkInstanceUUID");
    [v4 UUIDString];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    id v6 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoInstance);
    [*(id *)(a1 + 32) controlClientDomainName];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) controlClientName];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) controlClientProcessName];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [*(id *)(a1 + 32) controlClientProcessID];
    uint64_t v11 = *(void *)(a1 + 40);
    +[MAAutoAssetSetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSetControl, "frameworkInstanceUUID");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:]( v6,  "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:co mprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:",  v7,  v8,  v9,  v10,  @"ALL_INSTANCES",  v11,  0LL,  0LL,  v12);

    [v3 setSafeObject:v13 forKey:@"setInstance"];
    __int128 v14 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-SET-CONTROL:SET_INSTANCE_INFO" clientID:v5 version:0 message:v3];
    [*(id *)(a1 + 32) connectionClient];
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __59__MAAutoAssetSetControl__autoAssetInstanceInfo_completion___block_invoke_2;
    v16[3] = &unk_189FF94D8;
    void v16[4] = *(void *)(a1 + 32);
    id v17 = *(id *)(a1 + 48);
    [v15 connectClientSendServerMessage:v14 proxyObject:0 withReply:v16];
  }

void __59__MAAutoAssetSetControl__autoAssetInstanceInfo_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
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

    [*(id *)(a1 + 32) _failedControlInstanceInfo:@"autoAssetInstanceInfo" withErrorCode:v10 withResponseError:v11 description:v9 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v12 message];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 safeObjectForKey:@"setInstanceInfo" ofClass:objc_opt_class()];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    id v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 _successControlInstanceInfo:@"autoAssetInstanceInfo" withInstanceInfo:v7 completion:*(void *)(a1 + 40)];
    }
    else {
      [v8 _failedControlInstanceInfo:@"autoAssetInstanceInfo" withErrorCode:6110 withResponseError:0 description:@"no asset-sets atomic instance information provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

+ (id)defaultDispatchQueue
{
  if (defaultDispatchQueue_defaultQueueOnce != -1) {
    dispatch_once(&defaultDispatchQueue_defaultQueueOnce, &__block_literal_global);
  }
  return (id)defaultDispatchQueue_defaultQueue;
}

void __45__MAAutoAssetSetControl_defaultDispatchQueue__block_invoke()
{
  v0 = (const char *)[@"com.apple.MobileAsset.autoassetcontrol.client" UTF8String];
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v1 = dispatch_queue_create(v0, v3);
  uint64_t v2 = (void *)defaultDispatchQueue_defaultQueue;
  defaultDispatchQueue_defaultQueue = (uint64_t)v1;
}

+ (id)autoAssetSetControl
{
  if (autoAssetSetControl_dispatchOnceAutoAssetSetControl != -1) {
    dispatch_once(&autoAssetSetControl_dispatchOnceAutoAssetSetControl, &__block_literal_global_295);
  }
  return (id)autoAssetSetControl___autoAssetSetControl;
}

void __44__MAAutoAssetSetControl_autoAssetSetControl__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___MAAutoAssetSetControl);
  dispatch_queue_t v1 = (void *)autoAssetSetControl___autoAssetSetControl;
  autoAssetSetControl___autoAssetSetControl = (uint64_t)v0;
}

- (void)connectToServerFrameworkCompletion:(id)a3
{
  char v25 = (void (**)(id, void))a3;
  v4 = -[MAAutoAssetSetControl connectionClient](self, "connectionClient");
  if (v4)
  {
    v25[2](v25, 0LL);
  }

  else
  {
    +[MAAutoAssetSetControl frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSetControl, "frameworkInstanceUUID");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 UUIDString];
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();

    char v23 = (void *)MEMORY[0x189604010];
    uint64_t v22 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    objc_msgSend( v23,  "setWithObjects:",  v22,  v21,  v20,  v19,  v18,  v6,  v7,  v8,  v9,  v10,  v11,  v12,  v13,  v14,  objc_opt_class(),  0);
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189612748] setAllowlistedClasses:v15 forKey:@"MA-AUTO-SET-CONTROL:KNOWN_ASSET_SET_SUMMARY"];
    [MEMORY[0x189612748] setAllowlistedClasses:v15 forKey:@"MA-AUTO-SET-CONTROL:LOCKED_ASSET_SET_SUMMARY"];
    [MEMORY[0x189612748] setAllowlistedClasses:v15 forKey:@"MA-AUTO-SET-CONTROL:STAGED_ASSET_SET_SUMMARY"];
    [MEMORY[0x189612748] setAllowlistedClasses:v15 forKey:@"MA-AUTO-SET-CONTROL:ACTIVE_SET_JOB_SUMMARY"];
    [MEMORY[0x189612748] setAllowlistedClasses:v15 forKey:@"MA-AUTO-SET-CONTROL:SCHEDULED_SET_JOB_SUMMARY"];
    [MEMORY[0x189612748] setAllowlistedClasses:v15 forKey:@"MA-AUTO-SET-CONTROL(REPLY):KNOWN_ASSET_SET_SUMMARY"];
    [MEMORY[0x189612748] setAllowlistedClasses:v15 forKey:@"MA-AUTO-SET-CONTROL(REPLY):LOCKED_ASSET_SET_SUMMARY"];
    [MEMORY[0x189612748] setAllowlistedClasses:v15 forKey:@"MA-AUTO-SET-CONTROL(REPLY):STAGED_ASSET_SET_SUMMARY"];
    [MEMORY[0x189612748] setAllowlistedClasses:v15 forKey:@"MA-AUTO-SET-CONTROL(REPLY):ACTIVE_SET_JOB_SUMMARY"];
    [MEMORY[0x189612748] setAllowlistedClasses:v15 forKey:@"MA-AUTO-SET-CONTROL(REPLY):SCHEDULED_SET_JOB_SUMMARY"];
    [MEMORY[0x189612748] setAllowlistedClasses:v15 forKey:@"MA-AUTO-SET-CONTROL(REPLY):ASSET_SETS_OVERVIEW"];
    [MEMORY[0x189612748] setAllowlistedClasses:v15 forKey:@"MA-AUTO-SET-CONTROL(REPLY):SET_INSTANCE_INFO"];
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x189612748]) initForServiceName:@"com.apple.mobileasset.autoasset" delegate:self clientID:v24];
    id v17 = (void *)[objc_alloc(MEMORY[0x189612740]) initWithClientPolicy:v16];
    -[MAAutoAssetSetControl setConnectionClient:](self, "setConnectionClient:", v17);

    v25[2](v25, 0LL);
  }
}

- (void)_successControl:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    -[MAAutoAssetSetControl completionDispatchQueue](self, "completionDispatchQueue");
    uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __52__MAAutoAssetSetControl__successControl_completion___block_invoke;
    v11[3] = &unk_189FF9600;
    uint64_t v12 = (os_log_s *)v6;
    id v13 = v7;
    dispatch_async(v8, v11);

    uint64_t v9 = v12;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 oslog];
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSetControl _successControl:completion:].cold.1();
    }
  }
}

uint64_t __52__MAAutoAssetSetControl__successControl_completion___block_invoke(uint64_t a1)
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
    _os_log_impl( &dword_18718F000,  v3,  OS_LOG_TYPE_DEFAULT,  "MA-auto-set-control{_successControl} | %{public}@ | SUCCESS",  (uint8_t *)&v6,  0xCu);
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
    -[MAAutoAssetSetControl completionDispatchQueue](self, "completionDispatchQueue");
    uint64_t v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __95__MAAutoAssetSetControl__failedControl_withErrorCode_withResponseError_description_completion___block_invoke;
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
      -[MAAutoAssetSetControl _failedControl:withErrorCode:withResponseError:description:completion:].cold.1();
    }
  }
}

void __95__MAAutoAssetSetControl__failedControl_withErrorCode_withResponseError_description_completion___block_invoke( uint64_t a1)
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
    __95__MAAutoAssetSetControl__failedControl_withErrorCode_withResponseError_description_completion___block_invoke_cold_1( a1,  (uint64_t)v2,  v5);
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
    -[MAAutoAssetSetControl completionDispatchQueue](self, "completionDispatchQueue");
    uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __81__MAAutoAssetSetControl__successControlSummary_withJobSummaryEntries_completion___block_invoke;
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
      -[MAAutoAssetSetControl _successControlSummary:withJobSummaryEntries:completion:].cold.1();
    }
  }
}

uint64_t __81__MAAutoAssetSetControl__successControlSummary_withJobSummaryEntries_completion___block_invoke( uint64_t a1)
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
    _os_log_impl( &dword_18718F000,  v3,  OS_LOG_TYPE_DEFAULT,  "MA-auto-set-control{_successControlSummary} | %{public}@ | SUCCESS",  (uint8_t *)&v6,  0xCu);
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
    -[MAAutoAssetSetControl completionDispatchQueue](self, "completionDispatchQueue");
    id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __102__MAAutoAssetSetControl__failedControlSummary_withErrorCode_withResponseError_description_completion___block_invoke;
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
      -[MAAutoAssetSetControl _failedControlSummary:withErrorCode:withResponseError:description:completion:].cold.1();
    }
  }
}

void __102__MAAutoAssetSetControl__failedControlSummary_withErrorCode_withResponseError_description_completion___block_invoke( uint64_t a1)
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
    __102__MAAutoAssetSetControl__failedControlSummary_withErrorCode_withResponseError_description_completion___block_invoke_cold_1( a1,  (uint64_t)v2,  v5);
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
    -[MAAutoAssetSetControl completionDispatchQueue](self, "completionDispatchQueue");
    uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __86__MAAutoAssetSetControl__successControlLockSummary_withLockSummaryEntries_completion___block_invoke;
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
      -[MAAutoAssetSetControl _successControlLockSummary:withLockSummaryEntries:completion:].cold.1();
    }
  }
}

uint64_t __86__MAAutoAssetSetControl__successControlLockSummary_withLockSummaryEntries_completion___block_invoke( uint64_t a1)
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
    _os_log_impl( &dword_18718F000,  v3,  OS_LOG_TYPE_DEFAULT,  "MA-auto-set-control{_successControlLockSummary} | %{public}@ | SUCCESS",  (uint8_t *)&v6,  0xCu);
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
    -[MAAutoAssetSetControl completionDispatchQueue](self, "completionDispatchQueue");
    id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __106__MAAutoAssetSetControl__failedControlLockSummary_withErrorCode_withResponseError_description_completion___block_invoke;
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
      -[MAAutoAssetSetControl _failedControlLockSummary:withErrorCode:withResponseError:description:completion:].cold.1();
    }
  }
}

void __106__MAAutoAssetSetControl__failedControlLockSummary_withErrorCode_withResponseError_description_completion___block_invoke( uint64_t a1)
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
    __106__MAAutoAssetSetControl__failedControlLockSummary_withErrorCode_withResponseError_description_completion___block_invoke_cold_1( a1,  (uint64_t)v2,  v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

- (void)_successControlOverview:(id)a3 withOverviewEntries:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    -[MAAutoAssetSetControl completionDispatchQueue](self, "completionDispatchQueue");
    uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __80__MAAutoAssetSetControl__successControlOverview_withOverviewEntries_completion___block_invoke;
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
      -[MAAutoAssetSetControl _successControlOverview:withOverviewEntries:completion:].cold.1();
    }
  }
}

uint64_t __80__MAAutoAssetSetControl__successControlOverview_withOverviewEntries_completion___block_invoke( uint64_t a1)
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
    _os_log_impl( &dword_18718F000,  v3,  OS_LOG_TYPE_DEFAULT,  "MA-auto-set-control{_successControlOverview} | %{public}@ | SUCCESS",  (uint8_t *)&v6,  0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

- (void)_failedControlOverview:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v15)
  {
    -[MAAutoAssetSetControl completionDispatchQueue](self, "completionDispatchQueue");
    id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __103__MAAutoAssetSetControl__failedControlOverview_withErrorCode_withResponseError_description_completion___block_invoke;
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
      -[MAAutoAssetSetControl _failedControlOverview:withErrorCode:withResponseError:description:completion:].cold.1();
    }
  }
}

void __103__MAAutoAssetSetControl__failedControlOverview_withErrorCode_withResponseError_description_completion___block_invoke( uint64_t a1)
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
    __103__MAAutoAssetSetControl__failedControlOverview_withErrorCode_withResponseError_description_completion___block_invoke_cold_1( a1,  (uint64_t)v2,  v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

- (void)_successControlInstanceInfo:(id)a3 withInstanceInfo:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    -[MAAutoAssetSetControl completionDispatchQueue](self, "completionDispatchQueue");
    uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __81__MAAutoAssetSetControl__successControlInstanceInfo_withInstanceInfo_completion___block_invoke;
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
      -[MAAutoAssetSetControl _successControlInstanceInfo:withInstanceInfo:completion:].cold.1();
    }
  }
}

uint64_t __81__MAAutoAssetSetControl__successControlInstanceInfo_withInstanceInfo_completion___block_invoke( uint64_t a1)
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
    _os_log_impl( &dword_18718F000,  v3,  OS_LOG_TYPE_DEFAULT,  "MA-auto-set-control{_successControlInstanceInfo} | %{public}@ | SUCCESS",  (uint8_t *)&v6,  0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

- (void)_failedControlInstanceInfo:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v15)
  {
    -[MAAutoAssetSetControl completionDispatchQueue](self, "completionDispatchQueue");
    id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __107__MAAutoAssetSetControl__failedControlInstanceInfo_withErrorCode_withResponseError_description_completion___block_invoke;
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
      -[MAAutoAssetSetControl _failedControlInstanceInfo:withErrorCode:withResponseError:description:completion:].cold.1();
    }
  }
}

void __107__MAAutoAssetSetControl__failedControlInstanceInfo_withErrorCode_withResponseError_description_completion___block_invoke( uint64_t a1)
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
    __107__MAAutoAssetSetControl__failedControlInstanceInfo_withErrorCode_withResponseError_description_completion___block_invoke_cold_1( a1,  (uint64_t)v2,  v5);
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

+ (void)frameworkInstanceSetLogDomain
{
  if (frameworkInstanceSetLogDomain_frameworkLogDomainOnce != -1) {
    dispatch_once(&frameworkInstanceSetLogDomain_frameworkLogDomainOnce, &__block_literal_global_331);
  }
}

void __54__MAAutoAssetSetControl_frameworkInstanceSetLogDomain__block_invoke()
{
  id v1 = (id)[objc_alloc(NSString) initWithFormat:@"%@.%s", @"com.apple.MAAutoSetControlClient", getprogname()];
  [MEMORY[0x189612760] sharedCore];
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 useDomain:v1];
}

+ (id)frameworkDispatchQueue
{
  if (frameworkDispatchQueue_frameworkQueueOnce != -1) {
    dispatch_once(&frameworkDispatchQueue_frameworkQueueOnce, &__block_literal_global_335);
  }
  return (id)frameworkDispatchQueue_frameworkQueue;
}

void __47__MAAutoAssetSetControl_frameworkDispatchQueue__block_invoke()
{
  v0 = (const char *)[@"com.apple.MobileAsset.autoassetcontrol.framework" UTF8String];
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v1 = dispatch_queue_create(v0, v3);
  id v2 = (void *)frameworkDispatchQueue_frameworkQueue;
  frameworkDispatchQueue_frameworkQueue = (uint64_t)v1;
}

+ (id)frameworkInstanceUUID
{
  if (frameworkInstanceUUID_frameworkUUIDOnce != -1) {
    dispatch_once(&frameworkInstanceUUID_frameworkUUIDOnce, &__block_literal_global_336);
  }
  return (id)frameworkInstanceUUID_frameworkUUID;
}

void __46__MAAutoAssetSetControl_frameworkInstanceUUID__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x189607AB8]);
  dispatch_queue_t v1 = (void *)frameworkInstanceUUID_frameworkUUID;
  frameworkInstanceUUID_frameworkUUID = (uint64_t)v0;
}

+ (int64_t)waitOnSemaphore:(id)a3 withTimeout:(int64_t)a4
{
  return dispatch_semaphore_wait((dispatch_semaphore_t)a3, 0xFFFFFFFFFFFFFFFFLL);
}

- (NSString)controlClientDomainName
{
  return self->_controlClientDomainName;
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

- (void)_knownAssetSummary:limitedToSetIdentifiers:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto-set-control{knownAssetSummary} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)_lockedAssetSetSummary:limitedToSetIdentifiers:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto-set-control{lockedAssetSetSummary} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)_stagedAssetSetSummary:limitedToSetIdentifiers:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto-set-control{stagedAssetSetSummary} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)_activeSetJobSummary:limitedToSetIdentifiers:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto-set-control{activeSetJobSummary} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)_scheduledSetJobSummary:limitedToSetIdentifiers:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto-set-control{scheduledSetJobSummary} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)_autoAssetsOverview:limitedToSetIdentifiers:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto-set-control{assetSetsOverview} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)_autoAssetInstanceInfo:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto-set-control{autoAssetInstanceInfo} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)_successControl:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1( &dword_18718F000,  v0,  v1,  "MA-auto-set-control{_successControl} | %{public}@ | no client completion block",  v2);
  OUTLINED_FUNCTION_8();
}

- (void)_failedControl:withErrorCode:withResponseError:description:completion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2( &dword_18718F000,  v0,  (uint64_t)v0,  "MA-auto-set-control{_failedControl} | %{public}@ | no client completion block | %{public}@",  v1);
  OUTLINED_FUNCTION_8();
}

void __95__MAAutoAssetSetControl__failedControl_withErrorCode_withResponseError_description_completion___block_invoke_cold_1( uint64_t a1,  uint64_t a2,  os_log_s *a3)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2( &dword_18718F000,  a3,  v5,  "MA-auto-set-control{_failedControl} | %{public}@ | error:%{public}@",  v6);

  OUTLINED_FUNCTION_6();
}

- (void)_successControlSummary:withJobSummaryEntries:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1( &dword_18718F000,  v0,  v1,  "MA-auto-set-control{_successControlSummary} | %{public}@ | no client completion block",  v2);
  OUTLINED_FUNCTION_8();
}

- (void)_failedControlSummary:withErrorCode:withResponseError:description:completion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2( &dword_18718F000,  v0,  (uint64_t)v0,  "MA-auto-set-control{_failedControlSummary} | %{public}@ | no client completion block | %{public}@",  v1);
  OUTLINED_FUNCTION_8();
}

void __102__MAAutoAssetSetControl__failedControlSummary_withErrorCode_withResponseError_description_completion___block_invoke_cold_1( uint64_t a1,  uint64_t a2,  os_log_s *a3)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2( &dword_18718F000,  a3,  v5,  "MA-auto-set-control{_failedControlSummary} | %{public}@ | error:%{public}@",  v6);

  OUTLINED_FUNCTION_6();
}

- (void)_successControlLockSummary:withLockSummaryEntries:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1( &dword_18718F000,  v0,  v1,  "MA-auto-set-control{_successControlLockSummary} | %{public}@ | no client completion block",  v2);
  OUTLINED_FUNCTION_8();
}

- (void)_failedControlLockSummary:withErrorCode:withResponseError:description:completion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2( &dword_18718F000,  v0,  (uint64_t)v0,  "MA-auto-set-control{_failedControlLockSummary} | %{public}@ | no client completion block | %{public}@",  v1);
  OUTLINED_FUNCTION_8();
}

void __106__MAAutoAssetSetControl__failedControlLockSummary_withErrorCode_withResponseError_description_completion___block_invoke_cold_1( uint64_t a1,  uint64_t a2,  os_log_s *a3)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2( &dword_18718F000,  a3,  v5,  "MA-auto-set-control{_failedControlLockSummary} | %{public}@ | error:%{public}@",  v6);

  OUTLINED_FUNCTION_6();
}

- (void)_successControlOverview:withOverviewEntries:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1( &dword_18718F000,  v0,  v1,  "MA-auto-set-control{_successControlOverview} | %{public}@ | no client completion block",  v2);
  OUTLINED_FUNCTION_8();
}

- (void)_failedControlOverview:withErrorCode:withResponseError:description:completion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2( &dword_18718F000,  v0,  (uint64_t)v0,  "MA-auto-set-control{_failedControlOverview} | %{public}@ | no client completion block | %{public}@",  v1);
  OUTLINED_FUNCTION_8();
}

void __103__MAAutoAssetSetControl__failedControlOverview_withErrorCode_withResponseError_description_completion___block_invoke_cold_1( uint64_t a1,  uint64_t a2,  os_log_s *a3)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2( &dword_18718F000,  a3,  v5,  "MA-auto-set-control{_failedControlOverview} | %{public}@ | error:%{public}@",  v6);

  OUTLINED_FUNCTION_6();
}

- (void)_successControlInstanceInfo:withInstanceInfo:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1( &dword_18718F000,  v0,  v1,  "MA-auto-set-control{_successControlInstanceInfo} | %{public}@ | no client completion block",  v2);
  OUTLINED_FUNCTION_8();
}

- (void)_failedControlInstanceInfo:withErrorCode:withResponseError:description:completion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2( &dword_18718F000,  v0,  (uint64_t)v0,  "MA-auto-set-control{_failedControlInstanceInfo} | %{public}@ | no client completion block | %{public}@",  v1);
  OUTLINED_FUNCTION_8();
}

void __107__MAAutoAssetSetControl__failedControlInstanceInfo_withErrorCode_withResponseError_description_completion___block_invoke_cold_1( uint64_t a1,  uint64_t a2,  os_log_s *a3)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2( &dword_18718F000,  a3,  v5,  "MA-auto-set-control{_failedControlInstanceInfo} | %{public}@ | error:%{public}@",  v6);

  OUTLINED_FUNCTION_6();
}

@end