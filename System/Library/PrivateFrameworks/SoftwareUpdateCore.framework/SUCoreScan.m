@interface SUCoreScan
+ (BOOL)isPreSUStagingEnabledForUpdate:(id)a3 policy:(id)a4 reason:(id *)a5;
+ (id)_generateStateTable;
+ (id)_phaseName:(int)a3;
- (BOOL)_decideAndProcessPSUSScanForPrimaryDescriptor:(id)a3 secondaryDescriptor:(id)a4 andError:(id)a5;
- (BOOL)_decideAndProcessSlowReleaseScan;
- (BOOL)_decideAndProcessSplomboScan;
- (BOOL)_shouldPerformAlternateScanFromFoundDescriptor:(id)a3 policy:(id)a4;
- (BOOL)_shouldPerformPSUSScanFromFoundDescriptor:(id)a3 policy:(id)a4;
- (BOOL)_shouldPerformSplomboScanFromFoundDescriptor:(id)a3 policy:(id)a4;
- (BOOL)cancelingOperation;
- (BOOL)downloadDocumentation;
- (MAAsset)primaryUpdateAsset;
- (MAAsset)secondaryUpdateAsset;
- (NSString)alternateAssetAudienceUUID;
- (NSString)scanUUID;
- (OS_dispatch_queue)clientCompletionQueue;
- (OS_os_transaction)scanCancelTransaction;
- (OS_os_transaction)scanCheckTransaction;
- (OS_os_transaction)scanCollectTransaction;
- (OS_os_transaction)scanLocateTransaction;
- (OS_os_transaction)scanVerifyTransaction;
- (SUCoreDescriptor)activeDescriptor;
- (SUCoreDescriptor)psusPrimaryDescriptor;
- (SUCoreDescriptor)psusSecondaryDescriptor;
- (SUCoreFSM)scanFSM;
- (SUCoreMobileAsset)maDocumentationControl;
- (SUCorePolicy)originalScanPolicy;
- (SUCorePolicy)scanPolicy;
- (SUCoreScan)initWithUUID:(id)a3;
- (SUCoreScan)initWithUUID:(id)a3 withCompletionQueue:(id)a4;
- (SUCoreScanParam)interimScanResult;
- (id)_createEvent:(id)a3;
- (id)_operationName;
- (id)_simDescriptorAttributes;
- (id)cancelCompletion;
- (id)checkCompletion;
- (id)checkMajorMinorCompletion;
- (id)checkSlowReleaseCompletion;
- (id)collectCompletion;
- (id)description;
- (id)locateCompletion;
- (id)verifyCompletion;
- (int)_getPhaseAndPostEventAfterReachingScanPhase:(int)a3;
- (int)operation;
- (int)operationSPIType;
- (int)pendingMobileAssetRequests;
- (int)phase;
- (int64_t)_decrementMobileAssetPending:(id)a3;
- (int64_t)_determinePSUSAssets;
- (int64_t)_downloadCatalog:(id)a3 withIdentifier:(id)a4;
- (int64_t)a_SimCatalogDownloadSuccess:(id *)a3;
- (int64_t)a_SimQueryMetadataUpdateAvailable:(id *)a3;
- (int64_t)actionAfterAvailCancelSuccess:(id)a3 error:(id *)a4;
- (int64_t)actionAfterFailCancelSuccess:(id)a3 error:(id *)a4;
- (int64_t)actionAfterFailCheckCancelDone:(id)a3 error:(id *)a4;
- (int64_t)actionAlterDocDownloadConfig:(id *)a3;
- (int64_t)actionCancelDocCatalogDownload:(id *)a3;
- (int64_t)actionCancelDone:(id *)a3;
- (int64_t)actionCancelPSUSAssetsDetermination:(id *)a3;
- (int64_t)actionCancelRemoveFailed:(id)a3 error:(id *)a4;
- (int64_t)actionCancelSUCatalogDownload:(id *)a3;
- (int64_t)actionCancelSuccess:(id *)a3;
- (int64_t)actionCheckCancelDone:(id *)a3;
- (int64_t)actionDeterminePSUSAssets:(id *)a3;
- (int64_t)actionDownloadDocAsset:(id *)a3;
- (int64_t)actionDownloadDocCatalog:(id *)a3;
- (int64_t)actionDownloadSUCatalog:(id *)a3;
- (int64_t)actionQueryDocMetadata:(id *)a3;
- (int64_t)actionQuerySUMetadata:(id *)a3;
- (int64_t)actionRemoveDocAsset:(id *)a3;
- (int64_t)actionScanCompleteNoUpdate:(id *)a3;
- (int64_t)actionScanFailed:(id)a3 error:(id *)a4;
- (int64_t)actionScanSuccess:(id)a3 error:(id *)a4;
- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4;
- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8;
- (unint64_t)actionDecideNextScanStep:(id *)a3;
- (unint64_t)actionDeterminePSUSAssetsFailed:(id)a3 error:(id *)a4;
- (unint64_t)actionDeterminePSUSAssetsSuccess:(id)a3 error:(id *)a4;
- (unint64_t)actionScanComplete:(id *)a3;
- (void)_cancelCompleteWithError:(id)a3;
- (void)_cancelEndComplete:(id)a3 error:(id)a4 clearingTransaction:(BOOL)a5;
- (void)_checkEndComplete:(id)a3 scanPolicy:(id)a4 primary:(id)a5 secondary:(id)a6 error:(id)a7 clearingTransaction:(BOOL)a8;
- (void)_checkMajorMinorEndComplete:(id)a3 scanPolicy:(id)a4 majorPrimary:(id)a5 majorSecondary:(id)a6 minorPrimary:(id)a7 minorSecondary:(id)a8 error:(id)a9 clearingTransaction:(BOOL)a10;
- (void)_checkSlowReleaseEndComplete:(id)a3 scanPolicy:(id)a4 primary:(id)a5 secondary:(id)a6 alternatePrimary:(id)a7 alternateSecondary:(id)a8 error:(id)a9 clearingTransaction:(BOOL)a10;
- (void)_clearCurrentOperation;
- (void)_collectEndComplete:(id)a3 scanPolicy:(id)a4 active:(id)a5 error:(id)a6 clearingTransaction:(BOOL)a7;
- (void)_filterDocQueryResults:(id)a3;
- (void)_filterSUQueryResults:(id)a3;
- (void)_filterSUQueryResultsForSPITypeMajorMinorFromQuery:(id)a3;
- (void)_filterSUQueryResultsForSPITypeSingleFromQuery:(id)a3;
- (void)_incrementMobileAssetPending:(id)a3;
- (void)_invalidOperation:(id)a3;
- (void)_locateEndComplete:(id)a3 scanPolicy:(id)a4 primary:(id)a5 secondary:(id)a6 error:(id)a7 clearingTransaction:(BOOL)a8;
- (void)_operationCompleting:(id)a3 error:(id)a4 clearingTransaction:(BOOL)a5;
- (void)_reportPSUSDetermineFinishedEvent:(id)a3 duration:(double)a4;
- (void)_reportPSUSDetermineStartedEvent;
- (void)_scanCompleteFoundPrimary:(id)a3 foundSecondary:(id)a4 majorPrimary:(id)a5 majorSecondary:(id)a6 minorPrimary:(id)a7 minorSecondary:(id)a8 clearingOperation:(BOOL)a9 error:(id)a10;
- (void)_trackInconsistentAnomalyAndUpdateInterimResult:(id)a3 reason:(id)a4;
- (void)_trackScanBegin:(id)a3;
- (void)_trackScanBegin:(id)a3 withIdentifier:(id)a4;
- (void)_trackScanEnd:(id)a3 withIdentifier:(id)a4 withResult:(int64_t)a5 withError:(id)a6;
- (void)_trackScanEnd:(id)a3 withResult:(int64_t)a4 withError:(id)a5;
- (void)_updateInterimScanResultForSlowReleaseWithPrimary:(id)a3 secondary:(id)a4 error:(id)a5;
- (void)_updateInterimScanResultForSplomboWithPrimary:(id)a3 secondary:(id)a4 majorPrimary:(id)a5 majorSecondary:(id)a6 minorPrimary:(id)a7 minorSecondary:(id)a8 error:(id)a9;
- (void)_updateInterimScanResultWithPrimary:(id)a3 secondary:(id)a4 majorPrimary:(id)a5 majorSecondary:(id)a6 minorPrimary:(id)a7 minorSecondary:(id)a8 error:(id)a9;
- (void)_verifyEndComplete:(id)a3 scanPolicy:(id)a4 active:(id)a5 primary:(id)a6 secondary:(id)a7 error:(id)a8 clearingTransaction:(BOOL)a9;
- (void)alterCurrentPolicy:(id)a3;
- (void)cancelCurrentScan:(id)a3;
- (void)checkForAvailableMajorMinorUpdatesWithPolicy:(id)a3 completion:(id)a4;
- (void)checkForAvailableSlowReleaseUpdatesWithPolicy:(id)a3 completion:(id)a4;
- (void)checkForAvailableUpdateWithPolicy:(id)a3 completion:(id)a4;
- (void)collectDocumentationMetadataWithPolicy:(id)a3 descriptor:(id)a4 downloadDocumentation:(BOOL)a5 completion:(id)a6;
- (void)locateAvailableUpdateWithPolicy:(id)a3 completion:(id)a4;
- (void)setActiveDescriptor:(id)a3;
- (void)setAlternateAssetAudienceUUID:(id)a3;
- (void)setCancelCompletion:(id)a3;
- (void)setCancelingOperation:(BOOL)a3;
- (void)setCheckCompletion:(id)a3;
- (void)setCheckMajorMinorCompletion:(id)a3;
- (void)setCheckSlowReleaseCompletion:(id)a3;
- (void)setCollectCompletion:(id)a3;
- (void)setDownloadDocumentation:(BOOL)a3;
- (void)setInterimScanResult:(id)a3;
- (void)setLocateCompletion:(id)a3;
- (void)setMaDocumentationControl:(id)a3;
- (void)setOperation:(int)a3;
- (void)setOperationSPIType:(int)a3;
- (void)setOriginalScanPolicy:(id)a3;
- (void)setPendingMobileAssetRequests:(int)a3;
- (void)setPhase:(int)a3;
- (void)setPrimaryUpdateAsset:(id)a3;
- (void)setPsusPrimaryDescriptor:(id)a3;
- (void)setPsusSecondaryDescriptor:(id)a3;
- (void)setScanCancelTransaction:(id)a3;
- (void)setScanCheckTransaction:(id)a3;
- (void)setScanCollectTransaction:(id)a3;
- (void)setScanLocateTransaction:(id)a3;
- (void)setScanPolicy:(id)a3;
- (void)setScanVerifyTransaction:(id)a3;
- (void)setSecondaryUpdateAsset:(id)a3;
- (void)setVerifyCompletion:(id)a3;
- (void)verifyLatestAvailableWithPolicy:(id)a3 descriptor:(id)a4 completion:(id)a5;
@end

@implementation SUCoreScan

+ (id)_generateStateTable
{
  v192[9] = *MEMORY[0x1895F89C0];
  v191[0] = @"Idle";
  v189[0] = @"DecideNextScanStep";
  uint64_t v187 = *MEMORY[0x1896127D0];
  uint64_t v2 = v187;
  v188 = @"DecideNextScanStep";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v188 forKeys:&v187 count:1];
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  v190[0] = v68;
  v189[1] = @"CheckForAvailableUpdate";
  v185[0] = *MEMORY[0x1896129F8];
  uint64_t v3 = v185[0];
  v185[1] = v2;
  v186[0] = @"DownloadingSUCatalog";
  v186[1] = @"DownloadSUCatalog";
  [MEMORY[0x189603F68] dictionaryWithObjects:v186 forKeys:v185 count:2];
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v190[1] = v67;
  v189[2] = @"VerifyLatestAvailable";
  v183[0] = v3;
  v183[1] = v2;
  v184[0] = @"DownloadingSUCatalog";
  v184[1] = @"DownloadSUCatalog";
  [MEMORY[0x189603F68] dictionaryWithObjects:v184 forKeys:v183 count:2];
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v190[2] = v66;
  v189[3] = @"CollectDocMetadata";
  v181[0] = v3;
  v181[1] = v2;
  v182[0] = @"DownloadingDocCatalog";
  v182[1] = @"DownloadDocCatalog";
  [MEMORY[0x189603F68] dictionaryWithObjects:v182 forKeys:v181 count:2];
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v190[3] = v65;
  v189[4] = @"DeterminePSUSAssets";
  v179[0] = v3;
  v179[1] = v2;
  v180[0] = @"DeterminingPSUSAssets";
  v180[1] = @"DeterminePSUSAssets";
  [MEMORY[0x189603F68] dictionaryWithObjects:v180 forKeys:v179 count:2];
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v190[4] = v64;
  v189[5] = @"ScanComplete";
  uint64_t v177 = v2;
  v178 = @"ScanComplete";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v178 forKeys:&v177 count:1];
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v190[5] = v63;
  [MEMORY[0x189603F68] dictionaryWithObjects:v190 forKeys:v189 count:6];
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v192[0] = v62;
  v191[1] = @"DownloadingSUCatalog";
  v175[0] = @"CatalogDownloadSuccess";
  v173[0] = v3;
  v173[1] = v2;
  v174[0] = @"QueryingSUMetadata";
  v174[1] = @"QuerySUMetadata";
  [MEMORY[0x189603F68] dictionaryWithObjects:v174 forKeys:v173 count:2];
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v176[0] = v61;
  v175[1] = @"CatalogDownloadFailed";
  v171[0] = v3;
  v171[1] = v2;
  v172[0] = @"Idle";
  v172[1] = @"ScanFailed";
  [MEMORY[0x189603F68] dictionaryWithObjects:v172 forKeys:v171 count:2];
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v176[1] = v60;
  v175[2] = @"AlterCurrentPolicy";
  uint64_t v169 = v2;
  uint64_t v170 = *MEMORY[0x1896129D8];
  uint64_t v4 = v170;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v170 forKeys:&v169 count:1];
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v176[2] = v59;
  v175[3] = @"CancelCurrentScan";
  v167[0] = v3;
  v167[1] = v2;
  v168[0] = @"Canceling";
  v168[1] = @"CancelSUCatalogDownload";
  [MEMORY[0x189603F68] dictionaryWithObjects:v168 forKeys:v167 count:2];
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v176[3] = v58;
  [MEMORY[0x189603F68] dictionaryWithObjects:v176 forKeys:v175 count:4];
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v192[1] = v57;
  v191[2] = @"QueryingSUMetadata";
  v165[0] = @"QueryMetadataNoAssetFound";
  v163[0] = v3;
  v163[1] = v2;
  v164[0] = @"Idle";
  v164[1] = @"ScanCompleteNoUpdate";
  [MEMORY[0x189603F68] dictionaryWithObjects:v164 forKeys:v163 count:2];
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  v166[0] = v56;
  v165[1] = @"QueryMetadataUpdateAvailable";
  v161[0] = v3;
  v161[1] = v2;
  v162[0] = @"Idle";
  v162[1] = @"ScanSuccess";
  [MEMORY[0x189603F68] dictionaryWithObjects:v162 forKeys:v161 count:2];
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v166[1] = v55;
  v165[2] = @"QueryMetadataFailed";
  v159[0] = v3;
  v159[1] = v2;
  v160[0] = @"Idle";
  v160[1] = @"ScanFailed";
  [MEMORY[0x189603F68] dictionaryWithObjects:v160 forKeys:v159 count:2];
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v166[2] = v54;
  v165[3] = @"AlterCurrentPolicy";
  uint64_t v157 = v2;
  uint64_t v158 = v4;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v158 forKeys:&v157 count:1];
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v166[3] = v53;
  v165[4] = @"CancelCurrentScan";
  uint64_t v155 = v3;
  v156 = @"Canceling";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v156 forKeys:&v155 count:1];
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v166[4] = v52;
  [MEMORY[0x189603F68] dictionaryWithObjects:v166 forKeys:v165 count:5];
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v192[2] = v51;
  v191[3] = @"DeterminingPSUSAssets";
  v153[0] = @"PSUSAssetsDetermineSuccess";
  v151[0] = v3;
  v151[1] = v2;
  v152[0] = @"Idle";
  v152[1] = @"DeterminePSUSAssetsSuccess";
  [MEMORY[0x189603F68] dictionaryWithObjects:v152 forKeys:v151 count:2];
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v154[0] = v50;
  v153[1] = @"PSUSAssetsDetermineFailed";
  v149[0] = v3;
  v149[1] = v2;
  v150[0] = @"Idle";
  v150[1] = @"DeterminePSUSAssetsFailed";
  [MEMORY[0x189603F68] dictionaryWithObjects:v150 forKeys:v149 count:2];
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v154[1] = v49;
  v153[2] = @"AlterCurrentPolicy";
  uint64_t v147 = v2;
  uint64_t v148 = v4;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v148 forKeys:&v147 count:1];
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v154[2] = v48;
  v153[3] = @"CancelCurrentScan";
  v145[0] = v3;
  v145[1] = v2;
  v146[0] = @"Canceling";
  v146[1] = @"CancelPSUSAssetsDetermination";
  [MEMORY[0x189603F68] dictionaryWithObjects:v146 forKeys:v145 count:2];
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v154[3] = v47;
  [MEMORY[0x189603F68] dictionaryWithObjects:v154 forKeys:v153 count:4];
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v192[3] = v46;
  v191[4] = @"DownloadingDocCatalog";
  v143[0] = @"CatalogDownloadSuccess";
  v141[0] = v3;
  v141[1] = v2;
  v142[0] = @"QueryingDocMetadata";
  v142[1] = @"QueryDocMetadata";
  [MEMORY[0x189603F68] dictionaryWithObjects:v142 forKeys:v141 count:2];
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v144[0] = v45;
  v143[1] = @"CatalogDownloadFailed";
  v139[0] = v3;
  v139[1] = v2;
  v140[0] = @"Idle";
  v140[1] = @"ScanFailed";
  [MEMORY[0x189603F68] dictionaryWithObjects:v140 forKeys:v139 count:2];
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v144[1] = v44;
  v143[2] = @"AlterCurrentPolicy";
  uint64_t v137 = v2;
  uint64_t v138 = v4;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v138 forKeys:&v137 count:1];
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v144[2] = v43;
  v143[3] = @"CancelCurrentScan";
  v135[0] = v3;
  v135[1] = v2;
  v136[0] = @"Canceling";
  v136[1] = @"CancelDocCatalogDownload";
  [MEMORY[0x189603F68] dictionaryWithObjects:v136 forKeys:v135 count:2];
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v144[3] = v42;
  [MEMORY[0x189603F68] dictionaryWithObjects:v144 forKeys:v143 count:4];
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v192[4] = v41;
  v191[5] = @"QueryingDocMetadata";
  v133[0] = @"QueryMetadataNoAssetFound";
  v131[0] = v3;
  v131[1] = v2;
  v132[0] = @"Idle";
  v132[1] = @"ScanFailed";
  [MEMORY[0x189603F68] dictionaryWithObjects:v132 forKeys:v131 count:2];
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v134[0] = v40;
  v133[1] = @"QueryMetadataSuccess";
  v129[0] = v3;
  v129[1] = v2;
  v130[0] = @"Idle";
  v130[1] = @"ScanSuccess";
  [MEMORY[0x189603F68] dictionaryWithObjects:v130 forKeys:v129 count:2];
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v134[1] = v39;
  v133[2] = @"QueryMetadataNeedDoc";
  v127[0] = v3;
  v127[1] = v2;
  v128[0] = @"DownloadingDocAsset";
  v128[1] = @"DownloadDocAsset";
  [MEMORY[0x189603F68] dictionaryWithObjects:v128 forKeys:v127 count:2];
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v134[2] = v38;
  v133[3] = @"QueryMetadataFailed";
  v125[0] = v3;
  v125[1] = v2;
  v126[0] = @"Idle";
  v126[1] = @"ScanFailed";
  [MEMORY[0x189603F68] dictionaryWithObjects:v126 forKeys:v125 count:2];
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v134[3] = v37;
  v133[4] = @"AlterCurrentPolicy";
  uint64_t v123 = v2;
  uint64_t v124 = v4;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v124 forKeys:&v123 count:1];
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v134[4] = v36;
  v133[5] = @"CancelCurrentScan";
  uint64_t v121 = v3;
  v122 = @"Canceling";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v122 forKeys:&v121 count:1];
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v134[5] = v35;
  [MEMORY[0x189603F68] dictionaryWithObjects:v134 forKeys:v133 count:6];
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v192[5] = v34;
  v191[6] = @"DownloadingDocAsset";
  v119[0] = @"DocDownloadSuccess";
  v117[0] = v3;
  v117[1] = v2;
  v118[0] = @"Idle";
  v118[1] = @"ScanSuccess";
  [MEMORY[0x189603F68] dictionaryWithObjects:v118 forKeys:v117 count:2];
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v120[0] = v33;
  v119[1] = @"DocDownloadFailed";
  v115[0] = v3;
  v115[1] = v2;
  v116[0] = @"Idle";
  v116[1] = @"ScanFailed";
  [MEMORY[0x189603F68] dictionaryWithObjects:v116 forKeys:v115 count:2];
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v120[1] = v32;
  v119[2] = @"AlterCurrentPolicy";
  uint64_t v113 = v2;
  v114 = @"AlterDocDownloadConfig";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v114 forKeys:&v113 count:1];
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v120[2] = v31;
  v119[3] = @"CancelCurrentScan";
  v111[0] = v3;
  v111[1] = v2;
  v112[0] = @"Canceling";
  v112[1] = @"RemoveDocAsset";
  [MEMORY[0x189603F68] dictionaryWithObjects:v112 forKeys:v111 count:2];
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v120[3] = v30;
  [MEMORY[0x189603F68] dictionaryWithObjects:v120 forKeys:v119 count:4];
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v192[6] = v29;
  v191[7] = @"Canceling";
  v109[0] = @"CatalogDownloadSuccess";
  uint64_t v107 = v2;
  v108 = @"CheckCancelDone";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v108 forKeys:&v107 count:1];
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v110[0] = v28;
  v109[1] = @"CatalogDownloadFailed";
  uint64_t v105 = v2;
  v106 = @"AfterFailCheckCancelDone";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v106 forKeys:&v105 count:1];
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v110[1] = v27;
  v109[2] = @"CatalogDownloadCancelSuccess";
  uint64_t v103 = v2;
  v104 = @"CheckCancelDone";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v104 forKeys:&v103 count:1];
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v110[2] = v26;
  v109[3] = @"CatalogDownloadCancelFailed";
  uint64_t v101 = v2;
  v102 = @"AfterFailCheckCancelDone";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v102 forKeys:&v101 count:1];
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v110[3] = v25;
  v109[4] = @"PSUSAssetsDetermineSuccess";
  uint64_t v99 = v2;
  v100 = @"CheckCancelDone";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v100 forKeys:&v99 count:1];
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v110[4] = v24;
  v109[5] = @"PSUSAssetsDetermineFailed";
  uint64_t v97 = v2;
  v98 = @"AfterFailCheckCancelDone";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v98 forKeys:&v97 count:1];
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v110[5] = v23;
  v109[6] = @"PSUSAssetsDetermineCancelSuccess";
  uint64_t v95 = v2;
  v96 = @"CheckCancelDone";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v96 forKeys:&v95 count:1];
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v110[6] = v22;
  v109[7] = @"PSUSAssetsDetermineCancelFailed";
  uint64_t v93 = v2;
  v94 = @"AfterFailCheckCancelDone";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v94 forKeys:&v93 count:1];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v110[7] = v21;
  v109[8] = @"QueryMetadataNoAssetFound";
  v91[0] = v3;
  v91[1] = v2;
  v92[0] = @"Idle";
  v92[1] = @"CancelSuccess";
  [MEMORY[0x189603F68] dictionaryWithObjects:v92 forKeys:v91 count:2];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v110[8] = v20;
  v109[9] = @"QueryMetadataUpdateAvailable";
  v89[0] = v3;
  v89[1] = v2;
  v90[0] = @"Idle";
  v90[1] = @"AfterAvailCancelSuccess";
  [MEMORY[0x189603F68] dictionaryWithObjects:v90 forKeys:v89 count:2];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v110[9] = v18;
  v109[10] = @"QueryMetadataNeedDoc";
  v87[0] = v3;
  v87[1] = v2;
  v88[0] = @"Idle";
  v88[1] = @"CancelSuccess";
  [MEMORY[0x189603F68] dictionaryWithObjects:v88 forKeys:v87 count:2];
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v110[10] = v17;
  v109[11] = @"QueryMetadataSuccess";
  v85[0] = v3;
  v85[1] = v2;
  v86[0] = @"Idle";
  v86[1] = @"CancelSuccess";
  [MEMORY[0x189603F68] dictionaryWithObjects:v86 forKeys:v85 count:2];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v110[11] = v16;
  v109[12] = @"QueryMetadataFailed";
  v83[0] = v3;
  v83[1] = v2;
  v84[0] = @"Idle";
  v84[1] = @"AfterFailCancelSuccess";
  [MEMORY[0x189603F68] dictionaryWithObjects:v84 forKeys:v83 count:2];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v110[12] = v5;
  v109[13] = @"DocDownloadSuccess";
  uint64_t v81 = v2;
  v82 = @"CheckCancelDone";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v110[13] = v6;
  v109[14] = @"DocDownloadFailed";
  uint64_t v79 = v2;
  v80 = @"AfterFailCheckCancelDone";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v80 forKeys:&v79 count:1];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v110[14] = v7;
  v109[15] = @"DocRemoveSuccess";
  uint64_t v77 = v2;
  v78 = @"CheckCancelDone";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v110[15] = v8;
  v109[16] = @"DocRemoveFailed";
  uint64_t v75 = v2;
  v76 = @"AfterFailCheckCancelDone";
  [MEMORY[0x189603F68] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v110[16] = v9;
  v109[17] = @"CancelComplete";
  v73[0] = v3;
  v73[1] = v2;
  v74[0] = @"Idle";
  v74[1] = @"CancelDone";
  [MEMORY[0x189603F68] dictionaryWithObjects:v74 forKeys:v73 count:2];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v110[17] = v10;
  [MEMORY[0x189603F68] dictionaryWithObjects:v110 forKeys:v109 count:18];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v192[7] = v11;
  v191[8] = *MEMORY[0x1896129E8];
  uint64_t v71 = *MEMORY[0x1896129E0];
  uint64_t v69 = v3;
  uint64_t v70 = *MEMORY[0x1896129F0];
  [MEMORY[0x189603F68] dictionaryWithObjects:&v70 forKeys:&v69 count:1];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v12;
  [MEMORY[0x189603F68] dictionaryWithObjects:&v72 forKeys:&v71 count:1];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v192[8] = v13;
  [MEMORY[0x189603F68] dictionaryWithObjects:v192 forKeys:v191 count:9];
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)[objc_alloc(MEMORY[0x189603F68]) initWithDictionary:v19 copyItems:1];
  return v14;
}

