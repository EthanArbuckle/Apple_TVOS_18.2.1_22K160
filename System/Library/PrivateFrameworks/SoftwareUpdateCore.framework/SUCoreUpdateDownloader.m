@interface SUCoreUpdateDownloader
+ (id)_generateStateTable;
- (BOOL)_isPreSUStagingEnabled;
- (BOOL)_shouldStageOptionalPSUSAssets;
- (BOOL)shouldDownloadSplat;
- (BOOL)shouldReportDownloadFailureIfCanceled;
- (NSDictionary)stateTable;
- (NSString)description;
- (NSString)updateUUID;
- (OS_dispatch_queue)delegateCallBackQueue;
- (SUCoreDescriptor)updateDescriptor;
- (SUCoreFSM)downloadFSM;
- (SUCoreMobileAsset)maControl;
- (SUCoreMobileAsset)maControlSplombo;
- (SUCorePolicy)policy;
- (SUCoreProgress)unifiedProgress;
- (SUCoreUpdateDownloader)initWithDelegate:(id)a3 forUpdate:(id)a4 updateUUID:(id)a5;
- (SUCoreUpdateDownloaderDelegate)delegate;
- (id)_createEvent:(id)a3;
- (id)_versionedModuleName;
- (int)numPendingOperations;
- (int64_t)actionCheckRemoveCompleted:(id)a3 error:(id *)a4;
- (int64_t)actionDownloadPSUSAssets:(id)a3 error:(id *)a4;
- (int64_t)actionDownloadSU:(id)a3 error:(id *)a4;
- (int64_t)actionDownloadSplat:(id)a3 error:(id *)a4;
- (int64_t)actionRemoveUpdate:(id)a3 error:(id *)a4;
- (int64_t)actionReportDownloadProgress:(id)a3 error:(id *)a4;
- (int64_t)actionReportDownloadStalled:(id)a3 error:(id *)a4;
- (int64_t)actionReportUpdateDownloaded:(id)a3 error:(id *)a4;
- (int64_t)actionReportUpdateFailedToDownload:(id)a3 error:(id *)a4;
- (int64_t)actionReportUpdateFailedToRemove:(id)a3 error:(id *)a4;
- (int64_t)actionReportUpdateRemoved:(id)a3 error:(id *)a4;
- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4;
- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8;
- (unint64_t)totalToWriteBytesForPhase;
- (unint64_t)totalWrittenBytesUpToLastPhase;
- (void)_reportPSUSFinishedEvent:(id)a3;
- (void)_reportPSUSStartedEvent;
- (void)_reportUpdateFailedToDownload:(id)a3;
- (void)_skipCurrentOperationFor:(id)a3;
- (void)_trackAnomaly:(id)a3 reason:(id)a4 result:(int64_t)a5 error:(id)a6;
- (void)_trackBegin:(id)a3 withIdentifier:(id)a4;
- (void)_trackEnd:(id)a3 withIdentifier:(id)a4 withResult:(int64_t)a5 withError:(id)a6;
- (void)_verifyNoPendingOperations:(id)a3 reason:(id)a4;
- (void)alterPolicy:(id)a3;
- (void)downloadUpdateWithPolicy:(id)a3;
- (void)maAnomaly:(id)a3;
- (void)maDownloadProgress:(id)a3;
- (void)maDownloadStalled:(id)a3;
- (void)removeUpdate;
- (void)setNumPendingOperations:(int)a3;
- (void)setPolicy:(id)a3;
- (void)setShouldReportDownloadFailureIfCanceled:(BOOL)a3;
- (void)setTotalToWriteBytesForPhase:(unint64_t)a3;
- (void)setTotalWrittenBytesUpToLastPhase:(unint64_t)a3;
- (void)setUnifiedProgress:(id)a3;
@end

@implementation SUCoreUpdateDownloader

- (SUCoreUpdateDownloader)initWithDelegate:(id)a3 forUpdate:(id)a4 updateUUID:(id)a5
{
  uint64_t v47 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v9 && v10)
  {
    v44.receiver = self;
    v44.super_class = (Class)&OBJC_CLASS___SUCoreUpdateDownloader;
    v12 = -[SUCoreUpdateDownloader init](&v44, sel_init);
    self = v12;
    if (!v12)
    {
LABEL_18:
      self = self;
      v25 = self;
      goto LABEL_19;
    }

    v12->_shouldDownloadSplat = 0;
    if ([v9 descriptorType] == 1
      || [v9 descriptorType] == 3
      || [v9 descriptorType] == 5)
    {
      v13 = objc_alloc(&OBJC_CLASS___SUCoreMobileAsset);
      [v9 softwareUpdateAsset];
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[SUCoreMobileAsset initWithDelegate:forAsset:updateUUID:]( v13,  "initWithDelegate:forAsset:updateUUID:",  self,  v14,  v11);
      maControl = self->_maControl;
      self->_maControl = v15;

      [v9 associatedSplatDescriptor];
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v17)
      {
        if ([v17 descriptorType] != 1)
        {
          [MEMORY[0x1896127A0] sharedLogger];
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          [v40 oslog];
          v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
            -[SUCoreUpdateDownloader initWithDelegate:forUpdate:updateUUID:].cold.2(v18);
          }

          goto LABEL_13;
        }

        v19 = objc_alloc(&OBJC_CLASS___SUCoreMobileAsset);
        [v18 softwareUpdateAsset];
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[SUCoreMobileAsset initWithDelegate:forAsset:updateUUID:]( v19,  "initWithDelegate:forAsset:updateUUID:",  self,  v20,  v11);
        maControlSplombo = self->_maControlSplombo;
        self->_maControlSplombo = v21;

        self->_shouldDownloadSplat = 1;
      }

      else
      {
        [MEMORY[0x1896127A0] sharedLogger];
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        [v26 oslog];
        v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          [NSString stringWithFormat:@"init: not creating ma for Splat"];
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v46 = v28;
          _os_log_impl(&dword_187A54000, v27, OS_LOG_TYPE_DEFAULT, "[SUCoreUpdateDownloader] %{public}@", buf, 0xCu);
        }
      }

      policy = self->_policy;
      self->_policy = 0LL;

      objc_storeWeak((id *)&self->_delegate, v8);
      objc_storeStrong((id *)&self->_updateDescriptor, a4);
      objc_storeStrong((id *)&self->_updateUUID, a5);
      self->_numPendingOperations = 0;
      self->_shouldReportDownloadFailureIfCanceled = 0;
      [MEMORY[0x189612760] sharedCore];
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      [v30 selectDelegateCallbackQueue:0];
      v31 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
      delegateCallBackQueue = self->_delegateCallBackQueue;
      self->_delegateCallBackQueue = v31;

      +[SUCoreUpdateDownloader _generateStateTable](&OBJC_CLASS___SUCoreUpdateDownloader, "_generateStateTable");
      v33 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      stateTable = self->_stateTable;
      self->_stateTable = v33;

      id v35 = objc_alloc(MEMORY[0x189612798]);
      v36 = -[SUCoreUpdateDownloader _versionedModuleName](self, "_versionedModuleName");
      v37 = (SUCoreFSM *)[v35 initMachine:v36 ofInstance:self->_updateUUID withTable:self->_stateTable startingIn:@"Idle" usingDelegate:self registeringAllInfoClass:objc_opt_class()];
      downloadFSM = self->_downloadFSM;
      self->_downloadFSM = v37;

      if (self->_downloadFSM) {
        goto LABEL_18;
      }
      [MEMORY[0x1896127A0] sharedLogger];
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      [v42 oslog];
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[SUCoreUpdateDownloader initWithDelegate:forUpdate:updateUUID:].cold.1();
      }
    }

    else
    {
      [MEMORY[0x1896127A0] sharedLogger];
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      [v43 oslog];
      v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[SUCoreUpdateDownloader initWithDelegate:forUpdate:updateUUID:].cold.3(v9);
      }
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 oslog];
    v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[SUCoreUpdateDownloader initWithDelegate:forUpdate:updateUUID:].cold.4();
    }
  }

