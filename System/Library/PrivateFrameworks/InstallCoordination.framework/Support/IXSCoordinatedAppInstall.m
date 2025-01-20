@interface IXSCoordinatedAppInstall
+ (BOOL)supportsSecureCoding;
+ (id)_fetchInstallOptionsFromPromise:(id)a3 error:(id *)a4;
- (BOOL)_eligibleToScheduleUpdate;
- (BOOL)_limitedConcurrency_doRetryingInstallOperationForPlaceholder:(BOOL)a3 installTargetURL:(id)a4 retries:(unint64_t)a5 error:(id *)a6 installAttemptBlock:(id)a7;
- (BOOL)_onQueue_acquireTerminationAssertionWithPredicate:(id)a3 description:(id)a4 terminationResistance:(unsigned __int8)a5 allowLaunchPredicate:(id)a6 error:(id *)a7;
- (BOOL)_onQueue_internal_cancelForReason:(id)a3 client:(unint64_t)a4 needsLSDatabaseSync:(BOOL *)a5 error:(id *)a6;
- (BOOL)_onQueue_isPlaceholderUnnecessary;
- (BOOL)_onQueue_scheduleUpdate;
- (BOOL)_onQueue_shouldDeletePlaceholderOnCancelationForReason:(id)a3 client:(unint64_t)a4;
- (BOOL)_placeholderOrParallelPlaceholderIsInstalledWithRecord:(id *)a3;
- (BOOL)_shouldRemovePlaceholderForReason:(id)a3;
- (BOOL)_validateParentLinkageForInstallOptions:(id)a3 connection:(id)a4 error:(id *)a5;
- (BOOL)appAssetPromiseSetterCanInstallLocalProvisionedContent;
- (BOOL)awakeFromSerializationWithError:(id *)a3;
- (BOOL)cancelForReason:(id)a3 client:(unint64_t)a4 error:(id *)a5;
- (BOOL)cancelForReason:(id)a3 client:(unint64_t)a4 needsLSDatabaseSync:(BOOL *)a5 error:(id *)a6;
- (BOOL)currentProgressPhaseIsComplete;
- (BOOL)expectTermAssertionCallback;
- (BOOL)externalGetIsPaused;
- (BOOL)isComplete;
- (BOOL)isPaused;
- (BOOL)isTracked;
- (BOOL)needsPostProcessing;
- (BOOL)placeholderIsInstalled;
- (BOOL)sentBeginPostProcessing;
- (BOOL)sentBeginRestoringUserData;
- (BOOL)shouldBeginPostProcessing;
- (BOOL)shouldBeginRestoringUserData;
- (IPPublishedIdentityProgress)publishedInstallProgress;
- (IXAppInstallCoordinatorSeed)seed;
- (IXApplicationIdentity)identity;
- (IXProgressHint)progressHint;
- (IXProgressHint)progressHintWithDefault;
- (IXSClientConnection)scopedToConnection;
- (IXSCoordinatedAppInstall)initWithCoder:(id)a3;
- (IXSCoordinatedAppInstall)initWithSeed:(id)a3 scopedToConnection:(id)a4;
- (IXSCoordinatorProgress)coordinatorProgress;
- (IXSOwnedDataPromise)appAssetPromise;
- (IXSOwnedDataPromise)installOptionsPromise;
- (IXSPlaceholder)placeholderPromise;
- (IXSPlaceholderFailureInfo)placeholderFailureInfo;
- (IXSPowerAssertion)appInstallPowerAssertion;
- (IXSPromisedOutOfBandTransfer)deviceSecurityPromise;
- (IXSPromisedOutOfBandTransfer)preparationPromise;
- (IXSPromisedOutOfBandTransfer)userDataPromise;
- (LSRecordPromise)completedRecordPromise;
- (NSArray)essentialAssetPromiseUUIDs;
- (NSArray)essentialAssetPromises;
- (NSArray)initialODRAssetPromiseUUIDs;
- (NSArray)initialODRAssetPromises;
- (NSDate)firstAppExtensionBusyTime;
- (NSError)error;
- (NSMutableArray)pendingProgressRequests;
- (NSProgress)cachedCurrentPhaseProgress;
- (NSSet)promiseUUIDs;
- (NSString)description;
- (NSString)priorityBoostSourceInfo;
- (NSUUID)appAssetPromiseUUID;
- (NSUUID)deviceSecurityPromiseUUID;
- (NSUUID)installOptionsPromiseUUID;
- (NSUUID)placeholderPromiseUUID;
- (NSUUID)preparationPromiseUUID;
- (NSUUID)uniqueIdentifier;
- (NSUUID)userDataPromiseUUID;
- (OS_dispatch_group)outstandingInstallOperationsGroup;
- (OS_dispatch_queue)assertionQueue;
- (OS_dispatch_queue)delegateCallQueue;
- (OS_dispatch_queue)internalQueue;
- (OS_dispatch_source)assertionRetryTimer;
- (OS_os_transaction)assertionTransaction;
- (OS_os_transaction)transaction;
- (RBSTerminationAssertion)termAssertion;
- (id)_createPowerAssertion;
- (id)_limitedConcurrency_fetchInstallingProgress;
- (id)_limitedConcurrency_fetchLSProgressForPhase:(unint64_t)a3 appRecord:(id)a4;
- (id)_limitedConcurrency_installApplication:(id)a3 isPlaceholder:(BOOL)a4 options:(id)a5 retries:(unint64_t)a6 error:(id *)a7;
- (id)_onQueue_fetchInstallOptionsWithError:(id *)a3;
- (id)_onQueue_fetchMetadataFromInstalledAppForOffloadWithError:(id *)a3;
- (id)_onQueue_localizedAppName;
- (id)priorityBoostCompletion;
- (id)promiseStateDescription;
- (id)schedulerCallback;
- (int64_t)_onQueue_assertionRetrySeconds;
- (os_unfair_lock_s)externalPropertyLock;
- (unint64_t)appAssetPromiseDRI;
- (unint64_t)appInstallState;
- (unint64_t)assertionRetryCount;
- (unint64_t)creator;
- (unint64_t)effectiveIntent;
- (unint64_t)errorSourceIdentifier;
- (unint64_t)importance;
- (unint64_t)installationDomain;
- (unint64_t)newRemovability;
- (unint64_t)newRemovabilityClient;
- (unint64_t)originalInstallType;
- (unint64_t)originalIntent;
- (unint64_t)placeholderDisposition;
- (unint64_t)placeholderInstallState;
- (unint64_t)postProcessingAssertionState;
- (unint64_t)savedRemovability;
- (unint64_t)savedRemovabilityClient;
- (unint64_t)state;
- (unint64_t)transactionStepForPromise:(id)a3;
- (unint64_t)updateScheduleState;
- (unsigned)coordinatorScope;
- (void)_asyncUpdatePlaceholderMetadataWithInstallType:(unint64_t)a3 reason:(int64_t)a4 underlyingError:(id)a5 client:(unint64_t)a6;
- (void)_finishAppInstallAtURL:(id)a3 result:(BOOL)a4 recordPromise:(id)a5 error:(id)a6;
- (void)_finishPlaceholderInstallAtURL:(id)a3 result:(BOOL)a4 recordPromise:(id)a5 error:(id)a6;
- (void)_initInternalState;
- (void)_internalInitWithSeed:(id)a3 scopedToConnection:(id)a4;
- (void)_internal_setAppAssetPromise:(id)a3;
- (void)_internal_setInstallOptionsPromise:(id)a3;
- (void)_limitedConcurrency_fetchLoadingProgressForPlaceholderInstallType:(unint64_t)a3 progressHint:(id)a4 andRun:(id)a5;
- (void)_limitedConcurrency_fetchPostProcessingProgressAndRun:(id)a3;
- (void)_limitedConcurrency_saveOriginalInstallTypeForAppRecord:(id)a3;
- (void)_limitedConcurrency_setUpLSProgressForInstallType:(unint64_t)a3 progressHint:(id)a4;
- (void)_onAssertionQueue_setTermAssertion:(id)a3;
- (void)_onQueue_acquireAssertionAndDoInstall;
- (void)_onQueue_acquireAssertionAndInstallPlaceholder;
- (void)_onQueue_acquireAssertionForPlaceholder:(BOOL)a3;
- (void)_onQueue_cancelPlaceholderIfNeededForReason:(id)a3 client:(unint64_t)a4 needsLSDatabaseSync:(BOOL *)a5;
- (void)_onQueue_cancelProgress;
- (void)_onQueue_cancelProgress:(id)a3;
- (void)_onQueue_checkState;
- (void)_onQueue_configureTotalUnitCountsForInstallProgress:(id)a3;
- (void)_onQueue_convertTerminationAssertionToAllowExtensionLaunch;
- (void)_onQueue_doAddReference:(id)a3;
- (void)_onQueue_doInstall;
- (void)_onQueue_fetchProgressAndRun:(id)a3;
- (void)_onQueue_fetchProgressForPhase:(unint64_t)a3 andRun:(id)a4;
- (void)_onQueue_finishProgress;
- (void)_onQueue_finishProgress:(id)a3;
- (void)_onQueue_fireObserversForClient:(id)a3;
- (void)_onQueue_handleAppAssetPromiseCancellationWhenRestoringWithReason:(id)a3 client:(unint64_t)a4;
- (void)_onQueue_handleAssertionAcquisitionFailureForPlaceholder:(BOOL)a3 withError:(id)a4;
- (void)_onQueue_handleCancelForInstallFailure:(id)a3;
- (void)_onQueue_installPlaceholder;
- (void)_onQueue_internal_cancelForReason:(id)a3 client:(unint64_t)a4;
- (void)_onQueue_internal_saveState;
- (void)_onQueue_pauseProgress;
- (void)_onQueue_prioritizeWithCompletion:(id)a3;
- (void)_onQueue_removeParallelPlaceholder:(BOOL *)a3;
- (void)_onQueue_resumeProgress;
- (void)_onQueue_runAssertionHandlerForPlaceholder:(BOOL)a3;
- (void)_onQueue_runPostProcessingAssertionHandler;
- (void)_onQueue_saveState;
- (void)_onQueue_setInstallProgressPercentComplete:(double)a3 forPhase:(unint64_t)a4;
- (void)_onQueue_unregister;
- (void)_onQueue_updateLoadingProgress;
- (void)_onQueue_updatePlaceholderForFailureReason:(id)a3 client:(unint64_t)a4 installType:(unint64_t)a5;
- (void)_onQueue_updatePostProcessingProgress;
- (void)_pauseProgressObject:(id)a3;
- (void)_remote_appAssetPromiseHasBegunFulfillment:(id)a3;
- (void)_remote_cancelForReason:(id)a3 client:(unint64_t)a4 completion:(id)a5;
- (void)_remote_convertToGloballyScopedWithCompletion:(id)a3;
- (void)_remote_conveyPriorityReplacingExisting:(BOOL)a3 forConnection:(id)a4 withCompletion:(id)a5;
- (void)_remote_fireObserversForClient:(id)a3 completion:(id)a4;
- (void)_remote_getAppAssetPromise:(id)a3;
- (void)_remote_getAppAssetPromiseDRI:(id)a3;
- (void)_remote_getCoordinationState:(id)a3;
- (void)_remote_getCoordinatorScopeWithCompletion:(id)a3;
- (void)_remote_getDeviceSecurityPromise:(id)a3;
- (void)_remote_getErrorInfo:(id)a3;
- (void)_remote_getEssentialAssetPromises:(id)a3;
- (void)_remote_getHasDeviceSecurityPromise:(id)a3;
- (void)_remote_getInitialODRAssetPromises:(id)a3;
- (void)_remote_getInstallOptions:(id)a3;
- (void)_remote_getIsComplete:(id)a3;
- (void)_remote_getIsPausedWithCompletion:(id)a3;
- (void)_remote_getNeedsPostProcessing:(id)a3;
- (void)_remote_getPlaceholderDispositionWithCompletion:(id)a3;
- (void)_remote_getPlaceholderPromise:(id)a3;
- (void)_remote_getPostProcessingShouldBegin:(id)a3;
- (void)_remote_getPreparationPromise:(id)a3;
- (void)_remote_getProgressHintWithCompletion:(id)a3;
- (void)_remote_getUserDataPromise:(id)a3;
- (void)_remote_getUserDataRestoreShouldBegin:(id)a3;
- (void)_remote_hasAppAssetPromise:(id)a3;
- (void)_remote_hasEssentialAssetPromises:(id)a3;
- (void)_remote_hasInitialODRAssetPromises:(id)a3;
- (void)_remote_hasInstallOptions:(id)a3;
- (void)_remote_hasPlaceholderPromise:(id)a3;
- (void)_remote_hasUserDataPromise:(id)a3;
- (void)_remote_importanceWithCompletion:(id)a3;
- (void)_remote_prioritizeWithCompletion:(id)a3;
- (void)_remote_removabilityWithCompletion:(id)a3;
- (void)_remote_setAppAssetPromiseDRI:(unint64_t)a3 completion:(id)a4;
- (void)_remote_setAppAssetPromiseUUID:(id)a3 fromConnection:(id)a4 completion:(id)a5;
- (void)_remote_setDeviceSecurityPromiseUUID:(id)a3 completion:(id)a4;
- (void)_remote_setEssentialAssetPromiseUUIDs:(id)a3 completion:(id)a4;
- (void)_remote_setImportance:(unint64_t)a3 completion:(id)a4;
- (void)_remote_setInitialODRAssetPromiseUUIDs:(id)a3 completion:(id)a4;
- (void)_remote_setInstallOptionsPromiseUUID:(id)a3 forConnection:(id)a4 completion:(id)a5;
- (void)_remote_setIsPaused:(BOOL)a3 completion:(id)a4;
- (void)_remote_setNeedsPostProcessing:(BOOL)a3 completion:(id)a4;
- (void)_remote_setPlaceholderDisposition:(unint64_t)a3 completion:(id)a4;
- (void)_remote_setPlaceholderPromiseUUID:(id)a3 completion:(id)a4;
- (void)_remote_setPreparationPromiseUUID:(id)a3 completion:(id)a4;
- (void)_remote_setProgressHint:(id)a3 completion:(id)a4;
- (void)_remote_setRemovability:(unint64_t)a3 byClient:(unint64_t)a4 completion:(id)a5;
- (void)_remote_setUserDataPromiseUUID:(id)a3 completion:(id)a4;
- (void)_runAsyncBlockWithDescription:(id)a3 onLaunchServicesQueue:(id)a4;
- (void)_runAsyncBlockWithDescription:(id)a3 onUninstallQueue:(id)a4;
- (void)_runWithProgress:(id)a3 block:(id)a4;
- (void)_updatePendingOperationsForChangeFromPreviousState:(unint64_t)a3 toNewState:(unint64_t)a4;
- (void)assertionTargetProcessDidExit:(id)a3;
- (void)dealloc;
- (void)didUpdateProgress:(double)a3 forPhase:(unint64_t)a4 overallProgress:(double)a5;
- (void)encodeWithCoder:(id)a3;
- (void)externalSetIsPaused:(BOOL)a3 completion:(id)a4;
- (void)handleFirstUnlockNotification;
- (void)prioritizeWithCompletion:(id)a3;
- (void)promise:(id)a3 didCancelForReason:(id)a4 client:(unint64_t)a5;
- (void)promise:(id)a3 didUpdateProgress:(double)a4;
- (void)promiseDidBegin:(id)a3;
- (void)promiseDidComplete:(id)a3;
- (void)scheduledAppUpdateReadyToExecuteAndRunBlockWhenComplete:(id)a3;
- (void)setAppAssetPromise:(id)a3;
- (void)setAppAssetPromiseDRI:(unint64_t)a3;
- (void)setAppAssetPromiseSetterCanInstallLocalProvisionedContent:(BOOL)a3;
- (void)setAppAssetPromiseUUID:(id)a3;
- (void)setAppInstallPowerAssertion:(id)a3;
- (void)setAppInstallState:(unint64_t)a3;
- (void)setAssertionQueue:(id)a3;
- (void)setAssertionRetryCount:(unint64_t)a3;
- (void)setAssertionRetryTimer:(id)a3;
- (void)setAssertionTransaction:(id)a3;
- (void)setComplete:(BOOL)a3;
- (void)setCompletedRecordPromise:(id)a3;
- (void)setCoordinatorProgress:(id)a3;
- (void)setCoordinatorScope:(unsigned __int8)a3;
- (void)setCurrentProgressPhaseIsComplete:(BOOL)a3;
- (void)setDelegateCallQueue:(id)a3;
- (void)setDeviceSecurityPromise:(id)a3;
- (void)setDeviceSecurityPromiseUUID:(id)a3;
- (void)setEffectiveIntent:(unint64_t)a3;
- (void)setError:(id)a3;
- (void)setErrorSourceIdentifier:(unint64_t)a3;
- (void)setEssentialAssetPromiseUUIDs:(id)a3;
- (void)setEssentialAssetPromises:(id)a3;
- (void)setExpectTermAssertionCallback:(BOOL)a3;
- (void)setFirstAppExtensionBusyTime:(id)a3;
- (void)setImportance:(unint64_t)a3;
- (void)setInitialODRAssetPromiseUUIDs:(id)a3;
- (void)setInitialODRAssetPromises:(id)a3;
- (void)setInstallOptionsPromise:(id)a3;
- (void)setInstallOptionsPromiseUUID:(id)a3;
- (void)setInternalQueue:(id)a3;
- (void)setIsPaused:(BOOL)a3;
- (void)setIsPaused:(BOOL)a3 completion:(id)a4;
- (void)setIsTracked:(BOOL)a3;
- (void)setNeedsPostProcessing:(BOOL)a3;
- (void)setNewRemovability:(unint64_t)a3;
- (void)setNewRemovabilityClient:(unint64_t)a3;
- (void)setNewRemovabilityState:(unint64_t)a3 removabilityClient:(unint64_t)a4;
- (void)setOriginalInstallType:(unint64_t)a3;
- (void)setOutstandingInstallOperationsGroup:(id)a3;
- (void)setPendingProgressRequests:(id)a3;
- (void)setPlaceholderDisposition:(unint64_t)a3;
- (void)setPlaceholderFailureInfo:(id)a3;
- (void)setPlaceholderInstallState:(unint64_t)a3;
- (void)setPlaceholderInstallState:(unint64_t)a3 withLSRecordPromiseForCompletion:(id)a4;
- (void)setPlaceholderPromise:(id)a3;
- (void)setPlaceholderPromiseUUID:(id)a3;
- (void)setPostProcessingAssertionState:(unint64_t)a3;
- (void)setPreparationPromise:(id)a3;
- (void)setPreparationPromiseUUID:(id)a3;
- (void)setPriorityBoostCompletion:(id)a3;
- (void)setPriorityBoostCompletion:(id)a3 withSourceInfo:(id)a4;
- (void)setPriorityBoostSourceInfo:(id)a3;
- (void)setProgressHint:(id)a3;
- (void)setPublishedInstallProgress:(id)a3;
- (void)setSavedRemovability:(unint64_t)a3;
- (void)setSavedRemovabilityClient:(unint64_t)a3;
- (void)setSchedulerCallback:(id)a3;
- (void)setScopedToConnection:(id)a3;
- (void)setSentBeginPostProcessing:(BOOL)a3;
- (void)setSentBeginRestoringUserData:(BOOL)a3;
- (void)setTermAssertion:(id)a3;
- (void)setTransaction:(id)a3;
- (void)setUpdateScheduleState:(unint64_t)a3;
- (void)setUserDataPromise:(id)a3;
- (void)setUserDataPromiseUUID:(id)a3;
@end

@implementation IXSCoordinatedAppInstall

- (void)_initInternalState
{
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
  id v31 = (id)objc_claimAutoreleasedReturnValue([v3 uniqueIdentifier]);

  id v4 = objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString, "stringWithFormat:", @"com.apple.installcoordinationd.IXSCoordinatedAppInstall.%@", v31));
  v5 = (const char *)[v4 UTF8String];
  dispatch_queue_attr_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v7 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (OS_dispatch_queue *)dispatch_queue_create(v5, v7);
  internalQueue = self->_internalQueue;
  self->_internalQueue = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.installcoordinationd.IXSCoordinatedAppInstall.assertion.%@",  v31));
  id v11 = v10;
  v12 = (const char *)[v11 UTF8String];
  dispatch_queue_attr_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v14 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (OS_dispatch_queue *)dispatch_queue_create(v12, v14);
  assertionQueue = self->_assertionQueue;
  self->_assertionQueue = v15;

  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.installcoordinationd.IXSCoordinatedAppInstall.delegate.%@",  v31));
  id v18 = v17;
  v19 = (const char *)[v18 UTF8String];
  dispatch_queue_attr_t v20 = dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v21 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue(v20);
  v22 = (OS_dispatch_queue *)dispatch_queue_create(v19, v21);
  delegateCallQueue = self->_delegateCallQueue;
  self->_delegateCallQueue = v22;

  self->_externalPropertyLock._os_unfair_lock_opaque = 0;
  v24 = (OS_dispatch_group *)dispatch_group_create();
  outstandingInstallOperationsGroup = self->_outstandingInstallOperationsGroup;
  self->_outstandingInstallOperationsGroup = v24;

  v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.InstallCoordination.coordinator.%@",  v31));
  id v27 = v26;
  v28 = (OS_os_transaction *)os_transaction_create([v27 UTF8String]);
  transaction = self->_transaction;
  self->_transaction = v28;

  assertionTransaction = self->_assertionTransaction;
  self->_assertionTransaction = 0LL;
}

- (IXSCoordinatedAppInstall)initWithCoder:(id)a3
{
  id v4 = a3;
  v83.receiver = self;
  v83.super_class = (Class)&OBJC_CLASS___IXSCoordinatedAppInstall;
  v5 = -[IXSCoordinatedAppInstall init](&v83, "init");
  if (!v5)
  {
LABEL_37:
    v51 = v5;
    goto LABEL_38;
  }

  id v6 = [v4 decodeObjectOfClass:objc_opt_class(IXAppInstallCoordinatorSeed) forKey:@"seed"];
  uint64_t v7 = objc_claimAutoreleasedReturnValue(v6);
  seed = v5->_seed;
  v5->_seed = (IXAppInstallCoordinatorSeed *)v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall seed](v5, "seed"));
  if (v9)
  {
    v5->_complete = [v4 decodeBoolForKey:@"complete"];
    id v10 = [v4 decodeObjectOfClass:objc_opt_class(NSError) forKey:@"error"];
    uint64_t v11 = objc_claimAutoreleasedReturnValue(v10);
    error = v5->_error;
    v5->_error = (NSError *)v11;

    id v13 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"errorSourceIdentifier"];
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v5->_errorSourceIdentifier = (unint64_t)[v14 unsignedLongLongValue];

    id v15 = [v4 decodeObjectOfClass:objc_opt_class(NSUUID) forKey:@"placeholderPromiseUUID"];
    uint64_t v16 = objc_claimAutoreleasedReturnValue(v15);
    placeholderPromiseUUID = v5->_placeholderPromiseUUID;
    v5->_placeholderPromiseUUID = (NSUUID *)v16;

    id v18 = [v4 decodeObjectOfClass:objc_opt_class(NSUUID) forKey:@"appAssetPromiseUUID"];
    uint64_t v19 = objc_claimAutoreleasedReturnValue(v18);
    appAssetPromiseUUID = v5->_appAssetPromiseUUID;
    v5->_appAssetPromiseUUID = (NSUUID *)v19;

    id v21 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"appAssetPromiseDRI"];
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v5->_appAssetPromiseDRI = (unint64_t)[v22 unsignedLongLongValue];

    id v23 = [v4 decodeObjectOfClass:objc_opt_class(NSUUID) forKey:@"installOptionsPromiseUUID"];
    uint64_t v24 = objc_claimAutoreleasedReturnValue(v23);
    installOptionsPromiseUUID = v5->_installOptionsPromiseUUID;
    v5->_installOptionsPromiseUUID = (NSUUID *)v24;

    uint64_t v26 = objc_opt_class(&OBJC_CLASS___NSArray);
    id v27 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v26,  objc_opt_class(&OBJC_CLASS___NSUUID),  0LL);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    uint64_t v29 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v28 forKey:@"initialODRAssetPromiseUUIDs"]);
    initialODRAssetPromiseUUIDs = v5->_initialODRAssetPromiseUUIDs;
    v5->_initialODRAssetPromiseUUIDs = (NSArray *)v29;

    id v31 = [v4 decodeObjectOfClass:objc_opt_class(NSUUID) forKey:@"userDataPromiseUUID"];
    uint64_t v32 = objc_claimAutoreleasedReturnValue(v31);
    userDataPromiseUUID = v5->_userDataPromiseUUID;
    v5->_userDataPromiseUUID = (NSUUID *)v32;

    id v34 = [v4 decodeObjectOfClass:objc_opt_class(NSUUID) forKey:@"preparationPromiseUUID"];
    uint64_t v35 = objc_claimAutoreleasedReturnValue(v34);
    preparationPromiseUUID = v5->_preparationPromiseUUID;
    v5->_preparationPromiseUUID = (NSUUID *)v35;

    id v37 = [v4 decodeObjectOfClass:objc_opt_class(NSUUID) forKey:@"deviceSecurityPromiseUUID"];
    uint64_t v38 = objc_claimAutoreleasedReturnValue(v37);
    deviceSecurityPromiseUUID = v5->_deviceSecurityPromiseUUID;
    v5->_deviceSecurityPromiseUUID = (NSUUID *)v38;

    id v40 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"newRemovability"];
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    v5->_newRemovability = (unint64_t)[v41 unsignedLongLongValue];

    id v42 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"savedRemovability"];
    v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
    v5->_savedRemovability = (unint64_t)[v43 unsignedLongLongValue];

    id v44 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"newRemovabilityClient"];
    v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
    v5->_newRemovabilityClient = (unint64_t)[v45 unsignedLongLongValue];

    id v46 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"savedRemovabilityClient"];
    v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
    v5->_savedRemovabilityClient = (unint64_t)[v47 unsignedLongLongValue];

    if ([v4 containsValueForKey:@"placeholderInstalled"])
    {
      if (![v4 decodeBoolForKey:@"placeholderInstalled"])
      {
        v5->_uint64_t placeholderInstallState = 0LL;
LABEL_13:
        if ([v4 containsValueForKey:@"appInstalled"])
        {
          if (![v4 decodeBoolForKey:@"appInstalled"])
          {
            v5->_uint64_t appInstallState = 0LL;
            goto LABEL_20;
          }

          uint64_t appInstallState = 4LL;
        }

        else
        {
          id v55 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"appInstallState"];
          v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
          v5->_uint64_t appInstallState = (unint64_t)[v56 unsignedLongLongValue];

          uint64_t appInstallState = v5->_appInstallState;
        }

        v5->_uint64_t appInstallState = appInstallState;
LABEL_20:
        id v57 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"postProcessingAssertionState"];
        v58 = (void *)objc_claimAutoreleasedReturnValue(v57);
        v5->_unint64_t postProcessingAssertionState = (unint64_t)[v58 unsignedLongLongValue];

        unint64_t postProcessingAssertionState = v5->_postProcessingAssertionState;
        if (postProcessingAssertionState - 1 < 3) {
          unint64_t postProcessingAssertionState = 0LL;
        }
        v5->_unint64_t postProcessingAssertionState = postProcessingAssertionState;
        id v60 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"originalInstallType"];
        v61 = (void *)objc_claimAutoreleasedReturnValue(v60);
        v5->_originalInstallType = (unint64_t)[v61 unsignedLongLongValue];

        v5->_isPaused = [v4 decodeBoolForKey:@"isPaused"];
        id v62 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"effectiveIntent"];
        v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
        v5->_effectiveIntent = (unint64_t)[v63 unsignedLongLongValue];

        v5->_sentBeginRestoringUserData = [v4 decodeBoolForKey:@"sentBeginRestoringUserData"];
        id v64 = [v4 decodeObjectOfClass:objc_opt_class(IXSPlaceholderFailureInfo) forKey:@"placeholderFailureInfo"];
        uint64_t v65 = objc_claimAutoreleasedReturnValue(v64);
        placeholderFailureInfo = v5->_placeholderFailureInfo;
        v5->_placeholderFailureInfo = (IXSPlaceholderFailureInfo *)v65;

        id v67 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"assertionRetryCount"];
        v68 = (void *)objc_claimAutoreleasedReturnValue(v67);
        v5->_assertionRetryCount = (unint64_t)[v68 unsignedLongLongValue];

        if ([v4 containsValueForKey:@"isUserInitiated"])
        {
          else {
            uint64_t v69 = 1LL;
          }
          v5->_importance = v69;
        }

        else
        {
          id v70 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"importance"];
          v71 = (void *)objc_claimAutoreleasedReturnValue(v70);
          v5->_importance = (unint64_t)[v71 unsignedLongLongValue];
        }

        if (!v5->_effectiveIntent)
        {
          v72 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall seed](v5, "seed"));
          v5->_effectiveIntent = (unint64_t)[v72 intent];
        }

        v5->_appAssetPromiseSetterCanInstallLocalProvisionedContent = [v4 decodeBoolForKey:@"appAssetPromiseSetterCanInstallLocalProvisionedContent"];
        if ([v4 containsValueForKey:@"coordinatorScope"])
        {
          id v73 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"coordinatorScope"];
          v74 = (void *)objc_claimAutoreleasedReturnValue(v73);
          v5->_coordinatorScope = [v74 unsignedCharValue];
        }

        else
        {
          v5->_coordinatorScope = 2;
        }

        if ([v4 containsValueForKey:@"placeholderDisposition"])
        {
          id v75 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"placeholderDisposition"];
          v76 = (void *)objc_claimAutoreleasedReturnValue(v75);
          v5->_placeholderDisposition = (unint64_t)[v76 unsignedLongLongValue];
        }

        else
        {
          v5->_placeholderDisposition = 1LL;
        }

        v5->_needsPostProcessing = [v4 decodeBoolForKey:@"needsPostProcessing"];
        v5->_sentBeginPostProcessing = [v4 decodeBoolForKey:@"sentBeginPostProcessing"];
        uint64_t v77 = objc_opt_class(&OBJC_CLASS___NSArray);
        v78 = +[NSSet setWithObjects:]( &OBJC_CLASS___NSSet,  "setWithObjects:",  v77,  objc_opt_class(&OBJC_CLASS___NSUUID),  0LL);
        v79 = (void *)objc_claimAutoreleasedReturnValue(v78);
        uint64_t v80 = objc_claimAutoreleasedReturnValue([v4 decodeObjectOfClasses:v79 forKey:@"essentialAssetPromiseUUIDs"]);
        essentialAssetPromiseUUIDs = v5->_essentialAssetPromiseUUIDs;
        v5->_essentialAssetPromiseUUIDs = (NSArray *)v80;

        -[IXSCoordinatedAppInstall _initInternalState](v5, "_initInternalState");
        goto LABEL_37;
      }

      uint64_t placeholderInstallState = 4LL;
    }

    else
    {
      id v52 = [v4 decodeObjectOfClass:objc_opt_class(NSNumber) forKey:@"placeholderInstallState"];
      v53 = (void *)objc_claimAutoreleasedReturnValue(v52);
      v5->_uint64_t placeholderInstallState = (unint64_t)[v53 unsignedLongLongValue];

      uint64_t placeholderInstallState = v5->_placeholderInstallState;
    }

    v5->_uint64_t placeholderInstallState = placeholderInstallState;
    goto LABEL_13;
  }

  v49 = sub_1000047B4((uint64_t)off_1000E8CA0);
  v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
  if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT)) {
    sub_10007F934(v50);
  }

  v51 = 0LL;
LABEL_38:

  return v51;
}

- (void)_internalInitWithSeed:(id)a3 scopedToConnection:(id)a4
{
  id v10 = a3;
  id v7 = a4;
  objc_storeStrong((id *)&self->_seed, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](&OBJC_CLASS___NSUUID, "UUID"));
  [v10 setUniqueIdentifier:v8];

  -[IXSCoordinatedAppInstall _initInternalState](self, "_initInternalState");
  self->_appAssetPromiseDRI = (unint64_t)[v10 creator];
  self->_effectiveIntent = (unint64_t)[v10 intent];
  self->_importance = 1LL;
  if (v7)
  {
    self->_coordinatorScope = 1;
    objc_storeWeak((id *)&self->_scopedToConnection, v7);
  }

  else
  {
    self->_coordinatorScope = 2;
  }

  v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue", v10));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003E024;
  block[3] = &unk_1000CCE58;
  block[4] = self;
  dispatch_sync(v9, block);
}

- (IXSCoordinatedAppInstall)initWithSeed:(id)a3 scopedToConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)&OBJC_CLASS___IXSCoordinatedAppInstall;
  v8 = -[IXSCoordinatedAppInstall init](&v11, "init");
  v9 = v8;
  if (v8) {
    -[IXSCoordinatedAppInstall _internalInitWithSeed:scopedToConnection:]( v8,  "_internalInitWithSeed:scopedToConnection:",  v6,  v7);
  }

  return v9;
}

