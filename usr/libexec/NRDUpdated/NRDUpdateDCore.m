@interface NRDUpdateDCore
- (BOOL)brainLoadRequiresUnlock;
- (BOOL)forceBrainUpdate;
- (BOOL)isPasscodeLocked;
- (Class)_infoClassForAction:(id)a3;
- (MAAsset)loadBrainAsset;
- (MAAsset)localBrainAsset;
- (MAAsset)updateBrainAsset;
- (NRDUpdateDCore)initWithDelegate:(id)a3;
- (NRDUpdateDCoreDelegate)delegate;
- (NSBackgroundActivityScheduler)periodicScheduler;
- (NSBackgroundActivityScheduler)rescanScheduler;
- (NSDictionary)stateTable;
- (NSDictionary)updateOptions;
- (NSNumber)updateAttempt;
- (NSString)uuid;
- (OS_dispatch_queue)keyBagQueue;
- (OS_dispatch_queue)updateQueue;
- (SUCoreFSM)updatedFSM;
- (SUCoreMobileAsset)maControl;
- (SUCorePolicyUpdateBrain)downloadPolicy;
- (SUCorePolicyUpdateBrain)scanPolicy;
- (SUCoreScan)scanner;
- (double)_minimumInterval:(double)a3;
- (id)brain;
- (id)findLocalBrainAsset;
- (id)runningBrain;
- (int)keyBagStateChangedNotifyToken;
- (int64_t)actionBeginBrainScan:(id *)a3;
- (int64_t)actionCheckDeviceUnlockConstraint:(id *)a3;
- (int64_t)actionDownloadBrainUpdate:(id *)a3;
- (int64_t)actionLoadBrain:(id *)a3;
- (int64_t)actionLoadPersisted:(id *)a3;
- (int64_t)actionPeriodicScan:(id *)a3;
- (int64_t)actionRunBrain:(id *)a3;
- (int64_t)actionScheduleRetry:(id)a3 error:(id *)a4;
- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4;
- (int64_t)actionWaitForUnlock:(id *)a3;
- (int64_t)getSchedulerQOS;
- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8;
- (void)cleanBeforeScan;
- (void)cleanReScanScheduler;
- (void)connectionInterrupted;
- (void)connectionInvalidated;
- (void)findLocalBrainAsset;
- (void)getSchedulerQOS;
- (void)maDownloadFailed:(id)a3;
- (void)maDownloadProgress:(id)a3;
- (void)maDownloadStalled:(id)a3;
- (void)maDownloaded:(id)a3;
- (void)newBrain:(id)a3;
- (void)newSchedulerWithIdentifier:(id)a3 reply:(id)a4;
- (void)performUpdate:(id)a3;
- (void)registerUpdatedFSMhandlers;
- (void)scheduleNRDUpdateBrainPeriodicScan;
- (void)scheduleNRDUpdateBrainReScan:(BOOL)a3;
- (void)setBrain:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDownloadPolicy:(id)a3;
- (void)setForceBrainUpdate:(BOOL)a3;
- (void)setKeyBagQueue:(id)a3;
- (void)setKeyBagStateChangedNotifyToken:(int)a3;
- (void)setLoadBrainAsset:(id)a3;
- (void)setLocalBrainAsset:(id)a3;
- (void)setMaControl:(id)a3;
- (void)setPeriodicScheduler:(id)a3;
- (void)setRescanScheduler:(id)a3;
- (void)setRunningBrain:(id)a3;
- (void)setScanPolicy:(id)a3;
- (void)setScanner:(id)a3;
- (void)setStateTable:(id)a3;
- (void)setUpdateAttempt:(id)a3;
- (void)setUpdateBrainAsset:(id)a3;
- (void)setUpdateOptions:(id)a3;
- (void)setUpdateQueue:(id)a3;
- (void)setUpdatedFSM:(id)a3;
- (void)setUuid:(id)a3;
@end

@implementation NRDUpdateDCore

- (NRDUpdateDCore)initWithDelegate:(id)a3
{
  id v4 = a3;
  v55.receiver = self;
  v55.super_class = (Class)&OBJC_CLASS___NRDUpdateDCore;
  v5 = -[NRDUpdateDCore init](&v55, "init");
  if (v5)
  {
    id v53 = v4;
    uint64_t v52 = kSU_S_Startup;
    v114[0] = kSU_S_Startup;
    v112[0] = @"ProceedToNextUpdateStep";
    uint64_t v6 = kSUCoreNextStateKey;
    uint64_t v7 = kSU_S_LoadingPersisted;
    uint64_t v8 = kSUCoreActionKey;
    v110[0] = kSUCoreNextStateKey;
    v110[1] = kSUCoreActionKey;
    uint64_t v9 = kSU_A_LoadPersisted;
    v111[0] = kSU_S_LoadingPersisted;
    v111[1] = kSU_A_LoadPersisted;
    v51 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v111,  v110,  2LL));
    v113[0] = v51;
    v112[1] = @"PeriodicScanRequested";
    v108[0] = v6;
    v108[1] = v8;
    v109[0] = v7;
    v109[1] = v9;
    v50 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v109,  v108,  2LL));
    v113[1] = v50;
    v49 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v113,  v112,  2LL));
    v115[0] = v49;
    v114[1] = v7;
    v106[0] = @"NoLocalBrainFound";
    v104[0] = v6;
    v104[1] = v8;
    v105[0] = @"ScanningBrain";
    v105[1] = @"ActionBeginBrainScan";
    v48 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v105,  v104,  2LL));
    v107[0] = v48;
    v106[1] = @"LocalBrainFound";
    v102[0] = v6;
    v102[1] = v8;
    v103[0] = @"CheckingDeviceUnlockConstraint";
    v103[1] = @"ActionCheckDeviceUnlockConstraint";
    v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v103,  v102,  2LL));
    v107[1] = v47;
    v46 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v107,  v106,  2LL));
    v115[1] = v46;
    v114[2] = @"ScanningBrain";
    v100[0] = @"NoRemoteBrainFound";
    v98[0] = v6;
    v98[1] = v8;
    v99[0] = @"SchedulingRetry";
    v99[1] = @"ActionScheduleRetry";
    v45 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v99,  v98,  2LL));
    v101[0] = v45;
    v100[1] = @"ErrorGeneric";
    v96[0] = v6;
    v96[1] = v8;
    v97[0] = @"SchedulingRetry";
    v97[1] = @"ActionScheduleRetry";
    v44 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v97,  v96,  2LL));
    v101[1] = v44;
    v100[2] = @"ProceedToNextUpdateStep";
    v94[0] = v6;
    v94[1] = v8;
    v95[0] = @"DownloadingBrain";
    v95[1] = @"ActionDownloadBrain";
    v43 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v95,  v94,  2LL));
    v101[2] = v43;
    v42 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v101,  v100,  3LL));
    v115[2] = v42;
    v114[3] = @"DownloadingBrain";
    v92[0] = @"ProceedToNextUpdateStep";
    v90[0] = v6;
    v90[1] = v8;
    v91[0] = @"CheckingDeviceUnlockConstraint";
    v91[1] = @"ActionCheckDeviceUnlockConstraint";
    v41 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v91,  v90,  2LL));
    v93[0] = v41;
    v92[1] = kSU_E_DownloadFailed;
    v88[0] = v6;
    v88[1] = v8;
    v89[0] = @"SchedulingRetry";
    v89[1] = @"ActionScheduleRetry";
    v40 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v89,  v88,  2LL));
    v93[1] = v40;
    v39 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v93,  v92,  2LL));
    v115[3] = v39;
    v114[4] = @"CheckingDeviceUnlockConstraint";
    v86[0] = @"DeviceLocked";
    v84[0] = v6;
    v84[1] = v8;
    v85[0] = @"WaitingForUnlock";
    v85[1] = @"ActionWaitForUnlock";
    v38 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v85,  v84,  2LL));
    v87[0] = v38;
    v86[1] = @"DeviceUnlocked";
    v82[0] = v6;
    v82[1] = v8;
    v83[0] = @"LoadingBrain";
    v83[1] = @"ActionLoadBrain";
    v37 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v83,  v82,  2LL));
    v87[1] = v37;
    v36 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v87,  v86,  2LL));
    v115[4] = v36;
    v114[5] = @"WaitingForUnlock";
    v80[0] = @"DeviceUnlocked";
    v78[0] = v6;
    v78[1] = v8;
    v79[0] = @"LoadingBrain";
    v79[1] = @"ActionLoadBrain";
    v35 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v79,  v78,  2LL));
    v81[0] = v35;
    v80[1] = @"PeriodicScanRequested";
    uint64_t v76 = v8;
    v77 = @"ActionWaitForUnlock";
    v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v77,  &v76,  1LL));
    v81[1] = v34;
    v80[2] = @"ProceedToNextUpdateStep";
    uint64_t v74 = v8;
    v75 = @"ActionWaitForUnlock";
    v33 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v75,  &v74,  1LL));
    v81[2] = v33;
    v32 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v81,  v80,  3LL));
    v115[5] = v32;
    v114[6] = @"LoadingBrain";
    v72[0] = @"ProceedToNextUpdateStep";
    v70[0] = v6;
    v70[1] = v8;
    v71[0] = @"RunningBrain";
    v71[1] = @"ActionRunBrain";
    v31 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v71,  v70,  2LL));
    v72[1] = @"ErrorGeneric";
    v73[0] = v31;
    v68[0] = v6;
    v68[1] = v8;
    v69[0] = @"SchedulingRetry";
    v69[1] = @"ActionScheduleRetry";
    v30 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v69,  v68,  2LL));
    v73[1] = v30;
    v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v73,  v72,  2LL));
    v115[6] = v29;
    v114[7] = @"RunningBrain";
    v65 = @"ActionRunBrain";
    v66[0] = @"ProceedToNextUpdateStep";
    uint64_t v64 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v65,  &v64,  1LL));
    v66[1] = @"PeriodicScanRequested";
    v67[0] = v10;
    uint64_t v62 = v8;
    v63 = @"ActionPeriodicScan";
    v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v63,  &v62,  1LL));
    v67[1] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v67,  v66,  2LL));
    v115[7] = v12;
    v114[8] = @"SchedulingRetry";
    v60[0] = @"ProceedToNextUpdateStep";
    v58[0] = v6;
    v58[1] = v8;
    v59[0] = @"ScanningBrain";
    v59[1] = @"ActionBeginBrainScan";
    v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v59,  v58,  2LL));
    v60[1] = @"PeriodicScanRequested";
    v61[0] = v13;
    v56[0] = v6;
    v56[1] = v8;
    v57[0] = @"ScanningBrain";
    v57[1] = @"ActionBeginBrainScan";
    v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v57,  v56,  2LL));
    v61[1] = v14;
    v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v61,  v60,  2LL));
    v115[8] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v115,  v114,  9LL));

    v17 = -[NSDictionary initWithDictionary:copyItems:]( objc_alloc(&OBJC_CLASS___NSDictionary),  "initWithDictionary:copyItems:",  v16,  1LL);
    -[NRDUpdateDCore setStateTable:](v5, "setStateTable:", v17);

    id v18 = nrdSharedLogger();
    v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Creating FSM", buf, 2u);
    }

    id v20 = -[SUCoreFSM initMachine:withTable:startingIn:]( objc_alloc(&OBJC_CLASS___SUCoreFSM),  "initMachine:withTable:startingIn:",  @"NRDUpdated",  v5->_stateTable,  v52);
    -[NRDUpdateDCore setUpdatedFSM:](v5, "setUpdatedFSM:", v20);

    -[NRDUpdateDCore setScanPolicy:](v5, "setScanPolicy:", 0LL);
    -[NRDUpdateDCore setDownloadPolicy:](v5, "setDownloadPolicy:", 0LL);
    -[NRDUpdateDCore registerUpdatedFSMhandlers](v5, "registerUpdatedFSMhandlers");
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updatedFSM](v5, "updatedFSM"));
    [v21 activateMachine];

    id v4 = v53;
    -[NRDUpdateDCore setDelegate:](v5, "setDelegate:", v53);
    dispatch_queue_t v22 = dispatch_queue_create("com.apple.NRDUpdated.keybag", 0LL);
    -[NRDUpdateDCore setKeyBagQueue:](v5, "setKeyBagQueue:", v22);

    dispatch_queue_t v23 = dispatch_queue_create("com.apple.NRDUpdated.update", 0LL);
    -[NRDUpdateDCore setUpdateQueue:](v5, "setUpdateQueue:", v23);

    dispatch_semaphore_t v24 = dispatch_semaphore_create(0LL);
    fsmSemaphore = v5->_fsmSemaphore;
    v5->_fsmSemaphore = (OS_dispatch_semaphore *)v24;

    id v26 = nrdSharedLogger();
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v27,  OS_LOG_TYPE_DEFAULT,  "Initialization of NRDUpdateDCore complete",  buf,  2u);
    }
  }

  return v5;
}

