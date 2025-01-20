@interface SUCoreConfigServer
+ (id)_generateStateTable;
+ (id)allowedServerKeys;
+ (id)allowedServerProjects;
+ (id)persistedStateFilePath;
+ (id)sharedServerSettings;
+ (void)persistedStateFilePath;
- (MAAsset)lastLocatedAsset;
- (NSDate)lastScanTime;
- (NSDate)nextScanTime;
- (NSMutableDictionary)listenerDelegates;
- (NSString)uuidString;
- (NSTimer)timer;
- (OS_dispatch_queue)clientDelegateQueue;
- (SUCoreConfig)coreConfig;
- (SUCoreConfigServer)init;
- (SUCoreFSM)stateMachine;
- (SUCorePersistedState)persistedState;
- (id)_nextScanTimeFromDate:(id)a3;
- (id)_stateSafeDetermineNextScanTime;
- (id)_stateSafeDownloadOptions;
- (id)_stateSafeLoadUUIDString;
- (id)_stateSafeSelectBestAssetFromArray:(id)a3 error:(id *)a4;
- (id)_stateSafeSelectBestAssetFromMultipleAssetArray:(id)a3 bestAsset:(id *)a4 selectionReason:(id *)a5;
- (id)scheduledActivityName;
- (int64_t)actionConfigAdjustSettings:(id)a3 error:(id *)a4;
- (int64_t)actionConfigDownloadAsset:(id)a3 error:(id *)a4;
- (int64_t)actionConfigDownloadCatalog:(id)a3 error:(id *)a4;
- (int64_t)actionConfigQueryAsset:(id)a3 error:(id *)a4;
- (int64_t)actionConfigScheduleScan:(id)a3 error:(id *)a4;
- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4;
- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8;
- (void)_stateSafeInformDelegatesOfConfiguration:(id)a3 error:(id)a4;
- (void)_stateSafeResetState;
- (void)_stateSafeSendInstalledEventWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_stateSafeSendNewEvent:(id)a3 success:(BOOL)a4 error:(id)a5;
- (void)_stateSafeSendScheduledEventWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_stateSafeUpdateState;
- (void)dealloc;
- (void)installServerSettings;
- (void)listenForConfigChanges:(id)a3 withName:(id)a4;
- (void)setClientDelegateQueue:(id)a3;
- (void)setCoreConfig:(id)a3;
- (void)setLastLocatedAsset:(id)a3;
- (void)setLastScanTime:(id)a3;
- (void)setListenerDelegates:(id)a3;
- (void)setNextScanTime:(id)a3;
- (void)setPersistedState:(id)a3;
- (void)setStateMachine:(id)a3;
- (void)setTimer:(id)a3;
- (void)setUuidString:(id)a3;
@end

@implementation SUCoreConfigServer

+ (id)sharedServerSettings
{
  if (sharedServerSettings_onceInit != -1) {
    dispatch_once(&sharedServerSettings_onceInit, &__block_literal_global_11);
  }
  return (id)sharedServerSettings___sharedConfig;
}

void __42__SUCoreConfigServer_sharedServerSettings__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___SUCoreConfigServer);
  v1 = (void *)sharedServerSettings___sharedConfig;
  sharedServerSettings___sharedConfig = (uint64_t)v0;
}

- (SUCoreConfigServer)init
{
  v37.receiver = self;
  v37.super_class = (Class)&OBJC_CLASS___SUCoreConfigServer;
  v2 = -[SUCoreConfigServer init](&v37, sel_init);
  v3 = v2;
  if (v2)
  {
    uuidString = v2->_uuidString;
    v2->_uuidString = 0LL;

    lastScanTime = v3->_lastScanTime;
    v3->_lastScanTime = 0LL;

    lastLocatedAsset = v3->_lastLocatedAsset;
    v3->_lastLocatedAsset = 0LL;

    timer = v3->_timer;
    v3->_timer = 0LL;

    stateMachine = v3->_stateMachine;
    v3->_stateMachine = 0LL;

    persistedState = v3->_persistedState;
    v3->_persistedState = 0LL;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    listenerDelegates = v3->_listenerDelegates;
    v3->_listenerDelegates = v10;

    id v12 = objc_alloc(MEMORY[0x189612768]);
    uint64_t v13 = [v12 initWithProjectName:*MEMORY[0x189612850]];
    coreConfig = v3->_coreConfig;
    v3->_coreConfig = (SUCoreConfig *)v13;

    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v16 = dispatch_queue_create("SUCoreConfigClientDelegateQueue", v15);
    clientDelegateQueue = v3->_clientDelegateQueue;
    v3->_clientDelegateQueue = (OS_dispatch_queue *)v16;
    v18 = +[SUCoreConfigServer _generateStateTable](&OBJC_CLASS___SUCoreConfigServer, "_generateStateTable");
    uint64_t v19 = [objc_alloc(MEMORY[0x189612798]) initMachine:@"SUCoreConfigServer" withTable:v18 startingIn:@"ConfigIdle"];
    v20 = v3->_stateMachine;
    v3->_stateMachine = (SUCoreFSM *)v19;

    uint64_t v32 = MEMORY[0x1895F87A8];
    uint64_t v33 = 3221225472LL;
    v34 = __26__SUCoreConfigServer_init__block_invoke;
    v35 = &unk_18A0F17D0;
    v36 = v3;
    [v18 enumerateKeysAndObjectsUsingBlock:&v32];
    id v21 = objc_alloc(MEMORY[0x1896127B0]);
    v22 = -[SUCoreFSM extendedStateQueue](v3->_stateMachine, "extendedStateQueue");
    uint64_t v23 = +[SUCoreConfigServer persistedStateFilePath](&OBJC_CLASS___SUCoreConfigServer, "persistedStateFilePath");
    v24 = (void *)v23;
    if (v23) {
      v25 = (const __CFString *)v23;
    }
    else {
      v25 = @"/private/var/tmp/SUCoreConfig.state";
    }
    objc_msgSend(NSString, "stringWithFormat:", @"%d", 1, v32, v33, v34, v35);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v27 = [v21 initWithDispatchQueue:v22 withPersistencePath:v25 forPolicyVersion:v26];
    v28 = v3->_persistedState;
    v3->_persistedState = (SUCorePersistedState *)v27;

    -[SUCoreFSM activateMachine](v3->_stateMachine, "activateMachine");
    v29 = v3->_stateMachine;
    v30 = objc_alloc_init(&OBJC_CLASS___SUCoreConfigParam);
    -[SUCoreFSM postEvent:withInfo:](v29, "postEvent:withInfo:", @"ConfigAPIInstall", v30);
  }

  return v3;
}

void __26__SUCoreConfigServer_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __26__SUCoreConfigServer_init__block_invoke_2;
  v7[3] = &unk_18A0F17A8;
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  id v6 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v7];
}

void __26__SUCoreConfigServer_init__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *MEMORY[0x1896127D0];
  id v6 = a2;
  [a3 safeStringForKey:v5];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(*(void *)(a1 + 32) + 72) registerAction:v7 ForEvent:v6 inState:*(void *)(a1 + 40) usingDelegate:*(void *)(a1 + 32) withInfoClass:objc_opt_class()];
}

- (void)dealloc
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___SUCoreConfigServer;
  -[SUCoreConfigServer dealloc](&v4, sel_dealloc);
}

- (void)installServerSettings
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 oslog];
  objc_super v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl( &dword_187A54000,  v4,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConfig] API: Install server settings API request issued; posting install event",
      v7,
      2u);
  }

  -[SUCoreConfigServer stateMachine](self, "stateMachine");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = objc_alloc_init(&OBJC_CLASS___SUCoreConfigParam);
  [v5 postEvent:@"ConfigAPIInstall" withInfo:v6];
}

- (void)listenForConfigChanges:(id)a3 withName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  -[SUCoreConfigServer stateMachine](self, "stateMachine");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 extendedStateQueue];
  v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __54__SUCoreConfigServer_listenForConfigChanges_withName___block_invoke;
  block[3] = &unk_18A0F03C8;
  id v14 = v8;
  id v15 = v7;
  dispatch_queue_t v16 = self;
  id v11 = v7;
  id v12 = v8;
  dispatch_async(v10, block);
}

void __54__SUCoreConfigServer_listenForConfigChanges_withName___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896127A0] sharedLogger];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = @"YES";
    uint64_t v5 = *(void *)(a1 + 40);
    if (!*(void *)(a1 + 32)) {
      objc_super v4 = @"NO";
    }
    int v12 = 138543618;
    uint64_t v13 = v4;
    __int16 v14 = 2114;
    uint64_t v15 = v5;
    _os_log_impl( &dword_187A54000,  v3,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConfig] API: Adding listener delegate (present=%{public}@) with name: %{public}@",  (uint8_t *)&v12,  0x16u);
  }

  [*(id *)(a1 + 48) listenerDelegates];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 setSafeObject:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];

  [MEMORY[0x1896127A0] sharedLogger];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 oslog];
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 48) listenerDelegates];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 allKeys];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsJoinedByString:", @", ");
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    int v12 = 138543362;
    uint64_t v13 = v11;
    _os_log_impl( &dword_187A54000,  v8,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConfig] API: Known listeners still active: %{public}@",  (uint8_t *)&v12,  0xCu);
  }
}

- (id)scheduledActivityName
{
  if (scheduledActivityName_onceToken != -1) {
    dispatch_once(&scheduledActivityName_onceToken, &__block_literal_global_255);
  }
  return (id)scheduledActivityName___activityName;
}