LABEL_13:
  v25 = 0LL;
LABEL_19:

  return v25;
}

- (void)downloadUpdateWithPolicy:(id)a3
{
  id v4 = a3;
  v5 = -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
  [v5 extendedStateQueue];
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __51__SUCoreUpdateDownloader_downloadUpdateWithPolicy___block_invoke;
  v8[3] = &unk_18A0F0510;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __51__SUCoreUpdateDownloader_downloadUpdateWithPolicy___block_invoke(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc_init(&OBJC_CLASS___SUCoreUpdateDownloaderParam);
  [v3 postProtectedEvent:@"DownloadUpdate" withInfo:v2];
}

- (void)removeUpdate
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 extendedStateQueue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __38__SUCoreUpdateDownloader_removeUpdate__block_invoke;
  block[3] = &unk_18A0EF970;
  block[4] = self;
  dispatch_async(v4, block);
}

void __38__SUCoreUpdateDownloader_removeUpdate__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) shouldReportDownloadFailureIfCanceled])
  {
    [*(id *)(a1 + 32) setShouldReportDownloadFailureIfCanceled:0];
    [MEMORY[0x189612760] sharedCore];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 buildError:8124 underlying:0 description:@"update attempt was canceled"];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 32) _reportUpdateFailedToDownload:v3];
  }

  [*(id *)(a1 + 32) downloadFSM];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = objc_alloc_init(&OBJC_CLASS___SUCoreUpdateDownloaderParam);
  [v5 postProtectedEvent:@"RemoveUpdate" withInfo:v4];
}

- (void)alterPolicy:(id)a3
{
  id v4 = a3;
  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 extendedStateQueue];
  v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __38__SUCoreUpdateDownloader_alterPolicy___block_invoke;
  v8[3] = &unk_18A0F0510;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __38__SUCoreUpdateDownloader_alterPolicy___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "setPolicy:");
    id v2 = objc_alloc_init(MEMORY[0x189611108]);
    [*(id *)(a1 + 32) softwareUpdateDownloadPolicy];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setDiscretionary:", objc_msgSend(v3, "discretionary"));

    [MEMORY[0x1896127A0] sharedLogger];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 oslog];
    id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      id v7 = (void *)NSString;
      +[SUCoreMobileAsset downloadConfigSummary:](&OBJC_CLASS___SUCoreMobileAsset, "downloadConfigSummary:", v2);
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 stringWithFormat:@"adjusting configuration: %@", v8];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      uint64_t v13 = v6;
      __int16 v14 = 2114;
      v15 = v9;
      _os_log_impl(&dword_187A54000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
    }

    [*(id *)(a1 + 40) maControl];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 alterDownloadOptions:v2];

    [*(id *)(a1 + 40) maControlSplombo];
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 alterDownloadOptions:v2];
  }