- (Class)_infoClassForAction:(id)a3
{
  if ([a3 compare:@"ActionScheduleRetry"]) {
    return (Class)0LL;
  }
  uint64_t v4 = objc_opt_class(&OBJC_CLASS___NSError);
  return (Class)(id)objc_claimAutoreleasedReturnValue(v4);
}

- (void)registerUpdatedFSMhandlers
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore stateTable](self, "stateTable"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = __44__NRDUpdateDCore_registerUpdatedFSMhandlers__block_invoke;
  v4[3] = &unk_100014998;
  v4[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
}

void __44__NRDUpdateDCore_registerUpdatedFSMhandlers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __44__NRDUpdateDCore_registerUpdatedFSMhandlers__block_invoke_2;
  v7[3] = &unk_100014970;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v6 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v7];
}

void __44__NRDUpdateDCore_registerUpdatedFSMhandlers__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = (void *)objc_claimAutoreleasedReturnValue([a3 objectForKey:kSUCoreActionKey]);
  if (v5)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) updatedFSM]);
    objc_msgSend( v6,  "registerAction:ForEvent:inState:usingDelegate:withInfoClass:",  v5,  v7,  *(void *)(a1 + 40),  *(void *)(a1 + 32),  objc_msgSend(*(id *)(a1 + 32), "_infoClassForAction:", v5));
  }
}

- (id)findLocalBrainAsset
{
  v2 = -[SUCorePolicyUpdateBrain initWithSoftwareUpdateAssetType:documentationAssetType:usingExtensions:]( objc_alloc(&OBJC_CLASS___SUCorePolicyUpdateBrain),  "initWithSoftwareUpdateAssetType:documentationAssetType:usingExtensions:",  @"com.apple.MobileAsset.RecoveryOSUpdateBrain",  0LL,  0LL);
  -[SUCorePolicyUpdateBrain setAllowSameVersion:](v2, "setAllowSameVersion:", 1LL);
  -[SUCorePolicyUpdateBrain setRestrictToFull:](v2, "setRestrictToFull:", 1LL);
  -[SUCorePolicyUpdateBrain setReleaseType:](v2, "setReleaseType:", 0LL);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
  -[SUCorePolicyUpdateBrain setCompatibilityVersion:](v2, "setCompatibilityVersion:", v3);

  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( -[SUCorePolicyUpdateBrain constructSoftwareUpdateMAAssetQuery]( v2,  "constructSoftwareUpdateMAAssetQuery"));
  [v4 returnTypes:1];
  [v4 setDoNotBlockOnNetworkStatus:1];
  if ([v4 queryMetaDataSync])
  {
    id v5 = nrdSharedLogger();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[NRDUpdateDCore findLocalBrainAsset].cold.1();
    }
    id v7 = 0LL;
    id v8 = 0LL;
    goto LABEL_10;
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 results]);
  if ((unint64_t)[v8 count] >= 2)
  {
    id v9 = nrdSharedLogger();
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      id v18 = [v8 count];
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Found %lu brain assets.  Removing all...",  buf,  0xCu);
    }

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = __37__NRDUpdateDCore_findLocalBrainAsset__block_invoke;
    v15[3] = &unk_1000149C0;
    dispatch_semaphore_t v16 = dispatch_semaphore_create(0LL);
    id v6 = v16;
    +[SUCorePurge removeAllAssetsOfType:completion:]( &OBJC_CLASS___SUCorePurge,  "removeAllAssetsOfType:completion:",  @"com.apple.MobileAsset.RecoveryOSUpdateBrain",  v15);
    dispatch_semaphore_wait((dispatch_semaphore_t)v6, 0xFFFFFFFFFFFFFFFFLL);

LABEL_9:
    id v7 = 0LL;
    goto LABEL_10;
  }

  if (![v8 count])
  {
    id v14 = nrdSharedLogger();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No local brain asset found", buf, 2u);
    }

    goto LABEL_9;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v8 firstObject]);
  id v12 = nrdSharedLogger();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue([v7 description]);
    *(_DWORD *)buf = 138543362;
    id v18 = v13;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Found local brain asset:%{public}@", buf, 0xCu);
  }

void __37__NRDUpdateDCore_findLocalBrainAsset__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = nrdSharedLogger();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __37__NRDUpdateDCore_findLocalBrainAsset__block_invoke_cold_1();
    }
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Removing all update brain assets succeeded",  v7,  2u);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)cleanReScanScheduler
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore rescanScheduler](self, "rescanScheduler"));

  if (v3)
  {
    id v4 = nrdSharedLogger();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore rescanScheduler](self, "rescanScheduler"));
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore rescanScheduler](self, "rescanScheduler"));
      id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 identifier]);
      int v10 = 138543618;
      v11 = v6;
      __int16 v12 = 2114;
      v13 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Invalidating Activity %{public}@ \"%{public}@\"",  (uint8_t *)&v10,  0x16u);
    }

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore rescanScheduler](self, "rescanScheduler"));
    [v9 invalidate];

    -[NRDUpdateDCore setRescanScheduler:](self, "setRescanScheduler:", 0LL);
  }

