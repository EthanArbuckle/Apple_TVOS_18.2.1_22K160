@interface CPLCloudKitTransport
+ (BOOL)allowsSyncOverCellular;
+ (BOOL)allowsSyncOverExpensiveNetwork;
+ (BOOL)allowsUserInitiatedOperationsOverExpensiveNetwork;
+ (NSArray)involvedProcesses;
+ (id)_betterErrorForRecordId:(id)a3 recordError:(id)a4;
+ (id)_errorsByTaskForTasksByRecordId:(id)a3 fromUnderlyingError:(id)a4;
- (BOOL)_isAppLibrary;
- (BOOL)canBoostBackgroundOperations;
- (BOOL)canBoostOperations;
- (BOOL)getProposedStagingScopeIdentifier:(id *)a3 stagingTransportScope:(id *)a4 forScope:(id)a5 transportScope:(id)a6 transportUserIdentifier:(id)a7;
- (BOOL)isAppLibrary;
- (BOOL)isForeground;
- (BOOL)isInterestedInZoneID:(id)a3 forCoordinator:(id)a4;
- (BOOL)isNetworkConnected;
- (BOOL)isNewTransportScope:(id)a3 compatibleWithOldTransportScope:(id)a4;
- (BOOL)isResourceDynamic:(id)a3;
- (BOOL)isSystemLibrary;
- (BOOL)opened;
- (BOOL)shouldIgnoreScopeWithIdentifier:(id)a3;
- (BOOL)shouldIgnoreZoneWithZoneID:(id)a3;
- (BOOL)shouldRunOperationsWithError:(id *)a3;
- (BOOL)supportsSharedDatabase;
- (CPLCloudKitCoordinator)coordinator;
- (CPLCloudKitOperationGroupMapper)operationGroupMapper;
- (CPLCloudKitOperationsTracker)operationTracker;
- (CPLCloudKitReschedulerManager)reschedulerManager;
- (CPLCloudKitTransport)initWithAbstractObject:(id)a3;
- (CPLCloudKitZoneManager)zoneManager;
- (CPLDuetTicketProvider)duetTicketProvider;
- (CPLFingerprintContext)fingerprintContext;
- (CPLSharedRecordPropertyMapping)propertyMapping;
- (Class)transportGroupClass;
- (Class)userIdentifierClass;
- (NSArray)involvedProcesses;
- (NSDate)significantWorkBeginDate;
- (NSError)errorForAllOperations;
- (NSString)cloudKitClientIdentifier;
- (NSString)defaultSourceBundleIdentifier;
- (NSString)mainScopeIdentifier;
- (OS_dispatch_queue)workQueue;
- (id)_tempDestinationURLForRecoveredDataWithTempFolderURL:(id)a3;
- (id)acceptTaskForSharedScope:(id)a3 completionHandler:(id)a4;
- (id)acquireReschedulerTaskWithCompletionHandler:(id)a3;
- (id)bestErrorForUnderlyingError:(id)a3;
- (id)cleanupStagedScope:(id)a3 stagingScope:(id)a4 destinationScope:(id)a5 transportScopeMapping:(id)a6 progressHandler:(id)a7 completionHandler:(id)a8;
- (id)cloudKitScopeForScopeIdentifier:(id)a3;
- (id)componentName;
- (id)concreteScopeFromTransportScope:(id)a3;
- (id)createGroupAllowsCellular:(BOOL)a3 allowsExpensiveNetwork:(BOOL)a4 foreground:(BOOL)a5 upload:(BOOL)a6 metadata:(BOOL)a7;
- (id)createGroupForAcceptingLibraryShare;
- (id)createGroupForAcceptingMomentShare;
- (id)createGroupForAnalysisDownload;
- (id)createGroupForChangeDownload;
- (id)createGroupForChangeUpload;
- (id)createGroupForCleanupLibrary;
- (id)createGroupForComputeStateDownloadOnDemand;
- (id)createGroupForComputeStateDownloadPrefetch;
- (id)createGroupForComputeStateUpload;
- (id)createGroupForDownloadWithIntent:(unint64_t)a3 priority:(unint64_t)a4;
- (id)createGroupForExitSharedLibrary;
- (id)createGroupForFeedback;
- (id)createGroupForFetchScopeListChanges;
- (id)createGroupForFetchingExistingSharedScope;
- (id)createGroupForFetchingLibraryShare;
- (id)createGroupForFetchingMomentShare;
- (id)createGroupForFixUpTasks;
- (id)createGroupForInitialDownload;
- (id)createGroupForInitialUpload;
- (id)createGroupForKeepOriginalsPrefetch;
- (id)createGroupForLibraryStateCheck;
- (id)createGroupForMemoriesPrefetch;
- (id)createGroupForMovieStreamingWithIntent:(unint64_t)a3;
- (id)createGroupForNonDerivativePrefetch;
- (id)createGroupForPrefetch;
- (id)createGroupForPropagateChanges;
- (id)createGroupForPruningCheck;
- (id)createGroupForPublishingLibraryShare;
- (id)createGroupForPublishingMomentShare;
- (id)createGroupForQueryUserIdentities;
- (id)createGroupForRecoveryDownload;
- (id)createGroupForResetSync;
- (id)createGroupForReshare;
- (id)createGroupForResourcesDownload;
- (id)createGroupForSendExitStatus;
- (id)createGroupForSetup;
- (id)createGroupForSharedLibraryRampCheck;
- (id)createGroupForStagedScopeCleanup;
- (id)createGroupForThumbnailPrefetch;
- (id)createGroupForThumbnailsDownload;
- (id)createGroupForTransportScopeDelete;
- (id)createGroupForTransportScopeRefresh;
- (id)createGroupForTransportScopeUpdate;
- (id)createGroupForWidgetPrefetch;
- (id)createGroupForWidgetResourcesDownload;
- (id)createReschedulerForSession:(id)a3;
- (id)createScopeTaskForScope:(id)a3 completionHandler:(id)a4;
- (id)databaseForOperationType:(int64_t)a3 relativeToOperationType:(int64_t)a4;
- (id)deleteTransportScope:(id)a3 scope:(id)a4 completionHandler:(id)a5;
- (id)descriptionForTransportScope:(id)a3;
- (id)downloadBatchTaskForSyncAnchor:(id)a3 scope:(id)a4 transportScopeMapping:(id)a5 currentScopeChange:(id)a6 progressHandler:(id)a7 completionHandler:(id)a8;
- (id)downloadComputeStatesWithScopedIdentifiers:(id)a3 scope:(id)a4 sharedScope:(id)a5 targetStorageURL:(id)a6 transportScopeMapping:(id)a7 completionHandler:(id)a8;
- (id)engineLibrary;
- (id)fetchExistingSharedLibraryScopeTaskWithCompletionHandler:(id)a3;
- (id)fetchRecordsTaskForRecordsWithScopedIdentifiers:(id)a3 targetMapping:(id)a4 transportScopeMapping:(id)a5 completionHandler:(id)a6;
- (id)fetchScopeListChangesForScopeListSyncAnchor:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
- (id)fetchTaskForScopeWithShareURL:(id)a3 completionHandler:(id)a4;
- (id)fetchTransportScopeForScope:(id)a3 transportScope:(id)a4 completionHandler:(id)a5;
- (id)fixUpSparseRecordsTaskWithTasks:(id)a3 transportScopeMapping:(id)a4 completionHandler:(id)a5;
- (id)getCurrentSyncAnchorWithTransportScope:(id)a3 scope:(id)a4 previousScopeChange:(id)a5 completionHandler:(id)a6;
- (id)getScopeInfoWithTransportScope:(id)a3 scope:(id)a4 previousScopeChange:(id)a5 completionHandler:(id)a6;
- (id)getStreamingURLTaskForResource:(id)a3 intent:(unint64_t)a4 hints:(id)a5 timeRange:(id *)a6 target:(id)a7 transportScopeMapping:(id)a8 clientBundleID:(id)a9 completionHandler:(id)a10;
- (id)inMemoryDownloadTaskForResource:(id)a3 record:(id)a4 target:(id)a5 transportScopeMapping:(id)a6 clientBundleID:(id)a7 completionHandler:(id)a8;
- (id)interestingZoneIDsForCoordinator:(id)a3;
- (id)newOperationConfiguration;
- (id)queryTaskForCursor:(id)a3 class:(Class)a4 scope:(id)a5 transportScopeMapping:(id)a6 progressHandler:(id)a7 completionHandler:(id)a8;
- (id)queryUserDetailsTaskForParticipants:(id)a3 completionHandler:(id)a4;
- (id)rampingRequestTaskForResourceType:(unint64_t)a3 numRequested:(unint64_t)a4 completionHandler:(id)a5;
- (id)recordsToFetchToIdentifyCloudKitScope:(id)a3 proposedScopeType:(int64_t)a4 currentUserID:(id)a5;
- (id)removeParticipantInSharedLibraryTaskFromSharedScope:(id)a3 transportScope:(id)a4 share:(id)a5 retentionPolicy:(int64_t)a6 exitSource:(int64_t)a7 userIdentifiersToRemove:(id)a8 participantIDsToRemove:(id)a9 completionHandler:(id)a10;
- (id)reshareRecordsTaskWithRecords:(id)a3 sourceScope:(id)a4 destinationScope:(id)a5 transportScopeMapping:(id)a6 completionHandler:(id)a7;
- (id)resourceCheckTaskForResources:(id)a3 targetMapping:(id)a4 transportScopeMapping:(id)a5 completionHandler:(id)a6;
- (id)resourcesDownloadTaskWithCompletionHandler:(id)a3;
- (id)scopeIdentifierFromZoneID:(id)a3;
- (id)scopeNameForTransportScope:(id)a3;
- (id)scopedIdentifierForCKRecordID:(id)a3;
- (id)sendFeedbackTaskForMessages:(id)a3 completionHandler:(id)a4;
- (id)setupTaskUpdateDisabledFeatures:(BOOL)a3 completionHandler:(id)a4;
- (id)sharedLibraryServerRampTaskWithCompletionHandler:(id)a3;
- (id)shouldIgnoreZoneWithZoneID;
- (id)simpleDescriptionForScopeListSyncAnchor:(id)a3;
- (id)simpleDescriptionForSyncAnchor:(id)a3;
- (id)startExitTaskFromSharedScope:(id)a3 transportScope:(id)a4 share:(id)a5 retentionPolicy:(int64_t)a6 exitSource:(int64_t)a7 completionHandler:(id)a8;
- (id)tentativeConcreteScopeForScope:(id)a3;
- (id)transportScopeForUpgradeFromScopeName:(id)a3;
- (id)transportScopeFromConcreteScope:(id)a3;
- (id)updateContributorsTaskWithSharedScope:(id)a3 contributorsUpdates:(id)a4 transportScopeMapping:(id)a5 completionHandler:(id)a6;
- (id)updateShareTaskForScope:(id)a3 transportScope:(id)a4 completionHandler:(id)a5;
- (id)updateTransportScope:(id)a3 scope:(id)a4 scopeChange:(id)a5 completionHandler:(id)a6;
- (id)uploadBatchTaskForBatch:(id)a3 scope:(id)a4 targetMapping:(id)a5 transportScopeMapping:(id)a6 progressHandler:(id)a7 completionHandler:(id)a8;
- (id)uploadComputeStates:(id)a3 scope:(id)a4 sharedScope:(id)a5 targetMapping:(id)a6 transportScopeMapping:(id)a7 knownRecords:(id)a8 completionHandler:(id)a9;
- (id)zoneIDFromScopeIdentifier:(id)a3;
- (id)zoneIdentificationForCloudKitScope:(id)a3 engineScope:(id)a4;
- (int64_t)scopeTypeForCloudKitScope:(id)a3 proposedScopeType:(int64_t)a4 fetchedRecords:(id)a5 currentUserID:(id)a6;
- (void)_cleanTempRecoveredDataURL:(id)a3;
- (void)_coordinator:(id)a3 provideCKAssetWithRecordID:(id)a4 fieldName:(id)a5 recordType:(id)a6 signature:(id)a7 tempFolderURL:(id)a8 completionHandler:(id)a9;
- (void)_disableSchedulerBecauseAccountIsUnavailableWithReason:(id)a3;
- (void)_enableSchedulerBecauseAccountIsAvailable;
- (void)_failAllFutureOperationsWithContainerHasBeenWipedError;
- (void)_forceUpdateAccountInfoWithReason:(id)a3;
- (void)_forceUpdateAccountInfoWithReason:(id)a3 completionHandler:(id)a4;
- (void)_noteContainerHasBeenWiped;
- (void)_startWatchingAccountInfoChangesWithCompletionHandler:(id)a3;
- (void)_stopWatchingAccountInfoChanges;
- (void)_updateAccountInfoWithCompletionHandler:(id)a3;
- (void)_updateBudgets;
- (void)_updateStateWithAccountInfo:(id)a3 walrusEnabledDefault:(id)a4;
- (void)_updateStateWithAccountStatus:(int64_t)a3;
- (void)_updateWalrusTo:(BOOL)a3;
- (void)_withTempCKAssetForData:(id)a3 tempFolderURL:(id)a4 block:(id)a5;
- (void)acquireHelperWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)associateMetric:(id)a3;
- (void)cancelBlockedTasksIncludingBackground:(BOOL)a3;
- (void)closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4;
- (void)coordinator:(id)a3 provideCKAssetWithRecordID:(id)a4 fieldName:(id)a5 recordType:(id)a6 signature:(id)a7 completionHandler:(id)a8;
- (void)coordinatorDidReceiveAPushNotification:(id)a3;
- (void)dropPersistedInitialSyncSession;
- (void)duetTicketProviderBlockedStatusDidChange;
- (void)findPersistedInitialSyncSession:(id)a3 completionHandler:(id)a4;
- (void)getStatusDictionaryWithCompletionHandler:(id)a3;
- (void)getStatusWithCompletionHandler:(id)a3;
- (void)getSystemBudgetsWithCompletionHandler:(id)a3;
- (void)getTemporaryFolderWithName:(id)a3 completionHandler:(id)a4;
- (void)launchOperation:(id)a3 type:(int64_t)a4;
- (void)noteClientIsBeginningSignificantWork;
- (void)noteClientIsEndingSignificantWork;
- (void)noteClientIsInBackground;
- (void)noteClientIsInForeground;
- (void)noteZoneIDChangeWasIgnored:(id)a3;
- (void)openWithCompletionHandler:(id)a3;
- (void)processTaskErrorIfNeeded:(id)a3 forTask:(id)a4;
- (void)registerHelper:(id)a3 withIdentifier:(id)a4;
- (void)setErrorForAllOperations:(id)a3;
- (void)setFingerprintContext:(id)a3;
- (void)setIsSignificantWorkPending:(BOOL)a3;
- (void)setOpened:(BOOL)a3;
- (void)setOperationGroupMapper:(id)a3;
- (void)setReschedulerManager:(id)a3;
- (void)setShouldIgnoreZoneWithZoneID:(id)a3;
- (void)setShouldOverride:(BOOL)a3 forSystemBudgets:(unint64_t)a4;
- (void)setSignificantWorkBeginDate:(id)a3;
- (void)setZoneManager:(id)a3;
- (void)testKey:(id)a3 value:(id)a4 completionHandler:(id)a5;
- (void)upgradeFlags:(id)a3 fromTransportScope:(id)a4;
@end