+ (id)_generateStateTable
{
  v125[6] = *MEMORY[0x1895F89C0];
  v124[0] = @"Idle";
  v122[0] = @"DownloadUpdate";
  uint64_t v3 = *MEMORY[0x1896127D0];
  v120[0] = *MEMORY[0x1896129F8];
  uint64_t v2 = v120[0];
  v120[1] = v3;
  v121[0] = @"DownloadingSU";
  v121[1] = @"DownloadSU";
  [MEMORY[0x189603F68] dictionaryWithObjects:v121 forKeys:v120 count:2];
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v122[1] = @"RemoveUpdate";
  v123[0] = v45;
  v118[0] = v2;
  v118[1] = v3;
  v119[0] = @"RemovingUpdate";
  v119[1] = @"RemoveUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v119 forKeys:v118 count:2];
  objc_super v44 = (void *)objc_claimAutoreleasedReturnValue();
  v123[1] = v44;
  [MEMORY[0x189603F68] dictionaryWithObjects:v123 forKeys:v122 count:2];
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v125[0] = v43;
  v124[1] = @"DownloadingSU";
  v116[0] = @"DownloadUpdate";
  uint64_t v114 = v3;
  uint64_t v115 = *MEMORY[0x1896129D8];
  uint64_t v4 = v115;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v115 forKeys:&v114 count:1];
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v117[0] = v42;
  v116[1] = @"RemoveUpdate";
  v112[0] = v2;
  v112[1] = v3;
  v113[0] = @"RemovingUpdate";
  v113[1] = @"RemoveUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v113 forKeys:v112 count:2];
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v117[1] = v41;
  v116[2] = @"DownloadSucceeded";
  v110[0] = v2;
  v110[1] = v3;
  v111[0] = @"DownloadingSplat";
  v111[1] = @"DownloadSplat";
  [MEMORY[0x189603F68] dictionaryWithObjects:v111 forKeys:v110 count:2];
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v117[2] = v40;
  v116[3] = @"DownloadFailed";
  v108[0] = v2;
  v108[1] = v3;
  v109[0] = @"Idle";
  v109[1] = @"ReportUpdateFailedToDownload";
  [MEMORY[0x189603F68] dictionaryWithObjects:v109 forKeys:v108 count:2];
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v117[3] = v39;
  v116[4] = @"DownloadProgress";
  uint64_t v106 = v3;
  v107 = @"ReportDownloadProgress";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v107 forKeys:&v106 count:1];
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v117[4] = v38;
  v116[5] = @"DownloadStalled";
  uint64_t v104 = v3;
  v105 = @"ReportDownloadStalled";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v105 forKeys:&v104 count:1];
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v117[5] = v37;
  [MEMORY[0x189603F68] dictionaryWithObjects:v117 forKeys:v116 count:6];
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v125[1] = v36;
  v124[2] = @"DownloadingSplat";
  v102[0] = @"DownloadUpdate";
  uint64_t v100 = v3;
  uint64_t v101 = v4;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v101 forKeys:&v100 count:1];
  id v35 = (void *)objc_claimAutoreleasedReturnValue();
  v103[0] = v35;
  v102[1] = @"RemoveUpdate";
  v98[0] = v2;
  v98[1] = v3;
  v99[0] = @"RemovingUpdate";
  v99[1] = @"RemoveUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v99 forKeys:v98 count:2];
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v103[1] = v34;
  v102[2] = @"DownloadSucceeded";
  v96[0] = v2;
  v96[1] = v3;
  v97[0] = @"DownloadingPSUSAssets";
  v97[1] = @"DownloadPSUSAssets";
  [MEMORY[0x189603F68] dictionaryWithObjects:v97 forKeys:v96 count:2];
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v103[2] = v33;
  v102[3] = @"OperationSkipped";
  v94[0] = v2;
  v94[1] = v3;
  v95[0] = @"DownloadingPSUSAssets";
  v95[1] = @"DownloadPSUSAssets";
  [MEMORY[0x189603F68] dictionaryWithObjects:v95 forKeys:v94 count:2];
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v103[3] = v32;
  v102[4] = @"DownloadFailed";
  v92[0] = v2;
  v92[1] = v3;
  v93[0] = @"Idle";
  v93[1] = @"ReportUpdateFailedToDownload";
  [MEMORY[0x189603F68] dictionaryWithObjects:v93 forKeys:v92 count:2];
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v103[4] = v31;
  v102[5] = @"DownloadProgress";
  uint64_t v90 = v3;
  v91 = @"ReportDownloadProgress";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v91 forKeys:&v90 count:1];
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v103[5] = v30;
  v102[6] = @"DownloadStalled";
  uint64_t v88 = v3;
  v89 = @"ReportDownloadStalled";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v89 forKeys:&v88 count:1];
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v103[6] = v29;
  [MEMORY[0x189603F68] dictionaryWithObjects:v103 forKeys:v102 count:7];
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v125[2] = v28;
  v124[3] = @"DownloadingPSUSAssets";
  v86[0] = @"DownloadUpdate";
  uint64_t v84 = v3;
  uint64_t v85 = v4;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = v27;
  v86[1] = @"RemoveUpdate";
  v82[0] = v2;
  v82[1] = v3;
  v83[0] = @"RemovingUpdate";
  v83[1] = @"RemoveUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v83 forKeys:v82 count:2];
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v87[1] = v26;
  v86[2] = @"DownloadSucceeded";
  v80[0] = v2;
  v80[1] = v3;
  v81[0] = @"Downloaded";
  v81[1] = @"ReportUpdateDownloaded";
  [MEMORY[0x189603F68] dictionaryWithObjects:v81 forKeys:v80 count:2];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v87[2] = v25;
  v86[3] = @"OperationSkipped";
  v78[0] = v2;
  v78[1] = v3;
  v79[0] = @"Downloaded";
  v79[1] = @"ReportUpdateDownloaded";
  [MEMORY[0x189603F68] dictionaryWithObjects:v79 forKeys:v78 count:2];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v87[3] = v24;
  v86[4] = @"DownloadFailed";
  v76[0] = v2;
  v76[1] = v3;
  v77[0] = @"Idle";
  v77[1] = @"ReportUpdateFailedToDownload";
  [MEMORY[0x189603F68] dictionaryWithObjects:v77 forKeys:v76 count:2];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v87[4] = v23;
  v86[5] = @"DownloadProgress";
  uint64_t v74 = v3;
  v75 = @"ReportDownloadProgress";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v87[5] = v22;
  v86[6] = @"DownloadStalled";
  uint64_t v72 = v3;
  v73 = @"ReportDownloadStalled";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v87[6] = v21;
  [MEMORY[0x189603F68] dictionaryWithObjects:v87 forKeys:v86 count:7];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v125[3] = v20;
  v124[4] = @"Downloaded";
  v70[0] = @"DownloadUpdate";
  uint64_t v68 = v3;
  v69 = @"ReportUpdateDownloaded";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v69 forKeys:&v68 count:1];
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = v19;
  v70[1] = @"RemoveUpdate";
  v66[0] = v2;
  v66[1] = v3;
  v67[0] = @"RemovingUpdate";
  v67[1] = @"RemoveUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v67 forKeys:v66 count:2];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v71[1] = v18;
  [MEMORY[0x189603F68] dictionaryWithObjects:v71 forKeys:v70 count:2];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v125[4] = v17;
  v124[5] = @"RemovingUpdate";
  uint64_t v63 = v4;
  v64[0] = @"DownloadUpdate";
  uint64_t v62 = v3;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v63 forKeys:&v62 count:1];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = v16;
  v64[1] = @"RemoveUpdate";
  uint64_t v60 = v3;
  uint64_t v61 = v4;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v61 forKeys:&v60 count:1];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  v65[1] = v5;
  v64[2] = @"RemoveSucceeded";
  uint64_t v58 = v3;
  v59 = @"CheckRemoveCompleted";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v65[2] = v6;
  v64[3] = @"RemoveFailed";
  uint64_t v56 = v3;
  v57 = @"CheckRemoveCompleted";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v57 forKeys:&v56 count:1];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  v65[3] = v7;
  v64[4] = @"DownloadSucceeded";
  uint64_t v54 = v3;
  v55 = @"CheckRemoveCompleted";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  v65[4] = v8;
  v64[5] = @"DownloadFailed";
  uint64_t v52 = v3;
  v53 = @"CheckRemoveCompleted";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v65[5] = v9;
  v64[6] = @"DownloadProgress";
  uint64_t v50 = v3;
  uint64_t v51 = v4;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v51 forKeys:&v50 count:1];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  v65[6] = v10;
  v64[7] = @"DownloadStalled";
  uint64_t v48 = v3;
  uint64_t v49 = v4;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v65[7] = v11;
  v64[8] = @"RemoveCompleted";
  v46[0] = v2;
  v46[1] = v3;
  v47[0] = @"Idle";
  v47[1] = @"ReportUpdateRemoved";
  [MEMORY[0x189603F68] dictionaryWithObjects:v47 forKeys:v46 count:2];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v65[8] = v12;
  [MEMORY[0x189603F68] dictionaryWithObjects:v65 forKeys:v64 count:9];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  v125[5] = v13;
  [MEMORY[0x189603F68] dictionaryWithObjects:v125 forKeys:v124 count:6];
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8
{
  id v11 = a3;
  id v12 = a6;
  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 extendedStateQueue];
  __int16 v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  if ([v11 isEqualToString:*MEMORY[0x1896129D8]])
  {
    int64_t v15 = 0LL;
  }

  else
  {
    if ([v11 isEqualToString:@"DownloadSU"])
    {
      int64_t v16 = -[SUCoreUpdateDownloader actionDownloadSU:error:](self, "actionDownloadSU:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"DownloadSplat"])
    {
      int64_t v16 = -[SUCoreUpdateDownloader actionDownloadSplat:error:](self, "actionDownloadSplat:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"DownloadPSUSAssets"])
    {
      int64_t v16 = -[SUCoreUpdateDownloader actionDownloadPSUSAssets:error:](self, "actionDownloadPSUSAssets:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"ReportUpdateDownloaded"])
    {
      int64_t v16 = -[SUCoreUpdateDownloader actionReportUpdateDownloaded:error:]( self,  "actionReportUpdateDownloaded:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"ReportUpdateFailedToDownload"])
    {
      int64_t v16 = -[SUCoreUpdateDownloader actionReportUpdateFailedToDownload:error:]( self,  "actionReportUpdateFailedToDownload:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"ReportDownloadStalled"])
    {
      int64_t v16 = -[SUCoreUpdateDownloader actionReportDownloadStalled:error:]( self,  "actionReportDownloadStalled:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"ReportDownloadProgress"])
    {
      int64_t v16 = -[SUCoreUpdateDownloader actionReportDownloadProgress:error:]( self,  "actionReportDownloadProgress:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"RemoveUpdate"])
    {
      int64_t v16 = -[SUCoreUpdateDownloader actionRemoveUpdate:error:](self, "actionRemoveUpdate:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"CheckRemoveCompleted"])
    {
      int64_t v16 = -[SUCoreUpdateDownloader actionCheckRemoveCompleted:error:]( self,  "actionCheckRemoveCompleted:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"ReportUpdateRemoved"])
    {
      int64_t v16 = -[SUCoreUpdateDownloader actionReportUpdateRemoved:error:]( self,  "actionReportUpdateRemoved:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"ReportUpdateFailedToRemove"])
    {
      int64_t v16 = -[SUCoreUpdateDownloader actionReportUpdateFailedToRemove:error:]( self,  "actionReportUpdateFailedToRemove:error:",  v12,  a8);
    }

    else
    {
      int64_t v16 = -[SUCoreUpdateDownloader actionUnknownAction:error:](self, "actionUnknownAction:error:", v11, a8);
    }

    int64_t v15 = v16;
  }

  return v15;
}

- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4
{
  id v5 = a3;
  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 extendedStateQueue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 diag];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ unknown action(%@)", self, v5];

  [v9 dumpTracked:v10 dumpingTo:5 usingFilename:0 clearingStatistics:0 clearingHistory:0];
  return 8102LL;
}

- (int64_t)actionDownloadSU:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 extendedStateQueue];
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUCoreUpdateDownloader setShouldReportDownloadFailureIfCanceled:]( self,  "setShouldReportDownloadFailureIfCanceled:",  1LL);
  -[SUCoreUpdateDownloader setTotalWrittenBytesUpToLastPhase:](self, "setTotalWrittenBytesUpToLastPhase:", 0LL);
  -[SUCoreUpdateDownloader setTotalToWriteBytesForPhase:](self, "setTotalToWriteBytesForPhase:", 0LL);
  id v7 = objc_alloc(MEMORY[0x1896127B8]);
  uint64_t v8 = *MEMORY[0x189612A18];
  -[SUCoreUpdateDownloader updateDescriptor](self, "updateDescriptor");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 downloadSize];
  LODWORD(v11) = 0;
  id v12 = (void *)[v7 initWithPhase:v8 isStalled:0 portionComplete:0 totalWrittenBytes:v10 totalExpectedBytes:v11 remaining:-1.0];
  -[SUCoreUpdateDownloader setUnifiedProgress:](self, "setUnifiedProgress:", v12);

  -[SUCoreUpdateDownloader maControl](self, "maControl");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[SUCoreUpdateDownloader updateDescriptor](self, "updateDescriptor");
    __int16 v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreUpdateDownloader setTotalToWriteBytesForPhase:]( self,  "setTotalToWriteBytesForPhase:",  [v14 suDownloadSize]);

    -[SUCoreUpdateDownloader _trackBegin:withIdentifier:]( self,  "_trackBegin:withIdentifier:",  @"downloadSoftwareUpdateAssetWithPolicy",  @"su");
    -[SUCoreUpdateDownloader maControl](self, "maControl");
    int64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreUpdateDownloader policy](self, "policy");
    int64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[SUCoreUpdateDownloader updateUUID](self, "updateUUID");
    v24[0] = MEMORY[0x1895F87A8];
    v24[1] = 3221225472LL;
    v24[2] = __49__SUCoreUpdateDownloader_actionDownloadSU_error___block_invoke;
    v24[3] = &unk_18A0F02B0;
    v24[4] = self;
    [v15 downloadSoftwareUpdateAssetWithPolicy:v16 withUUID:v17 completion:v24];

    return 0LL;
  }

  else
  {
    [MEMORY[0x189612760] sharedCore];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    int64_t v18 = 8116LL;
    [v19 buildError:8116 underlying:0 description:@"unexpected no maControl when trying to download SU"];
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreUpdateDownloader _trackAnomaly:reason:result:error:]( self,  "_trackAnomaly:reason:result:error:",  @"[DOWNLOAD_SU]",  @"unexpected no maControl when trying to download SU",  8116LL,  v20);
    v21 = -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
    v22 = -[SUCoreUpdateDownloaderParam initWithError:]( objc_alloc(&OBJC_CLASS___SUCoreUpdateDownloaderParam),  "initWithError:",  v20);
    [v21 followupEvent:@"DownloadFailed" withInfo:v22];
  }

  return v18;
}

void __49__SUCoreUpdateDownloader_actionDownloadSU_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) downloadFSM];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 extendedStateQueue];
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __49__SUCoreUpdateDownloader_actionDownloadSU_error___block_invoke_2;
  v7[3] = &unk_18A0F0510;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __49__SUCoreUpdateDownloader_actionDownloadSU_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) downloadFSM];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    id v3 = -[SUCoreUpdateDownloaderParam initWithError:]( objc_alloc(&OBJC_CLASS___SUCoreUpdateDownloaderParam),  "initWithError:",  *(void *)(a1 + 40));
    uint64_t v4 = @"DownloadFailed";
  }

  else
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___SUCoreUpdateDownloaderParam);
    uint64_t v4 = @"DownloadSucceeded";
  }

  [v5 postProtectedEvent:v4 withInfo:v3];
}

- (int64_t)actionDownloadSplat:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 extendedStateQueue];
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUCoreUpdateDownloader _skipCurrentOperationFor:]( self,  "_skipCurrentOperationFor:",  @"[Splombo] not supported for this platform; skip downloading splat");
  return 0LL;
}

