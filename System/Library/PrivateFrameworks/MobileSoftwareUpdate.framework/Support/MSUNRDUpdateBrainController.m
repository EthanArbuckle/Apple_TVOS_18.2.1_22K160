@interface MSUNRDUpdateBrainController
+ (id)sharedInstance;
+ (id)stateToString:(int)a3;
- (MSUNRDUpdateBrainController)init;
- (NSDictionary)currentMSUUpdateAttributes;
- (NSDictionary)currentRecoveryOSInfo;
- (NSDictionary)progressStatus;
- (NSError)lastError;
- (NSString)lastSuccessForTargetMainOSBuild;
- (NSString)lastSuccessForTargetRecoveryOSBuild;
- (OS_dispatch_queue)cancelQueue;
- (OS_dispatch_queue)stateQueue;
- (OS_dispatch_queue)workQueue;
- (id)nrdLock;
- (id)status;
- (id)waitWithTimeout:(int)a3 progressCallback:(void *)a4 context:(void *)a5 releaseLock:(BOOL)a6;
- (int)state;
- (void)cancelAndLock;
- (void)progressCB;
- (void)progressContext;
- (void)saveLastError:(id)a3;
- (void)saveLastSuccessForTargetMainOSBuild:(id)a3 recoveryOSBuild:(id)a4;
- (void)saveMSUUpdateAttributes:(id)a3 andState:(int)a4;
- (void)saveRecoveryOSInfo:(id)a3;
- (void)saveState:(int)a3;
- (void)setCancelQueue:(id)a3;
- (void)setCurrentMSUUpdateAttributes:(id)a3;
- (void)setCurrentRecoveryOSInfo:(id)a3;
- (void)setLastError:(id)a3;
- (void)setLastSuccessForTargetMainOSBuild:(id)a3;
- (void)setLastSuccessForTargetRecoveryOSBuild:(id)a3;
- (void)setNrdLock:(id)a3;
- (void)setProgressCB:(void *)a3;
- (void)setProgressContext:(void *)a3;
- (void)setProgressStatus:(id)a3;
- (void)setState:(int)a3;
- (void)setStateQueue:(id)a3;
- (void)setWorkQueue:(id)a3;
- (void)startForMSUUpdate:(id)a3;
- (void)startForMSUUpdate:(id)a3 withMSUBrainVersion:(id)a4;
- (void)startForMSUUpdate:(id)a3 withMSUBrainVersion:(id)a4 withOptions:(id)a5;
- (void)updateStatusFromCallback:(id)a3;
@end

@implementation MSUNRDUpdateBrainController

- (MSUNRDUpdateBrainController)init
{
  v23.receiver = self;
  v23.super_class = (Class)&OBJC_CLASS___MSUNRDUpdateBrainController;
  v2 = -[MSUNRDUpdateBrainController init](&v23, "init");
  if (v2)
  {
    dispatch_queue_attr_t v3 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v3);
    dispatch_queue_t v5 = dispatch_queue_create("com.apple.MobileSoftwareUpdate.UpdateBrainService.MSUNRDUpdateBrainControllerWork", v4);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;

    dispatch_queue_attr_t v7 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v7);
    dispatch_queue_t v9 = dispatch_queue_create( "com.apple.MobileSoftwareUpdate.UpdateBrainService.MSUNRDUpdateBrainControllerCancel",  v8);
    cancelQueue = v2->_cancelQueue;
    v2->_cancelQueue = (OS_dispatch_queue *)v9;

    dispatch_queue_attr_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v11);
    dispatch_queue_t v13 = dispatch_queue_create( "com.apple.MobileSoftwareUpdate.UpdateBrainService.MSUNRDUpdateBrainControllerState",  v12);
    stateQueue = v2->_stateQueue;
    v2->_stateQueue = (OS_dispatch_queue *)v13;

    id nrdLock = v2->_nrdLock;
    v2->_id nrdLock = 0LL;

    lastError = v2->_lastError;
    v2->_lastError = 0LL;

    currentRecoveryOSInfo = v2->_currentRecoveryOSInfo;
    v2->_currentRecoveryOSInfo = 0LL;

    currentMSUUpdateAttributes = v2->_currentMSUUpdateAttributes;
    v2->_currentMSUUpdateAttributes = 0LL;

    progressStatus = v2->_progressStatus;
    v2->_progressStatus = 0LL;

    v2->_state = 0;
    lastSuccessForTargetMainOSBuild = v2->_lastSuccessForTargetMainOSBuild;
    v2->_lastSuccessForTargetMainOSBuild = 0LL;

    lastSuccessForTargetRecoveryOSBuild = v2->_lastSuccessForTargetRecoveryOSBuild;
    v2->_lastSuccessForTargetRecoveryOSBuild = 0LL;

    v2->_progressCB = 0LL;
    v2->_progressContext = 0LL;
  }

  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_once != -1) {
    dispatch_once(&sharedInstance_once, &__block_literal_global_0);
  }
  return (id)sharedInstance___instance;
}