- (void)dealloc
{
  if (+[IXFeatureFlags scheduledUpdatesEnabled](&OBJC_CLASS___IXFeatureFlags, "scheduledUpdatesEnabled")
    && self->_updateScheduleState)
  {
    self->_updateScheduleState = 0LL;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[IXSAppUpdateScheduler sharedInstance](&OBJC_CLASS___IXSAppUpdateScheduler, "sharedInstance"));
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall uniqueIdentifier](self, "uniqueIdentifier"));
    [v3 removeUpdateRequestForCoordinatorUUID:v4];
  }

  v5 = (void (**)(id, void))objc_retainBlock(self->_priorityBoostCompletion);
  if (v5)
  {
    id v6 = self->_priorityBoostSourceInfo;
    id v7 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v15 = "-[IXSCoordinatedAppInstall dealloc]";
      __int16 v16 = 2112;
      v17 = self;
      __int16 v18 = 2112;
      uint64_t v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: %@: Disposing of %@", buf, 0x20u);
    }

    v5[2](v5, 0LL);
    id priorityBoostCompletion = self->_priorityBoostCompletion;
    self->_id priorityBoostCompletion = 0LL;

    priorityBoostSourceInfo = self->_priorityBoostSourceInfo;
    self->_priorityBoostSourceInfo = 0LL;
  }

  -[RBSTerminationAssertion invalidate](self->_termAssertion, "invalidate");
  termAssertion = self->_termAssertion;
  self->_termAssertion = 0LL;

  transaction = self->_transaction;
  self->_transaction = 0LL;

  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___IXSCoordinatedAppInstall;
  -[IXSCoordinatedAppInstall dealloc](&v13, "dealloc");
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall seed](self, "seed"));
  [v4 encodeObject:v5 forKey:@"seed"];

  objc_msgSend(v4, "encodeBool:forKey:", -[IXSCoordinatedAppInstall isComplete](self, "isComplete"), @"complete");
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall error](self, "error"));
  [v4 encodeObject:v6 forKey:@"error"];

  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[IXSCoordinatedAppInstall errorSourceIdentifier](self, "errorSourceIdentifier")));
  [v4 encodeObject:v7 forKey:@"errorSourceIdentifier"];

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall placeholderPromiseUUID](self, "placeholderPromiseUUID"));
  [v4 encodeObject:v8 forKey:@"placeholderPromiseUUID"];

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall appAssetPromiseUUID](self, "appAssetPromiseUUID"));
  [v4 encodeObject:v9 forKey:@"appAssetPromiseUUID"];

  id v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[IXSCoordinatedAppInstall appAssetPromiseDRI](self, "appAssetPromiseDRI")));
  [v4 encodeObject:v10 forKey:@"appAssetPromiseDRI"];

  objc_super v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall installOptionsPromiseUUID](self, "installOptionsPromiseUUID"));
  [v4 encodeObject:v11 forKey:@"installOptionsPromiseUUID"];

  v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[IXSCoordinatedAppInstall importance](self, "importance")));
  [v4 encodeObject:v12 forKey:@"importance"];

  objc_super v13 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall initialODRAssetPromiseUUIDs](self, "initialODRAssetPromiseUUIDs"));
  [v4 encodeObject:v13 forKey:@"initialODRAssetPromiseUUIDs"];

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall userDataPromiseUUID](self, "userDataPromiseUUID"));
  [v4 encodeObject:v14 forKey:@"userDataPromiseUUID"];

  id v15 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[IXSCoordinatedAppInstall placeholderInstallState](self, "placeholderInstallState")));
  [v4 encodeObject:v15 forKey:@"placeholderInstallState"];

  __int16 v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[IXSCoordinatedAppInstall appInstallState](self, "appInstallState")));
  [v4 encodeObject:v16 forKey:@"appInstallState"];

  v17 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[IXSCoordinatedAppInstall postProcessingAssertionState](self, "postProcessingAssertionState")));
  [v4 encodeObject:v17 forKey:@"postProcessingAssertionState"];

  __int16 v18 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[IXSCoordinatedAppInstall originalInstallType](self, "originalInstallType")));
  [v4 encodeObject:v18 forKey:@"originalInstallType"];

  objc_msgSend(v4, "encodeBool:forKey:", -[IXSCoordinatedAppInstall isPaused](self, "isPaused"), @"isPaused");
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent")));
  [v4 encodeObject:v19 forKey:@"effectiveIntent"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[IXSCoordinatedAppInstall sentBeginRestoringUserData](self, "sentBeginRestoringUserData"),  @"sentBeginRestoringUserData");
  dispatch_queue_attr_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall placeholderFailureInfo](self, "placeholderFailureInfo"));
  [v4 encodeObject:v20 forKey:@"placeholderFailureInfo"];

  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall preparationPromiseUUID](self, "preparationPromiseUUID"));
  [v4 encodeObject:v21 forKey:@"preparationPromiseUUID"];

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall deviceSecurityPromiseUUID](self, "deviceSecurityPromiseUUID"));
  [v4 encodeObject:v22 forKey:@"deviceSecurityPromiseUUID"];

  id v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[IXSCoordinatedAppInstall newRemovability](self, "newRemovability")));
  [v4 encodeObject:v23 forKey:@"newRemovability"];

  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[IXSCoordinatedAppInstall savedRemovability](self, "savedRemovability")));
  [v4 encodeObject:v24 forKey:@"savedRemovability"];

  v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[IXSCoordinatedAppInstall newRemovabilityClient](self, "newRemovabilityClient")));
  [v4 encodeObject:v25 forKey:@"newRemovabilityClient"];

  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[IXSCoordinatedAppInstall savedRemovabilityClient](self, "savedRemovabilityClient")));
  [v4 encodeObject:v26 forKey:@"savedRemovabilityClient"];

  id v27 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[IXSCoordinatedAppInstall assertionRetryCount](self, "assertionRetryCount")));
  [v4 encodeObject:v27 forKey:@"assertionRetryCount"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[IXSCoordinatedAppInstall appAssetPromiseSetterCanInstallLocalProvisionedContent]( self,  "appAssetPromiseSetterCanInstallLocalProvisionedContent"),  @"appAssetPromiseSetterCanInstallLocalProvisionedContent");
  v28 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedChar:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedChar:",  -[IXSCoordinatedAppInstall coordinatorScope](self, "coordinatorScope")));
  [v4 encodeObject:v28 forKey:@"coordinatorScope"];

  uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue( +[NSNumber numberWithUnsignedInteger:]( &OBJC_CLASS___NSNumber,  "numberWithUnsignedInteger:",  -[IXSCoordinatedAppInstall placeholderDisposition](self, "placeholderDisposition")));
  [v4 encodeObject:v29 forKey:@"placeholderDisposition"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[IXSCoordinatedAppInstall needsPostProcessing](self, "needsPostProcessing"),  @"needsPostProcessing");
  objc_msgSend( v4,  "encodeBool:forKey:",  -[IXSCoordinatedAppInstall sentBeginPostProcessing](self, "sentBeginPostProcessing"),  @"sentBeginPostProcessing");
  id v30 = (id)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall essentialAssetPromiseUUIDs](self, "essentialAssetPromiseUUIDs"));
  [v4 encodeObject:v30 forKey:@"essentialAssetPromiseUUIDs"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)awakeFromSerializationWithError:(id *)a3
{
  uint64_t v17 = 0LL;
  __int16 v18 = &v17;
  uint64_t v19 = 0x3032000000LL;
  dispatch_queue_attr_t v20 = sub_10003E9E8;
  id v21 = sub_10003E9F8;
  id v22 = 0LL;
  uint64_t v11 = 0LL;
  v12 = &v11;
  uint64_t v13 = 0x3032000000LL;
  v14 = sub_10003E9E8;
  id v15 = sub_10003E9F8;
  id v16 = 0LL;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_not_V2(v5);

  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003EA00;
  block[3] = &unk_1000CD448;
  block[4] = self;
  void block[5] = &v11;
  block[6] = &v17;
  dispatch_sync(v6, block);

  if (v18[5])
  {
    if (a3)
    {
      if (v12[5]) {
        id v7 = (void *)v12[5];
      }
      else {
        id v7 = (void *)v18[5];
      }
LABEL_8:
      *a3 = v7;
    }
  }

  else if (a3)
  {
    id v7 = (void *)v12[5];
    if (v7) {
      goto LABEL_8;
    }
  }

  BOOL v8 = v18[5] == 0;
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

- (id)_createPowerAssertion
{
  unint64_t v3 = -[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent");
  if (v3 != 3 && (-[IXSCoordinatedAppInstall importance](self, "importance") & 0xFFFFFFFFFFFFFFFELL) != 2) {
    return 0LL;
  }
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"IXPowerAssertion-%lu-%@",  -[IXSCoordinatedAppInstall creator](self, "creator"),  v4));
  if (v3 >= 8) {
    id v6 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown intent value %lu",  v3));
  }
  else {
    id v6 = *(&off_1000CE7B0 + v3);
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Power assertion for %@ with intent %@",  v4,  v6));

  BOOL v8 = -[IXSPowerAssertion initWithAssertionName:details:]( objc_alloc(&OBJC_CLASS___IXSPowerAssertion),  "initWithAssertionName:details:",  v5,  v7);
  return v8;
}

- (void)_onAssertionQueue_setTermAssertion:(id)a3
{
  v5 = (RBSTerminationAssertion *)a3;
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall assertionQueue](self, "assertionQueue"));
  dispatch_assert_queue_V2(v6);

  termAssertion = self->_termAssertion;
  if (v5 && termAssertion == v5)
  {
    BOOL v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_10007FD40();
    }
  }

  else
  {
    p_termAssertion = &self->_termAssertion;
    if (termAssertion) {
      -[RBSTerminationAssertion invalidate](termAssertion, "invalidate");
    }
    objc_storeStrong((id *)p_termAssertion, a3);
  }
}

- (void)setTermAssertion:(id)a3
{
  id v4 = a3;
  v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall assertionQueue](self, "assertionQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003FE54;
  block[3] = &unk_1000CCCB8;
  block[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_sync(v6, block);
}

- (void)handleFirstUnlockNotification
{
  unint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10003FECC;
  block[3] = &unk_1000CCE58;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (unint64_t)state
{
  unint64_t v3 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall error](self, "error"));

  if (v3) {
    return 1LL;
  }
  unint64_t v6 = -[IXSCoordinatedAppInstall placeholderInstallState](self, "placeholderInstallState");
  unint64_t v7 = -[IXSCoordinatedAppInstall appInstallState](self, "appInstallState");
  unint64_t v8 = -[IXSCoordinatedAppInstall postProcessingAssertionState](self, "postProcessingAssertionState");
  unint64_t v9 = -[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent");
  unint64_t v4 = 1LL;
  if (v6 != 5 && v7 != 5 && v8 != 5)
  {
    unint64_t v10 = v9;
    if (MKBDeviceUnlockedSinceBoot() != 1
      || (uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity")),
          v12 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleID]),
          BOOL v13 = sub_100031BB0(v12, 5LL),
          v12,
          v11,
          v13))
    {
      v14 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_10007FDB8(self);
      }

      return 2LL;
    }

    if ((v6 & 0xFFFFFFFFFFFFFFFDLL) == 4)
    {
      if (v10 == 6) {
        return 28LL;
      }
      if (v10 - 5 < 0xFFFFFFFFFFFFFFFELL)
      {
        if (v10 - 1 > 1)
        {
          BOOL v57 = 0;
          goto LABEL_46;
        }

        BOOL v57 = v10 - 5 < 0xFFFFFFFFFFFFFFFELL;
        uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall initialODRAssetPromises](self, "initialODRAssetPromises"));
        v56 = v19;
        dispatch_queue_attr_t v20 = v19;
        if (!v19)
        {
          unint64_t v4 = 11LL;
          goto LABEL_60;
        }

        uint64_t v81 = 0LL;
        v82 = &v81;
        uint64_t v83 = 0x2020000000LL;
        char v84 = 1;
        __int128 v71 = 0u;
        __int128 v72 = 0u;
        __int128 v73 = 0u;
        __int128 v74 = 0u;
        id v21 = v19;
        id v22 = [v21 countByEnumeratingWithState:&v71 objects:v86 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v72;
LABEL_24:
          uint64_t v24 = 0LL;
          while (1)
          {
            if (*(void *)v72 != v23) {
              objc_enumerationMutation(v21);
            }
            v25 = *(void **)(*((void *)&v71 + 1) + 8 * v24);
            uint64_t v26 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "accessQueue", v56));
            v70[0] = _NSConcreteStackBlock;
            v70[1] = 3221225472LL;
            v70[2] = sub_1000408F0;
            v70[3] = &unk_1000CD080;
            v70[4] = v25;
            v70[5] = &v81;
            dispatch_sync(v26, v70);

            if (!*((_BYTE *)v82 + 24)) {
              break;
            }
            if (v22 == (id)++v24)
            {
              id v22 = [v21 countByEnumeratingWithState:&v71 objects:v86 count:16];
              if (v22) {
                goto LABEL_24;
              }
              break;
            }
          }
        }

        int v27 = *((unsigned __int8 *)v82 + 24);
        _Block_object_dispose(&v81, 8);
        if (!v27)
        {
          unint64_t v4 = 12LL;
          dispatch_queue_attr_t v20 = v56;
LABEL_60:

          return v4;
        }

- (BOOL)_onQueue_isPlaceholderUnnecessary
{
  unint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  if ((id)-[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent") == (id)5
    || -[IXSCoordinatedAppInstall placeholderIsInstalled](self, "placeholderIsInstalled"))
  {
    char isKindOfClass = 1;
  }

  else
  {
    if ((id)-[IXSCoordinatedAppInstall creator](self, "creator") == (id)10
      && ((id)-[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent") == (id)1
       || (id)-[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent") == (id)2))
    {
      v5 = sub_1000047B4((uint64_t)off_1000E8CA0);
      unint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[IXSCoordinatedAppInstall _onQueue_isPlaceholderUnnecessary]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: Skipping placeholder install for %@ because this coordinator was created by SystemAppMigrator",  buf,  0x16u);
      }

      char isKindOfClass = 1;
    }

    else
    {
      unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
      unint64_t v6 = (os_log_s *)objc_claimAutoreleasedReturnValue([v8 bundleID]);

      unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall appAssetPromise](self, "appAssetPromise"));
      uint64_t v10 = objc_opt_class(&OBJC_CLASS___IXSPromisedAppReference);
      char isKindOfClass = objc_opt_isKindOfClass(v9, v10);

      if ((isKindOfClass & 1) != 0)
      {
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall appAssetPromise](self, "appAssetPromise"));
        *(void *)buf = 0LL;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000LL;
        uint64_t v35 = sub_10003E9E8;
        id v36 = sub_10003E9F8;
        id v37 = 0LL;
        v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v11 accessQueue]);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100040DC8;
        block[3] = &unk_1000CCEF8;
        uint64_t v29 = buf;
        id v13 = v11;
        id v28 = v13;
        dispatch_sync(v12, block);

        v14 = (void *)objc_claimAutoreleasedReturnValue( +[LSApplicationWorkspace defaultWorkspace]( &OBJC_CLASS___LSApplicationWorkspace,  "defaultWorkspace"));
        unsigned __int8 v15 = [v14 applicationIsInstalled:v6];

        if ((v15 & 1) != 0)
        {
          id v16 = sub_1000047B4((uint64_t)off_1000E8CA0);
          uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)id v30 = 136315394;
            id v31 = "-[IXSCoordinatedAppInstall _onQueue_isPlaceholderUnnecessary]";
            __int16 v32 = 2112;
            v33 = v6;
            _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s: Not installing placeholder because the app %@ is already installed for the current user for some persona",  v30,  0x16u);
          }
        }

        else
        {
          uint64_t v18 = *(void *)(*(void *)&buf[8] + 40LL);
          id v26 = 0LL;
          uint64_t v19 = MobileInstallationRegisterPlaceholderForReference(v18, &v26);
          dispatch_queue_attr_t v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
          uint64_t v17 = (os_log_s *)v26;

          if (v20)
          {
            id v21 = sub_1000047B4((uint64_t)off_1000E8CA0);
            id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v23 = *(os_log_s **)(*(void *)&buf[8] + 40LL);
              *(_DWORD *)id v30 = 136315394;
              id v31 = "-[IXSCoordinatedAppInstall _onQueue_isPlaceholderUnnecessary]";
              __int16 v32 = 2112;
              v33 = v23;
              _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%s: Successfully registered placeholder for %@",  v30,  0x16u);
            }
          }

          else
          {
            uint64_t v24 = sub_1000047B4((uint64_t)off_1000E8CA0);
            id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
              sub_10007FFA0();
            }
          }
        }

        _Block_object_dispose(buf, 8);
      }
    }
  }

  return isKindOfClass & 1;
}

- (BOOL)_eligibleToScheduleUpdate
{
  if (+[IXFeatureFlags scheduledUpdatesEnabled](&OBJC_CLASS___IXFeatureFlags, "scheduledUpdatesEnabled")) {
    return (id)-[IXSCoordinatedAppInstall importance](self, "importance") == (id)4;
  }
  unint64_t v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100080018(v5);
  }

  return 0;
}

- (BOOL)_onQueue_scheduleUpdate
{
  unint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  if (!-[IXSCoordinatedAppInstall _eligibleToScheduleUpdate](self, "_eligibleToScheduleUpdate")) {
    return 0;
  }
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(+[IXSAppUpdateScheduler sharedInstance](&OBJC_CLASS___IXSAppUpdateScheduler, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall uniqueIdentifier](self, "uniqueIdentifier"));
  id v11 = 0LL;
  unsigned __int8 v6 = [v4 scheduleUpdateInstallForCoordinatorUUID:v5 error:&v11];
  id v7 = v11;

  if ((v6 & 1) != 0)
  {
    -[IXSCoordinatedAppInstall setUpdateScheduleState:](self, "setUpdateScheduleState:", 1LL);
    -[IXSCoordinatedAppInstall _onQueue_saveState](self, "_onQueue_saveState");
  }

  else
  {
    unint64_t v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
    unint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100080094();
    }
  }

  return v6;
}

- (void)_onQueue_checkState
{
  unint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  unint64_t v4 = -[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent");
  uint64_t v5 = -[IXSCoordinatedAppInstall state](self, "state");
  if (v5 > 23)
  {
    if (v5 == 24)
    {
      -[IXSCoordinatedAppInstall _onQueue_convertTerminationAssertionToAllowExtensionLaunch]( self,  "_onQueue_convertTerminationAssertionToAllowExtensionLaunch");
    }

    else if (v5 == 28)
    {
      if ((v4 & 0xFFFFFFFFFFFFFFFDLL) == 4)
      {
        unsigned __int8 v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall preparationPromise](self, "preparationPromise"));
        id v7 = v6;
        if (v6)
        {
          unint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v6 accessQueue]);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_10004134C;
          block[3] = &unk_1000CCE58;
          id v17 = v7;
          dispatch_sync(v8, block);
        }
      }

      if (-[IXSCoordinatedAppInstall needsPostProcessing](self, "needsPostProcessing")) {
        -[IXSCoordinatedAppInstall _onQueue_finishProgress](self, "_onQueue_finishProgress");
      }
      if ((v4 & 0xFFFFFFFFFFFFFFFELL) != 6) {
        -[IXSCoordinatedAppInstall _onQueue_cancelProgress](self, "_onQueue_cancelProgress");
      }
      -[IXSCoordinatedAppInstall setComplete:](self, "setComplete:", 1LL);
    }
  }

  else if (v5 == 6)
  {
    if (-[IXSCoordinatedAppInstall _onQueue_isPlaceholderUnnecessary](self, "_onQueue_isPlaceholderUnnecessary"))
    {
      -[IXSCoordinatedAppInstall setPlaceholderInstallState:](self, "setPlaceholderInstallState:", 4LL);
      -[IXSCoordinatedAppInstall _onQueue_checkState](self, "_onQueue_checkState");
      return;
    }

    if (v4 != 2) {
      goto LABEL_32;
    }
    unint64_t v10 = -[IXSCoordinatedAppInstall importance](self, "importance");
    if (v10 > 4 || ((1LL << v10) & 0x13) == 0) {
      goto LABEL_32;
    }
    id v11 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v19 = "-[IXSCoordinatedAppInstall _onQueue_checkState]";
      __int16 v20 = 2112;
      id v21 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_DEFAULT,  "%s: %@: Skipping placeholder install because this is a background updating coordinator.",  buf,  0x16u);
    }

    -[IXSCoordinatedAppInstall setPlaceholderInstallState:](self, "setPlaceholderInstallState:", 6LL);
    -[IXSCoordinatedAppInstall _onQueue_checkState](self, "_onQueue_checkState");
  }

  else if (v5 == 17)
  {
    if ((id)-[IXSCoordinatedAppInstall placeholderInstallState](self, "placeholderInstallState") == (id)6)
    {
      if ((id)-[IXSCoordinatedAppInstall updateScheduleState](self, "updateScheduleState") == (id)2
        || !-[IXSCoordinatedAppInstall _onQueue_scheduleUpdate](self, "_onQueue_scheduleUpdate"))
      {
        -[IXSCoordinatedAppInstall setPlaceholderInstallState:](self, "setPlaceholderInstallState:", 0LL);
LABEL_32:
        -[IXSCoordinatedAppInstall _onQueue_acquireAssertionAndInstallPlaceholder]( self,  "_onQueue_acquireAssertionAndInstallPlaceholder");
      }
    }

    else
    {
      id v13 = (id)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall preparationPromise](self, "preparationPromise"));
      if (v13)
      {
        unint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v13 accessQueue]);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        v14[2] = sub_100041358;
        v14[3] = &unk_1000CCE58;
        id v15 = v13;
        dispatch_sync(v9, v14);
      }

      -[IXSCoordinatedAppInstall _onQueue_finishProgress](self, "_onQueue_finishProgress");
      -[IXSCoordinatedAppInstall _onQueue_acquireAssertionAndDoInstall](self, "_onQueue_acquireAssertionAndDoInstall");
    }
  }

- (void)_runAsyncBlockWithDescription:(id)a3 onUninstallQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0LL;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000LL;
  id v17 = sub_10003E9E8;
  uint64_t v18 = sub_10003E9F8;
  id v19 = (id)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall outstandingInstallOperationsGroup](self, "outstandingInstallOperationsGroup"));
  dispatch_group_wait((dispatch_group_t)v15[5], 0xFFFFFFFFFFFFFFFFLL);
  dispatch_group_enter((dispatch_group_t)v15[5]);
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[IXSLimitedConcurrencyQueue uninstallConcurrencyQueue]( &OBJC_CLASS___IXSLimitedConcurrencyQueue,  "uninstallConcurrencyQueue"));
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_1000414B0;
  v11[3] = &unk_1000CE1E0;
  id v10 = v7;
  id v12 = v10;
  id v13 = &v14;
  [v8 runAsyncForIdentity:v9 description:v6 operation:v11];

  _Block_object_dispose(&v14, 8);
}

- (void)_runAsyncBlockWithDescription:(id)a3 onLaunchServicesQueue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unint64_t v8 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue( -[IXSCoordinatedAppInstall outstandingInstallOperationsGroup]( self,  "outstandingInstallOperationsGroup"));
  dispatch_group_enter(v8);

  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[IXSLimitedConcurrencyQueue launchServicesQueue]( &OBJC_CLASS___IXSLimitedConcurrencyQueue,  "launchServicesQueue"));
  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472LL;
  v12[2] = sub_1000415CC;
  v12[3] = &unk_1000CE208;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [v9 runAsyncForIdentity:v10 description:v7 operation:v12];
}

- (BOOL)_onQueue_acquireTerminationAssertionWithPredicate:(id)a3 description:(id)a4 terminationResistance:(unsigned __int8)a5 allowLaunchPredicate:(id)a6 error:(id *)a7
{
  uint64_t v8 = a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v15);

  id v16 = [[RBSTerminateContext alloc] initWithExplanation:v13];
  [v16 setMaximumTerminationResistance:v8];
  id v17 = objc_alloc(&OBJC_CLASS___RBSTerminationAssertion);
  if (v12) {
    uint64_t v18 = -[RBSTerminationAssertion initWithPredicate:context:allowLaunch:]( v17,  "initWithPredicate:context:allowLaunch:",  v14,  v16,  v12);
  }
  else {
    uint64_t v18 = -[RBSTerminationAssertion initWithPredicate:context:](v17, "initWithPredicate:context:", v14, v16);
  }
  id v19 = v18;

  if ((_DWORD)v8 == 50
    || (__int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity")),
        id v21 = (void *)objc_claimAutoreleasedReturnValue([v20 bundleID]),
        BOOL v22 = sub_100031BB0(v21, 1LL),
        v21,
        v20,
        !v22))
  {
    -[RBSTerminationAssertion addObserver:](v19, "addObserver:", self);
    -[IXSCoordinatedAppInstall setTermAssertion:](self, "setTermAssertion:", v19);
    id v31 = 0LL;
    unsigned __int8 v27 = -[RBSTerminationAssertion acquireWithError:](v19, "acquireWithError:", &v31);
    id v26 = v31;
    if ((v27 & 1) != 0)
    {
      BOOL v28 = 1;
      -[IXSCoordinatedAppInstall setExpectTermAssertionCallback:](self, "setExpectTermAssertionCallback:", 1LL);
      goto LABEL_14;
    }

    uint64_t v29 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_100080104();
    }
  }

  else
  {
    uint64_t v23 = (os_log_s *)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  PKPlugInKitErrorDomain,  14LL,  0LL));
    uint64_t v24 = RBSRequestErrorDomain;
    NSErrorUserInfoKey v32 = NSUnderlyingErrorKey;
    v33 = v23;
    v25 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  &v33,  &v32,  1LL));
    id v26 = (id)objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  v24,  5LL,  v25));
  }

  if (a7)
  {
    id v26 = v26;
    BOOL v28 = 0;
    *a7 = v26;
  }

  else
  {
    BOOL v28 = 0;
  }

- (void)_onQueue_convertTerminationAssertionToAllowExtensionLaunch
{
  unint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  -[IXSCoordinatedAppInstall setPostProcessingAssertionState:](self, "setPostProcessingAssertionState:", 1LL);
  unint64_t v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"installcoordinationd app:%@ post-processing phase",  v4));

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleID]);
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessPredicate predicateMatchingBundleIdentifier:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingBundleIdentifier:",  v7));

  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessPredicate predicateMatchingExtensionPoint:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingExtensionPoint:",  @"com.apple.background-asset-downloader-extension"));
  id v14 = 0LL;
  unsigned __int8 v10 = -[IXSCoordinatedAppInstall _onQueue_acquireTerminationAssertionWithPredicate:description:terminationResistance:allowLaunchPredicate:error:]( self,  "_onQueue_acquireTerminationAssertionWithPredicate:description:terminationResistance:allowLaunchPredicate:error:",  v8,  v5,  50LL,  v9,  &v14);
  id v11 = v14;
  if ((v10 & 1) == 0)
  {
    id v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      sub_100080170();
    }

    -[IXSCoordinatedAppInstall setTermAssertion:](self, "setTermAssertion:", 0LL);
  }
}

- (int64_t)_onQueue_assertionRetrySeconds
{
  if (-[IXSCoordinatedAppInstall assertionRetryCount](self, "assertionRetryCount") < 0xC) {
    return 5LL;
  }
  if (-[IXSCoordinatedAppInstall assertionRetryCount](self, "assertionRetryCount") < 0x20) {
    return 15LL;
  }
  if (-[IXSCoordinatedAppInstall assertionRetryCount](self, "assertionRetryCount") < 0x3E) {
    return 60LL;
  }
  if (-[IXSCoordinatedAppInstall assertionRetryCount](self, "assertionRetryCount") >= 0xFE) {
    return -1LL;
  }
  return 900LL;
}

- (void)_onQueue_runAssertionHandlerForPlaceholder:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  -[IXSCoordinatedAppInstall setAssertionRetryCount:](self, "setAssertionRetryCount:", 0LL);
  -[IXSCoordinatedAppInstall setFirstAppExtensionBusyTime:](self, "setFirstAppExtensionBusyTime:", 0LL);
  -[IXSCoordinatedAppInstall _onQueue_saveState](self, "_onQueue_saveState");
  if (v3) {
    -[IXSCoordinatedAppInstall _onQueue_installPlaceholder](self, "_onQueue_installPlaceholder");
  }
  else {
    -[IXSCoordinatedAppInstall _onQueue_doInstall](self, "_onQueue_doInstall");
  }
}

- (void)_onQueue_handleAssertionAcquisitionFailureForPlaceholder:(BOOL)a3 withError:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v7);

  if ((id)-[IXSCoordinatedAppInstall importance](self, "importance") == (id)3)
  {
    -[IXSCoordinatedAppInstall setTermAssertion:](self, "setTermAssertion:", 0LL);
    uint64_t v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
    unint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000801E4();
    }

    id v11 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall _onQueue_handleAssertionAcquisitionFailureForPlaceholder:withError:]",  1631LL,  @"IXErrorDomain",  0x13uLL,  v6,  0LL,  @"Cancelling %@ because we failed to acquire a termination assertion even after retrying",  v10,  (uint64_t)self);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[IXSCoordinatedAppInstall _onQueue_internal_cancelForReason:client:]( self,  "_onQueue_internal_cancelForReason:client:",  v12,  15LL);
    goto LABEL_36;
  }

  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleID]);
  BOOL v15 = 1;
  BOOL v16 = sub_100031BB0(v14, 1LL);

  if (v16) {
    int v17 = 20;
  }
  else {
    int v17 = 900;
  }
  uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v6 userInfo]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue([v18 objectForKeyedSubscript:NSUnderlyingErrorKey]);

  id v19 = (void *)objc_claimAutoreleasedReturnValue([v6 domain]);
  if (!v12) {
    goto LABEL_22;
  }
  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue([v12 domain]);
  if (([v20 isEqualToString:PKPlugInKitErrorDomain] & 1) == 0)
  {

LABEL_22:
    -[IXSCoordinatedAppInstall setFirstAppExtensionBusyTime:](self, "setFirstAppExtensionBusyTime:", 0LL);
    goto LABEL_23;
  }

  id v21 = [v12 code];

  char v22 = v21 != (id)14 || v15;
  if ((v22 & 1) != 0) {
    goto LABEL_22;
  }
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall firstAppExtensionBusyTime](self, "firstAppExtensionBusyTime"));

  if (v23)
  {
    uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall firstAppExtensionBusyTime](self, "firstAppExtensionBusyTime"));
    [v24 timeIntervalSinceNow];
    double v26 = v25;

    if (v26 <= -(double)v17)
    {
      unsigned __int8 v27 = sub_1000047B4((uint64_t)off_1000E8CA0);
      BOOL v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        __int128 v60 = "-[IXSCoordinatedAppInstall _onQueue_handleAssertionAcquisitionFailureForPlaceholder:withError:]";
        __int16 v61 = 2112;
        __int128 v62 = self;
        __int16 v63 = 2048;
        *(void *)id v64 = fabs(v26);
        _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to get termination assertion for %@ because an app extension was busy for %f seconds; skipping assertion",
          buf,
          0x20u);
      }

      -[IXSCoordinatedAppInstall _onQueue_runAssertionHandlerForPlaceholder:]( self,  "_onQueue_runAssertionHandlerForPlaceholder:",  v4);
      goto LABEL_36;
    }
  }

  else
  {
    uint64_t v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](&OBJC_CLASS___NSDate, "date"));
    -[IXSCoordinatedAppInstall setFirstAppExtensionBusyTime:](self, "setFirstAppExtensionBusyTime:", v48);

    v49 = sub_1000047B4((uint64_t)off_1000E8CA0);
    v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      __int128 v60 = "-[IXSCoordinatedAppInstall _onQueue_handleAssertionAcquisitionFailureForPlaceholder:withError:]";
      __int16 v61 = 2112;
      __int128 v62 = self;
      __int16 v63 = 1024;
      *(_DWORD *)id v64 = v17;
      *(_WORD *)&void v64[4] = 2112;
      *(void *)&v64[6] = v6;
      _os_log_error_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_ERROR,  "%s: Failed to get termination assertion for %@ because an app extension was busy; will continue with installatio"
        "n anyway if this happens for over %d seconds : %@",
        buf,
        0x26u);
    }

    int v51 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
    id v52 = (void *)objc_claimAutoreleasedReturnValue([v51 description]);
    sub_10001212C( @"IXErrorDomain",  @"TerminationAssertionError",  @"TerminationAssertionErrorPluginBusyTimeout",  v52);
  }

- (void)_onQueue_acquireAssertionForPlaceholder:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  if (v3) {
    id v6 = @"-for-placeholder";
  }
  else {
    id v6 = &stru_1000D08C0;
  }
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue([v7 uniqueIdentifier]);
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"com.apple.InstallCoordination.acquire-assertion%@.%@",  v6,  v8));

  id v10 = v9;
  id v11 = (void *)os_transaction_create([v10 UTF8String]);
  id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall assertionRetryTimer](self, "assertionRetryTimer"));

  if (v12)
  {
    id v13 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall assertionRetryTimer](self, "assertionRetryTimer"));
    dispatch_source_cancel(v13);

    -[IXSCoordinatedAppInstall setAssertionRetryTimer:](self, "setAssertionRetryTimer:", 0LL);
  }

  if (v3) {
    -[IXSCoordinatedAppInstall setPlaceholderInstallState:](self, "setPlaceholderInstallState:", 1LL);
  }
  else {
    -[IXSCoordinatedAppInstall setAppInstallState:](self, "setAppInstallState:", 1LL);
  }
  id v14 = (void *)objc_claimAutoreleasedReturnValue( -[IXSCoordinatedAppInstall _onQueue_fetchInstallOptionsWithError:]( self,  "_onQueue_fetchInstallOptionsWithError:",  0LL));
  BOOL v15 = v14;
  if (v14 && ([v14 isDeveloperInstall] & 1) != 0)
  {
    uint64_t v16 = 50LL;
  }

  else if ((id)-[IXSCoordinatedAppInstall importance](self, "importance") == (id)3)
  {
    uint64_t v16 = 50LL;
  }

  else
  {
    uint64_t v16 = 30LL;
  }

  int v17 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
  uint64_t v18 = objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall uniqueIdentifier](self, "uniqueIdentifier"));
  id v19 = (void *)v18;
  uint64_t v20 = 78LL;
  if (v3) {
    uint64_t v20 = 89LL;
  }
  id v21 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"installcoordinationd app:%@ uuid:%@ isPlaceholder:%c",  v17,  v18,  v20));

  uint64_t v22 = objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([(id)v22 bundleID]);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue( +[RBSProcessPredicate predicateMatchingBundleIdentifier:]( &OBJC_CLASS___RBSProcessPredicate,  "predicateMatchingBundleIdentifier:",  v23));

  id v32 = 0LL;
  LOBYTE(v22) = -[IXSCoordinatedAppInstall _onQueue_acquireTerminationAssertionWithPredicate:description:terminationResistance:allowLaunchPredicate:error:]( self,  "_onQueue_acquireTerminationAssertionWithPredicate:description:terminationResistance:allowLaunchPredicate:error:",  v24,  v21,  v16,  0LL,  &v32);
  id v25 = v32;
  if ((v22 & 1) == 0)
  {
    double v26 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472LL;
    v27[2] = sub_10004258C;
    v27[3] = &unk_1000CE258;
    id v28 = v11;
    int64_t v29 = self;
    BOOL v31 = v3;
    id v30 = v25;
    sub_10005A8F0(v26, v27);
  }
}

- (BOOL)_limitedConcurrency_doRetryingInstallOperationForPlaceholder:(BOOL)a3 installTargetURL:(id)a4 retries:(unint64_t)a5 error:(id *)a6 installAttemptBlock:(id)a7
{
  v56 = a6;
  BOOL v9 = a3;
  id v11 = a4;
  id v12 = a7;
  int v58 = v9;
  if (v9) {
    id v13 = 0LL;
  }
  else {
    id v13 = (void *)objc_claimAutoreleasedReturnValue( -[IXSCoordinatedAppInstall _limitedConcurrency_fetchInstallingProgress]( self,  "_limitedConcurrency_fetchInstallingProgress"));
  }
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472LL;
  v68[2] = sub_100042DC0;
  v68[3] = &unk_1000CE280;
  BOOL v71 = v9;
  id v57 = v13;
  id v69 = v57;
  id v70 = self;
  v59 = self;
  __int16 v61 = objc_retainBlock(v68);
  unint64_t v14 = 0LL;
  __int128 v60 = v12;
  while (1)
  {
    id v67 = 0LL;
    int v15 = (*((uint64_t (**)(id, void *, id, id *))v12 + 2))(v12, v61, v11, &v67);
    id v16 = v67;
    if (v15)
    {
      int v17 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](v59, "identity"));
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 bundleID]);
      BOOL v19 = sub_100031BB0(v18, 6LL);

      if (!v19 || v14)
      {
        double v26 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](v59, "identity", v56));
        unsigned __int8 v27 = (void *)objc_claimAutoreleasedReturnValue([v26 bundleID]);
        BOOL v28 = sub_100031BB0(v27, 7LL);

        if (!v28)
        {
          id v36 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](v59, "identity"));
          id v37 = (void *)objc_claimAutoreleasedReturnValue([v36 bundleID]);
          id v66 = 0LL;
          BOOL v38 = sub_100031830(v37, 12LL, &v66);
          id v25 = v66;

          if (!v38)
          {
            LOBYTE(v42) = 1;
            goto LABEL_40;
          }

          if (v25
            && (v39 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:@"TEST_MODE_DATA_SIMULATE_REBOOT"]),
                v39,
                v39))
          {
            dispatch_time_t v40 = (void *)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:@"TEST_MODE_DATA_SIMULATE_REBOOT"]);
            unsigned int v41 = [v40 isEqualToString:@"TEST_MODE_DATA_REMOVE_PLACEHOLDER"];

            BOOL v42 = 1;
            if (v41 != v58) {
              goto LABEL_40;
            }
          }

          else
          {
            if (v58)
            {

              LOBYTE(v42) = 1;
              uint64_t v48 = v57;
              goto LABEL_52;
            }

            BOOL v42 = 0;
          }

          v43 = (void *)objc_claimAutoreleasedReturnValue(+[IXFileManager defaultManager](&OBJC_CLASS___IXFileManager, "defaultManager"));
          id v65 = v16;
          unsigned __int8 v44 = [v43 removeItemAtURL:v11 error:&v65];
          id v45 = v65;

          if ((v44 & 1) == 0)
          {
            v53 = sub_1000047B4((uint64_t)off_1000E8CA0);
            id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
              sub_1000802CC();
            }
            LOBYTE(v42) = 1;
            id v16 = v45;
            goto LABEL_44;
          }

          if (v42)
          {
            id v54 = sub_1000047B4((uint64_t)off_1000E8CA0);
            id v55 = (os_log_s *)objc_claimAutoreleasedReturnValue(v54);
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              __int128 v73 = "-[IXSCoordinatedAppInstall _limitedConcurrency_doRetryingInstallOperationForPlaceholder:installTarge"
                    "tURL:retries:error:installAttemptBlock:]";
              _os_log_impl( (void *)&_mh_execute_header,  v55,  OS_LOG_TYPE_DEFAULT,  "%s: Exiting for testing (TEST_MODE_DATA_SIMULATE_REBOOT)...",  buf,  0xCu);
            }

            exit(1);
          }

          uint64_t v20 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  4097LL,  0LL));

          id v46 = sub_1000047B4((uint64_t)off_1000E8CA0);
          uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v46);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            __int128 v73 = "-[IXSCoordinatedAppInstall _limitedConcurrency_doRetryingInstallOperationForPlaceholder:installTargetU"
                  "RL:retries:error:installAttemptBlock:]";
            __int16 v74 = 2112;
            uint64_t v75 = v20;
            __int16 v76 = 2048;
            *(void *)uint64_t v77 = v14;
            *(_WORD *)&v77[8] = 2048;
            *(void *)&v77[10] = a5;
            _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%s: For testing, faking install SPI returning error %@ even after consuming the asset (retry count %lu/%lu)",  buf,  0x2Au);
          }

          goto LABEL_16;
        }

        uint64_t v20 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  4097LL,  0LL));

        int64_t v29 = sub_1000047B4((uint64_t)off_1000E8CA0);
        uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          __int128 v73 = "-[IXSCoordinatedAppInstall _limitedConcurrency_doRetryingInstallOperationForPlaceholder:installTargetURL"
                ":retries:error:installAttemptBlock:]";
          __int16 v74 = 2112;
          uint64_t v75 = v20;
          __int16 v76 = 2048;
          *(void *)uint64_t v77 = v14;
          *(_WORD *)&v77[8] = 2048;
          *(void *)&v77[10] = a5;
          uint64_t v23 = v22;
          uint64_t v24 = "%s: For testing, always faking install SPI returning error %@ (retry count %lu/%lu)";
          goto LABEL_14;
        }
      }

      else
      {
        uint64_t v20 = objc_claimAutoreleasedReturnValue( +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  NSCocoaErrorDomain,  4097LL,  0LL));

        id v21 = sub_1000047B4((uint64_t)off_1000E8CA0);
        uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          __int128 v73 = "-[IXSCoordinatedAppInstall _limitedConcurrency_doRetryingInstallOperationForPlaceholder:installTargetURL"
                ":retries:error:installAttemptBlock:]";
          __int16 v74 = 2112;
          uint64_t v75 = v20;
          __int16 v76 = 2048;
          *(void *)uint64_t v77 = 0LL;
          *(_WORD *)&v77[8] = 2048;
          *(void *)&v77[10] = a5;
          uint64_t v23 = v22;
          uint64_t v24 = "%s: For testing, faking install SPI returning error %@ (retry count %lu/%lu)";
