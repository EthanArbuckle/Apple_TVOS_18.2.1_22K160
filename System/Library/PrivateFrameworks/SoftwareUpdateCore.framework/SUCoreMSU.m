@interface SUCoreMSU
+ (id)commitStash:(id)a3;
- (BOOL)applyProgressFinal;
- (BOOL)cancelingPrepare;
- (BOOL)performingOperation;
- (BOOL)prepareProgressFinal;
- (BOOL)removingPrepared;
- (MSUUpdateBrainAssetLoader)brainLoader;
- (NSString)applyProgressActionText;
- (NSString)descriptionName;
- (NSString)updateUUID;
- (OS_dispatch_queue)clientDelegateCallbackQueue;
- (OS_dispatch_queue)msuControlQueue;
- (OS_dispatch_queue)msuOperationQueue;
- (OS_os_transaction)applyUpdateTransaction;
- (OS_os_transaction)cancelPrepareTransaction;
- (OS_os_transaction)loadBrainTransaction;
- (OS_os_transaction)preflightDownloadSUTransaction;
- (OS_os_transaction)preflightFDRRecoveryTransaction;
- (OS_os_transaction)preflightPersonalizeTransaction;
- (OS_os_transaction)preflightPrerequisiteCheckTransaction;
- (OS_os_transaction)preflightWakeupTransaction;
- (OS_os_transaction)prepareUpdateTransaction;
- (OS_os_transaction)removePreparedTransaction;
- (OS_os_transaction)resumeUpdateTransaction;
- (OS_os_transaction)rollbackUpdateTransaction;
- (OS_os_transaction)suspendUpdateTransaction;
- (SUCoreDescriptor)updateDescriptor;
- (SUCoreMSU)initWithDelegate:(id)a3;
- (SUCoreMSU)initWithDelegate:(id)a3 withCallbackQueue:(id)a4;
- (SUCoreRollbackDescriptor)rollbackDescriptor;
- (float)nextProgressThreshold;
- (id)_newMSUOptionsUsingPolicy:(id)a3 descriptor:(id)a4 baseOptions:(id)a5;
- (id)_newMSURollbackOptionsUsingPolicy:(id)a3 rollbackDescriptor:(id)a4 baseOptions:(id)a5 additionalOptions:(id)a6;
- (id)_newPreflightOptionsUsingPolicy:(id)a3 subPolicyClass:(Class)a4 descriptor:(id)a5 baseOptions:(id)a6 additionalOptions:(id)a7;
- (id)_newPrepareOptionsUsingPolicy:(id)a3 descriptor:(id)a4;
- (id)_newRollbackPrepareOptionsUsingPolicy:(id)a3 rollbackDescriptor:(id)a4;
- (id)doNotPatchList;
- (id)msuDelegate;
- (int)applyProgress:(__CFDictionary *)a3;
- (int)prepareProgress:(__CFDictionary *)a3;
- (int64_t)msuHandle;
- (void)_addRemoteServerAccessControlToMSUOptions:(id)a3 usingPolicy:(id)a4;
- (void)_addUpdateMetricsEventFieldsToMSUOptions:(id)a3 usingPolicy:(id)a4 descriptor:(id)a5;
- (void)_addUpdateMetricsEventFieldsToMSURollbackOptions:(id)a3 usingPolicy:(id)a4 rollbackDescriptor:(id)a5;
- (void)_operationApplyUpdate:(id)a3;
- (void)_operationLoadBrain:(id)a3;
- (void)_operationPreflightFDRRecovery:(id)a3;
- (void)_operationPreflightPersonalize:(id)a3;
- (void)_operationPreflightPrerequisiteCheck:(id)a3;
- (void)_operationPreflightSUDownload:(id)a3;
- (void)_operationPreflightWakeup:(id)a3;
- (void)_operationPrepareUpdate:(id)a3;
- (void)_operationResumeUpdate:(id)a3;
- (void)_operationRollbackUpdateApply:(id)a3;
- (void)_operationRollbackUpdatePrepare:(id)a3;
- (void)_operationRollbackUpdateResume:(id)a3;
- (void)_operationRollbackUpdateSuspend:(id)a3;
- (void)_operationSuspendUpdate;
- (void)_removePrepared;
- (void)_reportAnomaly:(id)a3;
- (void)_reportApplied;
- (void)_reportApplyFailed:(id)a3;
- (void)_reportApplyProgress:(id)a3;
- (void)_reportBrainLoadFailed:(id)a3;
- (void)_reportBrainLoadProgress:(id)a3;
- (void)_reportBrainLoadStalled:(id)a3;
- (void)_reportBrainLoaded:(id)a3;
- (void)_reportFDRRecoveryPreflightFailed:(id)a3;
- (void)_reportFDRRecoveryPreflighted;
- (void)_reportPersonalizePreflightFailed:(id)a3;
- (void)_reportPersonalizePreflighted;
- (void)_reportPrepareFailed:(id)a3;
- (void)_reportPrepareProgress:(id)a3;
- (void)_reportPrepared:(id)a3;
- (void)_reportPrerequisiteCheckPreflightFailed:(id)a3;
- (void)_reportPrerequisiteCheckPreflighted;
- (void)_reportRemoveFailed:(id)a3;
- (void)_reportRemoved;
- (void)_reportResumeFailed:(id)a3;
- (void)_reportResumed;
- (void)_reportRollbackApplyFailed:(id)a3;
- (void)_reportRollbackApplySuccess;
- (void)_reportRollbackFailed:(id)a3;
- (void)_reportRollbackPrepareSuccess;
- (void)_reportRollbackResumeSuccess;
- (void)_reportRollbackSuspendSuccess;
- (void)_reportSUDownloadPreflightFailed:(id)a3;
- (void)_reportSUDownloadPreflighted;
- (void)_reportSuspendFailed:(id)a3;
- (void)_reportSuspended;
- (void)_reportWakeupPreflightFailed:(id)a3;
- (void)_reportWakeupPreflighted;
- (void)_trackMSUAnomaly:(id)a3 result:(int64_t)a4 description:(id)a5;
- (void)_trackMSUAnomaly:(id)a3 result:(int64_t)a4 description:(id)a5 underlying:(id)a6;
- (void)_trackMSUBegin:(id)a3;
- (void)_trackMSUEnd:(id)a3;
- (void)_trackMSUEnd:(id)a3 withResult:(int64_t)a4 withError:(id)a5;
- (void)_trackMSUOptions:(id)a3 optionsName:(id)a4 withMSUOptions:(id)a5;
- (void)applyUpdate:(id)a3;
- (void)assignDescriptor:(id)a3 updateUUID:(id)a4;
- (void)assignRollbackDescriptor:(id)a3 updateUUID:(id)a4;
- (void)cancelPrepare;
- (void)loadBrain:(id)a3;
- (void)loadBrainProgress:(id)a3 error:(id)a4;
- (void)preflightDownloadSU:(id)a3;
- (void)preflightFDRRecovery:(id)a3;
- (void)preflightPersonalize:(id)a3;
- (void)preflightPrerequisiteCheck:(id)a3;
- (void)preflightWakeup:(id)a3;
- (void)prepareUpdate:(id)a3;
- (void)removePrepared;
- (void)resumeUpdate;
- (void)resumeUpdate:(id)a3;
- (void)rollbackUpdateApply:(id)a3;
- (void)rollbackUpdatePrepare:(id)a3;
- (void)rollbackUpdateResume:(id)a3;
- (void)rollbackUpdateSuspend:(id)a3;
- (void)setApplyProgressActionText:(id)a3;
- (void)setApplyProgressFinal:(BOOL)a3;
- (void)setApplyUpdateTransaction:(id)a3;
- (void)setBrainLoader:(id)a3;
- (void)setCancelPrepareTransaction:(id)a3;
- (void)setCancelingPrepare:(BOOL)a3;
- (void)setDescriptionName:(id)a3;
- (void)setLoadBrainTransaction:(id)a3;
- (void)setMsuHandle:(int64_t)a3;
- (void)setNextProgressThreshold:(float)a3;
- (void)setPerformingOperation:(BOOL)a3;
- (void)setPreflightDownloadSUTransaction:(id)a3;
- (void)setPreflightFDRRecoveryTransaction:(id)a3;
- (void)setPreflightPersonalizeTransaction:(id)a3;
- (void)setPreflightPrerequisiteCheckTransaction:(id)a3;
- (void)setPreflightWakeupTransaction:(id)a3;
- (void)setPrepareProgressFinal:(BOOL)a3;
- (void)setPrepareUpdateTransaction:(id)a3;
- (void)setRemovePreparedTransaction:(id)a3;
- (void)setRemovingPrepared:(BOOL)a3;
- (void)setResumeUpdateTransaction:(id)a3;
- (void)setRollbackDescriptor:(id)a3;
- (void)setRollbackUpdateTransaction:(id)a3;
- (void)setSuspendUpdateTransaction:(id)a3;
- (void)setUpdateDescriptor:(id)a3;
- (void)setUpdateUUID:(id)a3;
- (void)suspendUpdate;
- (void)updatePrepareOptions:(id)a3 withPolicy:(id)a4;
@end

@implementation SUCoreMSU

- (SUCoreMSU)initWithDelegate:(id)a3
{
  return -[SUCoreMSU initWithDelegate:withCallbackQueue:](self, "initWithDelegate:withCallbackQueue:", a3, 0LL);
}

- (SUCoreMSU)initWithDelegate:(id)a3 withCallbackQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v35.receiver = self;
  v35.super_class = (Class)&OBJC_CLASS___SUCoreMSU;
  v8 = -[SUCoreMSU init](&v35, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak(&v8->_msuDelegate, v6);
    updateUUID = v9->_updateUUID;
    v9->_updateUUID = 0LL;

    descriptionName = v9->_descriptionName;
    v9->_descriptionName = (NSString *)@"NotAssigned";

    updateDescriptor = v9->_updateDescriptor;
    v9->_updateDescriptor = 0LL;

    v9->_nextProgressThreshold = 0.0;
    *(_DWORD *)&v9->_performingOperation = 0;
    v9->_applyProgressFinal = 0;
    applyProgressActionText = v9->_applyProgressActionText;
    v9->_applyProgressActionText = 0LL;

    brainLoader = v9->_brainLoader;
    v9->_brainLoader = 0LL;

    v9->_msuHandle = 0LL;
    [MEMORY[0x189612760] sharedCore];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 commonDomain];
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    id v17 = [objc_alloc(NSString) initWithFormat:@"%@.%@", v16, @"msu.control"];
    v18 = (const char *)[v17 UTF8String];
    dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    dispatch_queue_t v20 = dispatch_queue_create(v18, v19);
    msuControlQueue = v9->_msuControlQueue;
    v9->_msuControlQueue = (OS_dispatch_queue *)v20;

    if (v9->_msuControlQueue)
    {
      id v22 = [objc_alloc(NSString) initWithFormat:@"%@.%@", v16, @"msu.operation"];
      v23 = (const char *)[v22 UTF8String];
      dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v24 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
      dispatch_queue_t v25 = dispatch_queue_create(v23, v24);
      msuOperationQueue = v9->_msuOperationQueue;
      v9->_msuOperationQueue = (OS_dispatch_queue *)v25;

      if (v9->_msuOperationQueue)
      {
        [MEMORY[0x189612760] sharedCore];
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v28 = [v27 selectDelegateCallbackQueue:v7];
        clientDelegateCallbackQueue = v9->_clientDelegateCallbackQueue;
        v9->_clientDelegateCallbackQueue = (OS_dispatch_queue *)v28;

        if (initWithDelegate_withCallbackQueue__msuErrorInfoOnce != -1) {
          dispatch_once(&initWithDelegate_withCallbackQueue__msuErrorInfoOnce, &__block_literal_global_10);
        }

        goto LABEL_7;
      }

      [MEMORY[0x189612778] sharedDiag];
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      v33 = @"unable to create MSU operation dispatch queue";
    }

    else
    {
      [MEMORY[0x189612778] sharedDiag];
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      v33 = @"unable to create MSU control dispatch queue";
    }

    [v31 trackError:@"[MSU]" forReason:v33 withResult:8100 withError:0];

    v30 = 0LL;
    goto LABEL_11;
  }

uint64_t __48__SUCoreMSU_initWithDelegate_withCallbackQueue___block_invoke()
{
  uint64_t v0 = *MEMORY[0x1896115F0];
  [MEMORY[0x189612780] associateLayer:510 withDomain:*MEMORY[0x1896115F0] indicating:2 ifKeyTrue:@"MSUFullReplacementRecommened"];
  [MEMORY[0x189612780] associateLayer:512 withDomain:@"com.apple.BuildInfo.preflight.error" indicating:8 ifKeyTrue:@"BIPreflightAlternateInstallerRecommended"];
  uint64_t v1 = *MEMORY[0x1896115F8];
  [MEMORY[0x189612780] associateLayer:511 withDomain:*MEMORY[0x1896115F8]];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:1 codeName:@"MSU_ERR_BAD_SIGNATURE"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:2 codeName:@"MSU_ERR_PERSONALIZATION_FAILURE"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:3 codeName:@"MSU_ERR_FILESYSTEM_DOESNT_VERIFY"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:4 codeName:@"MSU_ERR_PENDING_UPDATE"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:5 codeName:@"MSU_ERR_NO_SUSPENDED_UPDATE"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:6 codeName:@"MSU_ERR_NONFATAL_RESIZE_FAILURE"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:7 codeName:@"MSU_ERR_INTERNAL_ERROR"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:8 codeName:@"MSU_ERR_INVALID_INFO_PLIST"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:9 codeName:@"MSU_ERR_BAD_ARGUMENT"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:10 codeName:@"MSU_ERR_UPDATE_BRAIN"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:11 codeName:@"MSU_ERR_BOOT_SETUP_FAILURE"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:12 codeName:@"MSU_ERR_CANCEL"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:13 codeName:@"MSU_ERR_FDR"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:14 codeName:@"MSU_ERR_ALLOC"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:15 codeName:@"MSU_ERR_PROGRAMMED_FAILURE"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:16 codeName:@"MSU_ERR_PREPARE_FAILURE"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:17 codeName:@"MSU_ERR_APPLY_FAILURE"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:18 codeName:@"MSU_ERR_PARALLELEXTRACTPAYLOAD"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:19 codeName:@"MSU_ERR_PARALLELAPPLYPATCHFILES"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:20 codeName:@"MSU_ERR_INSUFFICIENT_DISK_SPACE"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:21 codeName:@"MSU_ERR_CONTENT_HASHES"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:23 codeName:@"MSU_ERR_APP_DEMOTION"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:24 codeName:@"MSU_ERR_PREBRAIN_SCAN"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:25 codeName:@"MSU_ERR_PREBRAIN_DOWNLOAD"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:26 codeName:@"MSU_ERR_NO_STASHBAG"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:27 codeName:@"MSU_ERR_FAILED_BRAIN_LOAD"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:28 codeName:@"MSU_ERR_NO_BRAIN"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:29 codeName:@"MSU_ERR_PACKAGE_FAILURE"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:30 codeName:@"MSU_ERR_RETRIEVE_AP_NONCE"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:31 codeName:@"MSU_ERR_PERSONALIZATION_VERIFICATION_FAILURE"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:32 codeName:@"MSU_ERR_NETWORK"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:33 codeName:@"MSU_ERR_DEMO_MODE"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:34 codeName:@"MSU_ERR_PURGE_QUERY_FAILURE"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:35 codeName:@"MSU_ERR_LOCAL_QUERY_FAILURE"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:36 codeName:@"MSU_ERR_BRIDGE_CALLING_MA"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:37 codeName:@"MSU_ERR_RETRIEVE_UCRT_FAILED"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:38 codeName:@"MSU_ERR_COPY_DEVICE_IDENTITY"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:39 codeName:@"MSU_ERR_FAILED_TRUST_CACHE_LOAD"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:40 codeName:@"MSU_ERR_CONNECT_SOFTWAREUPDATED"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:41 codeName:@"MSU_ERR_BACKWARDS_UPDATE"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:42 codeName:@"MSU_ERR_MISSING_TARGET"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:43 codeName:@"MSU_ERR_BOOTPOLICY_FAILURE"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:44 codeName:@"MSU_ERR_BRIDGEOS_PERSONALIZATION_FAILURE"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:45 codeName:@"MSU_ERR_BRIDGEOS_PREPARE_FAILURE"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:46 codeName:@"MSU_ERR_BRIDGEOS_APPLY_FAILURE"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:47 codeName:@"MSU_ERR_LIVE_SNAPSHOT_MOUNT_FAILED"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:48 codeName:@"MSU_ERR_CREATE_SNAPSHOT_FAILED"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:49 codeName:@"MSU_ERR_SET_TARGET_SYSTEM_FAILED"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:50 codeName:@"MSU_ERR_CONFIGURE_TARGET_FAILED"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:51 codeName:@"MSU_ERR_PREP_INSTALL_TARGET_FAILED"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:52 codeName:@"MSU_ERR_GLOBAL_TICKET_NOT_FOUND"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:53 codeName:@"MSU_ERR_GLOBAL_TICKET_INVALID"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:54 codeName:@"MSU_ERR_MEDIUM_DOWNGRADE_NOT_ALLOWED"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:55 codeName:@"MSU_ERR_INTERNAL_USE_ONLY_BUILD"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:56 codeName:@"MSU_ERR_STAGE_SPLAT_FAILED"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:57 codeName:@"MSU_ERR_SPLAT_PREBOOT_UNAVAILABLE"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:58 codeName:@"MSU_ERR_ROLLBACK_UNSUPPORTED"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:59 codeName:@"MSU_ERR_ROLLBACK_UNAVAILABLE"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:60 codeName:@"MSU_ERR_STAGE_SPLAT_ROLLBACK_FAILED"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:61 codeName:@"MSU_ERR_PARALLELPATCHIMAGEINFO_FAILED"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:62 codeName:@"MSU_ERR_MOUNT_PREBOOT"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:63 codeName:@"MSU_ERR_PRESOFTWAREUPDATESTAGING"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:64 codeName:@"MSU_ERR_STAGE_SEMISPLAT_FAILED"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:65 codeName:@"MSU_ERR_IMG4_NONCE_PREROLL_FAILED"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:66 codeName:@"MSU_ERR_IMG4_NONCE_UNSUPPORTED"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:67 codeName:@"MSU_ERR_BOOTPOLICY_NONCES_CHANGED"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:801 codeName:@"MSU_ERR_BRAINLOAD_MISSING_PLIST"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:802 codeName:@"MSU_ERR_BRAINLOAD_NO_LOCATION"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:803 codeName:@"MSU_ERR_BRAINLOAD_NO_QUERY_RESULTS"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:804 codeName:@"MSU_ERR_BRAINLOAD_SORT_EXCEPTION"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:805 codeName:@"MSU_ERR_BRAINLOAD_NO_BEST_ASSET"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:806 codeName:@"MSU_ERR_BRAINLOAD_ASSET_DOWNLOAD_FAILED"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:807 codeName:@"MSU_ERR_BRAINLOAD_NO_ASSET"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:808 codeName:@"MSU_ERR_BRAINLOAD_ADJUST_FAILED"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:809 codeName:@"MSU_ERR_BRAINLOAD_ADJUST_NOT_DOWNLOADING"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:810 codeName:@"MSU_ERR_BRAINLOAD_CANCEL_FAILED"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:811 codeName:@"MSU_ERR_BRAINLOAD_QUERY_FAILED"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:812 codeName:@"MSU_ERR_BRAINLOAD_CATALOG_DOWNLOAD_FAILED"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:813 codeName:@"MSU_ERR_BRAINLOAD_PURGE_FAILED"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:814 codeName:@"MSU_ERR_BRAINLOAD_SPACE_CHECK_FAILED"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:815 codeName:@"MSU_ERR_BRAINLOAD_CANCEL_DOWNLOAD_FAILED"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:816 codeName:@"MSU_ERR_BRAINLOAD_NO_SHARED_CONNECTION"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:817 codeName:@"MSU_ERR_BRAINLOAD_NO_BRAIN_LOCATOR"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v0 withCode:818 codeName:@"MSU_ERR_BRAINLOAD_INVALID_RESPONSE"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:1 codeName:@"BIPreflightErrorMissingTargetMedia"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:2 codeName:@"BIPreflightErrorTargetIsEncrypted"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:3 codeName:@"BIPreflightErrorTargetIsNotMounted"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:4 codeName:@"BIPreflightErrorTargetIsFirewireDisk"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:5 codeName:@"BIPreflightErrorTargetIsTargetDiskMode"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:6 codeName:@"BIPreflightErrorTargetIsNotSnapshotBooted"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:7 codeName:@"BIPreflightErrorTargetIsAppleRAID"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:8 codeName:@"BIPreflightErrorTargetIsCaseSensitive"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:9 codeName:@"BIPreflightErrorDeviceNotSupported"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:10 codeName:@"BIPreflightErrorTargetNotCompatible"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:11 codeName:@"BIPreflightErrorTargetHasInvalidBAACert"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:12 codeName:@"BIPreflightErrorBaseBuildNotCompatible"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:13 codeName:@"BIPreflightErrorUpdateIsNotMounted"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:14 codeName:@"BIPreflightErrorBootIsNotMounted"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:15 codeName:@"BIPreflightErrorBootOutOfSpace" indicating:4];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:16 codeName:@"BIPreflightErrorTargetOutOfSpace" indicating:4];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:17 codeName:@"BIPreflightErrorUpdateOutOfSpace" indicating:4];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:18 codeName:@"BIPreflightErrorStatFailed"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:19 codeName:@"BIPreflightErrorInsufficientFreeSpace" indicating:4];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:20 codeName:@"BIPreflightErrorTargetIsBackupDisk"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:21 codeName:@"BIPreflightErrorDowngrade"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:22 codeName:@"BIPreflightErrorNotInstallable"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:23 codeName:@"BIPreflightErrorIsDiskUser"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:24 codeName:@"BIPreflightErrorHasInstallerUser"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:25 codeName:@"BIPreflightErrorBootVolumeIsExternal"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:26 codeName:@"BIPreflightErrorRosettaDownloadNotAllowed"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:27 codeName:@"BIPreflightErrorNetworkingRequired" indicating:1];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:28 codeName:@"BIPreflightErrorAlternateInstaller"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:29 codeName:@"BIPreflightErrorFullReplacement"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:32 codeName:@"BIPreflightErrorMacOSServerUnsupported"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:@"com.apple.BuildInfo.preflight.error" withCode:33 codeName:@"BIPreflightErrorInvalidStartupDisk"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:1 codeName:@"kAMAuthInstallErrorBadParameter"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:2 codeName:@"kAMAuthInstallErrorAllocation"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:3 codeName:@"kAMAuthInstallErrorConversion"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:4 codeName:@"kAMAuthInstallErrorFile"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:5 codeName:@"kAMAuthInstallErrorHash"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:6 codeName:@"kAMAuthInstallErrorCrypto"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:7 codeName:@"kAMAuthInstallErrorBadBuildIdentity"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:8 codeName:@"kAMAuthInstallErrorEntryNotFound"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:9 codeName:@"kAMAuthInstallErrorInvalidImg3Object"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:10 codeName:@"kAMAuthInstallErrorInvalidFlsObject"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:11 codeName:@"kAMAuthInstallErrorServerNotReachable" indicating:1];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:12 codeName:@"kAMAuthInstallErrorServerTimedOut" indicating:1];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:13 codeName:@"kAMAuthInstallErrorUnimplemented"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:14 codeName:@"kAMAuthInstallErrorInternal"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:15 codeName:@"kAMAuthInstallErrorInvalidBbfwFile"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:16 codeName:@"kAMAuthInstallErrorNetwork"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:17 codeName:@"kAMAuthInstallErrorBadResponse"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:18 codeName:@"kAMAuthInstallErrorFusingFailed"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:19 codeName:@"kAMAuthInstallErrorBBProvisioningFailed"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:20 codeName:@"kAMAuthInstallErrorAppleConnectNotFound"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:21 codeName:@"kAMAuthInstallErrorAppleConnectCanceled"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:22 codeName:@"kAMAuthInstallErrorAppleConnectAuthFailed"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:23 codeName:@"kAMAuthInstallErrorInvalidImg4Object"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:24 codeName:@"kAMAuthInstallErrorProvisioningAckFailed"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:25 codeName:@"kAMAuthInstallErrorUpdaterOperation"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:26 codeName:@"kAMAuthInstallErrorUpdaterNotFound"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:99 codeName:@"kAMAuthInstallErrorGeneric"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:3194 codeName:@"kAMAuthInstallTATSUDeclinedAuthorization" indicating:16];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:3501 codeName:@"kAMAuthInstallErrorHTTPUnauthorized"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:3503 codeName:@"kAMAuthInstallErrorHTTPForbidden"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:3504 codeName:@"kAMAuthInstallErrorHTTPNotFound"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:3507 codeName:@"kAMAuthInstallErrorHTTPProxyAuthNeeded"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:3500 codeName:@"kAMAuthInstallErrorHTTPInternalServerError"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:5000 codeName:@"kAMAuthInstallErrorZipOpenFailed"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:5001 codeName:@"kAMAuthInstallErrorZipWriteFailed"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:5002 codeName:@"kAMAuthInstallErrorZipCloseFailed"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:5003 codeName:@"kAMAuthInstallErrorZipParamError"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:5004 codeName:@"kAMAuthInstallErrorZipBadZipFile"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:5005 codeName:@"kAMAuthInstallErrorZipInternalError"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:5006 codeName:@"kAMAuthInstallErrorZipStreamError"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:5007 codeName:@"kAMAuthInstallErrorZipDataError"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:5008 codeName:@"kAMAuthInstallErrorZipMemError"];
  [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:5009 codeName:@"kAMAuthInstallErrorZipBufError"];
  return [MEMORY[0x189612780] attributesOfErrorForDomain:v1 withCode:5010 codeName:@"kAMAuthInstallErrorZipVersionError"];
}