- (int64_t)actionDownloadPSUSAssets:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 extendedStateQueue];
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUCoreUpdateDownloader _skipCurrentOperationFor:]( self,  "_skipCurrentOperationFor:",  @"[PreSUStaging] not supported in SUCore for this platform; skip downloading assets");
  return 0LL;
}

- (int64_t)actionReportDownloadProgress:(id)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 extendedStateQueue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  [v5 progress];
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdateDownloader unifiedProgress](self, "unifiedProgress");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 setIsStalled:0];

  uint64_t v10 = [v8 totalWrittenBytes];
  unint64_t v11 = -[SUCoreUpdateDownloader totalWrittenBytesUpToLastPhase](self, "totalWrittenBytesUpToLastPhase") + v10;
  -[SUCoreUpdateDownloader unifiedProgress](self, "unifiedProgress");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 setTotalWrittenBytes:v11];

  -[SUCoreUpdateDownloader unifiedProgress](self, "unifiedProgress");
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v13 totalExpectedBytes];
  -[SUCoreUpdateDownloader unifiedProgress](self, "unifiedProgress");
  int64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = v14 - [v15 totalWrittenBytes];

  uint64_t v17 = [v8 totalExpectedBytes];
  uint64_t v18 = [v8 totalWrittenBytes];
  if (v16 >= 1 && v17 - v18 >= 1)
  {
    double v19 = (double)v16 / (double)(v17 - v18);
    [v8 estimatedTimeRemaining];
    double v21 = v19 * v20;
    v22 = -[SUCoreUpdateDownloader unifiedProgress](self, "unifiedProgress");
    [v22 setEstimatedTimeRemaining:v21];
  }
  v23 = -[SUCoreUpdateDownloader unifiedProgress](self, "unifiedProgress");
  double v24 = (double)[v23 totalWrittenBytes];
  uint64_t v25 = -[SUCoreUpdateDownloader unifiedProgress](self, "unifiedProgress");
  *(float *)&double v24 = v24 / (double)[(id)v25 totalExpectedBytes];
  v26 = -[SUCoreUpdateDownloader unifiedProgress](self, "unifiedProgress");
  LODWORD(v27) = LODWORD(v24);
  [v26 setPortionComplete:v27];
  v28 = -[SUCoreUpdateDownloader delegate](self, "delegate");
  LOBYTE(v25) = objc_opt_respondsToSelector();

  if ((v25 & 1) != 0)
  {
    v29 = -[SUCoreUpdateDownloader unifiedProgress](self, "unifiedProgress");
    v30 = (void *)[v29 copy];

    -[SUCoreUpdateDownloader delegateCallBackQueue](self, "delegateCallBackQueue");
    v31 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __61__SUCoreUpdateDownloader_actionReportDownloadProgress_error___block_invoke;
    block[3] = &unk_18A0F0510;
    block[4] = self;
    id v8 = v30;
    id v39 = v8;
    dispatch_async(v31, block);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    [v32 oslog];
    v33 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = (void *)NSString;
      -[SUCoreUpdateDownloader unifiedProgress](self, "unifiedProgress");
      id v35 = (void *)objc_claimAutoreleasedReturnValue();
      [v34 stringWithFormat:@"delegate does not respond to selector(downloadProgress:) so not reporting progress=%@", v35];
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v41 = self;
      __int16 v42 = 2114;
      v43 = v36;
      _os_log_impl(&dword_187A54000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
    }
  }

  return 0LL;
}