LABEL_14:
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 0x2Au);
        }
      }

      id v25 = 0LL;
LABEL_16:

      id v16 = (id)v20;
      id v12 = v60;
      goto LABEL_17;
    }

    id v25 = 0LL;
LABEL_17:
    id v30 = (os_log_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "domain", v56));
    if (!-[os_log_s isEqualToString:](v30, "isEqualToString:", NSCocoaErrorDomain)
      || [v16 code] != (id)4097)
    {
      break;
    }

- (id)_limitedConcurrency_installApplication:(id)a3 isPlaceholder:(BOOL)a4 options:(id)a5 retries:(unint64_t)a6 error:(id *)a7
{
  BOOL v9 = a4;
  id v31 = a3;
  id v11 = a5;
  uint64_t v41 = 0LL;
  BOOL v42 = &v41;
  uint64_t v43 = 0x3032000000LL;
  unsigned __int8 v44 = sub_10003E9E8;
  id v45 = sub_10003E9F8;
  id v46 = 0LL;
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472LL;
  v40[2] = sub_1000432A0;
  v40[3] = &unk_1000CCE58;
  v40[4] = self;
  id v13 = objc_retainBlock(v40);
  id v39 = 0LL;
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472LL;
  v33[2] = sub_100043350;
  v33[3] = &unk_1000CE2A8;
  BOOL v38 = v9;
  v33[4] = self;
  id v14 = v12;
  id v34 = v14;
  id v15 = v11;
  id v35 = v15;
  id v16 = v13;
  id v36 = v16;
  id v37 = &v41;
  LODWORD(a5) = -[IXSCoordinatedAppInstall _limitedConcurrency_doRetryingInstallOperationForPlaceholder:installTargetURL:retries:error:installAttemptBlock:]( self,  "_limitedConcurrency_doRetryingInstallOperationForPlaceholder:installTargetURL:retries:error:installAttemptBlock:",  v9,  v31,  a6,  &v39,  v33);
  id v17 = v39;
  if ((_DWORD)a5)
  {
    id v18 = (id)v42[5];
  }

  else
  {
    id v19 = objc_alloc_init(&OBJC_CLASS___LSOperationRequestContext);
    uint64_t v20 = +[NSNumber numberWithUnsignedInt:](&OBJC_CLASS___NSNumber, "numberWithUnsignedInt:", geteuid());
    uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
    [v19 setTargetUserID:v21];

    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v22 bundleID]);
    id v32 = 0LL;
    LOBYTE(v21) = [v14 sendNotificationOfType:3 forApplicationWithBundleIdentifier:v23 requestContext:v19 error:&v32];
    id v24 = v32;

    if ((v21 & 1) == 0)
    {
      id v25 = sub_1000047B4((uint64_t)off_1000E8CA0);
      double v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        BOOL v28 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
        int64_t v29 = (void *)objc_claimAutoreleasedReturnValue([v28 bundleID]);
        *(_DWORD *)buf = 136315650;
        uint64_t v48 = "-[IXSCoordinatedAppInstall _limitedConcurrency_installApplication:isPlaceholder:options:retries:error:]";
        __int16 v49 = 2112;
        v50 = v29;
        __int16 v51 = 2112;
        id v52 = v24;
        _os_log_error_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_ERROR,  "%s: Failed to send LSApplicationNotificationTypeInstallDidFail notification for %@ : %@",  buf,  0x20u);
      }

      id v24 = 0LL;
    }

    if (a7) {
      *a7 = v17;
    }

    id v18 = 0LL;
  }

  _Block_object_dispose(&v41, 8);
  return v18;
}

- (void)_finishPlaceholderInstallAtURL:(id)a3 result:(BOOL)a4 recordPromise:(id)a5 error:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
  id v14 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleID]);
  BOOL v15 = sub_100031BB0(v14, 3LL);

  if (v15)
  {
    uint64_t v43 = sub_1000047B4((uint64_t)off_1000E8CA0);
    unsigned __int8 v44 = (os_log_s *)objc_claimAutoreleasedReturnValue(v43);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v57 = "-[IXSCoordinatedAppInstall _finishPlaceholderInstallAtURL:result:recordPromise:error:]";
      _os_log_impl( (void *)&_mh_execute_header,  v44,  OS_LOG_TYPE_DEFAULT,  "%s: Exiting because testing client requested termination after placeholder install.",  buf,  0xCu);
    }

    exit(1);
  }

  if ((id)-[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent") == (id)6 && v8)
  {
    id v45 = v12;
    id v46 = v11;
    id v47 = v10;
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
    v65[0] = @"CACHE_DELETE_PURGE_APP_CACHES";
    id v17 = (void *)objc_claimAutoreleasedReturnValue([v16 bundleID]);
    BOOL v64 = v17;
    id v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](&OBJC_CLASS___NSArray, "arrayWithObjects:count:", &v64, 1LL));
    v65[1] = @"CACHE_DELETE_VOLUME";
    v66[0] = v18;
    id v19 = (void *)objc_claimAutoreleasedReturnValue(+[IXGlobalConfiguration sharedInstance](&OBJC_CLASS___IXGlobalConfiguration, "sharedInstance"));
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 userVolumeURL]);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue([v20 path]);
    v66[1] = v21;
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue( +[NSDictionary dictionaryWithObjects:forKeys:count:]( &OBJC_CLASS___NSDictionary,  "dictionaryWithObjects:forKeys:count:",  v66,  v65,  2LL));

    dispatch_semaphore_t v23 = dispatch_semaphore_create(0LL);
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472LL;
    v53[2] = sub_100043C34;
    v53[3] = &unk_1000CE2D0;
    id v24 = v16;
    id v54 = v24;
    id v25 = v23;
    id v55 = v25;
    double v26 = (const void *)CacheDeletePurgeSpaceWithInfo(v22, v53);
    dispatch_time_t v27 = dispatch_time(0LL, 15000000000LL);
    if (dispatch_semaphore_wait(v25, v27))
    {
      BOOL v28 = sub_1000047B4((uint64_t)off_1000E8CA0);
      int64_t v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
        sub_100080530((uint64_t)v24, v29, v30);
      }
    }

    if (v26) {
      CFRelease(v26);
    }

    id v11 = v46;
    id v10 = v47;
    id v12 = v45;
  }

  id v31 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472LL;
  v52[2] = sub_100043D50;
  v52[3] = &unk_1000CCE58;
  v52[4] = self;
  sub_10005A8F0(v31, v52);

  if (v8)
  {
    id v32 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
    v48[0] = _NSConcreteStackBlock;
    v48[1] = 3221225472LL;
    v48[2] = sub_100043D68;
    v48[3] = &unk_1000CCCB8;
    v48[4] = self;
    unsigned int v33 = &v49;
    id v49 = v11;
    id v34 = v48;
  }

  else
  {
    if (!v12)
    {
      id v35 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        sub_1000804A4(self, v36);
      }

      id v37 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
      id v39 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall _finishPlaceholderInstallAtURL:result:recordPromise:error:]",  2062LL,  @"IXErrorDomain",  0xEuLL,  0LL,  0LL,  @"Placeholder installation failed but we received a nil error object when installing %@",  v38,  (uint64_t)v37);
      id v12 = (id)objc_claimAutoreleasedReturnValue(v39);
    }

    dispatch_time_t v40 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      BOOL v42 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);
      *(_DWORD *)buf = 136315906;
      id v57 = "-[IXSCoordinatedAppInstall _finishPlaceholderInstallAtURL:result:recordPromise:error:]";
      __int16 v58 = 2112;
      v59 = self;
      __int16 v60 = 2112;
      __int16 v61 = v42;
      __int16 v62 = 2112;
      id v63 = v12;
      _os_log_error_impl( (void *)&_mh_execute_header,  v41,  OS_LOG_TYPE_ERROR,  "%s: %@: Failed to install placeholder at path %@ : %@",  buf,  0x2Au);
    }

    id v32 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472LL;
    v50[2] = sub_100043D5C;
    v50[3] = &unk_1000CCCB8;
    v50[4] = self;
    unsigned int v33 = &v51;
    id v12 = v12;
    id v51 = v12;
    id v34 = v50;
  }

  sub_10005A8F0(v32, v34);
}

- (id)_onQueue_fetchMetadataFromInstalledAppForOffloadWithError:(id *)a3
{
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
  id v7 = objc_alloc(&OBJC_CLASS___LSApplicationRecord);
  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleID]);
  id v42 = 0LL;
  BOOL v9 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]( v7,  "initWithBundleIdentifier:allowPlaceholder:error:",  v8,  1LL,  &v42);
  id v10 = v42;

  if (!v9)
  {
    id v16 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100080634();
    }

    id v19 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall _onQueue_fetchMetadataFromInstalledAppForOffloadWithError:]",  2163LL,  @"IXErrorDomain",  1uLL,  v10,  0LL,  @"No LSApplicationRecord found for %@ during demotion",  v18,  (uint64_t)v6);
    goto LABEL_18;
  }

  if (-[LSApplicationRecord isPlaceholder](v9, "isPlaceholder"))
  {
    id v11 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000806A8();
    }

    uint64_t v40 = (uint64_t)v6;
    id v14 = @"Cannot demote app with identity %@ because it is a placeholder";
    uint64_t v15 = 2168LL;
LABEL_17:
    id v19 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall _onQueue_fetchMetadataFromInstalledAppForOffloadWithError:]",  v15,  @"IXErrorDomain",  4uLL,  0LL,  0LL,  v14,  v13,  v40);
LABEL_18:
    id v24 = (id)objc_claimAutoreleasedReturnValue(v19);
    uint64_t v22 = 0LL;
    uint64_t v21 = 0LL;
    goto LABEL_19;
  }

  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord bundleContainerURL](v9, "bundleContainerURL"));
  if (!v20)
  {
    id v31 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v32 = (os_log_s *)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      sub_100080718();
    }

    uint64_t v40 = (uint64_t)v6;
    id v14 = @"LSApplicationRecord for %@ did not contain a bundleContainerURL during demotion";
    uint64_t v15 = 2174LL;
    goto LABEL_17;
  }

  uint64_t v21 = v20;
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([v20 URLByAppendingPathComponent:@"iTunesMetadata.plist" isDirectory:0]);
  id v41 = v10;
  dispatch_semaphore_t v23 = (void *)objc_claimAutoreleasedReturnValue( +[MIStoreMetadata metadataFromPlistAtURL:error:]( &OBJC_CLASS___MIStoreMetadata,  "metadataFromPlistAtURL:error:",  v22,  &v41));
  id v24 = v41;

  if (v23) {
    goto LABEL_22;
  }
  id v25 = (void *)objc_claimAutoreleasedReturnValue([v24 userInfo]);
  id v10 = (id)objc_claimAutoreleasedReturnValue([v25 objectForKeyedSubscript:NSUnderlyingErrorKey]);

  double v26 = (void *)objc_claimAutoreleasedReturnValue([v10 domain]);
  if (![v26 isEqualToString:NSCocoaErrorDomain])
  {

    goto LABEL_24;
  }

  id v27 = [v10 code];

  if (v27 != (id)260)
  {
LABEL_24:
    id v34 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v35 = (os_log_s *)objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      id v39 = (void *)objc_claimAutoreleasedReturnValue([v22 path]);
      *(_DWORD *)buf = 136315906;
      unsigned __int8 v44 = "-[IXSCoordinatedAppInstall _onQueue_fetchMetadataFromInstalledAppForOffloadWithError:]";
      __int16 v45 = 2112;
      id v46 = v39;
      __int16 v47 = 2112;
      uint64_t v48 = v6;
      __int16 v49 = 2112;
      id v50 = v24;
      _os_log_error_impl( (void *)&_mh_execute_header,  v35,  OS_LOG_TYPE_ERROR,  "%s: Failed to read iTunesMetadata.plist from %@ when demoting %@ : %@",  buf,  0x2Au);
    }

    id v36 = (void *)objc_claimAutoreleasedReturnValue([v22 path]);
    id v38 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall _onQueue_fetchMetadataFromInstalledAppForOffloadWithError:]",  2186LL,  @"IXErrorDomain",  1uLL,  v24,  0LL,  @"Failed to read iTunesMetadata.plist from %@ when demoting %@",  v37,  (uint64_t)v36);
    uint64_t v30 = objc_claimAutoreleasedReturnValue(v38);

    goto LABEL_27;
  }

  id v29 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall _onQueue_fetchMetadataFromInstalledAppForOffloadWithError:]",  2184LL,  @"IXErrorDomain",  0x17uLL,  0LL,  0LL,  @"No metadata found for app %@",  v28,  (uint64_t)v6);
  uint64_t v30 = objc_claimAutoreleasedReturnValue(v29);
LABEL_27:

  id v24 = (id)v30;
LABEL_19:

  if (a3)
  {
    id v24 = v24;
    dispatch_semaphore_t v23 = 0LL;
    *a3 = v24;
  }

  else
  {
    dispatch_semaphore_t v23 = 0LL;
  }

- (void)_onQueue_installPlaceholder
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  BOOL v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall placeholderPromise](self, "placeholderPromise"));
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall error](self, "error"));

  if (v5)
  {
    id v6 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[IXSCoordinatedAppInstall _onQueue_installPlaceholder]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: %@: Ignoring placeholder install because coordinator canceled while waiting for assertion",  buf,  0x16u);
    }

    goto LABEL_63;
  }

  BOOL v8 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall assertionRetryTimer](self, "assertionRetryTimer"));

  if (v8)
  {
    BOOL v9 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall assertionRetryTimer](self, "assertionRetryTimer"));
    dispatch_source_cancel(v9);

    -[IXSCoordinatedAppInstall setAssertionRetryTimer:](self, "setAssertionRetryTimer:", 0LL);
  }

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall termAssertion](self, "termAssertion"));

  BOOL v11 = v10 == 0LL;
  id v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v14)
    {
      id v16 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[IXSCoordinatedAppInstall _onQueue_installPlaceholder]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v16;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s: No termination assertion acquired for placeholder %@; proceeding with install.",
        buf,
        0x16u);
    }
  }

  else if (v14)
  {
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[IXSCoordinatedAppInstall _onQueue_installPlaceholder]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v15;
    _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s: Acquired termination assertion for placeholder %@; proceeding with install.",
      buf,
      0x16u);
  }

  unint64_t v17 = -[IXSCoordinatedAppInstall newRemovability](self, "newRemovability");
  if (v17)
  {
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue( +[IXSAppRemovabilityManager sharedInstance]( &OBJC_CLASS___IXSAppRemovabilityManager,  "sharedInstance"));
    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v18 removabilityMetadataForAppWithIdentity:v19]);

    -[IXSCoordinatedAppInstall setSavedRemovability:](self, "setSavedRemovability:", [v20 removability]);
    -[IXSCoordinatedAppInstall setSavedRemovabilityClient:]( self,  "setSavedRemovabilityClient:",  [v20 client]);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue( +[IXSAppRemovabilityManager sharedInstance]( &OBJC_CLASS___IXSAppRemovabilityManager,  "sharedInstance"));
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
    id v107 = 0LL;
    unsigned __int8 v23 = objc_msgSend( v21,  "setRemovability:forAppWithIdentity:byClient:error:",  v17,  v22,  -[IXSCoordinatedAppInstall newRemovabilityClient](self, "newRemovabilityClient"),  &v107);
    id v24 = v107;

    if ((v23 & 1) == 0)
    {
      uint64_t v30 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        id v32 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
        unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue([v32 bundleID]);
        id v34 = IXStringForAppRemovability(v17);
        id v35 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue(v34);
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "-[IXSCoordinatedAppInstall _onQueue_installPlaceholder]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v33;
        *(_WORD *)&buf[22] = 2112;
        v113 = v35;
        LOWORD(v114) = 2112;
        *(void *)((char *)&v114 + 2) = v24;
        _os_log_impl( (void *)&_mh_execute_header,  v31,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to set removability for %@ to %@ with error: %@",  buf,  0x2Au);
      }

      -[IXSCoordinatedAppInstall _onQueue_internal_cancelForReason:client:]( self,  "_onQueue_internal_cancelForReason:client:",  v24,  15LL);
      goto LABEL_63;
    }
  }

  if (v4)
  {
    uint64_t v103 = 0LL;
    v104 = &v103;
    uint64_t v105 = 0x2020000000LL;
    char v106 = 0;
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000LL;
    v113 = sub_10003E9E8;
    *(void *)&__int128 v114 = sub_10003E9F8;
    *((void *)&v114 + 1) = 0LL;
    uint64_t v99 = 0LL;
    v100 = &v99;
    uint64_t v101 = 0x2020000000LL;
    uint64_t v102 = 0LL;
    uint64_t v93 = 0LL;
    v94 = &v93;
    uint64_t v95 = 0x3032000000LL;
    v96 = sub_10003E9E8;
    v97 = sub_10003E9F8;
    id v98 = 0LL;
    uint64_t v87 = 0LL;
    v88 = &v87;
    uint64_t v89 = 0x3032000000LL;
    v90 = sub_10003E9E8;
    v91 = sub_10003E9F8;
    id v92 = 0LL;
    id v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 accessQueue]);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100045004;
    block[3] = &unk_1000CE2F8;
    v82 = &v103;
    id v81 = v4;
    uint64_t v83 = buf;
    char v84 = &v93;
    v85 = &v99;
    v86 = &v87;
    dispatch_sync(v25, block);

    if (!*((_BYTE *)v104 + 24))
    {
      id v41 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        sub_1000807F8();
      }

      id v44 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall _onQueue_installPlaceholder]",  2259LL,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  @"Placeholder promise was not complete when we went to install it for %@",  v43,  (uint64_t)self);
      id v26 = (id)objc_claimAutoreleasedReturnValue(v44);
      -[IXSCoordinatedAppInstall _onQueue_internal_cancelForReason:client:]( self,  "_onQueue_internal_cancelForReason:client:",  v26,  15LL);
      goto LABEL_62;
    }

    if (!*(void *)(*(void *)&buf[8] + 40LL))
    {
      __int16 v45 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v46 = (os_log_s *)objc_claimAutoreleasedReturnValue(v45);
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        sub_100080868();
      }

      id v48 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall _onQueue_installPlaceholder]",  2265LL,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  @"Placeholder promise was nil when we went to install it for %@",  v47,  (uint64_t)self);
      __int16 v49 = (void *)objc_claimAutoreleasedReturnValue(v48);
      id v50 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
      v78[0] = _NSConcreteStackBlock;
      v78[1] = 3221225472LL;
      v78[2] = sub_1000450A4;
      v78[3] = &unk_1000CCCB8;
      v78[4] = self;
      id v26 = v49;
      id v79 = v26;
      sub_10005A8F0(v50, v78);

      goto LABEL_62;
    }

    id v26 = objc_alloc_init(&OBJC_CLASS___MIInstallOptions);
    id v77 = 0LL;
    id v27 = (void *)objc_claimAutoreleasedReturnValue( -[IXSCoordinatedAppInstall _onQueue_fetchInstallOptionsWithError:]( self,  "_onQueue_fetchInstallOptionsWithError:",  &v77));
    id v28 = v77;
    BOOL v71 = v28;
    if (v27)
    {
      id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue([v27 linkedParentBundleID]);
      [v26 setLinkedParentBundleID:v29];
    }

    else
    {
      id v65 = v28;
      id v66 = (void *)objc_claimAutoreleasedReturnValue([v28 domain]);
      if ([v66 isEqualToString:@"IXErrorDomain"])
      {
        BOOL v67 = [v65 code] == (id)23;

        if (v67)
        {
LABEL_21:
          if ((id)-[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent") == (id)6)
          {
            [v26 setInstallTargetType:3];
            if (v27) {
              objc_msgSend(v26, "setWaitForDeletion:", objc_msgSend(v27, "waitForDeletion"));
            }
          }

          else
          {
            [v26 setInstallTargetType:2];
          }

          [v26 setUserInitiated:1];
          [v26 setLsInstallType:v100[3]];
          [v26 setSinfData:v88[5]];
          if ((id)-[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent") != (id)6)
          {
            [v26 setITunesMetadata:v94[5]];
LABEL_42:
            [v26 setPerformAPFSClone:1];
            id v54 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
            id v55 = (void *)objc_claimAutoreleasedReturnValue([v54 bundleID]);
            [v26 setBundleIdentifier:v55];

            v56 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
            id v57 = (void *)objc_claimAutoreleasedReturnValue([v56 personaUniqueString]);
            [v26 setPersonaUniqueString:v57];

            unint64_t v58 = -[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent");
            if (v58 - 1 >= 6) {
              unint64_t v59 = 0LL;
            }
            else {
              unint64_t v59 = v58;
            }
            [v26 setInstallIntent:v59];
            -[IXSCoordinatedAppInstall setPlaceholderInstallState:](self, "setPlaceholderInstallState:", 3LL);
            id v53 = (id)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall _createPowerAssertion](self, "_createPowerAssertion"));
            if ((id)-[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent") == (id)7)
            {
              __int16 v60 = sub_1000047B4((uint64_t)off_1000E8CA0);
              __int16 v61 = (os_log_s *)objc_claimAutoreleasedReturnValue(v60);
              if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR)) {
                sub_1000808D8();
              }

              id v63 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall _onQueue_installPlaceholder]",  2369LL,  @"IXErrorDomain",  0x1EuLL,  0LL,  0LL,  @"Canceling placeholder installation for %@ because IXGizmoInstallingAppInstallCoordinator is not supported on this device.",  v62,  (uint64_t)self);
              BOOL v64 = (void *)objc_claimAutoreleasedReturnValue(v63);
              -[IXSCoordinatedAppInstall _onQueue_internal_cancelForReason:client:]( self,  "_onQueue_internal_cancelForReason:client:",  v64,  15LL);
              [v53 invalidate];
            }

            else
            {
              v72[0] = _NSConcreteStackBlock;
              v72[1] = 3221225472LL;
              v72[2] = sub_1000450B4;
              v72[3] = &unk_1000CE320;
              v72[4] = self;
              uint64_t v75 = buf;
              id v73 = v26;
              id v53 = v53;
              id v74 = v53;
              -[IXSCoordinatedAppInstall _runAsyncBlockWithDescription:onLaunchServicesQueue:]( self,  "_runAsyncBlockWithDescription:onLaunchServicesQueue:",  @"Placeholder install",  v72);
            }

            goto LABEL_61;
          }

          id v76 = 0LL;
          id v51 = (void *)objc_claimAutoreleasedReturnValue( -[IXSCoordinatedAppInstall _onQueue_fetchMetadataFromInstalledAppForOffloadWithError:]( self,  "_onQueue_fetchMetadataFromInstalledAppForOffloadWithError:",  &v76));
          id v52 = v76;
          id v53 = v52;
          if (v51)
          {
            [v26 setITunesMetadata:v51];
LABEL_40:

            goto LABEL_42;
          }

          id v69 = (void *)objc_claimAutoreleasedReturnValue([v52 domain]);
          if ([v69 isEqualToString:@"IXErrorDomain"])
          {
            BOOL v70 = [v53 code] == (id)23;

            if (v70) {
              goto LABEL_40;
            }
          }

          else
          {
          }

          -[IXSCoordinatedAppInstall _onQueue_internal_cancelForReason:client:]( self,  "_onQueue_internal_cancelForReason:client:",  v53,  15LL);
LABEL_61:

LABEL_62:
          _Block_object_dispose(&v87, 8);

          _Block_object_dispose(&v93, 8);
          _Block_object_dispose(&v99, 8);
          _Block_object_dispose(buf, 8);

          _Block_object_dispose(&v103, 8);
          goto LABEL_63;
        }
      }

      else
      {
      }

      id v68 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v68);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v108 = 136315394;
        v109 = "-[IXSCoordinatedAppInstall _onQueue_installPlaceholder]";
        __int16 v110 = 2112;
        v111 = v71;
        _os_log_impl( (void *)&_mh_execute_header,  v29,  OS_LOG_TYPE_DEFAULT,  "%s: Error occurred when fetching optional placeholder install options: %@",  v108,  0x16u);
      }
    }

    goto LABEL_21;
  }

  id v36 = sub_1000047B4((uint64_t)off_1000E8CA0);
  uint64_t v37 = (os_log_s *)objc_claimAutoreleasedReturnValue(v36);
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
    sub_100080788();
  }

  id v39 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall _onQueue_installPlaceholder]",  2240LL,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  @"Placeholder was nil when we went to install it for %@",  v38,  (uint64_t)self);
  uint64_t v40 = (void *)objc_claimAutoreleasedReturnValue(v39);
  -[IXSCoordinatedAppInstall _onQueue_internal_cancelForReason:client:]( self,  "_onQueue_internal_cancelForReason:client:",  v40,  15LL);

LABEL_63:
}

- (void)_onQueue_acquireAssertionAndInstallPlaceholder
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  if (!-[IXSCoordinatedAppInstall placeholderInstallState](self, "placeholderInstallState")
    || (id)-[IXSCoordinatedAppInstall placeholderInstallState](self, "placeholderInstallState") == (id)2
    || (id)-[IXSCoordinatedAppInstall placeholderInstallState](self, "placeholderInstallState") == (id)1)
  {
    BOOL v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
      *(_DWORD *)buf = 136315394;
      BOOL v14 = "-[IXSCoordinatedAppInstall _onQueue_acquireAssertionAndInstallPlaceholder]";
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s: Acquiring termination assertion to install placeholder for %@",  buf,  0x16u);
    }

    -[IXSCoordinatedAppInstall _onQueue_acquireAssertionForPlaceholder:]( self,  "_onQueue_acquireAssertionForPlaceholder:",  1LL);
  }

  else
  {
    id v7 = sub_1000047B4((uint64_t)off_1000E8CA0);
    BOOL v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100080948(self, v8);
    }

    uint64_t v9 = -[IXSCoordinatedAppInstall placeholderInstallState](self, "placeholderInstallState");
    id v11 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall _onQueue_acquireAssertionAndInstallPlaceholder]",  2394LL,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  @"Expected to have not yet begun placeholder install or waiting/pending assertion acquisition but state was %lu",  v10,  v9);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    -[IXSCoordinatedAppInstall _onQueue_internal_cancelForReason:client:]( self,  "_onQueue_internal_cancelForReason:client:",  v12,  15LL);
  }

+ (id)_fetchInstallOptionsFromPromise:(id)a3 error:(id *)a4
{
  uint64_t v44 = 0LL;
  __int16 v45 = &v44;
  uint64_t v46 = 0x3032000000LL;
  uint64_t v47 = sub_10003E9E8;
  id v48 = sub_10003E9F8;
  id v49 = 0LL;
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472LL;
  v41[2] = sub_100045768;
  v41[3] = &unk_1000CCEF8;
  uint64_t v43 = &v44;
  id v5 = a3;
  id v42 = v5;
  id v6 = objc_retainBlock(v41);
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v5 accessQueue]);
  dispatch_sync(v7, v6);

  uint64_t v8 = v45[5];
  if (v8)
  {
    id v40 = 0LL;
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSData dataWithContentsOfURL:options:error:]( &OBJC_CLASS___NSData,  "dataWithContentsOfURL:options:error:",  v8,  3LL,  &v40));
    id v10 = v40;
    if (v9)
    {
      id v39 = v10;
      id v11 = -[NSKeyedUnarchiver initForReadingFromData:error:]( objc_alloc(&OBJC_CLASS___NSKeyedUnarchiver),  "initForReadingFromData:error:",  v9,  &v39);
      id v12 = v39;

      if (v11)
      {
        id v13 = -[NSKeyedUnarchiver decodeObjectOfClass:forKey:]( v11,  "decodeObjectOfClass:forKey:",  objc_opt_class(&OBJC_CLASS___MIInstallOptions),  NSKeyedArchiveRootObjectKey);
        BOOL v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        if (v14)
        {
          __int16 v15 = v12;
LABEL_20:
          -[NSKeyedUnarchiver finishDecoding](v11, "finishDecoding");
          goto LABEL_21;
        }

        uint64_t v30 = sub_1000047B4((uint64_t)off_1000E8CA0);
        id v31 = (os_log_s *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          id v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedUnarchiver error](v11, "error"));
          sub_100080B0C(v32, v50);
        }

        unsigned int v33 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedUnarchiver error](v11, "error"));
        id v35 = sub_10003556C( (uint64_t)"+[IXSCoordinatedAppInstall _fetchInstallOptionsFromPromise:error:]",  2448LL,  @"IXErrorDomain",  1uLL,  v33,  0LL,  @"Failed to unarchive install options data",  v34,  v38);
        __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(v35);
      }

      else
      {
        id v26 = sub_1000047B4((uint64_t)off_1000E8CA0);
        id v27 = (os_log_s *)objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          sub_100080AA0();
        }

        id v29 = sub_10003556C( (uint64_t)"+[IXSCoordinatedAppInstall _fetchInstallOptionsFromPromise:error:]",  2442LL,  @"IXErrorDomain",  1uLL,  v12,  0LL,  @"Failed to create unarchiver for install options data",  v28,  v38);
        __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(v29);
      }

      BOOL v14 = 0LL;
      goto LABEL_20;
    }

    uint64_t v20 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue([(id)v45[5] path]);
      sub_100080A38(v22, (uint64_t)v10, (uint64_t)v50, v21);
    }

    unsigned __int8 v23 = (void *)objc_claimAutoreleasedReturnValue([(id)v45[5] path]);
    id v25 = sub_10003556C( (uint64_t)"+[IXSCoordinatedAppInstall _fetchInstallOptionsFromPromise:error:]",  2436LL,  @"IXErrorDomain",  1uLL,  v10,  0LL,  @"Unable to read install options serialized data from %@",  v24,  (uint64_t)v23);
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(v25);
  }

  else
  {
    id v16 = sub_1000047B4((uint64_t)off_1000E8CA0);
    unint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000809C8();
    }

    id v19 = sub_10003556C( (uint64_t)"+[IXSCoordinatedAppInstall _fetchInstallOptionsFromPromise:error:]",  2430LL,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  @"Install options promise unexpectedly returned nil staged path.",  v18,  v38);
    __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(v19);
  }

  id v11 = 0LL;
  uint64_t v9 = 0LL;
  BOOL v14 = 0LL;
LABEL_21:
  if (a4 && !v14) {
    *a4 = v15;
  }
  id v36 = v14;

  _Block_object_dispose(&v44, 8);
  return v36;
}

- (id)_onQueue_fetchInstallOptionsWithError:(id *)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall installOptionsPromise](self, "installOptionsPromise"));
  if (v7)
  {
    id v8 = [(id)objc_opt_class(self) _fetchInstallOptionsFromPromise:v7 error:a3];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  }

  else
  {
    id v10 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall _onQueue_fetchInstallOptionsWithError:]",  2471LL,  @"IXErrorDomain",  0x17uLL,  0LL,  0LL,  @"Install options promise was not set.",  v6,  v14);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    id v12 = v11;
    if (a3) {
      *a3 = v11;
    }

    uint64_t v9 = 0LL;
  }

  return v9;
}

- (void)_onQueue_handleCancelForInstallFailure:(id)a3
{
  id v27 = a3;
  BOOL v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v4);

  id v5 = (void *)objc_claimAutoreleasedReturnValue([v27 domain]);
  unsigned int v6 = [v5 isEqualToString:MIInstallerErrorDomain];

  if (!v6)
  {
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue([v27 domain]);
    unsigned int v10 = [v9 isEqualToString:LSApplicationWorkspaceErrorDomain];

    if (v10)
    {
      id v11 = IXCreateUserPresentableError(1uLL, 0, v27);
      id v12 = (id)objc_claimAutoreleasedReturnValue(v11);
      uint64_t v13 = 16LL;
      goto LABEL_31;
    }

    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v27 domain]);
    if ([v14 isEqualToString:NSCocoaErrorDomain])
    {
      id v15 = [v27 code];

      if (v15 == (id)4097)
      {
        id v16 = IXCreateUserPresentableError(1uLL, 0, v27);
        id v12 = (id)objc_claimAutoreleasedReturnValue(v16);
        uint64_t v13 = 15LL;
        goto LABEL_31;
      }
    }

    else
    {
    }

    uint64_t v13 = 15LL;
LABEL_32:
    id v12 = v27;
    goto LABEL_33;
  }

  id v7 = [v27 code];
  switch((unint64_t)v7)
  {
    case 7uLL:
      unint64_t v8 = 13LL;
      goto LABEL_29;
    case 8uLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xEuLL:
      goto LABEL_14;
    case 9uLL:
      unint64_t v8 = 16LL;
      goto LABEL_29;
    case 0xAuLL:
      unint64_t v8 = 6LL;
      goto LABEL_29;
    case 0xDuLL:
      id v19 = (void *)objc_claimAutoreleasedReturnValue([v27 userInfo]);
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue([v19 objectForKeyedSubscript:MILibMISErrorNumberKey]);
      uint64_t v21 = objc_opt_class(&OBJC_CLASS___NSNumber);
      id v22 = v20;
      if ((objc_opt_isKindOfClass(v22, v21) & 1) != 0) {
        id v23 = v22;
      }
      else {
        id v23 = 0LL;
      }

      else {
        unint64_t v24 = 14LL;
      }
      id v25 = IXCreateUserPresentableError(v24, 0, v27);
      id v12 = (id)objc_claimAutoreleasedReturnValue(v25);

      goto LABEL_30;
    case 0xFuLL:
      unint64_t v8 = 4LL;
      goto LABEL_29;
    default:
      if (v7 == (id)159)
      {
        unint64_t v8 = 15LL;
      }

      else if (v7 == (id)208)
      {
        unint64_t v8 = 18LL;
      }

      else
      {
LABEL_14:
        id v17 = sub_100009DB4(v27);
        uint64_t v18 = objc_claimAutoreleasedReturnValue(v17);
        if (v18)
        {
          id v12 = (id)v18;
          uint64_t v13 = 17LL;
          goto LABEL_33;
        }

        unint64_t v8 = 1LL;
      }

- (void)_finishAppInstallAtURL:(id)a3 result:(BOOL)a4 recordPromise:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue([v13 bundleID]);
  BOOL v15 = sub_100031BB0(v14, 4LL);

  if (v15)
  {
    id v27 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v28 = (os_log_s *)objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v34 = "-[IXSCoordinatedAppInstall _finishAppInstallAtURL:result:recordPromise:error:]";
      _os_log_impl( (void *)&_mh_execute_header,  v28,  OS_LOG_TYPE_DEFAULT,  "%s: Exiting because testing client requested termination after app install.",  buf,  0xCu);
    }

    exit(1);
  }

  if (a4)
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
    v29[0] = (uint64_t)_NSConcreteStackBlock;
    v29[1] = 3221225472LL;
    v29[2] = (uint64_t)sub_100045E9C;
    v29[3] = (uint64_t)&unk_1000CCCB8;
    v29[4] = (uint64_t)self;
    id v17 = &v30;
    id v30 = v11;
    uint64_t v18 = v29;
  }

  else
  {
    if (!v12)
    {
      id v19 = sub_1000047B4((uint64_t)off_1000E8CA0);
      uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100080B64();
      }

      id v22 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall _finishAppInstallAtURL:result:recordPromise:error:]",  2574LL,  @"IXErrorDomain",  0xEuLL,  0LL,  0LL,  @"Installation failed but we received a nil error error object",  v21,  v29[0]);
      id v12 = (id)objc_claimAutoreleasedReturnValue(v22);
    }

    id v23 = sub_1000047B4((uint64_t)off_1000E8CA0);
    unint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (v10)
    {
      if (v25)
      {
        id v26 = (void *)objc_claimAutoreleasedReturnValue([v10 path]);
        *(_DWORD *)buf = 136315906;
        uint64_t v34 = "-[IXSCoordinatedAppInstall _finishAppInstallAtURL:result:recordPromise:error:]";
        __int16 v35 = 2112;
        id v36 = self;
        __int16 v37 = 2112;
        id v38 = v26;
        __int16 v39 = 2112;
        id v40 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%s: Installation for %@ at path %@ failed: %@",  buf,  0x2Au);
      }
    }

    else if (v25)
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v34 = "-[IXSCoordinatedAppInstall _finishAppInstallAtURL:result:recordPromise:error:]";
      __int16 v35 = 2112;
      id v36 = self;
      __int16 v37 = 2112;
      id v38 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v24,  OS_LOG_TYPE_DEFAULT,  "%s: Installation for %@ failed: %@",  buf,  0x20u);
    }

    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472LL;
    v31[2] = sub_100045E70;
    v31[3] = &unk_1000CCCB8;
    v31[4] = self;
    id v17 = &v32;
    id v12 = v12;
    id v32 = v12;
    uint64_t v18 = v31;
  }

  sub_10005A8F0(v16, v18);
}