- (int64_t)performAction:(id)a3 onEvent:(id)a4 inState:(id)a5 withInfo:(id)a6 nextState:(id)a7 error:(id *)a8
{
  id v11 = a3;
  id v12 = a6;
  v13 = -[SUCoreScan scanFSM](self, "scanFSM");
  [v13 extendedStateQueue];
  v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  if ([v11 isEqualToString:*MEMORY[0x1896129D8]])
  {
    int64_t v15 = 0LL;
  }

  else
  {
    if ([v11 isEqualToString:@"DecideNextScanStep"])
    {
      int64_t v16 = -[SUCoreScan actionDecideNextScanStep:](self, "actionDecideNextScanStep:", a8);
    }

    else if ([v11 isEqualToString:@"DownloadSUCatalog"])
    {
      int64_t v16 = -[SUCoreScan actionDownloadSUCatalog:](self, "actionDownloadSUCatalog:", a8);
    }

    else if ([v11 isEqualToString:@"QuerySUMetadata"])
    {
      int64_t v16 = -[SUCoreScan actionQuerySUMetadata:](self, "actionQuerySUMetadata:", a8);
    }

    else if ([v11 isEqualToString:@"DeterminePSUSAssets"])
    {
      int64_t v16 = -[SUCoreScan actionDeterminePSUSAssets:](self, "actionDeterminePSUSAssets:", a8);
    }

    else if ([v11 isEqualToString:@"DownloadDocCatalog"])
    {
      int64_t v16 = -[SUCoreScan actionDownloadDocCatalog:](self, "actionDownloadDocCatalog:", a8);
    }

    else if ([v11 isEqualToString:@"QueryDocMetadata"])
    {
      int64_t v16 = -[SUCoreScan actionQueryDocMetadata:](self, "actionQueryDocMetadata:", a8);
    }

    else if ([v11 isEqualToString:@"DownloadDocAsset"])
    {
      int64_t v16 = -[SUCoreScan actionDownloadDocAsset:](self, "actionDownloadDocAsset:", a8);
    }

    else if ([v11 isEqualToString:@"AlterDocDownloadConfig"])
    {
      int64_t v16 = -[SUCoreScan actionAlterDocDownloadConfig:](self, "actionAlterDocDownloadConfig:", a8);
    }

    else if ([v11 isEqualToString:@"RemoveDocAsset"])
    {
      int64_t v16 = -[SUCoreScan actionRemoveDocAsset:](self, "actionRemoveDocAsset:", a8);
    }

    else if ([v11 isEqualToString:@"ScanCompleteNoUpdate"])
    {
      int64_t v16 = -[SUCoreScan actionScanCompleteNoUpdate:](self, "actionScanCompleteNoUpdate:", a8);
    }

    else if ([v11 isEqualToString:@"ScanSuccess"])
    {
      int64_t v16 = -[SUCoreScan actionScanSuccess:error:](self, "actionScanSuccess:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"ScanFailed"])
    {
      int64_t v16 = -[SUCoreScan actionScanFailed:error:](self, "actionScanFailed:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"DeterminePSUSAssetsSuccess"])
    {
      int64_t v16 = -[SUCoreScan actionDeterminePSUSAssetsSuccess:error:]( self,  "actionDeterminePSUSAssetsSuccess:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"DeterminePSUSAssetsFailed"])
    {
      int64_t v16 = -[SUCoreScan actionDeterminePSUSAssetsFailed:error:]( self,  "actionDeterminePSUSAssetsFailed:error:",  v12,  a8);
    }

    else if ([v11 isEqualToString:@"ScanComplete"])
    {
      int64_t v16 = -[SUCoreScan actionScanComplete:](self, "actionScanComplete:", a8);
    }

    else if ([v11 isEqualToString:@"CancelSUCatalogDownload"])
    {
      int64_t v16 = -[SUCoreScan actionCancelSUCatalogDownload:](self, "actionCancelSUCatalogDownload:", a8);
    }

    else if ([v11 isEqualToString:@"CancelDocCatalogDownload"])
    {
      int64_t v16 = -[SUCoreScan actionCancelDocCatalogDownload:](self, "actionCancelDocCatalogDownload:", a8);
    }

    else if ([v11 isEqualToString:@"CancelSuccess"])
    {
      int64_t v16 = -[SUCoreScan actionCancelSuccess:](self, "actionCancelSuccess:", a8);
    }

    else if ([v11 isEqualToString:@"AfterAvailCancelSuccess"])
    {
      int64_t v16 = -[SUCoreScan actionAfterAvailCancelSuccess:error:](self, "actionAfterAvailCancelSuccess:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"AfterFailCancelSuccess"])
    {
      int64_t v16 = -[SUCoreScan actionAfterFailCancelSuccess:error:](self, "actionAfterFailCancelSuccess:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"CancelRemoveFailed"])
    {
      int64_t v16 = -[SUCoreScan actionCancelRemoveFailed:error:](self, "actionCancelRemoveFailed:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"CheckCancelDone"])
    {
      int64_t v16 = -[SUCoreScan actionCheckCancelDone:](self, "actionCheckCancelDone:", a8);
    }

    else if ([v11 isEqualToString:@"AfterFailCheckCancelDone"])
    {
      int64_t v16 = -[SUCoreScan actionAfterFailCheckCancelDone:error:](self, "actionAfterFailCheckCancelDone:error:", v12, a8);
    }

    else if ([v11 isEqualToString:@"CancelDone"])
    {
      int64_t v16 = -[SUCoreScan actionCancelDone:](self, "actionCancelDone:", a8);
    }

    else if ([v11 isEqualToString:@"CancelPSUSAssetsDetermination"])
    {
      int64_t v16 = -[SUCoreScan actionCancelPSUSAssetsDetermination:](self, "actionCancelPSUSAssetsDetermination:", a8);
    }

    else if ([v11 isEqualToString:@"SimCatalogDownloadSuccess"])
    {
      int64_t v16 = -[SUCoreScan a_SimCatalogDownloadSuccess:](self, "a_SimCatalogDownloadSuccess:", a8);
    }

    else if ([v11 isEqualToString:@"SimQueryMetadataUpdateAvailable"])
    {
      int64_t v16 = -[SUCoreScan a_SimQueryMetadataUpdateAvailable:](self, "a_SimQueryMetadataUpdateAvailable:", a8);
    }

    else
    {
      int64_t v16 = -[SUCoreScan actionUnknownAction:error:](self, "actionUnknownAction:error:", v11, a8);
    }

    int64_t v15 = v16;
  }

  return v15;
}

- (int64_t)actionDeterminePSUSAssets:(id *)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 extendedStateQueue];
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  return -[SUCoreScan _determinePSUSAssets](self, "_determinePSUSAssets");
}

- (int64_t)actionDownloadSUCatalog:(id *)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 extendedStateQueue];
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);
  v6 = -[SUCoreScan scanPolicy](self, "scanPolicy");
  [v6 softwareUpdateAssetType];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v8 = -[SUCoreScan _downloadCatalog:withIdentifier:](self, "_downloadCatalog:withIdentifier:", v7, @"su");

  return v8;
}

- (int64_t)actionQuerySUMetadata:(id *)a3
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  -[SUCoreScan scanFSM](self, "scanFSM", a3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 extendedStateQueue];
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  int64_t v6 = -[SUCoreScan _decrementMobileAssetPending:](self, "_decrementMobileAssetPending:", @"DownloadSUCatalog");
  v7 = -[SUCoreScan alternateAssetAudienceUUID](self, "alternateAssetAudienceUUID");
  if (v7)
  {
    -[SUCoreScan alternateAssetAudienceUUID](self, "alternateAssetAudienceUUID");
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x1896127A0] sharedLogger];
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 oslog];
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v30 = self;
      __int16 v31 = 2114;
      v32 = v8;
      id v11 = "%{public}@ SU metadata query using alternateAssetAudienceUUID as purpose: %{public}@";
LABEL_7:
      _os_log_impl(&dword_187A54000, v10, OS_LOG_TYPE_DEFAULT, v11, buf, 0x16u);
      goto LABEL_8;
    }

    goto LABEL_8;
  }

  -[SUCoreScan scanPolicy](self, "scanPolicy");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 assetAudienceUUID];
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = -[SUCoreScan scanPolicy](self, "scanPolicy");
    [v14 assetAudienceUUID];
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x1896127A0] sharedLogger];
    int64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 oslog];
    v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v30 = self;
      __int16 v31 = 2114;
      v32 = v8;
      id v11 = "%{public}@ SU metadata query using scan policy assetAudienceUUID as purpose: %{public}@";
      goto LABEL_7;
    }

void __36__SUCoreScan_actionQuerySUMetadata___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  objc_msgSend( *(id *)(a1 + 32),  "_trackScanEnd:withIdentifier:withResult:withError:",  @"queryMetaDataWithError",  @"su",  a2);
  if (a2)
  {
    [MEMORY[0x189612760] sharedCore];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 buildError:8401 underlying:v9 description:@"failed to query SU metadata"];
    int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 32) scanFSM];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    int64_t v8 = -[SUCoreScanParam initWithResult:withError:]( objc_alloc(&OBJC_CLASS___SUCoreScanParam),  "initWithResult:withError:",  a2,  v6);
    [v7 postEvent:@"QueryMetadataFailed" withInfo:v8];
  }

  else
  {
    [*(id *)(a1 + 32) _filterSUQueryResults:*(void *)(a1 + 40)];
  }
}

- (unint64_t)actionDeterminePSUSAssetsSuccess:(id)a3 error:(id *)a4
{
  id v5 = a3;
  -[SUCoreScan scanFSM](self, "scanFSM");
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 extendedStateQueue];
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  unint64_t v8 = -[SUCoreScan _decrementMobileAssetPending:]( self,  "_decrementMobileAssetPending:",  @"DeterminePSUSAssets succeeded");
  [v5 additionalInfo];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  [v9 safeObjectForKey:@"PSUSDetermineError" ofClass:objc_opt_class()];
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    [v9 safeObjectForKey:@"PSUSAssetsSizes" ofClass:objc_opt_class()];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = v11;
    if (v11)
    {
      uint64_t v13 = [v11 safeULLForKey:@"STAGE_GROUP_REQUIRED" defaultValue:0];
      uint64_t v14 = [v12 safeULLForKey:@"STAGE_GROUP_OPTIONAL" defaultValue:0];
      -[SUCoreScan psusPrimaryDescriptor](self, "psusPrimaryDescriptor");
      int64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v15 setPreSUStagingRequiredSize:v13];

      -[SUCoreScan psusPrimaryDescriptor](self, "psusPrimaryDescriptor");
      int64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 setPreSUStagingOptionalSize:v14];
      v17 = -[SUCoreScan psusSecondaryDescriptor](self, "psusSecondaryDescriptor");
      [v17 setPreSUStagingRequiredSize:v13];

      -[SUCoreScan psusSecondaryDescriptor](self, "psusSecondaryDescriptor");
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 setPreSUStagingOptionalSize:v14];
    }

    else
    {
      -[SUCoreScan scanFSM](self, "scanFSM");
      id v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 diag];
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ unexpected no assets sizes", self];
      [v19 trackAnomaly:@"[SCAN] DETERMINE_PSUS_SUCCESS" forReason:v20 withResult:8117 withError:0];
    }
  }

  [v9 safeObjectForKey:@"Duration" ofClass:objc_opt_class()];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 doubleValue];
  double v23 = v22;

  -[SUCoreScan _reportPSUSDetermineFinishedEvent:duration:]( self,  "_reportPSUSDetermineFinishedEvent:duration:",  v10,  v23);
  -[SUCoreScan setPsusPrimaryDescriptor:](self, "setPsusPrimaryDescriptor:", 0LL);
  -[SUCoreScan setPsusSecondaryDescriptor:](self, "setPsusSecondaryDescriptor:", 0LL);
  v24 = -[SUCoreScan scanFSM](self, "scanFSM");
  [v24 followupEvent:@"DecideNextScanStep"];

  return v8;
}

- (unint64_t)actionDeterminePSUSAssetsFailed:(id)a3 error:(id *)a4
{
  id v5 = a3;
  -[SUCoreScan scanFSM](self, "scanFSM");
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 extendedStateQueue];
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  unint64_t v8 = -[SUCoreScan _decrementMobileAssetPending:]( self,  "_decrementMobileAssetPending:",  @"DeterminePSUSAssets failed");
  -[SUCoreScan setInterimScanResult:](self, "setInterimScanResult:", v5);
  [v5 error];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 additionalInfo];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  [v10 safeObjectForKey:@"Duration" ofClass:objc_opt_class()];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 doubleValue];
  double v13 = v12;

  -[SUCoreScan _reportPSUSDetermineFinishedEvent:duration:]( self,  "_reportPSUSDetermineFinishedEvent:duration:",  v9,  v13);
  -[SUCoreScan setPsusPrimaryDescriptor:](self, "setPsusPrimaryDescriptor:", 0LL);
  -[SUCoreScan setPsusSecondaryDescriptor:](self, "setPsusSecondaryDescriptor:", 0LL);
  -[SUCoreScan scanFSM](self, "scanFSM");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 followupEvent:@"DecideNextScanStep"];

  return v8;
}

- (unint64_t)actionScanComplete:(id *)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 extendedStateQueue];
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[SUCoreScan operation](self, "operation") != 1)
  {
    -[SUCoreScan scanFSM](self, "scanFSM");
    int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 diag];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [NSString stringWithFormat:@"%@ invalid operation (%d) detected", self, -[SUCoreScan operation](self, "operation")];
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v13 = 8117LL;
    [v7 trackAnomaly:@"[SCAN] COMPLETE" forReason:v8 withResult:8117 withError:0];
    goto LABEL_12;
  }

  -[SUCoreScan interimScanResult](self, "interimScanResult");
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SUCoreScan scanPolicy](self, "scanPolicy");
  if (-[SUCoreScan operationSPIType](self, "operationSPIType") == 1)
  {
    -[SUCoreScan checkCompletion](self, "checkCompletion");
    unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan setCheckCompletion:](self, "setCheckCompletion:", 0LL);
    -[SUCoreScan scanPolicy](self, "scanPolicy");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 descriptor];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 fallbackDescriptor];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 error];
    double v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan _checkEndComplete:scanPolicy:primary:secondary:error:clearingTransaction:]( self,  "_checkEndComplete:scanPolicy:primary:secondary:error:clearingTransaction:",  v8,  v9,  v10,  v11,  v12,  1LL);
  }

  else
  {
    if (-[SUCoreScan operationSPIType](self, "operationSPIType") == 2)
    {
      -[SUCoreScan checkMajorMinorCompletion](self, "checkMajorMinorCompletion");
      unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreScan setCheckMajorMinorCompletion:](self, "setCheckMajorMinorCompletion:", 0LL);
      [v6 majorPrimaryDescriptor];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 majorSecondaryDescriptor];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 minorPrimaryDescriptor];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 minorSecondaryDescriptor];
      double v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 error];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v16) = 1;
      -[SUCoreScan _checkMajorMinorEndComplete:scanPolicy:majorPrimary:majorSecondary:minorPrimary:minorSecondary:error:clearingTransaction:]( self,  "_checkMajorMinorEndComplete:scanPolicy:majorPrimary:majorSecondary:minorPrimary:minorSecondary:error:clearingTransaction:",  v8,  v7,  v9,  v10,  v11,  v12,  v14,  v16);
    }

    else
    {
      if (-[SUCoreScan operationSPIType](self, "operationSPIType") != 3)
      {
        -[SUCoreScan scanFSM](self, "scanFSM");
        unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
        [v8 diag];
        id v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ unknown operationSPIType (%d) found", self, -[SUCoreScan operationSPIType](self, "operationSPIType")];
        unint64_t v13 = 8117LL;
        [v9 trackAnomaly:@"[SCAN] COMPLETE" forReason:v10 withResult:8117 withError:0];
        goto LABEL_11;
      }

      -[SUCoreScan checkSlowReleaseCompletion](self, "checkSlowReleaseCompletion");
      unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreScan setCheckSlowReleaseCompletion:](self, "setCheckSlowReleaseCompletion:", 0LL);
      [v6 majorPrimaryDescriptor];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 majorSecondaryDescriptor];
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 minorPrimaryDescriptor];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 minorSecondaryDescriptor];
      double v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v6 error];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v16) = 1;
      -[SUCoreScan _checkSlowReleaseEndComplete:scanPolicy:primary:secondary:alternatePrimary:alternateSecondary:error:clearingTransaction:]( self,  "_checkSlowReleaseEndComplete:scanPolicy:primary:secondary:alternatePrimary:alternateSecondary:error:clearingTransaction:",  v8,  v7,  v9,  v10,  v11,  v12,  v14,  v16);
    }
  }

  unint64_t v13 = 0LL;
LABEL_11:

LABEL_12:
  if (!-[SUCoreScan cancelingOperation](self, "cancelingOperation")) {
    -[SUCoreScan _clearCurrentOperation](self, "_clearCurrentOperation");
  }
  return v13;
}

- (int)_getPhaseAndPostEventAfterReachingScanPhase:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v45 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896127A0] sharedLogger];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 oslog];
  int64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = +[SUCoreScan _phaseName:](&OBJC_CLASS___SUCoreScan, "_phaseName:", v3);
    *(_DWORD *)buf = 138543618;
    v40 = self;
    __int16 v41 = 2114;
    v42 = v7;
    _os_log_impl( &dword_187A54000,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ DecideNextScanStep: reached phase = %{public}@",  buf,  0x16u);
  }

  unint64_t v8 = @"CheckForAvailableUpdate";
  uint64_t v9 = 1LL;
  switch((int)v3)
  {
    case 0:
      goto LABEL_36;
    case 1:
      if (!-[SUCoreScan _decideAndProcessSplomboScan](self, "_decideAndProcessSplomboScan")) {
        goto LABEL_6;
      }
      uint64_t v9 = 2LL;
      goto LABEL_36;
    case 2:
LABEL_6:
      if (!-[SUCoreScan _decideAndProcessSlowReleaseScan](self, "_decideAndProcessSlowReleaseScan")) {
        goto LABEL_8;
      }
      uint64_t v9 = 3LL;
      goto LABEL_36;
    case 3:
LABEL_8:
      if (-[SUCoreScan operationSPIType](self, "operationSPIType") == 1)
      {
        v10 = -[SUCoreScan interimScanResult](self, "interimScanResult");
        [v10 descriptor];
        id v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[SUCoreScan interimScanResult](self, "interimScanResult");
        double v12 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v13 = [v12 fallbackDescriptor];
LABEL_14:
        uint64_t v16 = (void *)v13;

        goto LABEL_15;
      }

      if (-[SUCoreScan operationSPIType](self, "operationSPIType") == 2
        || -[SUCoreScan operationSPIType](self, "operationSPIType") == 3)
      {
        -[SUCoreScan interimScanResult](self, "interimScanResult");
        int64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
        [v15 majorPrimaryDescriptor];
        id v11 = (void *)objc_claimAutoreleasedReturnValue();

        -[SUCoreScan interimScanResult](self, "interimScanResult");
        double v12 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v13 = [v12 majorSecondaryDescriptor];
        goto LABEL_14;
      }

      id v11 = 0LL;
      uint64_t v16 = 0LL;
LABEL_15:
      v17 = -[SUCoreScan interimScanResult](self, "interimScanResult");
      [v17 error];
      id v18 = (void *)objc_claimAutoreleasedReturnValue();

      BOOL v19 = -[SUCoreScan _decideAndProcessPSUSScanForPrimaryDescriptor:secondaryDescriptor:andError:]( self,  "_decideAndProcessPSUSScanForPrimaryDescriptor:secondaryDescriptor:andError:",  v11,  v16,  v18);
      if (v19) {
        unint64_t v8 = @"DeterminePSUSAssets";
      }
      else {
        unint64_t v8 = 0LL;
      }
      if (v19) {
        int v14 = 3;
      }
      else {
        int v14 = 4;
      }

LABEL_22:
      if (v14 == 4)
      {
        if (-[SUCoreScan operationSPIType](self, "operationSPIType") == 2
          || -[SUCoreScan operationSPIType](self, "operationSPIType") == 3)
        {
          v20 = -[SUCoreScan interimScanResult](self, "interimScanResult");
          [v20 minorPrimaryDescriptor];
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          -[SUCoreScan interimScanResult](self, "interimScanResult");
          double v22 = (void *)objc_claimAutoreleasedReturnValue();
          [v22 minorSecondaryDescriptor];
          double v23 = (void *)objc_claimAutoreleasedReturnValue();
        }

        else
        {
          v21 = 0LL;
          double v23 = 0LL;
        }
        v24 = -[SUCoreScan interimScanResult](self, "interimScanResult");
        [v24 error];
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (-[SUCoreScan _decideAndProcessPSUSScanForPrimaryDescriptor:secondaryDescriptor:andError:]( self,  "_decideAndProcessPSUSScanForPrimaryDescriptor:secondaryDescriptor:andError:",  v21,  v23,  v25))
        {
          unint64_t v8 = @"DeterminePSUSAssets";
          int v14 = 4;
        }

        else
        {
          int v14 = 5;
        }
      }

      if (v14 == 5)
      {
        unint64_t v8 = @"ScanComplete";
        uint64_t v9 = 6LL;
        goto LABEL_36;
      }

      if (v14 >= 6)
      {
        v26 = -[SUCoreScan scanFSM](self, "scanFSM");
        [v26 diag];
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        [NSString stringWithFormat:@"%@ invalid phase detected", self];
        id v28 = (void *)objc_claimAutoreleasedReturnValue();
        [v27 trackAnomaly:@"[SCAN_GET_NEXT_PHASE]" forReason:v28 withResult:8117 withError:0];

        uint64_t v9 = 0LL;
        unint64_t v8 = 0LL;
        v29 = 0LL;
LABEL_37:

        goto LABEL_38;
      }

      uint64_t v9 = (v14 + 1);
      if (v8)
      {
LABEL_36:
        v30 = objc_alloc(&OBJC_CLASS___SUCoreScanParam);
        __int16 v31 = (void *)NSString;
        v32 = +[SUCoreScan _phaseName:](&OBJC_CLASS___SUCoreScan, "_phaseName:", v3);
        +[SUCoreScan _phaseName:](&OBJC_CLASS___SUCoreScan, "_phaseName:", v9);
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        [v31 stringWithFormat:@"DecideNextScanStep: reached phase = %@, next (reached) phase = %@", v32, v33];
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = -[SUCoreScanParam initWithNote:](v30, "initWithNote:", v34);
        v26 = -[SUCoreScan scanFSM](self, "scanFSM");
        [v26 followupEvent:v8 withInfo:v29];
        goto LABEL_37;
      }

      v29 = 0LL;
LABEL_38:
      [MEMORY[0x1896127A0] sharedLogger];
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      [v35 oslog];
      v36 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = +[SUCoreScan _phaseName:](&OBJC_CLASS___SUCoreScan, "_phaseName:", v9);
        *(_DWORD *)buf = 138543874;
        v40 = self;
        __int16 v41 = 2114;
        v42 = v37;
        __int16 v43 = 2114;
        v44 = v8;
        _os_log_impl( &dword_187A54000,  v36,  OS_LOG_TYPE_DEFAULT,  "%{public}@ DecideNextScanStep: next (reached) phase = %{public}@, next event = %{public}@",  buf,  0x20u);
      }

      return v9;
    default:
      unint64_t v8 = 0LL;
      int v14 = v3;
      goto LABEL_22;
  }