- (void)assignDescriptor:(id)a3 updateUUID:(id)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x1896127A0] sharedLogger];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 oslog];
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v17 = self;
    __int16 v18 = 2114;
    id v19 = v7;
    __int16 v20 = 2114;
    id v21 = v6;
    _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ ASSIGN_DESCRIPTOR: Client provided updateUUID: %{public}@; descriptor: %{public}@",
      buf,
      0x20u);
  }

  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __41__SUCoreMSU_assignDescriptor_updateUUID___block_invoke;
  block[3] = &unk_18A0F03C8;
  block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v10, block);
}

void __41__SUCoreMSU_assignDescriptor_updateUUID___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  if (([*(id *)(a1 + 32) performingOperation] & 1) != 0
    || ([*(id *)(a1 + 32) cancelingPrepare] & 1) != 0
    || [*(id *)(a1 + 32) removingPrepared])
  {
    [*(id *)(a1 + 32) _trackMSUAnomaly:@"ASSIGN_DESCRIPTOR" result:8115 description:@"busy performing other MSU operation"];
    return;
  }

  [*(id *)(a1 + 32) setUpdateDescriptor:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setUpdateUUID:*(void *)(a1 + 48)];
  id v2 = objc_alloc(NSString);
  [*(id *)(a1 + 32) updateUUID];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)[v2 initWithFormat:@"[MSU(%@)]", v3];
  [*(id *)(a1 + 32) setDescriptionName:v4];

  [*(id *)(a1 + 32) updateDescriptor];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v5 descriptorType] == 2)
  {

LABEL_8:
    v8 = (void *)[objc_alloc(MEMORY[0x1896115E8]) initWithUpdateAsset:0];
    [*(id *)(a1 + 32) setBrainLoader:v8];

    goto LABEL_9;
  }

  [*(id *)(a1 + 32) updateDescriptor];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 descriptorType];

  if (v7 == 4) {
    goto LABEL_8;
  }
  [*(id *)(a1 + 32) updateDescriptor];
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v26 descriptorType] == 1)
  {
  }

  else
  {
    [*(id *)(a1 + 32) updateDescriptor];
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v28 = [v27 descriptorType];

    if (v28 != 3)
    {
      v33 = (void *)[objc_alloc(MEMORY[0x1896115E8]) initWithUpdateAsset:0];
      [*(id *)(a1 + 32) setBrainLoader:v33];

      [*(id *)(a1 + 32) _trackMSUAnomaly:@"ASSIGN_DESCRIPTOR" result:8115 description:@"method received a descriptor with unknown type; creating a brain loader anyways"];
      goto LABEL_9;
    }
  }

  id v29 = objc_alloc(MEMORY[0x1896115E8]);
  [*(id *)(a1 + 32) updateDescriptor];
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v30 softwareUpdateAsset];
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)[v29 initWithUpdateAsset:v31];
  [*(id *)(a1 + 32) setBrainLoader:v32];

LABEL_9:
  [*(id *)(a1 + 32) brainLoader];
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9) {
    [*(id *)(a1 + 32) _trackMSUAnomaly:@"ASSIGN_DESCRIPTOR" result:8100 description:@"unable to create MSU brain loader"];
  }
  id v10 = objc_alloc_init(MEMORY[0x189603FA8]);
  [MEMORY[0x1896127A0] sharedLogger];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 oslog];
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = *(void **)(a1 + 32);
    [v13 updateDescriptor];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 overviewWithMaxValueLength:96 providingSubstitutionMap:v10];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v40 = v13;
    __int16 v41 = 2114;
    v42 = v15;
    _os_log_impl( &dword_187A54000,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@ assigned update descriptor: %{public}@",  buf,  0x16u);
  }

  uint64_t v16 = a1;

  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v34 = 0u;
  __int128 v35 = 0u;
  id v17 = v10;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v35;
    do
    {
      for (uint64_t i = 0LL; i != v19; ++i)
      {
        if (*(void *)v35 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        [MEMORY[0x1896127A0] sharedLogger];
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        [v23 oslog];
        v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          dispatch_queue_t v25 = *(void **)(v16 + 32);
          *(_DWORD *)buf = 138543618;
          v40 = v25;
          __int16 v41 = 2114;
          v42 = v22;
          _os_log_impl(&dword_187A54000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
        }
      }

      uint64_t v19 = [v17 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }

    while (v19);
  }
}

- (void)assignRollbackDescriptor:(id)a3 updateUUID:(id)a4
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x1896127A0] sharedLogger];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 oslog];
  v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v17 = self;
    __int16 v18 = 2114;
    id v19 = v7;
    __int16 v20 = 2114;
    id v21 = v6;
    _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ ASSIGN_ROLLBACK_DESCRIPTOR: Client provided updateUUID: %{public}@; rollbackDescriptor: %{public}@",
      buf,
      0x20u);
  }

  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __49__SUCoreMSU_assignRollbackDescriptor_updateUUID___block_invoke;
  block[3] = &unk_18A0F03C8;
  block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_async(v10, block);
}

void __49__SUCoreMSU_assignRollbackDescriptor_updateUUID___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (([*(id *)(a1 + 32) performingOperation] & 1) != 0
    || ([*(id *)(a1 + 32) cancelingPrepare] & 1) != 0
    || [*(id *)(a1 + 32) removingPrepared])
  {
    [*(id *)(a1 + 32) _trackMSUAnomaly:@"ASSIGN_ROLLBACK_DESCRIPTOR" result:8115 description:@"busy performing other MSU operation"];
  }

  else
  {
    [*(id *)(a1 + 32) setRollbackDescriptor:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) setUpdateUUID:*(void *)(a1 + 48)];
    id v2 = objc_alloc(NSString);
    [*(id *)(a1 + 32) updateUUID];
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)[v2 initWithFormat:@"[MSU Rollback(%@)]", v3];
    [*(id *)(a1 + 32) setDescriptionName:v4];

    v5 = (void *)[objc_alloc(MEMORY[0x1896115E8]) initWithUpdateAsset:0];
    [*(id *)(a1 + 32) setBrainLoader:v5];

    [*(id *)(a1 + 32) brainLoader];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6) {
      [*(id *)(a1 + 32) _trackMSUAnomaly:@"ASSIGN_ROLLBACK_DESCRIPTOR" result:8100 description:@"unable to create MSU brain loader"];
    }
    [MEMORY[0x1896127A0] sharedLogger];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 oslog];
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v12 = v9;
      __int16 v13 = 2114;
      uint64_t v14 = v10;
      _os_log_impl( &dword_187A54000,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ assigned rollback descriptor: %{public}@",  buf,  0x16u);
    }
  }

- (void)loadBrain:(id)a3
{
  id v4 = a3;
  [MEMORY[0x189612760] beginTransactionWithName:@"msu.LoadBrain"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __23__SUCoreMSU_loadBrain___block_invoke;
  block[3] = &unk_18A0F03C8;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __23__SUCoreMSU_loadBrain___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) performingOperation] & 1) != 0
    || ([*(id *)(a1 + 32) cancelingPrepare] & 1) != 0
    || [*(id *)(a1 + 32) removingPrepared])
  {
    [*(id *)(a1 + 32) _trackMSUAnomaly:@"LOAD_BRAIN" result:8115 description:@"busy performing other MSU operation"];
    return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"msu.LoadBrain"];
  }

  else
  {
    [*(id *)(a1 + 32) setLoadBrainTransaction:*(void *)(a1 + 40)];
    return [*(id *)(a1 + 32) _operationLoadBrain:*(void *)(a1 + 48)];
  }

- (void)preflightDownloadSU:(id)a3
{
  id v4 = a3;
  [MEMORY[0x189612760] beginTransactionWithName:@"msu.PreflightDownloadSU"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __33__SUCoreMSU_preflightDownloadSU___block_invoke;
  block[3] = &unk_18A0F03C8;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __33__SUCoreMSU_preflightDownloadSU___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) performingOperation] & 1) != 0
    || ([*(id *)(a1 + 32) cancelingPrepare] & 1) != 0
    || [*(id *)(a1 + 32) removingPrepared])
  {
    [*(id *)(a1 + 32) _trackMSUAnomaly:@"PREFLIGHT_DOWNLOAD" result:8115 description:@"busy performing other MSU operation"];
    return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"msu.PreflightDownloadSU"];
  }

  else
  {
    [*(id *)(a1 + 32) setPreflightDownloadSUTransaction:*(void *)(a1 + 40)];
    return [*(id *)(a1 + 32) _operationPreflightSUDownload:*(void *)(a1 + 48)];
  }

- (void)preflightPersonalize:(id)a3
{
  id v4 = a3;
  [MEMORY[0x189612760] beginTransactionWithName:@"msu.PreflightPersonalize"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __34__SUCoreMSU_preflightPersonalize___block_invoke;
  block[3] = &unk_18A0F03C8;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __34__SUCoreMSU_preflightPersonalize___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) performingOperation] & 1) != 0
    || ([*(id *)(a1 + 32) cancelingPrepare] & 1) != 0
    || [*(id *)(a1 + 32) removingPrepared])
  {
    [*(id *)(a1 + 32) _trackMSUAnomaly:@"PREFLIGHT_PERSONALIZE" result:8115 description:@"busy performing other MSU operation"];
    return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"msu.PreflightPersonalize"];
  }

  else
  {
    [*(id *)(a1 + 32) setPreflightPersonalizeTransaction:*(void *)(a1 + 40)];
    return [*(id *)(a1 + 32) _operationPreflightPersonalize:*(void *)(a1 + 48)];
  }

- (void)preflightFDRRecovery:(id)a3
{
  id v4 = a3;
  [MEMORY[0x189612760] beginTransactionWithName:@"msu.PreflightFDRRecovery"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __34__SUCoreMSU_preflightFDRRecovery___block_invoke;
  block[3] = &unk_18A0F03C8;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __34__SUCoreMSU_preflightFDRRecovery___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) performingOperation] & 1) != 0
    || ([*(id *)(a1 + 32) cancelingPrepare] & 1) != 0
    || [*(id *)(a1 + 32) removingPrepared])
  {
    [*(id *)(a1 + 32) _trackMSUAnomaly:@"PREFLIGHT_FDR_RECOVERY" result:8115 description:@"busy performing other MSU operation"];
    return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"msu.PreflightFDRRecovery"];
  }

  else
  {
    [*(id *)(a1 + 32) setPreflightFDRRecoveryTransaction:*(void *)(a1 + 40)];
    return [*(id *)(a1 + 32) _operationPreflightFDRRecovery:*(void *)(a1 + 48)];
  }

- (void)preflightWakeup:(id)a3
{
  id v4 = a3;
  [MEMORY[0x189612760] beginTransactionWithName:@"msu.PreflightWakeup"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __29__SUCoreMSU_preflightWakeup___block_invoke;
  block[3] = &unk_18A0F03C8;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __29__SUCoreMSU_preflightWakeup___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) performingOperation] & 1) != 0
    || ([*(id *)(a1 + 32) cancelingPrepare] & 1) != 0
    || [*(id *)(a1 + 32) removingPrepared])
  {
    [*(id *)(a1 + 32) _trackMSUAnomaly:@"PREFLIGHT_WAKEUP" result:8115 description:@"busy performing other MSU operation"];
    return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"msu.PreflightWakeup"];
  }

  else
  {
    [*(id *)(a1 + 32) setPreflightWakeupTransaction:*(void *)(a1 + 40)];
    return [*(id *)(a1 + 32) _operationPreflightWakeup:*(void *)(a1 + 48)];
  }

- (void)preflightPrerequisiteCheck:(id)a3
{
  id v4 = a3;
  [MEMORY[0x189612760] beginTransactionWithName:@"msu.PreflightPrerequisiteCheck"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __40__SUCoreMSU_preflightPrerequisiteCheck___block_invoke;
  block[3] = &unk_18A0F03C8;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __40__SUCoreMSU_preflightPrerequisiteCheck___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) performingOperation] & 1) != 0
    || ([*(id *)(a1 + 32) cancelingPrepare] & 1) != 0
    || [*(id *)(a1 + 32) removingPrepared])
  {
    [*(id *)(a1 + 32) _trackMSUAnomaly:@"PREFLIGHT_PREREQUISITE_CHECK" result:8115 description:@"busy performing other MSU operation"];
    return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"msu.PreflightPrerequisiteCheck"];
  }

  else
  {
    [*(id *)(a1 + 32) setPreflightPrerequisiteCheckTransaction:*(void *)(a1 + 40)];
    return [*(id *)(a1 + 32) _operationPreflightPrerequisiteCheck:*(void *)(a1 + 48)];
  }

- (void)prepareUpdate:(id)a3
{
  id v4 = a3;
  [MEMORY[0x189612760] beginTransactionWithName:@"msu.PrepareUpdate"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __27__SUCoreMSU_prepareUpdate___block_invoke;
  block[3] = &unk_18A0F03C8;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __27__SUCoreMSU_prepareUpdate___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) performingOperation] & 1) != 0
    || ([*(id *)(a1 + 32) cancelingPrepare] & 1) != 0
    || [*(id *)(a1 + 32) removingPrepared])
  {
    [*(id *)(a1 + 32) _trackMSUAnomaly:@"PREPARE_UPDATE" result:8115 description:@"busy performing other MSU operation"];
    return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"msu.PrepareUpdate"];
  }

  else
  {
    [*(id *)(a1 + 32) setPrepareUpdateTransaction:*(void *)(a1 + 40)];
    return [*(id *)(a1 + 32) _operationPrepareUpdate:*(void *)(a1 + 48)];
  }

- (void)suspendUpdate
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __26__SUCoreMSU_suspendUpdate__block_invoke;
  v6[3] = &unk_18A0F0510;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __26__SUCoreMSU_suspendUpdate__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) performingOperation] & 1) != 0
    || ([*(id *)(a1 + 32) cancelingPrepare] & 1) != 0
    || [*(id *)(a1 + 32) removingPrepared])
  {
    [*(id *)(a1 + 32) _trackMSUAnomaly:@"SUSPEND_UPDATE" result:8115 description:@"busy performing other MSU operation"];
    return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"msu.SuspendUpdate"];
  }

  else
  {
    [*(id *)(a1 + 32) setSuspendUpdateTransaction:*(void *)(a1 + 40)];
    return [*(id *)(a1 + 32) _operationSuspendUpdate];
  }

- (void)resumeUpdate
{
}

- (void)resumeUpdate:(id)a3
{
  id v4 = a3;
  [MEMORY[0x189612760] beginTransactionWithName:@"msu.ResumeUpdate"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __26__SUCoreMSU_resumeUpdate___block_invoke;
  block[3] = &unk_18A0F03C8;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __26__SUCoreMSU_resumeUpdate___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) performingOperation] & 1) != 0
    || ([*(id *)(a1 + 32) cancelingPrepare] & 1) != 0
    || [*(id *)(a1 + 32) removingPrepared])
  {
    [*(id *)(a1 + 32) _trackMSUAnomaly:@"RESUME_UPDATE" result:8115 description:@"busy performing other MSU operation"];
    return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"msu.ResumeUpdate"];
  }

  else
  {
    [*(id *)(a1 + 32) setResumeUpdateTransaction:*(void *)(a1 + 40)];
    return [*(id *)(a1 + 32) _operationResumeUpdate:*(void *)(a1 + 48)];
  }

- (void)applyUpdate:(id)a3
{
  id v4 = a3;
  [MEMORY[0x189612760] beginTransactionWithName:@"msu.ApplyUpdate"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __25__SUCoreMSU_applyUpdate___block_invoke;
  block[3] = &unk_18A0F03C8;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __25__SUCoreMSU_applyUpdate___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) performingOperation] & 1) != 0
    || ([*(id *)(a1 + 32) cancelingPrepare] & 1) != 0
    || [*(id *)(a1 + 32) removingPrepared])
  {
    [*(id *)(a1 + 32) _trackMSUAnomaly:@"APPLY_UPDATE" result:8115 description:@"busy performing other MSU operation"];
    return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"msu.ApplyUpdate"];
  }

  else
  {
    [*(id *)(a1 + 32) setApplyUpdateTransaction:*(void *)(a1 + 40)];
    return [*(id *)(a1 + 32) _operationApplyUpdate:*(void *)(a1 + 48)];
  }

+ (id)commitStash:(id)a3
{
  return SUCoreBorder_MSUCommitStash(a3);
}

- (void)rollbackUpdatePrepare:(id)a3
{
  id v4 = a3;
  [MEMORY[0x189612760] beginTransactionWithName:@"msu.RollbackUpdate"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __35__SUCoreMSU_rollbackUpdatePrepare___block_invoke;
  block[3] = &unk_18A0F03C8;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __35__SUCoreMSU_rollbackUpdatePrepare___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) performingOperation] & 1) != 0
    || ([*(id *)(a1 + 32) cancelingPrepare] & 1) != 0
    || [*(id *)(a1 + 32) removingPrepared])
  {
    [*(id *)(a1 + 32) _trackMSUAnomaly:@"ROLLBACK_UPDATE_PREPARE" result:8115 description:@"busy performing other MSU operation"];
    return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"msu.RollbackUpdate"];
  }

  else
  {
    [*(id *)(a1 + 32) setRollbackUpdateTransaction:*(void *)(a1 + 40)];
    return [*(id *)(a1 + 32) _operationRollbackUpdatePrepare:*(void *)(a1 + 48)];
  }