void __45__MSUNRDUpdateBrainController_sharedInstance__block_invoke(id a1)
{
  v1 = objc_alloc_init(&OBJC_CLASS___MSUNRDUpdateBrainController);
  v2 = (void *)sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v1;
}

- (void)startForMSUUpdate:(id)a3
{
}

- (void)startForMSUUpdate:(id)a3 withMSUBrainVersion:(id)a4
{
}

- (void)startForMSUUpdate:(id)a3 withMSUBrainVersion:(id)a4 withOptions:(id)a5
{
  id v8 = a3;
  dispatch_queue_t v9 = (__CFString *)a4;
  id v15 = a5;
  if (v9) {
    v16 = v9;
  }
  else {
    v16 = @"(unversioned)";
  }
  logfunction( ",  1,  @"Received request to start RecoveryOS update for MSU update:%@\n"",  v10,  v11,  v12,  v13,  v14,  (char)v8);
  v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSUNRDUpdateBrainController workQueue](self, "workQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __81__MSUNRDUpdateBrainController_startForMSUUpdate_withMSUBrainVersion_withOptions___block_invoke;
  block[3] = &unk_100059038;
  id v22 = v8;
  objc_super v23 = self;
  v24 = v16;
  id v25 = v15;
  id v18 = v15;
  v19 = v16;
  id v20 = v8;
  dispatch_async(v17, block);
}