void __61__SUCoreUpdateDownloader_actionReportDownloadProgress_error___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 downloadProgress:*(void *)(a1 + 40)];
}

- (int64_t)actionReportDownloadStalled:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM", a3, a4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2((dispatch_queue_t)v6);

  -[SUCoreUpdateDownloader unifiedProgress](self, "unifiedProgress");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setIsStalled:1];

  -[SUCoreUpdateDownloader delegate](self, "delegate");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreUpdateDownloader delegateCallBackQueue](self, "delegateCallBackQueue");
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __60__SUCoreUpdateDownloader_actionReportDownloadStalled_error___block_invoke;
    block[3] = &unk_18A0EF970;
    block[4] = self;
    dispatch_async(v9, block);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 oslog];
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v11 = (void *)NSString;
      -[SUCoreUpdateDownloader unifiedProgress](self, "unifiedProgress");
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 stringWithFormat:@"delegate does not respond to selector(downloadStalled:) so not reporting progress=%@", v12];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = self;
      __int16 v18 = 2114;
      double v19 = v13;
      _os_log_impl(&dword_187A54000, (os_log_t)v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
    }
  }

  return 0LL;
}

void __60__SUCoreUpdateDownloader_actionReportDownloadStalled_error___block_invoke(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) unifiedProgress];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 downloadStalled:v2];
}

- (int64_t)actionReportUpdateDownloaded:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM", a3, a4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 extendedStateQueue];
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUCoreUpdateDownloader _verifyNoPendingOperations:reason:]( self,  "_verifyNoPendingOperations:reason:",  @"DOWNLOAD",  @"Should have no pending operations: UpdateDownloaded");
  id v7 = objc_alloc(MEMORY[0x1896127B8]);
  LODWORD(v8) = 1.0;
  id v9 = (void *)[v7 initWithPhase:*MEMORY[0x189612A18] isStalled:0 portionComplete:-1 totalWrittenBytes:-1 totalExpectedBytes:v8 remaining:0.0];
  -[SUCoreUpdateDownloader setUnifiedProgress:](self, "setUnifiedProgress:", v9);
  -[SUCoreUpdateDownloader delegate](self, "delegate");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  char v11 = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[SUCoreUpdateDownloader delegateCallBackQueue](self, "delegateCallBackQueue");
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __61__SUCoreUpdateDownloader_actionReportUpdateDownloaded_error___block_invoke;
    block[3] = &unk_18A0F0510;
    block[4] = self;
    id v18 = v9;
    dispatch_async(v12, block);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 oslog];
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      [NSString stringWithFormat:@"delegate does not respond to selector(downloaded:) so not reporting progress=%@", v9];
      int64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      uint64_t v20 = self;
      __int16 v21 = 2114;
      v22 = v15;
      _os_log_impl(&dword_187A54000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
    }
  }

  -[SUCoreUpdateDownloader setShouldReportDownloadFailureIfCanceled:]( self,  "setShouldReportDownloadFailureIfCanceled:",  0LL);

  return 0LL;
}

void __61__SUCoreUpdateDownloader_actionReportUpdateDownloaded_error___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 downloaded:*(void *)(a1 + 40)];
}

- (void)_reportUpdateFailedToDownload:(id)a3
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreUpdateDownloader delegate](self, "delegate");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreUpdateDownloader delegateCallBackQueue](self, "delegateCallBackQueue");
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __56__SUCoreUpdateDownloader__reportUpdateFailedToDownload___block_invoke;
    block[3] = &unk_18A0F0510;
    block[4] = self;
    id v12 = v4;
    dispatch_async(v7, block);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    double v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      [NSString stringWithFormat:@"delegate does not respond to selector(downloadedFailed:) so not reporting error=%@", v4];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = self;
      __int16 v15 = 2114;
      uint64_t v16 = v10;
      _os_log_impl(&dword_187A54000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
    }
  }
}