- (unint64_t)actionDecideNextScanStep:(id *)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 extendedStateQueue];
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreScan setPhase:]( self,  "setPhase:",  -[SUCoreScan _getPhaseAndPostEventAfterReachingScanPhase:]( self,  "_getPhaseAndPostEventAfterReachingScanPhase:",  -[SUCoreScan phase](self, "phase")));
  return 0LL;
}

- (int64_t)actionDownloadDocCatalog:(id *)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 extendedStateQueue];
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreScan scanPolicy](self, "scanPolicy");
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 documentationAssetType];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v8 = -[SUCoreScan _downloadCatalog:withIdentifier:](self, "_downloadCatalog:withIdentifier:", v7, @"doc");

  return v8;
}

- (int64_t)actionQueryDocMetadata:(id *)a3
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  -[SUCoreScan scanFSM](self, "scanFSM", a3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 extendedStateQueue];
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  int64_t v6 = -[SUCoreScan _decrementMobileAssetPending:](self, "_decrementMobileAssetPending:", @"DownloadDocCatalog");
  v7 = -[SUCoreScan activeDescriptor](self, "activeDescriptor");
  [v7 assetAudienceUUID];
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SUCoreScan activeDescriptor](self, "activeDescriptor");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 assetAudienceUUID];
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x1896127A0] sharedLogger];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 oslog];
    double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v36 = self;
      __int16 v37 = 2114;
      v38 = v10;
      uint64_t v13 = "%{public}@ doc metadata query using activeDescriptor assetAudienceUUID as purpose: %{public}@";
LABEL_7:
      _os_log_impl(&dword_187A54000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0x16u);
      goto LABEL_8;
    }

    goto LABEL_8;
  }

  -[SUCoreScan scanPolicy](self, "scanPolicy");
  int v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 assetAudienceUUID];
  int64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    -[SUCoreScan scanPolicy](self, "scanPolicy");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 assetAudienceUUID];
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x1896127A0] sharedLogger];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 oslog];
    double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v36 = self;
      __int16 v37 = 2114;
      v38 = v10;
      uint64_t v13 = "%{public}@ doc metadata query using scan policy assetAudienceUUID as purpose: %{public}@";
      goto LABEL_7;
    }

void __37__SUCoreScan_actionQueryDocMetadata___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  objc_msgSend( *(id *)(a1 + 32),  "_trackScanEnd:withIdentifier:withResult:withError:",  @"queryMetaDataWithError",  @"doc",  a2);
  if (a2)
  {
    [MEMORY[0x189612760] sharedCore];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 buildError:8401 underlying:v9 description:@"failed to query doc metadata"];
    int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 32) scanFSM];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    int64_t v8 = -[SUCoreScanParam initWithResult:withError:]( objc_alloc(&OBJC_CLASS___SUCoreScanParam),  "initWithResult:withError:",  a2,  v6);
    [v7 postEvent:@"QueryMetadataFailed" withInfo:v8];
  }

  else
  {
    [*(id *)(a1 + 32) _filterDocQueryResults:*(void *)(a1 + 40)];
  }
}

- (int64_t)actionDownloadDocAsset:(id *)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 extendedStateQueue];
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  int64_t v6 = -[SUCoreScan _decrementMobileAssetPending:](self, "_decrementMobileAssetPending:", @"DownloadDocAsset");
  -[SUCoreScan _incrementMobileAssetPending:](self, "_incrementMobileAssetPending:", @"DownloadDocAsset");
  v7 = objc_alloc(&OBJC_CLASS___SUCoreMobileAsset);
  -[SUCoreScan activeDescriptor](self, "activeDescriptor");
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 documentationAsset];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[SUCoreScan scanUUID](self, "scanUUID");
  id v11 = -[SUCoreMobileAsset initWithDelegate:forAsset:updateUUID:]( v7,  "initWithDelegate:forAsset:updateUUID:",  0LL,  v9,  v10);
  -[SUCoreScan setMaDocumentationControl:](self, "setMaDocumentationControl:", v11);

  -[SUCoreScan maDocumentationControl](self, "maDocumentationControl");
  double v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[SUCoreScan maDocumentationControl](self, "maDocumentationControl");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan scanPolicy](self, "scanPolicy");
    int v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan scanUUID](self, "scanUUID");
    int64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan activeDescriptor](self, "activeDescriptor");
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 productBuildVersion];
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1895F87A8];
    v23[1] = 3221225472LL;
    v23[2] = __37__SUCoreScan_actionDownloadDocAsset___block_invoke;
    v23[3] = &unk_18A0F02B0;
    v23[4] = self;
    [v13 downloadDocumentationAssetWithPolicy:v14 withUUID:v15 stashingDocumentationForBuild:v17 completion:v23];
  }

  else
  {
    [MEMORY[0x189612760] sharedCore];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    int64_t v6 = 8100LL;
    [v18 buildError:8100 underlying:0 description:@"failed to allocate MA documentation control"];
    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[SUCoreScan scanFSM](self, "scanFSM");
    v21 = -[SUCoreScanParam initWithResult:withError:]( objc_alloc(&OBJC_CLASS___SUCoreScanParam),  "initWithResult:withError:",  8100LL,  v19);
    [v20 postEvent:@"DocDownloadFailed" withInfo:v21];
  }

  return v6;
}

void __37__SUCoreScan_actionDownloadDocAsset___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v11 = v3;
  if (v3)
  {
    [v4 scanFSM];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    int64_t v6 = -[SUCoreScanParam initWithResult:withError:]( [SUCoreScanParam alloc],  "initWithResult:withError:",  [v11 code],  v11);
    [v5 postEvent:@"DocDownloadFailed" withInfo:v6];
  }

  else
  {
    [v4 activeDescriptor];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 documentation];
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 extendDocumentationProperties];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 32) scanFSM];
    id v9 = (SUCoreScanParam *)objc_claimAutoreleasedReturnValue();
    int64_t v6 = v9;
    if (v5)
    {
      v10 = -[SUCoreScanParam initWithResult:withError:]( [SUCoreScanParam alloc],  "initWithResult:withError:",  [v5 code],  v5);
      -[SUCoreScanParam postEvent:withInfo:](v6, "postEvent:withInfo:", @"DocDownloadFailed", v10);
    }

    else
    {
      -[SUCoreScanParam postEvent:](v9, "postEvent:", @"DocDownloadSuccess");
    }
  }
}

- (int64_t)actionAlterDocDownloadConfig:(id *)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 extendedStateQueue];
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreScan maDocumentationControl](self, "maDocumentationControl");
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    id v7 = objc_alloc_init(MEMORY[0x189611108]);
    -[SUCoreScan scanPolicy](self, "scanPolicy");
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 documentationDownloadPolicy];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDiscretionary:", objc_msgSend(v9, "discretionary"));
    v10 = -[SUCoreScan maDocumentationControl](self, "maDocumentationControl");
    [v10 alterDownloadOptions:v7];
    int64_t v11 = 0LL;
  }

  else
  {
    -[SUCoreScan scanFSM](self, "scanFSM");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    [v7 diag];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    double v12 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ alter documentation download configuration when not downloading", self];
    int64_t v11 = 8116LL;
    [v10 trackAnomaly:@"[SCAN] ALTER" forReason:v12 withResult:8116 withError:0];
  }

  return v11;
}

- (int64_t)actionRemoveDocAsset:(id *)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 extendedStateQueue];
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreScan _incrementMobileAssetPending:](self, "_incrementMobileAssetPending:", @"RemoveDocAsset");
  -[SUCoreScan maDocumentationControl](self, "maDocumentationControl");
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SUCoreScan maDocumentationControl](self, "maDocumentationControl");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __35__SUCoreScan_actionRemoveDocAsset___block_invoke;
    v10[3] = &unk_18A0F02B0;
    v10[4] = self;
    [v7 removeAsset:v10];

    return 0LL;
  }

  else
  {
    -[SUCoreScan scanFSM](self, "scanFSM");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 postEvent:@"DocRemoveFailed"];

    return 8116LL;
  }

void __35__SUCoreScan_actionRemoveDocAsset___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [*(id *)(a1 + 32) scanFSM];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    uint64_t v4 = -[SUCoreScanParam initWithResult:withError:]( [SUCoreScanParam alloc],  "initWithResult:withError:",  [v5 code],  v5);
    [v3 postEvent:@"DocRemoveFailed" withInfo:v4];
  }

  else
  {
    [v3 postEvent:@"DocRemoveSuccess"];
  }
}

- (int64_t)actionScanCompleteNoUpdate:(id *)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 extendedStateQueue];
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreScan _decrementMobileAssetPending:](self, "_decrementMobileAssetPending:", @"ScanCompleteNoUpdate");
  [MEMORY[0x189612760] sharedCore];
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 buildError:8406 underlying:0 description:@"no update found"];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v9) = 1;
  -[SUCoreScan _scanCompleteFoundPrimary:foundSecondary:majorPrimary:majorSecondary:minorPrimary:minorSecondary:clearingOperation:error:]( self,  "_scanCompleteFoundPrimary:foundSecondary:majorPrimary:majorSecondary:minorPrimary:minorSecondary:clearingOperation:error:",  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v9,  v7);

  return 0LL;
}

- (int64_t)actionScanSuccess:(id)a3 error:(id *)a4
{
  uint64_t v65 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  -[SUCoreScan scanFSM](self, "scanFSM");
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 extendedStateQueue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  int64_t v8 = -[SUCoreScan _decrementMobileAssetPending:](self, "_decrementMobileAssetPending:", @"ScanSuccess");
  id v9 = objc_alloc_init(MEMORY[0x189603FA8]);
  v53 = self;
  int64_t v52 = v8;
  switch(-[SUCoreScan operation](self, "operation"))
  {
    case 1:
      [v5 fallbackDescriptor];
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      [MEMORY[0x1896127A0] sharedLogger];
      int64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 oslog];
      double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v10)
      {
        if (v13)
        {
          [v5 descriptor];
          int v14 = (void *)objc_claimAutoreleasedReturnValue();
          [v14 summary];
          int64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
          [v5 descriptor];
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
          [v16 overviewWithMaxValueLength:96 providingSubstitutionMap:v9];
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v60 = self;
          __int16 v61 = 2114;
          v62 = v15;
          __int16 v63 = 2114;
          v64 = v17;
          _os_log_impl( &dword_187A54000,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@ found primary descriptor:%{public}@\n%{public}@",  buf,  0x20u);
        }

        [MEMORY[0x1896127A0] sharedLogger];
        id v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v18 oslog];
        double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          [v5 fallbackDescriptor];
          BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
          [v19 summary];
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          [v5 fallbackDescriptor];
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          [v21 overviewWithMaxValueLength:96 providingSubstitutionMap:v9];
          id v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v60 = self;
          __int16 v61 = 2114;
          v62 = v20;
          __int16 v63 = 2114;
          v64 = v22;
          double v23 = "%{public}@ with fallback descriptor:%{public}@\n%{public}@";
          goto LABEL_17;
        }

        goto LABEL_22;
      }

      if (!v13) {
        goto LABEL_22;
      }
      [v5 descriptor];
      BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 summary];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 descriptor];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 overviewWithMaxValueLength:96 providingSubstitutionMap:v9];
      id v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v60 = self;
      __int16 v61 = 2114;
      v62 = v20;
      __int16 v63 = 2114;
      v64 = v22;
      double v23 = "%{public}@ found descriptor:%{public}@\n%{public}@";
      goto LABEL_17;
    case 2:
      [MEMORY[0x1896127A0] sharedLogger];
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 oslog];
      double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      [v5 descriptor];
      BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 summary];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 descriptor];
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 overviewWithMaxValueLength:96 providingSubstitutionMap:v9];
      id v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v60 = self;
      __int16 v61 = 2114;
      v62 = v20;
      __int16 v63 = 2114;
      v64 = v22;
      double v23 = "%{public}@ verified active descriptor:%{public}@\n%{public}@";
LABEL_17:
      _os_log_impl(&dword_187A54000, v12, OS_LOG_TYPE_DEFAULT, v23, buf, 0x20u);

      goto LABEL_21;
    case 3:
      [MEMORY[0x1896127A0] sharedLogger];
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 oslog];
      double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_22;
      }
      [v5 descriptor];
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v26 summary];
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 descriptor];
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      [v27 documentation];
      id v28 = (void *)objc_claimAutoreleasedReturnValue();
      [v28 summary];
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v60 = self;
      __int16 v61 = 2114;
      v62 = v20;
      __int16 v63 = 2114;
      v64 = v29;
      _os_log_impl( &dword_187A54000,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@ collected descriptor:%{public}@ doc metadata:%{public}@",  buf,  0x20u);

      goto LABEL_21;
    case 4:
      v30 = -[SUCoreScan secondaryUpdateAsset](self, "secondaryUpdateAsset");
      [MEMORY[0x1896127A0] sharedLogger];
      __int16 v31 = (void *)objc_claimAutoreleasedReturnValue();
      [v31 oslog];
      double v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      BOOL v32 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
      if (v30)
      {
        if (!v32) {
          goto LABEL_22;
        }
        v20 = -[SUCoreScan primaryUpdateAsset](self, "primaryUpdateAsset");
        [v20 assetId];
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCoreScan secondaryUpdateAsset](self, "secondaryUpdateAsset");
        id v34 = (void *)objc_claimAutoreleasedReturnValue();
        [v34 assetId];
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v60 = self;
        __int16 v61 = 2114;
        v62 = v33;
        __int16 v63 = 2114;
        v64 = v35;
        _os_log_impl( &dword_187A54000,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@ found primary update asset ID:%{public}@ with secondary update asset ID:%{public}@",  buf,  0x20u);
      }

      else
      {
        if (!v32) {
          goto LABEL_22;
        }
        v20 = -[SUCoreScan primaryUpdateAsset](self, "primaryUpdateAsset");
        [v20 assetId];
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v60 = self;
        __int16 v61 = 2114;
        v62 = v33;
        _os_log_impl( &dword_187A54000,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@ found update asset ID:%{public}@",  buf,  0x16u);
      }

LABEL_21:
LABEL_22:

LABEL_23:
      __int128 v56 = 0u;
      __int128 v57 = 0u;
      __int128 v54 = 0u;
      __int128 v55 = 0u;
      id v36 = v9;
      uint64_t v37 = [v36 countByEnumeratingWithState:&v54 objects:v58 count:16];
      if (v37)
      {
        uint64_t v38 = v37;
        uint64_t v39 = *(void *)v55;
        do
        {
          for (uint64_t i = 0LL; i != v38; ++i)
          {
            if (*(void *)v55 != v39) {
              objc_enumerationMutation(v36);
            }
            __int16 v41 = *(void **)(*((void *)&v54 + 1) + 8 * i);
            [MEMORY[0x1896127A0] sharedLogger];
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            [v42 oslog];
            __int16 v43 = (os_log_s *)objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v60 = v53;
              __int16 v61 = 2114;
              v62 = v41;
              _os_log_impl(&dword_187A54000, v43, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@", buf, 0x16u);
            }
          }

          uint64_t v38 = [v36 countByEnumeratingWithState:&v54 objects:v58 count:16];
        }

        while (v38);
      }

      [v5 descriptor];
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 fallbackDescriptor];
      uint64_t v45 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 majorPrimaryDescriptor];
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 majorSecondaryDescriptor];
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 minorPrimaryDescriptor];
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      [v5 minorSecondaryDescriptor];
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v51) = 1;
      -[SUCoreScan _scanCompleteFoundPrimary:foundSecondary:majorPrimary:majorSecondary:minorPrimary:minorSecondary:clearingOperation:error:]( v53,  "_scanCompleteFoundPrimary:foundSecondary:majorPrimary:majorSecondary:minorPrimary:minorSecondary:clearingOperation:error:",  v44,  v45,  v46,  v47,  v48,  v49,  v51,  0LL);

      return v52;
    default:
      -[SUCoreScan _invalidOperation:](self, "_invalidOperation:", @"[SCAN] SUCCESS");
      int64_t v52 = 8112LL;
      goto LABEL_23;
  }

- (int64_t)actionScanFailed:(id)a3 error:(id *)a4
{
  id v5 = a3;
  -[SUCoreScan scanFSM](self, "scanFSM");
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 extendedStateQueue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUCoreScan _decrementMobileAssetPending:](self, "_decrementMobileAssetPending:", @"ScanFailed");
  [v5 error];
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    uint64_t v9 = [v5 resultCode];
    [MEMORY[0x189612760] sharedCore];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9) {
      uint64_t v11 = [v5 resultCode];
    }
    else {
      uint64_t v11 = 8402LL;
    }
    [v10 buildError:v11 underlying:0 description:@"scan failed"];
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  LOBYTE(v13) = 1;
  -[SUCoreScan _scanCompleteFoundPrimary:foundSecondary:majorPrimary:majorSecondary:minorPrimary:minorSecondary:clearingOperation:error:]( self,  "_scanCompleteFoundPrimary:foundSecondary:majorPrimary:majorSecondary:minorPrimary:minorSecondary:clearingOperation:error:",  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v13,  v8);

  return 0LL;
}

- (int64_t)actionCancelPSUSAssetsDetermination:(id *)a3
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 extendedStateQueue];
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreScan _incrementMobileAssetPending:]( self,  "_incrementMobileAssetPending:",  @"CancelPSUSAssetsDetermination");
  -[SUCoreScan _trackScanBegin:](self, "_trackScanBegin:", @"stageCancelOperation");
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __50__SUCoreScan_actionCancelPSUSAssetsDetermination___block_invoke;
  v7[3] = &unk_18A0F02B0;
  v7[4] = self;
  objc_msgSend(MEMORY[0x189611100], "SUCoreBorder_stageCancelOperation:", v7);
  return 0LL;
}

void __50__SUCoreScan_actionCancelPSUSAssetsDetermination___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  objc_msgSend(v3, "_trackScanEnd:withResult:withError:", @"stageCancelOperation", objc_msgSend(v4, "code"), v4);

  [*(id *)(a1 + 32) scanFSM];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v7 = v5;
  if (v4) {
    int64_t v6 = @"PSUSAssetsDetermineCancelFailed";
  }
  else {
    int64_t v6 = @"PSUSAssetsDetermineCancelSuccess";
  }
  [v5 postEvent:v6];
}

- (int64_t)actionCancelSUCatalogDownload:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 extendedStateQueue];
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreScan _incrementMobileAssetPending:](self, "_incrementMobileAssetPending:", @"CancelSUCatalogDownload");
  -[SUCoreScan _trackScanBegin:withIdentifier:]( self,  "_trackScanBegin:withIdentifier:",  @"cancelCatalogDownload",  @"su");
  int64_t v6 = (void *)MEMORY[0x1896110E0];
  -[SUCoreScan scanPolicy](self, "scanPolicy");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 softwareUpdateAssetType];
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __44__SUCoreScan_actionCancelSUCatalogDownload___block_invoke;
  v10[3] = &unk_18A0F02D8;
  v10[4] = self;
  objc_msgSend(v6, "SUCoreBorder_cancelCatalogDownload:completionWithCancelResult:", v8, v10);

  return 0LL;
}

void __44__SUCoreScan_actionCancelSUCatalogDownload___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v4;
  if (a2) {
    id v5 = @"CatalogDownloadCancelFailed";
  }
  else {
    id v5 = @"CatalogDownloadCancelSuccess";
  }
  [v4 postEvent:v5];
}

- (int64_t)actionCancelDocCatalogDownload:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 extendedStateQueue];
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreScan _incrementMobileAssetPending:](self, "_incrementMobileAssetPending:", @"CancelDocCatalogDownload");
  -[SUCoreScan _trackScanBegin:withIdentifier:]( self,  "_trackScanBegin:withIdentifier:",  @"cancelCatalogDownload",  @"doc");
  id v6 = (void *)MEMORY[0x1896110E0];
  -[SUCoreScan scanPolicy](self, "scanPolicy");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 documentationAssetType];
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __45__SUCoreScan_actionCancelDocCatalogDownload___block_invoke;
  v10[3] = &unk_18A0F02D8;
  v10[4] = self;
  objc_msgSend(v6, "SUCoreBorder_cancelCatalogDownload:completionWithCancelResult:", v8, v10);

  return 0LL;
}

void __45__SUCoreScan_actionCancelDocCatalogDownload___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v4;
  if (a2) {
    id v5 = @"CatalogDownloadCancelFailed";
  }
  else {
    id v5 = @"CatalogDownloadCancelSuccess";
  }
  [v4 postEvent:v5];
}

- (int64_t)actionCancelSuccess:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 extendedStateQueue];
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  int64_t v6 = -[SUCoreScan _decrementMobileAssetPending:](self, "_decrementMobileAssetPending:", @"CancelSuccess");
  if (-[SUCoreScan cancelingOperation](self, "cancelingOperation"))
  {
    -[SUCoreScan _cancelCompleteWithError:](self, "_cancelCompleteWithError:", 0LL);
  }

  else
  {
    -[SUCoreScan scanFSM](self, "scanFSM");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 diag];
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ cancel success when not canceling", self];
    int64_t v6 = 8405LL;
    [v8 trackAnomaly:@"[SCAN] CANCEL" forReason:v9 withResult:8405 withError:0];
  }

  return v6;
}

- (int64_t)actionAfterAvailCancelSuccess:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 extendedStateQueue];
  int64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  int64_t v7 = -[SUCoreScan _decrementMobileAssetPending:]( self,  "_decrementMobileAssetPending:",  @"AfterAvailCancelSuccess");
  if (-[SUCoreScan cancelingOperation](self, "cancelingOperation"))
  {
    -[SUCoreScan _cancelCompleteWithError:](self, "_cancelCompleteWithError:", 0LL);
  }

  else
  {
    -[SUCoreScan scanFSM](self, "scanFSM");
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 diag];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ cancel (after update availabvle) when not canceling", self];
    int64_t v7 = 8405LL;
    [v9 trackAnomaly:@"[SCAN] CANCEL" forReason:v10 withResult:8405 withError:0];
  }

  return v7;
}

- (int64_t)actionAfterFailCancelSuccess:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 extendedStateQueue];
  int64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  int64_t v7 = -[SUCoreScan _decrementMobileAssetPending:]( self,  "_decrementMobileAssetPending:",  @"AfterFailCancelSuccess");
  if (-[SUCoreScan cancelingOperation](self, "cancelingOperation"))
  {
    -[SUCoreScan _cancelCompleteWithError:](self, "_cancelCompleteWithError:", 0LL);
  }

  else
  {
    -[SUCoreScan scanFSM](self, "scanFSM");
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 diag];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ cancel (after fail) when not canceling", self];
    int64_t v7 = 8405LL;
    [v9 trackAnomaly:@"[SCAN] CANCEL" forReason:v10 withResult:8405 withError:0];
  }

  return v7;
}

- (int64_t)actionCancelRemoveFailed:(id)a3 error:(id *)a4
{
  id v5 = a3;
  -[SUCoreScan scanFSM](self, "scanFSM");
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 extendedStateQueue];
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  int64_t v8 = -[SUCoreScan _decrementMobileAssetPending:](self, "_decrementMobileAssetPending:", @"CancelRemoveFailed");
  if (-[SUCoreScan cancelingOperation](self, "cancelingOperation"))
  {
    [v5 error];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan _cancelCompleteWithError:](self, "_cancelCompleteWithError:", v9);
  }

  else
  {
    -[SUCoreScan scanFSM](self, "scanFSM");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 diag];
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ cancel (after remove fail) when not canceling", self];
    uint64_t v12 = [v5 resultCode];
    [v5 error];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 trackAnomaly:@"[SCAN] CANCEL" forReason:v11 withResult:v12 withError:v13];

    int64_t v8 = 8405LL;
  }

  return v8;
}