- (void)_onQueue_doAddReference:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  unsigned int v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall _createPowerAssertion](self, "_createPowerAssertion"));
  -[IXSCoordinatedAppInstall setAppInstallState:](self, "setAppInstallState:", 3LL);
  uint64_t v24 = 0LL;
  BOOL v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  id v27 = sub_10003E9E8;
  uint64_t v28 = sub_10003E9F8;
  id v29 = 0LL;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 accessQueue]);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000461AC;
  block[3] = &unk_1000CCEF8;
  id v23 = &v24;
  id v8 = v4;
  id v22 = v8;
  dispatch_sync(v7, block);

  uint64_t v9 = v25[5];
  id v20 = 0LL;
  uint64_t v10 = MIFinalizeReferenceForInstalledAppWithError(v9, &v20);
  id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  id v12 = v20;
  uint64_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v8 accessQueue]);
  BOOL v15 = _NSConcreteStackBlock;
  uint64_t v16 = 3221225472LL;
  id v17 = sub_1000461E4;
  uint64_t v18 = &unk_1000CCE58;
  id v14 = v8;
  id v19 = v14;
  dispatch_sync(v13, &v15);

  -[IXSCoordinatedAppInstall _finishAppInstallAtURL:result:recordPromise:error:]( self,  "_finishAppInstallAtURL:result:recordPromise:error:",  0LL,  v11 != 0LL,  v11,  v12,  v15,  v16,  v17,  v18);
  [v6 invalidate];

  _Block_object_dispose(&v24, 8);
}

- (void)_onQueue_doInstall
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall error](self, "error"));
  if (v4)
  {
    id v5 = sub_1000047B4((uint64_t)off_1000E8CA0);
    unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[IXSCoordinatedAppInstall _onQueue_doInstall]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: %@: Ignoring install request because coordinator canceled while waiting for assertion",  buf,  0x16u);
    }
  }

  else
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall assertionRetryTimer](self, "assertionRetryTimer"));

    if (v7)
    {
      id v8 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall assertionRetryTimer](self, "assertionRetryTimer"));
      dispatch_source_cancel(v8);

      -[IXSCoordinatedAppInstall setAssertionRetryTimer:](self, "setAssertionRetryTimer:", 0LL);
    }

    unsigned int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall appAssetPromise](self, "appAssetPromise"));
    if (v6)
    {
      uint64_t v9 = objc_opt_class(&OBJC_CLASS___IXSPromisedAppReference);
      if ((objc_opt_isKindOfClass(v6, v9) & 1) != 0)
      {
        -[IXSCoordinatedAppInstall _onQueue_doAddReference:](self, "_onQueue_doAddReference:", v6);
      }

      else
      {
        id v45 = 0LL;
        BOOL v15 = (void *)objc_claimAutoreleasedReturnValue( -[IXSCoordinatedAppInstall _onQueue_fetchInstallOptionsWithError:]( self,  "_onQueue_fetchInstallOptionsWithError:",  &v45));
        id v16 = v45;
        if (v15)
        {
          objc_msgSend( v15,  "setUserInitiated:",  (id)-[IXSCoordinatedAppInstall importance](self, "importance") == (id)3);
          [v15 setInstallTargetType:1];
          if (!-[IXSCoordinatedAppInstall appAssetPromiseSetterCanInstallLocalProvisionedContent]( self,  "appAssetPromiseSetterCanInstallLocalProvisionedContent")) {
            [v15 setAllowLocalProvisioned:0];
          }
          id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
          uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue([v17 bundleID]);
          [v15 setBundleIdentifier:v18];

          id v19 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
          id v20 = (void *)objc_claimAutoreleasedReturnValue([v19 personaUniqueString]);
          [v15 setPersonaUniqueString:v20];

          if (-[IXSCoordinatedAppInstall needsPostProcessing](self, "needsPostProcessing")) {
            [v15 setPreservePlaceholderAsParallel:1];
          }
          unint64_t v21 = -[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent");
          if (v21 - 1 >= 6) {
            unint64_t v22 = 0LL;
          }
          else {
            unint64_t v22 = v21;
          }
          [v15 setInstallIntent:v22];
          -[IXSCoordinatedAppInstall setAppInstallState:](self, "setAppInstallState:", 3LL);
          id v23 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall termAssertion](self, "termAssertion"));

          BOOL v24 = v23 == 0LL;
          BOOL v25 = sub_1000047B4((uint64_t)off_1000E8CA0);
          uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue(v25);
          BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
          if (v24)
          {
            if (v27)
            {
              id v29 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
              *(_DWORD *)buf = 136315394;
              *(void *)&uint8_t buf[4] = "-[IXSCoordinatedAppInstall _onQueue_doInstall]";
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v29;
              _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%s: No termination assertion acquired for %@; proceeding with install.",
                buf,
                0x16u);
            }
          }

          else if (v27)
          {
            uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
            *(_DWORD *)buf = 136315394;
            *(void *)&uint8_t buf[4] = "-[IXSCoordinatedAppInstall _onQueue_doInstall]";
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v28;
            _os_log_impl( (void *)&_mh_execute_header,  v26,  OS_LOG_TYPE_DEFAULT,  "%s: Acquired termination assertion for %@; proceeding with install.",
              buf,
              0x16u);
          }

          *(void *)buf = 0LL;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000LL;
          uint64_t v47 = sub_10003E9E8;
          id v48 = sub_10003E9F8;
          id v49 = 0LL;
          id v30 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[os_log_s accessQueue](v6, "accessQueue"));
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_100046818;
          block[3] = &unk_1000CCEF8;
          uint64_t v44 = buf;
          uint64_t v43 = v6;
          dispatch_sync(v30, block);

          id v31 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall _createPowerAssertion](self, "_createPowerAssertion"));
          if ((id)-[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent") == (id)7)
          {
            id v32 = sub_1000047B4((uint64_t)off_1000E8CA0);
            unsigned int v33 = (os_log_s *)objc_claimAutoreleasedReturnValue(v32);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
              sub_100080C44();
            }

            id v35 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall _onQueue_doInstall]",  2753LL,  @"IXErrorDomain",  0x1EuLL,  0LL,  0LL,  @"Canceling installation for %@ because IXGizmoInstallingAppInstallCoordinator is not supported on non-iOS devices.",  v34,  (uint64_t)self);
            id v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
            -[IXSCoordinatedAppInstall _onQueue_internal_cancelForReason:client:]( self,  "_onQueue_internal_cancelForReason:client:",  v36,  15LL);
            [v31 invalidate];
          }

          else
          {
            -[IXSCoordinatedAppInstall setAppInstallPowerAssertion:](self, "setAppInstallPowerAssertion:", v31);
            unsigned __int8 v37 = -[IXSCoordinatedAppInstall needsPostProcessing](self, "needsPostProcessing");
            v38[0] = _NSConcreteStackBlock;
            v38[1] = 3221225472LL;
            v38[2] = sub_10004696C;
            v38[3] = &unk_1000CE348;
            v38[4] = self;
            id v40 = buf;
            id v39 = v15;
            unsigned __int8 v41 = v37;
            -[IXSCoordinatedAppInstall _runAsyncBlockWithDescription:onLaunchServicesQueue:]( self,  "_runAsyncBlockWithDescription:onLaunchServicesQueue:",  @"App install",  v38);
          }

          _Block_object_dispose(buf, 8);
        }

        else
        {
          -[IXSCoordinatedAppInstall _onQueue_internal_cancelForReason:client:]( self,  "_onQueue_internal_cancelForReason:client:",  v16,  15LL);
        }
      }
    }

    else
    {
      uint64_t v10 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100080BD4();
      }

      id v13 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall _onQueue_doInstall]",  2656LL,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  @"App asset was nil when we went to install it for %@",  v12,  (uint64_t)self);
      id v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      -[IXSCoordinatedAppInstall _onQueue_internal_cancelForReason:client:]( self,  "_onQueue_internal_cancelForReason:client:",  v14,  15LL);
    }
  }
}

- (void)_onQueue_acquireAssertionAndDoInstall
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  if (!-[IXSCoordinatedAppInstall appInstallState](self, "appInstallState")
    || (id)-[IXSCoordinatedAppInstall appInstallState](self, "appInstallState") == (id)2
    || (id)-[IXSCoordinatedAppInstall appInstallState](self, "appInstallState") == (id)1)
  {
    id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall publishedInstallProgress](self, "publishedInstallProgress"));
    [v4 setInstallPhase:1];

    id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall appAssetPromise](self, "appAssetPromise"));
    uint64_t v6 = objc_opt_class(&OBJC_CLASS___IXSPromisedAppReference);
    char isKindOfClass = objc_opt_isKindOfClass(v5, v6);

    id v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if ((isKindOfClass & 1) != 0)
    {
      if (v10)
      {
        id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
        *(_DWORD *)buf = 136315394;
        id v20 = "-[IXSCoordinatedAppInstall _onQueue_acquireAssertionAndDoInstall]";
        __int16 v21 = 2112;
        unint64_t v22 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: Adding reference for %@; no termination assertion required",
          buf,
          0x16u);
      }

      -[IXSCoordinatedAppInstall _onQueue_doInstall](self, "_onQueue_doInstall");
    }

    else
    {
      if (v10)
      {
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
        *(_DWORD *)buf = 136315394;
        id v20 = "-[IXSCoordinatedAppInstall _onQueue_acquireAssertionAndDoInstall]";
        __int16 v21 = 2112;
        unint64_t v22 = v12;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: Acquiring termination assertion to install %@",  buf,  0x16u);
      }

      -[IXSCoordinatedAppInstall _onQueue_acquireAssertionForPlaceholder:]( self,  "_onQueue_acquireAssertionForPlaceholder:",  0LL);
    }
  }

  else
  {
    id v13 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100080D28(self, v14);
    }

    uint64_t v15 = -[IXSCoordinatedAppInstall appInstallState](self, "appInstallState");
    id v17 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall _onQueue_acquireAssertionAndDoInstall]",  2790LL,  @"IXErrorDomain",  1uLL,  0LL,  0LL,  @"Expected to have not yet begun app install or waiting/pending assertion acquisition but state was %lu",  v16,  v15);
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    -[IXSCoordinatedAppInstall _onQueue_internal_cancelForReason:client:]( self,  "_onQueue_internal_cancelForReason:client:",  v18,  15LL);
  }

- (void)_onQueue_fireObserversForClient:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall delegateCallQueue](self, "delegateCallQueue"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall uniqueIdentifier](self, "uniqueIdentifier"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall completedRecordPromise](self, "completedRecordPromise"));
  uint64_t v9 = sub_1000047B4((uint64_t)off_1000E8CA0);
  BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v98 = "-[IXSCoordinatedAppInstall _onQueue_fireObserversForClient:]";
    __int16 v99 = 2112;
    v100 = self;
    __int16 v101 = 2112;
    id v102 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: %@: Firing applicable observers for client %@",  buf,  0x20u);
  }

  v92[0] = _NSConcreteStackBlock;
  v92[1] = 3221225472LL;
  v92[2] = sub_100047518;
  v92[3] = &unk_1000CCCB8;
  id v11 = v4;
  id v93 = v11;
  id v12 = v7;
  id v94 = v12;
  sub_10005A8F0(v6, v92);
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall error](self, "error"));

  if (v13)
  {
    v89[0] = _NSConcreteStackBlock;
    v89[1] = 3221225472LL;
    v89[2] = sub_100047524;
    v89[3] = &unk_1000CCF90;
    id v14 = &v90;
    id v90 = v11;
    uint64_t v15 = (id *)v91;
    v91[0] = v12;
    v91[1] = self;
    uint64_t v16 = v89;
  }

  else
  {
    if (-[IXSCoordinatedAppInstall isComplete](self, "isComplete"))
    {
      v85[0] = _NSConcreteStackBlock;
      v85[1] = 3221225472LL;
      v85[2] = sub_100047584;
      v85[3] = &unk_1000CCF90;
      id v14 = &v86;
      id v86 = v11;
      uint64_t v15 = &v87;
      id v87 = v12;
      id v88 = v8;
      sub_10005A8F0(v6, v85);

      goto LABEL_6;
    }

    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall placeholderPromise](self, "placeholderPromise"));
    BOOL v18 = sub_100047594(v17);

    if (v18)
    {
      v82[0] = _NSConcreteStackBlock;
      v82[1] = 3221225472LL;
      v82[2] = sub_100047684;
      v82[3] = &unk_1000CCCB8;
      id v83 = v11;
      id v84 = v12;
      sub_10005A8F0(v6, v82);
    }

    id v19 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall appAssetPromise](self, "appAssetPromise"));
    BOOL v20 = sub_100047594(v19);

    if (v20)
    {
      v79[0] = _NSConcreteStackBlock;
      v79[1] = 3221225472LL;
      v79[2] = sub_100047694;
      v79[3] = &unk_1000CCCB8;
      id v80 = v11;
      id v81 = v12;
      sub_10005A8F0(v6, v79);
    }

    if (-[IXSCoordinatedAppInstall shouldBeginRestoringUserData](self, "shouldBeginRestoringUserData"))
    {
      v76[0] = _NSConcreteStackBlock;
      v76[1] = 3221225472LL;
      v76[2] = sub_1000476A4;
      v76[3] = &unk_1000CCCB8;
      id v77 = v11;
      id v78 = v12;
      sub_10005A8F0(v6, v76);
    }

    if (-[IXSCoordinatedAppInstall shouldBeginPostProcessing](self, "shouldBeginPostProcessing"))
    {
      v72[0] = _NSConcreteStackBlock;
      v72[1] = 3221225472LL;
      v72[2] = sub_1000476B0;
      v72[3] = &unk_1000CCF90;
      id v73 = v11;
      id v74 = v12;
      id v75 = v8;
      sub_10005A8F0(v6, v72);
    }

    id v39 = v8;
    __int128 v70 = 0u;
    __int128 v71 = 0u;
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall initialODRAssetPromises](self, "initialODRAssetPromises"));
    id v22 = [v21 countByEnumeratingWithState:&v68 objects:v96 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v69;
      while (2)
      {
        for (i = 0LL; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v69 != v24) {
            objc_enumerationMutation(v21);
          }
          if (sub_100047594(*(void **)(*((void *)&v68 + 1) + 8LL * (void)i)))
          {
            int v26 = 1;
            goto LABEL_27;
          }
        }

        id v23 = [v21 countByEnumeratingWithState:&v68 objects:v96 count:16];
        if (v23) {
          continue;
        }
        break;
      }
    }

    int v26 = 0;
LABEL_27:

    __int128 v66 = 0u;
    __int128 v67 = 0u;
    __int128 v64 = 0u;
    __int128 v65 = 0u;
    BOOL v27 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall essentialAssetPromises](self, "essentialAssetPromises"));
    id v28 = [v27 countByEnumeratingWithState:&v64 objects:v95 count:16];
    if (v28)
    {
      id v29 = v28;
      uint64_t v30 = *(void *)v65;
      while (2)
      {
        for (j = 0LL; j != v29; j = (char *)j + 1)
        {
          if (*(void *)v65 != v30) {
            objc_enumerationMutation(v27);
          }
          if (sub_100047594(*(void **)(*((void *)&v64 + 1) + 8LL * (void)j)))
          {
            int v38 = 1;
            goto LABEL_39;
          }
        }

        id v29 = [v27 countByEnumeratingWithState:&v64 objects:v95 count:16];
        if (v29) {
          continue;
        }
        break;
      }

      int v38 = 0;
    }

    else
    {
      int v38 = 0;
    }

- (IXSPlaceholder)placeholderPromise
{
  return self->_placeholderPromise;
}

- (void)setPlaceholderPromise:(id)a3
{
  id v5 = (IXSPlaceholder *)a3;
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v6);

  p_placeholderPromise = &self->_placeholderPromise;
  if (self->_placeholderPromise != v5)
  {
    if (-[IXSCoordinatedAppInstall state](self, "state") >= 6)
    {
      id v9 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall setPlaceholderPromise:]",  3346LL,  @"IXErrorDomain",  0x1AuLL,  0LL,  0LL,  @"Placeholder promise not needed because existing placeholder promise was already used.",  v8,  v27);
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
LABEL_15:
      sub_100047A58(v5, v10, 15LL);

      goto LABEL_16;
    }

    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleID]);
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder bundleID](v5, "bundleID"));
    unsigned __int8 v14 = [v12 isEqualToString:v13];

    if ((v14 & 1) == 0)
    {
      id v22 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        sub_100080DA8();
      }

      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(-[IXSPlaceholder bundleID](v5, "bundleID"));
      id v26 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall setPlaceholderPromise:]",  3353LL,  @"IXErrorDomain",  8uLL,  0LL,  0LL,  @"Ignoring attempt to set a placeholder promise with bundle ID %@ on coordinator with different bundle id %@",  v25,  (uint64_t)v24);
      BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(v26);

      goto LABEL_15;
    }

    if (*p_placeholderPromise)
    {
      uint64_t v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](*p_placeholderPromise, "accessQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100047B18;
      block[3] = &unk_1000CCE58;
      void block[4] = self;
      dispatch_sync(v15, block);
    }

    objc_storeStrong((id *)&self->_placeholderPromise, a3);
    uint64_t v16 = (NSUUID *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise uniqueIdentifier](v5, "uniqueIdentifier"));
    placeholderPromiseUUID = self->_placeholderPromiseUUID;
    self->_placeholderPromiseUUID = v16;

    placeholderPromise = self->_placeholderPromise;
    if (placeholderPromise)
    {
      id v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](placeholderPromise, "accessQueue"));
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472LL;
      v28[2] = sub_100047B24;
      v28[3] = &unk_1000CCE58;
      v28[4] = self;
      dispatch_sync(v19, v28);
    }

    BOOL v20 = sub_1000047B4((uint64_t)off_1000E8CA0);
    __int16 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v31 = "-[IXSCoordinatedAppInstall setPlaceholderPromise:]";
      __int16 v32 = 2112;
      BOOL v33 = self;
      __int16 v34 = 2112;
      BOOL v35 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v21,  OS_LOG_TYPE_DEFAULT,  "%s: %@ : Placeholder Promise set: %@",  buf,  0x20u);
    }

    -[IXSCoordinatedAppInstall _onQueue_saveState](self, "_onQueue_saveState");
    -[IXSCoordinatedAppInstall _onQueue_checkState](self, "_onQueue_checkState");
  }

- (IXSOwnedDataPromise)appAssetPromise
{
  return self->_appAssetPromise;
}

- (void)_internal_setAppAssetPromise:(id)a3
{
  id v12 = (IXSOwnedDataPromise *)a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  appAssetPromise = self->_appAssetPromise;
  if (appAssetPromise != v12)
  {
    if (appAssetPromise)
    {
      id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](appAssetPromise, "accessQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100047C5C;
      block[3] = &unk_1000CCE58;
      void block[4] = self;
      dispatch_sync(v7, block);
    }

    objc_storeStrong((id *)&self->_appAssetPromise, a3);
    uint64_t v8 = (NSUUID *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise uniqueIdentifier](v12, "uniqueIdentifier"));
    appAssetPromiseUUID = self->_appAssetPromiseUUID;
    self->_appAssetPromiseUUID = v8;

    BOOL v10 = self->_appAssetPromise;
    if (v10)
    {
      id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](v10, "accessQueue"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_100047C68;
      v13[3] = &unk_1000CCE58;
      v13[4] = self;
      dispatch_sync(v11, v13);
    }
  }
}

- (void)setAppAssetPromise:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  if ((id)-[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent") == (id)4
    || (id)-[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent") == (id)6)
  {
    unint64_t v6 = -[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent");
    if (v6 >= 8) {
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown intent value %lu",  v6));
    }
    else {
      uint64_t v8 = *(&off_1000CE7B0 + v6);
    }
    id v9 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall setAppAssetPromise:]",  3416LL,  @"IXErrorDomain",  0x1AuLL,  0LL,  0LL,  @"Ignoring attempt to set app asset promise on %@: %@ : %@",  v7,  (uint64_t)v8);
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

    goto LABEL_7;
  }

  if (-[IXSCoordinatedAppInstall state](self, "state") >= 0x11)
  {
    id v12 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall setAppAssetPromise:]",  3423LL,  @"IXErrorDomain",  0x1AuLL,  0LL,  0LL,  @"App asset promise not needed because existing app asset promise was already used.",  v11,  v15);
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(v12);
LABEL_7:
    sub_100047A58(v4, v10, 15LL);

    goto LABEL_8;
  }

  -[IXSCoordinatedAppInstall _internal_setAppAssetPromise:](self, "_internal_setAppAssetPromise:", v4);
  id v13 = sub_1000047B4((uint64_t)off_1000E8CA0);
  unsigned __int8 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v17 = "-[IXSCoordinatedAppInstall setAppAssetPromise:]";
    __int16 v18 = 2112;
    id v19 = self;
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s: %@ : App Asset Promise set: %@",  buf,  0x20u);
  }

  -[IXSCoordinatedAppInstall _onQueue_saveState](self, "_onQueue_saveState");
  -[IXSCoordinatedAppInstall _onQueue_checkState](self, "_onQueue_checkState");
LABEL_8:
}

- (unint64_t)appAssetPromiseDRI
{
  return self->_appAssetPromiseDRI;
}

- (void)setAppAssetPromiseDRI:(unint64_t)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  unint64_t v6 = sub_1000047B4((uint64_t)off_1000E8CA0);
  uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = IXStringForClientID(a3);
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    int v10 = 136315650;
    uint64_t v11 = "-[IXSCoordinatedAppInstall setAppAssetPromiseDRI:]";
    __int16 v12 = 2112;
    id v13 = self;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: %@ : App Asset Promise DRI set: %@",  (uint8_t *)&v10,  0x20u);
  }

  self->_appAssetPromiseDRI = a3;
  -[IXSCoordinatedAppInstall _onQueue_saveState](self, "_onQueue_saveState");
}

- (NSArray)initialODRAssetPromises
{
  return self->_initialODRAssetPromises;
}

- (void)setInitialODRAssetPromises:(id)a3
{
  id v5 = a3;
  unint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v6);

  if (-[IXSCoordinatedAppInstall state](self, "state") < 0xD)
  {
    int v10 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    id v40 = v5;
    id obj = v5;
    id v19 = [obj countByEnumeratingWithState:&v50 objects:v65 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v51;
      do
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v51 != v21) {
            objc_enumerationMutation(obj);
          }
          id v23 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)i);
          uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue([v23 uniqueIdentifier]);
          -[NSMutableArray addObject:](v10, "addObject:", v24);

          uint64_t v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v23 accessQueue]);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1000483FC;
          block[3] = &unk_1000CCCB8;
          void block[4] = v23;
          void block[5] = self;
          dispatch_sync(v25, block);
        }

        id v20 = [obj countByEnumeratingWithState:&v50 objects:v65 count:16];
      }

      while (v20);
    }

    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    id v39 = self;
    p_initialODRAssetPromises = &self->_initialODRAssetPromises;
    id v26 = self->_initialODRAssetPromises;
    id v27 = -[NSArray countByEnumeratingWithState:objects:count:]( v26,  "countByEnumeratingWithState:objects:count:",  &v45,  v64,  16LL);
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v46;
      do
      {
        for (j = 0LL; j != v28; j = (char *)j + 1)
        {
          if (*(void *)v46 != v29) {
            objc_enumerationMutation(v26);
          }
          id v31 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)j);
          __int16 v32 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v31 accessQueue]);
          v42[0] = _NSConcreteStackBlock;
          v42[1] = 3221225472LL;
          v42[2] = sub_100048404;
          v42[3] = &unk_1000CCCB8;
          uint64_t v43 = v10;
          id v44 = v31;
          dispatch_sync(v32, v42);
        }

        id v28 = -[NSArray countByEnumeratingWithState:objects:count:]( v26,  "countByEnumeratingWithState:objects:count:",  &v45,  v64,  16LL);
      }

      while (v28);
    }

    objc_storeStrong((id *)p_initialODRAssetPromises, a3);
    BOOL v33 = (NSArray *)-[NSMutableArray copy](v10, "copy");
    initialODRAssetPromiseUUIDs = v39->_initialODRAssetPromiseUUIDs;
    v39->_initialODRAssetPromiseUUIDs = v33;

    BOOL v35 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v59 = "-[IXSCoordinatedAppInstall setInitialODRAssetPromises:]";
      __int16 v60 = 2112;
      __int16 v61 = v39;
      __int16 v62 = 2112;
      id v63 = obj;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "%s: %@ : Initial ODR Asset Promises set: %@",  buf,  0x20u);
    }

    -[IXSCoordinatedAppInstall _onQueue_saveState](v39, "_onQueue_saveState");
    -[IXSCoordinatedAppInstall _onQueue_checkState](v39, "_onQueue_checkState");
    id v5 = v40;
  }

  else
  {
    uint64_t v8 = self;
    id v9 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall setInitialODRAssetPromises:]",  3466LL,  @"IXErrorDomain",  0x1AuLL,  0LL,  0LL,  @"Not processing attempt to set initial ODR asset promises because those that were set were already complete and this coordinator is past the point of waiting for them.",  v7,  v37);
    int v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v9);
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    id v11 = v5;
    id v12 = [v11 countByEnumeratingWithState:&v54 objects:v66 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v55;
      do
      {
        for (k = 0LL; k != v13; k = (char *)k + 1)
        {
          if (*(void *)v55 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)k);
          id v17 = v8->_initialODRAssetPromiseUUIDs;
          __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v16 uniqueIdentifier]);
          LOBYTE(v17) = -[NSArray containsObject:](v17, "containsObject:", v18);
        }

        id v13 = [v11 countByEnumeratingWithState:&v54 objects:v66 count:16];
      }

      while (v13);
    }
  }
}

- (IXSPromisedOutOfBandTransfer)userDataPromise
{
  return self->_userDataPromise;
}

- (void)setUserDataPromise:(id)a3
{
  id v5 = (IXSPromisedOutOfBandTransfer *)a3;
  unint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v6);

  p_userDataPromise = &self->_userDataPromise;
  if (self->_userDataPromise != v5)
  {
    if (-[IXSCoordinatedAppInstall state](self, "state") < 0xB)
    {
      if (*p_userDataPromise)
      {
        id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](*p_userDataPromise, "accessQueue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1000486A4;
        block[3] = &unk_1000CCE58;
        void block[4] = self;
        dispatch_sync(v11, block);
      }

      objc_storeStrong((id *)&self->_userDataPromise, a3);
      id v12 = (NSUUID *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise uniqueIdentifier](v5, "uniqueIdentifier"));
      userDataPromiseUUID = self->_userDataPromiseUUID;
      self->_userDataPromiseUUID = v12;

      userDataPromise = self->_userDataPromise;
      if (userDataPromise)
      {
        uint64_t v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](userDataPromise, "accessQueue"));
        v18[0] = (uint64_t)_NSConcreteStackBlock;
        v18[1] = 3221225472LL;
        v18[2] = (uint64_t)sub_1000486B0;
        v18[3] = (uint64_t)&unk_1000CCE58;
        v18[4] = (uint64_t)self;
        dispatch_sync(v15, v18);
      }

      uint64_t v16 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v21 = "-[IXSCoordinatedAppInstall setUserDataPromise:]";
        __int16 v22 = 2112;
        id v23 = self;
        __int16 v24 = 2112;
        uint64_t v25 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s: %@ : User Data Promise set: %@",  buf,  0x20u);
      }

      -[IXSCoordinatedAppInstall _onQueue_saveState](self, "_onQueue_saveState");
      -[IXSCoordinatedAppInstall _onQueue_checkState](self, "_onQueue_checkState");
    }

    else
    {
      id v9 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall setUserDataPromise:]",  3521LL,  @"IXErrorDomain",  0x1AuLL,  0LL,  0LL,  @"Not processing attempt to set user data promise because it was already complete and this coordinator is past the point of waiting for it.",  v8,  v18[0]);
      int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      sub_100047A58(v5, v10, 15LL);
    }
  }
}

- (IXSPromisedOutOfBandTransfer)deviceSecurityPromise
{
  return self->_deviceSecurityPromise;
}

- (void)setDeviceSecurityPromise:(id)a3
{
  id v5 = (IXSPromisedOutOfBandTransfer *)a3;
  unint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v6);

  p_deviceSecurityPromise = &self->_deviceSecurityPromise;
  if (self->_deviceSecurityPromise != v5)
  {
    if (-[IXSCoordinatedAppInstall state](self, "state") < 0x11)
    {
      if (*p_deviceSecurityPromise)
      {
        id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](*p_deviceSecurityPromise, "accessQueue"));
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_1000488FC;
        block[3] = &unk_1000CCE58;
        void block[4] = self;
        dispatch_sync(v11, block);
      }

      objc_storeStrong((id *)&self->_deviceSecurityPromise, a3);
      id v12 = (NSUUID *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise uniqueIdentifier](v5, "uniqueIdentifier"));
      deviceSecurityPromiseUUID = self->_deviceSecurityPromiseUUID;
      self->_deviceSecurityPromiseUUID = v12;

      deviceSecurityPromise = self->_deviceSecurityPromise;
      if (deviceSecurityPromise)
      {
        uint64_t v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](deviceSecurityPromise, "accessQueue"));
        v18[0] = (uint64_t)_NSConcreteStackBlock;
        v18[1] = 3221225472LL;
        v18[2] = (uint64_t)sub_100048908;
        v18[3] = (uint64_t)&unk_1000CCE58;
        v18[4] = (uint64_t)self;
        dispatch_sync(v15, v18);
      }

      uint64_t v16 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v21 = "-[IXSCoordinatedAppInstall setDeviceSecurityPromise:]";
        __int16 v22 = 2112;
        id v23 = self;
        __int16 v24 = 2112;
        uint64_t v25 = v5;
        _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_DEFAULT,  "%s: %@ : Device Security Promise set: %@",  buf,  0x20u);
      }

      -[IXSCoordinatedAppInstall _onQueue_saveState](self, "_onQueue_saveState");
      -[IXSCoordinatedAppInstall _onQueue_checkState](self, "_onQueue_checkState");
    }

    else
    {
      id v9 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall setDeviceSecurityPromise:]",  3565LL,  @"IXErrorDomain",  0x1AuLL,  0LL,  0LL,  @"Not processing attempt to set device security promise because it was already complete and this coordinator is past the point of waiting for it.",  v8,  v18[0]);
      int v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      sub_100047A58(v5, v10, 15LL);
    }
  }
}

- (IXSPromisedOutOfBandTransfer)preparationPromise
{
  return self->_preparationPromise;
}

- (void)setPreparationPromise:(id)a3
{
  id v5 = (IXSPromisedOutOfBandTransfer *)a3;
  unint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v6);

  preparationPromise = self->_preparationPromise;
  if (preparationPromise != v5)
  {
    if (preparationPromise)
    {
      uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](preparationPromise, "accessQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100048AF0;
      block[3] = &unk_1000CCE58;
      void block[4] = self;
      dispatch_sync(v8, block);
    }

    objc_storeStrong((id *)&self->_preparationPromise, a3);
    id v9 = (NSUUID *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise uniqueIdentifier](v5, "uniqueIdentifier"));
    preparationPromiseUUID = self->_preparationPromiseUUID;
    self->_preparationPromiseUUID = v9;

    id v11 = self->_preparationPromise;
    if (v11)
    {
      id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](v11, "accessQueue"));
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472LL;
      v15[2] = sub_100048AFC;
      v15[3] = &unk_1000CCE58;
      v15[4] = self;
      dispatch_sync(v12, v15);
    }

    id v13 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      __int16 v18 = "-[IXSCoordinatedAppInstall setPreparationPromise:]";
      __int16 v19 = 2112;
      id v20 = self;
      __int16 v21 = 2112;
      __int16 v22 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s: %@ : Preparation Promise set: %@",  buf,  0x20u);
    }

    -[IXSCoordinatedAppInstall _onQueue_saveState](self, "_onQueue_saveState");
    -[IXSCoordinatedAppInstall _onQueue_checkState](self, "_onQueue_checkState");
  }
}

- (IXSOwnedDataPromise)installOptionsPromise
{
  return self->_installOptionsPromise;
}

- (void)_internal_setInstallOptionsPromise:(id)a3
{
  id v12 = (IXSOwnedDataPromise *)a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  installOptionsPromise = self->_installOptionsPromise;
  if (installOptionsPromise != v12)
  {
    if (installOptionsPromise)
    {
      uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](installOptionsPromise, "accessQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100048C34;
      block[3] = &unk_1000CCE58;
      void block[4] = self;
      dispatch_sync(v7, block);
    }

    objc_storeStrong((id *)&self->_installOptionsPromise, a3);
    uint64_t v8 = (NSUUID *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise uniqueIdentifier](v12, "uniqueIdentifier"));
    installOptionsPromiseUUID = self->_installOptionsPromiseUUID;
    self->_installOptionsPromiseUUID = v8;

    int v10 = self->_installOptionsPromise;
    if (v10)
    {
      id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSDataPromise accessQueue](v10, "accessQueue"));
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472LL;
      v13[2] = sub_100048C40;
      v13[3] = &unk_1000CCE58;
      v13[4] = self;
      dispatch_sync(v11, v13);
    }
  }
}

- (void)setInstallOptionsPromise:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  if ((id)-[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent") == (id)4)
  {
    id v7 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall setInstallOptionsPromise:]",  3665LL,  @"IXErrorDomain",  0x1AuLL,  0LL,  0LL,  @"Ignoring attempt to set install options on restoring demoted coordinator: %@ : %@",  v6,  (uint64_t)self);
LABEL_5:
    id v9 = (void *)objc_claimAutoreleasedReturnValue(v7);
    sub_100047A58(v4, v9, 15LL);

    goto LABEL_9;
  }

  if (-[IXSCoordinatedAppInstall state](self, "state") >= 0x10)
  {
    id v7 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall setInstallOptionsPromise:]",  3672LL,  @"IXErrorDomain",  0x1AuLL,  0LL,  0LL,  @"Not processing attempt to set install options because this coordinator is past the point of needing them: %@",  v8,  (uint64_t)self);
    goto LABEL_5;
  }

  -[IXSCoordinatedAppInstall _internal_setInstallOptionsPromise:](self, "_internal_setInstallOptionsPromise:", v4);
  int v10 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v13 = "-[IXSCoordinatedAppInstall setInstallOptionsPromise:]";
    __int16 v14 = 2112;
    uint64_t v15 = self;
    __int16 v16 = 2112;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: %@ : install options set: %@", buf, 0x20u);
  }

  -[IXSCoordinatedAppInstall _onQueue_saveState](self, "_onQueue_saveState");
  -[IXSCoordinatedAppInstall _onQueue_checkState](self, "_onQueue_checkState");
LABEL_9:
}

- (BOOL)needsPostProcessing
{
  return self->_needsPostProcessing;
}

- (void)setNeedsPostProcessing:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  uint64_t v6 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    int v10 = "-[IXSCoordinatedAppInstall setNeedsPostProcessing:]";
    if (v3) {
      int v8 = 89;
    }
    else {
      int v8 = 78;
    }
    __int16 v11 = 2112;
    id v12 = self;
    __int16 v13 = 1024;
    int v14 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: %@ : needs post processing set to %c",  (uint8_t *)&v9,  0x1Cu);
  }

  if (self->_needsPostProcessing != v3)
  {
    self->_needsPostProcessing = v3;
    -[IXSCoordinatedAppInstall _onQueue_saveState](self, "_onQueue_saveState");
  }