- (void)rollbackUpdateSuspend:(id)a3
{
  id v4 = a3;
  [MEMORY[0x189612760] beginTransactionWithName:@"msu.RollbackUpdate"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __35__SUCoreMSU_rollbackUpdateSuspend___block_invoke;
  block[3] = &unk_18A0F03C8;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __35__SUCoreMSU_rollbackUpdateSuspend___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) performingOperation] & 1) != 0
    || ([*(id *)(a1 + 32) cancelingPrepare] & 1) != 0
    || [*(id *)(a1 + 32) removingPrepared])
  {
    [*(id *)(a1 + 32) _trackMSUAnomaly:@"ROLLBACK_UPDATE_SUSPEND" result:8115 description:@"busy performing other MSU operation"];
    return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"msu.RollbackUpdate"];
  }

  else
  {
    [*(id *)(a1 + 32) setRollbackUpdateTransaction:*(void *)(a1 + 40)];
    return [*(id *)(a1 + 32) _operationRollbackUpdateSuspend:*(void *)(a1 + 48)];
  }

- (void)rollbackUpdateResume:(id)a3
{
  id v4 = a3;
  [MEMORY[0x189612760] beginTransactionWithName:@"msu.RollbackUpdate"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __34__SUCoreMSU_rollbackUpdateResume___block_invoke;
  block[3] = &unk_18A0F03C8;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __34__SUCoreMSU_rollbackUpdateResume___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) performingOperation] & 1) != 0
    || ([*(id *)(a1 + 32) cancelingPrepare] & 1) != 0
    || [*(id *)(a1 + 32) removingPrepared])
  {
    [*(id *)(a1 + 32) _trackMSUAnomaly:@"ROLLBACK_UPDATE_RESUME" result:8115 description:@"busy performing other MSU operation"];
    return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"msu.RollbackUpdate"];
  }

  else
  {
    [*(id *)(a1 + 32) setRollbackUpdateTransaction:*(void *)(a1 + 40)];
    return [*(id *)(a1 + 32) _operationRollbackUpdateResume:*(void *)(a1 + 48)];
  }

- (void)rollbackUpdateApply:(id)a3
{
  id v4 = a3;
  [MEMORY[0x189612760] beginTransactionWithName:@"msu.RollbackUpdate"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __33__SUCoreMSU_rollbackUpdateApply___block_invoke;
  block[3] = &unk_18A0F03C8;
  block[4] = self;
  id v10 = v5;
  id v11 = v4;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(v6, block);
}

uint64_t __33__SUCoreMSU_rollbackUpdateApply___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) performingOperation] & 1) != 0
    || ([*(id *)(a1 + 32) cancelingPrepare] & 1) != 0
    || [*(id *)(a1 + 32) removingPrepared])
  {
    [*(id *)(a1 + 32) _trackMSUAnomaly:@"ROLLBACK_UPDATE_APPLY" result:8115 description:@"busy performing other MSU operation"];
    return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"msu.RollbackUpdate"];
  }

  else
  {
    [*(id *)(a1 + 32) setRollbackUpdateTransaction:*(void *)(a1 + 40)];
    return [*(id *)(a1 + 32) _operationRollbackUpdateApply:*(void *)(a1 + 48)];
  }

- (void)cancelPrepare
{
  v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __26__SUCoreMSU_cancelPrepare__block_invoke;
  block[3] = &unk_18A0EF970;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __26__SUCoreMSU_cancelPrepare__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  if (([*(id *)(a1 + 32) cancelingPrepare] & 1) != 0
    || [*(id *)(a1 + 32) removingPrepared])
  {
    id v2 = *(void **)(a1 + 32);
    v3 = @"busy performing other MSU operation";
    return [v2 _trackMSUAnomaly:@"CANCEL_PREPARE" result:8115 description:v3];
  }

  if (([*(id *)(a1 + 32) performingOperation] & 1) == 0)
  {
    id v2 = *(void **)(a1 + 32);
    v3 = @"not performing any MSU operation";
    return [v2 _trackMSUAnomaly:@"CANCEL_PREPARE" result:8115 description:v3];
  }

  [MEMORY[0x1896127A0] sharedLogger];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 oslog];
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = 138543362;
    uint64_t v9 = v7;
    _os_log_impl( &dword_187A54000,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ will request that prepare be canceled [with result provided back to MSU on prepare progress as mechanis m for requesting cancel]",  (uint8_t *)&v8,  0xCu);
  }

  return [*(id *)(a1 + 32) setCancelingPrepare:1];
}

- (void)removePrepared
{
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __27__SUCoreMSU_removePrepared__block_invoke;
  v6[3] = &unk_18A0F0510;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t __27__SUCoreMSU_removePrepared__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) performingOperation] & 1) != 0
    || ([*(id *)(a1 + 32) cancelingPrepare] & 1) != 0
    || [*(id *)(a1 + 32) removingPrepared])
  {
    [*(id *)(a1 + 32) _trackMSUAnomaly:@"REMOVE_PREPARED" result:8115 description:@"busy performing other MSU operation"];
    return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"msu.RemovePrepared"];
  }

  else
  {
    [*(id *)(a1 + 32) setRemovePreparedTransaction:*(void *)(a1 + 40)];
    return [*(id *)(a1 + 32) _removePrepared];
  }

- (void)_addUpdateMetricsEventFieldsToMSUOptions:(id)a3 usingPolicy:(id)a4 descriptor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[SUCoreMSU updateUUID](self, "updateUUID");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    [MEMORY[0x189612778] sharedDiag];
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    [v15 trackAnomaly:@"NEW_UPDATE_METRIC_EVENT_FIELDS" forReason:@"Could not get everything needed to provide a sessionID on for update metric event fields (missing updateUUID)" withResult:8116 withError:0];
    goto LABEL_25;
  }

  uint64_t v13 = *MEMORY[0x189611760];
  [v8 safeObjectForKey:*MEMORY[0x189611760] ofClass:objc_opt_class()];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = (id)[v14 mutableCopy];

  if (!v15) {
    id v15 = objc_alloc_init(MEMORY[0x189603FC8]);
  }
  [v8 setSafeObject:MEMORY[0x189604A88] forKey:*MEMORY[0x1896116F8]];
  -[SUCoreMSU updateUUID](self, "updateUUID");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 setSafeObject:v16 forKey:*MEMORY[0x189611738]];

  [v9 updateMetricContext];
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 setSafeObject:v17 forKey:*MEMORY[0x189612938]];

  [v10 productBuildVersion];
  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    [v10 productBuildVersion];
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 setSafeObject:v19 forKey:*MEMORY[0x189611640]];
  }

  [v9 updateMetricEventFields];
  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    [v9 updateMetricEventFields];
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 setSafeObject:v21 forKey:*MEMORY[0x1896116B8]];
  }

  -[SUCoreMSU updateDescriptor](self, "updateDescriptor");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v22 descriptorType] == 1)
  {
  }

  else
  {
    v23 = -[SUCoreMSU updateDescriptor](self, "updateDescriptor");
    uint64_t v24 = [v23 descriptorType];

    if (v24 != 3)
    {
      if ([v10 descriptorType] == 2 || objc_msgSend(v10, "descriptorType") == 4)
      {
        [v10 bundleAttributes];
        v26 = (void *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        v26 = 0LL;
      }

      goto LABEL_17;
    }
  }

  [v10 softwareUpdateAsset];
  dispatch_queue_t v25 = (void *)objc_claimAutoreleasedReturnValue();
  [v25 attributes];
  v26 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  [v26 safeObjectForKey:@"_EventRecordingServiceURL" ofClass:objc_opt_class()];
  id v27 = (id)objc_claimAutoreleasedReturnValue();
  if (!v27) {
    id v27 = (id)*MEMORY[0x189612A00];
  }
  [v8 setSafeObject:v27 forKey:@"_EventRecordingServiceURL"];
  [v15 setSafeObject:v27 forKey:@"_EventRecordingServiceURL"];
  if ([v10 descriptorType] == 4)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v28 oslog];
    id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v30 = 0;
      _os_log_impl( &dword_187A54000,  v29,  OS_LOG_TYPE_DEFAULT,  "Not setting update attributes for the SUCoreDescriptorTypeSFRPackage descriptor type",  v30,  2u);
    }
  }

  else
  {
    [v8 setSafeObject:v15 forKey:v13];
  }

LABEL_25:
}

- (void)_addUpdateMetricsEventFieldsToMSURollbackOptions:(id)a3 usingPolicy:(id)a4 rollbackDescriptor:(id)a5
{
  id v25 = a3;
  id v8 = a4;
  id v9 = a5;
  -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v10);

  -[SUCoreMSU updateUUID](self, "updateUUID");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    uint64_t v12 = *MEMORY[0x189611760];
    [v25 safeObjectForKey:*MEMORY[0x189611760] ofClass:objc_opt_class()];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = (id)[v13 mutableCopy];

    if (!v14) {
      id v14 = objc_alloc_init(MEMORY[0x189603FC8]);
    }
    -[SUCoreMSU updateUUID](self, "updateUUID");
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 setSafeObject:v15 forKey:*MEMORY[0x189611738]];

    [v8 updateMetricContext];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 setSafeObject:v16 forKey:*MEMORY[0x189612938]];

    [v14 setSafeObject:*MEMORY[0x1896129C0] forKey:*MEMORY[0x189612980]];
    [v9 productBuildVersion];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      [v9 productBuildVersion];
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 setSafeObject:v18 forKey:*MEMORY[0x189611640]];
    }

    [v9 restoreVersion];
    id v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      [v9 restoreVersion];
      __int16 v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 setSafeObject:v20 forKey:*MEMORY[0x189611700]];
    }

    [v8 updateMetricEventFields];
    id v21 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v22 = v25;
    if (v21)
    {
      [v8 updateMetricEventFields];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 setSafeObject:v23 forKey:*MEMORY[0x1896116B8]];

      uint64_t v22 = v25;
    }

    uint64_t v24 = *MEMORY[0x189612A00];
    [v22 setSafeObject:*MEMORY[0x189612A00] forKey:@"_EventRecordingServiceURL"];
    [v14 setSafeObject:v24 forKey:@"_EventRecordingServiceURL"];
    [v25 setSafeObject:v14 forKey:v12];
  }

  else
  {
    [MEMORY[0x189612778] sharedDiag];
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    [v14 trackAnomaly:@"NEW_UPDATE_METRIC_EVENT_FIELDS" forReason:@"Could not get everything needed to provide a sessionID on for update metric event fields (missing updateUUID)" withResult:8116 withError:0];
  }
}

- (void)_addRemoteServerAccessControlToMSUOptions:(id)a3 usingPolicy:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  [v6 personalizationServerURL];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 setSafeObject:v8 forKey:*MEMORY[0x1896116E0]];

  [v6 proxyHostName];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
  }

  else
  {
    [v6 proxyPortNumber];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10) {
      goto LABEL_8;
    }
  }

  id v11 = objc_alloc_init(MEMORY[0x189603FC8]);
  if (v11)
  {
    [v6 proxyHostName];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 setSafeObject:v12 forKey:@"SOCKSProxy"];

    [v6 proxyPortNumber];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 setSafeObject:v13 forKey:@"SOCKSPort"];

    [v15 setSafeObject:v11 forKey:*MEMORY[0x189611718]];
  }

  else
  {
    [MEMORY[0x189612778] sharedDiag];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 trackAnomaly:@"ADD_REMOTE_SERVER_ACCESS_CONTROL_TO_MSU_OPTIONS" forReason:@"could not create proxy dictionary" withResult:8100 withError:0];
  }

LABEL_8:
}

- (id)_newMSUOptionsUsingPolicy:(id)a3 descriptor:(id)a4 baseOptions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[SUCoreMSU updateUUID](self, "updateUUID");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    [MEMORY[0x189612778] sharedDiag];
    id v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 trackAnomaly:@"NEW_MSU_OPTIONS" forReason:@"Could not get everything needed to provide a sessionID creation of MSU options (missing updateUUID)" withResult:8116 withError:0];

    id v14 = 0LL;
    goto LABEL_55;
  }

  id v13 = objc_alloc_init(MEMORY[0x189603FC8]);
  id v14 = v13;
  if (v10) {
    [v13 addEntriesFromDictionary:v10];
  }
  id v15 = (void *)objc_opt_new();
  -[SUCoreMSU updateDescriptor](self, "updateDescriptor");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 updateBrainPath];
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = *MEMORY[0x189611600];
  [v15 setSafeObject:v17 forKey:*MEMORY[0x189611600]];

  [MEMORY[0x189612770] sharedDevice];
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v19 isBootedOSSecureInternal])
  {
    [v8 updateBrainLocationOverride];
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20) {
      goto LABEL_10;
    }
    [MEMORY[0x1896127A0] sharedLogger];
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 oslog];
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[SUCoreMSU _newMSUOptionsUsingPolicy:descriptor:baseOptions:].cold.1(v8, v22);
    }

    [v8 updateBrainLocationOverride];
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 setSafeObject:v19 forKey:v18];
  }

LABEL_10:
  if ([v9 descriptorType] == 4)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 oslog];
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_187A54000,  v24,  OS_LOG_TYPE_DEFAULT,  "Not setting update attributes for the SUCoreDescriptorTypeSFRPackage descriptor type",  buf,  2u);
    }
  }

  else
  {
    [v14 setSafeObject:v15 forKey:*MEMORY[0x189611760]];
  }

  v85 = v15;
  -[SUCoreMSU _addUpdateMetricsEventFieldsToMSUOptions:usingPolicy:descriptor:]( self,  "_addUpdateMetricsEventFieldsToMSUOptions:usingPolicy:descriptor:",  v14,  v8,  v9);
  -[SUCoreMSU _addRemoteServerAccessControlToMSUOptions:usingPolicy:]( self,  "_addRemoteServerAccessControlToMSUOptions:usingPolicy:",  v14,  v8);
  [v8 updateMetricEventFields];
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 setSafeObject:v26 forKey:*MEMORY[0x1896116B8]];

  [v8 userAgentString];
  id v27 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 setSafeObject:v27 forKey:*MEMORY[0x189611740]];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(v8, "performPreflightEncryptedCheck"));
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 setSafeObject:v28 forKey:*MEMORY[0x189611768]];

  objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(v8, "performPreflightSnapshotCheck"));
  id v29 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 setSafeObject:v29 forKey:*MEMORY[0x189611770]];

  [v8 ssoToken];
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    id v31 = objc_alloc_init(MEMORY[0x189603FC8]);
    [v8 ssoToken];
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v33 = *MEMORY[0x189611618];
    [v31 setSafeObject:v32 forKey:*MEMORY[0x189611618]];

    [v14 setSafeObject:v31 forKey:*MEMORY[0x189611610]];
    [v8 ssoToken];
    __int128 v34 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 setSafeObject:v34 forKey:v33];
  }

  [v8 personalizedManifestRootsPath];
  __int128 v35 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 setSafeObject:v35 forKey:*MEMORY[0x1896116E8]];

  [v8 localAuthenticationContext];
  __int128 v36 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 setSafeObject:v36 forKey:*MEMORY[0x1896116C8]];

  [v8 localAuthenticationUserID];
  __int128 v37 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 setSafeObject:v37 forKey:*MEMORY[0x1896116D0]];

  [v8 mdmBootstrapToken];
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 setSafeObject:v38 forKey:*MEMORY[0x1896116D8]];

  int v39 = [v8 bridgeOSIgnoreMinimumVersionCheck];
  uint64_t v40 = MEMORY[0x189604A80];
  uint64_t v41 = MEMORY[0x189604A88];
  if (v39) {
    uint64_t v42 = MEMORY[0x189604A88];
  }
  else {
    uint64_t v42 = MEMORY[0x189604A80];
  }
  [v14 setSafeObject:v42 forKey:*MEMORY[0x189611638]];
  [v8 bridgeOSDownloadDirectory];
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 setSafeObject:v43 forKey:*MEMORY[0x189611630]];

  else {
    uint64_t v44 = v40;
  }
  [v14 setSafeObject:v44 forKey:*MEMORY[0x1896116A0]];
  else {
    uint64_t v45 = v40;
  }
  [v14 setSafeObject:v45 forKey:*MEMORY[0x189611698]];
  else {
    uint64_t v46 = v40;
  }
  [v14 setSafeObject:v46 forKey:*MEMORY[0x1896116B0]];
  else {
    uint64_t v47 = v40;
  }
  [v14 setSafeObject:v47 forKey:*MEMORY[0x189611748]];
  else {
    uint64_t v48 = v40;
  }
  [v14 setSafeObject:v48 forKey:*MEMORY[0x189611710]];
  objc_msgSend(MEMORY[0x189607968], "numberWithUnsignedInt:", objc_msgSend(v8, "qualityOfService"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 setSafeObject:v49 forKey:*MEMORY[0x1896116F0]];

  [v8 targetVolumeUUID];
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 setSafeObject:v50 forKey:*MEMORY[0x189611730]];

  [v8 prerequisiteBuildVersion];
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 setSafeObject:v51 forKey:*MEMORY[0x189611628]];

  [MEMORY[0x189612770] sharedDevice];
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  [v52 rootVolumeUUID];
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 setSafeObject:v53 forKey:*MEMORY[0x189611620]];

  [v8 targetVolumeUUID];
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 setSafeObject:v54 forKey:*MEMORY[0x189611648]];

  if ([v9 descriptorType] == 2)
  {
    [v9 updateBundlePath];
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 setSafeObject:v55 forKey:*MEMORY[0x189611720]];
LABEL_48:

    goto LABEL_49;
  }

  if ([v9 descriptorType] == 1)
  {
    [v9 softwareUpdateAsset];
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    id v57 = [v56 getLocalUrl];
    v55 = (void *)[v57 fileSystemRepresentation];

    if (v55)
    {
      [NSString stringWithUTF8String:v55];
      v55 = (void *)objc_claimAutoreleasedReturnValue();
    }

    [v14 setSafeObject:v55 forKey:*MEMORY[0x189611720]];
    uint64_t v58 = [v9 associatedSplatDescriptor];
    if (v58)
    {
      v59 = (void *)v58;
      [v9 associatedSplatDescriptor];
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v61 = [v60 descriptorType];

      if (v61 == 1)
      {
        [v9 associatedSplatDescriptor];
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        [v62 softwareUpdateAsset];
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        [v63 refreshState];

        [v9 associatedSplatDescriptor];
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        [v64 softwareUpdateAsset];
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        int v66 = [v65 wasLocal];

        if (v66)
        {
          [v9 associatedSplatDescriptor];
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          [v84 softwareUpdateAsset];
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          id v68 = [v67 getLocalUrl];
          v69 = (void *)[v68 fileSystemRepresentation];

          if (v69)
          {
            [NSString stringWithUTF8String:v69];
            v69 = (void *)objc_claimAutoreleasedReturnValue();
          }

          [v14 setSafeObject:v69 forKey:@"SplatComboBundlePath"];
        }

        [v9 associatedSplatDescriptor];
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        [v70 bundleAttributes];
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 setSafeObject:v71 forKey:@"__msu-splat-combo-update-attributes-dictionary-key"];
      }
    }

    goto LABEL_48;
  }

- (id)_newMSURollbackOptionsUsingPolicy:(id)a3 rollbackDescriptor:(id)a4 baseOptions:(id)a5 additionalOptions:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = -[SUCoreMSU _newMSUOptionsUsingPolicy:descriptor:baseOptions:]( self,  "_newMSUOptionsUsingPolicy:descriptor:baseOptions:",  v12,  0LL,  a5);
  -[SUCoreMSU _addUpdateMetricsEventFieldsToMSURollbackOptions:usingPolicy:rollbackDescriptor:]( self,  "_addUpdateMetricsEventFieldsToMSURollbackOptions:usingPolicy:rollbackDescriptor:",  v13,  v12,  v11);

  [v13 setSafeObject:MEMORY[0x189604A88] forKey:*MEMORY[0x189611708]];
  [v13 setSafeObject:MEMORY[0x189604A80] forKey:*MEMORY[0x1896116F8]];
  [v13 addEntriesFromDictionary:v10];

  return v13;
}

- (id)_newPreflightOptionsUsingPolicy:(id)a3 subPolicyClass:(Class)a4 descriptor:(id)a5 baseOptions:(id)a6 additionalOptions:(id)a7
{
  id v12 = a7;
  id v13 = -[SUCoreMSU _newMSUOptionsUsingPolicy:descriptor:baseOptions:]( self,  "_newMSUOptionsUsingPolicy:descriptor:baseOptions:",  a3,  a5,  a6);
  if ((Class)objc_opt_class() == a4 || (Class)objc_opt_class() == a4) {
    [v13 setSafeObject:MEMORY[0x189604A88] forKey:*MEMORY[0x1896116C0]];
  }
  [v13 addEntriesFromDictionary:v12];

  return v13;
}