@implementation CPLCloudKitTransport

- (BOOL)isSystemLibrary
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport abstractObject](self, "abstractObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 engineLibrary]);
  unsigned __int8 v4 = [v3 isSystemLibrary];

  return v4;
}

- (BOOL)isAppLibrary
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport abstractObject](self, "abstractObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 engineLibrary]);
  unsigned __int8 v4 = [v3 isAppLibrary];

  return v4;
}

- (NSString)mainScopeIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport abstractObject](self, "abstractObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 engineLibrary]);
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue([v3 mainScopeIdentifier]);

  return (NSString *)v4;
}

- (CPLCloudKitTransport)initWithAbstractObject:(id)a3
{
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___CPLCloudKitTransport;
  v3 = -[CPLCloudKitTransport initWithAbstractObject:](&v27, "initWithAbstractObject:", a3);
  unsigned __int8 v4 = v3;
  if (v3)
  {
    BOOL v5 = -[CPLCloudKitTransport isSystemLibrary](v3, "isSystemLibrary");
    if (v5)
    {
      uint64_t v6 = objc_claimAutoreleasedReturnValue( +[CPLDuetTicketProvider sharedDuetTicketProvider]( &OBJC_CLASS___CPLDuetTicketProvider,  "sharedDuetTicketProvider"));
      duetTicketProvider = v4->_duetTicketProvider;
      v4->_duetTicketProvider = (CPLDuetTicketProvider *)v6;
    }

    uint64_t v8 = CPLCopyDefaultSerialQueueAttributes(v5);
    v9 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v8);
    dispatch_queue_t v10 = dispatch_queue_create("com.apple.cpl.cloudkit", v9);
    workQueue = v4->_workQueue;
    v4->_workQueue = (OS_dispatch_queue *)v10;

    v12 = objc_alloc_init(&OBJC_CLASS___NSOperationQueue);
    workOperationQueue = v4->_workOperationQueue;
    v4->_workOperationQueue = v12;

    -[NSOperationQueue setUnderlyingQueue:](v4->_workOperationQueue, "setUnderlyingQueue:", v4->_workQueue);
    v14 = objc_alloc_init(&OBJC_CLASS___CPLCloudKitOperationsTracker);
    operationTracker = v4->_operationTracker;
    v4->_operationTracker = v14;

    uint64_t v16 = objc_claimAutoreleasedReturnValue(+[CPLCloudKitCoordinator sharedCoordinator](&OBJC_CLASS___CPLCloudKitCoordinator, "sharedCoordinator"));
    coordinator = v4->_coordinator;
    v4->_coordinator = (CPLCloudKitCoordinator *)v16;

    v18 = -[CPLCloudKitSimpleCache initWithLeewayInterval:maximumCapacity:]( objc_alloc(&OBJC_CLASS___CPLCloudKitSimpleCache),  "initWithLeewayInterval:maximumCapacity:",  100LL,  900.0);
    streamingContentItemCache = v4->_streamingContentItemCache;
    v4->_streamingContentItemCache = v18;

    v20 = objc_alloc_init(&OBJC_CLASS___CPLCloudKitTaskGroupThrottler);
    streamingGate = v4->_streamingGate;
    v4->_streamingGate = v20;

    v22 = objc_alloc_init(&OBJC_CLASS___CPLCloudKitTaskGroupThrottler);
    resourceDownloadGate = v4->_resourceDownloadGate;
    v4->_resourceDownloadGate = v22;

    v24 = objc_alloc_init(&OBJC_CLASS___CPLCloudKitTaskGroupThrottler);
    computeStateOperationsGate = v4->_computeStateOperationsGate;
    v4->_computeStateOperationsGate = v24;

    -[CPLCloudKitTaskGroupThrottler setMinimumThrottlingInterval:]( v4->_computeStateOperationsGate,  "setMinimumThrottlingInterval:",  86400.0);
    v4->_accountStatus = 0LL;
  }

  return v4;
}

- (id)engineLibrary
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport abstractObject](self, "abstractObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue([v2 engineLibrary]);

  return v3;
}

- (void)_updateBudgets
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport duetTicketProvider](self, "duetTicketProvider"));

  if (v3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472LL;
    v4[2] = sub_10007A858;
    v4[3] = &unk_1002415A8;
    v4[4] = self;
    -[CPLCloudKitTransport getSystemBudgetsWithCompletionHandler:](self, "getSystemBudgetsWithCompletionHandler:", v4);
  }

- (void)duetTicketProviderBlockedStatusDidChange
{
  workQueue = self->_workQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10007AC0C;
  v6[3] = &unk_10023DC70;
  v6[4] = self;
  v3 = v6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008551C;
  block[3] = &unk_10023DBC8;
  id v8 = v3;
  unsigned __int8 v4 = workQueue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

- (void)openWithCompletionHandler:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_10007AD30;
  v10[3] = &unk_10023E058;
  v10[4] = self;
  id v11 = v4;
  uint64_t v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008551C;
  block[3] = &unk_10023DBC8;
  id v13 = v6;
  v7 = workQueue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (void)closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  workQueue = self->_workQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_10007B738;
  v12[3] = &unk_100241620;
  BOOL v14 = a3;
  v12[4] = self;
  id v13 = v6;
  id v8 = v12;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008551C;
  block[3] = &unk_10023DBC8;
  id v16 = v8;
  dispatch_block_t v9 = workQueue;
  id v10 = v6;
  dispatch_block_t v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);
}

- (Class)transportGroupClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___CKOperationGroup);
}

- (Class)userIdentifierClass
{
  return (Class)objc_opt_class(&OBJC_CLASS___CKRecordID);
}

- (CPLSharedRecordPropertyMapping)propertyMapping
{
  return (CPLSharedRecordPropertyMapping *)+[CPLCKRecordPropertyMapping sharedInstance]( &OBJC_CLASS___CPLCKRecordPropertyMapping,  "sharedInstance");
}

- (id)acquireReschedulerTaskWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_block_t v5 = -[CPLCloudKitAcquireReschedulerTask initWithController:completionHandler:]( objc_alloc(&OBJC_CLASS___CPLCloudKitAcquireReschedulerTask),  "initWithController:completionHandler:",  self,  v4);

  return v5;
}

- (id)setupTaskUpdateDisabledFeatures:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = -[CPLCloudKitSetupTask initWithController:updateDisabledFeatures:completionHandler:]( objc_alloc(&OBJC_CLASS___CPLCloudKitSetupTask),  "initWithController:updateDisabledFeatures:completionHandler:",  self,  v4,  v6);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport createGroupForSetup](self, "createGroupForSetup"));
  -[CPLCloudKitTransportTask setTransportGroup:](v7, "setTransportGroup:", v8);

  return v7;
}

- (id)fetchRecordsTaskForRecordsWithScopedIdentifiers:(id)a3 targetMapping:(id)a4 transportScopeMapping:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  BOOL v14 = -[CPLCloudKitFetchRecordsTask initWithController:scopedIdentifiers:targetMapping:transportScopeMapping:completionHandler:]( objc_alloc(&OBJC_CLASS___CPLCloudKitFetchRecordsTask),  "initWithController:scopedIdentifiers:targetMapping:transportScopeMapping:completionHandler:",  self,  v13,  v12,  v11,  v10);

  return v14;
}

- (id)uploadBatchTaskForBatch:(id)a3 scope:(id)a4 targetMapping:(id)a5 transportScopeMapping:(id)a6 progressHandler:(id)a7 completionHandler:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = -[CPLCloudKitUploadBatchTask initWithController:scope:targetMapping:transportScopeMapping:progressHandler:completionHandler:]( objc_alloc(&OBJC_CLASS___CPLCloudKitUploadBatchTask),  "initWithController:scope:targetMapping:transportScopeMapping:progressHandler:completionHandler:",  self,  v18,  v17,  v16,  v15,  v14);

  -[CPLCloudKitUploadBatchTask setBatch:](v20, "setBatch:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport abstractObject](self, "abstractObject"));
  v22 = (void *)objc_claimAutoreleasedReturnValue([v21 engineLibrary]);
  v23 = (void *)objc_claimAutoreleasedReturnValue([v22 store]);
  v24 = (void *)objc_claimAutoreleasedReturnValue([v23 libraryCreationDate]);
  -[CPLCloudKitUploadBatchTask setCplEnabledDate:](v20, "setCplEnabledDate:", v24);

  return v20;
}

- (id)reshareRecordsTaskWithRecords:(id)a3 sourceScope:(id)a4 destinationScope:(id)a5 transportScopeMapping:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = -[CPLCloudKitReshareRecordsTask initWithController:records:sourceScope:destinationScope:transportScopeMapping:completionHandler:]( objc_alloc(&OBJC_CLASS___CPLCloudKitReshareRecordsTask),  "initWithController:records:sourceScope:destinationScope:transportScopeMapping:completionHandler:",  self,  v16,  v15,  v14,  v13,  v12);

  return v17;
}

- (id)deleteTransportScope:(id)a3 scope:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc(&OBJC_CLASS___CPLCloudKitDeleteTransportScopeTask);
  id v12 = v11;
  if (v8)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[CPLCloudKitScope scopeFromTransportScope:]( &OBJC_CLASS___CPLCloudKitScope,  "scopeFromTransportScope:",  v8));
    id v14 = -[CPLCloudKitDeleteTransportScopeTask initWithController:cloudKitScope:scope:completionHandler:]( v12,  "initWithController:cloudKitScope:scope:completionHandler:",  self,  v13,  v9,  v10);
  }

  else
  {
    id v14 = -[CPLCloudKitDeleteTransportScopeTask initWithController:cloudKitScope:scope:completionHandler:]( v11,  "initWithController:cloudKitScope:scope:completionHandler:",  self,  0LL,  v9,  v10);
  }

  return v14;
}

- (id)updateTransportScope:(id)a3 scope:(id)a4 scopeChange:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc(&OBJC_CLASS___CPLCloudKitUpdateTransportScopeTask);
  id v15 = v14;
  if (v10)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue( +[CPLCloudKitScope scopeFromTransportScope:]( &OBJC_CLASS___CPLCloudKitScope,  "scopeFromTransportScope:",  v10));
    id v17 = -[CPLCloudKitUpdateTransportScopeTask initWithController:cloudKitScope:scope:scopeChange:completionHandler:]( v15,  "initWithController:cloudKitScope:scope:scopeChange:completionHandler:",  self,  v16,  v11,  v12,  v13);
  }

  else
  {
    id v17 = -[CPLCloudKitUpdateTransportScopeTask initWithController:cloudKitScope:scope:scopeChange:completionHandler:]( v14,  "initWithController:cloudKitScope:scope:scopeChange:completionHandler:",  self,  0LL,  v11,  v12,  v13);
  }

  return v17;
}

- (id)getScopeInfoWithTransportScope:(id)a3 scope:(id)a4 previousScopeChange:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc(&OBJC_CLASS___CPLCloudKitGetScopeInfoTask);
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[CPLCloudKitScope scopeFromTransportScope:]( &OBJC_CLASS___CPLCloudKitScope,  "scopeFromTransportScope:",  v13));

  id v16 = -[CPLCloudKitGetScopeInfoTask initWithController:cloudKitScope:scope:previousScopeChange:completionHandler:]( v14,  "initWithController:cloudKitScope:scope:previousScopeChange:completionHandler:",  self,  v15,  v12,  v11,  v10);
  return v16;
}

- (id)getCurrentSyncAnchorWithTransportScope:(id)a3 scope:(id)a4 previousScopeChange:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = objc_alloc(&OBJC_CLASS___CPLCloudKitGetCurrentSyncAnchorTask);
  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[CPLCloudKitScope scopeFromTransportScope:]( &OBJC_CLASS___CPLCloudKitScope,  "scopeFromTransportScope:",  v13));

  id v16 = -[CPLCloudKitGetCurrentSyncAnchorTask initWithController:cloudKitScope:scope:previousScopeChange:completionHandler:]( v14,  "initWithController:cloudKitScope:scope:previousScopeChange:completionHandler:",  self,  v15,  v12,  v11,  v10);
  return v16;
}

- (id)fetchTransportScopeForScope:(id)a3 transportScope:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc(&OBJC_CLASS___CPLCloudKitFetchTransportScopeTask);
  id v12 = v11;
  if (v9)
  {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( +[CPLCloudKitScope scopeFromTransportScope:]( &OBJC_CLASS___CPLCloudKitScope,  "scopeFromTransportScope:",  v9));
    id v14 = -[CPLCloudKitFetchTransportScopeTask initWithController:scope:cloudKitScope:completionHandler:]( v12,  "initWithController:scope:cloudKitScope:completionHandler:",  self,  v8,  v13,  v10);
  }

  else
  {
    id v14 = -[CPLCloudKitFetchTransportScopeTask initWithController:scope:cloudKitScope:completionHandler:]( v11,  "initWithController:scope:cloudKitScope:completionHandler:",  self,  v8,  0LL,  v10);
  }

  return v14;
}

- (id)queryTaskForCursor:(id)a3 class:(Class)a4 scope:(id)a5 transportScopeMapping:(id)a6 progressHandler:(id)a7 completionHandler:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a3;
  id v19 = -[CPLCloudKitQueryTask initWithController:cursor:class:scope:transportScopeMapping:progressHandler:completionHandler:]( objc_alloc(&OBJC_CLASS___CPLCloudKitQueryTask),  "initWithController:cursor:class:scope:transportScopeMapping:progressHandler:completionHandler:",  self,  v18,  a4,  v17,  v16,  v15,  v14);

  return v19;
}