- (BOOL)shouldBeginPostProcessing
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  if ((char *)-[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent") - 1 > (char *)1)
  {
    LOBYTE(v4) = 0;
  }

  else
  {
    BOOL v4 = -[IXSCoordinatedAppInstall needsPostProcessing](self, "needsPostProcessing");
    if (v4) {
      LOBYTE(v4) = (id)-[IXSCoordinatedAppInstall appInstallState](self, "appInstallState") == (id)4;
    }
  }

  return v4;
}

- (NSArray)essentialAssetPromises
{
  return self->_essentialAssetPromises;
}

- (void)setEssentialAssetPromises:(id)a3
{
  id v5 = a3;
  uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v6);

  if (-[IXSCoordinatedAppInstall state](self, "state") < 0x1C)
  {
    int v10 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
    __int128 v50 = 0u;
    __int128 v51 = 0u;
    __int128 v52 = 0u;
    __int128 v53 = 0u;
    id v40 = v5;
    id obj = v5;
    id v19 = [obj countByEnumeratingWithState:&v50 objects:v65 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v51;
      do
      {
        for (i = 0LL; i != v20; i = (char *)i + 1)
        {
          if (*(void *)v51 != v21) {
            objc_enumerationMutation(obj);
          }
          id v23 = *(void **)(*((void *)&v50 + 1) + 8LL * (void)i);
          __int16 v24 = (void *)objc_claimAutoreleasedReturnValue([v23 uniqueIdentifier]);
          -[NSMutableArray addObject:](v10, "addObject:", v24);

          uint64_t v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v23 accessQueue]);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1000493D4;
          block[3] = &unk_1000CCCB8;
          void block[4] = v23;
          void block[5] = self;
          dispatch_sync(v25, block);
        }

        id v20 = [obj countByEnumeratingWithState:&v50 objects:v65 count:16];
      }

      while (v20);
    }

    __int128 v47 = 0u;
    __int128 v48 = 0u;
    __int128 v45 = 0u;
    __int128 v46 = 0u;
    id v39 = self;
    p_essentialAssetPromises = &self->_essentialAssetPromises;
    id v26 = self->_essentialAssetPromises;
    id v27 = -[NSArray countByEnumeratingWithState:objects:count:]( v26,  "countByEnumeratingWithState:objects:count:",  &v45,  v64,  16LL);
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v46;
      do
      {
        for (j = 0LL; j != v28; j = (char *)j + 1)
        {
          if (*(void *)v46 != v29) {
            objc_enumerationMutation(v26);
          }
          id v31 = *(void **)(*((void *)&v45 + 1) + 8LL * (void)j);
          __int16 v32 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v31 accessQueue]);
          v42[0] = _NSConcreteStackBlock;
          v42[1] = 3221225472LL;
          v42[2] = sub_1000493DC;
          v42[3] = &unk_1000CCCB8;
          uint64_t v43 = v10;
          id v44 = v31;
          dispatch_sync(v32, v42);
        }

        id v28 = -[NSArray countByEnumeratingWithState:objects:count:]( v26,  "countByEnumeratingWithState:objects:count:",  &v45,  v64,  16LL);
      }

      while (v28);
    }

    objc_storeStrong((id *)p_essentialAssetPromises, a3);
    BOOL v33 = (NSArray *)-[NSMutableArray copy](v10, "copy");
    essentialAssetPromiseUUIDs = v39->_essentialAssetPromiseUUIDs;
    v39->_essentialAssetPromiseUUIDs = v33;

    BOOL v35 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v36 = (os_log_s *)objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v59 = "-[IXSCoordinatedAppInstall setEssentialAssetPromises:]";
      __int16 v60 = 2112;
      __int16 v61 = v39;
      __int16 v62 = 2112;
      id v63 = obj;
      _os_log_impl( (void *)&_mh_execute_header,  v36,  OS_LOG_TYPE_DEFAULT,  "%s: %@ : Essential Asset Promises set: %@",  buf,  0x20u);
    }

    -[IXSCoordinatedAppInstall _onQueue_saveState](v39, "_onQueue_saveState");
    -[IXSCoordinatedAppInstall _onQueue_checkState](v39, "_onQueue_checkState");
    id v5 = v40;
  }

  else
  {
    int v8 = self;
    id v9 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall setEssentialAssetPromises:]",  3746LL,  @"IXErrorDomain",  0x1AuLL,  0LL,  0LL,  @"Not processing attempt to set essential asset promises because those that were set were already complete and this coordinator is past the point of waiting for them.",  v7,  v37);
    int v10 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v9);
    __int128 v54 = 0u;
    __int128 v55 = 0u;
    __int128 v56 = 0u;
    __int128 v57 = 0u;
    id v11 = v5;
    id v12 = [v11 countByEnumeratingWithState:&v54 objects:v66 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v55;
      do
      {
        for (k = 0LL; k != v13; k = (char *)k + 1)
        {
          if (*(void *)v55 != v14) {
            objc_enumerationMutation(v11);
          }
          __int16 v16 = *(void **)(*((void *)&v54 + 1) + 8LL * (void)k);
          id v17 = v8->_essentialAssetPromiseUUIDs;
          __int16 v18 = (void *)objc_claimAutoreleasedReturnValue([v16 uniqueIdentifier]);
          LOBYTE(v17) = -[NSArray containsObject:](v17, "containsObject:", v18);
        }

        id v13 = [v11 countByEnumeratingWithState:&v54 objects:v66 count:16];
      }

      while (v13);
    }
  }
}

- (BOOL)isPaused
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  return self->_isPaused;
}

- (void)setIsPaused:(BOOL)a3
{
}

- (void)setIsPaused:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v7);

  if (self->_isPaused != v4)
  {
    int v10 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v20 = "-[IXSCoordinatedAppInstall setIsPaused:completion:]";
      if (v4) {
        int v12 = 89;
      }
      else {
        int v12 = 78;
      }
      __int16 v21 = 2112;
      __int16 v22 = self;
      __int16 v23 = 1024;
      int v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: %@: setting isPaused to %c", buf, 0x1Cu);
    }

    self->_isPaused = v4;
    if (v4) {
      -[IXSCoordinatedAppInstall _onQueue_pauseProgress](self, "_onQueue_pauseProgress");
    }
    else {
      -[IXSCoordinatedAppInstall _onQueue_resumeProgress](self, "_onQueue_resumeProgress");
    }
    -[IXSCoordinatedAppInstall _onQueue_saveState](self, "_onQueue_saveState");
    id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall delegateCallQueue](self, "delegateCallQueue"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100049684;
    v14[3] = &unk_1000CE370;
    BOOL v16 = v4;
    void v14[4] = self;
    id v15 = v6;
    sub_10005A8F0(v13, v14);

    id v9 = v15;
    goto LABEL_13;
  }

  if (v6)
  {
    int v8 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall delegateCallQueue](self, "delegateCallQueue"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100049674;
    v17[3] = &unk_1000CD030;
    id v18 = v6;
    sub_10005A8F0(v8, v17);

    id v9 = v18;
LABEL_13:
  }
}

- (void)externalSetIsPaused:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100049798;
  block[3] = &unk_1000CE370;
  BOOL v11 = a3;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(v7, block);
}

- (BOOL)externalGetIsPaused
{
  v2 = self;
  uint64_t v6 = 0LL;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000LL;
  char v9 = 0;
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472LL;
  v5[2] = sub_100049864;
  v5[3] = &unk_1000CCEF8;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);

  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (void)setImportance:(unint64_t)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  if (a3 - 5 >= 0xFFFFFFFFFFFFFFFCLL)
  {
    unint64_t importance = self->_importance;
    if (importance != a3)
    {
      uint64_t v7 = sub_1000047B4((uint64_t)off_1000E8CA0);
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        char v9 = IXStringForCoordinatorImportance(a3);
        id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        int v16 = 136315650;
        id v17 = "-[IXSCoordinatedAppInstall setImportance:]";
        __int16 v18 = 2112;
        id v19 = self;
        __int16 v20 = 2112;
        __int16 v21 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "%s: %@: setting importance to %@",  (uint8_t *)&v16,  0x20u);
      }

      self->_unint64_t importance = a3;
      unsigned int v11 = +[IXFeatureFlags scheduledUpdatesEnabled](&OBJC_CLASS___IXFeatureFlags, "scheduledUpdatesEnabled");
      if (a3 != 4 && v11 && (id)-[IXSCoordinatedAppInstall updateScheduleState](self, "updateScheduleState") == (id)1)
      {
        int v12 = (void *)objc_claimAutoreleasedReturnValue(+[IXSAppUpdateScheduler sharedInstance](&OBJC_CLASS___IXSAppUpdateScheduler, "sharedInstance"));
        id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall uniqueIdentifier](self, "uniqueIdentifier"));
        [v12 removeUpdateRequestForCoordinatorUUID:v13];

        -[IXSCoordinatedAppInstall setUpdateScheduleState:](self, "setUpdateScheduleState:", 0LL);
      }

      if (a3 != 1
        && a3 != 4
        && importance <= 4
        && ((1LL << importance) & 0x13) != 0
        && (id)-[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent") == (id)2
        && (id)-[IXSCoordinatedAppInstall placeholderInstallState](self, "placeholderInstallState") == (id)6)
      {
        uint64_t v14 = sub_1000047B4((uint64_t)off_1000E8CA0);
        id v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = 136315394;
          id v17 = "-[IXSCoordinatedAppInstall setImportance:]";
          __int16 v18 = 2112;
          id v19 = self;
          _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s: Converting coordinator to user-initiated: %@",  (uint8_t *)&v16,  0x16u);
        }

        -[IXSCoordinatedAppInstall setPlaceholderInstallState:](self, "setPlaceholderInstallState:", 0LL);
      }

      -[IXSCoordinatedAppInstall _onQueue_saveState](self, "_onQueue_saveState");
      -[IXSCoordinatedAppInstall _onQueue_checkState](self, "_onQueue_checkState");
    }
  }

- (unint64_t)importance
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  return self->_importance;
}

- (unint64_t)newRemovability
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  return self->_newRemovability;
}

- (void)setNewRemovability:(unint64_t)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  self->_newRemovability = a3;
  -[IXSCoordinatedAppInstall _onQueue_saveState](self, "_onQueue_saveState");
}

- (unint64_t)newRemovabilityClient
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  return self->_newRemovabilityClient;
}

- (void)setNewRemovabilityClient:(unint64_t)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  self->_newRemovabilityClient = a3;
  -[IXSCoordinatedAppInstall _onQueue_saveState](self, "_onQueue_saveState");
}

- (unint64_t)savedRemovability
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  return self->_savedRemovability;
}

- (void)setSavedRemovability:(unint64_t)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  self->_savedRemovability = a3;
  -[IXSCoordinatedAppInstall _onQueue_saveState](self, "_onQueue_saveState");
}

- (unint64_t)savedRemovabilityClient
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  return self->_savedRemovabilityClient;
}

- (void)setSavedRemovabilityClient:(unint64_t)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  self->_savedRemovabilityClient = a3;
  -[IXSCoordinatedAppInstall _onQueue_saveState](self, "_onQueue_saveState");
}

- (void)setNewRemovabilityState:(unint64_t)a3 removabilityClient:(unint64_t)a4
{
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v7);

  if (*(_OWORD *)&self->_newRemovability != __PAIR128__(a4, a3))
  {
    self->_newRemovability = a3;
    self->_newRemovabilityClient = a4;
    -[IXSCoordinatedAppInstall _onQueue_saveState](self, "_onQueue_saveState");
  }

- (void)setPriorityBoostCompletion:(id)a3 withSourceInfo:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (NSString *)a4;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v8);

  id priorityBoostCompletion = self->_priorityBoostCompletion;
  if (priorityBoostCompletion != v6)
  {
    id v10 = objc_retainBlock(priorityBoostCompletion);
    if (v10)
    {
      unsigned int v11 = self->_priorityBoostSourceInfo;
      int v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v22 = "-[IXSCoordinatedAppInstall setPriorityBoostCompletion:withSourceInfo:]";
        __int16 v23 = 2112;
        int v24 = self;
        __int16 v25 = 2112;
        id v26 = v11;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: %@: Disposing of %@", buf, 0x20u);
      }

      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall delegateCallQueue](self, "delegateCallQueue"));
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472LL;
      v19[2] = sub_100049FA4;
      v19[3] = &unk_1000CD030;
      id v20 = v10;
      sub_10005A8F0(v14, v19);
    }

    if (v6)
    {
      id v15 = sub_1000047B4((uint64_t)off_1000E8CA0);
      int v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v22 = "-[IXSCoordinatedAppInstall setPriorityBoostCompletion:withSourceInfo:]";
        __int16 v23 = 2112;
        int v24 = self;
        __int16 v25 = 2112;
        id v26 = v7;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: %@: Retaining %@", buf, 0x20u);
      }
    }

    id v17 = objc_retainBlock(v6);
    id v18 = self->_priorityBoostCompletion;
    self->_id priorityBoostCompletion = v17;

    objc_storeStrong((id *)&self->_priorityBoostSourceInfo, a4);
  }
}

- (id)priorityBoostCompletion
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  return objc_retainBlock(self->_priorityBoostCompletion);
}

- (NSString)priorityBoostSourceInfo
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  return self->_priorityBoostSourceInfo;
}

- (BOOL)shouldBeginRestoringUserData
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  if ((id)-[IXSCoordinatedAppInstall placeholderInstallState](self, "placeholderInstallState") != (id)4) {
    return 0;
  }
  id v4 = (id)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall userDataPromise](self, "userDataPromise"));
  if (v4)
  {
    id v5 = v4;
    uint64_t v18 = 0LL;
    id v19 = &v18;
    uint64_t v20 = 0x2020000000LL;
    char v21 = 0;
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v4 accessQueue]);
    int v12 = _NSConcreteStackBlock;
    uint64_t v13 = 3221225472LL;
    uint64_t v14 = sub_1000583B4;
    id v15 = &unk_1000CCEF8;
    id v16 = v5;
    id v17 = &v18;
    id v7 = v5;
    dispatch_sync(v6, &v12);

    LODWORD(v6) = *((unsigned __int8 *)v19 + 24);
    _Block_object_dispose(&v18, 8);

    if ((_DWORD)v6) {
      return 0;
    }
  }

  unint64_t v8 = -[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent", v12, v13, v14, v15);
  if (v8 == 4) {
    return 1;
  }
  if (v8 != 3) {
    return 0;
  }
  char v9 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall appAssetPromise](self, "appAssetPromise"));
  BOOL v10 = sub_100047594(v9);

  return v10;
}

- (void)prioritizeWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10004A214;
  block[3] = &unk_1000CD568;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

- (void)_onQueue_prioritizeWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  unint64_t v6 = -[IXSCoordinatedAppInstall state](self, "state");
  if (v6 != 28 && v6 != 1)
  {
    char v9 = sub_1000047B4((uint64_t)off_1000E8CA0);
    BOOL v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v18 = "-[IXSCoordinatedAppInstall _onQueue_prioritizeWithCompletion:]";
      __int16 v19 = 2112;
      uint64_t v20 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s: %@: prioritizing", buf, 0x16u);
    }

    -[IXSCoordinatedAppInstall setIsPaused:](self, "setIsPaused:", 0LL);
    -[IXSCoordinatedAppInstall setImportance:](self, "setImportance:", 3LL);
    if ((id)-[IXSCoordinatedAppInstall appInstallState](self, "appInstallState") == (id)2
      || (id)-[IXSCoordinatedAppInstall appInstallState](self, "appInstallState") == (id)1)
    {
      -[IXSCoordinatedAppInstall setTermAssertion:](self, "setTermAssertion:", 0LL);
      -[IXSCoordinatedAppInstall _onQueue_acquireAssertionAndDoInstall](self, "_onQueue_acquireAssertionAndDoInstall");
    }

    else if ((id)-[IXSCoordinatedAppInstall placeholderInstallState](self, "placeholderInstallState") == (id)2 {
           || (id)-[IXSCoordinatedAppInstall placeholderInstallState](self, "placeholderInstallState") == (id)1)
    }
    {
      -[IXSCoordinatedAppInstall setTermAssertion:](self, "setTermAssertion:", 0LL);
      -[IXSCoordinatedAppInstall _onQueue_acquireAssertionAndInstallPlaceholder]( self,  "_onQueue_acquireAssertionAndInstallPlaceholder");
    }

    unsigned int v11 = (void *)objc_claimAutoreleasedReturnValue(+[IXSCoordinatorManager sharedInstance](&OBJC_CLASS___IXSCoordinatorManager, "sharedInstance"));
    [v11 prioritizeCoordinator:self];

    int v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall delegateCallQueue](self, "delegateCallQueue"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_10004A498;
    v13[3] = &unk_1000CD568;
    v13[4] = self;
    id v14 = v4;
    sub_10005A8F0(v12, v13);

    id v8 = v14;
    goto LABEL_11;
  }

  if (v4)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall delegateCallQueue](self, "delegateCallQueue"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_10004A488;
    v15[3] = &unk_1000CD030;
    id v16 = v4;
    sub_10005A8F0(v7, v15);

    id v8 = v16;
LABEL_11:
  }
}

- (void)_onQueue_unregister
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  if (-[IXSCoordinatedAppInstall isTracked](self, "isTracked"))
  {
    id v4 = (id)objc_claimAutoreleasedReturnValue(+[IXSCoordinatorManager sharedInstance](&OBJC_CLASS___IXSCoordinatorManager, "sharedInstance"));
    [v4 unregisterCoordinator:self];
  }

- (BOOL)isComplete
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  return self->_complete;
}

- (void)setComplete:(BOOL)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  if (!self->_complete)
  {
    unint64_t v6 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[IXSCoordinatedAppInstall setComplete:]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: %@ complete!", buf, 0x16u);
    }

    if (-[IXSCoordinatedAppInstall needsPostProcessing](self, "needsPostProcessing"))
    {
      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000LL;
      __int16 v61 = sub_10003E9E8;
      __int16 v62 = sub_10003E9F8;
      id v63 = 0LL;
      v53[0] = _NSConcreteStackBlock;
      v53[1] = 3221225472LL;
      v53[2] = sub_10004AC00;
      v53[3] = &unk_1000CD080;
      void v53[4] = self;
      v53[5] = buf;
      -[IXSCoordinatedAppInstall _runAsyncBlockWithDescription:onUninstallQueue:]( self,  "_runAsyncBlockWithDescription:onUninstallQueue:",  @"Parallel placeholder cleanup after post processing",  v53);
      id v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
      char v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v10 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
        *(_DWORD *)__int128 v56 = 136315394;
        __int128 v57 = "-[IXSCoordinatedAppInstall setComplete:]";
        __int16 v58 = 2112;
        id v59 = v10;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: %@: Waiting for pending parallel placeholder uninstall to complete",  v56,  0x16u);
      }

      unsigned int v11 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue( -[IXSCoordinatedAppInstall outstandingInstallOperationsGroup]( self,  "outstandingInstallOperationsGroup"));
      dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);

      int v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
      uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
        *(_DWORD *)__int128 v56 = 136315394;
        __int128 v57 = "-[IXSCoordinatedAppInstall setComplete:]";
        __int16 v58 = 2112;
        id v59 = v14;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s: %@: Pending parallel placeholder uninstall completed on group",  v56,  0x16u);
      }

      -[IXSCoordinatedAppInstall setCompletedRecordPromise:]( self,  "setCompletedRecordPromise:",  *(void *)(*(void *)&buf[8] + 40LL));
      _Block_object_dispose(buf, 8);
    }

    -[IXSCoordinatedAppInstall setTermAssertion:](self, "setTermAssertion:", 0LL);
    id v15 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall appInstallPowerAssertion](self, "appInstallPowerAssertion"));
    [v15 invalidate];

    -[IXSCoordinatedAppInstall setAppInstallPowerAssertion:](self, "setAppInstallPowerAssertion:", 0LL);
    uint64_t v16 = objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall schedulerCallback](self, "schedulerCallback"));
    id v17 = (void *)v16;
    if (v16) {
      (*(void (**)(uint64_t))(v16 + 16))(v16);
    }
    -[IXSCoordinatedAppInstall setSchedulerCallback:](self, "setSchedulerCallback:", 0LL);
    self->_complete = a3;
    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall error](self, "error"));
    BOOL v19 = v18 == 0LL;

    uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall publishedInstallProgress](self, "publishedInstallProgress"));
    id v21 = v20;
    if (v19)
    {
      [v20 finishProgressWithState:5];

      __int16 v22 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall placeholderPromise](self, "placeholderPromise"));
      sub_10004AE48(v22);

      __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall appAssetPromise](self, "appAssetPromise"));
      sub_10004AE48(v23);

      int v24 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall userDataPromise](self, "userDataPromise"));
      sub_10004AE48(v24);

      __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall deviceSecurityPromise](self, "deviceSecurityPromise"));
      sub_10004AE48(v25);

      id v26 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall preparationPromise](self, "preparationPromise"));
      sub_10004AE48(v26);

      id v27 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall installOptionsPromise](self, "installOptionsPromise"));
      sub_10004AE48(v27);

      __int128 v51 = 0u;
      __int128 v52 = 0u;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      id v28 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall initialODRAssetPromises](self, "initialODRAssetPromises"));
      id v29 = [v28 countByEnumeratingWithState:&v49 objects:v55 count:16];
      if (v29)
      {
        uint64_t v30 = *(void *)v50;
        do
        {
          id v31 = 0LL;
          do
          {
            if (*(void *)v50 != v30) {
              objc_enumerationMutation(v28);
            }
            sub_10004AE48(*(void **)(*((void *)&v49 + 1) + 8LL * (void)v31));
            id v31 = (char *)v31 + 1;
          }

          while (v29 != v31);
          id v29 = [v28 countByEnumeratingWithState:&v49 objects:v55 count:16];
        }

        while (v29);
      }

      __int128 v47 = 0u;
      __int128 v48 = 0u;
      __int128 v45 = 0u;
      __int128 v46 = 0u;
      __int16 v32 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall essentialAssetPromises](self, "essentialAssetPromises"));
      id v33 = [v32 countByEnumeratingWithState:&v45 objects:v54 count:16];
      if (v33)
      {
        uint64_t v34 = *(void *)v46;
        do
        {
          BOOL v35 = 0LL;
          do
          {
            if (*(void *)v46 != v34) {
              objc_enumerationMutation(v32);
            }
            sub_10004AE48(*(void **)(*((void *)&v45 + 1) + 8LL * (void)v35));
            BOOL v35 = (char *)v35 + 1;
          }

          while (v33 != v35);
          id v33 = [v32 countByEnumeratingWithState:&v45 objects:v54 count:16];
        }

        while (v33);
      }

      id v36 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall seed](self, "seed"));
      unint64_t v37 = (unint64_t)[v36 intent] - 1;
      if (v37 > 6) {
        uint64_t v38 = 17LL;
      }
      else {
        uint64_t v38 = qword_1000953D8[v37];
      }
      id v39 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
      id v40 = (void *)objc_claimAutoreleasedReturnValue([v39 bundleID]);
      +[AITransactionLog logStep:byParty:phase:success:forBundleID:description:]( &OBJC_CLASS___AITransactionLog,  "logStep:byParty:phase:success:forBundleID:description:",  v38,  4LL,  2LL,  1LL,  v40,  @"Coordinator completed successfully.");

      -[IXSCoordinatedAppInstall _onQueue_unregister](self, "_onQueue_unregister");
      id v41 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall completedRecordPromise](self, "completedRecordPromise"));
      id v42 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall delegateCallQueue](self, "delegateCallQueue"));
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472LL;
      v43[2] = sub_10004AED4;
      v43[3] = &unk_1000CCCB8;
      void v43[4] = self;
      id v44 = v41;
      id v21 = v41;
      sub_10005A8F0(v42, v43);
    }

    else
    {
      [v20 finishProgressWithState:4];
    }

    -[IXSCoordinatedAppInstall setPriorityBoostCompletion:withSourceInfo:]( self,  "setPriorityBoostCompletion:withSourceInfo:",  0LL,  0LL);
    -[IXSCoordinatedAppInstall setCompletedRecordPromise:](self, "setCompletedRecordPromise:", 0LL);
  }

- (BOOL)placeholderIsInstalled
{
  return -[IXSCoordinatedAppInstall _placeholderOrParallelPlaceholderIsInstalledWithRecord:]( self,  "_placeholderOrParallelPlaceholderIsInstalledWithRecord:",  0LL);
}

- (BOOL)_placeholderOrParallelPlaceholderIsInstalledWithRecord:(id *)a3
{
  id v5 = objc_alloc(&OBJC_CLASS___LSApplicationRecord);
  unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 bundleID]);
  id v14 = 0LL;
  id v8 = -[LSApplicationRecord initForInstallMachineryWithBundleIdentifier:placeholder:error:]( v5,  "initForInstallMachineryWithBundleIdentifier:placeholder:error:",  v7,  1LL,  &v14);
  id v9 = v14;

  if (v8)
  {
    if (a3) {
      *a3 = v8;
    }
    unsigned __int8 v10 = [v8 isPlaceholder];
  }

  else
  {
    unsigned int v11 = sub_1000047B4((uint64_t)off_1000E8CA0);
    int v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      sub_100080EAC();
    }

    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (void)_asyncUpdatePlaceholderMetadataWithInstallType:(unint64_t)a3 reason:(int64_t)a4 underlyingError:(id)a5 client:(unint64_t)a6
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10004B0BC;
  v8[3] = &unk_1000CE398;
  unint64_t v11 = a3;
  int64_t v12 = a4;
  id v9 = self;
  id v10 = a5;
  unint64_t v13 = a6;
  id v7 = v10;
  -[IXSCoordinatedAppInstall _runAsyncBlockWithDescription:onLaunchServicesQueue:]( v9,  "_runAsyncBlockWithDescription:onLaunchServicesQueue:",  @"placeholder metadata update",  v8);
}

- (void)_onQueue_updatePlaceholderForFailureReason:(id)a3 client:(unint64_t)a4 installType:(unint64_t)a5
{
  id v8 = a3;
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v9);

  id v20 = v8;
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v20 domain]);
  LODWORD(v9) = [v10 isEqualToString:@"IXUserPresentableErrorDomain"];

  if ((_DWORD)v9)
  {
    uint64_t v11 = (uint64_t)[v20 code];
    int64_t v12 = (void *)objc_claimAutoreleasedReturnValue([v20 userInfo]);
    unint64_t v13 = (void *)objc_claimAutoreleasedReturnValue([v12 objectForKeyedSubscript:NSUnderlyingErrorKey]);
  }

  else
  {
    uint64_t v11 = 1LL;
    unint64_t v13 = v20;
  }

  unint64_t v14 = -[IXSCoordinatedAppInstall placeholderInstallState](self, "placeholderInstallState");
  if (v14 - 1 >= 2)
  {
    if (v14 == 3 || -[IXSCoordinatedAppInstall placeholderIsInstalled](self, "placeholderIsInstalled")) {
      -[IXSCoordinatedAppInstall _asyncUpdatePlaceholderMetadataWithInstallType:reason:underlyingError:client:]( self,  "_asyncUpdatePlaceholderMetadataWithInstallType:reason:underlyingError:client:",  a5,  v11,  v13,  a4);
    }
  }

  else
  {
    id v15 = objc_opt_new(&OBJC_CLASS___IXSPlaceholderFailureInfo);
    -[IXSCoordinatedAppInstall setPlaceholderFailureInfo:](self, "setPlaceholderFailureInfo:", v15);

    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall placeholderFailureInfo](self, "placeholderFailureInfo"));
    [v16 setInstallType:a5];

    id v17 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall placeholderFailureInfo](self, "placeholderFailureInfo"));
    [v17 setReason:v11];

    uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall placeholderFailureInfo](self, "placeholderFailureInfo"));
    [v18 setUnderlyingError:v13];

    BOOL v19 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall placeholderFailureInfo](self, "placeholderFailureInfo"));
    [v19 setClient:a4];
  }
}

- (void)setCompletedRecordPromise:(id)a3
{
  id v8 = (LSRecordPromise *)a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  completedRecordPromise = self->_completedRecordPromise;
  p_completedRecordPromise = &self->_completedRecordPromise;
  if (completedRecordPromise != v8) {
    objc_storeStrong((id *)p_completedRecordPromise, a3);
  }
}

- (LSRecordPromise)completedRecordPromise
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  return self->_completedRecordPromise;
}

- (BOOL)_shouldRemovePlaceholderForReason:(id)a3
{
  id v3 = a3;
  id v4 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
  if ([v4 isEqualToString:@"IXUserPresentableErrorDomain"]
    && [v3 code] == (id)3)
  {
    BOOL v5 = 1;
  }

  else
  {
    unint64_t v6 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
    if ([v6 isEqualToString:@"IXUserPresentableErrorDomain"]
      && [v3 code] == (id)5)
    {
      BOOL v5 = 1;
    }

    else
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
      if ([v7 isEqualToString:@"IXUserPresentableErrorDomain"]
        && [v3 code] == (id)6)
      {
        BOOL v5 = 1;
      }

      else
      {
        id v8 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
        if ([v8 isEqualToString:@"IXUserPresentableErrorDomain"]
          && [v3 code] == (id)13)
        {
          BOOL v5 = 1;
        }

        else
        {
          id v9 = (void *)objc_claimAutoreleasedReturnValue([v3 domain]);
          else {
            BOOL v5 = 0;
          }
        }
      }
    }
  }

  return v5;
}

- (void)_onQueue_handleAppAssetPromiseCancellationWhenRestoringWithReason:(id)a3 client:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v7);

  if (-[IXSCoordinatedAppInstall _shouldRemovePlaceholderForReason:](self, "_shouldRemovePlaceholderForReason:", v6))
  {
    -[IXSCoordinatedAppInstall _onQueue_internal_cancelForReason:client:]( self,  "_onQueue_internal_cancelForReason:client:",  v6,  a4);
  }

  else
  {
    id v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      unint64_t v13 = "-[IXSCoordinatedAppInstall _onQueue_handleAppAssetPromiseCancellationWhenRestoringWithReason:client:]";
      __int16 v14 = 2112;
      id v15 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEFAULT,  "%s: %@: Converting restoring to restoring demoted after app asset promise cancelation",  buf,  0x16u);
    }

    -[IXSCoordinatedAppInstall setEffectiveIntent:](self, "setEffectiveIntent:", 4LL);
    self->_appAssetPromiseDRI = -[IXSCoordinatedAppInstall creator](self, "creator");
    -[IXSCoordinatedAppInstall _internal_setAppAssetPromise:](self, "_internal_setAppAssetPromise:", 0LL);
    -[IXSCoordinatedAppInstall _internal_setInstallOptionsPromise:](self, "_internal_setInstallOptionsPromise:", 0LL);
    -[IXSCoordinatedAppInstall _onQueue_saveState](self, "_onQueue_saveState");
    -[IXSCoordinatedAppInstall _onQueue_checkState](self, "_onQueue_checkState");
    if (!-[IXSCoordinatedAppInstall sentBeginRestoringUserData](self, "sentBeginRestoringUserData")
      && -[IXSCoordinatedAppInstall shouldBeginRestoringUserData](self, "shouldBeginRestoringUserData"))
    {
      -[IXSCoordinatedAppInstall setSentBeginRestoringUserData:](self, "setSentBeginRestoringUserData:", 1LL);
      id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall delegateCallQueue](self, "delegateCallQueue"));
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_10004B770;
      v11[3] = &unk_1000CCE58;
      void v11[4] = self;
      sub_10005A8F0(v10, v11);
    }

    -[IXSCoordinatedAppInstall _onQueue_updatePlaceholderForFailureReason:client:installType:]( self,  "_onQueue_updatePlaceholderForFailureReason:client:installType:",  v6,  a4,  7LL);
  }
}

- (void)_onQueue_removeParallelPlaceholder:(BOOL *)a3
{
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  if ((char *)-[IXSCoordinatedAppInstall placeholderInstallState](self, "placeholderInstallState") - 3 <= (char *)1)
  {
    id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
    id v7 = IXStringForClientID(-[IXSCoordinatedAppInstall creator](self, "creator"));
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    id v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cleaning up parallel placeholder for %@ after failure (coordinator creator: %@)",  v6,  v8));

    if (a3) {
      *a3 = 1;
    }
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472LL;
    v11[2] = sub_10004B8C8;
    v11[3] = &unk_1000CCCB8;
    void v11[4] = self;
    id v12 = v9;
    id v10 = v9;
    -[IXSCoordinatedAppInstall _runAsyncBlockWithDescription:onUninstallQueue:]( self,  "_runAsyncBlockWithDescription:onUninstallQueue:",  @"Parallel placeholder cleanup after failure",  v11);
  }

- (BOOL)_onQueue_shouldDeletePlaceholderOnCancelationForReason:(id)a3 client:(unint64_t)a4
{
  id v6 = a3;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v7);

  unint64_t v8 = -[IXSCoordinatedAppInstall placeholderDisposition](self, "placeholderDisposition");
  if (v8 == 3)
  {
    BOOL v9 = 0;
  }

  else if (v8 == 2 {
         || a4 == 8
  }
         || -[IXSCoordinatedAppInstall _shouldRemovePlaceholderForReason:]( self,  "_shouldRemovePlaceholderForReason:",  v6))
  {
    BOOL v9 = 1;
  }

  else
  {
    uint64_t v17 = 0LL;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2020000000LL;
    char v20 = 0;
    if ((id)-[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent") == (id)1)
    {
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall placeholderPromise](self, "placeholderPromise"));
      id v12 = v11;
      if (v11)
      {
        unint64_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v11 accessQueue]);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472LL;
        v14[2] = sub_10004BBA4;
        v14[3] = &unk_1000CD080;
        id v15 = v12;
        uint64_t v16 = &v17;
        dispatch_sync(v13, v14);
      }
    }

    BOOL v9 = *((_BYTE *)v18 + 24) != 0;
    _Block_object_dispose(&v17, 8);
  }

  return v9;
}

- (void)_onQueue_cancelPlaceholderIfNeededForReason:(id)a3 client:(unint64_t)a4 needsLSDatabaseSync:(BOOL *)a5
{
  id v8 = a3;
  BOOL v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v9);

  unint64_t v10 = -[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent");
  switch(v10)
  {
    case 1uLL:
    case 3uLL:
      unint64_t v15 = -[IXSCoordinatedAppInstall placeholderDisposition](self, "placeholderDisposition");
      unsigned int v16 = -[IXSCoordinatedAppInstall needsPostProcessing](self, "needsPostProcessing");
      unint64_t v17 = -[IXSCoordinatedAppInstall appInstallState](self, "appInstallState");
      if (!-[IXSCoordinatedAppInstall _onQueue_shouldDeletePlaceholderOnCancelationForReason:client:]( self,  "_onQueue_shouldDeletePlaceholderOnCancelationForReason:client:",  v8,  a4))
      {
        if (v17 == 4) {
          unsigned int v27 = v16;
        }
        else {
          unsigned int v27 = 0;
        }
        if (v10 == 1 || v27) {
          -[IXSCoordinatedAppInstall _onQueue_removeParallelPlaceholder:]( self,  "_onQueue_removeParallelPlaceholder:",  a5);
        }
        id v12 = self;
        id v13 = v8;
        unint64_t v14 = a4;
        unint64_t v11 = 7LL;
        goto LABEL_17;
      }

      unint64_t v32 = v17;
      uint64_t v18 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue([v18 bundleID]);
      char v20 = IXStringForClientID(a4);
      uint64_t v21 = objc_claimAutoreleasedReturnValue(v20);
      __int16 v22 = (void *)v21;
      if (v15 == 1)
      {
        __int16 v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cleaning up placeholder for %@ after cancelation with reason %@ client %@",  v19,  v8,  v21));
      }

      else
      {
        id v28 = IXStringForPlaceholderDisposition(v15);
        id v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
        __int16 v23 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Cleaning up placeholder for %@ after cancelation with reason %@ client %@ placeholder disposition %@",  v19,  v8,  v22,  v29));
      }

      if (a5) {
        *a5 = 1;
      }
      char v30 = v16 ^ 1;
      if (v10 != 1) {
        char v30 = 1;
      }
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472LL;
      if (v32 != 4) {
        char v30 = 1;
      }
      v33[2] = sub_10004BF38;
      v33[3] = &unk_1000CE230;
      char v35 = v30;
      v33[4] = self;
      id v34 = v23;
      id v31 = v23;
      -[IXSCoordinatedAppInstall _runAsyncBlockWithDescription:onUninstallQueue:]( self,  "_runAsyncBlockWithDescription:onUninstallQueue:",  @"placeholder cleanup after cancel",  v33);

      break;
    case 2uLL:
      -[IXSCoordinatedAppInstall _onQueue_removeParallelPlaceholder:](self, "_onQueue_removeParallelPlaceholder:", a5);
      break;
    case 4uLL:
    case 5uLL:
    case 6uLL:
      unint64_t v11 = -[IXSCoordinatedAppInstall originalInstallType](self, "originalInstallType");
      id v12 = self;
      id v13 = v8;
      unint64_t v14 = a4;
LABEL_17:
      -[IXSCoordinatedAppInstall _onQueue_updatePlaceholderForFailureReason:client:installType:]( v12,  "_onQueue_updatePlaceholderForFailureReason:client:installType:",  v13,  v14,  v11);
      break;
    case 7uLL:
      break;
    default:
      int v24 = sub_1000047B4((uint64_t)off_1000E8CA0);
      __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        if (v10 < 8 && ((0xE3u >> v10) & 1) != 0) {
          id v26 = *(&off_1000CE5B0 + v10);
        }
        else {
          id v26 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown intent value %lu",  v10));
        }
        *(_DWORD *)buf = 136315394;
        unint64_t v37 = "-[IXSCoordinatedAppInstall _onQueue_cancelPlaceholderIfNeededForReason:client:needsLSDatabaseSync:]";
        __int16 v38 = 2112;
        id v39 = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s: Unexpected intent: %@", buf, 0x16u);
      }

      break;
  }
}