- (id)_newPrepareOptionsUsingPolicy:(id)a3 descriptor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 preparePolicy];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 basePrepareOptions];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = -[SUCoreMSU _newMSUOptionsUsingPolicy:descriptor:baseOptions:]( self,  "_newMSUOptionsUsingPolicy:descriptor:baseOptions:",  v7,  v6,  v9);

  -[SUCoreMSU updatePrepareOptions:withPolicy:](self, "updatePrepareOptions:withPolicy:", v10, v7);
  return v10;
}

- (id)_newRollbackPrepareOptionsUsingPolicy:(id)a3 rollbackDescriptor:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [v7 rollbackPolicy];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 baseRollbackOptions];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 rollbackPolicy];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 additionalOptions];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = -[SUCoreMSU _newMSURollbackOptionsUsingPolicy:rollbackDescriptor:baseOptions:additionalOptions:]( self,  "_newMSURollbackOptionsUsingPolicy:rollbackDescriptor:baseOptions:additionalOptions:",  v7,  v6,  v9,  v11);

  -[SUCoreMSU updatePrepareOptions:withPolicy:](self, "updatePrepareOptions:withPolicy:", v12, v7);
  [v7 updateRollbackOptionsWithExtensions:v12];

  return v12;
}

- (void)updatePrepareOptions:(id)a3 withPolicy:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  -[SUCoreMSU doNotPatchList](self, "doNotPatchList");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = *MEMORY[0x189611690];
  [v16 safeObjectForKey:*MEMORY[0x189611690] ofClass:objc_opt_class()];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    id v10 = v9;
    [v9 arrayByAddingObjectsFromArray:v7];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x189604010] setWithArray:v11];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 allObjects];
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v13 = v7;
  }

  [v16 setSafeObject:v13 forKey:v8];
  -[SUCoreMSU _addRemoteServerAccessControlToMSUOptions:usingPolicy:]( self,  "_addRemoteServerAccessControlToMSUOptions:usingPolicy:",  v16,  v6);
  [v6 preparePolicy];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();

  [v14 additionalOptions];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 addEntriesFromDictionary:v15];
}

- (id)doNotPatchList
{
  return &unk_18A112700;
}

- (void)_operationLoadBrain:(id)a3
{
  id v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU brainLoader](self, "brainLoader");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SUCoreMSU setPerformingOperation:](self, "setPerformingOperation:", 1LL);
    -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __33__SUCoreMSU__operationLoadBrain___block_invoke;
    v10[3] = &unk_18A0F0510;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }

  else
  {
    [MEMORY[0x189612760] sharedCore];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 buildError:8102 underlying:0 description:@"Missing required brain loader when attempting to load an update brain"];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreMSU _reportBrainLoadFailed:](self, "_reportBrainLoadFailed:", v9);

    -[SUCoreMSU setPerformingOperation:](self, "setPerformingOperation:", 0LL);
  }
}

void __33__SUCoreMSU__operationLoadBrain___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  [v2 updateDescriptor];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v5 = (void *)[v2 _newMSUOptionsUsingPolicy:v3 descriptor:v4 baseOptions:0];

  id v6 = (void *)objc_opt_new();
  if (v6)
  {
    id v7 = *(void **)(a1 + 40);
    if (v7)
    {
      [v7 loadBrainPolicy];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setDiscretionary:", objc_msgSend(v8, "discretionary"));

      [*(id *)(a1 + 40) loadBrainPolicy];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAllowsCellularAccess:", objc_msgSend(v9, "allowsCellular"));

      [*(id *)(a1 + 40) loadBrainPolicy];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setLiveServerCatalogOnly:", objc_msgSend(v10, "liveServerCatalogOnly"));

      if ([*(id *)(a1 + 40) isSupervisedPolicy])
      {
        [v6 setSupervised:1];
        [*(id *)(a1 + 32) updateDescriptor];
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 productVersion];
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v6 setRequestedProductVersion:v12];
      }

      [v6 additionalServerParams];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      id v14 = (void *)[v13 mutableCopy];
      id v15 = v14;
      if (v14) {
        id v16 = v14;
      }
      else {
        id v16 = objc_alloc_init(MEMORY[0x189603FC8]);
      }
      id v17 = v16;

      [*(id *)(a1 + 40) loadBrainPolicy];
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 additionalOptions];
      id v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        [*(id *)(a1 + 40) loadBrainPolicy];
        __int16 v20 = (void *)objc_claimAutoreleasedReturnValue();
        [v20 additionalOptions];
        id v21 = (void *)objc_claimAutoreleasedReturnValue();
        [v17 addEntriesFromDictionary:v21];
      }

      [v6 setAdditionalServerParams:v17];
    }

    else
    {
      [v6 setDiscretionary:0];
      [v6 setAllowsCellularAccess:0];
    }

    [*(id *)(a1 + 32) updateDescriptor];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      [*(id *)(a1 + 32) updateDescriptor];
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 assetAudienceUUID];
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        [*(id *)(a1 + 32) updateDescriptor];
        id v25 = (void *)objc_claimAutoreleasedReturnValue();
        [v25 assetAudienceUUID];
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        id v27 = (void *)[v26 copy];
        [v6 setLiveAssetAudienceUUID:v27];
      }
    }
  }

  else
  {
    [*(id *)(a1 + 32) _trackMSUAnomaly:@"LOAD_BRAIN" result:8100 description:@"unable to create download options - using default"];
  }

  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v28 oslog];
  id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = *(void **)(a1 + 32);
    [v30 brainLoader];
    id v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = @"YES";
    *(_DWORD *)buf = 138543874;
    __int128 v36 = v30;
    __int16 v37 = 2114;
    if (!v31) {
      v32 = @"NO";
    }
    v38 = v6;
    __int16 v39 = 2114;
    uint64_t v40 = v32;
    _os_log_impl( &dword_187A54000,  v29,  OS_LOG_TYPE_DEFAULT,  "%{public}@ loading brain with download options: %{public}@; brain loader present: %{public}@",
      buf,
      0x20u);
  }

  [*(id *)(a1 + 32) _trackMSUBegin:@"loadUpdateBrainWithMAOptions"];
  [*(id *)(a1 + 32) brainLoader];
  uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1895F87A8];
  v34[1] = 3221225472LL;
  v34[2] = __33__SUCoreMSU__operationLoadBrain___block_invoke_650;
  v34[3] = &unk_18A0F1760;
  v34[4] = *(void *)(a1 + 32);
  objc_msgSend(v33, "SUCoreBorder_loadUpdateBrainWithMAOptions:clientOptionsFromPolicy:progressHandler:", v6, v5, v34);
}

uint64_t __33__SUCoreMSU__operationLoadBrain___block_invoke_650(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) loadBrainProgress:a2 error:a3];
}

- (void)_operationPreflightSUDownload:(id)a3
{
  id v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU updateDescriptor](self, "updateDescriptor");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    [MEMORY[0x189612760] sharedCore];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 buildError:8803 underlying:0 description:@"Missing required descriptor for PreflightSUDownload"];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreMSU _reportSUDownloadPreflightFailed:](self, "_reportSUDownloadPreflightFailed:", v16);
    goto LABEL_8;
  }

  -[SUCoreMSU updateDescriptor](self, "updateDescriptor");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v7 descriptorType] == 1) {
    goto LABEL_5;
  }
  -[SUCoreMSU updateDescriptor](self, "updateDescriptor");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 descriptorType];

  if (v9 != 3)
  {
    id v10 = objc_alloc(NSString);
    -[SUCoreMSU updateDescriptor](self, "updateDescriptor");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUCoreDescriptor nameForDescriptorType:]( SUCoreDescriptor,  "nameForDescriptorType:",  [v11 descriptorType]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v7 = (void *)[v10 initWithFormat:@"Unexpected descriptor type %@, expecting SUCoreDescriptorTypeAsset or SUCoreDescriptorTypeSFRAsset", v12];

    [MEMORY[0x189612778] sharedDiag];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 trackAnomaly:@"PreflightSUDownload" forReason:v7 withResult:8116 withError:0];

LABEL_5:
  }

  -[SUCoreMSU setPerformingOperation:](self, "setPerformingOperation:", 1LL);
  -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
  id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __43__SUCoreMSU__operationPreflightSUDownload___block_invoke;
  block[3] = &unk_18A0F0510;
  block[4] = self;
  id v18 = v4;
  dispatch_async(v14, block);

LABEL_8:
}

void __43__SUCoreMSU__operationPreflightSUDownload___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v2 descriptorType] == 2)
  {

LABEL_4:
    [MEMORY[0x189612778] sharedDiag];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 trackAnomaly:@"MSUPreflightSUDownload" forReason:@"The descriptor specified a package type which is not expected for download preflight" withResult:8116 withError:0];

    goto LABEL_5;
  }

  [*(id *)(a1 + 32) updateDescriptor];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 descriptorType];

  if (v4 == 4) {
    goto LABEL_4;
  }
LABEL_5:
  id v6 = *(void **)(a1 + 32);
  id v7 = *(void **)(a1 + 40);
  [v7 downloadPreflightPolicy];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = objc_opt_class();
  [*(id *)(a1 + 32) updateDescriptor];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) softwareUpdateDownloadPolicy];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 basePreflightOptions];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) softwareUpdateDownloadPolicy];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 additionalOptions];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = (void *)[v6 _newPreflightOptionsUsingPolicy:v7 subPolicyClass:v9 descriptor:v10 baseOptions:v12 additionalOptions:v14];

  [*(id *)(a1 + 32) _trackMSUOptions:@"performing MSU preflight (download)" optionsName:@"preflightOptions" withMSUOptions:v15];
  [*(id *)(a1 + 32) _trackMSUBegin:@"MSUPreflightUpdate"];
  SUCoreBorder_MSUPreflightUpdate(4LL, v15);
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) msuControlQueue];
  id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __43__SUCoreMSU__operationPreflightSUDownload___block_invoke_2;
  v20[3] = &unk_18A0F0510;
  uint64_t v18 = *(void *)(a1 + 32);
  id v21 = v16;
  uint64_t v22 = v18;
  id v19 = v16;
  dispatch_async(v17, v20);
}

uint64_t __43__SUCoreMSU__operationPreflightSUDownload___block_invoke_2(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "_reportSUDownloadPreflightFailed:");
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = [*(id *)(a1 + 32) code];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = v4;
  }

  else
  {
    [v2 _reportSUDownloadPreflighted];
    id v7 = *(void **)(a1 + 40);
    uint64_t v5 = 0LL;
    uint64_t v6 = 0LL;
  }

  [v7 _trackMSUEnd:@"MSUPreflightUpdate" withResult:v5 withError:v6];
  return [*(id *)(a1 + 40) setPerformingOperation:0];
}

- (void)_operationPreflightPersonalize:(id)a3
{
  id v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU updateDescriptor](self, "updateDescriptor");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SUCoreMSU setPerformingOperation:](self, "setPerformingOperation:", 1LL);
    -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __44__SUCoreMSU__operationPreflightPersonalize___block_invoke;
    v10[3] = &unk_18A0F0510;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }

  else
  {
    [MEMORY[0x189612760] sharedCore];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 buildError:8803 underlying:0 description:@"Missing required descriptor for PreflightPersonalize"];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreMSU _reportPersonalizePreflightFailed:](self, "_reportPersonalizePreflightFailed:", v9);
  }
}

void __44__SUCoreMSU__operationPreflightPersonalize___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  [v3 personalizePreflightPolicy];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = objc_opt_class();
  [*(id *)(a1 + 32) updateDescriptor];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) personalizePreflightPolicy];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 basePreflightOptions];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) personalizePreflightPolicy];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 additionalOptions];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = (void *)[v2 _newPreflightOptionsUsingPolicy:v3 subPolicyClass:v5 descriptor:v6 baseOptions:v8 additionalOptions:v10];

  [*(id *)(a1 + 32) _trackMSUOptions:@"performing MSU preflight (personalize)" optionsName:@"preflightOptions" withMSUOptions:v11];
  [*(id *)(a1 + 32) _trackMSUBegin:@"MSUPreflightUpdate"];
  SUCoreBorder_MSUPreflightUpdate(2LL, v11);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) msuControlQueue];
  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __44__SUCoreMSU__operationPreflightPersonalize___block_invoke_2;
  v16[3] = &unk_18A0F0510;
  uint64_t v14 = *(void *)(a1 + 32);
  id v17 = v12;
  uint64_t v18 = v14;
  id v15 = v12;
  dispatch_async(v13, v16);
}

uint64_t __44__SUCoreMSU__operationPreflightPersonalize___block_invoke_2(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "_reportPersonalizePreflightFailed:");
    id v4 = *(void **)(a1 + 40);
    uint64_t v5 = [*(id *)(a1 + 32) code];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = v4;
  }

  else
  {
    [v2 _reportPersonalizePreflighted];
    id v7 = *(void **)(a1 + 40);
    uint64_t v5 = 0LL;
    uint64_t v6 = 0LL;
  }

  [v7 _trackMSUEnd:@"MSUPreflightUpdate" withResult:v5 withError:v6];
  return [*(id *)(a1 + 40) setPerformingOperation:0];
}

- (void)_operationPreflightFDRRecovery:(id)a3
{
  id v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU updateDescriptor](self, "updateDescriptor");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SUCoreMSU setPerformingOperation:](self, "setPerformingOperation:", 1LL);
    -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __44__SUCoreMSU__operationPreflightFDRRecovery___block_invoke;
    v10[3] = &unk_18A0F0510;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }

  else
  {
    [MEMORY[0x189612760] sharedCore];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 buildError:8803 underlying:0 description:@"Missing required descriptor for PreflightFDRRecovery"];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreMSU _reportFDRRecoveryPreflightFailed:](self, "_reportFDRRecoveryPreflightFailed:", v9);
  }
}

void __44__SUCoreMSU__operationPreflightFDRRecovery___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  [v3 fdrRecoveryPreflightPolicy];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = objc_opt_class();
  [*(id *)(a1 + 32) updateDescriptor];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) fdrRecoveryPreflightPolicy];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 basePreflightOptions];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) fdrRecoveryPreflightPolicy];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 additionalOptions];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = (void *)[v2 _newPreflightOptionsUsingPolicy:v3 subPolicyClass:v5 descriptor:v6 baseOptions:v8 additionalOptions:v10];

  [*(id *)(a1 + 32) _trackMSUOptions:@"performing MSU preflight (FDRRecovery)" optionsName:@"preflightOptions" withMSUOptions:v11];
  [*(id *)(a1 + 32) _trackMSUBegin:@"MSUPreflightUpdate"];
  SUCoreBorder_MSUPreflightUpdate(3LL, v11);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) msuControlQueue];
  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __44__SUCoreMSU__operationPreflightFDRRecovery___block_invoke_2;
  v16[3] = &unk_18A0F0510;
  uint64_t v14 = *(void *)(a1 + 32);
  id v17 = v12;
  uint64_t v18 = v14;
  id v15 = v12;
  dispatch_async(v13, v16);
}

uint64_t __44__SUCoreMSU__operationPreflightFDRRecovery___block_invoke_2(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "_reportFDRRecoveryPreflightFailed:");
    id v4 = *(void **)(a1 + 40);
    uint64_t v5 = [*(id *)(a1 + 32) code];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = v4;
  }

  else
  {
    [v2 _reportFDRRecoveryPreflighted];
    id v7 = *(void **)(a1 + 40);
    uint64_t v5 = 0LL;
    uint64_t v6 = 0LL;
  }

  [v7 _trackMSUEnd:@"MSUPreflightUpdate" withResult:v5 withError:v6];
  return [*(id *)(a1 + 40) setPerformingOperation:0];
}

- (void)_operationPreflightWakeup:(id)a3
{
  id v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU updateDescriptor](self, "updateDescriptor");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SUCoreMSU setPerformingOperation:](self, "setPerformingOperation:", 1LL);
    -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __39__SUCoreMSU__operationPreflightWakeup___block_invoke;
    v10[3] = &unk_18A0F0510;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }

  else
  {
    [MEMORY[0x189612760] sharedCore];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 buildError:8803 underlying:0 description:@"Missing required descriptor for PreflightWakeup"];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreMSU _reportWakeupPreflightFailed:](self, "_reportWakeupPreflightFailed:", v9);
  }
}

void __39__SUCoreMSU__operationPreflightWakeup___block_invoke(uint64_t a1)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 descriptorType];
  if (v4 != 2)
  {
    [*(id *)(a1 + 32) updateDescriptor];
    uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v1 descriptorType] != 4)
    {

      goto LABEL_8;
    }
  }

  [*(id *)(a1 + 32) updateDescriptor];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 updateBrainPath];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != 2) {
  if (!v6)
  }
  {
    [MEMORY[0x189612778] sharedDiag];
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v3,  "trackAnomaly:forReason:withResult:withError:",  @"MSUPreflightWakeup",  @"An update brain path is required for preflight, yet none was provided",  8116,  0);
LABEL_8:
  }

  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = *(void **)(a1 + 40);
  [v8 wakeupPreflightPolicy];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_opt_class();
  [*(id *)(a1 + 32) updateDescriptor];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) wakeupPreflightPolicy];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 basePreflightOptions];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) wakeupPreflightPolicy];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 additionalOptions];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  id v16 = (void *)[v7 _newPreflightOptionsUsingPolicy:v8 subPolicyClass:v10 descriptor:v11 baseOptions:v13 additionalOptions:v15];

  [*(id *)(a1 + 32) _trackMSUOptions:@"performing MSU preflight (wakeup)" optionsName:@"preflightOptions" withMSUOptions:v16];
  [*(id *)(a1 + 32) _trackMSUBegin:@"MSUPreflightUpdate"];
  SUCoreBorder_MSUPreflightUpdate(4LL, v16);
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) msuControlQueue];
  uint64_t v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = __39__SUCoreMSU__operationPreflightWakeup___block_invoke_2;
  v21[3] = &unk_18A0F0510;
  uint64_t v19 = *(void *)(a1 + 32);
  id v22 = v17;
  uint64_t v23 = v19;
  id v20 = v17;
  dispatch_async(v18, v21);
}

uint64_t __39__SUCoreMSU__operationPreflightWakeup___block_invoke_2(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "_reportWakeupPreflightFailed:");
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = [*(id *)(a1 + 32) code];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = v4;
  }

  else
  {
    [v2 _reportWakeupPreflighted];
    id v7 = *(void **)(a1 + 40);
    uint64_t v5 = 0LL;
    uint64_t v6 = 0LL;
  }

  [v7 _trackMSUEnd:@"MSUPreflightUpdate" withResult:v5 withError:v6];
  return [*(id *)(a1 + 40) setPerformingOperation:0];
}

- (void)_operationPreflightPrerequisiteCheck:(id)a3
{
  id v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU updateDescriptor](self, "updateDescriptor");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SUCoreMSU setPerformingOperation:](self, "setPerformingOperation:", 1LL);
    -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
    id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __50__SUCoreMSU__operationPreflightPrerequisiteCheck___block_invoke;
    v10[3] = &unk_18A0F0510;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }

  else
  {
    [MEMORY[0x189612760] sharedCore];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 buildError:8803 underlying:0 description:@"Missing required descriptor for PreflightPrerequisiteCheck"];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreMSU _reportPrerequisiteCheckPreflightFailed:](self, "_reportPrerequisiteCheckPreflightFailed:", v9);
  }
}

void __50__SUCoreMSU__operationPreflightPrerequisiteCheck___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  [v3 prerequisiteCheckPreflightPolicy];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = objc_opt_class();
  [*(id *)(a1 + 32) updateDescriptor];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) prerequisiteCheckPreflightPolicy];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 basePreflightOptions];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) prerequisiteCheckPreflightPolicy];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 additionalOptions];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = (void *)[v2 _newPreflightOptionsUsingPolicy:v3 subPolicyClass:v5 descriptor:v6 baseOptions:v8 additionalOptions:v10];

  [*(id *)(a1 + 32) _trackMSUOptions:@"performing MSU preflight (prerequisite check)" optionsName:@"preflightOptions" withMSUOptions:v11];
  [*(id *)(a1 + 32) _trackMSUBegin:@"MSUPreflightUpdate"];
  SUCoreBorder_MSUPreflightUpdate(5LL, v11);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) msuControlQueue];
  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __50__SUCoreMSU__operationPreflightPrerequisiteCheck___block_invoke_2;
  v16[3] = &unk_18A0F0510;
  uint64_t v14 = *(void *)(a1 + 32);
  id v17 = v12;
  uint64_t v18 = v14;
  id v15 = v12;
  dispatch_async(v13, v16);
}

uint64_t __50__SUCoreMSU__operationPreflightPrerequisiteCheck___block_invoke_2(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "_reportPrerequisiteCheckPreflightFailed:");
    id v4 = *(void **)(a1 + 40);
    uint64_t v5 = [*(id *)(a1 + 32) code];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = v4;
  }

  else
  {
    [v2 _reportPrerequisiteCheckPreflighted];
    id v7 = *(void **)(a1 + 40);
    uint64_t v5 = 0LL;
    uint64_t v6 = 0LL;
  }

  [v7 _trackMSUEnd:@"MSUPreflightUpdate" withResult:v5 withError:v6];
  return [*(id *)(a1 + 40) setPerformingOperation:0];
}