void __43__SUCoreConfigServer_scheduledActivityName__block_invoke()
{
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 bundleIdentifier];
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  v1 = @"SUCoreConfigScheduledScan";
  if (v3)
  {
    [NSString stringWithFormat:@"%@.%@", v3, @"SUCoreConfigScheduledScan"];
    v1 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }

  v2 = (void *)scheduledActivityName___activityName;
  scheduledActivityName___activityName = (uint64_t)v1;
}

+ (id)allowedServerProjects
{
  if (allowedServerProjects_onceToken != -1) {
    dispatch_once(&allowedServerProjects_onceToken, &__block_literal_global_261);
  }
  return (id)allowedServerProjects___allowedProjects;
}

void __43__SUCoreConfigServer_allowedServerProjects__block_invoke()
{
  v5[6] = *MEMORY[0x1895F89C0];
  uint64_t v0 = *MEMORY[0x189612860];
  v5[0] = *MEMORY[0x189612850];
  v5[1] = v0;
  uint64_t v1 = *MEMORY[0x189612858];
  v5[2] = *MEMORY[0x189612848];
  v5[3] = v1;
  uint64_t v2 = *MEMORY[0x189612840];
  v5[4] = *MEMORY[0x189612838];
  v5[5] = v2;
  uint64_t v3 = [MEMORY[0x189603F18] arrayWithObjects:v5 count:6];
  objc_super v4 = (void *)allowedServerProjects___allowedProjects;
  allowedServerProjects___allowedProjects = v3;
}

+ (id)allowedServerKeys
{
  if (allowedServerKeys_onceToken != -1) {
    dispatch_once(&allowedServerKeys_onceToken, &__block_literal_global_263);
  }
  return (id)allowedServerKeys___allowedKeys;
}

void __39__SUCoreConfigServer_allowedServerKeys__block_invoke()
{
  v7[10] = *MEMORY[0x1895F89C0];
  uint64_t v0 = *MEMORY[0x189612828];
  v7[0] = *MEMORY[0x189612818];
  v7[1] = v0;
  uint64_t v1 = *MEMORY[0x189612800];
  v7[2] = *MEMORY[0x1896127D8];
  v7[3] = v1;
  uint64_t v2 = *MEMORY[0x1896127E8];
  void v7[4] = *MEMORY[0x1896127E0];
  v7[5] = v2;
  uint64_t v3 = *MEMORY[0x1896127F8];
  v7[6] = *MEMORY[0x1896127F0];
  v7[7] = v3;
  uint64_t v4 = *MEMORY[0x189612810];
  v7[8] = *MEMORY[0x189612830];
  v7[9] = v4;
  uint64_t v5 = [MEMORY[0x189603F18] arrayWithObjects:v7 count:10];
  id v6 = (void *)allowedServerKeys___allowedKeys;
  allowedServerKeys___allowedKeys = v5;
}

+ (id)persistedStateFilePath
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 fileExistsAtPath:@"/var/MobileSoftwareUpdate/Controller/SoftwareUpdateCore"];

  if ((v3 & 1) != 0
    || ([MEMORY[0x1896078A8] defaultManager],
        uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(),
        id v10 = 0LL,
        [v4 createDirectoryAtPath:@"/var/MobileSoftwareUpdate/Controller/SoftwareUpdateCore" withIntermediateDirectories:1 attributes:0 error:&v10],  id v5 = v10,  v4,  !v5))
  {
    [@"/var/MobileSoftwareUpdate/Controller/SoftwareUpdateCore" stringByAppendingPathComponent:@"SUCoreConfig.state"];
    return (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 oslog];
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      +[SUCoreConfigServer persistedStateFilePath].cold.1((uint64_t)v5, v7, v8);
    }

    return 0LL;
  }

+ (id)_generateStateTable
{
  v80[7] = *MEMORY[0x1895F89C0];
  v79[0] = @"ConfigIdle";
  v77 = @"ConfigAPIInstall";
  uint64_t v3 = *MEMORY[0x1896127D0];
  v75[0] = *MEMORY[0x1896129F8];
  uint64_t v2 = v75[0];
  v75[1] = v3;
  v76[0] = @"ConfigScheduled";
  v76[1] = @"ConfigScheduleScan";
  [MEMORY[0x189603F68] dictionaryWithObjects:v76 forKeys:v75 count:2];
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = v30;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v80[0] = v29;
  v79[1] = @"ConfigDownloadingCatalog";
  v73[0] = @"ConfigAPIInstall";
  uint64_t v71 = v3;
  uint64_t v72 = *MEMORY[0x1896129D8];
  uint64_t v4 = v72;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v28;
  v73[1] = @"ConfigPhaseComplete";
  v69[0] = v2;
  v69[1] = v3;
  v70[0] = @"ConfigQueryingAsset";
  v70[1] = @"ConfigQueryAsset";
  [MEMORY[0x189603F68] dictionaryWithObjects:v70 forKeys:v69 count:2];
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  v74[1] = v27;
  v73[2] = @"ConfigPhaseFailed";
  v67[0] = v2;
  v67[1] = v3;
  v68[0] = @"ConfigScheduled";
  v68[1] = @"ConfigScheduleScan";
  [MEMORY[0x189603F68] dictionaryWithObjects:v68 forKeys:v67 count:2];
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v74[2] = v26;
  [MEMORY[0x189603F68] dictionaryWithObjects:v74 forKeys:v73 count:3];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v80[1] = v25;
  v79[2] = @"ConfigQueryingAsset";
  v65[0] = @"ConfigAPIInstall";
  uint64_t v63 = v3;
  uint64_t v64 = v4;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = v24;
  v65[1] = @"ConfigPhaseComplete";
  v61[0] = v2;
  v61[1] = v3;
  v62[0] = @"ConfigDownloadingAsset";
  v62[1] = @"ConfigDownloadAsset";
  [MEMORY[0x189603F68] dictionaryWithObjects:v62 forKeys:v61 count:2];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = v23;
  v65[2] = @"ConfigPhaseFailed";
  v59[0] = v2;
  v59[1] = v3;
  v60[0] = @"ConfigScheduled";
  v60[1] = @"ConfigScheduleScan";
  [MEMORY[0x189603F68] dictionaryWithObjects:v60 forKeys:v59 count:2];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v66[2] = v22;
  [MEMORY[0x189603F68] dictionaryWithObjects:v66 forKeys:v65 count:3];
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  v80[2] = v21;
  v79[3] = @"ConfigDownloadingAsset";
  uint64_t v56 = v4;
  v57[0] = @"ConfigAPIInstall";
  uint64_t v55 = v3;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v56 forKeys:&v55 count:1];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v20;
  v57[1] = @"ConfigPhaseComplete";
  v53[0] = v2;
  v53[1] = v3;
  v54[0] = @"ConfigAdjusting";
  v54[1] = @"ConfigAdjustSettings";
  [MEMORY[0x189603F68] dictionaryWithObjects:v54 forKeys:v53 count:2];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = v19;
  v57[2] = @"ConfigPhaseFailed";
  v51[0] = v2;
  v51[1] = v3;
  v52[0] = @"ConfigScheduled";
  v52[1] = @"ConfigScheduleScan";
  [MEMORY[0x189603F68] dictionaryWithObjects:v52 forKeys:v51 count:2];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v58[2] = v18;
  [MEMORY[0x189603F68] dictionaryWithObjects:v58 forKeys:v57 count:3];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v80[3] = v17;
  v79[4] = @"ConfigAdjusting";
  uint64_t v48 = v4;
  v49[0] = @"ConfigAPIInstall";
  uint64_t v47 = v3;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v16;
  v49[1] = @"ConfigPhaseComplete";
  v45[0] = v2;
  v45[1] = v3;
  v46[0] = @"ConfigScheduled";
  v46[1] = @"ConfigScheduleScan";
  [MEMORY[0x189603F68] dictionaryWithObjects:v46 forKeys:v45 count:2];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v5;
  v49[2] = @"ConfigPhaseFailed";
  v43[0] = v2;
  v43[1] = v3;
  v44[0] = @"ConfigScheduled";
  v44[1] = @"ConfigScheduleScan";
  [MEMORY[0x189603F68] dictionaryWithObjects:v44 forKeys:v43 count:2];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v50[2] = v6;
  [MEMORY[0x189603F68] dictionaryWithObjects:v50 forKeys:v49 count:3];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v80[4] = v7;
  v79[5] = @"ConfigScheduled";
  v39[0] = v2;
  v39[1] = v3;
  v40[0] = @"ConfigDownloadingCatalog";
  v40[1] = @"ConfigDownloadCatalog";
  v41[0] = @"ConfigAPIInstall";
  [MEMORY[0x189603F68] dictionaryWithObjects:v40 forKeys:v39 count:2];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v8;
  v41[1] = @"ConfigPhaseComplete";
  uint64_t v37 = v3;
  v38 = @"ConfigScheduleScan";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v9;
  v41[2] = @"ConfigPhaseFailed";
  uint64_t v35 = v3;
  v36 = @"ConfigScheduleScan";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v10;
  [MEMORY[0x189603F68] dictionaryWithObjects:v42 forKeys:v41 count:3];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  v80[5] = v11;
  v79[6] = *MEMORY[0x1896129E8];
  uint64_t v33 = *MEMORY[0x1896129E0];
  uint64_t v31 = v2;
  uint64_t v32 = *MEMORY[0x1896129F0];
  [MEMORY[0x189603F68] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  int v12 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v12;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  v80[6] = v13;
  [MEMORY[0x189603F68] dictionaryWithObjects:v80 forKeys:v79 count:7];
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8
{
  id v11 = a3;
  id v12 = a6;
  if ([v11 isEqualToString:*MEMORY[0x1896129D8]])
  {
    int64_t v13 = 0LL;
  }

  else
  {
    if ([v11 isEqualToString:@"ConfigDownloadCatalog"])
    {
      int64_t v14 = -[SUCoreConfigServer actionConfigDownloadCatalog:error:]( self,  "actionConfigDownloadCatalog:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"ConfigQueryAsset"])
    {
      int64_t v14 = -[SUCoreConfigServer actionConfigQueryAsset:error:](self, "actionConfigQueryAsset:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"ConfigDownloadAsset"])
    {
      int64_t v14 = -[SUCoreConfigServer actionConfigDownloadAsset:error:](self, "actionConfigDownloadAsset:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"ConfigAdjustSettings"])
    {
      int64_t v14 = -[SUCoreConfigServer actionConfigAdjustSettings:error:](self, "actionConfigAdjustSettings:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"ConfigScheduleScan"])
    {
      int64_t v14 = -[SUCoreConfigServer actionConfigScheduleScan:error:](self, "actionConfigScheduleScan:error:", v12, a8);
    }

    else
    {
      int64_t v14 = -[SUCoreConfigServer actionUnknownAction:error:](self, "actionUnknownAction:error:", v11, a8);
    }

    int64_t v13 = v14;
  }

  return v13;
}

- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4
{
  id v6 = (void *)MEMORY[0x189612760];
  id v7 = a3;
  [v6 sharedCore];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = (void *)NSString;
  -[SUCoreConfigServer stateMachine](self, "stateMachine");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = (void *)[v10 copyCurrentStateProtected];
  [v9 stringWithFormat:@"SUCoreConfig Unknown Action %@ for state %@", v7, v11];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  [v8 buildError:8102 underlying:0 description:v12];
  int64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189612778] sharedDiag];
  int64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 localizedDescription];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend( v14,  "trackAnomaly:forReason:withResult:withError:",  @"SUCoreConfig",  v15,  objc_msgSend(v13, "code"),  v13);

  if (a4) {
    *a4 = v13;
  }

  return 8102LL;
}

- (int64_t)actionConfigDownloadCatalog:(id)a3 error:(id *)a4
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  -[SUCoreConfigServer _stateSafeResetState](self, "_stateSafeResetState", a3, a4);
  -[SUCoreConfigServer _stateSafeDownloadOptions](self, "_stateSafeDownloadOptions");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x1896127A0] sharedLogger];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 oslog];
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = v5;
    _os_log_impl( &dword_187A54000,  v7,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConfig] Catalog: Starting download of configuration asset catalog with options: %{public}@",  buf,  0xCu);
  }

  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __56__SUCoreConfigServer_actionConfigDownloadCatalog_error___block_invoke;
  v9[3] = &unk_18A0F1598;
  v9[4] = self;
  [MEMORY[0x1896110E0] startCatalogDownload:@"com.apple.MobileAsset.SoftwareUpdateConfiguration" options:v5 completionWithError:v9];

  return 0LL;
}

void __56__SUCoreConfigServer_actionConfigDownloadCatalog_error___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  [MEMORY[0x1896127A0] sharedLogger];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 oslog];
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    MEMORY[0x1895B15BC](a2);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    int v15 = 138543618;
    uint64_t v16 = v8;
    __int16 v17 = 2048;
    uint64_t v18 = a2;
    _os_log_impl( &dword_187A54000,  v7,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConfig] Catalog: Catalog download completed with MADownloadResult: %{public}@ (%ld)",  (uint8_t *)&v15,  0x16u);
  }

  if (a2)
  {
    [MEMORY[0x189612760] sharedCore];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 buildError:8400 underlying:v5 description:@"Software update configuration catalog download failed"];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x1896127A0] sharedLogger];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 oslog];
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __56__SUCoreConfigServer_actionConfigDownloadCatalog_error___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) stateMachine];
    int64_t v13 = (SUCoreConfigParam *)objc_claimAutoreleasedReturnValue();
    int64_t v14 = -[SUCoreConfigParam initWithError:operation:]( objc_alloc(&OBJC_CLASS___SUCoreConfigParam),  "initWithError:operation:",  v10,  1LL);
    -[SUCoreConfigParam postEvent:withInfo:](v13, "postEvent:withInfo:", @"ConfigPhaseFailed", v14);
  }

  else
  {
    [*(id *)(a1 + 32) stateMachine];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    int64_t v13 = objc_alloc_init(&OBJC_CLASS___SUCoreConfigParam);
    [v10 postEvent:@"ConfigPhaseComplete" withInfo:v13];
  }
}