void __56__SUCoreUpdateDownloader__reportUpdateFailedToDownload___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 downloadFailed:*(void *)(a1 + 40)];
}

- (int64_t)actionReportUpdateFailedToDownload:(id)a3 error:(id *)a4
{
  id v5 = a3;
  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 extendedStateQueue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUCoreUpdateDownloader _verifyNoPendingOperations:reason:]( self,  "_verifyNoPendingOperations:reason:",  @"DOWNLOAD",  @"Should have no pending operations: UpdateFailedToDownload");
  [v5 error];
  double v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreUpdateDownloader _reportUpdateFailedToDownload:](self, "_reportUpdateFailedToDownload:", v8);
  -[SUCoreUpdateDownloader setShouldReportDownloadFailureIfCanceled:]( self,  "setShouldReportDownloadFailureIfCanceled:",  0LL);
  return 0LL;
}

- (int64_t)actionRemoveUpdate:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM", a3, a4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 extendedStateQueue];
  char v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUCoreUpdateDownloader maControl](self, "maControl");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SUCoreUpdateDownloader _trackBegin:withIdentifier:]( self,  "_trackBegin:withIdentifier:",  @"removeAsset",  @"su");
    -[SUCoreUpdateDownloader maControl](self, "maControl");
    double v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1895F87A8];
    v21[1] = 3221225472LL;
    v21[2] = __51__SUCoreUpdateDownloader_actionRemoveUpdate_error___block_invoke;
    v21[3] = &unk_18A0F02B0;
    v21[4] = self;
    [v8 removeAsset:v21];

    int64_t v9 = 0LL;
  }

  else
  {
    [MEMORY[0x189612760] sharedCore];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    int64_t v9 = 8116LL;
    [v10 buildError:8116 underlying:0 description:@"unexpected no maControl when tyring to remove SU"];
    char v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreUpdateDownloader _trackAnomaly:reason:result:error:]( self,  "_trackAnomaly:reason:result:error:",  @"[REMOVE_SU]",  @"unexpected no maControl when tyring to remove SU",  8116LL,  v11);
    -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v13 = -[SUCoreUpdateDownloaderParam initWithError:]( objc_alloc(&OBJC_CLASS___SUCoreUpdateDownloaderParam),  "initWithError:",  v11);
    [v12 followupEvent:@"RemoveFailed" withInfo:v13];
  }

  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 oslog];
  __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    [NSString stringWithFormat:@"[Splombo] No need to remove Splat (not supported)"];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    uint64_t v23 = self;
    __int16 v24 = 2114;
    uint64_t v25 = v16;
    _os_log_impl(&dword_187A54000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
  }

  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 oslog];
  id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    [NSString stringWithFormat:@"[PreSUStaging] No need to remove PSUS assets (not supported)"];
    double v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    uint64_t v23 = self;
    __int16 v24 = 2114;
    uint64_t v25 = v19;
    _os_log_impl(&dword_187A54000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
  }

  return v9;
}

void __51__SUCoreUpdateDownloader_actionRemoveUpdate_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) downloadFSM];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 extendedStateQueue];
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __51__SUCoreUpdateDownloader_actionRemoveUpdate_error___block_invoke_2;
  v7[3] = &unk_18A0F0510;
  v7[4] = *(void *)(a1 + 32);
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __51__SUCoreUpdateDownloader_actionRemoveUpdate_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) downloadFSM];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    id v3 = -[SUCoreUpdateDownloaderParam initWithError:]( objc_alloc(&OBJC_CLASS___SUCoreUpdateDownloaderParam),  "initWithError:",  *(void *)(a1 + 40));
    id v4 = @"RemoveFailed";
  }

  else
  {
    id v3 = objc_alloc_init(&OBJC_CLASS___SUCoreUpdateDownloaderParam);
    id v4 = @"RemoveSucceeded";
  }

  [v5 postProtectedEvent:v4 withInfo:v3];
}

- (int64_t)actionCheckRemoveCompleted:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 extendedStateQueue];
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (!-[SUCoreUpdateDownloader numPendingOperations](self, "numPendingOperations"))
  {
    -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = objc_alloc_init(&OBJC_CLASS___SUCoreUpdateDownloaderParam);
    [v7 followupEvent:@"RemoveCompleted" withInfo:v8];
  }

  return 0LL;
}

- (int64_t)actionReportUpdateRemoved:(id)a3 error:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM", a3, a4);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 extendedStateQueue];
  dispatch_assert_queue_V2((dispatch_queue_t)v6);

  -[SUCoreUpdateDownloader _verifyNoPendingOperations:reason:]( self,  "_verifyNoPendingOperations:reason:",  @"REMOVE",  @"Should have no pending operations: UpdateRemoved");
  -[SUCoreUpdateDownloader delegate](self, "delegate");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreUpdateDownloader delegateCallBackQueue](self, "delegateCallBackQueue");
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __58__SUCoreUpdateDownloader_actionReportUpdateRemoved_error___block_invoke;
    block[3] = &unk_18A0EF970;
    block[4] = self;
    dispatch_async(v8, block);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    int64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 oslog];
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_DEFAULT))
    {
      [NSString stringWithFormat:@"delegate does not respond to selector(updateRemoved) so not reporting updateRemoved"];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      uint64_t v14 = self;
      __int16 v15 = 2114;
      uint64_t v16 = v10;
      _os_log_impl(&dword_187A54000, (os_log_t)v8, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
    }
  }

  return 0LL;
}

void __58__SUCoreUpdateDownloader_actionReportUpdateRemoved_error___block_invoke(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 updateRemoved];
}

- (int64_t)actionReportUpdateFailedToRemove:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 extendedStateQueue];
  dispatch_assert_queue_V2((dispatch_queue_t)v7);

  -[SUCoreUpdateDownloader _verifyNoPendingOperations:reason:]( self,  "_verifyNoPendingOperations:reason:",  @"REMOVE",  @"Should have no pending operations: UpdateFailedToRemove");
  -[SUCoreUpdateDownloader delegate](self, "delegate");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SUCoreUpdateDownloader delegateCallBackQueue](self, "delegateCallBackQueue");
    int64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __65__SUCoreUpdateDownloader_actionReportUpdateFailedToRemove_error___block_invoke;
    block[3] = &unk_18A0F0510;
    block[4] = self;
    id v17 = v5;
    dispatch_async(v9, block);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 oslog];
    char v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = (void *)NSString;
      [v5 error];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 stringWithFormat:@"delegate does not respond to selector(updateRemoveFailed:) so not reporting error=%@", v13];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      double v19 = self;
      __int16 v20 = 2114;
      __int16 v21 = v14;
      _os_log_impl(&dword_187A54000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
    }
  }

  return 0LL;
}

void __65__SUCoreUpdateDownloader_actionReportUpdateFailedToRemove_error___block_invoke(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) error];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 updateRemoveFailed:v2];
}