- (void)_operationPrepareUpdate:(id)a3
{
  id v5 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUCoreMSU updateDescriptor](self, "updateDescriptor");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SUCoreMSU updateDescriptor](self, "updateDescriptor");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 descriptorType];
    if (v9 == 2
      || (-[SUCoreMSU updateDescriptor](self, "updateDescriptor"),
          uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(),
          [v3 descriptorType] == 4))
    {
      -[SUCoreMSU updateDescriptor](self, "updateDescriptor");
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 updateBrainPath];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 != 2) {
      if (v11)
      }
      {
LABEL_11:
        -[SUCoreMSU updateDescriptor](self, "updateDescriptor");
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v15 = [v14 descriptorType];
        if (v15 == 2
          || (-[SUCoreMSU updateDescriptor](self, "updateDescriptor"),
              uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(),
              [v3 descriptorType] == 4))
        {
          -[SUCoreMSU updateDescriptor](self, "updateDescriptor");
          id v16 = (void *)objc_claimAutoreleasedReturnValue();
          [v16 updateBundlePath];
          id v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15 != 2) {
          if (v17)
          }
            goto LABEL_19;
          [MEMORY[0x189612778] sharedDiag];
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend( v14,  "trackAnomaly:forReason:withResult:withError:",  @"MSUPrepare",  @"An update bundle path is required for prepare, yet none was provided",  8116,  0);
        }

        else
        {
        }

LABEL_19:
        -[SUCoreMSU setPerformingOperation:](self, "setPerformingOperation:", 1LL);
        -[SUCoreMSU setCancelingPrepare:](self, "setCancelingPrepare:", 0LL);
        LODWORD(v18) = 0;
        -[SUCoreMSU setNextProgressThreshold:](self, "setNextProgressThreshold:", v18);
        -[SUCoreMSU setPrepareProgressFinal:](self, "setPrepareProgressFinal:", 0LL);
        -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
        uint64_t v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x1895F87A8];
        v20[1] = 3221225472LL;
        v20[2] = __37__SUCoreMSU__operationPrepareUpdate___block_invoke;
        v20[3] = &unk_18A0F0510;
        void v20[4] = self;
        id v21 = v5;
        dispatch_async(v19, v20);

        goto LABEL_20;
      }

      [MEMORY[0x189612778] sharedDiag];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend( v8,  "trackAnomaly:forReason:withResult:withError:",  @"MSUPrepare",  @"An update brain path is required for prepare, yet none was provided",  8116,  0);
    }

    else
    {
    }

    goto LABEL_11;
  }

  [MEMORY[0x189612760] sharedCore];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 buildError:8803 underlying:0 description:@"Missing required descriptor for PrepareUpdate"];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreMSU _reportPrepareFailed:](self, "_reportPrepareFailed:", v13);
LABEL_20:
}

void __37__SUCoreMSU__operationPrepareUpdate___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v2 = (id *)(a1 + 32);
  id v26 = *(id *)(a1 + 32);
  +[SUCorePower setPowerAssertion:forIdentifierDomain:]( &OBJC_CLASS___SUCorePower,  "setPowerAssertion:forIdentifierDomain:",  1LL,  @"msu.PrepareUpdate");
  [*v2 setMsuHandle:0];
  id v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  [v4 updateDescriptor];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = (void *)[v4 _newPrepareOptionsUsingPolicy:v3 descriptor:v5];

  [*v2 _trackMSUOptions:@"performing MSU prepare" optionsName:@"prepareOptions" withMSUOptions:v6];
  uint64_t v25 = 0LL;
  [*v2 updateDescriptor];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v7 descriptorType] == 2)
  {

LABEL_4:
    [*v2 _trackMSUBegin:@"MSUPrepareUpdate"];
    [*v2 updateDescriptor];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 updateBundlePath];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = SUCoreBorder_MSUPrepareUpdate(v11, v6);
    goto LABEL_6;
  }

  [*v2 updateDescriptor];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 descriptorType];

  if (v9 == 4) {
    goto LABEL_4;
  }
  [*v2 _trackMSUBegin:@"MSUPrepareUpdateWithMAAsset"];
  [*v2 updateDescriptor];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 softwareUpdateAsset];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = SUCoreBorder_MSUPrepareUpdateWithMAAsset(v11, v6);
LABEL_6:
  id v13 = (void *)v12;

  +[SUCorePower setPowerAssertion:forIdentifierDomain:]( &OBJC_CLASS___SUCorePower,  "setPowerAssertion:forIdentifierDomain:",  0LL,  @"msu.PrepareUpdate");
  if (v13)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 oslog];
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __37__SUCoreMSU__operationPrepareUpdate___block_invoke_cold_1(v2, (uint64_t)v13, v15);
    }
  }

  else
  {
    [*v2 setMsuHandle:v25];
    [MEMORY[0x1896127A0] sharedLogger];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 oslog];
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = *v2;
      uint64_t v18 = [*v2 msuHandle];
      *(_DWORD *)buf = 138543618;
      id v28 = v17;
      __int16 v29 = 2048;
      uint64_t v30 = v18;
      _os_log_impl( &dword_187A54000,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@ MSU prepare completed successfully, updating msuHandle: %ld",  buf,  0x16u);
    }
  }

  [*v2 msuControlQueue];
  uint64_t v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  v22[2] = __37__SUCoreMSU__operationPrepareUpdate___block_invoke_699;
  v22[3] = &unk_18A0F0510;
  id v20 = *v2;
  id v23 = v13;
  id v24 = v20;
  id v21 = v13;
  dispatch_async(v19, v22);
}

uint64_t __37__SUCoreMSU__operationPrepareUpdate___block_invoke_699(uint64_t a1)
{
  id v2 = *(void **)(a1 + 40);
  if (!*(void *)(a1 + 32))
  {
    id v4 = objc_alloc(MEMORY[0x1896127B8]);
    LODWORD(v5) = 1.0;
    uint64_t v6 = (void *)[v4 initWithPhase:*MEMORY[0x189612A28] isStalled:0 portionComplete:v5 remaining:-1.0];
    [v2 _reportPrepared:v6];

    [*(id *)(a1 + 40) updateDescriptor];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v7 descriptorType] == 2)
    {
    }

    else
    {
      [*(id *)(a1 + 40) updateDescriptor];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v12 = [v11 descriptorType];

      if (v12 != 4)
      {
        id v13 = *(void **)(a1 + 40);
        uint64_t v14 = kSU_M_MSUPrepareUpdateWithMAAsset;
        goto LABEL_13;
      }
    }

    id v13 = *(void **)(a1 + 40);
    uint64_t v14 = kSU_M_MSUPrepareUpdate;
LABEL_13:
    uint64_t v19 = *v14;
    uint64_t v17 = 0LL;
    uint64_t v18 = 0LL;
    goto LABEL_14;
  }

  objc_msgSend(*(id *)(a1 + 40), "_reportPrepareFailed:");
  [*(id *)(a1 + 40) updateDescriptor];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v3 descriptorType] == 2)
  {
  }

  else
  {
    [*(id *)(a1 + 40) updateDescriptor];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = [v8 descriptorType];

    if (v9 != 4)
    {
      uint64_t v10 = kSU_M_MSUPrepareUpdateWithMAAsset;
      goto LABEL_11;
    }
  }

  uint64_t v10 = kSU_M_MSUPrepareUpdate;
LABEL_11:
  uint64_t v15 = *v10;
  id v16 = *(void **)(a1 + 40);
  uint64_t v17 = [*(id *)(a1 + 32) code];
  uint64_t v18 = *(void *)(a1 + 32);
  id v13 = v16;
  uint64_t v19 = v15;
LABEL_14:
  [v13 _trackMSUEnd:v19 withResult:v17 withError:v18];
  [*(id *)(a1 + 40) setPerformingOperation:0];
  return [*(id *)(a1 + 40) setCancelingPrepare:0];
}

- (void)_operationSuspendUpdate
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreMSU setPerformingOperation:](self, "setPerformingOperation:", 1LL);
  -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __36__SUCoreMSU__operationSuspendUpdate__block_invoke;
  block[3] = &unk_18A0EF970;
  block[4] = self;
  dispatch_async(v4, block);
}

void __36__SUCoreMSU__operationSuspendUpdate__block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896127A0] sharedLogger];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    id v13 = v4;
    __int16 v14 = 2048;
    uint64_t v15 = [v4 msuHandle];
    _os_log_impl( &dword_187A54000,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Performing MSU suspend update with msuHandle: %ld",  buf,  0x16u);
  }

  [*(id *)(a1 + 32) _trackMSUBegin:@"MSUSuspendUpdate"];
  [*(id *)(a1 + 32) msuHandle];
  SUCoreBorder_MSUSuspendUpdate();
  double v5 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) msuControlQueue];
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __36__SUCoreMSU__operationSuspendUpdate__block_invoke_701;
  v9[3] = &unk_18A0F0510;
  uint64_t v7 = *(void *)(a1 + 32);
  id v10 = v5;
  uint64_t v11 = v7;
  id v8 = v5;
  dispatch_async(v6, v9);
}

uint64_t __36__SUCoreMSU__operationSuspendUpdate__block_invoke_701(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "_reportSuspendFailed:");
    id v4 = *(void **)(a1 + 40);
    uint64_t v5 = [*(id *)(a1 + 32) code];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = v4;
  }

  else
  {
    [v2 _reportSuspended];
    uint64_t v7 = *(void **)(a1 + 40);
    uint64_t v5 = 0LL;
    uint64_t v6 = 0LL;
  }

  [v7 _trackMSUEnd:@"MSUSuspendUpdate" withResult:v5 withError:v6];
  return [*(id *)(a1 + 40) setPerformingOperation:0];
}

- (void)_operationResumeUpdate:(id)a3
{
  id v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU setPerformingOperation:](self, "setPerformingOperation:", 1LL);
  -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __36__SUCoreMSU__operationResumeUpdate___block_invoke;
  v8[3] = &unk_18A0F0510;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __36__SUCoreMSU__operationResumeUpdate___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void **)(a1 + 40);
  [v3 resumePolicy];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = objc_opt_class();
  [*(id *)(a1 + 32) updateDescriptor];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) resumePolicy];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 baseResumeOptions];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) resumePolicy];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 additionalOptions];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = (void *)[v2 _newPreflightOptionsUsingPolicy:v3 subPolicyClass:v5 descriptor:v6 baseOptions:v8 additionalOptions:v10];

  [*(id *)(a1 + 32) _trackMSUOptions:@"performing MSU resume" optionsName:@"resumeUpdateOptions" withMSUOptions:v11];
  [*(id *)(a1 + 32) _trackMSUBegin:@"MSUResumeUpdateWithOptions"];
  uint64_t v20 = 0LL;
  SUCoreBorder_MSUResumeUpdateWithOptions(v11);
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) msuControlQueue];
  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __36__SUCoreMSU__operationResumeUpdate___block_invoke_2;
  v16[3] = &unk_18A0F1570;
  uint64_t v14 = *(void *)(a1 + 32);
  id v17 = v12;
  uint64_t v18 = v14;
  uint64_t v19 = 0LL;
  id v15 = v12;
  dispatch_async(v13, v16);
}

uint64_t __36__SUCoreMSU__operationResumeUpdate___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (*(void *)(a1 + 32))
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 oslog];
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __36__SUCoreMSU__operationResumeUpdate___block_invoke_2_cold_1();
    }

    [*(id *)(a1 + 40) _reportResumeFailed:*(void *)(a1 + 32)];
    id v4 = *(void **)(a1 + 40);
    uint64_t v5 = [*(id *)(a1 + 32) code];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = v4;
  }

  else
  {
    [*(id *)(a1 + 40) setMsuHandle:*(void *)(a1 + 48)];
    [MEMORY[0x1896127A0] sharedLogger];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = *(void **)(a1 + 40);
      int v12 = 138543618;
      id v13 = v10;
      __int16 v14 = 2048;
      uint64_t v15 = [v10 msuHandle];
      _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ MSU resume completed successfully, updating msuHandle: %ld",  (uint8_t *)&v12,  0x16u);
    }

    [*(id *)(a1 + 40) _reportResumed];
    id v7 = *(void **)(a1 + 40);
    uint64_t v5 = 0LL;
    uint64_t v6 = 0LL;
  }

  [v7 _trackMSUEnd:@"MSUResumeUpdateWithOptions" withResult:v5 withError:v6];
  return [*(id *)(a1 + 40) setPerformingOperation:0];
}

- (void)_operationApplyUpdate:(id)a3
{
  id v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU setPerformingOperation:](self, "setPerformingOperation:", 1LL);
  LODWORD(v6) = 0;
  -[SUCoreMSU setNextProgressThreshold:](self, "setNextProgressThreshold:", v6);
  -[SUCoreMSU setApplyProgressFinal:](self, "setApplyProgressFinal:", 0LL);
  -[SUCoreMSU setApplyProgressActionText:](self, "setApplyProgressActionText:", 0LL);
  -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __35__SUCoreMSU__operationApplyUpdate___block_invoke;
  v9[3] = &unk_18A0F0510;
  void v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

void __35__SUCoreMSU__operationApplyUpdate___block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x1895F89C0];
  id v20 = *(id *)(a1 + 32);
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  [v2 updateDescriptor];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) applyPolicy];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 baseApplyOptions];
  double v6 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = (void *)[v2 _newMSUOptionsUsingPolicy:v3 descriptor:v4 baseOptions:v6];

  [*(id *)(a1 + 40) updateApplyOptionsWithExtensions:v7];
  [*(id *)(a1 + 40) applyPolicy];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 additionalOptions];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 addEntriesFromDictionary:v9];

  [*(id *)(a1 + 32) _trackMSUOptions:@"performing MSU apply" optionsName:@"applyOptions" withMSUOptions:v7];
  [MEMORY[0x1896127A0] sharedLogger];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 oslog];
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    id v22 = v12;
    __int16 v23 = 2048;
    uint64_t v24 = [v12 msuHandle];
    _os_log_impl( &dword_187A54000,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ performing MSU apply with msuHandle: %ld",  buf,  0x16u);
  }

  +[SUCorePower setPowerAssertion:forIdentifierDomain:]( &OBJC_CLASS___SUCorePower,  "setPowerAssertion:forIdentifierDomain:",  1LL,  @"msu.ApplyUpdate");
  [*(id *)(a1 + 32) _trackMSUBegin:@"MSUApplyUpdate"];
  SUCoreBorder_MSUApplyUpdate([*(id *)(a1 + 32) msuHandle], v7);
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[SUCorePower setPowerAssertion:forIdentifierDomain:]( &OBJC_CLASS___SUCorePower,  "setPowerAssertion:forIdentifierDomain:",  0LL,  @"msu.ApplyUpdate");
  [*(id *)(a1 + 32) msuControlQueue];
  __int16 v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __35__SUCoreMSU__operationApplyUpdate___block_invoke_710;
  block[3] = &unk_18A0F0510;
  uint64_t v15 = *(void *)(a1 + 32);
  id v18 = v13;
  uint64_t v19 = v15;
  id v16 = v13;
  dispatch_async(v14, block);
}

uint64_t __35__SUCoreMSU__operationApplyUpdate___block_invoke_710(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "_reportApplyFailed:");
    id v4 = *(void **)(a1 + 40);
    uint64_t v5 = [*(id *)(a1 + 32) code];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = v4;
  }

  else
  {
    [v2 _reportApplied];
    id v7 = *(void **)(a1 + 40);
    uint64_t v5 = 0LL;
    uint64_t v6 = 0LL;
  }

  [v7 _trackMSUEnd:@"MSUApplyUpdate" withResult:v5 withError:v6];
  return [*(id *)(a1 + 40) setPerformingOperation:0];
}

- (void)_removePrepared
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __28__SUCoreMSU__removePrepared__block_invoke;
  block[3] = &unk_18A0EF970;
  void block[4] = self;
  dispatch_async(v4, block);
}

void __28__SUCoreMSU__removePrepared__block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) msuControlQueue];
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __28__SUCoreMSU__removePrepared__block_invoke_2;
  v6[3] = &unk_18A0F0510;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v2;
  uint64_t v8 = v4;
  id v5 = v2;
  dispatch_async(v3, v6);
}

uint64_t __28__SUCoreMSU__removePrepared__block_invoke_2(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "_reportRemoveFailed:");
    uint64_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = [*(id *)(a1 + 32) code];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = v4;
  }

  else
  {
    [v2 _reportRemoved];
    id v7 = *(void **)(a1 + 40);
    uint64_t v5 = 0LL;
    uint64_t v6 = 0LL;
  }

  [v7 _trackMSUEnd:@"MSUPurgeSuspendedUpdate" withResult:v5 withError:v6];
  return [*(id *)(a1 + 40) setRemovingPrepared:0];
}

- (void)_operationRollbackUpdatePrepare:(id)a3
{
  id v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU setPerformingOperation:](self, "setPerformingOperation:", 1LL);
  -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __45__SUCoreMSU__operationRollbackUpdatePrepare___block_invoke;
  v8[3] = &unk_18A0F0510;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __45__SUCoreMSU__operationRollbackUpdatePrepare___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) softwareUpdateAssetType];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v2 isEqualToString:@"com.apple.MobileAsset.SplatSoftwareUpdate"])
  {

LABEL_4:
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(a1 + 40);
    [v5 rollbackDescriptor];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = (void *)[v5 _newRollbackPrepareOptionsUsingPolicy:v6 rollbackDescriptor:v7];

    [*(id *)(a1 + 40) _trackMSUOptions:@"performing MSU rollback prepare" optionsName:@"rollbackOptions" withMSUOptions:v8];
    +[SUCorePower setPowerAssertion:forIdentifierDomain:]( &OBJC_CLASS___SUCorePower,  "setPowerAssertion:forIdentifierDomain:",  1LL,  @"msu.RollbackUpdatePrepare");
    [*(id *)(a1 + 40) _trackMSUBegin:@"MSURollbackUpdatePrepare"];
    *(void *)buf = 0LL;
    SUCoreBorder_MSURollbackUpdatePrepare((uint64_t)buf, v8);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUCorePower setPowerAssertion:forIdentifierDomain:]( &OBJC_CLASS___SUCorePower,  "setPowerAssertion:forIdentifierDomain:",  0LL,  @"msu.RollbackUpdatePrepare");
    [*(id *)(a1 + 40) msuControlQueue];
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __45__SUCoreMSU__operationRollbackUpdatePrepare___block_invoke_2;
    block[3] = &unk_18A0F1570;
    id v11 = v9;
    uint64_t v12 = *(void *)(a1 + 40);
    id v26 = v11;
    uint64_t v27 = v12;
    uint64_t v28 = *(void *)buf;
    dispatch_async(v10, block);

    id v13 = v26;
    goto LABEL_8;
  }

  [*(id *)(a1 + 32) softwareUpdateAssetType];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isEqualToString:@"com.apple.MobileAsset.MacSplatSoftwareUpdate"];

  if ((v4 & 1) != 0) {
    goto LABEL_4;
  }
  __int16 v14 = (void *)NSString;
  [*(id *)(a1 + 32) softwareUpdateAssetType];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 stringWithFormat:@"Rollback prepare operation only supported for Splat asset types. Asset Type %@ unsupported", v15];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x1896127A0] sharedLogger];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 oslog];
  id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v18;
    __int16 v34 = 2114;
    __int128 v35 = v8;
    _os_log_impl(&dword_187A54000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
  }

  uint64_t v19 = (void *)MEMORY[0x189607870];
  uint64_t v20 = *MEMORY[0x189612928];
  uint64_t v31 = *MEMORY[0x1896075E0];
  v32 = v8;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 errorWithDomain:v20 code:8118 userInfo:v21];
  id v22 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189612778] sharedDiag];
  __int16 v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 trackAnomaly:@"[POLICY] ROLLBACK_UPDATE_PREPARE" forReason:@"SoftwareUpdateAssetType is not supported with rollback" withResult:8118 withError:v22];

  [*(id *)(a1 + 40) msuControlQueue];
  uint64_t v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1895F87A8];
  v29[1] = 3221225472LL;
  v29[2] = __45__SUCoreMSU__operationRollbackUpdatePrepare___block_invoke_718;
  v29[3] = &unk_18A0F0510;
  v29[4] = *(void *)(a1 + 40);
  id v11 = v22;
  id v30 = v11;
  dispatch_async(v24, v29);

  id v13 = v30;
LABEL_8:
}

uint64_t __45__SUCoreMSU__operationRollbackUpdatePrepare___block_invoke_718(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPerformingOperation:0];
}

uint64_t __45__SUCoreMSU__operationRollbackUpdatePrepare___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 oslog];
  char v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __45__SUCoreMSU__operationRollbackUpdatePrepare___block_invoke_2_cold_1();
    }

    [*(id *)(a1 + 40) _reportRollbackFailed:*(void *)(a1 + 32)];
    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t v6 = [*(id *)(a1 + 32) code];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = v5;
  }

  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      uint64_t v10 = *(void *)(a1 + 48);
      int v12 = 138543618;
      uint64_t v13 = v9;
      __int16 v14 = 2048;
      uint64_t v15 = v10;
      _os_log_impl( &dword_187A54000,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ MSU rollback completed successfully, updating msuHandle: %ld",  (uint8_t *)&v12,  0x16u);
    }

    [*(id *)(a1 + 40) setMsuHandle:*(void *)(a1 + 48)];
    [*(id *)(a1 + 40) _reportRollbackPrepareSuccess];
    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v6 = 0LL;
    uint64_t v7 = 0LL;
  }

  [v8 _trackMSUEnd:@"MSURollbackUpdatePrepare" withResult:v6 withError:v7];
  return [*(id *)(a1 + 40) setPerformingOperation:0];
}