- (id)downloadBatchTaskForSyncAnchor:(id)a3 scope:(id)a4 transportScopeMapping:(id)a5 currentScopeChange:(id)a6 progressHandler:(id)a7 completionHandler:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = -[CPLCloudKitDownloadBatchTask initWithController:syncAnchor:scope:transportScopeMapping:currentScopeChange:progressHandler:completionHandler:]( objc_alloc(&OBJC_CLASS___CPLCloudKitDownloadBatchTask),  "initWithController:syncAnchor:scope:transportScopeMapping:currentScopeChange:progressHandler:completionHandler:",  self,  v19,  v18,  v17,  v16,  v15,  v14);

  return v20;
}

- (id)uploadComputeStates:(id)a3 scope:(id)a4 sharedScope:(id)a5 targetMapping:(id)a6 transportScopeMapping:(id)a7 knownRecords:(id)a8 completionHandler:(id)a9
{
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = a3;
  v23 = -[CPLCloudKitUploadComputeStatesTask initWithController:computeStates:scope:sharedScope:targetMapping:transportScopeMapping:knownRecords:completionHandler:]( objc_alloc(&OBJC_CLASS___CPLCloudKitUploadComputeStatesTask),  "initWithController:computeStates:scope:sharedScope:targetMapping:transportScopeMapping:knownRecords:completionHandler:",  self,  v22,  v21,  v20,  v19,  v18,  v17,  v16);

  -[CPLCloudKitTransportTask setGate:](v23, "setGate:", self->_computeStateOperationsGate);
  return v23;
}

- (id)downloadComputeStatesWithScopedIdentifiers:(id)a3 scope:(id)a4 sharedScope:(id)a5 targetStorageURL:(id)a6 transportScopeMapping:(id)a7 completionHandler:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = -[CPLCloudKitDownloadComputeStatesTask initWithController:scopedIdentifiers:scope:sharedScope:targetStorageURL:transportScopeMapping:completionHandler:]( objc_alloc(&OBJC_CLASS___CPLCloudKitDownloadComputeStatesTask),  "initWithController:scopedIdentifiers:scope:sharedScope:targetStorageURL:transportScopeMapping:completionHandler:",  self,  v19,  v18,  v17,  v16,  v15,  v14);

  -[CPLCloudKitTransportTask setGate:](v20, "setGate:", self->_computeStateOperationsGate);
  return v20;
}

- (id)fetchScopeListChangesForScopeListSyncAnchor:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = -[CPLCloudKitFetchScopeListChangesTask initWithController:scopeListSyncAnchor:progressHandler:completionHandler:]( objc_alloc(&OBJC_CLASS___CPLCloudKitFetchScopeListChangesTask),  "initWithController:scopeListSyncAnchor:progressHandler:completionHandler:",  self,  v10,  v9,  v8);

  return v11;
}

- (id)getStreamingURLTaskForResource:(id)a3 intent:(unint64_t)a4 hints:(id)a5 timeRange:(id *)a6 target:(id)a7 transportScopeMapping:(id)a8 clientBundleID:(id)a9 completionHandler:(id)a10
{
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a5;
  id v22 = a3;
  v23 = objc_alloc(&OBJC_CLASS___CPLCloudKitGetStreamingURLTask);
  streamingContentItemCache = self->_streamingContentItemCache;
  __int128 v25 = *(_OWORD *)&a6->var0.var3;
  v29[0] = *(_OWORD *)&a6->var0.var0;
  v29[1] = v25;
  v29[2] = *(_OWORD *)&a6->var1.var1;
  v26 = -[CPLCloudKitGetStreamingURLTask initWithController:resource:hints:timeRange:target:transportScopeMapping:cache:completionHandler:]( v23,  "initWithController:resource:hints:timeRange:target:transportScopeMapping:cache:completionHandler:",  self,  v22,  v21,  v29,  v20,  v19,  streamingContentItemCache,  v17);

  objc_super v27 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTransport createGroupForMovieStreamingWithIntent:]( self,  "createGroupForMovieStreamingWithIntent:",  a4));
  -[CPLCloudKitTransportTask setTransportGroup:](v26, "setTransportGroup:", v27);

  -[CPLCloudKitTransportTask setGate:](v26, "setGate:", self->_streamingGate);
  -[CPLCloudKitTransportTask setSourceBundleIdentifier:](v26, "setSourceBundleIdentifier:", v18);

  return v26;
}

- (id)resourceCheckTaskForResources:(id)a3 targetMapping:(id)a4 transportScopeMapping:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = -[CPLCloudKitResourcesCheckTask initWithController:resources:targetMapping:transportScopeMapping:completionHandler:]( objc_alloc(&OBJC_CLASS___CPLCloudKitResourcesCheckTask),  "initWithController:resources:targetMapping:transportScopeMapping:completionHandler:",  self,  v13,  v12,  v11,  v10);

  id v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport createGroupForPruningCheck](self, "createGroupForPruningCheck"));
  -[CPLCloudKitTransportTask setTransportGroup:](v14, "setTransportGroup:", v15);

  return v14;
}

- (id)rampingRequestTaskForResourceType:(unint64_t)a3 numRequested:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = -[CPLCloudKitRampingRequestTask initWithController:resourceType:numRequested:completionHandler:]( objc_alloc(&OBJC_CLASS___CPLCloudKitRampingRequestTask),  "initWithController:resourceType:numRequested:completionHandler:",  self,  a3,  a4,  v8);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport createGroupForAnalysisDownload](self, "createGroupForAnalysisDownload"));
  -[CPLCloudKitTransportTask setTransportGroup:](v9, "setTransportGroup:", v10);

  return v9;
}

- (id)resourcesDownloadTaskWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_block_t v5 = -[CPLCloudKitResourcesDownloadTask initWithController:completionHandler:]( objc_alloc(&OBJC_CLASS___CPLCloudKitResourcesDownloadTask),  "initWithController:completionHandler:",  self,  v4);

  -[CPLCloudKitTransportTask setGate:](v5, "setGate:", self->_resourceDownloadGate);
  return v5;
}

- (id)inMemoryDownloadTaskForResource:(id)a3 record:(id)a4 target:(id)a5 transportScopeMapping:(id)a6 clientBundleID:(id)a7 completionHandler:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = -[CPLCloudKitInMemoryResourceDownloadTask initWithController:resource:record:target:transportScopeMapping:completionHandler:]( objc_alloc(&OBJC_CLASS___CPLCloudKitInMemoryResourceDownloadTask),  "initWithController:resource:record:target:transportScopeMapping:completionHandler:",  self,  v19,  v18,  v17,  v16,  v14);

  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport createGroupForAnalysisDownload](self, "createGroupForAnalysisDownload"));
  -[CPLCloudKitTransportTask setTransportGroup:](v20, "setTransportGroup:", v21);

  -[CPLCloudKitTransportTask setGate:](v20, "setGate:", self->_resourceDownloadGate);
  -[CPLCloudKitTransportTask setSourceBundleIdentifier:](v20, "setSourceBundleIdentifier:", v15);

  return v20;
}

- (id)createScopeTaskForScope:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[CPLCloudKitCreateScopeTask initWithController:scope:completionHandler:]( objc_alloc(&OBJC_CLASS___CPLCloudKitCreateScopeTask),  "initWithController:scope:completionHandler:",  self,  v7,  v6);

  unint64_t v9 = (unint64_t)[v7 scopeType];
  if ((v9 & 0xFFFFFFFFFFFFFFFELL) == 4) {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport createGroupForPublishingLibraryShare](self, "createGroupForPublishingLibraryShare"));
  }
  else {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport createGroupForPublishingMomentShare](self, "createGroupForPublishingMomentShare"));
  }
  id v11 = (void *)v10;
  -[CPLCloudKitTransportTask setTransportGroup:](v8, "setTransportGroup:", v10);

  return v8;
}

- (id)updateShareTaskForScope:(id)a3 transportScope:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = -[CPLCloudKitUpdateShareTask initWithController:scope:transportScope:completionHandler:]( objc_alloc(&OBJC_CLASS___CPLCloudKitUpdateShareTask),  "initWithController:scope:transportScope:completionHandler:",  self,  v10,  v9,  v8);

  unint64_t v12 = (unint64_t)[v10 scopeType];
  if ((v12 & 0xFFFFFFFFFFFFFFFELL) == 4) {
    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport createGroupForPublishingLibraryShare](self, "createGroupForPublishingLibraryShare"));
  }
  else {
    uint64_t v13 = objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport createGroupForPublishingMomentShare](self, "createGroupForPublishingMomentShare"));
  }
  id v14 = (void *)v13;
  -[CPLCloudKitTransportTask setTransportGroup:](v11, "setTransportGroup:", v13);

  return v11;
}

- (id)fetchTaskForScopeWithShareURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[CPLCloudKitFetchSharedScopeTask initWithController:shareURL:completionHandler:]( objc_alloc(&OBJC_CLASS___CPLCloudKitFetchSharedScopeTask),  "initWithController:shareURL:completionHandler:",  self,  v7,  v6);

  id v9 = (void *)objc_claimAutoreleasedReturnValue([v7 pathComponents]);
  if ((unint64_t)[v9 count] < 2)
  {
    id v11 = &stru_1002482B0;
  }

  else
  {
    id v10 = (void *)objc_claimAutoreleasedReturnValue([v9 objectAtIndexedSubscript:1]);
    id v11 = (__CFString *)objc_claimAutoreleasedReturnValue([v10 lowercaseString]);
  }

  if ((-[__CFString isEqualToString:](v11, "isEqualToString:", @"shared_library") & 1) != 0
    || -[__CFString isEqualToString:](v11, "isEqualToString:", @"photos_sharing"))
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport createGroupForFetchingLibraryShare](self, "createGroupForFetchingLibraryShare"));
  }

  else
  {
    uint64_t v12 = objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport createGroupForFetchingMomentShare](self, "createGroupForFetchingMomentShare"));
  }

  uint64_t v13 = (void *)v12;
  -[CPLCloudKitTransportTask setTransportGroup:](v8, "setTransportGroup:", v12);

  return v8;
}

- (id)acceptTaskForSharedScope:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[CPLCloudKitAcceptSharedScopeTask initWithController:scope:completionHandler:]( objc_alloc(&OBJC_CLASS___CPLCloudKitAcceptSharedScopeTask),  "initWithController:scope:completionHandler:",  self,  v7,  v6);

  unint64_t v9 = (unint64_t)[v7 scopeType];
  if ((v9 & 0xFFFFFFFFFFFFFFFELL) == 4) {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport createGroupForAcceptingLibraryShare](self, "createGroupForAcceptingLibraryShare"));
  }
  else {
    uint64_t v10 = objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport createGroupForAcceptingMomentShare](self, "createGroupForAcceptingMomentShare"));
  }
  id v11 = (void *)v10;
  -[CPLCloudKitTransportTask setTransportGroup:](v8, "setTransportGroup:", v10);

  return v8;
}

- (id)fetchExistingSharedLibraryScopeTaskWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_block_t v5 = -[CPLCloudKitFetchExistingSharedScopeTask initWithController:completionHandler:]( objc_alloc(&OBJC_CLASS___CPLCloudKitFetchExistingSharedScopeTask),  "initWithController:completionHandler:",  self,  v4);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTransport createGroupForFetchingExistingSharedScope]( self,  "createGroupForFetchingExistingSharedScope"));
  -[CPLCloudKitTransportTask setTransportGroup:](v5, "setTransportGroup:", v6);

  return v5;
}

- (id)startExitTaskFromSharedScope:(id)a3 transportScope:(id)a4 share:(id)a5 retentionPolicy:(int64_t)a6 exitSource:(int64_t)a7 completionHandler:(id)a8
{
  id v14 = a8;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = objc_alloc(&OBJC_CLASS___CPLCloudKitExitSharedLibraryTask);
  id v19 = (void *)objc_claimAutoreleasedReturnValue( +[CPLCloudKitScope scopeFromTransportScope:]( &OBJC_CLASS___CPLCloudKitScope,  "scopeFromTransportScope:",  v16));

  id v20 = -[CPLCloudKitExitSharedLibraryTask initSelfExitWithController:cloudKitScope:scope:share:retentionPolicy:exitSource:completionHandler:]( v18,  "initSelfExitWithController:cloudKitScope:scope:share:retentionPolicy:exitSource:completionHandler:",  self,  v19,  v17,  v15,  a6,  a7,  v14);
  return v20;
}

- (id)removeParticipantInSharedLibraryTaskFromSharedScope:(id)a3 transportScope:(id)a4 share:(id)a5 retentionPolicy:(int64_t)a6 exitSource:(int64_t)a7 userIdentifiersToRemove:(id)a8 participantIDsToRemove:(id)a9 completionHandler:(id)a10
{
  id v16 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  id v22 = objc_alloc(&OBJC_CLASS___CPLCloudKitExitSharedLibraryTask);
  v23 = (void *)objc_claimAutoreleasedReturnValue( +[CPLCloudKitScope scopeFromTransportScope:]( &OBJC_CLASS___CPLCloudKitScope,  "scopeFromTransportScope:",  v20));

  id v24 = -[CPLCloudKitExitSharedLibraryTask initRemoveParticipantsWithController:cloudKitScope:scope:share:userIdentifiersToRemove:participantIDsToRemove:retentionPolicy:exitSource:completionHandler:]( v22,  "initRemoveParticipantsWithController:cloudKitScope:scope:share:userIdentifiersToRemove:participantIDsToRemove: retentionPolicy:exitSource:completionHandler:",  self,  v23,  v21,  v19,  v18,  v17,  a6,  a7,  v16);
  return v24;
}

- (id)fixUpSparseRecordsTaskWithTasks:(id)a3 transportScopeMapping:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = -[CPLCloudKitFixUpSparseRecordTask initWithController:tasks:transportScopeMapping:completionHandler:]( objc_alloc(&OBJC_CLASS___CPLCloudKitFixUpSparseRecordTask),  "initWithController:tasks:transportScopeMapping:completionHandler:",  self,  v10,  v9,  v8);

  return v11;
}

- (id)sharedLibraryServerRampTaskWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_block_t v5 = -[CPLCloudKitSharedLibraryServerRampTask initWithController:completionHandler:]( objc_alloc(&OBJC_CLASS___CPLCloudKitSharedLibraryServerRampTask),  "initWithController:completionHandler:",  self,  v4);

  id v6 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTransport createGroupForSharedLibraryRampCheck]( self,  "createGroupForSharedLibraryRampCheck"));
  -[CPLCloudKitTransportTask setTransportGroup:](v5, "setTransportGroup:", v6);

  return v5;
}