- (int64_t)actionLoadPersisted:(id *)a3
{
  id v4 = nrdSharedLogger();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v28) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "In actionLoadPersisted", (uint8_t *)&v28, 2u);
  }

  unsigned int v6 = -[NRDUpdateDCore forceBrainUpdate](self, "forceBrainUpdate");
  -[NRDUpdateDCore setForceBrainUpdate:](self, "setForceBrainUpdate:", 0LL);
  -[NRDUpdateDCore cleanBeforeScan](self, "cleanBeforeScan");
  -[NRDUpdateDCore cleanReScanScheduler](self, "cleanReScanScheduler");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectForKey:@"NRDBrainPath"]);

  if (!v8)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updateOptions](self, "updateOptions"));
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 objectForKeyedSubscript:@"__nrd_brain-location_key"]);

    if (v12)
    {
      id v13 = nrdSharedLogger();
      int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updateOptions](self, "updateOptions"));
        v15 = (void *)objc_claimAutoreleasedReturnValue([v14 objectForKeyedSubscript:@"__nrd_brain-location_key"]);
        int v28 = 138543362;
        v29 = v15;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Brain path specified by options:%{public}@, skipping scan",  (uint8_t *)&v28,  0xCu);
      }

      goto LABEL_9;
    }

    dispatch_semaphore_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore findLocalBrainAsset](self, "findLocalBrainAsset"));
    if (v16)
    {
      -[NRDUpdateDCore setLocalBrainAsset:](self, "setLocalBrainAsset:", v16);
      id v18 = nrdSharedLogger();
      v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
      BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
      if (!v6)
      {
        if (v20)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue([v16 assetId]);
          int v28 = 138543362;
          v29 = v27;
          _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Found brain asset:%{public}@ on disk, skipping scan",  (uint8_t *)&v28,  0xCu);
        }

        dispatch_semaphore_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updatedFSM](self, "updatedFSM"));
        v25 = v24;
        id v26 = @"LocalBrainFound";
        goto LABEL_23;
      }

      if (v20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue([v16 assetId]);
        int v28 = 138543362;
        v29 = v21;
        _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Found brain asset:%{public}@ on disk but forced to scan again",  (uint8_t *)&v28,  0xCu);
      }
    }

    else
    {
      id v22 = nrdSharedLogger();
      dispatch_queue_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v28) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_DEFAULT,  "Could not find brain asset on disk, going to scan",  (uint8_t *)&v28,  2u);
      }
    }

    dispatch_semaphore_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updatedFSM](self, "updatedFSM"));
    v25 = v24;
    id v26 = @"NoLocalBrainFound";
LABEL_23:
    [v24 postEvent:v26];

    goto LABEL_10;
  }

  id v9 = nrdSharedLogger();
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v28 = 138543362;
    v29 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Brain path specified by a default:%{public}@, skipping scan",  (uint8_t *)&v28,  0xCu);
  }

- (void)cleanBeforeScan
{
}

- (int64_t)actionBeginBrainScan:(id *)a3
{
  id v4 = nrdSharedLogger();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "In actionBeginBrainScan", buf, 2u);
  }

  -[NRDUpdateDCore cleanBeforeScan](self, "cleanBeforeScan");
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 UUIDString]);

  id v8 = -[SUCoreScan initWithUUID:](objc_alloc(&OBJC_CLASS___SUCoreScan), "initWithUUID:", v7);
  -[NRDUpdateDCore setScanner:](self, "setScanner:", v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore scanPolicy](self, "scanPolicy"));

  if (!v9)
  {
    int v10 = -[SUCorePolicyUpdateBrain initWithSoftwareUpdateAssetType:documentationAssetType:usingPolicies:usingExtensions:]( objc_alloc(&OBJC_CLASS___SUCorePolicyUpdateBrain),  "initWithSoftwareUpdateAssetType:documentationAssetType:usingPolicies:usingExtensions:",  @"com.apple.MobileAsset.RecoveryOSUpdateBrain",  0LL,  127LL,  0LL);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicyUpdateBrain softwareUpdateScanPolicy](v10, "softwareUpdateScanPolicy"));
    [v11 setAllowSameVersion:1];

    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicyUpdateBrain softwareUpdateScanPolicy](v10, "softwareUpdateScanPolicy"));
    [v12 setRestrictToFull:1];

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicyUpdateBrain softwareUpdateScanPolicy](v10, "softwareUpdateScanPolicy"));
    [v13 setDisableUI:1];

    -[SUCorePolicyUpdateBrain setReleaseType:](v10, "setReleaseType:", 0LL);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
    -[SUCorePolicyUpdateBrain setCompatibilityVersion:](v10, "setCompatibilityVersion:", v14);

    -[NRDUpdateDCore setScanPolicy:](self, "setScanPolicy:", v10);
  }

  id v15 = nrdSharedLogger();
  dispatch_semaphore_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore scanPolicy](self, "scanPolicy"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 description]);
    *(_DWORD *)buf = 138543362;
    v30 = v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "ScanPolicy: %{public}@", buf, 0xCu);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updateAttempt](self, "updateAttempt"));
  BOOL v20 = (char *)[v19 unsignedLongLongValue] + 1;

  if ((unint64_t)v20 < 4)
  {
    scanner = self->_scanner;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore scanPolicy](self, "scanPolicy"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = __39__NRDUpdateDCore_actionBeginBrainScan___block_invoke;
    v27[3] = &unk_1000149E8;
    v27[4] = self;
    id v28 = v7;
    -[SUCoreScan locateAvailableUpdateWithPolicy:completion:]( scanner,  "locateAvailableUpdateWithPolicy:completion:",  v25,  v27);
  }

  else
  {
    id v21 = nrdSharedLogger();
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[NRDUpdateDCore actionBeginBrainScan:].cold.1();
    }

    dispatch_queue_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updatedFSM](self, "updatedFSM"));
    [v23 postEvent:@"ErrorGeneric"];
  }

  return 0LL;
}

void __39__NRDUpdateDCore_actionBeginBrainScan___block_invoke( uint64_t a1,  uint64_t a2,  void *a3,  void *a4,  void *a5)
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = nrdSharedLogger();
  __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __39__NRDUpdateDCore_actionBeginBrainScan___block_invoke_cold_1();
    }

    v25[0] = NSDebugDescriptionErrorKey;
    v25[1] = NSUnderlyingErrorKey;
    v26[0] = @"brain scan failed";
    v26[1] = v10;
    id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v26,  v25,  2LL));
    id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NRDUpdatedDomain",  607LL,  v14));

    dispatch_semaphore_t v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) updatedFSM]);
    [v16 postEvent:@"ErrorGeneric" withInfo:v15];
  }

  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 138543618;
      id v22 = v8;
      __int16 v23 = 2114;
      id v24 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Scan returned with success\n primaryUpdateAsset: %{public}@\n secondaryUpdateAsset: %{public}@\n",  (uint8_t *)&v21,  0x16u);
    }

    if (v8)
    {
      [*(id *)(a1 + 32) setUpdateBrainAsset:v8];
      [*(id *)(a1 + 32) setUuid:*(void *)(a1 + 40)];
      v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) updatedFSM]);
      id v15 = v17;
      id v18 = @"ProceedToNextUpdateStep";
    }

    else
    {
      id v19 = nrdSharedLogger();
      BOOL v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "No brain update found",  (uint8_t *)&v21,  2u);
      }

      v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) updatedFSM]);
      id v15 = v17;
      id v18 = @"NoRemoteBrainFound";
    }

    [v17 postEvent:v18];
  }
}