- (BOOL)cancelForReason:(id)a3 client:(unint64_t)a4 needsLSDatabaseSync:(BOOL *)a5 error:(id *)a6
{
  id v10 = a3;
  unint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_not_V2(v11);

  uint64_t v21 = 0LL;
  __int16 v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = 0;
  id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472LL;
  v15[2] = sub_10004C1E0;
  v15[3] = &unk_1000CE3C0;
  void v15[4] = self;
  id v16 = v10;
  unint64_t v17 = &v21;
  unint64_t v18 = a4;
  uint64_t v19 = a5;
  char v20 = a6;
  id v13 = v10;
  dispatch_sync(v12, v15);

  LOBYTE(a5) = *((_BYTE *)v22 + 24);
  _Block_object_dispose(&v21, 8);
  return (char)a5;
}

- (BOOL)cancelForReason:(id)a3 client:(unint64_t)a4 error:(id *)a5
{
  return -[IXSCoordinatedAppInstall cancelForReason:client:needsLSDatabaseSync:error:]( self,  "cancelForReason:client:needsLSDatabaseSync:error:",  a3,  a4,  0LL,  a5);
}

- (id)_onQueue_localizedAppName
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue([v4 bundleID]);

  id v12 = 0LL;
  id v6 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:]( objc_alloc(&OBJC_CLASS___LSApplicationRecord),  "initWithBundleIdentifier:allowPlaceholder:error:",  v5,  1LL,  &v12);
  id v7 = v12;
  if (v6)
  {
    id v8 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord localizedName](v6, "localizedName"));
  }

  else
  {
    BOOL v9 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      unint64_t v14 = "-[IXSCoordinatedAppInstall _onQueue_localizedAppName]";
      __int16 v15 = 2112;
      id v16 = v5;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to get app record for bundleID %@ due to %@",  buf,  0x20u);
    }

    id v8 = 0LL;
  }

  return v8;
}

- (BOOL)_onQueue_internal_cancelForReason:(id)a3 client:(unint64_t)a4 needsLSDatabaseSync:(BOOL *)a5 error:(id *)a6
{
  BOOL v9 = (IXSCoordinatedAppInstall *)a3;
  id v10 = v9;
  unint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v11);

  unint64_t v12 = -[IXSCoordinatedAppInstall savedRemovability](self, "savedRemovability");
  id v13 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall seed](self, "seed"));
  id v14 = [v13 intent];

  if (!v9)
  {
    char v24 = sub_1000047B4((uint64_t)off_1000E8CA0);
    __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      sub_100080F1C();
    }

    id v27 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall _onQueue_internal_cancelForReason:client:needsLSDatabaseSync:error:]",  4847LL,  @"IXErrorDomain",  0x35uLL,  0LL,  0LL,  @"Reason passed to -[IXSCoordinatedAppInstall cancelForReason:] was nil",  v26,  v92);
    id v18 = (id)objc_claimAutoreleasedReturnValue(v27);
    uint64_t v23 = 0LL;
    __int16 v22 = 0LL;
    uint64_t v21 = 0LL;
    char v20 = 0LL;
    uint64_t v19 = 0LL;
    id v28 = 0LL;
    if (a6)
    {
      id v18 = v18;
      *a6 = v18;
    }

    goto LABEL_58;
  }

  unint64_t v97 = (unint64_t)v14;
  __int16 v15 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall error](self, "error"));

  if (!v15)
  {
    id v29 = sub_100009DB4(v9);
    char v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    id v31 = v30;
    unint64_t v32 = v9;
    if (v30)
    {
      unint64_t v32 = v30;
    }

    uint64_t v95 = v31;
    id v33 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v34 = (os_log_s *)objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      char v35 = IXStringForClientID(a4);
      id v36 = (IXSCoordinatedAppInstall *)objc_claimAutoreleasedReturnValue(v35);
      *(_DWORD *)buf = 136315906;
      v111 = "-[IXSCoordinatedAppInstall _onQueue_internal_cancelForReason:client:needsLSDatabaseSync:error:]";
      __int16 v112 = 2112;
      v113 = self;
      __int16 v114 = 2112;
      v115 = v36;
      __int16 v116 = 2112;
      v117 = v32;
      _os_log_impl( (void *)&_mh_execute_header,  v34,  OS_LOG_TYPE_DEFAULT,  "%s: %@ : canceled by client %@ for reason %@",  buf,  0x2Au);
    }

    if (v12)
    {
      unint64_t v37 = (void *)objc_claimAutoreleasedReturnValue( +[IXSAppRemovabilityManager sharedInstance]( &OBJC_CLASS___IXSAppRemovabilityManager,  "sharedInstance"));
      __int16 v38 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
      id v108 = 0LL;
      unsigned __int8 v39 = objc_msgSend( v37,  "setRemovability:forAppWithIdentity:byClient:error:",  v12,  v38,  -[IXSCoordinatedAppInstall savedRemovabilityClient](self, "savedRemovabilityClient"),  &v108);
      id v40 = (IXSCoordinatedAppInstall *)v108;

      if ((v39 & 1) == 0)
      {
        id v41 = sub_1000047B4((uint64_t)off_1000E8CA0);
        id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
          id v44 = (IXSCoordinatedAppInstall *)objc_claimAutoreleasedReturnValue([v43 bundleID]);
          __int128 v45 = IXStringForAppRemovability(v12);
          __int128 v46 = (IXSCoordinatedAppInstall *)objc_claimAutoreleasedReturnValue(v45);
          *(_DWORD *)buf = 136315906;
          v111 = "-[IXSCoordinatedAppInstall _onQueue_internal_cancelForReason:client:needsLSDatabaseSync:error:]";
          __int16 v112 = 2112;
          v113 = v44;
          __int16 v114 = 2112;
          v115 = v46;
          __int16 v116 = 2112;
          v117 = v40;
          _os_log_impl( (void *)&_mh_execute_header,  v42,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to restore removability for %@ to %@ with error: %@",  buf,  0x2Au);
        }
      }
    }

    uint64_t v96 = objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall _onQueue_localizedAppName](self, "_onQueue_localizedAppName"));
    __int128 v47 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall assertionRetryTimer](self, "assertionRetryTimer"));

    if (v47)
    {
      __int128 v48 = (dispatch_source_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall assertionRetryTimer](self, "assertionRetryTimer"));
      dispatch_source_cancel(v48);

      -[IXSCoordinatedAppInstall setAssertionRetryTimer:](self, "setAssertionRetryTimer:", 0LL);
    }

    -[IXSCoordinatedAppInstall _onQueue_cancelProgress](self, "_onQueue_cancelProgress");
    -[IXSCoordinatedAppInstall _onQueue_cancelPlaceholderIfNeededForReason:client:needsLSDatabaseSync:]( self,  "_onQueue_cancelPlaceholderIfNeededForReason:client:needsLSDatabaseSync:",  v32,  a4,  a5);
    __int128 v49 = sub_1000047B4((uint64_t)off_1000E8CA0);
    __int128 v50 = (os_log_s *)objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v51 = (IXSCoordinatedAppInstall *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
      *(_DWORD *)buf = 136315394;
      v111 = "-[IXSCoordinatedAppInstall _onQueue_internal_cancelForReason:client:needsLSDatabaseSync:error:]";
      __int16 v112 = 2112;
      v113 = v51;
      _os_log_impl( (void *)&_mh_execute_header,  v50,  OS_LOG_TYPE_DEFAULT,  "%s: %@: Waiting for pending installs to complete",  buf,  0x16u);
    }

    __int128 v52 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue( -[IXSCoordinatedAppInstall outstandingInstallOperationsGroup]( self,  "outstandingInstallOperationsGroup"));
    dispatch_group_wait(v52, 0xFFFFFFFFFFFFFFFFLL);

    __int128 v53 = sub_1000047B4((uint64_t)off_1000E8CA0);
    __int128 v54 = (os_log_s *)objc_claimAutoreleasedReturnValue(v53);
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      __int128 v55 = (IXSCoordinatedAppInstall *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
      *(_DWORD *)buf = 136315394;
      v111 = "-[IXSCoordinatedAppInstall _onQueue_internal_cancelForReason:client:needsLSDatabaseSync:error:]";
      __int16 v112 = 2112;
      v113 = v55;
      _os_log_impl( (void *)&_mh_execute_header,  v54,  OS_LOG_TYPE_DEFAULT,  "%s: %@: Pending installs completed on group",  buf,  0x16u);
    }

    -[IXSCoordinatedAppInstall setError:](self, "setError:", v32);
    -[IXSCoordinatedAppInstall setErrorSourceIdentifier:](self, "setErrorSourceIdentifier:", a4);
    -[IXSCoordinatedAppInstall setPlaceholderInstallState:](self, "setPlaceholderInstallState:", 5LL);
    -[IXSCoordinatedAppInstall setAppInstallState:](self, "setAppInstallState:", 5LL);
    -[IXSCoordinatedAppInstall setPostProcessingAssertionState:](self, "setPostProcessingAssertionState:", 5LL);
    -[IXSCoordinatedAppInstall setAppInstallPowerAssertion:](self, "setAppInstallPowerAssertion:", 0LL);
    -[IXSCoordinatedAppInstall setTermAssertion:](self, "setTermAssertion:", 0LL);
    __int128 v56 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall placeholderPromise](self, "placeholderPromise"));
    sub_100047A58(v56, v32, a4);

    __int128 v57 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall appAssetPromise](self, "appAssetPromise"));
    sub_100047A58(v57, v32, a4);

    __int16 v58 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall userDataPromise](self, "userDataPromise"));
    sub_100047A58(v58, v32, a4);

    id v59 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall deviceSecurityPromise](self, "deviceSecurityPromise"));
    sub_100047A58(v59, v32, a4);

    __int16 v60 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall preparationPromise](self, "preparationPromise"));
    sub_100047A58(v60, v32, a4);

    __int16 v61 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall installOptionsPromise](self, "installOptionsPromise"));
    sub_100047A58(v61, v32, a4);

    __int128 v106 = 0u;
    __int128 v107 = 0u;
    __int128 v104 = 0u;
    __int128 v105 = 0u;
    __int16 v62 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall initialODRAssetPromises](self, "initialODRAssetPromises"));
    id v63 = [v62 countByEnumeratingWithState:&v104 objects:v109 count:16];
    if (v63)
    {
      id v64 = v63;
      uint64_t v65 = *(void *)v105;
      do
      {
        for (i = 0LL; i != v64; i = (char *)i + 1)
        {
          if (*(void *)v105 != v65) {
            objc_enumerationMutation(v62);
          }
          sub_100047A58(*(void **)(*((void *)&v104 + 1) + 8LL * (void)i), v32, a4);
        }

        id v64 = [v62 countByEnumeratingWithState:&v104 objects:v109 count:16];
      }

      while (v64);
    }

    if (v97 >= 8) {
      __int128 v67 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown intent value %lu",  v97));
    }
    else {
      __int128 v67 = *(&off_1000CE7B0 + v97);
    }
    __int128 v68 = IXStringForClientID(a4);
    __int128 v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
    char v20 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Canceled coordinator with intent %@ by client %@ for reason %@",  v67,  v69,  v32));

    if (v97 - 1 > 6) {
      uint64_t v70 = 17LL;
    }
    else {
      uint64_t v70 = qword_1000953D8[v97 - 1];
    }
    __int128 v71 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
    __int128 v72 = (void *)objc_claimAutoreleasedReturnValue([v71 bundleID]);
    +[AITransactionLog logStep:byParty:phase:success:forBundleID:description:]( &OBJC_CLASS___AITransactionLog,  "logStep:byParty:phase:success:forBundleID:description:",  v70,  4LL,  2LL,  0LL,  v72,  v20);

    -[IXSCoordinatedAppInstall _onQueue_unregister](self, "_onQueue_unregister");
    id v73 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall domain](v32, "domain"));
    unsigned int v74 = [v73 isEqualToString:@"IXUserPresentableErrorDomain"];

    id v94 = v9;
    if (v74)
    {
      id v75 = (void *)objc_claimAutoreleasedReturnValue(+[IXSErrorPresenter sharedPresenter](&OBJC_CLASS___IXSErrorPresenter, "sharedPresenter"));
      id v76 = (void *)v96;
      if (!v96)
      {
        id v93 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
        id v76 = (void *)objc_claimAutoreleasedReturnValue([v93 bundleID]);
      }

      id v102 = 0LL;
      id v103 = 0LL;
      unsigned int v77 = [v75 localizedErrorForAppName:v76 unlocalizedError:v32 localizedError:&v103 withError:&v102];
      __int16 v22 = (IXSCoordinatedAppInstall *)v103;
      uint64_t v23 = (IXSCoordinatedAppInstall *)v102;
      if (!v96)
      {
      }

      if (v77)
      {
        __int16 v22 = v22;
        id v78 = v32;
        unint64_t v32 = v22;
        BOOL v9 = v94;
      }

      else
      {
        id v79 = sub_1000047B4((uint64_t)off_1000E8CA0);
        id v80 = (os_log_s *)objc_claimAutoreleasedReturnValue(v79);
        BOOL v9 = v94;
        if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v111 = "-[IXSCoordinatedAppInstall _onQueue_internal_cancelForReason:client:needsLSDatabaseSync:error:]";
          __int16 v112 = 2112;
          v113 = v23;
          _os_log_impl( (void *)&_mh_execute_header,  v80,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to create a localized cancel reason, proceeding with calling out to delegates with the un-localized reason : %@",  buf,  0x16u);
        }

        id v78 = v23;
        uint64_t v23 = 0LL;
      }
    }

    else
    {
      uint64_t v23 = 0LL;
      __int16 v22 = 0LL;
    }

    id v81 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall delegateCallQueue](self, "delegateCallQueue"));
    v99[0] = _NSConcreteStackBlock;
    v99[1] = 3221225472LL;
    v99[2] = sub_10004CECC;
    v99[3] = &unk_1000CD358;
    v99[4] = self;
    id v28 = v32;
    v100 = v28;
    unint64_t v101 = a4;
    sub_10005A8F0(v81, v99);

    -[IXSCoordinatedAppInstall setComplete:](self, "setComplete:", 1LL);
    v82 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall domain](v28, "domain"));
    unsigned int v83 = [v82 isEqualToString:@"IXUserPresentableErrorDomain"];

    if (v83)
    {
      id v84 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall userInfo](v28, "userInfo"));
      v85 = (void *)objc_claimAutoreleasedReturnValue([v84 objectForKeyedSubscript:NSUnderlyingErrorKey]);

      id v86 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall userInfo](v28, "userInfo"));
      id v87 = (void *)objc_claimAutoreleasedReturnValue([v86 objectForKeyedSubscript:@"AlertUser"]);
      unsigned int v88 = sub_100072D10(v87, 0LL);

      if (v88)
      {
        uint64_t v89 = (void *)objc_claimAutoreleasedReturnValue(+[IXSErrorPresenter sharedPresenter](&OBJC_CLASS___IXSErrorPresenter, "sharedPresenter"));
        id v90 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
        objc_msgSend( v89,  "presentErrorForIdentity:code:underlyingError:errorSource:",  v90,  -[IXSCoordinatedAppInstall code](v28, "code"),  v85,  a4);
      }

      id v18 = 0LL;
      uint64_t v19 = (void *)v96;
      BOOL v9 = v94;
      uint64_t v21 = v95;
    }

    else
    {
      id v18 = 0LL;
      uint64_t v21 = v95;
      uint64_t v19 = (void *)v96;
    }

- (void)_onQueue_internal_cancelForReason:(id)a3 client:(unint64_t)a4
{
}

- (void)_onQueue_internal_saveState
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  id v4 = -[NSKeyedArchiver initRequiringSecureCoding:]( objc_alloc(&OBJC_CLASS___NSKeyedArchiver),  "initRequiringSecureCoding:",  1LL);
  -[NSKeyedArchiver encodeObject:forKey:](v4, "encodeObject:forKey:", self, NSKeyedArchiveRootObjectKey);
  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSKeyedArchiver encodedData](v4, "encodedData"));

  id v6 = (void *)objc_claimAutoreleasedReturnValue( +[IXSCoordinatorManager savePathForCoordinator:]( &OBJC_CLASS___IXSCoordinatorManager,  "savePathForCoordinator:",  self));
  id v12 = 0LL;
  unsigned __int8 v7 = [v5 writeToURL:v6 options:268435457 error:&v12];
  id v8 = v12;
  if ((v7 & 1) == 0)
  {
    BOOL v9 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
      *(_DWORD *)buf = 136315906;
      id v14 = "-[IXSCoordinatedAppInstall _onQueue_internal_saveState]";
      __int16 v15 = 2112;
      id v16 = self;
      __int16 v17 = 2112;
      id v18 = v11;
      __int16 v19 = 2112;
      id v20 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to write coordinator %@ to disk at %@: %@",  buf,  0x2Au);
    }
  }
}

- (void)_onQueue_saveState
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  if (-[IXSCoordinatedAppInstall isTracked](self, "isTracked"))
  {
    -[IXSCoordinatedAppInstall _onQueue_internal_saveState](self, "_onQueue_internal_saveState");
  }

  else
  {
    id v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
    BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      unsigned __int8 v7 = "-[IXSCoordinatedAppInstall _onQueue_saveState]";
      __int16 v8 = 2112;
      BOOL v9 = self;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s: Not saving %@ because it's not tracked",  (uint8_t *)&v6,  0x16u);
    }
  }

- (BOOL)isTracked
{
  v2 = self;
  p_externalPropertyLock = &self->_externalPropertyLock;
  os_unfair_lock_lock(&self->_externalPropertyLock);
  LOBYTE(v2) = v2->_isTracked;
  os_unfair_lock_unlock(p_externalPropertyLock);
  return (char)v2;
}

- (void)setIsTracked:(BOOL)a3
{
  if (a3)
  {
    p_externalPropertyLock = &self->_externalPropertyLock;
    os_unfair_lock_lock(&self->_externalPropertyLock);
  }

  else
  {
    int v6 = (void *)objc_claimAutoreleasedReturnValue( +[IXSCoordinatorManager savePathForCoordinator:]( &OBJC_CLASS___IXSCoordinatorManager,  "savePathForCoordinator:",  self));
    p_externalPropertyLock = &self->_externalPropertyLock;
    os_unfair_lock_lock(&self->_externalPropertyLock);
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(+[IXFileManager defaultManager](&OBJC_CLASS___IXFileManager, "defaultManager"));
    id v13 = 0LL;
    unsigned __int8 v8 = [v7 removeItemAtURL:v6 error:&v13];
    id v9 = v13;

    if ((v8 & 1) == 0)
    {
      id v10 = sub_1000047B4((uint64_t)off_1000E8CA0);
      unint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        id v12 = (void *)objc_claimAutoreleasedReturnValue([v6 path]);
        *(_DWORD *)buf = 136315906;
        __int16 v15 = "-[IXSCoordinatedAppInstall setIsTracked:]";
        __int16 v16 = 2112;
        __int16 v17 = self;
        __int16 v18 = 2112;
        __int16 v19 = v12;
        __int16 v20 = 2112;
        id v21 = v9;
        _os_log_error_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_ERROR,  "%s: Failed to remove saved coordinator %@ at %@ : %@",  buf,  0x2Au);
      }
    }
  }

  self->_isTracked = a3;
  os_unfair_lock_unlock(p_externalPropertyLock);
}

- (void)_updatePendingOperationsForChangeFromPreviousState:(unint64_t)a3 toNewState:(unint64_t)a4
{
  if (!a3 && sub_10004D51C(a4))
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[IXSPendingOperationsTracker sharedInstance]( &OBJC_CLASS___IXSPendingOperationsTracker,  "sharedInstance"));
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
    [v8 beginPendingOperationForIdentity:v7];
LABEL_8:

    return;
  }

  if (sub_10004D51C(a3) && (sub_10004D51C(a4) & 1) == 0)
  {
    id v8 = (id)objc_claimAutoreleasedReturnValue( +[IXSPendingOperationsTracker sharedInstance]( &OBJC_CLASS___IXSPendingOperationsTracker,  "sharedInstance"));
    unsigned __int8 v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
    [v8 endPendingOperationForIdentity:v7];
    goto LABEL_8;
  }

- (void)setPlaceholderInstallState:(unint64_t)a3
{
}

- (void)setPlaceholderInstallState:(unint64_t)a3 withLSRecordPromiseForCompletion:(id)a4
{
  id v6 = a4;
  unsigned __int8 v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v7);

  unint64_t placeholderInstallState = self->_placeholderInstallState;
  if (placeholderInstallState != a3)
  {
    self->_unint64_t placeholderInstallState = a3;
    -[IXSCoordinatedAppInstall _updatePendingOperationsForChangeFromPreviousState:toNewState:]( self,  "_updatePendingOperationsForChangeFromPreviousState:toNewState:",  placeholderInstallState,  a3);
    if (a3 == 4)
    {
      id v9 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v17 = "-[IXSCoordinatedAppInstall setPlaceholderInstallState:withLSRecordPromiseForCompletion:]";
        __int16 v18 = 2112;
        __int16 v19 = self;
        _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: %@: Placeholder install completed.",  buf,  0x16u);
      }

      -[IXSCoordinatedAppInstall _onQueue_saveState](self, "_onQueue_saveState");
      if ((id)-[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent") != (id)6
        && (id)-[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent") != (id)7)
      {
        -[IXSCoordinatedAppInstall _onQueue_updateLoadingProgress](self, "_onQueue_updateLoadingProgress");
      }

      unint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall delegateCallQueue](self, "delegateCallQueue"));
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472LL;
      v14[2] = sub_10004D80C;
      v14[3] = &unk_1000CCCB8;
      void v14[4] = self;
      id v15 = v6;
      sub_10005A8F0(v11, v14);

      if (!-[IXSCoordinatedAppInstall sentBeginRestoringUserData](self, "sentBeginRestoringUserData")
        && -[IXSCoordinatedAppInstall shouldBeginRestoringUserData](self, "shouldBeginRestoringUserData"))
      {
        -[IXSCoordinatedAppInstall setSentBeginRestoringUserData:](self, "setSentBeginRestoringUserData:", 1LL);
        id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall delegateCallQueue](self, "delegateCallQueue"));
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472LL;
        v13[2] = sub_10004D850;
        v13[3] = &unk_1000CCE58;
        v13[4] = self;
        sub_10005A8F0(v12, v13);
      }
    }
  }
}

- (void)setAppInstallState:(unint64_t)a3
{
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  unint64_t appInstallState = self->_appInstallState;
  if (appInstallState != a3)
  {
    self->_unint64_t appInstallState = a3;
    -[IXSCoordinatedAppInstall _updatePendingOperationsForChangeFromPreviousState:toNewState:]( self,  "_updatePendingOperationsForChangeFromPreviousState:toNewState:",  appInstallState,  a3);
  }

- (id)promiseStateDescription
{
  id v3 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall placeholderPromise](self, "placeholderPromise"));
  int v4 = sub_10004DA24(v3, 80, 112, 48);

  BOOL v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall appAssetPromise](self, "appAssetPromise"));
  LODWORD(v3) = sub_10004DA24(v5, 65, 97, 49);

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall userDataPromise](self, "userDataPromise"));
  int v7 = sub_10004DA24(v6, 85, 117, 50);

  id v8 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall installOptionsPromise](self, "installOptionsPromise"));
  int v9 = sub_10004DA24(v8, 73, 105, 51);

  id v10 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall deviceSecurityPromise](self, "deviceSecurityPromise"));
  LODWORD(v8) = sub_10004DA24(v10, 83, 115, 52);

  return +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%c%c%c%c%c",  v4,  (int)v3,  v7,  v9,  (int)v8);
}

- (NSString)description
{
  id v3 = -[IXSCoordinatedAppInstall originalIntent](self, "originalIntent");
  if (v3 == (void *)-[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent"))
  {
    unint64_t v4 = -[IXSCoordinatedAppInstall originalIntent](self, "originalIntent");
    if (v4 >= 8) {
      BOOL v5 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown intent value %lu",  v4));
    }
    else {
      BOOL v5 = *(&off_1000CE7B0 + v4);
    }
  }

  else
  {
    unint64_t v6 = -[IXSCoordinatedAppInstall originalIntent](self, "originalIntent");
    if (v6 >= 8) {
      int v7 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown intent value %lu",  v6));
    }
    else {
      int v7 = *(&off_1000CE7B0 + v6);
    }
    unint64_t v8 = -[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent");
    if (v8 >= 8) {
      int v9 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown intent value %lu",  v8));
    }
    else {
      int v9 = *(&off_1000CE7B0 + v8);
    }
    uint64_t v10 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@/%@", v7, v9));

    BOOL v5 = (void *)v10;
  }

  int coordinatorScope = self->_coordinatorScope;
  if (coordinatorScope == 2)
  {
    id v14 = @"[G]";
  }

  else if (coordinatorScope == 1)
  {
    id v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall scopedToConnection](self, "scopedToConnection"));
    id v13 = (void *)objc_claimAutoreleasedReturnValue([v12 clientName]);
    id v14 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[P=%@]",  v13));
  }

  else
  {
    id v14 = (__CFString *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"[U=%hhu]",  self->_coordinatorScope));
  }

  unint64_t v15 = -[IXSCoordinatedAppInstall appAssetPromiseDRI](self, "appAssetPromiseDRI");
  unint64_t v16 = -[IXSCoordinatedAppInstall creator](self, "creator");
  __int16 v17 = (objc_class *)objc_opt_class(self);
  __int16 v18 = NSStringFromClass(v17);
  __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  __int16 v20 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
  id v21 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall uniqueIdentifier](self, "uniqueIdentifier"));
  __int16 v22 = IXStringForClientID(-[IXSCoordinatedAppInstall creator](self, "creator"));
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  if (v15 == v16)
  {
    char v24 = IXStringForCoordinatorImportance(self->_importance);
    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    unint64_t v26 = -[IXSCoordinatedAppInstall state](self, "state");
    if (v26 > 0x1C) {
      uint64_t v27 = 0LL;
    }
    else {
      uint64_t v27 = (uint64_t)*(&off_1000CE608 + v26);
    }
    id v31 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall promiseStateDescription](self, "promiseStateDescription"));
    id v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@<%p> %@ identifier:%@ uuid:%@ intent:%@ creator/appDRI:%@ importance:%@ state:%@ promise-state:%@>",  v19,  self,  v14,  v20,  v21,  v5,  v23,  v25,  v27,  v31));
  }

  else
  {
    unsigned __int8 v39 = v14;
    id v28 = v5;
    id v29 = IXStringForClientID(-[IXSCoordinatedAppInstall appAssetPromiseDRI](self, "appAssetPromiseDRI"));
    __int16 v25 = (void *)objc_claimAutoreleasedReturnValue(v29);
    char v30 = IXStringForCoordinatorImportance(self->_importance);
    id v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    unint64_t v32 = -[IXSCoordinatedAppInstall state](self, "state");
    if (v32 > 0x1C) {
      uint64_t v33 = 0LL;
    }
    else {
      uint64_t v33 = (uint64_t)*(&off_1000CE608 + v32);
    }
    char v35 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall promiseStateDescription](self, "promiseStateDescription"));
    uint64_t v38 = v33;
    unint64_t v37 = v28;
    BOOL v5 = v28;
    id v14 = v39;
    id v34 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"<%@<%p> %@ identifier:%@ uuid:%@ intent:%@ creator:%@ appDRI:%@ importance:%@ state:%@ promise-state:%@>",  v19,  self,  v39,  v20,  v21,  v37,  v23,  v25,  v31,  v38,  v35));
  }

  return (NSString *)v34;
}

- (IXApplicationIdentity)identity
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall seed](self, "seed"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 identity]);

  return (IXApplicationIdentity *)v3;
}

- (unint64_t)installationDomain
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall seed](self, "seed"));
  id v3 = [v2 installationDomain];

  return (unint64_t)v3;
}

- (NSUUID)uniqueIdentifier
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall seed](self, "seed"));
  id v3 = (void *)objc_claimAutoreleasedReturnValue([v2 uniqueIdentifier]);

  return (NSUUID *)v3;
}

- (unint64_t)creator
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall seed](self, "seed"));
  id v3 = [v2 creator];

  return (unint64_t)v3;
}

- (unint64_t)originalIntent
{
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall seed](self, "seed"));
  id v3 = [v2 intent];

  return (unint64_t)v3;
}

- (unint64_t)effectiveIntent
{
  return self->_effectiveIntent;
}

- (void)setEffectiveIntent:(unint64_t)a3
{
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  self->_effectiveIntent = a3;
}

- (unsigned)coordinatorScope
{
  v2 = self;
  p_externalPropertyLock = &self->_externalPropertyLock;
  os_unfair_lock_lock(&self->_externalPropertyLock);
  LOBYTE(v2) = v2->_coordinatorScope;
  os_unfair_lock_unlock(p_externalPropertyLock);
  return v2;
}

- (void)setCoordinatorScope:(unsigned __int8)a3
{
  int v3 = a3;
  BOOL v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  os_unfair_lock_lock(&self->_externalPropertyLock);
  if (self->_coordinatorScope == v3)
  {
    os_unfair_lock_unlock(&self->_externalPropertyLock);
  }

  else
  {
    self->_int coordinatorScope = v3;
    os_unfair_lock_unlock(&self->_externalPropertyLock);
    -[IXSCoordinatedAppInstall _onQueue_saveState](self, "_onQueue_saveState");
  }

- (IXSClientConnection)scopedToConnection
{
  p_externalPropertyLock = &self->_externalPropertyLock;
  os_unfair_lock_lock(&self->_externalPropertyLock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scopedToConnection);
  os_unfair_lock_unlock(p_externalPropertyLock);
  return (IXSClientConnection *)WeakRetained;
}

- (void)setScopedToConnection:(id)a3
{
  p_externalPropertyLock = &self->_externalPropertyLock;
  id v5 = a3;
  os_unfair_lock_lock(p_externalPropertyLock);
  objc_storeWeak((id *)&self->_scopedToConnection, v5);

  os_unfair_lock_unlock(p_externalPropertyLock);
}

- (NSSet)promiseUUIDs
{
  int v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_not_V2(v3);

  unint64_t v4 = objc_opt_new(&OBJC_CLASS___NSMutableSet);
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  int v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472LL;
  unint64_t v11 = sub_10004E1EC;
  id v12 = &unk_1000CCCB8;
  id v13 = self;
  id v14 = v4;
  unint64_t v6 = v4;
  dispatch_sync(v5, &v9);

  id v7 = -[NSMutableSet copy](v6, "copy", v9, v10, v11, v12, v13);
  return (NSSet *)v7;
}

- (IXProgressHint)progressHintWithDefault
{
  int v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  unint64_t v4 = self->_progressHint;
  if (v4)
  {
    id v5 = v4;
  }

  else
  {
    unsigned int v6 = -[IXSCoordinatedAppInstall needsPostProcessing](self, "needsPostProcessing");
    if (v6) {
      id v7 = &off_1000D6D50;
    }
    else {
      id v7 = &off_1000D6D80;
    }
    if (v6) {
      unint64_t v8 = &off_1000D6D68;
    }
    else {
      unint64_t v8 = &off_1000D6D98;
    }
    int v9 = objc_opt_new(&OBJC_CLASS___IXProgressHint);
    id v15 = 0LL;
    unsigned __int8 v10 = -[IXProgressHint setPhaseProportionsForLoadingPhase:installingPhase:postProcessingPhase:error:]( v9,  "setPhaseProportionsForLoadingPhase:installingPhase:postProcessingPhase:error:",  &off_1000D6D38,  v7,  v8,  &v15);
    id v11 = v15;
    if ((v10 & 1) == 0)
    {
      id v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v17 = "-[IXSCoordinatedAppInstall progressHintWithDefault]";
        __int16 v18 = 2112;
        id v19 = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEFAULT,  "%s: Failed to set default installation phase proportions: %@",  buf,  0x16u);
      }
    }

    id v5 = v9;
  }

  return v5;
}

- (IXProgressHint)progressHint
{
  int v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  return self->_progressHint;
}

- (void)setProgressHint:(id)a3
{
  unint64_t v4 = (IXProgressHint *)a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  unsigned int v6 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    unsigned __int8 v10 = "-[IXSCoordinatedAppInstall setProgressHint:]";
    __int16 v11 = 2112;
    id v12 = self;
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "%s: %@: setting progress hint to %@",  (uint8_t *)&v9,  0x20u);
  }

  progressHint = self->_progressHint;
  self->_progressHint = v4;
}

- (BOOL)currentProgressPhaseIsComplete
{
  int v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  return self->_currentProgressPhaseIsComplete;
}

- (void)setCurrentProgressPhaseIsComplete:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  self->_currentProgressPhaseIsComplete = v3;
  if (v3)
  {
    cachedCurrentPhaseProgress = self->_cachedCurrentPhaseProgress;
    self->_cachedCurrentPhaseProgress = 0LL;
  }

- (void)_pauseProgressObject:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472LL;
    v6[2] = sub_10004EDB4;
    v6[3] = &unk_1000CCE58;
    id v7 = v4;
    -[IXSCoordinatedAppInstall _runAsyncBlockWithDescription:onLaunchServicesQueue:]( self,  "_runAsyncBlockWithDescription:onLaunchServicesQueue:",  @"Pause progress",  v6);
  }
}

- (void)_onQueue_pauseProgress
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10004EE54;
  v4[3] = &unk_1000CE3E8;
  v4[4] = self;
  -[IXSCoordinatedAppInstall _onQueue_fetchProgressAndRun:](self, "_onQueue_fetchProgressAndRun:", v4);
}

- (void)_onQueue_resumeProgress
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  -[IXSCoordinatedAppInstall _onQueue_fetchProgressAndRun:](self, "_onQueue_fetchProgressAndRun:", &stru_1000CE428);
}

- (void)_onQueue_cancelProgress:(id)a3
{
  id v6 = a3;
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v4);

  if (v6)
  {
    [v6 setInstallState:4];
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
    [v5 installPhaseFinishedForProgress:v6];
  }

  -[IXSCoordinatedAppInstall setCoordinatorProgress:](self, "setCoordinatorProgress:", 0LL);
  -[IXSCoordinatedAppInstall setCurrentProgressPhaseIsComplete:](self, "setCurrentProgressPhaseIsComplete:", 1LL);
}

- (void)_onQueue_cancelProgress
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10004EFE0;
  v4[3] = &unk_1000CE3E8;
  v4[4] = self;
  -[IXSCoordinatedAppInstall _onQueue_fetchProgressAndRun:](self, "_onQueue_fetchProgressAndRun:", v4);
}

- (void)_onQueue_finishProgress:(id)a3
{
  id v9 = a3;
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v4);

  if (v9)
  {
    [v9 setInstallState:5];
    id v5 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
    [v5 installPhaseFinishedForProgress:v9];
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall coordinatorProgress](self, "coordinatorProgress"));
  [v6 finishPostProcessing];

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall coordinatorProgress](self, "coordinatorProgress"));
  [v7 finishInstalling];

  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall coordinatorProgress](self, "coordinatorProgress"));
  [v8 finishLoading];

  -[IXSCoordinatedAppInstall setCurrentProgressPhaseIsComplete:](self, "setCurrentProgressPhaseIsComplete:", 1LL);
}

- (void)_onQueue_finishProgress
{
  BOOL v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_10004F130;
  v4[3] = &unk_1000CE3E8;
  v4[4] = self;
  -[IXSCoordinatedAppInstall _onQueue_fetchProgressAndRun:](self, "_onQueue_fetchProgressAndRun:", v4);
}

- (void)_onQueue_fetchProgressAndRun:(id)a3
{
  id v6 = a3;
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v4);

  if (-[IXSCoordinatedAppInstall needsPostProcessing](self, "needsPostProcessing")
    && -[IXSCoordinatedAppInstall sentBeginPostProcessing](self, "sentBeginPostProcessing"))
  {
    uint64_t v5 = 2LL;
  }

  else
  {
    uint64_t v5 = 0LL;
  }

  -[IXSCoordinatedAppInstall _onQueue_fetchProgressForPhase:andRun:]( self,  "_onQueue_fetchProgressForPhase:andRun:",  v5,  v6);
}

- (void)_onQueue_fetchProgressForPhase:(unint64_t)a3 andRun:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v7);

  if (-[IXSCoordinatedAppInstall currentProgressPhaseIsComplete](self, "currentProgressPhaseIsComplete"))
  {
    v6[2](v6, 0LL);
    goto LABEL_8;
  }

  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall cachedCurrentPhaseProgress](self, "cachedCurrentPhaseProgress"));

  if (v8)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall cachedCurrentPhaseProgress](self, "cachedCurrentPhaseProgress"));
    ((void (**)(id, void *))v6)[2](v6, v9);
