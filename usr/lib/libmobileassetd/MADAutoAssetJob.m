@interface MADAutoAssetJob
- (BOOL)_maDownloadErrorIndicatesResponseNoContent:(int64_t)a3;
- (BOOL)aggregatedClientAssetPolicySpecified;
- (BOOL)aggregatedClientSetPolicySpecified;
- (BOOL)anomalyNoActiveSetDescriptor;
- (BOOL)anomalyNoAssignedSetDescriptor;
- (BOOL)anyJobInterestedInContent;
- (BOOL)autoAssetSetJob;
- (BOOL)becameLatestToVend;
- (BOOL)beingCanceled;
- (BOOL)boostedToUserInitiated;
- (BOOL)buildPotentialDescriptors:(id)a3 fromLookupResults:(id)a4 buildingPatchDescriptors:(id)a5 andFullDescriptors:(id)a6;
- (BOOL)checkingAssetContent;
- (BOOL)clientRequestedOperation;
- (BOOL)determiningAssetContent;
- (BOOL)downloadingUserInitiated;
- (BOOL)earlierPotentialNetworkFailure;
- (BOOL)earlierSchedulerInvolved;
- (BOOL)foundSameAtomicInstanceAlreadyDownloaded;
- (BOOL)haveReceivedLookupResponse;
- (BOOL)holdingLookupGrant;
- (BOOL)isAtomicEntry:(id)a3 alreadyInAtomicEntries:(id)a4;
- (BOOL)isFoundAlreadyOnFilesystem:(BOOL *)a3;
- (BOOL)isMorePreferredFormat:(id)a3 comparedTo:(id)a4;
- (BOOL)isSetFoundAlreadyOnFilesystem:(id)a3 justPromotedAnyDescriptor:(BOOL *)a4;
- (BOOL)lockingAssetContent;
- (BOOL)placeNextSetAssetDescriptorToDownload:(id)a3 restrictToFull:(BOOL)a4 error:(id *)a5;
- (BOOL)potentialNetworkFailure;
- (BOOL)preferenceAsIfRampOrUse:(BOOL)a3;
- (BOOL)rampingForeground;
- (BOOL)rampingForegroundLatched;
- (BOOL)remainingSetDescriptorToBeDownloaded;
- (BOOL)reportingProgress;
- (BOOL)schedulerInvolved;
- (BOOL)schedulerTriggerReceived;
- (BOOL)setCheckAwaitingDownload;
- (BOOL)stagerJob;
- (BOOL)stagerJobDownloadContent;
- (BOOL)stagerJobResultsReported;
- (BOOL)tryPersonalizeFailed;
- (BOOL)tryPersonalizeSuccess;
- (BOOL)vendingAtomicInstanceForConfiguredEntries;
- (BOOL)wasAssetSetSpecifierRequested:(id)a3;
- (BOOL)wasPatched;
- (MAAutoAssetInfoDesire)activeDesire;
- (MAAutoAssetInfoEnd)activeEnd;
- (MAAutoAssetInfoEnd)resultEnd;
- (MAAutoAssetInfoFound)activeFound;
- (MAAutoAssetInfoFound)resultFound;
- (MAAutoAssetInfoInstance)activeInstance;
- (MAAutoAssetInfoInstance)autoAssetInstance;
- (MAAutoAssetInfoInstance)resultInstance;
- (MAAutoAssetInfoListen)activeListen;
- (MAAutoAssetInfoListen)resultListen;
- (MAAutoAssetPolicy)aggregatedClientAssetPolicy;
- (MAAutoAssetProgress)lastReportedPatchProgress;
- (MAAutoAssetSelector)autoAssetSelector;
- (MAAutoAssetSelector)resultSelector;
- (MAAutoAssetSelector)tryPersonalizeSelector;
- (MAAutoAssetStatus)currentStatus;
- (MAAutoAssetSummary)latestAutoAssetSummary;
- (MADAutoAssetDescriptor)baseForPatch;
- (MADAutoAssetDescriptor)downloadingAssetDescriptor;
- (MADAutoAssetDescriptor)foundNewerFull;
- (MADAutoAssetDescriptor)foundNewerPatch;
- (MADAutoAssetDescriptor)newerFoundAssetDescriptor;
- (MADAutoAssetDescriptor)simulateBaseForPatch;
- (MADAutoAssetDescriptor)simulateDescriptor;
- (MADAutoAssetJob)bondedWithJob;
- (MADAutoAssetJobInformation)autoAssetJobInformation;
- (MADAutoSetConfiguration)setConfiguration;
- (MADAutoSetDescriptor)assignedSetDescriptor;
- (MADAutoSetDescriptor)autoAssetSetDescriptor;
- (MADAutoSetJobInformation)setJobInformation;
- (MAMsuDownloadOptions)assetDownloadOptions;
- (MAMsuDownloadOptions)catalogDownloadOptions;
- (MANAutoAssetSetInfoDesire)autoAssetSetDesire;
- (MANAutoAssetSetInfoFound)resultSetFound;
- (MANAutoAssetSetInfoInstance)autoAssetSetInstance;
- (MANAutoAssetSetNotifications)currentSetNotifications;
- (MANAutoAssetSetPolicy)aggregatedClientSetPolicy;
- (MANAutoAssetSetPolicy)schedulerSetPolicy;
- (MANAutoAssetSetPolicy)stagerSetPolicy;
- (MANAutoAssetSetStatus)currentSetStatus;
- (MANAutoAssetSetStatus)newestDownloadedSetStatus;
- (MANAutoAssetSetSummary)latestAutoAssetSetSummary;
- (NSArray)foundSetNewerDiscoveredAtomicEntries;
- (NSDictionary)cachedAutoAssetCatalog;
- (NSDictionary)stagerJobAutoAssetCatalog;
- (NSDictionary)stateTable;
- (NSMutableArray)activeJobTasks;
- (NSMutableArray)prePersonalizedSelectors;
- (NSMutableArray)tryPersonalizeDescriptors;
- (NSMutableDictionary)foundSetFullDescriptorsBySpecifier;
- (NSMutableDictionary)foundSetPatchDescriptorsBySpecifier;
- (NSMutableDictionary)latestAssetDescriptorOnFilesystemBySpecifier;
- (NSMutableDictionary)onFilesystemByVersion;
- (NSString)autoAssetSetIdentifier;
- (NSString)autoAssetUUID;
- (NSString)autoJobName;
- (NSString)checkUUID;
- (NSString)checkUUIDBasePortion;
- (NSString)clientDomainName;
- (NSString)firstClientName;
- (NSString)jobCreationTriggeringLayer;
- (NSString)latestInstalledAssetBuild;
- (NSString)latestInstalledAssetVersion;
- (NSString)latestSafeSummary;
- (NSString)setSpaceCheckedUUID;
- (NSString)stagerAssetTargetBuildVersion;
- (NSString)stagerAssetTargetOSVersion;
- (NSString)stagerAssetTargetRestoreVersion;
- (NSString)stagerAssetTargetTrainName;
- (SUCoreFSM)autoJobFSM;
- (SUCoreLog)logger;
- (id)_baseAnalyticsData:(id)a3;
- (id)_longSummary;
- (id)_newSelectorForCachedAssetCatalog:(id)a3;
- (id)_summary;
- (id)_updateLatestSummary;
- (id)assetSetEntryForAssetMetadata:(id)a3;
- (id)autoAssetSetAssetType;
- (id)clientName;
- (id)currentJobInformation:(id *)a3;
- (id)decideFollowupBoost:(id)a3 forJobEvent:(id)a4 boostEvent:(id)a5 noBoostEvent:(id)a6;
- (id)decideFollowupMoreAssetsToDownload:(id)a3 withEventInfo:(id)a4;
- (id)getCurrentJobTask;
- (id)initForDescriptor:(id)a3 baseForPatchDescriptor:(id)a4 withAutoAssetUUID:(id)a5;
- (id)initForInstance:(id)a3 orForSelector:(id)a4 orForDescriptor:(id)a5 orForSetInstance:(id)a6 withSetDesire:(id)a7 withSchedulerSetPolicy:(id)a8 withStagerSetPolicy:(id)a9 usingSetConfiguration:(id)a10 usingSetDescriptor:(id)a11 withBaseForPatchDescriptor:(id)a12 withAutoAssetUUID:(id)a13 downloadingUserInitiated:(BOOL)a14 asStagerJob:(BOOL)a15 usingCachedAutoAssetCatalog:(id)a16;
- (id)initForInstance:(id)a3 withAutoAssetUUID:(id)a4 downloadingUserInitiated:(BOOL)a5;
- (id)initForSelector:(id)a3 withAutoAssetUUID:(id)a4;
- (id)initForSelector:(id)a3 withAutoAssetUUID:(id)a4 asStagerJob:(BOOL)a5 withStagerSetPolicy:(id)a6 usingCachedAutoAssetCatalog:(id)a7 usingBaseForPatching:(id)a8;
- (id)initForSetConfiguration:(id)a3 withAutoAssetUUID:(id)a4 asStagerJob:(BOOL)a5 withStagerSetPolicy:(id)a6;
- (id)initForSetInstance:(id)a3 withSchedulerSetPolicy:(id)a4 usingSetConfiguration:(id)a5 usingSetDescriptor:(id)a6 withAutoAssetUUID:(id)a7;
- (id)initForSetInstance:(id)a3 withSetDesire:(id)a4 usingSetConfiguration:(id)a5 usingSetDescriptor:(id)a6 withAutoAssetUUID:(id)a7;
- (id)installedOnFilesystemWithVersion:(id)a3 fromLocation:(id)a4;
- (id)latestInstalledOnFilesystem;
- (id)mostSpecificSelectorToReport;
- (id)newAssetDownloadOptions;
- (id)newAtomicInstancesDownloadedForDescriptor:(id)a3;
- (id)newCatalogDownloadOptions;
- (id)newCurrentStatusForDescriptor:(id)a3;
- (id)newFoundSetDescriptorsAsNewerDiscovered;
- (id)newSessionID;
- (id)progressReportPhaseName;
- (id)refreshOnFilesystemFromManagerPromotingIfStaged:(BOOL)a3;
- (id)removeCurrentJobTask;
- (id)reportSetCatalogDecideFound:(id)a3;
- (id)setEntryBeingDownloaded;
- (id)simulatedErrorAtPhase:(id)a3 fromOperation:(id)a4 forAssetDownload:(BOOL)a5;
- (id)verifyDownloadNotBlockedBySetPolicy:(BOOL)a3;
- (int)progressLogsFilteredCount;
- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4;
- (int64_t)action_AddAtomicAlterDecideFilesystem:(id)a3 error:(id *)a4;
- (int64_t)action_AddAtomicCheckDecideFilesystem:(id)a3 error:(id *)a4;
- (int64_t)action_AddAtomicContinueDecideFilesystem:(id)a3 error:(id *)a4;
- (int64_t)action_AddAtomicEndDecideFilesystem:(id)a3 error:(id *)a4;
- (int64_t)action_AddAtomicLockDecideFilesystem:(id)a3 error:(id *)a4;
- (int64_t)action_AddAtomicNeedDecideFilesystem:(id)a3 error:(id *)a4;
- (int64_t)action_AddTaskCheckDecideFilesystem:(id)a3 error:(id *)a4;
- (int64_t)action_AddTaskDecideFilesystem:(id)a3 error:(id *)a4;
- (int64_t)action_AddTaskDetermineDecideFilesystem:(id)a3 error:(id *)a4;
- (int64_t)action_AddTaskInterestDecideFilesystem:(id)a3 error:(id *)a4;
- (int64_t)action_AddTaskLockDecideFilesystem:(id)a3 error:(id *)a4;
- (int64_t)action_AddTaskScheduler:(id)a3 error:(id *)a4;
- (int64_t)action_AddTaskSchedulerDecideFilesystem:(id)a3 error:(id *)a4;
- (int64_t)action_AdoptRegister:(id)a3 error:(id *)a4;
- (int64_t)action_BoostAndRequestLookupGrant:(id)a3 error:(id *)a4;
- (int64_t)action_BoostToUserInitiated:(id)a3 error:(id *)a4;
- (int64_t)action_CancelAssetDownload:(id)a3 error:(id *)a4;
- (int64_t)action_CheckSimulateEndStatusRequest:(id)a3 error:(id *)a4;
- (int64_t)action_DecideDonePurging:(id)a3 error:(id *)a4;
- (int64_t)action_DecideDownloadOrPostpone:(id)a3 error:(id *)a4;
- (int64_t)action_DecideStartupDownloading:(id)a3 error:(id *)a4;
- (int64_t)action_DoneReportingProgress:(id)a3 error:(id *)a4;
- (int64_t)action_DownloadCatalog:(id)a3 error:(id *)a4;
- (int64_t)action_DownloadNewestFull:(id)a3 error:(id *)a4;
- (int64_t)action_DownloadNewestPatch:(id)a3 error:(id *)a4;
- (int64_t)action_DownloadSuccessDecideMore:(id)a3 error:(id *)a4;
- (int64_t)action_DownloadSuccessDecidePersonalize:(id)a3 error:(id *)a4;
- (int64_t)action_FailRequestCanceling:(id)a3 error:(id *)a4;
- (int64_t)action_FailedPatchDecideTryFull:(id)a3 error:(id *)a4;
- (int64_t)action_JobEndedSchedule:(id)a3 error:(id *)a4;
- (int64_t)action_JobFailedAwaiting:(id)a3 error:(id *)a4;
- (int64_t)action_JobFailedCanceled:(id)a3 error:(id *)a4;
- (int64_t)action_JobFailedSchedule:(id)a3 error:(id *)a4;
- (int64_t)action_JobNoNewerSchedule:(id)a3 error:(id *)a4;
- (int64_t)action_JobPostponedSchedule:(id)a3 error:(id *)a4;
- (int64_t)action_JobRevokedSchedule:(id)a3 error:(id *)a4;
- (int64_t)action_JobSuccessAlreadyDownloaded:(id)a3 error:(id *)a4;
- (int64_t)action_JobSuccessDownloadedAwaiting:(id)a3 error:(id *)a4;
- (int64_t)action_JobSuccessDownloadedSchedule:(id)a3 error:(id *)a4;
- (int64_t)action_JobSuccessFoundPromoted:(id)a3 error:(id *)a4;
- (int64_t)action_JobSuccessFoundSameSchedule:(id)a3 error:(id *)a4;
- (int64_t)action_JobSuccessPatchedAwaiting:(id)a3 error:(id *)a4;
- (int64_t)action_JobSuccessPatchedSchedule:(id)a3 error:(id *)a4;
- (int64_t)action_JobSuccessPersonalized:(id)a3 error:(id *)a4;
- (int64_t)action_LookupFailedContinue:(id)a3 error:(id *)a4;
- (int64_t)action_LookupNoNewerContinue:(id)a3 error:(id *)a4;
- (int64_t)action_LookupRevokedContinue:(id)a3 error:(id *)a4;
- (int64_t)action_LookupSuccessContinue:(id)a3 error:(id *)a4;
- (int64_t)action_MergeAddLock:(id)a3 error:(id *)a4;
- (int64_t)action_MergeAddLockDecideBoost:(id)a3 error:(id *)a4;
- (int64_t)action_MergeAtomicAddLock:(id)a3 error:(id *)a4;
- (int64_t)action_MergeAtomicAlterDecideLookup:(id)a3 error:(id *)a4;
- (int64_t)action_MergeAtomicAlterDecideLookupBoost:(id)a3 error:(id *)a4;
- (int64_t)action_MergeAtomicAlterNeeds:(id)a3 error:(id *)a4;
- (int64_t)action_MergeAtomicCntnuDecideLookupBoost:(id)a3 error:(id *)a4;
- (int64_t)action_MergeAtomicContinueLock:(id)a3 error:(id *)a4;
- (int64_t)action_MergeAtomicEndLockDecideInterest:(id)a3 error:(id *)a4;
- (int64_t)action_MergeAtomicLockDecideLookupBoost:(id)a3 error:(id *)a4;
- (int64_t)action_MergeAtomicNeeds:(id)a3 error:(id *)a4;
- (int64_t)action_MergeAtomicNeedsDecideLookup:(id)a3 error:(id *)a4;
- (int64_t)action_MergeAtomicNeedsDecideLookupBoost:(id)a3 error:(id *)a4;
- (int64_t)action_MergeContinueLock:(id)a3 error:(id *)a4;
- (int64_t)action_MergeContinueLockDecideBoost:(id)a3 error:(id *)a4;
- (int64_t)action_MergeNeeds:(id)a3 error:(id *)a4;
- (int64_t)action_MergeNeedsDecideBoost:(id)a3 error:(id *)a4;
- (int64_t)action_MergeNeedsDecideLookup:(id)a3 error:(id *)a4;
- (int64_t)action_MergeNeedsDecideLookupBoost:(id)a3 error:(id *)a4;
- (int64_t)action_MergeRemoveLock:(id)a3 error:(id *)a4;
- (int64_t)action_MergeRemoveLockDecideInterest:(id)a3 error:(id *)a4;
- (int64_t)action_NowUserInitiated:(id)a3 error:(id *)a4;
- (int64_t)action_PersistedDecideDownload:(id)a3 error:(id *)a4;
- (int64_t)action_PersonalizeFailureDecideMore:(id)a3 error:(id *)a4;
- (int64_t)action_PersonalizeHealFailureDecideMore:(id)a3 error:(id *)a4;
- (int64_t)action_PersonalizeHealSuccessDecideMore:(id)a3 error:(id *)a4;
- (int64_t)action_PersonalizeSuccessDecideMore:(id)a3 error:(id *)a4;
- (int64_t)action_RecordSimulateOperation:(id)a3 error:(id *)a4;
- (int64_t)action_ReleaseGrantCanceling:(id)a3 error:(id *)a4;
- (int64_t)action_ReleaseGrantJobFailedCanceled:(id)a3 error:(id *)a4;
- (int64_t)action_ReleaseGrantJobFailedSchedule:(id)a3 error:(id *)a4;
- (int64_t)action_RemoveClient:(id)a3 error:(id *)a4;
- (int64_t)action_RemoveClientDecideInterest:(id)a3 error:(id *)a4;
- (int64_t)action_ReportCatalogDecideFound:(id)a3 error:(id *)a4;
- (int64_t)action_ReportFailBoostSetDownloadNext:(id)a3 error:(id *)a4;
- (int64_t)action_ReportFailureUserInitiated:(id)a3 error:(id *)a4;
- (int64_t)action_RequestLookupGrant:(id)a3 error:(id *)a4;
- (int64_t)action_RequestSpecificPersisted:(id)a3 error:(id *)a4;
- (int64_t)action_SecureBundlePersonalize:(id)a3 error:(id *)a4;
- (int64_t)action_SetCalculateDownloadSpace:(id)a3 error:(id *)a4;
- (int64_t)action_SetDecideDownload:(id)a3 error:(id *)a4;
- (int64_t)action_SetDoneDetermine:(id)a3 error:(id *)a4;
- (int64_t)action_SetDownloadNewestFull:(id)a3 error:(id *)a4;
- (int64_t)action_SetDownloadNext:(id)a3 error:(id *)a4;
- (int64_t)action_SetDownloadSameFull:(id)a3 error:(id *)a4;
- (int64_t)action_SetJobEndedSchedule:(id)a3 error:(id *)a4;
- (int64_t)action_SetJobFailedAwaiting:(id)a3 error:(id *)a4;
- (int64_t)action_SetJobFailedSchedule:(id)a3 error:(id *)a4;
- (int64_t)action_SetJobHealPersonalizeNext:(id)a3 error:(id *)a4;
- (int64_t)action_SetJobLookupRevokedContinue:(id)a3 error:(id *)a4;
- (int64_t)action_SetJobNoNewerSchedule:(id)a3 error:(id *)a4;
- (int64_t)action_SetJobNoneSchedule:(id)a3 error:(id *)a4;
- (int64_t)action_SetJobSuccessAwaiting:(id)a3 error:(id *)a4;
- (int64_t)action_SetJobSuccessFoundPromoted:(id)a3 error:(id *)a4;
- (int64_t)action_SetJobSuccessFoundSameSchedule:(id)a3 error:(id *)a4;
- (int64_t)action_SetJobSuccessSchedule:(id)a3 error:(id *)a4;
- (int64_t)action_SetJobTryPersonalizeHeal:(id)a3 error:(id *)a4;
- (int64_t)action_SetLookupNoNewerContinue:(id)a3 error:(id *)a4;
- (int64_t)action_SetLookupNoneContinue:(id)a3 error:(id *)a4;
- (int64_t)action_SetLookupSuccessContinue:(id)a3 error:(id *)a4;
- (int64_t)action_SimulateSuspendCatalogLookupIssue:(id)a3 error:(id *)a4;
- (int64_t)action_StagerDetermineDecideFilesystem:(id)a3 error:(id *)a4;
- (int64_t)action_StagerDownloadDecideFilesystem:(id)a3 error:(id *)a4;
- (int64_t)action_UserInitiatedDownloadNewestFull:(id)a3 error:(id *)a4;
- (int64_t)action_UserInitiatedSetDownloadNext:(id)a3 error:(id *)a4;
- (int64_t)clientRequestCount;
- (int64_t)errorCodeForNoNewerContentFound;
- (int64_t)errorCodeFromUnderling:(id)a3;
- (int64_t)nextSetSpecifierToDownload;
- (int64_t)progressReportPhase;
- (int64_t)setProgressAssetTotalWrittenBytes;
- (int64_t)setProgressOverallTotalWrittenBytes;
- (int64_t)simulateEnd;
- (int64_t)simulateOperation;
- (int64_t)simulateTriggered;
- (void)_autoAssetJobFinished:(id)a3 forJobFinishedReason:(id)a4 failingWithError:(id)a5;
- (void)_commitPrePersonalized:(id)a3 error:(id *)a4;
- (void)_extendAssetDownloadOptionsWithAnalyticsData:(id)a3 forDescriptor:(id)a4 withBaseForPatch:(id)a5;
- (void)_extendCatalogDownloadOptionsWithAnalyticsData:(id)a3;
- (void)_rememberIfSchedulerInvolved:(id)a3;
- (void)_setPolicyFromClientRequest:(id)a3;
- (void)_statusChangeDownloadProgressDecideLog:(id)a3;
- (void)addClientRequestAndMergeNeeds:(id)a3 forJobEvent:(id)a4;
- (void)addToActiveJobTasks:(id)a3;
- (void)adoptCachedLookupResult:(id)a3;
- (void)appendUniqueSelectorForDescriptor:(id)a3 toArray:(id)a4;
- (void)autoAssetJobFinished:(id)a3 forJobFinishedReason:(id)a4;
- (void)autoAssetJobFinished:(id)a3 forJobFinishedReason:(id)a4 failingWithError:(id)a5;
- (void)autoAssetSetAssetType;
- (void)cancelAutoAssetJob;
- (void)checkFilesystemAndDecidePurgeOrLookup;
- (void)clearSetStatusStartingSetJob;
- (void)clientRequestedStatus:(id)a3;
- (void)desireChangedToUserInitiated;
- (void)determineWhetherNetworkConnectivityError:(id)a3;
- (void)doneWithAllJobs:(id)a3;
- (void)doneWithAllJobs:(id)a3 withLookupError:(id)a4;
- (void)downloadCatalog:(id)a3;
- (void)exclusiveLookupForAssetTypeGranted:(id)a3;
- (void)finishJobTaskForJobParam:(id)a3 withResponseError:(id)a4;
- (void)finishJobTaskForJobParam:(id)a3 withUnderlyingError:(id)a4 fromAction:(id)a5;
- (void)finishSetJobDownloadedNewer:(id)a3 forJobFinishedReason:(id)a4;
- (void)finishedSetJobFinalizeStatus:(id)a3 failingWithError:(id)a4;
- (void)finishedSetSameVersionFound:(id)a3;
- (void)foundAndDownloaded:(id)a3 forJobParam:(id)a4 wasPatched:(BOOL)a5;
- (void)foundAndDownloadedSet:(id)a3;
- (void)handleClientRequest:(id)a3 withControlInformation:(id)a4;
- (void)handleDownloadAssetJobFinished:(id)a3 downloadError:(id)a4;
- (void)handleDownloadAssetProgressForJob:(id)a3 withProgress:(id)a4;
- (void)handleDownloadCatalogJobFinished:(id)a3 withCatalog:(id)a4 downloadError:(id)a5;
- (void)handleDownloadConfigJobFinished:(id)a3 configError:(id)a4;
- (void)handleSimulateOperation:(id)a3;
- (void)latchWhetherDownloadingUserInitiated;
- (void)mergeSetPolicyIntoAggregated:(id)a3;
- (void)newFoundSetDescriptorsFromCachedLookup:(id)a3;
- (void)obtainLookupGrant;
- (void)persistedStateForDownloadJob:(id)a3;
- (void)rebuildLastestOnFS:(id)a3;
- (void)refreshDownloadedToManager;
- (void)refreshFoundToManager;
- (void)refreshSetFoundToManager:(BOOL)a3;
- (void)releaseLookupGrant;
- (void)replyToClientForJobParam:(id)a3 withResponseError:(id)a4;
- (void)replyToJobsWhenCatalogDownloaded:(id)a3 discoveredNewer:(BOOL)a4;
- (void)replyToJobsWhenContentDownloaded:(id)a3;
- (void)replyToJobsWhenLookupFailed:(id)a3 withLookupError:(id)a4;
- (void)replyToJobsWhenOperationFoundSame:(id)a3 forCheckAtomic:(BOOL)a4 withLookupError:(id)a5;
- (void)replyToSetCheckAtomicDownloadSuccess;
- (void)reportIfSetPallasResponseReceived:(id)a3;
- (void)reportJustDownloadedAssetOfSet:(id)a3;
- (void)requestDownloadManagerAssetDownload:(id)a3 forDescriptor:(id)a4 withBaseForPatch:(id)a5;
- (void)requestDownloadManagerCancelDownload:(id)a3 forDescriptor:(id)a4;
- (void)requestDownloadManagerCatalogLookup:(id)a3;
- (void)requestDownloadManagerConfigDownload:(id)a3 forDescriptor:(id)a4;
- (void)setActiveDesire:(id)a3;
- (void)setActiveEnd:(id)a3;
- (void)setActiveFound:(id)a3;
- (void)setActiveInstance:(id)a3;
- (void)setActiveJobTasks:(id)a3;
- (void)setActiveListen:(id)a3;
- (void)setAggregatedClientAssetPolicy:(id)a3;
- (void)setAggregatedClientAssetPolicySpecified:(BOOL)a3;
- (void)setAggregatedClientSetPolicy:(id)a3;
- (void)setAggregatedClientSetPolicySpecified:(BOOL)a3;
- (void)setAnomalyNoActiveSetDescriptor:(BOOL)a3;
- (void)setAnomalyNoAssignedSetDescriptor:(BOOL)a3;
- (void)setAssetDownloadOptions:(id)a3;
- (void)setAssignedSetDescriptor:(id)a3;
- (void)setAutoAssetInstance:(id)a3;
- (void)setAutoAssetJobInformation:(id)a3;
- (void)setAutoAssetSetDescriptor:(id)a3;
- (void)setAutoAssetSetDesire:(id)a3;
- (void)setAutoAssetSetIdentifier:(id)a3;
- (void)setAutoAssetSetInstance:(id)a3;
- (void)setAutoAssetSetJob:(BOOL)a3;
- (void)setAutoJobFSM:(id)a3;
- (void)setAutoJobName:(id)a3;
- (void)setBaseForPatch:(id)a3;
- (void)setBecameLatestToVend:(BOOL)a3;
- (void)setBeingCanceled:(BOOL)a3;
- (void)setBondedWithJob:(id)a3;
- (void)setBoostedToUserInitiated:(BOOL)a3;
- (void)setCachedAutoAssetCatalog:(id)a3;
- (void)setCatalogDownloadOptions:(id)a3;
- (void)setCheckUUID:(id)a3;
- (void)setCheckUUIDBasePortion:(id)a3;
- (void)setCheckingAssetContent:(BOOL)a3;
- (void)setClientDomainName:(id)a3;
- (void)setClientRequestCount:(int64_t)a3;
- (void)setClientRequestedOperation:(BOOL)a3;
- (void)setCurrentJobTask:(id)a3;
- (void)setCurrentSetNotifications:(id)a3;
- (void)setCurrentSetStatus:(id)a3;
- (void)setCurrentStatus:(id)a3;
- (void)setDeterminingAssetContent:(BOOL)a3;
- (void)setDownloadingAssetDescriptor:(id)a3;
- (void)setDownloadingUserInitiated:(BOOL)a3;
- (void)setEarlierPotentialNetworkFailure:(BOOL)a3;
- (void)setEarlierSchedulerInvolved:(BOOL)a3;
- (void)setFirstClientName:(id)a3;
- (void)setFoundNewerFull:(id)a3;
- (void)setFoundNewerPatch:(id)a3;
- (void)setFoundSameAtomicInstanceAlreadyDownloaded:(BOOL)a3;
- (void)setFoundSetFullDescriptorsBySpecifier:(id)a3;
- (void)setFoundSetNewerDiscoveredAtomicEntries:(id)a3;
- (void)setFoundSetPatchDescriptorsBySpecifier:(id)a3;
- (void)setHaveReceivedLookupResponse:(BOOL)a3;
- (void)setHoldingLookupGrant:(BOOL)a3;
- (void)setJobCreationTriggeringLayer:(id)a3;
- (void)setLastReportedPatchProgress:(id)a3;
- (void)setLatestAssetDescriptorOnFilesystemBySpecifier:(id)a3;
- (void)setLatestAutoAssetSetSummary:(id)a3;
- (void)setLatestAutoAssetSummary:(id)a3;
- (void)setLatestInstalledAssetBuild:(id)a3;
- (void)setLatestInstalledAssetVersion:(id)a3;
- (void)setLatestSafeSummary:(id)a3;
- (void)setLockingAssetContent:(BOOL)a3;
- (void)setNewerFoundAssetDescriptor:(id)a3;
- (void)setNewestDownloadedSetStatus:(id)a3;
- (void)setNextSetSpecifierToDownload:(int64_t)a3;
- (void)setOnFilesystemByVersion:(id)a3;
- (void)setPotentialNetworkFailure:(BOOL)a3;
- (void)setPrePersonalizedSelectors:(id)a3;
- (void)setProgressAssetDownload:(id)a3;
- (void)setProgressLogsFilteredCount:(int)a3;
- (void)setProgressReadyToStartDownloads;
- (void)setProgressReportPhase:(int64_t)a3;
- (void)setRampingForeground:(BOOL)a3;
- (void)setRampingForegroundLatched:(BOOL)a3;
- (void)setReportingProgress:(BOOL)a3;
- (void)setResultEnd:(id)a3;
- (void)setResultFound:(id)a3;
- (void)setResultInstance:(id)a3;
- (void)setResultListen:(id)a3;
- (void)setResultSelector:(id)a3;
- (void)setResultSetFound:(id)a3;
- (void)setSchedulerInvolved:(BOOL)a3;
- (void)setSchedulerSetPolicy:(id)a3;
- (void)setSchedulerTriggerReceived:(BOOL)a3;
- (void)setSetCheckAwaitingDownload:(BOOL)a3;
- (void)setSetConfiguration:(id)a3;
- (void)setSetJobInformation:(id)a3;
- (void)setSetProgressAssetTotalWrittenBytes:(int64_t)a3;
- (void)setSetProgressOverallTotalWrittenBytes:(int64_t)a3;
- (void)setSetSpaceCheckedUUID:(id)a3;
- (void)setSimulateBaseForPatch:(id)a3;
- (void)setSimulateDescriptor:(id)a3;
- (void)setSimulateEnd:(int64_t)a3;
- (void)setSimulateOperation:(int64_t)a3;
- (void)setSimulateTriggered:(int64_t)a3;
- (void)setStagerAssetTargetBuildVersion:(id)a3;
- (void)setStagerAssetTargetOSVersion:(id)a3;
- (void)setStagerAssetTargetRestoreVersion:(id)a3;
- (void)setStagerAssetTargetTrainName:(id)a3;
- (void)setStagerJob:(BOOL)a3;
- (void)setStagerJobAutoAssetCatalog:(id)a3;
- (void)setStagerJobDownloadContent:(BOOL)a3;
- (void)setStagerJobResultsReported:(BOOL)a3;
- (void)setStagerSetPolicy:(id)a3;
- (void)setTryPersonalizeDescriptors:(id)a3;
- (void)setTryPersonalizeFailed:(BOOL)a3;
- (void)setTryPersonalizeSelector:(id)a3;
- (void)setTryPersonalizeSuccess:(BOOL)a3;
- (void)setVendingAtomicInstanceForConfiguredEntries:(BOOL)a3;
- (void)setWasPatched:(BOOL)a3;
- (void)simulateEnd:(int64_t)a3;
- (void)simulateSet:(id)a3;
- (void)stagerJobDetermineDone:(id)a3 reportingError:(id)a4;
- (void)stagerJobDone:(id)a3 reportingError:(id)a4;
- (void)stagerJobDownloadDone:(id)a3 reportingError:(id)a4;
- (void)stagerJobReportProgress:(id)a3 reportingError:(id)a4;
- (void)startHandlingClientRequest:(id)a3 withControlInformation:(id)a4;
- (void)startResumingInFlightDownload:(id)a3 withControlInformation:(id)a4;
- (void)startScheduleTriggeredSelector:(id)a3 withControlInformation:(id)a4;
- (void)startScheduleTriggeredSetJob:(id)a3;
- (void)startStagerDetermineIfAvailable:(id)a3 withAssetTargetBuildVersion:(id)a4 withAssetTargetTrainName:(id)a5 withAssetTargetRestoreVersion:(id)a6 withControlInformation:(id)a7;
- (void)startStagerDownloadForStaging:(id)a3 withAssetTargetBuildVersion:(id)a4 withControlInformation:(id)a5;
- (void)statusChange:(id)a3 catalogAnomaly:(int64_t)a4 forReason:(id)a5;
- (void)statusChange:(id)a3 catalogFailure:(int64_t)a4 forReason:(id)a5;
- (void)statusChangeCatalogFoundNewer:(id)a3;
- (void)statusChangeCatalogFoundSame:(id)a3;
- (void)statusChangeDownloadProgress:(id)a3;
- (void)statusChangeJobFinished:(id)a3 withResponseError:(id)a4;
- (void)statusChangeReportCurrent:(id)a3;
- (void)statusChangeSetCatalogFoundNewer:(id)a3;
- (void)statusChangeSetCatalogFoundSame:(id)a3;
- (void)statusChangeStartingAssetDownload:(id)a3 downloadingPatch:(BOOL)a4;
- (void)statusChangeSuccesfullyPatched:(id)a3;
- (void)statusChangeSuccessfullyDownloaded:(id)a3;
- (void)trackAnomaly:(int64_t)a3 forReason:(id)a4;
- (void)updateAutoAssetSetDescriptor;
- (void)updateResultPropertiesWithDescriptor:(id)a3;
- (void)updateSetDescriptorDownloaded:(id)a3 forAssetDescriptor:(id)a4 justDownloaded:(BOOL)a5;
- (void)updateSetResults:(id)a3 atomicInstanceDiscovered:(BOOL)a4 availableForUse:(BOOL)a5 downloading:(BOOL)a6 buildingResultSetFound:(BOOL)a7;
- (void)updateSetTrackingWithSuccessfulAssetDownload;
@end

@implementation MADAutoAssetJob

- (id)initForInstance:(id)a3 withAutoAssetUUID:(id)a4 downloadingUserInitiated:(BOOL)a5
{
  LOWORD(v6) = a5;
  return -[MADAutoAssetJob initForInstance:orForSelector:orForDescriptor:orForSetInstance:withSetDesire:withSchedulerSetPolicy:withStagerSetPolicy:usingSetConfiguration:usingSetDescriptor:withBaseForPatchDescriptor:withAutoAssetUUID:downloadingUserInitiated:asStagerJob:usingCachedAutoAssetCatalog:]( self,  "initForInstance:orForSelector:orForDescriptor:orForSetInstance:withSetDesire:withSchedulerSetPolicy:withStage rSetPolicy:usingSetConfiguration:usingSetDescriptor:withBaseForPatchDescriptor:withAutoAssetUUID:downloadingU serInitiated:asStagerJob:usingCachedAutoAssetCatalog:",  a3,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a4,  v6,  0LL);
}

- (id)initForSelector:(id)a3 withAutoAssetUUID:(id)a4
{
  LOWORD(v5) = 0;
  return -[MADAutoAssetJob initForInstance:orForSelector:orForDescriptor:orForSetInstance:withSetDesire:withSchedulerSetPolicy:withStagerSetPolicy:usingSetConfiguration:usingSetDescriptor:withBaseForPatchDescriptor:withAutoAssetUUID:downloadingUserInitiated:asStagerJob:usingCachedAutoAssetCatalog:]( self,  "initForInstance:orForSelector:orForDescriptor:orForSetInstance:withSetDesire:withSchedulerSetPolicy:withStage rSetPolicy:usingSetConfiguration:usingSetDescriptor:withBaseForPatchDescriptor:withAutoAssetUUID:downloadingU serInitiated:asStagerJob:usingCachedAutoAssetCatalog:",  0LL,  a3,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a4,  v5,  0LL);
}

- (id)initForSelector:(id)a3 withAutoAssetUUID:(id)a4 asStagerJob:(BOOL)a5 withStagerSetPolicy:(id)a6 usingCachedAutoAssetCatalog:(id)a7 usingBaseForPatching:(id)a8
{
  BYTE1(v9) = a5;
  LOBYTE(v9) = 0;
  return -[MADAutoAssetJob initForInstance:orForSelector:orForDescriptor:orForSetInstance:withSetDesire:withSchedulerSetPolicy:withStagerSetPolicy:usingSetConfiguration:usingSetDescriptor:withBaseForPatchDescriptor:withAutoAssetUUID:downloadingUserInitiated:asStagerJob:usingCachedAutoAssetCatalog:]( self,  "initForInstance:orForSelector:orForDescriptor:orForSetInstance:withSetDesire:withSchedulerSetPolicy:withStage rSetPolicy:usingSetConfiguration:usingSetDescriptor:withBaseForPatchDescriptor:withAutoAssetUUID:downloadingU serInitiated:asStagerJob:usingCachedAutoAssetCatalog:",  0LL,  a3,  0LL,  0LL,  0LL,  0LL,  a6,  0LL,  0LL,  a8,  a4,  v9,  a7);
}

- (id)initForSetConfiguration:(id)a3 withAutoAssetUUID:(id)a4 asStagerJob:(BOOL)a5 withStagerSetPolicy:(id)a6
{
  BYTE1(v7) = a5;
  LOBYTE(v7) = 0;
  return -[MADAutoAssetJob initForInstance:orForSelector:orForDescriptor:orForSetInstance:withSetDesire:withSchedulerSetPolicy:withStagerSetPolicy:usingSetConfiguration:usingSetDescriptor:withBaseForPatchDescriptor:withAutoAssetUUID:downloadingUserInitiated:asStagerJob:usingCachedAutoAssetCatalog:]( self,  "initForInstance:orForSelector:orForDescriptor:orForSetInstance:withSetDesire:withSchedulerSetPolicy:withStage rSetPolicy:usingSetConfiguration:usingSetDescriptor:withBaseForPatchDescriptor:withAutoAssetUUID:downloadingU serInitiated:asStagerJob:usingCachedAutoAssetCatalog:",  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a6,  a3,  0LL,  0LL,  a4,  v7,  0LL);
}

- (id)initForDescriptor:(id)a3 baseForPatchDescriptor:(id)a4 withAutoAssetUUID:(id)a5
{
  LOWORD(v6) = 0;
  return -[MADAutoAssetJob initForInstance:orForSelector:orForDescriptor:orForSetInstance:withSetDesire:withSchedulerSetPolicy:withStagerSetPolicy:usingSetConfiguration:usingSetDescriptor:withBaseForPatchDescriptor:withAutoAssetUUID:downloadingUserInitiated:asStagerJob:usingCachedAutoAssetCatalog:]( self,  "initForInstance:orForSelector:orForDescriptor:orForSetInstance:withSetDesire:withSchedulerSetPolicy:withStage rSetPolicy:usingSetConfiguration:usingSetDescriptor:withBaseForPatchDescriptor:withAutoAssetUUID:downloadingU serInitiated:asStagerJob:usingCachedAutoAssetCatalog:",  0LL,  0LL,  a3,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  a4,  a5,  v6,  0LL);
}

- (id)initForSetInstance:(id)a3 withSetDesire:(id)a4 usingSetConfiguration:(id)a5 usingSetDescriptor:(id)a6 withAutoAssetUUID:(id)a7
{
  LOWORD(v8) = 0;
  return -[MADAutoAssetJob initForInstance:orForSelector:orForDescriptor:orForSetInstance:withSetDesire:withSchedulerSetPolicy:withStagerSetPolicy:usingSetConfiguration:usingSetDescriptor:withBaseForPatchDescriptor:withAutoAssetUUID:downloadingUserInitiated:asStagerJob:usingCachedAutoAssetCatalog:]( self,  "initForInstance:orForSelector:orForDescriptor:orForSetInstance:withSetDesire:withSchedulerSetPolicy:withStage rSetPolicy:usingSetConfiguration:usingSetDescriptor:withBaseForPatchDescriptor:withAutoAssetUUID:downloadingU serInitiated:asStagerJob:usingCachedAutoAssetCatalog:",  0LL,  0LL,  0LL,  a3,  a4,  0LL,  0LL,  a5,  a6,  0LL,  a7,  v8,  0LL);
}

- (id)initForSetInstance:(id)a3 withSchedulerSetPolicy:(id)a4 usingSetConfiguration:(id)a5 usingSetDescriptor:(id)a6 withAutoAssetUUID:(id)a7
{
  LOWORD(v8) = 0;
  return -[MADAutoAssetJob initForInstance:orForSelector:orForDescriptor:orForSetInstance:withSetDesire:withSchedulerSetPolicy:withStagerSetPolicy:usingSetConfiguration:usingSetDescriptor:withBaseForPatchDescriptor:withAutoAssetUUID:downloadingUserInitiated:asStagerJob:usingCachedAutoAssetCatalog:]( self,  "initForInstance:orForSelector:orForDescriptor:orForSetInstance:withSetDesire:withSchedulerSetPolicy:withStage rSetPolicy:usingSetConfiguration:usingSetDescriptor:withBaseForPatchDescriptor:withAutoAssetUUID:downloadingU serInitiated:asStagerJob:usingCachedAutoAssetCatalog:",  0LL,  0LL,  0LL,  a3,  0LL,  a4,  0LL,  a5,  a6,  0LL,  a7,  v8,  0LL);
}

- (id)initForInstance:(id)a3 orForSelector:(id)a4 orForDescriptor:(id)a5 orForSetInstance:(id)a6 withSetDesire:(id)a7 withSchedulerSetPolicy:(id)a8 withStagerSetPolicy:(id)a9 usingSetConfiguration:(id)a10 usingSetDescriptor:(id)a11 withBaseForPatchDescriptor:(id)a12 withAutoAssetUUID:(id)a13 downloadingUserInitiated:(BOOL)a14 asStagerJob:(BOOL)a15 usingCachedAutoAssetCatalog:(id)a16
{
  id v239 = a3;
  id v21 = a4;
  id v227 = a5;
  id v22 = a5;
  id v217 = a6;
  id v243 = a6;
  id v238 = a7;
  id v23 = a8;
  id v236 = a8;
  id v235 = a9;
  id v242 = a10;
  id v241 = a11;
  id v234 = a12;
  id v240 = a13;
  id v237 = a16;
  v244.receiver = self;
  v244.super_class = (Class)&OBJC_CLASS___MADAutoAssetJob;
  v24 = -[MADAutoAssetJob init](&v244, "init");
  v25 = v24;
  if (!v24) {
    goto LABEL_89;
  }
  v231 = v21;
  p_autoAssetInstance = (id *)&v24->_autoAssetInstance;
  autoAssetInstance = v24->_autoAssetInstance;
  v24->_autoAssetInstance = 0LL;

  v25->_BOOL autoAssetSetJob = 0;
  clientDomainName = v25->_clientDomainName;
  v25->_clientDomainName = 0LL;

  autoAssetSetIdentifier = v25->_autoAssetSetIdentifier;
  v25->_autoAssetSetIdentifier = 0LL;

  autoAssetSelector = v25->_autoAssetSelector;
  v25->_autoAssetSelector = 0LL;

  setConfiguration = v25->_setConfiguration;
  v25->_setConfiguration = 0LL;

  cachedAutoAssetCatalog = v25->_cachedAutoAssetCatalog;
  v25->_cachedAutoAssetCatalog = 0LL;

  setJobInformation = v25->_setJobInformation;
  v25->_setJobInformation = 0LL;

  autoAssetSetInstance = v25->_autoAssetSetInstance;
  v25->_autoAssetSetInstance = 0LL;

  autoAssetSetDesire = v25->_autoAssetSetDesire;
  v25->_autoAssetSetDesire = 0LL;

  schedulerSetPolicy = v25->_schedulerSetPolicy;
  v25->_schedulerSetPolicy = 0LL;

  stagerSetPolicy = v25->_stagerSetPolicy;
  v25->_stagerSetPolicy = 0LL;

  assignedSetDescriptor = v25->_assignedSetDescriptor;
  v25->_assignedSetDescriptor = 0LL;

  aggregatedClientSetPolicy = v25->_aggregatedClientSetPolicy;
  v25->_aggregatedClientSetPolicy = 0LL;

  v25->_aggregatedClientSetPolicySpecified = 0;
  v25->_setCheckAwaitingDownload = 0;
  *(_WORD *)&v25->_BOOL haveReceivedLookupResponse = 0;
  v25->_BOOL downloadingUserInitiated = a14;
  v233 = v22;
  if (v22)
  {
    v40 = objc_alloc(&OBJC_CLASS___MAAutoAssetSelector);
    v41 = (void *)objc_claimAutoreleasedReturnValue([v22 assetType]);
    v42 = (void *)objc_claimAutoreleasedReturnValue([v22 assetSpecifier]);
    v43 = (void *)objc_claimAutoreleasedReturnValue([v22 assetVersion]);
    v44 = (MAAutoAssetSelector *)-[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:]( v40,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:",  v41,  v42,  v43);
    v45 = v25->_autoAssetSelector;
    v25->_autoAssetSelector = v44;

    v46 = v243;
    v47 = v227;
    id v48 = a13;
    id v49 = a12;
    BOOL v50 = a15;
LABEL_27:

    goto LABEL_28;
  }

  p_aggregatedClientSetPolicy = (void **)&v25->_aggregatedClientSetPolicy;
  if (v243)
  {
    p_schedulerSetPolicy = (id *)&v25->_schedulerSetPolicy;
    v25->_BOOL autoAssetSetJob = 1;
    objc_storeStrong((id *)&v25->_autoAssetSetDesire, a7);
    objc_storeStrong(p_autoAssetInstance + 53, v23);
    v53 = (MADAutoSetDescriptor *)[v241 copy];
    v54 = v25->_assignedSetDescriptor;
    v25->_assignedSetDescriptor = v53;

    uint64_t v55 = objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor clientDomainName](v25->_assignedSetDescriptor, "clientDomainName"));
    v56 = v25->_clientDomainName;
    v25->_clientDomainName = (NSString *)v55;

    uint64_t v57 = objc_claimAutoreleasedReturnValue(-[MADAutoSetDescriptor assetSetIdentifier](v25->_assignedSetDescriptor, "assetSetIdentifier"));
    v58 = v25->_autoAssetSetIdentifier;
    v25->_autoAssetSetIdentifier = (NSString *)v57;

    objc_storeStrong(p_autoAssetInstance + 48, a10);
    v25->_BOOL haveReceivedLookupResponse = [v242 haveReceivedLookupResponse];
    v25->_vendingAtomicInstanceForConfiguredEntries = [v242 vendingAtomicInstanceForConfiguredEntries];
    objc_storeStrong(p_autoAssetInstance + 49, a16);
    v59 = objc_alloc_init(&OBJC_CLASS___MADAutoSetJobInformation);
    v60 = v25->_setJobInformation;
    v25->_setJobInformation = v59;

    -[MADAutoSetJobInformation setClientInstance:](v25->_setJobInformation, "setClientInstance:", v243);
    objc_storeStrong((id *)&v25->_autoAssetSetInstance, v217);
    -[MADAutoSetJobInformation setClientDesire:](v25->_setJobInformation, "setClientDesire:", v238);
    -[MADAutoSetJobInformation setAssignedAutoAssetUUID:](v25->_setJobInformation, "setAssignedAutoAssetUUID:", v240);
    v61 = v25->_autoAssetSetDesire;
    v46 = v243;
    if (v61)
    {
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoDesire clientAssetSetPolicy](v61, "clientAssetSetPolicy"));

      if (v62)
      {
        uint64_t v63 = objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetInfoDesire clientAssetSetPolicy](v25->_autoAssetSetDesire, "clientAssetSetPolicy"));
        v64 = v25->_aggregatedClientSetPolicy;
        v25->_aggregatedClientSetPolicy = (MANAutoAssetSetPolicy *)v63;

        v25->_aggregatedClientSetPolicySpecified = 1;
        BOOL v50 = a15;
        id v48 = a13;
        if (-[MANAutoAssetSetPolicy userInitiated](v25->_aggregatedClientSetPolicy, "userInitiated")) {
          v25->_BOOL downloadingUserInitiated = 1;
        }
      }

      else
      {
        v83 = objc_alloc_init(&OBJC_CLASS___MANAutoAssetSetPolicy);
        v84 = *p_aggregatedClientSetPolicy;
        *p_aggregatedClientSetPolicy = v83;

        BOOL v50 = a15;
        id v48 = a13;
      }

      if (-[MANAutoAssetSetInfoDesire awaitDownloadingOfDiscovered]( v25->_autoAssetSetDesire,  "awaitDownloadingOfDiscovered"))
      {
        v25->_setCheckAwaitingDownload = 1;
      }
    }

    else
    {
      id v48 = a13;
      if (*p_schedulerSetPolicy)
      {
        objc_storeStrong(p_autoAssetInstance + 57, *p_schedulerSetPolicy);
      }

      else
      {
        v87 = objc_alloc_init(&OBJC_CLASS___MANAutoAssetSetPolicy);
        v88 = *p_aggregatedClientSetPolicy;
        *p_aggregatedClientSetPolicy = v87;
      }

      BOOL v50 = a15;
    }

    v89 = objc_alloc(&OBJC_CLASS___MAAutoAssetSelector);
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetAssetType](v25, "autoAssetSetAssetType"));
    v90 = (void *)objc_claimAutoreleasedReturnValue([v243 assetSetIdentifier]);
    v91 = (MAAutoAssetSelector *)-[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:]( v89,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:",  v41,  v90,  @"88.77.66.55.44,0");
    v92 = v25->_autoAssetSelector;
    v25->_autoAssetSelector = v91;

    goto LABEL_26;
  }

  v65 = p_autoAssetInstance + 57;
  BOOL v50 = a15;
  if (v242 && a15)
  {
    v25->_BOOL autoAssetSetJob = 1;
    objc_storeStrong(p_autoAssetInstance + 48, a10);
    objc_storeStrong(p_autoAssetInstance + 54, a9);
    uint64_t v66 = objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration clientDomainName](v25->_setConfiguration, "clientDomainName"));
    v67 = v25->_clientDomainName;
    v25->_clientDomainName = (NSString *)v66;

    uint64_t v68 = objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration assetSetIdentifier](v25->_setConfiguration, "assetSetIdentifier"));
    v69 = v25->_autoAssetSetIdentifier;
    v25->_autoAssetSetIdentifier = (NSString *)v68;

    v70 = objc_alloc_init(&OBJC_CLASS___MADAutoSetJobInformation);
    v71 = v25->_setJobInformation;
    v25->_setJobInformation = v70;

    objc_storeStrong(v65, v25->_stagerSetPolicy);
    objc_storeStrong(p_autoAssetInstance + 49, a16);
    v72 = objc_alloc(&OBJC_CLASS___MAAutoAssetSelector);
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetAssetType](v25, "autoAssetSetAssetType"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration clientDomainName](v25->_setConfiguration, "clientDomainName"));
    v74 = (MAAutoAssetSelector *)-[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:]( v72,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:",  v41,  v73,  @"88.77.66.55.44,0");
    v75 = v25->_autoAssetSelector;
    v25->_autoAssetSelector = v74;

    v46 = v243;
    v47 = v227;
    id v48 = a13;
    id v49 = a12;
    goto LABEL_27;
  }

  if (v237 && a15)
  {
    objc_storeStrong(p_autoAssetInstance + 54, a9);
    v76 = objc_alloc_init(&OBJC_CLASS___MADAutoSetJobInformation);
    v77 = v25->_setJobInformation;
    v25->_setJobInformation = v76;

    objc_storeStrong(v65, v25->_stagerSetPolicy);
    objc_storeStrong(p_autoAssetInstance + 49, a16);
    v78 = -[MADAutoAssetJob _newSelectorForCachedAssetCatalog:](v25, "_newSelectorForCachedAssetCatalog:", v237);
    v79 = v25->_autoAssetSelector;
    v25->_autoAssetSelector = v78;

    uint64_t v80 = objc_claimAutoreleasedReturnValue([v237 safeStringForKey:@"SessionId"]);
    checkUUID = v25->_checkUUID;
    v25->_checkUUID = (NSString *)v80;

    v46 = v243;
    v47 = v227;
    id v48 = a13;
    id v49 = a12;
    if (v25->_checkUUID) {
      goto LABEL_28;
    }
    v82 = (NSString *)v240;
    v41 = v25->_checkUUID;
    v25->_checkUUID = v82;
    goto LABEL_27;
  }

  v85 = (void *)objc_claimAutoreleasedReturnValue([v239 clientAssetSelector]);

  v46 = v243;
  id v48 = a13;
  if (v85)
  {
    uint64_t v86 = objc_claimAutoreleasedReturnValue([v239 clientAssetSelector]);
    v41 = v25->_autoAssetSelector;
    v25->_autoAssetSelector = (MAAutoAssetSelector *)v86;
LABEL_26:
    v47 = v227;
    id v49 = a12;
    goto LABEL_27;
  }

  v47 = v227;
  id v49 = a12;
  if (v21)
  {
    v206 = (MAAutoAssetSelector *)v21;
    v41 = v25->_autoAssetSelector;
    v25->_autoAssetSelector = v206;
    goto LABEL_27;
  }

- (void)startHandlingClientRequest:(id)a3 withControlInformation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v14 = -[MADAutoAssetJobParam initWithClientRequest:withControlInformation:]( objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam),  "initWithClientRequest:withControlInformation:",  v7,  v6);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 clientRequestMessage]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 messageName]);

  -[MADAutoAssetJobParam updateSafeSummary](v14, "updateSafeSummary");
  if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v9,  @"MA-AUTO:INTEREST_IN_CONTENT") & 1) != 0)
  {
    v10 = @"ClientRequestInterest";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v9,  @"MA-AUTO:CHECK_FOR_NEWER") & 1) != 0)
  {
    v10 = @"ClientRequestCheck";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v9,  @"MA-AUTO:DETERMINE_IF_AVAILABLE") & 1) != 0)
  {
    v10 = @"ClientRequestDetermine";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v9,  @"MA-AUTO:LOCK_CONTENT") & 1) != 0)
  {
    v10 = @"ClientRequestAddLock";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v9,  @"MA-AUTO:CONTINUE_LOCK_USAGE") & 1) != 0)
  {
    v10 = @"ClientRequestContinueLock";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v9,  @"MA-AUTO:END_LOCK_USAGE") & 1) != 0 || (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v9,  @"MA-AUTO:END_PREVIOUS_LOCKS") & 1) != 0 || (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v9,  @"MA-AUTO:END_ALL_PREVIOUS_LOCKS") & 1) != 0)
  {
    v10 = @"ClientRequestRemoveLock";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v9,  @"MA-AUTO-SET:ALTER_ENTRIES_REPRESENTING_ATOMIC") & 1) != 0)
  {
    v10 = @"SetClientRequestAlterAtomic";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v9,  @"MA-AUTO-SET:NEED_FOR_ATOMIC") & 1) != 0)
  {
    v10 = @"SetClientRequestNeedAtomic";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v9,  @"MA-AUTO-SET:CHECK_ATOMIC") & 1) != 0)
  {
    v10 = @"SetClientRequestCheckAtomic";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v9,  @"MA-AUTO-SET:LOCK_ATOMIC") & 1) != 0)
  {
    v10 = @"SetClientRequestLockAtomic";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v9,  @"MA-AUTO-SET:CONTINUE_ATOMIC_LOCK") & 1) != 0)
  {
    v10 = @"SetClientRequestContinueAtomic";
  }

  else
  {
    if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v9,  @"MA-AUTO-SET:END_ATOMIC_LOCK") & 1) == 0 && (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v9,  @"MA-AUTO-SET:END_ATOMIC_LOCKS_FOR_CLIENT") & 1) == 0)
    {
      v12 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"start requested for invalid command:%@",  v9);
      v13 = self;
      v11 = v12;
      -[MADAutoAssetJob trackAnomaly:forReason:](v13, "trackAnomaly:forReason:", 6106LL, v12);
      goto LABEL_16;
    }

    v10 = @"SetClientRequestEndAtomic";
  }

  v11 = (NSString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  -[NSString postEvent:withInfo:](v11, "postEvent:withInfo:", v10, v14);
LABEL_16:
}

- (void)startScheduleTriggeredSelector:(id)a3 withControlInformation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v9 = -[MADAutoAssetJobParam initWithSelector:withControlInformation:]( objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam),  "initWithSelector:withControlInformation:",  v7,  v6);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  [v8 postEvent:@"SchedulerTriggered" withInfo:v9];
}

- (void)startScheduleTriggeredSetJob:(id)a3
{
  id v4 = a3;
  id v6 = -[MADAutoAssetJobParam initWithSelector:withControlInformation:]( objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam),  "initWithSelector:withControlInformation:",  0LL,  v4);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  [v5 postEvent:@"SchedulerTriggered" withInfo:v6];
}

- (void)startResumingInFlightDownload:(id)a3 withControlInformation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v9 = -[MADAutoAssetJobParam initWithDescriptor:withControlInformation:]( objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam),  "initWithDescriptor:withControlInformation:",  v7,  v6);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  [v8 postEvent:@"StartupDownloading" withInfo:v9];
}

- (void)handleClientRequest:(id)a3 withControlInformation:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v14 = -[MADAutoAssetJobParam initWithClientRequest:withControlInformation:]( objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam),  "initWithClientRequest:withControlInformation:",  v7,  v6);

  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 clientRequestMessage]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v8 messageName]);

  if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v9,  @"MA-AUTO:INTEREST_IN_CONTENT") & 1) != 0)
  {
    v10 = @"ClientRequestInterest";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v9,  @"MA-AUTO:CHECK_FOR_NEWER") & 1) != 0)
  {
    v10 = @"ClientRequestCheck";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v9,  @"MA-AUTO:DETERMINE_IF_AVAILABLE") & 1) != 0)
  {
    v10 = @"ClientRequestDetermine";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v9,  @"MA-AUTO:LOCK_CONTENT") & 1) != 0)
  {
    v10 = @"ClientRequestAddLock";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v9,  @"MA-AUTO:CONTINUE_LOCK_USAGE") & 1) != 0)
  {
    v10 = @"ClientRequestContinueLock";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v9,  @"MA-AUTO:END_LOCK_USAGE") & 1) != 0 || (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v9,  @"MA-AUTO:END_PREVIOUS_LOCKS") & 1) != 0 || (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v9,  @"MA-AUTO:END_ALL_PREVIOUS_LOCKS") & 1) != 0)
  {
    v10 = @"ClientRequestRemoveLock";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v9,  @"MA-AUTO-SET:ALTER_ENTRIES_REPRESENTING_ATOMIC") & 1) != 0)
  {
    v10 = @"SetClientRequestAlterAtomic";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v9,  @"MA-AUTO-SET:NEED_FOR_ATOMIC") & 1) != 0)
  {
    v10 = @"SetClientRequestNeedAtomic";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v9,  @"MA-AUTO-SET:CHECK_ATOMIC") & 1) != 0)
  {
    v10 = @"SetClientRequestCheckAtomic";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v9,  @"MA-AUTO-SET:LOCK_ATOMIC") & 1) != 0)
  {
    v10 = @"SetClientRequestLockAtomic";
  }

  else if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v9,  @"MA-AUTO-SET:CONTINUE_ATOMIC_LOCK") & 1) != 0)
  {
    v10 = @"SetClientRequestContinueAtomic";
  }

  else
  {
    if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v9,  @"MA-AUTO-SET:END_ATOMIC_LOCK") & 1) == 0 && (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v9,  @"MA-AUTO-SET:END_ATOMIC_LOCKS_FOR_CLIENT") & 1) == 0)
    {
      v12 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"client request with invalid command:%@",  v9);
      v13 = self;
      v11 = v12;
      -[MADAutoAssetJob trackAnomaly:forReason:](v13, "trackAnomaly:forReason:", 6106LL, v12);
      goto LABEL_16;
    }

    v10 = @"SetClientRequestEndAtomic";
  }

  v11 = (NSString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  -[NSString postEvent:withInfo:](v11, "postEvent:withInfo:", v10, v14);
LABEL_16:
}

- (void)clientRequestedStatus:(id)a3
{
  id v4 = a3;
  id v6 = -[MADAutoAssetJobParam initWithControlInformation:]( objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam),  "initWithControlInformation:",  v4);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  [v5 postEvent:@"SimulateClientRequestedStatus" withInfo:v6];
}

- (void)handleSimulateOperation:(id)a3
{
  id v4 = a3;
  id v6 = -[MADAutoAssetJobParam initWithControlInformation:]( objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam),  "initWithControlInformation:",  v4);

  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  [v5 postEvent:@"SimulateOperation" withInfo:v6];
}

- (void)handleDownloadCatalogJobFinished:(id)a3 withCatalog:(id)a4 downloadError:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  if (a5)
  {
    a5 = (id)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6107LL,  @"handleDownloadCatalogJobFinished",  a5,  @"error while downloading catalog (performing auto-asset lookup)"));
    uint64_t v9 = @"CatalogDownloadFailure";
  }

  else
  {
    uint64_t v9 = @"CatalogDownloadSuccess";
  }

  id v10 = -[MADAutoAssetJobParam initForFinishedJobID:withCatalog:whereCatalogFromLookupCache:withError:]( objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam),  "initForFinishedJobID:withCatalog:whereCatalogFromLookupCache:withError:",  v12,  v8,  0LL,  a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  [v11 postEvent:v9 withInfo:v10];
}

- (void)handleDownloadConfigJobFinished:(id)a3 configError:(id)a4
{
  id v9 = a3;
  if (a4)
  {
    a4 = (id)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6107LL,  @"handleDownloadConfigJobFinished",  a4,  @"error while attempting to boost to user-initiated (performing auto-asset content download)"));
    id v6 = @"FailedUserInitiated";
  }

  else
  {
    id v6 = @"NowUserInitiated";
  }

  id v7 = -[MADAutoAssetJobParam initForFinishedJobID:withError:]( objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam),  "initForFinishedJobID:withError:",  v9,  a4);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  [v8 postEvent:v6 withInfo:v7];
}

- (void)handleDownloadAssetProgressForJob:(id)a3 withProgress:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = __66__MADAutoAssetJob_handleDownloadAssetProgressForJob_withProgress___block_invoke;
  v9[3] = &unk_34DB98;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, v9);
}

id __66__MADAutoAssetJob_handleDownloadAssetProgressForJob_withProgress___block_invoke(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) reportingProgress];
  if ((_DWORD)result) {
    return [*(id *)(a1 + 32) statusChangeDownloadProgress:*(void *)(a1 + 40)];
  }
  return result;
}

- (void)handleDownloadAssetJobFinished:(id)a3 downloadError:(id)a4
{
  id v9 = a3;
  if (a4)
  {
    a4 = (id)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6107LL,  @"handleDownloadAssetJobFinished",  a4,  @"error while downloading asset (performing auto-asset content download)"));
    id v6 = @"DownloadFailure";
  }

  else
  {
    id v6 = @"DownloadSuccess";
  }

  id v7 = -[MADAutoAssetJobParam initForFinishedJobID:withError:]( objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam),  "initForFinishedJobID:withError:",  v9,  a4);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  [v8 postEvent:v6 withInfo:v7];
}

- (void)exclusiveLookupForAssetTypeGranted:(id)a3
{
  id v5 = -[MADAutoAssetJobParam initWithSafeSummary:]( objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam),  "initWithSafeSummary:",  @"exclusiveLookupForAssetTypeGranted");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  [v4 postEvent:@"LookupGrantObtained" withInfo:v5];
}

- (void)persistedStateForDownloadJob:(id)a3
{
  id v5 = -[MADAutoAssetJobParam initWithSafeSummary:]( objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam),  "initWithSafeSummary:",  @"persistedStateForDownloadJob");
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  [v4 postEvent:@"PersistedAssigned" withInfo:v5];
}

- (void)startStagerDetermineIfAvailable:(id)a3 withAssetTargetBuildVersion:(id)a4 withAssetTargetTrainName:(id)a5 withAssetTargetRestoreVersion:(id)a6 withControlInformation:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v18 = -[MADAutoAssetJobParam initWithAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withControlInformation:]( objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam),  "initWithAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersio n:withControlInformation:",  v16,  v15,  v14,  v13,  v12);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  [v17 postEvent:@"StagerDetermineIfAvailable" withInfo:v18];
}

- (void)startStagerDownloadForStaging:(id)a3 withAssetTargetBuildVersion:(id)a4 withControlInformation:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = -[MADAutoAssetJobParam initWithAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersion:withControlInformation:]( objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam),  "initWithAssetTargetOSVersion:withAssetTargetBuildVersion:withAssetTargetTrainName:withAssetTargetRestoreVersio n:withControlInformation:",  v10,  v9,  0LL,  0LL,  v8);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  [v11 postEvent:@"StagerDownloadForStaging" withInfo:v12];
}

- (void)cancelAutoAssetJob
{
  id v4 = -[MADAutoAssetJobParam initWithSafeSummary:]( objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam),  "initWithSafeSummary:",  @"cancelAutoAssetJob");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  [v3 postEvent:@"CancelJob" withInfo:v4];
}

- (id)_summary
{
  v3 = objc_alloc(&OBJC_CLASS___NSString);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob jobCreationTriggeringLayer](self, "jobCreationTriggeringLayer"));
  if (v4)
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob jobCreationTriggeringLayer](self, "jobCreationTriggeringLayer"));
    id v6 = -[NSString initWithFormat:](v3, "initWithFormat:", @"triggeringLayer:%@", v5);
  }

  else
  {
    id v6 = -[NSString initWithFormat:](v3, "initWithFormat:", @"triggeringLayer:%@", @"N");
  }

  return v6;
}

- (id)_longSummary
{
  v141 = objc_alloc(&OBJC_CLASS___NSString);
  v3 = @"N";
  BOOL v159 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetInstance](self, "autoAssetInstance"));
  if (v159) {
    id v4 = @"Y";
  }
  else {
    id v4 = @"N";
  }
  v140 = v4;
  v158 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
  if (v158) {
    id v5 = @"Y";
  }
  else {
    id v5 = @"N";
  }
  v139 = v5;
  char v157 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetUUID](self, "autoAssetUUID"));
  if (v157) {
    id v6 = @"Y";
  }
  else {
    id v6 = @"N";
  }
  __int16 v138 = v6;
  v156 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
  if (v156) {
    id v7 = @"Y";
  }
  else {
    id v7 = @"N";
  }
  v137 = v7;
  v155 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob activeJobTasks](self, "activeJobTasks"));
  id v136 = [v155 count];
  int64_t v134 = -[MADAutoAssetJob clientRequestCount](self, "clientRequestCount");
  v154 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob stateTable](self, "stateTable"));
  if (v154) {
    id v8 = @"Y";
  }
  else {
    id v8 = @"N";
  }
  v133 = v8;
  unsigned __int8 v153 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  if (v153) {
    id v9 = @"Y";
  }
  else {
    id v9 = @"N";
  }
  v131 = v9;
  if (-[MADAutoAssetJob schedulerInvolved](self, "schedulerInvolved")) {
    id v10 = @"Y";
  }
  else {
    id v10 = @"N";
  }
  unsigned int v130 = v10;
  if (-[MADAutoAssetJob potentialNetworkFailure](self, "potentialNetworkFailure")) {
    v11 = @"Y";
  }
  else {
    v11 = @"N";
  }
  v129 = v11;
  if (-[MADAutoAssetJob beingCanceled](self, "beingCanceled")) {
    id v12 = @"Y";
  }
  else {
    id v12 = @"N";
  }
  v127 = v12;
  if (-[MADAutoAssetJob earlierSchedulerInvolved](self, "earlierSchedulerInvolved")) {
    id v13 = @"Y";
  }
  else {
    id v13 = @"N";
  }
  v126 = v13;
  if (-[MADAutoAssetJob earlierPotentialNetworkFailure](self, "earlierPotentialNetworkFailure")) {
    id v14 = @"Y";
  }
  else {
    id v14 = @"N";
  }
  v124 = v14;
  unsigned __int8 v152 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob bondedWithJob](self, "bondedWithJob"));
  if (v152) {
    id v15 = @"Y";
  }
  else {
    id v15 = @"N";
  }
  v122 = v15;
  v151 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob activeInstance](self, "activeInstance"));
  if (v151) {
    id v16 = @"Y";
  }
  else {
    id v16 = @"N";
  }
  v121 = v16;
  v150 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob activeDesire](self, "activeDesire"));
  if (v150) {
    v17 = @"Y";
  }
  else {
    v17 = @"N";
  }
  v120 = v17;
  v149 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDesire](self, "autoAssetSetDesire"));
  else {
    v18 = @"N";
  }
  v118 = v18;
  if (-[MADAutoAssetJob setCheckAwaitingDownload](self, "setCheckAwaitingDownload")) {
    v19 = @"Y";
  }
  else {
    v19 = @"N";
  }
  uint64_t v117 = v19;
  v148 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob activeFound](self, "activeFound"));
  if (v148) {
    v20 = @"Y";
  }
  else {
    v20 = @"N";
  }
  v115 = v20;
  v147 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob activeEnd](self, "activeEnd"));
  if (v147) {
    id v21 = @"Y";
  }
  else {
    id v21 = @"N";
  }
  v113 = v21;
  char v146 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob activeListen](self, "activeListen"));
  if (v146) {
    id v22 = @"Y";
  }
  else {
    id v22 = @"N";
  }
  v111 = v22;
  v145 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetJobInformation](self, "autoAssetJobInformation"));
  if (v145) {
    id v23 = @"Y";
  }
  else {
    id v23 = @"N";
  }
  v110 = v23;
  unsigned int v144 = -[MADAutoAssetJob aggregatedClientAssetPolicySpecified](self, "aggregatedClientAssetPolicySpecified");
  if (v144)
  {
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientAssetPolicy](self, "aggregatedClientAssetPolicy"));
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue([v64 summary]);
  }

  else
  {
    v24 = @"N";
  }

  if (-[MADAutoAssetJob clientRequestedOperation](self, "clientRequestedOperation")) {
    v25 = @"Y";
  }
  else {
    v25 = @"N";
  }
  v107 = v25;
  id v143 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob firstClientName](self, "firstClientName"));
  if (v143) {
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob firstClientName](self, "firstClientName"));
  }
  v26 = @"N";
  v135 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob jobCreationTriggeringLayer](self, "jobCreationTriggeringLayer"));
  if (v135) {
    v132 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob jobCreationTriggeringLayer](self, "jobCreationTriggeringLayer"));
  }
  else {
    v132 = @"N";
  }
  v128 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob onFilesystemByVersion](self, "onFilesystemByVersion"));
  id v105 = [v128 count];
  v125 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob checkUUIDBasePortion](self, "checkUUIDBasePortion"));
  if (v125) {
    v27 = @"Y";
  }
  else {
    v27 = @"N";
  }
  id v104 = v27;
  v123 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob checkUUID](self, "checkUUID"));
  if (v123) {
    v28 = @"Y";
  }
  else {
    v28 = @"N";
  }
  v103 = v28;
  if (-[MADAutoAssetJob holdingLookupGrant](self, "holdingLookupGrant")) {
    v29 = @"Y";
  }
  else {
    v29 = @"N";
  }
  v101 = v29;
  if (-[MADAutoAssetJob rampingForeground](self, "rampingForeground")) {
    v30 = @"Y";
  }
  else {
    v30 = @"N";
  }
  v100 = v30;
  if (-[MADAutoAssetJob rampingForegroundLatched](self, "rampingForegroundLatched")) {
    v31 = @"Y";
  }
  else {
    v31 = @"N";
  }
  v99 = v31;
  v119 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob catalogDownloadOptions](self, "catalogDownloadOptions"));
  if (v119) {
    v32 = @"Y";
  }
  else {
    v32 = @"N";
  }
  v98 = v32;
  v116 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob baseForPatch](self, "baseForPatch"));
  if (v116) {
    v33 = @"Y";
  }
  else {
    v33 = @"N";
  }
  v96 = v33;
  v114 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerPatch](self, "foundNewerPatch"));
  if (v114) {
    v34 = @"Y";
  }
  else {
    v34 = @"N";
  }
  v95 = v34;
  v112 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerFull](self, "foundNewerFull"));
  if (v112) {
    v35 = @"Y";
  }
  else {
    v35 = @"N";
  }
  v94 = v35;
  v109 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob newerFoundAssetDescriptor](self, "newerFoundAssetDescriptor"));
  if (v109) {
    v36 = @"Y";
  }
  else {
    v36 = @"N";
  }
  v93 = v36;
  v108 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
  if (v108) {
    v37 = @"Y";
  }
  else {
    v37 = @"N";
  }
  v92 = v37;
  if (-[MADAutoAssetJob schedulerTriggerReceived](self, "schedulerTriggerReceived")) {
    v38 = @"Y";
  }
  else {
    v38 = @"N";
  }
  v91 = v38;
  if (-[MADAutoAssetJob haveReceivedLookupResponse](self, "haveReceivedLookupResponse")) {
    v39 = @"Y";
  }
  else {
    v39 = @"N";
  }
  v89 = v39;
  if (-[MADAutoAssetJob vendingAtomicInstanceForConfiguredEntries](self, "vendingAtomicInstanceForConfiguredEntries")) {
    v40 = @"Y";
  }
  else {
    v40 = @"N";
  }
  v88 = v40;
  if (-[MADAutoAssetJob downloadingUserInitiated](self, "downloadingUserInitiated")) {
    v41 = @"Y";
  }
  else {
    v41 = @"N";
  }
  v87 = v41;
  if (-[MADAutoAssetJob boostedToUserInitiated](self, "boostedToUserInitiated")) {
    v42 = @"Y";
  }
  else {
    v42 = @"N";
  }
  uint64_t v86 = v42;
  if (-[MADAutoAssetJob checkingAssetContent](self, "checkingAssetContent")) {
    v43 = @"Y";
  }
  else {
    v43 = @"N";
  }
  v85 = v43;
  if (-[MADAutoAssetJob determiningAssetContent](self, "determiningAssetContent")) {
    v44 = @"Y";
  }
  else {
    v44 = @"N";
  }
  v83 = v44;
  if (-[MADAutoAssetJob lockingAssetContent](self, "lockingAssetContent")) {
    v45 = @"Y";
  }
  else {
    v45 = @"N";
  }
  uint64_t v80 = v45;
  if (-[MADAutoAssetJob wasPatched](self, "wasPatched")) {
    v46 = @"Y";
  }
  else {
    v46 = @"N";
  }
  v82 = v46;
  v106 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob latestInstalledAssetVersion](self, "latestInstalledAssetVersion"));
  if (v106) {
    v26 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob latestInstalledAssetVersion](self, "latestInstalledAssetVersion"));
  }
  v47 = @"N";
  v102 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob latestInstalledAssetBuild](self, "latestInstalledAssetBuild"));
  if (v102) {
    id v48 = (const __CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob latestInstalledAssetBuild](self, "latestInstalledAssetBuild"));
  }
  else {
    id v48 = @"N";
  }
  uint64_t v49 = objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
  if (v49
    || (uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"))) != 0LL)
  {
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
    if (v67) {
      BOOL v50 = @"Y";
    }
    else {
      BOOL v50 = @"N";
    }
    v75 = v50;
    int v90 = 1;
  }

  else
  {
    uint64_t v63 = 0LL;
    int v90 = 0;
    v75 = @"N";
  }

  unsigned __int8 v160 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob progressReportPhaseName](self, "progressReportPhaseName"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob lastReportedPatchProgress](self, "lastReportedPatchProgress"));
  if (v84) {
    v51 = @"Y";
  }
  else {
    v51 = @"N";
  }
  v74 = v51;
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob resultSelector](self, "resultSelector"));
  if (v81) {
    v52 = @"Y";
  }
  else {
    v52 = @"N";
  }
  v73 = v52;
  v79 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob resultInstance](self, "resultInstance"));
  if (v79) {
    v53 = @"Y";
  }
  else {
    v53 = @"N";
  }
  v72 = v53;
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob resultFound](self, "resultFound"));
  if (v78) {
    v54 = @"Y";
  }
  else {
    v54 = @"N";
  }
  v71 = v54;
  v77 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob resultEnd](self, "resultEnd"));
  if (v77) {
    uint64_t v55 = @"Y";
  }
  else {
    uint64_t v55 = @"N";
  }
  v69 = v55;
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob resultListen](self, "resultListen"));
  if (v76) {
    v56 = @"Y";
  }
  else {
    v56 = @"N";
  }
  v70 = v56;
  uint64_t v68 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientSetPolicy](self, "aggregatedClientSetPolicy"));
  v97 = (void *)v49;
  if (v68)
  {
    uint64_t v66 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientSetPolicy](self, "aggregatedClientSetPolicy"));
    v47 = (__CFString *)objc_claimAutoreleasedReturnValue([v66 summary]);
  }

  uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assignedSetDescriptor](self, "assignedSetDescriptor"));
  v58 = (__CFString *)v48;
  if (v57)
  {
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assignedSetDescriptor](self, "assignedSetDescriptor"));
    v59 = (__CFString *)[v65 newIdentityName];
  }

  else
  {
    v59 = @"N";
  }

  int64_t v60 = -[MADAutoAssetJob nextSetSpecifierToDownload](self, "nextSetSpecifierToDownload");
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob resultSetFound](self, "resultSetFound"));
  v142 = -[NSString initWithFormat:]( v141,  "initWithFormat:",  @"[overall]instance:%@,selector:%@,UUID:%@,logger:%@,tasks:%lu,requests:%ld,table:%@,FSM:%@,sched:%@,NWFail:%@|beingCancled:%@|[earlier]sched:%@,NWFail:%@|bonded:%@|[active]instance:%@,desire:%@(awaitDownload:%@,checkAwait:%@),found:%@,end:%@,listen:%@,jobInfo:%@|[aggregated]policy:%@,clientRequested:%@|firstClientName:%@,triggeringLayer:%@|onFilesystemByVersion:%ld|[check]Base:%@,UUID:%@,lookupGrant:%@,rampFG:%@,rampLatch:%@,options:%@|[asset]base:%@,patch:%@,full:%@,newer:%@,downloading:%@,scheduler:%@,lookupRsp:%@(forConfig:%@),user:%@,boosting:%@,checking:%@,determining:%@,locking:%@,patched:%@|[installed]:version:%@,build:%@|[status]current:%@,progress:%@,lastPatch:%@|[results]selector:%@,instance:%@,found:%@,end:%@,listen:%@,[set]aggregatedPolicy:%@,descriptor:%@,next:%ld,found:%@",  v140,  v139,  v138,  v137,  v136,  v134,  v133,  v131,  v130,  v129,  v127,  v126,  v124,  v122,  v121,  v120,  v118,  v117,  v115,  v113,  v111,  v110,  v24,  v107,  v3,  v132,  v105,  v104,  v103,  v101,  v100,  v99,  v98,  v96,  v95,  v94,  v93,  v92,  v91,  v89,  v88,  v87,  v86,  v85,  v83,  v80,
           v82,
           v26,
           v58,
           v75,
           v160,
           v74,
           v73,
           v72,
           v71,
           v69,
           v70,
           v47,
           v59,
           v60);

  if (v57)
  {
  }

  if (v68)
  {
  }

  if (v90) {
  if (!v97)
  }

  if (v102) {
  if (v106)
  }

  if (v135) {
  if (v143)
  }

  if (v144)
  {
  }

  return v142;
}

- (id)_updateLatestSummary
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 extendedStateQueue]);
  dispatch_assert_queue_V2(v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob _summary](self, "_summary"));
  -[MADAutoAssetJob setLatestSafeSummary:](self, "setLatestSafeSummary:", v5);

  if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    id v6 = objc_alloc(&OBJC_CLASS___MANAutoAssetSetSummary);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob clientDomainName](self, "clientDomainName"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetIdentifier](self, "autoAssetSetIdentifier"));
    id v9 = (MAAutoAssetSummary *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
    id v10 = -[MANAutoAssetSetSummary initWithDomainName:forAssetSetIdentifier:withAssetSetRepresentation:withSetJobStatus:withScheduledIntervalSecs:withScheduledRemainingSecs:withPushDelaySecs:withActiveClientCount:withActiveMonitorCount:withMaximumClientCount:withTotalClientCount:]( v6,  "initWithDomainName:forAssetSetIdentifier:withAssetSetRepresentation:withSetJobStatus:withScheduledIntervalSe cs:withScheduledRemainingSecs:withPushDelaySecs:withActiveClientCount:withActiveMonitorCount:withMaximumClie ntCount:withTotalClientCount:",  v7,  v8,  0LL,  v9,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
    -[MADAutoAssetJob setLatestAutoAssetSetSummary:](self, "setLatestAutoAssetSetSummary:", v10);
  }

  else
  {
    v11 = objc_alloc(&OBJC_CLASS___MAAutoAssetSummary);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob mostSpecificSelectorToReport](self, "mostSpecificSelectorToReport"));
    BOOL v12 = -[MADAutoAssetJob wasPatched](self, "wasPatched");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
    id v9 = -[MAAutoAssetSummary initWithAssetSelector:withAssetRepresentation:withAssetWasPatched:withAssetIsStaged:withJobStatus:withScheduledIntervalSecs:withScheduledRemainingSecs:withPushDelaySecs:withActiveClientCount:withActiveMonitorCount:withMaximumClientCount:withTotalClientCount:]( v11,  "initWithAssetSelector:withAssetRepresentation:withAssetWasPatched:withAssetIsStaged:withJobStatus:withSchedul edIntervalSecs:withScheduledRemainingSecs:withPushDelaySecs:withActiveClientCount:withActiveMonitorCount:with MaximumClientCount:withTotalClientCount:",  v7,  0LL,  v12,  0LL,  v8,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
    -[MADAutoAssetJob setLatestAutoAssetSummary:](self, "setLatestAutoAssetSummary:", v9);
  }

  return -[MADAutoAssetJob latestSafeSummary](self, "latestSafeSummary");
}

- (id)clientName
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob activeInstance](self, "activeInstance"));

  if (v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob activeInstance](self, "activeInstance"));
  }

  else
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetInstance](self, "autoAssetInstance"));

    if (!v5)
    {
      id v7 = @"auto-asset-client";
      return v7;
    }

    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetInstance](self, "autoAssetInstance"));
  }

  id v6 = v4;
  id v7 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 autoAssetClientName]);

  return v7;
}

- (int64_t)action_AddTaskDecideFilesystem:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 clientRequest]);
  -[MADAutoAssetJob _rememberIfSchedulerInvolved:](self, "_rememberIfSchedulerInvolved:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 clientRequest]);
  -[MADAutoAssetJob _setPolicyFromClientRequest:](self, "_setPolicyFromClientRequest:", v9);

  -[MADAutoAssetJob addToActiveJobTasks:](self, "addToActiveJobTasks:", v5);
  -[MADAutoAssetJob checkFilesystemAndDecidePurgeOrLookup](self, "checkFilesystemAndDecidePurgeOrLookup");
  return 0LL;
}

- (int64_t)action_AddTaskSchedulerDecideFilesystem:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[MADAutoAssetJob setSchedulerInvolved:](self, "setSchedulerInvolved:", 1LL);
  -[MADAutoAssetJob setSetCheckAwaitingDownload:](self, "setSetCheckAwaitingDownload:", 1LL);
  -[MADAutoAssetJob addToActiveJobTasks:](self, "addToActiveJobTasks:", v5);

  if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob")) {
    -[MADAutoAssetJob clearSetStatusStartingSetJob](self, "clearSetStatusStartingSetJob");
  }
  -[MADAutoAssetJob checkFilesystemAndDecidePurgeOrLookup](self, "checkFilesystemAndDecidePurgeOrLookup");
  return 0LL;
}

- (int64_t)action_AddTaskCheckDecideFilesystem:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 clientRequest]);
  -[MADAutoAssetJob _rememberIfSchedulerInvolved:](self, "_rememberIfSchedulerInvolved:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 clientRequest]);
  -[MADAutoAssetJob _setPolicyFromClientRequest:](self, "_setPolicyFromClientRequest:", v9);

  -[MADAutoAssetJob addToActiveJobTasks:](self, "addToActiveJobTasks:", v5);
  -[MADAutoAssetJob setCheckingAssetContent:](self, "setCheckingAssetContent:", 1LL);
  -[MADAutoAssetJob checkFilesystemAndDecidePurgeOrLookup](self, "checkFilesystemAndDecidePurgeOrLookup");
  return 0LL;
}

- (int64_t)action_AddTaskDetermineDecideFilesystem:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[MADAutoAssetJob addToActiveJobTasks:](self, "addToActiveJobTasks:", v5);
  -[MADAutoAssetJob setDeterminingAssetContent:](self, "setDeterminingAssetContent:", 1LL);
  -[MADAutoAssetJob checkFilesystemAndDecidePurgeOrLookup](self, "checkFilesystemAndDecidePurgeOrLookup");
  return 0LL;
}

- (int64_t)action_AddTaskInterestDecideFilesystem:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 clientRequest]);
  -[MADAutoAssetJob _rememberIfSchedulerInvolved:](self, "_rememberIfSchedulerInvolved:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 clientRequest]);
  -[MADAutoAssetJob _setPolicyFromClientRequest:](self, "_setPolicyFromClientRequest:", v9);

  -[MADAutoAssetJob addToActiveJobTasks:](self, "addToActiveJobTasks:", v5);
  -[MADAutoAssetJob replyToClientForJobParam:withResponseError:]( self,  "replyToClientForJobParam:withResponseError:",  v5,  0LL);

  -[MADAutoAssetJob checkFilesystemAndDecidePurgeOrLookup](self, "checkFilesystemAndDecidePurgeOrLookup");
  return 0LL;
}

- (int64_t)action_AddTaskLockDecideFilesystem:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 clientRequest]);
  -[MADAutoAssetJob _rememberIfSchedulerInvolved:](self, "_rememberIfSchedulerInvolved:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 clientRequest]);
  -[MADAutoAssetJob _setPolicyFromClientRequest:](self, "_setPolicyFromClientRequest:", v9);

  -[MADAutoAssetJob addToActiveJobTasks:](self, "addToActiveJobTasks:", v5);
  -[MADAutoAssetJob setLockingAssetContent:](self, "setLockingAssetContent:", 1LL);
  -[MADAutoAssetJob checkFilesystemAndDecidePurgeOrLookup](self, "checkFilesystemAndDecidePurgeOrLookup");
  return 0LL;
}

- (int64_t)action_RequestLookupGrant:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[MADAutoAssetJob obtainLookupGrant](self, "obtainLookupGrant");
  return 0LL;
}

- (int64_t)action_DownloadCatalog:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[MADAutoAssetJob setHoldingLookupGrant:](self, "setHoldingLookupGrant:", 1LL);
  -[MADAutoAssetJob downloadCatalog:](self, "downloadCatalog:", @"DownloadCatalog");
  return 0LL;
}

- (int64_t)action_StagerDetermineDecideFilesystem:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[MADAutoAssetJob simulateSet:](self, "simulateSet:", v5);
  if (!-[MADAutoAssetJob stagerJob](self, "stagerJob"))
  {
    -[MADAutoAssetJob trackAnomaly:forReason:]( self,  "trackAnomaly:forReason:",  6108LL,  @"{StagerDetermineDecideFilesystem} triggered to start a stager-job when job not created as a stager-job");
    -[MADAutoAssetJob setStagerJob:](self, "setStagerJob:", 1LL);
  }

  -[MADAutoAssetJob setStagerJobDownloadContent:](self, "setStagerJobDownloadContent:", 0LL);
  -[MADAutoAssetJob setStagerJobResultsReported:](self, "setStagerJobResultsReported:", 0LL);
  -[MADAutoAssetJob setDeterminingAssetContent:](self, "setDeterminingAssetContent:", 1LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 assetTargetOSVersion]);
  -[MADAutoAssetJob setStagerAssetTargetOSVersion:](self, "setStagerAssetTargetOSVersion:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 assetTargetBuildVersion]);
  -[MADAutoAssetJob setStagerAssetTargetBuildVersion:](self, "setStagerAssetTargetBuildVersion:", v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 assetTargetTrainName]);
  -[MADAutoAssetJob setStagerAssetTargetTrainName:](self, "setStagerAssetTargetTrainName:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue([v5 assetTargetRestoreVersion]);
  -[MADAutoAssetJob setStagerAssetTargetRestoreVersion:](self, "setStagerAssetTargetRestoreVersion:", v11);

  -[MADAutoAssetJob setStagerJobAutoAssetCatalog:](self, "setStagerJobAutoAssetCatalog:", 0LL);
  -[MADAutoAssetJob checkFilesystemAndDecidePurgeOrLookup](self, "checkFilesystemAndDecidePurgeOrLookup");

  return 0LL;
}

- (int64_t)action_StagerDownloadDecideFilesystem:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[MADAutoAssetJob simulateSet:](self, "simulateSet:", v5);
  if (!-[MADAutoAssetJob stagerJob](self, "stagerJob"))
  {
    -[MADAutoAssetJob trackAnomaly:forReason:]( self,  "trackAnomaly:forReason:",  6108LL,  @"{StagerDownloadDecideFilesystem} triggered to start a stager-job when job not created as a stager-job");
    -[MADAutoAssetJob setStagerJob:](self, "setStagerJob:", 1LL);
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob checkUUID](self, "checkUUID"));

  if (!v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetUUID](self, "autoAssetUUID"));
    -[MADAutoAssetJob setCheckUUID:](self, "setCheckUUID:", v9);
  }

  -[MADAutoAssetJob setStagerJobDownloadContent:](self, "setStagerJobDownloadContent:", 1LL);
  -[MADAutoAssetJob setStagerJobResultsReported:](self, "setStagerJobResultsReported:", 0LL);
  -[MADAutoAssetJob setCheckingAssetContent:](self, "setCheckingAssetContent:", 1LL);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v5 assetTargetOSVersion]);
  -[MADAutoAssetJob setStagerAssetTargetOSVersion:](self, "setStagerAssetTargetOSVersion:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue([v5 assetTargetBuildVersion]);
  -[MADAutoAssetJob setStagerAssetTargetBuildVersion:](self, "setStagerAssetTargetBuildVersion:", v11);

  -[MADAutoAssetJob setStagerAssetTargetTrainName:](self, "setStagerAssetTargetTrainName:", 0LL);
  -[MADAutoAssetJob setStagerAssetTargetRestoreVersion:](self, "setStagerAssetTargetRestoreVersion:", 0LL);
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob cachedAutoAssetCatalog](self, "cachedAutoAssetCatalog"));
  -[MADAutoAssetJob setStagerJobAutoAssetCatalog:](self, "setStagerJobAutoAssetCatalog:", v12);

  -[MADAutoAssetJob setBoostedToUserInitiated:](self, "setBoostedToUserInitiated:", 1LL);
  id v13 =  -[MADAutoAssetJob refreshOnFilesystemFromManagerPromotingIfStaged:]( self,  "refreshOnFilesystemFromManagerPromotingIfStaged:",  0LL);
  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 assetVersion]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetJob installedOnFilesystemWithVersion:fromLocation:]( self,  "installedOnFilesystemWithVersion:fromLocation:",  v15,  @"StagerDownloadDecideFilesystem"));

  if (v16)
  {
    -[MADAutoAssetJob updateResultPropertiesWithDescriptor:](self, "updateResultPropertiesWithDescriptor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
    v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 oslog]);

    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
      int v35 = 138543618;
      v36 = v19;
      __int16 v37 = 2114;
      v38 = v16;
      _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {StagerDownloadDecideFilesystem} found already downloaded (on filesystem) asset %{public}@",  (uint8_t *)&v35,  0x16u);
    }

    v20 = @"AlreadyDownloaded";
    goto LABEL_9;
  }

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob stagerJobAutoAssetCatalog](self, "stagerJobAutoAssetCatalog"));

  if (!v26)
  {
    v20 = @"PerformLookup";
LABEL_9:
    id v21 = objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob _updateLatestSummary](self, "_updateLatestSummary"));
    id v23 = -[MADAutoAssetJobParam initWithSafeSummary:](v21, "initWithSafeSummary:", v22);

    goto LABEL_10;
  }

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob stagerJobAutoAssetCatalog](self, "stagerJobAutoAssetCatalog"));
  -[MADAutoAssetJob adoptCachedLookupResult:](self, "adoptCachedLookupResult:", v27);

  v28 = objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetUUID](self, "autoAssetUUID"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob stagerJobAutoAssetCatalog](self, "stagerJobAutoAssetCatalog"));
  id v23 = -[MADAutoAssetJobParam initForFinishedJobID:withCatalog:whereCatalogFromLookupCache:withError:]( v28,  "initForFinishedJobID:withCatalog:whereCatalogFromLookupCache:withError:",  v29,  v30,  1LL,  0LL);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
  v32 = (os_log_s *)objc_claimAutoreleasedReturnValue([v31 oslog]);

  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJobParam summary](v23, "summary"));
    int v35 = 138543618;
    v36 = v33;
    __int16 v37 = 2114;
    v38 = v34;
    _os_log_impl( &dword_0,  v32,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {StagerDownloadDecideFilesystem} using cached lookup result for asset-selector | followupParam:%{public}@",  (uint8_t *)&v35,  0x16u);
  }

  v20 = @"FoundCachedLookupResult";
  if (!v23) {
    goto LABEL_9;
  }
LABEL_10:
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  [v24 followupEvent:v20 withInfo:v23];

  return 0LL;
}

- (int64_t)action_DecideStartupDownloading:(id)a3 error:(id *)a4
{
  id v75 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  if (!-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    -[MADAutoAssetJob simulateSet:](self, "simulateSet:", v75);
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v75 autoAssetDescriptor]);
    if (!v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 oslog]);

      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[MADAutoAssetJob action_DecideStartupDownloading:error:].cold.2();
      }

      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
      if (!v10)
      {
        uint64_t v49 = @"CannotProceed";
LABEL_31:
        v62 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
        [v62 followupEvent:v49 withInfo:v75];

        goto LABEL_32;
      }

      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
      BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 oslog]);

      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v7 summary]);
        *(_DWORD *)buf = 138543618;
        v77 = v13;
        __int16 v78 = 2114;
        v79 = v14;
        _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@ {DecideStartupDownloading} | able to deduce in-flight descriptor from params provided on auto-asset -job init | inFlightDescriptor:%{public}@",  buf,  0x16u);
      }
    }

    unsigned int v15 = [v7 isPatch];
    unsigned int v16 = [v7 downloadUserInitiated];
    v17 = @"DownloadAutoPatch";
    if (v16) {
      v17 = @"DownloadUserPatch";
    }
    v18 = @"DownloadUserFull";
    if (!v16) {
      v18 = @"DownloadAutoFull";
    }
    if (!v15) {
      v17 = v18;
    }
    v73 = v17;
    -[MADAutoAssetJob setReportingProgress:](self, "setReportingProgress:", 1LL);
    v19 = (void *)objc_claimAutoreleasedReturnValue([v7 assetVersion]);

    v20 = objc_alloc(&OBJC_CLASS___MAAutoAssetSelector);
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v7 assetType]);
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v7 assetSpecifier]);
    if (v19)
    {
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v7 assetVersion]);
      id v72 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:]( v20,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:",  v21,  v22,  v23);
    }

    else
    {
      id v72 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:]( v20,  "initForAssetType:withAssetSpecifier:",  v21,  v22);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue([v7 assetType]);
    v25 = (void *)objc_claimAutoreleasedReturnValue([v7 assetId]);
    id AutoLocalUrlFromTypeAndIdWithPurpose = getAutoLocalUrlFromTypeAndIdWithPurpose(v24, v25, 2LL, @"auto");
    v71 = (void *)objc_claimAutoreleasedReturnValue(AutoLocalUrlFromTypeAndIdWithPurpose);

    v27 = objc_alloc_init(&OBJC_CLASS___MAAutoAssetNotifications);
    -[MAAutoAssetNotifications setNewerVersionDiscovered:](v27, "setNewerVersionDiscovered:", 1LL);
    -[MAAutoAssetNotifications setDownloadPending:](v27, "setDownloadPending:", 1LL);
    v28 = objc_alloc(&OBJC_CLASS___MAAutoAssetStatus);
    char v29 = objc_opt_respondsToSelector( v28,  "initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withNeverBe enLocked:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemB ytes:withDownloadedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttemp ted:withStagedPriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withA vailableForUseError:withPatchingAttemptError:withNewerVersionError:");

    v30 = objc_alloc(&OBJC_CLASS___MAAutoAssetStatus);
    v31 = v30;
    v74 = v27;
    if ((v29 & 1) != 0)
    {
      uint64_t v69 = objc_claimAutoreleasedReturnValue([v7 metadata]);
      v32 = (void *)objc_claimAutoreleasedReturnValue([v7 metadata]);
      unsigned int v68 = -[MADAutoAssetJob downloadingUserInitiated](self, "downloadingUserInitiated");
      unsigned __int8 v33 = [v7 patchingAttempted];
      unsigned __int8 v34 = [v7 stagedPriorToAvailable];
      int v35 = (void *)objc_claimAutoreleasedReturnValue([v7 stagedFromOSVersion]);
      v36 = (void *)objc_claimAutoreleasedReturnValue([v7 stagedFromBuildVersion]);
      __int16 v37 = (void *)objc_claimAutoreleasedReturnValue([v7 patchingAttemptError]);
      BYTE1(v67) = v34;
      LOBYTE(v67) = v33;
      LOBYTE(v65) = 0;
      v38 = v72;
      v39 = -[MAAutoAssetStatus initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withNeverBeenLocked:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withDownloadedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttempted:withStagedPriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withAvailableForUseError:withPatchingAttemptError:withNewerVersionError:]( v31,  "initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withNever BeenLocked:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesys temBytes:withDownloadedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatching Attempted:withStagedPriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsa ge:withAvailableForUseError:withPatchingAttemptError:withNewerVersionError:",  v72,  v27,  v69,  v32,  1LL,  v68,  0LL,  -1LL,  -1LL,  v65,  0LL,  -1LL,  v67,  v35,  v36,  0LL,  0LL,  v37,  0LL);

      v40 = (os_log_s *)v69;
    }

    else
    {
      char v41 = objc_opt_respondsToSelector( v30,  "initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withDownl oadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withDownloa dedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttempted:withStaged PriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withAvailableForU seError:withPatchingAttemptError:withNewerVersionError:");

      if ((v41 & 1) == 0)
      {
        BOOL v50 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
        v40 = (os_log_s *)objc_claimAutoreleasedReturnValue([v50 oslog]);

        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          -[MADAutoAssetJob action_DecideStartupDownloading:error:].cold.1();
        }
        v39 = 0LL;
        v38 = v72;
        uint64_t v49 = v73;
        goto LABEL_27;
      }

      v70 = objc_alloc(&OBJC_CLASS___MAAutoAssetStatus);
      v40 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 metadata]);
      v42 = (void *)objc_claimAutoreleasedReturnValue([v7 metadata]);
      BOOL v43 = -[MADAutoAssetJob downloadingUserInitiated](self, "downloadingUserInitiated");
      unsigned __int8 v44 = [v7 patchingAttempted];
      unsigned __int8 v45 = [v7 stagedPriorToAvailable];
      v46 = (void *)objc_claimAutoreleasedReturnValue([v7 stagedFromOSVersion]);
      v47 = (void *)objc_claimAutoreleasedReturnValue([v7 stagedFromBuildVersion]);
      id v48 = (void *)objc_claimAutoreleasedReturnValue([v7 patchingAttemptError]);
      BYTE1(v66) = v45;
      LOBYTE(v66) = v44;
      LOBYTE(v64) = 0;
      v39 = -[MAAutoAssetStatus initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withDownloadedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttempted:withStagedPriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withAvailableForUseError:withPatchingAttemptError:withNewerVersionError:]( v70,  "initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withDownl oadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withDownloa dedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttempted:withStaged PriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withAvailableForU seError:withPatchingAttemptError:withNewerVersionError:",  v72,  v74,  v40,  v42,  v43,  0LL,  -1LL,  -1LL,  v64,  0LL,  -1LL,  v66,  v46,  v47,  0LL,  0LL,  v48,  0LL);

      v38 = v72;
    }

    uint64_t v49 = v73;
LABEL_27:

    v51 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    v52 = -[NSUUID initWithUUIDString:]( objc_alloc(&OBJC_CLASS___NSUUID),  "initWithUUIDString:",  @"AAAAAAAA-BBBB-CCCC-DDDDD-EEEEEEEEEEEE");
    id v53 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v51,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  @"client-name (previously-in-flight)",  @"client-process-name (previously-in-flight)",  1LL,  v38,  v52);
    -[MADAutoAssetJob setAutoAssetInstance:](self, "setAutoAssetInstance:", v53);

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetInstance](self, "autoAssetInstance"));
    -[MADAutoAssetJob setActiveInstance:](self, "setActiveInstance:", v54);

    uint64_t v55 = -[MAAutoAssetInfoDesire initWithDesiredCategory:forClientAssetPolicy:reasonDesired:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:]( objc_alloc(&OBJC_CLASS___MAAutoAssetInfoDesire),  "initWithDesiredCategory:forClientAssetPolicy:reasonDesired:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:",  0LL,  0LL,  0LL,  -2LL,  -2LL,  0LL);
    -[MADAutoAssetJob setActiveDesire:](self, "setActiveDesire:", v55);

    v56 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoFound);
    uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue([v7 metadata]);
    id v58 = -[MAAutoAssetInfoFound initForSelector:withLocalContentURL:withAssetAttributes:reportingStatus:]( v56,  "initForSelector:withLocalContentURL:withAssetAttributes:reportingStatus:",  v38,  v71,  v57,  v39);
    -[MADAutoAssetJob setActiveFound:](self, "setActiveFound:", v58);

    v59 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetUUID](self, "autoAssetUUID"));
    -[MADAutoAssetJob setCheckUUIDBasePortion:](self, "setCheckUUIDBasePortion:", v59);

    int64_t v60 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetUUID](self, "autoAssetUUID"));
    -[MADAutoAssetJob setCheckUUID:](self, "setCheckUUID:", v60);

    id v61 = -[MADAutoAssetJob newAssetDownloadOptions](self, "newAssetDownloadOptions");
    -[MADAutoAssetJob setAssetDownloadOptions:](self, "setAssetDownloadOptions:", v61);

    else {
      -[MADAutoAssetJob setFoundNewerFull:](self, "setFoundNewerFull:", v7);
    }
    -[MADAutoAssetJob setNewerFoundAssetDescriptor:](self, "setNewerFoundAssetDescriptor:", v7);
    -[MADAutoAssetJob setDownloadingAssetDescriptor:](self, "setDownloadingAssetDescriptor:", v7);
    -[MADAutoAssetJob setCurrentStatus:](self, "setCurrentStatus:", v39);
    -[MADAutoAssetJob setProgressReportPhase:](self, "setProgressReportPhase:", 0LL);

    goto LABEL_31;
  }

  -[MADAutoAssetJob statusChange:catalogAnomaly:forReason:]( self,  "statusChange:catalogAnomaly:forReason:",  @"DecideStartupDownloading",  6103LL,  @"action DecideStartupDownloading requires set-job specific logic");
LABEL_32:

  return 0LL;
}

- (int64_t)action_DecideDonePurging:(id)a3 error:(id *)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 extendedStateQueue]);
  dispatch_assert_queue_V2(v5);

  return 0LL;
}

- (int64_t)action_AddTaskScheduler:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[MADAutoAssetJob setSchedulerInvolved:](self, "setSchedulerInvolved:", 1LL);
  -[MADAutoAssetJob addToActiveJobTasks:](self, "addToActiveJobTasks:", v5);

  return 0LL;
}

- (int64_t)action_MergeNeeds:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[MADAutoAssetJob addClientRequestAndMergeNeeds:forJobEvent:]( self,  "addClientRequestAndMergeNeeds:forJobEvent:",  @"MergeNeeds",  v5);
  return 0LL;
}

- (int64_t)action_MergeNeedsDecideLookup:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[MADAutoAssetJob addClientRequestAndMergeNeeds:forJobEvent:]( self,  "addClientRequestAndMergeNeeds:forJobEvent:",  @"MergeNeedsDecideLookup",  v5);
  -[MADAutoAssetJob replyToJobsWhenCatalogDownloaded:discoveredNewer:]( self,  "replyToJobsWhenCatalogDownloaded:discoveredNewer:",  @"MergeNeedsDecideLookup",  1LL);
  return 0LL;
}

- (int64_t)action_MergeNeedsDecideBoost:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[MADAutoAssetJob addClientRequestAndMergeNeeds:forJobEvent:]( self,  "addClientRequestAndMergeNeeds:forJobEvent:",  @"MergeNeedsDecideBoost",  v5);
  -[MADAutoAssetJob replyToJobsWhenCatalogDownloaded:discoveredNewer:]( self,  "replyToJobsWhenCatalogDownloaded:discoveredNewer:",  @"MergeNeedsDecideBoost",  1LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetJob decideFollowupBoost:forJobEvent:boostEvent:noBoostEvent:]( self,  "decideFollowupBoost:forJobEvent:boostEvent:noBoostEvent:",  @"MergeNeedsDecideBoost",  v5,  @"BoostToUserInitiated",  0LL));
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
    [v9 followupEvent:v8 withInfo:v5];
  }

  return 0LL;
}

- (int64_t)action_MergeNeedsDecideLookupBoost:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[MADAutoAssetJob addClientRequestAndMergeNeeds:forJobEvent:]( self,  "addClientRequestAndMergeNeeds:forJobEvent:",  @"MergeNeedsDecideLookupBoost",  v5);
  -[MADAutoAssetJob replyToJobsWhenCatalogDownloaded:discoveredNewer:]( self,  "replyToJobsWhenCatalogDownloaded:discoveredNewer:",  @"MergeNeedsDecideLookupBoost",  1LL);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetJob decideFollowupBoost:forJobEvent:boostEvent:noBoostEvent:]( self,  "decideFollowupBoost:forJobEvent:boostEvent:noBoostEvent:",  @"MergeNeedsDecideLookupBoost",  v5,  @"BoostToUserInitiated",  0LL));
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
    [v9 followupEvent:v8 withInfo:v5];
  }

  return 0LL;
}

- (int64_t)action_MergeAddLock:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[MADAutoAssetJob addClientRequestAndMergeNeeds:forJobEvent:]( self,  "addClientRequestAndMergeNeeds:forJobEvent:",  @"MergeAddLock",  v5);
  return 0LL;
}

- (int64_t)action_MergeContinueLock:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[MADAutoAssetJob addClientRequestAndMergeNeeds:forJobEvent:]( self,  "addClientRequestAndMergeNeeds:forJobEvent:",  @"MergeContinueLock",  v5);
  return 0LL;
}

- (int64_t)action_MergeRemoveLock:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[MADAutoAssetJob addClientRequestAndMergeNeeds:forJobEvent:]( self,  "addClientRequestAndMergeNeeds:forJobEvent:",  @"MergeRemoveLock",  v5);
  return 0LL;
}

- (int64_t)action_MergeRemoveLockDecideInterest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[MADAutoAssetJob addClientRequestAndMergeNeeds:forJobEvent:]( self,  "addClientRequestAndMergeNeeds:forJobEvent:",  @"MergeRemoveLockDecideInterest",  v5);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  [v8 followupEvent:@"HaveInterest" withInfo:v5];

  return 0LL;
}

- (int64_t)action_MergeAddLockDecideBoost:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[MADAutoAssetJob addClientRequestAndMergeNeeds:forJobEvent:]( self,  "addClientRequestAndMergeNeeds:forJobEvent:",  @"MergeAddLockDecideBoost",  v5);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetJob decideFollowupBoost:forJobEvent:boostEvent:noBoostEvent:]( self,  "decideFollowupBoost:forJobEvent:boostEvent:noBoostEvent:",  @"MergeAddLockDecideBoost",  v5,  @"BoostToUserInitiated",  0LL));
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
    [v9 followupEvent:v8 withInfo:v5];
  }

  return 0LL;
}

- (int64_t)action_MergeContinueLockDecideBoost:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[MADAutoAssetJob addClientRequestAndMergeNeeds:forJobEvent:]( self,  "addClientRequestAndMergeNeeds:forJobEvent:",  @"MergeContinueLockDecideBoost",  v5);
  id v8 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetJob decideFollowupBoost:forJobEvent:boostEvent:noBoostEvent:]( self,  "decideFollowupBoost:forJobEvent:boostEvent:noBoostEvent:",  @"MergeContinueLockDecideBoost",  v5,  @"BoostToUserInitiated",  0LL));
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
    [v9 followupEvent:v8 withInfo:v5];
  }

  return 0LL;
}

- (int64_t)action_AdoptRegister:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[MADAutoAssetJob addClientRequestAndMergeNeeds:forJobEvent:]( self,  "addClientRequestAndMergeNeeds:forJobEvent:",  @"AdoptRegister",  v5);
  return 0LL;
}

- (int64_t)action_RemoveClient:(id)a3 error:(id *)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 extendedStateQueue]);
  dispatch_assert_queue_V2(v5);

  return 0LL;
}

- (int64_t)action_RemoveClientDecideInterest:(id)a3 error:(id *)a4
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 extendedStateQueue]);
  dispatch_assert_queue_V2(v5);

  return 0LL;
}

- (int64_t)action_ReportCatalogDecideFound:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[MADAutoAssetJob releaseLookupGrant](self, "releaseLookupGrant");
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 autoAssetCatalog]);

  if (!v8)
  {
    -[MADAutoAssetJob statusChange:catalogAnomaly:forReason:]( self,  "statusChange:catalogAnomaly:forReason:",  @"ReportCatalogDecideFound",  6102LL,  @"successful catalog download yet no catalog provided");
    id v10 = @"CatalogFoundNoNewer";
    goto LABEL_87;
  }

  if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    if (-[MADAutoAssetJob stagerJob](self, "stagerJob"))
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 autoAssetCatalog]);
      -[MADAutoAssetJob setStagerJobAutoAssetCatalog:](self, "setStagerJobAutoAssetCatalog:", v9);

      id v10 = @"SetCatalogDoneDetermine";
    }

    else
    {
      if (([v5 catalogFromLookupCache] & 1) == 0)
      {
        v92 = (void *)objc_claimAutoreleasedReturnValue([v5 autoAssetCatalog]);
        v93 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob setConfiguration](self, "setConfiguration"));
        +[MADAutoAssetLookupCache recordLookupResult:forSetConfiguration:forStaging:]( &OBJC_CLASS___MADAutoAssetLookupCache,  "recordLookupResult:forSetConfiguration:forStaging:",  v92,  v93,  0LL);
      }

      v94 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob setConfiguration](self, "setConfiguration"));

      if (v94)
      {
        -[MADAutoAssetJob setHaveReceivedLookupResponse:](self, "setHaveReceivedLookupResponse:", 1LL);
        v95 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob setConfiguration](self, "setConfiguration"));
        v96 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assignedSetDescriptor](self, "assignedSetDescriptor"));
        +[MADAutoAssetControlManager autoAssetJobSetLookupResponseReceived:forAssignedSetDescriptor:]( &OBJC_CLASS___MADAutoAssetControlManager,  "autoAssetJobSetLookupResponseReceived:forAssignedSetDescriptor:",  v95,  v96);
      }

      else
      {
        -[MADAutoAssetJob statusChange:catalogAnomaly:forReason:]( self,  "statusChange:catalogAnomaly:forReason:",  @"ReportCatalogDecideFound",  6102LL,  @"set-job without set-configuration");
      }

      id v105 = (void *)objc_claimAutoreleasedReturnValue([v5 autoAssetCatalog]);
      id v10 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob reportSetCatalogDecideFound:](self, "reportSetCatalogDecideFound:", v105));
    }

    goto LABEL_86;
  }

  if (([v5 catalogFromLookupCache] & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue([v5 autoAssetCatalog]);
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
    +[MADAutoAssetLookupCache recordLookupResult:forSelector:forStaging:]( &OBJC_CLASS___MADAutoAssetLookupCache,  "recordLookupResult:forSelector:forStaging:",  v11,  v12,  -[MADAutoAssetJob stagerJob](self, "stagerJob"));
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue([v5 autoAssetCatalog]);
  id v14 = (__CFString *)objc_claimAutoreleasedReturnValue([v13 safeStringForKey:@"AssetType"]);

  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v5 autoAssetCatalog]);
  id v16 = [v15 safeObjectForKey:@"Assets" ofClass:objc_opt_class(NSArray)];
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  if (!v14 || !v17)
  {
    v97 = objc_alloc(&OBJC_CLASS___NSString);
    v98 = @"MISSING";
    if (v14) {
      v99 = v14;
    }
    else {
      v99 = @"MISSING";
    }
    if (v17) {
      v98 = @"present";
    }
    v100 = -[NSString initWithFormat:]( v97,  "initWithFormat:",  @"auto-asset catalog without required fields | catalogAssetType:%@, catalogAssets:%@",  v99,  v98);
    -[MADAutoAssetJob statusChange:catalogAnomaly:forReason:]( self,  "statusChange:catalogAnomaly:forReason:",  @"ReportCatalogDecideFound",  6102LL,  v100);
    goto LABEL_80;
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
  v19 = (void *)objc_claimAutoreleasedReturnValue([v18 assetType]);
  unsigned __int8 v20 = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v14, v19);

  if ((v20 & 1) == 0)
  {
    v101 = objc_alloc(&OBJC_CLASS___NSString);
    v102 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
    v103 = (void *)objc_claimAutoreleasedReturnValue([v102 assetType]);
    id v104 = -[NSString initWithFormat:]( v101,  "initWithFormat:",  @"auto-asset catalog for wrong assetType | catalog:%@, expecting:%@",  v14,  v103);
    -[MADAutoAssetJob statusChange:catalogAnomaly:forReason:]( self,  "statusChange:catalogAnomaly:forReason:",  @"ReportCatalogDecideFound",  6108LL,  v104);

    goto LABEL_82;
  }

  if (![v17 count])
  {
    v111 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob latestInstalledAssetVersion](self, "latestInstalledAssetVersion"));

    if (v111)
    {
      v100 = (NSString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
      v112 = (void *)objc_claimAutoreleasedReturnValue(-[NSString assetVersion](v100, "assetVersion"));
      if (v112) {
        uint64_t v113 = 6110LL;
      }
      else {
        uint64_t v113 = 6205LL;
      }
      v114 = objc_alloc(&OBJC_CLASS___NSString);
      v115 = v14;
      id v116 = v5;
      uint64_t v117 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob latestInstalledAssetVersion](self, "latestInstalledAssetVersion"));
      v118 = -[NSString initWithFormat:]( v114,  "initWithFormat:",  @"successful catalog download yet no assets in catalog | have installed asset-version:%@ | REVOKED",  v117);
      -[MADAutoAssetJob statusChange:catalogFailure:forReason:]( self,  "statusChange:catalogFailure:forReason:",  @"ReportCatalogDecideFound",  v113,  v118);

      id v5 = v116;
      id v14 = v115;
    }

    else
    {
      v129 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
      v100 = (NSString *)objc_claimAutoreleasedReturnValue([v129 oslog]);

      if (!os_log_type_enabled((os_log_t)v100, OS_LOG_TYPE_DEFAULT))
      {
LABEL_80:

LABEL_82:
        id v10 = @"CatalogFoundNoNewer";
        goto LABEL_83;
      }

      v112 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
      *(_DWORD *)buf = 138543362;
      uint64_t v205 = v112;
      _os_log_impl( &dword_0,  (os_log_t)v100,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {ReportCatalogDecideFound} no assets provided (and no latest-installed asset-version)",  buf,  0xCu);
    }

    goto LABEL_80;
  }

  v186 = v14;
  id v187 = v5;
  id v21 = supportedAssetFormatsArray();
  v190 = (void *)objc_claimAutoreleasedReturnValue(v21);
  __int128 v200 = 0u;
  __int128 v201 = 0u;
  __int128 v202 = 0u;
  __int128 v203 = 0u;
  id obj = v17;
  id v22 = [obj countByEnumeratingWithState:&v200 objects:v212 count:16];
  v191 = self;
  v192 = v17;
  if (!v22)
  {
    unsigned __int8 v188 = 0;
    __int128 v189 = 0uLL;
    goto LABEL_94;
  }

  id v23 = v22;
  unsigned __int8 v188 = 0;
  __int128 v189 = 0uLL;
  p_ivars = &MobileAssetKeyManager__metaData.ivars;
  uint64_t v196 = *(void *)v201;
  do
  {
    v25 = 0LL;
    id v193 = v23;
    do
    {
      if (*(void *)v201 != v196) {
        objc_enumerationMutation(obj);
      }
      v26 = *(void **)(*((void *)&v200 + 1) + 8LL * (void)v25);
      v27 = objc_autoreleasePoolPush();
      if (!-[__objc2_ivar_list doesMetatadaIndicateEmptyEntry:]( p_ivars[223],  "doesMetatadaIndicateEmptyEntry:",  v26))
      {
        id v32 = objc_alloc((Class)p_ivars[223]);
        unsigned __int8 v33 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
        unsigned __int8 v34 = (void *)objc_claimAutoreleasedReturnValue([v33 assetType]);
        id v199 = 0LL;
        id v35 = [v32 initForAssetType:v34 fromMetadata:v26 invalidReasons:&v199];
        char v29 = (os_log_s *)v199;

        if (!v35)
        {
          v52 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"{A:%@} auto-asset metadata considered invalid | %@",  @"ReportCatalogDecideFound",  v29);
          -[MADAutoAssetJob trackAnomaly:forReason:](self, "trackAnomaly:forReason:", 6108LL, v52);
          goto LABEL_26;
        }

        v36 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
        uint64_t v37 = objc_claimAutoreleasedReturnValue([v36 assetVersion]);
        if (v37)
        {
          v38 = (void *)v37;
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
          v40 = (void *)objc_claimAutoreleasedReturnValue([v39 assetVersion]);
          char v41 = (void *)objc_claimAutoreleasedReturnValue([v35 assetVersion]);
          unsigned __int8 v42 = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v40, v41);

          self = v191;
          if ((v42 & 1) == 0)
          {
            BOOL v43 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](v191, "logger"));
            unsigned __int8 v44 = (os_log_s *)objc_claimAutoreleasedReturnValue([v43 oslog]);

            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              unsigned __int8 v45 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](v191, "autoJobName"));
              v46 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](v191, "autoAssetSelector"));
              v47 = (void *)objc_claimAutoreleasedReturnValue([v46 assetVersion]);
              id v48 = (void *)objc_claimAutoreleasedReturnValue([v35 assetVersion]);
              uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v35 summary]);
              *(_DWORD *)buf = 138544130;
              uint64_t v205 = v45;
              __int16 v206 = 2114;
              v207 = v47;
              __int16 v208 = 2114;
              uint64_t v209 = v48;
              __int16 v210 = 2114;
              uint64_t v211 = v49;
              BOOL v50 = v44;
              v51 = "%{public}@ | {ReportCatalogDecideFound} filtering out asset (version mismatch) | [version]required:%"
                    "{public}@ != metadata:%{public}@ | filtered:%{public}@";
              goto LABEL_39;
            }

            goto LABEL_40;
          }
        }

        else
        {
        }

        id v53 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
        v54 = (void *)objc_claimAutoreleasedReturnValue([v53 assetSpecifier]);
        uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue([v35 assetSpecifier]);
        unsigned __int8 v56 = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v54, v55);

        if ((v56 & 1) != 0)
        {
          v17 = v192;
          if ([v35 isPatch])
          {
            uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob baseForPatch](self, "baseForPatch"));

            if (!v57)
            {
              uint64_t v80 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
              v52 = (NSString *)objc_claimAutoreleasedReturnValue([v80 oslog]);

              if (os_log_type_enabled((os_log_t)v52, OS_LOG_TYPE_DEFAULT))
              {
                v76 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
                v77 = (void *)objc_claimAutoreleasedReturnValue([v35 summary]);
                *(_DWORD *)buf = 138543618;
                uint64_t v205 = v76;
                __int16 v206 = 2114;
                v207 = v77;
                __int16 v78 = (os_log_s *)v52;
                v79 = "%{public}@ | {ReportCatalogDecideFound} filtering out asset (patch when no base for patch) | filtered:%{public}@";
                goto LABEL_67;
              }

              goto LABEL_26;
            }

            id v58 = (void *)objc_claimAutoreleasedReturnValue([v35 assetFormat]);
            unsigned int v59 = [v190 containsObject:v58];

            if (!v59)
            {
              v81 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
              v52 = (NSString *)objc_claimAutoreleasedReturnValue([v81 oslog]);

              if (os_log_type_enabled((os_log_t)v52, OS_LOG_TYPE_DEFAULT))
              {
                v76 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
                v77 = (void *)objc_claimAutoreleasedReturnValue([v35 summary]);
                *(_DWORD *)buf = 138543618;
                uint64_t v205 = v76;
                __int16 v206 = 2114;
                v207 = v77;
                __int16 v78 = (os_log_s *)v52;
                v79 = "%{public}@ | {ReportCatalogDecideFound} filtering out asset (patch of unsupported format) | filtered:%{public}@";
                goto LABEL_67;
              }

              goto LABEL_26;
            }

            if ((void)v189)
            {
              unsigned int v60 = -[MADAutoAssetJob isMorePreferredFormat:comparedTo:](self, "isMorePreferredFormat:comparedTo:", v35);
              id v61 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
              v52 = (NSString *)objc_claimAutoreleasedReturnValue([v61 oslog]);

              BOOL v62 = os_log_type_enabled((os_log_t)v52, OS_LOG_TYPE_DEFAULT);
              if (v60)
              {
                if (v62)
                {
                  uint64_t v63 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
                  uint64_t v64 = (void *)objc_claimAutoreleasedReturnValue([v35 summary]);
                  *(_DWORD *)buf = 138543618;
                  uint64_t v205 = v63;
                  __int16 v206 = 2114;
                  v207 = v64;
                  _os_log_impl( &dword_0,  (os_log_t)v52,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {ReportCatalogDecideFound} more preferred patch provided | now considering:%{public}@",  buf,  0x16u);
                }

                id v65 = v35;
                unsigned __int8 v188 = -[MADAutoAssetJob preferenceAsIfRampOrUse:]( self,  "preferenceAsIfRampOrUse:",  [v65 isRamped]);
                *(void *)&__int128 v189 = v65;
                goto LABEL_41;
              }

              if (v62)
              {
                v76 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
                v77 = (void *)objc_claimAutoreleasedReturnValue([v35 summary]);
                *(_DWORD *)buf = 138543618;
                uint64_t v205 = v76;
                __int16 v206 = 2114;
                v207 = v77;
                __int16 v78 = (os_log_s *)v52;
                v79 = "%{public}@ | {ReportCatalogDecideFound} filtering out asset (additional patch of less-preferred fo"
                      "rmat) | filtered:%{public}@";
LABEL_67:
                _os_log_impl(&dword_0, v78, OS_LOG_TYPE_DEFAULT, v79, buf, 0x16u);
              }

              goto LABEL_26;
            }

            v87 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
            v88 = (os_log_s *)objc_claimAutoreleasedReturnValue([v87 oslog]);

            if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
            {
              v89 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
              int v90 = (void *)objc_claimAutoreleasedReturnValue([v35 summary]);
              *(_DWORD *)buf = 138543618;
              uint64_t v205 = v89;
              __int16 v206 = 2114;
              v207 = v90;
              _os_log_impl( &dword_0,  v88,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {ReportCatalogDecideFound} patch provided | considering:%{public}@",  buf,  0x16u);
            }

            id v86 = v35;
            *(void *)&__int128 v189 = v86;
LABEL_64:
            unsigned __int8 v188 = -[MADAutoAssetJob preferenceAsIfRampOrUse:]( self,  "preferenceAsIfRampOrUse:",  [v86 isRamped]);
          }

          else
          {
            uint64_t v67 = (void *)objc_claimAutoreleasedReturnValue([v35 assetFormat]);
            unsigned int v68 = [v190 containsObject:v67];

            if (!v68)
            {
              id v75 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
              v52 = (NSString *)objc_claimAutoreleasedReturnValue([v75 oslog]);

              if (os_log_type_enabled((os_log_t)v52, OS_LOG_TYPE_DEFAULT))
              {
                v76 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
                v77 = (void *)objc_claimAutoreleasedReturnValue([v35 summary]);
                *(_DWORD *)buf = 138543618;
                uint64_t v205 = v76;
                __int16 v206 = 2114;
                v207 = v77;
                __int16 v78 = (os_log_s *)v52;
                v79 = "%{public}@ | {ReportCatalogDecideFound} filtering out asset (full of unsupported format) | filtered:%{public}@";
                goto LABEL_67;
              }

              goto LABEL_26;
            }

            if (!*((void *)&v189 + 1))
            {
              v82 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
              v83 = (os_log_s *)objc_claimAutoreleasedReturnValue([v82 oslog]);

              if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
              {
                v84 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
                v85 = (void *)objc_claimAutoreleasedReturnValue([v35 summary]);
                *(_DWORD *)buf = 138543618;
                uint64_t v205 = v84;
                __int16 v206 = 2114;
                v207 = v85;
                _os_log_impl( &dword_0,  v83,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {ReportCatalogDecideFound} full provided | considering:%{public}@",  buf,  0x16u);
              }

              id v86 = v35;
              *((void *)&v189 + 1) = v86;
              goto LABEL_64;
            }

            unsigned int v69 = -[MADAutoAssetJob isMorePreferredFormat:comparedTo:](self, "isMorePreferredFormat:comparedTo:", v35);
            v70 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
            v52 = (NSString *)objc_claimAutoreleasedReturnValue([v70 oslog]);

            BOOL v71 = os_log_type_enabled((os_log_t)v52, OS_LOG_TYPE_DEFAULT);
            if (v69)
            {
              if (v71)
              {
                id v72 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
                v73 = (void *)objc_claimAutoreleasedReturnValue([v35 summary]);
                *(_DWORD *)buf = 138543618;
                uint64_t v205 = v72;
                __int16 v206 = 2114;
                v207 = v73;
                _os_log_impl( &dword_0,  (os_log_t)v52,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {ReportCatalogDecideFound} more preferred full provided | now considering:%{public}@",  buf,  0x16u);
              }

              id v74 = v35;
              unsigned __int8 v188 = -[MADAutoAssetJob preferenceAsIfRampOrUse:]( self,  "preferenceAsIfRampOrUse:",  [v74 isRamped]);
              *((void *)&v189 + 1) = v74;
              goto LABEL_41;
            }

            if (v71)
            {
              v76 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
              v77 = (void *)objc_claimAutoreleasedReturnValue([v35 summary]);
              *(_DWORD *)buf = 138543618;
              uint64_t v205 = v76;
              __int16 v206 = 2114;
              v207 = v77;
              __int16 v78 = (os_log_s *)v52;
              v79 = "%{public}@ | {ReportCatalogDecideFound} filtering out asset (additional full of less-preferred forma"
                    "t) | filtered:%{public}@";
              goto LABEL_67;
            }

- (int64_t)action_DecideDownloadOrPostpone:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  if (!-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    if (-[MADAutoAssetJob rampingForeground](self, "rampingForeground")) {
      -[MADAutoAssetJob setRampingForegroundLatched:](self, "setRampingForegroundLatched:", 1LL);
    }
    id v7 = -[MADAutoAssetJob newAssetDownloadOptions](self, "newAssetDownloadOptions");
    -[MADAutoAssetJob setAssetDownloadOptions:](self, "setAssetDownloadOptions:", v7);

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerPatch](self, "foundNewerPatch"));
    if (v8)
    {
      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerPatch](self, "foundNewerPatch"));
      -[MADAutoAssetJob setNewerFoundAssetDescriptor:](self, "setNewerFoundAssetDescriptor:", v9);

      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerPatch](self, "foundNewerPatch"));
      -[MADAutoAssetJob setDownloadingAssetDescriptor:](self, "setDownloadingAssetDescriptor:", v10);

      -[MADAutoAssetJob latchWhetherDownloadingUserInitiated](self, "latchWhetherDownloadingUserInitiated");
      unsigned int v11 = -[MADAutoAssetJob downloadingUserInitiated](self, "downloadingUserInitiated");
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 assetVersion]);

      id v14 = @"DownloadAutoPatch";
      unsigned int v15 = @"DownloadUserPatch";
    }

    else
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerFull](self, "foundNewerFull"));
      -[MADAutoAssetJob setNewerFoundAssetDescriptor:](self, "setNewerFoundAssetDescriptor:", v16);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerFull](self, "foundNewerFull"));
      -[MADAutoAssetJob setDownloadingAssetDescriptor:](self, "setDownloadingAssetDescriptor:", v17);

      -[MADAutoAssetJob latchWhetherDownloadingUserInitiated](self, "latchWhetherDownloadingUserInitiated");
      unsigned int v11 = -[MADAutoAssetJob downloadingUserInitiated](self, "downloadingUserInitiated");
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue([v18 assetVersion]);

      id v14 = @"DownloadAutoFull";
      unsigned int v15 = @"DownloadUserFull";
    }

    if (v11) {
      v19 = v15;
    }
    else {
      v19 = v14;
    }
    if (v13) {
      -[MADAutoAssetJob setReportingProgress:](self, "setReportingProgress:", 1LL);
    }
    else {
      v19 = @"PersistDownload";
    }
    unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 metadata]);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
    [v22 setNewerVersionAttributes:v21];

    id v23 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoFound);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob resultSelector](self, "resultSelector"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue([v25 metadata]);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
    id v28 = -[MAAutoAssetInfoFound initForSelector:withLocalContentURL:withAssetAttributes:reportingStatus:]( v23,  "initForSelector:withLocalContentURL:withAssetAttributes:reportingStatus:",  v24,  0LL,  v26,  v27);
    -[MADAutoAssetJob setResultFound:](self, "setResultFound:", v28);

    if (-[MADAutoAssetJob downloadingUserInitiated](self, "downloadingUserInitiated"))
    {
      char v29 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
      [v29 setDownloadUserInitiated:1];
    }

    -[MADAutoAssetJob replyToJobsWhenCatalogDownloaded:discoveredNewer:]( self,  "replyToJobsWhenCatalogDownloaded:discoveredNewer:",  @"DecideDownloadOrPostpone",  1LL);
    if (!-[MADAutoAssetJob stagerJob](self, "stagerJob")
      || -[MADAutoAssetJob stagerJobDownloadContent](self, "stagerJobDownloadContent"))
    {
      if (-[MADAutoAssetJob stagerJob](self, "stagerJob")
        || -[MADAutoAssetJob anyJobInterestedInContent](self, "anyJobInterestedInContent"))
      {
        goto LABEL_24;
      }

      v30 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob getCurrentJobTask](self, "getCurrentJobTask"));
      if (v30)
      {
        v31 = objc_alloc(&OBJC_CLASS___NSString);
        id v32 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob progressReportPhaseName](self, "progressReportPhaseName"));
        unsigned __int8 v33 = (void *)objc_claimAutoreleasedReturnValue([v30 summary]);
        unsigned __int8 v34 = -[NSString initWithFormat:]( v31,  "initWithFormat:",  @"{%@} current job (after catalog lookup has been serviced) | phase:%@ | currentJob:%@",  @"DecideDownloadOrPostpone",  v32,  v33);
        -[MADAutoAssetJob trackAnomaly:forReason:](self, "trackAnomaly:forReason:", 6108LL, v34);
      }
    }

    v19 = @"PostponedDownload";
LABEL_24:
    id v35 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
    v36 = objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam);
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob _updateLatestSummary](self, "_updateLatestSummary"));
    v38 = -[MADAutoAssetJobParam initWithSafeSummary:](v36, "initWithSafeSummary:", v37);
    [v35 followupEvent:v19 withInfo:v38];

    return 0LL;
  }

  -[MADAutoAssetJob statusChange:catalogAnomaly:forReason:]( self,  "statusChange:catalogAnomaly:forReason:",  @"DecideDownloadOrPostpone",  6103LL,  @"action DecideDownloadOrPostpone should never execute for set-job");
  return 0LL;
}

- (int64_t)action_RequestSpecificPersisted:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob resultSelector](self, "resultSelector"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetUUID](self, "autoAssetUUID"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob baseForPatch](self, "baseForPatch"));
  +[MADAutoAssetControlManager autoAssetJobReadyToDownload:withAutoAssetUUID:fromAutoAssetJob:withOriginalSelector:downloadingDescriptor:baseForPatchDescriptor:]( &OBJC_CLASS___MADAutoAssetControlManager,  "autoAssetJobReadyToDownload:withAutoAssetUUID:fromAutoAssetJob:withOriginalSelector:downloadingDescriptor:baseForPatchDescriptor:",  v7,  v8,  self,  v9,  v10,  v11);

  return 0LL;
}

- (int64_t)action_PersistedDecideDownload:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  id v7 = -[MADAutoAssetJob newAssetDownloadOptions](self, "newAssetDownloadOptions");
  -[MADAutoAssetJob setAssetDownloadOptions:](self, "setAssetDownloadOptions:", v7);

  -[MADAutoAssetJob setReportingProgress:](self, "setReportingProgress:", 1LL);
  LODWORD(v6) = -[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob");
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerPatch](self, "foundNewerPatch"));

  if ((_DWORD)v6)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientSetPolicy](self, "aggregatedClientSetPolicy"));
    unsigned int v10 = [v9 userInitiated];

    unsigned int v11 = @"SetDownloadAutoFull";
    BOOL v12 = v10 == 0;
    id v13 = @"SetDownloadAutoPatch";
    if (v10) {
      unsigned int v11 = @"SetDownloadUserFull";
    }
    id v14 = @"SetDownloadUserPatch";
  }

  else
  {
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientAssetPolicy](self, "aggregatedClientAssetPolicy"));
    unsigned int v16 = [v15 userInitiated];

    unsigned int v11 = @"DownloadAutoFull";
    BOOL v12 = v16 == 0;
    id v13 = @"DownloadAutoPatch";
    if (v16) {
      unsigned int v11 = @"DownloadUserFull";
    }
    id v14 = @"DownloadUserPatch";
  }

  if (v12) {
    id v14 = v13;
  }
  if (v8) {
    v17 = v14;
  }
  else {
    v17 = v11;
  }
  -[MADAutoAssetJob setReportingProgress:](self, "setReportingProgress:", 1LL);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  v19 = objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam);
  unsigned __int8 v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob _updateLatestSummary](self, "_updateLatestSummary"));
  id v21 = -[MADAutoAssetJobParam initWithSafeSummary:](v19, "initWithSafeSummary:", v20);
  [v18 followupEvent:v17 withInfo:v21];

  return 0LL;
}

- (int64_t)action_DownloadNewestPatch:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob baseForPatch](self, "baseForPatch"));
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob baseForPatch](self, "baseForPatch"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetControlManager localAssetURLForDescriptor:fromLocation:]( &OBJC_CLASS___MADAutoAssetControlManager,  "localAssetURLForDescriptor:fromLocation:",  v8,  @"DownloadNewestPatch"));

    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assetDownloadOptions](self, "assetDownloadOptions"));
    [v10 setSourceDirectory:v9];

    if (!-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
    {
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
      [v11 setPatchingAttempted:1];
    }

    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 oslog]);

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
      int v18 = 138543618;
      v19 = v14;
      __int16 v20 = 2114;
      id v21 = v9;
      _os_log_impl( &dword_0,  v13,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | patching from sourceDirectory:%{public}@",  (uint8_t *)&v18,  0x16u);
    }
  }

  else
  {
    -[MADAutoAssetJob trackAnomaly:forReason:]( self,  "trackAnomaly:forReason:",  6111LL,  @"downloading patch when no base for patch (unable to provide sourceDirectory)");
  }

  -[MADAutoAssetJob statusChangeStartingAssetDownload:downloadingPatch:]( self,  "statusChangeStartingAssetDownload:downloadingPatch:",  @"DownloadNewestPatch",  1LL);
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerPatch](self, "foundNewerPatch"));
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob baseForPatch](self, "baseForPatch"));
  -[MADAutoAssetJob requestDownloadManagerAssetDownload:forDescriptor:withBaseForPatch:]( self,  "requestDownloadManagerAssetDownload:forDescriptor:withBaseForPatch:",  @"DownloadNewestPatch",  v15,  v16);

  return 0LL;
}

- (int64_t)action_DownloadNewestFull:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[MADAutoAssetJob statusChangeStartingAssetDownload:downloadingPatch:]( self,  "statusChangeStartingAssetDownload:downloadingPatch:",  @"DownloadNewestFull",  0LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerFull](self, "foundNewerFull"));
  -[MADAutoAssetJob requestDownloadManagerAssetDownload:forDescriptor:withBaseForPatch:]( self,  "requestDownloadManagerAssetDownload:forDescriptor:withBaseForPatch:",  @"DownloadNewestFull",  v7,  0LL);

  return 0LL;
}

- (int64_t)action_UserInitiatedDownloadNewestFull:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[MADAutoAssetJob setBoostedToUserInitiated:](self, "setBoostedToUserInitiated:", 1LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assetDownloadOptions](self, "assetDownloadOptions"));
  [v7 setDiscretionary:0];

  if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob")) {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
  }
  else {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
  }
  id v9 = v8;
  [v8 setDownloadUserInitiated:1];

  -[MADAutoAssetJob statusChangeStartingAssetDownload:downloadingPatch:]( self,  "statusChangeStartingAssetDownload:downloadingPatch:",  @"UserInitiatedDownloadNewestFull",  0LL);
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerFull](self, "foundNewerFull"));
  -[MADAutoAssetJob requestDownloadManagerAssetDownload:forDescriptor:withBaseForPatch:]( self,  "requestDownloadManagerAssetDownload:forDescriptor:withBaseForPatch:",  @"UserInitiatedDownloadNewestFull",  v10,  0LL);

  return 0LL;
}

- (int64_t)action_DownloadSuccessDecideMore:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  id v7 = objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob _updateLatestSummary](self, "_updateLatestSummary"));
  id v9 = -[MADAutoAssetJobParam initWithSafeSummary:](v7, "initWithSafeSummary:", v8);

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetJob decideFollowupMoreAssetsToDownload:withEventInfo:]( self,  "decideFollowupMoreAssetsToDownload:withEventInfo:",  @"DownloadSuccessDecideMore",  v9));
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  [v11 followupEvent:v10 withInfo:v9];

  return 0LL;
}

- (int64_t)action_FailedPatchDecideTryFull:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assignedSetDescriptor](self, "assignedSetDescriptor"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 clientDomainName]);
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assignedSetDescriptor](self, "assignedSetDescriptor"));
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v10 assetSetIdentifier]);
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assignedSetDescriptor](self, "assignedSetDescriptor"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 discoveredAtomicInstance]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 finishedError]);
    +[MADAutoAssetHistory recordFailedOperation:fromLayer:forClientDomainName:forAssetSetIdentifier:forAtomicInstance:failingWithError:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordFailedOperation:fromLayer:forClientDomainName:forAssetSetIdentifier:forAtomicInstance:failingWithError:",  505LL,  2LL,  v9,  v11,  v13,  v14);
  }

  else
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 finishedError]);
    +[MADAutoAssetHistory recordFailedOperation:fromLayer:forAssetID:withSelector:failingWithError:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordFailedOperation:fromLayer:forAssetID:withSelector:failingWithError:",  505LL,  2LL,  @"UNKNOWN",  v8,  v9);
  }

  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerFull](self, "foundNewerFull"));
  if (v15)
  {
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v5 finishedError]);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
    [v17 setPatchingAttemptError:v16];

    int v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
    if (v18)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
      id v20 = [v19 downloadUserInitiated];
      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerFull](self, "foundNewerFull"));
      [v21 setDownloadUserInitiated:v20];

      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerFull](self, "foundNewerFull"));
      [v22 setPatchingAttempted:1];

      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue([v23 patchingAttemptError]);
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerFull](self, "foundNewerFull"));
      [v25 setPatchingAttemptError:v24];
    }

    else
    {
      -[MADAutoAssetJob trackAnomaly:forReason:]( self,  "trackAnomaly:forReason:",  6111LL,  @"{FailedPatchDecideTryFull} failed attempt to download patch yet downloadingAssetDescriptor:nil");
    }

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerFull](self, "foundNewerFull"));
    id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 patchingAttemptError]);

    if (!v28)
    {
      char v29 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
      v30 = (void *)objc_claimAutoreleasedReturnValue([v29 patchingAttemptError]);
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerFull](self, "foundNewerFull"));
      [v31 setPatchingAttemptError:v30];
    }

    v26 = @"DownloadFailureTryFull";
  }

  else
  {
    v26 = @"DownloadFailureNoFull";
  }

  -[MADAutoAssetJob setDownloadingAssetDescriptor:](self, "setDownloadingAssetDescriptor:", 0LL);
  id v32 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  unsigned __int8 v33 = objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam);
  unsigned __int8 v34 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob _updateLatestSummary](self, "_updateLatestSummary"));
  id v35 = -[MADAutoAssetJobParam initWithSafeSummary:](v33, "initWithSafeSummary:", v34);
  [v32 followupEvent:v26 withInfo:v35];

  return 0LL;
}

- (int64_t)action_BoostToUserInitiated:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
  -[MADAutoAssetJob requestDownloadManagerConfigDownload:forDescriptor:]( self,  "requestDownloadManagerConfigDownload:forDescriptor:",  @"BoostToUserInitiated",  v7);

  return 0LL;
}

- (int64_t)action_BoostAndRequestLookupGrant:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
  -[MADAutoAssetJob requestDownloadManagerConfigDownload:forDescriptor:]( self,  "requestDownloadManagerConfigDownload:forDescriptor:",  @"BoostToUserInitiated",  v7);

  -[MADAutoAssetJob obtainLookupGrant](self, "obtainLookupGrant");
  return 0LL;
}

- (int64_t)action_NowUserInitiated:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[MADAutoAssetJob setBoostedToUserInitiated:](self, "setBoostedToUserInitiated:", 1LL);
  -[MADAutoAssetJob latchWhetherDownloadingUserInitiated](self, "latchWhetherDownloadingUserInitiated");
  -[MADAutoAssetJob statusChangeReportCurrent:](self, "statusChangeReportCurrent:", 0LL);
  return 0LL;
}

- (int64_t)action_ReportFailureUserInitiated:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 oslog]);

  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[MADAutoAssetJob action_ReportFailureUserInitiated:error:].cold.1();
  }

  return 0LL;
}

- (int64_t)action_DownloadSuccessDecidePersonalize:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  id v7 = objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob _updateLatestSummary](self, "_updateLatestSummary"));
  id v9 = -[MADAutoAssetJobParam initWithSafeSummary:](v7, "initWithSafeSummary:", v8);

  if (-[MADAutoAssetJob stagerJob](self, "stagerJob")
    || -[MADAutoAssetJob tryPersonalizeFailed](self, "tryPersonalizeFailed")
    || !+[MADAutoAssetControlManager preferenceSecureSimulateRequireAll]( &OBJC_CLASS___MADAutoAssetControlManager,  "preferenceSecureSimulateRequireAll")
    && (unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor")),
        unsigned int v11 = +[MADAutoAssetSecure isPersonalizationRequired:forDescriptor:]( &OBJC_CLASS___MADAutoAssetSecure,  "isPersonalizationRequired:forDescriptor:",  @"DownloadSuccessDecidePersonalize",  v10),  v10,  !v11))
  {
    BOOL v12 = @"DownloadedNoPersonalize";
  }

  else
  {
    BOOL v12 = @"DownloadedTryPersonalize";
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  [v13 followupEvent:v12 withInfo:v9];

  return 0LL;
}

- (int64_t)action_SecureBundlePersonalize:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetUUID](self, "autoAssetUUID"));
  if (!-[MADAutoAssetJob stagerJob](self, "stagerJob"))
  {
    unsigned int v8 = -[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob");
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
    unsigned int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 oslog]);

    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v11)
      {
        BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 summary]);
        *(_DWORD *)buf = 138543618;
        v24 = v12;
        __int16 v25 = 2114;
        v26 = v14;
        unsigned int v15 = "%{public}@\n"
              "[AUTO-SECURE][AUTO-PERSONALIZATION][SET-JOB-PRE] attempting pre-personalization | downloadingAssetDescriptor:%{public}@";
LABEL_8:
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, v15, buf, 0x16u);
      }
    }

    else if (v11)
    {
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 summary]);
      *(_DWORD *)buf = 138543618;
      v24 = v12;
      __int16 v25 = 2114;
      v26 = v14;
      unsigned int v15 = "%{public}@\n"
            "[AUTO-SECURE][AUTO-PERSONALIZATION][SIGLETON-JOB] attempting pre-personalization | downloadingAssetDescriptor:%{public}@";
      goto LABEL_8;
    }

    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
    uint64_t v18 = -[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob") ^ 1;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472LL;
    v20[2] = __56__MADAutoAssetJob_action_SecureBundlePersonalize_error___block_invoke;
    v20[3] = &unk_34F2E0;
    id v21 = v7;
    id v22 = self;
    +[MADAutoAssetSecure personalizeDownloaded:personalizingDescriptor:allowingNetwork:committingPersonalization:completion:]( &OBJC_CLASS___MADAutoAssetSecure,  "personalizeDownloaded:personalizingDescriptor:allowingNetwork:committingPersonalization:completion:",  v16,  v17,  1LL,  v18,  v20);

    goto LABEL_10;
  }

  -[MADAutoAssetJob trackAnomaly:forReason:]( self,  "trackAnomaly:forReason:",  6103LL,  @"{SecureBundlePersonalize} [STAGER-JOB] should never perform any secure operations (must be running pre-SU-staging target OS before personalizing)");
LABEL_10:

  return 0LL;
}

void __56__MADAutoAssetJob_action_SecureBundlePersonalize_error___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v4 = a3;
  id v9 = -[MADAutoAssetJobParam initForFinishedJobID:withError:]( objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam),  "initForFinishedJobID:withError:",  *(void *)(a1 + 32),  v4);

  id v5 = @"PersonalizationFailure";
  if (!v4) {
    id v5 = @"PersonalizationSuccess";
  }
  id v6 = *(void **)(a1 + 40);
  id v7 = v5;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 autoJobFSM]);
  [v8 postEvent:v7 withInfo:v9];
}

- (int64_t)action_PersonalizeSuccessDecideMore:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[MADAutoAssetJob setTryPersonalizeSuccess:](self, "setTryPersonalizeSuccess:", 1LL);
  if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    id v7 = objc_alloc(&OBJC_CLASS___MAAutoAssetSelector);
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 assetType]);
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 assetSpecifier]);
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 assetVersion]);
    id v14 = (os_log_s *)-[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:]( v7,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:",  v9,  v11,  v13);

    if (v14)
    {
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
      unsigned int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue([v15 oslog]);

      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
        uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
        v19 = (void *)objc_claimAutoreleasedReturnValue([v18 summary]);
        int v31 = 138543618;
        id v32 = v17;
        __int16 v33 = 2114;
        unsigned __int8 v34 = v19;
        _os_log_impl( &dword_0,  v16,  OS_LOG_TYPE_DEFAULT,  "%{public}@\n [AUTO-SECURE][AUTO-PERSONALIZATION][SET-JOB-PRE] auto-asset pre-personalization SUCCESS | downloadingAssetDesc riptor:%{public}@",  (uint8_t *)&v31,  0x16u);
      }

      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob prePersonalizedSelectors](self, "prePersonalizedSelectors"));
      [v20 addObject:v14];
    }

    else
    {
      -[MADAutoAssetJob trackAnomaly:forReason:]( self,  "trackAnomaly:forReason:",  6101LL,  @"{PersonalizeSuccessDecideMore} unable to initialize prePersonalizedSelector");
    }
  }

  else
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 oslog]);

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue([v23 summary]);
      int v31 = 138543618;
      id v32 = v22;
      __int16 v33 = 2114;
      unsigned __int8 v34 = v24;
      _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@\n [AUTO-SECURE][AUTO-PERSONALIZATION] auto-asset personalization SUCCESS | downloadingAssetDescriptor:%{public}@",  (uint8_t *)&v31,  0x16u);
    }
  }

  __int16 v25 = objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob _updateLatestSummary](self, "_updateLatestSummary"));
  v27 = -[MADAutoAssetJobParam initWithSafeSummary:](v25, "initWithSafeSummary:", v26);

  id v28 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetJob decideFollowupMoreAssetsToDownload:withEventInfo:]( self,  "decideFollowupMoreAssetsToDownload:withEventInfo:",  @"PersonalizeSuccessDecideMore",  v27));
  char v29 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  [v29 followupEvent:v28 withInfo:v27];

  return 0LL;
}

- (int64_t)action_PersonalizeFailureDecideMore:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[MADAutoAssetJob setTryPersonalizeFailed:](self, "setTryPersonalizeFailed:", 1LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
  unsigned int v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 oslog]);

  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
    unsigned int v10 = -[MADAutoAssetJob tryPersonalizeFailed](self, "tryPersonalizeFailed");
    BOOL v11 = @"N";
    if (v10) {
      BOOL v11 = @"Y";
    }
    int v18 = 138543618;
    v19 = v9;
    __int16 v20 = 2112;
    id v21 = v11;
    _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@\n [AUTO-SECURE][AUTO-PERSONALIZATION] {PersonalizeFailureDecideMore} will not make any additional personalization at tempts | tryPersonalizeFailed:%@",  (uint8_t *)&v18,  0x16u);
  }

  BOOL v12 = objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob _updateLatestSummary](self, "_updateLatestSummary"));
  id v14 = -[MADAutoAssetJobParam initWithSafeSummary:](v12, "initWithSafeSummary:", v13);

  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetJob decideFollowupMoreAssetsToDownload:withEventInfo:]( self,  "decideFollowupMoreAssetsToDownload:withEventInfo:",  @"PersonalizeFailureDecideMore",  v14));
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  [v16 followupEvent:v15 withInfo:v14];

  return 0LL;
}

- (int64_t)action_PersonalizeHealSuccessDecideMore:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[MADAutoAssetJob setTryPersonalizeSuccess:](self, "setTryPersonalizeSuccess:", 1LL);
  if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob")
    && (id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob tryPersonalizeSelector](self, "tryPersonalizeSelector")),
        v7,
        v7))
  {
    unsigned int v8 = objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob _updateLatestSummary](self, "_updateLatestSummary"));
    unsigned int v10 = -[MADAutoAssetJobParam initWithSafeSummary:](v8, "initWithSafeSummary:", v9);

    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob prePersonalizedSelectors](self, "prePersonalizedSelectors"));
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob tryPersonalizeSelector](self, "tryPersonalizeSelector"));
    [v11 addObject:v12];

    -[MADAutoAssetJob setTryPersonalizeSelector:](self, "setTryPersonalizeSelector:", 0LL);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob tryPersonalizeDescriptors](self, "tryPersonalizeDescriptors"));
    id v14 = [v13 count];

    if (v14)
    {
      unsigned int v15 = @"HealPersonalizeMore";
    }

    else
    {
      unsigned int v16 = -[MADAutoAssetJob tryPersonalizeFailed](self, "tryPersonalizeFailed");
      v17 = @"HealPersonalizeDoneAvail";
      if (v16) {
        v17 = @"HealPersonalizeDoneNotAvail";
      }
      unsigned int v15 = v17;
    }

    int v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
    [v18 followupEvent:v15 withInfo:v10];
  }

  else
  {
    -[MADAutoAssetJob trackAnomaly:forReason:]( self,  "trackAnomaly:forReason:",  6103LL,  @"{PersonalizeHealSuccessDecideMore} healing is only valid for set-job");
  }

  return 0LL;
}

- (int64_t)action_PersonalizeHealFailureDecideMore:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[MADAutoAssetJob setTryPersonalizeFailed:](self, "setTryPersonalizeFailed:", 1LL);
  if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    id v7 = objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam);
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob _updateLatestSummary](self, "_updateLatestSummary"));
    id v9 = -[MADAutoAssetJobParam initWithSafeSummary:](v7, "initWithSafeSummary:", v8);

    -[MADAutoAssetJob setTryPersonalizeSelector:](self, "setTryPersonalizeSelector:", 0LL);
    -[MADAutoAssetJob setTryPersonalizeFailed:](self, "setTryPersonalizeFailed:", 1LL);
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
    BOOL v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 oslog]);

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
      unsigned int v13 = -[MADAutoAssetJob tryPersonalizeFailed](self, "tryPersonalizeFailed");
      id v14 = @"N";
      if (v13) {
        id v14 = @"Y";
      }
      int v17 = 138543618;
      int v18 = v12;
      __int16 v19 = 2112;
      __int16 v20 = v14;
      _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@\n [AUTO-SECURE][AUTO-PERSONALIZATION] {PersonalizeHealFailureDecideMore} will not make any additional personalizat ion attempts | tryPersonalizeFailed:%@",  (uint8_t *)&v17,  0x16u);
    }

    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
    [v15 followupEvent:@"HealPersonalizeDoneNotAvail" withInfo:v9];
  }

  else
  {
    -[MADAutoAssetJob trackAnomaly:forReason:]( self,  "trackAnomaly:forReason:",  6103LL,  @"{PersonalizeHealFailureDecideMore} healing is only valid for set-job");
  }

  return 0LL;
}

- (int64_t)action_LookupSuccessContinue:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[MADAutoAssetJob releaseLookupGrant](self, "releaseLookupGrant");
  if (!-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob")
    || -[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob")
    && !-[MADAutoAssetJob setCheckAwaitingDownload](self, "setCheckAwaitingDownload"))
  {
    -[MADAutoAssetJob replyToJobsWhenCatalogDownloaded:discoveredNewer:]( self,  "replyToJobsWhenCatalogDownloaded:discoveredNewer:",  @"LookupSuccessContinue",  0LL);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  unsigned int v8 = objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob _updateLatestSummary](self, "_updateLatestSummary"));
  unsigned int v10 = -[MADAutoAssetJobParam initWithSafeSummary:](v8, "initWithSafeSummary:", v9);
  [v7 followupEvent:@"LookupContinue" withInfo:v10];

  return 0LL;
}

- (int64_t)action_LookupNoNewerContinue:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[MADAutoAssetJob releaseLookupGrant](self, "releaseLookupGrant");
  int64_t v7 = -[MADAutoAssetJob errorCodeForNoNewerContentFound](self, "errorCodeForNoNewerContentFound");
  unsigned int v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"AUTO-JOB(%@)",  @"LookupNoNewerContinue");
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v7,  v8,  0LL,  @"no [newer] version (matching auto-asset-selector) was found"));

  -[MADAutoAssetJob replyToJobsWhenLookupFailed:withLookupError:]( self,  "replyToJobsWhenLookupFailed:withLookupError:",  @"LookupFailedContinue",  v9);
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  BOOL v11 = objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam);
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob _updateLatestSummary](self, "_updateLatestSummary"));
  unsigned int v13 = -[MADAutoAssetJobParam initWithSafeSummary:](v11, "initWithSafeSummary:", v12);
  [v10 followupEvent:@"LookupContinue" withInfo:v13];

  return 0LL;
}

- (int64_t)action_LookupRevokedContinue:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[MADAutoAssetJob releaseLookupGrant](self, "releaseLookupGrant");
  int64_t v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"AUTO-JOB(%@)",  @"LookupRevokedContinue");
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6203LL,  v7,  0LL,  @"previously available version (matching auto-asset-selector) has been revoked"));

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
  +[MADAutoAssetHistory recordFailedOperation:fromLayer:forAssetID:withSelector:failingWithError:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordFailedOperation:fromLayer:forAssetID:withSelector:failingWithError:",  506LL,  2LL,  @"UNKNOWN",  v9,  v8);

  -[MADAutoAssetJob replyToJobsWhenLookupFailed:withLookupError:]( self,  "replyToJobsWhenLookupFailed:withLookupError:",  @"LookupRevokedContinue",  v8);
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  BOOL v11 = objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam);
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob _updateLatestSummary](self, "_updateLatestSummary"));
  unsigned int v13 = -[MADAutoAssetJobParam initWithSafeSummary:](v11, "initWithSafeSummary:", v12);
  [v10 followupEvent:@"LookupContinue" withInfo:v13];

  return 0LL;
}

- (int64_t)action_LookupFailedContinue:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[MADAutoAssetJob releaseLookupGrant](self, "releaseLookupGrant");
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v5 finishedError]);

  -[MADAutoAssetJob replyToJobsWhenLookupFailed:withLookupError:]( self,  "replyToJobsWhenLookupFailed:withLookupError:",  @"LookupFailedContinue",  v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  unsigned int v10 = objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam);
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob _updateLatestSummary](self, "_updateLatestSummary"));
  BOOL v12 = -[MADAutoAssetJobParam initWithSafeSummary:](v10, "initWithSafeSummary:", v11);
  [v9 followupEvent:@"LookupContinue" withInfo:v12];

  return 0LL;
}

- (int64_t)action_JobSuccessPatchedAwaiting:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    -[MADAutoAssetJob statusChange:catalogAnomaly:forReason:]( self,  "statusChange:catalogAnomaly:forReason:",  @"JobSuccessPatchedAwaiting",  6103LL,  @"action JobSuccessPatchedAwaiting should never execute for set-job");
  }

  else
  {
    -[MADAutoAssetJob statusChangeSuccesfullyPatched:]( self,  "statusChangeSuccesfullyPatched:",  @"JobSuccessPatchedAwaiting");
    -[MADAutoAssetJob foundAndDownloaded:forJobParam:wasPatched:]( self,  "foundAndDownloaded:forJobParam:wasPatched:",  @"JobSuccessPatchedAwaiting",  v5,  1LL);
    -[MADAutoAssetJob replyToJobsWhenContentDownloaded:]( self,  "replyToJobsWhenContentDownloaded:",  @"JobSuccessPatchedAwaiting");
  }

  return 0LL;
}

- (int64_t)action_JobSuccessDownloadedAwaiting:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    -[MADAutoAssetJob statusChange:catalogAnomaly:forReason:]( self,  "statusChange:catalogAnomaly:forReason:",  @"JobSuccessDownloadedAwaiting",  6103LL,  @"action JobSuccessDownloadedAwaiting should never execute for set-job");
  }

  else
  {
    -[MADAutoAssetJob statusChangeSuccessfullyDownloaded:]( self,  "statusChangeSuccessfullyDownloaded:",  @"JobSuccessDownloadedAwaiting");
    -[MADAutoAssetJob foundAndDownloaded:forJobParam:wasPatched:]( self,  "foundAndDownloaded:forJobParam:wasPatched:",  @"JobSuccessDownloadedAwaiting",  v5,  0LL);
    -[MADAutoAssetJob replyToJobsWhenContentDownloaded:]( self,  "replyToJobsWhenContentDownloaded:",  @"JobSuccessDownloadedAwaiting");
  }

  return 0LL;
}

- (int64_t)action_JobFailedAwaiting:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assignedSetDescriptor](self, "assignedSetDescriptor"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 clientDomainName]);
    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assignedSetDescriptor](self, "assignedSetDescriptor"));
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 assetSetIdentifier]);
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assignedSetDescriptor](self, "assignedSetDescriptor"));
    unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 discoveredAtomicInstance]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 finishedError]);
    +[MADAutoAssetHistory recordFailedOperation:fromLayer:forClientDomainName:forAssetSetIdentifier:forAtomicInstance:failingWithError:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordFailedOperation:fromLayer:forClientDomainName:forAssetSetIdentifier:forAtomicInstance:failingWithError:",  504LL,  2LL,  v9,  v11,  v13,  v14);
  }

  else
  {
    unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 finishedError]);
    +[MADAutoAssetHistory recordFailedOperation:fromLayer:forAssetID:withSelector:failingWithError:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordFailedOperation:fromLayer:forAssetID:withSelector:failingWithError:",  504LL,  2LL,  @"UNKNOWN",  v8,  v9);
  }

  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v5 finishedError]);
  -[MADAutoAssetJob replyToJobsWhenLookupFailed:withLookupError:]( self,  "replyToJobsWhenLookupFailed:withLookupError:",  @"JobFailedAwaiting",  v15);

  return 0LL;
}

- (int64_t)action_JobSuccessFoundSameSchedule:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    -[MADAutoAssetJob statusChange:catalogAnomaly:forReason:]( self,  "statusChange:catalogAnomaly:forReason:",  @"JobSuccessFoundSameSchedule",  6103LL,  @"action JobSuccessFoundSameSchedule should never execute for set-job");
  }

  else
  {
    if (-[MADAutoAssetJob determiningAssetContent](self, "determiningAssetContent"))
    {
      id v7 =  -[MADAutoAssetJob refreshOnFilesystemFromManagerPromotingIfStaged:]( self,  "refreshOnFilesystemFromManagerPromotingIfStaged:",  0LL);
      unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 assetVersion]);
      if (v9)
      {
        unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
        BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 assetVersion]);
        BOOL v12 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetJob installedOnFilesystemWithVersion:fromLocation:]( self,  "installedOnFilesystemWithVersion:fromLocation:",  v11,  @"JobSuccessFoundSameSchedule"));
      }

      else
      {
        BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob latestInstalledOnFilesystem](self, "latestInstalledOnFilesystem"));
      }

      -[MADAutoAssetJob updateResultPropertiesWithDescriptor:](self, "updateResultPropertiesWithDescriptor:", v12);
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
      int v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 oslog]);

      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
        __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v12 summary]);
        *(_DWORD *)buf = 138543618;
        id v22 = v18;
        __int16 v23 = 2114;
        v24 = v19;
        _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {JobSuccessFoundSameSchedule} same version found that has already been downloaded to the filesystem: %{public}@",  buf,  0x16u);
      }

      unsigned int v15 = 0LL;
    }

    else
    {
      if (-[MADAutoAssetJob tryPersonalizeFailed](self, "tryPersonalizeFailed")) {
        uint64_t v13 = 6535LL;
      }
      else {
        uint64_t v13 = 6205LL;
      }
      id v14 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"AUTO-JOB(%@)",  @"JobSuccessFoundSameSchedule");
      unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v13,  v14,  0LL,  @"same version found that has already been downloaded to the filesystem"));
    }

    -[MADAutoAssetJob doneWithAllJobs:withLookupError:]( self,  "doneWithAllJobs:withLookupError:",  @"JobSuccessFoundSameSchedule",  v15);
    -[MADAutoAssetJob autoAssetJobFinished:forJobFinishedReason:]( self,  "autoAssetJobFinished:forJobFinishedReason:",  @"JobSuccessFoundSameSchedule",  @"FOUND_SAME");
  }

  return 0LL;
}

- (int64_t)action_JobSuccessFoundPromoted:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    -[MADAutoAssetJob statusChange:catalogAnomaly:forReason:]( self,  "statusChange:catalogAnomaly:forReason:",  @"JobSuccessFoundPromoted",  6103LL,  @"action JobSuccessFoundPromoted should never execute for set-job");
  }

  else
  {
    -[MADAutoAssetJob statusChangeSuccessfullyDownloaded:]( self,  "statusChangeSuccessfullyDownloaded:",  @"JobSuccessFoundPromoted");
    -[MADAutoAssetJob foundAndDownloaded:forJobParam:wasPatched:]( self,  "foundAndDownloaded:forJobParam:wasPatched:",  @"JobSuccessFoundPromoted",  v5,  1LL);
    -[MADAutoAssetJob doneWithAllJobs:](self, "doneWithAllJobs:", @"JobSuccessFoundPromoted");
    -[MADAutoAssetJob autoAssetJobFinished:forJobFinishedReason:]( self,  "autoAssetJobFinished:forJobFinishedReason:",  @"JobSuccessFoundPromoted",  @"SUCCESS(IMMEDIATE_PROMOTED)");
  }

  return 0LL;
}

- (int64_t)action_JobSuccessPatchedSchedule:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    -[MADAutoAssetJob statusChange:catalogAnomaly:forReason:]( self,  "statusChange:catalogAnomaly:forReason:",  @"JobSuccessPatchedSchedule",  6103LL,  @"action JobSuccessPatchedSchedule should never execute for set-job");
  }

  else
  {
    -[MADAutoAssetJob statusChangeSuccesfullyPatched:]( self,  "statusChangeSuccesfullyPatched:",  @"JobSuccessPatchedSchedule");
    -[MADAutoAssetJob foundAndDownloaded:forJobParam:wasPatched:]( self,  "foundAndDownloaded:forJobParam:wasPatched:",  @"JobSuccessPatchedSchedule",  v5,  1LL);
    -[MADAutoAssetJob doneWithAllJobs:](self, "doneWithAllJobs:", @"JobSuccessPatchedSchedule");
    -[MADAutoAssetJob autoAssetJobFinished:forJobFinishedReason:]( self,  "autoAssetJobFinished:forJobFinishedReason:",  @"JobSuccessPatchedSchedule",  @"SUCCESS(PATCHED)");
  }

  return 0LL;
}

- (int64_t)action_JobSuccessDownloadedSchedule:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    -[MADAutoAssetJob statusChange:catalogAnomaly:forReason:]( self,  "statusChange:catalogAnomaly:forReason:",  @"JobSuccessDownloadedSchedule",  6103LL,  @"action JobSuccessDownloadedSchedule should never execute for set-job");
  }

  else
  {
    -[MADAutoAssetJob statusChangeSuccessfullyDownloaded:]( self,  "statusChangeSuccessfullyDownloaded:",  @"JobSuccessDownloadedSchedule");
    -[MADAutoAssetJob foundAndDownloaded:forJobParam:wasPatched:]( self,  "foundAndDownloaded:forJobParam:wasPatched:",  @"JobSuccessDownloadedSchedule",  v5,  0LL);
    -[MADAutoAssetJob doneWithAllJobs:](self, "doneWithAllJobs:", @"JobSuccessDownloadedSchedule");
    -[MADAutoAssetJob autoAssetJobFinished:forJobFinishedReason:]( self,  "autoAssetJobFinished:forJobFinishedReason:",  @"JobSuccessDownloadedSchedule",  @"SUCCESS(DOWNLOADED)");
  }

  return 0LL;
}

- (int64_t)action_JobSuccessAlreadyDownloaded:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[MADAutoAssetJob doneWithAllJobs:](self, "doneWithAllJobs:", @"JobSuccessAlreadyDownloaded");
  -[MADAutoAssetJob autoAssetJobFinished:forJobFinishedReason:]( self,  "autoAssetJobFinished:forJobFinishedReason:",  @"JobSuccessAlreadyDownloaded",  @"SUCCESS(ALREADY_DOWNLOADED)");
  return 0LL;
}

- (int64_t)action_JobSuccessPersonalized:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    -[MADAutoAssetJob statusChange:catalogAnomaly:forReason:]( self,  "statusChange:catalogAnomaly:forReason:",  @"JobSuccessPersonalized",  6103LL,  @"action JobSuccessPersonalized should never execute for set-job");
  }

  else
  {
    -[MADAutoAssetJob statusChangeSuccessfullyDownloaded:]( self,  "statusChangeSuccessfullyDownloaded:",  @"JobSuccessPersonalized");
    -[MADAutoAssetJob foundAndDownloaded:forJobParam:wasPatched:]( self,  "foundAndDownloaded:forJobParam:wasPatched:",  @"JobSuccessPersonalized",  v5,  1LL);
    -[MADAutoAssetJob doneWithAllJobs:](self, "doneWithAllJobs:", @"JobSuccessPersonalized");
    -[MADAutoAssetJob autoAssetJobFinished:forJobFinishedReason:]( self,  "autoAssetJobFinished:forJobFinishedReason:",  @"JobSuccessPersonalized",  @"SUCCESS(PATCHED)");
  }

  return 0LL;
}

- (int64_t)action_JobNoNewerSchedule:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  int64_t v7 = -[MADAutoAssetJob errorCodeForNoNewerContentFound](self, "errorCodeForNoNewerContentFound");
  unsigned int v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"AUTO-JOB(%@)",  @"JobNoNewerSchedule");
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v7,  v8,  0LL,  @"no [newer] version (matching auto-asset-selector) was found"));

  -[MADAutoAssetJob doneWithAllJobs:withLookupError:]( self,  "doneWithAllJobs:withLookupError:",  @"JobNoNewerSchedule",  v9);
  -[MADAutoAssetJob autoAssetJobFinished:forJobFinishedReason:]( self,  "autoAssetJobFinished:forJobFinishedReason:",  @"JobNoNewerSchedule",  @"NO_NEWER");

  return 0LL;
}

- (int64_t)action_JobRevokedSchedule:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  int64_t v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"AUTO-JOB(%@)",  @"JobRevokedSchedule");
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6203LL,  v7,  0LL,  @"previously available version (matching auto-asset-selector) has been revoked"));

  -[MADAutoAssetJob doneWithAllJobs:withLookupError:]( self,  "doneWithAllJobs:withLookupError:",  @"JobRevokedSchedule",  v8);
  -[MADAutoAssetJob autoAssetJobFinished:forJobFinishedReason:]( self,  "autoAssetJobFinished:forJobFinishedReason:",  @"JobRevokedSchedule",  @"REVOKED");

  return 0LL;
}

- (int64_t)action_JobFailedSchedule:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v5 finishedError]);
  -[MADAutoAssetJob determineWhetherNetworkConnectivityError:](self, "determineWhetherNetworkConnectivityError:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v5 finishedError]);
  +[MADAutoAssetHistory recordFailedOperation:fromLayer:forAssetID:withSelector:failingWithError:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordFailedOperation:fromLayer:forAssetID:withSelector:failingWithError:",  504LL,  2LL,  @"UNKNOWN",  v9,  v10);

  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v5 finishedError]);
  -[MADAutoAssetJob doneWithAllJobs:withLookupError:]( self,  "doneWithAllJobs:withLookupError:",  @"JobFailedSchedule",  v11);

  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v5 finishedError]);
  -[MADAutoAssetJob autoAssetJobFinished:forJobFinishedReason:failingWithError:]( self,  "autoAssetJobFinished:forJobFinishedReason:failingWithError:",  @"JobFailedSchedule",  @"FAILED",  v12);

  return 0LL;
}

- (int64_t)action_ReleaseGrantJobFailedSchedule:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[MADAutoAssetJob releaseLookupGrant](self, "releaseLookupGrant");
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v5 finishedError]);
  -[MADAutoAssetJob reportIfSetPallasResponseReceived:](self, "reportIfSetPallasResponseReceived:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 finishedError]);
  -[MADAutoAssetJob determineWhetherNetworkConnectivityError:](self, "determineWhetherNetworkConnectivityError:", v9);

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v5 finishedError]);
  +[MADAutoAssetHistory recordFailedOperation:fromLayer:forAssetID:withSelector:failingWithError:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordFailedOperation:fromLayer:forAssetID:withSelector:failingWithError:",  504LL,  2LL,  @"UNKNOWN",  v10,  v11);

  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v5 finishedError]);
  -[MADAutoAssetJob doneWithAllJobs:withLookupError:]( self,  "doneWithAllJobs:withLookupError:",  @"ReleaseGrantJobFailedSchedule",  v12);

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v5 finishedError]);
  -[MADAutoAssetJob autoAssetJobFinished:forJobFinishedReason:failingWithError:]( self,  "autoAssetJobFinished:forJobFinishedReason:failingWithError:",  @"ReleaseGrantJobFailedSchedule",  @"FAILED(RELEASED_GRANT)",  v13);

  return 0LL;
}

- (int64_t)action_JobPostponedSchedule:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[MADAutoAssetJob replyToJobsWhenCatalogDownloaded:discoveredNewer:]( self,  "replyToJobsWhenCatalogDownloaded:discoveredNewer:",  @"JobPostponedSchedule",  0LL);
  unsigned int v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"AUTO-JOB(%@)",  @"JobPostponedSchedule");
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6401LL,  v8,  0LL,  @"download of the auto-asset content could begin (download postponed [scheduled])"));

  -[MADAutoAssetJob doneWithAllJobs:withLookupError:]( self,  "doneWithAllJobs:withLookupError:",  @"JobPostponedSchedule",  v9);
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue([v5 finishedError]);

  -[MADAutoAssetJob autoAssetJobFinished:forJobFinishedReason:failingWithError:]( self,  "autoAssetJobFinished:forJobFinishedReason:failingWithError:",  @"JobPostponedSchedule",  @"POSTPONED",  v10);
  return 0LL;
}

- (int64_t)action_JobEndedSchedule:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  int64_t v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"AUTO-JOB(%@)",  @"JobEndedSchedule");
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6108LL,  v7,  0LL,  @"auto-asset-job ended with unserviced active client request"));

  -[MADAutoAssetJob doneWithAllJobs:withLookupError:]( self,  "doneWithAllJobs:withLookupError:",  @"JobEndedSchedule",  v8);
  -[MADAutoAssetJob autoAssetJobFinished:forJobFinishedReason:failingWithError:]( self,  "autoAssetJobFinished:forJobFinishedReason:failingWithError:",  @"JobEndedSchedule",  @"ENDED",  v8);

  return 0LL;
}

- (int64_t)action_RecordSimulateOperation:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[MADAutoAssetJob simulateSet:](self, "simulateSet:", v5);
  return 0LL;
}

- (int64_t)action_CheckSimulateEndStatusRequest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[MADAutoAssetJob simulateSet:](self, "simulateSet:", v5);
  -[MADAutoAssetJob simulateEnd:](self, "simulateEnd:", 1LL);
  return 0LL;
}

- (int64_t)action_SimulateSuspendCatalogLookupIssue:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  return 0LL;
}

- (int64_t)action_CancelAssetDownload:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[MADAutoAssetJob setReportingProgress:](self, "setReportingProgress:", 0LL);
  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
  -[MADAutoAssetJob requestDownloadManagerCancelDownload:forDescriptor:]( self,  "requestDownloadManagerCancelDownload:forDescriptor:",  @"CancelAssetDownload",  v7);

  return 0LL;
}

- (int64_t)action_ReleaseGrantCanceling:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[MADAutoAssetJob setHoldingLookupGrant:](self, "setHoldingLookupGrant:", 1LL);
  -[MADAutoAssetJob releaseLookupGrant](self, "releaseLookupGrant");
  return 0LL;
}

- (int64_t)action_FailRequestCanceling:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  unsigned int v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"AUTO-JOB(%@)",  @"FailRequestCanceling");
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6115LL,  v8,  0LL,  @"previously active job has been canceled"));

  -[MADAutoAssetJob finishJobTaskForJobParam:withResponseError:]( self,  "finishJobTaskForJobParam:withResponseError:",  v5,  v9);
  return 0LL;
}

- (int64_t)action_JobFailedCanceled:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  int64_t v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"AUTO-JOB(%@)",  @"JobFailedCanceled");
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6115LL,  v7,  0LL,  @"previously active job that was canceled has completed all tracked operations - cancel complete"));

  -[MADAutoAssetJob doneWithAllJobs:withLookupError:]( self,  "doneWithAllJobs:withLookupError:",  @"JobFailedCanceled",  v8);
  -[MADAutoAssetJob autoAssetJobFinished:forJobFinishedReason:failingWithError:]( self,  "autoAssetJobFinished:forJobFinishedReason:failingWithError:",  @"JobFailedCanceled",  @"CANCELED",  v8);

  return 0LL;
}

- (int64_t)action_ReleaseGrantJobFailedCanceled:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[MADAutoAssetJob setHoldingLookupGrant:](self, "setHoldingLookupGrant:", 1LL);
  -[MADAutoAssetJob releaseLookupGrant](self, "releaseLookupGrant");
  int64_t v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"AUTO-JOB(%@)",  @"JobFailedCanceled");
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6115LL,  v7,  0LL,  @"previously active job that was canceled has completed all tracked operations - cancel complete"));

  -[MADAutoAssetJob doneWithAllJobs:withLookupError:]( self,  "doneWithAllJobs:withLookupError:",  @"ReleaseGrantJobFailedCanceled",  v8);
  -[MADAutoAssetJob autoAssetJobFinished:forJobFinishedReason:failingWithError:]( self,  "autoAssetJobFinished:forJobFinishedReason:failingWithError:",  @"ReleaseGrantJobFailedCanceled",  @"CANCELED(RELEASED_GRANT)",  v8);

  return 0LL;
}

- (int64_t)action_DoneReportingProgress:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[MADAutoAssetJob setReportingProgress:](self, "setReportingProgress:", 0LL);
  return 0LL;
}

- (int64_t)action_AddAtomicAlterDecideFilesystem:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[MADAutoAssetJob clearSetStatusStartingSetJob](self, "clearSetStatusStartingSetJob");
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v5 clientRequest]);
  -[MADAutoAssetJob _rememberIfSchedulerInvolved:](self, "_rememberIfSchedulerInvolved:", v8);

  -[MADAutoAssetJob addToActiveJobTasks:](self, "addToActiveJobTasks:", v5);
  -[MADAutoAssetJob replyToClientForJobParam:withResponseError:]( self,  "replyToClientForJobParam:withResponseError:",  v5,  0LL);

  -[MADAutoAssetJob checkFilesystemAndDecidePurgeOrLookup](self, "checkFilesystemAndDecidePurgeOrLookup");
  return 0LL;
}

- (int64_t)action_AddAtomicNeedDecideFilesystem:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[MADAutoAssetJob clearSetStatusStartingSetJob](self, "clearSetStatusStartingSetJob");
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v5 clientRequest]);
  -[MADAutoAssetJob _rememberIfSchedulerInvolved:](self, "_rememberIfSchedulerInvolved:", v8);

  -[MADAutoAssetJob addToActiveJobTasks:](self, "addToActiveJobTasks:", v5);
  -[MADAutoAssetJob replyToClientForJobParam:withResponseError:]( self,  "replyToClientForJobParam:withResponseError:",  v5,  0LL);

  -[MADAutoAssetJob checkFilesystemAndDecidePurgeOrLookup](self, "checkFilesystemAndDecidePurgeOrLookup");
  return 0LL;
}

- (int64_t)action_AddAtomicCheckDecideFilesystem:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[MADAutoAssetJob clearSetStatusStartingSetJob](self, "clearSetStatusStartingSetJob");
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v5 clientRequest]);
  -[MADAutoAssetJob _rememberIfSchedulerInvolved:](self, "_rememberIfSchedulerInvolved:", v8);

  -[MADAutoAssetJob addToActiveJobTasks:](self, "addToActiveJobTasks:", v5);
  -[MADAutoAssetJob checkFilesystemAndDecidePurgeOrLookup](self, "checkFilesystemAndDecidePurgeOrLookup");
  return 0LL;
}

- (int64_t)action_AddAtomicLockDecideFilesystem:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[MADAutoAssetJob clearSetStatusStartingSetJob](self, "clearSetStatusStartingSetJob");
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v5 clientRequest]);
  -[MADAutoAssetJob _rememberIfSchedulerInvolved:](self, "_rememberIfSchedulerInvolved:", v8);

  -[MADAutoAssetJob addToActiveJobTasks:](self, "addToActiveJobTasks:", v5);
  -[MADAutoAssetJob setLockingAssetContent:](self, "setLockingAssetContent:", 1LL);
  -[MADAutoAssetJob checkFilesystemAndDecidePurgeOrLookup](self, "checkFilesystemAndDecidePurgeOrLookup");
  return 0LL;
}

- (int64_t)action_AddAtomicContinueDecideFilesystem:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[MADAutoAssetJob clearSetStatusStartingSetJob](self, "clearSetStatusStartingSetJob");
  unsigned int v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"AUTO-JOB(%@)",  @"AddAtomicContinueDecideFilesystem");
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6801LL,  v8,  0LL,  @"AddAtomicContinueDecideFilesystem not yet implemented"));

  -[MADAutoAssetJob finishJobTaskForJobParam:withResponseError:]( self,  "finishJobTaskForJobParam:withResponseError:",  v5,  v9);
  return 0LL;
}

- (int64_t)action_AddAtomicEndDecideFilesystem:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[MADAutoAssetJob clearSetStatusStartingSetJob](self, "clearSetStatusStartingSetJob");
  unsigned int v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"AUTO-JOB(%@)",  @"AddAtomicEndDecideFilesystem");
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6801LL,  v8,  0LL,  @"AddAtomicEndDecideFilesystem not yet implemented"));

  -[MADAutoAssetJob finishJobTaskForJobParam:withResponseError:]( self,  "finishJobTaskForJobParam:withResponseError:",  v5,  v9);
  return 0LL;
}

- (int64_t)action_MergeAtomicAlterNeeds:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  unsigned int v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"AUTO-JOB(%@)",  @"MergeAtomicAlterNeeds");
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6801LL,  v8,  0LL,  @"MergeAtomicAlterNeeds not yet implemented"));

  -[MADAutoAssetJob finishJobTaskForJobParam:withResponseError:]( self,  "finishJobTaskForJobParam:withResponseError:",  v5,  v9);
  return 0LL;
}

- (int64_t)action_MergeAtomicNeeds:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[MADAutoAssetJob addClientRequestAndMergeNeeds:forJobEvent:]( self,  "addClientRequestAndMergeNeeds:forJobEvent:",  @"MergeAtomicNeeds",  v5);
  return 0LL;
}

- (int64_t)action_MergeAtomicAddLock:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[MADAutoAssetJob addClientRequestAndMergeNeeds:forJobEvent:]( self,  "addClientRequestAndMergeNeeds:forJobEvent:",  @"MergeAtomicAddLock",  v5);
  return 0LL;
}

- (int64_t)action_MergeAtomicContinueLock:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  unsigned int v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"AUTO-JOB(%@)",  @"MergeAtomicContinueLock");
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6801LL,  v8,  0LL,  @"MergeAtomicContinueLock not yet implemented"));

  -[MADAutoAssetJob finishJobTaskForJobParam:withResponseError:]( self,  "finishJobTaskForJobParam:withResponseError:",  v5,  v9);
  return 0LL;
}

- (int64_t)action_MergeAtomicEndLockDecideInterest:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  unsigned int v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"AUTO-JOB(%@)",  @"MergeAtomicEndLockDecideInterest");
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6801LL,  v8,  0LL,  @"MergeAtomicEndLockDecideInterest not yet implemented"));

  -[MADAutoAssetJob finishJobTaskForJobParam:withResponseError:]( self,  "finishJobTaskForJobParam:withResponseError:",  v5,  v9);
  return 0LL;
}

- (int64_t)action_MergeAtomicAlterDecideLookup:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  unsigned int v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"AUTO-JOB(%@)",  @"MergeAtomicAlterDecideLookup");
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6801LL,  v8,  0LL,  @"MergeAtomicAlterDecideLookup not yet implemented"));

  -[MADAutoAssetJob finishJobTaskForJobParam:withResponseError:]( self,  "finishJobTaskForJobParam:withResponseError:",  v5,  v9);
  return 0LL;
}

- (int64_t)action_MergeAtomicNeedsDecideLookup:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[MADAutoAssetJob addClientRequestAndMergeNeeds:forJobEvent:]( self,  "addClientRequestAndMergeNeeds:forJobEvent:",  @"MergeAtomicNeedsDecideLookup",  v5);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetJob decideFollowupBoost:forJobEvent:boostEvent:noBoostEvent:]( self,  "decideFollowupBoost:forJobEvent:boostEvent:noBoostEvent:",  @"MergeAtomicNeedsDecideLookupBoost",  v5,  @"BoostToUserInitiated",  0LL));
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
    [v9 followupEvent:v8 withInfo:v5];
  }

  return 0LL;
}

- (int64_t)action_MergeAtomicAlterDecideLookupBoost:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  unsigned int v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"AUTO-JOB(%@)",  @"MergeAtomicAlterDecideLookupBoost");
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6801LL,  v8,  0LL,  @"MergeAtomicAlterDecideLookupBoost not yet implemented"));

  -[MADAutoAssetJob finishJobTaskForJobParam:withResponseError:]( self,  "finishJobTaskForJobParam:withResponseError:",  v5,  v9);
  return 0LL;
}

- (int64_t)action_MergeAtomicNeedsDecideLookupBoost:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[MADAutoAssetJob addClientRequestAndMergeNeeds:forJobEvent:]( self,  "addClientRequestAndMergeNeeds:forJobEvent:",  @"MergeAtomicNeedsDecideLookupBoost",  v5);
  -[MADAutoAssetJob replyToJobsWhenCatalogDownloaded:discoveredNewer:]( self,  "replyToJobsWhenCatalogDownloaded:discoveredNewer:",  @"MergeAtomicNeedsDecideLookupBoost",  1LL);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetJob decideFollowupBoost:forJobEvent:boostEvent:noBoostEvent:]( self,  "decideFollowupBoost:forJobEvent:boostEvent:noBoostEvent:",  @"MergeAtomicNeedsDecideLookupBoost",  v5,  @"BoostToUserInitiated",  0LL));
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
    [v9 followupEvent:v8 withInfo:v5];
  }

  return 0LL;
}

- (int64_t)action_MergeAtomicLockDecideLookupBoost:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[MADAutoAssetJob addClientRequestAndMergeNeeds:forJobEvent:]( self,  "addClientRequestAndMergeNeeds:forJobEvent:",  @"MergeAtomicLockDecideLookupBoost",  v5);
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetJob decideFollowupBoost:forJobEvent:boostEvent:noBoostEvent:]( self,  "decideFollowupBoost:forJobEvent:boostEvent:noBoostEvent:",  @"MergeAtomicLockDecideLookupBoost",  v5,  @"BoostToUserInitiated",  0LL));
  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
    [v9 followupEvent:v8 withInfo:v5];
  }

  return 0LL;
}

- (int64_t)action_MergeAtomicCntnuDecideLookupBoost:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  int64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  unsigned int v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"AUTO-JOB(%@)",  @"MergeAtomicCntnuDecideLookupBoost");
  id v9 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6801LL,  v8,  0LL,  @"MergeAtomicCntnuDecideLookupBoost not yet implemented"));

  -[MADAutoAssetJob finishJobTaskForJobParam:withResponseError:]( self,  "finishJobTaskForJobParam:withResponseError:",  v5,  v9);
  return 0LL;
}

- (int64_t)action_SetCalculateDownloadSpace:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  int64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  unsigned int v8 = objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob _updateLatestSummary](self, "_updateLatestSummary"));
  unsigned int v10 = -[MADAutoAssetJobParam initWithSafeSummary:](v8, "initWithSafeSummary:", v9);
  [v7 postEvent:@"SetEnoughSpaceForDownload" withInfo:v10];

  return 0LL;
}

- (int64_t)action_SetDecideDownload:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    if (-[MADAutoAssetJob rampingForeground](self, "rampingForeground")) {
      -[MADAutoAssetJob setRampingForegroundLatched:](self, "setRampingForegroundLatched:", 1LL);
    }
    id v7 = -[MADAutoAssetJob newAssetDownloadOptions](self, "newAssetDownloadOptions");
    -[MADAutoAssetJob setAssetDownloadOptions:](self, "setAssetDownloadOptions:", v7);

    -[MADAutoAssetJob latchWhetherDownloadingUserInitiated](self, "latchWhetherDownloadingUserInitiated");
    unsigned int v8 = -[MADAutoAssetJob placeNextSetAssetDescriptorToDownload:restrictToFull:error:]( self,  "placeNextSetAssetDescriptorToDownload:restrictToFull:error:",  @"SetDecideDownload",  0LL,  0LL);
    unsigned int v9 = -[MADAutoAssetJob downloadingUserInitiated](self, "downloadingUserInitiated");
    unsigned int v10 = @"SetDownloadUserFull";
    if (v8) {
      unsigned int v10 = @"SetDownloadUserPatch";
    }
    BOOL v11 = @"SetDownloadAutoPatch";
    if (!v8) {
      BOOL v11 = @"SetDownloadAutoFull";
    }
    if (v9) {
      BOOL v12 = v10;
    }
    else {
      BOOL v12 = v11;
    }
    -[MADAutoAssetJob setReportingProgress:](self, "setReportingProgress:", 1LL);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assignedSetDescriptor](self, "assignedSetDescriptor"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 discoveredAtomicInstance]);
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
    [v15 setNewerAtomicInstanceDiscovered:v14];

    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetJob foundSetNewerDiscoveredAtomicEntries]( self,  "foundSetNewerDiscoveredAtomicEntries"));
    int v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
    [v17 setNewerDiscoveredAtomicEntries:v16];

    int v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 currentNotifications]);
    [v19 setAtomicInstanceDiscovered:1];

    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 currentNotifications]);
    [v21 setDownloadPending:1];

    -[MADAutoAssetJob updateAutoAssetSetDescriptor](self, "updateAutoAssetSetDescriptor");
    -[MADAutoAssetJob replyToJobsWhenCatalogDownloaded:discoveredNewer:]( self,  "replyToJobsWhenCatalogDownloaded:discoveredNewer:",  @"SetDecideDownload",  1LL);
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
    __int16 v23 = objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob _updateLatestSummary](self, "_updateLatestSummary"));
    __int16 v25 = -[MADAutoAssetJobParam initWithSafeSummary:](v23, "initWithSafeSummary:", v24);
    [v22 followupEvent:v12 withInfo:v25];
  }

  else
  {
    -[MADAutoAssetJob statusChange:catalogAnomaly:forReason:]( self,  "statusChange:catalogAnomaly:forReason:",  @"SetDecideDownload",  6103LL,  @"action SetDecideDownload should only execute for set-job");
  }

  return 0LL;
}

- (int64_t)action_SetDoneDetermine:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  if (-[MADAutoAssetJob stagerJob](self, "stagerJob"))
  {
    if (!-[MADAutoAssetJob stagerJobResultsReported](self, "stagerJobResultsReported")) {
      -[MADAutoAssetJob stagerJobDetermineDone:reportingError:]( self,  "stagerJobDetermineDone:reportingError:",  @"SetDoneDetermine",  0LL);
    }
  }

  else
  {
    -[MADAutoAssetJob trackAnomaly:forReason:]( self,  "trackAnomaly:forReason:",  6103LL,  @"{SetDoneDetermine} not a stager-job");
  }

  return 0LL;
}

- (int64_t)action_SetLookupSuccessContinue:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[MADAutoAssetJob releaseLookupGrant](self, "releaseLookupGrant");
  -[MADAutoAssetJob replyToJobsWhenCatalogDownloaded:discoveredNewer:]( self,  "replyToJobsWhenCatalogDownloaded:discoveredNewer:",  @"SetLookupSuccessContinue",  0LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  unsigned int v8 = objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob _updateLatestSummary](self, "_updateLatestSummary"));
  unsigned int v10 = -[MADAutoAssetJobParam initWithSafeSummary:](v8, "initWithSafeSummary:", v9);
  [v7 followupEvent:@"LookupContinue" withInfo:v10];

  return 0LL;
}

- (int64_t)action_SetLookupNoneContinue:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[MADAutoAssetJob releaseLookupGrant](self, "releaseLookupGrant");
  -[MADAutoAssetJob replyToJobsWhenCatalogDownloaded:discoveredNewer:]( self,  "replyToJobsWhenCatalogDownloaded:discoveredNewer:",  @"SetLookupNoneContinue",  0LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  unsigned int v8 = objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam);
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob _updateLatestSummary](self, "_updateLatestSummary"));
  unsigned int v10 = -[MADAutoAssetJobParam initWithSafeSummary:](v8, "initWithSafeSummary:", v9);
  [v7 followupEvent:@"LookupContinue" withInfo:v10];

  return 0LL;
}

- (int64_t)action_SetLookupNoNewerContinue:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[MADAutoAssetJob releaseLookupGrant](self, "releaseLookupGrant");
  if (-[MADAutoAssetJob tryPersonalizeFailed](self, "tryPersonalizeFailed"))
  {
    uint64_t v7 = 6535LL;
  }

  else if (-[MADAutoAssetJob foundSameAtomicInstanceAlreadyDownloaded]( self,  "foundSameAtomicInstanceAlreadyDownloaded"))
  {
    uint64_t v7 = 6205LL;
  }

  else
  {
    uint64_t v7 = 6201LL;
  }

  unsigned int v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"AUTO-SET-JOB(%@)",  @"LookupNoNewerContinue");
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v7,  v8,  0LL,  @"no [newer] server-side atomic-instance (for auto-asset-set) was found"));

  if (-[MADAutoAssetJob foundSameAtomicInstanceAlreadyDownloaded](self, "foundSameAtomicInstanceAlreadyDownloaded")) {
    -[MADAutoAssetJob replyToJobsWhenOperationFoundSame:forCheckAtomic:withLookupError:]( self,  "replyToJobsWhenOperationFoundSame:forCheckAtomic:withLookupError:",  @"SetLookupNoNewerContinue",  1LL,  v9);
  }
  else {
    -[MADAutoAssetJob replyToJobsWhenLookupFailed:withLookupError:]( self,  "replyToJobsWhenLookupFailed:withLookupError:",  @"SetLookupNoNewerContinue",  v9);
  }
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  BOOL v11 = objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam);
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob _updateLatestSummary](self, "_updateLatestSummary"));
  uint64_t v13 = -[MADAutoAssetJobParam initWithSafeSummary:](v11, "initWithSafeSummary:", v12);
  [v10 followupEvent:@"LookupContinue" withInfo:v13];

  return 0LL;
}

- (int64_t)action_SetJobNoneSchedule:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[MADAutoAssetJob replyToJobsWhenCatalogDownloaded:discoveredNewer:]( self,  "replyToJobsWhenCatalogDownloaded:discoveredNewer:",  @"SetJobNoneSchedule",  0LL);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetIdentifier](self, "autoAssetSetIdentifier"));
  +[MADAutoAssetControlManager postSetNotificationName:forAssetSetIdentifier:fromModule:fromLocation:]( &OBJC_CLASS___MADAutoAssetControlManager,  "postSetNotificationName:forAssetSetIdentifier:fromModule:fromLocation:",  @"ATOMIC_INSTANCE_NO_ENTRIES",  v7,  @"AUTO-JOB",  @"SetJobNoneSchedule");

  unsigned int v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"AUTO-SET-JOB(%@)",  @"SetJobNoneSchedule");
  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6556LL,  v8,  0LL,  @"server indicated that none of the auto-asset-entries making up the set are available"));

  -[MADAutoAssetJob doneWithAllJobs:withLookupError:]( self,  "doneWithAllJobs:withLookupError:",  @"SetJobNoneSchedule",  v9);
  -[MADAutoAssetJob autoAssetJobFinished:forJobFinishedReason:failingWithError:]( self,  "autoAssetJobFinished:forJobFinishedReason:failingWithError:",  @"SetJobNoneSchedule",  @"NONE",  v9);

  return 0LL;
}

- (int64_t)action_SetJobNoNewerSchedule:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  if (-[MADAutoAssetJob becameLatestToVend](self, "becameLatestToVend"))
  {
    -[MADAutoAssetJob _commitPrePersonalized:error:]( self,  "_commitPrePersonalized:error:",  @"SetJobSuccessSchedule",  0LL);
    -[MADAutoAssetJob finishSetJobDownloadedNewer:forJobFinishedReason:]( self,  "finishSetJobDownloadedNewer:forJobFinishedReason:",  @"SetJobSuccessSchedule",  @"SUCCESS(DOWNLOADED)");
  }

  else
  {
    if (-[MADAutoAssetJob tryPersonalizeFailed](self, "tryPersonalizeFailed"))
    {
      uint64_t v7 = 6535LL;
    }

    else if (-[MADAutoAssetJob foundSameAtomicInstanceAlreadyDownloaded]( self,  "foundSameAtomicInstanceAlreadyDownloaded"))
    {
      uint64_t v7 = 6205LL;
    }

    else
    {
      uint64_t v7 = 6201LL;
    }

    unsigned int v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"AUTO-SET-JOB(%@)",  @"SetJobNoNewerSchedule");
    unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v7,  v8,  0LL,  @"no [newer] atomic-instance of auto-asset-set was found"));

    -[MADAutoAssetJob doneWithAllJobs:withLookupError:]( self,  "doneWithAllJobs:withLookupError:",  @"SetJobNoNewerSchedule",  v9);
    -[MADAutoAssetJob autoAssetJobFinished:forJobFinishedReason:failingWithError:]( self,  "autoAssetJobFinished:forJobFinishedReason:failingWithError:",  @"SetJobNoNewerSchedule",  @"NO_NEWER",  v9);
  }

  return 0LL;
}

- (int64_t)action_SetJobFailedSchedule:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v5 finishedError]);
  -[MADAutoAssetJob determineWhetherNetworkConnectivityError:](self, "determineWhetherNetworkConnectivityError:", v8);
  -[MADAutoAssetJob _releaseReservedSpace](self, "_releaseReservedSpace");
  if (v8) {
    goto LABEL_10;
  }
  if (-[MADAutoAssetJob tryPersonalizeFailed](self, "tryPersonalizeFailed"))
  {
    unsigned int v9 = @"unable to personalize secure asset(s) of the set";
    uint64_t v10 = 6535LL;
  }

  else if (-[MADAutoAssetJob foundSameAtomicInstanceAlreadyDownloaded]( self,  "foundSameAtomicInstanceAlreadyDownloaded"))
  {
    if (-[MADAutoAssetJob becameLatestToVend](self, "becameLatestToVend"))
    {
      unsigned int v8 = 0LL;
      goto LABEL_11;
    }

    unsigned int v9 = @"found same content server-side already downloaded (and available to client)";
    uint64_t v10 = 6205LL;
  }

  else
  {
    unsigned int v9 = @"found no newer content server-side";
    uint64_t v10 = 6201LL;
  }

  BOOL v11 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"AUTO-SET-JOB(%@)",  @"JobFailedSchedule");
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v10,  v11,  0LL,  v9));

  if (v8)
  {
LABEL_10:
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assignedSetDescriptor](self, "assignedSetDescriptor"));
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 clientDomainName]);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assignedSetDescriptor](self, "assignedSetDescriptor"));
    unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v14 assetSetIdentifier]);
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assignedSetDescriptor](self, "assignedSetDescriptor"));
    int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 discoveredAtomicInstance]);
    +[MADAutoAssetHistory recordFailedOperation:fromLayer:forClientDomainName:forAssetSetIdentifier:forAtomicInstance:failingWithError:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordFailedOperation:fromLayer:forClientDomainName:forAssetSetIdentifier:forAtomicInstance:failingWithError:",  504LL,  2LL,  v13,  v15,  v17,  v8);
  }

- (int64_t)action_SetJobLookupRevokedContinue:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[MADAutoAssetJob releaseLookupGrant](self, "releaseLookupGrant");
  uint64_t v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"AUTO-SET-JOB(%@)",  @"SetJobLookupRevokedContinue");
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6203LL,  v7,  0LL,  @"previously available atomic-instance of auto-asset-set has been revoked"));

  unsigned int v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
  +[MADAutoAssetHistory recordFailedOperation:fromLayer:forAssetID:withSelector:failingWithError:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordFailedOperation:fromLayer:forAssetID:withSelector:failingWithError:",  506LL,  2LL,  @"UNKNOWN",  v9,  v8);

  -[MADAutoAssetJob replyToJobsWhenLookupFailed:withLookupError:]( self,  "replyToJobsWhenLookupFailed:withLookupError:",  @"SetJobLookupRevokedContinue",  v8);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  BOOL v11 = objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam);
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob _updateLatestSummary](self, "_updateLatestSummary"));
  uint64_t v13 = -[MADAutoAssetJobParam initWithSafeSummary:](v11, "initWithSafeSummary:", v12);
  [v10 followupEvent:@"SetLookupContinue" withInfo:v13];

  return 0LL;
}

- (int64_t)action_SetJobHealPersonalizeNext:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetUUID](self, "autoAssetUUID"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob tryPersonalizeDescriptors](self, "tryPersonalizeDescriptors"));
  id v9 = [v8 count];

  if (!v9)
  {
    __int16 v20 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"AUTO-SET-JOB(%@)",  @"SetJobHealPersonalizeNext");
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6108LL,  v20,  0LL,  @"at point where continuing attempt to heal yet no descriptors to try to personalize"));

    id v21 = -[MADAutoAssetJobParam initForFinishedJobID:withError:]( objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam),  "initForFinishedJobID:withError:",  v7,  v11);
    -[MADAutoAssetJob trackAnomaly:forReason:]( self,  "trackAnomaly:forReason:",  6110LL,  @"{SetJobHealPersonalizeNext} no tryPersonalizeDescriptors");
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
    [v22 postEvent:@"PersonalizationFailure" withInfo:v21];

LABEL_6:
    goto LABEL_7;
  }

  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob tryPersonalizeDescriptors](self, "tryPersonalizeDescriptors"));
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndex:0]);

  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob tryPersonalizeDescriptors](self, "tryPersonalizeDescriptors"));
  [v12 removeObjectAtIndex:0];

  uint64_t v13 = objc_alloc(&OBJC_CLASS___MAAutoAssetSelector);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 assetType]);
  unsigned int v15 = (void *)objc_claimAutoreleasedReturnValue([v11 assetSpecifier]);
  unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v11 assetVersion]);
  id v17 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:]( v13,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:",  v14,  v15,  v16);
  -[MADAutoAssetJob setTryPersonalizeSelector:](self, "setTryPersonalizeSelector:", v17);

  int v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob tryPersonalizeSelector](self, "tryPersonalizeSelector"));
  if (!v18)
  {
    __int16 v23 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"AUTO-SET-JOB(%@)",  @"SetJobHealPersonalizeNext");
    id v21 = (id)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6108LL,  v23,  0LL,  @"unable to build auto-asset-selector for asset-descriptor to be healed"));

    id v24 = -[MADAutoAssetJobParam initForFinishedJobID:withError:]( objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam),  "initForFinishedJobID:withError:",  v7,  v21);
    -[MADAutoAssetJob trackAnomaly:forReason:]( self,  "trackAnomaly:forReason:",  6101LL,  @"{SetJobHealPersonalizeNext} unable to build auto-asset-selector for asset-descriptor to be healed");
    __int16 v25 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[MADAutoAssetJob setTryPersonalizeDescriptors:](self, "setTryPersonalizeDescriptors:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
    [v26 postEvent:@"PersonalizationFailure" withInfo:v24];

    goto LABEL_6;
  }

  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = __58__MADAutoAssetJob_action_SetJobHealPersonalizeNext_error___block_invoke;
  v28[3] = &unk_34F2E0;
  id v29 = v7;
  v30 = self;
  +[MADAutoAssetSecure personalizeDownloaded:personalizingDescriptor:allowingNetwork:committingPersonalization:completion:]( &OBJC_CLASS___MADAutoAssetSecure,  "personalizeDownloaded:personalizingDescriptor:allowingNetwork:committingPersonalization:completion:",  v19,  v11,  1LL,  0LL,  v28);

LABEL_7:
  return 0LL;
}

void __58__MADAutoAssetJob_action_SetJobHealPersonalizeNext_error___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v4 = a3;
  id v9 = -[MADAutoAssetJobParam initForFinishedJobID:withError:]( objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam),  "initForFinishedJobID:withError:",  *(void *)(a1 + 32),  v4);

  id v5 = @"PersonalizationFailure";
  if (!v4) {
    id v5 = @"PersonalizationSuccess";
  }
  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = v5;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 autoJobFSM]);
  [v8 postEvent:v7 withInfo:v9];
}

- (int64_t)action_SetDownloadNewestFull:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  if (-[MADAutoAssetJob remainingSetDescriptorToBeDownloaded](self, "remainingSetDescriptorToBeDownloaded"))
  {
    id v15 = 0LL;
    -[MADAutoAssetJob placeNextSetAssetDescriptorToDownload:restrictToFull:error:]( self,  "placeNextSetAssetDescriptorToDownload:restrictToFull:error:",  @"SetDownloadNewestFull",  1LL,  &v15);
    id v7 = v15;
    if (!v7)
    {
      -[MADAutoAssetJob statusChangeStartingAssetDownload:downloadingPatch:]( self,  "statusChangeStartingAssetDownload:downloadingPatch:",  @"SetDownloadNewestFull",  0LL);
      id v10 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerFull](self, "foundNewerFull"));
      -[MADAutoAssetJob requestDownloadManagerAssetDownload:forDescriptor:withBaseForPatch:]( self,  "requestDownloadManagerAssetDownload:forDescriptor:withBaseForPatch:",  @"SetDownloadNewestFull",  v10,  0LL);
      goto LABEL_7;
    }

    unsigned int v8 = objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetUUID](self, "autoAssetUUID"));
    id v10 = -[MADAutoAssetJobParam initForFinishedJobID:withError:](v8, "initForFinishedJobID:withError:", v9, v7);
  }

  else
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6108LL,  @"AUTO-SET-JOB(SetDownloadNewestFull)",  0LL,  @"no next specifier to download (at location SetDownloadNewestFull)"));
    BOOL v11 = objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam);
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetUUID](self, "autoAssetUUID"));
    id v10 = -[MADAutoAssetJobParam initForFinishedJobID:withError:](v11, "initForFinishedJobID:withError:", v12, v7);

    -[MADAutoAssetJob trackAnomaly:forReason:]( self,  "trackAnomaly:forReason:",  6108LL,  @"{SetDownloadNewestFull} invalid nextSetSpecifierToDownload value");
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  [v13 postEvent:@"SetDownloadFailureNoFull" withInfo:v10];

LABEL_7:
  return 0LL;
}

- (int64_t)action_SetDownloadNext:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  if (-[MADAutoAssetJob remainingSetDescriptorToBeDownloaded](self, "remainingSetDescriptorToBeDownloaded"))
  {
    id v16 = 0LL;
    -[MADAutoAssetJob placeNextSetAssetDescriptorToDownload:restrictToFull:error:]( self,  "placeNextSetAssetDescriptorToDownload:restrictToFull:error:",  @"SetDownloadNext",  0LL,  &v16);
    id v7 = v16;
    if (!v7)
    {
      id v14 = -[MADAutoAssetJob newAssetDownloadOptions](self, "newAssetDownloadOptions");
      -[MADAutoAssetJob setAssetDownloadOptions:](self, "setAssetDownloadOptions:", v14);

      -[MADAutoAssetJob statusChangeStartingAssetDownload:downloadingPatch:]( self,  "statusChangeStartingAssetDownload:downloadingPatch:",  @"SetDownloadNext",  0LL);
      id v10 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerFull](self, "foundNewerFull"));
      -[MADAutoAssetJob requestDownloadManagerAssetDownload:forDescriptor:withBaseForPatch:]( self,  "requestDownloadManagerAssetDownload:forDescriptor:withBaseForPatch:",  @"SetDownloadNext",  v10,  0LL);
      goto LABEL_7;
    }

    unsigned int v8 = objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetUUID](self, "autoAssetUUID"));
    id v10 = -[MADAutoAssetJobParam initForFinishedJobID:withError:](v8, "initForFinishedJobID:withError:", v9, v7);
  }

  else
  {
    id v7 = (id)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6108LL,  @"AUTO-SET-JOB(SetDownloadNext)",  0LL,  @"no next specifier to download (at location SetDownloadNext)"));
    BOOL v11 = objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam);
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetUUID](self, "autoAssetUUID"));
    id v10 = -[MADAutoAssetJobParam initForFinishedJobID:withError:](v11, "initForFinishedJobID:withError:", v12, v7);

    -[MADAutoAssetJob trackAnomaly:forReason:]( self,  "trackAnomaly:forReason:",  6108LL,  @"{SetDownloadNext} invalid nextSetSpecifierToDownload value");
  }

  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  [v13 postEvent:@"SetDownloadFailureNoFull" withInfo:v10];

LABEL_7:
  return 0LL;
}

- (int64_t)action_SetDownloadSameFull:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[MADAutoAssetJob statusChangeStartingAssetDownload:downloadingPatch:]( self,  "statusChangeStartingAssetDownload:downloadingPatch:",  @"SetDownloadSameFull",  0LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerFull](self, "foundNewerFull"));
  -[MADAutoAssetJob requestDownloadManagerAssetDownload:forDescriptor:withBaseForPatch:]( self,  "requestDownloadManagerAssetDownload:forDescriptor:withBaseForPatch:",  @"SetDownloadSameFull",  v7,  0LL);

  return 0LL;
}

- (int64_t)action_UserInitiatedSetDownloadNext:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[MADAutoAssetJob setBoostedToUserInitiated:](self, "setBoostedToUserInitiated:", 1LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assetDownloadOptions](self, "assetDownloadOptions"));
  [v7 setDiscretionary:0];

  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
  [v8 setDownloadUserInitiated:1];

  -[MADAutoAssetJob statusChangeStartingAssetDownload:downloadingPatch:]( self,  "statusChangeStartingAssetDownload:downloadingPatch:",  @"UserInitiatedSetDownloadNext",  0LL);
  if (!-[MADAutoAssetJob remainingSetDescriptorToBeDownloaded](self, "remainingSetDescriptorToBeDownloaded"))
  {
    id v10 = (id)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6108LL,  @"AUTO-SET-JOB(UserInitiatedSetDownloadNext)",  0LL,  @"no next specifier to download (at location UserInitiatedSetDownloadNext)"));
    id v14 = objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetUUID](self, "autoAssetUUID"));
    id v13 = -[MADAutoAssetJobParam initForFinishedJobID:withError:](v14, "initForFinishedJobID:withError:", v15, v10);

    -[MADAutoAssetJob trackAnomaly:forReason:]( self,  "trackAnomaly:forReason:",  6108LL,  @"{UserInitiatedSetDownloadNext} invalid nextSetSpecifierToDownload value");
    goto LABEL_5;
  }

  id v19 = 0LL;
  BOOL v9 = -[MADAutoAssetJob placeNextSetAssetDescriptorToDownload:restrictToFull:error:]( self,  "placeNextSetAssetDescriptorToDownload:restrictToFull:error:",  @"UserInitiatedSetDownloadNext",  0LL,  &v19);
  id v10 = v19;
  if (v10)
  {
    BOOL v11 = objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam);
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetUUID](self, "autoAssetUUID"));
    id v13 = -[MADAutoAssetJobParam initForFinishedJobID:withError:](v11, "initForFinishedJobID:withError:", v12, v10);

LABEL_5:
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
    [v16 postEvent:@"SetDownloadFailureNoFull" withInfo:v13];

    goto LABEL_6;
  }

  -[MADAutoAssetJob statusChangeStartingAssetDownload:downloadingPatch:]( self,  "statusChangeStartingAssetDownload:downloadingPatch:",  @"UserInitiatedSetDownloadNext",  v9);
  if (v9)
  {
    id v13 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerPatch](self, "foundNewerPatch"));
    int v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob baseForPatch](self, "baseForPatch"));
    -[MADAutoAssetJob requestDownloadManagerAssetDownload:forDescriptor:withBaseForPatch:]( self,  "requestDownloadManagerAssetDownload:forDescriptor:withBaseForPatch:",  @"UserInitiatedSetDownloadNext",  v13,  v18);
  }

  else
  {
    id v13 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerFull](self, "foundNewerFull"));
    -[MADAutoAssetJob requestDownloadManagerAssetDownload:forDescriptor:withBaseForPatch:]( self,  "requestDownloadManagerAssetDownload:forDescriptor:withBaseForPatch:",  @"UserInitiatedSetDownloadNext",  v13,  0LL);
  }

- (int64_t)action_ReportFailBoostSetDownloadNext:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
  BOOL v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 oslog]);

  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[MADAutoAssetJob action_ReportFailBoostSetDownloadNext:error:].cold.1();
  }

  return 0LL;
}

- (int64_t)action_SetJobSuccessSchedule:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[MADAutoAssetJob _releaseReservedSpace](self, "_releaseReservedSpace");
  -[MADAutoAssetJob _commitPrePersonalized:error:]( self,  "_commitPrePersonalized:error:",  @"SetJobSuccessSchedule",  0LL);
  -[MADAutoAssetJob finishSetJobDownloadedNewer:forJobFinishedReason:]( self,  "finishSetJobDownloadedNewer:forJobFinishedReason:",  @"SetJobSuccessSchedule",  @"SUCCESS(DOWNLOADED)");
  return 0LL;
}

- (int64_t)action_SetJobSuccessFoundSameSchedule:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[MADAutoAssetJob finishedSetSameVersionFound:]( self,  "finishedSetSameVersionFound:",  @"SetJobSuccessFoundSameSchedule");
  return 0LL;
}

- (int64_t)action_SetJobSuccessFoundPromoted:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[MADAutoAssetJob _commitPrePersonalized:error:]( self,  "_commitPrePersonalized:error:",  @"SetJobSuccessFoundPromoted",  0LL);
  -[MADAutoAssetJob finishSetJobDownloadedNewer:forJobFinishedReason:]( self,  "finishSetJobDownloadedNewer:forJobFinishedReason:",  @"SetJobSuccessFoundPromoted",  @"SUCCESS(IMMEDIATE_PROMOTED)");
  return 0LL;
}

- (int64_t)action_SetJobSuccessAwaiting:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  -[MADAutoAssetJob _commitPrePersonalized:error:]( self,  "_commitPrePersonalized:error:",  @"SetJobSuccessSchedule",  0LL);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
  LODWORD(v6) = +[MADAutoAssetSecure isPersonalizationRequired:forSetDescriptor:]( &OBJC_CLASS___MADAutoAssetSecure,  "isPersonalizationRequired:forSetDescriptor:",  @"SetJobSuccessAwaiting",  v7);

  if ((_DWORD)v6)
  {
    unsigned int v8 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"AUTO-SET-JOB(%@)",  @"SetJobSuccessAwaiting");
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  v8,  0LL,  @"set-job ended with all content downloaded but not all secure could be personalized"));

    -[MADAutoAssetJob replyToJobsWhenLookupFailed:withLookupError:]( self,  "replyToJobsWhenLookupFailed:withLookupError:",  @"SetJobSuccessAwaiting",  v9);
  }

  else
  {
    -[MADAutoAssetJob foundAndDownloadedSet:](self, "foundAndDownloadedSet:", @"SetJobSuccessAwaiting");
    -[MADAutoAssetJob replyToJobsWhenContentDownloaded:]( self,  "replyToJobsWhenContentDownloaded:",  @"SetJobSuccessAwaiting");
  }

  return 0LL;
}

- (int64_t)action_SetJobFailedAwaiting:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  -[MADAutoAssetJob _releaseReservedSpace](self, "_releaseReservedSpace");
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assignedSetDescriptor](self, "assignedSetDescriptor"));
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 clientDomainName]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assignedSetDescriptor](self, "assignedSetDescriptor"));
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 assetSetIdentifier]);
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assignedSetDescriptor](self, "assignedSetDescriptor"));
  id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 discoveredAtomicInstance]);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v5 finishedError]);
  +[MADAutoAssetHistory recordFailedOperation:fromLayer:forClientDomainName:forAssetSetIdentifier:forAtomicInstance:failingWithError:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordFailedOperation:fromLayer:forClientDomainName:forAssetSetIdentifier:forAtomicInstance:failingWithError:",  504LL,  2LL,  v9,  v11,  v13,  v14);

  id v15 = (void *)objc_claimAutoreleasedReturnValue([v5 finishedError]);
  -[MADAutoAssetJob replyToJobsWhenLookupFailed:withLookupError:]( self,  "replyToJobsWhenLookupFailed:withLookupError:",  @"SetJobFailedAwaiting",  v15);

  return 0LL;
}

- (int64_t)action_SetJobEndedSchedule:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  id v7 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"AUTO-SET-JOB(%@)",  @"SetJobEndedSchedule");
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6108LL,  v7,  0LL,  @"set-job ended with unserviced active client request"));

  -[MADAutoAssetJob _releaseReservedSpace](self, "_releaseReservedSpace");
  -[MADAutoAssetJob doneWithAllJobs:withLookupError:]( self,  "doneWithAllJobs:withLookupError:",  @"SetJobEndedSchedule",  v8);
  -[MADAutoAssetJob autoAssetJobFinished:forJobFinishedReason:failingWithError:]( self,  "autoAssetJobFinished:forJobFinishedReason:failingWithError:",  @"SetJobEndedSchedule",  @"ENDED",  v8);

  return 0LL;
}

- (int64_t)action_SetJobTryPersonalizeHeal:(id)a3 error:(id *)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3, a4));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetUUID](self, "autoAssetUUID"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob tryPersonalizeDescriptors](self, "tryPersonalizeDescriptors"));
  id v9 = [v8 count];

  if (!v9)
  {
    __int16 v20 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"AUTO-SET-JOB(%@)",  @"SetJobTryPersonalizeHeal");
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6108LL,  v20,  0LL,  @"at point where starting attempt to heal yet no descriptors to try to personalize"));

    id v21 = -[MADAutoAssetJobParam initForFinishedJobID:withError:]( objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam),  "initForFinishedJobID:withError:",  v7,  v11);
    -[MADAutoAssetJob trackAnomaly:forReason:]( self,  "trackAnomaly:forReason:",  6110LL,  @"{SetJobTryPersonalizeHeal} no tryPersonalizeDescriptors");
    id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
    [v22 postEvent:@"PersonalizationFailure" withInfo:v21];

LABEL_6:
    goto LABEL_7;
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob tryPersonalizeDescriptors](self, "tryPersonalizeDescriptors"));
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 objectAtIndex:0]);

  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob tryPersonalizeDescriptors](self, "tryPersonalizeDescriptors"));
  [v12 removeObjectAtIndex:0];

  id v13 = objc_alloc(&OBJC_CLASS___MAAutoAssetSelector);
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v11 assetType]);
  id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 assetSpecifier]);
  id v16 = (void *)objc_claimAutoreleasedReturnValue([v11 assetVersion]);
  id v17 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:]( v13,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:",  v14,  v15,  v16);
  -[MADAutoAssetJob setTryPersonalizeSelector:](self, "setTryPersonalizeSelector:", v17);

  int v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob tryPersonalizeSelector](self, "tryPersonalizeSelector"));
  if (!v18)
  {
    __int16 v23 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"AUTO-SET-JOB(%@)",  @"SetJobTryPersonalizeHeal");
    id v21 = (id)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6108LL,  v23,  0LL,  @"unable to build auto-asset-selector for asset-descriptor to be healed"));

    id v24 = -[MADAutoAssetJobParam initForFinishedJobID:withError:]( objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam),  "initForFinishedJobID:withError:",  v7,  v21);
    -[MADAutoAssetJob trackAnomaly:forReason:]( self,  "trackAnomaly:forReason:",  6101LL,  @"{SetJobTryPersonalizeHeal} unable to build auto-asset-selector for asset-descriptor to be healed");
    __int16 v25 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[MADAutoAssetJob setTryPersonalizeDescriptors:](self, "setTryPersonalizeDescriptors:", v25);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
    [v26 postEvent:@"PersonalizationFailure" withInfo:v24];

    goto LABEL_6;
  }

  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472LL;
  v28[2] = __57__MADAutoAssetJob_action_SetJobTryPersonalizeHeal_error___block_invoke;
  v28[3] = &unk_34F2E0;
  id v29 = v7;
  v30 = self;
  +[MADAutoAssetSecure personalizeDownloaded:personalizingDescriptor:allowingNetwork:committingPersonalization:completion:]( &OBJC_CLASS___MADAutoAssetSecure,  "personalizeDownloaded:personalizingDescriptor:allowingNetwork:committingPersonalization:completion:",  v19,  v11,  1LL,  0LL,  v28);

LABEL_7:
  return 0LL;
}

void __57__MADAutoAssetJob_action_SetJobTryPersonalizeHeal_error___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v4 = a3;
  id v9 = -[MADAutoAssetJobParam initForFinishedJobID:withError:]( objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam),  "initForFinishedJobID:withError:",  *(void *)(a1 + 32),  v4);

  id v5 = @"PersonalizationFailure";
  if (!v4) {
    id v5 = @"PersonalizationSuccess";
  }
  id v6 = *(void **)(a1 + 40);
  id v7 = v5;
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v6 autoJobFSM]);
  [v8 postEvent:v7 withInfo:v9];
}

- (int64_t)actionUnknownAction:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"unknown action(%@)",  v5);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 diag]);
  [v8 dumpTracked:v6 dumpingTo:5 usingFilename:0 clearingStatistics:0 clearingHistory:0];

  return 0LL;
}

- (void)clearSetStatusStartingSetJob
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 extendedStateQueue]);
  dispatch_assert_queue_V2(v4);

  id v5 = objc_alloc_init(&OBJC_CLASS___MANAutoAssetSetNotifications);
  -[MADAutoAssetJob setCurrentSetNotifications:](self, "setCurrentSetNotifications:", v5);

  int v18 = objc_alloc(&OBJC_CLASS___MANAutoAssetSetStatus);
  id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assignedSetDescriptor](self, "assignedSetDescriptor"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v19 clientDomainName]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assignedSetDescriptor](self, "assignedSetDescriptor"));
  unsigned int v8 = (void *)objc_claimAutoreleasedReturnValue([v7 assetSetIdentifier]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob setConfiguration](self, "setConfiguration"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 autoAssetEntries]);
  BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetNotifications](self, "currentSetNotifications"));
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientSetPolicy](self, "aggregatedClientSetPolicy"));
  unsigned __int8 v13 = -[MADAutoAssetJob haveReceivedLookupResponse](self, "haveReceivedLookupResponse");
  LOBYTE(v5) = -[MADAutoAssetJob vendingAtomicInstanceForConfiguredEntries]( self,  "vendingAtomicInstanceForConfiguredEntries");
  BYTE2(v17) = -[MADAutoAssetJob downloadingUserInitiated](self, "downloadingUserInitiated");
  BYTE1(v17) = (_BYTE)v5;
  LOBYTE(v17) = v13;
  id v14 = -[MANAutoAssetSetStatus initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:withCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:withDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPolicy:withStagerPolicy:havingReceivedLookupResponse:vendingAtomicInstanceForConfiguredEntries:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:]( v18,  "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:withC atalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNewe rAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloa dedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:withDow nloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPolicy:w ithSchedulerPolicy:withStagerPolicy:havingReceivedLookupResponse:vendingAtomicInstanceForConfiguredEntries:wit hDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurre ntLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:",  v6,  v8,  v10,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL,  v11,  v12,  0LL,  0LL,  v17,  0LL,  -1LL,  -1LL,  0LL,  0LL,  0LL,  0LL);
  -[MADAutoAssetJob setCurrentSetStatus:](self, "setCurrentSetStatus:", v14);

  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
  id v15 = [v20 copy];
  id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob setJobInformation](self, "setJobInformation"));
  [v16 setCurrentSetStatus:v15];
}

- (id)reportSetCatalogDecideFound:(id)a3
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  unsigned int v8 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v9 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  if (v5)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetInstance](self, "autoAssetSetInstance"));

    if (v10)
    {
      unsigned int v108 = -[MADAutoAssetJob buildPotentialDescriptors:fromLookupResults:buildingPatchDescriptors:andFullDescriptors:]( self,  "buildPotentialDescriptors:fromLookupResults:buildingPatchDescriptors:andFullDescriptors:",  @"reportSetCatalogDecideFound",  v5,  v8,  v9);
      BOOL v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
      BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 oslog]);

      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
        id v14 = (const __CFString *)[v5 count];
        v3 = (__CFString *)-[NSMutableDictionary count](v8, "count");
        int buf = 138544130;
        v122 = v13;
        __int16 v123 = 2050;
        v124 = v14;
        __int16 v125 = 2050;
        v126 = v3;
        __int16 v127 = 2050;
        id v128 = -[NSMutableDictionary count](v9, "count");
        _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@:catalogCount:%{public}lu,patchDescriptorCount:%{public}lu,fullDescriptorCount:%{public}lu",  (uint8_t *)&buf,  0x2Au);
      }

      v110 = v8;

      id v15 = (void *)objc_claimAutoreleasedReturnValue([v5 safeStringForKey:@"CachedAssetSetId"]);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
      [v16 setCatalogCachedAssetSetID:v15];

      uint64_t v17 = objc_alloc(&OBJC_CLASS___NSURL);
      int v18 = (void *)objc_claimAutoreleasedReturnValue([v5 safeStringForKey:@"DownloadedFromLive"]);
      id v19 = -[NSURL initWithString:](v17, "initWithString:", v18);
      __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
      [v20 setCatalogDownloadedFromLive:v19];

      id v21 = (void *)objc_claimAutoreleasedReturnValue([v5 safeDateForKey:@"lastTimeChecked"]);
      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
      [v22 setCatalogLastTimeChecked:v21];

      id v109 = v5;
      __int16 v23 = (void *)objc_claimAutoreleasedReturnValue([v5 safeDateForKey:@"postedDate"]);
      id v24 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
      [v24 setCatalogPostedDate:v23];

      v112 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
      __int128 v116 = 0u;
      __int128 v117 = 0u;
      __int128 v118 = 0u;
      __int128 v119 = 0u;
      id obj = v9;
      id v25 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v116,  v120,  16LL);
      if (v25)
      {
        id v26 = v25;
        char v27 = 0;
        uint64_t v113 = *(void *)v117;
        while (1)
        {
          for (i = 0LL; i != v26; i = (char *)i + 1)
          {
            if (*(void *)v117 != v113) {
              objc_enumerationMutation(obj);
            }
            id v29 = -[NSMutableDictionary safeObjectForKey:ofClass:]( obj,  "safeObjectForKey:ofClass:",  *(void *)(*((void *)&v116 + 1) + 8LL * (void)i),  objc_opt_class(&OBJC_CLASS___MADAutoAssetDescriptor));
            v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
            int v31 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetJob latestAssetDescriptorOnFilesystemBySpecifier]( self,  "latestAssetDescriptorOnFilesystemBySpecifier"));
            id v32 = (void *)objc_claimAutoreleasedReturnValue([v30 assetSpecifier]);
            id v33 = [v31 safeObjectForKey:v32 ofClass:objc_opt_class(MADAutoAssetDescriptor)];
            unsigned __int8 v34 = (void *)objc_claimAutoreleasedReturnValue(v33);

            id v35 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
            v36 = (os_log_s *)objc_claimAutoreleasedReturnValue([v35 oslog]);

            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
              if (v30)
              {
                v3 = (__CFString *)objc_claimAutoreleasedReturnValue([v30 summary]);
                v38 = v3;
                if (v34) {
                  goto LABEL_13;
                }
LABEL_15:
                v39 = @"None";
              }

              else
              {
                v38 = @"None";
                if (!v34) {
                  goto LABEL_15;
                }
LABEL_13:
                v111 = (__CFString *)objc_claimAutoreleasedReturnValue([v34 summary]);
                v39 = v111;
              }

              int buf = 138543874;
              v122 = v37;
              __int16 v123 = 2114;
              v124 = v38;
              __int16 v125 = 2114;
              v126 = v39;
              _os_log_impl( &dword_0,  v36,  OS_LOG_TYPE_DEFAULT,  "%{public}@:potentialDescriptor:%{public}@,onFS:%{public}@",  (uint8_t *)&buf,  0x20u);
              if (v34) {

              }
              if (v30) {
            }
              }

            if (v34
              && (v40 = (void *)objc_claimAutoreleasedReturnValue([v30 assetVersion]),
                  char v41 = (void *)objc_claimAutoreleasedReturnValue([v34 assetVersion]),
                  unsigned int v42 = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v40, v41),
                  v41,
                  v40,
                  v42))
            {
              if (+[MADAutoAssetSecure isSecureAsset:forDescriptor:]( &OBJC_CLASS___MADAutoAssetSecure,  "isSecureAsset:forDescriptor:",  @"reportSetCatalogDecideFound",  v30))
              {
                BOOL v43 = objc_alloc(&OBJC_CLASS___MAAutoAssetSelector);
                unsigned __int8 v44 = (void *)objc_claimAutoreleasedReturnValue([v30 assetType]);
                unsigned __int8 v45 = (void *)objc_claimAutoreleasedReturnValue([v30 assetSpecifier]);
                v46 = (void *)objc_claimAutoreleasedReturnValue([v30 assetVersion]);
                id v47 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:]( v43,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:",  v44,  v45,  v46);

                if (v47)
                {
                  if (+[MADAutoAssetSecure isPrePersonalized:forDescriptor:]( &OBJC_CLASS___MADAutoAssetSecure,  "isPrePersonalized:forDescriptor:",  @"reportSetCatalogDecideFound",  v30))
                  {
                    id v48 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
                    uint64_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue([v48 oslog]);

                    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
                    {
                      BOOL v50 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
                      v51 = (__CFString *)objc_claimAutoreleasedReturnValue([v47 summary]);
                      int buf = 138543618;
                      v122 = v50;
                      __int16 v123 = 2114;
                      v124 = v51;
                      _os_log_impl( &dword_0,  v49,  OS_LOG_TYPE_DEFAULT,  "%{public}@\n [AUTO-SECURE][AUTO-PERSONALIZATION][SET-JOB-PRE] pre-personalized secure auto-asset to be part o f atomic-instance (already pre-personalized) | alreadyOnFilesystemSelector:%{public}@",  (uint8_t *)&buf,  0x16u);
                    }

                    v52 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob prePersonalizedSelectors](self, "prePersonalizedSelectors"));
                    [v52 addObject:v47];
                  }

                  else if (+[MADAutoAssetSecure isPersonalizationRequired:forDescriptor:]( &OBJC_CLASS___MADAutoAssetSecure,  "isPersonalizationRequired:forDescriptor:",  @"reportSetCatalogDecideFound",  v30))
                  {
                    v54 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob tryPersonalizeDescriptors](self, "tryPersonalizeDescriptors"));
                    [v54 addObject:v30];

                    uint64_t v55 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
                    unsigned __int8 v56 = (os_log_s *)objc_claimAutoreleasedReturnValue([v55 oslog]);

                    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                    {
                      uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
                      id v58 = (__CFString *)objc_claimAutoreleasedReturnValue([v47 summary]);
                      int buf = 138543618;
                      v122 = v57;
                      __int16 v123 = 2114;
                      v124 = v58;
                      _os_log_impl( &dword_0,  v56,  OS_LOG_TYPE_DEFAULT,  "%{public}@\n [AUTO-SECURE][AUTO-PERSONALIZATION][SET-JOB-TRY]{reportSetCatalogDecideFound}  secure auto-asset to be part of atomic-instance (requires personalization) | alreadyOnFilesystemSelector:%{public}@",  (uint8_t *)&buf,  0x16u);
                    }
                  }
                }

                else
                {
                  -[MADAutoAssetJob trackAnomaly:forReason:]( self,  "trackAnomaly:forReason:",  6101LL,  @"{reportSetCatalogDecideFound} unable to initialize alreadyOnFilesystemSelector");
                }
              }

              unsigned int v59 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
              unsigned int v60 = (os_log_s *)objc_claimAutoreleasedReturnValue([v59 oslog]);

              if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
              {
                id v61 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
                BOOL v62 = (__CFString *)objc_claimAutoreleasedReturnValue([v30 summary]);
                int buf = 138543618;
                v122 = v61;
                __int16 v123 = 2114;
                v124 = v62;
                _os_log_impl( &dword_0,  v60,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {reportSetCatalogDecideFound} filtering out asset from group to be downloaded (same as al ready on filesystem) | filtered potentialDescriptor:%{public}@",  (uint8_t *)&buf,  0x16u);
              }

              -[MADAutoAssetJob updateSetDescriptorDownloaded:forAssetDescriptor:justDownloaded:]( self,  "updateSetDescriptorDownloaded:forAssetDescriptor:justDownloaded:",  @"reportSetCatalogDecideFound",  v34,  0LL);
              char v27 = 1;
            }

            else
            {
              id v53 = (void *)objc_claimAutoreleasedReturnValue([v30 assetSpecifier]);
              -[NSMutableDictionary setSafeObject:forKey:](v112, "setSafeObject:forKey:", v30, v53);
            }
          }

          id v26 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v116,  v120,  16LL);
          if (!v26) {
            goto LABEL_46;
          }
        }
      }

      char v27 = 0;
LABEL_46:

      unsigned int v8 = v110;
      -[MADAutoAssetJob setFoundSetPatchDescriptorsBySpecifier:](self, "setFoundSetPatchDescriptorsBySpecifier:", v110);
      uint64_t v67 = v112;
      -[MADAutoAssetJob setFoundSetFullDescriptorsBySpecifier:](self, "setFoundSetFullDescriptorsBySpecifier:", v112);
      id v68 = -[MADAutoAssetJob newFoundSetDescriptorsAsNewerDiscovered](self, "newFoundSetDescriptorsAsNewerDiscovered");
      -[MADAutoAssetJob setFoundSetNewerDiscoveredAtomicEntries:](self, "setFoundSetNewerDiscoveredAtomicEntries:", v68);

      unsigned int v69 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetJob foundSetNewerDiscoveredAtomicEntries]( self,  "foundSetNewerDiscoveredAtomicEntries"));
      v70 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
      [v70 setDiscoveredAtomicEntries:v69];

      unsigned __int8 v115 = 0;
      BOOL v71 = -[MADAutoAssetJob isSetFoundAlreadyOnFilesystem:justPromotedAnyDescriptor:]( self,  "isSetFoundAlreadyOnFilesystem:justPromotedAnyDescriptor:",  @"reportSetCatalogDecideFound",  &v115);
      id v72 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob tryPersonalizeDescriptors](self, "tryPersonalizeDescriptors"));
      id v73 = [v72 count];

      if (!v71 && ((v108 ^ 1) & 1) == 0)
      {
        id v74 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob newestDownloadedSetStatus](self, "newestDownloadedSetStatus"));

        if (v74)
        {
          id v75 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
          v76 = (os_log_s *)objc_claimAutoreleasedReturnValue([v75 oslog]);

          id v5 = v109;
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
          {
            v77 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
            __int16 v78 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob setConfiguration](self, "setConfiguration"));
            v79 = (__CFString *)objc_claimAutoreleasedReturnValue([v78 summary]);
            int buf = 138543618;
            v122 = v77;
            __int16 v123 = 2114;
            v124 = v79;
            _os_log_impl( &dword_0,  v76,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {reportSetCatalogDecideFound} postponing[RAMPED] setConfiguration:%{public}@",  (uint8_t *)&buf,  0x16u);
          }

          uint64_t v66 = @"SetCatalogFoundNoNewer";
          goto LABEL_77;
        }
      }

      -[MADAutoAssetJob setNextSetSpecifierToDownload:](self, "setNextSetSpecifierToDownload:", 0LL);
      uint64_t v80 = objc_alloc_init(&OBJC_CLASS___MANAutoAssetSetNotifications);
      -[MADAutoAssetJob setCurrentSetNotifications:](self, "setCurrentSetNotifications:", v80);

      v81 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetNotifications](self, "currentSetNotifications"));
      [v81 setAtomicInstanceDiscovered:1];

      v82 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetNotifications](self, "currentSetNotifications"));
      [v82 setDownloadPending:v71 ^ 1];

      -[MADAutoAssetJob setSetProgressOverallTotalWrittenBytes:](self, "setSetProgressOverallTotalWrittenBytes:", 0LL);
      -[MADAutoAssetJob setSetProgressAssetTotalWrittenBytes:](self, "setSetProgressAssetTotalWrittenBytes:", 0LL);
      -[MADAutoAssetJob setProgressReadyToStartDownloads](self, "setProgressReadyToStartDownloads");
      if (v73) {
        BOOL v83 = 0LL;
      }
      else {
        BOOL v83 = v71;
      }
      -[MADAutoAssetJob updateSetResults:atomicInstanceDiscovered:availableForUse:downloading:buildingResultSetFound:]( self,  "updateSetResults:atomicInstanceDiscovered:availableForUse:downloading:buildingResultSetFound:",  @"reportSetCatalogDecideFound",  1LL,  v83,  0LL,  v71);
      v84 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
      v85 = (os_log_s *)objc_claimAutoreleasedReturnValue([v84 oslog]);

      id v5 = v109;
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        id v86 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
        v87 = (const __CFString *)-[NSMutableDictionary count](v112, "count");
        v88 = @"NO";
        int buf = 138543874;
        v122 = v86;
        if (v71) {
          v88 = @"YES";
        }
        __int16 v123 = 2050;
        v124 = v87;
        __int16 v125 = 2114;
        v126 = v88;
        _os_log_impl( &dword_0,  v85,  OS_LOG_TYPE_DEFAULT,  "%{public}@:potentialDescriptorCount:%{public}lu,alreadyOnFilesystem:%{public}@",  (uint8_t *)&buf,  0x20u);
      }

      -[MADAutoAssetJob latchWhetherDownloadingUserInitiated](self, "latchWhetherDownloadingUserInitiated");
      -[MADAutoAssetJob refreshSetFoundToManager:](self, "refreshSetFoundToManager:", v83);
      if (-[NSMutableDictionary count](v112, "count"))
      {
        if (!v71)
        {
          -[MADAutoAssetJob statusChangeSetCatalogFoundNewer:]( self,  "statusChangeSetCatalogFoundNewer:",  @"reportSetCatalogDecideFound");
          v89 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetIdentifier](self, "autoAssetSetIdentifier"));
          +[MADAutoAssetControlManager postSetNotificationName:forAssetSetIdentifier:fromModule:fromLocation:]( &OBJC_CLASS___MADAutoAssetControlManager,  "postSetNotificationName:forAssetSetIdentifier:fromModule:fromLocation:",  @"ATOMIC_INSTANCE_DISCOVERED",  v89,  @"AUTO-JOB",  @"reportSetCatalogDecideFound");

          int v90 = objc_alloc(&OBJC_CLASS___MANAutoAssetSetInfoFound);
          id v91 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetIdentifier](self, "autoAssetSetIdentifier"));
          v92 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
          id v93 = -[MANAutoAssetSetInfoFound initForAssetSetIdentifier:reportingStatus:]( v90,  "initForAssetSetIdentifier:reportingStatus:",  v91,  v92);
          -[MADAutoAssetJob setResultSetFound:](self, "setResultSetFound:", v93);

          v94 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob resultSetFound](self, "resultSetFound"));
          v95 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob setJobInformation](self, "setJobInformation"));
          [v95 setFoundContent:v94];

          uint64_t v66 = @"SetCatalogFoundNewer";
LABEL_77:

          goto LABEL_78;
        }
      }

      else
      {
        v96 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
        v97 = (os_log_s *)objc_claimAutoreleasedReturnValue([v96 oslog]);

        BOOL v98 = os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT);
        if ((v27 & 1) == 0)
        {
          if (v98)
          {
            v106 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
            int buf = 138543362;
            v122 = v106;
            _os_log_impl( &dword_0,  v97,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {reportSetCatalogDecideFound} no valid entries in Pallas response",  (uint8_t *)&buf,  0xCu);
          }

          uint64_t v66 = @"SetCatalogFoundNone";
          goto LABEL_77;
        }

        if (v98)
        {
          v99 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
          int buf = 138543362;
          v122 = v99;
          _os_log_impl( &dword_0,  v97,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {reportSetCatalogDecideFound} some in Pallas response already on filesystem (an no newer availa ble) - treat as catalog finding same",  (uint8_t *)&buf,  0xCu);
        }
      }

      if (-[MADAutoAssetJob stagerJob](self, "stagerJob")
        || (v100 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob tryPersonalizeDescriptors](self, "tryPersonalizeDescriptors")),
            id v101 = [v100 count],
            v100,
            !v101))
      {
        -[MADAutoAssetJob statusChangeSetCatalogFoundSame:]( self,  "statusChangeSetCatalogFoundSame:",  @"reportSetCatalogDecideFound");
        -[MADAutoAssetJob setFoundSameAtomicInstanceAlreadyDownloaded:]( self,  "setFoundSameAtomicInstanceAlreadyDownloaded:",  1LL);
        int v102 = v115;
        v103 = @"SetCatalogFoundPromoted";
        id v104 = @"SetCatalogFoundSame";
      }

      else
      {
        int v102 = v115;
        v103 = @"SetCatalogFoundPromotedHeal";
        id v104 = @"SetCatalogFoundSameHeal";
      }

      if (v102) {
        id v105 = (__CFString *)v103;
      }
      else {
        id v105 = (__CFString *)v104;
      }
      uint64_t v66 = v105;
      goto LABEL_77;
    }

    uint64_t v63 = @"successful catalog download for set-job yet no autoAssetSetInstance";
    uint64_t v64 = self;
    uint64_t v65 = 6103LL;
  }

  else
  {
    uint64_t v63 = @"successful catalog download yet no catalog provided";
    uint64_t v64 = self;
    uint64_t v65 = 6102LL;
  }

  -[MADAutoAssetJob statusChange:catalogAnomaly:forReason:]( v64,  "statusChange:catalogAnomaly:forReason:",  @"reportSetCatalogDecideFound",  v65,  v63);
  uint64_t v66 = @"SetCatalogFoundNoNewer";
  uint64_t v67 = v9;
LABEL_78:

  return v66;
}

- (BOOL)wasAssetSetSpecifierRequested:(id)a3
{
  id v4 = a3;
  __int128 v14 = 0u;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob setConfiguration](self, "setConfiguration", 0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 autoAssetEntries]);

  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = (void *)objc_claimAutoreleasedReturnValue([*(id *)(*((void *)&v14 + 1) + 8 * (void)i) assetSelector]);
        BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 assetSpecifier]);
        unsigned __int8 v12 = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v4, v11);

        if ((v12 & 1) != 0)
        {
          LOBYTE(v7) = 1;
          goto LABEL_11;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (id)assetSetEntryForAssetMetadata:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue([a3 safeStringForKey:@"AssetSpecifier"]);
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob setConfiguration](self, "setConfiguration", 0LL));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 autoAssetEntries]);

  id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (i = 0LL; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8LL * (void)i);
        BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 assetSelector]);
        unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v11 assetSpecifier]);
        unsigned int v13 = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v4, v12);

        if (v13)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }

      id v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

- (id)newFoundSetDescriptorsAsNewerDiscovered
{
  unsigned int v60 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  v52 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundSetPatchDescriptorsBySpecifier](self, "foundSetPatchDescriptorsBySpecifier"));
  p_ivars = &MobileAssetKeyManager__metaData.ivars;
  id v57 = [obj countByEnumeratingWithState:&v65 objects:v70 count:16];
  unsigned int v59 = self;
  if (v57)
  {
    uint64_t v55 = *(void *)v66;
    do
    {
      for (i = 0LL; i != v57; i = (char *)i + 1)
      {
        if (*(void *)v66 != v55) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v65 + 1) + 8LL * (void)i);
        id v6 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetJob foundSetPatchDescriptorsBySpecifier]( self,  "foundSetPatchDescriptorsBySpecifier"));
        id v7 = [v6 safeObjectForKey:v5 ofClass:objc_opt_class(MADAutoAssetDescriptor)];
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

        id v9 = objc_alloc(&OBJC_CLASS___MAAutoAssetSelector);
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v8 assetType]);
        BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v8 assetSpecifier]);
        unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue([v8 assetVersion]);
        id v13 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:]( v9,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:",  v10,  v11,  v12);

        __int128 v14 = (void *)objc_claimAutoreleasedReturnValue([v13 persistedEntryID]);
        id v15 = -[NSMutableDictionary safeObjectForKey:ofClass:]( v60,  "safeObjectForKey:ofClass:",  v14,  objc_opt_class(p_ivars[192]));
        __int128 v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
        if (v16)
        {
          id v17 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 diag]);
          id v19 = objc_alloc(&OBJC_CLASS___NSString);
          __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v8 summary]);
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v16 summary]);
          id v22 = -[NSString initWithFormat:]( v19,  "initWithFormat:",  @"{newFoundSetDescriptorsAsNewerDiscovered} (patch) already encountered | nextFoundDescriptor:%@ | alreadyAtomicEntry:%@",  v20,  v21);
          [v18 trackAnomaly:@"AUTO-SET-JOB" forReason:v22 withResult:6101 withError:0];

          p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
        }

        else
        {
          id v23 = objc_alloc((Class)p_ivars[192]);
          id v24 = (void *)objc_claimAutoreleasedReturnValue([v8 metadata]);
          id v17 = [v23 initWithFullAssetSelector:v13 withAssetID:0 withLocalContentURL:0 withAssetAttributes:v24 inhibitedFromEmergencyRemoval:0];

          if (v17)
          {
            -[NSMutableDictionary setSafeObject:forKey:](v60, "setSafeObject:forKey:", v17, v14);
            -[NSMutableArray addObject:](v52, "addObject:", v17);
          }

          else
          {
            id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](v59, "autoJobFSM"));
            id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 diag]);
            char v27 = objc_alloc(&OBJC_CLASS___NSString);
            id v28 = (void *)objc_claimAutoreleasedReturnValue([v8 summary]);
            id v29 = -[NSString initWithFormat:]( v27,  "initWithFormat:",  @"{newFoundSetDescriptorsAsNewerDiscovered} unable to allocate nextDiscoveredAtomicEntry for patch setDescriptor:%@",  v28);
            [v26 trackAnomaly:@"AUTO-SET-JOB" forReason:v29 withResult:6101 withError:0];

            p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
          }
        }

        self = v59;
      }

      id v57 = [obj countByEnumeratingWithState:&v65 objects:v70 count:16];
    }

    while (v57);
  }

  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundSetFullDescriptorsBySpecifier](self, "foundSetFullDescriptorsBySpecifier"));
  id v58 = [v30 countByEnumeratingWithState:&v61 objects:v69 count:16];
  if (v58)
  {
    uint64_t v56 = *(void *)v62;
    do
    {
      for (j = 0LL; j != v58; j = (char *)j + 1)
      {
        if (*(void *)v62 != v56) {
          objc_enumerationMutation(v30);
        }
        uint64_t v32 = *(void *)(*((void *)&v61 + 1) + 8LL * (void)j);
        id v33 = objc_autoreleasePoolPush();
        unsigned __int8 v34 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetJob foundSetFullDescriptorsBySpecifier]( self,  "foundSetFullDescriptorsBySpecifier"));
        id v35 = [v34 safeObjectForKey:v32 ofClass:objc_opt_class(MADAutoAssetDescriptor)];
        v36 = (void *)objc_claimAutoreleasedReturnValue(v35);

        uint64_t v37 = objc_alloc(&OBJC_CLASS___MAAutoAssetSelector);
        v38 = (void *)objc_claimAutoreleasedReturnValue([v36 assetType]);
        v39 = (void *)objc_claimAutoreleasedReturnValue([v36 assetSpecifier]);
        v40 = (void *)objc_claimAutoreleasedReturnValue([v36 assetVersion]);
        id v41 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:]( v37,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:",  v38,  v39,  v40);

        unsigned int v42 = (void *)objc_claimAutoreleasedReturnValue([v41 persistedEntryID]);
        id v43 = -[NSMutableDictionary safeObjectForKey:ofClass:]( v60,  "safeObjectForKey:ofClass:",  v42,  objc_opt_class(&OBJC_CLASS___MANAutoAssetSetAtomicEntry));
        unsigned __int8 v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
        if (!v44)
        {
          unsigned __int8 v45 = objc_alloc(&OBJC_CLASS___MANAutoAssetSetAtomicEntry);
          v46 = (void *)objc_claimAutoreleasedReturnValue([v36 metadata]);
          id v47 = -[MANAutoAssetSetAtomicEntry initWithFullAssetSelector:withAssetID:withLocalContentURL:withAssetAttributes:inhibitedFromEmergencyRemoval:]( v45,  "initWithFullAssetSelector:withAssetID:withLocalContentURL:withAssetAttributes:inhibitedFromEmergencyRemoval:",  v41,  0LL,  0LL,  v46,  0LL);

          if (v47)
          {
            -[NSMutableDictionary setSafeObject:forKey:](v60, "setSafeObject:forKey:", v47, v42);
            -[NSMutableArray addObject:](v52, "addObject:", v47);
            self = v59;
          }

          else
          {
            id obja = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](v59, "autoJobFSM"));
            id v48 = (void *)objc_claimAutoreleasedReturnValue([obja diag]);
            uint64_t v49 = v30;
            BOOL v50 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"{newFoundSetDescriptorsAsNewerDiscovered} unable to allocate nextDiscoveredAtomicEntry for full setDescriptor:%@",  v36);
            [v48 trackAnomaly:@"AUTO-SET-JOB" forReason:v50 withResult:6101 withError:0];

            v30 = v49;
            self = v59;
          }
        }

        objc_autoreleasePoolPop(v33);
      }

      id v58 = [v30 countByEnumeratingWithState:&v61 objects:v69 count:16];
    }

    while (v58);
  }

  return v52;
}

- (void)newFoundSetDescriptorsFromCachedLookup:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  BOOL v11 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[MADAutoAssetJob buildPotentialDescriptors:fromLookupResults:buildingPatchDescriptors:andFullDescriptors:]( self,  "buildPotentialDescriptors:fromLookupResults:buildingPatchDescriptors:andFullDescriptors:",  @"newFoundSetDescriptorsFromCachedLookup",  v4,  v11,  v7);

  -[MADAutoAssetJob setFoundSetPatchDescriptorsBySpecifier:](self, "setFoundSetPatchDescriptorsBySpecifier:", v11);
  -[MADAutoAssetJob setFoundSetFullDescriptorsBySpecifier:](self, "setFoundSetFullDescriptorsBySpecifier:", v7);
  id v8 = -[MADAutoAssetJob newFoundSetDescriptorsAsNewerDiscovered](self, "newFoundSetDescriptorsAsNewerDiscovered");
  -[MADAutoAssetJob setFoundSetNewerDiscoveredAtomicEntries:](self, "setFoundSetNewerDiscoveredAtomicEntries:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundSetNewerDiscoveredAtomicEntries](self, "foundSetNewerDiscoveredAtomicEntries"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
  [v10 setDiscoveredAtomicEntries:v9];

  -[MADAutoAssetJob rebuildLastestOnFS:](self, "rebuildLastestOnFS:", @"newFoundSetDescriptorsFromCachedLookup");
}

- (BOOL)buildPotentialDescriptors:(id)a3 fromLookupResults:(id)a4 buildingPatchDescriptors:(id)a5 andFullDescriptors:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v91 = a5;
  id v90 = a6;
  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v12 extendedStateQueue]);
  dispatch_assert_queue_V2(v13);

  __int128 v14 = (__CFString *)objc_claimAutoreleasedReturnValue([v11 safeStringForKey:@"AssetType"]);
  id v93 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetAssetType](self, "autoAssetSetAssetType"));
  id v15 = [v11 safeObjectForKey:@"Assets" ofClass:objc_opt_class(NSArray)];
  uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
  id v17 = (void *)v16;
  if (!v14 || !v16)
  {
    BOOL v71 = objc_alloc(&OBJC_CLASS___NSString);
    id v72 = @"MISSING";
    if (v14) {
      id v73 = v14;
    }
    else {
      id v73 = @"MISSING";
    }
    if (v17) {
      id v72 = @"present";
    }
    id v74 = -[NSString initWithFormat:]( v71,  "initWithFormat:",  @"auto-asset catalog without required fields | catalogAssetType:%@, catalogAssets:%@",  v73,  v72);
    id v75 = self;
    id v76 = v10;
    uint64_t v77 = 6102LL;
    goto LABEL_63;
  }

  if ((+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v14, v93) & 1) == 0)
  {
    id v74 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"auto-asset catalog for wrong assetType | catalog:%@, expecting:%@",  v14,  v93);
    id v75 = self;
    id v76 = v10;
    uint64_t v77 = 6108LL;
LABEL_63:
    -[MADAutoAssetJob statusChange:catalogAnomaly:forReason:]( v75,  "statusChange:catalogAnomaly:forReason:",  v76,  v77,  v74);
    goto LABEL_64;
  }

  if ([v17 count])
  {
    v87 = v14;
    id v88 = v11;
    __int128 v101 = 0u;
    __int128 v102 = 0u;
    __int128 v99 = 0u;
    __int128 v100 = 0u;
    id v86 = v17;
    id obj = v17;
    id v18 = [obj countByEnumeratingWithState:&v99 objects:v111 count:16];
    if (!v18)
    {
      char v92 = 0;
      goto LABEL_70;
    }

    id v19 = v18;
    uint64_t v94 = 0LL;
    char v92 = 0;
    p_ivars = &MobileAssetKeyManager__metaData.ivars;
    uint64_t v97 = *(void *)v100;
    id v95 = v10;
    id v21 = v93;
    while (1)
    {
      for (i = 0LL; i != v19; i = (char *)i + 1)
      {
        if (*(void *)v100 != v97) {
          objc_enumerationMutation(obj);
        }
        id v23 = *(void **)(*((void *)&v99 + 1) + 8LL * (void)i);
        id v24 = objc_autoreleasePoolPush();
        if (!-[__objc2_ivar_list doesMetatadaIndicateEmptyEntry:]( p_ivars[223],  "doesMetatadaIndicateEmptyEntry:",  v23))
        {
          id v29 = objc_alloc((Class)p_ivars[223]);
          id v98 = 0LL;
          id v30 = [v29 initForAssetType:v21 fromMetadata:v23 invalidReasons:&v98];
          id v26 = (os_log_s *)v98;
          if (v30)
          {
            int v31 = (void *)objc_claimAutoreleasedReturnValue([v30 assetSpecifier]);
            unsigned __int8 v32 = -[MADAutoAssetJob wasAssetSetSpecifierRequested:](self, "wasAssetSetSpecifierRequested:", v31);

            if ((v32 & 1) != 0)
            {
              unsigned int v33 = -[MADAutoAssetJob preferenceAsIfRampOrUse:]( self,  "preferenceAsIfRampOrUse:",  [v30 isRamped]);
              uint64_t v34 = v94;
              if (v94)
              {
                if (((((v92 & 1) == 0) ^ v33) & 1) == 0)
                {
                  id v35 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
                  v36 = (os_log_s *)objc_claimAutoreleasedReturnValue([v35 oslog]);

                  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                  {
                    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
                    v38 = (void *)objc_claimAutoreleasedReturnValue([v30 summary]);
                    *(_DWORD *)int buf = 138543874;
                    id v104 = v37;
                    __int16 v105 = 2114;
                    id v106 = v95;
                    __int16 v107 = 2114;
                    unsigned int v108 = v38;
                    _os_log_impl( &dword_0,  v36,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {%{public}@} mixture of Ramping indications - considering overall set as NOT ramped | nextAsset:%{public}@",  buf,  0x20u);

                    id v10 = v95;
                  }

                  char v92 = 0;
                  uint64_t v34 = v94;
                }
              }

              else
              {
                char v92 = v33;
              }

              uint64_t v94 = v34 + 1;
              unsigned int v44 = [v30 isPatch];
              unsigned __int8 v45 = (void *)objc_claimAutoreleasedReturnValue([v30 assetSpecifier]);
              uint64_t v46 = objc_opt_class(&OBJC_CLASS___MADAutoAssetDescriptor);
              if (v44)
              {
                v39 = (os_log_s *)objc_claimAutoreleasedReturnValue([v91 safeObjectForKey:v45 ofClass:v46]);

                if (v39)
                {
                  unsigned int v47 = -[MADAutoAssetJob isMorePreferredFormat:comparedTo:]( self,  "isMorePreferredFormat:comparedTo:",  v30,  v39);
                  id v48 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
                  uint64_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue([v48 oslog]);

                  BOOL v50 = os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT);
                  if (v47)
                  {
                    if (v50)
                    {
                      v51 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
                      v52 = (void *)objc_claimAutoreleasedReturnValue([v30 summary]);
                      *(_DWORD *)int buf = 138543874;
                      id v104 = v51;
                      __int16 v105 = 2114;
                      id v106 = v95;
                      __int16 v107 = 2114;
                      unsigned int v108 = v52;
                      _os_log_impl( &dword_0,  v49,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {%{public}@} more preferred patch provided | now considering:%{public}@",  buf,  0x20u);
                    }

                    uint64_t v49 = (os_log_s *)objc_claimAutoreleasedReturnValue([v30 assetSpecifier]);
                    id v53 = v91;
                    goto LABEL_35;
                  }

                  if (v50)
                  {
                    v89 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
                    __int128 v68 = (void *)objc_claimAutoreleasedReturnValue([v30 summary]);
                    *(_DWORD *)int buf = 138543874;
                    id v104 = v89;
                    __int16 v105 = 2114;
                    id v10 = v95;
                    id v106 = v95;
                    __int16 v107 = 2114;
                    unsigned int v108 = v68;
                    unsigned int v69 = v49;
                    v70 = "%{public}@ | {%{public}@} filtering out asset (additional patch of less-preferred format) | fi"
                          "ltered:%{public}@";
                    goto LABEL_47;
                  }

- (void)appendUniqueSelectorForDescriptor:(id)a3 toArray:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc(&OBJC_CLASS___MAAutoAssetSelector);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v5 assetType]);
  id v29 = v5;
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v5 assetSpecifier]);
  id v10 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:](v7, "initForAssetType:withAssetSpecifier:", v8, v9);

  __int128 v33 = 0u;
  __int128 v34 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v11 = v6;
  id v12 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v32;
    p_ivars = &MobileAssetKeyManager__metaData.ivars;
    do
    {
      uint64_t v16 = 0LL;
      id v30 = v13;
      do
      {
        if (*(void *)v32 != v14) {
          objc_enumerationMutation(v11);
        }
        id v17 = *(void **)(*((void *)&v31 + 1) + 8LL * (void)v16);
        id v18 = p_ivars[155];
        id v19 = (void *)objc_claimAutoreleasedReturnValue([v10 assetType]);
        __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v17 assetType]);
        if ((-[__objc2_ivar_list stringIsEqual:to:](v18, "stringIsEqual:to:", v19, v20) & 1) != 0)
        {
          id v21 = p_ivars[155];
          uint64_t v22 = objc_claimAutoreleasedReturnValue([v10 assetSpecifier]);
          id v23 = v10;
          uint64_t v24 = v14;
          id v25 = p_ivars;
          id v26 = v11;
          char v27 = (void *)v22;
          id v28 = (void *)objc_claimAutoreleasedReturnValue([v17 assetSpecifier]);
          LOBYTE(v21) = -[__objc2_ivar_list stringIsEqual:to:](v21, "stringIsEqual:to:", v27, v28);

          id v11 = v26;
          p_ivars = v25;
          uint64_t v14 = v24;
          id v10 = v23;
          id v13 = v30;

          if ((v21 & 1) != 0)
          {

            goto LABEL_13;
          }
        }

        else
        {
        }

        uint64_t v16 = (char *)v16 + 1;
      }

      while (v13 != v16);
      id v13 = [v11 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }

    while (v13);
  }

  [v11 addObject:v10];
LABEL_13:
}

- (void)refreshSetFoundToManager:(BOOL)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3));
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 extendedStateQueue]);
  dispatch_assert_queue_V2(v5);

  if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
    id v7 = [v6 copy];
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob firstClientName](self, "firstClientName"));
    unsigned int v10 = +[MADAutoAssetControlManager persistSetJobDescriptor:withCurrentSetStatus:withFirstClientName:]( &OBJC_CLASS___MADAutoAssetControlManager,  "persistSetJobDescriptor:withCurrentSetStatus:withFirstClientName:",  v7,  v8,  v9);

    if (v10)
    {
      -[MADAutoAssetJob setBecameLatestToVend:](self, "setBecameLatestToVend:", 1LL);
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 oslog]);

      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
        int v14 = 138543362;
        id v15 = v13;
        _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {refreshSetFoundToManager} set-job just became set-configuration's latest-to-vend",  (uint8_t *)&v14,  0xCu);
      }
    }
  }

  else
  {
    -[MADAutoAssetJob statusChange:catalogAnomaly:forReason:]( self,  "statusChange:catalogAnomaly:forReason:",  @"refreshSetFoundToManager",  6103LL,  @"refreshSetFoundToManager should only execute for set-job");
  }

- (void)rebuildLastestOnFS:(id)a3
{
  id v42 = a3;
  id v4 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[MADAutoAssetJob setLatestAssetDescriptorOnFilesystemBySpecifier:]( self,  "setLatestAssetDescriptorOnFilesystemBySpecifier:",  v4);

  __int128 v55 = 0u;
  __int128 v56 = 0u;
  __int128 v53 = 0u;
  __int128 v54 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundSetNewerDiscoveredAtomicEntries](self, "foundSetNewerDiscoveredAtomicEntries"));
  id v5 = [obj countByEnumeratingWithState:&v53 objects:v66 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v54;
    p_ivars = &MobileAssetKeyManager__metaData.ivars;
    *(void *)&__int128 v6 = 138543874LL;
    __int128 v41 = v6;
    id v43 = self;
    uint64_t v44 = *(void *)v54;
    do
    {
      unsigned int v10 = 0LL;
      id v45 = v7;
      do
      {
        if (*(void *)v54 != v8) {
          objc_enumerationMutation(obj);
        }
        id v11 = p_ivars[174];
        id v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((void *)&v53 + 1) + 8 * (void)v10), "fullAssetSelector", v41));
        id v13 = (void *)objc_claimAutoreleasedReturnValue( -[__objc2_ivar_list loadDescriptorsForJobSelector:promotingIfCurrentlyStaged:immediatelyPromotedDescriptor:]( v11,  "loadDescriptorsForJobSelector:promotingIfCurrentlyStaged:immediatelyPromotedDescriptor:",  v12,  0LL,  0LL));

        if (![v13 count]) {
          goto LABEL_31;
        }
        unsigned int v47 = v13;
        id v48 = v10;
        __int128 v51 = 0u;
        __int128 v52 = 0u;
        __int128 v49 = 0u;
        __int128 v50 = 0u;
        id v14 = v13;
        id v15 = [v14 countByEnumeratingWithState:&v49 objects:v65 count:16];
        if (!v15)
        {
          id v18 = 0LL;
          id v17 = 0LL;
          goto LABEL_29;
        }

        id v16 = v15;
        id v17 = 0LL;
        id v18 = 0LL;
        uint64_t v19 = *(void *)v50;
        do
        {
          for (i = 0LL; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v50 != v19) {
              objc_enumerationMutation(v14);
            }
            uint64_t v21 = *(void *)(*((void *)&v49 + 1) + 8LL * (void)i);
            uint64_t v22 = objc_autoreleasePoolPush();
            id v23 = [v14 safeObjectForKey:v21 ofClass:objc_opt_class(MADAutoAssetDescriptor)];
            uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
            id v25 = v24;
            if (!v18)
            {
              id v31 = v24;
              id v32 = objc_alloc(&OBJC_CLASS___SUCoreRestoreVersion);
              id v28 = (id)objc_claimAutoreleasedReturnValue([v31 assetVersion]);
              id v30 = [v32 initWithRestoreVersion:v28];
              goto LABEL_17;
            }

            id v26 = objc_alloc(&OBJC_CLASS___SUCoreRestoreVersion);
            char v27 = (void *)objc_claimAutoreleasedReturnValue([v25 assetVersion]);
            id v28 = [v26 initWithRestoreVersion:v27];

            if ([v28 isComparable:v17]
              && [v28 compare:v17] == (char *)&dword_0 + 1)
            {
              id v29 = v25;

              id v30 = v28;
              id v28 = v30;
LABEL_17:
              id v33 = v30;

              id v17 = v33;
              id v18 = v25;
            }

            objc_autoreleasePoolPop(v22);
          }

          id v16 = [v14 countByEnumeratingWithState:&v49 objects:v65 count:16];
        }

        while (v16);

        if (v18)
        {
          p_ivars = &MobileAssetKeyManager__metaData.ivars;
          uint64_t v8 = v44;
          id v7 = v45;
          unsigned int v10 = v48;
          if (+[MADAutoAssetControlManager jobDescriptorOnFilesystemConfirmed:]( &OBJC_CLASS___MADAutoAssetControlManager,  "jobDescriptorOnFilesystemConfirmed:",  v18))
          {
            __int128 v34 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetJob latestAssetDescriptorOnFilesystemBySpecifier]( v43,  "latestAssetDescriptorOnFilesystemBySpecifier"));
            id v35 = (void *)objc_claimAutoreleasedReturnValue([v18 assetSpecifier]);
            [v34 setSafeObject:v18 forKey:v35];

            v36 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](v43, "logger"));
            id v14 = (id)objc_claimAutoreleasedReturnValue([v36 oslog]);

            if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](v43, "autoJobName"));
              v38 = (void *)objc_claimAutoreleasedReturnValue([v18 assetVersion]);
              v39 = (void *)objc_claimAutoreleasedReturnValue([v18 assetSpecifier]);
              *(_DWORD *)int buf = 138544130;
              id v58 = v37;
              __int16 v59 = 2114;
              id v60 = v42;
              __int16 v61 = 2114;
              __int128 v62 = v38;
              __int16 v63 = 2114;
              __int128 v64 = v39;
              _os_log_impl( &dword_0,  (os_log_t)v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ {%{public}@:rebuildLastestOnFS} latest version on filesystem | assetVersion:%{public}@, for a ssetSpecifier:%{public}@,",  buf,  0x2Au);

              id v7 = v45;
              goto LABEL_28;
            }
          }

          else
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](v43, "logger"));
            id v14 = (id)objc_claimAutoreleasedReturnValue([v40 oslog]);

            if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](v43, "autoJobName"));
              *(_DWORD *)int buf = v41;
              id v58 = v37;
              __int16 v59 = 2114;
              id v60 = v42;
              __int16 v61 = 2114;
              __int128 v62 = v18;
              _os_log_impl( &dword_0,  (os_log_t)v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ {%{public}@:rebuildLastestOnFS} latest downloaded descriptor is not really on filesystem. Not adding to latestAssetDescriptorOnFilesystemBySpecifier list. Descriptor :%{public}@,",  buf,  0x20u);
LABEL_28:
            }
          }

- (BOOL)isSetFoundAlreadyOnFilesystem:(id)a3 justPromotedAnyDescriptor:(BOOL *)a4
{
  id v5 = a3;
  __int128 v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  __int128 v55 = v5;
  id v57 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@:isSetFoundAlreadyOnFilesystem",  v5);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundSetNewerDiscoveredAtomicEntries](self, "foundSetNewerDiscoveredAtomicEntries"));
  id v9 = [v8 count];

  if (!v9)
  {
    BOOL v46 = 0;
    goto LABEL_41;
  }

  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v71 = 0u;
  __int128 v72 = 0u;
  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundSetNewerDiscoveredAtomicEntries](self, "foundSetNewerDiscoveredAtomicEntries"));
  id v52 = [v10 countByEnumeratingWithState:&v71 objects:v82 count:16];
  if (v52)
  {
    char v50 = 0;
    uint64_t v53 = *(void *)v72;
    p_ivars = &MobileAssetKeyManager__metaData.ivars;
    id v12 = &MobileAssetKeyManager__metaData.ivars;
    __int128 v49 = self;
    __int128 v51 = v10;
    while (1)
    {
      uint64_t v13 = 0LL;
      while (2)
      {
        if (*(void *)v72 != v53) {
          objc_enumerationMutation(v10);
        }
        id v14 = *(void **)(*((void *)&v71 + 1) + 8 * v13);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 fullAssetSelector]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 fullAssetSelector]);
        id v70 = 0LL;
        id v17 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetControlManager loadDescriptorsForJobSelector:promotingIfCurrentlyStaged:immediatelyPromotedDescriptor:]( &OBJC_CLASS___MADAutoAssetControlManager,  "loadDescriptorsForJobSelector:promotingIfCurrentlyStaged:immediatelyPromotedDescriptor:",  v15,  v16,  &v70));
        id v18 = v70;

        __int128 v54 = v17;
        if (v18)
        {
          -[MADAutoAssetJob updateSetDescriptorDownloaded:forAssetDescriptor:justDownloaded:]( self,  "updateSetDescriptorDownloaded:forAssetDescriptor:justDownloaded:",  v57,  v18,  0LL);
          if (+[MADAutoAssetSecure isPersonalizationRequired:forDescriptor:]( &OBJC_CLASS___MADAutoAssetSecure,  "isPersonalizationRequired:forDescriptor:",  v55,  v18))
          {
            uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob tryPersonalizeDescriptors](self, "tryPersonalizeDescriptors"));
            [v19 addObject:v18];

            __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
            uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 oslog]);

            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
              id v23 = (void *)objc_claimAutoreleasedReturnValue([v18 summary]);
              *(_DWORD *)int buf = 138543874;
              uint64_t v77 = v22;
              __int16 v78 = 2114;
              v79 = v57;
              __int16 v80 = 2114;
              v81 = v23;
              _os_log_impl( &dword_0,  v21,  OS_LOG_TYPE_DEFAULT,  "%{public}@\n [AUTO-SECURE][AUTO-PERSONALIZATION][SET-JOB-TRY] {%{public}@:} secure auto-asset just immediate-promoted from staged (requires personalization) | justPromotedDescriptor:%{public}@",  buf,  0x20u);
            }

            char v50 = 1;
            id v17 = v54;
          }

          else
          {
            char v50 = 1;
          }
        }

        if (!v17 || ![v17 count])
        {
LABEL_38:

          BOOL v46 = 0;
          LOBYTE(v9) = v50 & 1;
          goto LABEL_41;
        }

        id v58 = v18;
        uint64_t v56 = v13;
        __int128 v68 = 0u;
        __int128 v69 = 0u;
        __int128 v66 = 0u;
        __int128 v67 = 0u;
        id v24 = v17;
        id v25 = [v24 countByEnumeratingWithState:&v66 objects:v75 count:16];
        if (!v25)
        {
LABEL_37:

          unsigned int v10 = v51;
          id v18 = v58;
          id v17 = v54;
          goto LABEL_38;
        }

        id v26 = v25;
        uint64_t v27 = *(void *)v67;
        __int16 v61 = v14;
        uint64_t v63 = *(void *)v67;
        __int128 v64 = v24;
LABEL_17:
        uint64_t v28 = 0LL;
        id v65 = v26;
        while (1)
        {
          if (*(void *)v67 != v27) {
            objc_enumerationMutation(v24);
          }
          id v29 = [v24 safeObjectForKey:*(void *)(*((void *)&v66 + 1) + 8 * v28) ofClass:objc_opt_class(p_ivars[223])];
          id v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
          id v31 = v12[155];
          id v32 = (void *)objc_claimAutoreleasedReturnValue([v30 assetType]);
          id v33 = (void *)objc_claimAutoreleasedReturnValue([v14 fullAssetSelector]);
          __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v33 assetType]);

          uint64_t v27 = v63;
          id v24 = v64;
          id v26 = v65;
LABEL_30:

          if (v26 == (id)++v28)
          {
            id v26 = [v24 countByEnumeratingWithState:&v66 objects:v75 count:16];
            if (v26) {
              goto LABEL_17;
            }
            goto LABEL_37;
          }
        }

        id v35 = v12[155];
        uint64_t v36 = objc_claimAutoreleasedReturnValue([v30 assetSpecifier]);
        uint64_t v37 = v12;
        __int128 v62 = (void *)objc_claimAutoreleasedReturnValue([v14 fullAssetSelector]);
        v38 = (void *)objc_claimAutoreleasedReturnValue([v62 assetSpecifier]);
        v39 = v35;
        v40 = (void *)v36;
        if (-[__objc2_ivar_list stringIsEqual:to:](v39, "stringIsEqual:to:", v36, v38))
        {
          __int16 v59 = v37[155];
          uint64_t v41 = objc_claimAutoreleasedReturnValue([v30 assetVersion]);
          id v42 = (void *)objc_claimAutoreleasedReturnValue([v14 fullAssetSelector]);
          id v43 = (void *)objc_claimAutoreleasedReturnValue([v42 assetVersion]);
          uint64_t v44 = v59;
          id v60 = (void *)v41;
          if (-[__objc2_ivar_list stringIsEqual:to:](v44, "stringIsEqual:to:", v41, v43)) {
            unsigned __int8 v45 = +[MADAutoAssetControlManager jobDescriptorOnFilesystemConfirmed:]( &OBJC_CLASS___MADAutoAssetControlManager,  "jobDescriptorOnFilesystemConfirmed:",  v30);
          }
          else {
            unsigned __int8 v45 = 0;
          }
        }

        else
        {
          unsigned __int8 v45 = 0;
        }

        p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);

        id v12 = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
        id v14 = v61;
        uint64_t v27 = v63;
        id v24 = v64;
        id v26 = v65;
        if ((v45 & 1) == 0) {
          goto LABEL_30;
        }

        uint64_t v13 = v56 + 1;
        unsigned int v10 = v51;
        self = v49;
        if ((id)(v56 + 1) != v52) {
          continue;
        }
        break;
      }

      id v52 = [v51 countByEnumeratingWithState:&v71 objects:v82 count:16];
      if (!v52)
      {

        LOBYTE(v9) = v50 & 1;
        goto LABEL_40;
      }
    }
  }

  LOBYTE(v9) = 0;
LABEL_40:
  -[MADAutoAssetJob rebuildLastestOnFS:](self, "rebuildLastestOnFS:", v55);
  BOOL v46 = 1;
LABEL_41:
  if (a4) {
    *a4 = (char)v9;
  }

  return v46;
}

- (void)statusChangeSetCatalogFoundSame:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3));
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 extendedStateQueue]);
  dispatch_assert_queue_V2(v5);

  if (!-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob")) {
    -[MADAutoAssetJob statusChange:catalogAnomaly:forReason:]( self,  "statusChange:catalogAnomaly:forReason:",  @"statusChangeSetCatalogFoundSame",  6103LL,  @"statusChangeSetCatalogFoundSame should only execute for set-job");
  }
}

- (void)updateSetTrackingWithSuccessfulAssetDownload
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 extendedStateQueue]);
  dispatch_assert_queue_V2(v5);

  if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
    if (v6
      && (id v4 = (void *)v6,
          id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor")),
          v7,
          v4,
          v7))
    {
      id v13 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
      -[MADAutoAssetJob updateSetDescriptorDownloaded:forAssetDescriptor:justDownloaded:]( self,  "updateSetDescriptorDownloaded:forAssetDescriptor:justDownloaded:",  @"updateSetTrackingWithSuccessfulAssetDownload",  v13,  1LL);
    }

    else
    {
      uint64_t v8 = objc_alloc(&OBJC_CLASS___NSString);
      id v13 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
      if (v13)
      {
        id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
        id v9 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 summary]);
      }

      else
      {
        id v9 = @"N";
      }

      unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
      if (v10)
      {
        v2 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
        id v11 = (__CFString *)objc_claimAutoreleasedReturnValue([v2 summary]);
      }

      else
      {
        id v11 = @"N";
      }

      id v12 = -[NSString initWithFormat:]( v8,  "initWithFormat:",  @"{updateSetTrackingWithSuccessfulAssetDownload} MISSING | autoAssetSetDescriptor:%@, downloadingAssetDescriptor:%@",  v9,  v11);
      -[MADAutoAssetJob trackAnomaly:forReason:](self, "trackAnomaly:forReason:", 6111LL, v12);

      if (v10)
      {
      }

      if (v13)
      {
      }
    }
  }

  else
  {
    -[MADAutoAssetJob statusChange:catalogAnomaly:forReason:]( self,  "statusChange:catalogAnomaly:forReason:",  @"updateSetTrackingWithSuccessfulAssetDownload",  6103LL,  @"updateSetTrackingWithSuccessfulAssetDownload should only execute for set-job");
  }

- (void)updateSetDescriptorDownloaded:(id)a3 forAssetDescriptor:(id)a4 justDownloaded:(BOOL)a5
{
  BOOL v5 = a5;
  id v51 = a4;
  id v8 = a3;
  id v9 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@:updateSetDescriptorDownloaded",  v8);

  unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 latestDowloadedAtomicInstanceEntries]);

  if (v11)
  {
    id v12 = objc_alloc(&OBJC_CLASS___NSMutableArray);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 latestDowloadedAtomicInstanceEntries]);
    id v15 = -[NSMutableArray initWithArray:](v12, "initWithArray:", v14);
  }

  else
  {
    id v15 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  }

  id v16 = objc_alloc(&OBJC_CLASS___MAAutoAssetSelector);
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v51 assetType]);
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v51 assetSpecifier]);
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v51 assetVersion]);
  id v20 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:]( v16,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:",  v17,  v18,  v19);

  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v51 assetType]);
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v51 assetId]);
  id AutoLocalUrlFromTypeAndIdWithPurpose = getAutoLocalUrlFromTypeAndIdWithPurpose(v21, v22, 2LL, @"auto");
  id v24 = (void *)objc_claimAutoreleasedReturnValue(AutoLocalUrlFromTypeAndIdWithPurpose);

  id v25 = objc_alloc(&OBJC_CLASS___MANAutoAssetSetAtomicEntry);
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v51 assetId]);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v51 metadata]);
  uint64_t v28 = -[MANAutoAssetSetAtomicEntry initWithFullAssetSelector:withAssetID:withLocalContentURL:withAssetAttributes:inhibitedFromEmergencyRemoval:]( v25,  "initWithFullAssetSelector:withAssetID:withLocalContentURL:withAssetAttributes:inhibitedFromEmergencyRemoval:",  v20,  v26,  v24,  v27,  0LL);

  if (v28)
  {
    if (-[MADAutoAssetJob isAtomicEntry:alreadyInAtomicEntries:]( self,  "isAtomicEntry:alreadyInAtomicEntries:",  v28,  v15))
    {
      id v29 = objc_alloc(&OBJC_CLASS___NSString);
      id v30 = (void *)objc_claimAutoreleasedReturnValue(-[MANAutoAssetSetAtomicEntry summary](v28, "summary"));
      id v31 = (void *)objc_claimAutoreleasedReturnValue([v51 summary]);
      id v32 = -[NSString initWithFormat:]( v29,  "initWithFormat:",  @"{%@} downloaded atomic-entry already tracked (ignoring duplicate) | downloadedAtomicEntry:%@, downloadedAssetDescriptor:%@",  v9,  v30,  v31);
      -[MADAutoAssetJob trackAnomaly:forReason:](self, "trackAnomaly:forReason:", 6109LL, v32);
    }

    else
    {
      -[NSMutableArray addObject:](v15, "addObject:", v28);
    }

    id v33 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
    [v33 setLatestDowloadedAtomicInstanceEntries:v15];

    if (v5)
    {
      __int128 v34 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
      id v35 = (void *)objc_claimAutoreleasedReturnValue([v34 metadata]);
      id v36 = [v35 safeIntegerForKey:@"_UnarchivedSize"];

      if ((uint64_t)[v51 downloadedNetworkBytes] >= 1)
      {
        uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
        unint64_t v38 = (unint64_t)[v37 downloadedNetworkBytes];

        if ((v38 & 0x8000000000000000LL) != 0)
        {
          id v43 = (char *)[v51 downloadedNetworkBytes];
          id v42 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
          v39 = v42;
          uint64_t v41 = v43;
        }

        else
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
          v40 = (char *)[v51 downloadedNetworkBytes];
          uint64_t v41 = &v40[(void)[v39 downloadedNetworkBytes]];
          id v42 = v39;
        }

        [v42 setDownloadedNetworkBytes:v41];
      }

      if ((uint64_t)[v51 downloadedFilesystemBytes] >= 1)
      {
        uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
        unint64_t v45 = (unint64_t)[v44 downloadedFilesystemBytes];

        if ((v45 & 0x8000000000000000LL) != 0)
        {
          char v50 = (char *)[v51 downloadedFilesystemBytes];
          __int128 v49 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
          BOOL v46 = v49;
          id v48 = v50;
        }

        else
        {
          BOOL v46 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
          unsigned int v47 = (char *)[v51 downloadedFilesystemBytes];
          id v48 = &v47[(void)[v46 downloadedFilesystemBytes]];
          __int128 v49 = v46;
        }

        [v49 setDownloadedFilesystemBytes:v48];
      }
    }
  }

  -[MADAutoAssetJob updateSetResults:atomicInstanceDiscovered:availableForUse:downloading:buildingResultSetFound:]( self,  "updateSetResults:atomicInstanceDiscovered:availableForUse:downloading:buildingResultSetFound:",  v9,  1LL,  0LL,  1LL,  0LL);
}

- (void)updateAutoAssetSetDescriptor
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 extendedStateQueue]);
  dispatch_assert_queue_V2(v4);

  if (!-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    __int128 v34 = @"updateAutoAssetSetDescriptor should only execute for set-job";
    goto LABEL_5;
  }

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));

  if (v5)
  {
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 latestDownloadedAtomicInstance]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
    [v8 setIsOnFilesystem:v7 != 0];

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
    [v9 setOnFilesystemIncomplete:0];

    unsigned int v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 latestDownloadedAtomicInstance]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
    [v12 setIsDiscoveredFullyDownloaded:v11 != 0];

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
    [v13 setNeverBeenLocked:0];

    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
    id v15 = [v14 downloadUserInitiated];
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
    [v16 setDownloadUserInitiated:v15];

    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
    id v18 = [v17 downloadedNetworkBytes];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
    [v19 setDownloadedNetworkBytes:v18];

    id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
    id v21 = [v20 downloadedFilesystemBytes];
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
    [v22 setDownloadedFilesystemBytes:v21];

    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
    [v23 setStagedPriorToAvailable:0];

    id v24 = objc_alloc(&OBJC_CLASS___MANAutoAssetSetInfoFound);
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetIdentifier](self, "autoAssetSetIdentifier"));
    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
    id v27 = -[MANAutoAssetSetInfoFound initForAssetSetIdentifier:reportingStatus:]( v24,  "initForAssetSetIdentifier:reportingStatus:",  v25,  v26);
    -[MADAutoAssetJob setResultSetFound:](self, "setResultSetFound:", v27);

    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
    id v29 = [v28 copy];
    id v30 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob setJobInformation](self, "setJobInformation"));
    [v30 setCurrentSetStatus:v29];

    id v31 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob resultSetFound](self, "resultSetFound"));
    id v32 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob setJobInformation](self, "setJobInformation"));
    [v32 setFoundContent:v31];

    id v38 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
    id v33 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob setJobInformation](self, "setJobInformation"));
    [v33 setSetDescriptor:v38];

    return;
  }

  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assignedSetDescriptor](self, "assignedSetDescriptor"));

  if (!v37)
  {
    if (-[MADAutoAssetJob anomalyNoAssignedSetDescriptor](self, "anomalyNoAssignedSetDescriptor")) {
      return;
    }
    -[MADAutoAssetJob setAnomalyNoAssignedSetDescriptor:](self, "setAnomalyNoAssignedSetDescriptor:", 1LL);
    __int128 v34 = @"no assigned auto-asset-set-descriptor";
LABEL_5:
    id v35 = self;
    uint64_t v36 = 6103LL;
LABEL_6:
    -[MADAutoAssetJob statusChange:catalogAnomaly:forReason:]( v35,  "statusChange:catalogAnomaly:forReason:",  @"updateAutoAssetSetDescriptor",  v36,  v34);
    return;
  }

  if (!-[MADAutoAssetJob anomalyNoActiveSetDescriptor](self, "anomalyNoActiveSetDescriptor"))
  {
    -[MADAutoAssetJob setAnomalyNoActiveSetDescriptor:](self, "setAnomalyNoActiveSetDescriptor:", 1LL);
    __int128 v34 = @"no auto-asset-set-descriptor for reporting set-job status to auto-control-manager";
    id v35 = self;
    uint64_t v36 = 6101LL;
    goto LABEL_6;
  }

- (id)newAtomicInstancesDownloadedForDescriptor:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  id v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue([v4 latestDownloadedAtomicInstance]);
  if (v7)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 latestDownloadedAtomicInstance]);
    -[NSMutableArray addObject:](v7, "addObject:", v8);
  }

  return v7;
}

- (BOOL)remainingSetDescriptorToBeDownloaded
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 extendedStateQueue]);
  dispatch_assert_queue_V2(v4);

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob setConfiguration](self, "setConfiguration"));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 autoAssetEntries]);
  id v7 = [v6 count];

  int64_t v8 = -[MADAutoAssetJob nextSetSpecifierToDownload](self, "nextSetSpecifierToDownload");
  BOOL v10 = v8 < (uint64_t)v7;
  if (v8 < (uint64_t)v7)
  {
    *(void *)&__int128 v9 = 138543618LL;
    __int128 v30 = v9;
    while (1)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob setConfiguration](self, "setConfiguration", v30));
      id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 autoAssetEntries]);
      id v13 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v12,  "objectAtIndex:",  -[MADAutoAssetJob nextSetSpecifierToDownload](self, "nextSetSpecifierToDownload")));

      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundSetFullDescriptorsBySpecifier](self, "foundSetFullDescriptorsBySpecifier"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 assetSelector]);
      id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 assetSpecifier]);
      id v17 = [v14 safeObjectForKey:v16 ofClass:objc_opt_class(MADAutoAssetDescriptor)];
      uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);

      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetJob foundSetPatchDescriptorsBySpecifier]( self,  "foundSetPatchDescriptorsBySpecifier"));
      id v20 = (void *)objc_claimAutoreleasedReturnValue([v13 assetSelector]);
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 assetSpecifier]);
      id v22 = [v19 safeObjectForKey:v21 ofClass:objc_opt_class(MADAutoAssetDescriptor)];
      uint64_t v23 = objc_claimAutoreleasedReturnValue(v22);

      if (v18 | v23) {
        break;
      }
      id v24 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
      id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v24 oslog]);

      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
        id v27 = (void *)objc_claimAutoreleasedReturnValue([v13 summary]);
        *(_DWORD *)int buf = v30;
        id v32 = v26;
        __int16 v33 = 2114;
        __int128 v34 = v27;
        _os_log_impl( &dword_0,  v25,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {remainingSetDescriptorToBeDownloaded} no newer to download | skipping nextEntryToDownload:%{public}@",  buf,  0x16u);
      }

      -[MADAutoAssetJob setNextSetSpecifierToDownload:]( self,  "setNextSetSpecifierToDownload:",  (char *)-[MADAutoAssetJob nextSetSpecifierToDownload](self, "nextSetSpecifierToDownload") + 1);
      int64_t v28 = -[MADAutoAssetJob nextSetSpecifierToDownload](self, "nextSetSpecifierToDownload");
      BOOL v10 = v28 < (uint64_t)v7;
    }
  }

  return v10;
}

- (BOOL)placeNextSetAssetDescriptorToDownload:(id)a3 restrictToFull:(BOOL)a4 error:(id *)a5
{
  id v7 = a3;
  int64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  __int128 v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 extendedStateQueue]);
  dispatch_assert_queue_V2(v9);

  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob setConfiguration](self, "setConfiguration"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 autoAssetEntries]);
  id v12 = [v11 count];

  id v57 = v7;
  if (-[MADAutoAssetJob nextSetSpecifierToDownload](self, "nextSetSpecifierToDownload") >= (uint64_t)v12)
  {
    uint64_t v37 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"AUTO-SET-JOB(%@)",  v7);
    id v38 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"no next specifier to download (at location %@)",  v7);
    v39 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6108LL,  v37,  0LL,  v38));

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assignedSetDescriptor](self, "assignedSetDescriptor"));
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v40 clientDomainName]);
    id v42 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assignedSetDescriptor](self, "assignedSetDescriptor"));
    id v43 = (void *)objc_claimAutoreleasedReturnValue([v42 assetSetIdentifier]);
    uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assignedSetDescriptor](self, "assignedSetDescriptor"));
    unint64_t v45 = a5;
    BOOL v46 = (void *)objc_claimAutoreleasedReturnValue([v44 discoveredAtomicInstance]);
    +[MADAutoAssetHistory recordFailedOperation:fromLayer:forClientDomainName:forAssetSetIdentifier:forAtomicInstance:failingWithError:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordFailedOperation:fromLayer:forClientDomainName:forAssetSetIdentifier:forAtomicInstance:failingWithError:",  504LL,  2LL,  v41,  v43,  v46,  v39);

    a5 = v45;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
    id v31 = (void *)objc_claimAutoreleasedReturnValue([v15 diag]);
    unsigned int v47 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"{placeNextSetAssetDescriptorToDownload} no next to place | nextSetSpecifierToDownload:%ld, autoAssetEntries:%ld",  -[MADAutoAssetJob nextSetSpecifierToDownload](self, "nextSetSpecifierToDownload"),  v12);
    [v31 trackAnomaly:@"AUTO-SET-JOB" forReason:v47 withResult:6108 withError:v39];
  }

  else
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob setConfiguration](self, "setConfiguration"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 autoAssetEntries]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v14,  "objectAtIndex:",  -[MADAutoAssetJob nextSetSpecifierToDownload](self, "nextSetSpecifierToDownload")));

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundSetPatchDescriptorsBySpecifier](self, "foundSetPatchDescriptorsBySpecifier"));
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v15 assetSelector]);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 assetSpecifier]);
    id v19 = [v16 safeObjectForKey:v18 ofClass:objc_opt_class(MADAutoAssetDescriptor)];
    id v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    -[MADAutoAssetJob setFoundNewerPatch:](self, "setFoundNewerPatch:", v20);

    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundSetFullDescriptorsBySpecifier](self, "foundSetFullDescriptorsBySpecifier"));
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v15 assetSelector]);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 assetSpecifier]);
    id v24 = [v21 safeObjectForKey:v23 ofClass:objc_opt_class(MADAutoAssetDescriptor)];
    id v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    -[MADAutoAssetJob setFoundNewerFull:](self, "setFoundNewerFull:", v25);

    -[MADAutoAssetJob setWasPatched:](self, "setWasPatched:", 0LL);
    -[MADAutoAssetJob setProgressReportPhase:](self, "setProgressReportPhase:", 0LL);
    -[MADAutoAssetJob setLastReportedPatchProgress:](self, "setLastReportedPatchProgress:", 0LL);
    -[MADAutoAssetJob setBaseForPatch:](self, "setBaseForPatch:", 0LL);
    -[MADAutoAssetJob setLatestInstalledAssetVersion:](self, "setLatestInstalledAssetVersion:", 0LL);
    -[MADAutoAssetJob setLatestInstalledAssetBuild:](self, "setLatestInstalledAssetBuild:", 0LL);
    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerPatch](self, "foundNewerPatch"));

    if (v26)
    {
      id v27 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetJob latestAssetDescriptorOnFilesystemBySpecifier]( self,  "latestAssetDescriptorOnFilesystemBySpecifier"));
      int64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerPatch](self, "foundNewerPatch"));
      id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 assetSpecifier]);
      id v30 = [v27 safeObjectForKey:v29 ofClass:objc_opt_class(MADAutoAssetDescriptor)];
      id v31 = (void *)objc_claimAutoreleasedReturnValue(v30);

      BOOL v32 = v31 != 0LL;
      if (v31)
      {
        -[MADAutoAssetJob setBaseForPatch:](self, "setBaseForPatch:", v31);
        __int16 v33 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob baseForPatch](self, "baseForPatch"));
        __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v33 assetVersion]);
        -[MADAutoAssetJob setLatestInstalledAssetVersion:](self, "setLatestInstalledAssetVersion:", v34);

        id v35 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob baseForPatch](self, "baseForPatch"));
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v35 build]);
        -[MADAutoAssetJob setLatestInstalledAssetBuild:](self, "setLatestInstalledAssetBuild:", v36);
      }

      else
      {
        id v48 = objc_alloc(&OBJC_CLASS___NSString);
        uint64_t v49 = objc_opt_self(self);
        id v35 = (void *)objc_claimAutoreleasedReturnValue(v49);
        uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v35 foundNewerPatch]);
        uint64_t v56 = a5;
        char v50 = (void *)objc_claimAutoreleasedReturnValue([v36 summary]);
        id v51 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerFull](self, "foundNewerFull"));
        id v52 = (void *)objc_claimAutoreleasedReturnValue([v51 summary]);
        uint64_t v53 = -[NSString initWithFormat:]( v48,  "initWithFormat:",  @"{%@:placeNextSetAssetDescriptorToDownload} no baseAssetDescriptor (downloading full instead of patch) | foundNewerPatch:%@, foundNewerFull:%@",  v57,  v50,  v52);
        -[MADAutoAssetJob trackAnomaly:forReason:](self, "trackAnomaly:forReason:", 6111LL, v53);

        a5 = v56;
      }

      unsigned int v47 = (NSString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerFull](self, "foundNewerFull"));
      id v54 = -[MADAutoAssetJob newCurrentStatusForDescriptor:](self, "newCurrentStatusForDescriptor:", v47);
      -[MADAutoAssetJob setCurrentStatus:](self, "setCurrentStatus:", v54);

      v39 = 0LL;
      goto LABEL_10;
    }

    id v31 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerFull](self, "foundNewerFull"));
    unsigned int v47 = -[MADAutoAssetJob newCurrentStatusForDescriptor:](self, "newCurrentStatusForDescriptor:", v31);
    -[MADAutoAssetJob setCurrentStatus:](self, "setCurrentStatus:", v47);
    v39 = 0LL;
  }

  BOOL v32 = 0;
LABEL_10:

  if (a5) {
    *a5 = v39;
  }

  return v32;
}

- (id)setEntryBeingDownloaded
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 extendedStateQueue]);
  dispatch_assert_queue_V2(v4);

  if (-[MADAutoAssetJob nextSetSpecifierToDownload](self, "nextSetSpecifierToDownload") < 0
    || (unint64_t v5 = -[MADAutoAssetJob nextSetSpecifierToDownload](self, "nextSetSpecifierToDownload"),
        uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob setConfiguration](self, "setConfiguration")),
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 autoAssetEntries]),
        id v8 = [v7 count],
        v7,
        v6,
        v5 >= (unint64_t)v8))
  {
    id v11 = 0LL;
  }

  else
  {
    __int128 v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob setConfiguration](self, "setConfiguration"));
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v9 autoAssetEntries]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v10,  "objectAtIndex:",  -[MADAutoAssetJob nextSetSpecifierToDownload](self, "nextSetSpecifierToDownload")));
  }

  return v11;
}

- (void)reportJustDownloadedAssetOfSet:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  id v7 = objc_alloc(&OBJC_CLASS___MADAutoAssetDescriptor);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
  __int128 v9 = (void *)objc_claimAutoreleasedReturnValue([v8 assetType]);
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 metadata]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
  id v56 = 0LL;
  id v13 = -[MADAutoAssetDescriptor initForAssetType:fromMetadata:fromBaseDescriptor:invalidReasons:]( v7,  "initForAssetType:fromMetadata:fromBaseDescriptor:invalidReasons:",  v9,  v11,  v12,  &v56);
  id v14 = v56;

  if (v13)
  {
    id v55 = v4;
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
    unsigned int v16 = [v15 downloadedAsPatch];

    id v54 = v14;
    if (v16)
    {
      id v17 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob baseForPatch](self, "baseForPatch"));

      if (v17)
      {
        uint64_t v18 = objc_alloc(&OBJC_CLASS___MAAutoAssetSelector);
        id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob baseForPatch](self, "baseForPatch"));
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 assetType]);
        id v21 = (NSString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob baseForPatch](self, "baseForPatch"));
        id v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSString assetSpecifier](v21, "assetSpecifier"));
        uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob baseForPatch](self, "baseForPatch"));
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 assetVersion]);
        id v17 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:]( v18,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:",  v20,  v22,  v24);
      }

      else
      {
        id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 diag]);
        id v21 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"{%@:reportJustDownloadedAssetOfSet} downloadedAsPatch yet no baseForPatch",  v4);
        [v20 trackAnomaly:@"AUTO-SET-JOB" forReason:v21 withResult:6111 withError:0];
      }
    }

    else
    {
      id v17 = 0LL;
    }

    [v13 setIsOnFilesystem:1];
    [v13 setNeverBeenLocked:1];
    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
    objc_msgSend(v13, "setDownloadUserInitiated:", objc_msgSend(v26, "downloadUserInitiated"));

    id v27 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
    objc_msgSend(v13, "setDownloadedNetworkBytes:", objc_msgSend(v27, "downloadedNetworkBytes"));

    int64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
    objc_msgSend(v13, "setDownloadedFilesystemBytes:", objc_msgSend(v28, "downloadedFilesystemBytes"));

    id v29 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
    objc_msgSend(v13, "setIsPatch:", objc_msgSend(v29, "downloadedAsPatch"));

    [v13 setPatchedFromBaseSelector:v17];
    if (v17)
    {
      id v30 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob baseForPatch](self, "baseForPatch"));
      objc_msgSend(v13, "setPatchedFromBaseFilesystemBytes:", objc_msgSend(v30, "downloadedFilesystemBytes"));
    }

    else
    {
      [v13 setPatchedFromBaseFilesystemBytes:0];
    }

    id v31 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
    objc_msgSend(v13, "setPatchingAttempted:", objc_msgSend(v31, "patchingAttempted"));

    BOOL v32 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
    objc_msgSend(v13, "setStagedPriorToAvailable:", objc_msgSend(v32, "stagedPriorToAvailable"));

    __int16 v33 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
    __int128 v34 = (void *)objc_claimAutoreleasedReturnValue([v33 stagedFromOSVersion]);
    [v13 setStagedFromOSVersion:v34];

    id v35 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
    uint64_t v36 = (void *)objc_claimAutoreleasedReturnValue([v35 stagedFromBuildVersion]);
    [v13 setStagedFromBuildVersion:v36];

    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
    id v38 = (void *)objc_claimAutoreleasedReturnValue([v37 patchingAttemptError]);
    [v13 setPatchingAttemptError:v38];

    [v13 setFoundByLookupWithoutAssetVersion:1];
    v39 = objc_alloc(&OBJC_CLASS___MAAutoAssetSelector);
    v40 = (void *)objc_claimAutoreleasedReturnValue([v13 assetType]);
    uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue([v13 assetSpecifier]);
    id v42 = (void *)objc_claimAutoreleasedReturnValue([v13 assetVersion]);
    id v43 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:]( v39,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:",  v40,  v41,  v42);

    BOOL v44 = -[MADAutoAssetJob wasPatched](self, "wasPatched");
    unint64_t v45 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob firstClientName](self, "firstClientName"));
    +[MADAutoAssetControlManager persistForJobSelector:persistingJobDescriptor:justPatched:withJobInformation:withFirstClientName:]( &OBJC_CLASS___MADAutoAssetControlManager,  "persistForJobSelector:persistingJobDescriptor:justPatched:withJobInformation:withFirstClientName:",  v43,  v13,  v44,  0LL,  v45);

    BOOL v46 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
    unsigned int v47 = (void *)objc_claimAutoreleasedReturnValue([v46 clientDomainName]);
    id v48 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
    uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue([v48 assetSetIdentifier]);
    char v50 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
    id v51 = (void *)objc_claimAutoreleasedReturnValue([v50 discoveredAtomicInstance]);
    +[MADAutoAssetHistory recordOperation:toHistoryType:fromLayer:usageCount:forClientDomainName:forAssetSetIdentifier:forAtomicInstance:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordOperation:toHistoryType:fromLayer:usageCount:forClientDomainName:forAssetSetIdentifier:forAtomicInstance:",  600LL,  2LL,  2LL,  0LL,  v47,  v49,  v51);

    id v52 = (void *)objc_claimAutoreleasedReturnValue([v13 assetType]);
    uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v13 assetSpecifier]);
    id v4 = v55;
    +[MADAutoAssetControlManager postNotificationName:forAssetType:forAssetSpecifier:fromModule:fromLocation:]( &OBJC_CLASS___MADAutoAssetControlManager,  "postNotificationName:forAssetType:forAssetSpecifier:fromModule:fromLocation:",  @"ASSET_VERSION_DOWNLOADED",  v52,  v53,  @"AUTO-JOB",  v55);

    id v14 = v54;
  }

  else
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
    id v17 = (id)objc_claimAutoreleasedReturnValue([v25 oslog]);

    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_ERROR)) {
      -[MADAutoAssetJob reportJustDownloadedAssetOfSet:].cold.1();
    }
  }
}

- (void)setProgressReadyToStartDownloads
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 extendedStateQueue]);
  dispatch_assert_queue_V2(v4);

  unint64_t v5 = objc_alloc_init(&OBJC_CLASS___MANAutoAssetSetProgress);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
  [v6 setDownloadProgress:v5];

  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob setConfiguration](self, "setConfiguration"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 autoAssetEntries]);

  id obj = v8;
  id v9 = [v8 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v33 = 0LL;
    uint64_t v34 = 0LL;
    uint64_t v11 = *(void *)v36;
    do
    {
      for (i = 0LL; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)i);
        id v14 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetJob foundSetFullDescriptorsBySpecifier]( self,  "foundSetFullDescriptorsBySpecifier"));
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 assetSelector]);
        unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 assetSpecifier]);
        id v17 = [v14 safeObjectForKey:v16 ofClass:objc_opt_class(MADAutoAssetDescriptor)];
        uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);

        id v19 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetJob foundSetPatchDescriptorsBySpecifier]( self,  "foundSetPatchDescriptorsBySpecifier"));
        id v20 = (void *)objc_claimAutoreleasedReturnValue([v13 assetSelector]);
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 assetSpecifier]);
        id v22 = [v19 safeObjectForKey:v21 ofClass:objc_opt_class(MADAutoAssetDescriptor)];
        uint64_t v23 = objc_claimAutoreleasedReturnValue(v22);

        if (v18 | v23)
        {
          if (v18) {
            id v24 = (void *)v18;
          }
          else {
            id v24 = (void *)v23;
          }
          id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 metadata]);
          ++v34;
          v33 += (uint64_t)[v25 safeIntegerForKey:@"_DownloadSize"];
        }
      }

      id v10 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }

    while (v10);
  }

  else
  {
    uint64_t v33 = 0LL;
    uint64_t v34 = 0LL;
  }

  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
  id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 downloadProgress]);
  [v27 setTotalExpectedBytes:v33];

  int64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
  id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 downloadProgress]);
  [v29 setExpectedTimeRemainingSecs:(double)v33 * 0.00000762939453];

  id v30 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
  id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 downloadProgress]);
  [v31 setRemainingAssetCount:v34];

  -[MADAutoAssetJob setSetProgressOverallTotalWrittenBytes:](self, "setSetProgressOverallTotalWrittenBytes:", 0LL);
  -[MADAutoAssetJob setSetProgressAssetTotalWrittenBytes:](self, "setSetProgressAssetTotalWrittenBytes:", 0LL);
}

- (void)setProgressAssetDownload:(id)a3
{
  id v4 = a3;
  id v5 = [v4 isStalled];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 downloadProgress]);
  [v7 setIsStalled:v5];

  id v8 = [v4 totalWrittenBytes];
  int64_t v9 = -[MADAutoAssetJob setProgressAssetTotalWrittenBytes](self, "setProgressAssetTotalWrittenBytes");
  uint64_t v10 = (uint64_t)v8 - v9;
  if ((uint64_t)v8 <= v9)
  {
    -[MADAutoAssetJob setSetProgressAssetTotalWrittenBytes:](self, "setSetProgressAssetTotalWrittenBytes:", 0LL);
  }

  else
  {
    double v11 = (double)v10 * 0.00000762939453;
    -[MADAutoAssetJob setSetProgressAssetTotalWrittenBytes:]( self,  "setSetProgressAssetTotalWrittenBytes:",  (char *)-[MADAutoAssetJob setProgressAssetTotalWrittenBytes](self, "setProgressAssetTotalWrittenBytes") + v10);
    int64_t v12 = -[MADAutoAssetJob setProgressOverallTotalWrittenBytes](self, "setProgressOverallTotalWrittenBytes");
    id v13 = (char *)-[MADAutoAssetJob setProgressAssetTotalWrittenBytes](self, "setProgressAssetTotalWrittenBytes") + v12;
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 downloadProgress]);
    [v15 setTotalWrittenBytes:v13];

    if (v11 > 0.0)
    {
      unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
      id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 downloadProgress]);
      [v17 expectedTimeRemainingSecs];
      double v19 = v18;

      if (v19 > v11)
      {
        id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 downloadProgress]);
        [v21 expectedTimeRemainingSecs];
        [v21 setExpectedTimeRemainingSecs:v22 - v11];
      }
    }

    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
    id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 downloadProgress]);
    id v25 = [v24 totalWrittenBytes];
    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob setJobInformation](self, "setJobInformation"));
    id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 currentSetStatus]);
    int64_t v28 = (void *)objc_claimAutoreleasedReturnValue([v27 downloadProgress]);
    [v28 setTotalWrittenBytes:v25];

    id v29 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 downloadProgress]);
    id v31 = [v30 totalExpectedBytes];
    BOOL v32 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob setJobInformation](self, "setJobInformation"));
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v32 currentSetStatus]);
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v33 downloadProgress]);
    [v34 setTotalExpectedBytes:v31];

    id v41 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
    __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v41 downloadProgress]);
    [v35 expectedTimeRemainingSecs];
    double v37 = v36;
    __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob setJobInformation](self, "setJobInformation"));
    v39 = (void *)objc_claimAutoreleasedReturnValue([v38 currentSetStatus]);
    v40 = (void *)objc_claimAutoreleasedReturnValue([v39 downloadProgress]);
    [v40 setExpectedTimeRemainingSecs:v37];
  }

- (void)finishJobTaskForJobParam:(id)a3 withUnderlyingError:(id)a4 fromAction:(id)a5
{
  id v18 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  double v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v10 extendedStateQueue]);
  dispatch_assert_queue_V2(v11);

  if (v8)
  {
    int64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v8 domain]);
    unsigned int v13 = +[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v12,  @"com.apple.MobileAssetError.AutoAsset");

    if (v13)
    {
      id v14 = v8;
    }

    else
    {
      int64_t v15 = -[MADAutoAssetJob errorCodeFromUnderling:](self, "errorCodeFromUnderling:", v8);
      unsigned int v16 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"AUTO-JOB(%@)",  v9);
      id v17 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"underlying error resulted in auto-asset job-task failure (at location %@)",  v9);
      id v14 = (id)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v15,  v16,  v8,  v17));
    }
  }

  else
  {
    id v14 = 0LL;
  }

  -[MADAutoAssetJob finishJobTaskForJobParam:withResponseError:]( self,  "finishJobTaskForJobParam:withResponseError:",  v18,  v14);
}

- (void)finishJobTaskForJobParam:(id)a3 withResponseError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 extendedStateQueue]);
  dispatch_assert_queue_V2(v9);

  -[MADAutoAssetJob statusChangeJobFinished:withResponseError:]( self,  "statusChangeJobFinished:withResponseError:",  v6,  v7);
  -[MADAutoAssetJob replyToClientForJobParam:withResponseError:]( self,  "replyToClientForJobParam:withResponseError:",  v6,  v7);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
  double v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 oslog]);

  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v12)
    {
      unsigned int v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 summary]);
      int64_t v15 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetClientRequest responseErrorSummary:]( &OBJC_CLASS___MADAutoAssetClientRequest,  "responseErrorSummary:",  v7));
      int v17 = 138543874;
      id v18 = v13;
      __int16 v19 = 2114;
      id v20 = v14;
      __int16 v21 = 2114;
      double v22 = v15;
      _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | job-task finished:%{public}@ | error:%{public}@",  (uint8_t *)&v17,  0x20u);

LABEL_6:
    }
  }

  else if (v12)
  {
    unsigned int v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v6 summary]);
    int v17 = 138543618;
    id v18 = v16;
    __int16 v19 = 2114;
    id v20 = v14;
    _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | job-task finished:%{public}@ | SUCCESS",  (uint8_t *)&v17,  0x16u);

    goto LABEL_6;
  }
}

- (void)autoAssetJobFinished:(id)a3 forJobFinishedReason:(id)a4
{
}

- (void)autoAssetJobFinished:(id)a3 forJobFinishedReason:(id)a4 failingWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  BOOL v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v11 extendedStateQueue]);
  dispatch_assert_queue_V2(v12);

  if ((char *)-[MADAutoAssetJob simulateOperation](self, "simulateOperation") == (char *)&dword_4 + 2)
  {
    -[MADAutoAssetJob setSimulateTriggered:]( self,  "setSimulateTriggered:",  -[MADAutoAssetJob simulateOperation](self, "simulateOperation"));
    char v13 = objc_opt_respondsToSelector(&OBJC_CLASS___MANAutoAssetInfoControl, "nameOfSimulateOperation:");
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
    int64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 oslog]);

    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if ((v13 & 1) != 0)
    {
      if (v16)
      {
        int v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
        id v18 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetInfoControl nameOfSimulateOperation:]( &OBJC_CLASS___MANAutoAssetInfoControl,  "nameOfSimulateOperation:",  -[MADAutoAssetJob simulateOperation](self, "simulateOperation")));
        int v20 = 138543618;
        __int16 v21 = v17;
        __int16 v22 = 2114;
        int64_t v23 = (int64_t)v18;
        _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@ {autoAssetJobFinished} | SIMULATE_OPERATION(%{public}@) | call to _autoAssetJobFinished postponed",  (uint8_t *)&v20,  0x16u);
      }
    }

    else if (v16)
    {
      __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
      int v20 = 138543618;
      __int16 v21 = v19;
      __int16 v22 = 2048;
      int64_t v23 = -[MADAutoAssetJob simulateOperation](self, "simulateOperation");
      _os_log_impl( &dword_0,  v15,  OS_LOG_TYPE_DEFAULT,  "%{public}@ {autoAssetJobFinished} | SIMULATE_OPERATION(%lld) | call to _autoAssetJobFinished postponed",  (uint8_t *)&v20,  0x16u);
    }
  }

  else
  {
    -[MADAutoAssetJob _autoAssetJobFinished:forJobFinishedReason:failingWithError:]( self,  "_autoAssetJobFinished:forJobFinishedReason:failingWithError:",  v8,  v9,  v10);
  }
}

- (void)_autoAssetJobFinished:(id)a3 forJobFinishedReason:(id)a4 failingWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  double v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  BOOL v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v11 extendedStateQueue]);
  dispatch_assert_queue_V2(v12);

  LODWORD(v12) = -[MADAutoAssetJob stagerJob](self, "stagerJob");
  char v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 oslog]);

  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v12)
  {
    if (!v15) {
      goto LABEL_17;
    }
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
    *(_DWORD *)int buf = 138543618;
    __int128 v66 = v16;
    __int16 v67 = 2114;
    id v68 = v9;
    _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {autoAssetJobFinished} stager-job has finished | %{public}@ | (already implied to auto-contol-manager when staged operation done reported)",  buf,  0x16u);
    goto LABEL_14;
  }

  if (v15)
  {
    int v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
    *(_DWORD *)int buf = 138543618;
    __int128 v66 = v17;
    __int16 v67 = 2114;
    id v68 = v9;
    _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {autoAssetJobFinished} job has finished | %{public}@ | MA_MILESTONE",  buf,  0x16u);
  }

  if (!-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 assetVersion]);
    if (v22)
    {
    }

    else
    {
      int64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob resultFound](self, "resultFound"));

      if (!v23)
      {
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
        BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetUUID](self, "autoAssetUUID"));
        +[MADAutoAssetControlManager autoAssetJobFinished:withAutoAssetUUID:schedulerInvolved:potentialNetworkFailure:]( &OBJC_CLASS___MADAutoAssetControlManager,  "autoAssetJobFinished:withAutoAssetUUID:schedulerInvolved:potentialNetworkFailure:",  v14,  v16,  -[MADAutoAssetJob schedulerInvolved](self, "schedulerInvolved"),  -[MADAutoAssetJob potentialNetworkFailure](self, "potentialNetworkFailure"));
        goto LABEL_14;
      }
    }

    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob resultFound](self, "resultFound"));
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s fullAssetSelector](v14, "fullAssetSelector"));
    id v24 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetUUID](self, "autoAssetUUID"));
    +[MADAutoAssetControlManager autoAssetJobFinished:withAutoAssetUUID:schedulerInvolved:potentialNetworkFailure:]( &OBJC_CLASS___MADAutoAssetControlManager,  "autoAssetJobFinished:withAutoAssetUUID:schedulerInvolved:potentialNetworkFailure:",  v16,  v24,  -[MADAutoAssetJob schedulerInvolved](self, "schedulerInvolved"),  -[MADAutoAssetJob potentialNetworkFailure](self, "potentialNetworkFailure"));

LABEL_14:
    goto LABEL_17;
  }

  id v63 = v9;
  if (!v10)
  {
    id v64 = 0LL;
    -[MADAutoAssetJob _commitPrePersonalized:error:](self, "_commitPrePersonalized:error:", v8, &v64);
    id v18 = v64;
    if (v18)
    {
      id v19 = v18;
      int v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
      [v20 setAvailableForUseError:v19];

      id v10 = v19;
      -[MADAutoAssetJob finishedSetJobFinalizeStatus:failingWithError:]( self,  "finishedSetJobFinalizeStatus:failingWithError:",  @"all content downloaded but failure committing pre-personalized",  v19);
    }

    else
    {
      id v10 = 0LL;
    }
  }

  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob clientDomainName](self, "clientDomainName"));
  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetIdentifier](self, "autoAssetSetIdentifier"));
  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetUUID](self, "autoAssetUUID"));
  id v27 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob setJobInformation](self, "setJobInformation"));
  id v28 = v8;
  id v29 = [v27 copy];
  BOOL v30 = -[MADAutoAssetJob schedulerInvolved](self, "schedulerInvolved");
  LOBYTE(v58) = -[MADAutoAssetJob potentialNetworkFailure](self, "potentialNetworkFailure");
  +[MADAutoAssetControlManager autoSetJobFinished:forAssetSetIdentifier:withAutoAssetUUID:fromAutoAssetJob:withSetJobInformation:schedulerInvolved:potentialNetworkFailure:]( &OBJC_CLASS___MADAutoAssetControlManager,  "autoSetJobFinished:forAssetSetIdentifier:withAutoAssetUUID:fromAutoAssetJob:withSetJobInformation:schedulerInvolved: potentialNetworkFailure:",  v14,  v25,  v26,  self,  v29,  v30,  v58);

  id v8 = v28;
  id v9 = v63;
LABEL_17:

  id v31 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob activeJobTasks](self, "activeJobTasks"));
  id v32 = [v31 count];

  if (v32)
  {
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
    uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue([v33 diag]);
    __int128 v35 = objc_alloc(&OBJC_CLASS___NSString);
    double v36 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob activeJobTasks](self, "activeJobTasks"));
    double v37 = -[NSString initWithFormat:]( v35,  "initWithFormat:",  @"{autoAssetJobFinished} %ld job-tasks when should be none (potentially stranded)",  [v36 count]);
    [v34 trackAnomaly:@"AUTO-JOB" forReason:v37 withResult:6109 withError:0];
  }

  __int128 v38 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[MADAutoAssetJob setActiveJobTasks:](self, "setActiveJobTasks:", v38);

  -[MADAutoAssetJob setSchedulerInvolved:](self, "setSchedulerInvolved:", 0LL);
  -[MADAutoAssetJob setSetCheckAwaitingDownload:](self, "setSetCheckAwaitingDownload:", 0LL);
  -[MADAutoAssetJob setPotentialNetworkFailure:](self, "setPotentialNetworkFailure:", 0LL);
  -[MADAutoAssetJob setStagerJobDownloadContent:](self, "setStagerJobDownloadContent:", 0LL);
  -[MADAutoAssetJob setStagerJobResultsReported:](self, "setStagerJobResultsReported:", 0LL);
  -[MADAutoAssetJob setActiveInstance:](self, "setActiveInstance:", 0LL);
  -[MADAutoAssetJob setActiveDesire:](self, "setActiveDesire:", 0LL);
  -[MADAutoAssetJob setActiveFound:](self, "setActiveFound:", 0LL);
  -[MADAutoAssetJob setActiveEnd:](self, "setActiveEnd:", 0LL);
  -[MADAutoAssetJob setActiveListen:](self, "setActiveListen:", 0LL);
  v39 = objc_alloc_init(&OBJC_CLASS___MAAutoAssetPolicy);
  -[MADAutoAssetJob setAggregatedClientAssetPolicy:](self, "setAggregatedClientAssetPolicy:", v39);

  -[MADAutoAssetJob setAggregatedClientAssetPolicySpecified:](self, "setAggregatedClientAssetPolicySpecified:", 0LL);
  v40 = objc_alloc_init(&OBJC_CLASS___MANAutoAssetSetPolicy);
  -[MADAutoAssetJob setAggregatedClientSetPolicy:](self, "setAggregatedClientSetPolicy:", v40);

  -[MADAutoAssetJob setAggregatedClientSetPolicySpecified:](self, "setAggregatedClientSetPolicySpecified:", 0LL);
  -[MADAutoAssetJob setOnFilesystemByVersion:](self, "setOnFilesystemByVersion:", 0LL);
  -[MADAutoAssetJob setCheckUUIDBasePortion:](self, "setCheckUUIDBasePortion:", 0LL);
  -[MADAutoAssetJob setCheckUUID:](self, "setCheckUUID:", 0LL);
  -[MADAutoAssetJob releaseLookupGrant](self, "releaseLookupGrant");
  -[MADAutoAssetJob setRampingForeground:](self, "setRampingForeground:", 0LL);
  -[MADAutoAssetJob setRampingForegroundLatched:](self, "setRampingForegroundLatched:", 0LL);
  -[MADAutoAssetJob setCatalogDownloadOptions:](self, "setCatalogDownloadOptions:", 0LL);
  -[MADAutoAssetJob setAssetDownloadOptions:](self, "setAssetDownloadOptions:", 0LL);
  -[MADAutoAssetJob setBaseForPatch:](self, "setBaseForPatch:", 0LL);
  -[MADAutoAssetJob setFoundNewerPatch:](self, "setFoundNewerPatch:", 0LL);
  -[MADAutoAssetJob setFoundNewerFull:](self, "setFoundNewerFull:", 0LL);
  -[MADAutoAssetJob setNewerFoundAssetDescriptor:](self, "setNewerFoundAssetDescriptor:", 0LL);
  -[MADAutoAssetJob setDownloadingAssetDescriptor:](self, "setDownloadingAssetDescriptor:", 0LL);
  -[MADAutoAssetJob setSchedulerTriggerReceived:](self, "setSchedulerTriggerReceived:", 0LL);
  -[MADAutoAssetJob setDownloadingUserInitiated:](self, "setDownloadingUserInitiated:", 0LL);
  -[MADAutoAssetJob setBoostedToUserInitiated:](self, "setBoostedToUserInitiated:", 0LL);
  -[MADAutoAssetJob setCheckingAssetContent:](self, "setCheckingAssetContent:", 0LL);
  -[MADAutoAssetJob setDeterminingAssetContent:](self, "setDeterminingAssetContent:", 0LL);
  -[MADAutoAssetJob setLockingAssetContent:](self, "setLockingAssetContent:", 0LL);
  -[MADAutoAssetJob setWasPatched:](self, "setWasPatched:", 0LL);
  -[MADAutoAssetJob setLatestInstalledAssetVersion:](self, "setLatestInstalledAssetVersion:", 0LL);
  -[MADAutoAssetJob setLatestInstalledAssetBuild:](self, "setLatestInstalledAssetBuild:", 0LL);
  -[MADAutoAssetJob setLatestAssetDescriptorOnFilesystemBySpecifier:]( self,  "setLatestAssetDescriptorOnFilesystemBySpecifier:",  0LL);
  -[MADAutoAssetJob setFoundSetPatchDescriptorsBySpecifier:](self, "setFoundSetPatchDescriptorsBySpecifier:", 0LL);
  -[MADAutoAssetJob setFoundSetFullDescriptorsBySpecifier:](self, "setFoundSetFullDescriptorsBySpecifier:", 0LL);
  -[MADAutoAssetJob setSetSpaceCheckedUUID:](self, "setSetSpaceCheckedUUID:", 0LL);
  if (!-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    id v41 = objc_alloc(&OBJC_CLASS___MAAutoAssetStatus);
    char v42 = objc_opt_respondsToSelector( v41,  "initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withNeverBe enLocked:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemB ytes:withDownloadedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttemp ted:withStagedPriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withA vailableForUseError:withPatchingAttemptError:withNewerVersionError:");

    id v43 = objc_alloc(&OBJC_CLASS___MAAutoAssetStatus);
    BOOL v44 = v43;
    if ((v42 & 1) != 0)
    {
      unint64_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
      BOOL v46 = objc_alloc_init(&OBJC_CLASS___MAAutoAssetNotifications);
      unsigned int v47 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
      id v48 = (void *)objc_claimAutoreleasedReturnValue([v47 metadata]);
      LOWORD(v62) = 0;
      LOBYTE(v60) = 0;
      uint64_t v49 = -[MAAutoAssetStatus initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withNeverBeenLocked:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withDownloadedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttempted:withStagedPriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withAvailableForUseError:withPatchingAttemptError:withNewerVersionError:]( v44,  "initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withNever BeenLocked:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesys temBytes:withDownloadedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatching Attempted:withStagedPriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsa ge:withAvailableForUseError:withPatchingAttemptError:withNewerVersionError:",  v45,  v46,  v48,  0LL,  1LL,  -[MADAutoAssetJob downloadingUserInitiated](self, "downloadingUserInitiated"),  0LL,  -1LL,  -1LL,  v60,  0LL,  -1LL,  v62,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
      -[MADAutoAssetJob setCurrentStatus:](self, "setCurrentStatus:", v49);
    }

    else
    {
      char v50 = objc_opt_respondsToSelector( v43,  "initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withDownl oadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withDownloa dedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttempted:withStaged PriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withAvailableForU seError:withPatchingAttemptError:withNewerVersionError:");

      if ((v50 & 1) == 0)
      {
        id v55 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
        unint64_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue([v55 oslog]);

        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
          -[MADAutoAssetJob _autoAssetJobFinished:forJobFinishedReason:failingWithError:].cold.1(self);
        }
        goto LABEL_28;
      }

      id v51 = objc_alloc(&OBJC_CLASS___MAAutoAssetStatus);
      unint64_t v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
      BOOL v46 = objc_alloc_init(&OBJC_CLASS___MAAutoAssetNotifications);
      id v52 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
      uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v52 metadata]);
      LOWORD(v61) = 0;
      LOBYTE(v59) = 0;
      id v54 = -[MAAutoAssetStatus initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withDownloadedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttempted:withStagedPriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withAvailableForUseError:withPatchingAttemptError:withNewerVersionError:]( v51,  "initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withDownl oadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withDownloa dedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttempted:withStaged PriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withAvailableForU seError:withPatchingAttemptError:withNewerVersionError:",  v45,  v46,  v53,  0LL,  -[MADAutoAssetJob downloadingUserInitiated](self, "downloadingUserInitiated"),  0LL,  -1LL,  -1LL,  v59,  0LL,  -1LL,  v61,  0LL,  0LL,  0LL,  0LL,  0LL,  0LL);
      -[MADAutoAssetJob setCurrentStatus:](self, "setCurrentStatus:", v54);
    }

LABEL_28:
    goto LABEL_29;
  }

  -[MADAutoAssetJob finishedSetJobFinalizeStatus:failingWithError:]( self,  "finishedSetJobFinalizeStatus:failingWithError:",  v9,  v10);
LABEL_29:
  -[MADAutoAssetJob setProgressReportPhase:](self, "setProgressReportPhase:", 0LL);
  -[MADAutoAssetJob setLastReportedPatchProgress:](self, "setLastReportedPatchProgress:", 0LL);
  -[MADAutoAssetJob setResultSelector:](self, "setResultSelector:", 0LL);
  -[MADAutoAssetJob setResultInstance:](self, "setResultInstance:", 0LL);
  -[MADAutoAssetJob setResultFound:](self, "setResultFound:", 0LL);
  -[MADAutoAssetJob setResultEnd:](self, "setResultEnd:", 0LL);
  -[MADAutoAssetJob setResultListen:](self, "setResultListen:", 0LL);
  -[MADAutoAssetJob setLatestAssetDescriptorOnFilesystemBySpecifier:]( self,  "setLatestAssetDescriptorOnFilesystemBySpecifier:",  0LL);
  -[MADAutoAssetJob setFoundSetPatchDescriptorsBySpecifier:](self, "setFoundSetPatchDescriptorsBySpecifier:", 0LL);
  -[MADAutoAssetJob setFoundSetFullDescriptorsBySpecifier:](self, "setFoundSetFullDescriptorsBySpecifier:", 0LL);
  -[MADAutoAssetJob setFoundSetNewerDiscoveredAtomicEntries:](self, "setFoundSetNewerDiscoveredAtomicEntries:", 0LL);
  -[MADAutoAssetJob setFoundSameAtomicInstanceAlreadyDownloaded:]( self,  "setFoundSameAtomicInstanceAlreadyDownloaded:",  0LL);
  id v56 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[MADAutoAssetJob setPrePersonalizedSelectors:](self, "setPrePersonalizedSelectors:", v56);

  id v57 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[MADAutoAssetJob setTryPersonalizeDescriptors:](self, "setTryPersonalizeDescriptors:", v57);

  -[MADAutoAssetJob setTryPersonalizeSelector:](self, "setTryPersonalizeSelector:", 0LL);
  -[MADAutoAssetJob setTryPersonalizeSuccess:](self, "setTryPersonalizeSuccess:", 0LL);
  -[MADAutoAssetJob setTryPersonalizeFailed:](self, "setTryPersonalizeFailed:", 0LL);
  -[MADAutoAssetJob setBecameLatestToVend:](self, "setBecameLatestToVend:", 0LL);
  -[MADAutoAssetJob setNewestDownloadedSetStatus:](self, "setNewestDownloadedSetStatus:", 0LL);
  -[MADAutoAssetJob setSetSpaceCheckedUUID:](self, "setSetSpaceCheckedUUID:", 0LL);
  -[MADAutoAssetJob setLatestAutoAssetSetSummary:](self, "setLatestAutoAssetSetSummary:", 0LL);
  -[MADAutoAssetJob setResultSetFound:](self, "setResultSetFound:", 0LL);
}

- (void)finishSetJobDownloadedNewer:(id)a3 forJobFinishedReason:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v7 extendedStateQueue]);
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
  LODWORD(v7) = +[MADAutoAssetSecure isPersonalizationRequired:forSetDescriptor:]( &OBJC_CLASS___MADAutoAssetSecure,  "isPersonalizationRequired:forSetDescriptor:",  v21,  v9);

  if ((_DWORD)v7)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
    unsigned int v11 = +[MADAutoAssetControlManager autoSetJobAvailableAtomicInstanceForSetDescriptor:]( &OBJC_CLASS___MADAutoAssetControlManager,  "autoSetJobAvailableAtomicInstanceForSetDescriptor:",  v10);

    if (v11)
    {
      -[MADAutoAssetJob finishedSetSameVersionFound:](self, "finishedSetSameVersionFound:", v21);
    }

    else
    {
      BOOL v12 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"AUTO-SET-JOB(%@)",  v21);
      char v13 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"set-job ended with all content downloaded but some secure auto-assets require personalization [intended:%@]",  v6);
      id v14 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6535LL,  v12,  0LL,  v13));

      BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assignedSetDescriptor](self, "assignedSetDescriptor"));
      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v15 clientDomainName]);
      int v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assignedSetDescriptor](self, "assignedSetDescriptor"));
      id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 assetSetIdentifier]);
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assignedSetDescriptor](self, "assignedSetDescriptor"));
      int v20 = (void *)objc_claimAutoreleasedReturnValue([v19 discoveredAtomicInstance]);
      +[MADAutoAssetHistory recordFailedOperation:fromLayer:forClientDomainName:forAssetSetIdentifier:forAtomicInstance:failingWithError:]( &OBJC_CLASS___MADAutoAssetHistory,  "recordFailedOperation:fromLayer:forClientDomainName:forAssetSetIdentifier:forAtomicInstance:failingWithError:",  504LL,  2LL,  v16,  v18,  v20,  v14);

      -[MADAutoAssetJob doneWithAllJobs:withLookupError:](self, "doneWithAllJobs:withLookupError:", v21, v14);
      -[MADAutoAssetJob autoAssetJobFinished:forJobFinishedReason:]( self,  "autoAssetJobFinished:forJobFinishedReason:",  v21,  @"SUCCESS(NOT_AVAILABLE)");
    }
  }

  else
  {
    -[MADAutoAssetJob foundAndDownloadedSet:](self, "foundAndDownloadedSet:", v21);
    -[MADAutoAssetJob replyToJobsWhenContentDownloaded:](self, "replyToJobsWhenContentDownloaded:", v21);
    -[MADAutoAssetJob doneWithAllJobs:](self, "doneWithAllJobs:", v21);
    -[MADAutoAssetJob autoAssetJobFinished:forJobFinishedReason:]( self,  "autoAssetJobFinished:forJobFinishedReason:",  v21,  v6);
  }
}

- (void)finishedSetJobFinalizeStatus:(id)a3 failingWithError:(id)a4
{
  id v90 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v7 extendedStateQueue]);
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetNotifications](self, "currentSetNotifications"));
  if (!v9)
  {
    id v10 = objc_alloc_init(&OBJC_CLASS___MANAutoAssetSetNotifications);
    -[MADAutoAssetJob setCurrentSetNotifications:](self, "setCurrentSetNotifications:", v10);
  }

  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetNotifications](self, "currentSetNotifications"));
  [v11 setDownloadPending:0];

  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetNotifications](self, "currentSetNotifications"));
  [v12 setDownloadProgress:0];

  if ((+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v90, @"POSTPONED") & 1) == 0
    && (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v90, @"FAILED") & 1) == 0
    && (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v90,  @"FAILED(RELEASED_GRANT)") & 1) == 0 && (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v90, @"NO_NEWER") & 1) == 0 && (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v90, @"FOUND_SAME") & 1) == 0 && (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v90, @"REVOKED") & 1) == 0 && (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v90, @"ENDED") & 1) == 0 && (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v90, @"CANCELED") & 1) == 0 && (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v90,  @"CANCELED(RELEASED_GRANT)") & 1) == 0 && (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v90,  @"SIMULATED_POSTPONE_ENDED") & 1) == 0 && !+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v90,  @"SUCCESS(NOT_AVAILABLE)"))
  {
    if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v90,  @"SUCCESS(PATCHED)") & 1) != 0 || +[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v90,  @"SUCCESS(DOWNLOADED)"))
    {
      char v42 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetNotifications](self, "currentSetNotifications"));
      id v43 = v42;
      uint64_t v44 = 1LL;
    }

    else
    {
      if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v90,  @"SUCCESS(ALREADY_DOWNLOADED)") & 1) == 0 && (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v90,  @"SUCCESS(PERSONALIZED)") & 1) == 0 && !+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v90,  @"SUCCESS(IMMEDIATE_PROMOTED)"))
      {
        if (!+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v90, @"NONE"))
        {
          BOOL v46 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"{finishedSetJobFinalizeStatus} unable to refresh current-set-notifications | jobFinishedReason:%@",  v90);
          -[MADAutoAssetJob trackAnomaly:forReason:](self, "trackAnomaly:forReason:", 6108LL, v46);
          goto LABEL_53;
        }

        id v48 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetNotifications](self, "currentSetNotifications"));
        [v48 setAtomicInstanceDiscovered:0];

        unint64_t v45 = (NSString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetNotifications](self, "currentSetNotifications"));
        BOOL v46 = v45;
        uint64_t v47 = 0LL;
LABEL_52:
        -[NSString setAtomicInstanceAvailableForUse:](v45, "setAtomicInstanceAvailableForUse:", v47);
LABEL_53:

        goto LABEL_29;
      }

      char v42 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetNotifications](self, "currentSetNotifications"));
      id v43 = v42;
      uint64_t v44 = 0LL;
    }

    [v42 setAtomicInstanceDiscovered:v44];

    unint64_t v45 = (NSString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetNotifications](self, "currentSetNotifications"));
    BOOL v46 = v45;
    uint64_t v47 = 1LL;
    goto LABEL_52;
  }

  char v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetNotifications](self, "currentSetNotifications"));
  [v13 setAtomicInstanceDiscovered:0];

  id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetNotifications](self, "currentSetNotifications"));
  [v14 setAtomicInstanceAvailableForUse:0];

  if ((+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v90, @"FAILED") & 1) != 0
    || (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v90,  @"FAILED(RELEASED_GRANT)") & 1) != 0 || +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v90, @"ENDED"))
  {
    id v15 = v6;
LABEL_18:
    id v88 = v15;
    v89 = 0LL;
    goto LABEL_19;
  }

  if (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v90, @"NO_NEWER"))
  {
    __int128 v38 = @"set-job catalog lookup found no newer [server-side] atomic-instance of auto-asset-set";
    uint64_t v39 = 6201LL;
LABEL_36:
    v89 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v39,  @"finishedSetJobFinalizeStatus",  0LL,  v38));
    goto LABEL_37;
  }

  if (!+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v90, @"FOUND_SAME"))
  {
    if (+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v90, @"REVOKED"))
    {
      __int128 v38 = @"set-job catalog lookup found that auto-asset of atomic-instance being downloaded was revoked [server-side]";
      uint64_t v39 = 6202LL;
      goto LABEL_36;
    }

    if ((+[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v90, @"CANCELED") & 1) != 0
      || +[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v90,  @"CANCELED(RELEASED_GRANT)"))
    {
      v40 = @"set-job was canceled";
      uint64_t v41 = 6115LL;
    }

    else
    {
      if (!+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v90,  @"SUCCESS(NOT_AVAILABLE)")) {
        goto LABEL_29;
      }
      v40 = @"set-job was successful but downloaded atomic-instance is not accessible";
      uint64_t v41 = 6101LL;
    }

    id v15 = (id)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v41,  @"finishedSetJobFinalizeStatus",  0LL,  v40));
    goto LABEL_18;
  }

  if (!-[MADAutoAssetJob becameLatestToVend](self, "becameLatestToVend"))
  {
    if (-[MADAutoAssetJob tryPersonalizeFailed](self, "tryPersonalizeFailed")) {
      uint64_t v39 = 6535LL;
    }
    else {
      uint64_t v39 = 6205LL;
    }
    __int128 v38 = @"set-job catalog lookup found same atomic-instance [server-side] that has already been downloaded as latest for auto-asset-set";
    goto LABEL_36;
  }

- (void)replyToClientForJobParam:(id)a3 withResponseError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 extendedStateQueue]);
  dispatch_assert_queue_V2(v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 clientRequest]);
  if (v10)
  {
    if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
    {
      unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue([v6 clientRequest]);
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob clientDomainName](self, "clientDomainName"));
      char v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetIdentifier](self, "autoAssetSetIdentifier"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetUUID](self, "autoAssetUUID"));
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob setJobInformation](self, "setJobInformation"));
      id v16 = [v15 copy];
      +[MADAutoAssetControlManager autoSetJobIssueReply:forDomainName:forAssetSetIdentifier:withAutoAssetUUID:fromAutoAssetJob:withSetJobInformation:withResponseError:]( &OBJC_CLASS___MADAutoAssetControlManager,  "autoSetJobIssueReply:forDomainName:forAssetSetIdentifier:withAutoAssetUUID:fromAutoAssetJob:withSetJobInformatio n:withResponseError:",  v11,  v12,  v13,  v14,  self,  v16,  v7);
    }

    else
    {
      id v23 = v7;
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentJobInformation:](self, "currentJobInformation:", &v23));
      id v18 = v23;

      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v6 clientRequest]);
      int v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob mostSpecificSelectorToReport](self, "mostSpecificSelectorToReport"));
      unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetUUID](self, "autoAssetUUID"));
      unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
      +[MADAutoAssetControlManager autoAssetJobIssueReply:forAutoAssetSelector:withAutoAssetUUID:fromAutoAssetJob:withOriginalSelector:withJobInformation:withResponseError:]( &OBJC_CLASS___MADAutoAssetControlManager,  "autoAssetJobIssueReply:forAutoAssetSelector:withAutoAssetUUID:fromAutoAssetJob:withOriginalSelector:withJobInfor mation:withResponseError:",  v19,  v20,  v21,  self,  v22,  v17,  v18);

      id v7 = v18;
    }

    [v6 setClientRequest:0];
  }
}

- (void)_rememberIfSchedulerInvolved:(id)a3
{
  id v24 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 extendedStateQueue]);
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v24 clientRequestMessage]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 messageName]);

  if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v7,  @"MA-AUTO:INTEREST_IN_CONTENT") & 1) != 0 || (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v7,  @"MA-AUTO:CHECK_FOR_NEWER") & 1) != 0 || (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v7,  @"MA-AUTO:LOCK_CONTENT") & 1) != 0 || (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v7,  @"MA-AUTO-SET:NEED_FOR_ATOMIC") & 1) != 0 || (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v7,  @"MA-AUTO-SET:CHECK_ATOMIC") & 1) != 0 || +[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v7,  @"MA-AUTO-SET:LOCK_ATOMIC"))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v24 clientRequestMessage]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 message]);

    id v10 = [v9 safeObjectForKey:@"instance" ofClass:objc_opt_class(MAAutoAssetInfoInstance)];
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    BOOL v12 = v11;
    if (v11)
    {
      uint64_t v13 = objc_claimAutoreleasedReturnValue([v11 clientAssetSelector]);
      if (!v13)
      {
LABEL_18:

        goto LABEL_19;
      }

      id v14 = (id)v13;
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 clientAssetSelector]);
      uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 assetType]);
      if (v16)
      {
        uint64_t v17 = (void *)v16;
        id v18 = (void *)objc_claimAutoreleasedReturnValue([v12 clientAssetSelector]);
        uint64_t v19 = objc_claimAutoreleasedReturnValue([v18 assetSpecifier]);
        if (v19)
        {
          int v20 = (void *)v19;
          id v23 = self;
          unsigned __int8 v21 = (void *)objc_claimAutoreleasedReturnValue([v12 clientAssetSelector]);
          unsigned __int8 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 assetVersion]);

          if (!v22) {
            -[MADAutoAssetJob setSchedulerInvolved:](v23, "setSchedulerInvolved:", 1LL);
          }
          goto LABEL_18;
        }
      }
    }

    else
    {
      id v14 = +[MASAutoAssetSetInfoInstance newShimmedFromFrameworkMessage:forKey:]( &OBJC_CLASS___MASAutoAssetSetInfoInstance,  "newShimmedFromFrameworkMessage:forKey:",  v9,  @"setInstance");
      if (v14)
      {
        -[MADAutoAssetJob setSchedulerInvolved:](self, "setSchedulerInvolved:", 1LL);
        -[MADAutoAssetJob setSetCheckAwaitingDownload:](self, "setSetCheckAwaitingDownload:", 1LL);
      }
    }

    goto LABEL_18;
  }

- (void)_setPolicyFromClientRequest:(id)a3
{
  id v17 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 extendedStateQueue]);
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue([v17 clientRequestMessage]);
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 messageName]);

  if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v7,  @"MA-AUTO:INTEREST_IN_CONTENT") & 1) != 0 || (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v7,  @"MA-AUTO:CHECK_FOR_NEWER") & 1) != 0 || +[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v7,  @"MA-AUTO:LOCK_CONTENT"))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v17 clientRequestMessage]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 message]);

    id v10 = [v9 safeObjectForKey:@"desire" ofClass:objc_opt_class(MAAutoAssetInfoDesire)];
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    BOOL v12 = v11;
    if (v11)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 clientAssetPolicy]);
      if (v13)
      {
        id v14 = objc_alloc_init(&OBJC_CLASS___MAAutoAssetPolicy);
        -[MADAutoAssetJob setAggregatedClientAssetPolicy:](self, "setAggregatedClientAssetPolicy:", v14);

        if ([v13 userInitiated])
        {
          -[MADAutoAssetJob setDownloadingUserInitiated:](self, "setDownloadingUserInitiated:", 1LL);
          id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientAssetPolicy](self, "aggregatedClientAssetPolicy"));
          [v15 setUserInitiated:1];

          uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
          [v16 setDownloadUserInitiated:1];
        }
      }
    }
  }
}

- (void)addToActiveJobTasks:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  if (!v4)
  {
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 diag]);
    id v15 = objc_alloc(&OBJC_CLASS___NSString);
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob _updateLatestSummary](self, "_updateLatestSummary"));
    id v17 = -[NSString initWithFormat:]( v15,  "initWithFormat:",  @"{addToActiveJobTasks} nil jobParam provided by caller | %@",  v16);
    [v14 trackAnomaly:@"AUTO-JOB" forReason:v17 withResult:6102 withError:0];

    goto LABEL_73;
  }

  if ([v4 paramType] != (char *)&dword_0 + 1)
  {
    if ([v4 paramType] == (char *)&dword_4 + 1)
    {
      -[MADAutoAssetJob setSchedulerTriggerReceived:](self, "setSchedulerTriggerReceived:", 1LL);
      id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob jobCreationTriggeringLayer](self, "jobCreationTriggeringLayer"));

      if (!v18) {
        -[MADAutoAssetJob setJobCreationTriggeringLayer:](self, "setJobCreationTriggeringLayer:", @"Scheduler");
      }
    }

    else
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
      int v20 = (void *)objc_claimAutoreleasedReturnValue([v19 diag]);
      unsigned __int8 v21 = objc_alloc(&OBJC_CLASS___NSString);
      id v22 = [v4 paramType];
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v4 summary]);
      id v24 = -[NSString initWithFormat:]( v21,  "initWithFormat:",  @"job-task of unknown job type:%ld|jobParam:%@",  v22,  v23);
      [v20 trackAnomaly:@"AUTO-JOB" forReason:v24 withResult:6106 withError:0];
    }

    goto LABEL_70;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 clientRequest]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 clientRequestMessage]);
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 message]);

  id v10 = [v9 safeObjectForKey:@"desire" ofClass:objc_opt_class(MAAutoAssetInfoDesire)];
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if (v11) {
    id v12 = 0LL;
  }
  else {
    id v12 = +[MASAutoAssetSetInfoDesire newShimmedFromFrameworkMessage:forKey:]( &OBJC_CLASS___MASAutoAssetSetInfoDesire,  "newShimmedFromFrameworkMessage:forKey:",  v9,  @"setDesire");
  }
  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob firstClientName](self, "firstClientName"));

  if (!v25)
  {
    if (v11)
    {
      id v26 = [v9 safeObjectForKey:@"instance" ofClass:objc_opt_class(MAAutoAssetInfoInstance)];
      uint64_t v27 = objc_claimAutoreleasedReturnValue(v26);
      unint64_t v28 = 0LL;
    }

    else
    {
      if (v12) {
        unint64_t v28 = +[MASAutoAssetSetInfoInstance newShimmedFromFrameworkMessage:forKey:]( &OBJC_CLASS___MASAutoAssetSetInfoInstance,  "newShimmedFromFrameworkMessage:forKey:",  v9,  @"setInstance");
      }
      else {
        unint64_t v28 = 0LL;
      }
      uint64_t v27 = 0LL;
    }

    if (!(v27 | v28))
    {
      id v29 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
      id v88 = v9;
      v89 = v11;
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 diag]);
      id v31 = v12;
      id v32 = objc_alloc(&OBJC_CLASS___NSString);
      uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue([v4 summary]);
      uint64_t v34 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob _updateLatestSummary](self, "_updateLatestSummary"));
      id v35 = -[NSString initWithFormat:]( v32,  "initWithFormat:",  @"{addToActiveJobTasks} CLIENT_REQUEST jobTask with no [set-]instance| jobParam:%@ | %@",  v33,  v34);
      [v30 trackAnomaly:@"AUTO-JOB" forReason:v35 withResult:6102 withError:0];

      id v12 = v31;
      id v9 = v88;
      unsigned int v11 = v89;
LABEL_27:

      goto LABEL_28;
    }

    if (v27)
    {
      double v36 = (void *)objc_claimAutoreleasedReturnValue([(id)v27 autoAssetClientName]);

      double v37 = (void *)v27;
      if (v36)
      {
        uint64_t v38 = objc_claimAutoreleasedReturnValue([(id)v27 autoAssetClientName]);
LABEL_26:
        id v29 = (void *)v38;
        -[MADAutoAssetJob setFirstClientName:](self, "setFirstClientName:", v38);
        goto LABEL_27;
      }
    }

    else
    {
      uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue([(id)v28 autoAssetSetClientName]);

      double v37 = (void *)v28;
      if (v39)
      {
        uint64_t v38 = objc_claimAutoreleasedReturnValue([(id)v28 autoAssetSetClientName]);
        goto LABEL_26;
      }
    }

    uint64_t v38 = objc_claimAutoreleasedReturnValue([v37 clientProcessName]);
    goto LABEL_26;
  }

- (void)setCurrentJobTask:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  if ([v4 paramType] == (char *)&dword_0 + 1)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 clientRequest]);
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 clientRequestMessage]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 message]);

    id v10 = [v9 safeObjectForKey:@"instance" ofClass:objc_opt_class(MAAutoAssetInfoInstance)];
    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[MADAutoAssetJob setActiveInstance:](self, "setActiveInstance:", v11);

    id v12 = [v9 safeObjectForKey:@"desire" ofClass:objc_opt_class(MAAutoAssetInfoDesire)];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[MADAutoAssetJob setActiveDesire:](self, "setActiveDesire:", v13);

    id v14 = [v9 safeObjectForKey:@"found" ofClass:objc_opt_class(MAAutoAssetInfoFound)];
    id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    -[MADAutoAssetJob setActiveFound:](self, "setActiveFound:", v15);

    id v16 = [v9 safeObjectForKey:@"end" ofClass:objc_opt_class(MAAutoAssetInfoEnd)];
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    -[MADAutoAssetJob setActiveEnd:](self, "setActiveEnd:", v17);

    id v18 = [v9 safeObjectForKey:@"listen" ofClass:objc_opt_class(MAAutoAssetInfoListen)];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    -[MADAutoAssetJob setActiveListen:](self, "setActiveListen:", v19);

    int v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
    unsigned __int8 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 oslog]);

    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 summary]);
      *(_DWORD *)int buf = 138543618;
      uint64_t v33 = v22;
      __int16 v34 = 2114;
      id v35 = v23;
      _os_log_impl( &dword_0,  v21,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {setCurrentJobTask} CLIENT_REQUEST | job:%{public}@}",  buf,  0x16u);
    }

    goto LABEL_7;
  }

  if ([v4 paramType] != (char *)&dword_4 + 1)
  {
    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue([v26 diag]);
    unint64_t v28 = objc_alloc(&OBJC_CLASS___NSString);
    id v29 = [v4 paramType];
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v4 summary]);
    id v31 = -[NSString initWithFormat:]( v28,  "initWithFormat:",  @"job-task of unknown job type:%ld|jobParam:%@",  v29,  v30);
    [v27 trackAnomaly:@"AUTO-JOB" forReason:v31 withResult:6106 withError:0];

    goto LABEL_10;
  }

  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue([v24 oslog]);

  if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_DEFAULT))
  {
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
    unsigned __int8 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v4 summary]);
    *(_DWORD *)int buf = 138543618;
    uint64_t v33 = v25;
    __int16 v34 = 2114;
    id v35 = v21;
    _os_log_impl( &dword_0,  (os_log_t)v9,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {setCurrentJobTask} SCHEDULER_TRIGGERED | job:%{public}@}",  buf,  0x16u);

LABEL_7:
  }

LABEL_10:
}

- (id)getCurrentJobTask
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 extendedStateQueue]);
  dispatch_assert_queue_V2(v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob activeJobTasks](self, "activeJobTasks"));
  id v6 = [v5 count];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob activeJobTasks](self, "activeJobTasks"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:0]);
  }

  else
  {
    id v8 = 0LL;
  }

  return v8;
}

- (id)removeCurrentJobTask
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 extendedStateQueue]);
  dispatch_assert_queue_V2(v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob activeJobTasks](self, "activeJobTasks"));
  id v6 = [v5 count];

  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob activeJobTasks](self, "activeJobTasks"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 objectAtIndex:0]);

    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob activeJobTasks](self, "activeJobTasks"));
    [v9 removeObjectAtIndex:0];
  }

  else
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 diag]);
    unsigned int v11 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"{removeCurrentJobTask} no active job-tasks");
    [v10 trackAnomaly:@"AUTO-JOB" forReason:v11 withResult:6108 withError:0];

    id v8 = 0LL;
  }

  return v8;
}

- (void)desireChangedToUserInitiated
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 extendedStateQueue]);
  dispatch_assert_queue_V2(v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientAssetPolicy](self, "aggregatedClientAssetPolicy"));
  if (!v5)
  {
    id v6 = objc_alloc_init(&OBJC_CLASS___MAAutoAssetPolicy);
    -[MADAutoAssetJob setAggregatedClientAssetPolicy:](self, "setAggregatedClientAssetPolicy:", v6);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientAssetPolicy](self, "aggregatedClientAssetPolicy"));
  [v7 setUserInitiated:1];

  if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientSetPolicy](self, "aggregatedClientSetPolicy"));
    [v8 setUserInitiated:1];
  }

  -[MADAutoAssetJob setBoostedToUserInitiated:](self, "setBoostedToUserInitiated:", 1LL);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assetDownloadOptions](self, "assetDownloadOptions"));

  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientAssetPolicy](self, "aggregatedClientAssetPolicy"));
    uint64_t v11 = [v10 userInitiated] ^ 1;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assetDownloadOptions](self, "assetDownloadOptions"));
    [v12 setDiscretionary:v11];

    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 oslog]);

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assetDownloadOptions](self, "assetDownloadOptions"));
      int v17 = 138543618;
      id v18 = v15;
      __int16 v19 = 2114;
      int v20 = v16;
      _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {desireChangedToUserInitiated} active asset download options altered | assetDownloadOptions:%{public}@}",  (uint8_t *)&v17,  0x16u);
    }
  }

- (id)mostSpecificSelectorToReport
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
  if (!v3)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetInstance](self, "autoAssetInstance"));
    v3 = (void *)objc_claimAutoreleasedReturnValue([v4 clientAssetSelector]);
  }

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob resultSelector](self, "resultSelector"));

  if (v5)
  {
    uint64_t v6 = objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob resultSelector](self, "resultSelector"));

    v3 = (void *)v6;
  }

  if (!v3)
  {
    id v9 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 diag]);
    uint64_t v11 = objc_alloc(&OBJC_CLASS___NSString);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob _longSummary](self, "_longSummary"));
    uint64_t v13 = -[NSString initWithFormat:]( v11,  "initWithFormat:",  @"{mostSpecificSelectorToReport} no selector reported | jobSummary:%@",  v12);
    [v10 trackAnomaly:@"AUTO-JOB" forReason:v13 withResult:6108 withError:0];

    v3 = 0LL;
LABEL_11:

    return v3;
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 downloadDecryptionKey]);

  if (v7)
  {
    id v8 = [v3 copyClearingWriteOnlyFields];
    id v9 = v8;
    if (v8)
    {
      id v9 = v8;
      id v10 = v3;
      v3 = v9;
    }

    else
    {
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v10 diag]);
      id v15 = objc_alloc(&OBJC_CLASS___NSString);
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob _longSummary](self, "_longSummary"));
      int v17 = -[NSString initWithFormat:]( v15,  "initWithFormat:",  @"{mostSpecificSelectorToReport} unable to create copy-of-selector (returning un-clean selector) | jobSummary:%@",  v16);
      [v14 trackAnomaly:@"AUTO-JOB" forReason:v17 withResult:6101 withError:0];
    }

    goto LABEL_11;
  }

  return v3;
}

- (void)addClientRequestAndMergeNeeds:(id)a3 forJobEvent:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v7 extendedStateQueue]);
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 clientRequest]);
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 clientRequestMessage]);

  if (v10)
  {
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 clientRequest]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 clientRequestMessage]);
    uint64_t v13 = (NSString *)objc_claimAutoreleasedReturnValue([v12 messageName]);

    -[MADAutoAssetJob addToActiveJobTasks:](self, "addToActiveJobTasks:", v6);
    if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v13,  @"MA-AUTO:INTEREST_IN_CONTENT") & 1) != 0 || +[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v13,  @"MA-AUTO-SET:NEED_FOR_ATOMIC"))
    {
      -[MADAutoAssetJob replyToClientForJobParam:withResponseError:]( self,  "replyToClientForJobParam:withResponseError:",  v6,  0LL);
    }
  }

  else
  {
    uint64_t v13 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"{A:%@} no client request message provided",  v14);
    -[MADAutoAssetJob trackAnomaly:forReason:](self, "trackAnomaly:forReason:", 6108LL, v13);
  }
}

- (BOOL)anyJobInterestedInContent
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 extendedStateQueue]);
  dispatch_assert_queue_V2(v4);

  if (-[MADAutoAssetJob stagerJob](self, "stagerJob")) {
    return -[MADAutoAssetJob stagerJobDownloadContent](self, "stagerJobDownloadContent");
  }
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob activeJobTasks](self, "activeJobTasks", 0LL));
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      for (i = 0LL; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8LL * (void)i);
        id v12 = objc_autoreleasePoolPush();
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v11 clientRequest]);
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 clientRequestMessage]);

        if (!v14) {
          goto LABEL_19;
        }
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v11 clientRequest]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 clientRequestMessage]);
        int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 messageName]);

        if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v17,  @"MA-AUTO:INTEREST_IN_CONTENT") & 1) != 0 || (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v17,  @"MA-AUTO:CHECK_FOR_NEWER") & 1) != 0 || (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v17,  @"MA-AUTO:LOCK_CONTENT") & 1) != 0 || (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v17,  @"MA-AUTO-SET:NEED_FOR_ATOMIC") & 1) != 0 || (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v17,  @"MA-AUTO-SET:CHECK_ATOMIC") & 1) != 0 || +[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v17,  @"MA-AUTO-SET:LOCK_ATOMIC"))
        {

LABEL_19:
          objc_autoreleasePoolPop(v12);
          BOOL v18 = 1;
          goto LABEL_21;
        }

        objc_autoreleasePoolPop(v12);
      }

      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      BOOL v18 = 0;
      if (v8) {
        continue;
      }
      break;
    }
  }

  else
  {
    BOOL v18 = 0;
  }

- (void)foundAndDownloaded:(id)a3 forJobParam:(id)a4 wasPatched:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 extendedStateQueue]);
  dispatch_assert_queue_V2(v9);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v10 assetType]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 assetId]);
  id AutoLocalUrlFromTypeAndIdWithPurpose = getAutoLocalUrlFromTypeAndIdWithPurpose(v11, v13, 2LL, @"auto");
  id v15 = (void *)objc_claimAutoreleasedReturnValue(AutoLocalUrlFromTypeAndIdWithPurpose);

  id v16 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoFound);
  int v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob resultSelector](self, "resultSelector"));
  BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
  __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 metadata]);
  __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
  id v21 = -[MAAutoAssetInfoFound initForSelector:withLocalContentURL:withAssetAttributes:reportingStatus:]( v16,  "initForSelector:withLocalContentURL:withAssetAttributes:reportingStatus:",  v17,  v15,  v19,  v20);
  -[MADAutoAssetJob setResultFound:](self, "setResultFound:", v21);

  -[MADAutoAssetJob setWasPatched:](self, "setWasPatched:", v5);
  -[MADAutoAssetJob refreshDownloadedToManager](self, "refreshDownloadedToManager");
  if (!-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    id v22 =  -[MADAutoAssetJob refreshOnFilesystemFromManagerPromotingIfStaged:]( self,  "refreshOnFilesystemFromManagerPromotingIfStaged:",  0LL);
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob latestInstalledOnFilesystem](self, "latestInstalledOnFilesystem"));
    id v24 = v23;
    if (v23)
    {
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v23 assetVersion]);
      -[MADAutoAssetJob setLatestInstalledAssetVersion:](self, "setLatestInstalledAssetVersion:", v25);

      id v26 = (void *)objc_claimAutoreleasedReturnValue([v24 build]);
      -[MADAutoAssetJob setLatestInstalledAssetBuild:](self, "setLatestInstalledAssetBuild:", v26);
    }
  }

  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
  unint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 oslog]);

  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    id v29 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
    id v30 = (void *)objc_claimAutoreleasedReturnValue([v15 path]);
    int v31 = 138543874;
    id v32 = v29;
    __int16 v33 = 2114;
    id v34 = v7;
    __int16 v35 = 2114;
    double v36 = v30;
    _os_log_impl( &dword_0,  v28,  OS_LOG_TYPE_DEFAULT,  "[%{public}@] {%{public}@} download | SUCCESS | localContentURL:%{public}@",  (uint8_t *)&v31,  0x20u);
  }
}

- (void)foundAndDownloadedSet:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
  [v7 setIsDiscoveredFullyDownloaded:1];

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
  [v8 setIsOnFilesystem:1];

  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 discoveredAtomicInstance]);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
  [v11 setLatestDownloadedAtomicInstance:v10];

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 latestDowloadedAtomicInstanceEntries]);

  if (!v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 discoveredAtomicEntries]);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
    [v16 setLatestDowloadedAtomicInstanceEntries:v15];

    int v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
    BOOL v18 = (os_log_s *)objc_claimAutoreleasedReturnValue([v17 oslog]);

    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
      __int128 v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 latestDowloadedAtomicInstanceEntries]);
      int v39 = 138543874;
      v40 = v19;
      __int16 v41 = 2114;
      id v42 = v4;
      __int16 v43 = 2114;
      uint64_t v44 = v21;
      _os_log_impl( &dword_0,  v18,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {%{public}@} no latest-downloaded-atomic-entries so reporting discovered:\n%{public}@",  (uint8_t *)&v39,  0x20u);
    }
  }

  id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
  id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 catalogCachedAssetSetID]);
  id v24 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
  [v24 setDownloadedCatalogCachedAssetSetID:v23];

  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 catalogDownloadedFromLive]);
  uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
  [v27 setDownloadedCatalogDownloadedFromLive:v26];

  unint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
  id v29 = (void *)objc_claimAutoreleasedReturnValue([v28 catalogLastTimeChecked]);
  id v30 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
  [v30 setDownloadedCatalogLastTimeChecked:v29];

  int v31 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
  id v32 = (void *)objc_claimAutoreleasedReturnValue([v31 catalogPostedDate]);
  __int16 v33 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
  [v33 setDownloadedCatalogPostedDate:v32];

  -[MADAutoAssetJob updateSetResults:atomicInstanceDiscovered:availableForUse:downloading:buildingResultSetFound:]( self,  "updateSetResults:atomicInstanceDiscovered:availableForUse:downloading:buildingResultSetFound:",  v4,  1LL,  1LL,  0LL,  1LL);
  -[MADAutoAssetJob refreshSetFoundToManager:](self, "refreshSetFoundToManager:", 1LL);
  id v34 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
  __int16 v35 = (os_log_s *)objc_claimAutoreleasedReturnValue([v34 oslog]);

  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    double v36 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
    double v37 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
    uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue([v37 summary]);
    int v39 = 138543874;
    v40 = v36;
    __int16 v41 = 2114;
    id v42 = v4;
    __int16 v43 = 2114;
    uint64_t v44 = v38;
    _os_log_impl( &dword_0,  v35,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {%{public}@} set-download | SUCCESS | autoAssetSetDescriptor:%{public}@",  (uint8_t *)&v39,  0x20u);
  }
}

- (void)replyToJobsWhenCatalogDownloaded:(id)a3 discoveredNewer:(BOOL)a4
{
  BOOL v26 = a4;
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  if (!-[MADAutoAssetJob stagerJob](self, "stagerJob"))
  {
    id v25 = v5;
    uint64_t v27 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob activeJobTasks](self, "activeJobTasks"));
    id v10 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (!v10) {
      goto LABEL_28;
    }
    id v11 = v10;
    uint64_t v12 = *(void *)v30;
    while (1)
    {
      for (i = 0LL; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)i);
        id v15 = objc_autoreleasePoolPush();
        if (!v14)
        {
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v19 diag]);
          id v22 = objc_alloc(&OBJC_CLASS___NSString);
          id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob _updateLatestSummary](self, "_updateLatestSummary"));
          id v24 = -[NSString initWithFormat:]( v22,  "initWithFormat:",  @"{replyToJobsWhenCatalogDownloaded} nil jobParam found on activeJobTasks | %@",  v23);
          [v21 trackAnomaly:@"AUTO-JOB" forReason:v24 withResult:6103 withError:0];

LABEL_24:
          goto LABEL_26;
        }

        id v16 = (void *)objc_claimAutoreleasedReturnValue([v14 clientRequest]);

        if (v16)
        {
          int v17 = (void *)objc_claimAutoreleasedReturnValue([v14 clientRequest]);
          BOOL v18 = (void *)objc_claimAutoreleasedReturnValue([v17 clientRequestMessage]);
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 messageName]);

          if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v19,  @"MA-AUTO:INTEREST_IN_CONTENT") & 1) == 0 && (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v19,  @"MA-AUTO:CHECK_FOR_NEWER") & 1) == 0 && (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v19,  @"MA-AUTO:DETERMINE_IF_AVAILABLE") & 1) == 0 && (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v19,  @"MA-AUTO-SET:NEED_FOR_ATOMIC") & 1) == 0 && !+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v19,  @"MA-AUTO-SET:CHECK_ATOMIC")
            || (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v19,  @"MA-AUTO-SET:CHECK_ATOMIC")
              ? (BOOL v20 = !v26)
              : (BOOL v20 = 1),
                !v20 && -[MADAutoAssetJob setCheckAwaitingDownload](self, "setCheckAwaitingDownload")
             || (-[MADAutoAssetJob replyToClientForJobParam:withResponseError:]( self,  "replyToClientForJobParam:withResponseError:",  v14,  0LL),  (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v19,  @"MA-AUTO:DETERMINE_IF_AVAILABLE") & 1) == 0)))
          {
            -[NSMutableArray addObject:](v27, "addObject:", v14);
          }

          goto LABEL_24;
        }

        -[NSMutableArray addObject:](v27, "addObject:", v14);
LABEL_26:
        objc_autoreleasePoolPop(v15);
      }

      id v11 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (!v11)
      {
LABEL_28:

        uint64_t v9 = (os_log_s *)v27;
        -[MADAutoAssetJob setActiveJobTasks:](self, "setActiveJobTasks:", v27);
        id v5 = v25;
        goto LABEL_29;
      }
    }
  }

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 oslog]);

  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    -[MADAutoAssetJob replyToJobsWhenCatalogDownloaded:discoveredNewer:].cold.1();
  }
LABEL_29:
}

- (void)replyToJobsWhenLookupFailed:(id)a3 withLookupError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 extendedStateQueue]);
  dispatch_assert_queue_V2(v9);

  if (!-[MADAutoAssetJob stagerJob](self, "stagerJob"))
  {
    id v28 = v7;
    id v26 = v6;
    uint64_t v27 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    __int128 v32 = 0u;
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob activeJobTasks](self, "activeJobTasks"));
    id v11 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (!v11) {
      goto LABEL_23;
    }
    id v12 = v11;
    uint64_t v13 = *(void *)v30;
    while (1)
    {
      id v14 = 0LL;
      do
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v29 + 1) + 8LL * (void)v14);
        id v16 = objc_autoreleasePoolPush();
        if (!v15)
        {
          BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
          id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 diag]);
          id v22 = objc_alloc(&OBJC_CLASS___NSString);
          id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob _updateLatestSummary](self, "_updateLatestSummary"));
          id v24 = -[NSString initWithFormat:]( v22,  "initWithFormat:",  @"{replyToJobsWhenLookupFailed} nil jobParam found on activeJobTasks | %@",  v23);
          [v21 trackAnomaly:@"AUTO-JOB" forReason:v24 withResult:6103 withError:0];

LABEL_17:
          goto LABEL_19;
        }

        int v17 = (void *)objc_claimAutoreleasedReturnValue([v15 clientRequest]);

        if (v17)
        {
          BOOL v18 = (void *)objc_claimAutoreleasedReturnValue([v15 clientRequest]);
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 clientRequestMessage]);
          BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([v19 messageName]);

          if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v20,  @"MA-AUTO:INTEREST_IN_CONTENT") & 1) != 0 || (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v20,  @"MA-AUTO:CHECK_FOR_NEWER") & 1) != 0 || (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v20,  @"MA-AUTO:DETERMINE_IF_AVAILABLE") & 1) != 0 || (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v20,  @"MA-AUTO-SET:NEED_FOR_ATOMIC") & 1) != 0 || +[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v20,  @"MA-AUTO-SET:CHECK_ATOMIC"))
          {
            -[MADAutoAssetJob replyToClientForJobParam:withResponseError:]( self,  "replyToClientForJobParam:withResponseError:",  v15,  v28);
          }

          else
          {
            -[NSMutableArray addObject:](v27, "addObject:", v15);
          }

          goto LABEL_17;
        }

        -[NSMutableArray addObject:](v27, "addObject:", v15);
LABEL_19:
        objc_autoreleasePoolPop(v16);
        id v14 = (char *)v14 + 1;
      }

      while (v12 != v14);
      id v25 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
      id v12 = v25;
      if (!v25)
      {
LABEL_23:

        -[MADAutoAssetJob setActiveJobTasks:](self, "setActiveJobTasks:", v27);
        id v6 = v26;
        id v7 = v28;
        goto LABEL_24;
      }
    }
  }

  -[MADAutoAssetJob stagerJobDetermineDone:reportingError:](self, "stagerJobDetermineDone:reportingError:", v6, v7);
LABEL_24:
}

- (void)replyToJobsWhenContentDownloaded:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  if (-[MADAutoAssetJob stagerJob](self, "stagerJob"))
  {
    -[MADAutoAssetJob stagerJobDownloadDone:reportingError:](self, "stagerJobDownloadDone:reportingError:", v4, 0LL);
  }

  else if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue([v7 oslog]);

    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 summary]);
      *(_DWORD *)int buf = 138543874;
      __int16 v41 = v9;
      __int16 v42 = 2114;
      id v43 = v4;
      __int16 v44 = 2114;
      unint64_t v45 = v11;
      _os_log_impl( &dword_0,  v8,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {%{public}@:replyToJobsWhenContentDownloaded} set-download | SUCCESS | autoAssetSetDescriptor:%{public}@",  buf,  0x20u);
    }

    if (-[MADAutoAssetJob setCheckAwaitingDownload](self, "setCheckAwaitingDownload")) {
      -[MADAutoAssetJob replyToSetCheckAtomicDownloadSuccess](self, "replyToSetCheckAtomicDownloadSuccess");
    }
  }

  else
  {
    if (-[MADAutoAssetJob lockingAssetContent](self, "lockingAssetContent"))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
      if (!v12) {
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob latestInstalledOnFilesystem](self, "latestInstalledOnFilesystem"));
      }
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 assetType]);
      id v15 = (void *)objc_claimAutoreleasedReturnValue([v12 assetId]);
      id AutoLocalUrlFromTypeAndIdWithPurpose = getAutoLocalUrlFromTypeAndIdWithPurpose(v14, v15, 2LL, @"auto");
      int v17 = (void *)objc_claimAutoreleasedReturnValue(AutoLocalUrlFromTypeAndIdWithPurpose);

      BOOL v18 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoFound);
      __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob resultSelector](self, "resultSelector"));
      BOOL v20 = (void *)objc_claimAutoreleasedReturnValue([v12 metadata]);
      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
      id v22 = -[MAAutoAssetInfoFound initForSelector:withLocalContentURL:withAssetAttributes:reportingStatus:]( v18,  "initForSelector:withLocalContentURL:withAssetAttributes:reportingStatus:",  v19,  v17,  v20,  v21);
      -[MADAutoAssetJob setResultFound:](self, "setResultFound:", v22);

      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
      id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 oslog]);

      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
        id v26 = (void *)objc_claimAutoreleasedReturnValue([v17 path]);
        *(_DWORD *)int buf = 138543874;
        __int16 v41 = v25;
        __int16 v42 = 2114;
        id v43 = v4;
        __int16 v44 = 2114;
        unint64_t v45 = v26;
        _os_log_impl( &dword_0,  v24,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {%{public}@:replyToJobsWhenContentDownloaded} [locking] | SUCCESS | localContentURL:%{public}@",  buf,  0x20u);
      }
    }

    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob activeJobTasks](self, "activeJobTasks", 0LL));
    id v28 = [v27 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v36;
      do
      {
        __int128 v31 = 0LL;
        do
        {
          if (*(void *)v36 != v30) {
            objc_enumerationMutation(v27);
          }
          __int128 v32 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)v31);
          __int16 v33 = objc_autoreleasePoolPush();
          id v34 = (void *)objc_claimAutoreleasedReturnValue([v32 clientRequest]);

          if (v34)
          {
            -[MADAutoAssetJob replyToClientForJobParam:withResponseError:]( self,  "replyToClientForJobParam:withResponseError:",  v32,  0LL);
            [v32 setClientRequest:0];
          }

          objc_autoreleasePoolPop(v33);
          __int128 v31 = (char *)v31 + 1;
        }

        while (v29 != v31);
        id v29 = [v27 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }

      while (v29);
    }
  }
}

- (void)replyToJobsWhenOperationFoundSame:(id)a3 forCheckAtomic:(BOOL)a4 withLookupError:(id)a5
{
  BOOL v43 = a4;
  id v7 = a3;
  id v8 = a5;
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v9 extendedStateQueue]);
  dispatch_assert_queue_V2(v10);

  id v11 = self;
  if (-[MADAutoAssetJob stagerJob](self, "stagerJob"))
  {
    -[MADAutoAssetJob trackAnomaly:forReason:]( self,  "trackAnomaly:forReason:",  6103LL,  @"{replyToJobsWhenOperationFoundSame} not valid for a stager-job");
    goto LABEL_32;
  }

  if (-[MADAutoAssetJob lockingAssetContent](self, "lockingAssetContent") || v43)
  {
    if (!-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 assetVersion]);
      if (v13)
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 assetVersion]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetJob installedOnFilesystemWithVersion:fromLocation:]( self,  "installedOnFilesystemWithVersion:fromLocation:",  v15,  v7));
      }

      else
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob latestInstalledOnFilesystem](self, "latestInstalledOnFilesystem"));
      }

      if (v16)
      {
        int v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
        BOOL v18 = (void *)objc_claimAutoreleasedReturnValue([v17 assetType]);
        __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v16 assetId]);
        id AutoLocalUrlFromTypeAndIdWithPurpose = getAutoLocalUrlFromTypeAndIdWithPurpose(v18, v19, 2LL, @"auto");
        id v21 = (void *)objc_claimAutoreleasedReturnValue(AutoLocalUrlFromTypeAndIdWithPurpose);

        id v22 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoFound);
        id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob resultSelector](self, "resultSelector"));
        id v24 = (void *)objc_claimAutoreleasedReturnValue([v16 metadata]);
        id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
        id v26 = -[MAAutoAssetInfoFound initForSelector:withLocalContentURL:withAssetAttributes:reportingStatus:]( v22,  "initForSelector:withLocalContentURL:withAssetAttributes:reportingStatus:",  v23,  v21,  v24,  v25);
        -[MADAutoAssetJob setResultFound:](self, "setResultFound:", v26);
      }

      else
      {
        -[MADAutoAssetJob trackAnomaly:forReason:]( self,  "trackAnomaly:forReason:",  6103LL,  @"{replyToJobsWhenOperationFoundSame} no associated descriptor on filesystem (should always be there at this point)");
      }

      id v11 = self;
    }

    __int16 v41 = v8;
    id v40 = v7;
    __int128 v46 = 0u;
    __int128 v47 = 0u;
    __int128 v44 = 0u;
    __int128 v45 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob activeJobTasks](v11, "activeJobTasks"));
    id v27 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (!v27)
    {
LABEL_31:

      id v7 = v40;
      id v8 = v41;
      goto LABEL_32;
    }

    id v28 = v27;
    uint64_t v29 = *(void *)v45;
LABEL_15:
    uint64_t v30 = 0LL;
    while (1)
    {
      if (*(void *)v45 != v29) {
        objc_enumerationMutation(obj);
      }
      __int128 v31 = *(void **)(*((void *)&v44 + 1) + 8 * v30);
      __int128 v32 = objc_autoreleasePoolPush();
      __int16 v33 = (void *)objc_claimAutoreleasedReturnValue([v31 clientRequest]);

      if (!v33) {
        goto LABEL_29;
      }
      id v34 = (void *)objc_claimAutoreleasedReturnValue([v31 clientRequest]);
      __int128 v35 = (void *)objc_claimAutoreleasedReturnValue([v34 clientRequestMessage]);
      __int128 v36 = (void *)objc_claimAutoreleasedReturnValue([v35 messageName]);

      if (v43)
      {
        __int128 v37 = (void *)objc_claimAutoreleasedReturnValue([v41 domain]);
        if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v37,  @"com.apple.MobileAssetError.AutoAsset") & 1) != 0)
        {
          __int128 v38 = (char *)[v41 code];

          int v39 = v41;
          id v11 = self;
          if (v38 == (_BYTE *)&stru_1830.dylib.timestamp + 1) {
            goto LABEL_27;
          }
        }

        else
        {

          id v11 = self;
        }
      }

      if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v36,  @"MA-AUTO:LOCK_CONTENT") & 1) == 0 && !+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v36,  @"MA-AUTO-SET:LOCK_ATOMIC"))
      {
        goto LABEL_28;
      }

      int v39 = 0LL;
LABEL_27:
      -[MADAutoAssetJob replyToClientForJobParam:withResponseError:]( v11,  "replyToClientForJobParam:withResponseError:",  v31,  v39);
      [v31 setClientRequest:0];
LABEL_28:

LABEL_29:
      objc_autoreleasePoolPop(v32);
      if (v28 == (id)++v30)
      {
        id v28 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
        if (!v28) {
          goto LABEL_31;
        }
        goto LABEL_15;
      }
    }
  }

- (void)replyToSetCheckAtomicDownloadSuccess
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 extendedStateQueue]);
  dispatch_assert_queue_V2(v4);

  if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    id v22 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob activeJobTasks](self, "activeJobTasks"));
    id v6 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v25;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v25 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v24 + 1) + 8LL * (void)v9);
          id v11 = objc_autoreleasePoolPush();
          if (v10)
          {
            id v12 = (void *)objc_claimAutoreleasedReturnValue([v10 clientRequest]);

            if (v12)
            {
              uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v10 clientRequest]);
              id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 clientRequestMessage]);
              id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 messageName]);

              if (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v15,  @"MA-AUTO-SET:CHECK_ATOMIC")) {
                -[MADAutoAssetJob replyToClientForJobParam:withResponseError:]( self,  "replyToClientForJobParam:withResponseError:",  v10,  0LL);
              }
              else {
                -[NSMutableArray addObject:](v22, "addObject:", v10);
              }
            }

            else
            {
              -[NSMutableArray addObject:](v22, "addObject:", v10);
            }
          }

          else
          {
            id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
            int v17 = (void *)objc_claimAutoreleasedReturnValue([v16 diag]);
            BOOL v18 = objc_alloc(&OBJC_CLASS___NSString);
            __int128 v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob _updateLatestSummary](self, "_updateLatestSummary"));
            BOOL v20 = -[NSString initWithFormat:]( v18,  "initWithFormat:",  @"{replyToSetCheckAtomicDownloadSuccess} nil jobParam found on activeJobTasks | %@",  v19);
            [v17 trackAnomaly:@"AUTO-JOB" forReason:v20 withResult:6103 withError:0];
          }

          objc_autoreleasePoolPop(v11);
          uint64_t v9 = (char *)v9 + 1;
        }

        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }

      while (v7);
    }

    -[MADAutoAssetJob setActiveJobTasks:](self, "setActiveJobTasks:", v22);
  }

  else
  {
    id v23 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v23 diag]);
    [v21 trackAnomaly:@"AUTO-SET-JOB:REPLY" forReason:@"replyToSetCheckAtomicDownloadSuccess should only be called for set-job" withResult:6103 withError:0];
  }

- (void)finishedSetSameVersionFound:(id)a3
{
  id v4 = a3;
  id v5 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"%@:finishedSetSameVersionFound",  v4);

  if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    if (-[MADAutoAssetJob determiningAssetContent](self, "determiningAssetContent"))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 oslog]);

      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
        uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
        id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 summary]);
        *(_DWORD *)int buf = 138543874;
        id v15 = v8;
        __int16 v16 = 2114;
        int v17 = v5;
        __int16 v18 = 2114;
        __int128 v19 = v10;
        _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {%{public}@} same version found that has already been downloaded to the filesystem: %{public}@",  buf,  0x20u);
      }
    }

    else
    {
      if (-[MADAutoAssetJob tryPersonalizeSuccess](self, "tryPersonalizeSuccess")
        && !-[MADAutoAssetJob tryPersonalizeFailed](self, "tryPersonalizeFailed"))
      {
        -[MADAutoAssetJob _commitPrePersonalized:error:](self, "_commitPrePersonalized:error:", v5, 0LL);
      }

      else if (!-[MADAutoAssetJob becameLatestToVend](self, "becameLatestToVend"))
      {
        if (-[MADAutoAssetJob tryPersonalizeFailed](self, "tryPersonalizeFailed")) {
          uint64_t v12 = 6535LL;
        }
        else {
          uint64_t v12 = 6205LL;
        }
        uint64_t v13 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"AUTO-SET-JOB(%@)",  v5);
        id v11 = (NSString *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v12,  v13,  0LL,  @"same version found that has already been downloaded to the filesystem"));

        goto LABEL_17;
      }

      -[MADAutoAssetJob foundAndDownloadedSet:](self, "foundAndDownloadedSet:", v5);
    }

    id v11 = 0LL;
LABEL_17:
    -[MADAutoAssetJob doneWithAllJobs:withLookupError:](self, "doneWithAllJobs:withLookupError:", v5, v11);
    -[MADAutoAssetJob autoAssetJobFinished:forJobFinishedReason:failingWithError:]( self,  "autoAssetJobFinished:forJobFinishedReason:failingWithError:",  v5,  @"FOUND_SAME",  v11);
    goto LABEL_18;
  }

  id v11 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"{%@} should only execute for set-job",  v5);
  -[MADAutoAssetJob statusChange:catalogAnomaly:forReason:]( self,  "statusChange:catalogAnomaly:forReason:",  v5,  6103LL,  v11);
LABEL_18:
}

- (void)doneWithAllJobs:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  if (-[MADAutoAssetJob stagerJob](self, "stagerJob"))
  {
    -[MADAutoAssetJob stagerJobDone:reportingError:](self, "stagerJobDone:reportingError:", v4, 0LL);
  }

  else
  {
    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob activeJobTasks](self, "activeJobTasks", 0LL));
    id v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        id v11 = 0LL;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8LL * (void)v11);
          uint64_t v13 = objc_autoreleasePoolPush();
          -[MADAutoAssetJob replyToClientForJobParam:withResponseError:]( self,  "replyToClientForJobParam:withResponseError:",  v12,  0LL);
          objc_autoreleasePoolPop(v13);
          id v11 = (char *)v11 + 1;
        }

        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }

      while (v9);
    }

    id v14 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[MADAutoAssetJob setActiveJobTasks:](self, "setActiveJobTasks:", v14);
  }
}

- (void)doneWithAllJobs:(id)a3 withLookupError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 extendedStateQueue]);
  dispatch_assert_queue_V2(v9);

  if (-[MADAutoAssetJob stagerJob](self, "stagerJob"))
  {
    -[MADAutoAssetJob stagerJobDone:reportingError:](self, "stagerJobDone:reportingError:", v6, v7);
  }

  else
  {
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob activeJobTasks](self, "activeJobTasks"));
    id v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v11)
    {
      id v12 = v11;
      id obj = v10;
      char v24 = 0;
      char v22 = 0;
      id v25 = v6;
      uint64_t v26 = *(void *)v28;
      do
      {
        for (i = 0LL; i != v12; i = (char *)i + 1)
        {
          id v14 = self;
          if (*(void *)v28 != v26) {
            objc_enumerationMutation(obj);
          }
          __int128 v15 = *(void **)(*((void *)&v27 + 1) + 8LL * (void)i);
          __int128 v16 = objc_autoreleasePoolPush();
          __int128 v17 = (void *)objc_claimAutoreleasedReturnValue([v15 clientRequest]);
          __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 clientRequestMessage]);
          __int128 v19 = (void *)objc_claimAutoreleasedReturnValue([v18 messageName]);

          unsigned int v20 = +[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v19,  @"MA-AUTO-SET:CHECK_ATOMIC");
          if (((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v19,  @"MA-AUTO:LOCK_CONTENT") & 1) != 0 || (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v19,  @"MA-AUTO-SET:LOCK_ATOMIC") | v20) == 1)
            && [v7 code] == (char *)&stru_1830.dylib.timestamp + 1)
          {
            self = v14;
            if (-[MADAutoAssetJob autoAssetSetJob](v14, "autoAssetSetJob")) {
              -[MADAutoAssetJob foundAndDownloadedSet:](v14, "foundAndDownloadedSet:", v25);
            }
            v24 |= v20;
            char v22 = 1;
          }

          else
          {
            self = v14;
            -[MADAutoAssetJob finishJobTaskForJobParam:withUnderlyingError:fromAction:]( v14,  "finishJobTaskForJobParam:withUnderlyingError:fromAction:",  v15,  v7,  v25);
          }

          objc_autoreleasePoolPop(v16);
        }

        id v12 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }

      while (v12);

      id v6 = v25;
      if ((v22 & 1) != 0) {
        -[MADAutoAssetJob replyToJobsWhenOperationFoundSame:forCheckAtomic:withLookupError:]( self,  "replyToJobsWhenOperationFoundSame:forCheckAtomic:withLookupError:",  v25,  v24 & 1,  v7);
      }
    }

    else
    {
    }

    id v21 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    -[MADAutoAssetJob setActiveJobTasks:](self, "setActiveJobTasks:", v21);
  }
}

- (id)_newSelectorForCachedAssetCatalog:(id)a3
{
  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v67 = 0u;
  __int128 v68 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v65 objects:v76 count:16];
  if (!v5)
  {

    id v8 = 0LL;
    goto LABEL_71;
  }

  id v7 = v5;
  id v8 = 0LL;
  id v9 = 0LL;
  uint64_t v10 = *(void *)v66;
  p_ivars = &MobileAssetKeyManager__metaData.ivars;
  id v12 = &MobileAssetKeyManager__metaData.ivars;
  *(void *)&__int128 v6 = 138543618LL;
  __int128 v51 = v6;
  uint64_t v53 = self;
  id v54 = v4;
  uint64_t v52 = *(void *)v66;
  do
  {
    uint64_t v13 = 0LL;
    id v55 = v7;
    do
    {
      if (*(void *)v66 != v10) {
        objc_enumerationMutation(v4);
      }
      uint64_t v57 = v13;
      id v14 = *(const __CFString **)(*((void *)&v65 + 1) + 8 * v13);
      context = objc_autoreleasePoolPush();
      uint64_t v15 = objc_claimAutoreleasedReturnValue([v4 objectForKey:v14]);
      uint64_t v58 = (void *)v15;
      if (v14) {
        BOOL v16 = v15 == 0;
      }
      else {
        BOOL v16 = 1;
      }
      if (v16)
      {
        log = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SUCoreLog oslog](self->_logger, "oslog"));
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          if (v14) {
            __int128 v17 = v14;
          }
          else {
            __int128 v17 = @"N";
          }
          __int128 v18 = v9;
          if (v58) {
            __int128 v19 = @"Y";
          }
          else {
            __int128 v19 = @"N";
          }
          unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "safeSummary", v51));
          *(_DWORD *)int buf = 138543874;
          __int128 v71 = v17;
          id v12 = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
          __int16 v72 = 2114;
          __int128 v73 = v19;
          id v9 = v18;
          __int16 v74 = 2114;
          id v75 = v20;
          _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "{_newSelectorForCachedAssetCatalog} unable to determine key/value from set-catalog | setCatalogKey:%{public} @ | setCatalogValue:%{public}@ | autoAssetSetCatalog:%{public}@",  buf,  0x20u);
        }

        goto LABEL_65;
      }

      if (-[__objc2_ivar_list stringIsEqual:to:](p_ivars[155], "stringIsEqual:to:", v14, @"Assets"))
      {
        uint64_t v22 = objc_opt_class(v12[153]);
        if ((objc_opt_isKindOfClass(v58, v22) & 1) != 0)
        {
          id v23 = [v4 safeObjectForKey:@"Assets" ofClass:objc_opt_class(v12[153])];
          char v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
          __int128 v61 = 0u;
          __int128 v62 = 0u;
          __int128 v63 = 0u;
          __int128 v64 = 0u;
          log = v24;
          id v25 = -[os_log_s countByEnumeratingWithState:objects:count:]( log,  "countByEnumeratingWithState:objects:count:",  &v61,  v69,  16LL);
          if (!v25)
          {
            __int128 v27 = v8;
            goto LABEL_63;
          }

          id v26 = v25;
          uint64_t v60 = *(void *)v62;
          __int128 v27 = v8;
          while (1)
          {
            for (i = 0LL; i != v26; i = (char *)i + 1)
            {
              if (*(void *)v62 != v60) {
                objc_enumerationMutation(log);
              }
              __int128 v29 = *(void **)(*((void *)&v61 + 1) + 8LL * (void)i);
              __int128 v30 = objc_autoreleasePoolPush();
              __int128 v31 = (void *)objc_claimAutoreleasedReturnValue([v29 safeStringForKey:@"AssetFormat"]);
              __int128 v32 = (void *)objc_claimAutoreleasedReturnValue([v29 safeStringForKey:@"AssetType"]);
              __int16 v33 = (void *)objc_claimAutoreleasedReturnValue([v29 safeStringForKey:@"AssetSpecifier"]);
              uint64_t v34 = objc_claimAutoreleasedReturnValue([v29 safeStringForKey:@"AssetVersion"]);
              __int128 v35 = (void *)v34;
              if (v31) {
                BOOL v36 = v32 == 0LL;
              }
              else {
                BOOL v36 = 1;
              }
              if (v36 || v33 == 0LL || v34 == 0)
              {
                if (v31) {
                  BOOL v39 = 1;
                }
                else {
                  BOOL v39 = v32 == 0LL;
                }
                if (!v39 && v33 != 0LL && v34 != 0 && v9 == 0LL)
                {
                  id v43 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:]( objc_alloc(&OBJC_CLASS___MAAutoAssetSelector),  "initForAssetType:withAssetSpecifier:matchingAssetVersion:",  v32,  v33,  v34);
LABEL_56:
                  id v9 = v43;
                }
              }

              else
              {
                if (!v9)
                {
                  id v47 = v31;

                  id v43 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:]( objc_alloc(&OBJC_CLASS___MAAutoAssetSelector),  "initForAssetType:withAssetSpecifier:matchingAssetVersion:",  v32,  v33,  v35);
                  __int128 v27 = v47;
                  goto LABEL_56;
                }

                if (+[MADAutoAssetDescriptor isMorePreferredAssetFormat:comparedTo:]( &OBJC_CLASS___MADAutoAssetDescriptor,  "isMorePreferredAssetFormat:comparedTo:",  v31,  v27))
                {
                  id v44 = v31;

                  id v45 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:]( objc_alloc(&OBJC_CLASS___MAAutoAssetSelector),  "initForAssetType:withAssetSpecifier:matchingAssetVersion:",  v32,  v33,  v35);
                  id v46 = v45;
                  __int128 v27 = v44;
                  id v9 = v46;
                }
              }

              objc_autoreleasePoolPop(v30);
            }

            id v26 = -[os_log_s countByEnumeratingWithState:objects:count:]( log,  "countByEnumeratingWithState:objects:count:",  &v61,  v69,  16LL);
            if (!v26)
            {
LABEL_63:
              id v8 = v27;

              self = v53;
              id v4 = v54;
              uint64_t v10 = v52;
              id v7 = v55;
              p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
LABEL_64:
              id v12 = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
              goto LABEL_65;
            }
          }
        }

        log = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SUCoreLog oslog](self->_logger, "oslog"));
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        {
          unsigned __int8 v48 = (__CFString *)objc_claimAutoreleasedReturnValue([v4 safeSummary]);
          *(_DWORD *)int buf = v51;
          __int128 v71 = v14;
          __int16 v72 = 2114;
          __int128 v73 = v48;
          _os_log_error_impl( &dword_0,  log,  OS_LOG_TYPE_ERROR,  "{_newSelectorForCachedAssetCatalog} key value is not an array | setCatalogKey:%{public}@ | autoAssetSetCatalog:%{public}@",  buf,  0x16u);

          goto LABEL_64;
        }

- (void)stagerJobReportProgress:(id)a3 reportingError:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v7 extendedStateQueue]);
  dispatch_assert_queue_V2(v8);

  if (-[MADAutoAssetJob stagerJob](self, "stagerJob"))
  {
    if (!-[MADAutoAssetJob stagerJobResultsReported](self, "stagerJobResultsReported")) {
      +[MADAutoAssetControlManager autoAssetStagerJobDownloadProgress:withProgressError:]( &OBJC_CLASS___MADAutoAssetControlManager,  "autoAssetStagerJobDownloadProgress:withProgressError:",  v9,  v6);
    }
  }

  else
  {
    -[MADAutoAssetJob trackAnomaly:forReason:]( self,  "trackAnomaly:forReason:",  6103LL,  @"{stagerJobReportProgress} not a stager-job");
  }
}

- (void)stagerJobDone:(id)a3 reportingError:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v7 extendedStateQueue]);
  dispatch_assert_queue_V2(v8);

  if (-[MADAutoAssetJob stagerJob](self, "stagerJob"))
  {
    if (-[MADAutoAssetJob stagerJobDownloadContent](self, "stagerJobDownloadContent")) {
      -[MADAutoAssetJob stagerJobDownloadDone:reportingError:](self, "stagerJobDownloadDone:reportingError:", v10, v6);
    }
    else {
      -[MADAutoAssetJob stagerJobDetermineDone:reportingError:](self, "stagerJobDetermineDone:reportingError:", v10, v6);
    }
  }

  else
  {
    id v9 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"{%@:stagerJobDone} not a stager-job",  v10);
    -[MADAutoAssetJob trackAnomaly:forReason:](self, "trackAnomaly:forReason:", 6103LL, v9);
  }
}

- (void)stagerJobDetermineDone:(id)a3 reportingError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 extendedStateQueue]);
  dispatch_assert_queue_V2(v9);

  if (!-[MADAutoAssetJob stagerJob](self, "stagerJob"))
  {
    id v11 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"{%@:stagerJobDetermineDone} not a stager-job",  v6);
    -[MADAutoAssetJob trackAnomaly:forReason:](self, "trackAnomaly:forReason:", 6103LL, v11);

    goto LABEL_18;
  }

  if (!-[MADAutoAssetJob stagerJobResultsReported](self, "stagerJobResultsReported"))
  {
    id v10 = v7;
    id v25 = v7;
    if (!v10)
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob stagerJobAutoAssetCatalog](self, "stagerJobAutoAssetCatalog"));

      if (v12)
      {
        id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob stagerJobAutoAssetCatalog](self, "stagerJobAutoAssetCatalog"));
        char v24 = 0LL;
        goto LABEL_8;
      }

      id v10 = (id)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6111LL,  v6,  0LL,  @"stager-job determine-if-available done yet no auto-asset-catalog"));
    }

    id v23 = 0LL;
    char v24 = v10;
LABEL_8:
    uint64_t v13 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
    __int128 v26 = 0u;
    __int128 v27 = 0u;
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    id v14 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetJob latestAssetDescriptorOnFilesystemBySpecifier]( self,  "latestAssetDescriptorOnFilesystemBySpecifier"));
    id v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v27;
      do
      {
        __int128 v18 = 0LL;
        do
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8LL * (void)v18);
          unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetJob latestAssetDescriptorOnFilesystemBySpecifier]( self,  "latestAssetDescriptorOnFilesystemBySpecifier"));
          id v21 = [v20 safeObjectForKey:v19 ofClass:objc_opt_class(MADAutoAssetDescriptor)];
          uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);

          if (v22) {
            -[NSMutableArray addObject:](v13, "addObject:", v22);
          }

          __int128 v18 = (char *)v18 + 1;
        }

        while (v16 != v18);
        id v16 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }

      while (v16);
    }

    +[MADAutoAssetControlManager autoAssetStagerSetJobDetermineDone:withBaseForStagingDescriptors:withDetermineError:]( &OBJC_CLASS___MADAutoAssetControlManager,  "autoAssetStagerSetJobDetermineDone:withBaseForStagingDescriptors:withDetermineError:",  v23,  v13,  v24);
    -[MADAutoAssetJob setStagerJobResultsReported:](self, "setStagerJobResultsReported:", 1LL);

    id v7 = v25;
  }

- (void)stagerJobDownloadDone:(id)a3 reportingError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 extendedStateQueue]);
  dispatch_assert_queue_V2(v9);

  if (-[MADAutoAssetJob stagerJob](self, "stagerJob"))
  {
    if (!-[MADAutoAssetJob stagerJobResultsReported](self, "stagerJobResultsReported"))
    {
      id v14 = v7;
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentJobInformation:](self, "currentJobInformation:", &v14));
      id v11 = v14;

      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
      +[MADAutoAssetControlManager autoAssetStagerJobDownloadDone:withDownloadedDescriptor:withDownloadError:]( &OBJC_CLASS___MADAutoAssetControlManager,  "autoAssetStagerJobDownloadDone:withDownloadedDescriptor:withDownloadError:",  v10,  v12,  v11);

      -[MADAutoAssetJob setStagerJobResultsReported:](self, "setStagerJobResultsReported:", 1LL);
      id v7 = v11;
    }
  }

  else
  {
    uint64_t v13 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"{%@:stagerJobDownloadDone} not a stager-job",  v6);
    -[MADAutoAssetJob trackAnomaly:forReason:](self, "trackAnomaly:forReason:", 6103LL, v13);
  }
}

- (id)decideFollowupBoost:(id)a3 forJobEvent:(id)a4 boostEvent:(id)a5 noBoostEvent:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v10 extendedStateQueue]);
  dispatch_assert_queue_V2(v11);

  id v12 = v9;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientAssetPolicy](self, "aggregatedClientAssetPolicy"));
  LODWORD(v10) = [v13 userInitiated];

  id v14 = v12;
  if ((_DWORD)v10)
  {
    id v14 = v8;
  }

  return v14;
}

- (id)decideFollowupMoreAssetsToDownload:(id)a3 withEventInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 downloadProgress]);
    objc_msgSend(v9, "setDownloadedAssetCount:", (char *)objc_msgSend(v9, "downloadedAssetCount") + 1);

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 downloadProgress]);
    id v12 = [v11 remainingAssetCount];

    if ((uint64_t)v12 >= 1)
    {
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
      id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 downloadProgress]);
      objc_msgSend(v14, "setRemainingAssetCount:", (char *)objc_msgSend(v14, "remainingAssetCount") - 1);
    }

    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob baseForPatch](self, "baseForPatch"));
    BOOL v16 = v15 != 0LL;

    -[MADAutoAssetJob foundAndDownloaded:forJobParam:wasPatched:]( self,  "foundAndDownloaded:forJobParam:wasPatched:",  v6,  v7,  v16);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue([v17 metadata]);
    uint64_t v19 = [v18 safeIntegerForKey:@"_DownloadSize"];

    if (-[MADAutoAssetJob setProgressAssetTotalWrittenBytes](self, "setProgressAssetTotalWrittenBytes") < (uint64_t)v19)
    {
      unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 downloadProgress]);
      [v21 setIsStalled:0];

      if (-[MADAutoAssetJob setProgressAssetTotalWrittenBytes](self, "setProgressAssetTotalWrittenBytes") >= 1)
      {
        int64_t v22 = v19
            - (_BYTE *)-[MADAutoAssetJob setProgressAssetTotalWrittenBytes](self, "setProgressAssetTotalWrittenBytes");
        id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
        char v24 = (void *)objc_claimAutoreleasedReturnValue([v23 downloadProgress]);
        objc_msgSend(v24, "setTotalWrittenBytes:", (char *)objc_msgSend(v24, "totalWrittenBytes") + v22);
      }

      -[MADAutoAssetJob setSetProgressAssetTotalWrittenBytes:](self, "setSetProgressAssetTotalWrittenBytes:", v19);
      -[MADAutoAssetJob statusChangeReportCurrent:](self, "statusChangeReportCurrent:", 0LL);
    }

    -[MADAutoAssetJob setSetProgressOverallTotalWrittenBytes:]( self,  "setSetProgressOverallTotalWrittenBytes:",  (char *)-[MADAutoAssetJob setProgressAssetTotalWrittenBytes](self, "setProgressAssetTotalWrittenBytes")
    + -[MADAutoAssetJob setProgressOverallTotalWrittenBytes](self, "setProgressOverallTotalWrittenBytes"));
    -[MADAutoAssetJob setSetProgressAssetTotalWrittenBytes:](self, "setSetProgressAssetTotalWrittenBytes:", 0LL);
    -[MADAutoAssetJob updateSetTrackingWithSuccessfulAssetDownload]( self,  "updateSetTrackingWithSuccessfulAssetDownload");
    -[MADAutoAssetJob reportJustDownloadedAssetOfSet:](self, "reportJustDownloadedAssetOfSet:", v6);
    if (-[MADAutoAssetJob remainingSetDescriptorToBeDownloaded](self, "remainingSetDescriptorToBeDownloaded"))
    {
      id v34 = 0LL;
      unsigned int v25 = -[MADAutoAssetJob placeNextSetAssetDescriptorToDownload:restrictToFull:error:]( self,  "placeNextSetAssetDescriptorToDownload:restrictToFull:error:",  v6,  0LL,  &v34);
      id v26 = v34;
      if (v26)
      {
        __int128 v27 = objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam);
        __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetUUID](self, "autoAssetUUID"));
        id v29 = -[MADAutoAssetJobParam initForFinishedJobID:withError:](v27, "initForFinishedJobID:withError:", v28, v26);

        __int128 v30 = @"SetDownloadFailureNoFull";
        id v7 = v29;
      }

      else if (v25)
      {
        __int128 v30 = @"SetDownloadSuccessMorePatch";
      }

      else
      {
        __int128 v30 = @"SetDownloadSuccessMoreFull";
      }
    }

    else
    {
      __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob tryPersonalizeDescriptors](self, "tryPersonalizeDescriptors"));
      id v32 = [v31 count];

      if (v32) {
        __int128 v30 = @"SetDownloadSuccessHeal";
      }
      else {
        __int128 v30 = @"SetDownloadSuccessDone";
      }
    }
  }

  else
  {
    __int128 v30 = @"DownloadSuccessDone";
  }

  return (id)v30;
}

- (void)checkFilesystemAndDecidePurgeOrLookup
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 extendedStateQueue]);
  dispatch_assert_queue_V2(v4);

  LODWORD(v3) = -[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob");
  id v5 =  -[MADAutoAssetJob refreshOnFilesystemFromManagerPromotingIfStaged:]( self,  "refreshOnFilesystemFromManagerPromotingIfStaged:",  0LL);
  if (!(_DWORD)v3)
  {
    if (-[MADAutoAssetJob lockingAssetContent](self, "lockingAssetContent")) {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob latestInstalledOnFilesystem](self, "latestInstalledOnFilesystem"));
    }
    else {
      id v11 = 0LL;
    }
    if (-[MADAutoAssetJob lockingAssetContent](self, "lockingAssetContent"))
    {
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
      unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue([v19 assetVersion]);

      if (v20)
      {
        id v21 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
        int64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v21 assetVersion]);
        uint64_t v23 = objc_claimAutoreleasedReturnValue( -[MADAutoAssetJob installedOnFilesystemWithVersion:fromLocation:]( self,  "installedOnFilesystemWithVersion:fromLocation:",  v22,  @"checkFilesystemAndDecidePurgeOrLookup"));

        id v11 = (void *)v23;
      }
    }

    if (-[MADAutoAssetJob lockingAssetContent](self, "lockingAssetContent") && v11)
    {
      -[MADAutoAssetJob updateResultPropertiesWithDescriptor:](self, "updateResultPropertiesWithDescriptor:", v11);
      char v24 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
      unsigned int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v24 oslog]);

      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        id v26 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
        *(_DWORD *)uint64_t v53 = 138543618;
        *(void *)&v53[4] = v26;
        *(_WORD *)&v53[12] = 2114;
        *(void *)&v53[14] = v11;
        _os_log_impl( &dword_0,  v25,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {checkFilesystemAndDecidePurgeOrLookup} found already downloaded (on filesystem) asset %{public}@",  v53,  0x16u);
      }

      __int128 v27 = @"AlreadyDownloaded";
      goto LABEL_44;
    }

    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
    id v29 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetLookupCache cachedLookupResultForSelector:forStaging:]( &OBJC_CLASS___MADAutoAssetLookupCache,  "cachedLookupResultForSelector:forStaging:",  v28,  -[MADAutoAssetJob stagerJob](self, "stagerJob")));

    if (v29)
    {
      -[MADAutoAssetJob adoptCachedLookupResult:](self, "adoptCachedLookupResult:", v29);
      __int128 v30 = objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam);
      __int128 v31 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetUUID](self, "autoAssetUUID"));
      __int128 v18 = -[MADAutoAssetJobParam initForFinishedJobID:withCatalog:whereCatalogFromLookupCache:withError:]( v30,  "initForFinishedJobID:withCatalog:whereCatalogFromLookupCache:withError:",  v31,  v29,  1LL,  0LL);

      id v32 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
      __int16 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue([v32 oslog]);

      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        id v34 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
        __int128 v35 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJobParam summary](v18, "summary"));
        *(_DWORD *)uint64_t v53 = 138543618;
        *(void *)&v53[4] = v34;
        *(_WORD *)&v53[12] = 2114;
        *(void *)&v53[14] = v35;
        _os_log_impl( &dword_0,  v33,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {checkFilesystemAndDecidePurgeOrLookup} using cached lookup result for asset-selector | followupParam:%{public}@",  v53,  0x16u);
      }

      __int128 v27 = @"FoundCachedLookupResult";
      if (v18) {
        goto LABEL_46;
      }
      goto LABEL_45;
    }

    unsigned int v44 = -[MADAutoAssetJob lockingAssetContent](self, "lockingAssetContent");
    id v45 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
    unsigned int v25 = (os_log_s *)objc_claimAutoreleasedReturnValue([v45 oslog]);

    BOOL v46 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);
    if (v44)
    {
      if (v46)
      {
        id v47 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
        *(_DWORD *)uint64_t v53 = 138543362;
        *(void *)&v53[4] = v47;
        unsigned __int8 v48 = "%{public}@ | {checkFilesystemAndDecidePurgeOrLookup} no downloaded asset found (on filesystem), will attem"
              "pt lookup for lock request";
LABEL_42:
        _os_log_impl(&dword_0, v25, OS_LOG_TYPE_DEFAULT, v48, v53, 0xCu);
      }
    }

    else if (v46)
    {
      id v47 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
      *(_DWORD *)uint64_t v53 = 138543362;
      *(void *)&v53[4] = v47;
      unsigned __int8 v48 = "%{public}@ | {checkFilesystemAndDecidePurgeOrLookup} will attempt lookup for client request";
      goto LABEL_42;
    }

    __int128 v27 = @"PerformLookup";
LABEL_44:

LABEL_45:
    uint64_t v49 = objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam);
    char v50 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob _updateLatestSummary](self, "_updateLatestSummary"));
    __int128 v18 = -[MADAutoAssetJobParam initWithSafeSummary:](v49, "initWithSafeSummary:", v50);

LABEL_46:
    __int128 v51 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", *(void *)v53, *(void *)&v53[8]));
    [v51 followupEvent:v27 withInfo:v18];

    goto LABEL_47;
  }

  if (-[MADAutoAssetJob stagerJob](self, "stagerJob"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 oslog]);

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
      *(_DWORD *)uint64_t v53 = 138543362;
      *(void *)&v53[4] = v8;
      id v9 = "%{public}@ | {checkFilesystemAndDecidePurgeOrLookup} will attempt lookup for stager-formed set-configuration";
LABEL_5:
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, v9, v53, 0xCu);
    }
  }

  else
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetJob foundSetNewerDiscoveredAtomicEntries]( self,  "foundSetNewerDiscoveredAtomicEntries"));
    id v13 = [v12 count];

    if (v13)
    {
      if (-[MADAutoAssetJob lockingAssetContent](self, "lockingAssetContent")) {
        -[MADAutoAssetJob updateSetResults:atomicInstanceDiscovered:availableForUse:downloading:buildingResultSetFound:]( self,  "updateSetResults:atomicInstanceDiscovered:availableForUse:downloading:buildingResultSetFound:",  @"checkFilesystemAndDecidePurgeOrLookup",  1LL,  1LL,  0LL,  1LL);
      }
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 oslog]);

      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
        *(_DWORD *)uint64_t v53 = 138543362;
        *(void *)&v53[4] = v15;
        _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {checkFilesystemAndDecidePurgeOrLookup} found already downloaded (on filesystem) all discovered",  v53,  0xCu);
      }

      id v10 = @"AlreadyDownloaded";
      goto LABEL_15;
    }

    BOOL v36 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob setConfiguration](self, "setConfiguration"));
    __int128 v37 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetLookupCache cachedLookupResultForSetConfiguration:forStaging:]( &OBJC_CLASS___MADAutoAssetLookupCache,  "cachedLookupResultForSetConfiguration:forStaging:",  v36,  0LL));

    if (v37)
    {
      -[MADAutoAssetJob adoptCachedLookupResult:](self, "adoptCachedLookupResult:", v37);
      __int128 v38 = objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam);
      BOOL v39 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetUUID](self, "autoAssetUUID"));
      __int128 v18 = -[MADAutoAssetJobParam initForFinishedJobID:withCatalog:whereCatalogFromLookupCache:withError:]( v38,  "initForFinishedJobID:withCatalog:whereCatalogFromLookupCache:withError:",  v39,  v37,  1LL,  0LL);

      id v40 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
      __int16 v41 = (os_log_s *)objc_claimAutoreleasedReturnValue([v40 oslog]);

      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v42 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
        id v43 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJobParam summary](v18, "summary"));
        *(_DWORD *)uint64_t v53 = 138543618;
        *(void *)&v53[4] = v42;
        *(_WORD *)&v53[12] = 2114;
        *(void *)&v53[14] = v43;
        _os_log_impl( &dword_0,  v41,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {checkFilesystemAndDecidePurgeOrLookup} using cached lookup result for set-configuration | follow upParam:%{public}@",  v53,  0x16u);
      }

      id v10 = @"FoundCachedLookupResult";
      if (v18) {
        goto LABEL_17;
      }
      goto LABEL_16;
    }

    uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v52 oslog]);

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
      *(_DWORD *)uint64_t v53 = 138543362;
      *(void *)&v53[4] = v8;
      id v9 = "%{public}@ | {checkFilesystemAndDecidePurgeOrLookup} will attempt lookup for client request";
      goto LABEL_5;
    }
  }

  id v10 = @"PerformLookup";
LABEL_15:

LABEL_16:
  BOOL v16 = objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam);
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob _updateLatestSummary](self, "_updateLatestSummary"));
  __int128 v18 = -[MADAutoAssetJobParam initWithSafeSummary:](v16, "initWithSafeSummary:", v17);

LABEL_17:
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", *(_OWORD *)v53));
  [v11 followupEvent:v10 withInfo:v18];
LABEL_47:
}

- (void)updateResultPropertiesWithDescriptor:(id)a3
{
  id v33 = a3;
  if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    -[MADAutoAssetJob statusChange:catalogAnomaly:forReason:]( self,  "statusChange:catalogAnomaly:forReason:",  @"updateResultPropertiesWithDescriptor",  6103LL,  @"updateResultPropertiesWithDescriptor should never execute for set-job");
  }

  else
  {
    id v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetSelector);
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 assetType]);
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 assetSpecifier]);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v33 assetVersion]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 downloadDecryptionKey]);
    id v12 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:]( v4,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:",  v6,  v8,  v9,  v11);
    -[MADAutoAssetJob setResultSelector:](self, "setResultSelector:", v12);

    id v13 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    id v32 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob activeInstance](self, "activeInstance"));
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v32 autoAssetClientName]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob activeInstance](self, "activeInstance"));
    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue([v15 clientProcessName]);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob activeInstance](self, "activeInstance"));
    id v18 = [v17 clientProcessID];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob resultSelector](self, "resultSelector"));
    unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob activeInstance](self, "activeInstance"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 frameworkInstanceUUID]);
    id v22 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v13,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  v14,  v16,  v18,  v19,  v21);
    -[MADAutoAssetJob setResultInstance:](self, "setResultInstance:", v22);

    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v33 assetType]);
    char v24 = (void *)objc_claimAutoreleasedReturnValue([v33 assetId]);
    id AutoLocalUrlFromTypeAndIdWithPurpose = getAutoLocalUrlFromTypeAndIdWithPurpose(v23, v24, 2LL, @"auto");
    id v26 = (void *)objc_claimAutoreleasedReturnValue(AutoLocalUrlFromTypeAndIdWithPurpose);

    __int128 v27 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoFound);
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob resultSelector](self, "resultSelector"));
    id v29 = (void *)objc_claimAutoreleasedReturnValue([v33 metadata]);
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
    id v31 = -[MAAutoAssetInfoFound initForSelector:withLocalContentURL:withAssetAttributes:reportingStatus:]( v27,  "initForSelector:withLocalContentURL:withAssetAttributes:reportingStatus:",  v28,  v26,  v29,  v30);
    -[MADAutoAssetJob setResultFound:](self, "setResultFound:", v31);
  }
}

- (void)updateSetResults:(id)a3 atomicInstanceDiscovered:(BOOL)a4 availableForUse:(BOOL)a5 downloading:(BOOL)a6 buildingResultSetFound:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v88 = a3;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v12 extendedStateQueue]);
  dispatch_assert_queue_V2(v13);

  if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetNotifications](self, "currentSetNotifications"));

    if (!v14)
    {
      id v15 = objc_alloc_init(&OBJC_CLASS___MANAutoAssetSetNotifications);
      -[MADAutoAssetJob setCurrentSetNotifications:](self, "setCurrentSetNotifications:", v15);
    }

    BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetNotifications](self, "currentSetNotifications"));
    [v16 setAtomicInstanceDiscovered:v10];

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetNotifications](self, "currentSetNotifications"));
    [v17 setAtomicInstanceAvailableForUse:v9];

    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetNotifications](self, "currentSetNotifications"));
    [v18 setDownloadPending:v8];

    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetNotifications](self, "currentSetNotifications"));
    [v19 setDownloadProgress:v8];

    unsigned int v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
    uint64_t v21 = objc_claimAutoreleasedReturnValue([v20 downloadProgress]);

    id v22 = objc_alloc(&OBJC_CLASS___MANAutoAssetSetStatus);
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
    v87 = (void *)objc_claimAutoreleasedReturnValue([v23 clientDomainName]);
    char v24 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
    id v86 = (void *)objc_claimAutoreleasedReturnValue([v24 assetSetIdentifier]);
    unsigned int v25 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob setConfiguration](self, "setConfiguration"));
    v85 = (void *)objc_claimAutoreleasedReturnValue([v25 autoAssetEntries]);
    __int128 v65 = v22;
    if (v9)
    {
      id v55 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
      id v79 = -[MADAutoAssetJob newAtomicInstancesDownloadedForDescriptor:]( self,  "newAtomicInstancesDownloadedForDescriptor:");
    }

    else
    {
      id v79 = 0LL;
    }

    id v29 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
    v84 = (void *)objc_claimAutoreleasedReturnValue([v29 catalogCachedAssetSetID]);
    __int128 v30 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
    id v83 = (void *)objc_claimAutoreleasedReturnValue([v30 catalogDownloadedFromLive]);
    __int128 v67 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
    v82 = (void *)objc_claimAutoreleasedReturnValue([v67 catalogLastTimeChecked]);
    __int128 v66 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
    v81 = (void *)objc_claimAutoreleasedReturnValue([v66 catalogPostedDate]);
    if (v10)
    {
      id v54 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
      __int16 v78 = (void *)objc_claimAutoreleasedReturnValue([v54 discoveredAtomicInstance]);
    }

    else
    {
      __int16 v78 = 0LL;
    }

    __int16 v80 = (void *)v21;
    BOOL v74 = v9;
    BOOL v75 = v7;
    BOOL v73 = v10;
    __int128 v71 = v24;
    __int16 v72 = v23;
    __int128 v69 = v29;
    id v70 = v25;
    __int128 v68 = v30;
    if (v9)
    {
      uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
      id v56 = (void *)objc_claimAutoreleasedReturnValue([v53 latestDowloadedAtomicInstanceEntries]);
      uint64_t v52 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
      uint64_t v77 = (void *)objc_claimAutoreleasedReturnValue([v52 latestDownloadedAtomicInstance]);
      __int128 v51 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
      id v76 = (void *)objc_claimAutoreleasedReturnValue([v51 latestDowloadedAtomicInstanceEntries]);
    }

    else
    {
      id v56 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetJob foundSetNewerDiscoveredAtomicEntries]( self,  "foundSetNewerDiscoveredAtomicEntries"));
      id v76 = 0LL;
      uint64_t v77 = 0LL;
    }

    __int128 v64 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
    uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue([v64 downloadedCatalogCachedAssetSetID]);
    __int128 v63 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
    uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue([v63 downloadedCatalogDownloadedFromLive]);
    __int128 v62 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
    id v31 = (void *)objc_claimAutoreleasedReturnValue([v62 downloadedCatalogLastTimeChecked]);
    __int128 v61 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
    id v32 = (void *)objc_claimAutoreleasedReturnValue([v61 downloadedCatalogPostedDate]);
    uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetNotifications](self, "currentSetNotifications"));
    uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientSetPolicy](self, "aggregatedClientSetPolicy"));
    unsigned __int8 v33 = -[MADAutoAssetJob haveReceivedLookupResponse](self, "haveReceivedLookupResponse");
    unsigned __int8 v34 = -[MADAutoAssetJob vendingAtomicInstanceForConfiguredEntries]( self,  "vendingAtomicInstanceForConfiguredEntries");
    unsigned __int8 v35 = -[MADAutoAssetJob downloadingUserInitiated](self, "downloadingUserInitiated");
    BOOL v36 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
    id v37 = [v36 downloadedNetworkBytes];
    __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
    BYTE2(v50) = v35;
    BYTE1(v50) = v34;
    LOBYTE(v50) = v33;
    BOOL v39 = v56;
    id v40 = -[MANAutoAssetSetStatus initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:withCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:withNewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatestDowloadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive:withDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNeedPolicy:withSchedulerPolicy:withStagerPolicy:havingReceivedLookupResponse:vendingAtomicInstanceForConfiguredEntries:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:]( v65,  "initStatusForClientDomain:forAssetSetIdentifier:withConfiguredAssetEntries:withAtomicInstancesDownloaded:wit hCatalogCachedAssetSetID:withCatalogDownloadedFromLive:withCatalogLastTimeChecked:withCatalogPostedDate:with NewerAtomicInstanceDiscovered:withNewerDiscoveredAtomicEntries:withLatestDownloadedAtomicInstance:withLatest DowloadedAtomicInstanceEntries:withDownloadedCatalogCachedAssetSetID:withDownloadedCatalogDownloadedFromLive :withDownloadedCatalogLastTimeChecked:withDownloadedCatalogPostedDate:withCurrentNotifications:withCurrentNe edPolicy:withSchedulerPolicy:withStagerPolicy:havingReceivedLookupResponse:vendingAtomicInstanceForConfigure dEntries:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemB ytes:withCurrentLockUsage:withSelectorsForStaging:withAvailableForUseError:withNewerVersionError:",  v87,  v86,  v85,  v79,  v84,  v83,  v82,  v81,  v78,  v56,  v77,  v76,  v60,  v59,  v31,  v32,  v58,  v57,  0,  0,  v50,  v21,  v37,  [v38 downloadedFilesystemBytes],  0,  0,  0,  0);
    -[MADAutoAssetJob setCurrentSetStatus:](self, "setCurrentSetStatus:", v40);

    if (v74)
    {

      BOOL v39 = v53;
    }

    if (v73)
    {
    }

    if (v74)
    {
    }

    __int16 v41 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
    id v42 = [v41 copy];
    id v43 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob setJobInformation](self, "setJobInformation"));
    [v43 setCurrentSetStatus:v42];

    if (!v75)
    {
      id v26 = v80;
      goto LABEL_24;
    }

    unsigned int v44 = objc_alloc(&OBJC_CLASS___MANAutoAssetSetInfoFound);
    id v45 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetIdentifier](self, "autoAssetSetIdentifier"));
    BOOL v46 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
    id v47 = -[MANAutoAssetSetInfoFound initForAssetSetIdentifier:reportingStatus:]( v44,  "initForAssetSetIdentifier:reportingStatus:",  v45,  v46);
    -[MADAutoAssetJob setResultSetFound:](self, "setResultSetFound:", v47);

    unsigned __int8 v48 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob resultSetFound](self, "resultSetFound"));
    uint64_t v49 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob setJobInformation](self, "setJobInformation"));
    [v49 setFoundContent:v48];

    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
    __int128 v28 = (NSString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob setJobInformation](self, "setJobInformation"));
    -[NSString setSetDescriptor:](v28, "setSetDescriptor:", v27);
    id v26 = v80;
  }

  else
  {
    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
    __int128 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 diag]);
    __int128 v28 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"{%@:updateSetResults} should only be called for set-job",  v88);
    [v27 trackAnomaly:@"AUTO-SET-JOB" forReason:v28 withResult:6103 withError:0];
  }

LABEL_24:
}

- (id)installedOnFilesystemWithVersion:(id)a3 fromLocation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  BOOL v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 extendedStateQueue]);
  dispatch_assert_queue_V2(v9);

  if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    -[MADAutoAssetJob statusChange:catalogAnomaly:forReason:]( self,  "statusChange:catalogAnomaly:forReason:",  @"installedOnFilesystemWithVersion",  6103LL,  @"installedOnFilesystemWithVersion should never execute for set-job");
    BOOL v10 = 0LL;
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob onFilesystemByVersion](self, "onFilesystemByVersion"));
    id v12 = [v11 safeObjectForKey:v6 ofClass:objc_opt_class(MADAutoAssetDescriptor)];
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(v12);

    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 oslog]);

    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob _updateLatestSummary](self, "_updateLatestSummary"));
      BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob onFilesystemByVersion](self, "onFilesystemByVersion"));
      id v17 = [v16 count];
      if (v10) {
        id v18 = (__CFString *)objc_claimAutoreleasedReturnValue([v10 summary]);
      }
      else {
        id v18 = @"N";
      }
      int v20 = 138544386;
      uint64_t v21 = v15;
      __int16 v22 = 2114;
      id v23 = v7;
      __int16 v24 = 2048;
      id v25 = v17;
      __int16 v26 = 2114;
      id v27 = v6;
      __int16 v28 = 2114;
      id v29 = v18;
      _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {%{public}@:installedOnFilesystemWithVersion} considering by-version count:%ld, looking for assetVe rsion:%{public}@, locatedDescriptor:%{public}@",  (uint8_t *)&v20,  0x34u);
      if (v10) {
    }
      }
  }

  return v10;
}

- (id)latestInstalledOnFilesystem
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 extendedStateQueue]);
  dispatch_assert_queue_V2(v4);

  if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    -[MADAutoAssetJob statusChange:catalogAnomaly:forReason:]( self,  "statusChange:catalogAnomaly:forReason:",  @"latestInstalledOnFilesystem",  6103LL,  @"latestInstalledOnFilesystem should never execute for set-job");
    return 0LL;
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue([v6 oslog]);

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob onFilesystemByVersion](self, "onFilesystemByVersion"));
    *(_DWORD *)int buf = 138543618;
    uint64_t v49 = v8;
    __int16 v50 = 2048;
    id v51 = [v9 count];
    _os_log_impl( &dword_0,  v7,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {latestInstalledOnFilesystem} considering by-version count:%ld",  buf,  0x16u);
  }

  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v43 = 0u;
  __int128 v44 = 0u;
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob onFilesystemByVersion](self, "onFilesystemByVersion"));
  id v42 = [v10 countByEnumeratingWithState:&v43 objects:v47 count:16];
  id v11 = 0LL;
  id v12 = 0LL;
  if (v42)
  {
    uint64_t v41 = *(void *)v44;
    id v40 = v10;
    do
    {
      for (i = 0LL; i != v42; i = (char *)i + 1)
      {
        if (*(void *)v44 != v41) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v43 + 1) + 8LL * (void)i);
        id v15 = objc_autoreleasePoolPush();
        BOOL v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob onFilesystemByVersion](self, "onFilesystemByVersion"));
        id v17 = [v16 safeObjectForKey:v14 ofClass:objc_opt_class(MADAutoAssetDescriptor)];
        id v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

        uint64_t v19 = objc_claimAutoreleasedReturnValue([v18 assetVersion]);
        if (v19)
        {
          int v20 = (void *)v19;
          unsigned int v21 = [v18 isOnFilesystem];

          if (v21)
          {
            id v22 = objc_alloc(&OBJC_CLASS___SUCoreRestoreVersion);
            id v23 = (void *)objc_claimAutoreleasedReturnValue([v18 assetVersion]);
            id v24 = [v22 initWithRestoreVersion:v23];

            if (v12)
            {
              if ([v24 compare:v11] == (char *)&dword_0 + 1)
              {
                id v25 = v18;

                id v26 = v24;
                id v27 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
                __int16 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 oslog]);

                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  id v29 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
                  __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v25 summary]);
                  *(_DWORD *)int buf = 138543618;
                  uint64_t v49 = v29;
                  __int16 v50 = 2114;
                  id v51 = v30;
                  id v31 = v28;
                  id v32 = "%{public}@ | {latestInstalledOnFilesystem} best candidate so far:%{public}@";
                  goto LABEL_21;
                }
              }

              else
              {
                id v37 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
                __int16 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v37 oslog]);

                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
                  BOOL v39 = (void *)objc_claimAutoreleasedReturnValue([v18 summary]);
                  *(_DWORD *)int buf = 138543618;
                  uint64_t v49 = v38;
                  __int16 v50 = 2114;
                  id v51 = v39;
                  _os_log_impl( &dword_0,  v28,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {latestInstalledOnFilesystem} not newer version:%{public}@",  buf,  0x16u);
                }

                id v26 = v11;
                id v25 = v12;
              }
            }

            else
            {
              id v25 = v18;
              id v26 = v24;

              BOOL v36 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
              __int16 v28 = (os_log_s *)objc_claimAutoreleasedReturnValue([v36 oslog]);

              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                id v29 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
                __int128 v30 = (void *)objc_claimAutoreleasedReturnValue([v25 summary]);
                *(_DWORD *)int buf = 138543618;
                uint64_t v49 = v29;
                __int16 v50 = 2114;
                id v51 = v30;
                id v31 = v28;
                id v32 = "%{public}@ | {latestInstalledOnFilesystem} first candidate:%{public}@";
LABEL_21:
                _os_log_impl(&dword_0, v31, OS_LOG_TYPE_DEFAULT, v32, buf, 0x16u);
              }
            }

            id v11 = v26;
            id v12 = v25;
            BOOL v10 = v40;
            goto LABEL_26;
          }
        }

        unsigned __int8 v33 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
        id v24 = (id)objc_claimAutoreleasedReturnValue([v33 oslog]);

        if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
        {
          unsigned __int8 v34 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
          unsigned __int8 v35 = (void *)objc_claimAutoreleasedReturnValue([v18 summary]);
          *(_DWORD *)int buf = 138543618;
          uint64_t v49 = v34;
          __int16 v50 = 2114;
          id v51 = v35;
          _os_log_impl( &dword_0,  (os_log_t)v24,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {latestInstalledOnFilesystem} descriptor not valid for latest:%{public}@",  buf,  0x16u);
        }

- (BOOL)isFoundAlreadyOnFilesystem:(BOOL *)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerPatch](self, "foundNewerPatch"));
  if (v7)
  {
    id v8 = objc_alloc(&OBJC_CLASS___SUCoreRestoreVersion);
    BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerPatch](self, "foundNewerPatch"));
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue([v9 assetVersion]);
    id v11 = [v8 initWithRestoreVersion:v10];
  }

  else
  {
    id v11 = 0LL;
  }

  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerFull](self, "foundNewerFull"));
  if (v12)
  {
    id v13 = objc_alloc(&OBJC_CLASS___SUCoreRestoreVersion);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerFull](self, "foundNewerFull"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 assetVersion]);
    id v100 = [v13 initWithRestoreVersion:v15];
  }

  else
  {
    id v100 = 0LL;
  }

  BOOL v16 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetJob refreshOnFilesystemFromManagerPromotingIfStaged:]( self,  "refreshOnFilesystemFromManagerPromotingIfStaged:",  1LL));
  id v17 = v16;
  if (v16)
  {
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v16 assetVersion]);

    if (v18)
    {
      if (+[MADAutoAssetSecure doesDescriptorInvolvePersonalization:forDescriptor:]( &OBJC_CLASS___MADAutoAssetSecure,  "doesDescriptorInvolvePersonalization:forDescriptor:",  @"isFoundAlreadyOnFilesystem",  v17)
        && +[MADAutoAssetSecure isPersonalizationRequired:forDescriptor:]( &OBJC_CLASS___MADAutoAssetSecure,  "isPersonalizationRequired:forDescriptor:",  @"isFoundAlreadyOnFilesystem",  v17))
      {
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob tryPersonalizeDescriptors](self, "tryPersonalizeDescriptors"));
        [v19 addObject:v17];

        int v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
        unsigned int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 oslog]);

        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
          id v23 = (__CFString *)objc_claimAutoreleasedReturnValue([v17 summary]);
          *(_DWORD *)int buf = 138543618;
          __int16 v107 = v22;
          __int16 v108 = 2114;
          __int16 v109 = v23;
          _os_log_impl( &dword_0,  v21,  OS_LOG_TYPE_DEFAULT,  "%{public}@\n [AUTO-SECURE][AUTO-PERSONALIZATION][SET-JOB-TRY] {isFoundAlreadyOnFilesystem} secure auto-asset just immedia te-promoted from staged (requires personalization) | immediatelyPromotedDescriptor:%{public}@",  buf,  0x16u);
        }
      }

      id v24 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob onFilesystemByVersion](self, "onFilesystemByVersion"));
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v17 assetVersion]);
      [v24 setSafeObject:v17 forKey:v25];
    }

    else
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 diag]);
      [v25 trackAnomaly:@"AUTO-JOB" forReason:@"{isFoundAlreadyOnFilesystem} immediatelyPromotedDescriptor without assetVersion" withResult:6111 withError:0];
    }

    id v98 = 0LL;
    __int128 v99 = 0LL;
    id v51 = v17;
LABEL_40:
    id v52 = v51;
    uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
    id v54 = (void *)objc_claimAutoreleasedReturnValue([v53 assetType]);
    id v55 = (void *)objc_claimAutoreleasedReturnValue([v52 assetId]);
    id AutoLocalUrlFromTypeAndIdWithPurpose = getAutoLocalUrlFromTypeAndIdWithPurpose(v54, v55, 2LL, @"auto");
    uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue(AutoLocalUrlFromTypeAndIdWithPurpose);

    -[MADAutoAssetJob setNewerFoundAssetDescriptor:](self, "setNewerFoundAssetDescriptor:", v52);
    -[MADAutoAssetJob setDownloadingAssetDescriptor:](self, "setDownloadingAssetDescriptor:", v52);
    uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
    uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue([v58 notifications]);
    [v59 setContentAvailableForUse:1];

    uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue([v52 metadata]);
    __int128 v61 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
    [v61 setAvailableForUseAttributes:v60];

    __int128 v62 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoFound);
    __int128 v63 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob resultSelector](self, "resultSelector"));
    __int128 v64 = (void *)objc_claimAutoreleasedReturnValue([v52 metadata]);
    __int128 v65 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
    id v66 = -[MAAutoAssetInfoFound initForSelector:withLocalContentURL:withAssetAttributes:reportingStatus:]( v62,  "initForSelector:withLocalContentURL:withAssetAttributes:reportingStatus:",  v63,  v57,  v64,  v65);
    -[MADAutoAssetJob setResultFound:](self, "setResultFound:", v66);

    __int128 v67 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
    __int128 v68 = (os_log_s *)objc_claimAutoreleasedReturnValue([v67 oslog]);

    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v69 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
      id v70 = (__CFString *)objc_claimAutoreleasedReturnValue([v52 summary]);
      *(_DWORD *)int buf = 138543618;
      __int16 v107 = v69;
      __int16 v108 = 2114;
      __int16 v109 = v70;
      _os_log_impl( &dword_0,  v68,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {isFoundAlreadyOnFilesystem} adopted already on filesystem | adoptDescriptor:%{public}@",  buf,  0x16u);
    }

    BOOL v71 = 1;
    __int16 v72 = v99;
    goto LABEL_43;
  }

  id v26 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
  id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue([v26 oslog]);

  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v28 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
    id v29 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob onFilesystemByVersion](self, "onFilesystemByVersion"));
    *(_DWORD *)int buf = 138543618;
    __int16 v107 = v28;
    __int16 v108 = 2048;
    __int16 v109 = (const __CFString *)[v29 count];
    _os_log_impl( &dword_0,  v27,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {isFoundAlreadyOnFilesystem} considering by-version count:%ld",  buf,  0x16u);
  }

  v96 = a3;

  __int128 v104 = 0u;
  __int128 v105 = 0u;
  __int128 v102 = 0u;
  __int128 v103 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob onFilesystemByVersion](self, "onFilesystemByVersion"));
  id v30 = [obj countByEnumeratingWithState:&v102 objects:v112 count:16];
  if (v30)
  {
    id v31 = v30;
    id v98 = 0LL;
    __int128 v99 = 0LL;
    uint64_t v97 = 0LL;
    uint64_t v32 = *(void *)v103;
    do
    {
      for (i = 0LL; i != v31; i = (char *)i + 1)
      {
        if (*(void *)v103 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v34 = *(void *)(*((void *)&v102 + 1) + 8LL * (void)i);
        unsigned __int8 v35 = objc_autoreleasePoolPush();
        BOOL v36 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob onFilesystemByVersion](self, "onFilesystemByVersion"));
        id v37 = [v36 safeObjectForKey:v34 ofClass:objc_opt_class(MADAutoAssetDescriptor)];
        __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(v37);

        BOOL v39 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
        id v40 = (os_log_s *)objc_claimAutoreleasedReturnValue([v39 oslog]);

        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v41 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
          id v42 = (__CFString *)objc_claimAutoreleasedReturnValue([v38 summary]);
          *(_DWORD *)int buf = 138543618;
          __int16 v107 = v41;
          __int16 v108 = 2114;
          __int16 v109 = v42;
          _os_log_impl( &dword_0,  v40,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {isFoundAlreadyOnFilesystem} considering candidateDescriptor:%{public}@",  buf,  0x16u);
        }

        uint64_t v43 = objc_claimAutoreleasedReturnValue([v38 assetVersion]);
        if (v43)
        {
          __int128 v44 = (void *)v43;
          unsigned int v45 = [v38 isOnFilesystem];

          if (v45)
          {
            id v46 = objc_alloc(&OBJC_CLASS___SUCoreRestoreVersion);
            id v47 = (void *)objc_claimAutoreleasedReturnValue([v38 assetVersion]);
            id v48 = [v46 initWithRestoreVersion:v47];

            if (v11 && [v48 isComparable:v11] && !objc_msgSend(v48, "compare:", v11))
            {
              id v49 = v38;

              BYTE4(v97) = 1;
              id v98 = v49;
            }

            if (v100 && [v48 isComparable:v100] && !objc_msgSend(v48, "compare:", v100))
            {
              id v50 = v38;

              LOBYTE(v97) = 1;
              __int128 v99 = v50;
            }
          }
        }

        objc_autoreleasePoolPop(v35);
      }

      id v31 = [obj countByEnumeratingWithState:&v102 objects:v112 count:16];
    }

    while (v31);
  }

  else
  {
    id v98 = 0LL;
    __int128 v99 = 0LL;
    uint64_t v97 = 0LL;
  }

  if ((v97 & 0x100000000LL) != 0 || (v97 & 1) != 0)
  {
    v85 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
    id v86 = (os_log_s *)objc_claimAutoreleasedReturnValue([v85 oslog]);

    id v17 = 0LL;
    a3 = v96;
    if ((BYTE4(v97) & v97 & 1) != 0)
    {
      if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR)) {
        -[MADAutoAssetJob isFoundAlreadyOnFilesystem:].cold.1(self, v86);
      }
    }

    else if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
    {
      id v91 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
      if ((v97 & 0x100000000LL) != 0) {
        __int16 v92 = @"patch";
      }
      else {
        __int16 v92 = @"full";
      }
      if ((v97 & 0x100000000LL) != 0) {
        id v93 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerPatch](self, "foundNewerPatch"));
      }
      else {
        id v93 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerFull](self, "foundNewerFull"));
      }
      __int16 v94 = v93;
      id v95 = (void *)objc_claimAutoreleasedReturnValue([v93 summary]);
      *(_DWORD *)int buf = 138543874;
      __int16 v107 = v91;
      __int16 v108 = 2114;
      __int16 v109 = v92;
      __int16 v110 = 2114;
      v111 = v95;
      _os_log_impl( &dword_0,  v86,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {isFoundAlreadyOnFilesystem} lookup found asset already on filesystem | %{public}@:%{public}@",  buf,  0x20u);
    }

    if (v99)
    {
      id v51 = v99;
    }

    else
    {
      BOOL v74 = 0LL;
      id v51 = v98;
      if (!v98)
      {
        BOOL v71 = 1;
        BOOL v73 = 0LL;
        if (!v96) {
          goto LABEL_45;
        }
        goto LABEL_44;
      }

      __int128 v99 = 0LL;
    }

    goto LABEL_40;
  }

  uint64_t v76 = objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerPatch](self, "foundNewerPatch"));
  id v17 = 0LL;
  a3 = v96;
  __int16 v72 = v99;
  if (v76
    && (uint64_t v77 = (void *)v76,
        __int16 v78 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerFull](self, "foundNewerFull")),
        v78,
        v77,
        v78))
  {
    id v79 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
    id v52 = (id)objc_claimAutoreleasedReturnValue([v79 oslog]);

    if (os_log_type_enabled((os_log_t)v52, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v80 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
      v81 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerPatch](self, "foundNewerPatch"));
      v82 = (__CFString *)objc_claimAutoreleasedReturnValue([v81 summary]);
      id v83 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerFull](self, "foundNewerFull"));
      v84 = (void *)objc_claimAutoreleasedReturnValue([v83 summary]);
      *(_DWORD *)int buf = 138543874;
      __int16 v107 = v80;
      __int16 v108 = 2114;
      __int16 v109 = v82;
      __int16 v110 = 2114;
      v111 = v84;
      _os_log_impl( &dword_0,  (os_log_t)v52,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {isFoundAlreadyOnFilesystem} lookup found asset not already on filesystem | patch:%{public}@, full:%{public}@",  buf,  0x20u);
    }
  }

  else
  {
    v87 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
    id v52 = (id)objc_claimAutoreleasedReturnValue([v87 oslog]);

    if (os_log_type_enabled((os_log_t)v52, OS_LOG_TYPE_DEFAULT))
    {
      id v88 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
      v89 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerFull](self, "foundNewerFull"));
      id v90 = (void *)objc_claimAutoreleasedReturnValue([v89 summary]);
      *(_DWORD *)int buf = 138543874;
      __int16 v107 = v88;
      __int16 v108 = 2114;
      __int16 v109 = @"full";
      __int16 v110 = 2114;
      v111 = v90;
      _os_log_impl( &dword_0,  (os_log_t)v52,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {isFoundAlreadyOnFilesystem} lookup found asset not already on filesystem | %{public}@:%{public}@",  buf,  0x20u);
    }
  }

  BOOL v71 = 0;
LABEL_43:
  BOOL v73 = v72;

  BOOL v74 = v98;
  if (a3) {
LABEL_44:
  }
    *a3 = v17 != 0LL;
LABEL_45:

  return v71;
}

- (id)refreshOnFilesystemFromManagerPromotingIfStaged:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  if (-[MADAutoAssetJob autoAssetSetJob](v4, "autoAssetSetJob"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob newestDownloadedSetStatus](v4, "newestDownloadedSetStatus"));

    if (!v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](v4, "autoAssetSetDescriptor"));
      BOOL v9 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetControlManager newestDownloadedForSetDescriptor:]( &OBJC_CLASS___MADAutoAssetControlManager,  "newestDownloadedForSetDescriptor:",  v8));
      -[MADAutoAssetJob setNewestDownloadedSetStatus:](v4, "setNewestDownloadedSetStatus:", v9);
    }

    return 0LL;
  }

  else
  {
    id v11 = objc_alloc(&OBJC_CLASS___MAAutoAssetSelector);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](v4, "autoAssetSelector"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 assetType]);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](v4, "autoAssetSelector"));
    id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 assetSpecifier]);
    id v16 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:]( v11,  "initForAssetType:withAssetSpecifier:",  v13,  v15);

    uint64_t v17 = objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob resultSelector](v4, "resultSelector"));
    id v47 = (void *)v17;
    id v48 = v16;
    if (v3) {
      uint64_t v18 = v17;
    }
    else {
      uint64_t v18 = 0LL;
    }
    id v58 = 0LL;
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetControlManager loadDescriptorsForJobSelector:promotingIfCurrentlyStaged:immediatelyPromotedDescriptor:]( &OBJC_CLASS___MADAutoAssetControlManager,  "loadDescriptorsForJobSelector:promotingIfCurrentlyStaged:immediatelyPromotedDescriptor:",  v16,  v18,  &v58));
    id v46 = v58;
    id v49 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
    id v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
    int v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](v4, "logger"));
    unsigned int v21 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 oslog]);

    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](v4, "autoJobName"));
      id v23 = (const __CFString *)[v19 count];
      id v24 = (void *)objc_claimAutoreleasedReturnValue([v16 summary]);
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v47 summary]);
      *(_DWORD *)int buf = 138544130;
      __int128 v61 = v22;
      __int16 v62 = 2048;
      __int128 v63 = v23;
      __int16 v64 = 2114;
      __int128 v65 = v24;
      __int16 v66 = 2114;
      __int128 v67 = v25;
      _os_log_impl( &dword_0,  v21,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {refreshOnFilesystemFromManagerPromotingIfStaged} auto-control-manager known descriptor count:%ld | specifierSelector:%{public}@, versionSelector:%{public}@",  buf,  0x2Au);
    }

    __int128 v56 = 0u;
    __int128 v57 = 0u;
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    id v26 = v19;
    id v27 = [v26 countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v55;
      p_ivars = &MobileAssetKeyManager__metaData.ivars;
      id v51 = v4;
      do
      {
        for (i = 0LL; i != v28; i = (char *)i + 1)
        {
          if (*(void *)v55 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v32 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)i);
          unsigned __int8 v33 = objc_autoreleasePoolPush();
          uint64_t v53 = v32;
          id v34 = [v26 safeObjectForKey:v32 ofClass:objc_opt_class(p_ivars[223])];
          unsigned __int8 v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
          BOOL v36 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](v4, "logger"));
          id v37 = (os_log_s *)objc_claimAutoreleasedReturnValue([v36 oslog]);

          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](v4, "autoJobName"));
            id v52 = v33;
            id v39 = v28;
            id v40 = p_ivars;
            id v41 = v26;
            uint64_t v42 = v29;
            else {
              uint64_t v43 = @"N";
            }
            __int128 v44 = (void *)objc_claimAutoreleasedReturnValue([v35 summary]);
            *(_DWORD *)int buf = 138544130;
            __int128 v61 = v38;
            __int16 v62 = 2114;
            __int128 v63 = v43;
            uint64_t v29 = v42;
            id v26 = v41;
            p_ivars = v40;
            id v28 = v39;
            unsigned __int8 v33 = v52;
            __int16 v64 = 2114;
            __int128 v65 = v53;
            __int16 v66 = 2114;
            __int128 v67 = v44;
            _os_log_impl( &dword_0,  v37,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {refreshOnFilesystemFromManagerPromotingIfStaged} isOnFilesystem:%{public}@ | assetVersion:%{ public}@ | candidate:%{public}@",  buf,  0x2Au);

            id v4 = v51;
          }

          if ([v35 isOnFilesystem])
          {
            unsigned int v45 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetControlManager localAssetURLForDescriptor:fromLocation:]( &OBJC_CLASS___MADAutoAssetControlManager,  "localAssetURLForDescriptor:fromLocation:",  v35,  @"refreshOnFilesystemFromManagerPromotingIfStaged"));
          }

          objc_autoreleasePoolPop(v33);
        }

        id v28 = [v26 countByEnumeratingWithState:&v54 objects:v59 count:16];
      }

      while (v28);
    }

    -[MADAutoAssetJob setOnFilesystemByVersion:](v4, "setOnFilesystemByVersion:", v49);
    return v46;
  }

- (void)refreshFoundToManager
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 extendedStateQueue]);
  dispatch_assert_queue_V2(v4);

  if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    -[MADAutoAssetJob statusChange:catalogAnomaly:forReason:]( self,  "statusChange:catalogAnomaly:forReason:",  @"refreshFoundToManager",  6103LL,  @"refreshFoundToManager should never execute for set-job");
    return;
  }

  id v5 = objc_alloc(&OBJC_CLASS___MAAutoAssetSelector);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 assetType]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue([v8 assetSpecifier]);
  id v46 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:](v5, "initForAssetType:withAssetSpecifier:", v7, v9);

  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerPatch](self, "foundNewerPatch"));
  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob onFilesystemByVersion](self, "onFilesystemByVersion"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerPatch](self, "foundNewerPatch"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 assetVersion]);
    id v14 = [v11 safeObjectForKey:v13 ofClass:objc_opt_class(MADAutoAssetDescriptor)];
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(v14);

    if (v10)
    {
      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerPatch](self, "foundNewerPatch"));
      [v15 setIsOnFilesystem:1];

      if (-[MADAutoAssetJob stagerJob](self, "stagerJob")) {
        goto LABEL_11;
      }
      id v16 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerPatch](self, "foundNewerPatch"));
      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentJobInformation:](self, "currentJobInformation:", 0LL));
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob firstClientName](self, "firstClientName"));
      +[MADAutoAssetControlManager persistForJobSelector:persistingJobDescriptor:withJobInformation:withFirstClientName:]( &OBJC_CLASS___MADAutoAssetControlManager,  "persistForJobSelector:persistingJobDescriptor:withJobInformation:withFirstClientName:",  v46,  v16,  v17,  v18);
    }

    else
    {
      if (-[MADAutoAssetJob stagerJob](self, "stagerJob"))
      {
        BOOL v10 = 0LL;
        goto LABEL_11;
      }

      uint64_t v19 = objc_alloc(&OBJC_CLASS___MAAutoAssetSelector);
      int v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerPatch](self, "foundNewerPatch"));
      unsigned int v21 = (void *)objc_claimAutoreleasedReturnValue([v20 assetType]);
      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerPatch](self, "foundNewerPatch"));
      id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 assetSpecifier]);
      id v24 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerPatch](self, "foundNewerPatch"));
      id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 assetVersion]);
      id v16 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:]( v19,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:",  v21,  v23,  v25);

      uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerPatch](self, "foundNewerPatch"));
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentJobInformation:](self, "currentJobInformation:", 0LL));
      id v26 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob firstClientName](self, "firstClientName"));
      +[MADAutoAssetControlManager persistForJobSelector:persistingJobDescriptor:withJobInformation:withFirstClientName:]( &OBJC_CLASS___MADAutoAssetControlManager,  "persistForJobSelector:persistingJobDescriptor:withJobInformation:withFirstClientName:",  v16,  v17,  v18,  v26);

      BOOL v10 = 0LL;
    }
  }

- (void)refreshDownloadedToManager
{
  v1 = (void *)objc_claimAutoreleasedReturnValue([v0 _updateLatestSummary]);
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_0_0( &dword_0,  v2,  v3,  "%{public}@ | {refreshDownloadedToManager} unable to create asset-descriptor for just-downloaded asset | invalid:%{public}@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_2_0();
}

- (BOOL)isAtomicEntry:(id)a3 alreadyInAtomicEntries:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    id v19 = v5;
    uint64_t v10 = *(void *)v21;
    while (2)
    {
      for (i = 0LL; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v20 + 1) + 8LL * (void)i);
        id v13 = objc_autoreleasePoolPush();
        id v14 = (void *)objc_claimAutoreleasedReturnValue([v12 fullAssetSelector]);
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v14 persistedEntryID]);

        id v16 = -[NSMutableDictionary safeObjectForKey:ofClass:]( v7,  "safeObjectForKey:ofClass:",  v15,  objc_opt_class(&OBJC_CLASS___MANAutoAssetSetAtomicEntry));
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        if (v17)
        {

          objc_autoreleasePoolPop(v13);
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }

        -[NSMutableDictionary setSafeObject:forKey:](v7, "setSafeObject:forKey:", v12, v15);

        objc_autoreleasePoolPop(v13);
      }

      id v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v9) {
        continue;
      }
      break;
    }

- (void)_commitPrePersonalized:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v7 extendedStateQueue]);
  dispatch_assert_queue_V2(v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob prePersonalizedSelectors](self, "prePersonalizedSelectors"));
  if (![v9 count])
  {

LABEL_7:
    id v12 = 0LL;
    if (!a4) {
      goto LABEL_9;
    }
LABEL_8:
    *a4 = v12;
    goto LABEL_9;
  }

  unsigned __int8 v10 = -[MADAutoAssetJob tryPersonalizeFailed](self, "tryPersonalizeFailed");

  if ((v10 & 1) != 0) {
    goto LABEL_7;
  }
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob prePersonalizedSelectors](self, "prePersonalizedSelectors"));
  id v12 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetSecure commitPrePersonalizedSync:committingSelectors:]( &OBJC_CLASS___MADAutoAssetSecure,  "commitPrePersonalizedSync:committingSelectors:",  v6,  v11));

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 oslog]);

  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MADAutoAssetJob _commitPrePersonalized:error:].cold.1();
    }
  }

  else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob prePersonalizedSelectors](self, "prePersonalizedSelectors"));
    int v18 = 138543618;
    id v19 = v15;
    __int16 v20 = 2048;
    id v21 = [v16 count];
    _os_log_impl( &dword_0,  v14,  OS_LOG_TYPE_DEFAULT,  "%{public}@\n [AUTO-SECURE][AUTO-PERSONALIZATION][SET-JOB-PRE] committed pre-personalized | prePersonalizedSelectors:%ld",  (uint8_t *)&v18,  0x16u);
  }

  uint64_t v17 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  -[MADAutoAssetJob setPrePersonalizedSelectors:](self, "setPrePersonalizedSelectors:", v17);

  if (a4) {
    goto LABEL_8;
  }
LABEL_9:
}

- (void)downloadCatalog:(id)a3
{
  id v9 = a3;
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 extendedStateQueue]);
  dispatch_assert_queue_V2(v5);

  if (!-[MADAutoAssetJob rampingForeground](self, "rampingForeground"))
  {
    if (-[MADAutoAssetJob rampingForegroundLatched](self, "rampingForegroundLatched")
      || (id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientAssetPolicy](self, "aggregatedClientAssetPolicy")),
          unsigned int v7 = [v6 userInitiated],
          v6,
          v7))
    {
      -[MADAutoAssetJob setRampingForeground:](self, "setRampingForeground:", 1LL);
    }
  }

  id v8 = -[MADAutoAssetJob newCatalogDownloadOptions](self, "newCatalogDownloadOptions");
  -[MADAutoAssetJob setCatalogDownloadOptions:](self, "setCatalogDownloadOptions:", v8);

  -[MADAutoAssetJob requestDownloadManagerCatalogLookup:](self, "requestDownloadManagerCatalogLookup:", v9);
}

- (id)newCatalogDownloadOptions
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 extendedStateQueue]);
  dispatch_assert_queue_V2(v4);

  id v5 = objc_alloc_init(&OBJC_CLASS___MAMsuDownloadOptions);
  id v6 =  -[MADAutoAssetJob refreshOnFilesystemFromManagerPromotingIfStaged:]( self,  "refreshOnFilesystemFromManagerPromotingIfStaged:",  0LL);
  unsigned int v7 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[MAMsuDownloadOptions setAdditionalServerParams:](v5, "setAdditionalServerParams:", v7);

  id v8 = -[MADAutoAssetJob newSessionID](self, "newSessionID");
  -[MADAutoAssetJob setCheckUUID:](self, "setCheckUUID:", v8);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob checkUUID](self, "checkUUID"));
  -[MAMsuDownloadOptions setSessionId:](v5, "setSessionId:", v9);

  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[MAMsuDownloadOptions additionalServerParams](v5, "additionalServerParams"));
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob checkUUID](self, "checkUUID"));
  [v10 setSafeObject:v11 forKey:@"SessionId"];

  LODWORD(v10) = +[MADAutoAssetControlManager preferenceAsIfBackgroundOrUse:]( &OBJC_CLASS___MADAutoAssetControlManager,  "preferenceAsIfBackgroundOrUse:",  -[MADAutoAssetJob rampingForeground](self, "rampingForeground") ^ 1);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MAMsuDownloadOptions additionalServerParams](v5, "additionalServerParams"));
  id v13 = v12;
  if ((_DWORD)v10) {
    id v14 = @"Background";
  }
  else {
    id v14 = @"Foreground";
  }
  [v12 setSafeObject:v14 forKey:@"DeviceCheck"];

  -[MAMsuDownloadOptions setTimeoutIntervalForResource:](v5, "setTimeoutIntervalForResource:", 120LL);
  -[MAMsuDownloadOptions setDiscretionary:](v5, "setDiscretionary:", 0LL);
  if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientSetPolicy](self, "aggregatedClientSetPolicy"));
    -[MAMsuDownloadOptions setAllowsCellularAccess:]( v5,  "setAllowsCellularAccess:",  [v15 allowCheckDownloadOverCellular]);

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientSetPolicy](self, "aggregatedClientSetPolicy"));
    -[MAMsuDownloadOptions setAllowsExpensiveAccess:]( v5,  "setAllowsExpensiveAccess:",  [v16 allowCheckDownloadOverExpensive]);

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientSetPolicy](self, "aggregatedClientSetPolicy"));
    -[MAMsuDownloadOptions setRequiresPowerPluggedIn:]( v5,  "setRequiresPowerPluggedIn:",  [v17 allowCheckDownloadOnBattery] ^ 1);
  }

  else
  {
    -[MAMsuDownloadOptions setAllowsCellularAccess:](v5, "setAllowsCellularAccess:", 1LL);
    -[MAMsuDownloadOptions setAllowsExpensiveAccess:](v5, "setAllowsExpensiveAccess:", 1LL);
    -[MAMsuDownloadOptions setRequiresPowerPluggedIn:](v5, "setRequiresPowerPluggedIn:", 0LL);
  }

  -[MAMsuDownloadOptions setCanUseLocalCacheServer:](v5, "setCanUseLocalCacheServer:", 1LL);
  -[MAMsuDownloadOptions setPrefersInfraWiFi:](v5, "setPrefersInfraWiFi:", 1LL);
  -[MAMsuDownloadOptions setLiveServerCatalogOnly:](v5, "setLiveServerCatalogOnly:", 0LL);
  -[MAMsuDownloadOptions setLiveServerCatalogOnlyIsOverridden:](v5, "setLiveServerCatalogOnlyIsOverridden:", 0LL);
  -[MAMsuDownloadOptions setRequestedProductVersion:](v5, "setRequestedProductVersion:", 0LL);
  -[MAMsuDownloadOptions setDelayPeriod:](v5, "setDelayPeriod:", 0LL);
  -[MAMsuDownloadOptions setSupervised:](v5, "setSupervised:", 0LL);
  -[MAMsuDownloadOptions setPrerequisiteBuildVersion:](v5, "setPrerequisiteBuildVersion:", 0LL);
  -[MAMsuDownloadOptions setPrerequisiteProductVersion:](v5, "setPrerequisiteProductVersion:", 0LL);
  -[MAMsuDownloadOptions setPrerequisiteReleaseType:](v5, "setPrerequisiteReleaseType:", 0LL);
  -[MAMsuDownloadOptions setPrerequisiteReleaseTypeIsOverridden:](v5, "setPrerequisiteReleaseTypeIsOverridden:", 0LL);
  -[MAMsuDownloadOptions setLiveAssetAudienceUUID:](v5, "setLiveAssetAudienceUUID:", 0LL);
  -[MAMsuDownloadOptions setPurpose:](v5, "setPurpose:", @"auto");
  int v18 = (void *)objc_claimAutoreleasedReturnValue(-[MAMsuDownloadOptions additionalServerParams](v5, "additionalServerParams"));
  [v18 setSafeObject:@"true" forKey:@"RequestingMAAutoAsset"];

  if (!-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MAMsuDownloadOptions additionalServerParams](v5, "additionalServerParams"));
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
    id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 assetSpecifier]);
    [v19 setSafeObject:v21 forKey:@"AssetSpecifier"];

    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 assetVersion]);

    if (v23)
    {
      id v24 = (void *)objc_claimAutoreleasedReturnValue(-[MAMsuDownloadOptions additionalServerParams](v5, "additionalServerParams"));
      id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
      id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 assetVersion]);
      [v24 setSafeObject:v26 forKey:@"RequestedAssetVersion"];
    }

    id v27 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob latestInstalledOnFilesystem](self, "latestInstalledOnFilesystem"));
    -[MADAutoAssetJob setBaseForPatch:](self, "setBaseForPatch:", v27);

    id v28 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob baseForPatch](self, "baseForPatch"));
    if (v28)
    {
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob baseForPatch](self, "baseForPatch"));
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v29 assetVersion]);
      -[MADAutoAssetJob setLatestInstalledAssetVersion:](self, "setLatestInstalledAssetVersion:", v30);

      id v31 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob baseForPatch](self, "baseForPatch"));
      uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 build]);
      -[MADAutoAssetJob setLatestInstalledAssetBuild:](self, "setLatestInstalledAssetBuild:", v32);

      unsigned __int8 v33 = (void *)objc_claimAutoreleasedReturnValue(-[MAMsuDownloadOptions additionalServerParams](v5, "additionalServerParams"));
      id v34 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob latestInstalledAssetVersion](self, "latestInstalledAssetVersion"));
      [v33 setSafeObject:v34 forKey:@"InstalledAssetVersion"];

      unsigned __int8 v35 = (void *)objc_claimAutoreleasedReturnValue(-[MAMsuDownloadOptions additionalServerParams](v5, "additionalServerParams"));
      BOOL v36 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob latestInstalledAssetBuild](self, "latestInstalledAssetBuild"));
      [v35 setSafeObject:v36 forKey:@"InstalledAssetBuild"];
    }
  }

  -[MAMsuDownloadOptions setAllowSameVersion:]( v5,  "setAllowSameVersion:",  -[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"));
  if (!-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    uint64_t v37 = objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob baseForPatch](self, "baseForPatch"));
    if (v37)
    {
      __int128 v38 = (void *)v37;
      unsigned int v39 = -[MADAutoAssetJob determiningAssetContent](self, "determiningAssetContent");

      if (v39) {
        -[MAMsuDownloadOptions setAllowSameVersion:](v5, "setAllowSameVersion:", 1LL);
      }
    }
  }

  id v40 = (void *)objc_claimAutoreleasedReturnValue(-[MAMsuDownloadOptions additionalServerParams](v5, "additionalServerParams"));
  else {
    id v41 = @"false";
  }
  [v40 setSafeObject:v41 forKey:@"AllowSameBuildVersion"];

  uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(-[MAMsuDownloadOptions additionalServerParams](v5, "additionalServerParams"));
  else {
    uint64_t v43 = @"false";
  }
  [v42 setSafeObject:v43 forKey:@"AllowSameAssetVersion"];

  __int128 v44 = (void *)objc_claimAutoreleasedReturnValue(-[MAMsuDownloadOptions additionalServerParams](v5, "additionalServerParams"));
  unsigned int v45 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDevice sharedDevice](&OBJC_CLASS___SUCoreDevice, "sharedDevice"));
  id v46 = (void *)objc_claimAutoreleasedReturnValue([v45 productVersion]);
  [v44 setSafeObject:v46 forKey:@"OSVersion"];

  id v47 = (void *)objc_claimAutoreleasedReturnValue(-[MAMsuDownloadOptions additionalServerParams](v5, "additionalServerParams"));
  id v48 = (void *)objc_claimAutoreleasedReturnValue(+[SUCoreDevice sharedDevice](&OBJC_CLASS___SUCoreDevice, "sharedDevice"));
  id v49 = (void *)objc_claimAutoreleasedReturnValue([v48 productVersion]);
  [v47 setSafeObject:v49 forKey:@"ProductVersion"];

  if (-[MADAutoAssetJob stagerJob](self, "stagerJob"))
  {
    id v50 = (void *)objc_claimAutoreleasedReturnValue(-[MAMsuDownloadOptions additionalServerParams](v5, "additionalServerParams"));
    [v50 setSafeObject:@"true" forKey:@"IsPreSoftwareUpdateStaging"];

    id v51 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob stagerAssetTargetOSVersion](self, "stagerAssetTargetOSVersion"));
    if (v51)
    {
      id v52 = (void *)objc_claimAutoreleasedReturnValue(-[MAMsuDownloadOptions additionalServerParams](v5, "additionalServerParams"));
      uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob stagerAssetTargetOSVersion](self, "stagerAssetTargetOSVersion"));
      [v52 setSafeObject:v53 forKey:@"OSVersion"];
    }

    else
    {
      id v52 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
      uint64_t v53 = (void *)objc_claimAutoreleasedReturnValue([v52 diag]);
      [v53 trackAnomaly:@"AUTO-JOB(STAGER)" forReason:@"{newCatalogDownloadOptions} no stagerAssetTargetOSVersion" withResult:6111 withError:0];
    }

    __int128 v54 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob stagerAssetTargetBuildVersion](self, "stagerAssetTargetBuildVersion"));
    if (v54)
    {
      __int128 v55 = (void *)objc_claimAutoreleasedReturnValue(-[MAMsuDownloadOptions additionalServerParams](v5, "additionalServerParams"));
      __int128 v56 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob stagerAssetTargetBuildVersion](self, "stagerAssetTargetBuildVersion"));
      [v55 setSafeObject:v56 forKey:@"BuildVersion"];
    }

    else
    {
      __int128 v55 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
      __int128 v56 = (void *)objc_claimAutoreleasedReturnValue([v55 diag]);
      [v56 trackAnomaly:@"AUTO-JOB(STAGER)" forReason:@"{newCatalogDownloadOptions} no stagerAssetTargetBuildVersion" withResult:6111 withError:0];
    }

    __int128 v57 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob stagerAssetTargetTrainName](self, "stagerAssetTargetTrainName"));
    if (v57)
    {
      id v58 = (void *)objc_claimAutoreleasedReturnValue(-[MAMsuDownloadOptions additionalServerParams](v5, "additionalServerParams"));
      uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob stagerAssetTargetTrainName](self, "stagerAssetTargetTrainName"));
      [v58 setSafeObject:v59 forKey:@"TrainName"];
    }

    uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob stagerAssetTargetRestoreVersion](self, "stagerAssetTargetRestoreVersion"));

    if (v60)
    {
      __int128 v61 = (void *)objc_claimAutoreleasedReturnValue(-[MAMsuDownloadOptions additionalServerParams](v5, "additionalServerParams"));
      __int16 v62 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob stagerAssetTargetRestoreVersion](self, "stagerAssetTargetRestoreVersion"));
      [v61 setSafeObject:v62 forKey:@"RestoreVersion"];
    }
  }

  __int128 v63 = (void *)objc_claimAutoreleasedReturnValue(-[MAMsuDownloadOptions additionalServerParams](v5, "additionalServerParams"));
  id v64 = supportedAssetFormatsArray();
  __int128 v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
  [v63 setSafeObject:v65 forKey:@"SupportedAssetFormats"];

  return v5;
}

- (id)newAssetDownloadOptions
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 extendedStateQueue]);
  dispatch_assert_queue_V2(v4);

  id v5 = objc_alloc_init(&OBJC_CLASS___MAMsuDownloadOptions);
  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[MAMsuDownloadOptions setAdditionalServerParams:](v5, "setAdditionalServerParams:", v6);

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob checkUUID](self, "checkUUID"));
  -[MAMsuDownloadOptions setSessionId:](v5, "setSessionId:", v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MAMsuDownloadOptions additionalServerParams](v5, "additionalServerParams"));
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob checkUUID](self, "checkUUID"));
  [v8 setSafeObject:v9 forKey:@"SessionId"];

  -[MAMsuDownloadOptions setDiscretionary:](v5, "setDiscretionary:", 1LL);
  if (-[MADAutoAssetJob boostedToUserInitiated](self, "boostedToUserInitiated")
    || -[MADAutoAssetJob downloadingUserInitiated](self, "downloadingUserInitiated"))
  {
    -[MAMsuDownloadOptions setDiscretionary:](v5, "setDiscretionary:", 0LL);
  }

  else
  {
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientAssetPolicy](self, "aggregatedClientAssetPolicy"));

    if (v17)
    {
      int v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientAssetPolicy](self, "aggregatedClientAssetPolicy"));
      -[MAMsuDownloadOptions setDiscretionary:]( v5,  "setDiscretionary:",  [v18 userInitiated] ^ 1);
    }
  }

  if (-[MADAutoAssetJob schedulerTriggerReceived](self, "schedulerTriggerReceived")
    && -[MAMsuDownloadOptions discretionary](v5, "discretionary")
    && +[MADAutoAssetControlManager preferenceScheduledAlwaysNonDiscretionary]( &OBJC_CLASS___MADAutoAssetControlManager,  "preferenceScheduledAlwaysNonDiscretionary"))
  {
    -[MAMsuDownloadOptions setDiscretionary:](v5, "setDiscretionary:", 0LL);
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 oslog]);

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
      *(_DWORD *)id v40 = 138543362;
      *(void *)&v40[4] = v12;
      _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {newAssetDownloadOptions} overriding scheduled job to be non-discretionary",  v40,  0xCu);
    }
  }

  if ((-[MAMsuDownloadOptions discretionary](v5, "discretionary") & 1) == 0)
  {
    -[MADAutoAssetJob setBoostedToUserInitiated:](self, "setBoostedToUserInitiated:", 1LL);
    -[MADAutoAssetJob latchWhetherDownloadingUserInitiated](self, "latchWhetherDownloadingUserInitiated");
    if (-[MADAutoAssetJob stagerJob](self, "stagerJob"))
    {
      if ((objc_opt_respondsToSelector(v5, "disableUI") & 1) != 0)
      {
        if (__isPlatformVersionAtLeast(3, 17, 0, 0))
        {
          -[MAMsuDownloadOptions setDisableUI:](v5, "setDisableUI:", 1LL);
          id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 oslog]);

          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
            *(_DWORD *)id v40 = 138543362;
            *(void *)&v40[4] = v15;
            id v16 = "%{public}@ | {newAssetDownloadOptions} pre-SU-staging download | UI disabled";
LABEL_22:
            _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, v16, v40, 0xCu);
          }
        }

        else
        {
          __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
          id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v20 oslog]);

          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
            *(_DWORD *)id v40 = 138543362;
            *(void *)&v40[4] = v15;
            id v16 = "%{public}@ | {newAssetDownloadOptions} pre-SU-staging download | support for UI disabled not available";
            goto LABEL_22;
          }
        }
      }

      else
      {
        id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 oslog]);

        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
          *(_DWORD *)id v40 = 138543362;
          *(void *)&v40[4] = v15;
          id v16 = "%{public}@ | {newAssetDownloadOptions} pre-SU-staging download | no selector (disableUI) so unable to in"
                "dicate UI disabled";
          goto LABEL_22;
        }
      }
    }
  }

  if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob", *(_OWORD *)v40))
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientSetPolicy](self, "aggregatedClientSetPolicy"));
    -[MAMsuDownloadOptions setAllowsCellularAccess:]( v5,  "setAllowsCellularAccess:",  [v21 allowCheckDownloadOverCellular]);

    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientSetPolicy](self, "aggregatedClientSetPolicy"));
    -[MAMsuDownloadOptions setAllowsExpensiveAccess:]( v5,  "setAllowsExpensiveAccess:",  [v22 allowCheckDownloadOverExpensive]);

    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientSetPolicy](self, "aggregatedClientSetPolicy"));
    -[MAMsuDownloadOptions setRequiresPowerPluggedIn:]( v5,  "setRequiresPowerPluggedIn:",  [v23 allowCheckDownloadOnBattery] ^ 1);
  }

  else
  {
    -[MAMsuDownloadOptions setAllowsCellularAccess:](v5, "setAllowsCellularAccess:", 1LL);
    -[MAMsuDownloadOptions setAllowsExpensiveAccess:](v5, "setAllowsExpensiveAccess:", 1LL);
    -[MAMsuDownloadOptions setRequiresPowerPluggedIn:](v5, "setRequiresPowerPluggedIn:", 0LL);
  }

  -[MAMsuDownloadOptions setCanUseLocalCacheServer:](v5, "setCanUseLocalCacheServer:", 1LL);
  -[MAMsuDownloadOptions setPrefersInfraWiFi:](v5, "setPrefersInfraWiFi:", 1LL);
  if (!-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    id v30 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v30 downloadDecryptionKey]);
    -[MAMsuDownloadOptions setDecryptionKey:](v5, "setDecryptionKey:", v37);
    goto LABEL_35;
  }

  unint64_t v24 = -[MADAutoAssetJob nextSetSpecifierToDownload](self, "nextSetSpecifierToDownload");
  id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob setConfiguration](self, "setConfiguration"));
  id v26 = (void *)objc_claimAutoreleasedReturnValue([v25 autoAssetEntries]);
  id v27 = [v26 count];

  if (v24 >= (unint64_t)v27)
  {
    id v30 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue([v30 diag]);
    [v37 trackAnomaly:@"AUTO-SET-JOB" forReason:@"newAssetDownloadOptions for set-job yet no nextSetSpecifierToDownload | potentialUUID:%@|basePortion:%@" withResult:6103 withError:0];
    goto LABEL_35;
  }

  id v28 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob setConfiguration](self, "setConfiguration"));
  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 autoAssetEntries]);
  id v30 = (void *)objc_claimAutoreleasedReturnValue( objc_msgSend( v29,  "objectAtIndex:",  -[MADAutoAssetJob nextSetSpecifierToDownload](self, "nextSetSpecifierToDownload")));

  id v31 = (void *)objc_claimAutoreleasedReturnValue([v30 assetSelector]);
  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 downloadDecryptionKey]);
  -[MAMsuDownloadOptions setDecryptionKey:](v5, "setDecryptionKey:", v32);

  unsigned __int8 v33 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob latestInstalledAssetVersion](self, "latestInstalledAssetVersion"));
  if (v33)
  {
    id v34 = (void *)objc_claimAutoreleasedReturnValue(-[MAMsuDownloadOptions additionalServerParams](v5, "additionalServerParams"));
    unsigned __int8 v35 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob latestInstalledAssetVersion](self, "latestInstalledAssetVersion"));
    [v34 setSafeObject:v35 forKey:@"InstalledAssetVersion"];
  }

  BOOL v36 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob latestInstalledAssetBuild](self, "latestInstalledAssetBuild"));

  if (v36)
  {
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[MAMsuDownloadOptions additionalServerParams](v5, "additionalServerParams"));
    __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob latestInstalledAssetBuild](self, "latestInstalledAssetBuild"));
    [v37 setSafeObject:v38 forKey:@"InstalledAssetBuild"];

LABEL_35:
  }

  -[MAMsuDownloadOptions setPurpose:](v5, "setPurpose:", @"auto");
  return v5;
}

- (id)newSessionID
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 extendedStateQueue]);
  dispatch_assert_queue_V2(v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);

  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob checkUUIDBasePortion](self, "checkUUIDBasePortion"));
  if (!v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 UUIDString]);

    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "substringWithRange:", 0, (char *)objc_msgSend(v9, "length") - 3));
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetControlManager preferenceSessionIDBase]( &OBJC_CLASS___MADAutoAssetControlManager,  "preferenceSessionIDBase"));
    id v12 = v11;
    if (v11 && [v11 length] == (char *)&dword_0 + 3)
    {
      id v13 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@%@", v10, v12);
      -[MADAutoAssetJob setCheckUUIDBasePortion:](self, "setCheckUUIDBasePortion:", v13);

      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v14 oslog]);

      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
        uint64_t v17 = (NSString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob checkUUIDBasePortion](self, "checkUUIDBasePortion"));
        *(_DWORD *)int buf = 138543618;
        uint64_t v37 = v16;
        __int16 v38 = 2114;
        unsigned int v39 = v17;
        int v18 = "%{public}@ | {newSessionID} created base portion for session ID (low-order digits from preferences) | base"
              "Portion:%{public}@";
LABEL_8:
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_DEFAULT, v18, buf, 0x16u);
      }
    }

    else
    {
      -[MADAutoAssetJob setCheckUUIDBasePortion:](self, "setCheckUUIDBasePortion:", v9);
      id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 oslog]);

      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
        uint64_t v17 = (NSString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob checkUUIDBasePortion](self, "checkUUIDBasePortion"));
        *(_DWORD *)int buf = 138543618;
        uint64_t v37 = v16;
        __int16 v38 = 2114;
        unsigned int v39 = v17;
        int v18 = "%{public}@ | {newSessionID} created base portion for session ID | basePortion:%{public}@";
        goto LABEL_8;
      }
    }
  }

  if ((unint64_t)[v6 length] < 4
    || (__int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob checkUUIDBasePortion](self, "checkUUIDBasePortion")),
        id v21 = [v20 length],
        v20,
        (unint64_t)v21 < 4))
  {
    id v27 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
    id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 diag]);
    uint64_t v29 = objc_alloc(&OBJC_CLASS___NSString);
    id v30 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob checkUUIDBasePortion](self, "checkUUIDBasePortion"));
    id v31 = -[NSString initWithFormat:]( v29,  "initWithFormat:",  @"unable to blend UUID | potentialUUID:%@|basePortion:%@",  v6,  v30);
    [v28 trackAnomaly:@"AUTO-JOB:SESSION_ID" forReason:v31 withResult:6103 withError:0];

    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
    id v26 = (NSString *)objc_claimAutoreleasedReturnValue([v22 UUIDString]);
  }

  else
  {
    __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringWithRange:", 0, (char *)objc_msgSend(v6, "length") - 3));
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob checkUUIDBasePortion](self, "checkUUIDBasePortion"));
    unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob checkUUIDBasePortion](self, "checkUUIDBasePortion"));
    id v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "substringWithRange:", (char *)objc_msgSend(v24, "length") - 3, 3));

    id v26 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@%@", v22, v25);
  }

  uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
  unsigned __int8 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue([v32 oslog]);

  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    id v34 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
    *(_DWORD *)int buf = 138543618;
    uint64_t v37 = v34;
    __int16 v38 = 2114;
    unsigned int v39 = v26;
    _os_log_impl(&dword_0, v33, OS_LOG_TYPE_DEFAULT, "%{public}@ | {newSessionID} new sessionID:%{public}@", buf, 0x16u);
  }

  return v26;
}

- (BOOL)isMorePreferredFormat:(id)a3 comparedTo:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue([a3 assetFormat]);
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v5 assetFormat]);

  BOOL v8 = +[MADAutoAssetDescriptor isMorePreferredAssetFormat:comparedTo:]( &OBJC_CLASS___MADAutoAssetDescriptor,  "isMorePreferredAssetFormat:comparedTo:",  v6,  v7);
  return v8;
}

- (BOOL)preferenceAsIfRampOrUse:(BOOL)a3
{
  unsigned __int8 v4 = +[MADAutoAssetControlManager preferenceAsIfRampOrUse:]( &OBJC_CLASS___MADAutoAssetControlManager,  "preferenceAsIfRampOrUse:",  a3);
  return v4 & ~-[MADAutoAssetJob stagerJob](self, "stagerJob");
}

- (void)adoptCachedLookupResult:(id)a3
{
  id v16 = a3;
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 extendedStateQueue]);
  dispatch_assert_queue_V2(v5);

  if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v16 safeStringForKey:@"CachedAssetSetId"]);
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
    [v7 setCatalogCachedAssetSetID:v6];

    BOOL v8 = objc_alloc(&OBJC_CLASS___NSURL);
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v16 safeStringForKey:@"DownloadedFromLive"]);
    unsigned __int8 v10 = -[NSURL initWithString:](v8, "initWithString:", v9);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
    [v11 setCatalogDownloadedFromLive:v10];

    id v12 = (void *)objc_claimAutoreleasedReturnValue([v16 safeDateForKey:@"lastTimeChecked"]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
    [v13 setCatalogLastTimeChecked:v12];

    id v14 = (void *)objc_claimAutoreleasedReturnValue([v16 safeDateForKey:@"postedDate"]);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetDescriptor](self, "autoAssetSetDescriptor"));
    [v15 setCatalogPostedDate:v14];

    -[MADAutoAssetJob newFoundSetDescriptorsFromCachedLookup:](self, "newFoundSetDescriptorsFromCachedLookup:", v16);
  }
}

- (void)obtainLookupGrant
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  unsigned __int8 v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 extendedStateQueue]);
  dispatch_assert_queue_V2(v4);

  id v6 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetUUID](self, "autoAssetUUID"));
  +[MADAutoAssetControlManager autoAssetJobObtainLookupGrant:forAutoAssetUUID:fromAutoAssetJob:]( &OBJC_CLASS___MADAutoAssetControlManager,  "autoAssetJobObtainLookupGrant:forAutoAssetUUID:fromAutoAssetJob:",  v6,  v5,  self);
}

- (void)releaseLookupGrant
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  unsigned __int8 v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 extendedStateQueue]);
  dispatch_assert_queue_V2(v4);

  if (-[MADAutoAssetJob holdingLookupGrant](self, "holdingLookupGrant"))
  {
    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetUUID](self, "autoAssetUUID"));
    +[MADAutoAssetControlManager autoAssetJobReleaseLookupGrant:forAutoAssetUUID:fromAutoAssetJob:]( &OBJC_CLASS___MADAutoAssetControlManager,  "autoAssetJobReleaseLookupGrant:forAutoAssetUUID:fromAutoAssetJob:",  v5,  v6,  self);

    -[MADAutoAssetJob setHoldingLookupGrant:](self, "setHoldingLookupGrant:", 0LL);
  }

- (void)requestDownloadManagerCatalogLookup:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  __int16 v94 = self;
  if ((char *)-[MADAutoAssetJob simulateOperation](self, "simulateOperation") == (char *)&dword_0 + 1)
  {
    unsigned int v7 = v4;
    -[MADAutoAssetJob setSimulateTriggered:]( self,  "setSimulateTriggered:",  -[MADAutoAssetJob simulateOperation](self, "simulateOperation"));
    char v8 = objc_opt_respondsToSelector(&OBJC_CLASS___MANAutoAssetInfoControl, "nameOfSimulateOperation:");
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
    unsigned __int8 v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 oslog]);

    id v11 = v10;
    BOOL v12 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if ((v8 & 1) != 0)
    {
      if (v12)
      {
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
        id v14 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetInfoControl nameOfSimulateOperation:]( &OBJC_CLASS___MANAutoAssetInfoControl,  "nameOfSimulateOperation:",  -[MADAutoAssetJob simulateOperation](self, "simulateOperation")));
        *(_DWORD *)int buf = 138543874;
        unsigned __int8 v115 = v13;
        __int16 v116 = 2114;
        id v117 = v4;
        __int16 v118 = 2114;
        int64_t v119 = (int64_t)v14;
        _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ {%{public}@:requestDownloadManagerCatalogLookup} | SIMULATE_OPERATION(%{public}@) | call to registe rCatalogDownloadJob postponed",  buf,  0x20u);
      }
    }

    else if (v12)
    {
      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
      *(_DWORD *)int buf = 138543874;
      unsigned __int8 v115 = v21;
      __int16 v116 = 2114;
      id v117 = v4;
      __int16 v118 = 2048;
      int64_t v119 = -[MADAutoAssetJob simulateOperation](self, "simulateOperation");
      _os_log_impl( &dword_0,  v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ {%{public}@:requestDownloadManagerCatalogLookup} | SIMULATE_OPERATION(%lld) | call to registerCatalog DownloadJob postponed",  buf,  0x20u);
    }

    goto LABEL_71;
  }

  id v93 = v4;
  -[MADAutoAssetJob _extendCatalogDownloadOptionsWithAnalyticsData:]( self,  "_extendCatalogDownloadOptionsWithAnalyticsData:",  v4);
  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob catalogDownloadOptions](self, "catalogDownloadOptions"));
  id v16 = objc_alloc(&OBJC_CLASS___NSString);
  if (-[MADAutoAssetJob rampingForeground](self, "rampingForeground")) {
    uint64_t v17 = @"Y";
  }
  else {
    uint64_t v17 = @"N";
  }
  id v100 = v17;
  else {
    int v18 = @"N";
  }
  id v98 = v18;
  id v102 = +[MADAutoAssetControlManager allocIntervalString:]( MADAutoAssetControlManager,  "allocIntervalString:",  [v15 timeoutIntervalForResource]);
  __int16 v92 = v15;
  else {
    id v19 = @"N";
  }
  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob latestInstalledAssetBuild](self, "latestInstalledAssetBuild"));
  if (v20) {
    __int128 v104 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob latestInstalledAssetBuild](self, "latestInstalledAssetBuild"));
  }
  else {
    __int128 v104 = @"NONE";
  }
  __int128 v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob latestInstalledAssetVersion](self, "latestInstalledAssetVersion"));
  if (v22) {
    __int128 v23 = (__CFString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob latestInstalledAssetVersion](self, "latestInstalledAssetVersion"));
  }
  else {
    __int128 v23 = @"NONE";
  }
  unint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob catalogDownloadOptions](self, "catalogDownloadOptions"));
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 analyticsData]);
  if (v25)
  {
    id v26 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob catalogDownloadOptions](self, "catalogDownloadOptions"));
    id v27 = v16;
    id v28 = (void *)objc_claimAutoreleasedReturnValue([v26 analyticsData]);
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 safeSummary]);
    v89 = v19;
    id v30 = v102;
    id v91 = -[NSString initWithFormat:]( v27,  "initWithFormat:",  @"rampForeground:%@, discretionary:%@, timeout:%@, allowSame:%@ | [installed] build:%@, version:%@ | analyticsData:%@",  v100,  v98,  v102,  v89,  v104,  v23,  v29);
  }

  else
  {
    id v90 = v19;
    id v30 = v102;
    id v91 = -[NSString initWithFormat:]( v16,  "initWithFormat:",  @"rampForeground:%@, discretionary:%@, timeout:%@, allowSame:%@ | [installed] build:%@, version:%@ | analyticsData:%@",  v100,  v98,  v102,  v90,  v104,  v23,  @"N");
  }

  if (v22) {
  if (v20)
  }

  id v31 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](v94, "logger"));
  uint64_t v32 = (os_log_s *)objc_claimAutoreleasedReturnValue([v31 oslog]);

  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v33 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](v94, "autoJobName"));
    *(_DWORD *)int buf = 138543874;
    unsigned __int8 v115 = v33;
    __int16 v116 = 2114;
    id v117 = v93;
    __int16 v118 = 2114;
    int64_t v119 = (int64_t)v91;
    _os_log_impl( &dword_0,  v32,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {%{public}@} DM:registerCatalogDownloadJob | options:%{public}@",  buf,  0x20u);
  }

  if (!-[MADAutoAssetJob autoAssetSetJob](v94, "autoAssetSetJob"))
  {
    id DownloadManager = getDownloadManager();
    id v34 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(DownloadManager);
    uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetUUID](v94, "autoAssetUUID"));
    id v79 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](v94, "autoAssetSelector"));
    __int16 v80 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray assetType](v79, "assetType"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](v94, "autoAssetSelector"));
    id v83 = (void *)objc_claimAutoreleasedReturnValue([v82 summary]);
    v84 = v34;
    v85 = v76;
    id v86 = v80;
    v87 = v92;
    goto LABEL_69;
  }

  id v34 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  p_ivars = &MobileAssetKeyManager__metaData.ivars;
  BOOL v36 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[MADAutoAssetJob setLatestAssetDescriptorOnFilesystemBySpecifier:]( v94,  "setLatestAssetDescriptorOnFilesystemBySpecifier:",  v36);

  __int128 v112 = 0u;
  __int128 v113 = 0u;
  __int128 v110 = 0u;
  __int128 v111 = 0u;
  uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob setConfiguration](v94, "setConfiguration"));
  __int16 v38 = (void *)objc_claimAutoreleasedReturnValue([v37 autoAssetEntries]);

  id obj = v38;
  id v101 = [v38 countByEnumeratingWithState:&v110 objects:v123 count:16];
  if (!v101) {
    goto LABEL_65;
  }
  uint64_t v99 = *(void *)v111;
  id v95 = v34;
  do
  {
    for (i = 0LL; i != v101; i = (char *)i + 1)
    {
      if (*(void *)v111 != v99) {
        objc_enumerationMutation(obj);
      }
      id v40 = *(void **)(*((void *)&v110 + 1) + 8LL * (void)i);
      id v41 = (void *)objc_claimAutoreleasedReturnValue([v40 assetSelector]);
      uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetControlManager loadDescriptorsForJobSelector:promotingIfCurrentlyStaged:immediatelyPromotedDescriptor:]( &OBJC_CLASS___MADAutoAssetControlManager,  "loadDescriptorsForJobSelector:promotingIfCurrentlyStaged:immediatelyPromotedDescriptor:",  v41,  0LL,  0LL));

      id v43 = objc_alloc_init((Class)p_ivars[143]);
      __int128 v44 = (void *)objc_claimAutoreleasedReturnValue([v40 assetSelector]);
      unsigned int v45 = (void *)objc_claimAutoreleasedReturnValue([v44 assetSpecifier]);
      [v43 setSafeObject:v45 forKey:@"AssetSpecifier"];

      if (![v42 count]) {
        goto LABEL_63;
      }
      __int128 v103 = i;
      __int128 v105 = v43;
      __int128 v108 = 0u;
      __int128 v109 = 0u;
      __int128 v106 = 0u;
      __int128 v107 = 0u;
      id v46 = v42;
      id v47 = [v46 countByEnumeratingWithState:&v106 objects:v122 count:16];
      if (!v47)
      {
        id v50 = 0LL;
        id v49 = 0LL;
        goto LABEL_61;
      }

      id v48 = v47;
      uint64_t v97 = v42;
      id v49 = 0LL;
      id v50 = 0LL;
      uint64_t v51 = *(void *)v107;
      do
      {
        for (j = 0LL; j != v48; j = (char *)j + 1)
        {
          if (*(void *)v107 != v51) {
            objc_enumerationMutation(v46);
          }
          uint64_t v53 = *(void *)(*((void *)&v106 + 1) + 8LL * (void)j);
          __int128 v54 = objc_autoreleasePoolPush();
          id v55 = [v46 safeObjectForKey:v53 ofClass:objc_opt_class(MADAutoAssetDescriptor)];
          __int128 v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
          __int128 v57 = v56;
          if (!v49)
          {
            id v63 = v56;
            id v64 = objc_alloc(&OBJC_CLASS___SUCoreRestoreVersion);
            id v60 = (id)objc_claimAutoreleasedReturnValue([v63 assetVersion]);
            id v62 = [v64 initWithRestoreVersion:v60];
            goto LABEL_48;
          }

          id v58 = objc_alloc(&OBJC_CLASS___SUCoreRestoreVersion);
          uint64_t v59 = (void *)objc_claimAutoreleasedReturnValue([v57 assetVersion]);
          id v60 = [v58 initWithRestoreVersion:v59];

          if ([v60 isComparable:v50]
            && [v60 compare:v50] == (char *)&dword_0 + 1)
          {
            id v61 = v57;

            id v62 = v60;
            id v60 = v62;
LABEL_48:
            id v65 = v62;

            id v49 = v57;
            id v50 = v65;
          }

          objc_autoreleasePoolPop(v54);
        }

        id v48 = [v46 countByEnumeratingWithState:&v106 objects:v122 count:16];
      }

      while (v48);

      if (v49)
      {
        id v34 = v95;
        uint64_t v42 = v97;
        if (+[MADAutoAssetControlManager jobDescriptorOnFilesystemConfirmed:]( &OBJC_CLASS___MADAutoAssetControlManager,  "jobDescriptorOnFilesystemConfirmed:",  v49))
        {
          __int16 v66 = (void *)objc_claimAutoreleasedReturnValue([v49 assetVersion]);
          [v105 setSafeObject:v66 forKey:@"InstalledAssetVersion"];

          __int128 v67 = (void *)objc_claimAutoreleasedReturnValue([v49 build]);
          [v105 setSafeObject:v67 forKey:@"InstalledAssetBuild"];

          __int128 v68 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetJob latestAssetDescriptorOnFilesystemBySpecifier]( v94,  "latestAssetDescriptorOnFilesystemBySpecifier"));
          __int128 v69 = (void *)objc_claimAutoreleasedReturnValue([v49 assetSpecifier]);
          [v68 setSafeObject:v49 forKey:v69];

          id v70 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](v94, "logger"));
          id v46 = (id)objc_claimAutoreleasedReturnValue([v70 oslog]);

          if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v71 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](v94, "autoJobName"));
            __int16 v72 = (void *)objc_claimAutoreleasedReturnValue([v49 assetVersion]);
            BOOL v73 = (void *)objc_claimAutoreleasedReturnValue([v49 assetSpecifier]);
            *(_DWORD *)int buf = 138544130;
            unsigned __int8 v115 = v71;
            __int16 v116 = 2114;
            id v117 = v93;
            __int16 v118 = 2114;
            int64_t v119 = (int64_t)v72;
            __int16 v120 = 2114;
            unsigned __int8 v121 = v73;
            _os_log_impl( &dword_0,  (os_log_t)v46,  OS_LOG_TYPE_DEFAULT,  "%{public}@ {%{public}@:requestDownloadManagerCatalogLookup} latest version on filesystem | assetVersion:%{ public}@, for assetSpecifier:%{public}@,",  buf,  0x2Au);

            uint64_t v42 = v97;
            goto LABEL_59;
          }
        }

        else
        {
          BOOL v74 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](v94, "logger"));
          id v46 = (id)objc_claimAutoreleasedReturnValue([v74 oslog]);

          if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v71 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](v94, "autoJobName"));
            *(_DWORD *)int buf = 138543874;
            unsigned __int8 v115 = v71;
            __int16 v116 = 2114;
            id v117 = v93;
            __int16 v118 = 2114;
            int64_t v119 = (int64_t)v49;
            _os_log_impl( &dword_0,  (os_log_t)v46,  OS_LOG_TYPE_DEFAULT,  "%{public}@ {%{public}@:requestDownloadManagerCatalogLookup} downloaded descriptor is not really on filesys tem. Not adding to latestAssetDescriptorOnFilesystemBySpecifier list. Descriptor: %{public}@",  buf,  0x20u);
LABEL_59:
          }
        }

        p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
LABEL_61:
      }

      else
      {
        id v34 = v95;
        p_ivars = (__objc2_ivar_list **)(&MobileAssetKeyManager__metaData + 48);
        uint64_t v42 = v97;
      }

      i = v103;
      id v43 = v105;
LABEL_63:
      -[NSMutableArray addObject:](v34, "addObject:", v43);
    }

    id v101 = [obj countByEnumeratingWithState:&v110 objects:v123 count:16];
  }

  while (v101);
LABEL_65:

  BOOL v75 = (void *)objc_claimAutoreleasedReturnValue([v92 additionalServerParams]);
  [v75 setSafeObject:v34 forKey:@"SetElements"];

  uint64_t v76 = (void *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetJob verifyDownloadNotBlockedBySetPolicy:]( v94,  "verifyDownloadNotBlockedBySetPolicy:",  0LL));
  if (v76)
  {
    uint64_t v77 = objc_alloc(&OBJC_CLASS___MADAutoAssetJobParam);
    __int16 v78 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetUUID](v94, "autoAssetUUID"));
    id v79 = -[MADAutoAssetJobParam initForFinishedJobID:withError:](v77, "initForFinishedJobID:withError:", v78, v76);

    __int16 v80 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](v94, "autoJobFSM"));
    [v80 postEvent:@"PolicyBlockCatalogDownload" withInfo:v79];
    goto LABEL_70;
  }

  id v88 = getDownloadManager();
  id v79 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v88);
  __int16 v80 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetUUID](v94, "autoAssetUUID"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetAssetType](v94, "autoAssetSetAssetType"));
  id v83 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetIdentifier](v94, "autoAssetSetIdentifier"));
  v84 = v79;
  v85 = v80;
  id v86 = v82;
  v87 = v92;
LABEL_69:
  -[NSMutableArray registerCatalogDownloadJob:forAssetType:withPurpose:usingDownloadOptions:forAutoAssetName:]( v84,  "registerCatalogDownloadJob:forAssetType:withPurpose:usingDownloadOptions:forAutoAssetName:",  v85,  v86,  @"auto",  v87,  v83);

LABEL_70:
  unsigned int v7 = v93;
  id v11 = (os_log_s *)v92;
LABEL_71:
}

- (id)autoAssetSetAssetType
{
  p_setConfiguration = &self->_setConfiguration;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration autoAssetEntries](self->_setConfiguration, "autoAssetEntries"));
  id v5 = (char *)[v4 count];

  if ((uint64_t)v5 < 1)
  {
LABEL_11:
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SUCoreLog oslog](self->_logger, "oslog"));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[MADAutoAssetJob autoAssetSetAssetType].cold.1((id *)p_setConfiguration);
    }

    unsigned int v7 = @"UNKNOWN_SET_ASSET_TYPE";
    return v7;
  }

  unsigned int v7 = 0LL;
  char v8 = 0LL;
  *(void *)&__int128 v6 = 138543618LL;
  __int128 v19 = v6;
  do
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoSetConfiguration autoAssetEntries](*p_setConfiguration, "autoAssetEntries", v19));
    unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndex:v8]);

    if (v7)
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 assetSelector]);
      BOOL v12 = (void *)objc_claimAutoreleasedReturnValue([v11 assetType]);
      unsigned __int8 v13 = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v12, v7);

      if ((v13 & 1) != 0) {
        goto LABEL_9;
      }
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[SUCoreLog oslog](self->_logger, "oslog"));
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v10 assetSelector]);
        id v16 = (void *)objc_claimAutoreleasedReturnValue([v15 assetType]);
        *(_DWORD *)int buf = v19;
        id v21 = v16;
        __int16 v22 = 2114;
        __int128 v23 = v7;
        _os_log_error_impl( &dword_0,  v14,  OS_LOG_TYPE_ERROR,  "{autoAssetSetAssetType} additional assetType:%{public}@ | using first encountered:%{public}@",  buf,  0x16u);
      }
    }

    else
    {
      id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 assetSelector]);
      unsigned int v7 = (__CFString *)objc_claimAutoreleasedReturnValue(-[os_log_s assetType](v14, "assetType"));
    }

LABEL_9:
    ++v8;
  }

  while (v5 != v8);
  if (!v7) {
    goto LABEL_11;
  }
  return v7;
}

- (void)requestDownloadManagerAssetDownload:(id)a3 forDescriptor:(id)a4 withBaseForPatch:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  BOOL v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v11 extendedStateQueue]);
  dispatch_assert_queue_V2(v12);

  int64_t v13 = -[MADAutoAssetJob simulateOperation](self, "simulateOperation");
  int64_t v14 = -[MADAutoAssetJob simulateOperation](self, "simulateOperation");
  if (v13 != 2)
  {
    if (v10 && v14 == 5)
    {
      char v21 = objc_opt_respondsToSelector(&OBJC_CLASS___MANAutoAssetInfoControl, "nameOfSimulateOperation:");
      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
      __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v22 oslog]);

      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
      if ((v21 & 1) != 0)
      {
        if (v24)
        {
          id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
          id v26 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetInfoControl nameOfSimulateOperation:]( &OBJC_CLASS___MANAutoAssetInfoControl,  "nameOfSimulateOperation:",  -[MADAutoAssetJob simulateOperation](self, "simulateOperation")));
          *(_DWORD *)int buf = 138543874;
          id v70 = v25;
          __int16 v71 = 2114;
          id v72 = v8;
          __int16 v73 = 2114;
          int64_t v74 = (int64_t)v26;
          id v27 = "%{public}@ {%{public}@:requestDownloadManagerAssetDownload} | SIMULATE_OPERATION(%{public}@) | not start"
                "ing patch download - immediate simulateEnd";
LABEL_17:
          _os_log_impl(&dword_0, v23, OS_LOG_TYPE_DEFAULT, v27, buf, 0x20u);

          goto LABEL_30;
        }

        goto LABEL_30;
      }

      if (!v24) {
        goto LABEL_30;
      }
      uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
      *(_DWORD *)int buf = 138543874;
      id v70 = v37;
      __int16 v71 = 2114;
      id v72 = v8;
      __int16 v73 = 2048;
      int64_t v74 = -[MADAutoAssetJob simulateOperation](self, "simulateOperation");
      __int16 v38 = "%{public}@ {%{public}@:requestDownloadManagerAssetDownload} | SIMULATE_OPERATION(%lld) | not starting patch "
            "download - immediate simulateEnd";
      goto LABEL_29;
    }

    if ((char *)-[MADAutoAssetJob simulateOperation](self, "simulateOperation", v14) == (char *)&dword_8 + 1)
    {
      char v29 = objc_opt_respondsToSelector(&OBJC_CLASS___MANAutoAssetInfoControl, "nameOfSimulateOperation:");
      id v30 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
      __int128 v23 = (os_log_s *)objc_claimAutoreleasedReturnValue([v30 oslog]);

      BOOL v31 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
      if ((v29 & 1) != 0)
      {
        if (v31)
        {
          id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
          id v26 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetInfoControl nameOfSimulateOperation:]( &OBJC_CLASS___MANAutoAssetInfoControl,  "nameOfSimulateOperation:",  -[MADAutoAssetJob simulateOperation](self, "simulateOperation")));
          *(_DWORD *)int buf = 138543874;
          id v70 = v25;
          __int16 v71 = 2114;
          id v72 = v8;
          __int16 v73 = 2114;
          int64_t v74 = (int64_t)v26;
          id v27 = "%{public}@ {%{public}@:requestDownloadManagerAssetDownload} | SIMULATE_OPERATION(%{public}@) | not start"
                "ing asset download - immediate simulateEnd";
          goto LABEL_17;
        }

- (void)requestDownloadManagerConfigDownload:(id)a3 forDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 extendedStateQueue]);
  dispatch_assert_queue_V2(v9);

  if ((char *)-[MADAutoAssetJob simulateOperation](self, "simulateOperation") == (char *)&dword_0 + 3)
  {
    -[MADAutoAssetJob setSimulateTriggered:]( self,  "setSimulateTriggered:",  -[MADAutoAssetJob simulateOperation](self, "simulateOperation"));
    -[MADAutoAssetJob setSimulateDescriptor:](self, "setSimulateDescriptor:", v7);
    char v10 = objc_opt_respondsToSelector(&OBJC_CLASS___MANAutoAssetInfoControl, "nameOfSimulateOperation:");
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
    BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 oslog]);

    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if ((v10 & 1) != 0)
    {
      if (v13)
      {
        int64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
        char v15 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetInfoControl nameOfSimulateOperation:]( &OBJC_CLASS___MANAutoAssetInfoControl,  "nameOfSimulateOperation:",  -[MADAutoAssetJob simulateOperation](self, "simulateOperation")));
        *(_DWORD *)int buf = 138543874;
        id v46 = v14;
        __int16 v47 = 2114;
        id v48 = v6;
        __int16 v49 = 2114;
        int64_t v50 = (int64_t)v15;
        _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@ {%{public}@:requestDownloadManagerConfigDownload} | SIMULATE_OPERATION(%{public}@) | call to config AssetDownloadJob postponed",  buf,  0x20u);
      }
    }

    else if (v13)
    {
      id v26 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
      *(_DWORD *)int buf = 138543874;
      id v46 = v26;
      __int16 v47 = 2114;
      id v48 = v6;
      __int16 v49 = 2048;
      int64_t v50 = -[MADAutoAssetJob simulateOperation](self, "simulateOperation");
      _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@ {%{public}@:requestDownloadManagerConfigDownload} | SIMULATE_OPERATION(%lld) | call to configAssetDow nloadJob postponed",  buf,  0x20u);
    }
  }

  else
  {
    id v44 = v6;
    BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assetDownloadOptions](self, "assetDownloadOptions"));
    uint64_t v42 = objc_alloc_init(&OBJC_CLASS___MADownloadConfig);
    -[MADownloadConfig setDiscretionary:](v42, "setDiscretionary:", -[os_log_s discretionary](v12, "discretionary"));
    id v16 = objc_alloc(&OBJC_CLASS___NSString);
    uint64_t v17 = @"Y";
    BOOL v18 = v7;
    else {
      __int128 v19 = @"N";
    }
    id v20 = +[MADAutoAssetControlManager allocIntervalString:]( &OBJC_CLASS___MADAutoAssetControlManager,  "allocIntervalString:",  -[os_log_s timeoutIntervalForResource](v12, "timeoutIntervalForResource"));
    id v43 = v18;
    char v21 = (void *)objc_claimAutoreleasedReturnValue([v18 assetId]);
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s decryptionKey](v12, "decryptionKey"));
    if (!v22) {
      uint64_t v17 = @"N";
    }
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s sourceDirectory](v12, "sourceDirectory"));
    if (v23)
    {
      BOOL v24 = (void *)objc_claimAutoreleasedReturnValue(-[os_log_s sourceDirectory](v12, "sourceDirectory"));
      id v25 = -[NSString initWithFormat:]( v16,  "initWithFormat:",  @"discretionary:%@, timeout:%@ | assetId:%@ | decrypt:%@, source:%@",  v19,  v20,  v21,  v17,  v24);
    }

    else
    {
      id v25 = -[NSString initWithFormat:]( v16,  "initWithFormat:",  @"discretionary:%@, timeout:%@ | assetId:%@ | decrypt:%@, source:%@",  v19,  v20,  v21,  v17,  @"N");
    }

    id v7 = v43;
    if (-[MADownloadConfig discretionary](v42, "discretionary"))
    {
      id v27 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 diag]);
      char v29 = objc_alloc(&OBJC_CLASS___NSString);
      id v30 = (void *)objc_claimAutoreleasedReturnValue([v43 summary]);
      BOOL v31 = -[NSString initWithFormat:]( v29,  "initWithFormat:",  @"request DownloadManager configuration change to discretionary | downloadAssetDescriptor:%@",  v30);
      [v28 trackAnomaly:@"AUTO-JOB:CONFIG_DOWNLOAD" forReason:v31 withResult:6108 withError:0];
    }

    uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
    unsigned __int8 v33 = (os_log_s *)objc_claimAutoreleasedReturnValue([v32 oslog]);

    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      id v34 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
      *(_DWORD *)int buf = 138543874;
      id v46 = v34;
      __int16 v47 = 2114;
      id v48 = v44;
      __int16 v49 = 2114;
      int64_t v50 = (int64_t)v25;
      _os_log_impl( &dword_0,  v33,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {%{public}@} DM:configAssetDownloadJob | downloadOptions:%{public}@",  buf,  0x20u);
    }

    id DownloadManager = getDownloadManager();
    BOOL v36 = (void *)objc_claimAutoreleasedReturnValue(DownloadManager);
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetUUID](self, "autoAssetUUID"));
    __int16 v38 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
    unsigned int v39 = (void *)objc_claimAutoreleasedReturnValue([v38 assetType]);
    id v40 = (void *)objc_claimAutoreleasedReturnValue([v43 assetId]);
    id v41 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob clientName](self, "clientName"));
    [v36 configAssetDownloadJob:v37 forAssetType:v39 withPurpose:@"auto" matchingAssetId:v40 usingDownloadConfig:v42 forAutoAssetName:v41];

    id v6 = v44;
  }
}

- (void)requestDownloadManagerCancelDownload:(id)a3 forDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 extendedStateQueue]);
  dispatch_assert_queue_V2(v9);

  if ((int *)-[MADAutoAssetJob simulateOperation](self, "simulateOperation") == &dword_4)
  {
    -[MADAutoAssetJob setSimulateTriggered:]( self,  "setSimulateTriggered:",  -[MADAutoAssetJob simulateOperation](self, "simulateOperation"));
    -[MADAutoAssetJob setSimulateDescriptor:](self, "setSimulateDescriptor:", v7);
    char v10 = objc_opt_respondsToSelector(&OBJC_CLASS___MANAutoAssetInfoControl, "nameOfSimulateOperation:");
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
    BOOL v12 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 oslog]);

    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if ((v10 & 1) != 0)
    {
      if (v13)
      {
        int64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
        char v15 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetInfoControl nameOfSimulateOperation:]( &OBJC_CLASS___MANAutoAssetInfoControl,  "nameOfSimulateOperation:",  -[MADAutoAssetJob simulateOperation](self, "simulateOperation")));
        int v27 = 138543874;
        id v28 = v14;
        __int16 v29 = 2114;
        id v30 = v6;
        __int16 v31 = 2114;
        int64_t v32 = (int64_t)v15;
        _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@ {%{public}@:requestDownloadManagerCancelDownload} | SIMULATE_OPERATION(%{public}@) | call to cancel AssetDownloadJob postponed",  (uint8_t *)&v27,  0x20u);
      }
    }

    else if (v13)
    {
      id v26 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
      int v27 = 138543874;
      id v28 = v26;
      __int16 v29 = 2114;
      id v30 = v6;
      __int16 v31 = 2048;
      int64_t v32 = -[MADAutoAssetJob simulateOperation](self, "simulateOperation");
      _os_log_impl( &dword_0,  v12,  OS_LOG_TYPE_DEFAULT,  "%{public}@ {%{public}@:requestDownloadManagerCancelDownload} | SIMULATE_OPERATION(%lld) | call to cancelAssetDow nloadJob postponed",  (uint8_t *)&v27,  0x20u);
    }
  }

  else
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
    uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 oslog]);

    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
      int v27 = 138543618;
      id v28 = v18;
      __int16 v29 = 2114;
      id v30 = v6;
      _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {%{public}@} DM:cancelAssetDownloadJob",  (uint8_t *)&v27,  0x16u);
    }

    id DownloadManager = getDownloadManager();
    id v20 = (void *)objc_claimAutoreleasedReturnValue(DownloadManager);
    char v21 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetUUID](self, "autoAssetUUID"));
    __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
    __int128 v23 = (void *)objc_claimAutoreleasedReturnValue([v22 assetType]);
    BOOL v24 = (void *)objc_claimAutoreleasedReturnValue([v7 assetId]);
    id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob clientName](self, "clientName"));
    [v20 cancelAssetDownloadJob:v21 forAssetType:v23 withPurpose:@"auto" matchingAssetId:v24 forAutoAssetName:v25];

    -[MADAutoAssetJob _releaseReservedSpace](self, "_releaseReservedSpace");
  }
}

- (void)mergeSetPolicyIntoAggregated:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientSetPolicy](self, "aggregatedClientSetPolicy"));
  objc_msgSend( v7,  "setLockInhibitsEmergencyRemoval:",  objc_msgSend(v4, "lockInhibitsEmergencyRemoval") | objc_msgSend( v7,  "lockInhibitsEmergencyRemoval"));

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientSetPolicy](self, "aggregatedClientSetPolicy"));
  objc_msgSend( v8,  "setAllowCheckDownloadOnBattery:",  objc_msgSend(v4, "allowCheckDownloadOnBattery") | objc_msgSend( v8,  "allowCheckDownloadOnBattery"));

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientSetPolicy](self, "aggregatedClientSetPolicy"));
  objc_msgSend( v9,  "setAllowCheckDownloadWhenBatteryLow:",  objc_msgSend(v4, "allowCheckDownloadWhenBatteryLow") | objc_msgSend( v9,  "allowCheckDownloadWhenBatteryLow"));

  char v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientSetPolicy](self, "aggregatedClientSetPolicy"));
  objc_msgSend( v10,  "setAllowCheckDownloadWhenCPUHigh:",  objc_msgSend(v4, "allowCheckDownloadWhenCPUHigh") | objc_msgSend( v10,  "allowCheckDownloadWhenCPUHigh"));

  id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientSetPolicy](self, "aggregatedClientSetPolicy"));
  objc_msgSend( v11,  "setAllowCheckDownloadOverExpensive:",  objc_msgSend(v4, "allowCheckDownloadOverExpensive") | objc_msgSend( v11,  "allowCheckDownloadOverExpensive"));

  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientSetPolicy](self, "aggregatedClientSetPolicy"));
  objc_msgSend( v12,  "setAllowCheckDownloadOverCellular:",  objc_msgSend(v4, "allowCheckDownloadOverCellular") | objc_msgSend( v12,  "allowCheckDownloadOverCellular"));

  id v13 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientSetPolicy](self, "aggregatedClientSetPolicy"));
  LODWORD(self) = [v4 blockCheckDownload];

  objc_msgSend( v13,  "setBlockCheckDownload:",  self | objc_msgSend(v13, "blockCheckDownload"));
}

- (id)verifyDownloadNotBlockedBySetPolicy:(BOOL)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3));
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 extendedStateQueue]);
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientSetPolicy](self, "aggregatedClientSetPolicy"));
  if ([v6 userInitiated])
  {
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientSetPolicy](self, "aggregatedClientSetPolicy"));
    if (![v7 allowCheckDownloadOnBattery])
    {
LABEL_11:

      goto LABEL_12;
    }

    char v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientSetPolicy](self, "aggregatedClientSetPolicy"));
    unsigned int v11 = [v10 allowCheckDownloadWhenBatteryLow];

    if (!v11) {
      return 0LL;
    }
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientSetPolicy](self, "aggregatedClientSetPolicy"));
  if ([v6 userInitiated])
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientSetPolicy](self, "aggregatedClientSetPolicy"));
    if ([v7 allowCheckDownloadOnBattery])
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientSetPolicy](self, "aggregatedClientSetPolicy"));
      if ([v8 allowCheckDownloadWhenBatteryLow])
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientSetPolicy](self, "aggregatedClientSetPolicy"));
        [v9 allowCheckDownloadWhenCPUHigh];
      }
    }

    goto LABEL_11;
  }

- (void)_extendCatalogDownloadOptionsWithAnalyticsData:(id)a3
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob _baseAnalyticsData:](self, "_baseAnalyticsData:", v5));
  if ([v8 count])
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob catalogDownloadOptions](self, "catalogDownloadOptions"));
    [v9 setAnalyticsData:v8];
  }

  char v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
  unsigned int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue([v10 oslog]);

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob catalogDownloadOptions](self, "catalogDownloadOptions"));
    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 analyticsData]);
    if (v14)
    {
      self = (MADAutoAssetJob *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob catalogDownloadOptions](self, "catalogDownloadOptions"));
      uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob analyticsData](self, "analyticsData"));
      char v15 = (__CFString *)objc_claimAutoreleasedReturnValue([v3 safeSummary]);
    }

    else
    {
      char v15 = @"N";
    }

    int v16 = 138543874;
    uint64_t v17 = v12;
    __int16 v18 = 2114;
    id v19 = v5;
    __int16 v20 = 2114;
    char v21 = v15;
    _os_log_impl( &dword_0,  v11,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {%{public}@:_extendCatalogDownloadOptionsWithAnalyticsData} analyticsData:%{public}@",  (uint8_t *)&v16,  0x20u);
    if (v14)
    {
    }
  }
}

- (void)_extendAssetDownloadOptionsWithAnalyticsData:(id)a3 forDescriptor:(id)a4 withBaseForPatch:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  BOOL v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v11 extendedStateQueue]);
  dispatch_assert_queue_V2(v12);

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob _baseAnalyticsData:](self, "_baseAnalyticsData:", v8));
  int64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
  char v15 = (void *)objc_claimAutoreleasedReturnValue([v14 assetType]);

  if (!v15
    || (int v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector")),
        uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue([v16 assetType]),
        __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v9 assetType]),
        unsigned __int8 v19 = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v17, v18),
        v18,
        v17,
        v16,
        (v19 & 1) == 0))
  {
    __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v9 assetType]);
    [v13 setSafeObject:v20 forKey:@"AssetType"];
  }

  char v21 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
  __int16 v22 = (void *)objc_claimAutoreleasedReturnValue([v21 assetSpecifier]);

  if (!v22
    || (__int128 v23 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector")),
        BOOL v24 = (void *)objc_claimAutoreleasedReturnValue([v23 assetSpecifier]),
        id v25 = (void *)objc_claimAutoreleasedReturnValue([v9 assetSpecifier]),
        unsigned __int8 v26 = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v24, v25),
        v25,
        v24,
        v23,
        (v26 & 1) == 0))
  {
    int v27 = (void *)objc_claimAutoreleasedReturnValue([v9 assetSpecifier]);
    [v13 setSafeObject:v27 forKey:@"AssetSpecifier"];
  }

  id v28 = (void *)objc_claimAutoreleasedReturnValue([v9 assetVersion]);
  [v13 setSafeObject:v28 forKey:@"AssetVersion"];

  else {
    __int16 v29 = @"NO";
  }
  [v13 setSafeObject:v29 forKey:@"IsMAAutoAsset"];
  id v30 = (void *)objc_claimAutoreleasedReturnValue([v9 assetFormat]);
  [v13 setSafeObject:v30 forKey:@"AssetFormat"];

  __int16 v31 = (void *)objc_claimAutoreleasedReturnValue([v9 metadata]);
  int64_t v32 = (void *)objc_claimAutoreleasedReturnValue([v31 safeStringForKey:@"Build"]);
  [v13 setSafeObject:v32 forKey:@"AssetTargetBuildVersion"];

  unsigned __int8 v33 = (void *)objc_claimAutoreleasedReturnValue([v9 metadata]);
  id v34 = (void *)objc_claimAutoreleasedReturnValue([v33 safeStringForKey:@"OSVersion"]);
  [v13 setSafeObject:v34 forKey:@"AssetTargetOSVersion"];

  if (v10)
  {
    [v13 setSafeObject:@"YES" forKey:@"IsAssetPatch"];
    unsigned __int8 v35 = (void *)objc_claimAutoreleasedReturnValue([v10 assetVersion]);
    [v13 setSafeObject:v35 forKey:@"BaseAssetVersion"];

    [v13 setSafeObject:@"YES" forKey:@"WasAssetPatchingAttempted"];
    BOOL v36 = (void *)objc_claimAutoreleasedReturnValue([v9 patchingAttemptError]);

    if (v36) {
      uint64_t v37 = @"FULL_REPLACEMENT_NO_POSSIBLE_PATCH_FROM_BASE";
    }
    else {
      uint64_t v37 = @"PATCH_SUCCESS";
    }
    goto LABEL_19;
  }

  [v13 setSafeObject:@"NO" forKey:@"IsAssetPatch"];
  if (![v9 patchingAttempted])
  {
    uint64_t v37 = @"FULL_REPLACEMENT_NO_PRIOR";
LABEL_19:
    id v43 = @"AssetPatchingPallasResult";
    goto LABEL_20;
  }

  __int16 v38 = (void *)objc_claimAutoreleasedReturnValue([v9 patchingAttemptError]);

  if (v38)
  {
    unsigned int v39 = (void *)objc_claimAutoreleasedReturnValue([v9 patchingAttemptError]);
    id v40 = (void *)objc_claimAutoreleasedReturnValue([v39 checkedSummary]);
    [v13 setSafeObject:v40 forKey:@"AssetPatchingFailureReason"];

    id v41 = (void *)objc_claimAutoreleasedReturnValue([v9 patchingAttemptError]);
    uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue([v41 checkedDescription]);
    [v13 setSafeObject:v42 forKey:@"AssetPatchingFailureError"];

    [v13 setSafeObject:@"FULL_REPLACEMENT_PATCH_ATTEMPT_FAILED" forKey:@"AssetPatchingPallasResult"];
  }

  uint64_t v37 = @"YES";
  id v43 = @"WasAssetPatchingAttempted";
LABEL_20:
  [v13 setSafeObject:v37 forKey:v43];
  if ([v13 count])
  {
    id v44 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assetDownloadOptions](self, "assetDownloadOptions"));
    [v44 setAnalyticsData:v13];
  }

  unsigned int v45 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
  id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue([v45 oslog]);

  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
  {
    id v52 = v10;
    id v47 = v8;
    id v48 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
    __int16 v49 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assetDownloadOptions](self, "assetDownloadOptions"));
    int64_t v50 = (void *)objc_claimAutoreleasedReturnValue([v49 analyticsData]);
    if (v50)
    {
      self = (MADAutoAssetJob *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assetDownloadOptions](self, "assetDownloadOptions"));
      id v8 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob analyticsData](self, "analyticsData"));
      id v51 = (__CFString *)objc_claimAutoreleasedReturnValue([v8 safeSummary]);
    }

    else
    {
      id v51 = @"N";
    }

    *(_DWORD *)int buf = 138543874;
    __int128 v54 = v48;
    __int16 v55 = 2114;
    id v56 = v47;
    __int16 v57 = 2114;
    id v58 = v51;
    _os_log_impl( &dword_0,  v46,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {%{public}@:_extendAssetDownloadOptionsWithAnalyticsData} analyticsData:%{public}@",  buf,  0x20u);
    if (v50)
    {
    }

    id v8 = v47;
    id v10 = v52;
  }
}

- (id)_baseAnalyticsData:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3));
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 extendedStateQueue]);
  dispatch_assert_queue_V2(v5);

  id v6 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  -[NSMutableDictionary setSafeObject:forKey:](v6, "setSafeObject:forKey:", @"YES", @"IsAutoDownload");
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob jobCreationTriggeringLayer](self, "jobCreationTriggeringLayer"));
  if (v7)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob jobCreationTriggeringLayer](self, "jobCreationTriggeringLayer"));
    -[NSMutableDictionary setSafeObject:forKey:](v6, "setSafeObject:forKey:", v8, @"TriggeringLayer");
  }

  else
  {
    -[NSMutableDictionary setSafeObject:forKey:]( v6,  "setSafeObject:forKey:",  @"Unknown",  @"TriggeringLayer");
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob jobCreationTriggeringLayer](self, "jobCreationTriggeringLayer"));
  if (v9)
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob jobCreationTriggeringLayer](self, "jobCreationTriggeringLayer"));
    if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v10,  @"ClientInterest") & 1) != 0)
    {
LABEL_10:

LABEL_11:
      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetInstance](self, "autoAssetInstance"));
      int64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 autoAssetClientName]);
      -[NSMutableDictionary setSafeObject:forKey:](v6, "setSafeObject:forKey:", v14, @"ClientName");

      goto LABEL_12;
    }

    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob jobCreationTriggeringLayer](self, "jobCreationTriggeringLayer"));
    if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v11,  @"ClientCheck") & 1) != 0)
    {
LABEL_9:

      goto LABEL_10;
    }

    BOOL v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob jobCreationTriggeringLayer](self, "jobCreationTriggeringLayer"));
    if (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v12,  @"ClientDetermine"))
    {

      goto LABEL_9;
    }

    BOOL v24 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob jobCreationTriggeringLayer](self, "jobCreationTriggeringLayer"));
    unsigned __int8 v25 = +[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v24,  @"ClientLock");

    if ((v25 & 1) != 0) {
      goto LABEL_11;
    }
    unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob jobCreationTriggeringLayer](self, "jobCreationTriggeringLayer"));
    unsigned int v27 = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v26, @"Scheduler");

    if (v27)
    {
      id v28 = @"AutoAssetScheduler";
    }

    else
    {
      __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob jobCreationTriggeringLayer](self, "jobCreationTriggeringLayer"));
      unsigned int v30 = +[SUCore stringIsEqual:to:](&OBJC_CLASS___SUCore, "stringIsEqual:to:", v29, @"Stager");

      if (!v30) {
        goto LABEL_12;
      }
      id v28 = @"AutoAssetStager";
    }

    -[NSMutableDictionary setSafeObject:forKey:](v6, "setSafeObject:forKey:", v28, @"ClientName");
  }

- (id)newCurrentStatusForDescriptor:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(&OBJC_CLASS___MAAutoAssetStatus);
  char v6 = objc_opt_respondsToSelector( v5,  "initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withNeverBeenL ocked:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:w ithDownloadedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttempted:withS tagedPriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withAvailableForU seError:withPatchingAttemptError:withNewerVersionError:");

  id v7 = objc_alloc(&OBJC_CLASS___MAAutoAssetStatus);
  id v8 = v7;
  if ((v6 & 1) != 0)
  {
    unsigned __int8 v35 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
    id v9 = objc_alloc_init(&OBJC_CLASS___MAAutoAssetNotifications);
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v4 metadata]);
    BOOL v11 = -[MADAutoAssetJob downloadingUserInitiated](self, "downloadingUserInitiated");
    unsigned __int8 v12 = [v4 patchingAttempted];
    unsigned __int8 v13 = [v4 stagedPriorToAvailable];
    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v4 stagedFromOSVersion]);
    char v15 = (void *)objc_claimAutoreleasedReturnValue([v4 stagedFromBuildVersion]);
    int v16 = (void *)objc_claimAutoreleasedReturnValue([v4 patchingAttemptError]);
    BYTE1(v34) = v13;
    LOBYTE(v34) = v12;
    LOBYTE(v32) = 0;
    uint64_t v17 = -[MAAutoAssetStatus initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withNeverBeenLocked:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withDownloadedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttempted:withStagedPriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withAvailableForUseError:withPatchingAttemptError:withNewerVersionError:]( v8,  "initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withNeverBe enLocked:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemB ytes:withDownloadedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttemp ted:withStagedPriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withA vailableForUseError:withPatchingAttemptError:withNewerVersionError:",  v35,  v9,  0LL,  v10,  1LL,  v11,  0LL,  -1LL,  -1LL,  v32,  0LL,  -1LL,  v34,  v14,  v15,  0LL,  0LL,  v16,  0LL);
  }

  else
  {
    char v18 = objc_opt_respondsToSelector( v7,  "initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withDownloa dUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withDownloadedA sPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttempted:withStagedPriorT oAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withAvailableForUseError: withPatchingAttemptError:withNewerVersionError:");

    if ((v18 & 1) != 0)
    {
      BOOL v36 = objc_alloc(&OBJC_CLASS___MAAutoAssetStatus);
      unsigned __int8 v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
      __int16 v20 = objc_alloc_init(&OBJC_CLASS___MAAutoAssetNotifications);
      char v21 = (void *)objc_claimAutoreleasedReturnValue([v4 metadata]);
      BOOL v22 = -[MADAutoAssetJob downloadingUserInitiated](self, "downloadingUserInitiated");
      unsigned __int8 v23 = [v4 patchingAttempted];
      unsigned __int8 v24 = [v4 stagedPriorToAvailable];
      unsigned __int8 v25 = (void *)objc_claimAutoreleasedReturnValue([v4 stagedFromOSVersion]);
      unsigned __int8 v26 = (void *)objc_claimAutoreleasedReturnValue([v4 stagedFromBuildVersion]);
      unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue([v4 patchingAttemptError]);
      BYTE1(v33) = v24;
      LOBYTE(v33) = v23;
      LOBYTE(v31) = 0;
      uint64_t v17 = -[MAAutoAssetStatus initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withDownloadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withDownloadedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttempted:withStagedPriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withAvailableForUseError:withPatchingAttemptError:withNewerVersionError:]( v36,  "initWithAssetSelector:withNotifications:withAvailableForUseAttributes:withNewerVersionAttributes:withDownl oadUserInitiated:withDownloadProgress:withDownloadedNetworkBytes:withDownloadedFilesystemBytes:withDownloa dedAsPatch:withPatchedFromBaseSelector:withPatchedFromBaseFilesystemBytes:withPatchingAttempted:withStaged PriorToAvailable:withStagedFromOSVersion:withStagedFromBuildVersion:withCurrentLockUsage:withAvailableForU seError:withPatchingAttemptError:withNewerVersionError:",  v19,  v20,  0LL,  v21,  v22,  0LL,  -1LL,  -1LL,  v31,  0LL,  -1LL,  v33,  v25,  v26,  0LL,  0LL,  v27,  0LL);
    }

    else
    {
      id v28 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
      __int16 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v28 oslog]);

      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        -[MADAutoAssetJob _autoAssetJobFinished:forJobFinishedReason:failingWithError:].cold.1(self);
      }

      uint64_t v17 = 0LL;
    }
  }

  return v17;
}

- (void)statusChange:(id)a3 catalogAnomaly:(int64_t)a4 forReason:(id)a5
{
  id v11 = a5;
  id v8 = a3;
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v9 extendedStateQueue]);
  dispatch_assert_queue_V2(v10);

  -[MADAutoAssetJob statusChange:catalogFailure:forReason:](self, "statusChange:catalogFailure:forReason:", v8, a4, v11);
  -[MADAutoAssetJob trackAnomaly:forReason:](self, "trackAnomaly:forReason:", a4, v11);
}

- (void)statusChange:(id)a3 catalogFailure:(int64_t)a4 forReason:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v10 extendedStateQueue]);
  dispatch_assert_queue_V2(v11);

  LODWORD(v11) = -[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob");
  unsigned __int8 v12 = objc_alloc(&OBJC_CLASS___NSString);
  if ((_DWORD)v11)
  {
    char v18 = -[NSString initWithFormat:](v12, "initWithFormat:", @"AUTO-SET-JOB(%@)", v9);

    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  a4,  v18,  0LL,  v8));
    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
    [v14 setNewerVersionError:v13];
  }

  else
  {
    char v15 = -[NSString initWithFormat:](v12, "initWithFormat:", @"AUTO-JOB(%@)", v9);

    int v16 = (void *)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  a4,  v15,  0LL,  v8));
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
    [v17 setNewerVersionError:v16];

    char v18 = (NSString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSString notifications](v18, "notifications"));
    [v13 setCheckForNewerFailure:1];
  }
}

- (void)statusChangeCatalogFoundNewer:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3));
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 extendedStateQueue]);
  dispatch_assert_queue_V2(v5);

  if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    -[MADAutoAssetJob statusChange:catalogAnomaly:forReason:]( self,  "statusChange:catalogAnomaly:forReason:",  @"statusChangeCatalogFoundNewer",  6103LL,  @"statusChangeCatalogFoundNewer should never execute for set-job");
  }

  else
  {
    char v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob resultSelector](self, "resultSelector"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
    [v7 setAssetSelector:v6];

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob newerFoundAssetDescriptor](self, "newerFoundAssetDescriptor"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 metadata]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
    [v10 setNewerVersionAttributes:v9];

    id v12 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v12 notifications]);
    [v11 setNewerVersionDiscovered:1];
  }

- (void)statusChangeSetCatalogFoundNewer:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3));
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 extendedStateQueue]);
  dispatch_assert_queue_V2(v5);

  if (!-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob")) {
    -[MADAutoAssetJob statusChange:catalogAnomaly:forReason:]( self,  "statusChange:catalogAnomaly:forReason:",  @"statusChangeCatalogFoundNewer",  6103LL,  @"statusChangeCatalogFoundNewer should only execute for set-job");
  }
}

- (void)statusChangeCatalogFoundSame:(id)a3
{
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3));
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 extendedStateQueue]);
  dispatch_assert_queue_V2(v5);

  if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    -[MADAutoAssetJob statusChange:catalogAnomaly:forReason:]( self,  "statusChange:catalogAnomaly:forReason:",  @"statusChangeCatalogFoundSame",  6103LL,  @"statusChangeCatalogFoundSame should never execute for set-job");
  }

  else
  {
    char v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob resultSelector](self, "resultSelector"));
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
    [v7 setAssetSelector:v6];

    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 notifications]);
    [v9 setContentAvailableForUse:1];

    id v12 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob resultFound](self, "resultFound"));
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v12 assetAttributes]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
    [v11 setAvailableForUseAttributes:v10];
  }

- (void)statusChangeStartingAssetDownload:(id)a3 downloadingPatch:(BOOL)a4
{
  BOOL v4 = a4;
  char v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM", a3));
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 extendedStateQueue]);
  dispatch_assert_queue_V2(v7);

  if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    -[MADAutoAssetJob latchWhetherDownloadingUserInitiated](self, "latchWhetherDownloadingUserInitiated");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 currentNotifications]);
    [v9 setDownloadPending:1];

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 currentNotifications]);
  }

  else
  {
    if (v4) {
      uint64_t v12 = 2LL;
    }
    else {
      uint64_t v12 = 1LL;
    }
    -[MADAutoAssetJob setProgressReportPhase:](self, "setProgressReportPhase:", v12);
    unsigned __int8 v13 = objc_alloc_init(&OBJC_CLASS___MAAutoAssetProgress);
    int64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
    [v14 setDownloadProgress:v13];

    -[MADAutoAssetJob latchWhetherDownloadingUserInitiated](self, "latchWhetherDownloadingUserInitiated");
    char v15 = objc_alloc_init(&OBJC_CLASS___MAAutoAssetProgress);
    int v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
    [v16 setDownloadProgress:v15];

    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
    char v18 = (void *)objc_claimAutoreleasedReturnValue([v17 notifications]);
    [v18 setDownloadPending:1];

    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 notifications]);
  }

  unsigned __int8 v19 = v11;
  [v11 setDownloadProgress:1];

  -[MADAutoAssetJob statusChangeReportCurrent:](self, "statusChangeReportCurrent:", 0LL);
}

- (void)statusChangeDownloadProgress:(id)a3
{
  id v30 = a3;
  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 extendedStateQueue]);
  dispatch_assert_queue_V2(v5);

  if (v30)
  {
    if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
    {
      -[MADAutoAssetJob setProgressAssetDownload:](self, "setProgressAssetDownload:", v30);
      char v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 currentNotifications]);
LABEL_16:
      __int16 v29 = v7;
      [v7 setDownloadProgress:1];

      -[MADAutoAssetJob statusChangeReportCurrent:](self, "statusChangeReportCurrent:", 0LL);
      -[MADAutoAssetJob _statusChangeDownloadProgressDecideLog:](self, "_statusChangeDownloadProgressDecideLog:", v30);
      goto LABEL_17;
    }

    switch(-[MADAutoAssetJob progressReportPhase](self, "progressReportPhase"))
    {
      case 0LL:
        id v11 = objc_alloc(&OBJC_CLASS___NSString);
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob progressReportPhaseName](self, "progressReportPhaseName"));
        unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v30 summary]);
        int64_t v14 = -[NSString initWithFormat:]( v11,  "initWithFormat:",  @"{statusChangeDownloadProgress} download progress provided when not downloading | phase:%@ | ignored progress:%@",  v12,  v13);
        -[MADAutoAssetJob trackAnomaly:forReason:](self, "trackAnomaly:forReason:", 6108LL, v14);

        goto LABEL_15;
      case 1LL:
        goto LABEL_13;
      case 2LL:
        char v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
        [v15 setDownloadProgress:v30];

        -[MADAutoAssetJob setLastReportedPatchProgress:](self, "setLastReportedPatchProgress:", v30);
        goto LABEL_15;
      case 3LL:
        int v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob lastReportedPatchProgress](self, "lastReportedPatchProgress"));

        if (!v16) {
          goto LABEL_13;
        }
        id v17 = [v30 totalExpectedBytes];
        char v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob lastReportedPatchProgress](self, "lastReportedPatchProgress"));
        if ((uint64_t)v17 >= (uint64_t)[v18 totalExpectedBytes])
        {
          id v19 = [v30 totalWrittenBytes];
          __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob lastReportedPatchProgress](self, "lastReportedPatchProgress"));
          id v21 = [v20 totalWrittenBytes];

          if ((uint64_t)v19 >= (uint64_t)v21)
          {
LABEL_13:
            unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
            [v27 setDownloadProgress:v30];
LABEL_14:

LABEL_15:
            char v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
            id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 notifications]);
            goto LABEL_16;
          }
        }

        else
        {
        }

        id v22 = [v30 isStalled];
        unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
        unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 downloadProgress]);
        [v24 setIsStalled:v22];

        [v30 expectedTimeRemainingSecs];
        double v26 = v25;
        unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
        id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 downloadProgress]);
        [v28 setExpectedTimeRemainingSecs:v26];

        goto LABEL_14;
      default:
        goto LABEL_15;
    }
  }

  id v8 = objc_alloc(&OBJC_CLASS___NSString);
  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob progressReportPhaseName](self, "progressReportPhaseName"));
  id v10 = -[NSString initWithFormat:]( v8,  "initWithFormat:",  @"{statusChangeDownloadProgress} no download progress provided | phase:%@ | no progress change",  v9);
  -[MADAutoAssetJob trackAnomaly:forReason:](self, "trackAnomaly:forReason:", 6102LL, v10);

LABEL_17:
}

- (void)_statusChangeDownloadProgressDecideLog:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  char v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  if (-[MADAutoAssetJob progressLogsFilteredCount](self, "progressLogsFilteredCount") <= 0)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 oslog]);

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetUUID](self, "autoAssetUUID"));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 summary]);
      int v13 = 138543618;
      int64_t v14 = v11;
      __int16 v15 = 2114;
      int v16 = v12;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] (progress) [%{public}@]", (uint8_t *)&v13, 0x16u);
    }

    id v7 = self;
    uint64_t v8 = 1LL;
    goto LABEL_7;
  }

  -[MADAutoAssetJob setProgressLogsFilteredCount:]( self,  "setProgressLogsFilteredCount:",  -[MADAutoAssetJob progressLogsFilteredCount](self, "progressLogsFilteredCount") + 1);
  if (-[MADAutoAssetJob progressLogsFilteredCount](self, "progressLogsFilteredCount") >= 10)
  {
    id v7 = self;
    uint64_t v8 = 0LL;
LABEL_7:
    -[MADAutoAssetJob setProgressLogsFilteredCount:](v7, "setProgressLogsFilteredCount:", v8);
  }
}

- (void)statusChangeSuccesfullyPatched:(id)a3
{
  id v21 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 extendedStateQueue]);
  dispatch_assert_queue_V2(v5);

  char v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob baseForPatch](self, "baseForPatch"));
  if (!v6)
  {
    __int16 v20 = objc_alloc(&OBJC_CLASS___NSString);
    id v14 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob progressReportPhaseName](self, "progressReportPhaseName"));
    id v19 = -[NSString initWithFormat:]( v20,  "initWithFormat:",  @"{%@:statusChangeSuccesfullyPatched} successfully patched yet no baseForPatch | phase:%@ | unable to update currentStatus with patched indications",  v21,  v14);
    -[MADAutoAssetJob trackAnomaly:forReason:](self, "trackAnomaly:forReason:", 6111LL, v19);
    goto LABEL_5;
  }

  if (!-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    id v7 = objc_alloc(&OBJC_CLASS___MAAutoAssetSelector);
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob baseForPatch](self, "baseForPatch"));
    id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 assetType]);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob baseForPatch](self, "baseForPatch"));
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 assetSpecifier]);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob baseForPatch](self, "baseForPatch"));
    int v13 = (void *)objc_claimAutoreleasedReturnValue([v12 assetVersion]);
    id v14 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:]( v7,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:",  v9,  v11,  v13);

    -[MADAutoAssetJob statusChangeSuccessfullyDownloaded:](self, "statusChangeSuccessfullyDownloaded:", v21);
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
    [v15 setPatchedFromBaseSelector:v14];

    int v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob baseForPatch](self, "baseForPatch"));
    id v17 = [v16 downloadedFilesystemBytes];
    char v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
    [v18 setPatchedFromBaseFilesystemBytes:v17];

    id v19 = (NSString *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
    -[NSString setDownloadedAsPatch:](v19, "setDownloadedAsPatch:", 1LL);
LABEL_5:
  }
}

- (void)statusChangeSuccessfullyDownloaded:(id)a3
{
  id v28 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));

  if (v4)
  {
    if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
    {
      -[MADAutoAssetJob statusChange:catalogAnomaly:forReason:]( self,  "statusChange:catalogAnomaly:forReason:",  @"statusChangeSuccessfullyDownloaded",  6103LL,  @"statusChangeSuccessfullyDownloaded should never execute for set-job");
    }

    else
    {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
      id v9 = (void *)objc_claimAutoreleasedReturnValue([v8 downloadProgress]);
      id v10 = [v9 totalWrittenBytes];

      id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v11 metadata]);
      id v13 = [v12 safeIntegerForKey:@"_UnarchivedSize"];

      if ((uint64_t)v13 <= 0)
      {
        id v14 = objc_alloc(&OBJC_CLASS___NSString);
        __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob progressReportPhaseName](self, "progressReportPhaseName"));
        int v16 = -[NSString initWithFormat:]( v14,  "initWithFormat:",  @"{%@:statusChangeSuccessfullyDownloaded} downloadingAssetDescriptor metadata indicated invalid unarchivedSize:%ld | phase:%@",  v28,  v13,  v15);
        -[MADAutoAssetJob trackAnomaly:forReason:](self, "trackAnomaly:forReason:", 6108LL, v16);

        id v13 = v10;
      }

      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
      [v17 setDownloadedFilesystemBytes:v13];

      char v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 downloadProgress]);
      id v20 = [v19 totalWrittenBytes];
      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
      [v21 setDownloadedNetworkBytes:v20];

      id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
      id v23 = [v22 downloadedNetworkBytes];

      if ((uint64_t)v23 <= 0)
      {
        unsigned __int8 v24 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
        id v25 = [v24 downloadedFilesystemBytes];
        double v26 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
        [v26 setDownloadedNetworkBytes:v25];
      }

      unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
      [v27 setAvailableForUseError:0];
    }
  }

  else
  {
    id v5 = objc_alloc(&OBJC_CLASS___NSString);
    char v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob progressReportPhaseName](self, "progressReportPhaseName"));
    id v7 = -[NSString initWithFormat:]( v5,  "initWithFormat:",  @"{%@:statusChangeSuccessfullyDownloaded} successfully downloaded yet no downloadingAssetDescriptor | phase:%@ | unable to update currentStatus with downloaded indications",  v28,  v6);
    -[MADAutoAssetJob trackAnomaly:forReason:](self, "trackAnomaly:forReason:", 6111LL, v7);
  }
}

- (void)statusChangeJobFinished:(id)a3 withResponseError:(id)a4
{
  id v22 = a4;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  char v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  if (!-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 notifications]);
    [v8 setDownloadPending:0];

    int64_t v9 = -[MADAutoAssetJob progressReportPhase](self, "progressReportPhase");
    int64_t v10 = v9;
    id v11 = v22;
    if (v22)
    {
      uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
      id v13 = v12;
      if (v10)
      {
        [v12 setDownloadProgress:0];

        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
        [v14 setAvailableForUseError:v22];

        id v15 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
        int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 notifications]);
        [v16 setContentAvailableForUse:0];
      }

      else
      {
        [v12 setNewerVersionError:v22];

        id v15 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
        int v16 = (void *)objc_claimAutoreleasedReturnValue([v15 notifications]);
        [v16 setCheckForNewerFailure:1];
      }
    }

    else
    {
      if (!v9)
      {
LABEL_11:
        -[MADAutoAssetJob statusChangeReportCurrent:](self, "statusChangeReportCurrent:", v11);
        goto LABEL_12;
      }

      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
      char v18 = (void *)objc_claimAutoreleasedReturnValue([v17 downloadProgress]);
      id v15 = [v18 copy];

      id v19 = [v15 totalExpectedBytes];
      if (v19 != [v15 totalWrittenBytes]) {
        objc_msgSend(v15, "setTotalExpectedBytes:", objc_msgSend(v15, "totalWrittenBytes"));
      }
      [v15 setIsStalled:0];
      [v15 setExpectedTimeRemainingSecs:0.0];
      id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
      [v20 setDownloadProgress:v15];

      int v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
      id v21 = (void *)objc_claimAutoreleasedReturnValue([v16 notifications]);
      [v21 setContentAvailableForUse:1];
    }

    id v11 = v22;
    goto LABEL_11;
  }

- (void)statusChangeReportCurrent:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  char v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  if (-[MADAutoAssetJob stagerJob](self, "stagerJob"))
  {
    id v39 = v4;
    id v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentJobInformation:](self, "currentJobInformation:", &v39));
    id v8 = v39;

    -[MADAutoAssetJob stagerJobReportProgress:reportingError:](self, "stagerJobReportProgress:reportingError:", v7, v8);
    goto LABEL_19;
  }

  uint64_t v32 = v4;
  id v7 = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob activeJobTasks](self, "activeJobTasks"));
  id v9 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (!v9) {
    goto LABEL_15;
  }
  id v10 = v9;
  uint64_t v11 = *(void *)v36;
  do
  {
    uint64_t v12 = 0LL;
    do
    {
      if (*(void *)v36 != v11) {
        objc_enumerationMutation(obj);
      }
      id v13 = *(void **)(*((void *)&v35 + 1) + 8LL * (void)v12);
      id v14 = objc_autoreleasePoolPush();
      if (v13)
      {
        id v15 = (void *)objc_claimAutoreleasedReturnValue([v13 clientRequest]);

        if (!v15) {
          goto LABEL_13;
        }
        int v16 = (void *)objc_claimAutoreleasedReturnValue([v13 clientRequest]);
        -[NSMutableArray addObject:](v7, "addObject:", v16);
      }

      else
      {
        int v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
        id v17 = v7;
        char v18 = (void *)objc_claimAutoreleasedReturnValue([v16 diag]);
        id v19 = objc_alloc(&OBJC_CLASS___NSString);
        id v20 = self;
        id v21 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob _updateLatestSummary](self, "_updateLatestSummary"));
        id v22 = -[NSString initWithFormat:]( v19,  "initWithFormat:",  @"{statusChangeReportCurrent} nil jobParam found on activeJobTasks | %@",  v21);
        [v18 trackAnomaly:@"AUTO-JOB" forReason:v22 withResult:6103 withError:0];

        self = v20;
        id v7 = v17;
      }

LABEL_13:
      objc_autoreleasePoolPop(v14);
      uint64_t v12 = (char *)v12 + 1;
    }

    while (v10 != v12);
    id v10 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
  }

  while (v10);
LABEL_15:

  if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSetIdentifier](self, "autoAssetSetIdentifier"));
    uint64_t v24 = objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetUUID](self, "autoAssetUUID"));
    id v25 = self;
    double v26 = (void *)v24;
    unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob setJobInformation](v25, "setJobInformation"));
    id v28 = [v27 copy];
    id v8 = v32;
    +[MADAutoAssetControlManager autoSetJobIssueProgress:forAssetSetIdentifier:withAutoAssetUUID:withSetJobInformation:withResponseError:]( &OBJC_CLASS___MADAutoAssetControlManager,  "autoSetJobIssueProgress:forAssetSetIdentifier:withAutoAssetUUID:withSetJobInformation:withResponseError:",  v7,  v23,  v26,  v28,  v32);
  }

  else
  {
    id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob mostSpecificSelectorToReport](self, "mostSpecificSelectorToReport"));
    uint64_t v29 = objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetUUID](self, "autoAssetUUID"));
    id v30 = self;
    double v26 = (void *)v29;
    id v34 = v32;
    unsigned int v27 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentJobInformation:](v30, "currentJobInformation:", &v34));
    id v31 = v34;

    +[MADAutoAssetControlManager autoAssetJobIssueProgress:forAutoAssetSelector:withAutoAssetUUID:withJobInformation:withResponseError:]( &OBJC_CLASS___MADAutoAssetControlManager,  "autoAssetJobIssueProgress:forAutoAssetSelector:withAutoAssetUUID:withJobInformation:withResponseError:",  v7,  v23,  v26,  v27,  v31);
    id v8 = v31;
  }

LABEL_19:
}

- (void)latchWhetherDownloadingUserInitiated
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 extendedStateQueue]);
  dispatch_assert_queue_V2(v4);

  if (!-[MADAutoAssetJob downloadingUserInitiated](self, "downloadingUserInitiated"))
  {
    if (-[MADAutoAssetJob boostedToUserInitiated](self, "boostedToUserInitiated")
      || (id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientAssetPolicy](self, "aggregatedClientAssetPolicy")),
          unsigned int v6 = [v5 userInitiated],
          v5,
          v6))
    {
      -[MADAutoAssetJob setDownloadingUserInitiated:](self, "setDownloadingUserInitiated:", 1LL);
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientAssetPolicy](self, "aggregatedClientAssetPolicy"));
      [v7 setUserInitiated:1];

      if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob aggregatedClientSetPolicy](self, "aggregatedClientSetPolicy"));
        [v8 setUserInitiated:1];
      }

      id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assetDownloadOptions](self, "assetDownloadOptions"));

      if (v9)
      {
        id v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assetDownloadOptions](self, "assetDownloadOptions"));
        [v10 setDiscretionary:0];
      }

      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerPatch](self, "foundNewerPatch"));

      if (v11)
      {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerPatch](self, "foundNewerPatch"));
        [v12 setDownloadUserInitiated:1];
      }

      id v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerFull](self, "foundNewerFull"));

      if (v13)
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob foundNewerFull](self, "foundNewerFull"));
        [v14 setDownloadUserInitiated:1];
      }

      id v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob newerFoundAssetDescriptor](self, "newerFoundAssetDescriptor"));

      if (v15)
      {
        int v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob newerFoundAssetDescriptor](self, "newerFoundAssetDescriptor"));
        [v16 setDownloadUserInitiated:1];
      }

      id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));

      if (v17)
      {
        char v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob downloadingAssetDescriptor](self, "downloadingAssetDescriptor"));
        [v18 setDownloadUserInitiated:1];
      }

      if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
      {
        id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
        [v19 setDownloadUserInitiated:1];

        id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentSetStatus](self, "currentSetStatus"));
        id v21 = [v20 copy];
        id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob setJobInformation](self, "setJobInformation"));
        [v22 setCurrentSetStatus:v21];
      }

      else
      {
        id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
        [v20 setDownloadUserInitiated:1];
      }

      id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 oslog]);

      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        id v25 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
        int v26 = 138543362;
        unsigned int v27 = v25;
        _os_log_impl( &dword_0,  v24,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {latchWhetherDownloadingUserInitiated} now user-initiated for remainder of job lifecycle",  (uint8_t *)&v26,  0xCu);
      }
    }
  }

- (id)progressReportPhaseName
{
  unint64_t v2 = -[MADAutoAssetJob progressReportPhase](self, "progressReportPhase");
  if (v2 > 3) {
    return @"UNKNOWN";
  }
  else {
    return *(&off_34F898 + v2);
  }
}

- (void)simulateSet:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  unsigned int v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 controlInformation]);
  if (!v7) {
    goto LABEL_11;
  }
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v4 controlInformation]);
  if ((objc_opt_respondsToSelector(v8, "simulateOperation") & 1) == 0)
  {

LABEL_8:
    int v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v16 oslog]);

    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[MADAutoAssetJob simulateSet:].cold.2();
    }
    goto LABEL_10;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 controlInformation]);
  char v10 = objc_opt_respondsToSelector(v9, "simulateEnd");

  if ((v10 & 1) == 0) {
    goto LABEL_8;
  }
  id v11 = -[MADAutoAssetJob simulateOperation](self, "simulateOperation");
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v4 controlInformation]);
  if (v11 != [v12 simulateOperation])
  {

    goto LABEL_13;
  }

  int64_t v13 = -[MADAutoAssetJob simulateEnd](self, "simulateEnd");
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v4 controlInformation]);
  id v15 = [v14 simulateEnd];

  if ((id)v13 != v15)
  {
LABEL_13:
    if (-[MADAutoAssetJob simulateOperation](self, "simulateOperation"))
    {
      char v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v18 oslog]);

      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[MADAutoAssetJob simulateSet:].cold.1(self, v4, v17);
      }
    }

    else
    {
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v4 controlInformation]);
      -[MADAutoAssetJob setSimulateOperation:](self, "setSimulateOperation:", [v19 simulateOperation]);

      id v20 = (void *)objc_claimAutoreleasedReturnValue([v4 controlInformation]);
      -[MADAutoAssetJob setSimulateEnd:](self, "setSimulateEnd:", [v20 simulateEnd]);

      -[MADAutoAssetJob setSimulateTriggered:](self, "setSimulateTriggered:", 0LL);
      -[MADAutoAssetJob setSimulateDescriptor:](self, "setSimulateDescriptor:", 0LL);
      -[MADAutoAssetJob setSimulateBaseForPatch:](self, "setSimulateBaseForPatch:", 0LL);
      id v21 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 oslog]);

      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
        id v23 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetInfoControl nameOfSimulateOperation:]( &OBJC_CLASS___MANAutoAssetInfoControl,  "nameOfSimulateOperation:",  -[MADAutoAssetJob simulateOperation](self, "simulateOperation")));
        uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetInfoControl nameOfSimulateEnd:]( &OBJC_CLASS___MANAutoAssetInfoControl,  "nameOfSimulateEnd:",  -[MADAutoAssetJob simulateEnd](self, "simulateEnd")));
        int v25 = 138543874;
        int v26 = v22;
        __int16 v27 = 2114;
        id v28 = v23;
        __int16 v29 = 2114;
        id v30 = v24;
        _os_log_impl( &dword_0,  v17,  OS_LOG_TYPE_DEFAULT,  "%{public}@ {simulateSet} | SIMULATE_SET | simulateOperation:%{public}@, simulateEnd:%{public}@",  (uint8_t *)&v25,  0x20u);
      }
    }

- (void)simulateEnd:(int64_t)a3
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  unsigned int v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  if (-[MADAutoAssetJob simulateTriggered](self, "simulateTriggered")
    && -[MADAutoAssetJob simulateEnd](self, "simulateEnd") == a3)
  {
    -[MADAutoAssetJob setSimulateOperation:](self, "setSimulateOperation:", 0LL);
    char v7 = objc_opt_respondsToSelector(&OBJC_CLASS___MANAutoAssetInfoControl, "nameOfSimulateEnd:");
    int64_t v8 = -[MADAutoAssetJob simulateTriggered](self, "simulateTriggered");
    if ((v7 & 1) != 0)
    {
      switch(v8)
      {
        case 0LL:
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
          char v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v12 oslog]);

          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            -[MADAutoAssetJob simulateEnd:].cold.1();
          }
          goto LABEL_47;
        case 1LL:
          -[MADAutoAssetJob requestDownloadManagerCatalogLookup:]( self,  "requestDownloadManagerCatalogLookup:",  @"simulateEnd");
          int64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
          char v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v13 oslog]);

          if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_47;
          }
          id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
          id v15 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetInfoControl nameOfSimulateEnd:]( &OBJC_CLASS___MANAutoAssetInfoControl,  "nameOfSimulateEnd:",  -[MADAutoAssetJob simulateEnd](self, "simulateEnd")));
          *(_DWORD *)int64_t v50 = 138543618;
          *(void *)&v50[4] = v14;
          *(_WORD *)&v50[12] = 2114;
          *(void *)&v50[14] = v15;
          int v16 = "%{public}@ {simulateEnd} | SIMULATE_END(%{public}@) | called registerCatalogDownloadJob";
          goto LABEL_24;
        case 2LL:
          id v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob simulateDescriptor](self, "simulateDescriptor"));
          char v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob simulateBaseForPatch](self, "simulateBaseForPatch"));
          -[MADAutoAssetJob requestDownloadManagerAssetDownload:forDescriptor:withBaseForPatch:]( self,  "requestDownloadManagerAssetDownload:forDescriptor:withBaseForPatch:",  @"simulateEnd",  v17,  v18);

          id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
          char v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 oslog]);

          if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_47;
          }
          id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
          id v15 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetInfoControl nameOfSimulateEnd:]( &OBJC_CLASS___MANAutoAssetInfoControl,  "nameOfSimulateEnd:",  -[MADAutoAssetJob simulateEnd](self, "simulateEnd")));
          *(_DWORD *)int64_t v50 = 138543618;
          *(void *)&v50[4] = v14;
          *(_WORD *)&v50[12] = 2114;
          *(void *)&v50[14] = v15;
          int v16 = "%{public}@ {simulateEnd} | SIMULATE_END(%{public}@) | called registerAssetDownloadJob";
          goto LABEL_24;
        case 3LL:
          id v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob simulateDescriptor](self, "simulateDescriptor"));
          -[MADAutoAssetJob requestDownloadManagerConfigDownload:forDescriptor:]( self,  "requestDownloadManagerConfigDownload:forDescriptor:",  @"simulateEnd",  v20);

          id v21 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
          char v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v21 oslog]);

          if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_47;
          }
          id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
          id v15 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetInfoControl nameOfSimulateEnd:]( &OBJC_CLASS___MANAutoAssetInfoControl,  "nameOfSimulateEnd:",  -[MADAutoAssetJob simulateEnd](self, "simulateEnd")));
          *(_DWORD *)int64_t v50 = 138543618;
          *(void *)&v50[4] = v14;
          *(_WORD *)&v50[12] = 2114;
          *(void *)&v50[14] = v15;
          int v16 = "%{public}@ {simulateEnd} | SIMULATE_END(%{public}@) | called configAssetDownloadJob";
          goto LABEL_24;
        case 4LL:
          id v22 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob simulateDescriptor](self, "simulateDescriptor"));
          -[MADAutoAssetJob requestDownloadManagerCancelDownload:forDescriptor:]( self,  "requestDownloadManagerCancelDownload:forDescriptor:",  @"simulateEnd",  v22);

          id v23 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
          char v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v23 oslog]);

          if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_47;
          }
          id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
          id v15 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetInfoControl nameOfSimulateEnd:]( &OBJC_CLASS___MANAutoAssetInfoControl,  "nameOfSimulateEnd:",  -[MADAutoAssetJob simulateEnd](self, "simulateEnd")));
          *(_DWORD *)int64_t v50 = 138543618;
          *(void *)&v50[4] = v14;
          *(_WORD *)&v50[12] = 2114;
          *(void *)&v50[14] = v15;
          int v16 = "%{public}@ {simulateEnd} | SIMULATE_END(%{public}@) | called cancelAssetDownloadJob";
          goto LABEL_24;
        case 5LL:
          char v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetJob simulatedErrorAtPhase:fromOperation:forAssetDownload:]( self,  "simulatedErrorAtPhase:fromOperation:forAssetDownload:",  @"simulateEnd",  @"FAIL_PATCH_DOWNLOAD",  0LL));
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetUUID](self, "autoAssetUUID"));
          -[MADAutoAssetJob handleDownloadAssetJobFinished:downloadError:]( self,  "handleDownloadAssetJobFinished:downloadError:",  v24,  v10);

          int v25 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
          int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v25 oslog]);

          if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_46;
          }
          __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
          id v28 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetInfoControl nameOfSimulateEnd:]( &OBJC_CLASS___MANAutoAssetInfoControl,  "nameOfSimulateEnd:",  -[MADAutoAssetJob simulateEnd](self, "simulateEnd")));
          *(_DWORD *)int64_t v50 = 138543618;
          *(void *)&v50[4] = v27;
          *(_WORD *)&v50[12] = 2114;
          *(void *)&v50[14] = v28;
          __int16 v29 = "%{public}@ {simulateEnd} | SIMULATE_END(%{public}@) | simulated patch download failure";
          goto LABEL_27;
        case 6LL:
          -[MADAutoAssetJob _autoAssetJobFinished:forJobFinishedReason:failingWithError:]( self,  "_autoAssetJobFinished:forJobFinishedReason:failingWithError:",  @"simulateEnd",  @"SIMULATED_POSTPONE_ENDED",  0LL);
          id v30 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
          char v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v30 oslog]);

          if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_47;
          }
          id v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
          id v15 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetInfoControl nameOfSimulateEnd:]( &OBJC_CLASS___MANAutoAssetInfoControl,  "nameOfSimulateEnd:",  -[MADAutoAssetJob simulateEnd](self, "simulateEnd")));
          *(_DWORD *)int64_t v50 = 138543618;
          *(void *)&v50[4] = v14;
          *(_WORD *)&v50[12] = 2114;
          *(void *)&v50[14] = v15;
          int v16 = "%{public}@ {simulateEnd} | SIMULATE_END(%{public}@) | called autoAssetJobFinished";
LABEL_24:
          _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, v16, v50, 0x16u);

          goto LABEL_47;
        case 7LL:
        case 8LL:
          id v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
          char v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v9 oslog]);

          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
            goto LABEL_6;
          }
          goto LABEL_47;
        case 9LL:
          char v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetJob simulatedErrorAtPhase:fromOperation:forAssetDownload:]( self,  "simulatedErrorAtPhase:fromOperation:forAssetDownload:",  @"simulateEnd",  @"FAIL_ASSET_DOWNLOAD",  1LL));
          id v31 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetUUID](self, "autoAssetUUID"));
          -[MADAutoAssetJob handleDownloadAssetJobFinished:downloadError:]( self,  "handleDownloadAssetJobFinished:downloadError:",  v31,  v10);

          uint64_t v32 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
          int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v32 oslog]);

          if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_46;
          }
          __int16 v27 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
          id v28 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetInfoControl nameOfSimulateEnd:]( &OBJC_CLASS___MANAutoAssetInfoControl,  "nameOfSimulateEnd:",  -[MADAutoAssetJob simulateEnd](self, "simulateEnd")));
          *(_DWORD *)int64_t v50 = 138543618;
          *(void *)&v50[4] = v27;
          *(_WORD *)&v50[12] = 2114;
          *(void *)&v50[14] = v28;
          __int16 v29 = "%{public}@ {simulateEnd} | SIMULATE_END(%{public}@) | simulated asset download failure";
LABEL_27:
          _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, v29, v50, 0x16u);

          goto LABEL_46;
        default:
          goto LABEL_48;
      }
    }

    switch(v8)
    {
      case 0LL:
        uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
        char v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v33 oslog]);

        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          -[MADAutoAssetJob simulateEnd:].cold.3();
        }
        goto LABEL_47;
      case 1LL:
        -[MADAutoAssetJob requestDownloadManagerCatalogLookup:]( self,  "requestDownloadManagerCatalogLookup:",  @"simulateEnd");
        id v34 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
        char v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v34 oslog]);

        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_47;
        }
        int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
        *(_DWORD *)int64_t v50 = 138543618;
        *(void *)&v50[4] = v26;
        *(_WORD *)&v50[12] = 2048;
        *(void *)&v50[14] = -[MADAutoAssetJob simulateEnd](self, "simulateEnd");
        __int128 v35 = "%{public}@ {simulateEnd} | SIMULATE_END(%lld) | called registerCatalogDownloadJob";
        goto LABEL_42;
      case 2LL:
        __int128 v36 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob simulateDescriptor](self, "simulateDescriptor"));
        __int128 v37 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob simulateBaseForPatch](self, "simulateBaseForPatch"));
        -[MADAutoAssetJob requestDownloadManagerAssetDownload:forDescriptor:withBaseForPatch:]( self,  "requestDownloadManagerAssetDownload:forDescriptor:withBaseForPatch:",  @"simulateEnd",  v36,  v37);

        __int128 v38 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
        char v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v38 oslog]);

        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_47;
        }
        int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
        *(_DWORD *)int64_t v50 = 138543618;
        *(void *)&v50[4] = v26;
        *(_WORD *)&v50[12] = 2048;
        *(void *)&v50[14] = -[MADAutoAssetJob simulateEnd](self, "simulateEnd");
        __int128 v35 = "%{public}@ {simulateEnd} | SIMULATE_END(%lld) | called registerAssetDownloadJob";
        goto LABEL_42;
      case 3LL:
        id v39 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob simulateDescriptor](self, "simulateDescriptor"));
        -[MADAutoAssetJob requestDownloadManagerConfigDownload:forDescriptor:]( self,  "requestDownloadManagerConfigDownload:forDescriptor:",  @"simulateEnd",  v39);

        id v40 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
        char v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v40 oslog]);

        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_47;
        }
        int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
        *(_DWORD *)int64_t v50 = 138543618;
        *(void *)&v50[4] = v26;
        *(_WORD *)&v50[12] = 2048;
        *(void *)&v50[14] = -[MADAutoAssetJob simulateEnd](self, "simulateEnd");
        __int128 v35 = "%{public}@ {simulateEnd} | SIMULATE_END(%lld) | called configAssetDownloadJob";
        goto LABEL_42;
      case 4LL:
        id v41 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob simulateDescriptor](self, "simulateDescriptor"));
        -[MADAutoAssetJob requestDownloadManagerCancelDownload:forDescriptor:]( self,  "requestDownloadManagerCancelDownload:forDescriptor:",  @"simulateEnd",  v41);

        uint64_t v42 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
        char v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v42 oslog]);

        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_47;
        }
        int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
        *(_DWORD *)int64_t v50 = 138543618;
        *(void *)&v50[4] = v26;
        *(_WORD *)&v50[12] = 2048;
        *(void *)&v50[14] = -[MADAutoAssetJob simulateEnd](self, "simulateEnd");
        __int128 v35 = "%{public}@ {simulateEnd} | SIMULATE_END(%lld) | called cancelAssetDownloadJob";
        goto LABEL_42;
      case 5LL:
        char v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetJob simulatedErrorAtPhase:fromOperation:forAssetDownload:]( self,  "simulatedErrorAtPhase:fromOperation:forAssetDownload:",  @"simulateEnd",  @"FAIL_PATCH_DOWNLOAD",  0LL));
        id v43 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetUUID](self, "autoAssetUUID"));
        -[MADAutoAssetJob handleDownloadAssetJobFinished:downloadError:]( self,  "handleDownloadAssetJobFinished:downloadError:",  v43,  v10);

        id v44 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
        int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v44 oslog]);

        if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
          break;
        }
        unsigned int v45 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
        *(_DWORD *)int64_t v50 = 138543618;
        *(void *)&v50[4] = v45;
        *(_WORD *)&v50[12] = 2048;
        *(void *)&v50[14] = -[MADAutoAssetJob simulateEnd](self, "simulateEnd");
        id v46 = "%{public}@ {simulateEnd} | SIMULATE_END(%lld) | simulated patch download failure";
        goto LABEL_45;
      case 6LL:
        -[MADAutoAssetJob _autoAssetJobFinished:forJobFinishedReason:failingWithError:]( self,  "_autoAssetJobFinished:forJobFinishedReason:failingWithError:",  @"simulateEnd",  @"SIMULATED_POSTPONE_ENDED",  0LL);
        id v47 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
        char v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v47 oslog]);

        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_47;
        }
        int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
        *(_DWORD *)int64_t v50 = 138543618;
        *(void *)&v50[4] = v26;
        *(_WORD *)&v50[12] = 2048;
        *(void *)&v50[14] = -[MADAutoAssetJob simulateEnd](self, "simulateEnd");
        __int128 v35 = "%{public}@ {simulateEnd} | SIMULATE_END(%lld) | called autoAssetJobFinished";
LABEL_42:
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, v35, v50, 0x16u);
        break;
      case 7LL:
      case 8LL:
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
        char v10 = (os_log_s *)objc_claimAutoreleasedReturnValue([v11 oslog]);

        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
LABEL_6:
        }
          -[MADAutoAssetJob simulateEnd:].cold.2();
        goto LABEL_47;
      case 9LL:
        char v10 = (os_log_s *)objc_claimAutoreleasedReturnValue( -[MADAutoAssetJob simulatedErrorAtPhase:fromOperation:forAssetDownload:]( self,  "simulatedErrorAtPhase:fromOperation:forAssetDownload:",  @"simulateEnd",  @"FAIL_ASSET_DOWNLOAD",  1LL));
        id v48 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetUUID](self, "autoAssetUUID"));
        -[MADAutoAssetJob handleDownloadAssetJobFinished:downloadError:]( self,  "handleDownloadAssetJobFinished:downloadError:",  v48,  v10);

        __int16 v49 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
        int v26 = (os_log_s *)objc_claimAutoreleasedReturnValue([v49 oslog]);

        if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
          break;
        }
        unsigned int v45 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
        *(_DWORD *)int64_t v50 = 138543618;
        *(void *)&v50[4] = v45;
        *(_WORD *)&v50[12] = 2048;
        *(void *)&v50[14] = -[MADAutoAssetJob simulateEnd](self, "simulateEnd");
        id v46 = "%{public}@ {simulateEnd} | SIMULATE_END(%lld) | simulated asset download failure";
LABEL_45:
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_DEFAULT, v46, v50, 0x16u);

        break;
      default:
        goto LABEL_48;
    }

- (id)simulatedErrorAtPhase:(id)a3 fromOperation:(id)a4 forAssetDownload:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  if (v5)
  {
    int64_t v9 = +[MADAutoAssetControlManager preferenceSimulatedDownloadFailureResult]( &OBJC_CLASS___MADAutoAssetControlManager,  "preferenceSimulatedDownloadFailureResult");
    if (v9 == -1) {
      unint64_t v10 = 3LL;
    }
    else {
      unint64_t v10 = v9;
    }
    id v11 = errorStringForMADownloadResult(v10);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    int64_t v13 = (NSString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"end of asset download with simulated error: %@(%ld)",  v12,  v10));

    id v19 = MAErrorForDownloadResultWithUnderlying(v10, 0LL, @"%@", v14, v15, v16, v17, v18, (uint64_t)v13);
    uint64_t v20 = objc_claimAutoreleasedReturnValue(v19);
  }

  else
  {
    int64_t v13 = -[NSString initWithFormat:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithFormat:",  @"end of simulate operation[%@]",  v8);
    uint64_t v20 = objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6115LL,  v7,  0LL,  v13));
  }

  id v21 = (void *)v20;

  return v21;
}

- (void)determineWhetherNetworkConnectivityError:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  unsigned int v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  if (v4)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 domain]);
    if ((+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v7,  @"com.apple.MobileAssetError.AutoAsset") & 1) != 0)
    {
      id v8 = (char *)[v4 code];

      if (v8 == "rary/PrivateFrameworks/SoftwareUpdateCoreConnect.framework/SoftwareUpdateCoreConnect")
      {
        int64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v4 userInfo]);
        unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectForKeyedSubscript:NSUnderlyingErrorKey]);

        if (v10)
        {
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v10 domain]);
          unsigned int v12 = +[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v11,  @"com.apple.MobileAssetError.Download");

          if (v12)
          {
            int64_t v13 = (char *)[v10 code];
            if ((isDownloadResultSuggestingCheckTimeoutConditions((uint64_t)v13) & 1) != 0
              || (isDownloadResultSuggestingCheckNetwork((uint64_t)v13) & 1) != 0
              || isDownloadResultSuggestingCheckClockAndCerts((uint64_t)v13))
            {
              uint64_t v14 = 1LL;
LABEL_20:
              -[MADAutoAssetJob setPotentialNetworkFailure:](self, "setPotentialNetworkFailure:", v14);
              unsigned int v18 = -[MADAutoAssetJob potentialNetworkFailure](self, "potentialNetworkFailure");
              id v19 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
              uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue([v19 oslog]);

              BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
              if (v18)
              {
                if (v21) {
                  -[MADAutoAssetJob determineWhetherNetworkConnectivityError:].cold.2();
                }
              }

              else if (v21)
              {
                -[MADAutoAssetJob determineWhetherNetworkConnectivityError:].cold.3();
              }

              goto LABEL_15;
            }

            if (!isDownloadResultSuggestingCheckConfiguration((uint64_t)v13))
            {
              uint64_t v14 = v13 == &stru_20.segname[7];
              goto LABEL_20;
            }

            if ((unint64_t)(v13 - 59) < 8)
            {
              uint64_t v14 = (0x91u >> ((_BYTE)v13 - 59)) & 1;
              goto LABEL_20;
            }
          }

          uint64_t v14 = 0LL;
          goto LABEL_20;
        }
      }
    }

    else
    {
    }

    -[MADAutoAssetJob setPotentialNetworkFailure:](self, "setPotentialNetworkFailure:", 0LL);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v17 oslog]);

    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR)) {
      -[MADAutoAssetJob determineWhetherNetworkConnectivityError:].cold.1();
    }
  }

  else
  {
    -[MADAutoAssetJob setPotentialNetworkFailure:](self, "setPotentialNetworkFailure:", 0LL);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob logger](self, "logger"));
    unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue([v15 oslog]);

    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobName](self, "autoJobName"));
      int v22 = 138543362;
      id v23 = v16;
      _os_log_impl( &dword_0,  (os_log_t)v10,  OS_LOG_TYPE_DEFAULT,  "%{public}@ | {determineWhetherNetworkConnectivityError} job completed successfully",  (uint8_t *)&v22,  0xCu);
    }
  }

- (void)reportIfSetPallasResponseReceived:(id)a3
{
  id v17 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 extendedStateQueue]);
  dispatch_assert_queue_V2(v5);

  if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    if (!-[MADAutoAssetJob stagerJob](self, "stagerJob"))
    {
      unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue([v17 domain]);
      unsigned int v7 = +[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v6,  @"com.apple.MobileAssetError.AutoAsset");

      if (v7)
      {
        if ([v17 code] == (char *)&stru_1830.dylib.name.offset + 1
          || [v17 code] == (char *)&stru_1830.dylib.name.offset + 2
          || [v17 code] == (char *)&stru_1830.dylib.name.offset + 3
          || [v17 code] == (char *)&stru_1830.dylib.timestamp + 1
          || [v17 code] == (char *)&stru_1830.dylib.current_version + 1
          || [v17 code] == (char *)&stru_1830.dylib.current_version + 2)
        {
LABEL_10:
          id v8 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob setConfiguration](self, "setConfiguration"));

          if (v8)
          {
            -[MADAutoAssetJob setHaveReceivedLookupResponse:](self, "setHaveReceivedLookupResponse:", 1LL);
            int64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob setConfiguration](self, "setConfiguration"));
            unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob assignedSetDescriptor](self, "assignedSetDescriptor"));
            +[MADAutoAssetControlManager autoAssetJobSetLookupResponseReceived:forAssignedSetDescriptor:]( &OBJC_CLASS___MADAutoAssetControlManager,  "autoAssetJobSetLookupResponseReceived:forAssignedSetDescriptor:",  v9,  v10);
          }

          else
          {
            -[MADAutoAssetJob statusChange:catalogAnomaly:forReason:]( self,  "statusChange:catalogAnomaly:forReason:",  @"reportIfSetPallasResponseReceived",  6102LL,  @"set-job without set-configuration");
          }

          goto LABEL_13;
        }

        id v11 = (void *)objc_claimAutoreleasedReturnValue([v17 domain]);
        if (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v11,  @"com.apple.MobileAssetError.AutoAsset"))
        {
          unsigned int v12 = (char *)[v17 code];

          if (v12 != "rary/PrivateFrameworks/SoftwareUpdateCoreConnect.framework/SoftwareUpdateCoreConnect") {
            goto LABEL_13;
          }
          id v11 = (void *)objc_claimAutoreleasedReturnValue([v17 userInfo]);
          id v13 = [v11 safeObjectForKey:NSUnderlyingErrorKey ofClass:objc_opt_class(NSError)];
          uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
          uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v14 domain]);
          if (+[SUCore stringIsEqual:to:]( &OBJC_CLASS___SUCore,  "stringIsEqual:to:",  v15,  @"com.apple.MobileAssetError.Download"))
          {
            unsigned __int8 v16 = -[MADAutoAssetJob _maDownloadErrorIndicatesResponseNoContent:]( self,  "_maDownloadErrorIndicatesResponseNoContent:",  [v14 code]);

            if ((v16 & 1) == 0) {
              goto LABEL_13;
            }
            goto LABEL_10;
          }
        }
      }
    }
  }

- (BOOL)_maDownloadErrorIndicatesResponseNoContent:(int64_t)a3
{
  return (unint64_t)(a3 - 43) < 2;
}

- (int64_t)errorCodeFromUnderling:(id)a3
{
  return 6107LL;
}

- (int64_t)errorCodeForNoNewerContentFound
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v3 extendedStateQueue]);
  dispatch_assert_queue_V2(v4);

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob latestInstalledAssetVersion](self, "latestInstalledAssetVersion"));
  if (!v5) {
    return 6201LL;
  }
  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v6 assetVersion]);

  if (v7) {
    return 6201LL;
  }
  if (-[MADAutoAssetJob tryPersonalizeFailed](self, "tryPersonalizeFailed")) {
    return 6535LL;
  }
  return 6205LL;
}

- (void)trackAnomaly:(int64_t)a3 forReason:(id)a4
{
  id v6 = a4;
  id v8 = (id)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue([v8 diag]);
  [v7 trackAnomaly:@"AUTO-JOB" forReason:v6 withResult:a3 withError:0];
}

- (id)currentJobInformation:(id *)a3
{
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 extendedStateQueue]);
  dispatch_assert_queue_V2(v6);

  if (-[MADAutoAssetJob autoAssetSetJob](self, "autoAssetSetJob"))
  {
    unsigned int v7 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoJobFSM](self, "autoJobFSM"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 diag]);
    [v8 trackAnomaly:@"AUTO-JOB:INFO" forReason:@"currentJobInformation should never be used for set-job" withResult:6103 withError:0];

    if (!a3 || *a3)
    {
LABEL_4:
      id v9 = 0LL;
      goto LABEL_26;
    }

    id v23 = @"currentJobInformation should never be used for set-job";
    uint64_t v24 = 6103LL;
LABEL_19:
    id v9 = 0LL;
    *a3 = (id)objc_claimAutoreleasedReturnValue( +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v24,  @"currentJobInformation",  0LL,  v23));
    goto LABEL_26;
  }

  unsigned int v10 = -[MADAutoAssetJob stagerJob](self, "stagerJob");
  id v11 = objc_alloc(&OBJC_CLASS___MADAutoAssetJobInformation);
  unsigned int v12 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob autoAssetSelector](self, "autoAssetSelector"));
  id v13 = v12;
  if (!v10)
  {
    id v17 = [v12 copyClearingWriteOnlyFields];
    id v9 = -[MADAutoAssetJobInformation initForAssetSelector:](v11, "initForAssetSelector:", v17);

    if (v9)
    {
      unsigned int v18 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob mostSpecificSelectorToReport](self, "mostSpecificSelectorToReport"));
      [v9 setFullAssetSelector:v18];

      id v19 = (void *)objc_claimAutoreleasedReturnValue([v9 fullAssetSelector]);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
      [v20 setAssetSelector:v19];

      BOOL v21 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob resultInstance](self, "resultInstance"));
      if (v21) {
        uint64_t v22 = objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob resultInstance](self, "resultInstance"));
      }
      else {
        uint64_t v22 = objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob activeInstance](self, "activeInstance"));
      }
      int v25 = (void *)v22;
      [v9 setClientInstance:v22];

      uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob activeDesire](self, "activeDesire"));
      [v9 setClientDesire:v15];
      goto LABEL_22;
    }

    if (!a3 || *a3) {
      goto LABEL_4;
    }
    id v23 = @"unable to provide job-information for intended successful reply";
LABEL_18:
    uint64_t v24 = 6101LL;
    goto LABEL_19;
  }

  id v9 = -[MADAutoAssetJobInformation initForAssetSelector:](v11, "initForAssetSelector:", v12);

  if (!v9)
  {
    if (!a3 || *a3) {
      goto LABEL_4;
    }
    id v23 = @"unable to provide job-information for intended successful stager-job";
    goto LABEL_18;
  }

  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob mostSpecificSelectorToReport](self, "mostSpecificSelectorToReport"));
  [v9 setFullAssetSelector:v14];

  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue([v9 fullAssetSelector]);
  unsigned __int8 v16 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
  [v16 setAssetSelector:v15];

LABEL_22:
  int v26 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob resultFound](self, "resultFound"));
  if (v26) {
    uint64_t v27 = objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob resultFound](self, "resultFound"));
  }
  else {
    uint64_t v27 = objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob activeFound](self, "activeFound"));
  }
  id v28 = (void *)v27;
  [v9 setFoundContent:v27];

  __int16 v29 = (void *)objc_claimAutoreleasedReturnValue(-[MADAutoAssetJob currentStatus](self, "currentStatus"));
  [v9 setCurrentStatus:v29];

LABEL_26:
  -[MADAutoAssetJob setAutoAssetJobInformation:](self, "setAutoAssetJobInformation:", v9);
  return v9;
}

- (BOOL)autoAssetSetJob
{
  return self->_autoAssetSetJob;
}

- (void)setAutoAssetSetJob:(BOOL)a3
{
  self->_BOOL autoAssetSetJob = a3;
}

- (MAAutoAssetSelector)autoAssetSelector
{
  return self->_autoAssetSelector;
}

- (NSString)clientDomainName
{
  return self->_clientDomainName;
}

- (void)setClientDomainName:(id)a3
{
}

- (NSString)autoAssetSetIdentifier
{
  return self->_autoAssetSetIdentifier;
}

- (void)setAutoAssetSetIdentifier:(id)a3
{
}

- (NSString)autoAssetUUID
{
  return self->_autoAssetUUID;
}

- (int64_t)clientRequestCount
{
  return self->_clientRequestCount;
}

- (void)setClientRequestCount:(int64_t)a3
{
  self->_clientRequestCount = a3;
}

- (BOOL)earlierSchedulerInvolved
{
  return self->_earlierSchedulerInvolved;
}

- (void)setEarlierSchedulerInvolved:(BOOL)a3
{
  self->_earlierSchedulerInvolved = a3;
}

- (BOOL)beingCanceled
{
  return self->_beingCanceled;
}

- (void)setBeingCanceled:(BOOL)a3
{
  self->_beingCanceled = a3;
}

- (BOOL)earlierPotentialNetworkFailure
{
  return self->_earlierPotentialNetworkFailure;
}

- (void)setEarlierPotentialNetworkFailure:(BOOL)a3
{
  self->_earlierPotentialNetworkFailure = a3;
}

- (MAAutoAssetInfoInstance)autoAssetInstance
{
  return self->_autoAssetInstance;
}

- (void)setAutoAssetInstance:(id)a3
{
}

- (NSString)latestSafeSummary
{
  return self->_latestSafeSummary;
}

- (void)setLatestSafeSummary:(id)a3
{
}

- (MAAutoAssetSummary)latestAutoAssetSummary
{
  return self->_latestAutoAssetSummary;
}

- (void)setLatestAutoAssetSummary:(id)a3
{
}

- (BOOL)schedulerInvolved
{
  return self->_schedulerInvolved;
}

- (void)setSchedulerInvolved:(BOOL)a3
{
  self->_schedulerInvolved = a3;
}

- (BOOL)setCheckAwaitingDownload
{
  return self->_setCheckAwaitingDownload;
}

- (void)setSetCheckAwaitingDownload:(BOOL)a3
{
  self->_setCheckAwaitingDownload = a3;
}

- (BOOL)potentialNetworkFailure
{
  return self->_potentialNetworkFailure;
}

- (void)setPotentialNetworkFailure:(BOOL)a3
{
  self->_potentialNetworkFailure = a3;
}

- (BOOL)stagerJob
{
  return self->_stagerJob;
}

- (void)setStagerJob:(BOOL)a3
{
  self->_BOOL stagerJob = a3;
}

- (BOOL)stagerJobDownloadContent
{
  return self->_stagerJobDownloadContent;
}

- (void)setStagerJobDownloadContent:(BOOL)a3
{
  self->_stagerJobDownloadContent = a3;
}

- (BOOL)stagerJobResultsReported
{
  return self->_stagerJobResultsReported;
}

- (void)setStagerJobResultsReported:(BOOL)a3
{
  self->_stagerJobResultsReported = a3;
}

- (NSString)stagerAssetTargetOSVersion
{
  return self->_stagerAssetTargetOSVersion;
}

- (void)setStagerAssetTargetOSVersion:(id)a3
{
}

- (NSString)stagerAssetTargetBuildVersion
{
  return self->_stagerAssetTargetBuildVersion;
}

- (void)setStagerAssetTargetBuildVersion:(id)a3
{
}

- (NSString)stagerAssetTargetTrainName
{
  return self->_stagerAssetTargetTrainName;
}

- (void)setStagerAssetTargetTrainName:(id)a3
{
}

- (NSString)stagerAssetTargetRestoreVersion
{
  return self->_stagerAssetTargetRestoreVersion;
}

- (void)setStagerAssetTargetRestoreVersion:(id)a3
{
}

- (NSDictionary)stagerJobAutoAssetCatalog
{
  return self->_stagerJobAutoAssetCatalog;
}

- (void)setStagerJobAutoAssetCatalog:(id)a3
{
}

- (MADAutoAssetJob)bondedWithJob
{
  return self->_bondedWithJob;
}

- (void)setBondedWithJob:(id)a3
{
}

- (SUCoreLog)logger
{
  return self->_logger;
}

- (NSMutableArray)activeJobTasks
{
  return self->_activeJobTasks;
}

- (void)setActiveJobTasks:(id)a3
{
}

- (NSDictionary)stateTable
{
  return self->_stateTable;
}

- (NSString)autoJobName
{
  return self->_autoJobName;
}

- (void)setAutoJobName:(id)a3
{
}

- (SUCoreFSM)autoJobFSM
{
  return self->_autoJobFSM;
}

- (void)setAutoJobFSM:(id)a3
{
}

- (MAAutoAssetInfoInstance)activeInstance
{
  return self->_activeInstance;
}

- (void)setActiveInstance:(id)a3
{
}

- (MAAutoAssetInfoDesire)activeDesire
{
  return self->_activeDesire;
}

- (void)setActiveDesire:(id)a3
{
}

- (MAAutoAssetInfoFound)activeFound
{
  return self->_activeFound;
}

- (void)setActiveFound:(id)a3
{
}

- (MAAutoAssetInfoEnd)activeEnd
{
  return self->_activeEnd;
}

- (void)setActiveEnd:(id)a3
{
}

- (MAAutoAssetInfoListen)activeListen
{
  return self->_activeListen;
}

- (void)setActiveListen:(id)a3
{
}

- (MADAutoAssetJobInformation)autoAssetJobInformation
{
  return self->_autoAssetJobInformation;
}

- (void)setAutoAssetJobInformation:(id)a3
{
}

- (MAAutoAssetPolicy)aggregatedClientAssetPolicy
{
  return self->_aggregatedClientAssetPolicy;
}

- (void)setAggregatedClientAssetPolicy:(id)a3
{
}

- (BOOL)aggregatedClientAssetPolicySpecified
{
  return self->_aggregatedClientAssetPolicySpecified;
}

- (void)setAggregatedClientAssetPolicySpecified:(BOOL)a3
{
  self->_aggregatedClientAssetPolicySpecified = a3;
}

- (BOOL)clientRequestedOperation
{
  return self->_clientRequestedOperation;
}

- (void)setClientRequestedOperation:(BOOL)a3
{
  self->_clientRequestedOperation = a3;
}

- (NSString)firstClientName
{
  return self->_firstClientName;
}

- (void)setFirstClientName:(id)a3
{
}

- (NSString)jobCreationTriggeringLayer
{
  return self->_jobCreationTriggeringLayer;
}

- (void)setJobCreationTriggeringLayer:(id)a3
{
}

- (NSMutableDictionary)onFilesystemByVersion
{
  return self->_onFilesystemByVersion;
}

- (void)setOnFilesystemByVersion:(id)a3
{
}

- (NSString)checkUUIDBasePortion
{
  return self->_checkUUIDBasePortion;
}

- (void)setCheckUUIDBasePortion:(id)a3
{
}

- (NSString)checkUUID
{
  return self->_checkUUID;
}

- (void)setCheckUUID:(id)a3
{
}

- (BOOL)holdingLookupGrant
{
  return self->_holdingLookupGrant;
}

- (void)setHoldingLookupGrant:(BOOL)a3
{
  self->_holdingLookupGrant = a3;
}

- (BOOL)rampingForeground
{
  return self->_rampingForeground;
}

- (void)setRampingForeground:(BOOL)a3
{
  self->_rampingForeground = a3;
}

- (BOOL)rampingForegroundLatched
{
  return self->_rampingForegroundLatched;
}

- (void)setRampingForegroundLatched:(BOOL)a3
{
  self->_rampingForegroundLatched = a3;
}

- (MAMsuDownloadOptions)catalogDownloadOptions
{
  return self->_catalogDownloadOptions;
}

- (void)setCatalogDownloadOptions:(id)a3
{
}

- (MAMsuDownloadOptions)assetDownloadOptions
{
  return self->_assetDownloadOptions;
}

- (void)setAssetDownloadOptions:(id)a3
{
}

- (MADAutoAssetDescriptor)baseForPatch
{
  return self->_baseForPatch;
}

- (void)setBaseForPatch:(id)a3
{
}

- (MADAutoAssetDescriptor)foundNewerPatch
{
  return self->_foundNewerPatch;
}

- (void)setFoundNewerPatch:(id)a3
{
}

- (MADAutoAssetDescriptor)foundNewerFull
{
  return self->_foundNewerFull;
}

- (void)setFoundNewerFull:(id)a3
{
}

- (MADAutoAssetDescriptor)newerFoundAssetDescriptor
{
  return self->_newerFoundAssetDescriptor;
}

- (void)setNewerFoundAssetDescriptor:(id)a3
{
}

- (MADAutoAssetDescriptor)downloadingAssetDescriptor
{
  return self->_downloadingAssetDescriptor;
}

- (void)setDownloadingAssetDescriptor:(id)a3
{
}

- (BOOL)schedulerTriggerReceived
{
  return self->_schedulerTriggerReceived;
}

- (void)setSchedulerTriggerReceived:(BOOL)a3
{
  self->_schedulerTriggerReceived = a3;
}

- (BOOL)haveReceivedLookupResponse
{
  return self->_haveReceivedLookupResponse;
}

- (void)setHaveReceivedLookupResponse:(BOOL)a3
{
  self->_BOOL haveReceivedLookupResponse = a3;
}

- (BOOL)vendingAtomicInstanceForConfiguredEntries
{
  return self->_vendingAtomicInstanceForConfiguredEntries;
}

- (void)setVendingAtomicInstanceForConfiguredEntries:(BOOL)a3
{
  self->_vendingAtomicInstanceForConfiguredEntries = a3;
}

- (BOOL)downloadingUserInitiated
{
  return self->_downloadingUserInitiated;
}

- (void)setDownloadingUserInitiated:(BOOL)a3
{
  self->_BOOL downloadingUserInitiated = a3;
}

- (BOOL)boostedToUserInitiated
{
  return self->_boostedToUserInitiated;
}

- (void)setBoostedToUserInitiated:(BOOL)a3
{
  self->_boostedToUserInitiated = a3;
}

- (BOOL)checkingAssetContent
{
  return self->_checkingAssetContent;
}

- (void)setCheckingAssetContent:(BOOL)a3
{
  self->_checkingAssetContent = a3;
}

- (BOOL)determiningAssetContent
{
  return self->_determiningAssetContent;
}

- (void)setDeterminingAssetContent:(BOOL)a3
{
  self->_determiningAssetContent = a3;
}

- (BOOL)lockingAssetContent
{
  return self->_lockingAssetContent;
}

- (void)setLockingAssetContent:(BOOL)a3
{
  self->_lockingAssetContent = a3;
}

- (BOOL)wasPatched
{
  return self->_wasPatched;
}

- (void)setWasPatched:(BOOL)a3
{
  self->_wasPatched = a3;
}

- (NSString)latestInstalledAssetVersion
{
  return self->_latestInstalledAssetVersion;
}

- (void)setLatestInstalledAssetVersion:(id)a3
{
}

- (NSString)latestInstalledAssetBuild
{
  return self->_latestInstalledAssetBuild;
}

- (void)setLatestInstalledAssetBuild:(id)a3
{
}

- (MAAutoAssetStatus)currentStatus
{
  return self->_currentStatus;
}

- (void)setCurrentStatus:(id)a3
{
}

- (int64_t)progressReportPhase
{
  return self->_progressReportPhase;
}

- (void)setProgressReportPhase:(int64_t)a3
{
  self->_progressReportPhase = a3;
}

- (MAAutoAssetProgress)lastReportedPatchProgress
{
  return self->_lastReportedPatchProgress;
}

- (void)setLastReportedPatchProgress:(id)a3
{
}

- (MAAutoAssetSelector)resultSelector
{
  return self->_resultSelector;
}

- (void)setResultSelector:(id)a3
{
}

- (MAAutoAssetInfoInstance)resultInstance
{
  return self->_resultInstance;
}

- (void)setResultInstance:(id)a3
{
}

- (MAAutoAssetInfoFound)resultFound
{
  return self->_resultFound;
}

- (void)setResultFound:(id)a3
{
}

- (MAAutoAssetInfoEnd)resultEnd
{
  return self->_resultEnd;
}

- (void)setResultEnd:(id)a3
{
}

- (MAAutoAssetInfoListen)resultListen
{
  return self->_resultListen;
}

- (void)setResultListen:(id)a3
{
}

- (int64_t)simulateOperation
{
  return self->_simulateOperation;
}

- (void)setSimulateOperation:(int64_t)a3
{
  self->_simulateOperation = a3;
}

- (int64_t)simulateEnd
{
  return self->_simulateEnd;
}

- (void)setSimulateEnd:(int64_t)a3
{
  self->_simulateEnd = a3;
}

- (int64_t)simulateTriggered
{
  return self->_simulateTriggered;
}

- (void)setSimulateTriggered:(int64_t)a3
{
  self->_simulateTriggered = a3;
}

- (MADAutoAssetDescriptor)simulateDescriptor
{
  return self->_simulateDescriptor;
}

- (void)setSimulateDescriptor:(id)a3
{
}

- (MADAutoAssetDescriptor)simulateBaseForPatch
{
  return self->_simulateBaseForPatch;
}

- (void)setSimulateBaseForPatch:(id)a3
{
}

- (MADAutoSetConfiguration)setConfiguration
{
  return self->_setConfiguration;
}

- (void)setSetConfiguration:(id)a3
{
}

- (NSDictionary)cachedAutoAssetCatalog
{
  return self->_cachedAutoAssetCatalog;
}

- (void)setCachedAutoAssetCatalog:(id)a3
{
}

- (MADAutoSetJobInformation)setJobInformation
{
  return self->_setJobInformation;
}

- (void)setSetJobInformation:(id)a3
{
}

- (MANAutoAssetSetInfoInstance)autoAssetSetInstance
{
  return self->_autoAssetSetInstance;
}

- (void)setAutoAssetSetInstance:(id)a3
{
}

- (MANAutoAssetSetInfoDesire)autoAssetSetDesire
{
  return self->_autoAssetSetDesire;
}

- (void)setAutoAssetSetDesire:(id)a3
{
}

- (MANAutoAssetSetPolicy)schedulerSetPolicy
{
  return self->_schedulerSetPolicy;
}

- (void)setSchedulerSetPolicy:(id)a3
{
}

- (MANAutoAssetSetPolicy)stagerSetPolicy
{
  return self->_stagerSetPolicy;
}

- (void)setStagerSetPolicy:(id)a3
{
}

- (MANAutoAssetSetStatus)currentSetStatus
{
  return self->_currentSetStatus;
}

- (void)setCurrentSetStatus:(id)a3
{
}

- (MANAutoAssetSetNotifications)currentSetNotifications
{
  return self->_currentSetNotifications;
}

- (void)setCurrentSetNotifications:(id)a3
{
}

- (MANAutoAssetSetPolicy)aggregatedClientSetPolicy
{
  return self->_aggregatedClientSetPolicy;
}

- (void)setAggregatedClientSetPolicy:(id)a3
{
}

- (BOOL)aggregatedClientSetPolicySpecified
{
  return self->_aggregatedClientSetPolicySpecified;
}

- (void)setAggregatedClientSetPolicySpecified:(BOOL)a3
{
  self->_aggregatedClientSetPolicySpecified = a3;
}

- (int64_t)setProgressOverallTotalWrittenBytes
{
  return self->_setProgressOverallTotalWrittenBytes;
}

- (void)setSetProgressOverallTotalWrittenBytes:(int64_t)a3
{
  self->_setProgressOverallTotalWrittenBytes = a3;
}

- (int64_t)setProgressAssetTotalWrittenBytes
{
  return self->_setProgressAssetTotalWrittenBytes;
}

- (void)setSetProgressAssetTotalWrittenBytes:(int64_t)a3
{
  self->_setProgressAssetTotalWrittenBytes = a3;
}

- (MADAutoSetDescriptor)assignedSetDescriptor
{
  return self->_assignedSetDescriptor;
}

- (void)setAssignedSetDescriptor:(id)a3
{
}

- (NSMutableDictionary)latestAssetDescriptorOnFilesystemBySpecifier
{
  return self->_latestAssetDescriptorOnFilesystemBySpecifier;
}

- (void)setLatestAssetDescriptorOnFilesystemBySpecifier:(id)a3
{
}

- (NSMutableDictionary)foundSetPatchDescriptorsBySpecifier
{
  return self->_foundSetPatchDescriptorsBySpecifier;
}

- (void)setFoundSetPatchDescriptorsBySpecifier:(id)a3
{
}

- (NSMutableDictionary)foundSetFullDescriptorsBySpecifier
{
  return self->_foundSetFullDescriptorsBySpecifier;
}

- (void)setFoundSetFullDescriptorsBySpecifier:(id)a3
{
}

- (NSArray)foundSetNewerDiscoveredAtomicEntries
{
  return self->_foundSetNewerDiscoveredAtomicEntries;
}

- (void)setFoundSetNewerDiscoveredAtomicEntries:(id)a3
{
}

- (BOOL)foundSameAtomicInstanceAlreadyDownloaded
{
  return self->_foundSameAtomicInstanceAlreadyDownloaded;
}

- (void)setFoundSameAtomicInstanceAlreadyDownloaded:(BOOL)a3
{
  self->_foundSameAtomicInstanceAlreadyDownloaded = a3;
}

- (NSMutableArray)prePersonalizedSelectors
{
  return self->_prePersonalizedSelectors;
}

- (void)setPrePersonalizedSelectors:(id)a3
{
}

- (NSMutableArray)tryPersonalizeDescriptors
{
  return self->_tryPersonalizeDescriptors;
}

- (void)setTryPersonalizeDescriptors:(id)a3
{
}

- (MAAutoAssetSelector)tryPersonalizeSelector
{
  return self->_tryPersonalizeSelector;
}

- (void)setTryPersonalizeSelector:(id)a3
{
}

- (BOOL)tryPersonalizeSuccess
{
  return self->_tryPersonalizeSuccess;
}

- (void)setTryPersonalizeSuccess:(BOOL)a3
{
  self->_tryPersonalizeSuccess = a3;
}

- (BOOL)tryPersonalizeFailed
{
  return self->_tryPersonalizeFailed;
}

- (void)setTryPersonalizeFailed:(BOOL)a3
{
  self->_tryPersonalizeFailed = a3;
}

- (BOOL)becameLatestToVend
{
  return self->_becameLatestToVend;
}

- (void)setBecameLatestToVend:(BOOL)a3
{
  self->_becameLatestToVend = a3;
}

- (MANAutoAssetSetStatus)newestDownloadedSetStatus
{
  return self->_newestDownloadedSetStatus;
}

- (void)setNewestDownloadedSetStatus:(id)a3
{
}

- (MADAutoSetDescriptor)autoAssetSetDescriptor
{
  return self->_autoAssetSetDescriptor;
}

- (void)setAutoAssetSetDescriptor:(id)a3
{
}

- (int64_t)nextSetSpecifierToDownload
{
  return self->_nextSetSpecifierToDownload;
}

- (void)setNextSetSpecifierToDownload:(int64_t)a3
{
  self->_nextSetSpecifierToDownload = a3;
}

- (MANAutoAssetSetSummary)latestAutoAssetSetSummary
{
  return self->_latestAutoAssetSetSummary;
}

- (void)setLatestAutoAssetSetSummary:(id)a3
{
}

- (BOOL)anomalyNoAssignedSetDescriptor
{
  return self->_anomalyNoAssignedSetDescriptor;
}

- (void)setAnomalyNoAssignedSetDescriptor:(BOOL)a3
{
  self->_anomalyNoAssignedSetDescriptor = a3;
}

- (BOOL)anomalyNoActiveSetDescriptor
{
  return self->_anomalyNoActiveSetDescriptor;
}

- (void)setAnomalyNoActiveSetDescriptor:(BOOL)a3
{
  self->_anomalyNoActiveSetDescriptor = a3;
}

- (NSString)setSpaceCheckedUUID
{
  return self->_setSpaceCheckedUUID;
}

- (void)setSetSpaceCheckedUUID:(id)a3
{
}

- (MANAutoAssetSetInfoFound)resultSetFound
{
  return self->_resultSetFound;
}

- (void)setResultSetFound:(id)a3
{
}

- (BOOL)reportingProgress
{
  return self->_reportingProgress;
}

- (void)setReportingProgress:(BOOL)a3
{
  self->_reportingProgress = a3;
}

- (int)progressLogsFilteredCount
{
  return self->_progressLogsFilteredCount;
}

- (void)setProgressLogsFilteredCount:(int)a3
{
  self->_progressLogsFilteredCount = a3;
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

  ;
}

  ;
}

  ;
}

  ;
}

  ;
}

- (void)initForInstance:(void *)a1 orForSelector:orForDescriptor:orForSetInstance:withSetDesire:withSchedulerSetPolicy:withStagerSetPolicy:usingSetConfiguration:usingSetDescriptor:withBaseForPatchDescriptor:withAutoAssetUUID:downloadingUserInitiated:asStagerJob:usingCachedAutoAssetCatalog:.cold.1( void *a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue([a1 summary]);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1_1( &dword_0,  v2,  v3,  "%{public}@|{initForInstance} [MA_BRAIN_SHIM_PROTOCOL_SUPPORT] unable to create current status for job",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_10();
}

- (void)action_DecideStartupDownloading:error:.cold.1()
{
  id v2 = [(id)OUTLINED_FUNCTION_8() _updateLatestSummary];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_0_0( &dword_0,  v4,  v5,  "%{public}@ {DecideStartupDownloading} [MA_BRAIN_SHIM_PROTOCOL_SUPPORT] unable to create current status for job\n JOB-SUMMARY:%{public}@",  v6,  v7,  v8,  v9,  v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)action_DecideStartupDownloading:error:.cold.2()
{
  id v2 = [(id)OUTLINED_FUNCTION_8() _updateLatestSummary];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_0_0( &dword_0,  v4,  v5,  "%{public}@ {DecideStartupDownloading} | inFlightDescriptor not provided\nJOB-SUMMARY:%{public}@",  v6,  v7,  v8,  v9,  v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)action_ReportFailureUserInitiated:error:.cold.1()
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 autoJobName]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v0 finishedError]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetClientRequest responseErrorSummary:]( &OBJC_CLASS___MADAutoAssetClientRequest,  "responseErrorSummary:",  v4));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v1 _updateLatestSummary]);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_6( &dword_0,  v7,  v8,  "%{public}@ | unable to boost to user-initiated | error:%{public}@\nJOB-SUMMARY:%{public}@",  v9,  v10,  v11,  v12,  2u);

  OUTLINED_FUNCTION_8_0();
}

- (void)action_ReportFailBoostSetDownloadNext:error:.cold.1()
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 autoJobName]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v0 finishedError]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetClientRequest responseErrorSummary:]( &OBJC_CLASS___MADAutoAssetClientRequest,  "responseErrorSummary:",  v4));
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v1 _updateLatestSummary]);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_6( &dword_0,  v7,  v8,  "%{public}@ | unable to boost set-job to user-initiated | error:%{public}@\nJOB-SUMMARY:%{public}@",  v9,  v10,  v11,  v12,  2u);

  OUTLINED_FUNCTION_8_0();
}

- (void)reportJustDownloadedAssetOfSet:.cold.1()
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([v0 autoJobName]);
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_0_0( &dword_0,  v2,  v3,  "%{public}@ {reportJustDownloadedAssetOfSet} | unable to create asset-descriptor for just-downloaded asset | invalid:%{public}@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)_autoAssetJobFinished:(void *)a1 forJobFinishedReason:failingWithError:.cold.1(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 autoJobName]);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1_1( &dword_0,  v2,  v3,  "%{public}@ | {autoAssetJobFinished} [MA_BRAIN_SHIM_PROTOCOL_SUPPORT] unable to create current status for job",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_10();
}

- (void)replyToJobsWhenCatalogDownloaded:discoveredNewer:.cold.1()
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([v0 autoJobName]);
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_0( &dword_0,  v2,  v3,  "%{public}@ | {%{public}@:replyToJobsWhenCatalogDownloaded} stager-job encountering presumed stale trigger to reply o n catalog download",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_2_0();
}

- (void)_newSelectorForCachedAssetCatalog:(void *)a1 .cold.1(void *a1)
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([a1 safeSummary]);
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1_1( &dword_0,  v2,  v3,  "{_newSelectorForCachedAssetCatalog} Selector could not be determined from set-catalog lookup response | autoAssetSet Catalog:%{public}@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_10();
}

- (void)isFoundAlreadyOnFilesystem:(void *)a1 .cold.1(void *a1, os_log_s *a2)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([a1 autoJobName]);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a1 foundNewerPatch]);
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v5 summary]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a1 foundNewerFull]);
  uint8_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 summary]);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([a1 _updateLatestSummary]);
  int v10 = 138544130;
  uint64_t v11 = v4;
  __int16 v12 = 2114;
  id v13 = v6;
  __int16 v14 = 2114;
  uint64_t v15 = v8;
  __int16 v16 = 2114;
  id v17 = v9;
  _os_log_error_impl( &dword_0,  a2,  OS_LOG_TYPE_ERROR,  "%{public}@ | {isFoundAlreadyOnFilesystem} found multiple assets on filesystem that represent the same downloaded con tent | patch:%{public}@, full:%{public}@\n JOB-SUMMARY:%{public}@",  (uint8_t *)&v10,  0x2Au);

  OUTLINED_FUNCTION_12_0();
}

- (void)_commitPrePersonalized:error:.cold.1()
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue([v2 autoJobName]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue([v1 prePersonalizedSelectors]);
  [v4 count];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v0 checkedDescription]);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_6( &dword_0,  v6,  v7,  "%{public}@\n [AUTO-SECURE][AUTO-PERSONALIZATION][SET-JOB-PRE] failure committing pre-personalized | prePersonalizedSelectors:%ld | error:%{public}@",  v8,  v9,  v10,  v11,  2u);

  OUTLINED_FUNCTION_8_0();
}

- (void)autoAssetSetAssetType
{
  id v1 = (void *)objc_claimAutoreleasedReturnValue([*a1 summary]);
  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_0_0( &dword_0,  v2,  v3,  "{autoAssetSetAssetType} no assetType | setConfiguration:%{public}@ | using:%{public}@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_10();
}

- (void)simulateSet:(os_log_s *)a3 .cold.1(void *a1, void *a2, os_log_s *a3)
{
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([a1 autoJobName]);
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([a2 controlInformation]);
  uint8_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetInfoControl nameOfSimulateOperation:]( MANAutoAssetInfoControl,  "nameOfSimulateOperation:",  [v7 simulateOperation]));
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetInfoControl nameOfSimulateOperation:]( MANAutoAssetInfoControl,  "nameOfSimulateOperation:",  [a1 simulateOperation]));
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[MANAutoAssetInfoControl nameOfSimulateEnd:]( MANAutoAssetInfoControl,  "nameOfSimulateEnd:",  [a1 simulateEnd]));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([a1 _updateLatestSummary]);
  int v12 = 138544386;
  id v13 = v6;
  __int16 v14 = 2114;
  uint64_t v15 = v8;
  __int16 v16 = 2114;
  id v17 = v9;
  __int16 v18 = 2114;
  id v19 = v10;
  __int16 v20 = 2114;
  BOOL v21 = v11;
  _os_log_error_impl( &dword_0,  a3,  OS_LOG_TYPE_ERROR,  "%{public}@ {simulateSet} | unable to set new simulate operation(%{public}@) [already have operation] | simulateOpera tion:%{public}@, simulateEnd:%{public}@\n JOB-SUMMARY:%{public}@",  (uint8_t *)&v12,  0x34u);

  OUTLINED_FUNCTION_12_0();
}

- (void)simulateSet:.cold.2()
{
  id v2 = [(id)OUTLINED_FUNCTION_8() _updateLatestSummary];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_0_0( &dword_0,  v4,  v5,  "%{public}@ {simulateSet} | SIMULATE_SET | older MAAutoAsset framework without support for simulateOperation,simulate End\n JOB-SUMMARY:%{public}@",  v6,  v7,  v8,  v9,  v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)simulateEnd:.cold.1()
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue([v1 autoJobName]);
  objc_claimAutoreleasedReturnValue( +[MANAutoAssetInfoControl nameOfSimulateEnd:]( MANAutoAssetInfoControl,  "nameOfSimulateEnd:",  [v0 simulateEnd]));
  id v3 = [(id)OUTLINED_FUNCTION_16_1() _updateLatestSummary];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_6( &dword_0,  v5,  v6,  "%{public}@ {simulateEnd} | SIMULATE_END(%{public}@) | no simulateOperation to end\nJOB-SUMMARY:%{public}@",  v7,  v8,  v9,  v10,  2u);

  OUTLINED_FUNCTION_7();
}

- (void)simulateEnd:.cold.2()
{
  id v2 = [(id)OUTLINED_FUNCTION_16_1() _updateLatestSummary];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_6( &dword_0,  v4,  v5,  "%{public}@ {simulateEnd} | SIMULATE_END(%lld) | not applicable to auto-job\nJOB-SUMMARY:%{public}@",  v6,  v7,  v8,  v9,  v10);

  OUTLINED_FUNCTION_7();
}

- (void)simulateEnd:.cold.3()
{
  id v2 = [(id)OUTLINED_FUNCTION_16_1() _updateLatestSummary];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_6( &dword_0,  v4,  v5,  "%{public}@ {simulateEnd} | SIMULATE_END(%lld) | no simulateOperation to end\nJOB-SUMMARY:%{public}@",  v6,  v7,  v8,  v9,  v10);

  OUTLINED_FUNCTION_7();
}

- (void)determineWhetherNetworkConnectivityError:.cold.1()
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 autoJobName]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetClientRequest responseErrorSummary:]( &OBJC_CLASS___MADAutoAssetClientRequest,  "responseErrorSummary:",  v0));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v1 _updateLatestSummary]);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_6( &dword_0,  v6,  v7,  "%{public}@ | {determineWhetherNetworkConnectivityError} no underlying | jobFinishedError:%{public}@\n JOB-SUMMARY:%{public}@",  v8,  v9,  v10,  v11,  2u);

  OUTLINED_FUNCTION_7();
}

- (void)determineWhetherNetworkConnectivityError:.cold.2()
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 autoJobName]);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue( +[MADAutoAssetClientRequest responseErrorSummary:]( &OBJC_CLASS___MADAutoAssetClientRequest,  "responseErrorSummary:",  v0));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([v1 _updateLatestSummary]);
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_6( &dword_0,  v6,  v7,  "%{public}@ | {determineWhetherNetworkConnectivityError} potential network failure | underlyingError:%{public}@\n JOB-SUMMARY:%{public}@",  v8,  v9,  v10,  v11,  2u);

  OUTLINED_FUNCTION_7();
}

- (void)determineWhetherNetworkConnectivityError:.cold.3()
{
  id v2 = [(id)OUTLINED_FUNCTION_8() _updateLatestSummary];
  id v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_0_0( &dword_0,  v4,  v5,  "%{public}@ | {determineWhetherNetworkConnectivityError} non-networking failure | underlyingError:%{public}@",  v6,  v7,  v8,  v9,  v10);

  OUTLINED_FUNCTION_2_0();
}

@end