void __81__MSUNRDUpdateBrainController_startForMSUUpdate_withMSUBrainVersion_withOptions___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  id v101 = 0LL;
  id v102 = 0LL;
  BOOL updated = NRDGetUpdateBrainConnection( &v102,  &v101,  (void (*)(uint64_t, uint64_t))progressCallback,  *(void *)(a1 + 40));
  id v10 = v102;
  id v11 = v101;
  uint64_t v12 = objc_opt_new(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  *(void *)(a1 + 32),  @"MainOSUpdateAttributes");
  v103 = @"msuBrainVersion";
  uint64_t v104 = *(void *)(a1 + 48);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v104,  &v103,  1LL));
  -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  v13,  @"AdditionalEventInfo");

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 56) objectForKeyedSubscript:@"ForceInline"]);
  unsigned int v15 = [v14 BOOLValue];

  if (v15)
  {
    logfunction( ",  1,  @"MSUNRD detected option %@, adding appropriate keys to query\n",  v16,  v17,  v18,  v19,  v20,  (char)@"ForceInline"");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"Foreground");
    -[NSMutableDictionary setObject:forKeyedSubscript:]( v12,  "setObject:forKeyedSubscript:",  &__kCFBooleanTrue,  @"ForceInline");
  }

  if (updated)
  {
    [*(id *)(a1 + 40) saveState:2];
    v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) nrdLock]);

    if (v21)
    {
      logfunction(", 1, @"Found existing nrd lock, releasing it first\n"", v22, v23, v24, v25, v26, v85);
      v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) nrdLock]);
      NRDReleaseActivityLock(v27);

      [*(id *)(a1 + 40) setNrdLock:0];
    }

    id v28 = NRDAcquireActivityLock(v10, (void (*)(uint64_t, uint64_t))progressCallback, *(void *)(a1 + 40));
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    [*(id *)(a1 + 40) setNrdLock:v29];

    v30 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"OSVersion"]);
    v31 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"Build"]);
    id v99 = 0LL;
    id v100 = 0LL;
    id v98 = v11;
    BOOL v32 = NRDQueryRecoveryOS( v10,  v30,  v31,  v12,  &v100,  &v99,  &v98,  (void (*)(uint64_t, uint64_t))progressCallback,  *(void *)(a1 + 40));
    id v33 = v100;
    id v34 = v99;
    id v35 = v98;

    if (v34)
    {
      logfunction(", 1, @"Installed recovery OS:\n%@\n"", v36, v37, v38, v39, v40, (char)v34);
      [*(id *)(a1 + 40) saveRecoveryOSInfo:v34];
      if (v32)
      {
        if (v33)
        {
LABEL_9:
          [*(id *)(a1 + 40) saveState:3];
          logfunction(", 1, @"RecoveryOS update was found:\n%@\n"", v46, v47, v48, v49, v50, (char)v33);
          id v96 = v35;
          id v97 = 0LL;
          BOOL v51 = NRDDownloadRecoveryOS(v10, v33, 0LL, &v97, &v96, (uint64_t)progressCallback, *(void *)(a1 + 40));
          id v52 = v97;
          id v11 = v96;

          if (v51)
          {
            [*(id *)(a1 + 40) saveState:4];
            logfunction(", 1, @"RecoveryOS update was successfully downloaded.\n"", v58, v59, v60, v61, v62, v88);
            id v94 = v11;
            id v95 = 0LL;
            BOOL v63 = NRDInstallRecoveryOS(v10, v33, 0LL, &v95, &v94, (uint64_t)progressCallback, *(void *)(a1 + 40));
            id v64 = v95;
            id v35 = v94;

            if (v63)
            {
              v92 = *(void **)(a1 + 40);
              v93 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKeyedSubscript:@"Build"]);
              v91 = (void *)objc_claimAutoreleasedReturnValue([v33 objectForKeyedSubscript:@"assetAttributes"]);
              v70 = (void *)objc_claimAutoreleasedReturnValue([v91 objectForKeyedSubscript:@"AssetProperties"]);
              v71 = (void *)objc_claimAutoreleasedReturnValue([v70 objectForKeyedSubscript:@"Build"]);
              [v92 saveLastSuccessForTargetMainOSBuild:v93 recoveryOSBuild:v71];

              [*(id *)(a1 + 40) saveState:5];
              logfunction(", 1, @"RecoveryOS update was successfully installed.\n"", v72, v73, v74, v75, v76, v89);
              goto LABEL_22;
            }

            logfunction( ",  1,  @"Non-fatal error installing RecoveryOS update: %@\n"",  v65,  v66,  v67,  v68,  v69,  (char)v35);
            goto LABEL_19;
          }

          logfunction( ",  1,  @"Non-fatal error downloading RecoveryOS update: %@\n"",  v53,  v54,  v55,  v56,  v57,  (char)v11);
          goto LABEL_13;
        }

- (void)updateStatusFromCallback:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSUNRDUpdateBrainController stateQueue](self, "stateQueue"));
  dispatch_assert_queue_not_V2(v5);

  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSUNRDUpdateBrainController stateQueue](self, "stateQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = __56__MSUNRDUpdateBrainController_updateStatusFromCallback___block_invoke;
  v8[3] = &unk_100059060;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

id __56__MSUNRDUpdateBrainController_updateStatusFromCallback___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  id result = [*(id *)(a1 + 40) progressCB];
  if (result) {
    return (id)((uint64_t (*)(void, id))[*(id *)(a1 + 40) progressCB])( *(void *)(a1 + 32),  objc_msgSend(*(id *)(a1 + 40), "progressContext"));
  }
  return result;
}

- (id)status
{
  dispatch_queue_attr_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSUNRDUpdateBrainController stateQueue](self, "stateQueue"));
  dispatch_assert_queue_not_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](&OBJC_CLASS___NSMutableDictionary, "dictionary"));
  dispatch_queue_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSUNRDUpdateBrainController stateQueue](self, "stateQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = __37__MSUNRDUpdateBrainController_status__block_invoke;
  v9[3] = &unk_100059060;
  id v6 = v4;
  id v10 = v6;
  id v11 = self;
  dispatch_sync(v5, v9);

  id v7 = v6;
  return v7;
}