- (int64_t)actionCheckCancelDone:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 extendedStateQueue];
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  int64_t v6 = -[SUCoreScan _decrementMobileAssetPending:](self, "_decrementMobileAssetPending:", @"CheckCancelDone");
  if (!-[SUCoreScan pendingMobileAssetRequests](self, "pendingMobileAssetRequests"))
  {
    -[SUCoreScan scanFSM](self, "scanFSM");
    int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 followupEvent:@"CancelComplete"];
  }

  return v6;
}

- (int64_t)actionAfterFailCheckCancelDone:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 extendedStateQueue];
  int64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  int64_t v7 = -[SUCoreScan _decrementMobileAssetPending:]( self,  "_decrementMobileAssetPending:",  @"AfterFailCheckCancelDone");
  if (!-[SUCoreScan pendingMobileAssetRequests](self, "pendingMobileAssetRequests"))
  {
    -[SUCoreScan scanFSM](self, "scanFSM");
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 followupEvent:@"CancelComplete"];
  }

  return v7;
}

- (int64_t)actionCancelDone:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 extendedStateQueue];
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[SUCoreScan cancelingOperation](self, "cancelingOperation"))
  {
    -[SUCoreScan _cancelCompleteWithError:](self, "_cancelCompleteWithError:", 0LL);
    return 0LL;
  }

  else
  {
    -[SUCoreScan scanFSM](self, "scanFSM");
    int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 diag];
    int64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ cancel done when not canceling", self];
    int64_t v6 = 8405LL;
    [v8 trackAnomaly:@"[SCAN] CANCEL" forReason:v9 withResult:8405 withError:0];
  }

  return v6;
}

- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4
{
  id v5 = a3;
  -[SUCoreScan scanFSM](self, "scanFSM");
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 extendedStateQueue];
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[SUCoreScan scanFSM](self, "scanFSM");
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 diag];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ unknown action(%@)", self, v5];

  [v9 dumpTracked:v10 dumpingTo:5 usingFilename:0 clearingStatistics:0 clearingHistory:0];
  return 8102LL;
}

- (int64_t)a_SimCatalogDownloadSuccess:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 extendedStateQueue];
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[SUCoreScan scanFSM](self, "scanFSM");
  int64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 postEvent:@"CatalogDownloadSuccess"];

  return 0LL;
}

- (int64_t)a_SimQueryMetadataUpdateAvailable:(id *)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 extendedStateQueue];
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  id v6 = objc_alloc(MEMORY[0x1896110E0]);
  -[SUCoreScan _simDescriptorAttributes](self, "_simDescriptorAttributes");
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  int64_t v8 = (void *)[v6 initWithAttributes:v7];

  uint64_t v9 = -[SUCoreDescriptor initWithSUAsset:releaseDate:defaultValues:]( objc_alloc(&OBJC_CLASS___SUCoreDescriptor),  "initWithSUAsset:releaseDate:defaultValues:",  v8,  @"2018-10-22",  0LL);
  v10 = -[SUCoreScan scanFSM](self, "scanFSM");
  uint64_t v11 = -[SUCoreScanParam initWithDescriptor:withFallbackDescriptor:]( objc_alloc(&OBJC_CLASS___SUCoreScanParam),  "initWithDescriptor:withFallbackDescriptor:",  v9,  0LL);
  [v10 postEvent:@"QueryMetadataUpdateAvailable" withInfo:v11];

  return 0LL;
}

- (SUCoreScan)initWithUUID:(id)a3
{
  return -[SUCoreScan initWithUUID:withCompletionQueue:](self, "initWithUUID:withCompletionQueue:", a3, 0LL);
}

- (SUCoreScan)initWithUUID:(id)a3 withCompletionQueue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v39.receiver = self;
  v39.super_class = (Class)&OBJC_CLASS___SUCoreScan;
  uint64_t v9 = -[SUCoreScan init](&v39, sel_init);
  if (v9)
  {
    v10 = +[SUCoreScan _generateStateTable](&OBJC_CLASS___SUCoreScan, "_generateStateTable");
    uint64_t v11 = [objc_alloc(MEMORY[0x189612798]) initMachine:@"scan" ofInstance:v7 withTable:v10 startingIn:@"Idle"];
    scanFSM = v9->_scanFSM;
    v9->_scanFSM = (SUCoreFSM *)v11;

    if (!v9->_scanFSM)
    {

      v35 = 0LL;
      goto LABEL_6;
    }

    objc_storeStrong((id *)&v9->_scanUUID, a3);
    [MEMORY[0x189612760] sharedCore];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 selectCompletionQueue:v8];
    clientCompletionQueue = v9->_clientCompletionQueue;
    v9->_clientCompletionQueue = (OS_dispatch_queue *)v14;

    v9->_operation = 0;
    v9->_operationSPIType = 0;
    v9->_cancelingOperation = 0;
    scanPolicy = v9->_scanPolicy;
    v9->_scanPolicy = 0LL;

    activeDescriptor = v9->_activeDescriptor;
    v9->_activeDescriptor = 0LL;

    v9->_downloadDocumentation = 0;
    v9->_pendingMobileAssetRequests = 0;
    alternateAssetAudienceUUID = v9->_alternateAssetAudienceUUID;
    v9->_alternateAssetAudienceUUID = 0LL;

    maDocumentationControl = v9->_maDocumentationControl;
    v9->_maDocumentationControl = 0LL;

    primaryUpdateAsset = v9->_primaryUpdateAsset;
    v9->_primaryUpdateAsset = 0LL;

    secondaryUpdateAsset = v9->_secondaryUpdateAsset;
    v9->_secondaryUpdateAsset = 0LL;

    originalScanPolicy = v9->_originalScanPolicy;
    v9->_originalScanPolicy = 0LL;

    v9->_phase = 0;
    interimScanResult = v9->_interimScanResult;
    v9->_interimScanResult = 0LL;

    psusPrimaryDescriptor = v9->_psusPrimaryDescriptor;
    v9->_psusPrimaryDescriptor = 0LL;

    psusSecondaryDescriptor = v9->_psusSecondaryDescriptor;
    v9->_psusSecondaryDescriptor = 0LL;

    id checkCompletion = v9->_checkCompletion;
    v9->_id checkCompletion = 0LL;

    id checkMajorMinorCompletion = v9->_checkMajorMinorCompletion;
    v9->_id checkMajorMinorCompletion = 0LL;

    id checkSlowReleaseCompletion = v9->_checkSlowReleaseCompletion;
    v9->_id checkSlowReleaseCompletion = 0LL;

    id verifyCompletion = v9->_verifyCompletion;
    v9->_id verifyCompletion = 0LL;

    id collectCompletion = v9->_collectCompletion;
    v9->_id collectCompletion = 0LL;

    id locateCompletion = v9->_locateCompletion;
    v9->_id locateCompletion = 0LL;

    id cancelCompletion = v9->_cancelCompletion;
    v9->_id cancelCompletion = 0LL;

    +[SUCoreMobileAsset mapMobileAssetErrorIndications]( &OBJC_CLASS___SUCoreMobileAsset,  "mapMobileAssetErrorIndications");
    v37[0] = MEMORY[0x1895F87A8];
    v37[1] = 3221225472LL;
    v37[2] = __47__SUCoreScan_initWithUUID_withCompletionQueue___block_invoke;
    v37[3] = &unk_18A0F0328;
    uint64_t v33 = v9;
    uint64_t v38 = v33;
    [v10 enumerateKeysAndObjectsUsingBlock:v37];
    -[SUCoreScan scanFSM](v33, "scanFSM");
    id v34 = (void *)objc_claimAutoreleasedReturnValue();
    [v34 activateMachine];
  }

  v35 = v9;
LABEL_6:

  return v35;
}

void __47__SUCoreScan_initWithUUID_withCompletionQueue___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __47__SUCoreScan_initWithUUID_withCompletionQueue___block_invoke_2;
  v7[3] = &unk_18A0F0300;
  id v8 = *(id *)(a1 + 32);
  id v9 = v5;
  id v6 = v5;
  [a3 enumerateKeysAndObjectsUsingBlock:v7];
}

void __47__SUCoreScan_initWithUUID_withCompletionQueue___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  [a3 safeStringForKey:*MEMORY[0x1896127D0]];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (([v8 isEqualToString:@"CatalogDownloadFailed"] & 1) != 0
      || ([v8 isEqualToString:@"QueryMetadataFailed"] & 1) != 0
      || ([v8 isEqualToString:@"QueryMetadataNoAssetFound"] & 1) != 0
      || ([v8 isEqualToString:@"QueryMetadataUpdateAvailable"] & 1) != 0
      || ([v8 isEqualToString:@"DocDownloadFailed"] & 1) != 0
      || ([v8 isEqualToString:@"DocRemoveFailed"] & 1) != 0
      || ([v8 isEqualToString:@"PSUSAssetsDetermineFailed"] & 1) != 0
      || ([v8 isEqualToString:@"CheckForAvailableUpdate"] & 1) != 0
      || ([v8 isEqualToString:@"DeterminePSUSAssets"] & 1) != 0
      || ([v8 isEqualToString:@"ScanComplete"] & 1) != 0
      || [v8 isEqualToString:@"PSUSAssetsDetermineSuccess"])
    {
      uint64_t v6 = objc_opt_class();
    }

    else
    {
      uint64_t v6 = 0LL;
    }

    [*(id *)(a1 + 32) scanFSM];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 registerAction:v5 ForEvent:v8 inState:*(void *)(a1 + 40) usingDelegate:*(void *)(a1 + 32) withInfoClass:v6];
  }
}

- (void)checkForAvailableUpdateWithPolicy:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x189612760] beginTransactionWithName:@"scan.CheckForAvailableUpdate"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreScan scanFSM](self, "scanFSM");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 extendedStateQueue];
  v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __59__SUCoreScan_checkForAvailableUpdateWithPolicy_completion___block_invoke;
  v14[3] = &unk_18A0F0350;
  v14[4] = self;
  id v15 = v6;
  id v16 = v8;
  id v17 = v7;
  id v11 = v8;
  id v12 = v6;
  id v13 = v7;
  dispatch_async(v10, v14);
}

void __59__SUCoreScan_checkForAvailableUpdateWithPolicy_completion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) operation])
  {
    [MEMORY[0x189612760] sharedCore];
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 buildError:8111 underlying:0 description:@"check when already performing scan operation"];
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 32) scanFSM];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 diag];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ already performing scan operation", *(void *)(a1 + 32)];
    id v6 = v4;
    id v7 = v5;
    uint64_t v8 = 8111LL;
LABEL_5:
    [v6 trackAnomaly:@"[SCAN] CHECK" forReason:v7 withResult:v8 withError:v14];

    [*(id *)(a1 + 32) _checkEndComplete:*(void *)(a1 + 56) scanPolicy:*(void *)(a1 + 40) primary:0 secondary:0 error:v14 clearingTransaction:0];
    [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 48) withName:@"scan.CheckForAvailableUpdate"];
    goto LABEL_6;
  }

  if ([*(id *)(a1 + 32) cancelingOperation])
  {
    [MEMORY[0x189612760] sharedCore];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 buildError:8115 underlying:0 description:@"check when canceling"];
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 32) scanFSM];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 diag];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ check when canceling scan operation", *(void *)(a1 + 32)];
    id v6 = v4;
    id v7 = v5;
    uint64_t v8 = 8115LL;
    goto LABEL_5;
  }

  [*(id *)(a1 + 32) scanCheckTransaction];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    [*(id *)(a1 + 32) scanFSM];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 diag];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 trackAnomaly:@"[SCAN] CHECK" forReason:@"existing transaction found for kSUCoreTransactionCheckForAvailableUpdate" withResult:8120 withError:0];
  }

  [*(id *)(a1 + 32) setScanCheckTransaction:*(void *)(a1 + 48)];
  id v13 = (void *)[*(id *)(a1 + 40) copy];
  [*(id *)(a1 + 32) setScanPolicy:v13];

  [*(id *)(a1 + 32) setCheckCompletion:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) setOperation:1];
  [*(id *)(a1 + 32) setOperationSPIType:1];
  [*(id *)(a1 + 32) scanFSM];
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  [v14 postProtectedEvent:@"DecideNextScanStep"];
LABEL_6:
}

- (void)checkForAvailableMajorMinorUpdatesWithPolicy:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x189612760] beginTransactionWithName:@"scan.CheckForAvailableUpdate"];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreScan scanFSM](self, "scanFSM");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 extendedStateQueue];
  v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __70__SUCoreScan_checkForAvailableMajorMinorUpdatesWithPolicy_completion___block_invoke;
  v14[3] = &unk_18A0F0350;
  v14[4] = self;
  id v15 = v6;
  id v16 = v8;
  id v17 = v7;
  id v11 = v8;
  id v12 = v6;
  id v13 = v7;
  dispatch_async(v10, v14);
}

void __70__SUCoreScan_checkForAvailableMajorMinorUpdatesWithPolicy_completion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) operation])
  {
    [MEMORY[0x189612760] sharedCore];
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 buildError:8111 underlying:0 description:@"check when already performing scan operation"];
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 32) scanFSM];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 diag];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ already performing scan operation", *(void *)(a1 + 32)];
    id v6 = v4;
    id v7 = v5;
    uint64_t v8 = 8111LL;
LABEL_5:
    [v6 trackAnomaly:@"[SCAN] CHECK MAJOR_MINOR" forReason:v7 withResult:v8 withError:v15];

    LOBYTE(v14) = 0;
    [*(id *)(a1 + 32) _checkMajorMinorEndComplete:*(void *)(a1 + 56) scanPolicy:*(void *)(a1 + 40) majorPrimary:0 majorSecondary:0 minorPrimary:0 minorSecondary:0 error:v15 clearingTransaction:v14];
    [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 48) withName:@"scan.CheckForAvailableUpdate"];
    goto LABEL_6;
  }

  if ([*(id *)(a1 + 32) cancelingOperation])
  {
    [MEMORY[0x189612760] sharedCore];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 buildError:8115 underlying:0 description:@"check when canceling"];
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 32) scanFSM];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 diag];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ check when canceling scan operation", *(void *)(a1 + 32)];
    id v6 = v4;
    id v7 = v5;
    uint64_t v8 = 8115LL;
    goto LABEL_5;
  }

  [*(id *)(a1 + 32) scanCheckTransaction];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    [*(id *)(a1 + 32) scanFSM];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 diag];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 trackAnomaly:@"[SCAN] CHECK MAJOR_MINOR" forReason:@"existing transaction found for kSUCoreTransactionCheckForAvailableUpdate" withResult:8120 withError:0];
  }

  [*(id *)(a1 + 32) setScanCheckTransaction:*(void *)(a1 + 48)];
  id v13 = (void *)[*(id *)(a1 + 40) copy];
  [*(id *)(a1 + 32) setScanPolicy:v13];

  [*(id *)(a1 + 32) setCheckMajorMinorCompletion:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) setOperation:1];
  [*(id *)(a1 + 32) setOperationSPIType:2];
  [*(id *)(a1 + 32) scanFSM];
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  [v15 postProtectedEvent:@"DecideNextScanStep"];
LABEL_6:
}

- (void)checkForAvailableSlowReleaseUpdatesWithPolicy:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x189612760] beginTransactionWithName:@"scan.CheckForAvailableUpdate"];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreScan scanFSM](self, "scanFSM");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 extendedStateQueue];
  v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __71__SUCoreScan_checkForAvailableSlowReleaseUpdatesWithPolicy_completion___block_invoke;
  v14[3] = &unk_18A0F0350;
  v14[4] = self;
  id v15 = v6;
  id v16 = v8;
  id v17 = v7;
  id v11 = v8;
  id v12 = v6;
  id v13 = v7;
  dispatch_async(v10, v14);
}

void __71__SUCoreScan_checkForAvailableSlowReleaseUpdatesWithPolicy_completion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) operation])
  {
    [MEMORY[0x189612760] sharedCore];
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 buildError:8111 underlying:0 description:@"check when already performing scan operation"];
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 32) scanFSM];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 diag];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ already performing scan operation", *(void *)(a1 + 32)];
    id v6 = v4;
    id v7 = v5;
    uint64_t v8 = 8111LL;
  }

  else
  {
    if (![*(id *)(a1 + 32) cancelingOperation])
    {
      [*(id *)(a1 + 32) setScanCheckTransaction:*(void *)(a1 + 48)];
      v10 = (void *)[*(id *)(a1 + 40) copy];
      [*(id *)(a1 + 32) setScanPolicy:v10];

      [*(id *)(a1 + 32) setCheckSlowReleaseCompletion:*(void *)(a1 + 56)];
      [*(id *)(a1 + 32) setOperation:1];
      [*(id *)(a1 + 32) setOperationSPIType:3];
      [*(id *)(a1 + 32) scanFSM];
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      [v12 postProtectedEvent:@"DecideNextScanStep"];
      goto LABEL_7;
    }

    [MEMORY[0x189612760] sharedCore];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 buildError:8115 underlying:0 description:@"check when canceling"];
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 32) scanFSM];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 diag];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ check when canceling scan operation", *(void *)(a1 + 32)];
    id v6 = v4;
    id v7 = v5;
    uint64_t v8 = 8115LL;
  }

  [v6 trackAnomaly:@"[SCAN] CHECK SLOW_RELEASE" forReason:v7 withResult:v8 withError:v12];

  LOBYTE(v11) = 0;
  [*(id *)(a1 + 32) _checkSlowReleaseEndComplete:*(void *)(a1 + 56) scanPolicy:*(void *)(a1 + 40) primary:0 secondary:0 alternatePrimary:0 alternateSecondary:0 error:v12 clearingTransaction:v11];
  [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 48) withName:@"scan.CheckForAvailableUpdate"];
LABEL_7:
}

- (void)verifyLatestAvailableWithPolicy:(id)a3 descriptor:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [MEMORY[0x189612760] beginTransactionWithName:@"scan.VerifyLatestAvailable"];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreScan scanFSM](self, "scanFSM");
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 extendedStateQueue];
  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __68__SUCoreScan_verifyLatestAvailableWithPolicy_descriptor_completion___block_invoke;
  block[3] = &unk_18A0F0378;
  id v21 = v11;
  id v22 = v10;
  block[4] = self;
  id v19 = v8;
  id v20 = v9;
  id v14 = v11;
  id v15 = v9;
  id v16 = v8;
  id v17 = v10;
  dispatch_async(v13, block);
}

void __68__SUCoreScan_verifyLatestAvailableWithPolicy_descriptor_completion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) operation])
  {
    [MEMORY[0x189612760] sharedCore];
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 buildError:8111 underlying:0 description:@"verify when already performing scan operation"];
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 32) scanFSM];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 diag];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ already performing scan operation", *(void *)(a1 + 32)];
    id v6 = v4;
    id v7 = v5;
    uint64_t v8 = 8111LL;
LABEL_5:
    [v6 trackAnomaly:@"[SCAN] VERIFY" forReason:v7 withResult:v8 withError:v15];

    LOBYTE(v14) = 0;
    [*(id *)(a1 + 32) _verifyEndComplete:*(void *)(a1 + 64) scanPolicy:*(void *)(a1 + 40) active:*(void *)(a1 + 48) primary:0 secondary:0 error:v15 clearingTransaction:v14];
    [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 56) withName:@"scan.VerifyLatestAvailable"];
    goto LABEL_6;
  }

  if ([*(id *)(a1 + 32) cancelingOperation])
  {
    [MEMORY[0x189612760] sharedCore];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 buildError:8115 underlying:0 description:@"verify when canceling"];
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 32) scanFSM];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 diag];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ verify when canceling scan operation", *(void *)(a1 + 32)];
    id v6 = v4;
    id v7 = v5;
    uint64_t v8 = 8115LL;
    goto LABEL_5;
  }

  [*(id *)(a1 + 32) scanVerifyTransaction];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    [*(id *)(a1 + 32) scanFSM];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 diag];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 trackAnomaly:@"[SCAN] VERIFY" forReason:@"existing transaction found for kSUCoreTransactionVerifyLatestAvailable" withResult:8120 withError:0];
  }

  [*(id *)(a1 + 32) setScanVerifyTransaction:*(void *)(a1 + 56)];
  id v13 = (void *)[*(id *)(a1 + 40) copy];
  [*(id *)(a1 + 32) setScanPolicy:v13];

  [*(id *)(a1 + 32) setActiveDescriptor:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setVerifyCompletion:*(void *)(a1 + 64)];
  [*(id *)(a1 + 32) setOperation:2];
  [*(id *)(a1 + 32) setOperationSPIType:1];
  [*(id *)(a1 + 32) scanFSM];
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  [v15 postProtectedEvent:@"VerifyLatestAvailable"];
LABEL_6:
}

- (void)collectDocumentationMetadataWithPolicy:(id)a3 descriptor:(id)a4 downloadDocumentation:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  [MEMORY[0x189612760] beginTransactionWithName:@"scan.CollectDocumentationMetadata"];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreScan scanFSM](self, "scanFSM");
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v14 extendedStateQueue];
  id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __97__SUCoreScan_collectDocumentationMetadataWithPolicy_descriptor_downloadDocumentation_completion___block_invoke;
  v20[3] = &unk_18A0F03A0;
  id v23 = v13;
  id v24 = v12;
  v20[4] = self;
  id v21 = v10;
  id v22 = v11;
  BOOL v25 = a5;
  id v16 = v13;
  id v17 = v11;
  id v18 = v10;
  id v19 = v12;
  dispatch_async(v15, v20);
}

void __97__SUCoreScan_collectDocumentationMetadataWithPolicy_descriptor_downloadDocumentation_completion___block_invoke( uint64_t a1)
{
  if ([*(id *)(a1 + 32) operation])
  {
    [MEMORY[0x189612760] sharedCore];
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 buildError:8111 underlying:0 description:@"collect when already performing scan operation"];
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 32) scanFSM];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 diag];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ already performing scan operation", *(void *)(a1 + 32)];
    id v6 = v4;
    id v7 = v5;
    uint64_t v8 = 8111LL;
LABEL_5:
    [v6 trackAnomaly:@"[SCAN] COLLECT" forReason:v7 withResult:v8 withError:v14];

    [*(id *)(a1 + 32) _collectEndComplete:*(void *)(a1 + 64) scanPolicy:*(void *)(a1 + 40) active:*(void *)(a1 + 48) error:v14 clearingTransaction:0];
    [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 56) withName:@"scan.CollectDocumentationMetadata"];
    goto LABEL_6;
  }

  if ([*(id *)(a1 + 32) cancelingOperation])
  {
    [MEMORY[0x189612760] sharedCore];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 buildError:8115 underlying:0 description:@"collect when canceling"];
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 32) scanFSM];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 diag];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ collect when canceling scan operation", *(void *)(a1 + 32)];
    id v6 = v4;
    id v7 = v5;
    uint64_t v8 = 8115LL;
    goto LABEL_5;
  }

  [*(id *)(a1 + 32) scanCollectTransaction];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    [*(id *)(a1 + 32) scanFSM];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 diag];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 trackAnomaly:@"[SCAN] COLLECT" forReason:@"existing transaction found for kSUCoreTransactionCollectDocumentationMetadata" withResult:8120 withError:0];
  }

  [*(id *)(a1 + 32) setScanCollectTransaction:*(void *)(a1 + 56)];
  id v13 = (void *)[*(id *)(a1 + 40) copy];
  [*(id *)(a1 + 32) setScanPolicy:v13];

  [*(id *)(a1 + 32) setActiveDescriptor:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) setDownloadDocumentation:*(unsigned __int8 *)(a1 + 72)];
  [*(id *)(a1 + 32) setCollectCompletion:*(void *)(a1 + 64)];
  [*(id *)(a1 + 32) setOperation:3];
  [*(id *)(a1 + 32) setOperationSPIType:1];
  [*(id *)(a1 + 32) scanFSM];
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  [v14 postProtectedEvent:@"CollectDocMetadata"];
LABEL_6:
}

- (void)locateAvailableUpdateWithPolicy:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [MEMORY[0x189612760] beginTransactionWithName:@"scan.LocateAvailableUpdate"];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreScan scanFSM](self, "scanFSM");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 extendedStateQueue];
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __57__SUCoreScan_locateAvailableUpdateWithPolicy_completion___block_invoke;
  v14[3] = &unk_18A0F0350;
  v14[4] = self;
  id v15 = v6;
  id v16 = v8;
  id v17 = v7;
  id v11 = v8;
  id v12 = v6;
  id v13 = v7;
  dispatch_async(v10, v14);
}