- (id)updateContributorsTaskWithSharedScope:(id)a3 contributorsUpdates:(id)a4 transportScopeMapping:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = -[CPLCloudKitUpdateContributorsTask initWithController:sharedScope:contributorsUpdates:transportScopeMapping:completionHandler:]( objc_alloc(&OBJC_CLASS___CPLCloudKitUpdateContributorsTask),  "initWithController:sharedScope:contributorsUpdates:transportScopeMapping:completionHandler:",  self,  v13,  v12,  v11,  v10);

  return v14;
}

- (id)cleanupStagedScope:(id)a3 stagingScope:(id)a4 destinationScope:(id)a5 transportScopeMapping:(id)a6 progressHandler:(id)a7 completionHandler:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = -[CPLCloudKitCleanupStagedScopeTask initWithController:stagedScope:stagingScope:destinationScope:transportScopeMapping:progressHandler:completionHandler:]( objc_alloc(&OBJC_CLASS___CPLCloudKitCleanupStagedScopeTask),  "initWithController:stagedScope:stagingScope:destinationScope:transportScopeMapping:progressHandler:completionHandler:",  self,  v19,  v18,  v17,  v16,  v15,  v14);

  return v20;
}

- (id)queryUserDetailsTaskForParticipants:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[CPLCloudKitQueryUserDetailsTask initWithController:participants:completionHandler:]( objc_alloc(&OBJC_CLASS___CPLCloudKitQueryUserDetailsTask),  "initWithController:participants:completionHandler:",  self,  v7,  v6);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport createGroupForQueryUserIdentities](self, "createGroupForQueryUserIdentities"));
  -[CPLCloudKitTransportTask setTransportGroup:](v8, "setTransportGroup:", v9);

  return v8;
}

- (id)sendFeedbackTaskForMessages:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = -[CPLCloudKitSendFeedbackTask initWithController:messages:completionHandler:]( objc_alloc(&OBJC_CLASS___CPLCloudKitSendFeedbackTask),  "initWithController:messages:completionHandler:",  self,  v7,  v6);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport createGroupForFeedback](self, "createGroupForFeedback"));
  -[CPLCloudKitTransportTask setTransportGroup:](v8, "setTransportGroup:", v9);

  return v8;
}

- (BOOL)isResourceDynamic:(id)a3
{
  id v3 = a3;
  if ((CPLIsDynamicResource(v3) & 1) != 0) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = +[CPLCloudKitFakeDynamicDerivatives isFakeDerivative:]( &OBJC_CLASS___CPLCloudKitFakeDynamicDerivatives,  "isFakeDerivative:",  v3);
  }

  return v4;
}

- (id)bestErrorForUnderlyingError:(id)a3
{
  return +[CPLCloudKitErrors bestErrorForUnderlyingError:]( &OBJC_CLASS___CPLCloudKitErrors,  "bestErrorForUnderlyingError:",  a3);
}

- (id)simpleDescriptionForSyncAnchor:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if (qword_100296368 != -1) {
      dispatch_once(&qword_100296368, &stru_100241640);
    }
    BOOL v4 = (void *)objc_claimAutoreleasedReturnValue( +[NSKeyedUnarchiver cpl_safeUnarchiveObjectWithData:classes:]( &OBJC_CLASS___NSKeyedUnarchiver,  "cpl_safeUnarchiveObjectWithData:classes:",  v3,  qword_100296370));
    if (v4)
    {
      uint64_t v5 = objc_opt_class(&OBJC_CLASS___CKQueryCursor);
      if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
      {
        id v6 = objc_alloc(&OBJC_CLASS___NSString);
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 data]);
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 base64EncodedStringWithOptions:0]);
        id v9 = -[NSString initWithFormat:](v6, "initWithFormat:", @"Cursor-%@", v8);
      }

      else
      {
        id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 data]);
        id v9 = (__CFString *)objc_claimAutoreleasedReturnValue([v7 base64EncodedStringWithOptions:0]);
      }
    }

    else
    {
      id v9 = @"InvalidAnchor";
    }
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

- (BOOL)getProposedStagingScopeIdentifier:(id *)a3 stagingTransportScope:(id *)a4 forScope:(id)a5 transportScope:(id)a6 transportUserIdentifier:(id)a7
{
  id v12 = a5;
  id v13 = a7;
  uint64_t v14 = objc_claimAutoreleasedReturnValue(+[CPLCloudKitScope scopeFromTransportScope:](&OBJC_CLASS___CPLCloudKitScope, "scopeFromTransportScope:", a6));
  id v15 = (void *)v14;
  BOOL v16 = 0;
  if (v13 && v14)
  {
    uint64_t v17 = objc_opt_class(&OBJC_CLASS___CKRecordID);
    if ((objc_opt_isKindOfClass(v13, v17) & 1) != 0)
    {
      id v18 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTransport zoneIdentificationForCloudKitScope:engineScope:]( self,  "zoneIdentificationForCloudKitScope:engineScope:",  v15,  v12));
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v18 proposedStagingZoneIdentificationWithCurrentUserID:v13]);
      id v20 = v19;
      BOOL v16 = v19 != 0LL;
      if (v19)
      {
        *a3 = (id)objc_claimAutoreleasedReturnValue([v19 scopeIdentifier]);
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 cloudKitScope]);
        *a4 = (id)objc_claimAutoreleasedReturnValue([v21 transportScope]);
      }
    }

    else
    {
      BOOL v16 = 0;
    }
  }

  return v16;
}

- (id)simpleDescriptionForScopeListSyncAnchor:(id)a3
{
  return +[CPLCloudKitFetchScopeListChangesTask descriptionForScopeListSyncAnchor:]( &OBJC_CLASS___CPLCloudKitFetchScopeListChangesTask,  "descriptionForScopeListSyncAnchor:",  a3);
}

- (void)setIsSignificantWorkPending:(BOOL)a3
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport duetTicketProvider](self, "duetTicketProvider"));
  id v6 = v5;
  if (v5)
  {
    workQueue = self->_workQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10007D73C;
    v11[3] = &unk_10023F530;
    BOOL v13 = a3;
    v11[4] = self;
    id v12 = v5;
    id v8 = v11;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10008551C;
    block[3] = &unk_10023DBC8;
    id v15 = v8;
    id v9 = workQueue;
    dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v9, v10);
  }
}

- (void)getSystemBudgetsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport duetTicketProvider](self, "duetTicketProvider"));
  id v6 = v5;
  if (v5)
  {
    [v5 getSystemBudgetsWithCompletionHandler:v4];
  }

  else
  {
    workQueue = self->_workQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10007DA38;
    v11[3] = &unk_10023DBC8;
    id v12 = v4;
    id v8 = v11;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10008551C;
    block[3] = &unk_10023DBC8;
    id v14 = v8;
    id v9 = workQueue;
    dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v9, v10);
  }
}

- (void)setShouldOverride:(BOOL)a3 forSystemBudgets:(unint64_t)a4
{
  BOOL v5 = a3;
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport duetTicketProvider](self, "duetTicketProvider"));
  [v6 setShouldOverride:v5 forSystemBudgets:a4];
}

- (void)noteClientIsBeginningSignificantWork
{
}

- (void)noteClientIsEndingSignificantWork
{
}

- (void)noteClientIsInForeground
{
}

- (void)noteClientIsInBackground
{
}

- (void)cancelBlockedTasksIncludingBackground:(BOOL)a3
{
}

- (id)tentativeConcreteScopeForScope:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 scopeIdentifier]);
  id v6 = (CKRecordZoneID *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport mainScopeIdentifier](self, "mainScopeIdentifier"));
  if ([v5 isEqualToString:v6])
  {
    id v7 = [v4 scopeType];

    if (v7 != (id)1)
    {
      dispatch_block_t v10 = 0LL;
      goto LABEL_7;
    }

    id v6 = -[CKRecordZoneID initWithCPLScopeIdentifier:]( objc_alloc(&OBJC_CLASS___CKRecordZoneID),  "initWithCPLScopeIdentifier:",  v5);
    id v8 = -[CPLCloudKitScope initWithZoneID:](objc_alloc(&OBJC_CLASS___CPLCloudKitScope), "initWithZoneID:", v6);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTransport zoneIdentificationForCloudKitScope:engineScope:]( self,  "zoneIdentificationForCloudKitScope:engineScope:",  v8,  v4));
    dispatch_block_t v10 = (void *)objc_claimAutoreleasedReturnValue([v9 cloudKitScope]);
  }

  else
  {
    dispatch_block_t v10 = 0LL;
  }

LABEL_7:
  return v10;
}

- (id)descriptionForTransportScope:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[CPLCloudKitScope scopeFromTransportScope:]( &OBJC_CLASS___CPLCloudKitScope,  "scopeFromTransportScope:",  a3));
  id v4 = v3;
  if (v3)
  {
    BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v3 zoneID]);
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cpl_zoneName"));

    if ([v4 isShared])
    {
      id v7 = -[NSString initWithFormat:](objc_alloc(&OBJC_CLASS___NSString), "initWithFormat:", @"%@ shared", v6);

      id v6 = (__CFString *)v7;
    }
  }

  else
  {
    id v6 = @"Invalid";
  }

  return v6;
}

- (id)scopeNameForTransportScope:(id)a3
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( +[CPLCloudKitScope scopeFromTransportScope:]( &OBJC_CLASS___CPLCloudKitScope,  "scopeFromTransportScope:",  a3));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 zoneID]);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cpl_zoneName"));

  return v5;
}

- (id)transportScopeForUpgradeFromScopeName:(id)a3
{
  id v3 = a3;
  id v4 = -[CKRecordZone initWithZoneName:](objc_alloc(&OBJC_CLASS___CKRecordZone), "initWithZoneName:", v3);

  BOOL v5 = -[CPLCloudKitScope initWithZone:options:]( objc_alloc(&OBJC_CLASS___CPLCloudKitScope),  "initWithZone:options:",  v4,  0LL);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitScope transportScope](v5, "transportScope"));

  return v6;
}

- (void)upgradeFlags:(id)a3 fromTransportScope:(id)a4
{
  id v7 = a3;
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[CPLCloudKitScope scopeFromTransportScope:]( &OBJC_CLASS___CPLCloudKitScope,  "scopeFromTransportScope:",  a4));
  id v6 = v5;
}

- (BOOL)isNewTransportScope:(id)a3 compatibleWithOldTransportScope:(id)a4
{
  id v5 = a4;
  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[CPLCloudKitScope scopeFromTransportScope:]( &OBJC_CLASS___CPLCloudKitScope,  "scopeFromTransportScope:",  a3));
  if (v6)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[CPLCloudKitScope scopeFromTransportScope:]( &OBJC_CLASS___CPLCloudKitScope,  "scopeFromTransportScope:",  v5));
    if (v7)
    {
      id v8 = (void *)objc_claimAutoreleasedReturnValue( +[CPLCloudKitDefaultZoneManager sharedInstance]( &OBJC_CLASS___CPLCloudKitDefaultZoneManager,  "sharedInstance"));
      unsigned __int8 v9 = [v8 isNewCloudKitScope:v6 compatibleWithOldCloudKitScope:v7];
    }

    else
    {
      unsigned __int8 v9 = 0;
    }
  }

  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (id)createGroupAllowsCellular:(BOOL)a3 allowsExpensiveNetwork:(BOOL)a4 foreground:(BOOL)a5 upload:(BOOL)a6 metadata:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v10 = a4;
  BOOL v11 = a3;
  if (a5 && !a3) {
    uint64_t v10 = [(id)objc_opt_class(self) allowsUserInitiatedOperationsOverExpensiveNetwork] | a4;
  }
  return -[CPLCloudKitCoordinator createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:forClient:]( self->_coordinator,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:forClient:",  v11,  v10,  v9,  v8,  v7,  self);
}

- (id)createGroupForSendExitStatus
{
  id v3 = [(id)objc_opt_class(self) allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:]( self,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:",  v3,  [(id)objc_opt_class(self) allowsSyncOverExpensiveNetwork],  1,  0,  1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (self->_operationGroupMapper)
  {
    BOOL v7 = sub_10007A4A4(self, @"Exit Status Feedback");
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 setName:v8];
  }

  else
  {
    [v5 setName:@"Exit Status Feedback"];
  }

  return v6;
}

- (id)createGroupForInitialUpload
{
  id v3 = [(id)objc_opt_class(self) allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:]( self,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:",  v3,  [(id)objc_opt_class(self) allowsSyncOverExpensiveNetwork],  0,  1,  1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (self->_operationGroupMapper)
  {
    BOOL v7 = sub_10007A4A4(self, @"Initial Upload");
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 setName:v8];
  }

  else
  {
    [v5 setName:@"Initial Upload"];
  }

  return v6;
}

- (id)createGroupForResetSync
{
  id v3 = [(id)objc_opt_class(self) allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:]( self,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:",  v3,  [(id)objc_opt_class(self) allowsSyncOverExpensiveNetwork],  0,  1,  1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (self->_operationGroupMapper)
  {
    BOOL v7 = sub_10007A4A4(self, @"Reset sync");
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 setName:v8];
  }

  else
  {
    [v5 setName:@"Reset sync"];
  }

  return v6;
}

- (id)createGroupForInitialDownload
{
  id v3 = [(id)objc_opt_class(self) allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:]( self,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:",  v3,  [(id)objc_opt_class(self) allowsSyncOverExpensiveNetwork],  0,  0,  1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (self->_operationGroupMapper)
  {
    BOOL v7 = sub_10007A4A4(self, @"Initial Download");
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 setName:v8];
  }

  else
  {
    [v5 setName:@"Initial Download"];
  }

  return v6;
}

- (id)createGroupForPrefetch
{
  return -[CPLCloudKitTransport createGroupForDownloadWithIntent:priority:]( self,  "createGroupForDownloadWithIntent:priority:",  1LL,  2LL);
}

- (id)createGroupForThumbnailPrefetch
{
  id v3 = [(id)objc_opt_class(self) allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:]( self,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:",  v3,  [(id)objc_opt_class(self) allowsSyncOverExpensiveNetwork],  0,  0,  0);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (self->_operationGroupMapper)
  {
    BOOL v7 = sub_10007A4A4(self, @"Thumbnails Prefetch");
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 setName:v8];
  }

  else
  {
    [v5 setName:@"Thumbnails Prefetch"];
  }

  return v6;
}

- (id)createGroupForNonDerivativePrefetch
{
  return -[CPLCloudKitTransport createGroupForDownloadWithIntent:priority:]( self,  "createGroupForDownloadWithIntent:priority:",  1LL,  2LL);
}

- (id)createGroupForKeepOriginalsPrefetch
{
  return -[CPLCloudKitTransport createGroupForDownloadWithIntent:priority:]( self,  "createGroupForDownloadWithIntent:priority:",  2LL,  2LL);
}