- (void)_operationRollbackUpdateSuspend:(id)a3
{
  id v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU setPerformingOperation:](self, "setPerformingOperation:", 1LL);
  -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __45__SUCoreMSU__operationRollbackUpdateSuspend___block_invoke;
  v8[3] = &unk_18A0F0510;
  id v9 = v4;
  uint64_t v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __45__SUCoreMSU__operationRollbackUpdateSuspend___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) softwareUpdateAssetType];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v2 isEqualToString:@"com.apple.MobileAsset.SplatSoftwareUpdate"])
  {

LABEL_4:
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 oslog];
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v32 = v7;
      __int16 v33 = 2048;
      uint64_t v34 = [v7 msuHandle];
      _os_log_impl( &dword_187A54000,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Performing MSU suspend rollback update with msuHandle: %ld",  buf,  0x16u);
    }

    +[SUCorePower setPowerAssertion:forIdentifierDomain:]( &OBJC_CLASS___SUCorePower,  "setPowerAssertion:forIdentifierDomain:",  1LL,  @"msu.RollbackUpdateSuspend");
    [*(id *)(a1 + 40) _trackMSUBegin:@"MSURollbackUpdateSuspend"];
    [*(id *)(a1 + 40) msuHandle];
    SUCoreBorder_MSURollbackUpdateSuspend();
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUCorePower setPowerAssertion:forIdentifierDomain:]( &OBJC_CLASS___SUCorePower,  "setPowerAssertion:forIdentifierDomain:",  0LL,  @"msu.RollbackUpdateSuspend");
    [*(id *)(a1 + 40) msuControlQueue];
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __45__SUCoreMSU__operationRollbackUpdateSuspend___block_invoke_728;
    block[3] = &unk_18A0F0510;
    id v10 = v8;
    uint64_t v11 = *(void *)(a1 + 40);
    id v25 = v10;
    uint64_t v26 = v11;
    dispatch_async(v9, block);

    int v12 = v25;
    goto LABEL_10;
  }

  [*(id *)(a1 + 32) softwareUpdateAssetType];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isEqualToString:@"com.apple.MobileAsset.MacSplatSoftwareUpdate"];

  if ((v4 & 1) != 0) {
    goto LABEL_4;
  }
  uint64_t v13 = (void *)NSString;
  [*(id *)(a1 + 32) softwareUpdateAssetType];
  __int16 v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 stringWithFormat:@"Rollback suspend operation only supported for Splat asset types. Asset Type %@ unsupported", v14];
  int v12 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 oslog];
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v32 = v17;
    __int16 v33 = 2114;
    uint64_t v34 = (uint64_t)v12;
    _os_log_impl(&dword_187A54000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
  }

  uint64_t v18 = (void *)MEMORY[0x189607870];
  uint64_t v19 = *MEMORY[0x189612928];
  uint64_t v29 = *MEMORY[0x1896075E0];
  id v30 = v12;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 errorWithDomain:v19 code:8118 userInfo:v20];
  id v21 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189612778] sharedDiag];
  id v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 trackAnomaly:@"[POLICY] ROLLBACK_UPDATE_SUSPEND" forReason:@"SoftwareUpdateAssetType is not supported with rollback" withResult:8118 withError:v21];

  [*(id *)(a1 + 40) msuControlQueue];
  __int16 v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1895F87A8];
  v27[1] = 3221225472LL;
  v27[2] = __45__SUCoreMSU__operationRollbackUpdateSuspend___block_invoke_727;
  v27[3] = &unk_18A0F0510;
  v27[4] = *(void *)(a1 + 40);
  id v10 = v21;
  id v28 = v10;
  dispatch_async(v23, v27);

LABEL_10:
}

uint64_t __45__SUCoreMSU__operationRollbackUpdateSuspend___block_invoke_727(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPerformingOperation:0];
}

uint64_t __45__SUCoreMSU__operationRollbackUpdateSuspend___block_invoke_728(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 oslog];
  char v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __45__SUCoreMSU__operationRollbackUpdateSuspend___block_invoke_728_cold_1();
    }

    [*(id *)(a1 + 40) _reportRollbackFailed:*(void *)(a1 + 32)];
    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t v6 = [*(id *)(a1 + 32) code];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = v5;
  }

  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = *(void **)(a1 + 40);
      int v11 = 138543618;
      int v12 = v9;
      __int16 v13 = 2048;
      uint64_t v14 = [v9 msuHandle];
      _os_log_impl( &dword_187A54000,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ MSU suspend rollback completed successfully, msuHandle: %ld",  (uint8_t *)&v11,  0x16u);
    }

    [*(id *)(a1 + 40) _reportRollbackSuspendSuccess];
    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v6 = 0LL;
    uint64_t v7 = 0LL;
  }

  [v8 _trackMSUEnd:@"MSURollbackUpdateSuspend" withResult:v6 withError:v7];
  return [*(id *)(a1 + 40) setPerformingOperation:0];
}

- (void)_operationRollbackUpdateResume:(id)a3
{
  id v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU setPerformingOperation:](self, "setPerformingOperation:", 1LL);
  -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __44__SUCoreMSU__operationRollbackUpdateResume___block_invoke;
  v8[3] = &unk_18A0F0510;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __44__SUCoreMSU__operationRollbackUpdateResume___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) softwareUpdateAssetType];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v2 isEqualToString:@"com.apple.MobileAsset.SplatSoftwareUpdate"])
  {

LABEL_4:
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 oslog];
    uint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v7;
      __int16 v33 = 2048;
      uint64_t v34 = [v7 msuHandle];
      _os_log_impl( &dword_187A54000,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Performing MSU resume rollback update with msuHandle: %ld",  buf,  0x16u);
    }

    +[SUCorePower setPowerAssertion:forIdentifierDomain:]( &OBJC_CLASS___SUCorePower,  "setPowerAssertion:forIdentifierDomain:",  1LL,  @"msu.RollbackUpdateResume");
    [*(id *)(a1 + 40) _trackMSUBegin:@"MSURollbackUpdateResume"];
    *(void *)buf = 0LL;
    SUCoreBorder_MSURollbackUpdateResumeWithOptions(0LL);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUCorePower setPowerAssertion:forIdentifierDomain:]( &OBJC_CLASS___SUCorePower,  "setPowerAssertion:forIdentifierDomain:",  0LL,  @"msu.RollbackUpdateResume");
    [*(id *)(a1 + 40) msuControlQueue];
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __44__SUCoreMSU__operationRollbackUpdateResume___block_invoke_734;
    block[3] = &unk_18A0F1570;
    id v10 = v8;
    uint64_t v11 = *(void *)(a1 + 40);
    id v25 = v10;
    uint64_t v26 = v11;
    uint64_t v27 = *(void *)buf;
    dispatch_async(v9, block);

    goto LABEL_10;
  }

  [*(id *)(a1 + 32) softwareUpdateAssetType];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isEqualToString:@"com.apple.MobileAsset.MacSplatSoftwareUpdate"];

  if ((v4 & 1) != 0) {
    goto LABEL_4;
  }
  int v12 = (void *)NSString;
  [*(id *)(a1 + 32) softwareUpdateAssetType];
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 stringWithFormat:@"Rollback resume operation only supported for Splat asset types. Asset Type %@ unsupported", v13];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 oslog];
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v17;
    __int16 v33 = 2114;
    uint64_t v34 = (uint64_t)v14;
    _os_log_impl(&dword_187A54000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
  }

  uint64_t v18 = (void *)MEMORY[0x189607870];
  uint64_t v19 = *MEMORY[0x189612928];
  uint64_t v30 = *MEMORY[0x1896075E0];
  uint64_t v31 = v14;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 errorWithDomain:v19 code:8118 userInfo:v20];
  id v21 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189612778] sharedDiag];
  id v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 trackAnomaly:@"[POLICY] ROLLBACK_UPDATE_RESUME" forReason:@"SoftwareUpdateAssetType is not supported with rollback" withResult:8118 withError:v21];

  [*(id *)(a1 + 40) msuControlQueue];
  __int16 v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1895F87A8];
  v28[1] = 3221225472LL;
  v28[2] = __44__SUCoreMSU__operationRollbackUpdateResume___block_invoke_733;
  v28[3] = &unk_18A0F0510;
  v28[4] = *(void *)(a1 + 40);
  id v10 = v21;
  id v29 = v10;
  dispatch_async(v23, v28);

LABEL_10:
}

uint64_t __44__SUCoreMSU__operationRollbackUpdateResume___block_invoke_733(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPerformingOperation:0];
}

uint64_t __44__SUCoreMSU__operationRollbackUpdateResume___block_invoke_734(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (*(void *)(a1 + 32))
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 oslog];
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __44__SUCoreMSU__operationRollbackUpdateResume___block_invoke_734_cold_1();
    }

    [*(id *)(a1 + 40) _reportRollbackFailed:*(void *)(a1 + 32)];
    char v4 = *(void **)(a1 + 40);
    uint64_t v5 = [*(id *)(a1 + 32) code];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = v4;
  }

  else
  {
    [*(id *)(a1 + 40) setMsuHandle:*(void *)(a1 + 48)];
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = *(void **)(a1 + 40);
      int v12 = 138543618;
      __int16 v13 = v10;
      __int16 v14 = 2048;
      uint64_t v15 = [v10 msuHandle];
      _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ MSU resume completed successfully, updating msuHandle: %ld",  (uint8_t *)&v12,  0x16u);
    }

    [*(id *)(a1 + 40) _reportRollbackResumeSuccess];
    id v7 = *(void **)(a1 + 40);
    uint64_t v5 = 0LL;
    uint64_t v6 = 0LL;
  }

  [v7 _trackMSUEnd:@"MSURollbackUpdateResume" withResult:v5 withError:v6];
  return [*(id *)(a1 + 40) setPerformingOperation:0];
}

- (void)_operationRollbackUpdateApply:(id)a3
{
  id v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU setPerformingOperation:](self, "setPerformingOperation:", 1LL);
  -[SUCoreMSU msuOperationQueue](self, "msuOperationQueue");
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __43__SUCoreMSU__operationRollbackUpdateApply___block_invoke;
  v8[3] = &unk_18A0F0510;
  id v9 = v4;
  id v10 = self;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __43__SUCoreMSU__operationRollbackUpdateApply___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) softwareUpdateAssetType];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ([v2 isEqualToString:@"com.apple.MobileAsset.SplatSoftwareUpdate"])
  {

LABEL_4:
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(a1 + 40);
    [v5 rollbackDescriptor];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) rollbackPolicy];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 baseRollbackOptions];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) rollbackPolicy];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 additionalOptions];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    int v12 = (void *)[v5 _newMSURollbackOptionsUsingPolicy:v6 rollbackDescriptor:v7 baseOptions:v9 additionalOptions:v11];

    [*(id *)(a1 + 32) updateApplyOptionsWithExtensions:v12];
    [*(id *)(a1 + 40) _trackMSUOptions:@"performing MSU rollback apply" optionsName:@"applyOptions" withMSUOptions:v12];
    [MEMORY[0x1896127A0] sharedLogger];
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 oslog];
    __int16 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      uint64_t v40 = v15;
      __int16 v41 = 2048;
      uint64_t v42 = [v15 msuHandle];
      _os_log_impl( &dword_187A54000,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ performing MSU rollback apply with msuHandle: %ld",  buf,  0x16u);
    }

    +[SUCorePower setPowerAssertion:forIdentifierDomain:]( &OBJC_CLASS___SUCorePower,  "setPowerAssertion:forIdentifierDomain:",  1LL,  @"msu.ApplyUpdate");
    [*(id *)(a1 + 40) _trackMSUBegin:@"MSURollbackUpdateApply"];
    SUCoreBorder_MSURollbackUpdateApply([*(id *)(a1 + 40) msuHandle], v12);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[SUCorePower setPowerAssertion:forIdentifierDomain:]( &OBJC_CLASS___SUCorePower,  "setPowerAssertion:forIdentifierDomain:",  0LL,  @"msu.ApplyUpdate");
    [*(id *)(a1 + 40) msuControlQueue];
    uint64_t v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __43__SUCoreMSU__operationRollbackUpdateApply___block_invoke_742;
    block[3] = &unk_18A0F0510;
    id v18 = v16;
    uint64_t v19 = *(void *)(a1 + 40);
    id v33 = v18;
    uint64_t v34 = v19;
    dispatch_async(v17, block);

    uint64_t v20 = v33;
    goto LABEL_10;
  }

  [*(id *)(a1 + 32) softwareUpdateAssetType];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = [v3 isEqualToString:@"com.apple.MobileAsset.MacSplatSoftwareUpdate"];

  if ((v4 & 1) != 0) {
    goto LABEL_4;
  }
  id v21 = (void *)NSString;
  [*(id *)(a1 + 32) softwareUpdateAssetType];
  id v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 stringWithFormat:@"Rollback apply operation only supported for Splat asset types. Asset Type %@ unsupported", v22];
  int v12 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x1896127A0] sharedLogger];
  __int16 v23 = (void *)objc_claimAutoreleasedReturnValue();
  [v23 oslog];
  uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    uint64_t v40 = v25;
    __int16 v41 = 2114;
    uint64_t v42 = (uint64_t)v12;
    _os_log_impl(&dword_187A54000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
  }

  uint64_t v26 = (void *)MEMORY[0x189607870];
  uint64_t v27 = *MEMORY[0x189612928];
  uint64_t v37 = *MEMORY[0x1896075E0];
  v38 = v12;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
  id v28 = (void *)objc_claimAutoreleasedReturnValue();
  [v26 errorWithDomain:v27 code:8118 userInfo:v28];
  id v29 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189612778] sharedDiag];
  uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
  [v30 trackAnomaly:@"[POLICY] ROLLBACK_UPDATE_APPLY" forReason:@"SoftwareUpdateAssetType is not supported with rollback" withResult:8118 withError:v29];

  [*(id *)(a1 + 40) msuControlQueue];
  uint64_t v31 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1895F87A8];
  v35[1] = 3221225472LL;
  v35[2] = __43__SUCoreMSU__operationRollbackUpdateApply___block_invoke_739;
  v35[3] = &unk_18A0F0510;
  v35[4] = *(void *)(a1 + 40);
  id v18 = v29;
  id v36 = v18;
  dispatch_async(v31, v35);

  uint64_t v20 = v36;
LABEL_10:
}

uint64_t __43__SUCoreMSU__operationRollbackUpdateApply___block_invoke_739(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPerformingOperation:0];
}

uint64_t __43__SUCoreMSU__operationRollbackUpdateApply___block_invoke_742(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 oslog];
  char v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __43__SUCoreMSU__operationRollbackUpdateApply___block_invoke_742_cold_1();
    }

    [*(id *)(a1 + 40) _reportRollbackApplyFailed:*(void *)(a1 + 32)];
    uint64_t v5 = *(void **)(a1 + 40);
    uint64_t v6 = [*(id *)(a1 + 32) code];
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v8 = v5;
  }

  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 40);
      int v11 = 138543362;
      uint64_t v12 = v9;
      _os_log_impl( &dword_187A54000,  v4,  OS_LOG_TYPE_DEFAULT,  "%{public}@ MSU apply rollback completed successfully",  (uint8_t *)&v11,  0xCu);
    }

    [*(id *)(a1 + 40) _reportRollbackApplySuccess];
    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v6 = 0LL;
    uint64_t v7 = 0LL;
  }

  [v8 _trackMSUEnd:@"MSURollbackUpdateApply" withResult:v6 withError:v7];
  return [*(id *)(a1 + 40) setPerformingOperation:0];
}

- (void)loadBrainProgress:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __37__SUCoreMSU_loadBrainProgress_error___block_invoke;
  block[3] = &unk_18A0F03C8;
  id v12 = v7;
  id v13 = v6;
  __int16 v14 = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(v8, block);
}

void __37__SUCoreMSU_loadBrainProgress_error___block_invoke(id *a1)
{
  if (a1[4])
  {
    objc_msgSend(a1[6], "_reportBrainLoadFailed:");
    objc_msgSend( a1[6],  "_trackMSUEnd:withResult:withError:",  @"loadUpdateBrainWithMAOptions",  objc_msgSend(a1[4], "code"),  a1[4]);
    [a1[6] setPerformingOperation:0];
  }

  else
  {
    [a1[5] safeStringForKey:*MEMORY[0x1896110A8]];
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if ([v13 isEqualToString:*MEMORY[0x1896110A0]])
    {
      id v2 = a1[6];
      id v3 = objc_alloc(MEMORY[0x1896127B8]);
      LODWORD(v4) = -1.0;
      uint64_t v5 = (void *)[v3 initWithPhase:*MEMORY[0x189612A20] isStalled:1 portionComplete:v4 remaining:-1.0];
      [v2 _reportBrainLoadStalled:v5];
    }

    else
    {
      int v6 = [v13 isEqualToString:*MEMORY[0x189611098]];
      id v7 = a1[6];
      id v8 = objc_alloc(MEMORY[0x1896127B8]);
      uint64_t v10 = *MEMORY[0x189612A20];
      if (v6)
      {
        LODWORD(v9) = 1.0;
        int v11 = (void *)[v8 initWithPhase:v10 isStalled:0 portionComplete:v9 remaining:-1.0];
        [v7 _reportBrainLoaded:v11];

        [a1[6] _trackMSUEnd:@"loadUpdateBrainWithMAOptions" withResult:0 withError:0];
        [a1[6] setPerformingOperation:0];
      }

      else
      {
        LODWORD(v9) = -1.0;
        id v12 = (void *)[v8 initWithPhase:v10 isStalled:0 portionComplete:v9 remaining:-1.0];
        [v7 _reportBrainLoadProgress:v12];
      }
    }
  }

- (int)prepareProgress:(__CFDictionary *)a3
{
  uint64_t v8 = 0LL;
  double v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  int v11 = 0;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __29__SUCoreMSU_prepareProgress___block_invoke;
  block[3] = &unk_18A0F05C0;
  void block[4] = self;
  void block[5] = &v8;
  block[6] = a3;
  dispatch_sync(v5, block);

  LODWORD(a3) = *((_DWORD *)v9 + 6);
  _Block_object_dispose(&v8, 8);
  return (int)a3;
}

void __29__SUCoreMSU_prepareProgress___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if ([*(id *)(a1 + 32) cancelingPrepare])
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 oslog];
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      uint64_t v15 = v4;
      _os_log_impl( &dword_187A54000,  v3,  OS_LOG_TYPE_DEFAULT,  "%{public}@ requesting cancel (on return from prepare progress)",  buf,  0xCu);
    }

    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 2;
  }

  else
  {
    CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 48), (const void *)*MEMORY[0x189611758]);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    [v13 doubleValue];
    *(float *)&double v5 = v5;
    float v6 = fminf(fmaxf(*(float *)&v5 / 100.0, 0.0), 1.0);
    [*(id *)(a1 + 32) nextProgressThreshold];
    if (v6 > v7 && ([*(id *)(a1 + 32) prepareProgressFinal] & 1) == 0)
    {
      *(float *)&double v8 = v6 + 0.01;
      if ((float)(v6 + 0.01) >= 0.99)
      {
        if (v6 >= 0.99)
        {
          objc_msgSend(*(id *)(a1 + 32), "setPrepareProgressFinal:", 1, v8);
          if (v6 > 0.99) {
            float v6 = 0.99;
          }
        }
      }

      else
      {
        [*(id *)(a1 + 32) setNextProgressThreshold:v8];
      }

      double v9 = *(void **)(a1 + 32);
      id v10 = objc_alloc(MEMORY[0x1896127B8]);
      *(float *)&double v11 = v6;
      id v12 = (void *)[v10 initWithPhase:*MEMORY[0x189612A28] isStalled:0 portionComplete:v11 remaining:-1.0];
      [v9 _reportPrepareProgress:v12];
    }
  }

- (int)applyProgress:(__CFDictionary *)a3
{
  double v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __27__SUCoreMSU_applyProgress___block_invoke;
  v7[3] = &unk_18A0F15E8;
  v7[4] = self;
  v7[5] = a3;
  dispatch_sync(v5, v7);

  return 0;
}