- (int64_t)actionConfigQueryAsset:(id)a3 error:(id *)a4
{
  v79[2] = *MEMORY[0x1895F89C0];
  v69 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithString:@"|"];
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1896110F0]) initWithType:@"com.apple.MobileAsset.SoftwareUpdateConfiguration"];
  [MEMORY[0x189603FE8] null];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = v5;
  [MEMORY[0x189612770] sharedDevice];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 buildVersion];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v79[1] = v7;
  [MEMORY[0x189603F18] arrayWithObjects:v79 count:2];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  id v9 = (void *)[v8 mutableCopy];
  [v4 addKeyValueArray:@"PrerequisiteBuilds" with:v9];

  [MEMORY[0x189603FE8] null];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = v10;
  [MEMORY[0x189612770] sharedDevice];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 productVersion];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  v78[1] = v12;
  [MEMORY[0x189603F18] arrayWithObjects:v78 count:2];
  int64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v14 = (void *)[v13 mutableCopy];
  [v4 addKeyValueArray:@"PrerequisiteOSVersions" with:v14];

  [MEMORY[0x189603FE8] null];
  int v15 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = v15;
  [MEMORY[0x189612770] sharedDevice];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 hwModelString];
  __int16 v17 = (void *)objc_claimAutoreleasedReturnValue();
  v77[1] = v17;
  [MEMORY[0x189603F18] arrayWithObjects:v77 count:2];
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = (void *)[v18 mutableCopy];
  [v4 addKeyValueArray:@"SupportedDeviceModels" with:v19];

  [MEMORY[0x189603FE8] null];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = v20;
  [MEMORY[0x189612770] sharedDevice];
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 buildVersion];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v76[1] = v22;
  [MEMORY[0x189603F18] arrayWithObjects:v76 count:2];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 componentsJoinedByString:@","];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v69 appendFormat:@"%@:%@|", @"PrerequisiteBuilds", v24];

  [MEMORY[0x189603FE8] null];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v75[0] = v25;
  [MEMORY[0x189612770] sharedDevice];
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v26 productVersion];
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
  v75[1] = v27;
  [MEMORY[0x189603F18] arrayWithObjects:v75 count:2];
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v28 componentsJoinedByString:@","];
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  [v69 appendFormat:@"%@:%@|", @"PrerequisiteOSVersions", v29];

  [MEMORY[0x189603FE8] null];
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v30;
  [MEMORY[0x189612770] sharedDevice];
  uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
  [v31 hwModelString];
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
  v74[1] = v32;
  [MEMORY[0x189603F18] arrayWithObjects:v74 count:2];
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v33 componentsJoinedByString:@","];
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  [v69 appendFormat:@"%@:%@|", @"SupportedDeviceModels", v34];

  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 addKeyValuePair:@"_CompatibilityVersion" with:v35];

  [MEMORY[0x189612770] sharedDevice];
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  [v36 deviceClass];
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 addKeyValuePair:@"Device" with:v37];

  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  [v69 appendFormat:@"%@:%@|", @"_CompatibilityVersion", v38];

  [MEMORY[0x189612770] sharedDevice];
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  [v39 deviceClass];
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  [v69 appendFormat:@"%@:%@|", @"Device", v40];

  [MEMORY[0x189612770] sharedDevice];
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  [v41 releaseType];
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    [MEMORY[0x189612770] sharedDevice];
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    [v43 releaseType];
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 addKeyValuePair:@"ReleaseType" with:v44];

    [MEMORY[0x189612770] sharedDevice];
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    [v45 releaseType];
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    [v69 appendFormat:@"%@:%@|", @"ReleaseType", v46];
  }

  else
  {
    [v4 addKeyValueNull:@"ReleaseType"];
    [v69 appendFormat:@"%@:Customer(null)|", @"ReleaseType"];
  }

  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v47 = (void *)objc_claimAutoreleasedReturnValue();
  [v47 oslog];
  uint64_t v48 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    [MEMORY[0x189612770] sharedDevice];
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v73 = 1;
    *(_WORD *)&v73[4] = 2114;
    *(void *)&v73[6] = v49;
    _os_log_impl( &dword_187A54000,  v48,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConfig] Query: Current device state (COMPATIBILITY_VERSION:%d): %{public}@",  buf,  0x12u);
  }

  [MEMORY[0x1896127A0] sharedLogger];
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  [v50 oslog];
  v51 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)v73 = v69;
    _os_log_impl( &dword_187A54000,  v51,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConfig] Query: Starting metadata query: %{public}@",  buf,  0xCu);
  }

  uint64_t v52 = [v4 queryMetaDataSync];
  [MEMORY[0x1896127A0] sharedLogger];
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  [v53 oslog];
  v54 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
  {
    MEMORY[0x1895B15C8](v52);
    uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(void *)v73 = v55;
    *(_WORD *)&v73[8] = 2048;
    *(void *)&v73[10] = v52;
    _os_log_impl( &dword_187A54000,  v54,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConfig] Query: Metadata query completed with result: %{public}@ %ld",  buf,  0x16u);
  }

  if (v52)
  {
    [MEMORY[0x189612760] sharedCore];
    uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607870] errorWithDomain:@"com.apple.MobileAssetError.Query" code:v52 userInfo:0];
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    [v56 buildError:8401 underlying:v57 description:@"No available configuration assets found (failed to query metadata)"];
    id v58 = (id)objc_claimAutoreleasedReturnValue();

    v59 = 0LL;
  }

  else
  {
    [v4 results];
    uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
    id v71 = 0LL;
    v59 = -[SUCoreConfigServer _stateSafeSelectBestAssetFromArray:error:]( self,  "_stateSafeSelectBestAssetFromArray:error:",  v56,  &v71);
    id v58 = v71;
  }

  if (v58)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    [v60 oslog];
    v61 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
      -[SUCoreConfigServer actionConfigQueryAsset:error:].cold.1();
    }
    v62 = -[SUCoreConfigServer stateMachine](self, "stateMachine");
    uint64_t v63 = -[SUCoreConfigParam initWithError:operation:]( objc_alloc(&OBJC_CLASS___SUCoreConfigParam),  "initWithError:operation:",  v58,  1LL);
    [v62 postEvent:@"ConfigPhaseFailed" withInfo:v63];

    if (a4) {
      *a4 = v58;
    }
    int64_t v64 = [v58 code];
  }

  else
  {
    v65 = -[SUCoreConfigServer stateMachine](self, "stateMachine");
    v66 = -[SUCoreConfigParam initWithLocatedAsset:]( objc_alloc(&OBJC_CLASS___SUCoreConfigParam),  "initWithLocatedAsset:",  v59);
    [v65 followupEvent:@"ConfigPhaseComplete" withInfo:v66];

    int64_t v64 = 0LL;
  }

  return v64;
}