- (id)createGroupForMemoriesPrefetch
{
  return -[CPLCloudKitTransport createGroupForDownloadWithIntent:priority:]( self,  "createGroupForDownloadWithIntent:priority:",  3LL,  2LL);
}

- (id)createGroupForRecoveryDownload
{
  return -[CPLCloudKitTransport createGroupForDownloadWithIntent:priority:]( self,  "createGroupForDownloadWithIntent:priority:",  4LL,  2LL);
}

- (id)createGroupForWidgetPrefetch
{
  return -[CPLCloudKitTransport createGroupForDownloadWithIntent:priority:]( self,  "createGroupForDownloadWithIntent:priority:",  6LL,  2LL);
}

- (id)createGroupForSetup
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:]( self,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:",  1LL,  1LL,  0LL,  0LL,  1LL));
  id v4 = v3;
  if (self->_operationGroupMapper)
  {
    id v5 = sub_10007A4A4(self, @"Setting Up Library");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    [v4 setName:v6];
  }

  else
  {
    [v3 setName:@"Setting Up Library"];
  }

  return v4;
}

- (id)createGroupForFeedback
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:]( self,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:",  1LL,  1LL,  1LL,  0LL,  0LL));
  id v4 = v3;
  if (self->_operationGroupMapper)
  {
    id v5 = sub_10007A4A4(self, @"Sending Feedback");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    [v4 setName:v6];
  }

  else
  {
    [v3 setName:@"Sending Feedback"];
  }

  return v4;
}

- (id)createGroupForTransportScopeDelete
{
  id v3 = [(id)objc_opt_class(self) allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:]( self,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:",  v3,  [(id)objc_opt_class(self) allowsSyncOverExpensiveNetwork],  0,  0,  1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (self->_operationGroupMapper)
  {
    BOOL v7 = sub_10007A4A4(self, @"Deleting Zone");
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 setName:v8];
  }

  else
  {
    [v5 setName:@"Deleting Zone"];
  }

  return v6;
}

- (id)createGroupForTransportScopeUpdate
{
  id v3 = [(id)objc_opt_class(self) allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:]( self,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:",  v3,  [(id)objc_opt_class(self) allowsSyncOverExpensiveNetwork],  0,  0,  1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (self->_operationGroupMapper)
  {
    BOOL v7 = sub_10007A4A4(self, @"Updating Zone");
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 setName:v8];
  }

  else
  {
    [v5 setName:@"Updating Zone"];
  }

  return v6;
}

- (id)createGroupForTransportScopeRefresh
{
  id v3 = [(id)objc_opt_class(self) allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:]( self,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:",  v3,  [(id)objc_opt_class(self) allowsSyncOverExpensiveNetwork],  1,  0,  1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (self->_operationGroupMapper)
  {
    BOOL v7 = sub_10007A4A4(self, @"Refreshing Zone");
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 setName:v8];
  }

  else
  {
    [v5 setName:@"Refreshing Zone"];
  }

  return v6;
}

- (id)createGroupForFetchScopeListChanges
{
  id v3 = [(id)objc_opt_class(self) allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:]( self,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:",  v3,  [(id)objc_opt_class(self) allowsSyncOverExpensiveNetwork],  0,  0,  1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (self->_operationGroupMapper)
  {
    BOOL v7 = sub_10007A4A4(self, @"Fetching Zone Changes");
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 setName:v8];
  }

  else
  {
    [v5 setName:@"Fetching Zone Changes"];
  }

  return v6;
}

- (id)createGroupForLibraryStateCheck
{
  id v3 = [(id)objc_opt_class(self) allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:]( self,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:",  v3,  [(id)objc_opt_class(self) allowsSyncOverExpensiveNetwork],  0,  0,  1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (self->_operationGroupMapper)
  {
    BOOL v7 = sub_10007A4A4(self, @"Checking Library State");
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 setName:v8];
  }

  else
  {
    [v5 setName:@"Checking Library State"];
  }

  return v6;
}

- (id)createGroupForChangeUpload
{
  id v3 = [(id)objc_opt_class(self) allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:]( self,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:",  v3,  [(id)objc_opt_class(self) allowsSyncOverExpensiveNetwork],  0,  1,  1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (self->_operationGroupMapper)
  {
    BOOL v7 = sub_10007A4A4(self, @"Changes Upload");
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 setName:v8];
  }

  else
  {
    [v5 setName:@"Changes Upload"];
  }

  return v6;
}

- (id)createGroupForChangeDownload
{
  id v3 = [(id)objc_opt_class(self) allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:]( self,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:",  v3,  [(id)objc_opt_class(self) allowsSyncOverExpensiveNetwork],  0,  0,  1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (self->_operationGroupMapper)
  {
    BOOL v7 = sub_10007A4A4(self, @"Changes Download");
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 setName:v8];
  }

  else
  {
    [v5 setName:@"Changes Download"];
  }

  return v6;
}

- (id)createGroupForComputeStateUpload
{
  id v3 = [(id)objc_opt_class(self) allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:]( self,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:",  v3,  [(id)objc_opt_class(self) allowsSyncOverExpensiveNetwork],  0,  1,  1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (self->_operationGroupMapper)
  {
    BOOL v7 = sub_10007A4A4(self, @"Compute State Upload");
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 setName:v8];
  }

  else
  {
    [v5 setName:@"Compute State Upload"];
  }

  return v6;
}

- (id)createGroupForComputeStateDownloadOnDemand
{
  id v3 = [(id)objc_opt_class(self) allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:]( self,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:",  v3,  [(id)objc_opt_class(self) allowsSyncOverExpensiveNetwork],  1,  0,  1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (self->_operationGroupMapper)
  {
    BOOL v7 = sub_10007A4A4(self, @"Compute State Download");
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 setName:v8];
  }

  else
  {
    [v5 setName:@"Compute State Download"];
  }

  return v6;
}

- (id)createGroupForComputeStateDownloadPrefetch
{
  id v3 = [(id)objc_opt_class(self) allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:]( self,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:",  v3,  [(id)objc_opt_class(self) allowsSyncOverExpensiveNetwork],  0,  0,  1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (self->_operationGroupMapper)
  {
    BOOL v7 = sub_10007A4A4(self, @"Compute State Download Prefetch");
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 setName:v8];
  }

  else
  {
    [v5 setName:@"Compute State Download Prefetch"];
  }

  return v6;
}

- (id)createGroupForFixUpTasks
{
  id v3 = [(id)objc_opt_class(self) allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:]( self,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:",  v3,  [(id)objc_opt_class(self) allowsSyncOverExpensiveNetwork],  0,  0,  1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (self->_operationGroupMapper)
  {
    BOOL v7 = sub_10007A4A4(self, @"Sparse Records Fix-Up");
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 setName:v8];
  }

  else
  {
    [v5 setName:@"Sparse Records Fix-Up"];
  }

  return v6;
}

- (id)createGroupForReshare
{
  id v3 = [(id)objc_opt_class(self) allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:]( self,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:",  v3,  [(id)objc_opt_class(self) allowsSyncOverExpensiveNetwork],  0,  0,  1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (self->_operationGroupMapper)
  {
    BOOL v7 = sub_10007A4A4(self, @"Reshare shadowing records");
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 setName:v8];
  }

  else
  {
    [v5 setName:@"Reshare shadowing records"];
  }

  return v6;
}

- (id)createGroupForStagedScopeCleanup
{
  id v3 = [(id)objc_opt_class(self) allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:]( self,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:",  v3,  [(id)objc_opt_class(self) allowsSyncOverExpensiveNetwork],  0,  0,  1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (self->_operationGroupMapper)
  {
    BOOL v7 = sub_10007A4A4(self, @"Clean-up Staged Zone");
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 setName:v8];
  }

  else
  {
    [v5 setName:@"Clean-up Staged Zone"];
  }

  return v6;
}

- (id)createGroupForThumbnailsDownload
{
  id v3 = [(id)objc_opt_class(self) allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:]( self,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:",  v3,  [(id)objc_opt_class(self) allowsSyncOverExpensiveNetwork],  1,  0,  0);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (self->_operationGroupMapper)
  {
    BOOL v7 = sub_10007A4A4(self, @"Thumbnails Download");
    BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 setName:v8];
  }

  else
  {
    [v5 setName:@"Thumbnails Download"];
  }

  return v6;
}

- (id)createGroupForResourcesDownload
{
  return -[CPLCloudKitTransport createGroupForDownloadWithIntent:priority:]( self,  "createGroupForDownloadWithIntent:priority:",  0LL,  0LL);
}

- (id)createGroupForWidgetResourcesDownload
{
  return -[CPLCloudKitTransport createGroupForDownloadWithIntent:priority:]( self,  "createGroupForDownloadWithIntent:priority:",  6LL,  0LL);
}

- (id)createGroupForDownloadWithIntent:(unint64_t)a3 priority:(unint64_t)a4
{
  id v7 = [(id)objc_opt_class(self) allowsSyncOverCellular];
  id v8 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:]( self,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:",  v7,  [(id)objc_opt_class(self) allowsSyncOverExpensiveNetwork],  +[CPLResourceTransferTaskOptions isForegroundOperationForIntent:priority:]( CPLResourceTransferTaskOptions,  "isForegroundOperationForIntent:priority:",  a3,  a4),  0,  0);
  BOOL v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  uint64_t v10 = @"Non-Derivatives Prefetch";
  switch(a3)
  {
    case 0uLL:
      BOOL v11 = @"Resources Download";
      id v12 = @"Resources Prefetch";
      goto LABEL_15;
    case 1uLL:
      break;
    case 2uLL:
      uint64_t v10 = @"Keep-Originals Prefetch";
      break;
    case 3uLL:
      BOOL v11 = @"Memory Playback Resources Download";
      if (a4 == 1) {
        BOOL v11 = @"Memory Playback Resources Preload";
      }
      id v12 = @"Memories Prefetch";
      goto LABEL_15;
    case 4uLL:
      uint64_t v10 = @"Recovery Download";
      break;
    case 5uLL:
      uint64_t v10 = @"Optimize-Originals Prefetch";
      break;
    case 6uLL:
      BOOL v11 = @"Widget Resources Download";
      id v12 = @"Widget Prefetch";
LABEL_15:
      BOOL v15 = a4 == 2;
      goto LABEL_26;
    case 7uLL:
      uint64_t v10 = @"Grid Resources Download";
      break;
    case 8uLL:
      uint64_t v10 = @"1Up Resources Download";
      break;
    case 9uLL:
      uint64_t v10 = @"Edit Resources Download";
      break;
    case 0xAuLL:
      uint64_t v10 = @"Media Analysis Download";
      break;
    case 0xBuLL:
      uint64_t v10 = @"Watch Sync Download";
      break;
    case 0xCuLL:
      uint64_t v10 = @"Wallpaper Suggestion";
      break;
    case 0xDuLL:
      uint64_t v10 = @"Wallpaper Shuffle";
      break;
    case 0xEuLL:
      uint64_t v10 = @"Wallpaper Live Photo";
      break;
    case 0xFuLL:
      uint64_t v10 = @"Background Edit Suggestion";
      break;
    case 0x10uLL:
      BOOL v11 = @"Memory Inline Playback Resources Download";
      id v12 = @"Memory Inline Playback Resources Preload";
      BOOL v15 = a4 == 1;
LABEL_26:
      if (v15) {
        uint64_t v10 = (__CFString *)v12;
      }
      else {
        uint64_t v10 = (__CFString *)v11;
      }
      break;
    default:
      if (!_CPLSilentLogging)
      {
        id v13 = sub_10007B4F8();
        id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v19 = 134217984;
          unint64_t v20 = a3;
          _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_ERROR,  "Invalid download intent: %lu",  (uint8_t *)&v19,  0xCu);
        }
      }

      uint64_t v10 = @"Resources Download";
      break;
  }

  if (self->_operationGroupMapper)
  {
    BOOL v16 = sub_10007A4A4(self, v10);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    [v9 setName:v17];
  }

  else
  {
    [v9 setName:v10];
  }

  return v9;
}

- (id)createGroupForMovieStreamingWithIntent:(unint64_t)a3
{
  id v5 = [(id)objc_opt_class(self) allowsSyncOverCellular];
  id v6 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:]( self,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:",  v5,  [(id)objc_opt_class(self) allowsSyncOverExpensiveNetwork],  1,  0,  1);
  id v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (a3 - 1 > 5) {
    id v8 = @"Fetching Movie Stream";
  }
  else {
    id v8 = off_100241920[a3 - 1];
  }
  if (!self->_mightRejectVideoStreaming
    || !-[NSIndexSet containsIndex:](self->_rejectedVideoStreamingIntents, "containsIndex:", a3))
  {
    goto LABEL_17;
  }

  if (self->_rejectVideoStreamingAtContentLevel)
  {
    if (_CPLSilentLogging)
    {
      BOOL v11 = @"Content Rejected ";
      goto LABEL_16;
    }

    id v9 = sub_10007B4F8();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      uint64_t v17 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Asking server to reject %@ at content level",  (uint8_t *)&v16,  0xCu);
    }

    BOOL v11 = @"Content Rejected ";
  }

  else
  {
    if (_CPLSilentLogging)
    {
      BOOL v11 = @"Rejected ";
      goto LABEL_16;
    }

    id v12 = sub_10007B4F8();
    uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      uint64_t v17 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Asking server to reject %@",  (uint8_t *)&v16,  0xCu);
    }

    BOOL v11 = @"Rejected ";
  }

LABEL_16:
  id v8 = (__CFString *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v11, "stringByAppendingString:", v8));
LABEL_17:
  if (self->_operationGroupMapper)
  {
    id v13 = sub_10007A4A4(self, v8);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    [v7 setName:v14];
  }

  else
  {
    [v7 setName:v8];
  }

  return v7;
}

- (id)createGroupForAnalysisDownload
{
  id v3 = [(id)objc_opt_class(self) allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:]( self,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:",  v3,  [(id)objc_opt_class(self) allowsSyncOverExpensiveNetwork],  0,  0,  0);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (self->_operationGroupMapper)
  {
    id v7 = sub_10007A4A4(self, @"Photo Analysis");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 setName:v8];
  }

  else
  {
    [v5 setName:@"Photo Analysis"];
  }

  return v6;
}

- (id)createGroupForPruningCheck
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:]( self,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:",  1LL,  1LL,  1LL,  0LL,  1LL));
  id v4 = v3;
  if (self->_operationGroupMapper)
  {
    id v5 = sub_10007A4A4(self, @"Checking Resources For Pruning");
    id v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    [v4 setName:v6];
  }

  else
  {
    [v3 setName:@"Checking Resources For Pruning"];
  }

  return v4;
}