void __27__SUCoreMSU_applyProgress___block_invoke(uint64_t a1)
{
  value = 0LL;
  float valuePtr = -1.0;
  if (CFDictionaryGetValueIfPresent( *(CFDictionaryRef *)(a1 + 40),  (const void *)*MEMORY[0x189611758],  (const void **)&value))
  {
    BOOL v3 = value == 0LL;
  }

  else
  {
    BOOL v3 = 1;
  }

  if (v3
    || (CFTypeID v4 = CFGetTypeID(value), v4 != CFNumberGetTypeID())
    || (CFNumberGetValue((CFNumberRef)value, kCFNumberFloatType, &valuePtr), *(float *)&double v2 = valuePtr, valuePtr < 0.0)
    || (float v5 = fminf(valuePtr, 1.0), [*(id *)(a1 + 32) nextProgressThreshold], v5 <= *(float *)&v2)
    || ([*(id *)(a1 + 32) applyProgressFinal] & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "nextProgressThreshold", v2);
    float v5 = v6;
    char v7 = 0;
    goto LABEL_10;
  }

  *(float *)&double v2 = v5 + 0.01;
  if ((float)(v5 + 0.01) < 0.99)
  {
    [*(id *)(a1 + 32) setNextProgressThreshold:v2];
LABEL_23:
    char v7 = 1;
    goto LABEL_10;
  }

  if (v5 < 0.99) {
    goto LABEL_23;
  }
  char v7 = 1;
  objc_msgSend(*(id *)(a1 + 32), "setApplyProgressFinal:", 1, v2);
  if (v5 > 0.99) {
    float v5 = 0.99;
  }
LABEL_10:
  double v8 = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), (const void *)*MEMORY[0x189611750]);
  id v9 = v8;
  if (v8)
  {
    CFTypeID v10 = CFGetTypeID(v8);
    if (v10 == CFStringGetTypeID())
    {
      id v9 = v9;
      [*(id *)(a1 + 32) applyProgressActionText];
      double v11 = (void *)objc_claimAutoreleasedReturnValue();

      id v12 = *(void **)(a1 + 32);
      if (!v11)
      {
LABEL_15:
        [v12 setApplyProgressActionText:v9];
LABEL_18:
        uint64_t v15 = *(void **)(a1 + 32);
        id v16 = objc_alloc(MEMORY[0x1896127B8]);
        *(float *)&double v17 = v5;
        id v18 = (void *)[v16 initWithPhase:*MEMORY[0x189612A10] isStalled:0 portionComplete:v9 remaining:v17 actionText:-1.0];
        [v15 _reportApplyProgress:v18];

        goto LABEL_19;
      }

      [v12 applyProgressActionText];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      char v14 = [v13 isEqualToString:v9];

      if ((v14 & 1) == 0)
      {
        id v12 = *(void **)(a1 + 32);
        goto LABEL_15;
      }
    }

    else
    {
      id v9 = 0LL;
    }
  }

  if ((v7 & 1) != 0) {
    goto LABEL_18;
  }
LABEL_19:
}

- (void)_reportBrainLoadProgress:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  float v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  float v6 = (void *)objc_claimAutoreleasedReturnValue();
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    double v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __38__SUCoreMSU__reportBrainLoadProgress___block_invoke;
    v12[3] = &unk_18A0F0510;
    v12[4] = self;
    id v13 = v4;
    dispatch_async(v8, v12);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 oslog];
    CFTypeID v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      [v4 summary];
      double v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = self;
      __int16 v16 = 2114;
      double v17 = v11;
      _os_log_impl( &dword_187A54000,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(msuBrainLoadProgress:); so not reporting progress=%{public}@",
        buf,
        0x16u);
    }
  }
}

void __38__SUCoreMSU__reportBrainLoadProgress___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 msuBrainLoadProgress:*(void *)(a1 + 40)];
}

- (void)_reportBrainLoadStalled:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  float v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  float v6 = (void *)objc_claimAutoreleasedReturnValue();
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    double v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __37__SUCoreMSU__reportBrainLoadStalled___block_invoke;
    v12[3] = &unk_18A0F0510;
    v12[4] = self;
    id v13 = v4;
    dispatch_async(v8, v12);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 oslog];
    CFTypeID v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      [v4 summary];
      double v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      uint64_t v15 = self;
      __int16 v16 = 2114;
      double v17 = v11;
      _os_log_impl( &dword_187A54000,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(msuBrainLoadStalled:); so not reporting stalled with progress=%{public}@",
        buf,
        0x16u);
    }
  }
}

void __37__SUCoreMSU__reportBrainLoadStalled___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 msuBrainLoadStalled:*(void *)(a1 + 40)];
}

- (void)_reportBrainLoaded:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  float v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU loadBrainTransaction](self, "loadBrainTransaction");
  float v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setLoadBrainTransaction:](self, "setLoadBrainTransaction:", 0LL);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __32__SUCoreMSU__reportBrainLoaded___block_invoke;
    block[3] = &unk_18A0F03C8;
    void block[4] = self;
    id v14 = v4;
    id v15 = v6;
    dispatch_async(v9, block);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    CFTypeID v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 oslog];
    double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      [v4 summary];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      double v17 = self;
      __int16 v18 = 2114;
      uint64_t v19 = v12;
      _os_log_impl( &dword_187A54000,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(msuBrainLoaded:); so not reporting brain loaded with progress=%{public}@",
        buf,
        0x16u);
    }

    [MEMORY[0x189612760] endTransaction:v6 withName:@"msu.LoadBrain"];
  }
}

uint64_t __32__SUCoreMSU__reportBrainLoaded___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 msuBrainLoaded:*(void *)(a1 + 40)];

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 48) withName:@"msu.LoadBrain"];
}

- (void)_reportBrainLoadFailed:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  float v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU loadBrainTransaction](self, "loadBrainTransaction");
  float v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setLoadBrainTransaction:](self, "setLoadBrainTransaction:", 0LL);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __36__SUCoreMSU__reportBrainLoadFailed___block_invoke;
    block[3] = &unk_18A0F03C8;
    void block[4] = self;
    id v13 = v4;
    id v14 = v6;
    dispatch_async(v9, block);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    CFTypeID v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 oslog];
    double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v16 = self;
      __int16 v17 = 2114;
      id v18 = v4;
      _os_log_impl( &dword_187A54000,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(msuBrainLoadFailed:); so not reporting brain load failed error=%{public}@",
        buf,
        0x16u);
    }

    [MEMORY[0x189612760] endTransaction:v6 withName:@"msu.LoadBrain"];
  }
}

uint64_t __36__SUCoreMSU__reportBrainLoadFailed___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 msuBrainLoadFailed:*(void *)(a1 + 40)];

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 48) withName:@"msu.LoadBrain"];
}

- (void)_reportSUDownloadPreflighted
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreMSU preflightDownloadSUTransaction](self, "preflightDownloadSUTransaction");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setPreflightDownloadSUTransaction:](self, "setPreflightDownloadSUTransaction:", 0LL);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  float v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    char v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __41__SUCoreMSU__reportSUDownloadPreflighted__block_invoke;
    v10[3] = &unk_18A0F0510;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    char v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(msuSUDownloadPreflighted); so not reporting SU download preflighted",
        buf,
        0xCu);
    }

    [MEMORY[0x189612760] endTransaction:v4 withName:@"msu.PreflightDownloadSU"];
  }
}

uint64_t __41__SUCoreMSU__reportSUDownloadPreflighted__block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 msuSUDownloadPreflighted];

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"msu.PreflightDownloadSU"];
}

- (void)_reportSUDownloadPreflightFailed:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  float v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU preflightDownloadSUTransaction](self, "preflightDownloadSUTransaction");
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setPreflightDownloadSUTransaction:](self, "setPreflightDownloadSUTransaction:", 0LL);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __46__SUCoreMSU__reportSUDownloadPreflightFailed___block_invoke;
    block[3] = &unk_18A0F03C8;
    void block[4] = self;
    id v13 = v4;
    id v14 = v6;
    dispatch_async(v9, block);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    CFTypeID v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 oslog];
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v16 = self;
      __int16 v17 = 2114;
      id v18 = v4;
      _os_log_impl( &dword_187A54000,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(msuSUDownloadPreflightFailed:); so not reporting SU download pr"
        "eflight failed error=%{public}@",
        buf,
        0x16u);
    }

    [MEMORY[0x189612760] endTransaction:v6 withName:@"msu.PreflightDownloadSU"];
  }
}

uint64_t __46__SUCoreMSU__reportSUDownloadPreflightFailed___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 msuSUDownloadPreflightFailed:*(void *)(a1 + 40)];

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 48) withName:@"msu.PreflightDownloadSU"];
}

- (void)_reportPersonalizePreflighted
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreMSU preflightPersonalizeTransaction](self, "preflightPersonalizeTransaction");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setPreflightPersonalizeTransaction:](self, "setPreflightPersonalizeTransaction:", 0LL);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  float v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    char v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __42__SUCoreMSU__reportPersonalizePreflighted__block_invoke;
    v10[3] = &unk_18A0F0510;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    char v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(msuPersonalizePreflighted); so not reporting personalization preflighted",
        buf,
        0xCu);
    }

    [MEMORY[0x189612760] endTransaction:v4 withName:@"msu.PreflightPersonalize"];
  }
}

uint64_t __42__SUCoreMSU__reportPersonalizePreflighted__block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 msuPersonalizePreflighted];

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"msu.PreflightPersonalize"];
}

- (void)_reportPersonalizePreflightFailed:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  float v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU preflightPersonalizeTransaction](self, "preflightPersonalizeTransaction");
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setPreflightPersonalizeTransaction:](self, "setPreflightPersonalizeTransaction:", 0LL);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __47__SUCoreMSU__reportPersonalizePreflightFailed___block_invoke;
    block[3] = &unk_18A0F03C8;
    void block[4] = self;
    id v13 = v4;
    id v14 = v6;
    dispatch_async(v9, block);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    CFTypeID v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 oslog];
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v16 = self;
      __int16 v17 = 2114;
      id v18 = v4;
      _os_log_impl( &dword_187A54000,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(msuPersonalizePreflightFailed:); so not reporting personalizati"
        "on preflight failed error=%{public}@",
        buf,
        0x16u);
    }

    [MEMORY[0x189612760] endTransaction:v6 withName:@"msu.PreflightDownloadSU"];
  }
}

uint64_t __47__SUCoreMSU__reportPersonalizePreflightFailed___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 msuPersonalizePreflightFailed:*(void *)(a1 + 40)];

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 48) withName:@"msu.PreflightDownloadSU"];
}

- (void)_reportFDRRecoveryPreflighted
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreMSU preflightFDRRecoveryTransaction](self, "preflightFDRRecoveryTransaction");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setPreflightFDRRecoveryTransaction:](self, "setPreflightFDRRecoveryTransaction:", 0LL);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  float v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    char v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __42__SUCoreMSU__reportFDRRecoveryPreflighted__block_invoke;
    v10[3] = &unk_18A0F0510;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    char v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(msuFDRRecoveryPreflighted); so not reporting FDRRecovery preflighted",
        buf,
        0xCu);
    }

    [MEMORY[0x189612760] endTransaction:v4 withName:@"msu.PreflightFDRRecovery"];
  }
}

uint64_t __42__SUCoreMSU__reportFDRRecoveryPreflighted__block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 msuFDRRecoveryPreflighted];

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"msu.PreflightFDRRecovery"];
}

- (void)_reportFDRRecoveryPreflightFailed:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  float v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU preflightFDRRecoveryTransaction](self, "preflightFDRRecoveryTransaction");
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setPreflightFDRRecoveryTransaction:](self, "setPreflightFDRRecoveryTransaction:", 0LL);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __47__SUCoreMSU__reportFDRRecoveryPreflightFailed___block_invoke;
    block[3] = &unk_18A0F03C8;
    void block[4] = self;
    id v13 = v4;
    id v14 = v6;
    dispatch_async(v9, block);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    CFTypeID v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 oslog];
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v16 = self;
      __int16 v17 = 2114;
      id v18 = v4;
      _os_log_impl( &dword_187A54000,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(msuFDRRecoveryPreflightFailed:); so not reporting FDRRecovery p"
        "reflight failed error=%{public}@",
        buf,
        0x16u);
    }

    [MEMORY[0x189612760] endTransaction:v6 withName:@"msu.PreflightFDRRecovery"];
  }
}

uint64_t __47__SUCoreMSU__reportFDRRecoveryPreflightFailed___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 msuFDRRecoveryPreflightFailed:*(void *)(a1 + 40)];

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 48) withName:@"msu.PreflightFDRRecovery"];
}

- (void)_reportWakeupPreflighted
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreMSU preflightWakeupTransaction](self, "preflightWakeupTransaction");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setPreflightWakeupTransaction:](self, "setPreflightWakeupTransaction:", 0LL);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  float v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    char v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __37__SUCoreMSU__reportWakeupPreflighted__block_invoke;
    v10[3] = &unk_18A0F0510;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    char v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(msuWakeupPreflighted); so not reporting wakeup preflighted",
        buf,
        0xCu);
    }

    [MEMORY[0x189612760] endTransaction:v4 withName:@"msu.PreflightWakeup"];
  }
}

uint64_t __37__SUCoreMSU__reportWakeupPreflighted__block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 msuWakeupPreflighted];

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"msu.PreflightWakeup"];
}

- (void)_reportWakeupPreflightFailed:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  float v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU preflightWakeupTransaction](self, "preflightWakeupTransaction");
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setPreflightWakeupTransaction:](self, "setPreflightWakeupTransaction:", 0LL);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __42__SUCoreMSU__reportWakeupPreflightFailed___block_invoke;
    block[3] = &unk_18A0F03C8;
    void block[4] = self;
    id v13 = v4;
    id v14 = v6;
    dispatch_async(v9, block);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    CFTypeID v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 oslog];
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v16 = self;
      __int16 v17 = 2114;
      id v18 = v4;
      _os_log_impl( &dword_187A54000,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(msuWakeupPreflightFailed:); so not reporting wakeup preflight f"
        "ailed error=%{public}@",
        buf,
        0x16u);
    }

    [MEMORY[0x189612760] endTransaction:v6 withName:@"msu.PreflightWakeup"];
  }
}

uint64_t __42__SUCoreMSU__reportWakeupPreflightFailed___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 msuWakeupPreflightFailed:*(void *)(a1 + 40)];

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 48) withName:@"msu.PreflightWakeup"];
}

- (void)_reportPrerequisiteCheckPreflighted
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreMSU preflightPrerequisiteCheckTransaction](self, "preflightPrerequisiteCheckTransaction");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setPreflightPrerequisiteCheckTransaction:](self, "setPreflightPrerequisiteCheckTransaction:", 0LL);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  float v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    char v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __48__SUCoreMSU__reportPrerequisiteCheckPreflighted__block_invoke;
    v10[3] = &unk_18A0F0510;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    char v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(msuPrerequisiteCheckPreflighted); so not reporting prerequisite"
        " check preflighted",
        buf,
        0xCu);
    }

    [MEMORY[0x189612760] endTransaction:v4 withName:@"msu.PreflightPrerequisiteCheck"];
  }
}

uint64_t __48__SUCoreMSU__reportPrerequisiteCheckPreflighted__block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 msuPrerequisiteCheckPreflighted];

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"msu.PreflightPrerequisiteCheck"];
}

- (void)_reportPrerequisiteCheckPreflightFailed:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  float v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU preflightPrerequisiteCheckTransaction](self, "preflightPrerequisiteCheckTransaction");
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setPreflightPrerequisiteCheckTransaction:](self, "setPreflightPrerequisiteCheckTransaction:", 0LL);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __53__SUCoreMSU__reportPrerequisiteCheckPreflightFailed___block_invoke;
    block[3] = &unk_18A0F03C8;
    void block[4] = self;
    id v13 = v4;
    id v14 = v6;
    dispatch_async(v9, block);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    CFTypeID v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 oslog];
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v16 = self;
      __int16 v17 = 2114;
      id v18 = v4;
      _os_log_impl( &dword_187A54000,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(msuPrerequisiteCheckPreflightFailed:); so not reporting prerequ"
        "isite check preflight failed error=%{public}@",
        buf,
        0x16u);
    }

    [MEMORY[0x189612760] endTransaction:v6 withName:@"msu.PreflightPrerequisiteCheck"];
  }
}

uint64_t __53__SUCoreMSU__reportPrerequisiteCheckPreflightFailed___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 msuPrerequisiteCheckPreflightFailed:*(void *)(a1 + 40)];

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 48) withName:@"msu.PreflightPrerequisiteCheck"];
}

- (void)_reportPrepared:(id)a3
{
  uint64_t v20 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  float v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU prepareUpdateTransaction](self, "prepareUpdateTransaction");
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setPrepareUpdateTransaction:](self, "setPrepareUpdateTransaction:", 0LL);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __29__SUCoreMSU__reportPrepared___block_invoke;
    block[3] = &unk_18A0F03C8;
    void block[4] = self;
    id v14 = v4;
    id v15 = v6;
    dispatch_async(v9, block);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    CFTypeID v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 oslog];
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      [v4 summary];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      __int16 v17 = self;
      __int16 v18 = 2114;
      uint64_t v19 = v12;
      _os_log_impl( &dword_187A54000,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(msuPrepared:); so not reporting prepared with progress=%{public}@",
        buf,
        0x16u);
    }

    [MEMORY[0x189612760] endTransaction:v6 withName:@"msu.PrepareUpdate"];
  }
}

uint64_t __29__SUCoreMSU__reportPrepared___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 msuPrepared:*(void *)(a1 + 40)];

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 48) withName:@"msu.PrepareUpdate"];
}

- (void)_reportPrepareProgress:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  float v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    char v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __36__SUCoreMSU__reportPrepareProgress___block_invoke;
    v12[3] = &unk_18A0F0510;
    v12[4] = self;
    id v13 = v4;
    dispatch_async(v8, v12);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 oslog];
    CFTypeID v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      [v4 summary];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      id v15 = self;
      __int16 v16 = 2114;
      __int16 v17 = v11;
      _os_log_impl( &dword_187A54000,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(msuPrepareProgress:); so not reporting prepare progress=%{public}@",
        buf,
        0x16u);
    }
  }
}

void __36__SUCoreMSU__reportPrepareProgress___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 msuPrepareProgress:*(void *)(a1 + 40)];
}

- (void)_reportApplyProgress:(id)a3
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  float v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  char v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    char v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __34__SUCoreMSU__reportApplyProgress___block_invoke;
    v12[3] = &unk_18A0F0510;
    v12[4] = self;
    id v13 = v4;
    dispatch_async(v8, v12);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 oslog];
    CFTypeID v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      [v4 summary];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      id v15 = self;
      __int16 v16 = 2114;
      __int16 v17 = v11;
      _os_log_impl( &dword_187A54000,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(msuApplyProgress:); so not reporting apply progress=%{public}@",
        buf,
        0x16u);
    }
  }
}

void __34__SUCoreMSU__reportApplyProgress___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 msuApplyProgress:*(void *)(a1 + 40)];
}

- (void)_reportPrepareFailed:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  float v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU prepareUpdateTransaction](self, "prepareUpdateTransaction");
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setPrepareUpdateTransaction:](self, "setPrepareUpdateTransaction:", 0LL);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __34__SUCoreMSU__reportPrepareFailed___block_invoke;
    block[3] = &unk_18A0F03C8;
    void block[4] = self;
    id v13 = v4;
    id v14 = v6;
    dispatch_async(v9, block);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    CFTypeID v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 oslog];
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v16 = self;
      __int16 v17 = 2114;
      id v18 = v4;
      _os_log_impl( &dword_187A54000,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(msuPrepareFailed:); so not reporting prepare failed error=%{public}@",
        buf,
        0x16u);
    }

    [MEMORY[0x189612760] endTransaction:v6 withName:@"msu.PrepareUpdate"];
  }
}

uint64_t __34__SUCoreMSU__reportPrepareFailed___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 msuPrepareFailed:*(void *)(a1 + 40)];

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 48) withName:@"msu.PrepareUpdate"];
}

- (void)_reportSuspended
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreMSU suspendUpdateTransaction](self, "suspendUpdateTransaction");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setSuspendUpdateTransaction:](self, "setSuspendUpdateTransaction:", 0LL);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  float v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    char v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __29__SUCoreMSU__reportSuspended__block_invoke;
    v10[3] = &unk_18A0F0510;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    char v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(msuSuspended); so not reporting suspended",
        buf,
        0xCu);
    }

    [MEMORY[0x189612760] endTransaction:v4 withName:@"msu.SuspendUpdate"];
  }
}

uint64_t __29__SUCoreMSU__reportSuspended__block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 msuSuspended];

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"msu.SuspendUpdate"];
}

- (void)_reportSuspendFailed:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  float v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU suspendUpdateTransaction](self, "suspendUpdateTransaction");
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setSuspendUpdateTransaction:](self, "setSuspendUpdateTransaction:", 0LL);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __34__SUCoreMSU__reportSuspendFailed___block_invoke;
    block[3] = &unk_18A0F03C8;
    void block[4] = self;
    id v13 = v4;
    id v14 = v6;
    dispatch_async(v9, block);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    CFTypeID v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 oslog];
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v16 = self;
      __int16 v17 = 2114;
      id v18 = v4;
      _os_log_impl( &dword_187A54000,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(msuSuspendFailed:); so not reporting suspend failed error=%{public}@",
        buf,
        0x16u);
    }

    [MEMORY[0x189612760] endTransaction:v6 withName:@"msu.SuspendUpdate"];
  }
}

uint64_t __34__SUCoreMSU__reportSuspendFailed___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 msuSuspendFailed:*(void *)(a1 + 40)];

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 48) withName:@"msu.SuspendUpdate"];
}

- (void)_reportResumed
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreMSU resumeUpdateTransaction](self, "resumeUpdateTransaction");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setResumeUpdateTransaction:](self, "setResumeUpdateTransaction:", 0LL);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  float v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    char v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __27__SUCoreMSU__reportResumed__block_invoke;
    v10[3] = &unk_18A0F0510;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    char v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(msuResumed); so not reporting resumed",
        buf,
        0xCu);
    }

    [MEMORY[0x189612760] endTransaction:v4 withName:@"msu.ResumeUpdate"];
  }
}

uint64_t __27__SUCoreMSU__reportResumed__block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 msuResumed];

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"msu.ResumeUpdate"];
}

- (void)_reportResumeFailed:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  float v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU resumeUpdateTransaction](self, "resumeUpdateTransaction");
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setResumeUpdateTransaction:](self, "setResumeUpdateTransaction:", 0LL);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __33__SUCoreMSU__reportResumeFailed___block_invoke;
    block[3] = &unk_18A0F03C8;
    void block[4] = self;
    id v13 = v4;
    id v14 = v6;
    dispatch_async(v9, block);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    CFTypeID v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 oslog];
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v16 = self;
      __int16 v17 = 2114;
      id v18 = v4;
      _os_log_impl( &dword_187A54000,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(msuResumeFailed:); so not reporting resume failed error=%{public}@",
        buf,
        0x16u);
    }

    [MEMORY[0x189612760] endTransaction:v6 withName:@"msu.ResumeUpdate"];
  }
}