- (int64_t)actionDownloadBrainUpdate:(id *)a3
{
  id v4 = nrdSharedLogger();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v36 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "In actionDownloadBrainUpdate", v36, 2u);
  }

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updateBrainAsset](self, "updateBrainAsset"));
  if (v6)
  {
    id v7 = objc_alloc(&OBJC_CLASS___SUCoreMobileAsset);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updateBrainAsset](self, "updateBrainAsset"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore uuid](self, "uuid"));
    id v10 = -[SUCoreMobileAsset initWithDelegate:forAsset:updateUUID:]( v7,  "initWithDelegate:forAsset:updateUUID:",  self,  v8,  v9);

    -[NRDUpdateDCore setMaControl:](self, "setMaControl:", v10);
    id v11 = -[SUCorePolicyUpdateBrain initWithSoftwareUpdateAssetType:documentationAssetType:usingPolicies:usingExtensions:]( objc_alloc(&OBJC_CLASS___SUCorePolicyUpdateBrain),  "initWithSoftwareUpdateAssetType:documentationAssetType:usingPolicies:usingExtensions:",  @"com.apple.MobileAsset.RecoveryOSUpdateBrain",  0LL,  127LL,  0LL);
    __int16 v12 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicyUpdateBrain loadBrainPolicy](v11, "loadBrainPolicy"));
    [v12 setDiscretionary:0];

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicyUpdateBrain loadBrainPolicy](v11, "loadBrainPolicy"));
    [v13 setDisableUI:1];

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicyUpdateBrain loadBrainPolicy](v11, "loadBrainPolicy"));
    [v14 setAllowsCellular:0];

    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicyUpdateBrain downloadPreflightPolicy](v11, "downloadPreflightPolicy"));
    [v15 setDiscretionary:0];

    dispatch_semaphore_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicyUpdateBrain downloadPreflightPolicy](v11, "downloadPreflightPolicy"));
    [v16 setDisableUI:1];

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicyUpdateBrain downloadPreflightPolicy](v11, "downloadPreflightPolicy"));
    [v17 setAllowsCellular:0];

    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicyUpdateBrain softwareUpdateDownloadPolicy](v11, "softwareUpdateDownloadPolicy"));
    [v18 setDiscretionary:0];

    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicyUpdateBrain softwareUpdateDownloadPolicy](v11, "softwareUpdateDownloadPolicy"));
    [v19 setDisableUI:1];

    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicyUpdateBrain softwareUpdateDownloadPolicy](v11, "softwareUpdateDownloadPolicy"));
    [v20 setAllowsCellular:0];

    -[SUCorePolicyUpdateBrain setReleaseType:](v11, "setReleaseType:", 0LL);
    int v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
    -[SUCorePolicyUpdateBrain setCompatibilityVersion:](v11, "setCompatibilityVersion:", v21);

    -[NRDUpdateDCore setDownloadPolicy:](self, "setDownloadPolicy:", v11);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore maControl](self, "maControl"));
    __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore downloadPolicy](self, "downloadPolicy"));
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore uuid](self, "uuid"));
    [v22 downloadSoftwareUpdateAssetWithPolicy:v23 withUUID:v24];

    int64_t v25 = 0LL;
  }

  else
  {
    id v26 = nrdSharedLogger();
    v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[NRDUpdateDCore actionDownloadBrainUpdate:].cold.1(v27, v28, v29, v30, v31, v32, v33, v34);
    }

    id v10 = (SUCoreMobileAsset *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updatedFSM](self, "updatedFSM"));
    -[SUCoreMobileAsset postEvent:](v10, "postEvent:", @"ErrorGeneric");
    int64_t v25 = 8700LL;
  }

  return v25;
}

- (void)maDownloadProgress:(id)a3
{
  id v3 = a3;
  id v4 = nrdSharedLogger();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Download progress is : %{public}@",  (uint8_t *)&v6,  0xCu);
  }
}

- (void)maDownloadStalled:(id)a3
{
  id v3 = a3;
  id v4 = nrdSharedLogger();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Download is currently stalled : %{public}@",  (uint8_t *)&v6,  0xCu);
  }
}

- (void)maDownloaded:(id)a3
{
  id v4 = a3;
  id v5 = nrdSharedLogger();
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Update brain asset has downloaded successfully : %@",  (uint8_t *)&v8,  0xCu);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updatedFSM](self, "updatedFSM"));
  [v7 postEvent:@"ProceedToNextUpdateStep"];
}

- (void)maDownloadFailed:(id)a3
{
  id v4 = a3;
  id v5 = nrdSharedLogger();
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[NRDUpdateDCore maDownloadFailed:].cold.1();
  }

  v10[0] = NSDebugDescriptionErrorKey;
  v10[1] = NSUnderlyingErrorKey;
  v11[0] = @"Update brain asset download failed";
  v11[1] = v4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v11,  v10,  2LL));
  int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NRDUpdatedDomain",  608LL,  v7));

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updatedFSM](self, "updatedFSM"));
  [v9 postEvent:kSU_E_DownloadFailed withInfo:v8];
}

- (BOOL)brainLoadRequiresUnlock
{
  return 0;
}

- (int64_t)actionCheckDeviceUnlockConstraint:(id *)a3
{
  id v4 = nrdSharedLogger();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "In actionCheckDeviceUnlockConstraint", buf, 2u);
  }

  unsigned int v6 = -[NRDUpdateDCore brainLoadRequiresUnlock](self, "brainLoadRequiresUnlock");
  id v7 = nrdSharedLogger();
  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v6)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      v17 = "brain load does not require unlock";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v17, buf, 2u);
    }

void __52__NRDUpdateDCore_actionCheckDeviceUnlockConstraint___block_invoke(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) isPasscodeLocked];
  id v3 = nrdSharedLogger();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = @"NO";
    if (v2) {
      id v5 = @"YES";
    }
    int v9 = 138543362;
    unsigned __int8 v10 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Device lock status changed: passcodeLocked = %{public}@",  (uint8_t *)&v9,  0xCu);
  }

  if ((v2 & 1) == 0)
  {
    id v6 = nrdSharedLogger();
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Device unlocked, sending device unlocked event",  (uint8_t *)&v9,  2u);
    }

    notify_cancel((int)[*(id *)(a1 + 32) keyBagStateChangedNotifyToken]);
    int v8 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) updatedFSM]);
    [v8 postEvent:@"DeviceUnlocked"];
  }

- (int64_t)actionWaitForUnlock:(id *)a3
{
  id v4 = nrdSharedLogger();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "In actionWaitForUnlock", v10, 2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore delegate](self, "delegate"));
  NSErrorUserInfoKey v11 = NSDebugDescriptionErrorKey;
  BOOL v12 = @"Device is locked, unable to load brain";
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
  int v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NRDUpdatedDomain",  601LL,  v7));
  [v6 updateCompleted:v8];

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_fsmSemaphore);
  return 0LL;
}

- (int64_t)actionLoadBrain:(id *)a3
{
  id v4 = nrdSharedLogger();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "In actionLoadBrain", buf, 2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKey:@"NRDBrainPath"]);

  if (v7)
  {
    id v8 = nrdSharedLogger();
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v66 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Defaults specified brain path is %{public}@",  buf,  0xCu);
    }

    -[NRDUpdateDCore setUpdateOptions:](self, "setUpdateOptions:", 0LL);
    goto LABEL_11;
  }

  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updateOptions](self, "updateOptions"));
  NSErrorUserInfoKey v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectForKeyedSubscript:@"__nrd_brain-location_key"]);

  if (v11)
  {
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updateOptions](self, "updateOptions"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:@"__nrd_brain-location_key"]);

    id v13 = nrdSharedLogger();
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v66 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Option specified brain path is %{public}@",  buf,  0xCu);
    }

    -[NRDUpdateDCore setUpdateOptions:](self, "setUpdateOptions:", 0LL);
    if (v7) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }

  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updateBrainAsset](self, "updateBrainAsset"));

  if (v26)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updateBrainAsset](self, "updateBrainAsset"));
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 getLocalUrl]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v28 path]);

    id v29 = nrdSharedLogger();
    uint64_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v66 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Downloaded brain path is %{public}@",  buf,  0xCu);
    }

    uint64_t v31 = objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updateBrainAsset](self, "updateBrainAsset"));
  }

  else
  {
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore localBrainAsset](self, "localBrainAsset"));

    if (!v32)
    {
      id v49 = nrdSharedLogger();
      v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
        -[NRDUpdateDCore actionLoadBrain:].cold.1(v50, v51, v52, v53, v54, v55, v56, v57);
      }

      NSErrorUserInfoKey v63 = NSDebugDescriptionErrorKey;
      uint64_t v64 = @"LoadingBrain state was reached without either a downloaded brain or an existing local brain";
      v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v64,  &v63,  1LL));
      uint64_t v48 = 600LL;
      goto LABEL_32;
    }

    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore localBrainAsset](self, "localBrainAsset"));
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v33 getLocalUrl]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v34 path]);

    id v35 = nrdSharedLogger();
    v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v66 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "Existing local brain path is %{public}@",  buf,  0xCu);
    }

    uint64_t v31 = objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore localBrainAsset](self, "localBrainAsset"));
  }

  v37 = (void *)v31;
  -[NRDUpdateDCore setLoadBrainAsset:](self, "setLoadBrainAsset:", v31);

  if (!v7)
  {
LABEL_29:
    id v38 = nrdSharedLogger();
    v39 = (os_log_s *)objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      -[NRDUpdateDCore actionLoadBrain:].cold.2(v39, v40, v41, v42, v43, v44, v45, v46);
    }

    NSErrorUserInfoKey v61 = NSDebugDescriptionErrorKey;
    uint64_t v62 = @"brain path is nil";
    v47 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v62,  &v61,  1LL));
    uint64_t v48 = 603LL;