- (id)_stateSafeSelectBestAssetFromArray:(id)a3 error:(id *)a4
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  -[SUCoreConfigServer stateMachine](self, "stateMachine");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 extendedStateQueue];
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (!v6)
  {
    [MEMORY[0x189612760] sharedCore];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = v11;
    int64_t v13 = @"No available configuration assets found (query not present)";
    uint64_t v14 = 8402LL;
    goto LABEL_7;
  }

  if (![v6 count])
  {
    [MEMORY[0x189612760] sharedCore];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = v11;
    int64_t v13 = @"No available configuration assets found (query returned no assets)";
    uint64_t v14 = 8406LL;
LABEL_7:
    [v11 buildError:v14 underlying:0 description:v13];
    int v15 = (__CFString *)objc_claimAutoreleasedReturnValue();

    id v9 = 0LL;
    id v10 = 0LL;
    if (!v15) {
      goto LABEL_13;
    }
    goto LABEL_8;
  }

  if ([v6 count] == 1)
  {
    [v6 objectAtIndex:0];
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = @"OnlyAsset";
LABEL_13:
    -[SUCoreConfigServer setLastLocatedAsset:](self, "setLastLocatedAsset:", v9);
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 oslog];
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      [v9 attributes];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v10;
      __int16 v27 = 2114;
      id v28 = v9;
      __int16 v29 = 2114;
      v30 = v20;
      _os_log_impl( &dword_187A54000,  v19,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConfig] SelectBestAsset: Located asset (reason: '%{public}@'): %{public}@; attributes: %{public}@",
        buf,
        0x20u);
    }

    int v15 = 0LL;
    goto LABEL_16;
  }

  id v23 = 0LL;
  id v24 = 0LL;
  -[SUCoreConfigServer _stateSafeSelectBestAssetFromMultipleAssetArray:bestAsset:selectionReason:]( self,  "_stateSafeSelectBestAssetFromMultipleAssetArray:bestAsset:selectionReason:",  v6,  &v24,  &v23);
  int v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v9 = v24;
  id v10 = (__CFString *)v23;
  if (!v15) {
    goto LABEL_13;
  }
LABEL_8:
  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 oslog];
  __int16 v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v26 = v15;
    _os_log_impl( &dword_187A54000,  v17,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConfig] SelectBestAsset: Failed to locate asset with error: %{public}@",  buf,  0xCu);
  }

  if (a4)
  {
    int v15 = v15;
    *a4 = v15;
  }

- (id)_stateSafeSelectBestAssetFromMultipleAssetArray:(id)a3 bestAsset:(id *)a4 selectionReason:(id *)a5
{
  id v8 = a3;
  -[SUCoreConfigServer stateMachine](self, "stateMachine");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 extendedStateQueue];
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  *a4 = 0LL;
  *a5 = 0LL;
  [MEMORY[0x1896079C8] predicateWithBlock:&__block_literal_global_305];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 filteredArrayUsingPredicate:v11];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (![v12 count])
  {
    [MEMORY[0x1896079C8] predicateWithBlock:&__block_literal_global_309];
    int v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 filteredArrayUsingPredicate:v15];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

    if ([v16 count])
    {
      [v16 objectAtIndex:0];
      int64_t v13 = 0LL;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v17 = @"BuildVersion&HWModelStr";
    }

    else
    {
      [MEMORY[0x1896079C8] predicateWithBlock:&__block_literal_global_313];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 filteredArrayUsingPredicate:v19];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

      if ([v12 count])
      {
        [v12 objectAtIndex:0];
        int64_t v13 = 0LL;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v14 = @"BuildVersion&ProductVersion";
        goto LABEL_3;
      }

      [MEMORY[0x1896079C8] predicateWithBlock:&__block_literal_global_317];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 filteredArrayUsingPredicate:v20];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

      if ([v16 count])
      {
        [v16 objectAtIndex:0];
        int64_t v13 = 0LL;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v17 = @"HWModelStr&ProductVersion";
      }

      else
      {
        [MEMORY[0x1896079C8] predicateWithBlock:&__block_literal_global_321];
        id v21 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 filteredArrayUsingPredicate:v21];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

        if ([v12 count])
        {
          [v12 objectAtIndex:0];
          int64_t v13 = 0LL;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v14 = @"BuildVersionOnly";
          goto LABEL_3;
        }

        [MEMORY[0x1896079C8] predicateWithBlock:&__block_literal_global_325];
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 filteredArrayUsingPredicate:v22];
        uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (![v16 count])
        {
          [MEMORY[0x1896079C8] predicateWithBlock:&__block_literal_global_329];
          id v23 = (void *)objc_claimAutoreleasedReturnValue();
          [v8 filteredArrayUsingPredicate:v23];
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (![v12 count])
          {
            [MEMORY[0x189612760] sharedCore];
            id v24 = (void *)objc_claimAutoreleasedReturnValue();
            [v24 buildError:8409 underlying:0 description:@"No available configuration assets found (multiple selection logic found no asset)"];
            int64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_7;
          }

          [v12 objectAtIndex:0];
          int64_t v13 = 0LL;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v14 = @"ProductVersionOnly";
          goto LABEL_3;
        }

        [v16 objectAtIndex:0];
        int64_t v13 = 0LL;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v17 = @"HWModelStrOnly";
      }
    }

    *a5 = v17;
    uint64_t v12 = v16;
    goto LABEL_7;
  }

  [v12 objectAtIndex:0];
  int64_t v13 = 0LL;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = @"FullMatch";
LABEL_3:
  *a5 = v14;
LABEL_7:

  return v13;
}

uint64_t __96__SUCoreConfigServer__stateSafeSelectBestAssetFromMultipleAssetArray_bestAsset_selectionReason___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  [v2 attributes];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeObjectForKey:@"SupportedDeviceModels" ofClass:objc_opt_class()];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  [v2 attributes];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 safeObjectForKey:@"PrerequisiteBuilds" ofClass:objc_opt_class()];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  [v2 attributes];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  [v7 safeObjectForKey:@"PrerequisiteOSVersions" ofClass:objc_opt_class()];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189612770] sharedDevice];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 hwModelString];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v4 containsObject:v10])
  {
    [MEMORY[0x189612770] sharedDevice];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 buildVersion];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v6 containsObject:v12])
    {
      [MEMORY[0x189612770] sharedDevice];
      int64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 productVersion];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      unsigned int v32 = [v8 containsObject:v14];
    }

    else
    {
      unsigned int v32 = 0;
    }
  }

  else
  {
    unsigned int v32 = 0;
  }

  [MEMORY[0x1896127A0] sharedLogger];
  int v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 oslog];
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    [MEMORY[0x189612770] sharedDevice];
    __int16 v29 = (void *)objc_claimAutoreleasedReturnValue();
    [v29 hwModelString];
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = v8;
    [v4 componentsJoinedByString:@","];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189612770] sharedDevice];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 buildVersion];
    uint64_t v31 = v4;
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 componentsJoinedByString:@","];
    v30 = v6;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189612770] sharedDevice];
    id v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 productVersion];
    id v24 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = [v8 componentsJoinedByString:@","];
    v26 = (void *)v25;
    *(_DWORD *)buf = 138544898;
    __int16 v27 = @"NO";
    v34 = v17;
    if (v32) {
      __int16 v27 = @"YES";
    }
    __int16 v35 = 2114;
    v36 = v19;
    __int16 v37 = 2114;
    v38 = v21;
    __int16 v39 = 2114;
    v40 = v22;
    __int16 v41 = 2114;
    v42 = v24;
    __int16 v43 = 2114;
    uint64_t v44 = v25;
    __int16 v45 = 2114;
    v46 = v27;
    _os_log_impl( &dword_187A54000,  v16,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConfig] SelectBestAsset: FullMatch Predicate (Device:Asset) - HWModelString %{public}@:%{public}@; BuildVer"
      "sion %{public}@:%{public}@; ProductVersion %{public}@:%{public}@ | keep=%{public}@",
      buf,
      0x48u);

    id v8 = v18;
    id v6 = v30;

    uint64_t v4 = v31;
  }

  return v32;
}