uint64_t __33__SUCoreMSU__reportResumeFailed___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 msuResumeFailed:*(void *)(a1 + 40)];

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 48) withName:@"msu.ResumeUpdate"];
}

- (void)_reportApplied
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreMSU applyUpdateTransaction](self, "applyUpdateTransaction");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setApplyUpdateTransaction:](self, "setApplyUpdateTransaction:", 0LL);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  float v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    char v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __27__SUCoreMSU__reportApplied__block_invoke;
    v10[3] = &unk_18A0F0510;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    char v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(msuApplied); so not reporting applied",
        buf,
        0xCu);
    }

    [MEMORY[0x189612760] endTransaction:v4 withName:@"msu.ApplyUpdate"];
  }
}

uint64_t __27__SUCoreMSU__reportApplied__block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 msuApplied];

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"msu.ApplyUpdate"];
}

- (void)_reportApplyFailed:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  float v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU applyUpdateTransaction](self, "applyUpdateTransaction");
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setApplyUpdateTransaction:](self, "setApplyUpdateTransaction:", 0LL);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __32__SUCoreMSU__reportApplyFailed___block_invoke;
    block[3] = &unk_18A0F03C8;
    void block[4] = self;
    id v13 = v4;
    id v14 = v6;
    dispatch_async(v9, block);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    CFTypeID v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 oslog];
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v16 = self;
      __int16 v17 = 2114;
      id v18 = v4;
      _os_log_impl( &dword_187A54000,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(msuApplyFailed:); so not reporting apply failed error=%{public}@",
        buf,
        0x16u);
    }

    [MEMORY[0x189612760] endTransaction:v6 withName:@"msu.ApplyUpdate"];
  }
}

uint64_t __32__SUCoreMSU__reportApplyFailed___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 msuApplyFailed:*(void *)(a1 + 40)];

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 48) withName:@"msu.ApplyUpdate"];
}

- (void)_reportRollbackPrepareSuccess
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreMSU rollbackUpdateTransaction](self, "rollbackUpdateTransaction");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setRollbackUpdateTransaction:](self, "setRollbackUpdateTransaction:", 0LL);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  float v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    char v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __42__SUCoreMSU__reportRollbackPrepareSuccess__block_invoke;
    v10[3] = &unk_18A0F0510;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    char v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(msuRollbackPrepareSuccess); so not reporting msuRollbackPrepareSuccess",
        buf,
        0xCu);
    }

    [MEMORY[0x189612760] endTransaction:v4 withName:@"msu.RollbackUpdate"];
  }
}

uint64_t __42__SUCoreMSU__reportRollbackPrepareSuccess__block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 msuRollbackPrepareSuccess];

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"msu.RollbackUpdate"];
}

- (void)_reportRollbackSuspendSuccess
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreMSU rollbackUpdateTransaction](self, "rollbackUpdateTransaction");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setRollbackUpdateTransaction:](self, "setRollbackUpdateTransaction:", 0LL);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  float v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    char v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __42__SUCoreMSU__reportRollbackSuspendSuccess__block_invoke;
    v10[3] = &unk_18A0F0510;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    char v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(msuRollbackSuspendSuccess); so not reporting msuRollbackSuspendSuccess",
        buf,
        0xCu);
    }

    [MEMORY[0x189612760] endTransaction:v4 withName:@"msu.RollbackUpdate"];
  }
}

uint64_t __42__SUCoreMSU__reportRollbackSuspendSuccess__block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 msuRollbackSuspendSuccess];

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"msu.RollbackUpdate"];
}

- (void)_reportRollbackResumeSuccess
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreMSU rollbackUpdateTransaction](self, "rollbackUpdateTransaction");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setRollbackUpdateTransaction:](self, "setRollbackUpdateTransaction:", 0LL);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  float v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    char v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __41__SUCoreMSU__reportRollbackResumeSuccess__block_invoke;
    v10[3] = &unk_18A0F0510;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    char v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(msuRollbackResumeSuccess); so not reporting msuRollbackResumeSuccess",
        buf,
        0xCu);
    }

    [MEMORY[0x189612760] endTransaction:v4 withName:@"msu.RollbackUpdate"];
  }
}

uint64_t __41__SUCoreMSU__reportRollbackResumeSuccess__block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 msuRollbackResumeSuccess];

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"msu.RollbackUpdate"];
}

- (void)_reportRollbackApplySuccess
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreMSU rollbackUpdateTransaction](self, "rollbackUpdateTransaction");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setRollbackUpdateTransaction:](self, "setRollbackUpdateTransaction:", 0LL);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  float v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    char v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __40__SUCoreMSU__reportRollbackApplySuccess__block_invoke;
    v10[3] = &unk_18A0F0510;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    char v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(msuRollbackApplySuccess); so not reporting msuRollbackApplySuccess",
        buf,
        0xCu);
    }

    [MEMORY[0x189612760] endTransaction:v4 withName:@"msu.RollbackUpdate"];
  }
}

uint64_t __40__SUCoreMSU__reportRollbackApplySuccess__block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 msuRollbackApplySuccess];

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"msu.RollbackUpdate"];
}

- (void)_reportRollbackApplyFailed:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  float v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU rollbackUpdateTransaction](self, "rollbackUpdateTransaction");
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setRollbackUpdateTransaction:](self, "setRollbackUpdateTransaction:", 0LL);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __40__SUCoreMSU__reportRollbackApplyFailed___block_invoke;
    block[3] = &unk_18A0F03C8;
    void block[4] = self;
    id v13 = v4;
    id v14 = v6;
    dispatch_async(v9, block);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    CFTypeID v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 oslog];
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v16 = self;
      __int16 v17 = 2114;
      id v18 = v4;
      _os_log_impl( &dword_187A54000,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(msuRollbackApplyFailed:); so not reporting apply failed error=%{public}@",
        buf,
        0x16u);
    }

    [MEMORY[0x189612760] endTransaction:v6 withName:@"msu.RollbackUpdate"];
  }
}

uint64_t __40__SUCoreMSU__reportRollbackApplyFailed___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 msuRollbackApplyFailed:*(void *)(a1 + 40)];

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 48) withName:@"msu.RollbackUpdate"];
}

- (void)_reportRollbackFailed:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  float v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU rollbackUpdateTransaction](self, "rollbackUpdateTransaction");
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setRollbackUpdateTransaction:](self, "setRollbackUpdateTransaction:", 0LL);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __35__SUCoreMSU__reportRollbackFailed___block_invoke;
    block[3] = &unk_18A0F03C8;
    void block[4] = self;
    id v13 = v4;
    id v14 = v6;
    dispatch_async(v9, block);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    CFTypeID v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 oslog];
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v16 = self;
      __int16 v17 = 2114;
      id v18 = v4;
      _os_log_impl( &dword_187A54000,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(msuRollbackFailed:); so not reporting rollback failed error=%{public}@",
        buf,
        0x16u);
    }

    [MEMORY[0x189612760] endTransaction:v6 withName:@"msu.RollbackUpdate"];
  }
}

uint64_t __35__SUCoreMSU__reportRollbackFailed___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 msuRollbackFailed:*(void *)(a1 + 40)];

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 48) withName:@"msu.RollbackUpdate"];
}

- (void)_reportRemoved
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[SUCoreMSU removePreparedTransaction](self, "removePreparedTransaction");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setRemovePreparedTransaction:](self, "setRemovePreparedTransaction:", 0LL);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  float v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    char v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __27__SUCoreMSU__reportRemoved__block_invoke;
    v10[3] = &unk_18A0F0510;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    char v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v13 = self;
      _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(msuRemoved); so not reporting removed",
        buf,
        0xCu);
    }

    [MEMORY[0x189612760] endTransaction:v4 withName:@"msu.RemovePrepared"];
  }
}

uint64_t __27__SUCoreMSU__reportRemoved__block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 msuRemoved];

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"msu.RemovePrepared"];
}

- (void)_reportRemoveFailed:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreMSU msuControlQueue](self, "msuControlQueue");
  float v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreMSU removePreparedTransaction](self, "removePreparedTransaction");
  char v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreMSU setRemovePreparedTransaction:](self, "setRemovePreparedTransaction:", 0LL);
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __33__SUCoreMSU__reportRemoveFailed___block_invoke;
    block[3] = &unk_18A0F03C8;
    void block[4] = self;
    id v13 = v4;
    id v14 = v6;
    dispatch_async(v9, block);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    CFTypeID v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 oslog];
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v16 = self;
      __int16 v17 = 2114;
      id v18 = v4;
      _os_log_impl( &dword_187A54000,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(msuRemoveFailed:); so not reporting remove failed error=%{public}@",
        buf,
        0x16u);
    }

    [MEMORY[0x189612760] endTransaction:v6 withName:@"msu.RemovePrepared"];
  }
}

uint64_t __33__SUCoreMSU__reportRemoveFailed___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 msuRemoveFailed:*(void *)(a1 + 40)];

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 48) withName:@"msu.RemovePrepared"];
}

- (void)_reportAnomaly:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreMSU msuDelegate](self, "msuDelegate");
  float v5 = (void *)objc_claimAutoreleasedReturnValue();
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SUCoreMSU clientDelegateCallbackQueue](self, "clientDelegateCallbackQueue");
    char v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __28__SUCoreMSU__reportAnomaly___block_invoke;
    v10[3] = &unk_18A0F0510;
    v10[4] = self;
    id v11 = v4;
    dispatch_async(v7, v10);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    char v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v13 = self;
      __int16 v14 = 2114;
      id v15 = v4;
      _os_log_impl( &dword_187A54000,  v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ delegate does not respond to selector(msuAnomaly:); so not reporting anomaly error=%{public}@",
        buf,
        0x16u);
    }
  }
}

void __28__SUCoreMSU__reportAnomaly___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 msuAnomaly:*(void *)(a1 + 40)];
}

- (void)_trackMSUBegin:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x189612778];
  id v4 = a3;
  [v3 sharedDiag];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 trackBegin:v4 atLevel:1 forModule:@"msu"];
}

- (void)_trackMSUEnd:(id)a3
{
}

- (void)_trackMSUEnd:(id)a3 withResult:(int64_t)a4 withError:(id)a5
{
  char v7 = (void *)MEMORY[0x189612778];
  id v8 = a5;
  id v9 = a3;
  [v7 sharedDiag];
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v10 trackEnd:v9 atLevel:1 forModule:@"msu" withResult:a4 withError:v8];
}

- (void)_trackMSUOptions:(id)a3 optionsName:(id)a4 withMSUOptions:(id)a5
{
  uint64_t v58 = *MEMORY[0x1895F89C0];
  id v39 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init(MEMORY[0x189603FA8]);
  uint64_t v10 = [v8 safeDescriptionWithName:v7 maxNestedLevel:0 withMaxValueLength:64 providingSubstitutionMap:v9];
  [MEMORY[0x1896127A0] sharedLogger];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 oslog];
  id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v53 = self;
    __int16 v54 = 2114;
    id v55 = v39;
    __int16 v56 = 2114;
    uint64_t v57 = v10;
    _os_log_impl(&dword_187A54000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ | %{public}@ | %{public}@", buf, 0x20u);
  }

  uint64_t v37 = (void *)v10;

  __int128 v48 = 0u;
  __int128 v49 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v47;
    do
    {
      for (uint64_t i = 0LL; i != v15; ++i)
      {
        if (*(void *)v47 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(SUCoreMSU **)(*((void *)&v46 + 1) + 8 * i);
        [MEMORY[0x1896127A0] sharedLogger];
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
        [v19 oslog];
        uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v53 = v18;
          _os_log_impl(&dword_187A54000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
        }
      }

      uint64_t v15 = [v13 countByEnumeratingWithState:&v46 objects:v51 count:16];
    }

    while (v15);
  }

  id v21 = objc_alloc_init(MEMORY[0x189603FA8]);
  uint64_t v22 = [v8 safeSubDescriptionAtNestedLevel:1 instanceAtLevel:0 withMaxValueLength:96 providingSubstitutionMap:v21];
  if (v22)
  {
    __int16 v23 = (void *)v22;
    id v36 = v7;
    unint64_t v24 = 0LL;
    do
    {
      unint64_t v41 = v24;
      objc_msgSend(MEMORY[0x1896127A0], "sharedLogger", v36, v37);
      id v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 oslog];
      uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v53 = self;
        __int16 v54 = 2114;
        id v55 = v39;
        __int16 v56 = 2114;
        uint64_t v57 = (uint64_t)v23;
        _os_log_impl(&dword_187A54000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@ | %{public}@ | %{public}@", buf, 0x20u);
      }

      uint64_t v40 = v23;

      __int128 v44 = 0u;
      __int128 v45 = 0u;
      __int128 v42 = 0u;
      __int128 v43 = 0u;
      id v27 = v21;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v42 objects:v50 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v43;
        do
        {
          for (uint64_t j = 0LL; j != v29; ++j)
          {
            if (*(void *)v43 != v30) {
              objc_enumerationMutation(v27);
            }
            v32 = *(SUCoreMSU **)(*((void *)&v42 + 1) + 8 * j);
            [MEMORY[0x1896127A0] sharedLogger];
            id v33 = (void *)objc_claimAutoreleasedReturnValue();
            [v33 oslog];
            uint64_t v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              v53 = v32;
              _os_log_impl(&dword_187A54000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
            }
          }

          uint64_t v29 = [v27 countByEnumeratingWithState:&v42 objects:v50 count:16];
        }

        while (v29);
      }

      unint64_t v24 = v41 + 1;
      id v21 = objc_alloc_init(MEMORY[0x189603FA8]);

      [v8 safeSubDescriptionAtNestedLevel:1 instanceAtLevel:v41 + 1 withMaxValueLength:96 providingSubstitutionMap:v21];
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v35) {
        break;
      }
      __int16 v23 = v35;
    }

    while (v41 < 5);

    id v7 = v36;
  }
}

- (void)_trackMSUAnomaly:(id)a3 result:(int64_t)a4 description:(id)a5
{
}

- (void)_trackMSUAnomaly:(id)a3 result:(int64_t)a4 description:(id)a5 underlying:(id)a6
{
  uint64_t v10 = (void *)MEMORY[0x189612760];
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  [v10 sharedCore];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 buildError:a4 underlying:v11 description:v12];
  id v18 = (id)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x189612778] sharedDiag];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = (void *)[objc_alloc(NSString) initWithFormat:@"[MSU] %@", v13];

  __int16 v17 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ %@", self, v12];
  [v15 trackAnomaly:v16 forReason:v17 withResult:a4 withError:v18];

  -[SUCoreMSU _reportAnomaly:](self, "_reportAnomaly:", v18);
}

- (OS_dispatch_queue)msuControlQueue
{
  return self->_msuControlQueue;
}

- (OS_dispatch_queue)msuOperationQueue
{
  return self->_msuOperationQueue;
}

- (NSString)descriptionName
{
  return self->_descriptionName;
}

- (void)setDescriptionName:(id)a3
{
}

- (id)msuDelegate
{
  return objc_loadWeakRetained(&self->_msuDelegate);
}

- (OS_dispatch_queue)clientDelegateCallbackQueue
{
  return self->_clientDelegateCallbackQueue;
}

- (NSString)updateUUID
{
  return self->_updateUUID;
}

- (void)setUpdateUUID:(id)a3
{
}

- (SUCoreDescriptor)updateDescriptor
{
  return self->_updateDescriptor;
}

- (void)setUpdateDescriptor:(id)a3
{
}

- (BOOL)performingOperation
{
  return self->_performingOperation;
}

- (void)setPerformingOperation:(BOOL)a3
{
  self->_performingOperation = a3;
}

- (BOOL)cancelingPrepare
{
  return self->_cancelingPrepare;
}

- (void)setCancelingPrepare:(BOOL)a3
{
  self->_cancelingPrepare = a3;
}

- (BOOL)removingPrepared
{
  return self->_removingPrepared;
}

- (void)setRemovingPrepared:(BOOL)a3
{
  self->_removingPrepared = a3;
}

- (float)nextProgressThreshold
{
  return self->_nextProgressThreshold;
}

- (void)setNextProgressThreshold:(float)a3
{
  self->_nextProgressThreshold = a3;
}

- (BOOL)prepareProgressFinal
{
  return self->_prepareProgressFinal;
}

- (void)setPrepareProgressFinal:(BOOL)a3
{
  self->_prepareProgressFinal = a3;
}

- (BOOL)applyProgressFinal
{
  return self->_applyProgressFinal;
}

- (void)setApplyProgressFinal:(BOOL)a3
{
  self->_applyProgressFinal = a3;
}

- (NSString)applyProgressActionText
{
  return self->_applyProgressActionText;
}

- (void)setApplyProgressActionText:(id)a3
{
}

- (MSUUpdateBrainAssetLoader)brainLoader
{
  return self->_brainLoader;
}

- (void)setBrainLoader:(id)a3
{
}

- (int64_t)msuHandle
{
  return self->_msuHandle;
}

- (void)setMsuHandle:(int64_t)a3
{
  self->_msuHandle = a3;
}

- (SUCoreRollbackDescriptor)rollbackDescriptor
{
  return self->_rollbackDescriptor;
}

- (void)setRollbackDescriptor:(id)a3
{
}

- (OS_os_transaction)loadBrainTransaction
{
  return self->_loadBrainTransaction;
}

- (void)setLoadBrainTransaction:(id)a3
{
}

- (OS_os_transaction)preflightDownloadSUTransaction
{
  return self->_preflightDownloadSUTransaction;
}

- (void)setPreflightDownloadSUTransaction:(id)a3
{
}

- (OS_os_transaction)preflightPersonalizeTransaction
{
  return self->_preflightPersonalizeTransaction;
}

- (void)setPreflightPersonalizeTransaction:(id)a3
{
}

- (OS_os_transaction)preflightFDRRecoveryTransaction
{
  return self->_preflightFDRRecoveryTransaction;
}

- (void)setPreflightFDRRecoveryTransaction:(id)a3
{
}

- (OS_os_transaction)preflightWakeupTransaction
{
  return self->_preflightWakeupTransaction;
}

- (void)setPreflightWakeupTransaction:(id)a3
{
}

- (OS_os_transaction)preflightPrerequisiteCheckTransaction
{
  return self->_preflightPrerequisiteCheckTransaction;
}

- (void)setPreflightPrerequisiteCheckTransaction:(id)a3
{
}

- (OS_os_transaction)prepareUpdateTransaction
{
  return self->_prepareUpdateTransaction;
}

- (void)setPrepareUpdateTransaction:(id)a3
{
}

- (OS_os_transaction)suspendUpdateTransaction
{
  return self->_suspendUpdateTransaction;
}

- (void)setSuspendUpdateTransaction:(id)a3
{
}

- (OS_os_transaction)resumeUpdateTransaction
{
  return self->_resumeUpdateTransaction;
}

- (void)setResumeUpdateTransaction:(id)a3
{
}

- (OS_os_transaction)applyUpdateTransaction
{
  return self->_applyUpdateTransaction;
}

- (void)setApplyUpdateTransaction:(id)a3
{
}

- (OS_os_transaction)cancelPrepareTransaction
{
  return self->_cancelPrepareTransaction;
}

- (void)setCancelPrepareTransaction:(id)a3
{
}

- (OS_os_transaction)removePreparedTransaction
{
  return self->_removePreparedTransaction;
}

- (void)setRemovePreparedTransaction:(id)a3
{
}

- (OS_os_transaction)rollbackUpdateTransaction
{
  return self->_rollbackUpdateTransaction;
}

- (void)setRollbackUpdateTransaction:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

- (void)_newMSUOptionsUsingPolicy:(void *)a1 descriptor:(os_log_s *)a2 baseOptions:.cold.1(void *a1, os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  [a1 updateBrainLocationOverride];
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue();
  int v4 = 138543362;
  id v5 = v3;
  _os_log_error_impl( &dword_187A54000,  a2,  OS_LOG_TYPE_ERROR,  "[NEW_MSU_OPTIONS] WARNING WARNING WARNING: Setting update brain location override: %{public}@",  (uint8_t *)&v4,  0xCu);
}

void __37__SUCoreMSU__operationPrepareUpdate___block_invoke_cold_1(void *a1, uint64_t a2, os_log_s *a3)
{
  *(_DWORD *)BOOL v3 = 138543618;
  *(void *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_1( &dword_187A54000,  a2,  a3,  "%{public}@ MSU prepare completed with error (not updating msuHandle): %@",  *(void *)v3,  *(void *)&v3[8],  *(void *)&v3[16]);
  OUTLINED_FUNCTION_2_0();
}

void __36__SUCoreMSU__operationResumeUpdate___block_invoke_2_cold_1()
{
}

void __45__SUCoreMSU__operationRollbackUpdatePrepare___block_invoke_2_cold_1()
{
}

void __45__SUCoreMSU__operationRollbackUpdateSuspend___block_invoke_728_cold_1()
{
}

void __44__SUCoreMSU__operationRollbackUpdateResume___block_invoke_734_cold_1()
{
}

void __43__SUCoreMSU__operationRollbackUpdateApply___block_invoke_742_cold_1()
{
}

@end