LABEL_32:
    v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NRDUpdatedDomain",  v48,  v47));

    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updatedFSM](self, "updatedFSM"));
    [v7 postEvent:@"ErrorGeneric" withInfo:v17];
    goto LABEL_19;
  }

- (int64_t)actionRunBrain:(id *)a3
{
  id v4 = nrdSharedLogger();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "In actionRunBrain", buf, 2u);
  }

  *(void *)buf = 0LL;
  id v19 = buf;
  uint64_t v20 = 0x2020000000LL;
  uint64_t v21 = 3LL;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = __33__NRDUpdateDCore_actionRunBrain___block_invoke;
  block[3] = &unk_100014A38;
  block[4] = buf;
  if (actionRunBrain__onceToken != -1) {
    dispatch_once(&actionRunBrain__onceToken, block);
  }
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updateOptions](self, "updateOptions"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 objectForKeyedSubscript:@"__nrd_brain-location_key"]);

  if (v7 && +[NRDUpdateBrainLoader isBrainLoaded](&OBJC_CLASS___NRDUpdateBrainLoader, "isBrainLoaded"))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore delegate](self, "delegate"));
    [v8 requestExit:0 reason:@"A new NRD brain will be loaded from an option-specified local path."];

    v22[0] = NSDebugDescriptionErrorKey;
    v22[1] = @"com.apple.NRD-Resend";
    v23[0] = @"new local brain load needed";
    v23[1] = &__kCFBooleanTrue;
    int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v23,  v22,  2LL));
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NRDUpdatedDomain",  610LL,  v9));

    NSErrorUserInfoKey v11 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore delegate](self, "delegate"));
    [v11 updateCompleted:v10];

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_fsmSemaphore);
  }

  else
  {
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore brain](self, "brain"));
    uint64_t v13 = *((void *)v19 + 3);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updateOptions](self, "updateOptions"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = __33__NRDUpdateDCore_actionRunBrain___block_invoke_2;
    v16[3] = &unk_1000149C0;
    v16[4] = self;
    [v12 run:v13 options:v14 callback:v16];
  }

  _Block_object_dispose(buf, 8);
  return 0LL;
}

uint64_t __33__NRDUpdateDCore_actionRunBrain___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8LL) + 24LL) = 0LL;
  return result;
}

void __33__NRDUpdateDCore_actionRunBrain___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!v3) {
    goto LABEL_4;
  }
  id v5 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  if ([v5 isEqualToString:@"NRDUpdateErrorDomain"])
  {
    id v6 = [v4 code];

    if (v6 == (id)111)
    {
LABEL_4:
      id v7 = nrdSharedLogger();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)dispatch_semaphore_t v16 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "brain run completed successfully", v16, 2u);
      }

      int v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) brain]);
      [*(id *)(a1 + 32) setRunningBrain:v9];

      unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
      [v10 updateCompleted:0];

      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 8LL));
      goto LABEL_11;
    }
  }

  else
  {
  }

  id v11 = nrdSharedLogger();
  BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    __33__NRDUpdateDCore_actionRunBrain___block_invoke_2_cold_1();
  }

  v17[0] = NSDebugDescriptionErrorKey;
  v17[1] = NSUnderlyingErrorKey;
  v18[0] = @"run brain failed";
  v18[1] = v4;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v18,  v17,  2LL));
  id v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NRDUpdatedDomain",  609LL,  v13));

  id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  [v15 updateCompleted:v14];

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 8LL));
LABEL_11:
}

- (int64_t)actionScheduleRetry:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = nrdSharedLogger();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "In actionScheduleRetry", buf, 2u);
  }

  id v8 = nrdSharedLogger();
  int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Removing all update brain assets", buf, 2u);
  }

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = __44__NRDUpdateDCore_actionScheduleRetry_error___block_invoke;
  v12[3] = &unk_100014A60;
  v12[4] = self;
  id v13 = v5;
  id v10 = v5;
  +[SUCorePurge removeAllAssetsOfType:completion:]( &OBJC_CLASS___SUCorePurge,  "removeAllAssetsOfType:completion:",  @"com.apple.MobileAsset.RecoveryOSUpdateBrain",  v12);

  return 0LL;
}

void __44__NRDUpdateDCore_actionScheduleRetry_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = nrdSharedLogger();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __37__NRDUpdateDCore_findLocalBrainAsset__block_invoke_cold_1();
    }
  }

  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Removing all update brain assets succeeded",  v8,  2u);
  }

  [*(id *)(a1 + 32) scheduleNRDUpdateBrainReScan:0];
  id v7 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) delegate]);
  [v7 updateCompleted:*(void *)(a1 + 40)];

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 8LL));
}

- (int64_t)actionPeriodicScan:(id *)a3
{
  id v4 = nrdSharedLogger();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "In actionPeriodicScan", buf, 2u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore runningBrain](self, "runningBrain"));
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore runningBrain](self, "runningBrain"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    void v11[2] = __37__NRDUpdateDCore_actionPeriodicScan___block_invoke;
    v11[3] = &unk_1000149C0;
    v11[4] = self;
    [v7 run:4 callback:v11];
  }

  else
  {
    id v8 = nrdSharedLogger();
    int v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "actionPeriodicScan no running brain", buf, 2u);
    }

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_fsmSemaphore);
  }

  return 0LL;
}

void __37__NRDUpdateDCore_actionPeriodicScan___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = nrdSharedLogger();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __37__NRDUpdateDCore_actionPeriodicScan___block_invoke_cold_1();
    }

    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 8LL));
  }

  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "brain run idle completed successfully",  buf,  2u);
    }

    id v7 = objc_alloc(&OBJC_CLASS___SUCoreScan);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    int v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);
    id v10 = -[SUCoreScan initWithUUID:](v7, "initWithUUID:", v9);

    id v11 = -[SUCorePolicyUpdateBrain initWithSoftwareUpdateAssetType:documentationAssetType:usingPolicies:usingExtensions:]( objc_alloc(&OBJC_CLASS___SUCorePolicyUpdateBrain),  "initWithSoftwareUpdateAssetType:documentationAssetType:usingPolicies:usingExtensions:",  @"com.apple.MobileAsset.RecoveryOSUpdateBrain",  0LL,  127LL,  0LL);
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicyUpdateBrain softwareUpdateScanPolicy](v11, "softwareUpdateScanPolicy"));
    [v12 setAllowSameVersion:1];

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicyUpdateBrain softwareUpdateScanPolicy](v11, "softwareUpdateScanPolicy"));
    [v13 setRestrictToFull:1];

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicyUpdateBrain softwareUpdateScanPolicy](v11, "softwareUpdateScanPolicy"));
    [v14 setDisableUI:1];

    -[SUCorePolicyUpdateBrain setReleaseType:](v11, "setReleaseType:", 0LL);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](&OBJC_CLASS___NSNumber, "numberWithInt:", 1LL));
    -[SUCorePolicyUpdateBrain setCompatibilityVersion:](v11, "setCompatibilityVersion:", v15);

    id v16 = nrdSharedLogger();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[SUCorePolicyUpdateBrain description](v11, "description"));
      *(_DWORD *)buf = 138543362;
      int64_t v25 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Periodic ScanPolicy: %{public}@", buf, 0xCu);
    }

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472LL;
    v21[2] = __37__NRDUpdateDCore_actionPeriodicScan___block_invoke_283;
    v21[3] = &unk_1000149E8;
    uint64_t v19 = *(void *)(a1 + 32);
    id v22 = v10;
    uint64_t v23 = v19;
    uint64_t v20 = v10;
    -[SUCoreScan locateAvailableUpdateWithPolicy:completion:]( v20,  "locateAvailableUpdateWithPolicy:completion:",  v11,  v21);
  }
}