- (id)createGroupForPublishingMomentShare
{
  id v3 = [(id)objc_opt_class(self) allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:]( self,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:",  v3,  [(id)objc_opt_class(self) allowsSyncOverExpensiveNetwork],  1,  1,  1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (self->_operationGroupMapper)
  {
    id v7 = sub_10007A4A4(self, @"Publishing Moment Share");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 setName:v8];
  }

  else
  {
    [v5 setName:@"Publishing Moment Share"];
  }

  return v6;
}

- (id)createGroupForFetchingMomentShare
{
  id v3 = [(id)objc_opt_class(self) allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:]( self,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:",  v3,  [(id)objc_opt_class(self) allowsSyncOverExpensiveNetwork],  1,  1,  1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (self->_operationGroupMapper)
  {
    id v7 = sub_10007A4A4(self, @"Fetching Moment Share");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 setName:v8];
  }

  else
  {
    [v5 setName:@"Fetching Moment Share"];
  }

  return v6;
}

- (id)createGroupForAcceptingMomentShare
{
  id v3 = [(id)objc_opt_class(self) allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:]( self,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:",  v3,  [(id)objc_opt_class(self) allowsSyncOverExpensiveNetwork],  1,  1,  1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (self->_operationGroupMapper)
  {
    id v7 = sub_10007A4A4(self, @"Accepting Moment Share");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 setName:v8];
  }

  else
  {
    [v5 setName:@"Accepting Moment Share"];
  }

  return v6;
}

- (id)createGroupForPublishingLibraryShare
{
  id v3 = [(id)objc_opt_class(self) allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:]( self,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:",  v3,  [(id)objc_opt_class(self) allowsSyncOverExpensiveNetwork],  1,  1,  1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (self->_operationGroupMapper)
  {
    id v7 = sub_10007A4A4(self, @"Publishing Library Share");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 setName:v8];
  }

  else
  {
    [v5 setName:@"Publishing Library Share"];
  }

  return v6;
}

- (id)createGroupForFetchingLibraryShare
{
  id v3 = [(id)objc_opt_class(self) allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:]( self,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:",  v3,  [(id)objc_opt_class(self) allowsSyncOverExpensiveNetwork],  1,  1,  1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (self->_operationGroupMapper)
  {
    id v7 = sub_10007A4A4(self, @"Fetching Library Share");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 setName:v8];
  }

  else
  {
    [v5 setName:@"Fetching Library Share"];
  }

  return v6;
}

- (id)createGroupForAcceptingLibraryShare
{
  id v3 = [(id)objc_opt_class(self) allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:]( self,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:",  v3,  [(id)objc_opt_class(self) allowsSyncOverExpensiveNetwork],  1,  1,  1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (self->_operationGroupMapper)
  {
    id v7 = sub_10007A4A4(self, @"Accepting Library Share");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 setName:v8];
  }

  else
  {
    [v5 setName:@"Accepting Library Share"];
  }

  return v6;
}

- (id)createGroupForFetchingExistingSharedScope
{
  id v3 = [(id)objc_opt_class(self) allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:]( self,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:",  v3,  [(id)objc_opt_class(self) allowsSyncOverExpensiveNetwork],  1,  1,  1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (self->_operationGroupMapper)
  {
    id v7 = sub_10007A4A4(self, @"Looking For Shared Library Zone");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 setName:v8];
  }

  else
  {
    [v5 setName:@"Looking For Shared Library Zone"];
  }

  return v6;
}

- (id)createGroupForCleanupLibrary
{
  id v3 = [(id)objc_opt_class(self) allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:]( self,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:",  v3,  [(id)objc_opt_class(self) allowsSyncOverExpensiveNetwork],  1,  0,  1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (self->_operationGroupMapper)
  {
    id v7 = sub_10007A4A4(self, @"Cleaning Shared Library");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 setName:v8];
  }

  else
  {
    [v5 setName:@"Cleaning Shared Library"];
  }

  return v6;
}

- (id)createGroupForExitSharedLibrary
{
  id v3 = [(id)objc_opt_class(self) allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:]( self,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:",  v3,  [(id)objc_opt_class(self) allowsSyncOverExpensiveNetwork],  1,  0,  1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (self->_operationGroupMapper)
  {
    id v7 = sub_10007A4A4(self, @"Exit Shared Library");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 setName:v8];
  }

  else
  {
    [v5 setName:@"Exit Shared Library"];
  }

  return v6;
}

- (id)createGroupForSharedLibraryRampCheck
{
  id v3 = [(id)objc_opt_class(self) allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:]( self,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:",  v3,  [(id)objc_opt_class(self) allowsSyncOverExpensiveNetwork],  1,  0,  1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (self->_operationGroupMapper)
  {
    id v7 = sub_10007A4A4(self, @"Shared Library Ramp Check");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 setName:v8];
  }

  else
  {
    [v5 setName:@"Shared Library Ramp Check"];
  }

  return v6;
}

- (id)createGroupForQueryUserIdentities
{
  id v3 = [(id)objc_opt_class(self) allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:]( self,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:",  v3,  [(id)objc_opt_class(self) allowsSyncOverExpensiveNetwork],  1,  1,  1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (self->_operationGroupMapper)
  {
    id v7 = sub_10007A4A4(self, @"Querying User Identities");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 setName:v8];
  }

  else
  {
    [v5 setName:@"Querying User Identities"];
  }

  return v6;
}

- (id)createGroupForPropagateChanges
{
  id v3 = [(id)objc_opt_class(self) allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:]( self,  "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:",  v3,  [(id)objc_opt_class(self) allowsSyncOverExpensiveNetwork],  0,  0,  1);
  id v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  id v6 = v5;
  if (self->_operationGroupMapper)
  {
    id v7 = sub_10007A4A4(self, @"Propagating Changes Between Zones");
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    [v6 setName:v8];
  }

  else
  {
    [v5 setName:@"Propagating Changes Between Zones"];
  }

  return v6;
}

- (void)findPersistedInitialSyncSession:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  reschedulerManager = self->_reschedulerManager;
  if (reschedulerManager)
  {
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport abstractObject](self, "abstractObject"));
    BOOL v11 = (void *)objc_claimAutoreleasedReturnValue([v10 engineLibrary]);
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 scheduler]);
    -[CPLCloudKitReschedulerManager findPersistedSyncSession:forScheduler:completionHandler:]( reschedulerManager,  "findPersistedSyncSession:forScheduler:completionHandler:",  v6,  v12,  v8);
  }

  else
  {
    workQueue = self->_workQueue;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_10007FC3C;
    v17[3] = &unk_10023DBC8;
    id v18 = v7;
    id v14 = v17;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10008551C;
    block[3] = &unk_10023DBC8;
    id v20 = v14;
    BOOL v15 = workQueue;
    dispatch_block_t v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v15, v16);
  }
}

- (void)dropPersistedInitialSyncSession
{
}

- (id)createReschedulerForSession:(id)a3
{
  id v4 = a3;
  reschedulerManager = self->_reschedulerManager;
  if (reschedulerManager)
  {
    if (!_CPLSilentLogging)
    {
      id v6 = sub_10007B4F8();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = self->_reschedulerManager;
        int v11 = 138412546;
        id v12 = self;
        __int16 v13 = 2112;
        id v14 = v8;
        _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "Creating CloudKit rescheduler for %@ with %@",  (uint8_t *)&v11,  0x16u);
      }

      reschedulerManager = self->_reschedulerManager;
    }

    id v9 = -[CPLCloudKitReschedulerManager newCloudKitReschedulerForSession:]( reschedulerManager,  "newCloudKitReschedulerForSession:",  v4);
  }

  else
  {
    id v9 = 0LL;
  }

  return v9;
}

+ (NSArray)involvedProcesses
{
  if (qword_100296380 != -1) {
    dispatch_once(&qword_100296380, &stru_100241660);
  }
  return (NSArray *)(id)qword_100296378;
}

- (NSArray)involvedProcesses
{
  return (NSArray *)[(id)objc_opt_class(self) involvedProcesses];
}

+ (BOOL)allowsSyncOverCellular
{
  if (qword_100296388 != -1) {
    dispatch_once(&qword_100296388, &stru_100241680);
  }
  return byte_100290CE0;
}

+ (BOOL)allowsSyncOverExpensiveNetwork
{
  if (qword_100296390 != -1) {
    dispatch_once(&qword_100296390, &stru_1002416A0);
  }
  return byte_100290CE1;
}

+ (BOOL)allowsUserInitiatedOperationsOverExpensiveNetwork
{
  if (qword_100296398 != -1) {
    dispatch_once(&qword_100296398, &stru_1002416C0);
  }
  return byte_100290CE2;
}

- (void)_startWatchingAccountInfoChangesWithCompletionHandler:(id)a3
{
  id v5 = a3;
  if (self->_accountInfoWatcher) {
    sub_100195E68(a2, (uint64_t)self);
  }
  id v6 = v5;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](&OBJC_CLASS___NSNotificationCenter, "defaultCenter"));
  workOperationQueue = self->_workOperationQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000800E8;
  v11[3] = &unk_1002415D0;
  void v11[4] = self;
  id v9 = objc_claimAutoreleasedReturnValue( [v7 addObserverForName:CKAccountChangedNotification object:0 queue:workOperationQueue usingBlock:v11]);
  accountInfoWatcher = self->_accountInfoWatcher;
  self->_accountInfoWatcher = v9;

  -[CPLCloudKitTransport _forceUpdateAccountInfoWithReason:completionHandler:]( self,  "_forceUpdateAccountInfoWithReason:completionHandler:",  0LL,  v6);
}

- (void)_stopWatchingAccountInfoChanges
{
  accountInfoWatcher = self->_accountInfoWatcher;
  self->_accountInfoWatcher = 0LL;
}

- (void)_forceUpdateAccountInfoWithReason:(id)a3
{
}

- (void)_forceUpdateAccountInfoWithReason:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  lastAccountInfoUpdateDate = self->_lastAccountInfoUpdateDate;
  if (lastAccountInfoUpdateDate
    && (-[NSDate timeIntervalSinceNow](lastAccountInfoUpdateDate, "timeIntervalSinceNow"), v9 > -600.0))
  {
    if (!_CPLSilentLogging)
    {
      id v10 = sub_10007B4F8();
      int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v16) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEBUG,  "Not updating account info as it has been updated recently",  (uint8_t *)&v16,  2u);
      }
    }

    v7[2](v7);
  }

  else
  {
    if (v6 && !_CPLSilentLogging)
    {
      id v12 = sub_10007B4F8();
      __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 138412290;
        id v17 = v6;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "Force updating status of Walrus. Reason: %@",  (uint8_t *)&v16,  0xCu);
      }
    }

    id v14 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    BOOL v15 = self->_lastAccountInfoUpdateDate;
    self->_lastAccountInfoUpdateDate = v14;

    -[CPLCloudKitTransport _updateAccountInfoWithCompletionHandler:]( self,  "_updateAccountInfoWithCompletionHandler:",  v7);
  }
}

- (void)_updateAccountInfoWithCompletionHandler:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self->_accountInfoFetchGeneration + 1;
  self->_accountInfoFetchGeneration = v5;
  coordinator = self->_coordinator;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_1000803E4;
  v8[3] = &unk_100241730;
  id v9 = v4;
  unint64_t v10 = v5;
  v8[4] = self;
  id v7 = v4;
  -[CPLCloudKitCoordinator fetchAccountInfoWithCompletionHandler:]( coordinator,  "fetchAccountInfoWithCompletionHandler:",  v8);
}

- (void)_updateStateWithAccountInfo:(id)a3 walrusEnabledDefault:(id)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4)
  {
    id v8 = [a4 BOOLValue];
    if (!_CPLSilentLogging)
    {
      id v9 = sub_10007B4F8();
      unint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = @"OFF";
        if ((_DWORD)v8) {
          int v11 = @"ON";
        }
        int v28 = 138412290;
        v29 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "Forcing walrus to %@",  (uint8_t *)&v28,  0xCu);
      }
    }

    id v12 = self;
    uint64_t v13 = (uint64_t)v8;
LABEL_9:
    -[CPLCloudKitTransport _updateWalrusTo:](v12, "_updateWalrusTo:", v13);
    goto LABEL_10;
  }

  id v14 = [v6 supportsDeviceToDeviceEncryption];
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport abstractObject](self, "abstractObject"));
  uint64_t v16 = objc_claimAutoreleasedReturnValue([v15 engineLibrary]);
  [(id)v16 setKeychainCDPEnabled:v14];

  id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport abstractObject](self, "abstractObject"));
  id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 engineLibrary]);
  LOBYTE(v16) = [v18 isKeychainCDPEnabled];

  if ((v16 & 1) == 0 && !_CPLSilentLogging)
  {
    id v19 = sub_10007B4F8();
    id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v20,  OS_LOG_TYPE_DEFAULT,  "[CCSS] CK Account Info reports DeviceToDeviceEncryption is disabled, ComputeSync disabled on this device",  (uint8_t *)&v28,  2u);
    }
  }

  id v21 = [v7 walrusStatus];
  if (v21 == (id)2)
  {
    if (!_CPLSilentLogging)
    {
      id v24 = sub_10007B4F8();
      __int128 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v28) = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Walrus is disabled", (uint8_t *)&v28, 2u);
      }
    }

    id v12 = self;
    uint64_t v13 = 0LL;
    goto LABEL_9;
  }

  if (v21 == (id)1)
  {
    if (!_CPLSilentLogging)
    {
      id v26 = sub_10007B4F8();
      objc_super v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v28) = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Walrus is enabled", (uint8_t *)&v28, 2u);
      }
    }

    id v12 = self;
    uint64_t v13 = 1LL;
    goto LABEL_9;
  }

  if (!v21 && !_CPLSilentLogging)
  {
    id v22 = sub_10007B4F8();
    v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v28) = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v23,  OS_LOG_TYPE_ERROR,  "Could not determine walrus status",  (uint8_t *)&v28,  2u);
    }
  }

- (void)_updateStateWithAccountStatus:(int64_t)a3
{
  if (!_CPLSilentLogging)
  {
    id v5 = sub_10007B4F8();
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = CKStringFromAccountStatus(a3);
      id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
      int v10 = 138543362;
      int v11 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "Account status is %{public}@",  (uint8_t *)&v10,  0xCu);
    }
  }

  switch(a3)
  {
    case 1LL:
      -[CPLCloudKitTransport _enableSchedulerBecauseAccountIsAvailable]( self,  "_enableSchedulerBecauseAccountIsAvailable");
      return;
    case 2LL:
      id v9 = @"account is restricted";
      goto LABEL_10;
    case 3LL:
      id v9 = @"there is no Apple Account";
      goto LABEL_10;
    case 4LL:
      id v9 = @"Apple Account is not ready";
LABEL_10:
      -[CPLCloudKitTransport _disableSchedulerBecauseAccountIsUnavailableWithReason:]( self,  "_disableSchedulerBecauseAccountIsUnavailableWithReason:",  v9);
      break;
    default:
      return;
  }