void __37__MSUNRDUpdateBrainController_status__block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInt:]( NSNumber,  "numberWithUnsignedInt:",  [*(id *)(a1 + 40) state]));
  [*(id *)(a1 + 32) setObject:v2 forKeyedSubscript:@"State"];

  dispatch_queue_attr_t v3 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) currentMSUUpdateAttributes]);
  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) currentMSUUpdateAttributes]);
    [*(id *)(a1 + 32) setObject:v4 forKeyedSubscript:@"MSUUpdateAttributes"];
  }

  dispatch_queue_t v5 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) progressStatus]);

  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) progressStatus]);
    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:@"ProgressStatus"];
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) lastError]);

  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) lastError]);
    [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:@"LastError"];
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) currentRecoveryOSInfo]);

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) currentRecoveryOSInfo]);
    [*(id *)(a1 + 32) setObject:v10 forKeyedSubscript:@"RecoveryOSInfo"];
  }

  id v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) lastSuccessForTargetMainOSBuild]);

  if (v11)
  {
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) lastSuccessForTargetMainOSBuild]);
    [*(id *)(a1 + 32) setObject:v12 forKeyedSubscript:@"SuccessForTargetMainOSBuild"];
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) lastSuccessForTargetRecoveryOSBuild]);

  if (v13)
  {
    id v14 = (id)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) lastSuccessForTargetRecoveryOSBuild]);
    [*(id *)(a1 + 32) setObject:v14 forKeyedSubscript:@"SuccessForTargetRecoveryOSBuild"];
  }

- (void)cancelAndLock
{
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSUNRDUpdateBrainController cancelQueue](self, "cancelQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __44__MSUNRDUpdateBrainController_cancelAndLock__block_invoke;
  block[3] = &unk_1000590B0;
  void block[4] = self;
  dispatch_async(v8, block);
}

void __44__MSUNRDUpdateBrainController_cancelAndLock__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
  uint64_t v33 = 0LL;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  uint64_t v36 = __Block_byref_object_copy__0;
  uint64_t v37 = __Block_byref_object_dispose__0;
  id v38 = 0LL;
  uint64_t v29 = 0LL;
  v30 = &v29;
  uint64_t v31 = 0x2020000000LL;
  char v32 = 1;
  id obj = 0LL;
  id v28 = 0LL;
  BOOL updated = NRDGetUpdateBrainConnection( &v28,  &obj,  (void (*)(uint64_t, uint64_t))progressCallback,  *(void *)(a1 + 32));
  id v10 = v28;
  objc_storeStrong(&v38, obj);
  *((_BYTE *)v30 + 24) = updated;
  uint64_t v17 = (id *)(v34 + 5);
  uint64_t v16 = v34[5];
  if (!updated)
  {
    uint64_t v20 = @"Non-fatal error connecting to RecoveryOSUpdateBrain: %@\n";
LABEL_6:
    logfunction("", 1, v20, v11, v12, v13, v14, v15, v16);
    goto LABEL_7;
  }

  id v26 = (id)v34[5];
  BOOL v18 = NRDCancelRecoveryOSUpdate( v10,  &v26,  (void (*)(uint64_t, uint64_t))progressCallback,  *(void *)(a1 + 32));
  objc_storeStrong(v17, v26);
  *((_BYTE *)v30 + 24) = v18;
  if (!v18)
  {
    uint64_t v16 = v34[5];
    uint64_t v20 = @"Non-fatal error canceling recoveryOS update: %@\n";
    goto LABEL_6;
  }

  uint64_t v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) workQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __44__MSUNRDUpdateBrainController_cancelAndLock__block_invoke_261;
  block[3] = &unk_100059088;
  void block[4] = *(void *)(a1 + 32);
  id v23 = v10;
  uint64_t v24 = &v29;
  uint64_t v25 = &v33;
  dispatch_async(v19, block);