void __37__NRDUpdateDCore_actionPeriodicScan___block_invoke_283( uint64_t a1,  uint64_t a2,  void *a3,  void *a4,  void *a5)
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = nrdSharedLogger();
  BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
  id v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __37__NRDUpdateDCore_actionPeriodicScan___block_invoke_283_cold_1();
    }
    goto LABEL_26;
  }

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v31 = 138543618;
    uint64_t v32 = v8;
    __int16 v33 = 2114;
    id v34 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Periodic Scan returned with success\n primaryUpdateAsset: %{public}@\n secondaryUpdateAsset: %{public}@\n",  (uint8_t *)&v31,  0x16u);
  }

  if (v8)
  {
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s assetProperty:](v8, "assetProperty:", @"Build"));
    if (!v13) {
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[os_log_s assetProperty:](v8, "assetProperty:", @"_MasteredVersion"));
    }
    id v14 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) loadBrainAsset]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 assetProperty:@"Build"]);

    if (!v15)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) loadBrainAsset]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v16 assetProperty:@"_MasteredVersion"]);
    }

    id v17 = nrdSharedLogger();
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 138543618;
      uint64_t v32 = v13;
      __int16 v33 = 2114;
      id v34 = v15;
      _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEFAULT,  "Periodic Scan found brain version:%{public}@, existing version:%{public}@",  (uint8_t *)&v31,  0x16u);
    }

    unsigned int v19 = [v15 isEqual:v13];
    id v20 = nrdSharedLogger();
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v19)
    {
      if (v22)
      {
        LOWORD(v31) = 0;
        uint64_t v23 = "Periodic Scan returned with the existing brain asset";
        id v24 = v21;
        uint32_t v25 = 2;
LABEL_23:
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v31, v25);
      }
    }

    else
    {
      if (v22)
      {
        LOWORD(v31) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Periodic Scan returned with new brain asset, purging old asset",  (uint8_t *)&v31,  2u);
      }

      v27 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) loadBrainAsset]);
      uint64_t v28 = (os_log_s *)[v27 purgeSync];

      id v29 = nrdSharedLogger();
      uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      BOOL v30 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
      if (!v28)
      {
        if (v30)
        {
          LOWORD(v31) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "Purged old brain asset, send new brain notification",  (uint8_t *)&v31,  2u);
        }

        [*(id *)(a1 + 40) newBrain:v13];
        goto LABEL_25;
      }

      if (v30)
      {
        int v31 = 134217984;
        uint64_t v32 = v28;
        uint64_t v23 = "Purging old brain asset failed with result:%ld";
        id v24 = v21;
        uint32_t v25 = 12;
        goto LABEL_23;
      }
    }

LABEL_25:
    goto LABEL_26;
  }

  id v26 = nrdSharedLogger();
  id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v31) = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No brain update found", (uint8_t *)&v31, 2u);
  }

- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = nrdSharedLogger();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[NRDUpdateDCore actionUnknownAction:error:].cold.1();
  }

  return 8113LL;
}

- (int64_t)getSchedulerQOS
{
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 stringForKey:@"SchedulerQOS"]);

  if (!v3) {
    goto LABEL_13;
  }
  id v4 = nrdSharedLogger();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    id v11 = @"SchedulerQOS";
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Found %{public}@=%{public}@ in preferences",  (uint8_t *)&v10,  0x16u);
  }

  if ([v3 caseInsensitiveCompare:@"Background"])
  {
    if ([v3 caseInsensitiveCompare:@"Utility"])
    {
      if ([v3 caseInsensitiveCompare:@"UserInitiated"])
      {
        if ([v3 caseInsensitiveCompare:@"UserInteractive"])
        {
          if ([v3 caseInsensitiveCompare:@"Default"])
          {
            id v6 = nrdSharedLogger();
            id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
            if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
              -[NRDUpdateDCore getSchedulerQOS].cold.1();
            }
          }

          int64_t v8 = -1LL;
        }

        else
        {
          int64_t v8 = 33LL;
        }
      }

      else
      {
        int64_t v8 = 25LL;
      }
    }

    else
    {
      int64_t v8 = 17LL;
    }
  }

  else
  {
LABEL_13:
    int64_t v8 = 9LL;
  }

  return v8;
}

- (double)_minimumInterval:(double)a3
{
  double v3 = a3;
  if (a3 < 60.0)
  {
    id v4 = nrdSharedLogger();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 134218240;
      double v8 = v3;
      __int16 v9 = 2048;
      uint64_t v10 = 0x404E000000000000LL;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "interval of %.1f seconds is too low. clamping to %.1f seconds.",  (uint8_t *)&v7,  0x16u);
    }

    return 60.0;
  }

  return v3;
}

- (void)scheduleNRDUpdateBrainReScan:(BOOL)a3
{
  BOOL v3 = a3;
  -[NRDUpdateDCore cleanReScanScheduler](self, "cleanReScanScheduler");
  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 objectForKey:@"NRDBrainReScanInterval"]);

  if (v6)
  {
    id v7 = nrdSharedLogger();
    double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v28 = @"NRDBrainReScanInterval";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Found %{public}@ in defaults", buf, 0xCu);
    }

    [v6 doubleValue];
    -[NRDUpdateDCore _minimumInterval:](self, "_minimumInterval:");
    double v10 = v9;
  }

  else
  {
    double v10 = (double)XPC_ACTIVITY_INTERVAL_4_HOURS;
  }

  id v11 = -[NSBackgroundActivityScheduler initWithIdentifier:]( objc_alloc(&OBJC_CLASS___NSBackgroundActivityScheduler),  "initWithIdentifier:",  @"com.apple.mobile.NRDUpdated-RecoveryOSUpdateBrain_download");
  __int16 v12 = v11;
  if (v11)
  {
    -[NSBackgroundActivityScheduler setInterval:](v11, "setInterval:", v10);
    -[NSBackgroundActivityScheduler setQualityOfService:]( v12,  "setQualityOfService:",  -[NRDUpdateDCore getSchedulerQOS](self, "getSchedulerQOS"));
    xpc_object_t v13 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_BOOL(v13, XPC_ACTIVITY_ALLOW_BATTERY, 0);
    xpc_dictionary_set_BOOL(v13, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 1);
    -[NSBackgroundActivityScheduler _setAdditionalXPCActivityProperties:]( v12,  "_setAdditionalXPCActivityProperties:",  v13);
    -[NRDUpdateDCore setRescanScheduler:](self, "setRescanScheduler:", v12);
    id v14 = nrdSharedLogger();
    id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v16)
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Checking in retry activity for brain scan",  buf,  2u);
      }

      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472LL;
      v24[2] = __47__NRDUpdateDCore_scheduleNRDUpdateBrainReScan___block_invoke;
      v24[3] = &unk_100014840;
      id v25 = (id)objc_claimAutoreleasedReturnValue(-[NSBackgroundActivityScheduler description](v12, "description"));
      id v26 = (id)objc_claimAutoreleasedReturnValue(-[NSBackgroundActivityScheduler identifier](v12, "identifier"));
      id v17 = v26;
      id v15 = (os_log_s *)v25;
      -[NSBackgroundActivityScheduler setCheckInHandler:](v12, "setCheckInHandler:", v24);
      -[NSBackgroundActivityScheduler setPreregistered:](v12, "setPreregistered:", 1LL);
    }

    else if (v16)
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v28 = *(const __CFString **)&v10;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Scheduling a retry for brain update in %lf seconds",  buf,  0xCu);
    }

    unsigned int v18 = +[NRDUpdateBrainLoader isBrainLoaded](&OBJC_CLASS___NRDUpdateBrainLoader, "isBrainLoaded");
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = __47__NRDUpdateDCore_scheduleNRDUpdateBrainReScan___block_invoke_305;
    v20[3] = &unk_100014A88;
    char v23 = v18;
    uint64_t v21 = v12;
    BOOL v22 = self;
    -[NSBackgroundActivityScheduler scheduleWithBlock:](v21, "scheduleWithBlock:", v20);
    if (v18)
    {
      unsigned int v19 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore delegate](self, "delegate"));
      [v19 requestExit:0 reason:@"NRD brain service has already been bootstrapped into the xpc namespace of this process."];
    }
  }

  else
  {
    xpc_object_t v13 = (xpc_object_t)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore delegate](self, "delegate"));
    [v13 requestExit:1 reason:@"Failed to schedule a retry for NRD brain update"];
  }
}

void __47__NRDUpdateDCore_scheduleNRDUpdateBrainReScan___block_invoke(uint64_t a1)
{
  id v2 = nrdSharedLogger();
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    int v10 = 138543618;
    uint64_t v11 = v4;
    __int16 v12 = 2114;
    uint64_t v13 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Activity %{public}@ %{public}@ check-in.",  (uint8_t *)&v10,  0x16u);
  }

  id v6 = nrdSharedLogger();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    int v10 = 138543618;
    uint64_t v11 = v8;
    __int16 v12 = 2114;
    uint64_t v13 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Activity %{public}@ %{public}@ check-in complete.",  (uint8_t *)&v10,  0x16u);
  }
}

void __47__NRDUpdateDCore_scheduleNRDUpdateBrainReScan___block_invoke_305(uint64_t a1, void *a2)
{
  BOOL v3 = a2;
  id v4 = nrdSharedLogger();
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
    int v13 = 138543362;
    id v14 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Activity %{public}@ fired",  (uint8_t *)&v13,  0xCu);
  }

  if ([*(id *)(a1 + 32) shouldDefer])
  {
    id v7 = nrdSharedLogger();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
      int v13 = 138543362;
      id v14 = v9;
      int v10 = "Activity %{public}@ is deferred";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v13, 0xCu);
    }
  }

  else
  {
    if (!*(_BYTE *)(a1 + 48))
    {
      [*(id *)(a1 + 40) performUpdate:&off_1000159D0];
      uint64_t v12 = 1LL;
      goto LABEL_11;
    }

    id v11 = nrdSharedLogger();
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
      int v13 = 138543362;
      id v14 = v9;
      int v10 = "Activity %{public}@ will be deferred because daemon needs to exit.";
      goto LABEL_9;
    }
  }

  uint64_t v12 = 2LL;