LABEL_7:

    goto LABEL_8;
  }

  unsigned __int8 v10 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall pendingProgressRequests](self, "pendingProgressRequests"));

  if (v10)
  {
    id v9 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall pendingProgressRequests](self, "pendingProgressRequests"));
    __int16 v11 = objc_retainBlock(v6);
    [v9 addObject:v11];

    goto LABEL_7;
  }

  id v12 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  -[IXSCoordinatedAppInstall setPendingProgressRequests:](self, "setPendingProgressRequests:", v12);

  uint64_t v23 = 0LL;
  char v24 = &v23;
  uint64_t v25 = 0x2020000000LL;
  uint64_t v26 = 0LL;
  if ((id)-[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent") == (id)5)
  {
    v24[3] = 10LL;
  }

  else
  {
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall placeholderPromise](self, "placeholderPromise"));

    if (v13)
    {
      id v14 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall placeholderPromise](self, "placeholderPromise"));
      id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v14 accessQueue]);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10004F42C;
      block[3] = &unk_1000CCEF8;
      void block[4] = self;
      void block[5] = &v23;
      dispatch_sync(v15, block);
    }
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472LL;
  v17[2] = sub_10004F474;
  v17[3] = &unk_1000CE450;
  void v17[4] = self;
  __int16 v20 = &v23;
  unint64_t v21 = a3;
  id v16 = (id)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall progressHintWithDefault](self, "progressHintWithDefault"));
  id v18 = v16;
  id v19 = v6;
  -[IXSCoordinatedAppInstall _runAsyncBlockWithDescription:onLaunchServicesQueue:]( self,  "_runAsyncBlockWithDescription:onLaunchServicesQueue:",  @"Initiate and fetch progress",  v17);

  _Block_object_dispose(&v23, 8);
LABEL_8:
}

- (void)_runWithProgress:(id)a3 block:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unint64_t v8 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472LL;
  v11[2] = sub_10004F63C;
  v11[3] = &unk_1000CE478;
  id v12 = v6;
  __int16 v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  sub_10005A8F0(v8, v11);
}

- (void)_limitedConcurrency_setUpLSProgressForInstallType:(unint64_t)a3 progressHint:(id)a4
{
  id v6 = a4;
  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
  unint64_t v8 = (IXSCoordinatedAppInstall *)objc_claimAutoreleasedReturnValue([v7 bundleID]);

  id v9 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  [v9 initiateProgressForApp:v8 withType:a3];
  id v10 = (void *)objc_claimAutoreleasedReturnValue([v6 progressProportionsDictionaryForLaunchServices]);

  id v16 = 0LL;
  unsigned __int8 v11 = [v9 setProgressProportionsByPhase:v10 forInstallOfApplicationWithIdentifier:v8 error:&v16];
  id v12 = v16;
  __int16 v13 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue(v13);
  id v15 = v14;
  if ((v11 & 1) != 0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v18 = "-[IXSCoordinatedAppInstall _limitedConcurrency_setUpLSProgressForInstallType:progressHint:]";
      __int16 v19 = 2112;
      __int16 v20 = self;
      __int16 v21 = 2112;
      __int16 v22 = v10;
      _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEFAULT,  "%s: %@: Set progress proportions to %@",  buf,  0x20u);
    }
  }

  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315906;
    id v18 = "-[IXSCoordinatedAppInstall _limitedConcurrency_setUpLSProgressForInstallType:progressHint:]";
    __int16 v19 = 2112;
    __int16 v20 = v8;
    __int16 v21 = 2112;
    __int16 v22 = v10;
    __int16 v23 = 2112;
    id v24 = v12;
    _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s: Failed to set install phase progress proportions on LS for bundleID %@ to %@: %@",  buf,  0x2Au);
  }
}

- (id)_limitedConcurrency_fetchLSProgressForPhase:(unint64_t)a3 appRecord:(id)a4
{
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue([a4 compatibilityObject]);
  id v6 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](&OBJC_CLASS___LSApplicationWorkspace, "defaultWorkspace"));
  id v7 = (void *)objc_claimAutoreleasedReturnValue([v6 installProgressForApplication:v5 withPhase:a3]);

  if (v7)
  {
    [v7 setInstallState:1];
    id v8 = v7;
  }

  else
  {
    id v9 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100081024();
    }
  }

  return v7;
}

- (void)_limitedConcurrency_saveOriginalInstallTypeForAppRecord:(id)a3
{
  id v4 = [a3 installType];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10004FAD4;
  v6[3] = &unk_1000CCBD8;
  void v6[4] = self;
  v6[5] = v4;
  sub_10005A8F0(v5, v6);
}

- (void)_onQueue_configureTotalUnitCountsForInstallProgress:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall progressHintWithDefault](self, "progressHintWithDefault"));
  id v7 = (id)objc_claimAutoreleasedReturnValue([v5 progressProportionsDictionaryForLaunchServices]);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_10004FBAC;
  v8[3] = &unk_1000CE4A0;
  id v9 = v4;
  id v6 = v4;
  [v7 enumerateKeysAndObjectsUsingBlock:v8];
}

- (void)_onQueue_setInstallProgressPercentComplete:(double)a3 forPhase:(unint64_t)a4
{
  id v6 = (id)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall publishedInstallProgress](self, "publishedInstallProgress"));
  objc_msgSend( v6,  "setCompletedUnitCount:forPhase:",  (unint64_t)((double)(unint64_t)objc_msgSend(v6, "totalUnitCountForPhase:", a4) * a3),  a4);
}

- (void)_limitedConcurrency_fetchLoadingProgressForPlaceholderInstallType:(unint64_t)a3 progressHint:(id)a4 andRun:(id)a5
{
  id v8 = a4;
  id v16 = 0LL;
  id v9 = a5;
  unsigned __int8 v10 = -[IXSCoordinatedAppInstall _placeholderOrParallelPlaceholderIsInstalledWithRecord:]( self,  "_placeholderOrParallelPlaceholderIsInstalledWithRecord:",  &v16);
  id v11 = v16;
  id v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
  __int16 v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
  id v14 = v13;
  if ((v10 & 1) != 0)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v18 = "-[IXSCoordinatedAppInstall _limitedConcurrency_fetchLoadingProgressForPlaceholderInstallType:progressHint:andRun:]";
      __int16 v19 = 2112;
      __int16 v20 = self;
      __int16 v21 = 2048;
      unint64_t v22 = a3;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "%s: %@: initiating loading progress with install type %lu",  buf,  0x20u);
    }

    -[IXSCoordinatedAppInstall _limitedConcurrency_saveOriginalInstallTypeForAppRecord:]( self,  "_limitedConcurrency_saveOriginalInstallTypeForAppRecord:",  v11);
    -[IXSCoordinatedAppInstall _limitedConcurrency_setUpLSProgressForInstallType:progressHint:]( self,  "_limitedConcurrency_setUpLSProgressForInstallType:progressHint:",  a3,  v8);
    id v15 = (void *)objc_claimAutoreleasedReturnValue( -[IXSCoordinatedAppInstall _limitedConcurrency_fetchLSProgressForPhase:appRecord:]( self,  "_limitedConcurrency_fetchLSProgressForPhase:appRecord:",  0LL,  v11));
    [v15 setCancellable:1];
    [v15 setPausable:1];
  }

  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_1000810D4(self);
    }

    id v15 = 0LL;
  }

  -[IXSCoordinatedAppInstall _runWithProgress:block:](self, "_runWithProgress:block:", v15, v9);
}

- (void)_onQueue_updateLoadingProgress
{
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v2);

  if (-[IXSCoordinatedAppInstall currentProgressPhaseIsComplete](self, "currentProgressPhaseIsComplete"))
  {
    BOOL v3 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[IXSCoordinatedAppInstall _onQueue_updateLoadingProgress]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: Not updating loading progress because %@ has completed loading phase",  buf,  0x16u);
    }
  }

  else if (-[IXSCoordinatedAppInstall isPaused](self, "isPaused"))
  {
    uint64_t v5 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    id v4 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[IXSCoordinatedAppInstall _onQueue_updateLoadingProgress]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: Not updating loading progress because %@ is paused",  buf,  0x16u);

      id v4 = v6;
    }
  }

  else
  {
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall appAssetPromise](self, "appAssetPromise"));
    __int128 v72 = v8;
    id v9 = v8;
    if (v8)
    {
      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000LL;
      unint64_t v102 = 0LL;
      uint64_t v97 = 0LL;
      id v98 = (double *)&v97;
      uint64_t v99 = 0x2020000000LL;
      uint64_t v100 = 0LL;
      unsigned __int8 v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[os_log_s accessQueue](v8, "accessQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_10005091C;
      block[3] = &unk_1000CD330;
      uint64_t v95 = buf;
      id v94 = v9;
      uint64_t v96 = &v97;
      dispatch_sync(v10, block);

      unint64_t v11 = *((void *)v98 + 3);
      uint64_t v12 = v11 == 0;
      double v13 = *(double *)(*(void *)&buf[8] + 24LL);
      double v14 = v13 + 0.0;
      double v15 = v13 * (double)v11;
      if (v11) {
        double v16 = 0.0;
      }
      else {
        double v16 = v14;
      }
      if (v11) {
        unint64_t v17 = (unint64_t)v15;
      }
      else {
        unint64_t v17 = 0LL;
      }

      _Block_object_dispose(&v97, 8);
      _Block_object_dispose(buf, 8);
      uint64_t v74 = 1LL;
    }

    else
    {
      unint64_t v17 = 0LL;
      uint64_t v74 = 0LL;
      uint64_t v12 = 0LL;
      unint64_t v11 = 0LL;
      double v16 = 0.0;
    }

    id v18 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall userDataPromise](self, "userDataPromise"));
    uint64_t v70 = v18;
    if (v18)
    {
      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000LL;
      LOBYTE(v102) = 0;
      uint64_t v97 = 0LL;
      id v98 = (double *)&v97;
      uint64_t v99 = 0x2020000000LL;
      uint64_t v100 = 0LL;
      uint64_t v89 = 0LL;
      id v90 = &v89;
      uint64_t v91 = 0x2020000000LL;
      uint64_t v92 = 0LL;
      __int16 v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v18 accessQueue]);
      v84[0] = _NSConcreteStackBlock;
      v84[1] = 3221225472LL;
      v84[2] = sub_100050960;
      v84[3] = &unk_1000CE4C8;
      id v86 = buf;
      id v85 = v70;
      id v87 = &v97;
      unsigned int v88 = &v89;
      dispatch_sync(v19, v84);

      if (*(_BYTE *)(*(void *)&buf[8] + 24LL)) {
        BOOL v20 = v72 != 0LL;
      }
      else {
        BOOL v20 = 1;
      }
      if (v20 || (id)-[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent") != (id)3)
      {
        unint64_t v24 = v90[3];
        double v25 = v98[3];
        unint64_t v26 = v17 + (unint64_t)(v25 * (double)v24);
        double v27 = v16 + v25;
        if (v24) {
          unint64_t v17 = v26;
        }
        else {
          double v16 = v27;
        }
        if (v24) {
          v11 += v24;
        }
        else {
          ++v12;
        }
        ++v74;
      }

      else
      {
        __int16 v21 = sub_1000047B4((uint64_t)off_1000E8CA0);
        unint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v23 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
          *(_DWORD *)__int128 v106 = 136315394;
          __int128 v107 = "-[IXSCoordinatedAppInstall _onQueue_updateLoadingProgress]";
          __int16 v108 = 2112;
          v109 = v23;
          _os_log_impl( (void *)&_mh_execute_header,  v22,  OS_LOG_TYPE_DEFAULT,  "%s: %@: Not updating loading progress: user data promise is complete, but we have no app asset yet for this restoring coordinator.",  v106,  0x16u);
        }
      }

      _Block_object_dispose(&v89, 8);
      _Block_object_dispose(&v97, 8);
      _Block_object_dispose(buf, 8);
    }

    id v28 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall initialODRAssetPromises](self, "initialODRAssetPromises", v70));
    BOOL v29 = [v28 count] == 0;

    if (!v29)
    {
      __int128 v82 = 0u;
      __int128 v83 = 0u;
      __int128 v80 = 0u;
      __int128 v81 = 0u;
      id obj = (id)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall initialODRAssetPromises](self, "initialODRAssetPromises"));
      id v30 = [obj countByEnumeratingWithState:&v80 objects:v105 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)v81;
        do
        {
          unint64_t v32 = 0LL;
          v74 += (uint64_t)v30;
          do
          {
            if (*(void *)v81 != v31) {
              objc_enumerationMutation(obj);
            }
            unint64_t v33 = v17;
            unint64_t v34 = v11;
            char v35 = *(void **)(*((void *)&v80 + 1) + 8LL * (void)v32);
            *(void *)buf = 0LL;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x2020000000LL;
            unint64_t v102 = 0LL;
            uint64_t v97 = 0LL;
            id v98 = (double *)&v97;
            uint64_t v99 = 0x2020000000LL;
            uint64_t v100 = 0LL;
            id v36 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v35 accessQueue]);
            v79[0] = _NSConcreteStackBlock;
            v79[1] = 3221225472LL;
            v79[2] = sub_1000509B8;
            v79[3] = &unk_1000CD330;
            void v79[4] = v35;
            v79[5] = buf;
            v79[6] = &v97;
            dispatch_sync(v36, v79);

            unint64_t v11 = v34;
            unint64_t v37 = *((void *)v98 + 3);
            double v38 = *(double *)(*(void *)&buf[8] + 24LL);
            double v39 = v38 * (double)v37;
            double v40 = v16 + v38;
            if (v37)
            {
              unint64_t v17 = v33 + (unint64_t)v39;
            }

            else
            {
              double v16 = v40;
              unint64_t v17 = v33;
            }

            if (v37) {
              v11 += v37;
            }
            else {
              ++v12;
            }
            _Block_object_dispose(&v97, 8);
            _Block_object_dispose(buf, 8);
            unint64_t v32 = (char *)v32 + 1;
          }

          while (v30 != v32);
          id v30 = [obj countByEnumeratingWithState:&v80 objects:v105 count:16];
        }

        while (v30);
      }
    }

    if (v12)
    {
      id v41 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v42 = (os_log_s *)objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG)) {
        sub_1000811D4(self, v12, v42);
      }

      if (v11)
      {
        unint64_t v43 = v11 / (v74 - v12) * v12;
        v11 += v43;
        v17 += (unint64_t)(v16 / (double)(unint64_t)v12 * (double)v43);
      }

      else
      {
        id v44 = sub_1000047B4((uint64_t)off_1000E8CA0);
        __int128 v45 = (os_log_s *)objc_claimAutoreleasedReturnValue(v44);
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
          sub_10008115C();
        }

        unint64_t v11 = 100 * v12;
        unint64_t v17 = (unint64_t)(v16 / (double)(unint64_t)v12 * (double)(unint64_t)(100 * v12));
      }
    }

    __int128 v46 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall preparationPromise](self, "preparationPromise"));

    if (v46)
    {
      *(void *)buf = 0LL;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000LL;
      unint64_t v102 = 0LL;
      __int128 v47 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall preparationPromise](self, "preparationPromise"));
      __int128 v48 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v47 accessQueue]);
      v78[0] = _NSConcreteStackBlock;
      v78[1] = 3221225472LL;
      v78[2] = sub_1000509FC;
      v78[3] = &unk_1000CCEF8;
      v78[4] = self;
      void v78[5] = buf;
      dispatch_sync(v48, v78);

      unint64_t v49 = 100LL;
      if (v11) {
        unint64_t v49 = v11;
      }
      unint64_t v11 = v49 + (unint64_t)((double)v49 * 0.0299999993);
      uint64_t v50 = v74 + 1;
      _Block_object_dispose(buf, 8);
      __int128 v51 = self;
    }

    else
    {
      __int128 v51 = self;
      uint64_t v50 = v74;
    }

    uint64_t v52 = v50;
    BOOL v53 = v50 != 0;
    __int128 v54 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall coordinatorProgress](v51, "coordinatorProgress"));
    BOOL v55 = v54 == 0LL;

    if (v55)
    {
      __int128 v56 = objc_alloc(&OBJC_CLASS___IXSCoordinatorProgress);
      __int128 v57 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
      __int16 v58 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall progressHintWithDefault](self, "progressHintWithDefault"));
      id v59 = -[IXSCoordinatorProgress initForCoordinatorWithIdentity:totalUnits:progressHint:needsPostProcessing:delegate:]( v56,  "initForCoordinatorWithIdentity:totalUnits:progressHint:needsPostProcessing:delegate:",  v57,  v11,  v58,  -[IXSCoordinatedAppInstall needsPostProcessing](self, "needsPostProcessing"),  self);
      -[IXSCoordinatedAppInstall setCoordinatorProgress:](self, "setCoordinatorProgress:", v59);
    }

    __int16 v60 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall publishedInstallProgress](self, "publishedInstallProgress"));
    if (!v60)
    {
      if ((id)-[IXSCoordinatedAppInstall placeholderInstallState](self, "placeholderInstallState") == (id)4)
      {
        id v61 = sub_100034B1C();
        __int16 v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
        id v63 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
        __int16 v60 = (void *)objc_claimAutoreleasedReturnValue([v62 initiateProgressForIdentity:v63]);

        if ((id)-[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent") == (id)4)
        {
          [v60 setInstallPhase:2];
          uint64_t v64 = 2LL;
        }

        else
        {
          [v60 setInstallPhase:0];
          if (-[IXSCoordinatedAppInstall needsPostProcessing](self, "needsPostProcessing")) {
            uint64_t v64 = 4LL;
          }
          else {
            uint64_t v64 = 1LL;
          }
        }

        [v60 setFinalPhase:v64];
        -[IXSCoordinatedAppInstall _onQueue_configureTotalUnitCountsForInstallProgress:]( self,  "_onQueue_configureTotalUnitCountsForInstallProgress:",  v60);
        -[IXSCoordinatedAppInstall setPublishedInstallProgress:](self, "setPublishedInstallProgress:", v60);
      }

      else
      {
        __int16 v60 = 0LL;
      }
    }

    if (v52)
    {
      uint64_t v65 = sub_1000047B4((uint64_t)off_1000E8CA0);
      __int128 v66 = (os_log_s *)objc_claimAutoreleasedReturnValue(v65);
      if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
      {
        __int128 v69 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "-[IXSCoordinatedAppInstall _onQueue_updateLoadingProgress]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v69;
        *(_WORD *)&buf[22] = 2048;
        unint64_t v102 = v17;
        __int16 v103 = 2048;
        unint64_t v104 = v11;
        _os_log_debug_impl( (void *)&_mh_execute_header,  v66,  OS_LOG_TYPE_DEBUG,  "%s: %@: Setting progress to %llu / %llu",  buf,  0x2Au);
      }

      __int128 v67 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall coordinatorProgress](self, "coordinatorProgress"));
      [v67 setTotalUnits:v11];

      __int128 v68 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall coordinatorProgress](self, "coordinatorProgress"));
      [v68 setTotalUnitsCompleted:v17];

      -[IXSCoordinatedAppInstall _onQueue_setInstallProgressPercentComplete:forPhase:]( self,  "_onQueue_setInstallProgressPercentComplete:forPhase:",  0LL,  (double)v17 / (double)v11);
    }

    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472LL;
    v76[2] = sub_100050A44;
    v76[3] = &unk_1000CE4F0;
    BOOL v77 = v53;
    void v76[4] = self;
    v76[5] = v11;
    v76[6] = v17;
    -[IXSCoordinatedAppInstall _onQueue_fetchProgressForPhase:andRun:]( self,  "_onQueue_fetchProgressForPhase:andRun:",  0LL,  v76);

    id v4 = v72;
  }
}

- (id)_limitedConcurrency_fetchInstallingProgress
{
  id v9 = 0LL;
  unsigned __int8 v3 = -[IXSCoordinatedAppInstall _placeholderOrParallelPlaceholderIsInstalledWithRecord:]( self,  "_placeholderOrParallelPlaceholderIsInstalledWithRecord:",  &v9);
  id v4 = v9;
  if ((v3 & 1) != 0)
  {
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue( -[IXSCoordinatedAppInstall _limitedConcurrency_fetchLSProgressForPhase:appRecord:]( self,  "_limitedConcurrency_fetchLSProgressForPhase:appRecord:",  1LL,  v4));
    [v5 setCancellable:0];
    [v5 setPausable:0];
  }

  else
  {
    id v6 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10008130C(self);
    }

    uint64_t v5 = 0LL;
  }

  return v5;
}

- (void)_limitedConcurrency_fetchPostProcessingProgressAndRun:(id)a3
{
  id v10 = 0LL;
  id v4 = a3;
  unsigned __int8 v5 = -[IXSCoordinatedAppInstall _placeholderOrParallelPlaceholderIsInstalledWithRecord:]( self,  "_placeholderOrParallelPlaceholderIsInstalledWithRecord:",  &v10);
  id v6 = v10;
  if ((v5 & 1) != 0)
  {
    id v7 = (void *)objc_claimAutoreleasedReturnValue( -[IXSCoordinatedAppInstall _limitedConcurrency_fetchLSProgressForPhase:appRecord:]( self,  "_limitedConcurrency_fetchLSProgressForPhase:appRecord:",  4LL,  v6));
    [v7 setCancellable:1];
    [v7 setPausable:1];
  }

  else
  {
    id v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      sub_100081394(self);
    }

    id v7 = 0LL;
  }

  -[IXSCoordinatedAppInstall _runWithProgress:block:](self, "_runWithProgress:block:", v7, v4);
}

- (void)_onQueue_updatePostProcessingProgress
{
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v2);

  if (-[IXSCoordinatedAppInstall currentProgressPhaseIsComplete](self, "currentProgressPhaseIsComplete"))
  {
    unsigned __int8 v3 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[IXSCoordinatedAppInstall _onQueue_updatePostProcessingProgress]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = self;
      _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "%s: Not updating post processing progress because %@ has completed post processing phase",  buf,  0x16u);
    }
  }

  else if (-[IXSCoordinatedAppInstall isPaused](self, "isPaused"))
  {
    unsigned __int8 v5 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
    id v4 = v6;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "-[IXSCoordinatedAppInstall _onQueue_updatePostProcessingProgress]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      _os_log_impl( (void *)&_mh_execute_header,  v6,  OS_LOG_TYPE_DEFAULT,  "%s: Not updating post processing progress because %@ is paused",  buf,  0x16u);

      id v4 = v6;
    }
  }

  else
  {
    __int128 v32 = 0u;
    __int128 v33 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall essentialAssetPromises](self, "essentialAssetPromises"));
    id v8 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
    unint64_t v9 = 0LL;
    unint64_t v10 = 0LL;
    if (v8)
    {
      uint64_t v11 = *(void *)v31;
      do
      {
        for (i = 0LL; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(obj);
          }
          double v13 = *(void **)(*((void *)&v30 + 1) + 8LL * (void)i);
          *(void *)buf = 0LL;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x2020000000LL;
          unint64_t v35 = 0LL;
          uint64_t v26 = 0LL;
          double v27 = &v26;
          uint64_t v28 = 0x2020000000LL;
          uint64_t v29 = 0LL;
          double v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v13 accessQueue]);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472LL;
          block[2] = sub_1000511B4;
          block[3] = &unk_1000CD330;
          void block[4] = v13;
          void block[5] = buf;
          void block[6] = &v26;
          dispatch_sync(v14, block);

          unint64_t v15 = v27[3];
          v10 += v15;
          v9 += (unint64_t)(*(double *)(*(void *)&buf[8] + 24LL) * (double)v15);
          _Block_object_dispose(&v26, 8);
          _Block_object_dispose(buf, 8);
        }

        id v8 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
      }

      while (v8);
    }

    if (v10 >= v9) {
      unint64_t v16 = v9;
    }
    else {
      unint64_t v16 = v10;
    }
    unint64_t v17 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      __int16 v21 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[IXSCoordinatedAppInstall _onQueue_updatePostProcessingProgress]";
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v21;
      *(_WORD *)&buf[22] = 2048;
      unint64_t v35 = v16;
      __int16 v36 = 2048;
      unint64_t v37 = v10;
      _os_log_debug_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_DEBUG,  "%s: %@: Setting post processing progress to %llu / %llu",  buf,  0x2Au);
    }

    __int16 v19 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall coordinatorProgress](self, "coordinatorProgress"));
    [v19 setTotalUnits:v10];

    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall coordinatorProgress](self, "coordinatorProgress"));
    [v20 setTotalUnitsCompleted:v16];

    -[IXSCoordinatedAppInstall _onQueue_setInstallProgressPercentComplete:forPhase:]( self,  "_onQueue_setInstallProgressPercentComplete:forPhase:",  4LL,  (double)v16 / (double)v10);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472LL;
    v24[2] = sub_1000511F8;
    v24[3] = &unk_1000CE518;
    v24[4] = self;
    v24[5] = v10;
    v24[6] = v16;
    -[IXSCoordinatedAppInstall _onQueue_fetchProgressForPhase:andRun:]( self,  "_onQueue_fetchProgressForPhase:andRun:",  2LL,  v24);
    id v4 = (os_log_s *)obj;
  }
}

- (void)didUpdateProgress:(double)a3 forPhase:(unint64_t)a4 overallProgress:(double)a5
{
  unint64_t v9 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall delegateCallQueue](self, "delegateCallQueue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472LL;
  v10[2] = sub_100051324;
  v10[3] = &unk_1000CE540;
  v10[4] = self;
  *(double *)&v10[5] = a3;
  v10[6] = a4;
  *(double *)&v10[7] = a5;
  sub_10005A8F0(v9, v10);
}

- (unint64_t)transactionStepForPromise:(id)a3
{
  id v4 = a3;
  id v5 = (id)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall placeholderPromise](self, "placeholderPromise"));

  if (v5 == v4)
  {
    unint64_t v13 = 8LL;
  }

  else
  {
    id v6 = (id)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall appAssetPromise](self, "appAssetPromise"));

    if (v6 == v4)
    {
      unint64_t v13 = 9LL;
    }

    else
    {
      id v7 = (id)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall userDataPromise](self, "userDataPromise"));

      if (v7 == v4)
      {
        unint64_t v13 = 11LL;
      }

      else
      {
        id v8 = (id)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall deviceSecurityPromise](self, "deviceSecurityPromise"));

        if (v8 == v4)
        {
          unint64_t v13 = 13LL;
        }

        else
        {
          id v9 = (id)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall preparationPromise](self, "preparationPromise"));

          if (v9 == v4)
          {
            unint64_t v13 = 14LL;
          }

          else
          {
            uint64_t v10 = objc_opt_class(&OBJC_CLASS___IXSOpaqueDataPromise);
            if ((objc_opt_isKindOfClass(v4, v10) & 1) != 0
              && (uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall initialODRAssetPromises](self, "initialODRAssetPromises")),
                  unsigned __int8 v12 = [v11 containsObject:v4],
                  v11,
                  (v12 & 1) != 0))
            {
              unint64_t v13 = 10LL;
            }

            else
            {
              uint64_t v14 = objc_opt_class(&OBJC_CLASS___IXSOpaqueDataPromise);
              if ((objc_opt_isKindOfClass(v4, v14) & 1) != 0
                && (unint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall essentialAssetPromises](self, "essentialAssetPromises")),
                    unsigned __int8 v16 = [v15 containsObject:v4],
                    v15,
                    (v16 & 1) != 0))
              {
                unint64_t v13 = 16LL;
              }

              else
              {
                id v17 = (id)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall installOptionsPromise](self, "installOptionsPromise"));

                if (v17 == v4) {
                  unint64_t v13 = 12LL;
                }
                else {
                  unint64_t v13 = 17LL;
                }
              }
            }
          }
        }
      }
    }
  }

  return v13;
}

- (void)promiseDidBegin:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000515AC;
  v7[3] = &unk_1000CCCB8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  sub_10005A8F0(v5, v7);
}

- (void)promiseDidComplete:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    unsigned __int8 v12 = "-[IXSCoordinatedAppInstall promiseDidComplete:]";
    __int16 v13 = 2112;
    uint64_t v14 = self;
    __int16 v15 = 2112;
    id v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: %@ : Promise completed: %@", buf, 0x20u);
  }

  id v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_100051B50;
  v9[3] = &unk_1000CCCB8;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  sub_10005A8F0(v7, v9);
}

- (void)promise:(id)a3 didUpdateProgress:(double)a4
{
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue", a3, a4));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100051CC8;
  v6[3] = &unk_1000CCE58;
  void v6[4] = self;
  sub_10005A8F0(v5, v6);
}

- (void)promise:(id)a3 didCancelForReason:(id)a4 client:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = sub_1000047B4((uint64_t)off_1000E8CA0);
  uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    double v25 = "-[IXSCoordinatedAppInstall promise:didCancelForReason:client:]";
    __int16 v26 = 2112;
    double v27 = self;
    __int16 v28 = 2112;
    id v29 = v8;
    __int16 v30 = 2112;
    id v31 = v9;
    __int16 v32 = 2048;
    unint64_t v33 = a5;
    _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_DEFAULT,  "%s: %@ : Promise canceled: %@ for reason %@ client %lu",  buf,  0x34u);
  }

  unsigned __int8 v12 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472LL;
  v20[2] = sub_100051F34;
  v20[3] = &unk_1000CD1C8;
  v20[4] = self;
  id v13 = v8;
  id v21 = v13;
  unint64_t v23 = a5;
  id v14 = v9;
  id v22 = v14;
  sub_10005A8F0(v12, v20);

  if ((id)-[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent") == (id)3
    && (id v15 = (id)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall appAssetPromise](self, "appAssetPromise")),
        v15,
        v15 == v13))
  {
    id v16 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472LL;
    v17[2] = sub_100052048;
    v17[3] = &unk_1000CD358;
    void v17[4] = self;
    id v18 = v14;
    unint64_t v19 = a5;
    sub_10005A8F0(v16, v17);
  }

  else
  {
    -[IXSCoordinatedAppInstall cancelForReason:client:error:](self, "cancelForReason:client:error:", v14, a5, 0LL);
  }
}

- (unint64_t)placeholderDisposition
{
  unsigned __int8 v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  return self->_placeholderDisposition;
}

- (void)setPlaceholderDisposition:(unint64_t)a3
{
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v5);

  self->_placeholderDisposition = a3;
}

- (void)_onQueue_runPostProcessingAssertionHandler
{
  unsigned __int8 v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_V2(v3);

  -[IXSCoordinatedAppInstall setCurrentProgressPhaseIsComplete:](self, "setCurrentProgressPhaseIsComplete:", 0LL);
  -[IXSCoordinatedAppInstall setPendingProgressRequests:](self, "setPendingProgressRequests:", 0LL);
  -[IXSCoordinatedAppInstall setSentBeginPostProcessing:](self, "setSentBeginPostProcessing:", 1LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall publishedInstallProgress](self, "publishedInstallProgress"));
  [v4 setInstallPhase:4];

  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall completedRecordPromise](self, "completedRecordPromise"));
  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall delegateCallQueue](self, "delegateCallQueue"));
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472LL;
  id v10 = sub_1000521DC;
  uint64_t v11 = &unk_1000CCCB8;
  unsigned __int8 v12 = self;
  id v13 = v5;
  id v7 = v5;
  sub_10005A8F0(v6, &v8);

  -[IXSCoordinatedAppInstall setPostProcessingAssertionState:]( self,  "setPostProcessingAssertionState:",  4LL,  v8,  v9,  v10,  v11,  v12);
  -[IXSCoordinatedAppInstall _onQueue_saveState](self, "_onQueue_saveState");
  -[IXSCoordinatedAppInstall _onQueue_checkState](self, "_onQueue_checkState");
}

- (void)scheduledAppUpdateReadyToExecuteAndRunBlockWhenComplete:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000522B8;
  v7[3] = &unk_1000CD568;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  sub_10005A8F0(v5, v7);
}

- (void)assertionTargetProcessDidExit:(id)a3
{
  id v4 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v9 = "-[IXSCoordinatedAppInstall assertionTargetProcessDidExit:]";
    __int16 v10 = 2112;
    uint64_t v11 = self;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "%s: RBS termination assertion observer called for %@",  buf,  0x16u);
  }

  id v6 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_1000523F8;
  v7[3] = &unk_1000CCE58;
  v7[4] = self;
  sub_10005A8F0(v6, v7);
}

- (void)setPriorityBoostCompletion:(id)a3
{
}

- (void)setPriorityBoostSourceInfo:(id)a3
{
}

- (IXAppInstallCoordinatorSeed)seed
{
  return self->_seed;
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
}

- (OS_dispatch_queue)delegateCallQueue
{
  return self->_delegateCallQueue;
}

- (void)setDelegateCallQueue:(id)a3
{
}

- (OS_dispatch_group)outstandingInstallOperationsGroup
{
  return self->_outstandingInstallOperationsGroup;
}

- (void)setOutstandingInstallOperationsGroup:(id)a3
{
}

- (os_unfair_lock_s)externalPropertyLock
{
  return self->_externalPropertyLock;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (unint64_t)errorSourceIdentifier
{
  return self->_errorSourceIdentifier;
}

- (void)setErrorSourceIdentifier:(unint64_t)a3
{
  self->_errorSourceIdentifier = a3;
}

- (NSUUID)installOptionsPromiseUUID
{
  return self->_installOptionsPromiseUUID;
}

- (void)setInstallOptionsPromiseUUID:(id)a3
{
}

- (NSUUID)placeholderPromiseUUID
{
  return self->_placeholderPromiseUUID;
}

- (void)setPlaceholderPromiseUUID:(id)a3
{
}

- (NSUUID)appAssetPromiseUUID
{
  return self->_appAssetPromiseUUID;
}

- (void)setAppAssetPromiseUUID:(id)a3
{
}

- (NSArray)initialODRAssetPromiseUUIDs
{
  return self->_initialODRAssetPromiseUUIDs;
}

- (void)setInitialODRAssetPromiseUUIDs:(id)a3
{
}

- (NSUUID)userDataPromiseUUID
{
  return self->_userDataPromiseUUID;
}

- (void)setUserDataPromiseUUID:(id)a3
{
}

- (NSUUID)deviceSecurityPromiseUUID
{
  return self->_deviceSecurityPromiseUUID;
}

- (void)setDeviceSecurityPromiseUUID:(id)a3
{
}

- (NSUUID)preparationPromiseUUID
{
  return self->_preparationPromiseUUID;
}

- (void)setPreparationPromiseUUID:(id)a3
{
}

- (NSProgress)cachedCurrentPhaseProgress
{
  return self->_cachedCurrentPhaseProgress;
}

- (NSMutableArray)pendingProgressRequests
{
  return self->_pendingProgressRequests;
}

- (void)setPendingProgressRequests:(id)a3
{
}

- (unint64_t)placeholderInstallState
{
  return self->_placeholderInstallState;
}

- (unint64_t)appInstallState
{
  return self->_appInstallState;
}

- (IXSPlaceholderFailureInfo)placeholderFailureInfo
{
  return self->_placeholderFailureInfo;
}

- (void)setPlaceholderFailureInfo:(id)a3
{
}

- (unint64_t)originalInstallType
{
  return self->_originalInstallType;
}

- (void)setOriginalInstallType:(unint64_t)a3
{
  self->_originalInstallType = a3;
}

- (BOOL)sentBeginRestoringUserData
{
  return self->_sentBeginRestoringUserData;
}

- (void)setSentBeginRestoringUserData:(BOOL)a3
{
  self->_sentBeginRestoringUserData = a3;
}

- (IXSPowerAssertion)appInstallPowerAssertion
{
  return self->_appInstallPowerAssertion;
}

- (void)setAppInstallPowerAssertion:(id)a3
{
}

- (RBSTerminationAssertion)termAssertion
{
  return self->_termAssertion;
}

- (BOOL)expectTermAssertionCallback
{
  return self->_expectTermAssertionCallback;
}

- (void)setExpectTermAssertionCallback:(BOOL)a3
{
  self->_expectTermAssertionCallback = a3;
}

- (OS_dispatch_source)assertionRetryTimer
{
  return self->_assertionRetryTimer;
}

- (void)setAssertionRetryTimer:(id)a3
{
}

- (unint64_t)assertionRetryCount
{
  return self->_assertionRetryCount;
}

- (void)setAssertionRetryCount:(unint64_t)a3
{
  self->_assertionRetryCount = a3;
}

- (NSDate)firstAppExtensionBusyTime
{
  return self->_firstAppExtensionBusyTime;
}

- (void)setFirstAppExtensionBusyTime:(id)a3
{
}

- (IXSCoordinatorProgress)coordinatorProgress
{
  return self->_coordinatorProgress;
}

- (void)setCoordinatorProgress:(id)a3
{
}

- (IPPublishedIdentityProgress)publishedInstallProgress
{
  return self->_publishedInstallProgress;
}

- (void)setPublishedInstallProgress:(id)a3
{
}

- (BOOL)appAssetPromiseSetterCanInstallLocalProvisionedContent
{
  return self->_appAssetPromiseSetterCanInstallLocalProvisionedContent;
}

- (void)setAppAssetPromiseSetterCanInstallLocalProvisionedContent:(BOOL)a3
{
  self->_appAssetPromiseSetterCanInstallLocalProvisionedContent = a3;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void)setTransaction:(id)a3
{
}

- (OS_os_transaction)assertionTransaction
{
  return self->_assertionTransaction;
}

- (void)setAssertionTransaction:(id)a3
{
}

- (BOOL)sentBeginPostProcessing
{
  return self->_sentBeginPostProcessing;
}

- (void)setSentBeginPostProcessing:(BOOL)a3
{
  self->_sentBeginPostProcessing = a3;
}

- (NSArray)essentialAssetPromiseUUIDs
{
  return self->_essentialAssetPromiseUUIDs;
}

- (void)setEssentialAssetPromiseUUIDs:(id)a3
{
}

- (unint64_t)postProcessingAssertionState
{
  return self->_postProcessingAssertionState;
}

- (void)setPostProcessingAssertionState:(unint64_t)a3
{
  self->_unint64_t postProcessingAssertionState = a3;
}

- (unint64_t)updateScheduleState
{
  return self->_updateScheduleState;
}

- (void)setUpdateScheduleState:(unint64_t)a3
{
  self->_updateScheduleState = a3;
}

- (OS_dispatch_queue)assertionQueue
{
  return self->_assertionQueue;
}

- (void)setAssertionQueue:(id)a3
{
}

- (id)schedulerCallback
{
  return self->_schedulerCallback;
}

- (void)setSchedulerCallback:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_remote_cancelForReason:(id)a3 client:(unint64_t)a4 completion:(id)a5
{
  unsigned __int8 v13 = 0;
  id v12 = 0LL;
  id v8 = (void (**)(id, void, id))a5;
  LOBYTE(self) = -[IXSCoordinatedAppInstall cancelForReason:client:needsLSDatabaseSync:error:]( self,  "cancelForReason:client:needsLSDatabaseSync:error:",  a3,  a4,  &v13,  &v12);
  id v9 = v12;
  __int16 v10 = v9;
  id v11 = 0LL;
  v8[2](v8, v13, v11);
}

- (void)_remote_setPlaceholderPromiseUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
  id v9 = [v8 promiseForUUID:v6 ofType:objc_opt_class(IXSPlaceholder)];
  __int16 v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (v10)
  {
    id v11 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
    id v12 = (void *)objc_claimAutoreleasedReturnValue([v11 bundleID]);
    unsigned __int8 v13 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleID]);
    unsigned __int8 v14 = [v12 isEqualToString:v13];

    if ((v14 & 1) != 0)
    {
      id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100052D58;
      block[3] = &unk_1000CCCB8;
      void block[4] = self;
      id v29 = v10;
      dispatch_sync(v15, block);

      v7[2](v7, 0LL);
    }

    else
    {
      id v21 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_1000815A0();
      }

      unint64_t v23 = (void *)objc_claimAutoreleasedReturnValue([v10 bundleID]);
      double v27 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall identity](self, "identity"));
      id v25 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setPlaceholderPromiseUUID:completion:]",  6287LL,  @"IXErrorDomain",  8uLL,  0LL,  0LL,  @"Attempted to set placeholder promise with bundle ID %@ that does not match coordinator's identity %@",  v24,  (uint64_t)v23);
      __int16 v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

      ((void (**)(id, void *))v7)[2](v7, v26);
    }
  }

  else
  {
    id v16 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_100081530();
    }

    id v19 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setPlaceholderPromiseUUID:completion:]",  6296LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"Failed to locate placeholder data promise with UUID %@",  v18,  (uint64_t)v6);
    BOOL v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    ((void (**)(id, void *))v7)[2](v7, v20);
  }
}