void __57__SUCoreScan_locateAvailableUpdateWithPolicy_completion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) operation])
  {
    [MEMORY[0x189612760] sharedCore];
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 buildError:8111 underlying:0 description:@"locate when already performing scan operation"];
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 32) scanFSM];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 diag];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ already performing scan operation", *(void *)(a1 + 32)];
    id v6 = v4;
    id v7 = v5;
    uint64_t v8 = 8111LL;
LABEL_5:
    [v6 trackAnomaly:@"[SCAN] LOCATE" forReason:v7 withResult:v8 withError:v15];

    [*(id *)(a1 + 32) _locateEndComplete:*(void *)(a1 + 56) scanPolicy:*(void *)(a1 + 40) primary:0 secondary:0 error:v15 clearingTransaction:0];
    [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 48) withName:@"scan.LocateAvailableUpdate"];
    goto LABEL_6;
  }

  if ([*(id *)(a1 + 32) cancelingOperation])
  {
    [MEMORY[0x189612760] sharedCore];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 buildError:8115 underlying:0 description:@"locate when canceling"];
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 32) scanFSM];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 diag];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ locate when canceling scan operation", *(void *)(a1 + 32)];
    id v6 = v4;
    id v7 = v5;
    uint64_t v8 = 8115LL;
    goto LABEL_5;
  }

  [*(id *)(a1 + 32) scanLocateTransaction];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    [*(id *)(a1 + 32) scanFSM];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 diag];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 trackAnomaly:@"[SCAN] COLLECT" forReason:@"existing transaction found for kSUCoreTransactionLocateAvailableUpdate" withResult:8120 withError:0];
  }

  [*(id *)(a1 + 32) setScanLocateTransaction:*(void *)(a1 + 48)];
  id v13 = (void *)[*(id *)(a1 + 40) copy];
  [*(id *)(a1 + 32) setScanPolicy:v13];

  [*(id *)(a1 + 32) setLocateCompletion:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) setOperation:4];
  [*(id *)(a1 + 32) setOperationSPIType:1];
  [*(id *)(a1 + 32) scanFSM];
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = -[SUCoreScanParam initWithNote:]( objc_alloc(&OBJC_CLASS___SUCoreScanParam),  "initWithNote:",  @"API locateAvailableUpdateWithPolicy");
  [v15 postProtectedEvent:@"CheckForAvailableUpdate" withInfo:v14];

LABEL_6:
}

- (void)alterCurrentPolicy:(id)a3
{
  id v4 = a3;
  [MEMORY[0x189612760] beginTransactionWithName:@"scan.AlterCurrentPolicy"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreScan scanFSM](self, "scanFSM");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 extendedStateQueue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __33__SUCoreScan_alterCurrentPolicy___block_invoke;
  block[3] = &unk_18A0F03C8;
  block[4] = self;
  id v11 = v4;
  id v12 = v5;
  id v8 = v5;
  id v9 = v4;
  dispatch_async(v7, block);
}

uint64_t __33__SUCoreScan_alterCurrentPolicy___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) cancelingOperation])
  {
    [MEMORY[0x189612760] sharedCore];
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 buildError:8115 underlying:0 description:@"no alterations permitted when canceling scan operation"];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 32) scanFSM];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 diag];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    id v6 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ currently canceling", *(void *)(a1 + 32)];
    [v5 trackAnomaly:@"[SCAN] ALTER" forReason:v6 withResult:8115 withError:v3];

LABEL_5:
    return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 48) withName:@"scan.AlterCurrentPolicy"];
  }

  id v7 = (void *)[*(id *)(a1 + 40) copy];
  [*(id *)(a1 + 32) setScanPolicy:v7];

  if ([*(id *)(a1 + 32) operation] == 3)
  {
    [*(id *)(a1 + 32) scanFSM];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 postProtectedEvent:@"AlterCurrentPolicy"];
    goto LABEL_5;
  }

  return [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 48) withName:@"scan.AlterCurrentPolicy"];
}

- (void)cancelCurrentScan:(id)a3
{
  id v4 = a3;
  [MEMORY[0x189612760] beginTransactionWithName:@"scan.CancelCurrentScan"];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreScan scanFSM](self, "scanFSM");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 extendedStateQueue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __32__SUCoreScan_cancelCurrentScan___block_invoke;
  block[3] = &unk_18A0F03F0;
  id v11 = v5;
  id v12 = v4;
  block[4] = self;
  id v8 = v5;
  id v9 = v4;
  dispatch_async(v7, block);
}

void __32__SUCoreScan_cancelCurrentScan___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) cancelingOperation])
  {
    [MEMORY[0x189612760] sharedCore];
    uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
    [v2 buildError:8111 underlying:0 description:@"already canceling scan operation"];
    id v18 = (id)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 32) scanFSM];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 diag];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ already canceling", *(void *)(a1 + 32)];
    id v6 = v4;
    id v7 = v5;
    uint64_t v8 = 8111LL;
LABEL_9:
    [v6 trackAnomaly:@"[SCAN] CANCEL" forReason:v7 withResult:v8 withError:v18];

    [*(id *)(a1 + 32) _cancelEndComplete:*(void *)(a1 + 48) error:v18 clearingTransaction:0];
    [MEMORY[0x189612760] endTransaction:*(void *)(a1 + 40) withName:@"scan.CancelCurrentScan"];
    goto LABEL_12;
  }

  int v9 = [*(id *)(a1 + 32) operation];
  [MEMORY[0x189612760] sharedCore];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  id v11 = v10;
  if (!v9)
  {
    [v10 buildError:8115 underlying:0 description:@"cancel when not performing scan operation"];
    id v18 = (id)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 32) scanFSM];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 diag];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    id v5 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ no scan operation to cancel", *(void *)(a1 + 32)];
    id v6 = v4;
    id v7 = v5;
    uint64_t v8 = 8115LL;
    goto LABEL_9;
  }

  [v10 buildError:8403 underlying:0 description:@"scan operation canceled"];
  id v18 = (id)objc_claimAutoreleasedReturnValue();

  [*(id *)(a1 + 32) scanCancelTransaction];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    [*(id *)(a1 + 32) scanFSM];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 diag];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 trackAnomaly:@"[SCAN] CANCEL" forReason:@"existing transaction found for kSUCoreTransactionCancelCurrentScan" withResult:8120 withError:0];
  }

  [*(id *)(a1 + 32) setScanCancelTransaction:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setCancelingOperation:1];
  [*(id *)(a1 + 32) setCancelCompletion:*(void *)(a1 + 48)];
  if ([*(id *)(a1 + 32) operation] == 1)
  {
    id v15 = -[SUCoreScanParam initWithResult:withError:]( objc_alloc(&OBJC_CLASS___SUCoreScanParam),  "initWithResult:withError:",  8403LL,  v18);
    [*(id *)(a1 + 32) setInterimScanResult:v15];

    [*(id *)(a1 + 32) actionScanComplete:0];
  }

  else
  {
    LOBYTE(v17) = 0;
    [*(id *)(a1 + 32) _scanCompleteFoundPrimary:0 foundSecondary:0 majorPrimary:0 majorSecondary:0 minorPrimary:0 minorSecondary:0 clearingOperation:v17 error:v18];
  }

  [*(id *)(a1 + 32) scanFSM];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 postProtectedEvent:@"CancelCurrentScan"];

LABEL_12:
}

- (void)_updateInterimScanResultForSlowReleaseWithPrimary:(id)a3 secondary:(id)a4 error:(id)a5
{
  uint64_t v119 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (-[SUCoreScan operationSPIType](self, "operationSPIType") != 3)
  {
    [NSString stringWithFormat:@"%@ invalid operationSPIType (%d) found", self, -[SUCoreScan operationSPIType](self, "operationSPIType")];
LABEL_23:
    id v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan _trackInconsistentAnomalyAndUpdateInterimResult:reason:]( self,  "_trackInconsistentAnomalyAndUpdateInterimResult:reason:",  @"[SCAN] UPDATE_INTERIM_SLOWROLL",  v34);

    goto LABEL_109;
  }

  -[SUCoreScan interimScanResult](self, "interimScanResult");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    [NSString stringWithFormat:@"%@ unexpected no previous scan result for slow release scan", self, v91];
    goto LABEL_23;
  }

  id v12 = v10;
  -[SUCoreScan interimScanResult](self, "interimScanResult");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 majorPrimaryDescriptor];
  id v14 = (SUCoreScanParam *)objc_claimAutoreleasedReturnValue();

  -[SUCoreScan interimScanResult](self, "interimScanResult");
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 majorSecondaryDescriptor];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();

  v100 = (SUCoreScanParam *)v8;
  id v102 = v9;
  if (v100 && !v14) {
    goto LABEL_8;
  }
  uint64_t v17 = 1LL;
  uint64_t v18 = 2LL;
  if (v100 && v14)
  {
    if (-[SUCoreScanParam promoteAlternateUpdate](v14, "promoteAlternateUpdate"))
    {
LABEL_8:
      uint64_t v17 = 2LL;
      uint64_t v18 = 1LL;
      goto LABEL_9;
    }

    uint64_t v17 = 1LL;
    uint64_t v18 = 2LL;
  }

- (void)_updateInterimScanResultForSplomboWithPrimary:(id)a3 secondary:(id)a4 majorPrimary:(id)a5 majorSecondary:(id)a6 minorPrimary:(id)a7 minorSecondary:(id)a8 error:(id)a9
{
  uint64_t v55 = *MEMORY[0x1895F89C0];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  -[SUCoreScan interimScanResult](self, "interimScanResult");
  id v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
  {
    [NSString stringWithFormat:@"%@ unexpected no previous scan result for Splombo scan", self];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan _trackInconsistentAnomalyAndUpdateInterimResult:reason:]( self,  "_trackInconsistentAnomalyAndUpdateInterimResult:reason:",  @"[SCAN] UPDATE_INTERIM_SPLOMBO",  v26);

    goto LABEL_18;
  }

  if (!v21)
  {
    if (-[SUCoreScan operationSPIType](self, "operationSPIType") == 1)
    {
      -[SUCoreScan interimScanResult](self, "interimScanResult");
      id v49 = v20;
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      [v27 descriptor];
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();

      -[SUCoreScan interimScanResult](self, "interimScanResult");
      id v29 = (void *)objc_claimAutoreleasedReturnValue();
      [v29 fallbackDescriptor];
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      id v20 = v49;
      [v28 setAssociatedSplatDescriptor:v15];
      [v30 setAssociatedSplatDescriptor:v15];
      unint64_t v31 = -[SUCoreScanParam initWithDescriptor:withFallbackDescriptor:]( objc_alloc(&OBJC_CLASS___SUCoreScanParam),  "initWithDescriptor:withFallbackDescriptor:",  v28,  v30);
      -[SUCoreScan setInterimScanResult:](self, "setInterimScanResult:", v31);

      id v16 = v30;
    }

    else
    {
      if (-[SUCoreScan operationSPIType](self, "operationSPIType") == 2)
      {
        id v15 = v15;
        -[SUCoreScan interimScanResult](self, "interimScanResult");
        BOOL v32 = (void *)objc_claimAutoreleasedReturnValue();
        [v32 majorPrimaryDescriptor];
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();

        -[SUCoreScan interimScanResult](self, "interimScanResult");
        id v34 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v35 = [v34 majorSecondaryDescriptor];

        -[SUCoreScan interimScanResult](self, "interimScanResult");
        int v36 = (void *)objc_claimAutoreleasedReturnValue();
        [v36 minorPrimaryDescriptor];
        uint64_t v37 = v20;
        uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();

        -[SUCoreScan interimScanResult](self, "interimScanResult");
        uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v40 = [v39 minorSecondaryDescriptor];

        if (v33)
        {
          [v33 setAssociatedSplatDescriptor:v15];
          __int16 v41 = (void *)v35;
        }

        else
        {
          [v38 setAssociatedSplatDescriptor:v15];
          __int16 v41 = (void *)v40;
        }

        [v41 setAssociatedSplatDescriptor:v15];

        v47 = -[SUCoreScanParam initWithMajorPrimaryDescriptor:majorSecondaryDescriptor:minorPrimaryDescriptor:minorSecondaryDescriptor:]( objc_alloc(&OBJC_CLASS___SUCoreScanParam),  "initWithMajorPrimaryDescriptor:majorSecondaryDescriptor:minorPrimaryDescriptor:minorSecondaryDescriptor:",  v33,  v35,  v38,  v40);
        -[SUCoreScan setInterimScanResult:](self, "setInterimScanResult:", v47);

        id v18 = (id)v35;
        id v19 = v38;
        id v20 = (id)v40;
        id v17 = v33;
        goto LABEL_18;
      }

      if (-[SUCoreScan operationSPIType](self, "operationSPIType") != 3)
      {
        [NSString stringWithFormat:@"%@ unknown operationSPIType (%d) found", self, -[SUCoreScan operationSPIType](self, "operationSPIType")];
        uint64_t v46 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCoreScan _trackInconsistentAnomalyAndUpdateInterimResult:reason:]( self,  "_trackInconsistentAnomalyAndUpdateInterimResult:reason:",  @"[SCAN] UPDATE_INTERIM_SPLOMBO",  v46);

        goto LABEL_18;
      }

      -[SUCoreScan interimScanResult](self, "interimScanResult");
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue();
      [v42 majorPrimaryDescriptor];
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();

      -[SUCoreScan interimScanResult](self, "interimScanResult");
      uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
      [v43 majorSecondaryDescriptor];
      id v50 = v20;
      v44 = (void *)objc_claimAutoreleasedReturnValue();

      [v28 setAssociatedSplatDescriptor:v15];
      [v44 setAssociatedSplatDescriptor:v15];
      uint64_t v45 = -[SUCoreScanParam initWithMajorPrimaryDescriptor:majorSecondaryDescriptor:minorPrimaryDescriptor:minorSecondaryDescriptor:]( objc_alloc(&OBJC_CLASS___SUCoreScanParam),  "initWithMajorPrimaryDescriptor:majorSecondaryDescriptor:minorPrimaryDescriptor:minorSecondaryDescriptor:",  v28,  v44,  0LL,  0LL);
      -[SUCoreScan setInterimScanResult:](self, "setInterimScanResult:", v45);

      id v16 = v44;
      id v20 = v50;
    }

    id v15 = v28;
    goto LABEL_18;
  }

  id v23 = v20;
  [MEMORY[0x1896127A0] sharedLogger];
  id v24 = (void *)objc_claimAutoreleasedReturnValue();
  [v24 oslog];
  BOOL v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v52 = self;
    __int16 v53 = 2114;
    id v54 = v21;
    _os_log_impl( &dword_187A54000,  v25,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [SPLOMBO] splombo scan failed with %{public}@, but this is non-fatal",  buf,  0x16u);
  }

  id v20 = v23;
LABEL_18:
  v48 = -[SUCoreScan originalScanPolicy](self, "originalScanPolicy");
  -[SUCoreScan setScanPolicy:](self, "setScanPolicy:", v48);

  -[SUCoreScan setOriginalScanPolicy:](self, "setOriginalScanPolicy:", 0LL);
}

- (void)_updateInterimScanResultWithPrimary:(id)a3 secondary:(id)a4 majorPrimary:(id)a5 majorSecondary:(id)a6 minorPrimary:(id)a7 minorSecondary:(id)a8 error:(id)a9
{
  id v29 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  if (-[SUCoreScan operation](self, "operation") != 1)
  {
    objc_msgSend( NSString,  "stringWithFormat:",  @"unknown operation (%d) found",  -[SUCoreScan operation](self, "operation"),  v28);
    goto LABEL_6;
  }

  if (-[SUCoreScan phase](self, "phase") == 1)
  {
    if (v20)
    {
      id v21 = -[SUCoreScanParam initWithResult:withError:]( [SUCoreScanParam alloc],  "initWithResult:withError:",  [v20 code],  v20);
LABEL_19:
      id v22 = v21;
      -[SUCoreScan setInterimScanResult:](self, "setInterimScanResult:", v21);
      goto LABEL_20;
    }

    if (-[SUCoreScan operationSPIType](self, "operationSPIType") == 1)
    {
      id v21 = -[SUCoreScanParam initWithDescriptor:withFallbackDescriptor:]( objc_alloc(&OBJC_CLASS___SUCoreScanParam),  "initWithDescriptor:withFallbackDescriptor:",  v29,  v15);
      goto LABEL_19;
    }

    if (-[SUCoreScan operationSPIType](self, "operationSPIType") == 2)
    {
      id v23 = objc_alloc(&OBJC_CLASS___SUCoreScanParam);
      id v24 = v16;
      id v25 = v17;
      id v26 = v18;
      id v27 = v19;
LABEL_18:
      id v21 = -[SUCoreScanParam initWithMajorPrimaryDescriptor:majorSecondaryDescriptor:minorPrimaryDescriptor:minorSecondaryDescriptor:]( v23,  "initWithMajorPrimaryDescriptor:majorSecondaryDescriptor:minorPrimaryDescriptor:minorSecondaryDescriptor:",  v24,  v25,  v26,  v27);
      goto LABEL_19;
    }

    if (-[SUCoreScan operationSPIType](self, "operationSPIType") == 3)
    {
      [v29 assignDescriptorAudienceType:1 descriptorPreferredUpdateType:2 assetAudienceUUID:0];
      [v15 assignDescriptorAudienceType:1 descriptorPreferredUpdateType:2 assetAudienceUUID:0];
      id v23 = objc_alloc(&OBJC_CLASS___SUCoreScanParam);
      id v24 = v29;
      id v25 = v15;
      id v26 = 0LL;
      id v27 = 0LL;
      goto LABEL_18;
    }

    [NSString stringWithFormat:@"%@ unknown operationSPIType (%d) found", self, -[SUCoreScan operationSPIType](self, "operationSPIType")];
LABEL_6:
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan _trackInconsistentAnomalyAndUpdateInterimResult:reason:]( self,  "_trackInconsistentAnomalyAndUpdateInterimResult:reason:",  @"[SCAN] UPDATE_INTERIM",  v22);
LABEL_20:

    goto LABEL_21;
  }

  if (-[SUCoreScan phase](self, "phase") == 2)
  {
    -[SUCoreScan _updateInterimScanResultForSplomboWithPrimary:secondary:majorPrimary:majorSecondary:minorPrimary:minorSecondary:error:]( self,  "_updateInterimScanResultForSplomboWithPrimary:secondary:majorPrimary:majorSecondary:minorPrimary:minorSecondary:error:",  v29,  v15,  v16,  v17,  v18,  v19,  v20);
  }

  else
  {
    if (-[SUCoreScan phase](self, "phase") != 3)
    {
      [NSString stringWithFormat:@"%@ invalid phase (%d) found", self, -[SUCoreScan phase](self, "phase")];
      goto LABEL_6;
    }

    -[SUCoreScan _updateInterimScanResultForSlowReleaseWithPrimary:secondary:error:]( self,  "_updateInterimScanResultForSlowReleaseWithPrimary:secondary:error:",  v29,  v15,  v20);
  }

- (void)_trackInconsistentAnomalyAndUpdateInterimResult:(id)a3 reason:(id)a4
{
  id v6 = (void *)MEMORY[0x189612760];
  id v7 = a4;
  id v8 = a3;
  [v6 sharedCore];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 buildError:8117 underlying:0 description:v7];
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  -[SUCoreScan scanFSM](self, "scanFSM");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 diag];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "trackAnomaly:forReason:withResult:withError:", v8, v7, objc_msgSend(v13, "code"), v13);

  id v12 = -[SUCoreScanParam initWithResult:withError:]( [SUCoreScanParam alloc],  "initWithResult:withError:",  [v13 code],  v13);
  -[SUCoreScan setInterimScanResult:](self, "setInterimScanResult:", v12);
}

- (void)_scanCompleteFoundPrimary:(id)a3 foundSecondary:(id)a4 majorPrimary:(id)a5 majorSecondary:(id)a6 minorPrimary:(id)a7 minorSecondary:(id)a8 clearingOperation:(BOOL)a9 error:(id)a10
{
  id v42 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a10;
  -[SUCoreScan scanFSM](self, "scanFSM");
  id v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 extendedStateQueue];
  id v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v23);

  -[SUCoreScan scanPolicy](self, "scanPolicy");
  id v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreScan activeDescriptor](self, "activeDescriptor");
  id v25 = (void *)objc_claimAutoreleasedReturnValue();
  switch(-[SUCoreScan operation](self, "operation"))
  {
    case 1:
      -[SUCoreScan _updateInterimScanResultWithPrimary:secondary:majorPrimary:majorSecondary:minorPrimary:minorSecondary:error:]( self,  "_updateInterimScanResultWithPrimary:secondary:majorPrimary:majorSecondary:minorPrimary:minorSecondary:error:",  v42,  v16,  v17,  v18,  v19,  v20,  v21);
      -[SUCoreScan scanFSM](self, "scanFSM");
      id v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v26 followupEvent:@"DecideNextScanStep"];

      if (a9) {
        goto LABEL_13;
      }
      break;
    case 2:
      id v40 = v18;
      id v27 = v17;
      -[SUCoreScan verifyCompletion](self, "verifyCompletion");
      uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreScan setVerifyCompletion:](self, "setVerifyCompletion:", 0LL);
      id v29 = v21;
      if (!v29 && (([v25 isEqual:v42] & 1) != 0 || objc_msgSend(v25, "isEqual:", v16)))
      {

        id v16 = 0LL;
        id v42 = 0LL;
      }

      LOBYTE(v38) = 1;
      -[SUCoreScan _verifyEndComplete:scanPolicy:active:primary:secondary:error:clearingTransaction:]( self,  "_verifyEndComplete:scanPolicy:active:primary:secondary:error:clearingTransaction:",  v28,  v24,  v25,  v42,  v16,  v29,  v38);

      id v17 = v27;
      id v18 = v40;
      goto LABEL_12;
    case 3:
      v30 = -[SUCoreScan collectCompletion](self, "collectCompletion");
      -[SUCoreScan setCollectCompletion:](self, "setCollectCompletion:", 0LL);
      -[SUCoreScan _collectEndComplete:scanPolicy:active:error:clearingTransaction:]( self,  "_collectEndComplete:scanPolicy:active:error:clearingTransaction:",  v30,  v24,  v25,  v21,  1LL);

      goto LABEL_12;
    case 4:
      -[SUCoreScan primaryUpdateAsset](self, "primaryUpdateAsset");
      id v41 = v21;
      unint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreScan secondaryUpdateAsset](self, "secondaryUpdateAsset");
      id v39 = v17;
      BOOL v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreScan setPrimaryUpdateAsset:](self, "setPrimaryUpdateAsset:", 0LL);
      -[SUCoreScan setSecondaryUpdateAsset:](self, "setSecondaryUpdateAsset:", 0LL);
      -[SUCoreScan locateCompletion](self, "locateCompletion");
      id v33 = v16;
      id v34 = v20;
      id v35 = v19;
      id v36 = v18;
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreScan setLocateCompletion:](self, "setLocateCompletion:", 0LL);
      -[SUCoreScan _locateEndComplete:scanPolicy:primary:secondary:error:clearingTransaction:]( self,  "_locateEndComplete:scanPolicy:primary:secondary:error:clearingTransaction:",  v37,  v24,  v31,  v32,  v41,  1LL);

      id v18 = v36;
      id v19 = v35;
      id v20 = v34;
      id v16 = v33;

      id v17 = v39;
      id v21 = v41;
LABEL_12:
      if (a9)
      {
LABEL_13:
        if (-[SUCoreScan operation](self, "operation") != 1) {
          -[SUCoreScan _clearCurrentOperation](self, "_clearCurrentOperation");
        }
      }

      break;
    default:
      -[SUCoreScan _invalidOperation:](self, "_invalidOperation:", @"[SCAN] COMPLETION");
      break;
  }
}

- (void)_cancelCompleteWithError:(id)a3
{
  id v4 = a3;
  -[SUCoreScan scanFSM](self, "scanFSM");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 extendedStateQueue];
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUCoreScan cancelCompletion](self, "cancelCompletion");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SUCoreScan setCancelCompletion:](self, "setCancelCompletion:", 0LL);
  -[SUCoreScan _cancelEndComplete:error:clearingTransaction:]( self,  "_cancelEndComplete:error:clearingTransaction:",  v7,  v4,  1LL);

  -[SUCoreScan _clearCurrentOperation](self, "_clearCurrentOperation");
}