- (void)maDownloadProgress:(id)a3
{
  id v4 = a3;
  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = -[SUCoreUpdateDownloaderParam initWithProgress:]( objc_alloc(&OBJC_CLASS___SUCoreUpdateDownloaderParam),  "initWithProgress:",  v4);

  [v6 postEvent:@"DownloadProgress" withInfo:v5];
}

- (void)maDownloadStalled:(id)a3
{
  id v4 = a3;
  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = -[SUCoreUpdateDownloaderParam initWithProgress:]( objc_alloc(&OBJC_CLASS___SUCoreUpdateDownloaderParam),  "initWithProgress:",  v4);

  [v6 postEvent:@"DownloadStalled" withInfo:v5];
}

- (void)maAnomaly:(id)a3
{
  id v4 = a3;
  -[SUCoreUpdateDownloader _trackAnomaly:reason:result:error:]( self,  "_trackAnomaly:reason:result:error:",  @"[MA_ANOMALY]",  @"maAnomaly called",  [v4 code],  v4);
}

- (id)_createEvent:(id)a3
{
  id v4 = a3;
  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 extendedStateQueue];
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  [MEMORY[0x189603FC8] dictionary];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setSafeObject:v4 forKey:*MEMORY[0x189612968]];

  -[SUCoreUpdateDownloader updateUUID](self, "updateUUID");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setSafeObject:v8 forKey:*MEMORY[0x1896129C8]];

  int64_t v9 = objc_alloc_init(&OBJC_CLASS___SUCoreEventAugmenter);
  -[SUCoreUpdateDownloader policy](self, "policy");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreEventAugmenter setPolicy:](v9, "setPolicy:", v10);

  -[SUCoreUpdateDownloader updateDescriptor](self, "updateDescriptor");
  char v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreEventAugmenter setPrimaryDescriptor:](v9, "setPrimaryDescriptor:", v11);

  -[SUCoreEventAugmenter augmentEvent:](v9, "augmentEvent:", v7);
  return v7;
}

- (void)_reportPSUSStartedEvent
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 extendedStateQueue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[SUCoreUpdateDownloader _createEvent:](self, "_createEvent:", *MEMORY[0x1896129B0]);
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setSafeObject:*MEMORY[0x189612978] forKey:*MEMORY[0x189612970]];
  [MEMORY[0x189612760] sharedCore];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 miscellaneousTaksQueue];
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __49__SUCoreUpdateDownloader__reportPSUSStartedEvent__block_invoke;
  block[3] = &unk_18A0EF970;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, block);
}

void __49__SUCoreUpdateDownloader__reportPSUSStartedEvent__block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 sendEvent:*(void *)(a1 + 32)];
}

- (void)_reportPSUSFinishedEvent:(id)a3
{
  id v4 = a3;
  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 extendedStateQueue];
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUCoreUpdateDownloader _createEvent:](self, "_createEvent:", *MEMORY[0x1896129A8]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = v7;
  if (v4) {
    [MEMORY[0x189612790] augmentEvent:v7 withError:v4];
  }
  else {
    [v7 setSafeObject:*MEMORY[0x189612978] forKey:*MEMORY[0x189612970]];
  }
  [MEMORY[0x189612760] sharedCore];
  int64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 miscellaneousTaksQueue];
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __51__SUCoreUpdateDownloader__reportPSUSFinishedEvent___block_invoke;
  block[3] = &unk_18A0EF970;
  id v13 = v8;
  id v11 = v8;
  dispatch_async(v10, block);
}

void __51__SUCoreUpdateDownloader__reportPSUSFinishedEvent___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 sendEvent:*(void *)(a1 + 32)];
}

- (void)_verifyNoPendingOperations:(id)a3 reason:(id)a4
{
  id v12 = (__CFString *)a3;
  id v6 = a4;
  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 extendedStateQueue];
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  if (-[SUCoreUpdateDownloader numPendingOperations](self, "numPendingOperations"))
  {
    int64_t v9 = v12;
    if (!v12) {
      int64_t v9 = @"UNK_LOC";
    }
    id v12 = (__CFString *)v9;
    -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 diag];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 trackAnomaly:v12 forReason:v6 withResult:8117 withError:0];
  }
}

- (void)_trackBegin:(id)a3 withIdentifier:(id)a4
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 extendedStateQueue];
  int64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 diag];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdateDownloader _versionedModuleName](self, "_versionedModuleName");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 trackBegin:v6 atLevel:1 forModule:v12 withIdentifier:v7];

  -[SUCoreUpdateDownloader setNumPendingOperations:]( self,  "setNumPendingOperations:",  -[SUCoreUpdateDownloader numPendingOperations](self, "numPendingOperations") + 1);
  [MEMORY[0x1896127A0] sharedLogger];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 oslog];
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    [NSString stringWithFormat:@"incremented the number of pending operations (%d): %@ (%@) has begun", -[SUCoreUpdateDownloader numPendingOperations](self, "numPendingOperations"), v6, v7];
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    id v17 = self;
    __int16 v18 = 2114;
    double v19 = v15;
    _os_log_impl(&dword_187A54000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
  }
}

- (void)_trackEnd:(id)a3 withIdentifier:(id)a4 withResult:(int64_t)a5 withError:(id)a6
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 extendedStateQueue];
  uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 diag];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdateDownloader _versionedModuleName](self, "_versionedModuleName");
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 trackEnd:v10 atLevel:1 forModule:v17 withIdentifier:v11 withResult:a5 withError:v12];

  if (-[SUCoreUpdateDownloader numPendingOperations](self, "numPendingOperations") < 1)
  {
    [NSString stringWithFormat:@"invalid numPendingOperations (%d) when %@ (%@) ends", -[SUCoreUpdateDownloader numPendingOperations](self, "numPendingOperations"), v10, v11];
    double v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 diag];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 trackAnomaly:@"[TRACK_END]" forReason:v19 withResult:8117 withError:0];
  }

  else
  {
    -[SUCoreUpdateDownloader setNumPendingOperations:]( self,  "setNumPendingOperations:",  -[SUCoreUpdateDownloader numPendingOperations](self, "numPendingOperations") - 1);
    [MEMORY[0x1896127A0] sharedLogger];
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 oslog];
    double v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      [NSString stringWithFormat:@"decremented the number of pending operations (%d): %@ (%@) has ended", -[SUCoreUpdateDownloader numPendingOperations](self, "numPendingOperations"), v10, v11];
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      __int16 v24 = self;
      __int16 v25 = 2114;
      uint64_t v26 = v20;
      _os_log_impl(&dword_187A54000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
    }
  }
}