uint64_t __96__SUCoreConfigServer__stateSafeSelectBestAssetFromMultipleAssetArray_bestAsset_selectionReason___block_invoke_308( uint64_t a1,  void *a2)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  [v2 attributes];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeObjectForKey:@"SupportedDeviceModels" ofClass:objc_opt_class()];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  [v2 attributes];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  [v5 safeObjectForKey:@"PrerequisiteBuilds" ofClass:objc_opt_class()];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189612770] sharedDevice];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 hwModelString];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v4 containsObject:v8])
  {
    [MEMORY[0x189612770] sharedDevice];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 buildVersion];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v6 containsObject:v10];
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 oslog];
  int64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    [MEMORY[0x189612770] sharedDevice];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 hwModelString];
    int v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 componentsJoinedByString:@","];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189612770] sharedDevice];
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 buildVersion];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [v6 componentsJoinedByString:@","];
    v20 = (void *)v19;
    int v23 = 138544386;
    id v21 = @"NO";
    id v24 = v15;
    if ((_DWORD)v11) {
      id v21 = @"YES";
    }
    __int16 v25 = 2114;
    v26 = v16;
    __int16 v27 = 2114;
    id v28 = v18;
    __int16 v29 = 2114;
    uint64_t v30 = v19;
    __int16 v31 = 2114;
    unsigned int v32 = v21;
    _os_log_impl( &dword_187A54000,  v13,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConfig] SelectBestAsset: BuildVersion&HWModelStr Predicate (Device:Asset) - HWModelString %{public}@:%{publ ic}@; BuildVersion %{public}@:%{public}@ | keep=%{public}@",
      (uint8_t *)&v23,
      0x34u);
  }

  return v11;
}

uint64_t __96__SUCoreConfigServer__stateSafeSelectBestAssetFromMultipleAssetArray_bestAsset_selectionReason___block_invoke_312( uint64_t a1,  void *a2)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  [v2 attributes];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeObjectForKey:@"PrerequisiteBuilds" ofClass:objc_opt_class()];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  [v2 attributes];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  [v5 safeObjectForKey:@"PrerequisiteOSVersions" ofClass:objc_opt_class()];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189612770] sharedDevice];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 buildVersion];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v4 containsObject:v8])
  {
    [MEMORY[0x189612770] sharedDevice];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 productVersion];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v6 containsObject:v10];
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 oslog];
  int64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    [MEMORY[0x189612770] sharedDevice];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 buildVersion];
    int v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 componentsJoinedByString:@","];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189612770] sharedDevice];
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 productVersion];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [v6 componentsJoinedByString:@","];
    v20 = (void *)v19;
    int v23 = 138544386;
    id v21 = @"NO";
    id v24 = v15;
    if ((_DWORD)v11) {
      id v21 = @"YES";
    }
    __int16 v25 = 2114;
    v26 = v16;
    __int16 v27 = 2114;
    id v28 = v18;
    __int16 v29 = 2114;
    uint64_t v30 = v19;
    __int16 v31 = 2114;
    unsigned int v32 = v21;
    _os_log_impl( &dword_187A54000,  v13,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConfig] SelectBestAsset: BuildVersion&ProductVersion Predicate (Device:Asset) - BuildVersion %{public}@:%{p ublic}@; ProductVersion %{public}@:%{public}@ | keep=%{public}@",
      (uint8_t *)&v23,
      0x34u);
  }

  return v11;
}

uint64_t __96__SUCoreConfigServer__stateSafeSelectBestAssetFromMultipleAssetArray_bestAsset_selectionReason___block_invoke_316( uint64_t a1,  void *a2)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  [v2 attributes];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 safeObjectForKey:@"SupportedDeviceModels" ofClass:objc_opt_class()];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  [v2 attributes];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();

  [v5 safeObjectForKey:@"PrerequisiteOSVersions" ofClass:objc_opt_class()];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189612770] sharedDevice];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 hwModelString];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v4 containsObject:v8])
  {
    [MEMORY[0x189612770] sharedDevice];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 productVersion];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v6 containsObject:v10];
  }

  else
  {
    uint64_t v11 = 0LL;
  }

  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 oslog];
  int64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    [MEMORY[0x189612770] sharedDevice];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 hwModelString];
    int v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 componentsJoinedByString:@","];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189612770] sharedDevice];
    __int16 v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 productVersion];
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [v6 componentsJoinedByString:@","];
    v20 = (void *)v19;
    int v23 = 138544386;
    id v21 = @"NO";
    id v24 = v15;
    if ((_DWORD)v11) {
      id v21 = @"YES";
    }
    __int16 v25 = 2114;
    v26 = v16;
    __int16 v27 = 2114;
    id v28 = v18;
    __int16 v29 = 2114;
    uint64_t v30 = v19;
    __int16 v31 = 2114;
    unsigned int v32 = v21;
    _os_log_impl( &dword_187A54000,  v13,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConfig] SelectBestAsset: HWModelStr&ProductVersion Predicate (Device:Asset) - HWModelString %{public}@:%{pu blic}@; ProductVersion %{public}@:%{public}@ | keep=%{public}@",
      (uint8_t *)&v23,
      0x34u);
  }

  return v11;
}

uint64_t __96__SUCoreConfigServer__stateSafeSelectBestAssetFromMultipleAssetArray_bestAsset_selectionReason___block_invoke_320( uint64_t a1,  void *a2)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  [a2 attributes];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 safeObjectForKey:@"PrerequisiteBuilds" ofClass:objc_opt_class()];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189612770] sharedDevice];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 buildVersion];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v3 containsObject:v5];

  [MEMORY[0x1896127A0] sharedLogger];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 oslog];
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    [MEMORY[0x189612770] sharedDevice];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 buildVersion];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v3 componentsJoinedByString:@","];
    uint64_t v12 = (void *)v11;
    int64_t v13 = @"NO";
    int v15 = 138543874;
    uint64_t v16 = v10;
    __int16 v17 = 2114;
    if ((_DWORD)v6) {
      int64_t v13 = @"YES";
    }
    uint64_t v18 = v11;
    __int16 v19 = 2114;
    v20 = v13;
    _os_log_impl( &dword_187A54000,  v8,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConfig] SelectBestAsset: BuildVersionOnly Predicate (Device:Asset) - BuildVersion %{public}@:%{public}@ | keep=%{public}@",  (uint8_t *)&v15,  0x20u);
  }

  return v6;
}

uint64_t __96__SUCoreConfigServer__stateSafeSelectBestAssetFromMultipleAssetArray_bestAsset_selectionReason___block_invoke_324( uint64_t a1,  void *a2)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  [a2 attributes];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 safeObjectForKey:@"SupportedDeviceModels" ofClass:objc_opt_class()];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189612770] sharedDevice];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 hwModelString];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v3 containsObject:v5];

  [MEMORY[0x1896127A0] sharedLogger];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 oslog];
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    [MEMORY[0x189612770] sharedDevice];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 hwModelString];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v3 componentsJoinedByString:@","];
    uint64_t v12 = (void *)v11;
    int64_t v13 = @"NO";
    int v15 = 138543874;
    uint64_t v16 = v10;
    __int16 v17 = 2114;
    if ((_DWORD)v6) {
      int64_t v13 = @"YES";
    }
    uint64_t v18 = v11;
    __int16 v19 = 2114;
    v20 = v13;
    _os_log_impl( &dword_187A54000,  v8,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConfig] SelectBestAsset: HWModelStrOnly Predicate (Device:Asset) - HWModelString %{public}@:%{public}@ | keep=%{public}@",  (uint8_t *)&v15,  0x20u);
  }

  return v6;
}

uint64_t __96__SUCoreConfigServer__stateSafeSelectBestAssetFromMultipleAssetArray_bestAsset_selectionReason___block_invoke_328( uint64_t a1,  void *a2)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  [a2 attributes];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 safeObjectForKey:@"PrerequisiteOSVersions" ofClass:objc_opt_class()];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189612770] sharedDevice];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 productVersion];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v3 containsObject:v5];

  [MEMORY[0x1896127A0] sharedLogger];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 oslog];
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    [MEMORY[0x189612770] sharedDevice];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 productVersion];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v3 componentsJoinedByString:@","];
    uint64_t v12 = (void *)v11;
    int64_t v13 = @"NO";
    int v15 = 138543874;
    uint64_t v16 = v10;
    __int16 v17 = 2114;
    if ((_DWORD)v6) {
      int64_t v13 = @"YES";
    }
    uint64_t v18 = v11;
    __int16 v19 = 2114;
    v20 = v13;
    _os_log_impl( &dword_187A54000,  v8,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConfig] SelectBestAsset: ProductVersionOnly Predicate (Device:Asset) - ProductVersion %{public}@:%{public}@ | keep=%{public}@",  (uint8_t *)&v15,  0x20u);
  }

  return v6;
}

- (int64_t)actionConfigDownloadAsset:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  [v5 locatedAsset];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SUCoreConfigServer _stateSafeDownloadOptions](self, "_stateSafeDownloadOptions");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x1896127A0] sharedLogger];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v7;
      _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConfig] Download: Starting download of configuration asset with options: %{public}@",  buf,  0xCu);
    }

    [v5 locatedAsset];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __54__SUCoreConfigServer_actionConfigDownloadAsset_error___block_invoke;
    v18[3] = &unk_18A0F0288;
    v18[4] = self;
    id v19 = v5;
    [v10 startDownload:v7 completionWithError:v18];

    int64_t v11 = 0LL;
  }

  else
  {
    [MEMORY[0x189612760] sharedCore];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 buildError:8116 underlying:0 description:@"No located configuration asset for download"];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x1896127A0] sharedLogger];
    int64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 oslog];
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SUCoreConfigServer actionConfigDownloadAsset:error:].cold.1();
    }

    -[SUCoreConfigServer stateMachine](self, "stateMachine");
    int v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = -[SUCoreConfigParam initWithError:operation:]( objc_alloc(&OBJC_CLASS___SUCoreConfigParam),  "initWithError:operation:",  v7,  2LL);
    [v15 postEvent:@"ConfigPhaseFailed" withInfo:v16];

    int64_t v11 = 8116LL;
  }

  return v11;
}