- (void)_checkEndComplete:(id)a3 scanPolicy:(id)a4 primary:(id)a5 secondary:(id)a6 error:(id)a7 clearingTransaction:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  -[SUCoreScan scanFSM](self, "scanFSM");
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 extendedStateQueue];
  id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v20);

  if (v8)
  {
    -[SUCoreScan scanCheckTransaction](self, "scanCheckTransaction");
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan setScanCheckTransaction:](self, "setScanCheckTransaction:", 0LL);
  }

  else
  {
    id v21 = 0LL;
  }

  id v22 = (void *)MEMORY[0x1895B1904](v14);
  -[SUCoreScan _operationCompleting:error:clearingTransaction:]( self,  "_operationCompleting:error:clearingTransaction:",  v22,  v18,  v8);

  if (v14)
  {
    -[SUCoreScan clientCompletionQueue](self, "clientCompletionQueue");
    id v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = MEMORY[0x1895F87A8];
    uint64_t v26 = 3221225472LL;
    id v27 = __87__SUCoreScan__checkEndComplete_scanPolicy_primary_secondary_error_clearingTransaction___block_invoke;
    uint64_t v28 = &unk_18A0F0418;
    id v34 = v14;
    id v29 = v15;
    id v30 = v16;
    id v31 = v17;
    id v32 = v18;
    id v33 = v21;
    dispatch_async(v23, &v25);
  }

  else if (v21)
  {
    [MEMORY[0x189612760] endTransaction:v21 withName:@"scan.CheckForAvailableUpdate"];
  }

  if (v18) {
    uint64_t v24 = [v18 code];
  }
  else {
    uint64_t v24 = 0LL;
  }
  -[SUCoreScan _trackScanEnd:withResult:withError:]( self,  "_trackScanEnd:withResult:withError:",  @"checkForAvailableUpdateWithPolicy",  v24,  v18,  v25,  v26,  v27,  v28);
}

uint64_t __87__SUCoreScan__checkEndComplete_scanPolicy_primary_secondary_error_clearingTransaction___block_invoke( uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 72) + 16LL))();
  uint64_t v3 = *(void *)(a1 + 64);
  if (v3) {
    return [MEMORY[0x189612760] endTransaction:v3 withName:@"scan.CheckForAvailableUpdate"];
  }
  return result;
}

- (void)_checkMajorMinorEndComplete:(id)a3 scanPolicy:(id)a4 majorPrimary:(id)a5 majorSecondary:(id)a6 minorPrimary:(id)a7 minorSecondary:(id)a8 error:(id)a9 clearingTransaction:(BOOL)a10
{
  id v16 = a3;
  id v29 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  -[SUCoreScan scanFSM](self, "scanFSM");
  id v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 extendedStateQueue];
  id v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v23);

  if (a10)
  {
    -[SUCoreScan scanCheckTransaction](self, "scanCheckTransaction");
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan setScanCheckTransaction:](self, "setScanCheckTransaction:", 0LL);
  }

  else
  {
    uint64_t v24 = 0LL;
  }

  uint64_t v25 = (void *)MEMORY[0x1895B1904](v16);
  -[SUCoreScan _operationCompleting:error:clearingTransaction:]( self,  "_operationCompleting:error:clearingTransaction:",  v25,  v21,  a10);

  if (v16)
  {
    -[SUCoreScan clientCompletionQueue](self, "clientCompletionQueue");
    uint64_t v26 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __135__SUCoreScan__checkMajorMinorEndComplete_scanPolicy_majorPrimary_majorSecondary_minorPrimary_minorSecondary_error_clearingTransaction___block_invoke;
    block[3] = &unk_18A0F0440;
    id v38 = v16;
    id v27 = v29;
    id v31 = v29;
    id v32 = v17;
    id v33 = v18;
    id v34 = v19;
    id v35 = v20;
    id v36 = v21;
    id v37 = v24;
    dispatch_async(v26, block);
  }

  else
  {
    id v27 = v29;
    if (v24) {
      [MEMORY[0x189612760] endTransaction:v24 withName:@"scan.CheckForAvailableUpdate"];
    }
  }

  if (v21) {
    uint64_t v28 = [v21 code];
  }
  else {
    uint64_t v28 = 0LL;
  }
  -[SUCoreScan _trackScanEnd:withResult:withError:]( self,  "_trackScanEnd:withResult:withError:",  @"checkForAvailableUpdateWithPolicy",  v28,  v21);
}

uint64_t __135__SUCoreScan__checkMajorMinorEndComplete_scanPolicy_majorPrimary_majorSecondary_minorPrimary_minorSecondary_error_clearingTransaction___block_invoke( uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 88) + 16LL))();
  uint64_t v3 = *(void *)(a1 + 80);
  if (v3) {
    return [MEMORY[0x189612760] endTransaction:v3 withName:@"scan.CheckForAvailableUpdate"];
  }
  return result;
}

- (BOOL)_decideAndProcessSlowReleaseScan
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  -[SUCoreScan scanFSM](self, "scanFSM");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 extendedStateQueue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (-[SUCoreScan phase](self, "phase") <= 2
    && -[SUCoreScan operation](self, "operation") == 1
    && -[SUCoreScan operationSPIType](self, "operationSPIType") == 3)
  {
    -[SUCoreScan interimScanResult](self, "interimScanResult");
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 majorPrimaryDescriptor];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreScan interimScanResult](self, "interimScanResult");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 error];
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue();

    [v8 userInfo];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 safeObjectForKey:*MEMORY[0x189607798] ofClass:objc_opt_class()];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      [v8 domain];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ([v11 isEqualToString:*MEMORY[0x189612928]]
        && [v8 code] == 8400
        && v10)
      {
        [v10 domain];
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ([v12 isEqualToString:@"com.apple.MobileAssetError.Download"]
          && [v10 code] == 18)
        {
          -[SUCoreScan scanPolicy](self, "scanPolicy");
          id v13 = (void *)objc_claimAutoreleasedReturnValue();
          int v14 = [v13 isRequestedPMVSupervisedPolicy];

          if (!v14) {
            goto LABEL_19;
          }
LABEL_15:
          -[SUCoreScan scanPolicy](self, "scanPolicy");
          id v19 = (void *)objc_claimAutoreleasedReturnValue();
          [v19 alternateAssetAudienceUUID];
          id v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            -[SUCoreScan setAlternateAssetAudienceUUID:](self, "setAlternateAssetAudienceUUID:", v20);
          }

          else
          {
            [v6 alternateAssetAudienceUUID];
            id v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[SUCoreScan setAlternateAssetAudienceUUID:](self, "setAlternateAssetAudienceUUID:", v21);
          }

          if (v8)
          {
            -[SUCoreScan alternateAssetAudienceUUID](self, "alternateAssetAudienceUUID");
            id v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v22)
            {
              id v23 = objc_alloc(MEMORY[0x189612768]);
              uint64_t v24 = (void *)[v23 initWithProjectName:*MEMORY[0x189612850]];
              [v24 getStringConfigForKey:*MEMORY[0x1896127E0]];
              uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[SUCoreScan setAlternateAssetAudienceUUID:](self, "setAlternateAssetAudienceUUID:", v25);

              -[SUCoreScan alternateAssetAudienceUUID](self, "alternateAssetAudienceUUID");
              uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();

              if (v26)
              {
                [MEMORY[0x1896127A0] sharedLogger];
                id v27 = (void *)objc_claimAutoreleasedReturnValue();
                [v27 oslog];
                uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();

                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  -[SUCoreScan alternateAssetAudienceUUID](self, "alternateAssetAudienceUUID");
                  id v29 = (void *)objc_claimAutoreleasedReturnValue();
                  int v33 = 138543618;
                  id v34 = self;
                  __int16 v35 = 2114;
                  id v36 = v29;
                  _os_log_impl( &dword_187A54000,  v28,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [DUAL_AUDIENCE] Using alternate asset audience from SUCoreConfig: %{public}@",  (uint8_t *)&v33,  0x16u);
                }
              }

              else
              {
                -[SUCoreScan setAlternateAssetAudienceUUID:]( self,  "setAlternateAssetAudienceUUID:",  @"UnknownPlatform");
              }
            }
          }

          [MEMORY[0x1896127A0] sharedLogger];
          id v30 = (void *)objc_claimAutoreleasedReturnValue();
          [v30 oslog];
          id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            -[SUCoreScan alternateAssetAudienceUUID](self, "alternateAssetAudienceUUID");
            id v32 = (void *)objc_claimAutoreleasedReturnValue();
            int v33 = 138543618;
            id v34 = self;
            __int16 v35 = 2114;
            id v36 = v32;
            _os_log_impl( &dword_187A54000,  v31,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [DUAL_AUDIENCE] alternate scan using asset audience: %{public}@",  (uint8_t *)&v33,  0x16u);
          }

          BOOL v15 = 1;
          goto LABEL_31;
        }
      }
    }

    else
    {
      -[SUCoreScan scanPolicy](self, "scanPolicy");
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      BOOL v18 = -[SUCoreScan _shouldPerformAlternateScanFromFoundDescriptor:policy:]( self,  "_shouldPerformAlternateScanFromFoundDescriptor:policy:",  v6,  v17);

      if (v18) {
        goto LABEL_15;
      }
    }

- (BOOL)_decideAndProcessSplomboScan
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  -[SUCoreScan scanFSM](self, "scanFSM");
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 extendedStateQueue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  [MEMORY[0x1896127A0] sharedLogger];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 oslog];
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = self;
    _os_log_impl( &dword_187A54000,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [SPLOMBO] Current platform doesn't support Splombo",  (uint8_t *)&v8,  0xCu);
  }

  return 0;
}

- (BOOL)_decideAndProcessPSUSScanForPrimaryDescriptor:(id)a3 secondaryDescriptor:(id)a4 andError:(id)a5
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  objc_msgSend(MEMORY[0x1896127A0], "sharedLogger", a3, a4, a5);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 oslog];
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543362;
    uint64_t v10 = self;
    _os_log_impl( &dword_187A54000,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [PreSUStaging] not supported in SUCore for this platform",  (uint8_t *)&v9,  0xCu);
  }

  return 0;
}

- (BOOL)_shouldPerformPSUSScanFromFoundDescriptor:(id)a3 policy:(id)a4
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v11 = 0LL;
  BOOL v5 = +[SUCoreScan isPreSUStagingEnabledForUpdate:policy:reason:]( &OBJC_CLASS___SUCoreScan,  "isPreSUStagingEnabledForUpdate:policy:reason:",  a3,  a4,  &v11);
  id v6 = v11;
  [MEMORY[0x1896127A0] sharedLogger];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 oslog];
  int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = @"NO";
    *(_DWORD *)buf = 138543874;
    id v13 = self;
    __int16 v14 = 2114;
    if (v5) {
      int v9 = @"YES";
    }
    BOOL v15 = v9;
    __int16 v16 = 2114;
    id v17 = v6;
    _os_log_impl( &dword_187A54000,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [PreSUStaging] Performing psus scan: %{public}@; reason; %{public}@",
      buf,
      0x20u);
  }

  return v5;
}

- (BOOL)_shouldPerformSplomboScanFromFoundDescriptor:(id)a3 policy:(id)a4
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  objc_msgSend(MEMORY[0x1896127A0], "sharedLogger", a3, a4);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 oslog];
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543874;
    int v9 = self;
    __int16 v10 = 2114;
    id v11 = @"NO";
    __int16 v12 = 2114;
    id v13 = @"Defaults to not performing splombo scan";
    _os_log_impl( &dword_187A54000,  v6,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [SPLOMBO] Performing splombo scan: %{public}@ (%{public}@)",  (uint8_t *)&v8,  0x20u);
  }

  return 0;
}

- (BOOL)_shouldPerformAlternateScanFromFoundDescriptor:(id)a3 policy:(id)a4
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  if ([v7 disableAlternateUpdate])
  {
    BOOL v8 = 0;
    int v9 = @"Alternate scan disabled via policy";
  }

  else if ([v7 isRequestedPMVSupervisedPolicy])
  {
    BOOL v8 = 0;
    int v9 = @"Alternate scan disabled for supervised PMV requests";
  }

  else
  {
    [v7 alternateAssetAudienceUUID];
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      int v9 = @"Alternate scan enabled via policy alternate asset audience";
      BOOL v8 = 1;
    }

    else
    {
      int v9 = @"Defaults to not performing alternate scan";
      if ([v6 enableAlternateAssetAudience])
      {
        [v6 alternateAssetAudienceUUID];
        id v11 = (void *)objc_claimAutoreleasedReturnValue();

        BOOL v12 = v11 == 0LL;
        BOOL v8 = v11 != 0LL;
        if (!v12) {
          int v9 = @"Located descriptor indicates an alternate scan should be performed";
        }
      }

      else
      {
        BOOL v8 = 0;
      }
    }
  }

  [MEMORY[0x1896127A0] sharedLogger];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 oslog];
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v15 = @"NO";
    int v17 = 138543874;
    uint64_t v18 = self;
    __int16 v19 = 2114;
    if (v8) {
      BOOL v15 = @"YES";
    }
    id v20 = v15;
    __int16 v21 = 2114;
    id v22 = v9;
    _os_log_impl( &dword_187A54000,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [DUAL_AUDIENCE] Performing alternate scan: %{public}@ (%{public}@)",  (uint8_t *)&v17,  0x20u);
  }

  return v8;
}

- (void)_checkSlowReleaseEndComplete:(id)a3 scanPolicy:(id)a4 primary:(id)a5 secondary:(id)a6 alternatePrimary:(id)a7 alternateSecondary:(id)a8 error:(id)a9 clearingTransaction:(BOOL)a10
{
  id v16 = a3;
  id v30 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  -[SUCoreScan scanFSM](self, "scanFSM");
  id v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 extendedStateQueue];
  uint64_t v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v23);

  id v24 = v21;
  if (a10)
  {
    -[SUCoreScan scanCheckTransaction](self, "scanCheckTransaction");
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan setScanCheckTransaction:](self, "setScanCheckTransaction:", 0LL);
  }

  else
  {
    uint64_t v25 = 0LL;
  }

  uint64_t v26 = (void *)MEMORY[0x1895B1904](v16);
  -[SUCoreScan _operationCompleting:error:clearingTransaction:]( self,  "_operationCompleting:error:clearingTransaction:",  v26,  v24,  a10);

  if (v16)
  {
    -[SUCoreScan clientCompletionQueue](self, "clientCompletionQueue");
    id v27 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __134__SUCoreScan__checkSlowReleaseEndComplete_scanPolicy_primary_secondary_alternatePrimary_alternateSecondary_error_clearingTransaction___block_invoke;
    block[3] = &unk_18A0F0440;
    id v39 = v16;
    uint64_t v28 = v30;
    id v32 = v30;
    id v33 = v17;
    id v34 = v18;
    id v35 = v19;
    id v36 = v20;
    id v37 = v24;
    id v38 = v25;
    dispatch_async(v27, block);
  }

  else
  {
    uint64_t v28 = v30;
    if (v25) {
      [MEMORY[0x189612760] endTransaction:v25 withName:@"scan.CheckForAvailableUpdate"];
    }
  }

  if (v24) {
    uint64_t v29 = [v24 code];
  }
  else {
    uint64_t v29 = 0LL;
  }
  -[SUCoreScan _trackScanEnd:withResult:withError:]( self,  "_trackScanEnd:withResult:withError:",  @"checkForAvailableSlowReleaseUpdatesWithPolicy",  v29,  v24);
}

uint64_t __134__SUCoreScan__checkSlowReleaseEndComplete_scanPolicy_primary_secondary_alternatePrimary_alternateSecondary_error_clearingTransaction___block_invoke( uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 88) + 16LL))();
  uint64_t v3 = *(void *)(a1 + 80);
  if (v3) {
    return [MEMORY[0x189612760] endTransaction:v3 withName:@"scan.CheckForAvailableUpdate"];
  }
  return result;
}

- (void)_verifyEndComplete:(id)a3 scanPolicy:(id)a4 active:(id)a5 primary:(id)a6 secondary:(id)a7 error:(id)a8 clearingTransaction:(BOOL)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  -[SUCoreScan scanFSM](self, "scanFSM");
  id v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 extendedStateQueue];
  id v22 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v22);

  if (a9)
  {
    -[SUCoreScan scanVerifyTransaction](self, "scanVerifyTransaction");
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan setScanVerifyTransaction:](self, "setScanVerifyTransaction:", 0LL);
  }

  else
  {
    uint64_t v23 = 0LL;
  }

  id v24 = (void *)MEMORY[0x1895B1904](v15);
  -[SUCoreScan _operationCompleting:error:clearingTransaction:]( self,  "_operationCompleting:error:clearingTransaction:",  v24,  v20,  a9);

  if (v15)
  {
    -[SUCoreScan clientCompletionQueue](self, "clientCompletionQueue");
    uint64_t v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __95__SUCoreScan__verifyEndComplete_scanPolicy_active_primary_secondary_error_clearingTransaction___block_invoke;
    block[3] = &unk_18A0F0468;
    id v34 = v15;
    id v28 = v16;
    id v29 = v17;
    id v30 = v18;
    id v31 = v19;
    id v32 = v20;
    id v33 = v23;
    dispatch_async(v25, block);
  }

  else if (v23)
  {
    [MEMORY[0x189612760] endTransaction:v23 withName:@"scan.VerifyLatestAvailable"];
  }

  if (v20) {
    uint64_t v26 = [v20 code];
  }
  else {
    uint64_t v26 = 0LL;
  }
  -[SUCoreScan _trackScanEnd:withResult:withError:]( self,  "_trackScanEnd:withResult:withError:",  @"verifyLatestAvailableWithPolicy",  v26,  v20);
}

uint64_t __95__SUCoreScan__verifyEndComplete_scanPolicy_active_primary_secondary_error_clearingTransaction___block_invoke( uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 80) + 16LL))();
  uint64_t v3 = *(void *)(a1 + 72);
  if (v3) {
    return [MEMORY[0x189612760] endTransaction:v3 withName:@"scan.VerifyLatestAvailable"];
  }
  return result;
}

- (void)_collectEndComplete:(id)a3 scanPolicy:(id)a4 active:(id)a5 error:(id)a6 clearingTransaction:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  -[SUCoreScan scanFSM](self, "scanFSM");
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 extendedStateQueue];
  id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v17);

  if (v7)
  {
    -[SUCoreScan scanCollectTransaction](self, "scanCollectTransaction");
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan setScanCollectTransaction:](self, "setScanCollectTransaction:", 0LL);
  }

  else
  {
    id v18 = 0LL;
  }

  id v19 = (void *)MEMORY[0x1895B1904](v12);
  -[SUCoreScan _operationCompleting:error:clearingTransaction:]( self,  "_operationCompleting:error:clearingTransaction:",  v19,  v15,  v7);

  if (v12)
  {
    -[SUCoreScan clientCompletionQueue](self, "clientCompletionQueue");
    id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __78__SUCoreScan__collectEndComplete_scanPolicy_active_error_clearingTransaction___block_invoke;
    block[3] = &unk_18A0F0490;
    id v27 = v12;
    id v23 = v13;
    id v24 = v14;
    id v25 = v15;
    id v26 = v18;
    dispatch_async(v20, block);
  }

  else if (v18)
  {
    [MEMORY[0x189612760] endTransaction:v18 withName:@"scan.CollectDocumentationMetadata"];
  }

  if (v15) {
    uint64_t v21 = [v15 code];
  }
  else {
    uint64_t v21 = 0LL;
  }
  -[SUCoreScan _trackScanEnd:withResult:withError:]( self,  "_trackScanEnd:withResult:withError:",  @"collectDocumentationMetadataWithPolicy",  v21,  v15);
}

uint64_t __78__SUCoreScan__collectEndComplete_scanPolicy_active_error_clearingTransaction___block_invoke( uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 64) + 16LL))();
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3) {
    return [MEMORY[0x189612760] endTransaction:v3 withName:@"scan.CollectDocumentationMetadata"];
  }
  return result;
}

- (void)_locateEndComplete:(id)a3 scanPolicy:(id)a4 primary:(id)a5 secondary:(id)a6 error:(id)a7 clearingTransaction:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  -[SUCoreScan scanFSM](self, "scanFSM");
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v19 extendedStateQueue];
  id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v20);

  if (v8)
  {
    -[SUCoreScan scanLocateTransaction](self, "scanLocateTransaction");
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan setScanLocateTransaction:](self, "setScanLocateTransaction:", 0LL);
  }

  else
  {
    uint64_t v21 = 0LL;
  }

  id v22 = (void *)MEMORY[0x1895B1904](v14);
  -[SUCoreScan _operationCompleting:error:clearingTransaction:]( self,  "_operationCompleting:error:clearingTransaction:",  v22,  v18,  v8);

  if (v14)
  {
    -[SUCoreScan clientCompletionQueue](self, "clientCompletionQueue");
    id v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v25 = MEMORY[0x1895F87A8];
    uint64_t v26 = 3221225472LL;
    id v27 = __88__SUCoreScan__locateEndComplete_scanPolicy_primary_secondary_error_clearingTransaction___block_invoke;
    id v28 = &unk_18A0F0418;
    id v34 = v14;
    id v29 = v15;
    id v30 = v16;
    id v31 = v17;
    id v32 = v18;
    id v33 = v21;
    dispatch_async(v23, &v25);
  }

  else if (v21)
  {
    [MEMORY[0x189612760] endTransaction:v21 withName:@"scan.LocateAvailableUpdate"];
  }

  if (v18) {
    uint64_t v24 = [v18 code];
  }
  else {
    uint64_t v24 = 0LL;
  }
  -[SUCoreScan _trackScanEnd:withResult:withError:]( self,  "_trackScanEnd:withResult:withError:",  @"locateAvailableUpdateWithPolicy",  v24,  v18,  v25,  v26,  v27,  v28);
}

uint64_t __88__SUCoreScan__locateEndComplete_scanPolicy_primary_secondary_error_clearingTransaction___block_invoke( uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 72) + 16LL))();
  uint64_t v3 = *(void *)(a1 + 64);
  if (v3) {
    return [MEMORY[0x189612760] endTransaction:v3 withName:@"scan.LocateAvailableUpdate"];
  }
  return result;
}

- (void)_cancelEndComplete:(id)a3 error:(id)a4 clearingTransaction:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  -[SUCoreScan scanFSM](self, "scanFSM");
  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 extendedStateQueue];
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  if (v5)
  {
    -[SUCoreScan scanCancelTransaction](self, "scanCancelTransaction");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan setScanCancelTransaction:](self, "setScanCancelTransaction:", 0LL);
  }

  else
  {
    id v12 = 0LL;
  }

  id v13 = (void *)MEMORY[0x1895B1904](v8);
  -[SUCoreScan _operationCompleting:error:clearingTransaction:]( self,  "_operationCompleting:error:clearingTransaction:",  v13,  v9,  v5);

  if (v8)
  {
    -[SUCoreScan clientCompletionQueue](self, "clientCompletionQueue");
    id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __59__SUCoreScan__cancelEndComplete_error_clearingTransaction___block_invoke;
    block[3] = &unk_18A0EF8F8;
    id v19 = v8;
    id v17 = v9;
    id v18 = v12;
    dispatch_async(v14, block);
  }

  else if (v12)
  {
    [MEMORY[0x189612760] endTransaction:v12 withName:@"scan.CancelCurrentScan"];
  }

  if (v9) {
    uint64_t v15 = [v9 code];
  }
  else {
    uint64_t v15 = 0LL;
  }
  -[SUCoreScan _trackScanEnd:withResult:withError:]( self,  "_trackScanEnd:withResult:withError:",  @"cancelCurrentScan",  v15,  v9);
}

uint64_t __59__SUCoreScan__cancelEndComplete_error_clearingTransaction___block_invoke(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    return [MEMORY[0x189612760] endTransaction:v3 withName:@"scan.CancelCurrentScan"];
  }
  return result;
}

- (void)_clearCurrentOperation
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  int v3 = 138543618;
  id v4 = a1;
  __int16 v5 = 1024;
  int v6 = [a1 pendingMobileAssetRequests];
  _os_log_error_impl( &dword_187A54000,  a2,  OS_LOG_TYPE_ERROR,  "%{public}@ [MA_PENDING] clearCurrentOperation - non-zero MA pending (%d) - clearing",  (uint8_t *)&v3,  0x12u);
}

uint64_t __36__SUCoreScan__clearCurrentOperation__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  0LL,  0LL,  *(void *)(a1 + 32));
}

uint64_t __36__SUCoreScan__clearCurrentOperation__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  0LL,  0LL,  0LL,  0LL,  *(void *)(a1 + 32));
}

uint64_t __36__SUCoreScan__clearCurrentOperation__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  0LL,  0LL,  0LL,  0LL,  *(void *)(a1 + 32));
}

uint64_t __36__SUCoreScan__clearCurrentOperation__block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  0LL,  0LL,  0LL,  *(void *)(a1 + 32));
}