- (void)_remote_getPlaceholderPromise:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  __int16 v10 = sub_10003E9E8;
  id v11 = sub_10003E9F8;
  id v12 = 0LL;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100052E54;
  v6[3] = &unk_1000CD080;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  v4[2](v4, v8[5], 0LL);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_hasPlaceholderPromise:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100053004;
  v6[3] = &unk_1000CCEF8;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v8 + 24), 0LL);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_setAppAssetPromiseUUID:(id)a3 fromConnection:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  char v10 = (void (**)(void))a5;
  char v11 = sub_10000C3EC(v9, @"InstallLocalProvisioned");
  id v12 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
  id v13 = [v12 promiseForUUID:v8 ofType:objc_opt_class(IXSOwnedDataPromise)];
  unsigned __int8 v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  if (v14)
  {
    uint64_t v15 = objc_opt_class(&OBJC_CLASS___IXSPromisedAppReference);
    id v16 = &off_100095000;
    if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
    {
      id v17 = v14;
      uint64_t v33 = 0LL;
      unint64_t v34 = &v33;
      uint64_t v35 = 0x3032000000LL;
      __int16 v36 = sub_10003E9E8;
      unint64_t v37 = sub_10003E9F8;
      id v38 = 0LL;
      uint64_t v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v17 accessQueue]);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100053320;
      block[3] = &unk_1000CD058;
      id v19 = v17;
      id v30 = v19;
      id v31 = self;
      __int16 v32 = &v33;
      dispatch_sync(v18, block);

      if (v34[5])
      {
        v10[2](v10);

        _Block_object_dispose(&v33, 8);
        goto LABEL_10;
      }

      _Block_object_dispose(&v33, 8);
      id v16 = &off_100095000;
    }

    id v25 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = *((void *)v16 + 80);
    v26[2] = sub_1000535BC;
    v26[3] = &unk_1000CE230;
    v26[4] = self;
    id v27 = v14;
    char v28 = v11;
    dispatch_sync(v25, v26);

    ((void (*)(void (**)(void), void))v10[2])(v10, 0LL);
    goto LABEL_10;
  }

  BOOL v20 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
    sub_10008163C();
  }

  id v23 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setAppAssetPromiseUUID:fromConnection:completion:]",  6378LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"Failed to locate app asset data promise with UUID %@",  v22,  (uint64_t)v8);
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  ((void (*)(void (**)(void), void *))v10[2])(v10, v24);

LABEL_10:
}

- (void)_remote_getAppAssetPromise:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  char v10 = sub_10003E9E8;
  char v11 = sub_10003E9F8;
  id v12 = 0LL;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000536DC;
  v6[3] = &unk_1000CD080;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  v4[2](v4, v8[5], 0LL);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_hasAppAssetPromise:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10005388C;
  v6[3] = &unk_1000CCEF8;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v8 + 24), 0LL);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_appAssetPromiseHasBegunFulfillment:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0LL;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  char v18 = 0;
  uint64_t v11 = 0LL;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000LL;
  char v14 = 0;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100053A38;
  block[3] = &unk_1000CD448;
  void block[4] = self;
  void block[5] = &v15;
  void block[6] = &v11;
  dispatch_sync(v5, block);

  if (*((_BYTE *)v16 + 24))
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v12 + 24), 0LL);
  }

  else
  {
    id v7 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_appAssetPromiseHasBegunFulfillment:]",  6424LL,  @"IXErrorDomain",  0x17uLL,  0LL,  0LL,  @"App asset promise is not set",  v6,  v9);
    id v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0LL, v8);
  }

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);
}

- (void)_remote_getAppAssetPromiseDRI:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v10 = 0LL;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100053BF0;
  v6[3] = &unk_1000CCEF8;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  v4[2](v4, v8[3], 0LL);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_setAppAssetPromiseDRI:(unint64_t)a3 completion:(id)a4
{
  uint64_t v6 = (void (**)(id, void))a4;
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100053CB8;
  v8[3] = &unk_1000CCBD8;
  void v8[4] = self;
  v8[5] = a3;
  dispatch_sync(v7, v8);

  v6[2](v6, 0LL);
}

- (BOOL)_validateParentLinkageForInstallOptions:(id)a3 connection:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = sub_10000C5A4(v7);
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue([v8 linkedParentBundleID]);

  if (v11 && ([v10 containsObject:v11] & 1) == 0)
  {
    char v14 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v15 = (os_log_s *)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      id v21 = sub_10000C330(v7);
      uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      *(_DWORD *)buf = 136316162;
      uint64_t v24 = "-[IXSCoordinatedAppInstall(IPCMethods) _validateParentLinkageForInstallOptions:connection:error:]";
      __int16 v25 = 2112;
      __int16 v26 = v22;
      __int16 v27 = 2112;
      char v28 = v11;
      __int16 v29 = 2112;
      id v30 = v10;
      __int16 v31 = 2112;
      uint64_t v32 = 0LL;
      _os_log_error_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_ERROR,  "%s: Client %@ setting the install options did not have the required entitlement to allow the linkedParentBundleI D property of the supplied MIInstallOptions to be set to '%@' (found com.apple.private.mobileinstall.allowed-l inked-parents = %@) : %@",  buf,  0x34u);
    }

    id v16 = sub_10000C330(v7);
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    id v19 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _validateParentLinkageForInstallOptions:connection:error:]",  6455LL,  @"IXErrorDomain",  0x19uLL,  0LL,  0LL,  @"Client %@ setting the install options did not have the required entitlement to allow the linkedParentBundleID property of the supplied MIInstallOptions to be set to '%@' (found com.apple.private.mobileinstall.allowed-linked-parents = %@)",  v18,  (uint64_t)v17);
    id v12 = (id)objc_claimAutoreleasedReturnValue(v19);

    if (a5)
    {
      id v12 = v12;
      BOOL v13 = 0;
      *a5 = v12;
    }

    else
    {
      BOOL v13 = 0;
    }
  }

  else
  {
    id v12 = 0LL;
    BOOL v13 = 1;
  }

  return v13;
}

- (void)_remote_setInstallOptionsPromiseUUID:(id)a3 forConnection:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, id))a5;
  uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  dispatch_assert_queue_not_V2(v11);

  if (v8)
  {
    uint64_t v69 = 0LL;
    uint64_t v70 = &v69;
    uint64_t v71 = 0x2020000000LL;
    char v72 = 0;
    id v12 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
    id v13 = [v12 promiseForUUID:v8 ofType:objc_opt_class(IXSPromisedInMemoryData)];
    char v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    if (v14)
    {
      uint64_t v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v14 accessQueue]);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472LL;
      block[2] = sub_100054590;
      block[3] = &unk_1000CCEF8;
      __int128 v68 = &v69;
      id v16 = v14;
      id v67 = v16;
      dispatch_sync(v15, block);

      if (*((_BYTE *)v70 + 24))
      {
        id v65 = 0LL;
        id v17 = [(id)objc_opt_class(self) _fetchInstallOptionsFromPromise:v16 error:&v65];
        id v18 = (id)objc_claimAutoreleasedReturnValue(v17);
        id v19 = v65;
        BOOL v20 = v19;
        if (v18)
        {
          id v64 = v19;
          unsigned int v21 = -[IXSCoordinatedAppInstall _validateParentLinkageForInstallOptions:connection:error:]( self,  "_validateParentLinkageForInstallOptions:connection:error:",  v18,  v9,  &v64);
          id v22 = v64;

          if (v21)
          {
            id v18 = v18;
            if ([v18 installationRequestorAuditToken]
              && (sub_10000C398( v9,  (uint64_t)@"com.apple.private.install.can-set-install-requestor") & 1) == 0)
            {
              double v40 = sub_1000047B4((uint64_t)off_1000E8CA0);
              id v41 = (os_log_s *)objc_claimAutoreleasedReturnValue(v40);
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
              {
                id v42 = sub_10000C330(v9);
                unint64_t v43 = (void *)objc_claimAutoreleasedReturnValue(v42);
                sub_100081880(v43, v74);
              }

              id v44 = sub_10000C330(v9);
              __int128 v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
              id v47 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setInstallOptionsPromiseUUID:forConnection:completion:]",  6516LL,  @"IXErrorDomain",  0x19uLL,  0LL,  0LL,  @"Client %@ attempted to set MIInstallOptions with the installationRequestorAuditToken property set, but did not have the required entitlement.",  v46,  (uint64_t)v45);
              uint64_t v48 = objc_claimAutoreleasedReturnValue(v47);

              uint64_t v24 = 0LL;
              id v22 = (id)v48;
              goto LABEL_24;
            }

            id v23 = (void *)objc_claimAutoreleasedReturnValue([v18 iTunesMetadata]);
            uint64_t v24 = v23;
            if (!v23) {
              goto LABEL_34;
            }
            id v63 = v22;
            id v25 = sub_10000C700(v23, v9, @"install options", &v63);
            __int128 v56 = (void *)objc_claimAutoreleasedReturnValue(v25);
            id v26 = v63;

            if (v56)
            {
              if (objc_msgSend(v24, "isEqual:"))
              {
                id v22 = v26;
LABEL_33:

LABEL_34:
                uint64_t v52 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
                v57[0] = _NSConcreteStackBlock;
                v57[1] = 3221225472LL;
                v57[2] = sub_1000545C8;
                v57[3] = &unk_1000CCCB8;
                v57[4] = self;
                id v16 = v16;
                id v58 = v16;
                dispatch_sync(v52, v57);

                goto LABEL_24;
              }

              [v18 setITunesMetadata:v56];
              id v62 = v26;
              id v49 = sub_100035028(v18, &v62);
              BOOL v55 = (void *)objc_claimAutoreleasedReturnValue(v49);
              id v54 = v62;

              if (v55)
              {
                uint64_t v50 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue([v16 accessQueue]);
                v60[0] = _NSConcreteStackBlock;
                v60[1] = 3221225472LL;
                v60[2] = sub_1000545C0;
                v60[3] = &unk_1000CCE58;
                id v53 = v16;
                id v61 = v53;
                dispatch_sync(v50, v60);

                __int128 v51 = objc_alloc(&OBJC_CLASS___IXSPromisedInMemoryData);
                id v59 = v54;
                id v16 = (id)objc_claimAutoreleasedReturnValue( -[IXSPromisedInMemoryData updatedPromiseWithData:error:]( v51,  "updatedPromiseWithData:error:",  v55,  &v59));
                id v22 = v59;

                if (v16)
                {

                  goto LABEL_33;
                }

                id v16 = 0LL;
              }

              else
              {
                id v22 = v54;
              }
            }

            else
            {
              id v22 = v26;
            }

            goto LABEL_24;
          }

- (void)_remote_hasInstallOptions:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000546A8;
  v6[3] = &unk_1000CCEF8;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v8 + 24), 0LL);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_getInstallOptions:(id)a3
{
  id v4 = (void (**)(id, uint64_t, uint64_t))a3;
  uint64_t v13 = 0LL;
  char v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  id v16 = sub_10003E9E8;
  id v17 = sub_10003E9F8;
  id v18 = 0LL;
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  char v10 = sub_10003E9E8;
  uint64_t v11 = sub_10003E9F8;
  id v12 = 0LL;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005481C;
  block[3] = &unk_1000CD330;
  void block[4] = self;
  void block[5] = &v7;
  void block[6] = &v13;
  dispatch_sync(v5, block);

  v4[2](v4, v8[5], v14[5]);
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
}

- (void)_remote_setImportance:(unint64_t)a3 completion:(id)a4
{
  uint64_t v6 = (void (**)(id, void))a4;
  unint64_t v7 = -[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent");
  if (a3 != 4 || (unint64_t v8 = v7, v7 == 2))
  {
    uint64_t v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100054A40;
    block[3] = &unk_1000CCBD8;
    void block[4] = self;
    void block[5] = a3;
    dispatch_sync(v15, block);

    v6[2](v6, 0LL);
  }

  else
  {
    uint64_t v9 = sub_1000047B4((uint64_t)off_1000E8CA0);
    char v10 = (os_log_s *)objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000818D8(v8, v10);
    }

    uint64_t v11 = IXStringForCoordinatorImportance(4uLL);
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (v8 >= 8) {
      char v14 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown intent value %lu",  v8));
    }
    else {
      char v14 = *(&off_1000CE7B0 + v8);
    }
    id v16 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setImportance:completion:]",  6588LL,  @"IXErrorDomain",  4uLL,  0LL,  0LL,  @"Importance %@ isn't applicable to this coordinator with intent %@",  v12,  (uint64_t)v13);
    id v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

    ((void (**)(id, void *))v6)[2](v6, v17);
  }

- (void)_remote_importanceWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v7 = 0LL;
  unint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v10 = 0LL;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100054B20;
  v6[3] = &unk_1000CCEF8;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  v4[2](v4, v8[3], 0LL);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_conveyPriorityReplacingExisting:(BOOL)a3 forConnection:(id)a4 withCompletion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v34 = 0LL;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000LL;
  unint64_t v37 = sub_100054DD0;
  uint64_t v38 = sub_100054DF8;
  id v39 = objc_retainBlock(v9);
  uint64_t v28 = 0LL;
  __int16 v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  id v31 = sub_10003E9E8;
  uint64_t v32 = sub_10003E9F8;
  id v33 = 0LL;
  uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472LL;
  v22[2] = sub_100054E00;
  v22[3] = &unk_1000CE568;
  v22[4] = self;
  BOOL v27 = a3;
  id v11 = v8;
  id v23 = v11;
  id v12 = v9;
  id v24 = v12;
  id v25 = &v34;
  id v26 = &v28;
  dispatch_sync(v10, v22);

  if (v35[5])
  {
    id v13 = sub_100054EB8(v11);
    char v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    uint64_t v15 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = v29[5];
      *(_DWORD *)buf = 136315650;
      id v41 = "-[IXSCoordinatedAppInstall(IPCMethods) _remote_conveyPriorityReplacingExisting:forConnection:withCompletion:]";
      __int16 v42 = 2112;
      uint64_t v43 = v17;
      __int16 v44 = 2112;
      __int128 v45 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "%s: Existing priority boost already retained: %@; not retaining %@",
        buf,
        0x20u);
    }

    (*(void (**)(uint64_t, void, uint64_t, uint64_t, uint64_t, uint64_t))(v35[5] + 16))( v35[5],  0LL,  v18,  v19,  v20,  v21);
  }

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);
}

- (void)_remote_setInitialODRAssetPromiseUUIDs:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v26 = a4;
  uint64_t v6 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  __int128 v29 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  id v7 = v5;
  id v8 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v30;
    while (2)
    {
      id v11 = 0LL;
      do
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v29 + 1) + 8LL * (void)v11);
        id v13 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
        id v14 = [v13 promiseForUUID:v12 ofType:objc_opt_class(IXSOpaqueDataPromise)];
        uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

        if (!v15)
        {
          uint64_t v20 = sub_1000047B4((uint64_t)off_1000E8CA0);
          uint64_t v21 = (os_log_s *)objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            sub_1000819E8();
          }

          id v23 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setInitialODRAssetPromiseUUIDs:completion:]",  6668LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"Could not find ODR promise with UUID %@",  v22,  v12);
          id v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
          uint64_t v19 = v26;
          (*((void (**)(id, void *))v26 + 2))(v26, v24);

          id v18 = v7;
          goto LABEL_13;
        }

        -[NSMutableArray addObject:](v6, "addObject:", v15);

        id v11 = (char *)v11 + 1;
      }

      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v16 = -[NSMutableArray copy](v6, "copy");
  uint64_t v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000551DC;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v28 = v16;
  id v18 = v16;
  dispatch_sync(v17, block);

  uint64_t v19 = v26;
  (*((void (**)(id, void))v26 + 2))(v26, 0LL);

LABEL_13:
}

- (void)_remote_getInitialODRAssetPromises:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = sub_10003E9E8;
  id v11 = sub_10003E9F8;
  id v12 = 0LL;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000552D8;
  v6[3] = &unk_1000CD080;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  v4[2](v4, v8[5], 0LL);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_hasInitialODRAssetPromises:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100055584;
  v6[3] = &unk_1000CCEF8;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v8 + 24), 0LL);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_setUserDataPromiseUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
  id v9 = [v8 promiseForUUID:v6 ofType:objc_opt_class(IXSPromisedOutOfBandTransfer)];
  char v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (v10)
  {
    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100055758;
    block[3] = &unk_1000CCCB8;
    void block[4] = self;
    id v18 = v10;
    dispatch_sync(v11, block);

    v7[2](v7, 0LL);
  }

  else
  {
    id v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100081A58();
    }

    id v15 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setUserDataPromiseUUID:completion:]",  6717LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"Failed to locate user data promise with UUID %@",  v14,  (uint64_t)v6);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    ((void (**)(id, void *))v7)[2](v7, v16);
  }
}

- (void)_remote_getUserDataPromise:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  char v10 = sub_10003E9E8;
  id v11 = sub_10003E9F8;
  id v12 = 0LL;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100055854;
  v6[3] = &unk_1000CD080;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  v4[2](v4, v8[5], 0LL);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_hasUserDataPromise:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100055A04;
  v6[3] = &unk_1000CCEF8;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v8 + 24), 0LL);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_getUserDataRestoreShouldBegin:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100055B18;
  v6[3] = &unk_1000CCEF8;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v8 + 24), 0LL);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_setPreparationPromiseUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
  id v9 = [v8 promiseForUUID:v6 ofType:objc_opt_class(IXSPromisedOutOfBandTransfer)];
  char v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (v10)
  {
    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100055CE0;
    block[3] = &unk_1000CCCB8;
    void block[4] = self;
    id v18 = v10;
    dispatch_sync(v11, block);

    v7[2](v7, 0LL);
  }

  else
  {
    id v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100081AC8();
    }

    id v15 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setPreparationPromiseUUID:completion:]",  6763LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"Failed to locate preparation promise with UUID %@",  v14,  (uint64_t)v6);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    ((void (**)(id, void *))v7)[2](v7, v16);
  }
}

- (void)_remote_getPreparationPromise:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  char v10 = sub_10003E9E8;
  id v11 = sub_10003E9F8;
  id v12 = 0LL;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100055DDC;
  v6[3] = &unk_1000CD080;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  v4[2](v4, v8[5], 0LL);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_setDeviceSecurityPromiseUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  id v8 = (void *)objc_claimAutoreleasedReturnValue(+[IXSDataPromiseManager sharedInstance](&OBJC_CLASS___IXSDataPromiseManager, "sharedInstance"));
  id v9 = [v8 promiseForUUID:v6 ofType:objc_opt_class(IXSPromisedOutOfBandTransfer)];
  char v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (v10)
  {
    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10005604C;
    block[3] = &unk_1000CCCB8;
    void block[4] = self;
    id v18 = v10;
    dispatch_sync(v11, block);

    v7[2](v7, 0LL);
  }

  else
  {
    id v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_100081B38();
    }

    id v15 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setDeviceSecurityPromiseUUID:completion:]",  6791LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"Failed to locate device security promise with UUID %@",  v14,  (uint64_t)v6);
    id v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    ((void (**)(id, void *))v7)[2](v7, v16);
  }
}

- (void)_remote_getDeviceSecurityPromise:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  char v10 = sub_10003E9E8;
  id v11 = sub_10003E9F8;
  id v12 = 0LL;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100056148;
  v6[3] = &unk_1000CD080;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  v4[2](v4, v8[5], 0LL);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_getHasDeviceSecurityPromise:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_1000562F8;
  v6[3] = &unk_1000CCEF8;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v8 + 24), 0LL);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_setNeedsPostProcessing:(BOOL)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  if ((char *)-[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent") - 1 >= (char *)2)
  {
    id v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100081BA8(self, v9);
    }

    unint64_t v10 = -[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent");
    if (v10 >= 8) {
      id v12 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown intent value %lu",  v10));
    }
    else {
      id v12 = *(&off_1000CE7B0 + v10);
    }
    id v13 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setNeedsPostProcessing:completion:]",  6822LL,  @"IXErrorDomain",  4uLL,  0LL,  0LL,  @"Coordinator with intent %@ does not support post processing.",  v11,  (uint64_t)v12);
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    v6[2](v6, v14);
  }

  else
  {
    uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_1000564C0;
    block[3] = &unk_1000CD420;
    void block[4] = self;
    BOOL v16 = a3;
    dispatch_sync(v7, block);

    v6[2](v6, 0LL);
  }

- (void)_remote_getNeedsPostProcessing:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  if ((char *)-[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent") - 1 >= (char *)2)
  {
    id v6 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100081C6C(self, v7);
    }

    unint64_t v8 = -[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent");
    if (v8 >= 8) {
      unint64_t v10 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown intent value %lu",  v8));
    }
    else {
      unint64_t v10 = *(&off_1000CE7B0 + v8);
    }
    id v11 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_getNeedsPostProcessing:]",  6836LL,  @"IXErrorDomain",  4uLL,  0LL,  0LL,  @"Coordinator with intent %@ does not support post processing.",  v9,  (uint64_t)v10);
    id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

    v4[2](v4, 0LL, v12);
  }

  else
  {
    uint64_t v14 = 0LL;
    id v15 = &v14;
    uint64_t v16 = 0x2020000000LL;
    char v17 = 0;
    id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100056694;
    block[3] = &unk_1000CCEF8;
    void block[4] = self;
    void block[5] = &v14;
    dispatch_sync(v5, block);

    v4[2](v4, *((unsigned __int8 *)v15 + 24), 0LL);
    _Block_object_dispose(&v14, 8);
  }
}

- (void)_remote_getPostProcessingShouldBegin:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0LL;
  unint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10005679C;
  v6[3] = &unk_1000CCEF8;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v8 + 24), 0LL);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_setEssentialAssetPromiseUUIDs:(id)a3 completion:(id)a4
{
  id v33 = a3;
  uint64_t v34 = (void (**)(id, void *))a4;
  if ((char *)-[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent") - 1 >= (char *)2)
  {
    id v18 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100081E14();
    }

    id v21 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setEssentialAssetPromiseUUIDs:completion:]",  6863LL,  @"IXErrorDomain",  4uLL,  0LL,  0LL,  @"Coordinator %@ does not support post processing.",  v20,  (uint64_t)self);
    uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    v34[2](v34, v22);
  }

  else
  {
    uint64_t v42 = 0LL;
    uint64_t v43 = &v42;
    uint64_t v44 = 0x2020000000LL;
    char v45 = 0;
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100056C48;
    block[3] = &unk_1000CCEF8;
    void block[4] = self;
    void block[5] = &v42;
    __int128 v32 = self;
    dispatch_sync(v6, block);

    if (*((_BYTE *)v43 + 24))
    {
      uint64_t v7 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
      __int128 v39 = 0u;
      __int128 v40 = 0u;
      __int128 v37 = 0u;
      __int128 v38 = 0u;
      id v8 = v33;
      id v9 = [v8 countByEnumeratingWithState:&v37 objects:v46 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v38;
        while (2)
        {
          for (i = 0LL; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v38 != v10) {
              objc_enumerationMutation(v8);
            }
            uint64_t v12 = *(void *)(*((void *)&v37 + 1) + 8LL * (void)i);
            id v13 = (void *)objc_claimAutoreleasedReturnValue( +[IXSDataPromiseManager sharedInstance]( &OBJC_CLASS___IXSDataPromiseManager,  "sharedInstance"));
            id v14 = [v13 promiseForUUID:v12 ofType:objc_opt_class(IXSOpaqueDataPromise)];
            id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

            if (!v15)
            {
              id v23 = sub_1000047B4((uint64_t)off_1000E8CA0);
              id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue(v23);
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
                sub_100081DA4();
              }

              id v26 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setEssentialAssetPromiseUUIDs:completion:]",  6884LL,  @"IXErrorDomain",  3uLL,  0LL,  0LL,  @"Could not find essential asset promise with UUID %@",  v25,  v12);
              BOOL v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
              v34[2](v34, v27);

              goto LABEL_18;
            }

            -[NSMutableArray addObject:](v7, "addObject:", v15);
          }

          id v9 = [v8 countByEnumeratingWithState:&v37 objects:v46 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }

      id v16 = -[NSMutableArray copy](v7, "copy");
      char v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](v32, "internalQueue"));
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472LL;
      v35[2] = sub_100056C78;
      v35[3] = &unk_1000CCCB8;
      v35[4] = v32;
      id v8 = v16;
      id v36 = v8;
      dispatch_sync(v17, v35);

      v34[2](v34, 0LL);
LABEL_18:
    }

    else
    {
      id v28 = sub_1000047B4((uint64_t)off_1000E8CA0);
      __int128 v29 = (os_log_s *)objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_100081D34();
      }

      id v31 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setEssentialAssetPromiseUUIDs:completion:]",  6874LL,  @"IXErrorDomain",  4uLL,  0LL,  0LL,  @"Coordinator %@ does not have post processing enabled.",  v30,  (uint64_t)self);
      uint64_t v7 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(v31);
      v34[2](v34, v7);
    }

    _Block_object_dispose(&v42, 8);
  }
}

- (void)_remote_getEssentialAssetPromises:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  if ((char *)-[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent") - 1 >= (char *)2)
  {
    uint64_t v7 = sub_1000047B4((uint64_t)off_1000E8CA0);
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_100081EF4();
    }

    id v10 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_getEssentialAssetPromises:]",  6901LL,  @"IXErrorDomain",  4uLL,  0LL,  0LL,  @"Coordinator %@ does not support post processing.",  v9,  (uint64_t)self);
    id v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v4[2](v4, 0LL, v11);
  }

  else
  {
    uint64_t v23 = 0LL;
    id v24 = &v23;
    uint64_t v25 = 0x2020000000LL;
    char v26 = 0;
    uint64_t v17 = 0LL;
    id v18 = &v17;
    uint64_t v19 = 0x3032000000LL;
    uint64_t v20 = sub_10003E9E8;
    id v21 = sub_10003E9F8;
    id v22 = 0LL;
    id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100056F04;
    block[3] = &unk_1000CD330;
    void block[4] = self;
    void block[5] = &v23;
    void block[6] = &v17;
    dispatch_sync(v5, block);

    if (*((_BYTE *)v24 + 24))
    {
      id v6 = [(id)v18[5] copy];
      ((void (**)(id, id, void *))v4)[2](v4, v6, 0LL);
    }

    else
    {
      uint64_t v12 = sub_1000047B4((uint64_t)off_1000E8CA0);
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_100081E84();
      }

      id v15 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_getEssentialAssetPromises:]",  6926LL,  @"IXErrorDomain",  4uLL,  0LL,  0LL,  @"Coordinator %@ does not have post processing enabled.",  v14,  (uint64_t)self);
      id v6 = (id)objc_claimAutoreleasedReturnValue(v15);
      v4[2](v4, 0LL, v6);
    }

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v23, 8);
  }
}

- (void)_remote_hasEssentialAssetPromises:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  if ((char *)-[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent") - 1 >= (char *)2)
  {
    id v6 = sub_1000047B4((uint64_t)off_1000E8CA0);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100081FD4();
    }

    id v9 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_hasEssentialAssetPromises:]",  6936LL,  @"IXErrorDomain",  4uLL,  0LL,  0LL,  @"Coordinator %@ does not support post processing.",  v8,  (uint64_t)self);
    id v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v4[2](v4, 0LL, v10);
  }

  else
  {
    uint64_t v21 = 0LL;
    id v22 = &v21;
    uint64_t v23 = 0x2020000000LL;
    char v24 = 0;
    uint64_t v17 = 0LL;
    id v18 = &v17;
    uint64_t v19 = 0x2020000000LL;
    char v20 = 0;
    id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100057350;
    block[3] = &unk_1000CD330;
    void block[4] = self;
    void block[5] = &v21;
    void block[6] = &v17;
    dispatch_sync(v5, block);

    if (*((_BYTE *)v22 + 24))
    {
      v4[2](v4, *((unsigned __int8 *)v18 + 24), 0LL);
    }

    else
    {
      id v11 = sub_1000047B4((uint64_t)off_1000E8CA0);
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_100081F64();
      }

      id v14 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_hasEssentialAssetPromises:]",  6953LL,  @"IXErrorDomain",  4uLL,  0LL,  0LL,  @"Coordinator %@ does not have post processing enabled.",  v13,  (uint64_t)self);
      id v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v4[2](v4, 0LL, v15);
    }

    _Block_object_dispose(&v17, 8);
    _Block_object_dispose(&v21, 8);
  }
}

- (void)_remote_getIsComplete:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100057494;
  v6[3] = &unk_1000CCEF8;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v8 + 24), 0LL);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_getErrorInfo:(id)a3
{
  id v4 = (void (**)(id, uint64_t, uint64_t))a3;
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000LL;
  uint64_t v16 = 0LL;
  uint64_t v7 = 0LL;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  char v10 = sub_10003E9E8;
  id v11 = sub_10003E9F8;
  id v12 = 0LL;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000575F8;
  block[3] = &unk_1000CD330;
  void block[4] = self;
  void block[5] = &v13;
  void block[6] = &v7;
  dispatch_sync(v5, block);

  v4[2](v4, v14[3], v8[5]);
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
}

- (void)_remote_fireObserversForClient:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_1000576FC;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v7[2](v7, 0LL);
}

- (void)_remote_setIsPaused:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472LL;
  v9[2] = sub_1000577A8;
  v9[3] = &unk_1000CE370;
  BOOL v11 = a3;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  sub_10005A8F0(v7, v9);
}

- (void)_remote_getIsPausedWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100057890;
  v6[3] = &unk_1000CCEF8;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v8 + 24), 0LL);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_prioritizeWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472LL;
  v7[2] = sub_100057958;
  v7[3] = &unk_1000CD568;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  sub_10005A8F0(v5, v7);
}

- (void)_remote_getCoordinationState:(id)a3
{
  id v4 = a3;
  id v5 = (dispatch_group_s *)objc_claimAutoreleasedReturnValue( -[IXSCoordinatedAppInstall outstandingInstallOperationsGroup]( self,  "outstandingInstallOperationsGroup"));
  id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472LL;
  v8[2] = sub_100057A14;
  v8[3] = &unk_1000CD568;
  void v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_group_notify(v5, v6, v8);
}

- (void)_remote_getCoordinatorScopeWithCompletion:(id)a3
{
  id v4 = a3;
  (*((void (**)(id, void, void))v4 + 2))( v4,  -[IXSCoordinatedAppInstall coordinatorScope](self, "coordinatorScope"),  0LL);
}

- (void)_remote_convertToGloballyScopedWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100057BA0;
  block[3] = &unk_1000CCE58;
  void block[4] = self;
  dispatch_sync(v5, block);

  v4[2](v4, 0LL);
}

- (void)_remote_setPlaceholderDisposition:(unint64_t)a3 completion:(id)a4
{
  id v6 = (void (**)(id, void *))a4;
  unint64_t v7 = -[IXSCoordinatedAppInstall effectiveIntent](self, "effectiveIntent");
  id v8 = sub_1000047B4((uint64_t)off_1000E8CA0);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue(v8);
  char v10 = v9;
  if ((v7 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = IXStringForPlaceholderDisposition(a3);
      id v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      *(_DWORD *)buf = 136315650;
      char v20 = "-[IXSCoordinatedAppInstall(IPCMethods) _remote_setPlaceholderDisposition:completion:]";
      __int16 v21 = 2112;
      id v22 = self;
      __int16 v23 = 2112;
      char v24 = v12;
      _os_log_impl( (void *)&_mh_execute_header,  v10,  OS_LOG_TYPE_DEFAULT,  "%s: %@: setting placeholderDisposition to %@",  buf,  0x20u);
    }

    uint64_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_100057EC4;
    block[3] = &unk_1000CCBD8;
    void block[4] = self;
    void block[5] = a3;
    dispatch_sync(v13, block);

    id v14 = 0LL;
  }

  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100082044(v7, v10);
    }

    if (v7 >= 8) {
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Unknown intent value %lu",  v7));
    }
    else {
      uint64_t v16 = *(&off_1000CE7B0 + v7);
    }
    id v17 = sub_10003556C( (uint64_t)"-[IXSCoordinatedAppInstall(IPCMethods) _remote_setPlaceholderDisposition:completion:]",  7052LL,  @"IXErrorDomain",  4uLL,  0LL,  0LL,  @"Placeholder disposition is not applicable to coordinator type %@.",  v15,  (uint64_t)v16);
    id v14 = (void *)objc_claimAutoreleasedReturnValue(v17);
  }

  v6[2](v6, v14);
}

- (void)_remote_getPlaceholderDispositionWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v10 = 1LL;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100057FA8;
  v6[3] = &unk_1000CCEF8;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  v4[2](v4, v8[3], 0LL);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_setProgressHint:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100058090;
  block[3] = &unk_1000CCCB8;
  void block[4] = self;
  id v11 = v6;
  id v9 = v6;
  dispatch_sync(v8, block);

  v7[2](v7, 0LL);
}

- (void)_remote_getProgressHintWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  uint64_t v10 = sub_10003E9E8;
  id v11 = sub_10003E9F8;
  id v12 = 0LL;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_10005818C;
  v6[3] = &unk_1000CCEF8;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  v4[2](v4, v8[5], 0LL);
  _Block_object_dispose(&v7, 8);
}

- (void)_remote_setRemovability:(unint64_t)a3 byClient:(unint64_t)a4 completion:(id)a5
{
  id v8 = (void (**)(id, void))a5;
  uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_10005826C;
  block[3] = &unk_1000CCBB0;
  void block[4] = self;
  void block[5] = a3;
  void block[6] = a4;
  dispatch_sync(v9, block);

  v8[2](v8, 0LL);
}

- (void)_remote_removabilityWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  uint64_t v10 = 0LL;
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue(-[IXSCoordinatedAppInstall internalQueue](self, "internalQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472LL;
  v6[2] = sub_100058354;
  v6[3] = &unk_1000CCEF8;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v5, v6);

  v4[2](v4, v8[3], 0LL);
  _Block_object_dispose(&v7, 8);
}

@end