- (void)_enableSchedulerBecauseAccountIsAvailable
{
  if (self->_lastDisablingReasonBecauseOfAccountStatus)
  {
    if (!_CPLSilentLogging)
    {
      id v3 = sub_10007B4F8();
      id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v12 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "Re-enabling synchronization because account is now available",  v12,  2u);
      }
    }

    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport abstractObject](self, "abstractObject"));
    id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 engineLibrary]);
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 scheduler]);

    [v7 enableSynchronizationWithReason:self->_lastDisablingReasonBecauseOfAccountStatus];
    lastDisablingReasonBecauseOfAccountStatus = self->_lastDisablingReasonBecauseOfAccountStatus;
    self->_lastDisablingReasonBecauseOfAccountStatus = 0LL;
  }

  id v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport abstractObject](self, "abstractObject"));
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 engineLibrary]);
  unsigned __int8 v11 = [v10 containerHasBeenWiped];

  if ((v11 & 1) == 0) {
    -[CPLCloudKitTransport setErrorForAllOperations:](self, "setErrorForAllOperations:", 0LL);
  }
}

- (void)_disableSchedulerBecauseAccountIsUnavailableWithReason:(id)a3
{
  id v5 = a3;
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport abstractObject](self, "abstractObject"));
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue([v6 engineLibrary]);
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 scheduler]);

  p_lastDisablingReasonBecauseOfAccountStatus = &self->_lastDisablingReasonBecauseOfAccountStatus;
  lastDisablingReasonBecauseOfAccountStatus = self->_lastDisablingReasonBecauseOfAccountStatus;
  if (lastDisablingReasonBecauseOfAccountStatus)
  {
    if (-[NSString isEqualToString:](lastDisablingReasonBecauseOfAccountStatus, "isEqualToString:", v5)) {
      goto LABEL_14;
    }
    [v8 disableSynchronizationWithReason:v5];
    [v8 enableSynchronizationWithReason:*p_lastDisablingReasonBecauseOfAccountStatus];
    if (!_CPLSilentLogging)
    {
      id v11 = sub_10007B4F8();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *p_lastDisablingReasonBecauseOfAccountStatus;
        *(_DWORD *)buf = 138412546;
        id v24 = v13;
        __int16 v25 = 2112;
        id v26 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "Switching reason to disable sync sessions from %@ to %@",  buf,  0x16u);
      }
    }
  }

  else
  {
    if (!_CPLSilentLogging)
    {
      id v14 = sub_10007B4F8();
      BOOL v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = (NSString *)v5;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "Disabling sync sessions. Reason: %@",  buf,  0xCu);
      }
    }

    [v8 disableSynchronizationWithReason:v5];
  }

  objc_storeStrong((id *)&self->_lastDisablingReasonBecauseOfAccountStatus, a3);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport abstractObject](self, "abstractObject"));
  id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 engineLibrary]);
  unsigned __int8 v18 = [v17 containerHasBeenWiped];

  if ((v18 & 1) == 0)
  {
    uint64_t v21 = CPLErrorRetryAfterReasonKey;
    id v22 = v5;
    id v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v22,  &v21,  1LL));
    id v20 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:underlyingError:userInfo:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:underlyingError:userInfo:description:",  1000LL,  0LL,  v19,  @"%@",  v5));

    -[CPLCloudKitTransport setErrorForAllOperations:](self, "setErrorForAllOperations:", v20);
  }

- (void)_updateWalrusTo:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport abstractObject](self, "abstractObject"));
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v5 engineLibrary]);
  [v4 setWalrusEnabled:v3];
}

+ (id)_betterErrorForRecordId:(id)a3 recordError:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7 || (id v9 = v8) == 0LL) {
    sub_100195F70((uint64_t)a2, (uint64_t)a1);
  }
  int v10 = (void *)objc_claimAutoreleasedReturnValue([v8 localizedDescription]);
  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@ (for record %@)",  v10,  v7));
  }

  else
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"record %@", v7));
  }

  id v12 = objc_alloc_init(&OBJC_CLASS___NSMutableDictionary);
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v9 userInfo]);

  if (v13)
  {
    id v14 = (void *)objc_claimAutoreleasedReturnValue([v9 userInfo]);
    -[NSMutableDictionary setDictionary:](v12, "setDictionary:", v14);

    -[NSMutableDictionary setObject:forKey:](v12, "setObject:forKey:", v11, NSLocalizedDescriptionKey);
  }

  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue([v9 domain]);
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  v15,  [v9 code],  v12));

  return v16;
}

+ (id)_errorsByTaskForTasksByRecordId:(id)a3 fromUnderlyingError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 domain]);
  if ([v8 isEqual:CKErrorDomain])
  {
    id v9 = [v7 code];

    if (v9 != (id)2)
    {
      id v12 = 0LL;
      goto LABEL_7;
    }

    int v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSMapTable strongToStrongObjectsMapTable]( &OBJC_CLASS___NSMapTable,  "strongToStrongObjectsMapTable"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue([v7 userInfo]);
    id v11 = (void *)objc_claimAutoreleasedReturnValue([v8 objectForKey:CKPartialErrorsByItemIDKey]);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_1000811EC;
    v14[3] = &unk_100241758;
    id v15 = v6;
    id v17 = a1;
    id v12 = v10;
    id v16 = v12;
    [v11 enumerateKeysAndObjectsUsingBlock:v14];
  }

  else
  {
    id v12 = 0LL;
  }

LABEL_7:
  return v12;
}

- (id)componentName
{
  return @"transport.cloudkit";
}

- (void)getStatusWithCompletionHandler:(id)a3
{
  id v4 = a3;
  coordinator = self->_coordinator;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100081318;
  v7[3] = &unk_10023E008;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  -[CPLCloudKitCoordinator getStatusForClient:completionHandler:]( coordinator,  "getStatusForClient:completionHandler:",  self,  v7);
}

- (void)getStatusDictionaryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100081C9C;
  v10[3] = &unk_10023E058;
  v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008551C;
  block[3] = &unk_10023DBC8;
  id v13 = v6;
  id v7 = workQueue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (void)testKey:(id)a3 value:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([v7 isEqual:@"reset-container"])
  {
    -[CPLCloudKitTransport _noteContainerHasBeenWiped](self, "_noteContainerHasBeenWiped");
LABEL_5:
    (*((void (**)(id, uint64_t, void, void))v8 + 2))(v8, 1LL, 0LL, 0LL);
    goto LABEL_6;
  }

  if ([v7 isEqual:@"unreset-container"])
  {
    dispatch_block_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport abstractObject](self, "abstractObject"));
    int v10 = (void *)objc_claimAutoreleasedReturnValue([v9 engineLibrary]);
    [v10 setContainerHasBeenWiped:0];

    goto LABEL_5;
  }

  if ([v7 isEqual:@"refresh-cloudkit"])
  {
    if (!_CPLSilentLogging)
    {
      id v11 = sub_10007B4F8();
      id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Refreshing account info", buf, 2u);
      }
    }

    workQueue = self->_workQueue;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100081F40;
    v17[3] = &unk_10023E058;
    void v17[4] = self;
    id v18 = v8;
    id v14 = v17;
    *(void *)buf = _NSConcreteStackBlock;
    uint64_t v20 = 3221225472LL;
    uint64_t v21 = sub_10008551C;
    id v22 = &unk_10023DBC8;
    id v23 = v14;
    id v15 = workQueue;
    dispatch_block_t v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
    dispatch_async(v15, v16);
  }

  else
  {
    (*((void (**)(id, void, void, void))v8 + 2))(v8, 0LL, 0LL, 0LL);
  }

- (void)_cleanTempRecoveredDataURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    if (qword_1002963A8 != -1) {
      dispatch_once(&qword_1002963A8, &stru_100241778);
    }
    if (byte_1002963A0)
    {
      dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
      dispatch_time_t v5 = dispatch_time(0LL, 10000000000LL);
      workQueue = self->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100082168;
      block[3] = &unk_10023DC70;
      id v9 = v4;
      dispatch_after(v5, (dispatch_queue_t)workQueue, block);
    }

    else
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"));
      [v7 removeItemAtURL:v4 error:0];
    }
  }
}

- (id)_tempDestinationURLForRecoveredDataWithTempFolderURL:(id)a3
{
  workQueue = self->_workQueue;
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)workQueue);
  dispatch_time_t v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue([v5 UUIDString]);

  id v7 = (void *)objc_claimAutoreleasedReturnValue([v4 URLByAppendingPathComponent:v6 isDirectory:0]);
  return v7;
}

- (void)_withTempCKAssetForData:(id)a3 tempFolderURL:(id)a4 block:(id)a5
{
  id v8 = (void (**)(id, CKAsset *, void))a5;
  workQueue = self->_workQueue;
  id v10 = a4;
  id v11 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)workQueue);
  id v12 = (void *)objc_claimAutoreleasedReturnValue( -[CPLCloudKitTransport _tempDestinationURLForRecoveredDataWithTempFolderURL:]( self,  "_tempDestinationURLForRecoveredDataWithTempFolderURL:",  v10));

  id v15 = 0LL;
  LODWORD(workQueue) = [v11 writeToURL:v12 options:1 error:&v15];

  id v13 = v15;
  if ((_DWORD)workQueue)
  {
    id v14 = -[CKAsset initWithFileURL:](objc_alloc(&OBJC_CLASS___CKAsset), "initWithFileURL:", v12);
    -[CKAsset setItemTypeHint:](v14, "setItemTypeHint:", @"fxd");
    v8[2](v8, v14, 0LL);
  }

  else
  {
    ((void (**)(id, CKAsset *, id))v8)[2](v8, 0LL, v13);
  }

  -[CPLCloudKitTransport _cleanTempRecoveredDataURL:](self, "_cleanTempRecoveredDataURL:", v12);
}

- (NSString)cloudKitClientIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport engineLibrary](self, "engineLibrary"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 libraryIdentifier]);

  return (NSString *)v3;
}

- (NSString)defaultSourceBundleIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport abstractObject](self, "abstractObject"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 engineLibrary]);
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 clientAppBundleIdentifier]);

  return (NSString *)v4;
}

- (void)_coordinator:(id)a3 provideCKAssetWithRecordID:(id)a4 fieldName:(id)a5 recordType:(id)a6 signature:(id)a7 tempFolderURL:(id)a8 completionHandler:(id)a9
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  workQueue = self->_workQueue;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472LL;
  v31[2] = sub_100082588;
  v31[3] = &unk_1002418B8;
  v31[4] = self;
  id v32 = v15;
  id v33 = v16;
  id v34 = v17;
  id v37 = v20;
  SEL v38 = a2;
  id v35 = v19;
  id v36 = v18;
  id v22 = v31;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008551C;
  block[3] = &unk_10023DBC8;
  id v40 = v22;
  id v23 = workQueue;
  id v24 = v18;
  id v25 = v19;
  id v26 = v17;
  id v27 = v20;
  id v28 = v16;
  id v29 = v15;
  dispatch_block_t v30 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v23, v30);
}

- (void)coordinator:(id)a3 provideCKAssetWithRecordID:(id)a4 fieldName:(id)a5 recordType:(id)a6 signature:(id)a7 completionHandler:(id)a8
{
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472LL;
  v19[2] = sub_10008399C;
  v19[3] = &unk_1002418E0;
  id v20 = self;
  id v21 = a3;
  id v22 = a4;
  id v23 = a5;
  id v24 = a6;
  id v25 = a7;
  id v26 = a8;
  id v13 = v26;
  id v14 = v25;
  id v15 = v24;
  id v16 = v23;
  id v17 = v22;
  id v18 = v21;
  -[CPLCloudKitTransport getTemporaryFolderWithName:completionHandler:]( v20,  "getTemporaryFolderWithName:completionHandler:",  @"DataRepair",  v19);
}

- (void)coordinatorDidReceiveAPushNotification:(id)a3
{
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100083B44;
  v7[3] = &unk_10023DC70;
  v7[4] = self;
  id v4 = v7;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008551C;
  block[3] = &unk_10023DBC8;
  id v9 = v4;
  dispatch_time_t v5 = workQueue;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);
}

- (id)interestingZoneIDsForCoordinator:(id)a3
{
  if (!-[CPLCloudKitTransport _isAppLibrary](self, "_isAppLibrary", a3)) {
    return 0LL;
  }
  id v4 = objc_alloc(&OBJC_CLASS___CKRecordZoneID);
  dispatch_time_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport mainScopeIdentifier](self, "mainScopeIdentifier"));
  dispatch_block_t v6 = -[CKRecordZoneID initWithCPLScopeIdentifier:](v4, "initWithCPLScopeIdentifier:", v5);
  id v9 = v6;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v9, 1LL));

  return v7;
}

- (BOOL)isInterestedInZoneID:(id)a3 forCoordinator:(id)a4
{
  return !-[CPLCloudKitTransport shouldIgnoreZoneWithZoneID:](self, "shouldIgnoreZoneWithZoneID:", a3, a4);
}

- (id)transportScopeFromConcreteScope:(id)a3
{
  return [a3 transportScope];
}

- (id)concreteScopeFromTransportScope:(id)a3
{
  return +[CPLCloudKitScope scopeFromTransportScope:](&OBJC_CLASS___CPLCloudKitScope, "scopeFromTransportScope:", a3);
}

- (id)cloudKitScopeForScopeIdentifier:(id)a3
{
  return -[CPLCloudKitZoneManager cloudKitScopeForScopeIdentifier:]( self->_zoneManager,  "cloudKitScopeForScopeIdentifier:",  a3);
}

- (id)zoneIDFromScopeIdentifier:(id)a3
{
  return -[CPLCloudKitZoneManager zoneIDFromScopeIdentifier:](self->_zoneManager, "zoneIDFromScopeIdentifier:", a3);
}

- (id)scopeIdentifierFromZoneID:(id)a3
{
  return -[CPLCloudKitZoneManager scopeIdentifierFromZoneID:](self->_zoneManager, "scopeIdentifierFromZoneID:", a3);
}