uint64_t __36__SUCoreScan__clearCurrentOperation__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  0LL,  *(void *)(a1 + 32));
}

uint64_t __36__SUCoreScan__clearCurrentOperation__block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  0LL,  0LL,  *(void *)(a1 + 32));
}

uint64_t __36__SUCoreScan__clearCurrentOperation__block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

+ (id)_phaseName:(int)a3
{
  if (a3 > 6) {
    int v3 = (__CFString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"UNKNOWN(%d)",  *(void *)&a3);
  }
  else {
    int v3 = kSUCoreScanPhaseName[a3];
  }
  return v3;
}

- (id)_operationName
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 extendedStateQueue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  if (-[SUCoreScan operation](self, "operation") < 0 || -[SUCoreScan operation](self, "operation") > 4) {
    __int16 v5 = (__CFString *)objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"UNKNOWN(%d)",  -[SUCoreScan operation](self, "operation"));
  }
  else {
    __int16 v5 = kSUCoreScanOperationName[-[SUCoreScan operation](self, "operation")];
  }
  return v5;
}

- (void)_operationCompleting:(id)a3 error:(id)a4 clearingTransaction:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v26 = *MEMORY[0x1895F89C0];
  id v8 = (__CFString *)a4;
  [MEMORY[0x1896127A0] sharedLogger];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 oslog];
  __int16 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = -[SUCoreScan _operationName](self, "_operationName");
    id v12 = (void *)v11;
    id v13 = @"calling client completion";
    if (!a3) {
      id v13 = @"has completed (no client completion)";
    }
    id v14 = @"NO";
    int v16 = 138544386;
    id v17 = self;
    if (v5) {
      id v14 = @"YES";
    }
    __int16 v18 = 2114;
    uint64_t v19 = v11;
    __int16 v20 = 2114;
    uint64_t v21 = v13;
    __int16 v22 = 2114;
    id v23 = v14;
    if (v8) {
      uint64_t v15 = v8;
    }
    else {
      uint64_t v15 = @"SUCCESS";
    }
    __int16 v24 = 2114;
    uint64_t v25 = v15;
    _os_log_impl( &dword_187A54000,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ %{public}@ %{public}@ [clearingTransaction:%{public}@] | %{public}@",  (uint8_t *)&v16,  0x34u);
  }
}

- (void)_invalidOperation:(id)a3
{
  id v4 = a3;
  -[SUCoreScan scanFSM](self, "scanFSM");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 extendedStateQueue];
  int v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUCoreScan scanFSM](self, "scanFSM");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [v11 diag];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = objc_alloc(NSString);
  -[SUCoreScan _operationName](self, "_operationName");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  __int16 v10 = (void *)[v8 initWithFormat:@"%@ invalid scan operation: %@", self, v9];
  [v7 trackAnomaly:v4 forReason:v10 withResult:8102 withError:0];
}

- (id)description
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SUCoreScan scanPolicy](self, "scanPolicy");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 softwareUpdateScanPolicy];
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 rampingScanType];
    int v6 = (void *)objc_claimAutoreleasedReturnValue();

    id v7 = objc_alloc(NSString);
    -[SUCoreScan scanUUID](self, "scanUUID");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan scanPolicy](self, "scanPolicy");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 softwareUpdateScanPolicy];
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue();
    else {
      id v11 = @"N";
    }
    if (v6)
    {
      -[SUCoreScan scanPolicy](self, "scanPolicy");
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 softwareUpdateScanPolicy];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 rampingScanType];
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = (void *)[v7 initWithFormat:@"[SCAN(%@) SU disc:%@, ramp:%@]", v8, v11, v14];
    }

    else
    {
      uint64_t v15 = (void *)[v7 initWithFormat:@"[SCAN(%@) SU disc:%@]", v8, v11];
    }
  }

  else
  {
    id v16 = objc_alloc(NSString);
    -[SUCoreScan scanUUID](self, "scanUUID");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = (void *)[v16 initWithFormat:@"[SCAN(%@)]", v8];
  }

  return v15;
}

- (int64_t)_determinePSUSAssets
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 extendedStateQueue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[SUCoreScan _incrementMobileAssetPending:](self, "_incrementMobileAssetPending:", @"_determinePSUSAssets");
  -[SUCoreScan psusPrimaryDescriptor](self, "psusPrimaryDescriptor");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    uint64_t v24 = 0LL;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x3032000000LL;
    id v27 = __Block_byref_object_copy__1;
    id v28 = __Block_byref_object_dispose__1;
    id v29 = 0LL;
    v23[0] = MEMORY[0x1895F87A8];
    v23[1] = 3221225472LL;
    v23[2] = __34__SUCoreScan__determinePSUSAssets__block_invoke;
    v23[3] = &unk_18A0F04B8;
    v23[4] = self;
    void v23[5] = &v24;
    int v6 = (void *)MEMORY[0x1895B1904](v23);
    [v5 productVersion];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 productBuildVersion];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 trainName];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 restoreVersion];
    __int16 v10 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189603FC8] dictionary];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 setSafeObject:v7 forKey:@"OSVersion"];
    [v11 setSafeObject:v8 forKey:@"Build"];
    [v11 setSafeObject:v9 forKey:@"TrainName"];
    [v11 setSafeObject:v10 forKey:@"RestoreVersion"];
    [v11 setSafeObject:&unk_18A112688 forKey:@"GroupNames"];
    -[SUCoreScan _reportPSUSDetermineStartedEvent](self, "_reportPSUSDetermineStartedEvent");
    -[SUCoreScan _trackScanBegin:](self, "_trackScanBegin:", @"stageDetermineGroupsAvailableForUpdate");
    uint64_t v12 = [MEMORY[0x189603F50] now];
    id v13 = (void *)v25[5];
    v25[5] = v12;

    objc_msgSend(MEMORY[0x189611100], "SUCoreBorder_stageDetermineGroupsAvailableForUpdate:completion:", v11, v6);
    _Block_object_dispose(&v24, 8);

    int64_t v14 = 0LL;
  }

  else
  {
    [NSString stringWithFormat:@"%@ psus descriptor is nil", self];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189612760] sharedCore];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    int64_t v14 = 8411LL;
    [v16 buildError:8411 underlying:0 description:v15];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreScan scanFSM](self, "scanFSM");
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 diag];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 trackAnomaly:@"[SCAN] PSUS" forReason:v15 withResult:8411 withError:v17];

    __int16 v20 = -[SUCoreScanParam initWithResult:withError:]( objc_alloc(&OBJC_CLASS___SUCoreScanParam),  "initWithResult:withError:",  8411LL,  v17);
    -[SUCoreScan scanFSM](self, "scanFSM");
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 postProtectedEvent:@"PSUSAssetsDetermineFailed" withInfo:v20];
  }

  return v14;
}

void __34__SUCoreScan__determinePSUSAssets__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v54 = *MEMORY[0x1895F89C0];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  [MEMORY[0x189603F50] now];
  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  double v12 = v11;

  objc_msgSend( *(id *)(a1 + 32),  "_trackScanEnd:withResult:withError:",  @"stageDetermineGroupsAvailableForUpdate",  objc_msgSend(v9, "code"),  v9);
  if (!v9)
  {
    uint64_t v15 = [v8 safeULLForKey:@"STAGE_GROUP_REQUIRED" defaultValue:0];
    uint64_t v16 = [v8 safeULLForKey:@"STAGE_GROUP_OPTIONAL" defaultValue:0];
    id v17 = (void *)NSString;
    [*(id *)(a1 + 32) psusPrimaryDescriptor];
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 summary];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 stringWithFormat:@"found assets with {requiredSize=%llu, optionalSize=%llu} for %@", v15, v16, v19];
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 oslog];
    __int16 v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138544130;
      uint64_t v47 = v23;
      __int16 v48 = 2114;
      id v49 = v20;
      __int16 v50 = 2048;
      uint64_t v51 = [v7 count];
      __int16 v52 = 2114;
      id v53 = v8;
      _os_log_impl( &dword_187A54000,  v22,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [PreSUStaging] succeeded; %{public}@\n"
        "[>>>\n"
        "byGroupAvailableForStagingAttributes = DICT[%lu]\n"
        "byGroupTotalExpectedBytes = %{public}@\n"
        "<<<]",
        buf,
        0x2Au);
    }

    uint64_t v24 = -[SUCoreScanParam initWithNote:](objc_alloc(&OBJC_CLASS___SUCoreScanParam), "initWithNote:", v20);
    -[SUCoreScanParam additionalInfo](v24, "additionalInfo");
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = v25;
    id v27 = @"PSUSAssetsSizes";
    id v28 = v8;
    goto LABEL_17;
  }

  [v9 domain];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (![v13 isEqualToString:@"com.apple.MobileAssetError.AutoAsset"])
  {

    goto LABEL_9;
  }

  uint64_t v14 = [v9 code];

  if (v14 != 6602)
  {
LABEL_9:
    [v9 domain];
    id v29 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v29 isEqualToString:@"com.apple.MobileAssetError.AutoAsset"])
    {
      uint64_t v30 = [v9 code];

      if (v30 == 6609)
      {
        objc_msgSend(NSString, "stringWithFormat:", @"Operation canceled", v44, v45);
        goto LABEL_12;
      }
    }

    else
    {
    }

    id v35 = (void *)NSString;
    [*(id *)(a1 + 32) psusPrimaryDescriptor];
    id v36 = (void *)objc_claimAutoreleasedReturnValue();
    [v36 summary];
    id v37 = (void *)objc_claimAutoreleasedReturnValue();
    [v35 stringWithFormat:@"failed to determine for %@ with %@, but this is non-fatal", v37, v9];
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x1896127A0] sharedLogger];
    id v38 = (void *)objc_claimAutoreleasedReturnValue();
    [v38 oslog];
    id v39 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v40 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v47 = v40;
      __int16 v48 = 2114;
      id v49 = v20;
      _os_log_impl(&dword_187A54000, v39, OS_LOG_TYPE_DEFAULT, "%{public}@ [PreSUStaging] %{public}@", buf, 0x16u);
    }

    uint64_t v24 = -[SUCoreScanParam initWithNote:](objc_alloc(&OBJC_CLASS___SUCoreScanParam), "initWithNote:", v20);
    -[SUCoreScanParam additionalInfo](v24, "additionalInfo");
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v26 = v25;
    id v27 = @"PSUSDetermineError";
    id v28 = v9;
LABEL_17:
    [v25 setSafeObject:v28 forKey:v27];

    id v34 = @"PSUSAssetsDetermineSuccess";
    goto LABEL_18;
  }

  [NSString stringWithFormat:@"Failed to determine PSUS, assets: %@, bytes: %@", v7, v8];
LABEL_12:
  id v31 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189612760] sharedCore];
  id v32 = (void *)objc_claimAutoreleasedReturnValue();
  [v32 buildError:8411 underlying:v9 description:v31];
  id v33 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v24 = -[SUCoreScanParam initWithResult:withError:]( [SUCoreScanParam alloc],  "initWithResult:withError:",  [v33 code],  v33);
  id v34 = @"PSUSAssetsDetermineFailed";
LABEL_18:
  -[SUCoreScanParam additionalInfo](v24, "additionalInfo");
  id v41 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithDouble:v12];
  id v42 = (void *)objc_claimAutoreleasedReturnValue();
  [v41 setSafeObject:v42 forKey:@"Duration"];

  [*(id *)(a1 + 32) scanFSM];
  uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
  [v43 postEvent:v34 withInfo:v24];
}

+ (BOOL)isPreSUStagingEnabledForUpdate:(id)a3 policy:(id)a4 reason:(id *)a5
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (a5)
  {
    *a5 = @"not supported in SUCore for this platform";
  }

  else
  {
    objc_msgSend(MEMORY[0x1896127A0], "sharedLogger", a3, a4);
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 oslog];
    int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543618;
      id v9 = @"disabled";
      __int16 v10 = 2114;
      double v11 = @"not supported in SUCore for this platform";
      _os_log_impl( &dword_187A54000,  v6,  OS_LOG_TYPE_DEFAULT,  "[PreSUStaging] %{public}@: %{public}@",  (uint8_t *)&v8,  0x16u);
    }
  }

  return 0;
}

- (int64_t)_downloadCatalog:(id)a3 withIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[SUCoreScan scanFSM](self, "scanFSM");
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 extendedStateQueue];
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[SUCoreScan _incrementMobileAssetPending:](self, "_incrementMobileAssetPending:", @"_downloadCatalog");
  int v10 = -[SUCoreScan operation](self, "operation");
  if ((v10 - 1) < 2)
  {
    -[SUCoreScan scanPolicy](self, "scanPolicy");
    double v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan scanUUID](self, "scanUUID");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan alternateAssetAudienceUUID](self, "alternateAssetAudienceUUID");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 constructMASoftwareUpdateCatalogDownloadOptionsWithUUID:v12 assetAudience:v14];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }

  if (v10 != 3)
  {
    if (v10 != 4)
    {
      id v26 = objc_alloc(NSString);
      -[SUCoreScan _operationName](self, "_operationName");
      id v27 = (void *)objc_claimAutoreleasedReturnValue();
      id v13 = (void *)[v26 initWithFormat:@"downloadCatalog received unsupported SUCoreScanOperation (%@)", v27];

      [MEMORY[0x1896127A0] sharedLogger];
      id v28 = (void *)objc_claimAutoreleasedReturnValue();
      [v28 oslog];
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[SUCoreScan _downloadCatalog:withIdentifier:].cold.1();
      }
      goto LABEL_19;
    }

    -[SUCoreScan scanPolicy](self, "scanPolicy");
    double v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan scanUUID](self, "scanUUID");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 constructMASoftwareUpdateCatalogDownloadOptionsWithUUID:v12 assetAudience:0];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

    if (!v13)
    {
      id v15 = objc_alloc(NSString);
      -[SUCoreScan _operationName](self, "_operationName");
      uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      -[SUCoreScan scanPolicy](self, "scanPolicy");
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 summary];
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = [v15 initWithFormat:@"failed to construct MA SU catalog download options (for %@) from scan policy[%@]", v16, v18];
LABEL_18:
      id v13 = (void *)v19;

LABEL_19:
      [MEMORY[0x189612760] sharedCore];
      id v33 = (void *)objc_claimAutoreleasedReturnValue();
      int64_t v31 = 8100LL;
      [v33 buildError:8100 underlying:0 description:v13];
      id v29 = (void *)objc_claimAutoreleasedReturnValue();

      -[SUCoreScan scanFSM](self, "scanFSM");
      id v34 = (void *)objc_claimAutoreleasedReturnValue();
      id v35 = -[SUCoreScanParam initWithResult:withError:]( objc_alloc(&OBJC_CLASS___SUCoreScanParam),  "initWithResult:withError:",  8100LL,  v29);
      [v34 postProtectedEvent:@"CatalogDownloadFailed" withInfo:v35];

      goto LABEL_20;
    }

    goto LABEL_9;
  }

  -[SUCoreScan scanPolicy](self, "scanPolicy");
  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreScan scanUUID](self, "scanUUID");
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreScan activeDescriptor](self, "activeDescriptor");
  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 constructMADocumentationCatalogDownloadOptionsWithUUID:v21 usingDescriptor:v22];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    id v32 = objc_alloc(NSString);
    -[SUCoreScan _operationName](self, "_operationName");
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    -[SUCoreScan scanPolicy](self, "scanPolicy");
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 summary];
    __int16 v18 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [v32 initWithFormat:@"failed to construct MA documentation catalog download options (for %@) from scan policy[%@]", v16, v18];
    goto LABEL_18;
  }

void __46__SUCoreScan__downloadCatalog_withIdentifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = a3;
  objc_msgSend( *(id *)(a1 + 32),  "_trackScanEnd:withIdentifier:withResult:withError:",  @"startCatalogDownload",  *(void *)(a1 + 40),  a2);
  if (!a2) {
    goto LABEL_4;
  }
  if (a2 == 18)
  {
    uint64_t v6 = objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"failed to download catalog - no match found (MADownload domain result:%ld)",  18);
LABEL_7:
    BOOL v5 = (void *)v6;
    [MEMORY[0x189612760] sharedCore];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 buildError:8400 underlying:v11 description:v5];
    int v8 = (void *)objc_claimAutoreleasedReturnValue();

    [*(id *)(a1 + 32) scanFSM];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    int v10 = -[SUCoreScanParam initWithResult:withError:]( objc_alloc(&OBJC_CLASS___SUCoreScanParam),  "initWithResult:withError:",  a2,  v8);
    [v9 postEvent:@"CatalogDownloadFailed" withInfo:v10];

    goto LABEL_8;
  }

  if (a2 != 10)
  {
    uint64_t v6 = objc_msgSend( objc_alloc(NSString),  "initWithFormat:",  @"failed to download catalog (MADownload domain result:%ld)",  a2);
    goto LABEL_7;
  }

- (void)_filterSUQueryResults:(id)a3
{
  id v12 = a3;
  if (-[SUCoreScan operationSPIType](self, "operationSPIType") == 1
    || -[SUCoreScan operationSPIType](self, "operationSPIType") == 3
    || -[SUCoreScan phase](self, "phase") == 2)
  {
    -[SUCoreScan _filterSUQueryResultsForSPITypeSingleFromQuery:]( self,  "_filterSUQueryResultsForSPITypeSingleFromQuery:",  v12);
  }

  else if (-[SUCoreScan operationSPIType](self, "operationSPIType") == 2)
  {
    -[SUCoreScan _filterSUQueryResultsForSPITypeMajorMinorFromQuery:]( self,  "_filterSUQueryResultsForSPITypeMajorMinorFromQuery:",  v12);
  }

  else
  {
    [MEMORY[0x189612760] sharedCore];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v5 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ unknown operationSPIType found (%i)", self, -[SUCoreScan operationSPIType](self, "operationSPIType")];
    [v4 buildError:8117 underlying:0 description:v5];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[SUCoreScan scanFSM](self, "scanFSM");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 diag];
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 localizedDescription];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend( v8,  "trackAnomaly:forReason:withResult:withError:",  @"[SCAN] FILTER_SU_QUERY",  v9,  objc_msgSend(v6, "code"),  v6);

    -[SUCoreScan scanFSM](self, "scanFSM");
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = -[SUCoreScanParam initWithResult:withError:]( objc_alloc(&OBJC_CLASS___SUCoreScanParam),  "initWithResult:withError:",  8117LL,  v6);
    [v10 postEvent:@"QueryMetadataFailed" withInfo:v11];
  }
}

- (void)_filterSUQueryResultsForSPITypeSingleFromQuery:(id)a3
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreScan scanPolicy](self, "scanPolicy");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v45 = 0LL;
  id v46 = 0LL;
  [v5 selectSoftwareUpdatePrimaryAsset:&v46 secondaryAsset:&v45 fromAssetQuery:v4];
  id v6 = v46;
  id v7 = v45;

  if (v6)
  {
    int v8 = -[SUCoreScan operation](self, "operation");
    if ((v8 - 1) < 2)
    {
      [v4 postedDate];
      id v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        uint64_t v27 = [v4 postedDate];
      }

      else
      {
        [MEMORY[0x1896127A0] sharedLogger];
        id v33 = (void *)objc_claimAutoreleasedReturnValue();
        [v33 oslog];
        id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          __int16 v48 = self;
          _os_log_impl( &dword_187A54000,  v34,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Asset query did not return posting date. Setting posting date to now",  buf,  0xCu);
        }

        uint64_t v27 = [MEMORY[0x189603F50] date];
      }

      uint64_t v23 = (void *)v27;
      id v35 = objc_alloc(&OBJC_CLASS___SUCoreDescriptor);
      -[SUCoreScan scanPolicy](self, "scanPolicy");
      id v36 = (void *)objc_claimAutoreleasedReturnValue();
      [v36 defaultDescriptorValues];
      id v37 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v38 = -[SUCoreDescriptor initWithSUAsset:releaseDate:defaultValues:]( v35,  "initWithSUAsset:releaseDate:defaultValues:",  v6,  v23,  v37);

      if (v7)
      {
        id v39 = objc_alloc(&OBJC_CLASS___SUCoreDescriptor);
        -[SUCoreScan scanPolicy](self, "scanPolicy");
        uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue();
        [v40 defaultDescriptorValues];
        id v41 = (void *)objc_claimAutoreleasedReturnValue();
        uint64_t v24 = -[SUCoreDescriptor initWithSUAsset:releaseDate:defaultValues:]( v39,  "initWithSUAsset:releaseDate:defaultValues:",  v7,  v23,  v41);
      }

      else
      {
        uint64_t v24 = 0LL;
      }

      -[SUCoreScan scanFSM](self, "scanFSM");
      id v28 = (void *)objc_claimAutoreleasedReturnValue();
      id v42 = objc_alloc(&OBJC_CLASS___SUCoreScanParam);
      if (v38)
      {
        uint64_t v43 = -[SUCoreScanParam initWithDescriptor:withFallbackDescriptor:]( v42,  "initWithDescriptor:withFallbackDescriptor:",  v38,  v24);
        [v28 postEvent:@"QueryMetadataUpdateAvailable" withInfo:v43];

        uint64_t v24 = (SUCoreScanParam *)v38;
        goto LABEL_27;
      }

      uint64_t v44 = -[SUCoreScanParam initWithResult:withError:](v42, "initWithResult:withError:", 8406LL, 0LL);
      [v28 postEvent:@"QueryMetadataNoAssetFound" withInfo:v44];
    }

    else
    {
      if (v8 == 3)
      {
        -[SUCoreScan scanFSM](self, "scanFSM");
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
        [v23 diag];
        uint64_t v24 = (SUCoreScanParam *)objc_claimAutoreleasedReturnValue();
        id v28 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ SUCoreScanOperation (SU_SCAN_OP_COLLECT) should never filter SU query results", self];
        id v29 = @"[SCAN] FILTER_SU_QUERY";
        uint64_t v30 = v24;
        int64_t v31 = v28;
        uint64_t v32 = 8115LL;
      }

      else
      {
        if (v8 == 4)
        {
          -[SUCoreScan primaryUpdateAsset](self, "primaryUpdateAsset");
          id v9 = (void *)objc_claimAutoreleasedReturnValue();

          if (v9)
          {
            -[SUCoreScan scanFSM](self, "scanFSM");
            int v10 = (void *)objc_claimAutoreleasedReturnValue();
            [v10 diag];
            id v11 = (void *)objc_claimAutoreleasedReturnValue();
            id v12 = objc_alloc(NSString);
            -[SUCoreScan primaryUpdateAsset](self, "primaryUpdateAsset");
            id v13 = (void *)objc_claimAutoreleasedReturnValue();
            [v13 assetId];
            uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
            id v15 = (void *)[v12 initWithFormat:@"%@ discarding existing primary update asset ID:%@", self, v14];
            [v11 trackAnomaly:@"[SCAN] FILTER_SU_QUERY" forReason:v15 withResult:8111 withError:0];
          }

          -[SUCoreScan setPrimaryUpdateAsset:](self, "setPrimaryUpdateAsset:", v6);
          -[SUCoreScan secondaryUpdateAsset](self, "secondaryUpdateAsset");
          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            -[SUCoreScan scanFSM](self, "scanFSM");
            id v17 = (void *)objc_claimAutoreleasedReturnValue();
            [v17 diag];
            __int16 v18 = (void *)objc_claimAutoreleasedReturnValue();
            id v19 = objc_alloc(NSString);
            -[SUCoreScan secondaryUpdateAsset](self, "secondaryUpdateAsset");
            __int16 v20 = (void *)objc_claimAutoreleasedReturnValue();
            [v20 assetId];
            uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
            __int16 v22 = (void *)[v19 initWithFormat:@"%@ discarding existing secondary update asset ID:%@", self, v21];
            [v18 trackAnomaly:@"[SCAN] FILTER_SU_QUERY" forReason:v22 withResult:8111 withError:0];
          }

          -[SUCoreScan setSecondaryUpdateAsset:](self, "setSecondaryUpdateAsset:", v7);
          -[SUCoreScan scanFSM](self, "scanFSM");
          uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v24 = objc_alloc_init(&OBJC_CLASS___SUCoreScanParam);
          id v25 = @"QueryMetadataUpdateAvailable";
          goto LABEL_11;
        }

        -[SUCoreScan scanFSM](self, "scanFSM");
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
        [v23 diag];
        uint64_t v24 = (SUCoreScanParam *)objc_claimAutoreleasedReturnValue();
        id v28 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ filter SU query results for unknown operation:%d", self, -[SUCoreScan operation](self, "operation")];
        id v29 = @"[SCAN] UNKNOWN OPERATION";
        uint64_t v30 = v24;
        int64_t v31 = v28;
        uint64_t v32 = 8117LL;
      }

      -[SUCoreScanParam trackAnomaly:forReason:withResult:withError:]( v30,  "trackAnomaly:forReason:withResult:withError:",  v29,  v31,  v32,  0LL);
    }

    goto LABEL_27;
  }

  -[SUCoreScan scanFSM](self, "scanFSM");
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v24 = -[SUCoreScanParam initWithResult:withError:]( objc_alloc(&OBJC_CLASS___SUCoreScanParam),  "initWithResult:withError:",  8406LL,  0LL);
  id v25 = @"QueryMetadataNoAssetFound";