void __54__SUCoreConfigServer_actionConfigDownloadAsset_error___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 oslog];
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    MEMORY[0x1895B15BC](a2);
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    int v15 = 138543362;
    uint64_t v16 = v8;
    _os_log_impl( &dword_187A54000,  v7,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConfig] Download: Asset download completed with MADownloadResult: %{public}@",  (uint8_t *)&v15,  0xCu);
  }

  if (a2 != 10 && a2)
  {
    [MEMORY[0x189612760] sharedCore];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 buildError:8700 underlying:v5 description:@"Software update configuration asset download failed"];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x1896127A0] sharedLogger];
    int64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 oslog];
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SUCoreConfigServer actionConfigDownloadAsset:error:].cold.1();
    }

    [*(id *)(a1 + 32) stateMachine];
    int64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = -[SUCoreConfigParam initWithError:operation:]( objc_alloc(&OBJC_CLASS___SUCoreConfigParam),  "initWithError:operation:",  v9,  2LL);
    [v13 postEvent:@"ConfigPhaseFailed" withInfo:v14];
  }

  else
  {
    [*(id *)(a1 + 32) stateMachine];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 postEvent:@"ConfigPhaseComplete" withInfo:*(void *)(a1 + 40)];
  }
}

- (int64_t)actionConfigAdjustSettings:(id)a3 error:(id *)a4
{
  v60[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  [MEMORY[0x1896127A0] sharedLogger];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 oslog];
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_187A54000,  v8,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConfig] Adjust: Adjusting configuration with server settings",  buf,  2u);
  }

  [v6 locatedAsset];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    [v6 locatedAsset];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    char v11 = [v10 refreshState];

    if ((v11 & 1) != 0)
    {
      [v6 locatedAsset];
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
      char v13 = [v12 wasLocal];

      if ((v13 & 1) != 0) {
        goto LABEL_15;
      }
      [MEMORY[0x189612760] sharedCore];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      int v15 = v14;
      uint64_t v16 = @"Asset is not downloaded (wasLocal returned false)";
      uint64_t v17 = 8707LL;
    }

    else
    {
      [MEMORY[0x189612760] sharedCore];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      int v15 = v14;
      uint64_t v16 = @"Asset is not available (refreshState returned false)";
      uint64_t v17 = 8706LL;
    }
  }

  else
  {
    [MEMORY[0x189612760] sharedCore];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    int v15 = v14;
    uint64_t v16 = @"Asset was not located (asset not present)";
    uint64_t v17 = 8116LL;
  }

  [v14 buildError:v17 underlying:0 description:v16];
  id v18 = (id)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 oslog];
    v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[SUCoreConfigServer actionConfigAdjustSettings:error:].cold.2();
    }

    -[SUCoreConfigServer stateMachine](self, "stateMachine");
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v22 = -[SUCoreConfigParam initWithError:operation:]( objc_alloc(&OBJC_CLASS___SUCoreConfigParam),  "initWithError:operation:",  v18,  3LL);
    [v21 followupEvent:@"ConfigPhaseFailed" withInfo:v22];

    if (a4)
    {
      id v18 = v18;
      *a4 = v18;
    }

    int64_t v23 = 8406LL;
    goto LABEL_29;
  }

void __55__SUCoreConfigServer_actionConfigAdjustSettings_error___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  id v5 = a3;
  if (v4
    && (+[SUCoreConfigServer allowedServerProjects](&OBJC_CLASS___SUCoreConfigServer, "allowedServerProjects"),
        id v6 = (void *)objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 containsObject:v4],
        v6,
        v7))
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x189612768]) initWithProjectName:v4];
    [MEMORY[0x1896127A0] sharedLogger];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 oslog];
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v17 = v4;
      __int16 v18 = 2114;
      id v19 = v5;
      _os_log_impl( &dword_187A54000,  v10,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConfig] Adjust: Updating configuration for project: %{public}@, with configuration: %{public}@",  buf,  0x16u);
    }

    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __55__SUCoreConfigServer_actionConfigAdjustSettings_error___block_invoke_353;
    v13[3] = &unk_18A0F1998;
    id v14 = v8;
    id v15 = v4;
    char v11 = v8;
    [v5 enumerateKeysAndObjectsUsingBlock:v13];
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 oslog];
    char v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __55__SUCoreConfigServer_actionConfigAdjustSettings_error___block_invoke_cold_1();
    }
  }
}

void __55__SUCoreConfigServer_actionConfigAdjustSettings_error___block_invoke_353( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5
    && (+[SUCoreConfigServer allowedServerKeys](&OBJC_CLASS___SUCoreConfigServer, "allowedServerKeys"),
        int v7 = (void *)objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 containsObject:v5],
        v7,
        v8))
  {
    [*(id *)(a1 + 32) setConfig:v6 forKey:v5];
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 oslog];
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __55__SUCoreConfigServer_actionConfigAdjustSettings_error___block_invoke_353_cold_1();
    }
  }
}

void __55__SUCoreConfigServer_actionConfigAdjustSettings_error___block_invoke_355(uint64_t a1, void *a2)
{
  id v3 = a2;
  [MEMORY[0x1896127A0] sharedLogger];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 oslog];
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __55__SUCoreConfigServer_actionConfigAdjustSettings_error___block_invoke_355_cold_1();
    }
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl( &dword_187A54000,  v5,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConfig] Purge: Purge (MAPurgeAllExceptGivenIds) completed successfully",  v8,  2u);
  }

  [*(id *)(a1 + 32) stateMachine];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = objc_alloc_init(&OBJC_CLASS___SUCoreConfigParam);
  [v6 postEvent:@"ConfigPhaseComplete" withInfo:v7];
}

- (void)_stateSafeInformDelegatesOfConfiguration:(id)a3 error:(id)a4
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  -[SUCoreConfigServer stateMachine](self, "stateMachine");
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 extendedStateQueue];
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  [MEMORY[0x1896127A0] sharedLogger];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 oslog];
  char v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[SUCoreConfigServer listenerDelegates](self, "listenerDelegates");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134217984;
    uint64_t v20 = [v12 count];
    _os_log_impl( &dword_187A54000,  v11,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConfig] Delegate: Informing %ld listener delegates of updated config",  buf,  0xCu);
  }

  -[SUCoreConfigServer listenerDelegates](self, "listenerDelegates");
  char v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __69__SUCoreConfigServer__stateSafeInformDelegatesOfConfiguration_error___block_invoke;
  v16[3] = &unk_18A0F19C0;
  v16[4] = self;
  id v17 = v6;
  id v18 = v7;
  id v14 = v7;
  id v15 = v6;
  [v13 enumerateKeysAndObjectsUsingBlock:v16];
}

void __69__SUCoreConfigServer__stateSafeInformDelegatesOfConfiguration_error___block_invoke( id *a1,  void *a2,  void *a3)
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  if (v6 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 oslog];
    int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v5;
      _os_log_impl( &dword_187A54000,  v8,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConfig] Delegate: Sending updated config notification to delegate with name: %{public}@",  buf,  0xCu);
    }

    [a1[4] clientDelegateQueue];
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __69__SUCoreConfigServer__stateSafeInformDelegatesOfConfiguration_error___block_invoke_359;
    block[3] = &unk_18A0F03C8;
    char v13 = (os_log_s *)v6;
    id v14 = a1[5];
    id v15 = a1[6];
    dispatch_async(v9, block);

    id v10 = v13;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    char v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 oslog];
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v17 = v5;
      _os_log_impl( &dword_187A54000,  v10,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConfig] Delegate: Delegate does not respond to updated config callbacks (%{public}@)",  buf,  0xCu);
    }
  }
}

uint64_t __69__SUCoreConfigServer__stateSafeInformDelegatesOfConfiguration_error___block_invoke_359( uint64_t a1)
{
  return [*(id *)(a1 + 32) coreConfigServerSettingsUpdated:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (int64_t)actionConfigScheduleScan:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  [v5 error];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    [v5 error];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreConfigServer _stateSafeSendInstalledEventWithSuccess:error:]( self,  "_stateSafeSendInstalledEventWithSuccess:error:",  0LL,  v7);

    [v5 error];
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreConfigServer _stateSafeInformDelegatesOfConfiguration:error:]( self,  "_stateSafeInformDelegatesOfConfiguration:error:",  0LL,  v8);
  }

  [MEMORY[0x1896127A0] sharedLogger];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 oslog];
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[SUCoreConfigServer timer](self, "timer");
    char v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = @"YES";
    if (!v11) {
      uint64_t v12 = @"NO";
    }
    int v27 = 138543362;
    id v28 = v12;
    _os_log_impl( &dword_187A54000,  v10,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConfig] Schedule: Invalidating the previous timer (present=%{public}@)",  (uint8_t *)&v27,  0xCu);
  }

  -[SUCoreConfigServer timer](self, "timer");
  char v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 invalidate];

  -[SUCoreConfigServer _stateSafeDetermineNextScanTime](self, "_stateSafeDetermineNextScanTime");
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 timeIntervalSinceNow];
  double v16 = v15;
  [MEMORY[0x1896127A0] sharedLogger];
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 oslog];
  uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    [MEMORY[0x189612760] stringFromDate:v14];
    id v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = (void *)MEMORY[0x189612760];
    [MEMORY[0x189603F50] date];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 stringFromDate:v21];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    int v27 = 138543874;
    id v28 = v19;
    __int16 v29 = 2048;
    double v30 = v16;
    __int16 v31 = 2114;
    unsigned int v32 = v22;
    _os_log_impl( &dword_187A54000,  v18,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConfig] Schedule: Scheduling timer with run date: %{public}@; interval=%f; current date: %{public}@",
      (uint8_t *)&v27,
      0x20u);
  }

  [MEMORY[0x189604028] timerWithTimeInterval:0 repeats:&__block_literal_global_364 block:v16];
  int64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreConfigServer setTimer:](self, "setTimer:", v23);

  [MEMORY[0x189604008] mainRunLoop];
  id v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreConfigServer timer](self, "timer");
  __int16 v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v24 addTimer:v25 forMode:*MEMORY[0x189603B48]];

  -[SUCoreConfigServer _stateSafeSendScheduledEventWithSuccess:error:]( self,  "_stateSafeSendScheduledEventWithSuccess:error:",  1LL,  0LL);
  return 0LL;
}