LABEL_7:
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v33, 8);
}

void __44__MSUNRDUpdateBrainController_cancelAndLock__block_invoke_261(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) nrdLock]);

  if (!v2)
  {
    logfunction(", 1, @"Acquiring NRD lock\n"", v3, v4, v5, v6, v7, v25);
    id v8 = NRDAcquireActivityLock( *(void **)(a1 + 40),  (void (*)(uint64_t, uint64_t))progressCallback,  *(void *)(a1 + 32));
    char v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    [*(id *)(a1 + 32) setNrdLock:v9];
  }

  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id obj = *(id *)(v10 + 40);
  id v28 = 0LL;
  BOOL v11 = NRDQueryRecoveryOS( *(void **)(a1 + 40),  0LL,  0LL,  &off_100063C50,  0LL,  &v28,  &obj,  (void (*)(uint64_t, uint64_t))progressCallback,  *(void *)(a1 + 32));
  id v12 = v28;
  objc_storeStrong((id *)(v10 + 40), obj);
  *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = v11;
  if (v12)
  {
    logfunction(", 1, @"Installed recovery OS:\n%@\n"", v13, v14, v15, v16, v17, (char)v12);
    BOOL v18 = *(void **)(a1 + 32);
    id v19 = v12;
LABEL_7:
    [v18 saveRecoveryOSInfo:v19];
    goto LABEL_8;
  }

  if (*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL))
  {
    logfunction(", 1, @"No recoveryOS is installed\n"", v13, v14, v15, v16, v17, v26);
    BOOL v18 = *(void **)(a1 + 32);
    id v19 = 0LL;
    goto LABEL_7;
  }

  logfunction(", 1, @"Installed state of recovery OS is unknown.\n"", v13, v14, v15, v16, v17, v26);
LABEL_8:
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL)) {
    logfunction( ",  1,  @"Non-fatal error querying for RecoveryOS update: %@\n"",  v20,  v21,  v22,  v23,  v24,  *(void *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL));
  }
}

- (id)waitWithTimeout:(int)a3 progressCallback:(void *)a4 context:(void *)a5 releaseLock:(BOOL)a6
{
  BOOL v8 = a6;
  logfunction(", 1, @"waitWithTimeout:%d releaseLock:%@\n"", (uint64_t)a4, (uint64_t)a5, a6, v6, v7, a3);
  uint64_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSUNRDUpdateBrainController stateQueue](self, "stateQueue"));
  dispatch_assert_queue_not_V2(v13);

  dispatch_semaphore_t v14 = dispatch_semaphore_create(0LL);
  if (a4)
  {
    uint64_t v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSUNRDUpdateBrainController stateQueue](self, "stateQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = __84__MSUNRDUpdateBrainController_waitWithTimeout_progressCallback_context_releaseLock___block_invoke;
    block[3] = &unk_1000590D8;
    void block[4] = self;
    void block[5] = a4;
    block[6] = a5;
    dispatch_sync(v15, block);
  }

  uint64_t v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSUNRDUpdateBrainController workQueue](self, "workQueue"));
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472LL;
  v37[2] = __84__MSUNRDUpdateBrainController_waitWithTimeout_progressCallback_context_releaseLock___block_invoke_276;
  v37[3] = &unk_1000590B0;
  uint64_t v17 = v14;
  id v38 = v17;
  dispatch_async(v16, v37);

  dispatch_time_t v18 = dispatch_time(0LL, 1000000000LL * a3);
  if (dispatch_semaphore_wait(v17, v18))
  {
    logfunction(", 1, @"Timed out waiting for NRD update to finish\n"", v19, v20, v21, v22, v23, v35);
    NSErrorUserInfoKey v40 = NSDebugDescriptionErrorKey;
    uint64_t v41 = @"timed out waiting for NRD update to finish";
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v41,  &v40,  1LL));
    char v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"MobileSoftwareUpdateErrorDomain",  77LL,  v24));

    if (!v8) {
      goto LABEL_9;
    }
  }

  else
  {
    char v25 = 0LL;
    if (!v8) {
      goto LABEL_9;
    }
  }

  char v26 = (void *)objc_claimAutoreleasedReturnValue(-[MSUNRDUpdateBrainController nrdLock](self, "nrdLock"));

  if (v26)
  {
    logfunction(", 1, @"Releasing nrd lock\n"", v27, v28, v29, v30, v31, v35);
    char v32 = (void *)objc_claimAutoreleasedReturnValue(-[MSUNRDUpdateBrainController nrdLock](self, "nrdLock"));
    NRDReleaseActivityLock(v32);

    -[MSUNRDUpdateBrainController setNrdLock:](self, "setNrdLock:", 0LL);
  }