LABEL_11:
  [v23 postEvent:v25 withInfo:v24];
LABEL_27:
}

- (void)_filterSUQueryResultsForSPITypeMajorMinorFromQuery:(id)a3
{
  uint64_t v46 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (-[SUCoreScan operation](self, "operation") == 1)
  {
    -[SUCoreScan scanPolicy](self, "scanPolicy");
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
    id v42 = 0LL;
    id v43 = 0LL;
    id v40 = 0LL;
    id v41 = 0LL;
    [v5 selectSoftwareUpdateMajorPrimaryAsset:&v43 majorSecondaryAsset:&v42 minorPrimaryAsset:&v41 minorSecondaryAsset:&v40 fromAssetQuery:v4];
    id v6 = v43;
    id v7 = v42;
    uint64_t v8 = (uint64_t)v41;
    id v39 = v40;

    [v4 postedDate];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      uint64_t v10 = [v4 postedDate];
    }

    else
    {
      [MEMORY[0x1896127A0] sharedLogger];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      [v14 oslog];
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v45 = self;
        _os_log_impl( &dword_187A54000,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@ Asset query did not return posting date. Setting posting date to now",  buf,  0xCu);
      }

      uint64_t v10 = [MEMORY[0x189603F50] date];
    }

    uint64_t v16 = (void *)v10;
    if (v6)
    {
      id v17 = objc_alloc(&OBJC_CLASS___SUCoreDescriptor);
      -[SUCoreScan scanPolicy](self, "scanPolicy");
      __int16 v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 defaultDescriptorValues];
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v37 = -[SUCoreDescriptor initWithSUAsset:releaseDate:defaultValues:]( v17,  "initWithSUAsset:releaseDate:defaultValues:",  v6,  v16,  v19);
    }

    else
    {
      uint64_t v37 = 0LL;
    }

    uint64_t v38 = (void *)v8;
    id v36 = v7;
    if (v7)
    {
      __int16 v20 = objc_alloc(&OBJC_CLASS___SUCoreDescriptor);
      -[SUCoreScan scanPolicy](self, "scanPolicy");
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 defaultDescriptorValues];
      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v23 = -[SUCoreDescriptor initWithSUAsset:releaseDate:defaultValues:]( v20,  "initWithSUAsset:releaseDate:defaultValues:",  v7,  v16,  v22);

      uint64_t v8 = (uint64_t)v38;
    }

    else
    {
      uint64_t v23 = 0LL;
    }

    uint64_t v24 = v6;
    if (v8)
    {
      id v25 = objc_alloc(&OBJC_CLASS___SUCoreDescriptor);
      -[SUCoreScan scanPolicy](self, "scanPolicy");
      id v26 = (void *)objc_claimAutoreleasedReturnValue();
      [v26 defaultDescriptorValues];
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = -[SUCoreDescriptor initWithSUAsset:releaseDate:defaultValues:]( v25,  "initWithSUAsset:releaseDate:defaultValues:",  v8,  v16,  v27);
    }

    if (v39)
    {
      id v28 = objc_alloc(&OBJC_CLASS___SUCoreDescriptor);
      -[SUCoreScan scanPolicy](self, "scanPolicy");
      id v29 = (void *)objc_claimAutoreleasedReturnValue();
      [v29 defaultDescriptorValues];
      uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
      int64_t v31 = -[SUCoreDescriptor initWithSUAsset:releaseDate:defaultValues:]( v28,  "initWithSUAsset:releaseDate:defaultValues:",  v39,  v16,  v30);
    }

    else
    {
      int64_t v31 = 0LL;
    }

    -[SUCoreScan scanFSM](self, "scanFSM");
    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue();
    id v33 = objc_alloc(&OBJC_CLASS___SUCoreScanParam);
    if (v37 | v8)
    {
      id v34 = -[SUCoreScanParam initWithMajorPrimaryDescriptor:majorSecondaryDescriptor:minorPrimaryDescriptor:minorSecondaryDescriptor:]( v33,  "initWithMajorPrimaryDescriptor:majorSecondaryDescriptor:minorPrimaryDescriptor:minorSecondaryDescriptor:",  v37,  v23,  v8,  v31);
      id v35 = @"QueryMetadataUpdateAvailable";
    }

    else
    {
      id v34 = -[SUCoreScanParam initWithResult:withError:](v33, "initWithResult:withError:", 8406LL, 0LL);
      id v35 = @"QueryMetadataNoAssetFound";
    }

    [v32 postEvent:v35 withInfo:v34];
  }

  else
  {
    -[SUCoreScan scanFSM](self, "scanFSM");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 diag];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ SU_SCAN_OP_CHECK is not supported for current operation", self];
    [v12 trackAnomaly:@"[SCAN] FILTER_SU_QUERY" forReason:v13 withResult:8117 withError:0];
  }
}

- (void)_filterDocQueryResults:(id)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreScan scanPolicy](self, "scanPolicy");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v18 = 0LL;
  [v5 selectDocumentationAsset:&v18 fromAssetQuery:v4];

  id v6 = v18;
  if (v6)
  {
    -[SUCoreScan activeDescriptor](self, "activeDescriptor");
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assignDocumentationFromAsset:extendingBundleProperties:", v6, objc_msgSend(v6, "wasLocal"));

    LODWORD(v7) = -[SUCoreScan downloadDocumentation](self, "downloadDocumentation");
    -[SUCoreScan scanFSM](self, "scanFSM");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = v8;
    if ((_DWORD)v7) {
      uint64_t v10 = @"QueryMetadataNeedDoc";
    }
    else {
      uint64_t v10 = @"QueryMetadataSuccess";
    }
LABEL_12:
    [v8 postEvent:v10];
    goto LABEL_13;
  }

  [MEMORY[0x189612770] sharedDevice];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  int v12 = [v11 requiresDocAssetForUpdate];

  [MEMORY[0x1896127A0] sharedLogger];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 oslog];
  uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      [MEMORY[0x189612770] sharedDevice];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 deviceClass];
      id v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      __int16 v20 = self;
      __int16 v21 = 2114;
      __int16 v22 = v17;
      _os_log_impl( &dword_187A54000,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ documentation not required for device: %{public}@",  buf,  0x16u);
    }

    -[SUCoreScan scanFSM](self, "scanFSM");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = v8;
    uint64_t v10 = @"QueryMetadataSuccess";
    goto LABEL_12;
  }

  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    -[SUCoreScan _filterDocQueryResults:].cold.1((uint64_t)self, v14);
  }

  -[SUCoreScan scanFSM](self, "scanFSM");
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v15 = -[SUCoreScanParam initWithResult:withError:]( objc_alloc(&OBJC_CLASS___SUCoreScanParam),  "initWithResult:withError:",  8407LL,  0LL);
  [v9 postEvent:@"QueryMetadataNoAssetFound" withInfo:v15];

LABEL_13:
}

- (void)_incrementMobileAssetPending:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreScan scanFSM](self, "scanFSM");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 extendedStateQueue];
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[SUCoreScan setPendingMobileAssetRequests:]( self,  "setPendingMobileAssetRequests:",  -[SUCoreScan pendingMobileAssetRequests](self, "pendingMobileAssetRequests") + 1);
  [MEMORY[0x1896127A0] sharedLogger];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 oslog];
  uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543874;
    uint64_t v10 = self;
    __int16 v11 = 2114;
    id v12 = v4;
    __int16 v13 = 1024;
    int v14 = -[SUCoreScan pendingMobileAssetRequests](self, "pendingMobileAssetRequests");
    _os_log_impl( &dword_187A54000,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [MA_PENDING(INCR)] %{public}@ - incremented MA pending (%d remaining)",  (uint8_t *)&v9,  0x1Cu);
  }
}

- (int64_t)_decrementMobileAssetPending:(id)a3
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  -[SUCoreScan scanFSM](self, "scanFSM");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 extendedStateQueue];
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (-[SUCoreScan pendingMobileAssetRequests](self, "pendingMobileAssetRequests") < 1)
  {
    -[SUCoreScan scanFSM](self, "scanFSM");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 diag];
    id v12 = (void *)[objc_alloc(NSString) initWithFormat:@"%@ MobileAsset operation completed when nothing pending (%@)", self, v4];
    [(id)v11 trackAnomaly:@"[SCAN] MA_PENDING(DECR)" forReason:v12 withResult:8117 withError:0];

    LODWORD(v11) = -[SUCoreScan pendingMobileAssetRequests](self, "pendingMobileAssetRequests");
    [MEMORY[0x1896127A0] sharedLogger];
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 oslog];
    int v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if ((v11 & 0x80000000) != 0)
    {
      if (v15) {
        -[SUCoreScan _decrementMobileAssetPending:].cold.1(self, (uint64_t)v4, v14);
      }

      -[SUCoreScan setPendingMobileAssetRequests:](self, "setPendingMobileAssetRequests:", 0LL);
    }

    else
    {
      if (v15) {
        -[SUCoreScan _decrementMobileAssetPending:].cold.2();
      }
    }

    int64_t v9 = 8117LL;
  }

  else
  {
    -[SUCoreScan setPendingMobileAssetRequests:]( self,  "setPendingMobileAssetRequests:",  -[SUCoreScan pendingMobileAssetRequests](self, "pendingMobileAssetRequests") - 1);
    [MEMORY[0x1896127A0] sharedLogger];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 oslog];
    uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v18 = self;
      __int16 v19 = 2114;
      id v20 = v4;
      __int16 v21 = 1024;
      int v22 = -[SUCoreScan pendingMobileAssetRequests](self, "pendingMobileAssetRequests");
      _os_log_impl( &dword_187A54000,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ [MA_PENDING(DECR)] %{public}@ - decremented MA pending (%d remaining)",  buf,  0x1Cu);
    }

    int64_t v9 = 0LL;
  }

  return v9;
}

- (void)_trackScanBegin:(id)a3
{
}

- (void)_trackScanBegin:(id)a3 withIdentifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  -[SUCoreScan scanFSM](self, "scanFSM");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v9 diag];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 trackBegin:v7 atLevel:1 forModule:@"scan" withIdentifier:v6];
}

- (void)_trackScanEnd:(id)a3 withResult:(int64_t)a4 withError:(id)a5
{
}

- (void)_trackScanEnd:(id)a3 withIdentifier:(id)a4 withResult:(int64_t)a5 withError:(id)a6
{
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  -[SUCoreScan scanFSM](self, "scanFSM");
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  [v14 diag];
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 trackEnd:v12 atLevel:1 forModule:@"scan" withIdentifier:v11 withResult:a5 withError:v10];
}

- (id)_createEvent:(id)a3
{
  id v4 = a3;
  -[SUCoreScan scanFSM](self, "scanFSM");
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 extendedStateQueue];
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  [MEMORY[0x189603FC8] dictionary];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setSafeObject:v4 forKey:*MEMORY[0x189612968]];

  -[SUCoreScan scanUUID](self, "scanUUID");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setSafeObject:v8 forKey:*MEMORY[0x1896129C8]];

  id v9 = objc_alloc_init(&OBJC_CLASS___SUCoreEventAugmenter);
  -[SUCoreScan scanPolicy](self, "scanPolicy");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreEventAugmenter setPolicy:](v9, "setPolicy:", v10);

  -[SUCoreScan psusPrimaryDescriptor](self, "psusPrimaryDescriptor");
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreEventAugmenter setPrimaryDescriptor:](v9, "setPrimaryDescriptor:", v11);

  -[SUCoreEventAugmenter augmentEvent:](v9, "augmentEvent:", v7);
  return v7;
}

- (void)_reportPSUSDetermineStartedEvent
{
  int v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 extendedStateQueue];
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[SUCoreScan _createEvent:](self, "_createEvent:", *MEMORY[0x1896129A0]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 setSafeObject:*MEMORY[0x189612978] forKey:*MEMORY[0x189612970]];
  [MEMORY[0x189612760] sharedCore];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 miscellaneousTaksQueue];
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __46__SUCoreScan__reportPSUSDetermineStartedEvent__block_invoke;
  block[3] = &unk_18A0EF970;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, block);
}

void __46__SUCoreScan__reportPSUSDetermineStartedEvent__block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 sendEvent:*(void *)(a1 + 32)];
}

- (void)_reportPSUSDetermineFinishedEvent:(id)a3 duration:(double)a4
{
  id v6 = a3;
  -[SUCoreScan scanFSM](self, "scanFSM");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 extendedStateQueue];
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[SUCoreScan _createEvent:](self, "_createEvent:", *MEMORY[0x189612998]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  id v10 = v9;
  if (v6) {
    [MEMORY[0x189612790] augmentEvent:v9 withError:v6];
  }
  else {
    [v9 setSafeObject:*MEMORY[0x189612978] forKey:*MEMORY[0x189612970]];
  }
  objc_msgSend(NSString, "stringWithFormat:", @"%lu", (unint64_t)a4);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 setSafeObject:v11 forKey:*MEMORY[0x1896128A8]];

  [MEMORY[0x189612760] sharedCore];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 miscellaneousTaksQueue];
  __int16 v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __57__SUCoreScan__reportPSUSDetermineFinishedEvent_duration___block_invoke;
  block[3] = &unk_18A0EF970;
  id v16 = v10;
  id v14 = v10;
  dispatch_async(v13, block);
}

void __57__SUCoreScan__reportPSUSDetermineFinishedEvent_duration___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 sendEvent:*(void *)(a1 + 32)];
}

- (id)_simDescriptorAttributes
{
  v22[38] = *MEMORY[0x1895F89C0];
  id v2 = objc_alloc_init(MEMORY[0x189607848]);
  [v2 setDateFormat:@"dd-MMM-yy"];
  [v2 dateFromString:@"07-Jul-07"];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();
  id v3 = objc_alloc_init(MEMORY[0x189603F48]);
  v21[0] = @"OSVersion";
  v21[1] = @"Build";
  v22[0] = @"9.9.13.0";
  v22[1] = @"17A408a";
  v21[2] = @"SUProductSystemName";
  v21[3] = @"ReleaseType";
  v22[2] = @"iOS";
  v22[3] = @"Internal";
  v21[4] = @"SUPublisher";
  v21[5] = @"ReleaseDate";
  v22[4] = @"Apple Inc.";
  v22[5] = v16;
  v21[6] = @"SupportedDevices";
  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:", @"D11AP", 0);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22[6] = v4;
  v21[7] = *MEMORY[0x189611080];
  [MEMORY[0x189607968] numberWithUnsignedLongLong:3209145381];
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[7] = v5;
  v21[8] = *MEMORY[0x189611090];
  [MEMORY[0x189607968] numberWithUnsignedLongLong:3309669376];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[8] = v6;
  v21[9] = @"ActualMinimumSystemPartition";
  [MEMORY[0x189607968] numberWithUnsignedLongLong:5674];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = *MEMORY[0x189611088];
  uint64_t v9 = MEMORY[0x189604A88];
  v22[9] = v7;
  v22[10] = MEMORY[0x189604A88];
  v21[10] = v8;
  v21[11] = @"SystemPartitionPadding";
  v22[11] = MEMORY[0x189604A60];
  v22[12] = MEMORY[0x189604A88];
  v21[12] = @"AutomaticDownloadOver3G";
  v21[13] = @"AllowableOverCellular";
  v22[13] = MEMORY[0x189604A88];
  v22[14] = MEMORY[0x189604A88];
  v21[14] = @"AllowableOTA";
  v21[15] = @"SUDisableSiriVoiceDeletion";
  v22[15] = MEMORY[0x189604A88];
  v22[16] = MEMORY[0x189604A88];
  v21[16] = @"SUDisableCDLevel4";
  v21[17] = @"SUDisableAppDemotion";
  v22[17] = MEMORY[0x189604A88];
  v22[18] = MEMORY[0x189604A88];
  v21[18] = @"SUInstallTonightEnabled";
  v21[19] = @"Ramp";
  v22[19] = MEMORY[0x189604A88];
  v21[20] = @"MDMDelayInterval";
  [MEMORY[0x189607968] numberWithUnsignedLongLong:24];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[20] = v10;
  v22[21] = v9;
  v21[21] = @"AutoUpdate";
  v21[22] = @"SetupCritical";
  v22[22] = @"kSUAssetSetupCriticalKey";
  v22[23] = v9;
  v21[23] = @"SetupCriticalCellularOverride";
  v21[24] = @"SetupCriticalUpdateOutOfBoxOnly";
  v22[24] = v9;
  v22[25] = @"kSUAssetLastEmergencyBuildKey";
  v21[25] = @"LastEmergencyBuild";
  v21[26] = @"LastEmergencyOSVersion";
  v22[26] = @"kSUAssetLastEmergencyOSVersionKey";
  v22[27] = v3;
  v21[27] = @"SEPDigest";
  v21[28] = @"SEPTBMDigests";
  v22[28] = v3;
  v22[29] = v3;
  v21[29] = @"RSEPDigest";
  v21[30] = @"RSEPTBMDigests";
  v22[30] = v3;
  v22[31] = @"PreRelease";
  v21[31] = @"SUDocumentationID";
  v21[32] = @"Language";
  v22[32] = @"kSUAssetLanguageKey";
  v22[33] = @"kSUAssetReleaseNotesSummaryFileNameKey";
  v21[33] = @"ReleaseNotesSummaryFileName";
  v21[34] = @"ReleaseNotesFileName";
  v22[34] = @"kSUAssetReleaseNotesFileNameKey";
  v22[35] = @"kSUAssetLicenseAgreementFileNameKey";
  v21[35] = @"LicenseAgreementFileName";
  v21[36] = @"_Measurement";
  v21[37] = @"_MeasurementAlgorithm";
  v22[36] = v3;
  v22[37] = @"SHA-1";
  [MEMORY[0x189603F68] dictionaryWithObjects:v22 forKeys:v21 count:38];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = @"AssetProperties";
  v19[1] = @"AssetAddedProperties";
  v20[0] = v11;
  v17[0] = @"AssetState";
  [MEMORY[0x189607968] numberWithInt:1];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = @"com.apple.MobileAsset.SoftwareUpdateCoreTest";
  v17[1] = @"AssetType";
  v17[2] = @"AssetId";
  v18[2] = @"ma-asset-id";
  [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:v17 count:3];
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v13;
  [MEMORY[0x189603F68] dictionaryWithObjects:v20 forKeys:v19 count:2];
  id v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSString)scanUUID
{
  return self->_scanUUID;
}

- (OS_dispatch_queue)clientCompletionQueue
{
  return self->_clientCompletionQueue;
}

- (int)operation
{
  return self->_operation;
}

- (void)setOperation:(int)a3
{
  self->_operation = a3;
}

- (int)operationSPIType
{
  return self->_operationSPIType;
}

- (void)setOperationSPIType:(int)a3
{
  self->_operationSPIType = a3;
}

- (BOOL)cancelingOperation
{
  return self->_cancelingOperation;
}

- (void)setCancelingOperation:(BOOL)a3
{
  self->_cancelingOperation = a3;
}

- (SUCoreFSM)scanFSM
{
  return self->_scanFSM;
}

- (SUCorePolicy)scanPolicy
{
  return self->_scanPolicy;
}

- (void)setScanPolicy:(id)a3
{
}

- (SUCoreDescriptor)activeDescriptor
{
  return self->_activeDescriptor;
}

- (void)setActiveDescriptor:(id)a3
{
}

- (BOOL)downloadDocumentation
{
  return self->_downloadDocumentation;
}

- (void)setDownloadDocumentation:(BOOL)a3
{
  self->_downloadDocumentation = a3;
}

- (int)pendingMobileAssetRequests
{
  return self->_pendingMobileAssetRequests;
}

- (void)setPendingMobileAssetRequests:(int)a3
{
  self->_pendingMobileAssetRequests = a3;
}

- (NSString)alternateAssetAudienceUUID
{
  return self->_alternateAssetAudienceUUID;
}

- (void)setAlternateAssetAudienceUUID:(id)a3
{
}

- (SUCoreMobileAsset)maDocumentationControl
{
  return self->_maDocumentationControl;
}

- (void)setMaDocumentationControl:(id)a3
{
}

- (MAAsset)primaryUpdateAsset
{
  return self->_primaryUpdateAsset;
}

- (void)setPrimaryUpdateAsset:(id)a3
{
}

- (MAAsset)secondaryUpdateAsset
{
  return self->_secondaryUpdateAsset;
}

- (void)setSecondaryUpdateAsset:(id)a3
{
}

- (id)checkCompletion
{
  return self->_checkCompletion;
}

- (void)setCheckCompletion:(id)a3
{
}

- (id)checkMajorMinorCompletion
{
  return self->_checkMajorMinorCompletion;
}

- (void)setCheckMajorMinorCompletion:(id)a3
{
}

- (id)checkSlowReleaseCompletion
{
  return self->_checkSlowReleaseCompletion;
}

- (void)setCheckSlowReleaseCompletion:(id)a3
{
}

- (id)verifyCompletion
{
  return self->_verifyCompletion;
}

- (void)setVerifyCompletion:(id)a3
{
}

- (id)collectCompletion
{
  return self->_collectCompletion;
}

- (void)setCollectCompletion:(id)a3
{
}

- (id)locateCompletion
{
  return self->_locateCompletion;
}

- (void)setLocateCompletion:(id)a3
{
}

- (id)cancelCompletion
{
  return self->_cancelCompletion;
}

- (void)setCancelCompletion:(id)a3
{
}

- (SUCorePolicy)originalScanPolicy
{
  return self->_originalScanPolicy;
}

- (void)setOriginalScanPolicy:(id)a3
{
}

- (int)phase
{
  return self->_phase;
}

- (void)setPhase:(int)a3
{
  self->_phase = a3;
}

- (SUCoreScanParam)interimScanResult
{
  return self->_interimScanResult;
}

- (void)setInterimScanResult:(id)a3
{
}

- (SUCoreDescriptor)psusPrimaryDescriptor
{
  return self->_psusPrimaryDescriptor;
}

- (void)setPsusPrimaryDescriptor:(id)a3
{
}

- (SUCoreDescriptor)psusSecondaryDescriptor
{
  return self->_psusSecondaryDescriptor;
}

- (void)setPsusSecondaryDescriptor:(id)a3
{
}

- (OS_os_transaction)scanCheckTransaction
{
  return self->_scanCheckTransaction;
}

- (void)setScanCheckTransaction:(id)a3
{
}

- (OS_os_transaction)scanVerifyTransaction
{
  return self->_scanVerifyTransaction;
}

- (void)setScanVerifyTransaction:(id)a3
{
}

- (OS_os_transaction)scanCollectTransaction
{
  return self->_scanCollectTransaction;
}

- (void)setScanCollectTransaction:(id)a3
{
}

- (OS_os_transaction)scanLocateTransaction
{
  return self->_scanLocateTransaction;
}

- (void)setScanLocateTransaction:(id)a3
{
}

- (OS_os_transaction)scanCancelTransaction
{
  return self->_scanCancelTransaction;
}

- (void)setScanCancelTransaction:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_updateInterimScanResultForSlowReleaseWithPrimary:secondary:error:.cold.1()
{
}

- (void)_downloadCatalog:withIdentifier:.cold.1()
{
}

- (void)_filterDocQueryResults:(uint64_t)a1 .cold.1(uint64_t a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl( &dword_187A54000,  a2,  OS_LOG_TYPE_ERROR,  "%{public}@ no documentation asset (after filtering/selection)",  (uint8_t *)&v2,  0xCu);
  OUTLINED_FUNCTION_2_0();
}

- (void)_decrementMobileAssetPending:(os_log_s *)a3 .cold.1(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  int v4 = 138543874;
  BOOL v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  __int16 v8 = 1024;
  int v9 = [a1 pendingMobileAssetRequests];
  _os_log_error_impl( &dword_187A54000,  a3,  OS_LOG_TYPE_ERROR,  "%{public}@ [MA_PENDING(DECR)] %{public}@ - negative MA pending (%d) - clearing",  (uint8_t *)&v4,  0x1Cu);
}

- (void)_decrementMobileAssetPending:.cold.2()
{
}

@end