LABEL_11:
  v3[2](v3, v12);
}

- (void)scheduleNRDUpdateBrainPeriodicScan
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](&OBJC_CLASS___NSUserDefaults, "standardUserDefaults"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 objectForKey:@"NRDBrainPeriodicScanInterval"]);

  if (v4)
  {
    id v5 = nrdSharedLogger();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v25 = @"NRDBrainPeriodicScanInterval";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Found %{public}@ in defaults", buf, 0xCu);
    }

    [v4 doubleValue];
    -[NRDUpdateDCore _minimumInterval:](self, "_minimumInterval:");
    double v8 = v7;
  }

  else
  {
    double v8 = (double)XPC_ACTIVITY_INTERVAL_7_DAYS;
  }

  uint64_t v9 = -[NSBackgroundActivityScheduler initWithIdentifier:]( objc_alloc(&OBJC_CLASS___NSBackgroundActivityScheduler),  "initWithIdentifier:",  @"com.apple.mobile.NRDUpdated-RecoveryOSUpdateBrain_autoscan");
  int v10 = v9;
  if (v9)
  {
    -[NSBackgroundActivityScheduler setInterval:](v9, "setInterval:", v8);
    -[NSBackgroundActivityScheduler setDelay:](v10, "setDelay:", v8 * 0.5);
    -[NSBackgroundActivityScheduler setQualityOfService:]( v10,  "setQualityOfService:",  -[NRDUpdateDCore getSchedulerQOS](self, "getSchedulerQOS"));
    xpc_object_t v11 = xpc_dictionary_create(0LL, 0LL, 0LL);
    xpc_dictionary_set_BOOL(v11, XPC_ACTIVITY_ALLOW_BATTERY, 0);
    xpc_dictionary_set_BOOL(v11, XPC_ACTIVITY_REQUIRE_INEXPENSIVE_NETWORK_CONNECTIVITY, 1);
    -[NSBackgroundActivityScheduler _setAdditionalXPCActivityProperties:]( v10,  "_setAdditionalXPCActivityProperties:",  v11);
    -[NRDUpdateDCore setPeriodicScheduler:](self, "setPeriodicScheduler:", v10);
    id v12 = nrdSharedLogger();
    int v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Checking in periodic activity for brain scan",  buf,  2u);
    }

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472LL;
    v19[2] = __52__NRDUpdateDCore_scheduleNRDUpdateBrainPeriodicScan__block_invoke;
    v19[3] = &unk_100014AB0;
    id v20 = (id)objc_claimAutoreleasedReturnValue(-[NSBackgroundActivityScheduler description](v10, "description"));
    id v21 = (id)objc_claimAutoreleasedReturnValue(-[NSBackgroundActivityScheduler identifier](v10, "identifier"));
    BOOL v22 = self;
    double v23 = v8;
    id v14 = v21;
    id v15 = v20;
    -[NSBackgroundActivityScheduler setCheckInHandler:](v10, "setCheckInHandler:", v19);
    -[NSBackgroundActivityScheduler setPreregistered:](v10, "setPreregistered:", 1LL);
    -[NSBackgroundActivityScheduler setRepeats:](v10, "setRepeats:", 1LL);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472LL;
    v16[2] = __52__NRDUpdateDCore_scheduleNRDUpdateBrainPeriodicScan__block_invoke_318;
    v16[3] = &unk_100014740;
    id v17 = v10;
    unsigned int v18 = self;
    -[NSBackgroundActivityScheduler scheduleWithBlock:](v17, "scheduleWithBlock:", v16);
  }

  else
  {
    xpc_object_t v11 = (xpc_object_t)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore delegate](self, "delegate"));
    [v11 requestExit:1 reason:@"Failed to schedule periodic scan for NRD brain update"];
  }
}

void __52__NRDUpdateDCore_scheduleNRDUpdateBrainPeriodicScan__block_invoke(uint64_t a1)
{
  id v2 = nrdSharedLogger();
  BOOL v3 = (os_log_s *)objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = *(void **)(a1 + 40);
    int v28 = 138543618;
    id v29 = v4;
    __int16 v30 = 2114;
    int v31 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "Activity %{public}@ %{public}@ check-in.",  (uint8_t *)&v28,  0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) periodicScheduler]);
  [v6 interval];
  double v8 = v7;

  id v9 = nrdSharedLogger();
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    xpc_object_t v11 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) periodicScheduler]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) periodicScheduler]);
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 identifier]);
    int v28 = 138543874;
    id v29 = v11;
    __int16 v30 = 2114;
    int v31 = v13;
    __int16 v32 = 2048;
    double v33 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Activity %{public}@ %{public}@ was preregistered with interval: %lf",  (uint8_t *)&v28,  0x20u);
  }

  double v14 = *(double *)(a1 + 56);
  if (v14 != v8)
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) periodicScheduler]);
    [v15 setInterval:v14];

    double v16 = *(double *)(a1 + 56) * 0.5;
    id v17 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) periodicScheduler]);
    [v17 setDelay:v16];

    id v18 = nrdSharedLogger();
    unsigned int v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) periodicScheduler]);
      id v21 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 48) periodicScheduler]);
      BOOL v22 = (void *)objc_claimAutoreleasedReturnValue([v21 identifier]);
      double v23 = *(double *)(a1 + 56);
      int v28 = 138543874;
      id v29 = v20;
      __int16 v30 = 2114;
      int v31 = v22;
      __int16 v32 = 2048;
      double v33 = v23;
      _os_log_impl( (void *)&_mh_execute_header,  v19,  OS_LOG_TYPE_DEFAULT,  "Activity %{public}@ %{public}@ new interval: %lf",  (uint8_t *)&v28,  0x20u);
    }
  }

  id v24 = nrdSharedLogger();
  id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    id v26 = *(void **)(a1 + 32);
    v27 = *(void **)(a1 + 40);
    int v28 = 138543618;
    id v29 = v26;
    __int16 v30 = 2114;
    int v31 = v27;
    _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_DEFAULT,  "Activity %{public}@ %{public}@ check-in complete.",  (uint8_t *)&v28,  0x16u);
  }
}

void __52__NRDUpdateDCore_scheduleNRDUpdateBrainPeriodicScan__block_invoke_318(uint64_t a1, void *a2)
{
  BOOL v3 = a2;
  id v4 = nrdSharedLogger();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
    int v11 = 138543362;
    id v12 = v6;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Activity %{public}@ fired",  (uint8_t *)&v11,  0xCu);
  }

  if ([*(id *)(a1 + 32) shouldDefer])
  {
    id v7 = nrdSharedLogger();
    double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) identifier]);
      int v11 = 138543362;
      id v12 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Activity %{public}@ is deferred",  (uint8_t *)&v11,  0xCu);
    }

    uint64_t v10 = 2LL;
  }

  else
  {
    [*(id *)(a1 + 40) performUpdate:&off_1000159F8];
    uint64_t v10 = 1LL;
  }

  v3[2](v3, v10);
}

- (BOOL)isPasscodeLocked
{
  v5[0] = kMKBUserSessionIDKey;
  v5[1] = @"ExtendedDeviceLockState";
  v6[0] = &off_100015960;
  v6[1] = &__kCFBooleanTrue;
  unsigned int v2 = MKBGetDeviceLockState( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v6,  v5,  2LL));
  return (v2 < 7) & (0x46u >> v2);
}

- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = nrdSharedLogger();
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138544130;
    id v25 = v14;
    __int16 v26 = 2114;
    id v27 = v15;
    __int16 v28 = 2114;
    id v29 = v16;
    __int16 v30 = 2114;
    id v31 = v18;
    _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "PerformAction: Action:%{public}@ Event:%{public}@ inState:%{public}@ nextState:%{public}@",  (uint8_t *)&v24,  0x2Au);
  }

  if ([v14 isEqualToString:kSUCoreFSMActionNoOp])
  {
    int64_t v21 = 0LL;
  }

  else
  {
    if ([v14 isEqualToString:kSU_A_LoadPersisted])
    {
      int64_t v22 = -[NRDUpdateDCore actionLoadPersisted:](self, "actionLoadPersisted:", a8);
    }

    else if ([v14 isEqualToString:@"ActionBeginBrainScan"])
    {
      int64_t v22 = -[NRDUpdateDCore actionBeginBrainScan:](self, "actionBeginBrainScan:", a8);
    }

    else if ([v14 isEqualToString:@"ActionDownloadBrain"])
    {
      int64_t v22 = -[NRDUpdateDCore actionDownloadBrainUpdate:](self, "actionDownloadBrainUpdate:", a8);
    }

    else if ([v14 isEqualToString:@"ActionCheckDeviceUnlockConstraint"])
    {
      int64_t v22 = -[NRDUpdateDCore actionCheckDeviceUnlockConstraint:](self, "actionCheckDeviceUnlockConstraint:", a8);
    }

    else if ([v14 isEqualToString:@"ActionWaitForUnlock"])
    {
      int64_t v22 = -[NRDUpdateDCore actionWaitForUnlock:](self, "actionWaitForUnlock:", a8);
    }

    else if ([v14 isEqualToString:@"ActionLoadBrain"])
    {
      int64_t v22 = -[NRDUpdateDCore actionLoadBrain:](self, "actionLoadBrain:", a8);
    }

    else if ([v14 isEqualToString:@"ActionRunBrain"])
    {
      int64_t v22 = -[NRDUpdateDCore actionRunBrain:](self, "actionRunBrain:", a8);
    }

    else if ([v14 isEqualToString:@"ActionScheduleRetry"])
    {
      int64_t v22 = -[NRDUpdateDCore actionScheduleRetry:error:](self, "actionScheduleRetry:error:", v17, a8);
    }

    else if ([v14 isEqualToString:@"ActionPeriodicScan"])
    {
      int64_t v22 = -[NRDUpdateDCore actionPeriodicScan:](self, "actionPeriodicScan:", a8);
    }

    else
    {
      int64_t v22 = -[NRDUpdateDCore actionUnknownAction:error:](self, "actionUnknownAction:error:", v14, a8);
    }

    int64_t v21 = v22;
  }

  return v21;
}

- (void)performUpdate:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore updateQueue](self, "updateQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = __32__NRDUpdateDCore_performUpdate___block_invoke;
  v7[3] = &unk_100014840;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __32__NRDUpdateDCore_performUpdate___block_invoke(uint64_t a1)
{
  unsigned int v2 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKey:@"TriggeredByDeviceUnlock"]);
  unsigned int v3 = [v2 BOOLValue];

  if (v3)
  {
    id v4 = nrdSharedLogger();
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "Continuing update on device unlock event",  buf,  2u);
    }

    id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) updatedFSM]);
    id v7 = v6;
    id v8 = @"DeviceUnlocked";
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 32) objectForKey:@"TriggeredByPeriodicActivity"]);
    unsigned int v10 = [v9 BOOLValue];

    if (v10)
    {
      id v11 = nrdSharedLogger();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "perform periodic scan", v14, 2u);
      }

      [*(id *)(a1 + 40) setForceBrainUpdate:1];
      id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) updatedFSM]);
      id v7 = v6;
      id v8 = @"PeriodicScanRequested";
    }

    else
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(a1 + 40) updatedFSM]);
      id v7 = v6;
      id v8 = @"ProceedToNextUpdateStep";
    }
  }

  [v6 postEvent:v8];

  return dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 40) + 8LL), 0xFFFFFFFFFFFFFFFFLL);
}

- (void)newSchedulerWithIdentifier:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, NRDBackgroundActivitySchedulerServerImpl *))a4;
  id v7 = -[NRDBackgroundActivitySchedulerServerImpl initWithIdentifier:]( objc_alloc(&OBJC_CLASS___NRDBackgroundActivitySchedulerServerImpl),  "initWithIdentifier:",  v5);
  id v8 = nrdSharedLogger();
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543618;
    id v11 = v7;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Activity %{public}@ %{public}@ created.",  (uint8_t *)&v10,  0x16u);
  }

  v6[2](v6, v7);
}

- (void)newBrain:(id)a3
{
  id v4 = (__CFString *)a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NRDUpdateErrorDomain",  112LL,  0LL));
  id v6 = nrdSharedLogger();
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"(unversioned)";
    if (v4) {
      id v8 = v4;
    }
    int v10 = 138543362;
    id v11 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Got newBrain notification, brainVersion:%{public}@",  (uint8_t *)&v10,  0xCu);
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore delegate](self, "delegate"));
  [v9 requestExit:0 reason:@"NRD brain has downloaded a new brain (via delegate)" relaunchError:v5];
}

- (void)connectionInterrupted
{
  id v3 = nrdSharedLogger();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Got connectionInterrupted notification", v6, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore delegate](self, "delegate"));
  [v5 requestExit:1 reason:@"NRD brain connection has been unexpectedly interrupted"];
}

- (void)connectionInvalidated
{
  id v3 = nrdSharedLogger();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Got connectionInvalidated notification", v6, 2u);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[NRDUpdateDCore delegate](self, "delegate"));
  [v5 requestExit:1 reason:@"NRD brain connection has been unexpectedly invalidated"];
}

- (NSDictionary)stateTable
{
  return self->_stateTable;
}

- (void)setStateTable:(id)a3
{
}

- (SUCoreFSM)updatedFSM
{
  return self->_updatedFSM;
}

- (void)setUpdatedFSM:(id)a3
{
}

- (MAAsset)updateBrainAsset
{
  return self->_updateBrainAsset;
}

- (void)setUpdateBrainAsset:(id)a3
{
}

- (MAAsset)localBrainAsset
{
  return self->_localBrainAsset;
}

- (void)setLocalBrainAsset:(id)a3
{
}

- (MAAsset)loadBrainAsset
{
  return self->_loadBrainAsset;
}

- (void)setLoadBrainAsset:(id)a3
{
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (SUCoreScan)scanner
{
  return self->_scanner;
}

- (void)setScanner:(id)a3
{
}

- (SUCorePolicyUpdateBrain)scanPolicy
{
  return self->_scanPolicy;
}

- (void)setScanPolicy:(id)a3
{
}

- (SUCoreMobileAsset)maControl
{
  return self->_maControl;
}

- (void)setMaControl:(id)a3
{
}

- (SUCorePolicyUpdateBrain)downloadPolicy
{
  return self->_downloadPolicy;
}

- (void)setDownloadPolicy:(id)a3
{
}

- (NRDUpdateDCoreDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (NSNumber)updateAttempt
{
  return self->_updateAttempt;
}

- (void)setUpdateAttempt:(id)a3
{
}

- (id)brain
{
  return self->_brain;
}

- (void)setBrain:(id)a3
{
}

- (id)runningBrain
{
  return self->_runningBrain;
}

- (void)setRunningBrain:(id)a3
{
}

- (OS_dispatch_queue)keyBagQueue
{
  return self->_keyBagQueue;
}

- (void)setKeyBagQueue:(id)a3
{
}

- (int)keyBagStateChangedNotifyToken
{
  return self->_keyBagStateChangedNotifyToken;
}

- (void)setKeyBagStateChangedNotifyToken:(int)a3
{
  self->_keyBagStateChangedNotifyToken = a3;
}

- (NSBackgroundActivityScheduler)rescanScheduler
{
  return self->_rescanScheduler;
}

- (void)setRescanScheduler:(id)a3
{
}

- (NSBackgroundActivityScheduler)periodicScheduler
{
  return self->_periodicScheduler;
}

- (void)setPeriodicScheduler:(id)a3
{
}

- (OS_dispatch_queue)updateQueue
{
  return self->_updateQueue;
}

- (void)setUpdateQueue:(id)a3
{
}

- (BOOL)forceBrainUpdate
{
  return self->_forceBrainUpdate;
}

- (void)setForceBrainUpdate:(BOOL)a3
{
  self->_forceBrainUpdate = a3;
}

- (NSDictionary)updateOptions
{
  return self->_updateOptions;
}

- (void)setUpdateOptions:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

- (void)findLocalBrainAsset
{
}

void __37__NRDUpdateDCore_findLocalBrainAsset__block_invoke_cold_1()
{
}

- (void)actionBeginBrainScan:.cold.1()
{
}

void __39__NRDUpdateDCore_actionBeginBrainScan___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1((void *)&_mh_execute_header, v0, v1, "Scan returned with error: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)actionDownloadBrainUpdate:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)maDownloadFailed:.cold.1()
{
}

- (void)actionLoadBrain:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)actionLoadBrain:(uint64_t)a3 .cold.2( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __33__NRDUpdateDCore_actionRunBrain___block_invoke_2_cold_1()
{
}

void __37__NRDUpdateDCore_actionPeriodicScan___block_invoke_cold_1()
{
}

void __37__NRDUpdateDCore_actionPeriodicScan___block_invoke_283_cold_1()
{
  OUTLINED_FUNCTION_1( (void *)&_mh_execute_header,  v0,  v1,  "Periodic scan returned with error: %{public}@",  v2,  v3,  v4,  v5,  v6);
  OUTLINED_FUNCTION_3();
}

- (void)actionUnknownAction:error:.cold.1()
{
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl( (void *)&_mh_execute_header,  v1,  OS_LOG_TYPE_ERROR,  "In unknown state!..action: %{public}@ error:%{public}@",  v2,  0x16u);
  OUTLINED_FUNCTION_3();
}

- (void)getSchedulerQOS
{
}

@end