void __84__MSUNRDUpdateBrainController_waitWithTimeout_progressCallback_context_releaseLock___block_invoke( uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](&OBJC_CLASS___NSNumber, "numberWithDouble:", 0.0));
  v4[0] = @"ActionText";
  v4[1] = @"ElapsedTime";
  v5[0] = @"Waiting for RecoveryOS update...";
  v5[1] = &off_100063B48;
  v4[2] = @"PercentComplete";
  v4[3] = @"PercentBytesComplete";
  v5[2] = v2;
  v5[3] = v2;
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v5,  v4,  4LL));
  ((void (*)(void *, id))[*(id *)(a1 + 32) progressCB])( v3,  objc_msgSend(*(id *)(a1 + 32), "progressContext"));
}

uint64_t __84__MSUNRDUpdateBrainController_waitWithTimeout_progressCallback_context_releaseLock___block_invoke_276( uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

id __84__MSUNRDUpdateBrainController_waitWithTimeout_progressCallback_context_releaseLock___block_invoke_2( uint64_t a1)
{
  return [*(id *)(a1 + 32) setProgressContext:0];
}

- (void)saveLastError:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSUNRDUpdateBrainController stateQueue](self, "stateQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __45__MSUNRDUpdateBrainController_saveLastError___block_invoke;
  v7[3] = &unk_100059060;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

id __45__MSUNRDUpdateBrainController_saveLastError___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lastError]);
  logfunction(", 1, @"Overriding current error:%@ with:%@\n"", v3, v4, v5, v6, v7, (char)v2);

  return [*(id *)(a1 + 32) setLastError:*(void *)(a1 + 40)];
}

- (void)saveRecoveryOSInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSUNRDUpdateBrainController stateQueue](self, "stateQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __50__MSUNRDUpdateBrainController_saveRecoveryOSInfo___block_invoke;
  v7[3] = &unk_100059060;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

id __50__MSUNRDUpdateBrainController_saveRecoveryOSInfo___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentRecoveryOSInfo]);
  logfunction(", 1, @"Overriding current RecoveryOS info:%@ with:%@\n"", v3, v4, v5, v6, v7, (char)v2);

  return [*(id *)(a1 + 32) setCurrentRecoveryOSInfo:*(void *)(a1 + 40)];
}

- (void)saveLastSuccessForTargetMainOSBuild:(id)a3 recoveryOSBuild:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSUNRDUpdateBrainController stateQueue](self, "stateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __83__MSUNRDUpdateBrainController_saveLastSuccessForTargetMainOSBuild_recoveryOSBuild___block_invoke;
  block[3] = &unk_100059100;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

id __83__MSUNRDUpdateBrainController_saveLastSuccessForTargetMainOSBuild_recoveryOSBuild___block_invoke( uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lastSuccessForTargetMainOSBuild]);
  logfunction( ",  1,  @"Overriding current LastSuccessForTargetMainOSBuild:%@ with:%@\n"",  v3,  v4,  v5,  v6,  v7,  (char)v2);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) lastSuccessForTargetRecoveryOSBuild]);
  logfunction( ",  1,  @"Overriding current LastSuccessForTargetRecoveryOSBuild:%@ with:%@\n"",  v9,  v10,  v11,  v12,  v13,  (char)v8);

  [*(id *)(a1 + 32) setLastSuccessForTargetMainOSBuild:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 32) setLastSuccessForTargetRecoveryOSBuild:*(void *)(a1 + 48)];
}