void __53__SUCoreConfigServer_actionConfigScheduleScan_error___block_invoke()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 oslog];
  uint64_t v1 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl( &dword_187A54000,  v1,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConfig] Schedule: Timer fired! Scanning for new configuration updates",  v3,  2u);
  }

  +[SUCoreConfigServer sharedServerSettings](&OBJC_CLASS___SUCoreConfigServer, "sharedServerSettings");
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 installServerSettings];
}

- (id)_stateSafeDownloadOptions
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 extendedStateQueue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  id v5 = objc_alloc_init(MEMORY[0x189611110]);
  [v5 setDiscretionary:0];
  [v5 setAllowsCellularAccess:1];
  [v5 setAllowsExpensiveAccess:1];
  -[SUCoreConfigServer uuidString](self, "uuidString");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setSessionId:v6];

  return v5;
}

- (void)_stateSafeResetState
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  [MEMORY[0x189603F50] date];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreConfigServer setLastScanTime:](self, "setLastScanTime:", v3);

  -[SUCoreConfigServer setNextScanTime:](self, "setNextScanTime:", 0LL);
  -[SUCoreConfigServer _stateSafeUpdateState](self, "_stateSafeUpdateState");
  [MEMORY[0x1896127A0] sharedLogger];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 oslog];
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[SUCoreConfigServer timer](self, "timer");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v7 = @"YES";
    if (!v6) {
      id v7 = @"NO";
    }
    int v9 = 138543362;
    id v10 = v7;
    _os_log_impl( &dword_187A54000,  v5,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConfig] ResetState: Invalidating the previous timer (present=%{public}@)",  (uint8_t *)&v9,  0xCu);
  }

  -[SUCoreConfigServer timer](self, "timer");
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 invalidate];
}

- (void)_stateSafeUpdateState
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 extendedStateQueue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[SUCoreConfigServer persistedState](self, "persistedState");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = [v5 loadPersistedState];

  if ((_DWORD)v4)
  {
    -[SUCoreConfigServer persistedState](self, "persistedState");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreConfigServer lastScanTime](self, "lastScanTime");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 persistDate:v7 forKey:@"LastScanTime"];

    -[SUCoreConfigServer persistedState](self, "persistedState");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    -[SUCoreConfigServer nextScanTime](self, "nextScanTime");
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 persistDate:v8 forKey:@"NextScanTime"];
  }

- (id)_stateSafeDetermineNextScanTime
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  -[SUCoreConfigServer stateMachine](self, "stateMachine");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 extendedStateQueue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[SUCoreConfigServer persistedState](self, "persistedState");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = [v5 loadPersistedState];

  if ((_DWORD)v4)
  {
    -[SUCoreConfigServer persistedState](self, "persistedState");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 dateForKey:@"LastScanTime"];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreConfigServer persistedState](self, "persistedState");
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 dateForKey:@"NextScanTime"];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v9 = 0LL;
    id v7 = 0LL;
  }

  -[SUCoreConfigServer coreConfig](self, "coreConfig");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 getNumberConfigForKey:*MEMORY[0x1896127E8]];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v12 = -[SUCoreConfigServer _nextScanTimeFromDate:](self, "_nextScanTimeFromDate:", v7);
  char v13 = (void *)v12;
  if (v11)
  {
    id v14 = (void *)MEMORY[0x189603F50];
    [v11 doubleValue];
    [v14 dateWithTimeIntervalSinceNow:v15 * 60.0];
    double v16 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x1896127A0] sharedLogger];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 oslog];
    uint64_t v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      [MEMORY[0x189612760] stringFromDate:v16];
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      int v39 = 138543618;
      v40 = v11;
      __int16 v41 = 2114;
      v42 = v19;
      _os_log_impl( &dword_187A54000,  v18,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConfig] NextScanTime: Using nextScanTime scan interval override (%{public}@) for proposed scan: %{public}@",  (uint8_t *)&v39,  0x16u);
    }
  }

  else
  {
    double v16 = (void *)v12;
  }

  [MEMORY[0x189603F50] date];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v21 = [v9 compare:v20];

  if (v21 == -1)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    __int16 v31 = (void *)objc_claimAutoreleasedReturnValue();
    [v31 oslog];
    unsigned int v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      [MEMORY[0x189612760] stringFromDate:v9];
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
      int v39 = 138543362;
      v40 = v33;
      _os_log_impl( &dword_187A54000,  v32,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConfig] NextScanTime: Previous nextScanTime (%{public}@) has already passed, removing now",  (uint8_t *)&v39,  0xCu);
    }

    id v9 = 0LL;
  }

  else if (v9 && [v9 compare:v16] == -1)
  {
    -[SUCoreConfigServer setNextScanTime:](self, "setNextScanTime:", v9);
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 oslog];
    int64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = (void *)MEMORY[0x189612760];
      -[SUCoreConfigServer nextScanTime](self, "nextScanTime");
      __int16 v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 stringFromDate:v25];
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
      int v27 = (void *)MEMORY[0x189612760];
      [MEMORY[0x189603F50] date];
      id v28 = (void *)objc_claimAutoreleasedReturnValue();
      [v27 stringFromDate:v28];
      __int16 v29 = (void *)objc_claimAutoreleasedReturnValue();
      int v39 = 138543618;
      v40 = v26;
      __int16 v41 = 2114;
      v42 = v29;
      double v30 = "[SUCoreConfig] NextScanTime: Using nextScanTime (via previous): %{public}@, current time: %{public}@";
LABEL_19:
      _os_log_impl(&dword_187A54000, v23, OS_LOG_TYPE_DEFAULT, v30, (uint8_t *)&v39, 0x16u);

      goto LABEL_20;
    }

    goto LABEL_20;
  }

  -[SUCoreConfigServer setNextScanTime:](self, "setNextScanTime:", v16);
  [MEMORY[0x1896127A0] sharedLogger];
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  [v34 oslog];
  int64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v35 = (void *)MEMORY[0x189612760];
    -[SUCoreConfigServer nextScanTime](self, "nextScanTime");
    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v35 stringFromDate:v25];
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    id v36 = (void *)MEMORY[0x189612760];
    [MEMORY[0x189603F50] date];
    id v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v36 stringFromDate:v28];
    __int16 v29 = (void *)objc_claimAutoreleasedReturnValue();
    int v39 = 138543618;
    v40 = v26;
    __int16 v41 = 2114;
    v42 = v29;
    double v30 = "[SUCoreConfig] NextScanTime: Using nextScanTime (via proposed): %{public}@, current time: %{public}@";
    goto LABEL_19;
  }

- (id)_nextScanTimeFromDate:(id)a3
{
  id v3 = a3;
  [MEMORY[0x189612770] sharedDevice];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  else {
    double v5 = 604800.0;
  }

  id v6 = (void *)MEMORY[0x189603F50];
  if (v3)
  {
    [MEMORY[0x189603F50] dateWithTimeInterval:v3 sinceDate:v5];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    [MEMORY[0x189603F50] date];
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 dateWithTimeInterval:v8 sinceDate:v5];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (void)_stateSafeSendScheduledEventWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  -[SUCoreConfigServer stateMachine](self, "stateMachine");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 extendedStateQueue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUCoreConfigServer _stateSafeSendNewEvent:success:error:]( self,  "_stateSafeSendNewEvent:success:error:",  @"SUCoreConfigScheduled",  v4,  v8);
}

- (void)_stateSafeSendInstalledEventWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  -[SUCoreConfigServer stateMachine](self, "stateMachine");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 extendedStateQueue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUCoreConfigServer _stateSafeSendNewEvent:success:error:]( self,  "_stateSafeSendNewEvent:success:error:",  @"SUCoreConfigInstalled",  v4,  v8);
}