- (id)scopedIdentifierForCKRecordID:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = (void *)objc_claimAutoreleasedReturnValue([v4 zoneID]);
  dispatch_block_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport scopeIdentifierFromZoneID:](self, "scopeIdentifierFromZoneID:", v5));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cpl_scopedIdentifierWithScopeIdentifier:", v6));

  return v7;
}

- (id)recordsToFetchToIdentifyCloudKitScope:(id)a3 proposedScopeType:(int64_t)a4 currentUserID:(id)a5
{
  return -[CPLCloudKitZoneManager recordsToFetchToIdentifyCloudKitScope:proposedScopeType:currentUserID:]( self->_zoneManager,  "recordsToFetchToIdentifyCloudKitScope:proposedScopeType:currentUserID:",  a3,  a4,  a5);
}

- (int64_t)scopeTypeForCloudKitScope:(id)a3 proposedScopeType:(int64_t)a4 fetchedRecords:(id)a5 currentUserID:(id)a6
{
  return (int64_t)-[CPLCloudKitZoneManager scopeTypeForCloudKitScope:proposedScopeType:fetchedRecords:currentUserID:]( self->_zoneManager,  "scopeTypeForCloudKitScope:proposedScopeType:fetchedRecords:currentUserID:",  a3,  a4,  a5,  a6);
}

- (id)zoneIdentificationForCloudKitScope:(id)a3 engineScope:(id)a4
{
  return -[CPLCloudKitZoneManager zoneIdentificationForCloudKitScope:engineScope:]( self->_zoneManager,  "zoneIdentificationForCloudKitScope:engineScope:",  a3,  a4);
}

- (id)newOperationConfiguration
{
  return -[CPLCloudKitCoordinator newOperationConfiguration](self->_coordinator, "newOperationConfiguration");
}

- (void)launchOperation:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  -[CPLCloudKitCoordinator launchOperation:type:forClient:]( self->_coordinator,  "launchOperation:type:forClient:",  v6,  a4,  self);
  if (!-[CPLCloudKitTransport opened](self, "opened"))
  {
    if (!_CPLSilentLogging)
    {
      id v7 = sub_10007B4F8();
      id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = (void *)objc_claimAutoreleasedReturnValue([v6 cplOperationClassDescription]);
        int v10 = 138412290;
        id v11 = v9;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "Trying to launch %@ but engine is closed. Cancelling immediately",  (uint8_t *)&v10,  0xCu);
      }
    }

    [v6 cancel];
  }
}

- (void)associateMetric:(id)a3
{
}

- (BOOL)isNetworkConnected
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport engineLibrary](self, "engineLibrary"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 systemMonitor]);
  unsigned __int8 v4 = [v3 isNetworkConnected];

  return v4;
}

- (BOOL)isForeground
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport engineLibrary](self, "engineLibrary"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 scheduler]);
  unsigned __int8 v4 = [v3 isClientInForeground];

  return v4;
}

- (BOOL)canBoostOperations
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport engineLibrary](self, "engineLibrary"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 systemMonitor]);
  unsigned __int8 v4 = [v3 canBoostOperations];

  return v4;
}

- (BOOL)canBoostBackgroundOperations
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport engineLibrary](self, "engineLibrary"));
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue([v2 systemMonitor]);
  unsigned __int8 v4 = [v3 canBoostBackgroundOperations];

  return v4;
}

- (void)_failAllFutureOperationsWithContainerHasBeenWipedError
{
  BOOL v3 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport errorForAllOperations](self, "errorForAllOperations"));
  unsigned __int8 v4 = v3;
  if (!v3 || ([v3 isCPLErrorWithCode:1011] & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      id v5 = sub_10007B4F8();
      id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v10 = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "CloudKit has wiped the container (or the encryption keys have been reset) - will fail all future CK operations until engine is totally reset",  v10,  2u);
      }
    }

    uint64_t v11 = CPLErrorRetryAfterDateKey;
    id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSDate dateWithTimeIntervalSinceNow:]( &OBJC_CLASS___NSDate,  "dateWithTimeIntervalSinceNow:",  86400.0));
    id v12 = v7;
    id v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v12,  &v11,  1LL));
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[CPLErrors cplErrorWithCode:underlyingError:userInfo:description:]( &OBJC_CLASS___CPLErrors,  "cplErrorWithCode:underlyingError:userInfo:description:",  1011LL,  0LL,  v8,  @"Container has been reset - engine will need to wiped"));
    -[CPLCloudKitTransport setErrorForAllOperations:](self, "setErrorForAllOperations:", v9);
  }
}

- (void)_noteContainerHasBeenWiped
{
  workQueue = self->_workQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100084244;
  v6[3] = &unk_10023DC70;
  v6[4] = self;
  BOOL v3 = v6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008551C;
  block[3] = &unk_10023DBC8;
  id v8 = v3;
  unsigned __int8 v4 = workQueue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

- (void)processTaskErrorIfNeeded:(id)a3 forTask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6
    || !+[CPLCloudKitErrors getCloudKitErrorCode:internalCode:fromError:]( &OBJC_CLASS___CPLCloudKitErrors,  "getCloudKitErrorCode:internalCode:fromError:",  &v34,  &v33,  v6))
  {
    goto LABEL_18;
  }

  if (v34 == 18 || v33 == 2039)
  {
    if (!_CPLSilentLogging)
    {
      id v10 = sub_10007B4F8();
      uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "Client is unsupported by server - marking engine as too old",  (uint8_t *)&buf,  2u);
      }
    }

    workQueue = self->_workQueue;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472LL;
    v32[2] = sub_1000846B8;
    v32[3] = &unk_10023DC70;
    v32[4] = self;
    id v13 = v32;
    goto LABEL_16;
  }

  if (+[CPLCloudKitErrors isContainerHasBeenWipedError:]( &OBJC_CLASS___CPLCloudKitErrors,  "isContainerHasBeenWipedError:",  v6))
  {
    if (!_CPLSilentLogging)
    {
      id v8 = sub_10007B4F8();
      id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "Container have been wiped - informing engine",  (uint8_t *)&buf,  2u);
      }
    }

    -[CPLCloudKitTransport _noteContainerHasBeenWiped](self, "_noteContainerHasBeenWiped");
    goto LABEL_18;
  }

  if (v34 == 114)
  {
    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport abstractObject](self, "abstractObject"));
    id v18 = (void *)objc_claimAutoreleasedReturnValue([v17 engineLibrary]);
    unsigned int v19 = [v18 isWalrusEnabled];

    if (v19)
    {
      if (_CPLSilentLogging) {
        goto LABEL_18;
      }
      id v20 = sub_10007B4F8();
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "Task %@ failed because Walrus is enabled - this might be a bug",  (uint8_t *)&buf,  0xCu);
      }

      goto LABEL_17;
    }

    if (!_CPLSilentLogging)
    {
      id v29 = sub_10007B4F8();
      dispatch_block_t v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v30,  OS_LOG_TYPE_DEFAULT,  "Task %@ failed because Walrus is enabled",  (uint8_t *)&buf,  0xCu);
      }
    }

    workQueue = self->_workQueue;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_100084704;
    v31[3] = &unk_10023DC70;
    v31[4] = self;
    id v13 = v31;
LABEL_16:
    id v14 = v13;
    *(void *)&__int128 buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472LL;
    id v36 = sub_10008551C;
    id v37 = &unk_10023DBC8;
    id v38 = v14;
    id v15 = workQueue;
    dispatch_block_t v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &buf);
    dispatch_async((dispatch_queue_t)v15, v16);

LABEL_17:
    goto LABEL_18;
  }

  if (v33 == 6000)
  {
    id v21 = (void *)objc_claimAutoreleasedReturnValue(+[CPLCloudKitErrors realErrorForError:](&OBJC_CLASS___CPLCloudKitErrors, "realErrorForError:", v6));
    id v22 = (void *)objc_claimAutoreleasedReturnValue([v21 userInfo]);
    id v23 = (void *)objc_claimAutoreleasedReturnValue([v22 objectForKey:NSUnderlyingErrorKey]);

    id v24 = (void *)objc_claimAutoreleasedReturnValue([v23 userInfo]);
    id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 objectForKey:NSUnderlyingErrorKey]);

    if ([v25 code] == (id)11)
    {
      id v26 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport abstractObject](self, "abstractObject"));
      id v27 = (void *)objc_claimAutoreleasedReturnValue([v26 engineLibrary]);
      id v28 = (void *)objc_claimAutoreleasedReturnValue([v27 scheduler]);
      [v28 noteStoreNeedsToUpdateDisabledFeatures];
    }
  }

- (BOOL)shouldRunOperationsWithError:(id *)a3
{
  unsigned __int8 v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport errorForAllOperations](self, "errorForAllOperations"));
  dispatch_block_t v5 = v4;
  if (a3 && v4) {
    *a3 = v4;
  }

  return v5 == 0LL;
}

- (BOOL)_isAppLibrary
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport mainScopeIdentifier](self, "mainScopeIdentifier"));
  unsigned __int8 v3 = [v2 hasPrefix:CPLMainScopeIdentifierForAppPrefix];

  return v3;
}

- (BOOL)supportsSharedDatabase
{
  return !-[CPLCloudKitTransport _isAppLibrary](self, "_isAppLibrary");
}

- (id)databaseForOperationType:(int64_t)a3 relativeToOperationType:(int64_t)a4
{
  return -[CPLCloudKitCoordinator databaseForOperationType:relativeToOperationType:forClient:]( self->_coordinator,  "databaseForOperationType:relativeToOperationType:forClient:",  a3,  a4,  self);
}

- (BOOL)shouldIgnoreZoneWithZoneID:(id)a3
{
  id v4 = a3;
  if (!-[CPLCloudKitTransport _isAppLibrary](self, "_isAppLibrary"))
  {
    if (-[CPLCloudKitTransport supportsSharedDatabase](self, "supportsSharedDatabase")
      || (id v9 = (void *)objc_claimAutoreleasedReturnValue([v4 ownerName]),
          unsigned int v10 = [v9 isEqualToString:CKCurrentUserDefaultName],
          v9,
          v10))
    {
      if (-[CPLCloudKitTransport isSystemLibrary](self, "isSystemLibrary"))
      {
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v4 zoneName]);
        unsigned __int8 v12 = [v11 hasPrefix:CPLMainScopeIdentifierForAppPrefix];

        if ((v12 & 1) != 0)
        {
          char v8 = 1;
          goto LABEL_16;
        }
      }

      shouldIgnoreZoneWithZoneID = (uint64_t (**)(id, id))self->_shouldIgnoreZoneWithZoneID;
      if (shouldIgnoreZoneWithZoneID)
      {
        char v8 = shouldIgnoreZoneWithZoneID[2](shouldIgnoreZoneWithZoneID, v4);
        goto LABEL_16;
      }
    }

    char v8 = 0;
    goto LABEL_16;
  }

  uint64_t v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cpl_zoneName"));
  uint64_t v6 = objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport mainScopeIdentifier](self, "mainScopeIdentifier"));
  uint64_t v7 = v6;
  char v8 = (!v5 || !v6 || ([(id)v5 isEqual:v6] & 1) == 0) && (v5 | v7) != 0;

LABEL_16:
  return v8;
}

- (BOOL)shouldIgnoreScopeWithIdentifier:(id)a3
{
  unsigned __int8 v3 = self;
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[CPLCloudKitTransport zoneIDFromScopeIdentifier:](self, "zoneIDFromScopeIdentifier:", a3));
  LOBYTE(v3) = -[CPLCloudKitTransport shouldIgnoreZoneWithZoneID:](v3, "shouldIgnoreZoneWithZoneID:", v4);

  return (char)v3;
}

- (void)noteZoneIDChangeWasIgnored:(id)a3
{
}

- (void)registerHelper:(id)a3 withIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_100084A88;
  v15[3] = &unk_10023DA98;
  v15[4] = self;
  id v16 = v8;
  id v17 = v7;
  SEL v18 = a2;
  unsigned int v10 = v15;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008551C;
  block[3] = &unk_10023DBC8;
  id v20 = v10;
  uint64_t v11 = workQueue;
  id v12 = v7;
  id v13 = v8;
  dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);
}

- (void)acquireHelperWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100084C34;
  v14[3] = &unk_10023E878;
  id v15 = v6;
  id v16 = v7;
  void v14[4] = self;
  id v9 = v14;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008551C;
  block[3] = &unk_10023DBC8;
  id v18 = v9;
  unsigned int v10 = workQueue;
  id v11 = v6;
  id v12 = v7;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

- (void)getTemporaryFolderWithName:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472LL;
  v14[2] = sub_100084E70;
  v14[3] = &unk_10023E878;
  id v15 = v6;
  id v16 = v7;
  void v14[4] = self;
  id v9 = v14;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10008551C;
  block[3] = &unk_10023DBC8;
  id v18 = v9;
  unsigned int v10 = workQueue;
  id v11 = v6;
  id v12 = v7;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

- (CPLCloudKitOperationsTracker)operationTracker
{
  return self->_operationTracker;
}

- (CPLCloudKitReschedulerManager)reschedulerManager
{
  return self->_reschedulerManager;
}

- (void)setReschedulerManager:(id)a3
{
}

- (CPLCloudKitOperationGroupMapper)operationGroupMapper
{
  return self->_operationGroupMapper;
}

- (void)setOperationGroupMapper:(id)a3
{
}

- (BOOL)opened
{
  return self->_opened;
}

- (void)setOpened:(BOOL)a3
{
  self->_opened = a3;
}

- (id)shouldIgnoreZoneWithZoneID
{
  return self->_shouldIgnoreZoneWithZoneID;
}

- (void)setShouldIgnoreZoneWithZoneID:(id)a3
{
}

- (CPLFingerprintContext)fingerprintContext
{
  return (CPLFingerprintContext *)objc_getProperty(self, a2, 216LL, 1);
}

- (void)setFingerprintContext:(id)a3
{
}

- (CPLCloudKitZoneManager)zoneManager
{
  return self->_zoneManager;
}

- (void)setZoneManager:(id)a3
{
}

- (CPLCloudKitCoordinator)coordinator
{
  return (CPLCloudKitCoordinator *)objc_getProperty(self, a2, 232LL, 1);
}

- (CPLDuetTicketProvider)duetTicketProvider
{
  return (CPLDuetTicketProvider *)objc_getProperty(self, a2, 240LL, 1);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSDate)significantWorkBeginDate
{
  return self->_significantWorkBeginDate;
}

- (void)setSignificantWorkBeginDate:(id)a3
{
}

- (NSError)errorForAllOperations
{
  return (NSError *)objc_getProperty(self, a2, 256LL, 1);
}

- (void)setErrorForAllOperations:(id)a3
{
}

- (void).cxx_destruct
{
}

@end