- (void)saveMSUUpdateAttributes:(id)a3 andState:(int)a4
{
  id v6 = a3;
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSUNRDUpdateBrainController stateQueue](self, "stateQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __64__MSUNRDUpdateBrainController_saveMSUUpdateAttributes_andState___block_invoke;
  block[3] = &unk_100059128;
  int v11 = a4;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

id __64__MSUNRDUpdateBrainController_saveMSUUpdateAttributes_andState___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[MSUNRDUpdateBrainController stateToString:]( MSUNRDUpdateBrainController,  "stateToString:",  [*(id *)(a1 + 32) state]));
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue( +[MSUNRDUpdateBrainController stateToString:]( &OBJC_CLASS___MSUNRDUpdateBrainController,  "stateToString:",  *(unsigned int *)(a1 + 48)));
  logfunction(", 1, @"Overriding current state:%@ with:%@\n"", v4, v5, v6, v7, v8, (char)v2);

  [*(id *)(a1 + 32) setState:*(unsigned int *)(a1 + 48)];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) currentMSUUpdateAttributes]);
  logfunction(", 1, @"Overriding current MSU Update Attributes:%@ with:%@\n"", v10, v11, v12, v13, v14, (char)v9);

  return [*(id *)(a1 + 32) setCurrentMSUUpdateAttributes:*(void *)(a1 + 40)];
}

+ (id)stateToString:(int)a3
{
  else {
    return *(&off_100059170 + a3);
  }
}

- (void)saveState:(int)a3
{
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[MSUNRDUpdateBrainController stateQueue](self, "stateQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = __41__MSUNRDUpdateBrainController_saveState___block_invoke;
  v6[3] = &unk_100059150;
  v6[4] = self;
  int v7 = a3;
  dispatch_async(v5, v6);
}

id __41__MSUNRDUpdateBrainController_saveState___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue( +[MSUNRDUpdateBrainController stateToString:]( MSUNRDUpdateBrainController,  "stateToString:",  [*(id *)(a1 + 32) state]));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[MSUNRDUpdateBrainController stateToString:]( &OBJC_CLASS___MSUNRDUpdateBrainController,  "stateToString:",  *(unsigned int *)(a1 + 40)));
  logfunction(", 1, @"Overriding current state:%@ with:%@\n"", v3, v4, v5, v6, v7, (char)v2);

  return [*(id *)(a1 + 32) setState:*(unsigned int *)(a1 + 40)];
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (OS_dispatch_queue)cancelQueue
{
  return self->_cancelQueue;
}

- (void)setCancelQueue:(id)a3
{
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (void)setStateQueue:(id)a3
{
}

- (id)nrdLock
{
  return self->_nrdLock;
}

- (void)setNrdLock:(id)a3
{
}

- (NSError)lastError
{
  return self->_lastError;
}

- (void)setLastError:(id)a3
{
}

- (NSDictionary)currentRecoveryOSInfo
{
  return self->_currentRecoveryOSInfo;
}

- (void)setCurrentRecoveryOSInfo:(id)a3
{
}

- (NSDictionary)progressStatus
{
  return self->_progressStatus;
}

- (void)setProgressStatus:(id)a3
{
}

- (NSDictionary)currentMSUUpdateAttributes
{
  return self->_currentMSUUpdateAttributes;
}

- (void)setCurrentMSUUpdateAttributes:(id)a3
{
}

- (NSString)lastSuccessForTargetMainOSBuild
{
  return self->_lastSuccessForTargetMainOSBuild;
}

- (void)setLastSuccessForTargetMainOSBuild:(id)a3
{
}

- (NSString)lastSuccessForTargetRecoveryOSBuild
{
  return self->_lastSuccessForTargetRecoveryOSBuild;
}

- (void)setLastSuccessForTargetRecoveryOSBuild:(id)a3
{
}

- (void)progressCB
{
  return self->_progressCB;
}

- (void)setProgressCB:(void *)a3
{
  self->_progressCB = a3;
}

- (void)progressContext
{
  return self->_progressContext;
}

- (void)setProgressContext:(void *)a3
{
  self->_progressContext = a3;
}

- (void).cxx_destruct
{
}

@end