- (void)_trackAnomaly:(id)a3 reason:(id)a4 result:(int64_t)a5 error:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 diag];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 trackAnomaly:v12 forReason:v11 withResult:a5 withError:v10];

  -[SUCoreUpdateDownloader delegate](self, "delegate");
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = objc_opt_respondsToSelector();

  if ((v11 & 1) != 0)
  {
    -[SUCoreUpdateDownloader delegateCallBackQueue](self, "delegateCallBackQueue");
    uint64_t v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __60__SUCoreUpdateDownloader__trackAnomaly_reason_result_error___block_invoke;
    v17[3] = &unk_18A0F0510;
    v17[4] = self;
    id v18 = v10;
    dispatch_async(v16, v17);
  }
}

void __60__SUCoreUpdateDownloader__trackAnomaly_reason_result_error___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 anomaly:*(void *)(a1 + 40)];
}

- (BOOL)_isPreSUStagingEnabled
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  -[SUCoreUpdateDownloader updateDescriptor](self, "updateDescriptor");
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdateDownloader policy](self, "policy");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = 0LL;
  BOOL v5 = +[SUCoreScan isPreSUStagingEnabledForUpdate:policy:reason:]( &OBJC_CLASS___SUCoreScan,  "isPreSUStagingEnabledForUpdate:policy:reason:",  v3,  v4,  &v12);
  id v6 = v12;

  [MEMORY[0x1896127A0] sharedLogger];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 oslog];
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v9 = @"disabled";
    if (v5) {
      int64_t v9 = @"enabled";
    }
    [NSString stringWithFormat:@"[PreSUStaging] %@: %@", v9, v6];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    uint64_t v14 = self;
    __int16 v15 = 2114;
    uint64_t v16 = v10;
    _os_log_impl(&dword_187A54000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
  }

  return v5;
}

- (BOOL)_shouldStageOptionalPSUSAssets
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896127A0] sharedLogger];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 oslog];
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    [NSString stringWithFormat:@"[PreSUStaging] not supported in SUCore for this platform"];
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
    int v7 = 138543618;
    id v8 = self;
    __int16 v9 = 2114;
    id v10 = v5;
    _os_log_impl(&dword_187A54000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", (uint8_t *)&v7, 0x16u);
  }

  return 0;
}

- (void)_skipCurrentOperationFor:(id)a3
{
  id v4 = a3;
  id v6 = -[SUCoreUpdateDownloaderParam initWithNote:]( objc_alloc(&OBJC_CLASS___SUCoreUpdateDownloaderParam),  "initWithNote:",  v4);

  -[SUCoreUpdateDownloader downloadFSM](self, "downloadFSM");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 followupEvent:@"OperationSkipped" withInfo:v6];
}

- (id)_versionedModuleName
{
  return (id)[NSString stringWithFormat:@"%@[%@]", @"update_downloader", @"1.0.2"];
}

- (NSString)description
{
  id v3 = (void *)NSString;
  -[SUCoreUpdateDownloader _versionedModuleName](self, "_versionedModuleName");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreUpdateDownloader updateUUID](self, "updateUUID");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"%@(%@)]", v4, v5];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (SUCorePolicy)policy
{
  return self->_policy;
}

- (void)setPolicy:(id)a3
{
}

- (SUCoreDescriptor)updateDescriptor
{
  return self->_updateDescriptor;
}

- (SUCoreUpdateDownloaderDelegate)delegate
{
  return (SUCoreUpdateDownloaderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)updateUUID
{
  return self->_updateUUID;
}

- (NSDictionary)stateTable
{
  return self->_stateTable;
}

- (SUCoreFSM)downloadFSM
{
  return self->_downloadFSM;
}

- (SUCoreMobileAsset)maControl
{
  return self->_maControl;
}

- (SUCoreMobileAsset)maControlSplombo
{
  return self->_maControlSplombo;
}

- (BOOL)shouldDownloadSplat
{
  return self->_shouldDownloadSplat;
}

- (SUCoreProgress)unifiedProgress
{
  return self->_unifiedProgress;
}

- (void)setUnifiedProgress:(id)a3
{
}

- (unint64_t)totalToWriteBytesForPhase
{
  return self->_totalToWriteBytesForPhase;
}

- (void)setTotalToWriteBytesForPhase:(unint64_t)a3
{
  self->_totalToWriteBytesForPhase = a3;
}

- (unint64_t)totalWrittenBytesUpToLastPhase
{
  return self->_totalWrittenBytesUpToLastPhase;
}

- (void)setTotalWrittenBytesUpToLastPhase:(unint64_t)a3
{
  self->_totalWrittenBytesUpToLastPhase = a3;
}

- (OS_dispatch_queue)delegateCallBackQueue
{
  return self->_delegateCallBackQueue;
}

- (int)numPendingOperations
{
  return self->_numPendingOperations;
}

- (void)setNumPendingOperations:(int)a3
{
  self->_numPendingOperations = a3;
}

- (BOOL)shouldReportDownloadFailureIfCanceled
{
  return self->_shouldReportDownloadFailureIfCanceled;
}

- (void)setShouldReportDownloadFailureIfCanceled:(BOOL)a3
{
  self->_shouldReportDownloadFailureIfCanceled = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithDelegate:forUpdate:updateUUID:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  [NSString stringWithFormat:@"init: failed to create the FSM"];
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = 138543362;
  id v4 = v0;
  OUTLINED_FUNCTION_0_3(&dword_187A54000, v1, v2, "[SUCoreUpdateDownloader] %{public}@", (uint8_t *)&v3);

  OUTLINED_FUNCTION_1();
}

- (void)initWithDelegate:(void *)a1 forUpdate:updateUUID:.cold.2(void *a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  objc_msgSend( NSString,  "stringWithFormat:",  @"init: invalid udpate descriptor, descriptor type of splat (%ld) invalid",  objc_msgSend(a1, "descriptorType"));
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = 138543362;
  uint64_t v5 = v1;
  OUTLINED_FUNCTION_0_3(&dword_187A54000, v2, v3, "[SUCoreUpdateDownloader] %{public}@", (uint8_t *)&v4);

  OUTLINED_FUNCTION_1_3();
}

- (void)initWithDelegate:(void *)a1 forUpdate:updateUUID:.cold.3(void *a1)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  objc_msgSend( NSString,  "stringWithFormat:",  @"init: invalid udpate descriptor, descriptor type (%ld) invalid",  objc_msgSend(a1, "descriptorType"));
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = 138543362;
  uint64_t v5 = v1;
  OUTLINED_FUNCTION_0_3(&dword_187A54000, v2, v3, "[SUCoreUpdateDownloader] %{public}@", (uint8_t *)&v4);

  OUTLINED_FUNCTION_1_3();
}

- (void)initWithDelegate:forUpdate:updateUUID:.cold.4()
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  objc_msgSend( NSString,  "stringWithFormat:",  @"init: invalid param, update and updateUUID must be nonnull");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  int v3 = 138543362;
  int v4 = v0;
  OUTLINED_FUNCTION_0_3(&dword_187A54000, v1, v2, "[SUCoreUpdateDownloader] %{public}@", (uint8_t *)&v3);

  OUTLINED_FUNCTION_1();
}

@end