- (void)_stateSafeSendNewEvent:(id)a3 success:(BOOL)a4 error:(id)a5
{
  uint64_t v73 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a5;
  -[SUCoreConfigServer stateMachine](self, "stateMachine");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 extendedStateQueue];
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  id v12 = (id)*MEMORY[0x189612978];
  if (!a4)
  {
    char v13 = (void *)NSString;
    [v9 domain];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 stringWithFormat:@"%@ - %ld", v14, objc_msgSend(v9, "code")];
    double v15 = (void *)objc_claimAutoreleasedReturnValue();

    [v9 domain];
    double v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v14) = [v16 isEqualToString:*MEMORY[0x189612928]];

    if ((_DWORD)v14)
    {
      objc_msgSend(MEMORY[0x189612760], "errorNameForCode:", objc_msgSend(v9, "code"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v18 = [v15 stringByAppendingFormat:@" (%@)", v17];

      double v15 = (void *)v18;
    }

    [v9 userInfo];
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = *MEMORY[0x189607798];
    [v19 safeObjectForKey:*MEMORY[0x189607798] ofClass:objc_opt_class()];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      [v9 userInfo];
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
      [v22 safeObjectForKey:v20 ofClass:objc_opt_class()];
      int64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 checkedNameForCode];
      id v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 stringByAppendingFormat:@" [%@]", v24];
      id v12 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      id v12 = v15;
    }
  }

  id v25 = objc_alloc_init(MEMORY[0x189603FC8]);
  [v25 setSafeObject:v12 forKey:*MEMORY[0x189612970]];
  v66 = v9;
  [v9 checkedSummary];
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v25 setSafeObject:v26 forKey:*MEMORY[0x189612958]];

  [v25 setSafeObject:v8 forKey:*MEMORY[0x189612968]];
  -[SUCoreConfigServer _stateSafeLoadUUIDString](self, "_stateSafeLoadUUIDString");
  int v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v25 setSafeObject:v27 forKey:*MEMORY[0x1896129C8]];

  objc_msgSend(NSString, "stringWithFormat:", @"%d", 1);
  id v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v25 setSafeObject:v28 forKey:@"compatibilityVersion"];

  __int16 v29 = (void *)MEMORY[0x189612760];
  -[SUCoreConfigServer lastScanTime](self, "lastScanTime");
  double v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v29 stringFromDate:v30];
  __int16 v31 = (void *)objc_claimAutoreleasedReturnValue();
  [v25 setSafeObject:v31 forKey:@"lastScanTime"];

  unsigned int v32 = (void *)MEMORY[0x189612760];
  -[SUCoreConfigServer nextScanTime](self, "nextScanTime");
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  [v32 stringFromDate:v33];
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  [v25 setSafeObject:v34 forKey:@"nextScanTime"];

  [v25 setSafeObject:@"NSTimer" forKey:@"scannerMethod"];
  __int16 v35 = (void *)NSString;
  -[SUCoreConfigServer lastLocatedAsset](self, "lastLocatedAsset");
  id v36 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v37 = [v36 assetId];
  v38 = (void *)v37;
  if (v37) {
    int v39 = (const __CFString *)v37;
  }
  else {
    int v39 = @"none";
  }
  [v35 stringWithFormat:@"%@", v39];
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  [v25 setSafeObject:v40 forKey:@"lastLocatedAssetId"];

  __int16 v41 = (void *)NSString;
  v42 = -[SUCoreConfigServer lastLocatedAsset](self, "lastLocatedAsset");
  [v42 attributes];
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v44 = [v43 safeStringForKey:@"GenerationDate"];
  __int16 v45 = v8;
  v46 = (void *)v44;
  if (v44) {
    uint64_t v47 = (const __CFString *)v44;
  }
  else {
    uint64_t v47 = @"none";
  }
  [v41 stringWithFormat:@"%@", v47];
  uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue();
  [v25 setSafeObject:v48 forKey:@"lastLocatedAssetGenerationDate"];

  v49 = (void *)NSString;
  v50 = -[SUCoreConfigServer lastLocatedAsset](self, "lastLocatedAsset");
  [v50 attributes];
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v52 = [v51 safeStringForKey:@"UniqueID"];
  v53 = (void *)v52;
  if (v52) {
    v54 = (const __CFString *)v52;
  }
  else {
    v54 = @"none";
  }
  [v49 stringWithFormat:@"%@", v54];
  id v55 = (void *)objc_claimAutoreleasedReturnValue();
  [v25 setSafeObject:v55 forKey:@"lastLocatedAssetUniqueID"];

  +[SUCoreConfigServer allowedServerProjects](&OBJC_CLASS___SUCoreConfigServer, "allowedServerProjects");
  __int16 v56 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = MEMORY[0x1895F87A8];
  v67[1] = 3221225472LL;
  void v67[2] = __59__SUCoreConfigServer__stateSafeSendNewEvent_success_error___block_invoke;
  v67[3] = &unk_18A0F1A50;
  id v57 = v25;
  id v68 = v57;
  [v56 enumerateObjectsUsingBlock:v67];

  [MEMORY[0x1896127A0] sharedLogger];
  id v58 = (void *)objc_claimAutoreleasedReturnValue();
  [v58 oslog];
  v59 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v70 = v45;
    __int16 v71 = 2114;
    id v72 = v12;
    _os_log_impl( &dword_187A54000,  v59,  OS_LOG_TYPE_DEFAULT,  "[SUCoreConfig] Sending event '%{public}@' with result: %{public}@",  buf,  0x16u);
  }

  id v60 = objc_alloc(MEMORY[0x189612788]);
  id v61 = objc_alloc(MEMORY[0x189604030]);
  v62 = (void *)[v61 initWithString:*MEMORY[0x189612A08]];
  uint64_t v63 = (void *)[v60 initWithEventDictionary:v57 extendingWith:0 reportingToServer:v62];

  [MEMORY[0x189612790] sharedReporter];
  int64_t v64 = (void *)objc_claimAutoreleasedReturnValue();
  [v63 getAugmentedEvent];
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  [v64 sendEvent:v65];
}

void __59__SUCoreConfigServer__stateSafeSendNewEvent_success_error___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  id v3 = (void *)[objc_alloc(MEMORY[0x189612768]) initWithProjectName:v9];
  BOOL v4 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithString:@"|"];
  [v3 getConfig];
  double v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __59__SUCoreConfigServer__stateSafeSendNewEvent_success_error___block_invoke_2;
  v10[3] = &unk_18A0F1A28;
  id v6 = v4;
  id v11 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v10];

  if ((unint64_t)[v6 length] >= 2)
  {
    id v7 = *(void **)(a1 + 32);
    [NSString stringWithFormat:@"currentConfig%@", v9];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 setSafeObject:v6 forKey:v8];
  }
}

void __59__SUCoreConfigServer__stateSafeSendNewEvent_success_error___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v11 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    [*(id *)(a1 + 32) appendFormat:@"%@=%@|", v11, v5];
  }

  else
  {
    char v6 = objc_opt_respondsToSelector();
    id v7 = *(void **)(a1 + 32);
    if ((v6 & 1) != 0)
    {
      id v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 appendFormat:@"%@=%@|", v11, v9];
    }

    else
    {
      [v7 appendFormat:@"%@=unknown|", v11, v10];
    }
  }
}

- (id)_stateSafeLoadUUIDString
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 extendedStateQueue];
  BOOL v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[SUCoreConfigServer persistedState](self, "persistedState");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = [v5 loadPersistedState];

  if ((_DWORD)v4)
  {
    -[SUCoreConfigServer persistedState](self, "persistedState");
    char v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 stringForKey:@"UUIDString"];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreConfigServer setUuidString:](self, "setUuidString:", v7);
  }

  -[SUCoreConfigServer uuidString](self, "uuidString");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    [MEMORY[0x189607AB8] UUID];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 UUIDString];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreConfigServer setUuidString:](self, "setUuidString:", v10);

    -[SUCoreConfigServer persistedState](self, "persistedState");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v10) = [v11 loadPersistedState];

    if ((_DWORD)v10)
    {
      -[SUCoreConfigServer persistedState](self, "persistedState");
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreConfigServer uuidString](self, "uuidString");
      char v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 persistString:v13 forKey:@"UUIDString"];
    }
  }

  return -[SUCoreConfigServer uuidString](self, "uuidString");
}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (void)setUuidString:(id)a3
{
}

- (NSDate)lastScanTime
{
  return self->_lastScanTime;
}

- (void)setLastScanTime:(id)a3
{
}

- (NSDate)nextScanTime
{
  return self->_nextScanTime;
}

- (void)setNextScanTime:(id)a3
{
}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (MAAsset)lastLocatedAsset
{
  return self->_lastLocatedAsset;
}

- (void)setLastLocatedAsset:(id)a3
{
}

- (SUCoreFSM)stateMachine
{
  return self->_stateMachine;
}

- (void)setStateMachine:(id)a3
{
}

- (SUCorePersistedState)persistedState
{
  return self->_persistedState;
}

- (void)setPersistedState:(id)a3
{
}

- (NSMutableDictionary)listenerDelegates
{
  return self->_listenerDelegates;
}

- (void)setListenerDelegates:(id)a3
{
}

- (SUCoreConfig)coreConfig
{
  return self->_coreConfig;
}

- (void)setCoreConfig:(id)a3
{
}

- (OS_dispatch_queue)clientDelegateQueue
{
  return self->_clientDelegateQueue;
}

- (void)setClientDelegateQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

+ (void)persistedStateFilePath
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 138543618;
  BOOL v4 = @"/var/MobileSoftwareUpdate/Controller/SoftwareUpdateCore";
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  OUTLINED_FUNCTION_0_5( &dword_187A54000,  a2,  a3,  "[SUCoreConfig] PersistedStateFilePath: Failed to create cache directory at path: %{public}@, error: %{public}@",  (uint8_t *)&v3);
  OUTLINED_FUNCTION_2_0();
}

void __56__SUCoreConfigServer_actionConfigDownloadCatalog_error___block_invoke_cold_1()
{
}

- (void)actionConfigQueryAsset:error:.cold.1()
{
}

- (void)actionConfigDownloadAsset:error:.cold.1()
{
}

- (void)actionConfigAdjustSettings:error:.cold.1()
{
}

- (void)actionConfigAdjustSettings:error:.cold.2()
{
}

void __55__SUCoreConfigServer_actionConfigAdjustSettings_error___block_invoke_cold_1()
{
}

void __55__SUCoreConfigServer_actionConfigAdjustSettings_error___block_invoke_353_cold_1()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_2_3();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  OUTLINED_FUNCTION_0_5( &dword_187A54000,  v1,  (uint64_t)v1,  "[SUCoreConfig] Adjust: Not processing non-allowed key '%{public}@' for project '%{public}@'",  v2);
  OUTLINED_FUNCTION_2_0();
}

void __55__SUCoreConfigServer_actionConfigAdjustSettings_error___block_invoke_355_cold_1()
{
}

@end