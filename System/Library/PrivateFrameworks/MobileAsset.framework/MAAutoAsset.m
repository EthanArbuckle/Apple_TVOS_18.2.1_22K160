@interface MAAutoAsset
+ (BOOL)hasStartupActivatedCompletedOnce;
+ (BOOL)supportsSecureCoding;
+ (id)assetSelectorForAssetTargetOSVersion:(id)a3 forTargetBuildVersion:(id)a4;
+ (id)cancelActivityForSelectorSync:(id)a3;
+ (id)defaultDispatchQueue;
+ (id)determineIfAvailableSync:(id)a3 forAssetSelector:(id)a4 discoveredAttributes:(id *)a5 error:(id *)a6;
+ (id)eliminateAllForAssetTypeSync:(id)a3;
+ (id)eliminateAllForSelectorSync:(id)a3;
+ (id)eliminatePromotedNeverLockedForSelectorSync:(id)a3;
+ (id)endAllPreviousLocksOfReasonSync:(id)a3 forAssetSelector:(id)a4;
+ (id)endAllPreviousLocksOfReasonSync:(id)a3 forClientName:(id)a4 forAssetSelector:(id)a5;
+ (id)endAllPreviousLocksOfSelectorSync:(id)a3;
+ (id)endAllPreviousLocksOfSelectorSync:(id)a3 forClientName:(id)a4;
+ (id)endPreviousLocksOfReasonSync:(id)a3 forAssetSelector:(id)a4 removingLockCount:(int64_t)a5;
+ (id)endPreviousLocksOfReasonSync:(id)a3 forClientName:(id)a4 forAssetSelector:(id)a5 removingLockCount:(int64_t)a6;
+ (id)frameworkDispatchQueue;
+ (id)frameworkInstanceUUID;
+ (id)interestInContentSync:(id)a3 forAssetSelector:(id)a4;
+ (id)interestInContentSync:(id)a3 forAssetSelector:(id)a4 withInterestPolicy:(id)a5;
+ (id)stageCancelOperationSync;
+ (id)stageDetermineAllAvailableForUpdateSync:(id)a3 totalExpectedBytes:(unint64_t *)a4 error:(id *)a5;
+ (id)stageDetermineAllAvailableSync:(id)a3 forTargetBuildVersion:(id)a4 totalExpectedBytes:(unint64_t *)a5 error:(id *)a6;
+ (id)stageDetermineGroupsAvailableForUpdateSync:(id)a3 totalExpectedBytes:(id *)a4 error:(id *)a5;
+ (id)stageDownloadGroupsSync:(id)a3 awaitingAllGroups:(BOOL)a4 withStagingTimeout:(int64_t)a5 byGroupAssetsStaged:(id *)a6 error:(id *)a7 reportingProgress:(id)a8;
+ (id)stageEraseAllSync;
+ (id)stagePurgeAllSync;
+ (int64_t)waitOnSemaphore:(id)a3 withDaemonTriggeredTimeout:(int64_t)a4;
+ (unint64_t)stageDownloadAllSync:(int64_t)a3 assetsSuccessfullyStaged:(int64_t *)a4 error:(id *)a5 reportingProgress:(id)a6;
+ (void)cancelActivityForSelector:(id)a3 completion:(id)a4;
+ (void)determineIfAvailable:(id)a3 forAssetSelector:(id)a4 completion:(id)a5;
+ (void)eliminateAllForAssetType:(id)a3 completion:(id)a4;
+ (void)eliminateAllForSelector:(id)a3 completion:(id)a4;
+ (void)eliminatePromotedNeverLockedForSelector:(id)a3 completion:(id)a4;
+ (void)endAllPreviousLocksOfReason:(id)a3 forAssetSelector:(id)a4 completion:(id)a5;
+ (void)endAllPreviousLocksOfReason:(id)a3 forClientName:(id)a4 forAssetSelector:(id)a5 completion:(id)a6;
+ (void)endAllPreviousLocksOfSelector:(id)a3 completion:(id)a4;
+ (void)endAllPreviousLocksOfSelector:(id)a3 forClientName:(id)a4 completion:(id)a5;
+ (void)endPreviousLocksOfReason:(id)a3 forAssetSelector:(id)a4 removingLockCount:(int64_t)a5 completion:(id)a6;
+ (void)endPreviousLocksOfReason:(id)a3 forClientName:(id)a4 forAssetSelector:(id)a5 removingLockCount:(int64_t)a6 completion:(id)a7;
+ (void)frameworkInstanceSetLogDomain;
+ (void)interestInContent:(id)a3 forAssetSelector:(id)a4 completion:(id)a5;
+ (void)interestInContent:(id)a3 forAssetSelector:(id)a4 withInterestPolicy:(id)a5 completion:(id)a6;
+ (void)logMAAutoAssetVersion;
+ (void)stageCancelOperation:(id)a3;
+ (void)stageDetermineAllAvailable:(id)a3 forTargetBuildVersion:(id)a4 completion:(id)a5;
+ (void)stageDetermineAllAvailableForUpdate:(id)a3 completion:(id)a4;
+ (void)stageDetermineGroupsAvailableForUpdate:(id)a3 completion:(id)a4;
+ (void)stageDownloadAll:(int64_t)a3 reportingProgress:(id)a4 completion:(id)a5;
+ (void)stageDownloadGroups:(id)a3 awaitingAllGroups:(BOOL)a4 withStagingTimeout:(int64_t)a5 reportingProgress:(id)a6 completion:(id)a7;
+ (void)stageEraseAll:(id)a3;
+ (void)stagePurgeAll:(id)a3;
- (MAAutoAsset)initWithCoder:(id)a3;
- (MAAutoAssetSelector)assetSelector;
- (MAAutoAssetSelector)contentLockedSelector;
- (NSDictionary)assetAttributes;
- (NSString)autoAssetClientName;
- (NSString)contentLockedReason;
- (NSString)description;
- (NSString)updateCategoryDesiredByClient;
- (NSURL)localContentURL;
- (OS_dispatch_queue)completionDispatchQueue;
- (id)_cancelActivityForSelectorSync;
- (id)_eliminateAllForAssetTypeSync;
- (id)_eliminateAllForSelectorSync;
- (id)_eliminatePromotedNeverLockedForSelectorSync;
- (id)_endAllPreviousLocksOfReasonSync:(id)a3;
- (id)_endPreviousLocksOfReasonSync:(id)a3 removingLockCount:(int64_t)a4;
- (id)_newProxyObjectForLockProgressBlock:(id)a3;
- (id)_newProxyObjectForStageProgressBlock:(id)a3;
- (id)_stageCancelOperationSync;
- (id)_stageDetermineAllAvailableForUpdateSync:(id)a3 totalExpectedBytes:(unint64_t *)a4 error:(id *)a5;
- (id)_stageDetermineAllAvailableSync:(id)a3 forTargetBuildVersion:(id)a4 totalExpectedBytes:(unint64_t *)a5 error:(id *)a6;
- (id)_stageDetermineGroupsAvailableForUpdateSync:(id)a3 totalExpectedBytes:(id *)a4 error:(id *)a5;
- (id)_stageDownloadGroupsSync:(id)a3 awaitingAllGroups:(BOOL)a4 withStagingTimeout:(int64_t)a5 byGroupAssetsStaged:(id *)a6 error:(id *)a7 reportingProgress:(id)a8;
- (id)_stageEraseAllSync;
- (id)_stagePurgeAllSync;
- (id)assetAttribute:(id)a3;
- (id)checkForNewerSync:(id)a3 withTimeout:(int64_t)a4 discoveredAttributes:(id *)a5 error:(id *)a6;
- (id)checkForNewerSync:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 discoveredAttributes:(id *)a6 error:(id *)a7;
- (id)continueLockUsageSync:(id)a3;
- (id)continueLockUsageSync:(id)a3 withUsagePolicy:(id)a4;
- (id)currentStatusSync:(id *)a3;
- (id)determineIfAvailableSync:(id)a3 withTimeout:(int64_t)a4 discoveredAttributes:(id *)a5 error:(id *)a6;
- (id)endLockUsageSync:(id)a3;
- (id)initForClientName:(id)a3 selectingAsset:(id)a4 completingFromQueue:(id)a5 error:(id *)a6;
- (id)initForClientName:(id)a3 selectingAsset:(id)a4 error:(id *)a5;
- (id)initForClientName:(id)a3 selectingAsset:(id)a4 usingDesiredPolicyCategory:(id)a5 completingFromQueue:(id)a6 error:(id *)a7;
- (id)initForClientName:(id)a3 selectingAsset:(id)a4 usingDesiredPolicyCategory:(id)a5 error:(id *)a6;
- (id)interestInContentSync:(id)a3;
- (id)interestInContentSync:(id)a3 withInterestPolicy:(id)a4;
- (id)lockContentSync:(id)a3 withTimeout:(int64_t)a4 lockedAssetSelector:(id *)a5 newerInProgress:(id *)a6 error:(id *)a7;
- (id)lockContentSync:(id)a3 withTimeout:(int64_t)a4 lockedAssetSelector:(id *)a5 newerInProgress:(id *)a6 error:(id *)a7 reportingProgress:(id)a8;
- (id)lockContentSync:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 lockedAssetSelector:(id *)a6 newerInProgress:(id *)a7 error:(id *)a8;
- (id)lockContentSync:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 lockedAssetSelector:(id *)a6 newerInProgress:(id *)a7 error:(id *)a8 reportingProgress:(id)a9;
- (id)mapLockedContentSync:(id)a3 error:(id *)a4;
- (id)summary;
- (int)locksOfContent;
- (unint64_t)_stageDownloadAllSync:(int64_t)a3 assetsSuccessfullyStaged:(int64_t *)a4 error:(id *)a5 reportingProgress:(id)a6;
- (void)_cancelActivityForSelector:(id)a3;
- (void)_eliminateAllForAssetType:(id)a3;
- (void)_eliminateAllForSelector:(id)a3;
- (void)_eliminatePromotedNeverLockedForSelector:(id)a3;
- (void)_endAllPreviousLocksOfReason:(id)a3 completion:(id)a4;
- (void)_endPreviousLocksOfReason:(id)a3 removingLockCount:(int64_t)a4 completion:(id)a5;
- (void)_failedCancelActivity:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6;
- (void)_failedCheckForNewer:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6;
- (void)_failedContinueLockUsage:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6;
- (void)_failedCurrentStatus:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6;
- (void)_failedDetermineIfAvailable:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6;
- (void)_failedEliminate:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6;
- (void)_failedEndLockUsage:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6;
- (void)_failedInterestInContent:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6;
- (void)_failedLockContent:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6;
- (void)_failedMapLockedContent:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6;
- (void)_failedStageCancelOperation:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6;
- (void)_failedStageDetermineAllAvailable:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6;
- (void)_failedStageDetermineGroupsAvailableForUpdate:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6;
- (void)_failedStageDownloadAll:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6;
- (void)_failedStageDownloadGroups:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6;
- (void)_failedStageEraseAll:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6;
- (void)_failedStagePurgeAll:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6;
- (void)_lockContentStatusProgress:(id)a3 lockForUseError:(id)a4 progressBlock:(id)a5;
- (void)_stageCancelOperation:(id)a3;
- (void)_stageDetermineAllAvailable:(id)a3 forTargetBuildVersion:(id)a4 completion:(id)a5;
- (void)_stageDetermineAllAvailableForUpdate:(id)a3 completion:(id)a4;
- (void)_stageDetermineGroupsAvailableForUpdate:(id)a3 completion:(id)a4;
- (void)_stageDownloadAll:(int64_t)a3 reportingProgress:(id)a4 completion:(id)a5;
- (void)_stageDownloadAllStatusProgress:(id)a3 stageProgressError:(id)a4 progressBlock:(id)a5;
- (void)_stageDownloadGroups:(id)a3 awaitingAllGroups:(BOOL)a4 withStagingTimeout:(int64_t)a5 reportingProgress:(id)a6 completion:(id)a7;
- (void)_stageEraseAll:(id)a3;
- (void)_stagePurgeAll:(id)a3;
- (void)_successCancelActivity:(id)a3;
- (void)_successCheckForNewer:(id)a3 completion:(id)a4;
- (void)_successContinueLockUsage:(id)a3 completion:(id)a4;
- (void)_successCurrentStatus:(id)a3 completion:(id)a4;
- (void)_successDetermineIfAvailable:(id)a3 completion:(id)a4;
- (void)_successEliminate:(id)a3;
- (void)_successEndLockUsage:(id)a3 completion:(id)a4;
- (void)_successInterestInContent:(id)a3 completion:(id)a4;
- (void)_successLockContent:(id)a3 dueToDesire:(id)a4 sandboxExtension:(id)a5 sandboxExtensionPath:(id)a6 completion:(id)a7;
- (void)_successMapLockedContent:(id)a3 dueToDesire:(id)a4 completion:(id)a5;
- (void)_successStageCancelOperation:(id)a3;
- (void)_successStageDetermineAllAvailable:(id)a3 completion:(id)a4;
- (void)_successStageDetermineGroupsAvailableForUpdate:(id)a3 completion:(id)a4;
- (void)_successStageDownloadAll:(id)a3 completion:(id)a4;
- (void)_successStageDownloadGroups:(id)a3 completion:(id)a4;
- (void)_successStageEraseAll:(id)a3;
- (void)_successStagePurgeAll:(id)a3;
- (void)checkForNewer:(id)a3 withTimeout:(int64_t)a4 completion:(id)a5;
- (void)checkForNewer:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 completion:(id)a6;
- (void)connectToServerFrameworkCompletion:(id)a3;
- (void)continueLockUsage:(id)a3 completion:(id)a4;
- (void)continueLockUsage:(id)a3 withUsagePolicy:(id)a4 completion:(id)a5;
- (void)currentStatus:(id)a3;
- (void)determineIfAvailable:(id)a3 withTimeout:(int64_t)a4 completion:(id)a5;
- (void)encodeWithCoder:(id)a3;
- (void)endLockUsage:(id)a3 completion:(id)a4;
- (void)interestInContent:(id)a3 completion:(id)a4;
- (void)interestInContent:(id)a3 withInterestPolicy:(id)a4 completion:(id)a5;
- (void)lockContent:(id)a3 withTimeout:(int64_t)a4 completion:(id)a5;
- (void)lockContent:(id)a3 withTimeout:(int64_t)a4 reportingProgress:(id)a5 completion:(id)a6;
- (void)lockContent:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 completion:(id)a6;
- (void)lockContent:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 reportingProgress:(id)a6 completion:(id)a7;
- (void)mapLockedContent:(id)a3 completion:(id)a4;
- (void)setAssetAttributes:(id)a3;
- (void)setContentLockedReason:(id)a3;
- (void)setContentLockedSelector:(id)a3;
- (void)setLocalContentURL:(id)a3;
- (void)setLocksOfContent:(int)a3;
@end

@implementation MAAutoAsset

- (id)initForClientName:(id)a3 selectingAsset:(id)a4 error:(id *)a5
{
  return -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]( self,  "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:",  a3,  a4,  0LL,  0LL,  a5);
}

- (id)initForClientName:(id)a3 selectingAsset:(id)a4 completingFromQueue:(id)a5 error:(id *)a6
{
  return -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]( self,  "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:",  a3,  a4,  0LL,  a5,  a6);
}

- (id)initForClientName:(id)a3 selectingAsset:(id)a4 usingDesiredPolicyCategory:(id)a5 error:(id *)a6
{
  return -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]( self,  "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:",  a3,  a4,  a5,  0LL,  a6);
}

- (id)initForClientName:(id)a3 selectingAsset:(id)a4 usingDesiredPolicyCategory:(id)a5 completingFromQueue:(id)a6 error:(id *)a7
{
  id v13 = a3;
  id v14 = a4;
  id v29 = a5;
  id v15 = a6;
  +[MAAutoAsset logMAAutoAssetVersion](&OBJC_CLASS___MAAutoAsset, "logMAAutoAssetVersion");
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___MAAutoAsset;
  v16 = -[MAAutoAsset init](&v30, sel_init);
  if (!v16)
  {
LABEL_10:
    v24 = v16;
    goto LABEL_23;
  }

  +[MAAutoAsset frameworkInstanceSetLogDomain](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceSetLogDomain");
  objc_storeStrong((id *)&v16->_autoAssetClientName, a3);
  p_assetSelector = &v16->_assetSelector;
  objc_storeStrong((id *)&v16->_assetSelector, a4);
  objc_storeStrong((id *)&v16->_updateCategoryDesiredByClient, a5);
  contentLockedSelector = v16->_contentLockedSelector;
  v16->_contentLockedSelector = 0LL;

  contentLockedReason = v16->_contentLockedReason;
  v16->_contentLockedReason = 0LL;

  localContentURL = v16->_localContentURL;
  v16->_localContentURL = 0LL;

  assetAttributes = v16->_assetAttributes;
  v16->_assetAttributes = 0LL;

  if (v15)
  {
    v22 = (OS_dispatch_queue *)v15;
  }

  else
  {
    +[MAAutoAsset defaultDispatchQueue](&OBJC_CLASS___MAAutoAsset, "defaultDispatchQueue");
    v22 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  }

  completionDispatchQueue = v16->_completionDispatchQueue;
  v16->_completionDispatchQueue = v22;

  v16->_locksOfContent = 0;
  if (v16->_autoAssetClientName && *p_assetSelector)
  {
    if (v16->_completionDispatchQueue)
    {
      if (a7) {
        *a7 = 0LL;
      }
      goto LABEL_10;
    }

    if (a7)
    {
      objc_msgSend(MEMORY[0x189607940], "stringWithFormat:", @"failed to initialize, missing:");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (!v16->_completionDispatchQueue) {
        [v26 appendString:@" completionDispatchQueue"];
      }
      +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  @"auto(defaultDispatchQueue)",  0LL,  v27);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }

- (MAAutoAsset)initWithCoder:(id)a3
{
  v25[8] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___MAAutoAsset;
  v5 = -[MAAutoAsset init](&v24, sel_init);
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"autoAssetClientName"];
    autoAssetClientName = v5->_autoAssetClientName;
    v5->_autoAssetClientName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetSelector"];
    assetSelector = v5->_assetSelector;
    v5->_assetSelector = (MAAutoAssetSelector *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"updateCategoryDesiredByClient"];
    updateCategoryDesiredByClient = v5->_updateCategoryDesiredByClient;
    v5->_updateCategoryDesiredByClient = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentLockedSelector"];
    contentLockedSelector = v5->_contentLockedSelector;
    v5->_contentLockedSelector = (MAAutoAssetSelector *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contentLockedReason"];
    contentLockedReason = v5->_contentLockedReason;
    v5->_contentLockedReason = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localContentURL"];
    localContentURL = v5->_localContentURL;
    v5->_localContentURL = (NSURL *)v16;

    v18 = (void *)MEMORY[0x189604010];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    v25[2] = objc_opt_class();
    v25[3] = objc_opt_class();
    v25[4] = objc_opt_class();
    v25[5] = objc_opt_class();
    v25[6] = objc_opt_class();
    v25[7] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v25 count:8];
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 setWithArray:v19];
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"assetAttributes"];
    assetAttributes = v5->_assetAttributes;
    v5->_assetAttributes = (NSDictionary *)v21;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[MAAutoAsset autoAssetClientName](self, "autoAssetClientName");
  [v4 encodeObject:v5 forKey:@"autoAssetClientName"];

  -[MAAutoAsset assetSelector](self, "assetSelector");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v6 forKey:@"assetSelector"];
  v7 = -[MAAutoAsset updateCategoryDesiredByClient](self, "updateCategoryDesiredByClient");
  [v4 encodeObject:v7 forKey:@"updateCategoryDesiredByClient"];

  -[MAAutoAsset contentLockedSelector](self, "contentLockedSelector");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"contentLockedSelector"];
  v9 = -[MAAutoAsset contentLockedReason](self, "contentLockedReason");
  [v4 encodeObject:v9 forKey:@"contentLockedReason"];

  -[MAAutoAsset localContentURL](self, "localContentURL");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v10 forKey:@"localContentURL"];

  -[MAAutoAsset assetAttributes](self, "assetAttributes");
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v11 forKey:@"assetAttributes"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)interestInContent:(id)a3 completion:(id)a4
{
}

- (void)interestInContent:(id)a3 withInterestPolicy:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __63__MAAutoAsset_interestInContent_withInterestPolicy_completion___block_invoke;
    v13[3] = &unk_189FF9528;
    v13[4] = self;
    id v14 = v9;
    id v15 = v8;
    id v16 = v10;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v13);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 oslog];
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset interestInContent:withInterestPolicy:completion:].cold.1();
    }
  }
}

void __63__MAAutoAsset_interestInContent_withInterestPolicy_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _failedInterestInContent:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 56)];
  }

  else
  {
    v3 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    [*(id *)(a1 + 32) autoAssetClientName];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = __maAutoAssetSharedClientProcessName;
    uint64_t v6 = __maAutoAssetSharedClientProcessID;
    [*(id *)(a1 + 32) assetSelector];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v3,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  v4,  v5,  v6,  v7,  v8);

    id v10 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoDesire);
    [*(id *)(a1 + 32) updateCategoryDesiredByClient];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = -[MAAutoAssetInfoDesire initWithDesiredCategory:forClientAssetPolicy:reasonDesired:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:]( v10,  "initWithDesiredCategory:forClientAssetPolicy:reasonDesired:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:",  v11,  *(void *)(a1 + 40),  *(void *)(a1 + 48),  -101LL,  -101LL,  0LL);

    id v13 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 UUIDString];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();

    [v13 setSafeObject:v9 forKey:@"instance"];
    [v13 setSafeObject:v12 forKey:@"desire"];
    id v16 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO:INTEREST_IN_CONTENT" clientID:v15 version:0 message:v13];
    v17 = (void *)__maAutoAssetSharedConnectionClient;
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __63__MAAutoAsset_interestInContent_withInterestPolicy_completion___block_invoke_2;
    v18[3] = &unk_189FF94D8;
    v18[4] = *(void *)(a1 + 32);
    id v19 = *(id *)(a1 + 56);
    [v17 connectClientSendServerMessage:v16 proxyObject:0 withReply:v18];
  }

void __63__MAAutoAsset_interestInContent_withInterestPolicy_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v12 = a2;
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  if (!v12 || v5)
  {
    if (v5)
    {
      id v8 = @"failure reported by server";
      id v9 = *(void **)(a1 + 32);
      uint64_t v10 = 0LL;
      id v11 = v5;
    }

    else
    {
      id v8 = @"no response message from server";
      id v9 = *(void **)(a1 + 32);
      uint64_t v10 = 6104LL;
      id v11 = 0LL;
    }

    [v9 _failedInterestInContent:v10 withResponseError:v11 description:v8 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [*(id *)(a1 + 32) assetSelector];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 _successInterestInContent:v7 completion:*(void *)(a1 + 40)];
  }
}

- (id)interestInContentSync:(id)a3
{
  return -[MAAutoAsset interestInContentSync:withInterestPolicy:]( self,  "interestInContentSync:withInterestPolicy:",  a3,  0LL);
}

- (id)interestInContentSync:(id)a3 withInterestPolicy:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v31[0] = 0LL;
  v31[1] = v31;
  v31[2] = 0x3032000000LL;
  v31[3] = __Block_byref_object_copy__5;
  v31[4] = __Block_byref_object_dispose__5;
  id v32 = 0LL;
  uint64_t v25 = 0LL;
  v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  v28 = __Block_byref_object_copy__5;
  id v29 = __Block_byref_object_dispose__5;
  id v30 = 0LL;
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x2020000000LL;
  char v24 = 0;
  v21[0] = 0LL;
  v21[1] = v21;
  v21[2] = 0x2020000000LL;
  char v22 = 0;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0LL);
  uint64_t v9 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __56__MAAutoAsset_interestInContentSync_withInterestPolicy___block_invoke;
  v15[3] = &unk_189FFAB10;
  v17 = v21;
  v18 = v31;
  id v19 = &v25;
  v20 = v23;
  uint64_t v10 = v8;
  id v16 = v10;
  -[MAAutoAsset interestInContent:withInterestPolicy:completion:]( self,  "interestInContent:withInterestPolicy:completion:",  v6,  v7,  v15);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:]( &OBJC_CLASS___MAAutoAsset,  "waitOnSemaphore:withDaemonTriggeredTimeout:",  v10,  -100LL))
  {
    +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v9;
    block[1] = 3221225472LL;
    block[2] = __56__MAAutoAsset_interestInContentSync_withInterestPolicy___block_invoke_3;
    block[3] = &unk_189FFAB38;
    block[4] = v23;
    block[5] = v21;
    block[6] = v31;
    block[7] = &v25;
    dispatch_sync(v11, block);
  }

  id v12 = (id)v26[5];

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(v31, 8);
  return v12;
}

void __56__MAAutoAsset_interestInContentSync_withInterestPolicy___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)uint64_t v10 = *(_OWORD *)(a1 + 32);
  __int128 v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __56__MAAutoAsset_interestInContentSync_withInterestPolicy___block_invoke_2;
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

uint64_t __56__MAAutoAsset_interestInContentSync_withInterestPolicy___block_invoke_2(uint64_t result)
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

void __56__MAAutoAsset_interestInContentSync_withInterestPolicy___block_invoke_3(void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = *(void *)(a1[6] + 8LL);
    v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0LL;

    uint64_t v4 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto(interestInContentSync)",  0LL,  @"timeout (at framework layer) while waiting for interest-in-content to complete");
    uint64_t v5 = *(void *)(a1[7] + 8LL);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }

- (void)checkForNewer:(id)a3 withTimeout:(int64_t)a4 completion:(id)a5
{
}

- (void)checkForNewer:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v12)
  {
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __68__MAAutoAsset_checkForNewer_withUsagePolicy_withTimeout_completion___block_invoke;
    v15[3] = &unk_189FFAB60;
    void v15[4] = self;
    id v16 = v11;
    id v17 = v10;
    int64_t v19 = a5;
    id v18 = v12;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v15);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 oslog];
    __int128 v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset checkForNewer:withUsagePolicy:withTimeout:completion:].cold.1();
    }
  }
}

void __68__MAAutoAsset_checkForNewer_withUsagePolicy_withTimeout_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _failedCheckForNewer:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 56)];
  }

  else
  {
    v3 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    [*(id *)(a1 + 32) autoAssetClientName];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = __maAutoAssetSharedClientProcessName;
    uint64_t v6 = __maAutoAssetSharedClientProcessID;
    [*(id *)(a1 + 32) assetSelector];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v3,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  v4,  v5,  v6,  v7,  v8);

    id v10 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoDesire);
    [*(id *)(a1 + 32) updateCategoryDesiredByClient];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = -[MAAutoAssetInfoDesire initWithDesiredCategory:forClientAssetPolicy:reasonDesired:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:]( v10,  "initWithDesiredCategory:forClientAssetPolicy:reasonDesired:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:",  v11,  *(void *)(a1 + 40),  *(void *)(a1 + 48),  *(void *)(a1 + 64),  -101LL,  0LL);

    id v13 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 UUIDString];
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();

    [v13 setSafeObject:v9 forKey:@"instance"];
    [v13 setSafeObject:v12 forKey:@"desire"];
    id v16 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO:CHECK_FOR_NEWER" clientID:v15 version:0 message:v13];
    id v17 = (void *)__maAutoAssetSharedConnectionClient;
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __68__MAAutoAsset_checkForNewer_withUsagePolicy_withTimeout_completion___block_invoke_2;
    v18[3] = &unk_189FF94D8;
    v18[4] = *(void *)(a1 + 32);
    id v19 = *(id *)(a1 + 56);
    [v17 connectClientSendServerMessage:v16 proxyObject:0 withReply:v18];
  }

void __68__MAAutoAsset_checkForNewer_withUsagePolicy_withTimeout_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v16 = a2;
  id v5 = a3;
  if (!v16 || v5)
  {
    if (v5)
    {
      id v13 = @"failure reported by server";
      uint64_t v14 = 0LL;
      id v15 = v5;
    }

    else
    {
      id v13 = @"no response message from server";
      uint64_t v14 = 6104LL;
      id v15 = 0LL;
    }

    [*(id *)(a1 + 32) _failedCheckForNewer:v14 withResponseError:v15 description:v13 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v16 message];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 safeObjectForKey:@"found" ofClass:objc_opt_class()];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      [v7 currentStatus];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 newerVersionError];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();

      id v10 = *(void **)(a1 + 32);
      if (v9)
      {
        [v7 currentStatus];
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 newerVersionError];
        id v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 _failedCheckForNewer:0 withResponseError:v12 description:@"found-information indicated error" completion:*(void *)(a1 + 40)];
      }

      else
      {
        [*(id *)(a1 + 32) _successCheckForNewer:v7 completion:*(void *)(a1 + 40)];
      }
    }

    else
    {
      [*(id *)(a1 + 32) _failedCheckForNewer:6104 withResponseError:0 description:@"no found-information provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

- (id)checkForNewerSync:(id)a3 withTimeout:(int64_t)a4 discoveredAttributes:(id *)a5 error:(id *)a6
{
  return -[MAAutoAsset checkForNewerSync:withUsagePolicy:withTimeout:discoveredAttributes:error:]( self,  "checkForNewerSync:withUsagePolicy:withTimeout:discoveredAttributes:error:",  a3,  0LL,  a4,  a5,  a6);
}

- (id)checkForNewerSync:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 discoveredAttributes:(id *)a6 error:(id *)a7
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v46 = 0LL;
  v47 = &v46;
  uint64_t v48 = 0x3032000000LL;
  v49 = __Block_byref_object_copy__5;
  v50 = __Block_byref_object_dispose__5;
  id v51 = 0LL;
  uint64_t v40 = 0LL;
  v41 = &v40;
  uint64_t v42 = 0x3032000000LL;
  v43 = __Block_byref_object_copy__5;
  v44 = __Block_byref_object_dispose__5;
  id v45 = 0LL;
  uint64_t v34 = 0LL;
  v35 = &v34;
  uint64_t v36 = 0x3032000000LL;
  v37 = __Block_byref_object_copy__5;
  v38 = __Block_byref_object_dispose__5;
  id v39 = 0LL;
  v32[0] = 0LL;
  v32[1] = v32;
  v32[2] = 0x2020000000LL;
  char v33 = 0;
  v30[0] = 0LL;
  v30[1] = v30;
  v30[2] = 0x2020000000LL;
  char v31 = 0;
  v28[0] = 0LL;
  v28[1] = v28;
  v28[2] = 0x2020000000LL;
  char v29 = 0;
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0LL);
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __88__MAAutoAsset_checkForNewerSync_withUsagePolicy_withTimeout_discoveredAttributes_error___block_invoke;
  v20[3] = &unk_189FFABB0;
  char v22 = v28;
  v23 = &v46;
  char v24 = v32;
  uint64_t v25 = &v40;
  v26 = &v34;
  uint64_t v27 = v30;
  id v13 = v12;
  uint64_t v21 = v13;
  -[MAAutoAsset checkForNewer:withUsagePolicy:withTimeout:completion:]( self,  "checkForNewer:withUsagePolicy:withTimeout:completion:",  v10,  v11,  a5,  v20);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:]( &OBJC_CLASS___MAAutoAsset,  "waitOnSemaphore:withDaemonTriggeredTimeout:",  v13,  a5))
  {
    +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
    uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __88__MAAutoAsset_checkForNewerSync_withUsagePolicy_withTimeout_discoveredAttributes_error___block_invoke_3;
    block[3] = &unk_189FFAB38;
    void block[4] = v30;
    block[5] = v28;
    block[6] = &v40;
    block[7] = &v34;
    dispatch_sync(v14, block);
  }

  if (a6) {
    *a6 = (id) v41[5];
  }
  if (a7) {
    *a7 = (id) v35[5];
  }
  id v15 = (id)v47[5];

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);
  _Block_object_dispose(&v34, 8);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);

  return v15;
}

void __88__MAAutoAsset_checkForNewerSync_withUsagePolicy_withTimeout_discoveredAttributes_error___block_invoke( uint64_t a1,  void *a2,  char a3,  void *a4,  void *a5)
{
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
  dispatch_semaphore_t v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)id v17 = *(_OWORD *)(a1 + 32);
  __int128 v13 = *(_OWORD *)(a1 + 64);
  __int128 v23 = *(_OWORD *)(a1 + 48);
  __int128 v24 = v13;
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __88__MAAutoAsset_checkForNewerSync_withUsagePolicy_withTimeout_discoveredAttributes_error___block_invoke_2;
  block[3] = &unk_189FFAB88;
  char v26 = a3;
  id v19 = v9;
  id v20 = v10;
  id v21 = v11;
  uint64_t v25 = *(void *)(a1 + 80);
  id v14 = v17[0];
  __int128 v22 = *(_OWORD *)v17;
  id v15 = v11;
  id v16 = v10;
  v17[0] = v9;
  dispatch_sync(v12, block);
}

uint64_t __88__MAAutoAsset_checkForNewerSync_withUsagePolicy_withTimeout_discoveredAttributes_error___block_invoke_2( uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 64) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 72) + 8LL) + 40LL), *(id *)(result + 32));
    *(_BYTE *)(*(void *)(*(void *)(v1 + 80) + 8LL) + 24LL) = *(_BYTE *)(v1 + 112);
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 88) + 8LL) + 40LL), *(id *)(v1 + 40));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 96) + 8LL) + 40LL), *(id *)(v1 + 48));
    *(_BYTE *)(*(void *)(*(void *)(v1 + 104) + 8LL) + 24LL) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 56));
  }

  return result;
}

void __88__MAAutoAsset_checkForNewerSync_withUsagePolicy_withTimeout_discoveredAttributes_error___block_invoke_3( void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = *(void *)(a1[6] + 8LL);
    v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0LL;

    uint64_t v4 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto(checkForNewerSync)",  0LL,  @"timeout (at framework layer) while waiting for check-for-newer to complete");
    uint64_t v5 = *(void *)(a1[7] + 8LL);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }

- (void)determineIfAvailable:(id)a3 withTimeout:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __59__MAAutoAsset_determineIfAvailable_withTimeout_completion___block_invoke;
    v12[3] = &unk_189FFABD8;
    v12[4] = self;
    id v13 = v8;
    int64_t v15 = a4;
    id v14 = v9;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v12);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 oslog];
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset determineIfAvailable:withTimeout:completion:].cold.1();
    }
  }
}

void __59__MAAutoAsset_determineIfAvailable_withTimeout_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _failedDetermineIfAvailable:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 48)];
  }

  else
  {
    v3 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    [*(id *)(a1 + 32) autoAssetClientName];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = __maAutoAssetSharedClientProcessName;
    uint64_t v6 = __maAutoAssetSharedClientProcessID;
    [*(id *)(a1 + 32) assetSelector];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v3,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  v4,  v5,  v6,  v7,  v8);

    id v10 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoDesire);
    [*(id *)(a1 + 32) updateCategoryDesiredByClient];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_t v12 = -[MAAutoAssetInfoDesire initWithDesiredCategory:forClientAssetPolicy:reasonDesired:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:]( v10,  "initWithDesiredCategory:forClientAssetPolicy:reasonDesired:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:",  v11,  0LL,  *(void *)(a1 + 40),  *(void *)(a1 + 56),  -101LL,  0LL);

    id v13 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 UUIDString];
    int64_t v15 = (void *)objc_claimAutoreleasedReturnValue();

    [v13 setSafeObject:v9 forKey:@"instance"];
    [v13 setSafeObject:v12 forKey:@"desire"];
    id v16 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO:DETERMINE_IF_AVAILABLE" clientID:v15 version:0 message:v13];
    id v17 = (void *)__maAutoAssetSharedConnectionClient;
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __59__MAAutoAsset_determineIfAvailable_withTimeout_completion___block_invoke_2;
    v18[3] = &unk_189FF94D8;
    v18[4] = *(void *)(a1 + 32);
    id v19 = *(id *)(a1 + 48);
    [v17 connectClientSendServerMessage:v16 proxyObject:0 withReply:v18];
  }

void __59__MAAutoAsset_determineIfAvailable_withTimeout_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v16 = a2;
  id v5 = a3;
  if (!v16 || v5)
  {
    if (v5)
    {
      id v13 = @"failure reported by server";
      uint64_t v14 = 0LL;
      id v15 = v5;
    }

    else
    {
      id v13 = @"no response message from server";
      uint64_t v14 = 6104LL;
      id v15 = 0LL;
    }

    [*(id *)(a1 + 32) _failedDetermineIfAvailable:v14 withResponseError:v15 description:v13 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v16 message];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 safeObjectForKey:@"found" ofClass:objc_opt_class()];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      [v7 currentStatus];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 newerVersionError];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();

      id v10 = *(void **)(a1 + 32);
      if (v9)
      {
        [v7 currentStatus];
        id v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 newerVersionError];
        dispatch_semaphore_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 _failedDetermineIfAvailable:0 withResponseError:v12 description:@"found-information indicated error" completion:*(void *)(a1 + 40)];
      }

      else
      {
        [*(id *)(a1 + 32) _successDetermineIfAvailable:v7 completion:*(void *)(a1 + 40)];
      }
    }

    else
    {
      [*(id *)(a1 + 32) _failedDetermineIfAvailable:6104 withResponseError:0 description:@"no found-information provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

- (id)determineIfAvailableSync:(id)a3 withTimeout:(int64_t)a4 discoveredAttributes:(id *)a5 error:(id *)a6
{
  id v9 = a3;
  uint64_t v42 = 0LL;
  v43 = &v42;
  uint64_t v44 = 0x3032000000LL;
  id v45 = __Block_byref_object_copy__5;
  uint64_t v46 = __Block_byref_object_dispose__5;
  id v47 = 0LL;
  uint64_t v36 = 0LL;
  v37 = &v36;
  uint64_t v38 = 0x3032000000LL;
  id v39 = __Block_byref_object_copy__5;
  uint64_t v40 = __Block_byref_object_dispose__5;
  id v41 = 0LL;
  uint64_t v30 = 0LL;
  char v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  char v33 = __Block_byref_object_copy__5;
  uint64_t v34 = __Block_byref_object_dispose__5;
  id v35 = 0LL;
  v28[0] = 0LL;
  v28[1] = v28;
  v28[2] = 0x2020000000LL;
  char v29 = 0;
  v26[0] = 0LL;
  v26[1] = v26;
  v26[2] = 0x2020000000LL;
  char v27 = 0;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0LL);
  uint64_t v11 = MEMORY[0x1895F87A8];
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = __79__MAAutoAsset_determineIfAvailableSync_withTimeout_discoveredAttributes_error___block_invoke;
  v19[3] = &unk_189FFAC28;
  id v21 = v26;
  __int128 v22 = &v42;
  dispatch_semaphore_t v12 = v9;
  __int128 v23 = &v36;
  __int128 v24 = &v30;
  uint64_t v25 = v28;
  id v13 = v10;
  id v20 = v13;
  -[MAAutoAsset determineIfAvailable:withTimeout:completion:]( self,  "determineIfAvailable:withTimeout:completion:",  v9,  a4,  v19);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:]( &OBJC_CLASS___MAAutoAsset,  "waitOnSemaphore:withDaemonTriggeredTimeout:",  v13,  a4))
  {
    +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
    uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v11;
    block[1] = 3221225472LL;
    block[2] = __79__MAAutoAsset_determineIfAvailableSync_withTimeout_discoveredAttributes_error___block_invoke_3;
    block[3] = &unk_189FFAB38;
    void block[4] = v28;
    block[5] = v26;
    block[6] = &v36;
    block[7] = &v30;
    dispatch_sync(v14, block);
  }

  if (a5) {
    *a5 = (id) v37[5];
  }
  if (a6) {
    *a6 = (id) v31[5];
  }
  id v15 = (id)v43[5];

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return v15;
}

void __79__MAAutoAsset_determineIfAvailableSync_withTimeout_discoveredAttributes_error___block_invoke( _OWORD *a1,  void *a2,  void *a3,  void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
  dispatch_semaphore_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)id v15 = a1[2];
  __int128 v11 = a1[4];
  __int128 v21 = a1[3];
  __int128 v22 = v11;
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __79__MAAutoAsset_determineIfAvailableSync_withTimeout_discoveredAttributes_error___block_invoke_2;
  block[3] = &unk_189FFAC00;
  id v17 = v7;
  id v18 = v8;
  id v19 = v9;
  id v12 = v15[0];
  __int128 v20 = *(_OWORD *)v15;
  id v13 = v9;
  id v14 = v8;
  v15[0] = v7;
  dispatch_sync(v10, block);
}

uint64_t __79__MAAutoAsset_determineIfAvailableSync_withTimeout_discoveredAttributes_error___block_invoke_2( uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 64) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 72) + 8LL) + 40LL), *(id *)(result + 32));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 80) + 8LL) + 40LL), *(id *)(v1 + 40));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 88) + 8LL) + 40LL), *(id *)(v1 + 48));
    *(_BYTE *)(*(void *)(*(void *)(v1 + 96) + 8LL) + 24LL) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 56));
  }

  return result;
}

void __79__MAAutoAsset_determineIfAvailableSync_withTimeout_discoveredAttributes_error___block_invoke_3( void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = *(void *)(a1[6] + 8LL);
    v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0LL;

    uint64_t v4 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto(determineIfAvailableSync)",  0LL,  @"timeout (at framework layer) while waiting for determine-if-available to complete");
    uint64_t v5 = *(void *)(a1[7] + 8LL);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }

+ (BOOL)hasStartupActivatedCompletedOnce
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  char v3 = [v2 fileExistsAtPath:@"/private/var/run/MobileAssetStartupActivation.doneThisBoot"];

  return v3;
}

- (void)currentStatus:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __29__MAAutoAsset_currentStatus___block_invoke;
    v8[3] = &unk_189FFAC50;
    v8[4] = self;
    id v9 = v4;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v8);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 oslog];
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset currentStatus:].cold.1();
    }
  }
}

void __29__MAAutoAsset_currentStatus___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _failedCurrentStatus:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 40)];
  }

  else
  {
    char v3 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    [*(id *)(a1 + 32) autoAssetClientName];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = __maAutoAssetSharedClientProcessName;
    uint64_t v6 = __maAutoAssetSharedClientProcessID;
    [*(id *)(a1 + 32) assetSelector];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v3,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  v4,  v5,  v6,  v7,  v8);

    id v10 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 UUIDString];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();

    [v10 setSafeObject:v9 forKey:@"instance"];
    id v13 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO:CURRENT_STATUS" clientID:v12 version:0 message:v10];
    id v14 = (void *)__maAutoAssetSharedConnectionClient;
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __29__MAAutoAsset_currentStatus___block_invoke_2;
    v16[3] = &unk_189FF94D8;
    id v15 = *(void **)(a1 + 40);
    v16[4] = *(void *)(a1 + 32);
    id v17 = v15;
    [v14 connectClientSendServerMessage:v13 proxyObject:0 withReply:v16];
  }

void __29__MAAutoAsset_currentStatus___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  id v5 = a3;
  if (v15 && !v5)
  {
    [v15 message];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 safeObjectForKey:@"found" ofClass:objc_opt_class()];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      [v7 currentStatus];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();

      id v9 = *(void **)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      if (v8)
      {
        [v9 _successCurrentStatus:v7 completion:*(void *)(a1 + 40)];
LABEL_13:

        goto LABEL_14;
      }

      id v14 = @"found-information yet no status provided";
    }

    else
    {
      id v9 = *(void **)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      id v14 = @"no found-information provided by server";
    }

    [v9 _failedCurrentStatus:6104 withResponseError:0 description:v14 completion:v10];
    goto LABEL_13;
  }

  if (v5)
  {
    __int128 v11 = @"failure reported by server";
    uint64_t v12 = 0LL;
    id v13 = v5;
  }

  else
  {
    __int128 v11 = @"no response message from server";
    uint64_t v12 = 6104LL;
    id v13 = 0LL;
  }

  [*(id *)(a1 + 32) _failedCurrentStatus:v12 withResponseError:v13 description:v11 completion:*(void *)(a1 + 40)];
LABEL_14:
}

- (id)currentStatusSync:(id *)a3
{
  uint64_t v28 = 0LL;
  char v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  char v31 = __Block_byref_object_copy__5;
  uint64_t v32 = __Block_byref_object_dispose__5;
  id v33 = 0LL;
  uint64_t v22 = 0LL;
  __int128 v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  uint64_t v25 = __Block_byref_object_copy__5;
  char v26 = __Block_byref_object_dispose__5;
  id v27 = 0LL;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x2020000000LL;
  char v21 = 0;
  v18[0] = 0LL;
  v18[1] = v18;
  v18[2] = 0x2020000000LL;
  char v19 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  uint64_t v6 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __33__MAAutoAsset_currentStatusSync___block_invoke;
  v12[3] = &unk_189FFAC78;
  id v14 = v18;
  id v15 = &v28;
  id v16 = &v22;
  id v17 = v20;
  id v7 = v5;
  id v13 = v7;
  -[MAAutoAsset currentStatus:](self, "currentStatus:", v12);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:]( &OBJC_CLASS___MAAutoAsset,  "waitOnSemaphore:withDaemonTriggeredTimeout:",  v7,  -100LL))
  {
    +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v6;
    block[1] = 3221225472LL;
    block[2] = __33__MAAutoAsset_currentStatusSync___block_invoke_3;
    block[3] = &unk_189FFAB38;
    void block[4] = v20;
    block[5] = v18;
    block[6] = &v28;
    block[7] = &v22;
    dispatch_sync(v8, block);
  }

  if (a3) {
    *a3 = (id) v23[5];
  }
  id v9 = (id)v29[5];

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v9;
}

void __33__MAAutoAsset_currentStatusSync___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)uint64_t v10 = *(_OWORD *)(a1 + 32);
  __int128 v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __33__MAAutoAsset_currentStatusSync___block_invoke_2;
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

uint64_t __33__MAAutoAsset_currentStatusSync___block_invoke_2(uint64_t result)
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

void __33__MAAutoAsset_currentStatusSync___block_invoke_3(void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = *(void *)(a1[6] + 8LL);
    char v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0LL;

    uint64_t v4 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto(currentStatusSync)",  0LL,  @"timeout (at framework layer) while waiting for current-status to complete");
    uint64_t v5 = *(void *)(a1[7] + 8LL);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }

- (void)lockContent:(id)a3 withTimeout:(int64_t)a4 completion:(id)a5
{
}

- (void)lockContent:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 completion:(id)a6
{
}

- (void)lockContent:(id)a3 withTimeout:(int64_t)a4 reportingProgress:(id)a5 completion:(id)a6
{
}

- (void)lockContent:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 reportingProgress:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (v15)
  {
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __84__MAAutoAsset_lockContent_withUsagePolicy_withTimeout_reportingProgress_completion___block_invoke;
    void v18[3] = &unk_189FFACC8;
    int64_t v23 = a5;
    v18[4] = self;
    id v19 = v13;
    id v20 = v12;
    id v21 = v14;
    id v22 = v15;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v18);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 oslog];
    id v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset lockContent:withUsagePolicy:withTimeout:reportingProgress:completion:].cold.1();
    }
  }
}

void __84__MAAutoAsset_lockContent_withUsagePolicy_withTimeout_reportingProgress_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _failedLockContent:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 64)];
  }

  else
  {
    if (*(void *)(a1 + 72)) {
      uint64_t v3 = -2LL;
    }
    else {
      uint64_t v3 = 0LL;
    }
    uint64_t v4 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    [*(id *)(a1 + 32) autoAssetClientName];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = __maAutoAssetSharedClientProcessName;
    uint64_t v7 = __maAutoAssetSharedClientProcessID;
    [*(id *)(a1 + 32) assetSelector];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    id v10 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v4,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  v5,  v6,  v7,  v8,  v9);

    __int128 v11 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoDesire);
    [*(id *)(a1 + 32) updateCategoryDesiredByClient];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = -[MAAutoAssetInfoDesire initWithDesiredCategory:forClientAssetPolicy:reasonDesired:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:]( v11,  "initWithDesiredCategory:forClientAssetPolicy:reasonDesired:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:",  v12,  *(void *)(a1 + 40),  *(void *)(a1 + 48),  v3,  *(void *)(a1 + 72),  *(void *)(a1 + 56) != 0LL);

    id v14 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 UUIDString];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

    [v14 setSafeObject:v10 forKey:@"instance"];
    [v14 setSafeObject:v13 forKey:@"desire"];
    id v17 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO:LOCK_CONTENT" clientID:v16 version:0 message:v14];
    id v18 = (void *)[*(id *)(a1 + 32) _newProxyObjectForLockProgressBlock:*(void *)(a1 + 56)];
    id v19 = (void *)__maAutoAssetSharedConnectionClient;
    v22[0] = MEMORY[0x1895F87A8];
    v22[1] = 3221225472LL;
    v22[2] = __84__MAAutoAsset_lockContent_withUsagePolicy_withTimeout_reportingProgress_completion___block_invoke_2;
    v22[3] = &unk_189FFACA0;
    uint64_t v20 = *(void *)(a1 + 32);
    id v23 = v18;
    uint64_t v24 = v20;
    id v25 = *(id *)(a1 + 64);
    id v21 = v18;
    [v19 connectClientSendServerMessage:v17 proxyObject:v21 withReply:v22];
  }

void __84__MAAutoAsset_lockContent_withUsagePolicy_withTimeout_reportingProgress_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v18 = a2;
  id v5 = a3;
  if (!v18 || v5)
  {
    if (v5)
    {
      id v15 = @"failure reported by server";
      uint64_t v16 = 0LL;
      id v17 = v5;
    }

    else
    {
      id v15 = @"no response message from server";
      uint64_t v16 = 6104LL;
      id v17 = 0LL;
    }

    [*(id *)(a1 + 40) _failedLockContent:v16 withResponseError:v17 description:v15 completion:*(void *)(a1 + 48)];
  }

  else
  {
    [v18 message];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 safeObjectForKey:@"found" ofClass:objc_opt_class()];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

    [v18 message];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 safeObjectForKey:@"desire" ofClass:objc_opt_class()];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();

    [v18 message];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 safeStringForKey:@"sandboxExtensionKey"];
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();

    [v18 message];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 safeStringForKey:@"sandboxExtensionPathKey"];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();

    id v14 = *(void **)(a1 + 40);
    if (v7) {
      [v14 _successLockContent:v7 dueToDesire:v9 sandboxExtension:v11 sandboxExtensionPath:v13 completion:*(void *)(a1 + 48)];
    }
    else {
      [v14 _failedLockContent:6104 withResponseError:0 description:@"no found-information provided by server" completion:*(void *)(a1 + 48)];
    }
  }
}

- (id)lockContentSync:(id)a3 withTimeout:(int64_t)a4 lockedAssetSelector:(id *)a5 newerInProgress:(id *)a6 error:(id *)a7
{
  return -[MAAutoAsset lockContentSync:withUsagePolicy:withTimeout:lockedAssetSelector:newerInProgress:error:reportingProgress:]( self,  "lockContentSync:withUsagePolicy:withTimeout:lockedAssetSelector:newerInProgress:error:reportingProgress:",  a3,  0LL,  a4,  a5,  a6,  a7,  0LL);
}

- (id)lockContentSync:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 lockedAssetSelector:(id *)a6 newerInProgress:(id *)a7 error:(id *)a8
{
  return -[MAAutoAsset lockContentSync:withUsagePolicy:withTimeout:lockedAssetSelector:newerInProgress:error:reportingProgress:]( self,  "lockContentSync:withUsagePolicy:withTimeout:lockedAssetSelector:newerInProgress:error:reportingProgress:",  a3,  a4,  a5,  a6,  a7,  a8,  0LL);
}

- (id)lockContentSync:(id)a3 withTimeout:(int64_t)a4 lockedAssetSelector:(id *)a5 newerInProgress:(id *)a6 error:(id *)a7 reportingProgress:(id)a8
{
  return -[MAAutoAsset lockContentSync:withUsagePolicy:withTimeout:lockedAssetSelector:newerInProgress:error:reportingProgress:]( self,  "lockContentSync:withUsagePolicy:withTimeout:lockedAssetSelector:newerInProgress:error:reportingProgress:",  a3,  0LL,  a4,  a5,  a6,  a7,  a8);
}

- (id)lockContentSync:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 lockedAssetSelector:(id *)a6 newerInProgress:(id *)a7 error:(id *)a8 reportingProgress:(id)a9
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a9;
  uint64_t v58 = 0LL;
  v59 = &v58;
  uint64_t v60 = 0x3032000000LL;
  v61 = __Block_byref_object_copy__5;
  v62 = __Block_byref_object_dispose__5;
  id v63 = 0LL;
  v56[0] = 0LL;
  v56[1] = v56;
  v56[2] = 0x2020000000LL;
  char v57 = 0;
  uint64_t v50 = 0LL;
  id v51 = &v50;
  uint64_t v52 = 0x3032000000LL;
  v53 = __Block_byref_object_copy__5;
  v54 = __Block_byref_object_dispose__5;
  id v55 = 0LL;
  uint64_t v44 = 0LL;
  id v45 = &v44;
  uint64_t v46 = 0x3032000000LL;
  id v47 = __Block_byref_object_copy__5;
  uint64_t v48 = __Block_byref_object_dispose__5;
  id v49 = 0LL;
  uint64_t v38 = 0LL;
  id v39 = &v38;
  uint64_t v40 = 0x3032000000LL;
  id v41 = __Block_byref_object_copy__5;
  uint64_t v42 = __Block_byref_object_dispose__5;
  id v43 = 0LL;
  v36[0] = 0LL;
  v36[1] = v36;
  v36[2] = 0x2020000000LL;
  char v37 = 0;
  v34[0] = 0LL;
  v34[1] = v34;
  v34[2] = 0x2020000000LL;
  char v35 = 0;
  dispatch_semaphore_t v14 = dispatch_semaphore_create(0LL);
  v25[0] = MEMORY[0x1895F87A8];
  v25[1] = 3221225472LL;
  v25[2] = __119__MAAutoAsset_lockContentSync_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error_reportingProgress___block_invoke;
  v25[3] = &unk_189FFAD18;
  id v27 = v34;
  uint64_t v28 = &v58;
  char v29 = v56;
  uint64_t v30 = &v50;
  char v31 = &v44;
  uint64_t v32 = &v38;
  id v15 = v13;
  id v33 = v36;
  uint64_t v16 = v14;
  char v26 = v16;
  -[MAAutoAsset lockContent:withUsagePolicy:withTimeout:reportingProgress:completion:]( self,  "lockContent:withUsagePolicy:withTimeout:reportingProgress:completion:",  v11,  v12,  a5,  v15,  v25);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:]( &OBJC_CLASS___MAAutoAsset,  "waitOnSemaphore:withDaemonTriggeredTimeout:",  v16,  a5))
  {
    +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
    id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __119__MAAutoAsset_lockContentSync_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error_reportingProgress___block_invoke_3;
    block[3] = &unk_189FFAD40;
    void block[4] = v36;
    block[5] = v34;
    block[6] = &v58;
    block[7] = v56;
    void block[8] = &v50;
    block[9] = &v44;
    block[10] = &v38;
    dispatch_sync(v17, block);
  }

  if (a6) {
    *a6 = (id) v59[5];
  }
  if (a7) {
    *a7 = (id) v45[5];
  }
  if (a8) {
    *a8 = (id) v39[5];
  }
  id v18 = (id)v51[5];

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);

  _Block_object_dispose(v56, 8);
  _Block_object_dispose(&v58, 8);

  return v18;
}

void __119__MAAutoAsset_lockContentSync_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error_reportingProgress___block_invoke( _OWORD *a1,  void *a2,  char a3,  void *a4,  void *a5,  void *a6)
{
  id v11 = a2;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
  id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  __int128 v16 = a1[4];
  __int128 v17 = a1[5];
  *(_OWORD *)id v22 = a1[2];
  __int128 v29 = a1[3];
  __int128 v30 = v16;
  __int128 v31 = v17;
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __119__MAAutoAsset_lockContentSync_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error_reportingProgress___block_invoke_2;
  block[3] = &unk_189FFACF0;
  char v32 = a3;
  id v24 = v11;
  id v25 = v12;
  id v26 = v13;
  id v27 = v14;
  id v18 = v22[0];
  __int128 v28 = *(_OWORD *)v22;
  id v19 = v14;
  id v20 = v13;
  id v21 = v12;
  v22[0] = v11;
  dispatch_sync(v15, block);
}

uint64_t __119__MAAutoAsset_lockContentSync_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error_reportingProgress___block_invoke_2( uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 72) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 80) + 8LL) + 40LL), *(id *)(result + 32));
    *(_BYTE *)(*(void *)(*(void *)(v1 + 88) + 8LL) + 24LL) = *(_BYTE *)(v1 + 128);
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 96) + 8LL) + 40LL), *(id *)(v1 + 40));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 104) + 8LL) + 40LL), *(id *)(v1 + 48));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 112) + 8LL) + 40LL), *(id *)(v1 + 56));
    *(_BYTE *)(*(void *)(*(void *)(v1 + 120) + 8LL) + 24LL) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 64));
  }

  return result;
}

void __119__MAAutoAsset_lockContentSync_withUsagePolicy_withTimeout_lockedAssetSelector_newerInProgress_error_reportingProgress___block_invoke_3( void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = *(void *)(a1[6] + 8LL);
    uint64_t v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0LL;

    *(_BYTE *)(*(void *)(a1[7] + 8LL) + 24LL) = 0;
    uint64_t v4 = *(void *)(a1[8] + 8LL);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0LL;

    uint64_t v6 = *(void *)(a1[9] + 8LL);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0LL;

    uint64_t v8 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto(lockContentSync)",  0LL,  @"timeout (at framework layer) while waiting for lock-content to complete");
    uint64_t v9 = *(void *)(a1[10] + 8LL);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }

- (void)mapLockedContent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    id v10[2] = __43__MAAutoAsset_mapLockedContent_completion___block_invoke;
    v10[3] = &unk_189FF9578;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v10);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset mapLockedContent:completion:].cold.1();
    }
  }
}

void __43__MAAutoAsset_mapLockedContent_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _failedMapLockedContent:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 48)];
  }

  else
  {
    uint64_t v3 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    [*(id *)(a1 + 32) autoAssetClientName];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = __maAutoAssetSharedClientProcessName;
    uint64_t v6 = __maAutoAssetSharedClientProcessID;
    [*(id *)(a1 + 32) assetSelector];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v3,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  v4,  v5,  v6,  v7,  v8);

    id v10 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoDesire);
    [*(id *)(a1 + 32) updateCategoryDesiredByClient];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = -[MAAutoAssetInfoDesire initWithDesiredCategory:forClientAssetPolicy:reasonDesired:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:]( v10,  "initWithDesiredCategory:forClientAssetPolicy:reasonDesired:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:",  v11,  0LL,  *(void *)(a1 + 40),  0LL,  0LL,  0LL);

    id v13 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 UUIDString];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();

    [v13 setSafeObject:v9 forKey:@"instance"];
    [v13 setSafeObject:v12 forKey:@"desire"];
    __int128 v16 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO:MAP_LOCKED_CONTENT_TO_EXCLAVE" clientID:v15 version:0 message:v13];
    __int128 v17 = (void *)__maAutoAssetSharedConnectionClient;
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __43__MAAutoAsset_mapLockedContent_completion___block_invoke_2;
    void v18[3] = &unk_189FF94D8;
    v18[4] = *(void *)(a1 + 32);
    id v19 = *(id *)(a1 + 48);
    [v17 connectClientSendServerMessage:v16 proxyObject:0 withReply:v18];
  }

void __43__MAAutoAsset_mapLockedContent_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  if (!v14 || v5)
  {
    if (v5)
    {
      id v11 = @"failure reported by server";
      uint64_t v12 = 0LL;
      id v13 = v5;
    }

    else
    {
      id v11 = @"no response message from server";
      uint64_t v12 = 6104LL;
      id v13 = 0LL;
    }

    [*(id *)(a1 + 32) _failedMapLockedContent:v12 withResponseError:v13 description:v11 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v14 message];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 safeObjectForKey:@"found" ofClass:objc_opt_class()];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    [v14 message];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 safeObjectForKey:@"desire" ofClass:objc_opt_class()];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();

    id v10 = *(void **)(a1 + 32);
    if (v7) {
      [v10 _successMapLockedContent:v7 dueToDesire:v9 completion:*(void *)(a1 + 40)];
    }
    else {
      [v10 _failedMapLockedContent:6104 withResponseError:0 description:@"no found-information provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

- (id)mapLockedContentSync:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v30 = 0LL;
  __int128 v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  id v33 = __Block_byref_object_copy__5;
  uint64_t v34 = __Block_byref_object_dispose__5;
  id v35 = 0LL;
  uint64_t v24 = 0LL;
  id v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  id v27 = __Block_byref_object_copy__5;
  __int128 v28 = __Block_byref_object_dispose__5;
  id v29 = 0LL;
  v22[0] = 0LL;
  v22[1] = v22;
  id v22[2] = 0x2020000000LL;
  char v23 = 0;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x2020000000LL;
  char v21 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
  uint64_t v8 = MEMORY[0x1895F87A8];
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __42__MAAutoAsset_mapLockedContentSync_error___block_invoke;
  v14[3] = &unk_189FFAB10;
  __int128 v16 = v20;
  __int128 v17 = &v30;
  id v18 = &v24;
  id v19 = v22;
  id v9 = v7;
  id v15 = v9;
  -[MAAutoAsset mapLockedContent:completion:](self, "mapLockedContent:completion:", v6, v14);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:]( &OBJC_CLASS___MAAutoAsset,  "waitOnSemaphore:withDaemonTriggeredTimeout:",  v9,  -100LL))
  {
    +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v8;
    block[1] = 3221225472LL;
    block[2] = __42__MAAutoAsset_mapLockedContentSync_error___block_invoke_3;
    block[3] = &unk_189FFAB38;
    void block[4] = v22;
    block[5] = v20;
    block[6] = &v30;
    block[7] = &v24;
    dispatch_sync(v10, block);
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

void __42__MAAutoAsset_mapLockedContentSync_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
  dispatch_semaphore_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)id v10 = *(_OWORD *)(a1 + 32);
  __int128 v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __42__MAAutoAsset_mapLockedContentSync_error___block_invoke_2;
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

uint64_t __42__MAAutoAsset_mapLockedContentSync_error___block_invoke_2(uint64_t result)
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

void __42__MAAutoAsset_mapLockedContentSync_error___block_invoke_3(void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = *(void *)(a1[6] + 8LL);
    uint64_t v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0LL;

    uint64_t v4 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto(mapLockedContentSync)",  0LL,  @"timeout (at framework layer) while waiting for map-locked-content to complete");
    uint64_t v5 = *(void *)(a1[7] + 8LL);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }

- (void)continueLockUsage:(id)a3 completion:(id)a4
{
}

- (void)continueLockUsage:(id)a3 withUsagePolicy:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __60__MAAutoAsset_continueLockUsage_withUsagePolicy_completion___block_invoke;
    v13[3] = &unk_189FF9528;
    v13[4] = self;
    id v14 = v9;
    id v15 = v8;
    id v16 = v10;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v13);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 oslog];
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset continueLockUsage:withUsagePolicy:completion:].cold.1();
    }
  }
}

void __60__MAAutoAsset_continueLockUsage_withUsagePolicy_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _failedContinueLockUsage:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 56)];
  }

  else
  {
    uint64_t v3 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    [*(id *)(a1 + 32) autoAssetClientName];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = __maAutoAssetSharedClientProcessName;
    uint64_t v6 = __maAutoAssetSharedClientProcessID;
    [*(id *)(a1 + 32) contentLockedSelector];
    dispatch_semaphore_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 contentLockedSelector];
    }
    else {
      [v8 assetSelector];
    }
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v3,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  v4,  v5,  v6,  v9,  v10);

    id v12 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoDesire);
    [*(id *)(a1 + 32) updateCategoryDesiredByClient];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = -[MAAutoAssetInfoDesire initWithDesiredCategory:forClientAssetPolicy:reasonDesired:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:]( v12,  "initWithDesiredCategory:forClientAssetPolicy:reasonDesired:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:",  v13,  *(void *)(a1 + 40),  *(void *)(a1 + 48),  -101LL,  -101LL,  0LL);

    id v15 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 UUIDString];
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();

    [v15 setSafeObject:v11 forKey:@"instance"];
    [v15 setSafeObject:v14 forKey:@"desire"];
    id v18 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO:CONTINUE_LOCK_USAGE" clientID:v17 version:0 message:v15];
    id v19 = (void *)__maAutoAssetSharedConnectionClient;
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = __60__MAAutoAsset_continueLockUsage_withUsagePolicy_completion___block_invoke_2;
    void v20[3] = &unk_189FF94D8;
    void v20[4] = *(void *)(a1 + 32);
    id v21 = *(id *)(a1 + 56);
    [v19 connectClientSendServerMessage:v18 proxyObject:0 withReply:v20];
  }

void __60__MAAutoAsset_continueLockUsage_withUsagePolicy_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v12 = a2;
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  if (!v12 || v5)
  {
    if (v5)
    {
      id v8 = @"failure reported by server";
      id v9 = *(void **)(a1 + 32);
      uint64_t v10 = 0LL;
      id v11 = v5;
    }

    else
    {
      id v8 = @"no response message from server";
      id v9 = *(void **)(a1 + 32);
      uint64_t v10 = 6104LL;
      id v11 = 0LL;
    }

    [v9 _failedContinueLockUsage:v10 withResponseError:v11 description:v8 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [*(id *)(a1 + 32) assetSelector];
    dispatch_semaphore_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 _successContinueLockUsage:v7 completion:*(void *)(a1 + 40)];
  }
}

- (id)continueLockUsageSync:(id)a3
{
  return -[MAAutoAsset continueLockUsageSync:withUsagePolicy:](self, "continueLockUsageSync:withUsagePolicy:", a3, 0LL);
}

- (id)continueLockUsageSync:(id)a3 withUsagePolicy:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v31[0] = 0LL;
  v31[1] = v31;
  v31[2] = 0x3032000000LL;
  v31[3] = __Block_byref_object_copy__5;
  v31[4] = __Block_byref_object_dispose__5;
  id v32 = 0LL;
  uint64_t v25 = 0LL;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  __int128 v28 = __Block_byref_object_copy__5;
  id v29 = __Block_byref_object_dispose__5;
  id v30 = 0LL;
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x2020000000LL;
  char v24 = 0;
  v21[0] = 0LL;
  v21[1] = v21;
  v21[2] = 0x2020000000LL;
  char v22 = 0;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0LL);
  uint64_t v9 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  id v15[2] = __53__MAAutoAsset_continueLockUsageSync_withUsagePolicy___block_invoke;
  v15[3] = &unk_189FFAB10;
  __int128 v17 = v21;
  id v18 = v31;
  id v19 = &v25;
  id v20 = v23;
  uint64_t v10 = v8;
  id v16 = v10;
  -[MAAutoAsset continueLockUsage:withUsagePolicy:completion:]( self,  "continueLockUsage:withUsagePolicy:completion:",  v6,  v7,  v15);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:]( &OBJC_CLASS___MAAutoAsset,  "waitOnSemaphore:withDaemonTriggeredTimeout:",  v10,  -100LL))
  {
    +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
    id v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v9;
    block[1] = 3221225472LL;
    block[2] = __53__MAAutoAsset_continueLockUsageSync_withUsagePolicy___block_invoke_3;
    block[3] = &unk_189FFAB38;
    void block[4] = v23;
    block[5] = v21;
    block[6] = v31;
    block[7] = &v25;
    dispatch_sync(v11, block);
  }

  id v12 = (id)v26[5];

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(v31, 8);
  return v12;
}

void __53__MAAutoAsset_continueLockUsageSync_withUsagePolicy___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)uint64_t v10 = *(_OWORD *)(a1 + 32);
  __int128 v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __53__MAAutoAsset_continueLockUsageSync_withUsagePolicy___block_invoke_2;
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

uint64_t __53__MAAutoAsset_continueLockUsageSync_withUsagePolicy___block_invoke_2(uint64_t result)
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

void __53__MAAutoAsset_continueLockUsageSync_withUsagePolicy___block_invoke_3(void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = *(void *)(a1[6] + 8LL);
    uint64_t v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0LL;

    uint64_t v4 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto(contniueLockUsageSync)",  0LL,  @"timeout (at framework layer) while waiting for continue-lock-usage to complete");
    uint64_t v5 = *(void *)(a1[7] + 8LL);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }

- (void)endLockUsage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    id v10[2] = __39__MAAutoAsset_endLockUsage_completion___block_invoke;
    v10[3] = &unk_189FF9578;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v10);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset endLockUsage:completion:].cold.1();
    }
  }
}

void __39__MAAutoAsset_endLockUsage_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _failedEndLockUsage:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 48)];
  }

  else
  {
    uint64_t v3 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    [*(id *)(a1 + 32) autoAssetClientName];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = __maAutoAssetSharedClientProcessName;
    uint64_t v6 = __maAutoAssetSharedClientProcessID;
    [*(id *)(a1 + 32) contentLockedSelector];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    id v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 contentLockedSelector];
    }
    else {
      [v8 assetSelector];
    }
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v3,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  v4,  v5,  v6,  v9,  v10);

    id v12 = -[MAAutoAssetInfoEnd initWithLockReason:endingLockCount:]( objc_alloc(&OBJC_CLASS___MAAutoAssetInfoEnd),  "initWithLockReason:endingLockCount:",  *(void *)(a1 + 40),  1LL);
    id v13 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 UUIDString];
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();

    [v13 setSafeObject:v11 forKey:@"instance"];
    [v13 setSafeObject:v12 forKey:@"end"];
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO:END_LOCK_USAGE" clientID:v15 version:0 message:v13];
    __int128 v17 = (void *)__maAutoAssetSharedConnectionClient;
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __39__MAAutoAsset_endLockUsage_completion___block_invoke_2;
    void v18[3] = &unk_189FF94D8;
    v18[4] = *(void *)(a1 + 32);
    id v19 = *(id *)(a1 + 48);
    [v17 connectClientSendServerMessage:v16 proxyObject:0 withReply:v18];
  }

void __39__MAAutoAsset_endLockUsage_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  if (!v12 || v5)
  {
    if (v5)
    {
      id v8 = @"failure reported by server";
      id v9 = *(void **)(a1 + 32);
      uint64_t v10 = 0LL;
      id v11 = v5;
    }

    else
    {
      id v8 = @"no response message from server";
      id v9 = *(void **)(a1 + 32);
      uint64_t v10 = 6104LL;
      id v11 = 0LL;
    }

    [v9 _failedEndLockUsage:v10 withResponseError:v11 description:v8 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [*(id *)(a1 + 32) assetSelector];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 _successEndLockUsage:v7 completion:*(void *)(a1 + 40)];
  }
}

- (id)endLockUsageSync:(id)a3
{
  id v4 = a3;
  v28[0] = 0LL;
  v28[1] = v28;
  v28[2] = 0x3032000000LL;
  void v28[3] = __Block_byref_object_copy__5;
  v28[4] = __Block_byref_object_dispose__5;
  id v29 = 0LL;
  uint64_t v22 = 0LL;
  char v23 = &v22;
  uint64_t v24 = 0x3032000000LL;
  uint64_t v25 = __Block_byref_object_copy__5;
  uint64_t v26 = __Block_byref_object_dispose__5;
  id v27 = 0LL;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x2020000000LL;
  char v21 = 0;
  v18[0] = 0LL;
  v18[1] = v18;
  v18[2] = 0x2020000000LL;
  char v19 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  uint64_t v6 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __32__MAAutoAsset_endLockUsageSync___block_invoke;
  v12[3] = &unk_189FFAB10;
  __int128 v14 = v18;
  __int128 v15 = v28;
  uint64_t v16 = &v22;
  __int128 v17 = v20;
  id v7 = v5;
  id v13 = v7;
  -[MAAutoAsset endLockUsage:completion:](self, "endLockUsage:completion:", v4, v12);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:]( &OBJC_CLASS___MAAutoAsset,  "waitOnSemaphore:withDaemonTriggeredTimeout:",  v7,  -100LL))
  {
    +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v6;
    block[1] = 3221225472LL;
    block[2] = __32__MAAutoAsset_endLockUsageSync___block_invoke_3;
    block[3] = &unk_189FFAB38;
    void block[4] = v20;
    block[5] = v18;
    block[6] = v28;
    block[7] = &v22;
    dispatch_sync(v8, block);
  }

  id v9 = (id)v23[5];

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(v28, 8);
  return v9;
}

void __32__MAAutoAsset_endLockUsageSync___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)uint64_t v10 = *(_OWORD *)(a1 + 32);
  __int128 v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __32__MAAutoAsset_endLockUsageSync___block_invoke_2;
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

uint64_t __32__MAAutoAsset_endLockUsageSync___block_invoke_2(uint64_t result)
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

void __32__MAAutoAsset_endLockUsageSync___block_invoke_3(void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = *(void *)(a1[6] + 8LL);
    uint64_t v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0LL;

    uint64_t v4 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto(endLockUsageSync)",  0LL,  @"timeout (at framework layer) while waiting for end-lock-usage to complete");
    uint64_t v5 = *(void *)(a1[7] + 8LL);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }

- (id)assetAttribute:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[MAAutoAsset assetAttributes](self, "assetAttributes");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 objectForKey:v4];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  else
  {
    id v6 = 0LL;
  }

  return v6;
}

- (NSString)description
{
  uint64_t v3 = (void *)NSString;
  -[MAAutoAsset summary](self, "summary");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAsset assetAttributes](self, "assetAttributes");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 stringWithFormat:@"%@|attribs:%@", v4, v5];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)summary
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    id v4 = objc_alloc(NSString);
    -[MAAutoAsset updateCategoryDesiredByClient](self, "updateCategoryDesiredByClient");
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    id v6 = (__CFString *)[v4 initWithFormat:@"desired:%@", v5];
  }

  else
  {
    id v6 = @"byPolicy";
  }

  -[MAAutoAsset contentLockedSelector](self, "contentLockedSelector");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    || (-[MAAutoAsset contentLockedReason](self, "contentLockedReason"),
        (id v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0LL))
  {

LABEL_7:
    id v8 = objc_alloc(NSString);
    -[MAAutoAsset contentLockedSelector](self, "contentLockedSelector");
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 summary];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAAutoAsset contentLockedReason](self, "contentLockedReason");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAAutoAsset localContentURL](self, "localContentURL");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 path];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v14 = (__CFString *)[v8 initWithFormat:@"locked:%@(%@)|URL:%@", v10, v11, v13];

    goto LABEL_8;
  }

  -[MAAutoAsset localContentURL](self, "localContentURL");
  char v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23) {
    goto LABEL_7;
  }
  __int128 v14 = @"unlocked";
LABEL_8:
  __int128 v15 = (void *)NSString;
  -[MAAutoAsset autoAssetClientName](self, "autoAssetClientName");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAsset assetSelector](self, "assetSelector");
  __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 summary];
  id v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAsset assetAttributes](self, "assetAttributes");
  char v19 = (void *)objc_claimAutoreleasedReturnValue();
  id v20 = @"(w/attribs)";
  if (!v19) {
    id v20 = &stru_189FFC530;
  }
  [v15 stringWithFormat:@"%@(%@)|%@|%@%@", v16, v18, v6, v14, v20];
  char v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (void)connectToServerFrameworkCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  uint64_t v6 = 0LL;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = __Block_byref_object_copy__5;
  uint64_t v10 = __Block_byref_object_dispose__5;
  id v11 = 0LL;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __50__MAAutoAsset_connectToServerFrameworkCompletion___block_invoke;
  v5[3] = &unk_189FFAD68;
  v5[4] = self;
  v5[5] = &v6;
  if (__maAutoAssetSharedDispatchOnce != -1) {
    dispatch_once(&__maAutoAssetSharedDispatchOnce, v5);
  }
  v4[2](v4, v7[5]);
  _Block_object_dispose(&v6, 8);
}

void __50__MAAutoAsset_connectToServerFrameworkCompletion___block_invoke(uint64_t a1)
{
  v33[1] = *MEMORY[0x1895F89C0];
  +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 UUIDString];
  __int128 v31 = (void *)objc_claimAutoreleasedReturnValue();

  id v29 = (void *)MEMORY[0x189604010];
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  objc_msgSend(v29, "setWithObjects:", v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"%s", getprogname());
  __int128 v14 = (void *)__maAutoAssetSharedClientProcessName;
  __maAutoAssetSharedClientProcessName = v13;

  __maAutoAssetSharedClientProcessID = getpid();
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO:INTEREST_IN_CONTENT"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO:CHECK_FOR_NEWER"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO:DETERMINE_IF_AVAILABLE"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO:CURRENT_STATUS"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO:LOCK_CONTENT"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO:MAP_LOCKED_CONTENT_TO_EXCLAVE"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO:CONTINUE_LOCK_USAGE"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO:END_LOCK_USAGE"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO:END_PREVIOUS_LOCKS"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO:END_ALL_PREVIOUS_LOCKS"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO:CANCEL_ACTIVITY_FOR_SELECTOR"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO:ELIMINATE_ALL_FOR_SELECTOR"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO:ELIMINATE_ALL_FOR_ASSET_TYPE"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO:ELIMINATE_PROMOTED_NEVER_LOCKED_FOR_SELECTOR"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-STAGE:DETERMINE_GROUPS_AVAILABLE_FOR_UPDATE"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-STAGE:DETERMINE_ALL_AVAILABLE_FOR_UPDATE"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-STAGE:DETERMINE_ALL_AVAILABLE"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-STAGE:DOWNLOAD_GROUPS"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-STAGE:DOWNLOAD_ALL"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-STAGE:CANCEL_OPERATION"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-STAGE:PURGE_ALL"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-STAGE:ERASE_ALL"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO(REPLY):INTEREST_IN_CONTENT"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO(REPLY):CHECK_FOR_NEWER"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO(REPLY):DETERMINE_IF_AVAILABLE"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO(REPLY):CURRENT_STATUS"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO(REPLY):LOCK_CONTENT"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO(REPLY):MAP_LOCKED_CONTENT_TO_EXCLAVE"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO(REPLY):CONTINUE_LOCK_USAGE"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO(REPLY):END_LOCK_USAGE"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO(REPLY):END_PREVIOUS_LOCKS"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO(REPLY):END_ALL_PREVIOUS_LOCKS"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO(REPLY):CANCEL_ACTIVITY_FOR_SELECTOR"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO(REPLY):ELIMINATE_ALL_FOR_SELECTOR"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO(REPLY):ELIMINATE_ALL_FOR_ASSET_TYPE"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO(REPLY):ELIMINATE_PROMOTED_NEVER_LOCKED_FOR_SELECTOR"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-STAGE(REPLY):DETERMINE_GROUPS_AVAILABLE_FOR_UPDATE"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-STAGE(REPLY):DETERMINE_ALL_AVAILABLE_FOR_UPDATE"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-STAGE(REPLY):DETERMINE_ALL_AVAILABLE"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-STAGE(REPLY):DOWNLOAD_GROUPS"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-STAGE(REPLY):DOWNLOAD_ALL"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-STAGE(REPLY):CANCEL_OPERATION"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-STAGE(REPLY):PURGE_ALL"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-STAGE(REPLY):ERASE_ALL"];
  [MEMORY[0x1896127A0] sharedLogger];
  __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 oslog];
  uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_18718F000,  v16,  OS_LOG_TYPE_DEFAULT,  "MA-auto{connectToServerFrameworkCompletion} set all the allowlisted classes for the client policy for all delegate callbacks",  buf,  2u);
  }

  __int128 v17 = (void *)[objc_alloc(MEMORY[0x189612748]) initForServiceName:@"com.apple.mobileasset.autoasset" delegate:*(void *)(a1 + 32) clientID:v31];
  id v18 = (void *)MEMORY[0x189604010];
  v33[0] = objc_opt_class();
  [MEMORY[0x189603F18] arrayWithObjects:v33 count:1];
  char v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 setWithArray:v19];
  id v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 setProxyObjectClasses:v20];

  uint64_t v21 = [objc_alloc(MEMORY[0x189612740]) initWithClientPolicy:v17];
  uint64_t v22 = (void *)__maAutoAssetSharedConnectionClient;
  __maAutoAssetSharedConnectionClient = v21;

  if (__maAutoAssetSharedConnectionClient)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    char v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 oslog];
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_18718F000,  v24,  OS_LOG_TYPE_DEFAULT,  "MA-auto{connectToServerFrameworkCompletion} connection client initialized for server connection",  buf,  2u);
    }
  }

  else
  {
    uint64_t v25 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6104LL,  @"auto(connectToServerFrameworkCompletion)",  0LL,  @"unable to create shared SUCoreConnectClient for the client process");
    uint64_t v26 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v25;

    [MEMORY[0x1896127A0] sharedLogger];
    __int128 v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v28 oslog];
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      __50__MAAutoAsset_connectToServerFrameworkCompletion___block_invoke_cold_1();
    }
  }
}

- (id)_newProxyObjectForLockProgressBlock:(id)a3
{
  id v4 = a3;
  v15[0] = 0LL;
  v15[1] = v15;
  id v15[2] = 0x3042000000LL;
  v15[3] = __Block_byref_object_copy__435;
  void v15[4] = __Block_byref_object_dispose__436;
  objc_initWeak(&v16, self);
  id v5 = objc_alloc(MEMORY[0x189612750]);
  +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 UUIDString];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __51__MAAutoAsset__newProxyObjectForLockProgressBlock___block_invoke;
  v12[3] = &unk_189FFAD90;
  __int128 v14 = v15;
  id v9 = v4;
  id v13 = v9;
  uint64_t v10 = (void *)[v5 initWithClientID:v7 completionQueue:v8 genericBlock:v12];

  _Block_object_dispose(v15, 8);
  objc_destroyWeak(&v16);

  return v10;
}

void __51__MAAutoAsset__newProxyObjectForLockProgressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
  if (!WeakRetained)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 oslog];
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __51__MAAutoAsset__newProxyObjectForLockProgressBlock___block_invoke_cold_1();
    }
    goto LABEL_11;
  }

  if (!v3)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __51__MAAutoAsset__newProxyObjectForLockProgressBlock___block_invoke_cold_2();
    }
    goto LABEL_11;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 oslog];
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __51__MAAutoAsset__newProxyObjectForLockProgressBlock___block_invoke_cold_3();
    }
LABEL_11:

    goto LABEL_12;
  }

  [WeakRetained _lockContentStatusProgress:v3 lockForUseError:0 progressBlock:*(void *)(a1 + 32)];
LABEL_12:
}

- (id)_newProxyObjectForStageProgressBlock:(id)a3
{
  id v4 = a3;
  v15[0] = 0LL;
  v15[1] = v15;
  id v15[2] = 0x3042000000LL;
  v15[3] = __Block_byref_object_copy__435;
  void v15[4] = __Block_byref_object_dispose__436;
  objc_initWeak(&v16, self);
  id v5 = objc_alloc(MEMORY[0x189612750]);
  +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 UUIDString];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __52__MAAutoAsset__newProxyObjectForStageProgressBlock___block_invoke;
  v12[3] = &unk_189FFAD90;
  __int128 v14 = v15;
  id v9 = v4;
  id v13 = v9;
  uint64_t v10 = (void *)[v5 initWithClientID:v7 completionQueue:v8 genericBlock:v12];

  _Block_object_dispose(v15, 8);
  objc_destroyWeak(&v16);

  return v10;
}

void __52__MAAutoAsset__newProxyObjectForStageProgressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
  id v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL));
  if (!WeakRetained)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 oslog];
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __52__MAAutoAsset__newProxyObjectForStageProgressBlock___block_invoke_cold_1();
    }
    goto LABEL_11;
  }

  if (!v3)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __52__MAAutoAsset__newProxyObjectForStageProgressBlock___block_invoke_cold_2();
    }
    goto LABEL_11;
  }

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 oslog];
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __52__MAAutoAsset__newProxyObjectForStageProgressBlock___block_invoke_cold_3();
    }
LABEL_11:

    goto LABEL_12;
  }

  [WeakRetained _lockContentStatusProgress:v3 lockForUseError:0 progressBlock:*(void *)(a1 + 32)];
LABEL_12:
}

- (void)_successInterestInContent:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __52__MAAutoAsset__successInterestInContent_completion___block_invoke;
    v11[3] = &unk_189FF9600;
    id v12 = (os_log_s *)v6;
    id v13 = v7;
    dispatch_async(v8, v11);

    id v9 = v12;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _successInterestInContent:completion:].cold.1(v6);
    }
  }
}

uint64_t __52__MAAutoAsset__successInterestInContent_completion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) summary];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl( &dword_18718F000,  v3,  OS_LOG_TYPE_DEFAULT,  "MA-auto{_successInterestInContent} | %{public}@ | SUCCESS",  (uint8_t *)&v6,  0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)_failedInterestInContent:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __81__MAAutoAsset__failedInterestInContent_withResponseError_description_completion___block_invoke;
    block[3] = &unk_189FFA488;
    id v21 = v10;
    int64_t v24 = a3;
    id v22 = v11;
    id v23 = v12;
    dispatch_async(v13, block);

    __int128 v14 = v21;
  }

  else
  {
    id v15 = objc_alloc(NSString);
    if (v10)
    {
      [v10 checkedSummary];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v15 initWithFormat:@"%@ | error:%@", v11, v16];
    }

    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:]( &OBJC_CLASS___MAAutoAssetError,  "summaryForCode:fromOperation:",  a3,  @"interestInContent");
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v15 initWithFormat:@"%@ | result:%@", v11, v16];
    }

    __int128 v14 = (void *)v17;

    [MEMORY[0x1896127A0] sharedLogger];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 oslog];
    char v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _failedInterestInContent:withResponseError:description:completion:].cold.1();
    }
  }
}

void __81__MAAutoAsset__failedInterestInContent_withResponseError_description_completion___block_invoke( uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 56)) != 0
    && (+[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v5,  @"auto(interestInContent)",  0LL,  *(void *)(a1 + 40)),  (id v2 = (id)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 oslog];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __81__MAAutoAsset__failedInterestInContent_withResponseError_description_completion___block_invoke_cold_1( a1,  (uint64_t)v2);
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 oslog];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl( &dword_18718F000,  v4,  OS_LOG_TYPE_DEFAULT,  "MA-auto{_failedInterestInContent} | %{public}@ | SUCCESS",  (uint8_t *)&v8,  0xCu);
    }

    id v2 = 0LL;
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

- (void)_successCheckForNewer:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[MAAutoAsset localContentURL](self, "localContentURL");
  int v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v7)
    {
LABEL_3:
      -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
      uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1895F87A8];
      v14[1] = 3221225472LL;
      v14[2] = __48__MAAutoAsset__successCheckForNewer_completion___block_invoke;
      v14[3] = &unk_189FF9600;
      id v15 = (os_log_s *)v6;
      id v16 = v7;
      dispatch_async(v9, v14);

      uint64_t v10 = v15;
      goto LABEL_7;
    }
  }

  else
  {
    [v6 currentStatus];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 newerVersionAttributes];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAAutoAsset setAssetAttributes:](self, "setAssetAttributes:", v12);

    if (v7) {
      goto LABEL_3;
    }
  }

  [MEMORY[0x1896127A0] sharedLogger];
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 oslog];
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[MAAutoAsset _successCheckForNewer:completion:].cold.1(v6);
  }
LABEL_7:
}

void __48__MAAutoAsset__successCheckForNewer_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) currentStatus];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 newerVersionAttributes];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();

  [MEMORY[0x1896127A0] sharedLogger];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 oslog];
  uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) summary];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    int v11 = 138543362;
    id v12 = v6;
    _os_log_impl( &dword_18718F000,  v5,  OS_LOG_TYPE_DEFAULT,  "MA-auto{_successCheckForNewer} | %{public}@ | SUCCESS",  (uint8_t *)&v11,  0xCu);
  }

  uint64_t v7 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) fullAssetSelector];
  int v8 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) currentStatus];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 newerVersionAttributes];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, BOOL, void *, void))(v7 + 16))(v7, v8, v3 != 0LL, v10, 0LL);
}

- (void)_failedCheckForNewer:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    uint64_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __77__MAAutoAsset__failedCheckForNewer_withResponseError_description_completion___block_invoke;
    block[3] = &unk_189FF9628;
    void block[4] = self;
    id v21 = v10;
    int64_t v24 = a3;
    id v22 = v11;
    id v23 = v12;
    dispatch_async(v13, block);
  }

  else
  {
    id v14 = objc_alloc(NSString);
    if (v10)
    {
      [v10 checkedSummary];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = [v14 initWithFormat:@"%@ | error:%@", v11, v15];
    }

    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:]( &OBJC_CLASS___MAAutoAssetError,  "summaryForCode:fromOperation:",  a3,  @"checkForNewer");
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = [v14 initWithFormat:@"%@ | result:%@", v11, v15];
    }

    uint64_t v17 = (void *)v16;

    [MEMORY[0x1896127A0] sharedLogger];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 oslog];
    char v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _failedCheckForNewer:withResponseError:description:completion:].cold.1();
    }
  }
}

void __77__MAAutoAsset__failedCheckForNewer_withResponseError_description_completion___block_invoke( uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) assetSelector];
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v3 = *(id *)(a1 + 40);
  if (v3
    || (uint64_t v7 = *(void *)(a1 + 64)) != 0
    && (+[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v7,  @"auto(checkForNewer)",  0LL,  *(void *)(a1 + 48)),  (id v3 = (id)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 oslog];
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __77__MAAutoAsset__failedCheckForNewer_withResponseError_description_completion___block_invoke_cold_1(a1, v3);
    }

    id v6 = v2;
    id v2 = 0LL;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 48);
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_log_impl( &dword_18718F000,  v6,  OS_LOG_TYPE_DEFAULT,  "MA-auto{_failedCheckForNewer} | %{public}@ | SUCCESS",  (uint8_t *)&v10,  0xCu);
    }

    id v3 = 0LL;
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

- (void)_successDetermineIfAvailable:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  -[MAAutoAsset localContentURL](self, "localContentURL");
  int v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v7)
    {
LABEL_3:
      -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
      uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1895F87A8];
      v14[1] = 3221225472LL;
      v14[2] = __55__MAAutoAsset__successDetermineIfAvailable_completion___block_invoke;
      v14[3] = &unk_189FF9600;
      id v15 = (os_log_s *)v6;
      id v16 = v7;
      dispatch_async(v9, v14);

      int v10 = v15;
      goto LABEL_7;
    }
  }

  else
  {
    [v6 assetAttributes];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAAutoAsset setAssetAttributes:](self, "setAssetAttributes:", v11);

    [v6 localContentURL];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAAutoAsset setLocalContentURL:](self, "setLocalContentURL:", v12);

    if (v7) {
      goto LABEL_3;
    }
  }

  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v13 oslog];
  int v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    -[MAAutoAsset _successDetermineIfAvailable:completion:].cold.1(v6);
  }
LABEL_7:
}

void __55__MAAutoAsset__successDetermineIfAvailable_completion___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896127A0] sharedLogger];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) summary];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    int v8 = 138543362;
    uint64_t v9 = v4;
    _os_log_impl( &dword_18718F000,  v3,  OS_LOG_TYPE_DEFAULT,  "MA-auto{_successDetermineIfAvailable} | %{public}@ | SUCCESS",  (uint8_t *)&v8,  0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) fullAssetSelector];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) assetAttributes];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *, void))(v5 + 16))(v5, v6, v7, 0LL);
}

- (void)_failedDetermineIfAvailable:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    uint64_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __84__MAAutoAsset__failedDetermineIfAvailable_withResponseError_description_completion___block_invoke;
    block[3] = &unk_189FF9628;
    void block[4] = self;
    id v21 = v10;
    int64_t v24 = a3;
    id v22 = v11;
    id v23 = v12;
    dispatch_async(v13, block);
  }

  else
  {
    id v14 = objc_alloc(NSString);
    if (v10)
    {
      [v10 checkedSummary];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = [v14 initWithFormat:@"%@ | error:%@", v11, v15];
    }

    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:]( &OBJC_CLASS___MAAutoAssetError,  "summaryForCode:fromOperation:",  a3,  @"determineIfAvailable");
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v16 = [v14 initWithFormat:@"%@ | result:%@", v11, v15];
    }

    uint64_t v17 = (void *)v16;

    [MEMORY[0x1896127A0] sharedLogger];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 oslog];
    char v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _failedDetermineIfAvailable:withResponseError:description:completion:].cold.1();
    }
  }
}

void __84__MAAutoAsset__failedDetermineIfAvailable_withResponseError_description_completion___block_invoke( uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) assetSelector];
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v3 = *(id *)(a1 + 40);
  if (v3
    || (uint64_t v7 = *(void *)(a1 + 64)) != 0
    && (+[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v7,  @"auto(determineIfAvailable)",  0LL,  *(void *)(a1 + 48)),  (id v3 = (id)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 oslog];
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __84__MAAutoAsset__failedDetermineIfAvailable_withResponseError_description_completion___block_invoke_cold_1( a1,  v3);
    }

    id v6 = v2;
    id v2 = 0LL;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    int v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 48);
      int v10 = 138543362;
      uint64_t v11 = v9;
      _os_log_impl( &dword_18718F000,  v6,  OS_LOG_TYPE_DEFAULT,  "MA-auto{_failedDetermineIfAvailable} | %{public}@ | SUCCESS",  (uint8_t *)&v10,  0xCu);
    }

    id v3 = 0LL;
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

- (void)_successCurrentStatus:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    int v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __48__MAAutoAsset__successCurrentStatus_completion___block_invoke;
    v11[3] = &unk_189FF9738;
    uint64_t v13 = (os_log_s *)v7;
    id v12 = v6;
    dispatch_async(v8, v11);

    uint64_t v9 = v13;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 oslog];
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _successCurrentStatus:completion:].cold.1(v6);
    }
  }
}

void __48__MAAutoAsset__successCurrentStatus_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) currentStatus];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0LL);
}

- (void)_failedCurrentStatus:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    uint64_t v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __77__MAAutoAsset__failedCurrentStatus_withResponseError_description_completion___block_invoke;
    block[3] = &unk_189FFA488;
    id v21 = v10;
    int64_t v24 = a3;
    id v22 = v11;
    id v23 = v12;
    dispatch_async(v13, block);

    id v14 = v21;
  }

  else
  {
    id v15 = objc_alloc(NSString);
    if (v10)
    {
      [v10 checkedSummary];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v15 initWithFormat:@"%@ | error:%@", v11, v16];
    }

    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:]( &OBJC_CLASS___MAAutoAssetError,  "summaryForCode:fromOperation:",  a3,  @"currentStatus");
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v15 initWithFormat:@"%@ | result:%@", v11, v16];
    }

    id v14 = (void *)v17;

    [MEMORY[0x1896127A0] sharedLogger];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 oslog];
    char v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _failedCurrentStatus:withResponseError:description:completion:].cold.1();
    }
  }
}

void __77__MAAutoAsset__failedCurrentStatus_withResponseError_description_completion___block_invoke( uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 56)) != 0
    && (+[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v5,  @"auto(currentStatus)",  0LL,  *(void *)(a1 + 40)),  (id v2 = (id)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 oslog];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __77__MAAutoAsset__failedCurrentStatus_withResponseError_description_completion___block_invoke_cold_1( a1,  (uint64_t)v2);
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 oslog];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl( &dword_18718F000,  v4,  OS_LOG_TYPE_DEFAULT,  "MA-auto{_failedCurrentStatus} | %{public}@ | SUCCESS",  (uint8_t *)&v8,  0xCu);
    }

    id v2 = 0LL;
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

- (void)_lockContentStatusProgress:(id)a3 lockForUseError:(id)a4 progressBlock:(id)a5
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a5;
  +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
  uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  if (v8)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __72__MAAutoAsset__lockContentStatusProgress_lockForUseError_progressBlock___block_invoke;
    v14[3] = &unk_189FF9738;
    uint64_t v16 = (os_log_s *)v8;
    id v15 = v7;
    dispatch_async(v10, v14);

    id v11 = v16;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 oslog];
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      [v7 summary];
      uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v18 = v13;
      _os_log_impl( &dword_18718F000,  v11,  OS_LOG_TYPE_DEFAULT,  "MA-auto{_lockContentStatusProgress} | no client progress block | %{public}@",  buf,  0xCu);
    }
  }
}

uint64_t __72__MAAutoAsset__lockContentStatusProgress_lockForUseError_progressBlock___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  0LL);
}

- (void)_successLockContent:(id)a3 dueToDesire:(id)a4 sandboxExtension:(id)a5 sandboxExtensionPath:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
  uint64_t v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __96__MAAutoAsset__successLockContent_dueToDesire_sandboxExtension_sandboxExtensionPath_completion___block_invoke;
  block[3] = &unk_189FFADB8;
  void block[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v18 = v15;
  id v19 = v14;
  id v20 = v16;
  id v21 = v13;
  id v22 = v12;
  dispatch_sync(v17, block);
}

void __96__MAAutoAsset__successLockContent_dueToDesire_sandboxExtension_sandboxExtensionPath_completion___block_invoke( uint64_t a1)
{
  uint64_t v2 = a1 + 40;
  [*(id *)(a1 + 40) currentStatus];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 newerVersionAttributes];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(v2 - 8) setAssetAttributes:v4];

  [*(id *)v2 fullAssetSelector];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(v2 - 8) setContentLockedSelector:v5];

  [*(id *)(v2 + 8) desireReason];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(v2 - 8) setContentLockedReason:v6];

  [*(id *)v2 localContentURL];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(v2 - 8) setLocalContentURL:v7];

  objc_msgSend(*(id *)(v2 - 8), "setLocksOfContent:", objc_msgSend(*(id *)(v2 - 8), "locksOfContent") + 1);
  if (*(void *)(v2 + 32))
  {
    +[MAAutoAssetAuthorizationPolicy consumeSandboxExtension:forPath:]( &OBJC_CLASS___MAAutoAssetAuthorizationPolicy,  "consumeSandboxExtension:forPath:",  *(void *)(a1 + 56),  *(void *)(a1 + 64));
    [*(id *)(a1 + 32) completionDispatchQueue];
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __96__MAAutoAsset__successLockContent_dueToDesire_sandboxExtension_sandboxExtensionPath_completion___block_invoke_452;
    v11[3] = &unk_189FF9600;
    id v12 = (os_log_s *)*(id *)(a1 + 40);
    id v13 = *(id *)(a1 + 72);
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
      __96__MAAutoAsset__successLockContent_dueToDesire_sandboxExtension_sandboxExtensionPath_completion___block_invoke_cold_1((id *)v2);
    }
  }
}

void __96__MAAutoAsset__successLockContent_dueToDesire_sandboxExtension_sandboxExtensionPath_completion___block_invoke_452( uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) summary];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    int v8 = 138543362;
    uint64_t v9 = v4;
    _os_log_impl( &dword_18718F000,  v3,  OS_LOG_TYPE_DEFAULT,  "MA-auto{_successLockContent} | %{public}@ | SUCCESS",  (uint8_t *)&v8,  0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) fullAssetSelector];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) localContentURL];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t, void *, void, void))(v5 + 16))(v5, v6, 1LL, v7, 0LL, 0LL);
}

- (void)_failedLockContent:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __75__MAAutoAsset__failedLockContent_withResponseError_description_completion___block_invoke;
    block[3] = &unk_189FFADE0;
    id v21 = v10;
    int64_t v25 = a3;
    id v22 = v11;
    id v23 = self;
    id v24 = v12;
    dispatch_async(v13, block);

    id v14 = v21;
  }

  else
  {
    id v15 = objc_alloc(NSString);
    if (v10)
    {
      [v10 checkedSummary];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v15 initWithFormat:@"%@ | error:%@", v11, v16];
    }

    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:]( &OBJC_CLASS___MAAutoAssetError,  "summaryForCode:fromOperation:",  a3,  @"lockContent");
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v15 initWithFormat:@"%@ | result:%@", v11, v16];
    }

    id v14 = (void *)v17;

    [MEMORY[0x1896127A0] sharedLogger];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 oslog];
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _failedLockContent:withResponseError:description:completion:].cold.1();
    }
  }
}

void __75__MAAutoAsset__failedLockContent_withResponseError_description_completion___block_invoke( uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 64)) != 0
    && (+[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v5,  @"auto(lockContent)",  0LL,  *(void *)(a1 + 40)),  (id v2 = (id)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 oslog];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __75__MAAutoAsset__failedLockContent_withResponseError_description_completion___block_invoke_cold_1( a1,  (uint64_t)v2);
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 oslog];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v10 = 138543362;
      uint64_t v11 = v7;
      _os_log_impl( &dword_18718F000,  v4,  OS_LOG_TYPE_DEFAULT,  "MA-auto{_failedLockContent} | %{public}@ | SUCCESS",  (uint8_t *)&v10,  0xCu);
    }

    id v2 = 0LL;
  }

  uint64_t v8 = *(void *)(a1 + 56);
  [*(id *)(a1 + 48) assetSelector];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void, void, void, id))(v8 + 16))(v8, v9, 0LL, 0LL, 0LL, v2);
}

- (void)_successMapLockedContent:(id)a3 dueToDesire:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
  uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __63__MAAutoAsset__successMapLockedContent_dueToDesire_completion___block_invoke;
  block[3] = &unk_189FFAE08;
  id v14 = self;
  id v15 = v8;
  id v13 = v7;
  id v10 = v7;
  id v11 = v8;
  dispatch_sync(v9, block);
}

void __63__MAAutoAsset__successMapLockedContent_dueToDesire_completion___block_invoke(id *a1)
{
  if (a1[6])
  {
    [a1[5] completionDispatchQueue];
    id v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __63__MAAutoAsset__successMapLockedContent_dueToDesire_completion___block_invoke_455;
    v5[3] = &unk_189FF9600;
    id v6 = (os_log_s *)a1[4];
    id v7 = a1[6];
    dispatch_async(v2, v5);

    id v3 = v6;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 oslog];
    id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __63__MAAutoAsset__successMapLockedContent_dueToDesire_completion___block_invoke_cold_1((uint64_t)a1);
    }
  }
}

void __63__MAAutoAsset__successMapLockedContent_dueToDesire_completion___block_invoke_455(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896127A0] sharedLogger];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) summary];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    int v7 = 138543362;
    id v8 = v4;
    _os_log_impl( &dword_18718F000,  v3,  OS_LOG_TYPE_DEFAULT,  "MA-auto{_successMapLockedContent} | %{public}@ | SUCCESS",  (uint8_t *)&v7,  0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) fullAssetSelector];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void))(v5 + 16))(v5, v6, 0LL);
}

- (void)_failedMapLockedContent:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __80__MAAutoAsset__failedMapLockedContent_withResponseError_description_completion___block_invoke;
    block[3] = &unk_189FFA488;
    id v21 = v10;
    int64_t v24 = a3;
    id v22 = v11;
    id v23 = v12;
    dispatch_async(v13, block);

    id v14 = v21;
  }

  else
  {
    id v15 = objc_alloc(NSString);
    if (v10)
    {
      [v10 checkedSummary];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v15 initWithFormat:@"%@ | error:%@", v11, v16];
    }

    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:]( &OBJC_CLASS___MAAutoAssetError,  "summaryForCode:fromOperation:",  a3,  @"mapLockedContent");
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v15 initWithFormat:@"%@ | result:%@", v11, v16];
    }

    id v14 = (void *)v17;

    [MEMORY[0x1896127A0] sharedLogger];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 oslog];
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _failedMapLockedContent:withResponseError:description:completion:].cold.1();
    }
  }
}

void __80__MAAutoAsset__failedMapLockedContent_withResponseError_description_completion___block_invoke( uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 56)) != 0
    && (+[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v5,  @"auto(lockContent)",  0LL,  *(void *)(a1 + 40)),  (id v2 = (id)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 oslog];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __80__MAAutoAsset__failedMapLockedContent_withResponseError_description_completion___block_invoke_cold_1( a1,  (uint64_t)v2);
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 oslog];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl( &dword_18718F000,  v4,  OS_LOG_TYPE_DEFAULT,  "MA-auto{_failedMapLockedContent} | %{public}@ | SUCCESS",  (uint8_t *)&v8,  0xCu);
    }

    id v2 = 0LL;
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

- (void)_successContinueLockUsage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    int v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __52__MAAutoAsset__successContinueLockUsage_completion___block_invoke;
    v11[3] = &unk_189FF9600;
    id v12 = (os_log_s *)v6;
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
      -[MAAutoAsset _successContinueLockUsage:completion:].cold.1(v6);
    }
  }
}

uint64_t __52__MAAutoAsset__successContinueLockUsage_completion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896127A0] sharedLogger];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) summary];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl( &dword_18718F000,  v3,  OS_LOG_TYPE_DEFAULT,  "MA-auto{_successContinueLockUsage} | %{public}@ | SUCCESS",  (uint8_t *)&v6,  0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)_failedContinueLockUsage:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __81__MAAutoAsset__failedContinueLockUsage_withResponseError_description_completion___block_invoke;
    block[3] = &unk_189FFADE0;
    id v21 = v10;
    int64_t v25 = a3;
    id v22 = v11;
    id v23 = self;
    id v24 = v12;
    dispatch_async(v13, block);

    id v14 = v21;
  }

  else
  {
    id v15 = objc_alloc(NSString);
    if (v10)
    {
      [v10 checkedSummary];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v15 initWithFormat:@"%@ | error:%@", v11, v16];
    }

    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:]( &OBJC_CLASS___MAAutoAssetError,  "summaryForCode:fromOperation:",  a3,  @"continueLockUsage");
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v15 initWithFormat:@"%@ | result:%@", v11, v16];
    }

    id v14 = (void *)v17;

    [MEMORY[0x1896127A0] sharedLogger];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 oslog];
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _failedContinueLockUsage:withResponseError:description:completion:].cold.1();
    }
  }
}

void __81__MAAutoAsset__failedContinueLockUsage_withResponseError_description_completion___block_invoke( uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 64)) != 0
    && (+[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v5,  @"auto(continueLockUsage)",  0LL,  *(void *)(a1 + 40)),  (id v2 = (id)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 oslog];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __81__MAAutoAsset__failedContinueLockUsage_withResponseError_description_completion___block_invoke_cold_1( a1,  (uint64_t)v2);
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 oslog];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v10 = 138543362;
      uint64_t v11 = v7;
      _os_log_impl( &dword_18718F000,  v4,  OS_LOG_TYPE_DEFAULT,  "MA-auto{_failedContinueLockUsage} | %{public}@ | SUCCESS",  (uint8_t *)&v10,  0xCu);
    }

    id v2 = 0LL;
  }

  uint64_t v8 = *(void *)(a1 + 56);
  [*(id *)(a1 + 48) assetSelector];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v2);
}

- (void)_successEndLockUsage:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
  uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __47__MAAutoAsset__successEndLockUsage_completion___block_invoke;
  block[3] = &unk_189FFAE30;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, block);
}

void __47__MAAutoAsset__successEndLockUsage_completion___block_invoke(id *a1)
{
  id v2 = a1 + 4;
  int v3 = [a1[4] locksOfContent];
  id v4 = *v2;
  int v5 = [*v2 locksOfContent];
  if (v3 < 1)
  {
    if (!v5) {
      goto LABEL_8;
    }
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __47__MAAutoAsset__successEndLockUsage_completion___block_invoke_cold_2((uint64_t)a1, v2, v9);
    }

    id v7 = *v2;
    uint64_t v6 = 0LL;
  }

  else
  {
    uint64_t v6 = (v5 - 1);
    id v7 = v4;
  }

  [v7 setLocksOfContent:v6];
LABEL_8:
  if ((int)[*v2 locksOfContent] <= 0)
  {
    [*v2 setLocalContentURL:0];
    [*v2 setContentLockedSelector:0];
    [*v2 setContentLockedReason:0];
  }

  if (a1[6])
  {
    [a1[4] completionDispatchQueue];
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __47__MAAutoAsset__successEndLockUsage_completion___block_invoke_458;
    v13[3] = &unk_189FF9600;
    id v14 = (os_log_s *)a1[5];
    id v15 = a1[6];
    dispatch_async(v10, v13);

    uint64_t v11 = v14;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 oslog];
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __47__MAAutoAsset__successEndLockUsage_completion___block_invoke_cold_1((uint64_t)a1);
    }
  }
}

uint64_t __47__MAAutoAsset__successEndLockUsage_completion___block_invoke_458(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896127A0] sharedLogger];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) summary];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl( &dword_18718F000,  v3,  OS_LOG_TYPE_DEFAULT,  "MA-auto{_successEndLockUsage} | %{public}@ | SUCCESS",  (uint8_t *)&v6,  0xCu);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)_failedEndLockUsage:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __76__MAAutoAsset__failedEndLockUsage_withResponseError_description_completion___block_invoke;
    block[3] = &unk_189FFADE0;
    id v21 = v10;
    int64_t v25 = a3;
    id v22 = v11;
    id v23 = self;
    id v24 = v12;
    dispatch_async(v13, block);

    id v14 = v21;
  }

  else
  {
    id v15 = objc_alloc(NSString);
    if (v10)
    {
      [v10 checkedSummary];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v15 initWithFormat:@"%@ | error:%@", v11, v16];
    }

    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:]( &OBJC_CLASS___MAAutoAssetError,  "summaryForCode:fromOperation:",  a3,  @"endLockUsage");
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v15 initWithFormat:@"%@ | result:%@", v11, v16];
    }

    id v14 = (void *)v17;

    [MEMORY[0x1896127A0] sharedLogger];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 oslog];
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _failedEndLockUsage:withResponseError:description:completion:].cold.1();
    }
  }
}

void __76__MAAutoAsset__failedEndLockUsage_withResponseError_description_completion___block_invoke( uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 64)) != 0
    && (+[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v5,  @"auto(endLockUsage)",  0LL,  *(void *)(a1 + 40)),  (id v2 = (id)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
    [MEMORY[0x1896127A0] sharedLogger];
    int v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 oslog];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __76__MAAutoAsset__failedEndLockUsage_withResponseError_description_completion___block_invoke_cold_1( a1,  (uint64_t)v2);
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 oslog];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v10 = 138543362;
      uint64_t v11 = v7;
      _os_log_impl( &dword_18718F000,  v4,  OS_LOG_TYPE_DEFAULT,  "MA-auto{_failedEndLockUsage} | %{public}@ | SUCCESS",  (uint8_t *)&v10,  0xCu);
    }

    id v2 = 0LL;
  }

  uint64_t v8 = *(void *)(a1 + 56);
  [*(id *)(a1 + 48) assetSelector];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v2);
}

- (void)_successCancelActivity:(id)a3
{
  id v4 = a3;
  +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __38__MAAutoAsset__successCancelActivity___block_invoke;
  block[3] = &unk_189FF9738;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

void __38__MAAutoAsset__successCancelActivity___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    [*(id *)(a1 + 32) completionDispatchQueue];
    id v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __38__MAAutoAsset__successCancelActivity___block_invoke_461;
    v6[3] = &unk_189FF9600;
    int v3 = *(void **)(a1 + 40);
    v6[4] = *(void *)(a1 + 32);
    id v7 = v3;
    dispatch_async(v2, v6);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 oslog];
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __38__MAAutoAsset__successCancelActivity___block_invoke_cold_1(a1);
    }
  }

void __38__MAAutoAsset__successCancelActivity___block_invoke_461(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896127A0] sharedLogger];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) assetSelector];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 summary];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    int v8 = 138543362;
    id v9 = v5;
    _os_log_impl( &dword_18718F000,  v3,  OS_LOG_TYPE_DEFAULT,  "MA-auto{_successCancelActivity} | %{public}@ | SUCCESS",  (uint8_t *)&v8,  0xCu);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) assetSelector];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v7, 0LL);
}

- (void)_failedCancelActivity:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __78__MAAutoAsset__failedCancelActivity_withResponseError_description_completion___block_invoke;
    block[3] = &unk_189FFADE0;
    id v21 = v10;
    int64_t v25 = a3;
    id v22 = v11;
    id v23 = self;
    id v24 = v12;
    dispatch_async(v13, block);

    id v14 = v21;
  }

  else
  {
    id v15 = objc_alloc(NSString);
    if (v10)
    {
      [v10 checkedSummary];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v15 initWithFormat:@"%@ | error:%@", v11, v16];
    }

    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:]( &OBJC_CLASS___MAAutoAssetError,  "summaryForCode:fromOperation:",  a3,  @"cancelActivity");
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v15 initWithFormat:@"%@ | result:%@", v11, v16];
    }

    id v14 = (void *)v17;

    [MEMORY[0x1896127A0] sharedLogger];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 oslog];
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _failedCancelActivity:withResponseError:description:completion:].cold.1();
    }
  }
}

void __78__MAAutoAsset__failedCancelActivity_withResponseError_description_completion___block_invoke( uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 64)) != 0
    && (+[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v5,  @"auto(cancelActivity)",  0LL,  *(void *)(a1 + 40)),  (id v2 = (id)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
    [MEMORY[0x1896127A0] sharedLogger];
    int v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 oslog];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __78__MAAutoAsset__failedCancelActivity_withResponseError_description_completion___block_invoke_cold_1( a1,  (uint64_t)v2);
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 oslog];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v10 = 138543362;
      uint64_t v11 = v7;
      _os_log_impl( &dword_18718F000,  v4,  OS_LOG_TYPE_DEFAULT,  "MA-auto{_failedCancelActivity} | %{public}@ | SUCCESS",  (uint8_t *)&v10,  0xCu);
    }

    id v2 = 0LL;
  }

  uint64_t v8 = *(void *)(a1 + 56);
  [*(id *)(a1 + 48) assetSelector];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v2);
}

- (void)_successEliminate:(id)a3
{
  id v4 = a3;
  +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
  uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __33__MAAutoAsset__successEliminate___block_invoke;
  block[3] = &unk_189FF9738;
  void block[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);
}

void __33__MAAutoAsset__successEliminate___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 40))
  {
    [*(id *)(a1 + 32) completionDispatchQueue];
    id v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1895F87A8];
    v6[1] = 3221225472LL;
    v6[2] = __33__MAAutoAsset__successEliminate___block_invoke_466;
    v6[3] = &unk_189FF9600;
    int v3 = *(void **)(a1 + 40);
    v6[4] = *(void *)(a1 + 32);
    id v7 = v3;
    dispatch_async(v2, v6);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 oslog];
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __33__MAAutoAsset__successEliminate___block_invoke_cold_1(a1);
    }
  }

void __33__MAAutoAsset__successEliminate___block_invoke_466(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896127A0] sharedLogger];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) assetSelector];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 summary];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    int v8 = 138543362;
    id v9 = v5;
    _os_log_impl( &dword_18718F000,  v3,  OS_LOG_TYPE_DEFAULT,  "MA-auto{_successEliminate} | %{public}@ | SUCCESS",  (uint8_t *)&v8,  0xCu);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) assetSelector];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void))(v6 + 16))(v6, v7, 0LL);
}

- (void)_failedEliminate:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __73__MAAutoAsset__failedEliminate_withResponseError_description_completion___block_invoke;
    block[3] = &unk_189FFADE0;
    id v21 = v10;
    int64_t v25 = a3;
    id v22 = v11;
    id v23 = self;
    id v24 = v12;
    dispatch_async(v13, block);

    id v14 = v21;
  }

  else
  {
    id v15 = objc_alloc(NSString);
    if (v10)
    {
      [v10 checkedSummary];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v15 initWithFormat:@"%@ | error:%@", v11, v16];
    }

    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:]( &OBJC_CLASS___MAAutoAssetError,  "summaryForCode:fromOperation:",  a3,  @"eliminateAll");
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v15 initWithFormat:@"%@ | result:%@", v11, v16];
    }

    id v14 = (void *)v17;

    [MEMORY[0x1896127A0] sharedLogger];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 oslog];
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _failedEliminate:withResponseError:description:completion:].cold.1();
    }
  }
}

void __73__MAAutoAsset__failedEliminate_withResponseError_description_completion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 64)) != 0
    && (+[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v5,  @"auto(eliminateAll)",  0LL,  *(void *)(a1 + 40)),  (id v2 = (id)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
    [MEMORY[0x1896127A0] sharedLogger];
    int v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 oslog];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __73__MAAutoAsset__failedEliminate_withResponseError_description_completion___block_invoke_cold_1(a1, (uint64_t)v2);
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 oslog];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v10 = 138543362;
      uint64_t v11 = v7;
      _os_log_impl( &dword_18718F000,  v4,  OS_LOG_TYPE_DEFAULT,  "MA-auto{_failedEliminate} | %{public}@ | SUCCESS",  (uint8_t *)&v10,  0xCu);
    }

    id v2 = 0LL;
  }

  uint64_t v8 = *(void *)(a1 + 56);
  [*(id *)(a1 + 48) assetSelector];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v8 + 16))(v8, v9, v2);
}

- (void)_successStageDetermineGroupsAvailableForUpdate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    uint64_t v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __73__MAAutoAsset__successStageDetermineGroupsAvailableForUpdate_completion___block_invoke;
    v11[3] = &unk_189FF9600;
    uint64_t v12 = (os_log_s *)v6;
    id v13 = v7;
    dispatch_async(v8, v11);

    id v9 = v12;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _successStageDetermineGroupsAvailableForUpdate:completion:].cold.1(v6);
    }
  }
}

void __73__MAAutoAsset__successStageDetermineGroupsAvailableForUpdate_completion___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896127A0] sharedLogger];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) summary];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    int v8 = 138543362;
    id v9 = v4;
    _os_log_impl( &dword_18718F000,  v3,  OS_LOG_TYPE_DEFAULT,  "MA-auto(staging-client){_successStageDetermineGroupsAvailableForUpdate} | staging:%{public}@ | SUCCESS",  (uint8_t *)&v8,  0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) byGroupAvailableForStagingAttributes];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) byGroupTotalExpectedBytes];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *, void))(v5 + 16))(v5, v6, v7, 0LL);
}

- (void)_failedStageDetermineGroupsAvailableForUpdate:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __102__MAAutoAsset__failedStageDetermineGroupsAvailableForUpdate_withResponseError_description_completion___block_invoke;
    block[3] = &unk_189FFA488;
    id v21 = v10;
    int64_t v24 = a3;
    id v22 = v11;
    id v23 = v12;
    dispatch_async(v13, block);

    id v14 = v21;
  }

  else
  {
    id v15 = objc_alloc(NSString);
    if (v10)
    {
      [v10 checkedSummary];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v15 initWithFormat:@"%@ | error:%@", v11, v16];
    }

    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:]( &OBJC_CLASS___MAAutoAssetError,  "summaryForCode:fromOperation:",  a3,  @"stageDetermineGroupsAvailableForStaging");
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v15 initWithFormat:@"%@ | result:%@", v11, v16];
    }

    id v14 = (void *)v17;

    [MEMORY[0x1896127A0] sharedLogger];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 oslog];
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _failedStageDetermineGroupsAvailableForUpdate:withResponseError:description:completion:].cold.1();
    }
  }
}

void __102__MAAutoAsset__failedStageDetermineGroupsAvailableForUpdate_withResponseError_description_completion___block_invoke( uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 56)) != 0
    && (+[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v5,  @"auto(stageDetermineAllAvailable)",  0LL,  *(void *)(a1 + 40)),  (id v2 = (id)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
    [MEMORY[0x1896127A0] sharedLogger];
    int v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 oslog];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __102__MAAutoAsset__failedStageDetermineGroupsAvailableForUpdate_withResponseError_description_completion___block_invoke_cold_1( a1,  (uint64_t)v2);
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 oslog];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl( &dword_18718F000,  v4,  OS_LOG_TYPE_DEFAULT,  "MA-auto(staging-client){_failedStageDetermineGroupsAvailableForUpdate} | %{public}@ | SUCCESS",  (uint8_t *)&v8,  0xCu);
    }

    id v2 = 0LL;
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

- (void)_successStageDetermineAllAvailable:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    int v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __61__MAAutoAsset__successStageDetermineAllAvailable_completion___block_invoke;
    v11[3] = &unk_189FF9600;
    id v12 = (os_log_s *)v6;
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
      -[MAAutoAsset _successStageDetermineAllAvailable:completion:].cold.1(v6);
    }
  }
}

void __61__MAAutoAsset__successStageDetermineAllAvailable_completion___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896127A0] sharedLogger];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) summary];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    int v7 = 138543362;
    int v8 = v4;
    _os_log_impl( &dword_18718F000,  v3,  OS_LOG_TYPE_DEFAULT,  "MA-auto(staging-client){_successStageDetermineAllAvailable} | staging:%{public}@ | SUCCESS",  (uint8_t *)&v7,  0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) allAvailableForStagingAttributes];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, uint64_t, void))(v5 + 16))( v5,  v6,  [*(id *)(a1 + 32) totalExpectedBytes],  0);
}

- (void)_failedStageDetermineAllAvailable:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __90__MAAutoAsset__failedStageDetermineAllAvailable_withResponseError_description_completion___block_invoke;
    block[3] = &unk_189FFA488;
    id v21 = v10;
    int64_t v24 = a3;
    id v22 = v11;
    id v23 = v12;
    dispatch_async(v13, block);

    id v14 = v21;
  }

  else
  {
    id v15 = objc_alloc(NSString);
    if (v10)
    {
      [v10 checkedSummary];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v15 initWithFormat:@"%@ | error:%@", v11, v16];
    }

    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:]( &OBJC_CLASS___MAAutoAssetError,  "summaryForCode:fromOperation:",  a3,  @"stageDetermineAllAvailable");
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v15 initWithFormat:@"%@ | result:%@", v11, v16];
    }

    id v14 = (void *)v17;

    [MEMORY[0x1896127A0] sharedLogger];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 oslog];
    id v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _failedStageDetermineAllAvailable:withResponseError:description:completion:].cold.1();
    }
  }
}

void __90__MAAutoAsset__failedStageDetermineAllAvailable_withResponseError_description_completion___block_invoke( uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 56)) != 0
    && (+[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v5,  @"auto(stageDetermineAllAvailable)",  0LL,  *(void *)(a1 + 40)),  (id v2 = (id)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
    [MEMORY[0x1896127A0] sharedLogger];
    int v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 oslog];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __90__MAAutoAsset__failedStageDetermineAllAvailable_withResponseError_description_completion___block_invoke_cold_1( a1,  (uint64_t)v2);
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 oslog];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl( &dword_18718F000,  v4,  OS_LOG_TYPE_DEFAULT,  "MA-auto(staging-client){_failedStageDetermineAllAvailable} | %{public}@ | SUCCESS",  (uint8_t *)&v8,  0xCu);
    }

    id v2 = 0LL;
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

- (void)_stageDownloadAllStatusProgress:(id)a3 stageProgressError:(id)a4 progressBlock:(id)a5
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a5;
  +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
  uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  if (v8)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __80__MAAutoAsset__stageDownloadAllStatusProgress_stageProgressError_progressBlock___block_invoke;
    v14[3] = &unk_189FF9738;
    id v16 = (os_log_s *)v8;
    id v15 = v7;
    dispatch_async(v10, v14);

    id v11 = v16;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 oslog];
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      [v7 summary];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v18 = v13;
      _os_log_impl( &dword_18718F000,  v11,  OS_LOG_TYPE_DEFAULT,  "MA-auto(staging-client){_stageDownloadAllStatusProgress} | no client progress block | %{public}@",  buf,  0xCu);
    }
  }
}

uint64_t __80__MAAutoAsset__stageDownloadAllStatusProgress_stageProgressError_progressBlock___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  0LL);
}

- (void)_successStageDownloadGroups:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __54__MAAutoAsset__successStageDownloadGroups_completion___block_invoke;
    v11[3] = &unk_189FF9600;
    id v12 = (os_log_s *)v6;
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
      -[MAAutoAsset _successStageDownloadGroups:completion:].cold.1(v6);
    }
  }
}

void __54__MAAutoAsset__successStageDownloadGroups_completion___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896127A0] sharedLogger];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) summary];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    int v8 = 138543362;
    uint64_t v9 = v4;
    _os_log_impl( &dword_18718F000,  v3,  OS_LOG_TYPE_DEFAULT,  "MA-auto(staging-client){_successStageDownloadGroups} | staged:%{public}@ | SUCCESS",  (uint8_t *)&v8,  0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 40);
  [*(id *)(a1 + 32) byGroupTotalStagedBytes];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) byGroupAssetsSuccessfullyStaged];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *, void))(v5 + 16))(v5, v6, v7, 0LL);
}

- (void)_failedStageDownloadGroups:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __83__MAAutoAsset__failedStageDownloadGroups_withResponseError_description_completion___block_invoke;
    block[3] = &unk_189FFA488;
    id v21 = v10;
    int64_t v24 = a3;
    id v22 = v11;
    id v23 = v12;
    dispatch_async(v13, block);

    id v14 = v21;
  }

  else
  {
    id v15 = objc_alloc(NSString);
    if (v10)
    {
      [v10 checkedSummary];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v15 initWithFormat:@"%@ | error:%@", v11, v16];
    }

    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:]( &OBJC_CLASS___MAAutoAssetError,  "summaryForCode:fromOperation:",  a3,  @"stageDownloadGroups");
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v15 initWithFormat:@"%@ | result:%@", v11, v16];
    }

    id v14 = (void *)v17;

    [MEMORY[0x1896127A0] sharedLogger];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 oslog];
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _failedStageDownloadGroups:withResponseError:description:completion:].cold.1();
    }
  }
}

void __83__MAAutoAsset__failedStageDownloadGroups_withResponseError_description_completion___block_invoke( uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 56)) != 0
    && (+[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v5,  @"auto(stageDownloadGroups)",  0LL,  *(void *)(a1 + 40)),  (id v2 = (id)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
    [MEMORY[0x1896127A0] sharedLogger];
    int v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 oslog];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __83__MAAutoAsset__failedStageDownloadGroups_withResponseError_description_completion___block_invoke_cold_1( a1,  (uint64_t)v2);
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 oslog];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl( &dword_18718F000,  v4,  OS_LOG_TYPE_DEFAULT,  "MA-auto(staging-client){_failedStageDownloadGroups} | %{public}@ | SUCCESS",  (uint8_t *)&v8,  0xCu);
    }

    id v2 = 0LL;
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

- (void)_successStageDownloadAll:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    int v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __51__MAAutoAsset__successStageDownloadAll_completion___block_invoke;
    v11[3] = &unk_189FF9600;
    id v12 = (os_log_s *)v6;
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
      -[MAAutoAsset _successStageDownloadAll:completion:].cold.1(v6);
    }
  }
}

uint64_t __51__MAAutoAsset__successStageDownloadAll_completion___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896127A0] sharedLogger];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) summary];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl( &dword_18718F000,  v3,  OS_LOG_TYPE_DEFAULT,  "MA-auto(staging-client){_successStageDownloadAll} | staged:%{public}@ | SUCCESS",  (uint8_t *)&v6,  0xCu);
  }

  return (*(uint64_t (**)(void, uint64_t, uint64_t, void))(*(void *)(a1 + 40) + 16))( *(void *)(a1 + 40),  [*(id *)(a1 + 32) totalStagedBytes],  objc_msgSend(*(id *)(a1 + 32), "assetsSuccessfullyStaged"),  0);
}

- (void)_failedStageDownloadAll:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __80__MAAutoAsset__failedStageDownloadAll_withResponseError_description_completion___block_invoke;
    block[3] = &unk_189FFA488;
    id v21 = v10;
    int64_t v24 = a3;
    id v22 = v11;
    id v23 = v12;
    dispatch_async(v13, block);

    id v14 = v21;
  }

  else
  {
    id v15 = objc_alloc(NSString);
    if (v10)
    {
      [v10 checkedSummary];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v15 initWithFormat:@"%@ | error:%@", v11, v16];
    }

    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:]( &OBJC_CLASS___MAAutoAssetError,  "summaryForCode:fromOperation:",  a3,  @"stageDownloadAll");
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v15 initWithFormat:@"%@ | result:%@", v11, v16];
    }

    id v14 = (void *)v17;

    [MEMORY[0x1896127A0] sharedLogger];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 oslog];
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _failedStageDownloadAll:withResponseError:description:completion:].cold.1();
    }
  }
}

void __80__MAAutoAsset__failedStageDownloadAll_withResponseError_description_completion___block_invoke( uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 56)) != 0
    && (+[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v5,  @"auto(stageDownloadAll)",  0LL,  *(void *)(a1 + 40)),  (id v2 = (id)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
    [MEMORY[0x1896127A0] sharedLogger];
    int v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 oslog];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __80__MAAutoAsset__failedStageDownloadAll_withResponseError_description_completion___block_invoke_cold_1( a1,  (uint64_t)v2);
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 oslog];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl( &dword_18718F000,  v4,  OS_LOG_TYPE_DEFAULT,  "MA-auto(staging-client){_failedStageDownloadAll} | %{public}@ | SUCCESS",  (uint8_t *)&v8,  0xCu);
    }

    id v2 = 0LL;
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

- (void)_successStageCancelOperation:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __44__MAAutoAsset__successStageCancelOperation___block_invoke;
    block[3] = &unk_189FFA550;
    uint64_t v9 = (os_log_s *)v4;
    dispatch_async(v5, block);

    int v6 = v9;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 oslog];
    int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _successStageCancelOperation:].cold.1();
    }
  }
}

uint64_t __44__MAAutoAsset__successStageCancelOperation___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl( &dword_18718F000,  v3,  OS_LOG_TYPE_DEFAULT,  "MA-auto(staging-client){_successStageCancelOperation} | SUCCESS",  v5,  2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)_failedStageCancelOperation:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __84__MAAutoAsset__failedStageCancelOperation_withResponseError_description_completion___block_invoke;
    block[3] = &unk_189FFA488;
    id v21 = v10;
    int64_t v24 = a3;
    id v22 = v11;
    id v23 = v12;
    dispatch_async(v13, block);

    id v14 = v21;
  }

  else
  {
    id v15 = objc_alloc(NSString);
    if (v10)
    {
      [v10 checkedSummary];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v15 initWithFormat:@"%@ | error:%@", v11, v16];
    }

    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:]( &OBJC_CLASS___MAAutoAssetError,  "summaryForCode:fromOperation:",  a3,  @"stageCancelOperation");
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v15 initWithFormat:@"%@ | result:%@", v11, v16];
    }

    id v14 = (void *)v17;

    [MEMORY[0x1896127A0] sharedLogger];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 oslog];
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _failedStageCancelOperation:withResponseError:description:completion:].cold.1();
    }
  }
}

void __84__MAAutoAsset__failedStageCancelOperation_withResponseError_description_completion___block_invoke( uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 56)) != 0
    && (+[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v5,  @"auto(stageCancelOperation)",  0LL,  *(void *)(a1 + 40)),  (id v2 = (id)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
    [MEMORY[0x1896127A0] sharedLogger];
    int v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 oslog];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __84__MAAutoAsset__failedStageCancelOperation_withResponseError_description_completion___block_invoke_cold_1( a1,  (uint64_t)v2);
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 oslog];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl( &dword_18718F000,  v4,  OS_LOG_TYPE_DEFAULT,  "MA-auto(staging-client){_failedStageCancelOperation} | %{public}@ | SUCCESS",  (uint8_t *)&v8,  0xCu);
    }

    id v2 = 0LL;
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

- (void)_successStagePurgeAll:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __37__MAAutoAsset__successStagePurgeAll___block_invoke;
    block[3] = &unk_189FFA550;
    uint64_t v9 = (os_log_s *)v4;
    dispatch_async(v5, block);

    int v6 = v9;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 oslog];
    int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _successStagePurgeAll:].cold.1();
    }
  }
}

uint64_t __37__MAAutoAsset__successStagePurgeAll___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl( &dword_18718F000,  v3,  OS_LOG_TYPE_DEFAULT,  "MA-auto(staging-client){_successStagePurgeAll} | SUCCESS",  v5,  2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)_failedStagePurgeAll:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __77__MAAutoAsset__failedStagePurgeAll_withResponseError_description_completion___block_invoke;
    block[3] = &unk_189FFA488;
    id v21 = v10;
    int64_t v24 = a3;
    id v22 = v11;
    id v23 = v12;
    dispatch_async(v13, block);

    id v14 = v21;
  }

  else
  {
    id v15 = objc_alloc(NSString);
    if (v10)
    {
      [v10 checkedSummary];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v15 initWithFormat:@"%@ | error:%@", v11, v16];
    }

    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:]( &OBJC_CLASS___MAAutoAssetError,  "summaryForCode:fromOperation:",  a3,  @"stagePurgeAll");
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v15 initWithFormat:@"%@ | result:%@", v11, v16];
    }

    id v14 = (void *)v17;

    [MEMORY[0x1896127A0] sharedLogger];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 oslog];
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _failedStagePurgeAll:withResponseError:description:completion:].cold.1();
    }
  }
}

void __77__MAAutoAsset__failedStagePurgeAll_withResponseError_description_completion___block_invoke( uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 56)) != 0
    && (+[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v5,  @"auto(stagePurgeAll)",  0LL,  *(void *)(a1 + 40)),  (id v2 = (id)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
    [MEMORY[0x1896127A0] sharedLogger];
    int v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 oslog];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __77__MAAutoAsset__failedStagePurgeAll_withResponseError_description_completion___block_invoke_cold_1( a1,  (uint64_t)v2);
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 oslog];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl( &dword_18718F000,  v4,  OS_LOG_TYPE_DEFAULT,  "MA-auto(staging-client){_failedStagePurgeAll} | %{public}@ | SUCCESS",  (uint8_t *)&v8,  0xCu);
    }

    id v2 = 0LL;
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

- (void)_successStageEraseAll:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    uint64_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __37__MAAutoAsset__successStageEraseAll___block_invoke;
    block[3] = &unk_189FFA550;
    uint64_t v9 = (os_log_s *)v4;
    dispatch_async(v5, block);

    int v6 = v9;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 oslog];
    int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _successStageEraseAll:].cold.1();
    }
  }
}

uint64_t __37__MAAutoAsset__successStageEraseAll___block_invoke(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  int v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl( &dword_18718F000,  v3,  OS_LOG_TYPE_DEFAULT,  "MA-auto(staging-client){_successStageEraseAll} | SUCCESS",  v5,  2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)_failedStageEraseAll:(int64_t)a3 withResponseError:(id)a4 description:(id)a5 completion:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    -[MAAutoAsset completionDispatchQueue](self, "completionDispatchQueue");
    id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __77__MAAutoAsset__failedStageEraseAll_withResponseError_description_completion___block_invoke;
    block[3] = &unk_189FFA488;
    id v21 = v10;
    int64_t v24 = a3;
    id v22 = v11;
    id v23 = v12;
    dispatch_async(v13, block);

    id v14 = v21;
  }

  else
  {
    id v15 = objc_alloc(NSString);
    if (v10)
    {
      [v10 checkedSummary];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v15 initWithFormat:@"%@ | error:%@", v11, v16];
    }

    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:]( &OBJC_CLASS___MAAutoAssetError,  "summaryForCode:fromOperation:",  a3,  @"stageEraseAll");
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v15 initWithFormat:@"%@ | result:%@", v11, v16];
    }

    id v14 = (void *)v17;

    [MEMORY[0x1896127A0] sharedLogger];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 oslog];
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _failedStageEraseAll:withResponseError:description:completion:].cold.1();
    }
  }
}

void __77__MAAutoAsset__failedStageEraseAll_withResponseError_description_completion___block_invoke( uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 56)) != 0
    && (+[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v5,  @"auto(stageEraseAll)",  0LL,  *(void *)(a1 + 40)),  (id v2 = (id)objc_claimAutoreleasedReturnValue()) != 0LL))
  {
    [MEMORY[0x1896127A0] sharedLogger];
    int v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 oslog];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __77__MAAutoAsset__failedStageEraseAll_withResponseError_description_completion___block_invoke_cold_1( a1,  (uint64_t)v2);
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    int v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 oslog];
    id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 40);
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_impl( &dword_18718F000,  v4,  OS_LOG_TYPE_DEFAULT,  "MA-auto(staging-client){_failedStageEraseAll} | %{public}@ | SUCCESS",  (uint8_t *)&v8,  0xCu);
    }

    id v2 = 0LL;
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

+ (void)interestInContent:(id)a3 forAssetSelector:(id)a4 completion:(id)a5
{
}

+ (void)interestInContent:(id)a3 forAssetSelector:(id)a4 withInterestPolicy:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    id v24 = 0LL;
    id v13 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]( objc_alloc(&OBJC_CLASS___MAAutoAsset),  "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:",  @"MA-auto{+interestInContent}",  v10,  0LL,  0LL,  &v24);
    id v14 = v24;
    if (v14)
    {
      +[MAAutoAsset defaultDispatchQueue](&OBJC_CLASS___MAAutoAsset, "defaultDispatchQueue");
      id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __80__MAAutoAsset_interestInContent_forAssetSelector_withInterestPolicy_completion___block_invoke_2;
      block[3] = &unk_189FFAE08;
      id v16 = &v21;
      id v21 = v12;
      id v19 = v10;
      id v20 = v14;
      dispatch_async(v15, block);
    }

    else
    {
      v22[0] = MEMORY[0x1895F87A8];
      v22[1] = 3221225472LL;
      id v22[2] = __80__MAAutoAsset_interestInContent_forAssetSelector_withInterestPolicy_completion___block_invoke;
      void v22[3] = &unk_189FFAE58;
      id v16 = &v23;
      id v23 = v12;
      [v13 interestInContent:v9 withInterestPolicy:v11 completion:v22];
    }
  }

  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceSetLogDomain");
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 oslog];
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset interestInContent:forAssetSelector:withInterestPolicy:completion:].cold.1();
    }
  }
}

uint64_t __80__MAAutoAsset_interestInContent_forAssetSelector_withInterestPolicy_completion___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __80__MAAutoAsset_interestInContent_forAssetSelector_withInterestPolicy_completion___block_invoke_2( void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

+ (id)interestInContentSync:(id)a3 forAssetSelector:(id)a4
{
  return +[MAAutoAsset interestInContentSync:forAssetSelector:withInterestPolicy:]( &OBJC_CLASS___MAAutoAsset,  "interestInContentSync:forAssetSelector:withInterestPolicy:",  a3,  a4,  0LL);
}

+ (id)interestInContentSync:(id)a3 forAssetSelector:(id)a4 withInterestPolicy:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v13 = 0LL;
  id v10 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]( objc_alloc(&OBJC_CLASS___MAAutoAsset),  "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:",  @"MA-auto{+interestInContentSync}",  v9,  0LL,  0LL,  &v13);

  id v11 = v13;
  if (!v11)
  {
    [v10 interestInContentSync:v7 withInterestPolicy:v8];
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

+ (void)determineIfAvailable:(id)a3 forAssetSelector:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    id v21 = 0LL;
    id v10 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]( objc_alloc(&OBJC_CLASS___MAAutoAsset),  "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:",  @"MA-auto{+determineIfAvailable}",  v8,  0LL,  0LL,  &v21);
    id v11 = v21;
    if (v11)
    {
      +[MAAutoAsset defaultDispatchQueue](&OBJC_CLASS___MAAutoAsset, "defaultDispatchQueue");
      id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __64__MAAutoAsset_determineIfAvailable_forAssetSelector_completion___block_invoke_2;
      block[3] = &unk_189FFAE08;
      id v13 = &v18;
      id v18 = v9;
      id v16 = v8;
      id v17 = v11;
      dispatch_async(v12, block);
    }

    else
    {
      v19[0] = MEMORY[0x1895F87A8];
      v19[1] = 3221225472LL;
      v19[2] = __64__MAAutoAsset_determineIfAvailable_forAssetSelector_completion___block_invoke;
      v19[3] = &unk_189FFAE80;
      id v13 = &v20;
      id v20 = v9;
      [v10 determineIfAvailable:v7 withTimeout:-2 completion:v19];
    }
  }

  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceSetLogDomain");
    [MEMORY[0x1896127A0] sharedLogger];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 oslog];
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset determineIfAvailable:forAssetSelector:completion:].cold.1();
    }
  }
}

uint64_t __64__MAAutoAsset_determineIfAvailable_forAssetSelector_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __64__MAAutoAsset_determineIfAvailable_forAssetSelector_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16LL))(a1[6], a1[4], 0LL, a1[5]);
}

+ (id)determineIfAvailableSync:(id)a3 forAssetSelector:(id)a4 discoveredAttributes:(id *)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v17 = 0LL;
  id v11 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]( objc_alloc(&OBJC_CLASS___MAAutoAsset),  "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:",  @"MA-auto{+determineIfAvailableSync}",  v10,  0LL,  0LL,  &v17);

  id v12 = v17;
  if (!v12)
  {
    id v16 = 0LL;
    [v11 determineIfAvailableSync:v9 withTimeout:-2 discoveredAttributes:a5 error:&v16];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = v16;
    if (!a6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  id v13 = v12;
  id v14 = 0LL;
  if (a6) {
LABEL_3:
  }
    *a6 = v13;
LABEL_4:

  return v14;
}

+ (void)endPreviousLocksOfReason:(id)a3 forAssetSelector:(id)a4 removingLockCount:(int64_t)a5 completion:(id)a6
{
}

+ (void)endPreviousLocksOfReason:(id)a3 forClientName:(id)a4 forAssetSelector:(id)a5 removingLockCount:(int64_t)a6 completion:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (v14)
  {
    id v26 = 0LL;
    id v15 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]( objc_alloc(&OBJC_CLASS___MAAutoAsset),  "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:",  v12,  v13,  0LL,  0LL,  &v26);
    id v16 = v26;
    if (v16)
    {
      +[MAAutoAsset defaultDispatchQueue](&OBJC_CLASS___MAAutoAsset, "defaultDispatchQueue");
      id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __100__MAAutoAsset_endPreviousLocksOfReason_forClientName_forAssetSelector_removingLockCount_completion___block_invoke_2;
      block[3] = &unk_189FFAE08;
      id v18 = &v23;
      id v23 = v14;
      id v21 = v13;
      id v22 = v16;
      dispatch_async(v17, block);
    }

    else
    {
      v24[0] = MEMORY[0x1895F87A8];
      v24[1] = 3221225472LL;
      v24[2] = __100__MAAutoAsset_endPreviousLocksOfReason_forClientName_forAssetSelector_removingLockCount_completion___block_invoke;
      v24[3] = &unk_189FFAE58;
      id v18 = &v25;
      id v25 = v14;
      [v15 _endPreviousLocksOfReason:v11 removingLockCount:a6 completion:v24];
    }
  }

  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceSetLogDomain");
    [MEMORY[0x1896127A0] sharedLogger];
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 oslog];
    id v16 = (id)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset endPreviousLocksOfReason:forClientName:forAssetSelector:removingLockCount:completion:].cold.1();
    }
  }
}

uint64_t __100__MAAutoAsset_endPreviousLocksOfReason_forClientName_forAssetSelector_removingLockCount_completion___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __100__MAAutoAsset_endPreviousLocksOfReason_forClientName_forAssetSelector_removingLockCount_completion___block_invoke_2( void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

- (void)_endPreviousLocksOfReason:(id)a3 removingLockCount:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __70__MAAutoAsset__endPreviousLocksOfReason_removingLockCount_completion___block_invoke;
    v12[3] = &unk_189FFABD8;
    void v12[4] = self;
    id v13 = v8;
    int64_t v15 = a4;
    id v14 = v9;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v12);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 oslog];
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _endPreviousLocksOfReason:removingLockCount:completion:].cold.1();
    }
  }
}

void __70__MAAutoAsset__endPreviousLocksOfReason_removingLockCount_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _failedEndLockUsage:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 48)];
  }

  else
  {
    int v3 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    [*(id *)(a1 + 32) autoAssetClientName];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = __maAutoAssetSharedClientProcessName;
    uint64_t v6 = __maAutoAssetSharedClientProcessID;
    [*(id *)(a1 + 32) assetSelector];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v3,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  v4,  v5,  v6,  v7,  v8);

    id v10 = -[MAAutoAssetInfoEnd initWithLockReason:endingLockCount:]( objc_alloc(&OBJC_CLASS___MAAutoAssetInfoEnd),  "initWithLockReason:endingLockCount:",  *(void *)(a1 + 40),  *(void *)(a1 + 56));
    id v11 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 UUIDString];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();

    [v11 setSafeObject:v9 forKey:@"instance"];
    [v11 setSafeObject:v10 forKey:@"end"];
    id v14 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO:END_PREVIOUS_LOCKS" clientID:v13 version:0 message:v11];
    int64_t v15 = (void *)__maAutoAssetSharedConnectionClient;
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __70__MAAutoAsset__endPreviousLocksOfReason_removingLockCount_completion___block_invoke_2;
    v16[3] = &unk_189FF94D8;
    v16[4] = *(void *)(a1 + 32);
    id v17 = *(id *)(a1 + 48);
    [v15 connectClientSendServerMessage:v14 proxyObject:0 withReply:v16];
  }

void __70__MAAutoAsset__endPreviousLocksOfReason_removingLockCount_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v12 = a2;
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  if (!v12 || v5)
  {
    if (v5)
    {
      id v8 = @"failure reported by server";
      id v9 = *(void **)(a1 + 32);
      uint64_t v10 = 0LL;
      id v11 = v5;
    }

    else
    {
      id v8 = @"no response message from server";
      id v9 = *(void **)(a1 + 32);
      uint64_t v10 = 6104LL;
      id v11 = 0LL;
    }

    [v9 _failedEndLockUsage:v10 withResponseError:v11 description:v8 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [*(id *)(a1 + 32) assetSelector];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 _successEndLockUsage:v7 completion:*(void *)(a1 + 40)];
  }
}

+ (id)endPreviousLocksOfReasonSync:(id)a3 forAssetSelector:(id)a4 removingLockCount:(int64_t)a5
{
  return +[MAAutoAsset endPreviousLocksOfReasonSync:forClientName:forAssetSelector:removingLockCount:]( &OBJC_CLASS___MAAutoAsset,  "endPreviousLocksOfReasonSync:forClientName:forAssetSelector:removingLockCount:",  a3,  0LL,  a4,  a5);
}

+ (id)endPreviousLocksOfReasonSync:(id)a3 forClientName:(id)a4 forAssetSelector:(id)a5 removingLockCount:(int64_t)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  id v15 = 0LL;
  id v12 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]( objc_alloc(&OBJC_CLASS___MAAutoAsset),  "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:",  v11,  v10,  0LL,  0LL,  &v15);

  id v13 = v15;
  if (!v13)
  {
    [v12 _endPreviousLocksOfReasonSync:v9 removingLockCount:a6];
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (id)_endPreviousLocksOfReasonSync:(id)a3 removingLockCount:(int64_t)a4
{
  id v6 = a3;
  uint64_t v23 = 0LL;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  id v26 = __Block_byref_object_copy__5;
  id v27 = __Block_byref_object_dispose__5;
  id v28 = 0LL;
  v21[0] = 0LL;
  v21[1] = v21;
  v21[2] = 0x2020000000LL;
  char v22 = 0;
  v19[0] = 0LL;
  v19[1] = v19;
  v19[2] = 0x2020000000LL;
  char v20 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0LL);
  uint64_t v8 = MEMORY[0x1895F87A8];
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __63__MAAutoAsset__endPreviousLocksOfReasonSync_removingLockCount___block_invoke;
  v14[3] = &unk_189FFAED0;
  id v16 = v19;
  id v17 = &v23;
  id v18 = v21;
  id v9 = v7;
  id v15 = v9;
  -[MAAutoAsset _endPreviousLocksOfReason:removingLockCount:completion:]( self,  "_endPreviousLocksOfReason:removingLockCount:completion:",  v6,  a4,  v14);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:]( &OBJC_CLASS___MAAutoAsset,  "waitOnSemaphore:withDaemonTriggeredTimeout:",  v9,  -100LL))
  {
    +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v8;
    block[1] = 3221225472LL;
    block[2] = __63__MAAutoAsset__endPreviousLocksOfReasonSync_removingLockCount___block_invoke_3;
    block[3] = &unk_189FF94B0;
    void block[4] = v21;
    void block[5] = v19;
    block[6] = &v23;
    dispatch_sync(v10, block);
  }

  id v11 = (id)v24[5];

  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v21, 8);
  _Block_object_dispose(&v23, 8);

  return v11;
}

void __63__MAAutoAsset__endPreviousLocksOfReasonSync_removingLockCount___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v4 = a3;
  +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)dispatch_semaphore_t v7 = *(_OWORD *)(a1 + 32);
  __int128 v11 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __63__MAAutoAsset__endPreviousLocksOfReasonSync_removingLockCount___block_invoke_2;
  block[3] = &unk_189FFAEA8;
  id v9 = v4;
  id v6 = v7[0];
  __int128 v10 = *(_OWORD *)v7;
  v7[0] = v4;
  dispatch_sync(v5, block);
}

uint64_t __63__MAAutoAsset__endPreviousLocksOfReasonSync_removingLockCount___block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 48) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 56) + 8LL) + 40LL), *(id *)(result + 32));
    *(_BYTE *)(*(void *)(*(void *)(v1 + 64) + 8LL) + 24LL) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 40));
  }

  return result;
}

void __63__MAAutoAsset__endPreviousLocksOfReasonSync_removingLockCount___block_invoke_3(void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto(endPreviousLocksOfReasonSync)",  0LL,  @"timeout (at framework layer) while waiting for end-previous-locks to complete");
    uint64_t v3 = *(void *)(a1[6] + 8LL);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }

+ (void)endAllPreviousLocksOfReason:(id)a3 forAssetSelector:(id)a4 completion:(id)a5
{
}

+ (void)endAllPreviousLocksOfReason:(id)a3 forClientName:(id)a4 forAssetSelector:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v12)
  {
    id v24 = 0LL;
    id v13 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]( objc_alloc(&OBJC_CLASS___MAAutoAsset),  "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:",  v10,  v11,  0LL,  0LL,  &v24);
    id v14 = v24;
    if (v14)
    {
      +[MAAutoAsset defaultDispatchQueue](&OBJC_CLASS___MAAutoAsset, "defaultDispatchQueue");
      id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __85__MAAutoAsset_endAllPreviousLocksOfReason_forClientName_forAssetSelector_completion___block_invoke_2;
      block[3] = &unk_189FFAE08;
      id v16 = &v21;
      id v21 = v12;
      id v19 = v11;
      id v20 = v14;
      dispatch_async(v15, block);
    }

    else
    {
      v22[0] = MEMORY[0x1895F87A8];
      v22[1] = 3221225472LL;
      id v22[2] = __85__MAAutoAsset_endAllPreviousLocksOfReason_forClientName_forAssetSelector_completion___block_invoke;
      void v22[3] = &unk_189FFAE58;
      id v16 = &v23;
      id v23 = v12;
      [v13 _endAllPreviousLocksOfReason:v9 completion:v22];
    }
  }

  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceSetLogDomain");
    [MEMORY[0x1896127A0] sharedLogger];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 oslog];
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset endAllPreviousLocksOfReason:forClientName:forAssetSelector:completion:].cold.1();
    }
  }
}

uint64_t __85__MAAutoAsset_endAllPreviousLocksOfReason_forClientName_forAssetSelector_completion___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __85__MAAutoAsset_endAllPreviousLocksOfReason_forClientName_forAssetSelector_completion___block_invoke_2( void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

- (void)_endAllPreviousLocksOfReason:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    id v10[2] = __55__MAAutoAsset__endAllPreviousLocksOfReason_completion___block_invoke;
    v10[3] = &unk_189FF9578;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v10);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _endAllPreviousLocksOfReason:completion:].cold.1();
    }
  }
}

void __55__MAAutoAsset__endAllPreviousLocksOfReason_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _failedEndLockUsage:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 48)];
  }

  else
  {
    uint64_t v3 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    [*(id *)(a1 + 32) autoAssetClientName];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = __maAutoAssetSharedClientProcessName;
    uint64_t v6 = __maAutoAssetSharedClientProcessID;
    [*(id *)(a1 + 32) assetSelector];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v3,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  v4,  v5,  v6,  v7,  v8);

    id v10 = -[MAAutoAssetInfoEnd initWithLockReason:endingLockCount:]( objc_alloc(&OBJC_CLASS___MAAutoAssetInfoEnd),  "initWithLockReason:endingLockCount:",  *(void *)(a1 + 40),  -1LL);
    id v11 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 UUIDString];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();

    [v11 setSafeObject:v9 forKey:@"instance"];
    [v11 setSafeObject:v10 forKey:@"end"];
    id v14 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO:END_ALL_PREVIOUS_LOCKS" clientID:v13 version:0 message:v11];
    id v15 = (void *)__maAutoAssetSharedConnectionClient;
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __55__MAAutoAsset__endAllPreviousLocksOfReason_completion___block_invoke_2;
    v16[3] = &unk_189FF94D8;
    v16[4] = *(void *)(a1 + 32);
    id v17 = *(id *)(a1 + 48);
    [v15 connectClientSendServerMessage:v14 proxyObject:0 withReply:v16];
  }

void __55__MAAutoAsset__endAllPreviousLocksOfReason_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v12 = a2;
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  if (!v12 || v5)
  {
    if (v5)
    {
      uint64_t v8 = @"failure reported by server";
      id v9 = *(void **)(a1 + 32);
      uint64_t v10 = 0LL;
      id v11 = v5;
    }

    else
    {
      uint64_t v8 = @"no response message from server";
      id v9 = *(void **)(a1 + 32);
      uint64_t v10 = 6104LL;
      id v11 = 0LL;
    }

    [v9 _failedEndLockUsage:v10 withResponseError:v11 description:v8 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [*(id *)(a1 + 32) assetSelector];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 _successEndLockUsage:v7 completion:*(void *)(a1 + 40)];
  }
}

+ (id)endAllPreviousLocksOfReasonSync:(id)a3 forAssetSelector:(id)a4
{
  return +[MAAutoAsset endAllPreviousLocksOfReasonSync:forClientName:forAssetSelector:]( &OBJC_CLASS___MAAutoAsset,  "endAllPreviousLocksOfReasonSync:forClientName:forAssetSelector:",  a3,  0LL,  a4);
}

+ (id)endAllPreviousLocksOfReasonSync:(id)a3 forClientName:(id)a4 forAssetSelector:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v13 = 0LL;
  id v10 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]( objc_alloc(&OBJC_CLASS___MAAutoAsset),  "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:",  v9,  v8,  0LL,  0LL,  &v13);

  id v11 = v13;
  if (!v11)
  {
    [v10 _endAllPreviousLocksOfReasonSync:v7];
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)_endAllPreviousLocksOfReasonSync:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0LL;
  char v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  id v24 = __Block_byref_object_copy__5;
  uint64_t v25 = __Block_byref_object_dispose__5;
  id v26 = 0LL;
  v19[0] = 0LL;
  v19[1] = v19;
  v19[2] = 0x2020000000LL;
  char v20 = 0;
  v17[0] = 0LL;
  v17[1] = v17;
  id v17[2] = 0x2020000000LL;
  char v18 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0LL);
  uint64_t v6 = MEMORY[0x1895F87A8];
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __48__MAAutoAsset__endAllPreviousLocksOfReasonSync___block_invoke;
  v12[3] = &unk_189FFAED0;
  id v14 = v17;
  id v15 = &v21;
  id v16 = v19;
  id v7 = v5;
  id v13 = v7;
  -[MAAutoAsset _endAllPreviousLocksOfReason:completion:](self, "_endAllPreviousLocksOfReason:completion:", v4, v12);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:]( &OBJC_CLASS___MAAutoAsset,  "waitOnSemaphore:withDaemonTriggeredTimeout:",  v7,  -100LL))
  {
    +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
    id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v6;
    block[1] = 3221225472LL;
    block[2] = __48__MAAutoAsset__endAllPreviousLocksOfReasonSync___block_invoke_3;
    block[3] = &unk_189FF94B0;
    void block[4] = v19;
    void block[5] = v17;
    block[6] = &v21;
    dispatch_sync(v8, block);
  }

  id v9 = (id)v22[5];

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(&v21, 8);

  return v9;
}

void __48__MAAutoAsset__endAllPreviousLocksOfReasonSync___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
  dispatch_semaphore_t v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)id v7 = *(_OWORD *)(a1 + 32);
  __int128 v11 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __48__MAAutoAsset__endAllPreviousLocksOfReasonSync___block_invoke_2;
  block[3] = &unk_189FFAEA8;
  id v9 = v4;
  id v6 = v7[0];
  __int128 v10 = *(_OWORD *)v7;
  v7[0] = v4;
  dispatch_sync(v5, block);
}

uint64_t __48__MAAutoAsset__endAllPreviousLocksOfReasonSync___block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 48) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 56) + 8LL) + 40LL), *(id *)(result + 32));
    *(_BYTE *)(*(void *)(*(void *)(v1 + 64) + 8LL) + 24LL) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 40));
  }

  return result;
}

void __48__MAAutoAsset__endAllPreviousLocksOfReasonSync___block_invoke_3(void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto(endAllPreviousLocksOfReasonSync)",  0LL,  @"timeout (at framework layer) while waiting for end-all-previous-locks to complete");
    uint64_t v3 = *(void *)(a1[6] + 8LL);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }

+ (void)endAllPreviousLocksOfSelector:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  +[MAAutoAsset defaultDispatchQueue](&OBJC_CLASS___MAAutoAsset, "defaultDispatchQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  id v10[2] = __56__MAAutoAsset_endAllPreviousLocksOfSelector_completion___block_invoke;
  v10[3] = &unk_189FF9738;
  id v11 = v5;
  id v12 = v6;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(v7, v10);
}

void __56__MAAutoAsset_endAllPreviousLocksOfSelector_completion___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

+ (void)endAllPreviousLocksOfSelector:(id)a3 forClientName:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    id v21 = 0LL;
    id v10 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]( objc_alloc(&OBJC_CLASS___MAAutoAsset),  "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:",  v8,  v7,  0LL,  0LL,  &v21);
    id v11 = v21;
    if (v11)
    {
      +[MAAutoAsset defaultDispatchQueue](&OBJC_CLASS___MAAutoAsset, "defaultDispatchQueue");
      id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __70__MAAutoAsset_endAllPreviousLocksOfSelector_forClientName_completion___block_invoke_2;
      block[3] = &unk_189FFAE08;
      id v13 = &v18;
      id v18 = v9;
      id v16 = v7;
      id v17 = v11;
      dispatch_async(v12, block);
    }

    else
    {
      v19[0] = MEMORY[0x1895F87A8];
      v19[1] = 3221225472LL;
      v19[2] = __70__MAAutoAsset_endAllPreviousLocksOfSelector_forClientName_completion___block_invoke;
      void v19[3] = &unk_189FFAE58;
      id v13 = &v20;
      id v20 = v9;
      [v10 _endAllPreviousLocksOfReason:0 completion:v19];
    }
  }

  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceSetLogDomain");
    [MEMORY[0x1896127A0] sharedLogger];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 oslog];
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset endAllPreviousLocksOfSelector:forClientName:completion:].cold.1();
    }
  }
}

uint64_t __70__MAAutoAsset_endAllPreviousLocksOfSelector_forClientName_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __70__MAAutoAsset_endAllPreviousLocksOfSelector_forClientName_completion___block_invoke_2( void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

+ (id)endAllPreviousLocksOfSelectorSync:(id)a3
{
  return +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6801LL,  @"auto(endAllPreviousLocksOfSelectorSync)",  0LL,  @"method was never implemented [marked as deprecated] use endAllPreviousLocksOfSelectorSync:forClientName: instead");
}

+ (id)endAllPreviousLocksOfSelectorSync:(id)a3 forClientName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v10 = 0LL;
  id v7 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]( objc_alloc(&OBJC_CLASS___MAAutoAsset),  "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:",  v5,  v6,  0LL,  0LL,  &v10);

  id v8 = v10;
  if (!v8)
  {
    [v7 _endAllPreviousLocksOfReasonSync:0];
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (void)cancelActivityForSelector:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v18 = 0LL;
    id v7 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]( objc_alloc(&OBJC_CLASS___MAAutoAsset),  "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:",  @"MA-auto{+cancelActivityForSelector}",  v5,  0LL,  0LL,  &v18);
    id v8 = v18;
    if (v8)
    {
      +[MAAutoAsset defaultDispatchQueue](&OBJC_CLASS___MAAutoAsset, "defaultDispatchQueue");
      id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __52__MAAutoAsset_cancelActivityForSelector_completion___block_invoke_2;
      block[3] = &unk_189FFAE08;
      id v10 = &v15;
      id v15 = v6;
      id v13 = v5;
      id v14 = v8;
      dispatch_async(v9, block);
    }

    else
    {
      v16[0] = MEMORY[0x1895F87A8];
      v16[1] = 3221225472LL;
      v16[2] = __52__MAAutoAsset_cancelActivityForSelector_completion___block_invoke;
      v16[3] = &unk_189FFAE58;
      id v10 = &v17;
      id v17 = v6;
      [v7 _cancelActivityForSelector:v16];
    }
  }

  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceSetLogDomain");
    [MEMORY[0x1896127A0] sharedLogger];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 oslog];
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset cancelActivityForSelector:completion:].cold.1();
    }
  }
}

uint64_t __52__MAAutoAsset_cancelActivityForSelector_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __52__MAAutoAsset_cancelActivityForSelector_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

- (void)_cancelActivityForSelector:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __42__MAAutoAsset__cancelActivityForSelector___block_invoke;
    v8[3] = &unk_189FFAC50;
    v8[4] = self;
    id v9 = v4;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v8);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 oslog];
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _cancelActivityForSelector:].cold.1();
    }
  }
}

void __42__MAAutoAsset__cancelActivityForSelector___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _failedCancelActivity:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 40)];
  }

  else
  {
    uint64_t v3 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    [*(id *)(a1 + 32) autoAssetClientName];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = __maAutoAssetSharedClientProcessName;
    uint64_t v6 = __maAutoAssetSharedClientProcessID;
    [*(id *)(a1 + 32) assetSelector];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v3,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  v4,  v5,  v6,  v7,  v8);

    id v10 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 UUIDString];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();

    [v10 setSafeObject:v9 forKey:@"instance"];
    id v13 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO:CANCEL_ACTIVITY_FOR_SELECTOR" clientID:v12 version:0 message:v10];
    id v14 = (void *)__maAutoAssetSharedConnectionClient;
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __42__MAAutoAsset__cancelActivityForSelector___block_invoke_2;
    v16[3] = &unk_189FF94D8;
    id v15 = *(void **)(a1 + 40);
    void v16[4] = *(void *)(a1 + 32);
    id v17 = v15;
    [v14 connectClientSendServerMessage:v13 proxyObject:0 withReply:v16];
  }

void __42__MAAutoAsset__cancelActivityForSelector___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  if (!v10 || v5)
  {
    if (v5)
    {
      id v7 = @"failure reported by server";
      uint64_t v8 = 0LL;
      id v9 = v5;
    }

    else
    {
      id v7 = @"no response message from server";
      uint64_t v8 = 6104LL;
      id v9 = 0LL;
    }

    [v6 _failedCancelActivity:v8 withResponseError:v9 description:v7 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v6 _successCancelActivity:*(void *)(a1 + 40)];
  }
}

+ (id)cancelActivityForSelectorSync:(id)a3
{
  id v3 = a3;
  id v7 = 0LL;
  id v4 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]( objc_alloc(&OBJC_CLASS___MAAutoAsset),  "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:",  @"MA-auto{+cancelActivityForSelectorSync}",  v3,  0LL,  0LL,  &v7);

  id v5 = v7;
  if (!v5)
  {
    [v4 _cancelActivityForSelectorSync];
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_cancelActivityForSelectorSync
{
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = __Block_byref_object_copy__5;
  uint64_t v23 = __Block_byref_object_dispose__5;
  id v24 = 0LL;
  v17[0] = 0LL;
  v17[1] = v17;
  id v17[2] = 0x2020000000LL;
  char v18 = 0;
  v15[0] = 0LL;
  v15[1] = v15;
  id v15[2] = 0x2020000000LL;
  char v16 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
  uint64_t v4 = MEMORY[0x1895F87A8];
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  id v10[2] = __45__MAAutoAsset__cancelActivityForSelectorSync__block_invoke;
  v10[3] = &unk_189FFAED0;
  id v12 = v15;
  id v13 = &v19;
  id v14 = v17;
  id v5 = v3;
  id v11 = v5;
  -[MAAutoAsset _cancelActivityForSelector:](self, "_cancelActivityForSelector:", v10);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:]( &OBJC_CLASS___MAAutoAsset,  "waitOnSemaphore:withDaemonTriggeredTimeout:",  v5,  -100LL))
  {
    +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
    uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v4;
    block[1] = 3221225472LL;
    block[2] = __45__MAAutoAsset__cancelActivityForSelectorSync__block_invoke_3;
    block[3] = &unk_189FF94B0;
    void block[4] = v17;
    void block[5] = v15;
    block[6] = &v19;
    dispatch_sync(v6, block);
  }

  id v7 = (id)v20[5];

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

void __45__MAAutoAsset__cancelActivityForSelectorSync__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)id v7 = *(_OWORD *)(a1 + 32);
  __int128 v11 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __45__MAAutoAsset__cancelActivityForSelectorSync__block_invoke_2;
  block[3] = &unk_189FFAEA8;
  id v9 = v4;
  id v6 = v7[0];
  __int128 v10 = *(_OWORD *)v7;
  v7[0] = v4;
  dispatch_sync(v5, block);
}

uint64_t __45__MAAutoAsset__cancelActivityForSelectorSync__block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 48) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 56) + 8LL) + 40LL), *(id *)(result + 32));
    *(_BYTE *)(*(void *)(*(void *)(v1 + 64) + 8LL) + 24LL) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 40));
  }

  return result;
}

void __45__MAAutoAsset__cancelActivityForSelectorSync__block_invoke_3(void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto(cancelActivityForSelectorSync)",  0LL,  @"timeout (at framework layer) while waiting for cancel-activity to complete");
    uint64_t v3 = *(void *)(a1[6] + 8LL);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }

+ (void)eliminateAllForSelector:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v18 = 0LL;
    id v7 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]( objc_alloc(&OBJC_CLASS___MAAutoAsset),  "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:",  @"MA-auto{+eliminateAllForSelector}",  v5,  0LL,  0LL,  &v18);
    id v8 = v18;
    if (v8)
    {
      +[MAAutoAsset defaultDispatchQueue](&OBJC_CLASS___MAAutoAsset, "defaultDispatchQueue");
      id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __50__MAAutoAsset_eliminateAllForSelector_completion___block_invoke_2;
      block[3] = &unk_189FFAE08;
      __int128 v10 = &v15;
      id v15 = v6;
      id v13 = v5;
      id v14 = v8;
      dispatch_async(v9, block);
    }

    else
    {
      v16[0] = MEMORY[0x1895F87A8];
      v16[1] = 3221225472LL;
      v16[2] = __50__MAAutoAsset_eliminateAllForSelector_completion___block_invoke;
      v16[3] = &unk_189FFAE58;
      __int128 v10 = &v17;
      id v17 = v6;
      [v7 _eliminateAllForSelector:v16];
    }
  }

  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceSetLogDomain");
    [MEMORY[0x1896127A0] sharedLogger];
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 oslog];
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset eliminateAllForSelector:completion:].cold.1();
    }
  }
}

uint64_t __50__MAAutoAsset_eliminateAllForSelector_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __50__MAAutoAsset_eliminateAllForSelector_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

- (void)_eliminateAllForSelector:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __40__MAAutoAsset__eliminateAllForSelector___block_invoke;
    v8[3] = &unk_189FFAC50;
    v8[4] = self;
    id v9 = v4;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v8);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 oslog];
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _eliminateAllForSelector:].cold.1();
    }
  }
}

void __40__MAAutoAsset__eliminateAllForSelector___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _failedEliminate:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 40)];
  }

  else
  {
    uint64_t v3 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    [*(id *)(a1 + 32) autoAssetClientName];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = __maAutoAssetSharedClientProcessName;
    uint64_t v6 = __maAutoAssetSharedClientProcessID;
    [*(id *)(a1 + 32) assetSelector];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v3,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  v4,  v5,  v6,  v7,  v8);

    id v10 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 UUIDString];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();

    [v10 setSafeObject:v9 forKey:@"instance"];
    id v13 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO:ELIMINATE_ALL_FOR_SELECTOR" clientID:v12 version:0 message:v10];
    id v14 = (void *)__maAutoAssetSharedConnectionClient;
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __40__MAAutoAsset__eliminateAllForSelector___block_invoke_2;
    v16[3] = &unk_189FF94D8;
    id v15 = *(void **)(a1 + 40);
    void v16[4] = *(void *)(a1 + 32);
    id v17 = v15;
    [v14 connectClientSendServerMessage:v13 proxyObject:0 withReply:v16];
  }

void __40__MAAutoAsset__eliminateAllForSelector___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  if (!v10 || v5)
  {
    if (v5)
    {
      id v7 = @"failure reported by server";
      uint64_t v8 = 0LL;
      id v9 = v5;
    }

    else
    {
      id v7 = @"no response message from server";
      uint64_t v8 = 6104LL;
      id v9 = 0LL;
    }

    [v6 _failedEliminate:v8 withResponseError:v9 description:v7 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v6 _successEliminate:*(void *)(a1 + 40)];
  }
}

+ (id)eliminateAllForSelectorSync:(id)a3
{
  id v3 = a3;
  id v7 = 0LL;
  id v4 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]( objc_alloc(&OBJC_CLASS___MAAutoAsset),  "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:",  @"MA-auto{+eliminateAllForSelectorSync}",  v3,  0LL,  0LL,  &v7);

  id v5 = v7;
  if (!v5)
  {
    [v4 _eliminateAllForSelectorSync];
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_eliminateAllForSelectorSync
{
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = __Block_byref_object_copy__5;
  uint64_t v23 = __Block_byref_object_dispose__5;
  id v24 = 0LL;
  v17[0] = 0LL;
  v17[1] = v17;
  id v17[2] = 0x2020000000LL;
  char v18 = 0;
  v15[0] = 0LL;
  v15[1] = v15;
  id v15[2] = 0x2020000000LL;
  char v16 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
  uint64_t v4 = MEMORY[0x1895F87A8];
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  id v10[2] = __43__MAAutoAsset__eliminateAllForSelectorSync__block_invoke;
  v10[3] = &unk_189FFAED0;
  id v12 = v15;
  id v13 = &v19;
  id v14 = v17;
  id v5 = v3;
  __int128 v11 = v5;
  -[MAAutoAsset _eliminateAllForSelector:](self, "_eliminateAllForSelector:", v10);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:]( &OBJC_CLASS___MAAutoAsset,  "waitOnSemaphore:withDaemonTriggeredTimeout:",  v5,  -100LL))
  {
    +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
    uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v4;
    block[1] = 3221225472LL;
    block[2] = __43__MAAutoAsset__eliminateAllForSelectorSync__block_invoke_3;
    block[3] = &unk_189FF94B0;
    void block[4] = v17;
    void block[5] = v15;
    block[6] = &v19;
    dispatch_sync(v6, block);
  }

  id v7 = (id)v20[5];

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

void __43__MAAutoAsset__eliminateAllForSelectorSync__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)id v7 = *(_OWORD *)(a1 + 32);
  __int128 v11 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __43__MAAutoAsset__eliminateAllForSelectorSync__block_invoke_2;
  block[3] = &unk_189FFAEA8;
  id v9 = v4;
  id v6 = v7[0];
  __int128 v10 = *(_OWORD *)v7;
  v7[0] = v4;
  dispatch_sync(v5, block);
}

uint64_t __43__MAAutoAsset__eliminateAllForSelectorSync__block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 48) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 56) + 8LL) + 40LL), *(id *)(result + 32));
    *(_BYTE *)(*(void *)(*(void *)(v1 + 64) + 8LL) + 24LL) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 40));
  }

  return result;
}

void __43__MAAutoAsset__eliminateAllForSelectorSync__block_invoke_3(void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto(eliminateAllForSelectorSync)",  0LL,  @"timeout (at framework layer) while waiting for elimination to complete");
    uint64_t v3 = *(void *)(a1[6] + 8LL);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }

+ (void)eliminateAllForAssetType:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:]( objc_alloc(&OBJC_CLASS___MAAutoAssetSelector),  "initForAssetType:withAssetSpecifier:",  v5,  @"MAAutoAsset-all-asset-specifiers");
    id v19 = 0LL;
    id v8 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]( objc_alloc(&OBJC_CLASS___MAAutoAsset),  "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:",  @"MA-auto{+eliminateAllForAssetType}",  v7,  0LL,  0LL,  &v19);
    id v9 = v19;
    if (v9)
    {
      +[MAAutoAsset defaultDispatchQueue](&OBJC_CLASS___MAAutoAsset, "defaultDispatchQueue");
      __int128 v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __51__MAAutoAsset_eliminateAllForAssetType_completion___block_invoke_2;
      block[3] = &unk_189FFAE08;
      __int128 v11 = &v16;
      id v16 = v6;
      id v14 = v7;
      id v15 = v9;
      dispatch_async(v10, block);
    }

    else
    {
      v17[0] = MEMORY[0x1895F87A8];
      v17[1] = 3221225472LL;
      id v17[2] = __51__MAAutoAsset_eliminateAllForAssetType_completion___block_invoke;
      void v17[3] = &unk_189FFAE58;
      __int128 v11 = &v18;
      id v18 = v6;
      [v8 _eliminateAllForAssetType:v17];
    }
  }

  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceSetLogDomain");
    [MEMORY[0x1896127A0] sharedLogger];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 oslog];
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v9, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset eliminateAllForAssetType:completion:].cold.1();
    }
  }
}

uint64_t __51__MAAutoAsset_eliminateAllForAssetType_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __51__MAAutoAsset_eliminateAllForAssetType_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

- (void)_eliminateAllForAssetType:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __41__MAAutoAsset__eliminateAllForAssetType___block_invoke;
    v8[3] = &unk_189FFAC50;
    v8[4] = self;
    id v9 = v4;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v8);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 oslog];
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _eliminateAllForAssetType:].cold.1();
    }
  }
}

void __41__MAAutoAsset__eliminateAllForAssetType___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _failedEliminate:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 40)];
  }

  else
  {
    uint64_t v3 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    [*(id *)(a1 + 32) autoAssetClientName];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = __maAutoAssetSharedClientProcessName;
    uint64_t v6 = __maAutoAssetSharedClientProcessID;
    [*(id *)(a1 + 32) assetSelector];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v3,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  v4,  v5,  v6,  v7,  v8);

    id v10 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 UUIDString];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();

    [v10 setSafeObject:v9 forKey:@"instance"];
    id v13 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO:ELIMINATE_ALL_FOR_ASSET_TYPE" clientID:v12 version:0 message:v10];
    id v14 = (void *)__maAutoAssetSharedConnectionClient;
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __41__MAAutoAsset__eliminateAllForAssetType___block_invoke_2;
    v16[3] = &unk_189FF94D8;
    id v15 = *(void **)(a1 + 40);
    void v16[4] = *(void *)(a1 + 32);
    id v17 = v15;
    [v14 connectClientSendServerMessage:v13 proxyObject:0 withReply:v16];
  }

void __41__MAAutoAsset__eliminateAllForAssetType___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  if (!v10 || v5)
  {
    if (v5)
    {
      id v7 = @"failure reported by server";
      uint64_t v8 = 0LL;
      id v9 = v5;
    }

    else
    {
      id v7 = @"no response message from server";
      uint64_t v8 = 6104LL;
      id v9 = 0LL;
    }

    [v6 _failedEliminate:v8 withResponseError:v9 description:v7 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v6 _successEliminate:*(void *)(a1 + 40)];
  }
}

+ (id)eliminateAllForAssetTypeSync:(id)a3
{
  id v3 = a3;
  id v4 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:]( objc_alloc(&OBJC_CLASS___MAAutoAssetSelector),  "initForAssetType:withAssetSpecifier:",  v3,  @"MAAutoAsset-all-asset-specifiers");

  id v8 = 0LL;
  id v5 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]( objc_alloc(&OBJC_CLASS___MAAutoAsset),  "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:",  @"MA-auto{+eliminateAllForAssetTypeSync}",  v4,  0LL,  0LL,  &v8);
  id v6 = v8;
  if (!v6)
  {
    [v5 _eliminateAllForAssetTypeSync];
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)_eliminateAllForAssetTypeSync
{
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = __Block_byref_object_copy__5;
  uint64_t v23 = __Block_byref_object_dispose__5;
  id v24 = 0LL;
  v17[0] = 0LL;
  v17[1] = v17;
  id v17[2] = 0x2020000000LL;
  char v18 = 0;
  v15[0] = 0LL;
  v15[1] = v15;
  id v15[2] = 0x2020000000LL;
  char v16 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
  uint64_t v4 = MEMORY[0x1895F87A8];
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  id v10[2] = __44__MAAutoAsset__eliminateAllForAssetTypeSync__block_invoke;
  v10[3] = &unk_189FFAED0;
  id v12 = v15;
  id v13 = &v19;
  id v14 = v17;
  id v5 = v3;
  __int128 v11 = v5;
  -[MAAutoAsset _eliminateAllForAssetType:](self, "_eliminateAllForAssetType:", v10);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:]( &OBJC_CLASS___MAAutoAsset,  "waitOnSemaphore:withDaemonTriggeredTimeout:",  v5,  -100LL))
  {
    +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v4;
    block[1] = 3221225472LL;
    block[2] = __44__MAAutoAsset__eliminateAllForAssetTypeSync__block_invoke_3;
    block[3] = &unk_189FF94B0;
    void block[4] = v17;
    void block[5] = v15;
    block[6] = &v19;
    dispatch_sync(v6, block);
  }

  id v7 = (id)v20[5];

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

void __44__MAAutoAsset__eliminateAllForAssetTypeSync__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)id v7 = *(_OWORD *)(a1 + 32);
  __int128 v11 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __44__MAAutoAsset__eliminateAllForAssetTypeSync__block_invoke_2;
  block[3] = &unk_189FFAEA8;
  id v9 = v4;
  id v6 = v7[0];
  __int128 v10 = *(_OWORD *)v7;
  v7[0] = v4;
  dispatch_sync(v5, block);
}

uint64_t __44__MAAutoAsset__eliminateAllForAssetTypeSync__block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 48) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 56) + 8LL) + 40LL), *(id *)(result + 32));
    *(_BYTE *)(*(void *)(*(void *)(v1 + 64) + 8LL) + 24LL) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 40));
  }

  return result;
}

void __44__MAAutoAsset__eliminateAllForAssetTypeSync__block_invoke_3(void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto(eliminateAllForAssetTypeSync)",  0LL,  @"timeout (at framework layer) while waiting for elimination to complete");
    uint64_t v3 = *(void *)(a1[6] + 8LL);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }

+ (void)eliminatePromotedNeverLockedForSelector:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v18 = 0LL;
    id v7 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]( objc_alloc(&OBJC_CLASS___MAAutoAsset),  "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:",  @"MA-auto{+eliminatePromotedNeverLockedForSelector}",  v5,  0LL,  0LL,  &v18);
    id v8 = v18;
    if (v8)
    {
      +[MAAutoAsset defaultDispatchQueue](&OBJC_CLASS___MAAutoAsset, "defaultDispatchQueue");
      id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __66__MAAutoAsset_eliminatePromotedNeverLockedForSelector_completion___block_invoke_2;
      block[3] = &unk_189FFAE08;
      __int128 v10 = &v15;
      id v15 = v6;
      id v13 = v5;
      id v14 = v8;
      dispatch_async(v9, block);
    }

    else
    {
      v16[0] = MEMORY[0x1895F87A8];
      v16[1] = 3221225472LL;
      v16[2] = __66__MAAutoAsset_eliminatePromotedNeverLockedForSelector_completion___block_invoke;
      v16[3] = &unk_189FFAE58;
      __int128 v10 = &v17;
      id v17 = v6;
      [v7 _eliminatePromotedNeverLockedForSelector:v16];
    }
  }

  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceSetLogDomain");
    [MEMORY[0x1896127A0] sharedLogger];
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 oslog];
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset eliminatePromotedNeverLockedForSelector:completion:].cold.1();
    }
  }
}

uint64_t __66__MAAutoAsset_eliminatePromotedNeverLockedForSelector_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __66__MAAutoAsset_eliminatePromotedNeverLockedForSelector_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

- (void)_eliminatePromotedNeverLockedForSelector:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __56__MAAutoAsset__eliminatePromotedNeverLockedForSelector___block_invoke;
    v8[3] = &unk_189FFAC50;
    v8[4] = self;
    id v9 = v4;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v8);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 oslog];
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _eliminatePromotedNeverLockedForSelector:].cold.1();
    }
  }
}

void __56__MAAutoAsset__eliminatePromotedNeverLockedForSelector___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _failedEliminate:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 40)];
  }

  else
  {
    uint64_t v3 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    [*(id *)(a1 + 32) autoAssetClientName];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = __maAutoAssetSharedClientProcessName;
    uint64_t v6 = __maAutoAssetSharedClientProcessID;
    [*(id *)(a1 + 32) assetSelector];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v3,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  v4,  v5,  v6,  v7,  v8);

    id v10 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 UUIDString];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();

    [v10 setSafeObject:v9 forKey:@"instance"];
    id v13 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO:ELIMINATE_PROMOTED_NEVER_LOCKED_FOR_SELECTOR" clientID:v12 version:0 message:v10];
    id v14 = (void *)__maAutoAssetSharedConnectionClient;
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __56__MAAutoAsset__eliminatePromotedNeverLockedForSelector___block_invoke_2;
    v16[3] = &unk_189FF94D8;
    id v15 = *(void **)(a1 + 40);
    void v16[4] = *(void *)(a1 + 32);
    id v17 = v15;
    [v14 connectClientSendServerMessage:v13 proxyObject:0 withReply:v16];
  }

void __56__MAAutoAsset__eliminatePromotedNeverLockedForSelector___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  if (!v10 || v5)
  {
    if (v5)
    {
      id v7 = @"failure reported by server";
      uint64_t v8 = 0LL;
      id v9 = v5;
    }

    else
    {
      id v7 = @"no response message from server";
      uint64_t v8 = 6104LL;
      id v9 = 0LL;
    }

    [v6 _failedEliminate:v8 withResponseError:v9 description:v7 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v6 _successEliminate:*(void *)(a1 + 40)];
  }
}

+ (id)eliminatePromotedNeverLockedForSelectorSync:(id)a3
{
  id v3 = a3;
  id v7 = 0LL;
  id v4 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]( objc_alloc(&OBJC_CLASS___MAAutoAsset),  "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:",  @"MA-auto{+eliminatePromotedNeverLockedForSelectorSync}",  v3,  0LL,  0LL,  &v7);

  id v5 = v7;
  if (!v5)
  {
    [v4 _eliminatePromotedNeverLockedForSelectorSync];
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)_eliminatePromotedNeverLockedForSelectorSync
{
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  char v22 = __Block_byref_object_copy__5;
  uint64_t v23 = __Block_byref_object_dispose__5;
  id v24 = 0LL;
  v17[0] = 0LL;
  v17[1] = v17;
  id v17[2] = 0x2020000000LL;
  char v18 = 0;
  v15[0] = 0LL;
  v15[1] = v15;
  id v15[2] = 0x2020000000LL;
  char v16 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
  uint64_t v4 = MEMORY[0x1895F87A8];
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  id v10[2] = __59__MAAutoAsset__eliminatePromotedNeverLockedForSelectorSync__block_invoke;
  v10[3] = &unk_189FFAED0;
  id v12 = v15;
  id v13 = &v19;
  id v14 = v17;
  id v5 = v3;
  __int128 v11 = v5;
  -[MAAutoAsset _eliminatePromotedNeverLockedForSelector:](self, "_eliminatePromotedNeverLockedForSelector:", v10);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:]( &OBJC_CLASS___MAAutoAsset,  "waitOnSemaphore:withDaemonTriggeredTimeout:",  v5,  -100LL))
  {
    +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
    uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v4;
    block[1] = 3221225472LL;
    block[2] = __59__MAAutoAsset__eliminatePromotedNeverLockedForSelectorSync__block_invoke_3;
    block[3] = &unk_189FF94B0;
    void block[4] = v17;
    void block[5] = v15;
    block[6] = &v19;
    dispatch_sync(v6, block);
  }

  id v7 = (id)v20[5];

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

void __59__MAAutoAsset__eliminatePromotedNeverLockedForSelectorSync__block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v4 = a3;
  +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)id v7 = *(_OWORD *)(a1 + 32);
  __int128 v11 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __59__MAAutoAsset__eliminatePromotedNeverLockedForSelectorSync__block_invoke_2;
  block[3] = &unk_189FFAEA8;
  id v9 = v4;
  id v6 = v7[0];
  __int128 v10 = *(_OWORD *)v7;
  v7[0] = v4;
  dispatch_sync(v5, block);
}

uint64_t __59__MAAutoAsset__eliminatePromotedNeverLockedForSelectorSync__block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 48) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 56) + 8LL) + 40LL), *(id *)(result + 32));
    *(_BYTE *)(*(void *)(*(void *)(v1 + 64) + 8LL) + 24LL) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 40));
  }

  return result;
}

void __59__MAAutoAsset__eliminatePromotedNeverLockedForSelectorSync__block_invoke_3(void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto(eliminatePromotedNeverLockedForSelectorSync)",  0LL,  @"timeout (at framework layer) while waiting for elimination to complete");
    uint64_t v3 = *(void *)(a1[6] + 8LL);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }

+ (void)stageDetermineGroupsAvailableForUpdate:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    [v5 safeObjectForKey:@"OSVersion" ofClass:objc_opt_class()];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 safeObjectForKey:@"Build" ofClass:objc_opt_class()];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 safeObjectForKey:@"TrainName" ofClass:objc_opt_class()];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 safeObjectForKey:@"RestoreVersion" ofClass:objc_opt_class()];
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 safeObjectForKey:@"GroupNames" ofClass:objc_opt_class()];
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && v8 && v11 && v9 && v10)
    {
      char v22 = v9;
      id v12 = objc_alloc(&OBJC_CLASS___MAAutoAsset);
      id v13 = (void *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"%s", getprogname());
      +[MAAutoAsset assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:]( &OBJC_CLASS___MAAutoAsset,  "assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:",  v7,  v8);
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      id v28 = 0LL;
      id v21 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]( v12,  "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:",  v13,  v14,  0LL,  0LL,  &v28);
      id v15 = v28;

      if (v15)
      {
        +[MAAutoAsset defaultDispatchQueue](&OBJC_CLASS___MAAutoAsset, "defaultDispatchQueue");
        char v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 3221225472LL;
        block[2] = __65__MAAutoAsset_stageDetermineGroupsAvailableForUpdate_completion___block_invoke_2;
        block[3] = &unk_189FF9738;
        id v17 = &v25;
        id v25 = v6;
        id v24 = v15;
        dispatch_async(v16, block);

        char v18 = v21;
        id v9 = v22;
      }

      else
      {
        v26[0] = MEMORY[0x1895F87A8];
        v26[1] = 3221225472LL;
        v26[2] = __65__MAAutoAsset_stageDetermineGroupsAvailableForUpdate_completion___block_invoke_599;
        void v26[3] = &unk_189FFAF20;
        id v17 = &v27;
        id v27 = v6;
        char v18 = v21;
        [v21 _stageDetermineGroupsAvailableForUpdate:v5 completion:v26];
        id v9 = v22;
      }
    }

    else
    {
      +[MAAutoAsset defaultDispatchQueue](&OBJC_CLASS___MAAutoAsset, "defaultDispatchQueue");
      id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1895F87A8];
      v29[1] = 3221225472LL;
      v29[2] = __65__MAAutoAsset_stageDetermineGroupsAvailableForUpdate_completion___block_invoke;
      v29[3] = &unk_189FFAEF8;
      id v30 = v7;
      id v31 = v8;
      id v32 = v9;
      id v33 = v10;
      id v34 = v11;
      id v35 = v6;
      dispatch_async(v20, v29);

      id v15 = v30;
    }
  }

  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceSetLogDomain");
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 oslog];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset stageDetermineGroupsAvailableForUpdate:completion:].cold.1();
    }
  }
}

void __65__MAAutoAsset_stageDetermineGroupsAvailableForUpdate_completion___block_invoke(void *a1)
{
  id v2 = objc_alloc(NSString);
  uint64_t v3 = @"MISSING";
  id v4 = (const __CFString *)a1[4];
  id v5 = (const __CFString *)a1[5];
  if (!v4) {
    id v4 = @"MISSING";
  }
  if (!v5) {
    id v5 = @"MISSING";
  }
  id v6 = (const __CFString *)a1[6];
  id v7 = (const __CFString *)a1[7];
  if (!v6) {
    id v6 = @"MISSING";
  }
  if (!v7) {
    id v7 = @"MISSING";
  }
  if (a1[8]) {
    uint64_t v3 = @"Y";
  }
  uint64_t v8 = (void *)[v2 initWithFormat:@"pre-SU-staging by group with missing required updateAttributes | assetTargetOSVersion:%@ | assetTargetBuildVersion:%@ | assetTrainName:%@ | assetRestoreVersion:%@ | assetGroupNames:%@", v4, v5, v6, v7, v3];
  +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6102LL,  @"auto(stageDetermineGroupsAvailableForUpdate)",  0LL,  v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x1896127A0] sharedLogger];
  __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 oslog];
  __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    __65__MAAutoAsset_stageDetermineGroupsAvailableForUpdate_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(a1[9] + 16LL))();
}

uint64_t __65__MAAutoAsset_stageDetermineGroupsAvailableForUpdate_completion___block_invoke_599(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __65__MAAutoAsset_stageDetermineGroupsAvailableForUpdate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  0LL,  *(void *)(a1 + 32));
}

- (void)_stageDetermineGroupsAvailableForUpdate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    id v10[2] = __66__MAAutoAsset__stageDetermineGroupsAvailableForUpdate_completion___block_invoke;
    v10[3] = &unk_189FF9578;
    void v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v10);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _stageDetermineGroupsAvailableForUpdate:completion:].cold.1();
    }
  }
}

void __66__MAAutoAsset__stageDetermineGroupsAvailableForUpdate_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _failedStageDetermineGroupsAvailableForUpdate:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 48)];
  }

  else
  {
    uint64_t v3 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    [*(id *)(a1 + 32) autoAssetClientName];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = __maAutoAssetSharedClientProcessName;
    uint64_t v6 = __maAutoAssetSharedClientProcessID;
    [*(id *)(a1 + 32) assetSelector];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v3,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  v4,  v5,  v6,  v7,  v8);

    __int128 v10 = -[MAAutoAssetInfoStaging initWithUpdateAttributes:withByGroupAvailableForStaging:withByGroupTotalExpectedBytes:]( objc_alloc(&OBJC_CLASS___MAAutoAssetInfoStaging),  "initWithUpdateAttributes:withByGroupAvailableForStaging:withByGroupTotalExpectedBytes:",  *(void *)(a1 + 40),  0LL,  0LL);
    id v11 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 UUIDString];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();

    [v11 setSafeObject:v9 forKey:@"instance"];
    [v11 setSafeObject:v10 forKey:@"staging"];
    id v14 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-STAGE:DETERMINE_GROUPS_AVAILABLE_FOR_UPDATE" clientID:v13 version:0 message:v11];
    id v15 = (void *)__maAutoAssetSharedConnectionClient;
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __66__MAAutoAsset__stageDetermineGroupsAvailableForUpdate_completion___block_invoke_2;
    v16[3] = &unk_189FF94D8;
    void v16[4] = *(void *)(a1 + 32);
    id v17 = *(id *)(a1 + 48);
    [v15 connectClientSendServerMessage:v14 proxyObject:0 withReply:v16];
  }

void __66__MAAutoAsset__stageDetermineGroupsAvailableForUpdate_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
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

    [*(id *)(a1 + 32) _failedStageDetermineGroupsAvailableForUpdate:v10 withResponseError:v11 description:v9 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v12 message];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 safeObjectForKey:@"staging" ofClass:objc_opt_class()];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 _successStageDetermineGroupsAvailableForUpdate:v7 completion:*(void *)(a1 + 40)];
    }
    else {
      [v8 _failedStageDetermineGroupsAvailableForUpdate:6104 withResponseError:0 description:@"no staging-information provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

+ (id)stageDetermineGroupsAvailableForUpdateSync:(id)a3 totalExpectedBytes:(id *)a4 error:(id *)a5
{
  id v6 = a3;
  [v6 safeObjectForKey:@"OSVersion" ofClass:objc_opt_class()];
  id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  [v6 safeObjectForKey:@"Build" ofClass:objc_opt_class()];
  uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v6 safeObjectForKey:@"TrainName" ofClass:objc_opt_class()];
  [v6 safeObjectForKey:@"RestoreVersion" ofClass:objc_opt_class()];
  uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v6 safeObjectForKey:@"GroupNames" ofClass:objc_opt_class()];
  id v12 = (void *)v11;
  id v29 = (void *)v9;
  if (v7 && v8 && v11)
  {
    id v28 = a4;
    id v13 = objc_alloc(&OBJC_CLASS___MAAutoAsset);
    id v14 = (void *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"%s", getprogname());
    +[MAAutoAsset assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:]( &OBJC_CLASS___MAAutoAsset,  "assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:",  v7,  v8);
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    id v32 = 0LL;
    id v16 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]( v13,  "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:",  v14,  v15,  0LL,  0LL,  &v32);
    id v17 = v32;

    if (!v17)
    {
      id v31 = 0LL;
      [v16 _stageDetermineGroupsAvailableForUpdateSync:v6 totalExpectedBytes:v28 error:&v31];
      char v18 = (void *)objc_claimAutoreleasedReturnValue();
      id v17 = v31;
      goto LABEL_24;
    }
  }

  else
  {
    id v19 = objc_alloc(NSString);
    id v20 = @"MISSING";
    if (v7) {
      id v21 = v7;
    }
    else {
      id v21 = @"MISSING";
    }
    if (v8) {
      char v22 = v8;
    }
    else {
      char v22 = @"MISSING";
    }
    if (v9) {
      uint64_t v23 = (const __CFString *)v9;
    }
    else {
      uint64_t v23 = @"MISSING";
    }
    if (v10) {
      id v24 = v10;
    }
    else {
      id v24 = @"MISSING";
    }
    if (v12) {
      id v20 = @"present";
    }
    id v16 = (id)[v19 initWithFormat:@"pre-SU-staging by group with missing required updateAttributes | assetTargetOSVersion:%@ | assetTargetBuildVersion:%@ | assetTrainName:%@ | assetRestoreVersion:%@ | assetGroupNames:%@", v21, v22, v23, v24, v20];
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6102LL,  @"auto(stageDetermineGroupsAvailableForUpdateSync)",  0LL,  v16);
    id v17 = (id)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x1896127A0] sharedLogger];
    id v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v25 oslog];
    id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset stageDetermineGroupsAvailableForUpdateSync:totalExpectedBytes:error:].cold.1();
    }
  }

  char v18 = 0LL;
LABEL_24:

  if (a5) {
    *a5 = v17;
  }

  return v18;
}

- (id)_stageDetermineGroupsAvailableForUpdateSync:(id)a3 totalExpectedBytes:(id *)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v39 = 0LL;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x3032000000LL;
  uint64_t v42 = __Block_byref_object_copy__5;
  id v43 = __Block_byref_object_dispose__5;
  id v44 = 0LL;
  uint64_t v33 = 0LL;
  id v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  uint64_t v36 = __Block_byref_object_copy__5;
  char v37 = __Block_byref_object_dispose__5;
  id v38 = 0LL;
  uint64_t v27 = 0LL;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  id v30 = __Block_byref_object_copy__5;
  id v31 = __Block_byref_object_dispose__5;
  id v32 = 0LL;
  v25[0] = 0LL;
  v25[1] = v25;
  v25[2] = 0x2020000000LL;
  char v26 = 0;
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x2020000000LL;
  char v24 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
  uint64_t v10 = MEMORY[0x1895F87A8];
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __84__MAAutoAsset__stageDetermineGroupsAvailableForUpdateSync_totalExpectedBytes_error___block_invoke;
  v16[3] = &unk_189FFAF48;
  char v18 = v23;
  id v19 = &v39;
  id v20 = &v33;
  id v21 = &v27;
  char v22 = v25;
  uint64_t v11 = v9;
  id v17 = v11;
  -[MAAutoAsset _stageDetermineGroupsAvailableForUpdate:completion:]( self,  "_stageDetermineGroupsAvailableForUpdate:completion:",  v8,  v16);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:]( &OBJC_CLASS___MAAutoAsset,  "waitOnSemaphore:withDaemonTriggeredTimeout:",  v11,  -100LL))
  {
    +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    v15[1] = 3221225472LL;
    id v15[2] = __84__MAAutoAsset__stageDetermineGroupsAvailableForUpdateSync_totalExpectedBytes_error___block_invoke_3;
    void v15[3] = &unk_189FFAF70;
    void v15[4] = v25;
    void v15[5] = v23;
    v15[6] = &v39;
    v15[7] = &v33;
    v15[8] = &v27;
    dispatch_sync(v12, v15);
  }

  if (a4) {
    *a4 = (id) v34[5];
  }
  if (a5) {
    *a5 = (id) v28[5];
  }
  id v13 = (id)v40[5];

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v39, 8);

  return v13;
}

void __84__MAAutoAsset__stageDetermineGroupsAvailableForUpdateSync_totalExpectedBytes_error___block_invoke( _OWORD *a1,  void *a2,  void *a3,  void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
  uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)id v15 = a1[2];
  __int128 v11 = a1[4];
  __int128 v21 = a1[3];
  __int128 v22 = v11;
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __84__MAAutoAsset__stageDetermineGroupsAvailableForUpdateSync_totalExpectedBytes_error___block_invoke_2;
  block[3] = &unk_189FFAC00;
  id v17 = v7;
  id v18 = v8;
  id v19 = v9;
  id v12 = v15[0];
  __int128 v20 = *(_OWORD *)v15;
  id v13 = v9;
  id v14 = v8;
  v15[0] = v7;
  dispatch_sync(v10, block);
}

uint64_t __84__MAAutoAsset__stageDetermineGroupsAvailableForUpdateSync_totalExpectedBytes_error___block_invoke_2( uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 64) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 72) + 8LL) + 40LL), *(id *)(result + 32));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 80) + 8LL) + 40LL), *(id *)(v1 + 40));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 88) + 8LL) + 40LL), *(id *)(v1 + 48));
    *(_BYTE *)(*(void *)(*(void *)(v1 + 96) + 8LL) + 24LL) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 56));
  }

  return result;
}

void __84__MAAutoAsset__stageDetermineGroupsAvailableForUpdateSync_totalExpectedBytes_error___block_invoke_3( void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = *(void *)(a1[6] + 8LL);
    uint64_t v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0LL;

    uint64_t v4 = *(void *)(a1[7] + 8LL);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0LL;

    uint64_t v6 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto(stageDetermineGroupsAvailableForUpdate)",  0LL,  @"timeout (at framework layer) while waiting for stage-determine-groups-available-for-update to complete");
    uint64_t v7 = *(void *)(a1[8] + 8LL);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }

+ (void)stageDetermineAllAvailableForUpdate:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    [v5 safeObjectForKey:@"OSVersion" ofClass:objc_opt_class()];
    uint64_t v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v5 safeObjectForKey:@"Build" ofClass:objc_opt_class()];
    if (!v7) {
      uint64_t v7 = @"STAGE_GENERAL";
    }
    if (v8) {
      id v9 = (__CFString *)v8;
    }
    else {
      id v9 = @"STAGE_GENERAL";
    }
    uint64_t v10 = objc_alloc(&OBJC_CLASS___MAAutoAsset);
    __int128 v11 = (void *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"%s", getprogname());
    +[MAAutoAsset assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:]( &OBJC_CLASS___MAAutoAsset,  "assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:",  v7,  v9);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v23 = 0LL;
    id v13 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]( v10,  "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:",  v11,  v12,  0LL,  0LL,  &v23);
    id v14 = v23;

    if (v14)
    {
      +[MAAutoAsset defaultDispatchQueue](&OBJC_CLASS___MAAutoAsset, "defaultDispatchQueue");
      id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __62__MAAutoAsset_stageDetermineAllAvailableForUpdate_completion___block_invoke_2;
      block[3] = &unk_189FF9738;
      id v16 = &v20;
      id v20 = v6;
      id v19 = v14;
      dispatch_async(v15, block);
    }

    else
    {
      v21[0] = MEMORY[0x1895F87A8];
      v21[1] = 3221225472LL;
      v21[2] = __62__MAAutoAsset_stageDetermineAllAvailableForUpdate_completion___block_invoke;
      void v21[3] = &unk_189FFAF98;
      id v16 = &v22;
      id v22 = v6;
      [v13 _stageDetermineAllAvailableForUpdate:v5 completion:v21];
    }
  }

  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceSetLogDomain");
    [MEMORY[0x1896127A0] sharedLogger];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 oslog];
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset stageDetermineAllAvailableForUpdate:completion:].cold.1();
    }
  }
}

uint64_t __62__MAAutoAsset_stageDetermineAllAvailableForUpdate_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __62__MAAutoAsset_stageDetermineAllAvailableForUpdate_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  0LL,  *(void *)(a1 + 32));
}

- (void)_stageDetermineAllAvailableForUpdate:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    id v10[2] = __63__MAAutoAsset__stageDetermineAllAvailableForUpdate_completion___block_invoke;
    v10[3] = &unk_189FF9578;
    void v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v10);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _stageDetermineAllAvailableForUpdate:completion:].cold.1();
    }
  }
}

void __63__MAAutoAsset__stageDetermineAllAvailableForUpdate_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _failedStageDetermineAllAvailable:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 48)];
  }

  else
  {
    uint64_t v3 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    [*(id *)(a1 + 32) autoAssetClientName];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = __maAutoAssetSharedClientProcessName;
    uint64_t v6 = __maAutoAssetSharedClientProcessID;
    [*(id *)(a1 + 32) assetSelector];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v3,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  v4,  v5,  v6,  v7,  v8);

    uint64_t v10 = -[MAAutoAssetInfoStaging initWithAvailableForStaging:withTotalExpectedBytes:]( objc_alloc(&OBJC_CLASS___MAAutoAssetInfoStaging),  "initWithAvailableForStaging:withTotalExpectedBytes:",  *(void *)(a1 + 40),  0LL);
    id v11 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 UUIDString];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();

    [v11 setSafeObject:v9 forKey:@"instance"];
    [v11 setSafeObject:v10 forKey:@"staging"];
    id v14 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-STAGE:DETERMINE_ALL_AVAILABLE_FOR_UPDATE" clientID:v13 version:0 message:v11];
    id v15 = (void *)__maAutoAssetSharedConnectionClient;
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __63__MAAutoAsset__stageDetermineAllAvailableForUpdate_completion___block_invoke_2;
    v16[3] = &unk_189FF94D8;
    void v16[4] = *(void *)(a1 + 32);
    id v17 = *(id *)(a1 + 48);
    [v15 connectClientSendServerMessage:v14 proxyObject:0 withReply:v16];
  }

void __63__MAAutoAsset__stageDetermineAllAvailableForUpdate_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
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

    [*(id *)(a1 + 32) _failedStageDetermineAllAvailable:v10 withResponseError:v11 description:v9 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v12 message];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 safeObjectForKey:@"staging" ofClass:objc_opt_class()];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 _successStageDetermineAllAvailable:v7 completion:*(void *)(a1 + 40)];
    }
    else {
      [v8 _failedStageDetermineAllAvailable:6104 withResponseError:0 description:@"no staging-information provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

+ (id)stageDetermineAllAvailableForUpdateSync:(id)a3 totalExpectedBytes:(unint64_t *)a4 error:(id *)a5
{
  id v7 = a3;
  [v7 safeObjectForKey:@"OSVersion" ofClass:objc_opt_class()];
  uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v7 safeObjectForKey:@"Build" ofClass:objc_opt_class()];
  if (!v8) {
    uint64_t v8 = @"TargetOSVersion";
  }
  if (v9) {
    uint64_t v10 = (__CFString *)v9;
  }
  else {
    uint64_t v10 = @"TargetBuildVersion";
  }
  id v11 = objc_alloc(&OBJC_CLASS___MAAutoAsset);
  id v12 = (void *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"%s", getprogname());
  +[MAAutoAsset assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:]( &OBJC_CLASS___MAAutoAsset,  "assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:",  v8,  v10);
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  id v19 = 0LL;
  id v14 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]( v11,  "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:",  v12,  v13,  0LL,  0LL,  &v19);
  id v15 = v19;

  if (!v15)
  {
    id v18 = 0LL;
    [v14 _stageDetermineAllAvailableForUpdateSync:v7 totalExpectedBytes:a4 error:&v18];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    id v15 = v18;
    if (!a5) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }

  id v16 = 0LL;
  if (a5) {
LABEL_8:
  }
    *a5 = v15;
LABEL_9:

  return v16;
}

- (id)_stageDetermineAllAvailableForUpdateSync:(id)a3 totalExpectedBytes:(unint64_t *)a4 error:(id *)a5
{
  id v8 = a3;
  uint64_t v37 = 0LL;
  id v38 = &v37;
  uint64_t v39 = 0x3032000000LL;
  uint64_t v40 = __Block_byref_object_copy__5;
  uint64_t v41 = __Block_byref_object_dispose__5;
  id v42 = 0LL;
  uint64_t v33 = 0LL;
  id v34 = &v33;
  uint64_t v35 = 0x2020000000LL;
  uint64_t v36 = 0LL;
  uint64_t v27 = 0LL;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  id v30 = __Block_byref_object_copy__5;
  id v31 = __Block_byref_object_dispose__5;
  id v32 = 0LL;
  v25[0] = 0LL;
  v25[1] = v25;
  v25[2] = 0x2020000000LL;
  char v26 = 0;
  v23[0] = 0LL;
  v23[1] = v23;
  v23[2] = 0x2020000000LL;
  char v24 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0LL);
  uint64_t v10 = MEMORY[0x1895F87A8];
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __81__MAAutoAsset__stageDetermineAllAvailableForUpdateSync_totalExpectedBytes_error___block_invoke;
  v16[3] = &unk_189FFAFE8;
  id v18 = v23;
  id v19 = &v37;
  id v20 = &v33;
  __int128 v21 = &v27;
  id v22 = v25;
  id v11 = v9;
  id v17 = v11;
  -[MAAutoAsset _stageDetermineAllAvailableForUpdate:completion:]( self,  "_stageDetermineAllAvailableForUpdate:completion:",  v8,  v16);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:]( &OBJC_CLASS___MAAutoAsset,  "waitOnSemaphore:withDaemonTriggeredTimeout:",  v11,  -100LL))
  {
    +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    v15[1] = 3221225472LL;
    id v15[2] = __81__MAAutoAsset__stageDetermineAllAvailableForUpdateSync_totalExpectedBytes_error___block_invoke_3;
    void v15[3] = &unk_189FFAF70;
    void v15[4] = v25;
    void v15[5] = v23;
    v15[6] = &v37;
    v15[7] = &v33;
    v15[8] = &v27;
    dispatch_sync(v12, v15);
  }

  if (a4) {
    *a4 = v34[3];
  }
  if (a5) {
    *a5 = (id) v28[5];
  }
  id v13 = (id)v38[5];

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

  return v13;
}

void __81__MAAutoAsset__stageDetermineAllAvailableForUpdateSync_totalExpectedBytes_error___block_invoke( _OWORD *a1,  void *a2,  uint64_t a3,  void *a4)
{
  id v7 = a2;
  id v8 = a4;
  +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
  dispatch_semaphore_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  __int128 v10 = a1[4];
  *(_OWORD *)id v13 = a1[2];
  __int128 v18 = a1[3];
  __int128 v19 = v10;
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __81__MAAutoAsset__stageDetermineAllAvailableForUpdateSync_totalExpectedBytes_error___block_invoke_2;
  block[3] = &unk_189FFAFC0;
  uint64_t v20 = a3;
  id v15 = v7;
  id v16 = v8;
  id v11 = v13[0];
  __int128 v17 = *(_OWORD *)v13;
  id v12 = v8;
  v13[0] = v7;
  dispatch_sync(v9, block);
}

uint64_t __81__MAAutoAsset__stageDetermineAllAvailableForUpdateSync_totalExpectedBytes_error___block_invoke_2( uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 56) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 64) + 8LL) + 40LL), *(id *)(result + 32));
    *(void *)(*(void *)(*(void *)(v1 + 72) + 8LL) + 24LL) = *(void *)(v1 + 96);
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 80) + 8LL) + 40LL), *(id *)(v1 + 40));
    *(_BYTE *)(*(void *)(*(void *)(v1 + 88) + 8LL) + 24LL) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 48));
  }

  return result;
}

void __81__MAAutoAsset__stageDetermineAllAvailableForUpdateSync_totalExpectedBytes_error___block_invoke_3( void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = *(void *)(a1[6] + 8LL);
    uint64_t v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0LL;

    *(void *)(*(void *)(a1[7] + 8LL) + 24LL) = 0LL;
    uint64_t v4 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto(stageDetermineAllAvailableForUpdate)",  0LL,  @"timeout (at framework layer) while waiting for stage-determine-all-available to complete");
    uint64_t v5 = *(void *)(a1[8] + 8LL);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }

+ (void)stageDetermineAllAvailable:(id)a3 forTargetBuildVersion:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    __int128 v10 = objc_alloc(&OBJC_CLASS___MAAutoAsset);
    id v11 = (void *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"%s", getprogname());
    +[MAAutoAsset assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:]( &OBJC_CLASS___MAAutoAsset,  "assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:",  v7,  v8);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v23 = 0LL;
    id v13 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]( v10,  "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:",  v11,  v12,  0LL,  0LL,  &v23);
    id v14 = v23;

    if (v14)
    {
      +[MAAutoAsset defaultDispatchQueue](&OBJC_CLASS___MAAutoAsset, "defaultDispatchQueue");
      id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __75__MAAutoAsset_stageDetermineAllAvailable_forTargetBuildVersion_completion___block_invoke_2;
      block[3] = &unk_189FF9738;
      id v16 = &v20;
      id v20 = v9;
      id v19 = v14;
      dispatch_async(v15, block);
    }

    else
    {
      v21[0] = MEMORY[0x1895F87A8];
      v21[1] = 3221225472LL;
      v21[2] = __75__MAAutoAsset_stageDetermineAllAvailable_forTargetBuildVersion_completion___block_invoke;
      void v21[3] = &unk_189FFAF98;
      id v16 = &v22;
      id v22 = v9;
      [v13 _stageDetermineAllAvailable:v7 forTargetBuildVersion:v8 completion:v21];
    }
  }

  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceSetLogDomain");
    [MEMORY[0x1896127A0] sharedLogger];
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 oslog];
    id v14 = (id)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset stageDetermineAllAvailable:forTargetBuildVersion:completion:].cold.1();
    }
  }
}

uint64_t __75__MAAutoAsset_stageDetermineAllAvailable_forTargetBuildVersion_completion___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __75__MAAutoAsset_stageDetermineAllAvailable_forTargetBuildVersion_completion___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  0LL,  *(void *)(a1 + 32));
}

- (void)_stageDetermineAllAvailable:(id)a3 forTargetBuildVersion:(id)a4 completion:(id)a5
{
  id v6 = a5;
  id v7 = v6;
  if (v6)
  {
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    id v10[2] = __76__MAAutoAsset__stageDetermineAllAvailable_forTargetBuildVersion_completion___block_invoke;
    v10[3] = &unk_189FFAC50;
    void v10[4] = self;
    id v11 = v6;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v10);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 oslog];
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _stageDetermineAllAvailable:forTargetBuildVersion:completion:].cold.1();
    }
  }
}

void __76__MAAutoAsset__stageDetermineAllAvailable_forTargetBuildVersion_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _failedStageDetermineAllAvailable:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 40)];
  }

  else
  {
    uint64_t v3 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    [*(id *)(a1 + 32) autoAssetClientName];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = __maAutoAssetSharedClientProcessName;
    uint64_t v6 = __maAutoAssetSharedClientProcessID;
    [*(id *)(a1 + 32) assetSelector];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v3,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  v4,  v5,  v6,  v7,  v8);

    id v10 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 UUIDString];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();

    [v10 setSafeObject:v9 forKey:@"instance"];
    id v13 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-STAGE:DETERMINE_ALL_AVAILABLE" clientID:v12 version:0 message:v10];
    id v14 = (void *)__maAutoAssetSharedConnectionClient;
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __76__MAAutoAsset__stageDetermineAllAvailable_forTargetBuildVersion_completion___block_invoke_2;
    v16[3] = &unk_189FF94D8;
    id v15 = *(void **)(a1 + 40);
    void v16[4] = *(void *)(a1 + 32);
    id v17 = v15;
    [v14 connectClientSendServerMessage:v13 proxyObject:0 withReply:v16];
  }

void __76__MAAutoAsset__stageDetermineAllAvailable_forTargetBuildVersion_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
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

    [*(id *)(a1 + 32) _failedStageDetermineAllAvailable:v10 withResponseError:v11 description:v9 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v12 message];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 safeObjectForKey:@"staging" ofClass:objc_opt_class()];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    id v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 _successStageDetermineAllAvailable:v7 completion:*(void *)(a1 + 40)];
    }
    else {
      [v8 _failedStageDetermineAllAvailable:6104 withResponseError:0 description:@"no staging-information provided by server" completion:*(void *)(a1 + 40)];
    }
  }
}

+ (id)stageDetermineAllAvailableSync:(id)a3 forTargetBuildVersion:(id)a4 totalExpectedBytes:(unint64_t *)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = objc_alloc(&OBJC_CLASS___MAAutoAsset);
  id v12 = (void *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"%s", getprogname());
  +[MAAutoAsset assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:]( &OBJC_CLASS___MAAutoAsset,  "assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:",  v9,  v10);
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  id v19 = 0LL;
  id v14 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]( v11,  "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:",  v12,  v13,  0LL,  0LL,  &v19);
  id v15 = v19;

  if (!v15)
  {
    id v18 = 0LL;
    [v14 _stageDetermineAllAvailableSync:v9 forTargetBuildVersion:v10 totalExpectedBytes:a5 error:&v18];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    id v15 = v18;
    if (!a6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  id v16 = 0LL;
  if (a6) {
LABEL_3:
  }
    *a6 = v15;
LABEL_4:

  return v16;
}

- (id)_stageDetermineAllAvailableSync:(id)a3 forTargetBuildVersion:(id)a4 totalExpectedBytes:(unint64_t *)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v41 = 0LL;
  id v42 = &v41;
  uint64_t v43 = 0x3032000000LL;
  id v44 = __Block_byref_object_copy__5;
  id v45 = __Block_byref_object_dispose__5;
  id v46 = 0LL;
  uint64_t v37 = 0LL;
  id v38 = &v37;
  uint64_t v39 = 0x2020000000LL;
  uint64_t v40 = 0LL;
  uint64_t v31 = 0LL;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000LL;
  id v34 = __Block_byref_object_copy__5;
  uint64_t v35 = __Block_byref_object_dispose__5;
  id v36 = 0LL;
  v29[0] = 0LL;
  v29[1] = v29;
  v29[2] = 0x2020000000LL;
  char v30 = 0;
  v27[0] = 0LL;
  v27[1] = v27;
  v27[2] = 0x2020000000LL;
  char v28 = 0;
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0LL);
  uint64_t v12 = MEMORY[0x1895F87A8];
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __94__MAAutoAsset__stageDetermineAllAvailableSync_forTargetBuildVersion_totalExpectedBytes_error___block_invoke;
  void v20[3] = &unk_189FFAFE8;
  id v22 = v27;
  id v23 = &v41;
  id v13 = v9;
  char v24 = &v37;
  id v25 = &v31;
  char v26 = v29;
  id v14 = v11;
  __int128 v21 = v14;
  -[MAAutoAsset _stageDetermineAllAvailable:forTargetBuildVersion:completion:]( self,  "_stageDetermineAllAvailable:forTargetBuildVersion:completion:",  v9,  v10,  v20);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:]( &OBJC_CLASS___MAAutoAsset,  "waitOnSemaphore:withDaemonTriggeredTimeout:",  v14,  -100LL))
  {
    +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
    id v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v12;
    block[1] = 3221225472LL;
    block[2] = __94__MAAutoAsset__stageDetermineAllAvailableSync_forTargetBuildVersion_totalExpectedBytes_error___block_invoke_3;
    block[3] = &unk_189FFAF70;
    void block[4] = v29;
    void block[5] = v27;
    block[6] = &v41;
    void block[7] = &v37;
    void block[8] = &v31;
    dispatch_sync(v15, block);
  }

  if (a5) {
    *a5 = v38[3];
  }
  if (a6) {
    *a6 = (id) v32[5];
  }
  id v16 = (id)v42[5];

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v29, 8);
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);

  return v16;
}

void __94__MAAutoAsset__stageDetermineAllAvailableSync_forTargetBuildVersion_totalExpectedBytes_error___block_invoke( _OWORD *a1,  void *a2,  uint64_t a3,  void *a4)
{
  id v7 = a2;
  id v8 = a4;
  +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
  id v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  __int128 v10 = a1[4];
  *(_OWORD *)id v13 = a1[2];
  __int128 v18 = a1[3];
  __int128 v19 = v10;
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __94__MAAutoAsset__stageDetermineAllAvailableSync_forTargetBuildVersion_totalExpectedBytes_error___block_invoke_2;
  block[3] = &unk_189FFAFC0;
  uint64_t v20 = a3;
  id v15 = v7;
  id v16 = v8;
  id v11 = v13[0];
  __int128 v17 = *(_OWORD *)v13;
  id v12 = v8;
  v13[0] = v7;
  dispatch_sync(v9, block);
}

uint64_t __94__MAAutoAsset__stageDetermineAllAvailableSync_forTargetBuildVersion_totalExpectedBytes_error___block_invoke_2( uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 56) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 64) + 8LL) + 40LL), *(id *)(result + 32));
    *(void *)(*(void *)(*(void *)(v1 + 72) + 8LL) + 24LL) = *(void *)(v1 + 96);
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 80) + 8LL) + 40LL), *(id *)(v1 + 40));
    *(_BYTE *)(*(void *)(*(void *)(v1 + 88) + 8LL) + 24LL) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 48));
  }

  return result;
}

void __94__MAAutoAsset__stageDetermineAllAvailableSync_forTargetBuildVersion_totalExpectedBytes_error___block_invoke_3( void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = *(void *)(a1[6] + 8LL);
    uint64_t v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0LL;

    *(void *)(*(void *)(a1[7] + 8LL) + 24LL) = 0LL;
    uint64_t v4 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto(stageDetermineAllAvailable)",  0LL,  @"timeout (at framework layer) while waiting for stage-determine-all-available to complete");
    uint64_t v5 = *(void *)(a1[8] + 8LL);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }

+ (void)stageDownloadGroups:(id)a3 awaitingAllGroups:(BOOL)a4 withStagingTimeout:(int64_t)a5 reportingProgress:(id)a6 completion:(id)a7
{
  BOOL v10 = a4;
  id v11 = a3;
  id v12 = a6;
  id v13 = a7;
  if (v13)
  {
    BOOL v32 = v10;
    int64_t v33 = a5;
    [v11 safeObjectForKey:@"OSVersion" ofClass:objc_opt_class()];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 safeObjectForKey:@"Build" ofClass:objc_opt_class()];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v16 = [v11 safeObjectForKey:@"TrainName" ofClass:objc_opt_class()];
    [v11 safeObjectForKey:@"RestoreVersion" ofClass:objc_opt_class()];
    __int128 v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 safeObjectForKey:@"GroupNames" ofClass:objc_opt_class()];
    __int128 v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 && v15 && v18 && v16 && v17)
    {
      id v30 = v12;
      uint64_t v31 = (void *)v16;
      __int128 v19 = objc_alloc(&OBJC_CLASS___MAAutoAsset);
      uint64_t v20 = (void *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"%s", getprogname());
      +[MAAutoAsset assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:]( &OBJC_CLASS___MAAutoAsset,  "assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:",  v14,  v15);
      __int128 v21 = (void *)objc_claimAutoreleasedReturnValue();
      id v39 = 0LL;
      id v29 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]( v19,  "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:",  v20,  v21,  0LL,  0LL,  &v39);
      id v22 = v39;

      if (v22)
      {
        +[MAAutoAsset defaultDispatchQueue](&OBJC_CLASS___MAAutoAsset, "defaultDispatchQueue");
        id v23 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1895F87A8];
        block[1] = 3221225472LL;
        block[2] = __101__MAAutoAsset_stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion___block_invoke_2;
        block[3] = &unk_189FF9738;
        char v24 = &v36;
        id v36 = v13;
        id v35 = v22;
        dispatch_async(v23, block);

        id v25 = v29;
        id v12 = v30;
      }

      else
      {
        v37[0] = MEMORY[0x1895F87A8];
        v37[1] = 3221225472LL;
        v37[2] = __101__MAAutoAsset_stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion___block_invoke_626;
        v37[3] = &unk_189FFAF20;
        char v24 = &v38;
        id v38 = v13;
        id v25 = v29;
        id v12 = v30;
        [v29 _stageDownloadGroups:v11 awaitingAllGroups:v32 withStagingTimeout:v33 reportingProgress:v30 completion:v37];
      }

      uint64_t v27 = v31;
    }

    else
    {
      +[MAAutoAsset defaultDispatchQueue](&OBJC_CLASS___MAAutoAsset, "defaultDispatchQueue");
      uint64_t v27 = (void *)v16;
      char v28 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      v40[0] = MEMORY[0x1895F87A8];
      v40[1] = 3221225472LL;
      v40[2] = __101__MAAutoAsset_stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion___block_invoke;
      v40[3] = &unk_189FFAEF8;
      id v41 = v14;
      id v42 = v15;
      id v43 = v27;
      id v44 = v17;
      id v45 = v18;
      id v46 = v13;
      dispatch_async(v28, v40);

      id v22 = v41;
    }
  }

  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceSetLogDomain");
    [MEMORY[0x1896127A0] sharedLogger];
    char v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v26 oslog];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset stageDownloadGroups:awaitingAllGroups:withStagingTimeout:reportingProgress:completion:].cold.1();
    }
  }
}

void __101__MAAutoAsset_stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion___block_invoke( void *a1)
{
  id v2 = objc_alloc(NSString);
  uint64_t v3 = @"MISSING";
  uint64_t v4 = (const __CFString *)a1[4];
  uint64_t v5 = (const __CFString *)a1[5];
  if (!v4) {
    uint64_t v4 = @"MISSING";
  }
  if (!v5) {
    uint64_t v5 = @"MISSING";
  }
  uint64_t v6 = (const __CFString *)a1[6];
  id v7 = (const __CFString *)a1[7];
  if (!v6) {
    uint64_t v6 = @"MISSING";
  }
  if (!v7) {
    id v7 = @"MISSING";
  }
  if (a1[8]) {
    uint64_t v3 = @"present";
  }
  id v8 = (void *)[v2 initWithFormat:@"pre-SU-staging by group with missing required updateAttributes | assetTargetOSVersion:%@ | assetTargetBuildVersion:%@ | assetTrainName:%@ | assetRestoreVersion:%@ | assetGroupNames:%@", v4, v5, v6, v7, v3];
  +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6102LL,  @"auto(stageDownloadGroups)",  0LL,  v8);
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x1896127A0] sharedLogger];
  BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 oslog];
  id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    __101__MAAutoAsset_stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(a1[9] + 16LL))();
}

uint64_t __101__MAAutoAsset_stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion___block_invoke_626( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __101__MAAutoAsset_stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion___block_invoke_2( uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  0LL,  *(void *)(a1 + 32));
}

- (void)_stageDownloadGroups:(id)a3 awaitingAllGroups:(BOOL)a4 withStagingTimeout:(int64_t)a5 reportingProgress:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  if (v14)
  {
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    id v17[2] = __102__MAAutoAsset__stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion___block_invoke;
    void v17[3] = &unk_189FFB010;
    BOOL v22 = a4;
    void v17[4] = self;
    int64_t v21 = a5;
    id v19 = v13;
    id v18 = v12;
    id v20 = v14;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v17);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 oslog];
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _stageDownloadGroups:awaitingAllGroups:withStagingTimeout:reportingProgress:completion:].cold.1();
    }
  }
}

void __102__MAAutoAsset__stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _failedStageDownloadGroups:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 56)];
  }

  else
  {
    uint64_t v3 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    [*(id *)(a1 + 32) autoAssetClientName];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = __maAutoAssetSharedClientProcessName;
    uint64_t v6 = __maAutoAssetSharedClientProcessID;
    [*(id *)(a1 + 32) assetSelector];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v3,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  v4,  v5,  v6,  v7,  v8);

    BOOL v10 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoDesire);
    if (*(_BYTE *)(a1 + 72)) {
      uint64_t v11 = -1LL;
    }
    else {
      uint64_t v11 = -2LL;
    }
    id v12 = -[MAAutoAssetInfoDesire initWithDesiredCategory:forClientAssetPolicy:reasonDesired:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:]( v10,  "initWithDesiredCategory:forClientAssetPolicy:reasonDesired:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:",  0LL,  0LL,  0LL,  v11,  *(void *)(a1 + 64),  *(void *)(a1 + 48) != 0LL);
    id v13 = -[MAAutoAssetInfoStaging initWithUpdateAttributes:withByGroupAvailableForStaging:withByGroupTotalExpectedBytes:]( objc_alloc(&OBJC_CLASS___MAAutoAssetInfoStaging),  "initWithUpdateAttributes:withByGroupAvailableForStaging:withByGroupTotalExpectedBytes:",  *(void *)(a1 + 40),  0LL,  0LL);
    id v14 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 UUIDString];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();

    [v14 setSafeObject:v9 forKey:@"instance"];
    [v14 setSafeObject:v12 forKey:@"desire"];
    [v14 setSafeObject:v13 forKey:@"staging"];
    __int128 v17 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-STAGE:DOWNLOAD_GROUPS" clientID:v16 version:0 message:v14];
    id v18 = (void *)[*(id *)(a1 + 32) _newProxyObjectForStageProgressBlock:*(void *)(a1 + 48)];
    id v19 = (void *)__maAutoAssetSharedConnectionClient;
    v22[0] = MEMORY[0x1895F87A8];
    v22[1] = 3221225472LL;
    id v22[2] = __102__MAAutoAsset__stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion___block_invoke_2;
    void v22[3] = &unk_189FFACA0;
    uint64_t v20 = *(void *)(a1 + 32);
    id v23 = v18;
    uint64_t v24 = v20;
    id v25 = *(id *)(a1 + 56);
    id v21 = v18;
    [v19 connectClientSendServerMessage:v17 proxyObject:v21 withReply:v22];
  }

void __102__MAAutoAsset__stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
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

    [*(id *)(a1 + 40) _failedStageDownloadGroups:v10 withResponseError:v11 description:v9 completion:*(void *)(a1 + 48)];
  }

  else
  {
    [v12 message];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 safeObjectForKey:@"staged" ofClass:objc_opt_class()];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    id v8 = *(void **)(a1 + 40);
    if (v7) {
      [v8 _successStageDownloadGroups:v7 completion:*(void *)(a1 + 48)];
    }
    else {
      [v8 _failedStageDownloadGroups:6104 withResponseError:0 description:@"no staged-information provided by server" completion:*(void *)(a1 + 48)];
    }
  }
}

+ (id)stageDownloadGroupsSync:(id)a3 awaitingAllGroups:(BOOL)a4 withStagingTimeout:(int64_t)a5 byGroupAssetsStaged:(id *)a6 error:(id *)a7 reportingProgress:(id)a8
{
  BOOL v37 = a4;
  id v11 = a3;
  id v12 = a8;
  [v11 safeObjectForKey:@"OSVersion" ofClass:objc_opt_class()];
  id v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  [v11 safeObjectForKey:@"Build" ofClass:objc_opt_class()];
  id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v15 = [v11 safeObjectForKey:@"TrainName" ofClass:objc_opt_class()];
  [v11 safeObjectForKey:@"RestoreVersion" ofClass:objc_opt_class()];
  uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v11 safeObjectForKey:@"GroupNames" ofClass:objc_opt_class()];
  id v18 = (void *)v17;
  id v38 = (void *)v15;
  if (v13 && v14 && v17)
  {
    int64_t v34 = a5;
    id v35 = a6;
    id v36 = v12;
    id v19 = objc_alloc(&OBJC_CLASS___MAAutoAsset);
    uint64_t v20 = (void *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"%s", getprogname());
    +[MAAutoAsset assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:]( &OBJC_CLASS___MAAutoAsset,  "assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:",  v13,  v14);
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    id v41 = 0LL;
    id v22 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]( v19,  "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:",  v20,  v21,  0LL,  0LL,  &v41);
    id v23 = v41;

    if (v23)
    {
      uint64_t v24 = 0LL;
      id v12 = v36;
    }

    else
    {
      id v40 = 0LL;
      id v12 = v36;
      [v22 _stageDownloadGroupsSync:v11 awaitingAllGroups:v37 withStagingTimeout:v34 byGroupAssetsStaged:v35 error:&v40 reportingProgress:v36];
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      id v23 = v40;
    }
  }

  else
  {
    id v25 = objc_alloc(NSString);
    char v26 = @"MISSING";
    if (v13) {
      uint64_t v27 = v13;
    }
    else {
      uint64_t v27 = @"MISSING";
    }
    if (v14) {
      char v28 = v14;
    }
    else {
      char v28 = @"MISSING";
    }
    if (v15) {
      id v29 = (const __CFString *)v15;
    }
    else {
      id v29 = @"MISSING";
    }
    if (v16) {
      id v30 = v16;
    }
    else {
      id v30 = @"MISSING";
    }
    if (v18) {
      char v26 = @"present";
    }
    id v22 = (id)[v25 initWithFormat:@"pre-SU-staging by group with missing required updateAttributes | assetTargetOSVersion:%@ | assetTargetBuildVersion:%@ | assetTrainName:%@ | assetRestoreVersion:%@ | assetGroupNames:%@", v27, v28, v29, v30, v26];
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6102LL,  @"auto(stageDownloadGroupsSync)",  0LL,  v22);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();
    [v31 oslog];
    BOOL v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset stageDownloadGroupsSync:awaitingAllGroups:withStagingTimeout:byGroupAssetsStaged:error:reportingProgress:].cold.1();
    }

    uint64_t v24 = 0LL;
  }

  if (a7) {
    *a7 = v23;
  }

  return v24;
}

- (id)_stageDownloadGroupsSync:(id)a3 awaitingAllGroups:(BOOL)a4 withStagingTimeout:(int64_t)a5 byGroupAssetsStaged:(id *)a6 error:(id *)a7 reportingProgress:(id)a8
{
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a8;
  uint64_t v45 = 0LL;
  id v46 = &v45;
  uint64_t v47 = 0x3032000000LL;
  uint64_t v48 = __Block_byref_object_copy__5;
  id v49 = __Block_byref_object_dispose__5;
  id v50 = 0LL;
  uint64_t v39 = 0LL;
  id v40 = &v39;
  uint64_t v41 = 0x3032000000LL;
  id v42 = __Block_byref_object_copy__5;
  id v43 = __Block_byref_object_dispose__5;
  id v44 = 0LL;
  uint64_t v33 = 0LL;
  int64_t v34 = &v33;
  uint64_t v35 = 0x3032000000LL;
  id v36 = __Block_byref_object_copy__5;
  BOOL v37 = __Block_byref_object_dispose__5;
  id v38 = 0LL;
  v31[0] = 0LL;
  v31[1] = v31;
  v31[2] = 0x2020000000LL;
  char v32 = 0;
  v29[0] = 0LL;
  v29[1] = v29;
  v29[2] = 0x2020000000LL;
  char v30 = 0;
  dispatch_semaphore_t v14 = dispatch_semaphore_create(0LL);
  v22[0] = MEMORY[0x1895F87A8];
  v22[1] = 3221225472LL;
  id v22[2] = __121__MAAutoAsset__stageDownloadGroupsSync_awaitingAllGroups_withStagingTimeout_byGroupAssetsStaged_error_reportingProgress___block_invoke;
  void v22[3] = &unk_189FFAF48;
  uint64_t v24 = v29;
  id v25 = &v45;
  char v26 = &v39;
  uint64_t v27 = &v33;
  char v28 = v31;
  uint64_t v15 = v14;
  id v23 = v15;
  -[MAAutoAsset _stageDownloadGroups:awaitingAllGroups:withStagingTimeout:reportingProgress:completion:]( self,  "_stageDownloadGroups:awaitingAllGroups:withStagingTimeout:reportingProgress:completion:",  v12,  v10,  a5,  v13,  v22);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:]( &OBJC_CLASS___MAAutoAsset,  "waitOnSemaphore:withDaemonTriggeredTimeout:",  v15,  a5))
  {
    +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
    uint64_t v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __121__MAAutoAsset__stageDownloadGroupsSync_awaitingAllGroups_withStagingTimeout_byGroupAssetsStaged_error_reportingProgress___block_invoke_3;
    block[3] = &unk_189FFAF70;
    void block[4] = v31;
    void block[5] = v29;
    block[6] = &v45;
    void block[7] = &v39;
    void block[8] = &v33;
    dispatch_sync(v16, block);
  }

  if (a6) {
    *a6 = (id) v40[5];
  }
  if (a7) {
    *a7 = (id) v34[5];
  }
  id v17 = (id)v46[5];

  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  return v17;
}

void __121__MAAutoAsset__stageDownloadGroupsSync_awaitingAllGroups_withStagingTimeout_byGroupAssetsStaged_error_reportingProgress___block_invoke( _OWORD *a1,  void *a2,  void *a3,  void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
  BOOL v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)uint64_t v15 = a1[2];
  __int128 v11 = a1[4];
  __int128 v21 = a1[3];
  __int128 v22 = v11;
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __121__MAAutoAsset__stageDownloadGroupsSync_awaitingAllGroups_withStagingTimeout_byGroupAssetsStaged_error_reportingProgress___block_invoke_2;
  block[3] = &unk_189FFAC00;
  id v17 = v7;
  id v18 = v8;
  id v19 = v9;
  id v12 = v15[0];
  __int128 v20 = *(_OWORD *)v15;
  id v13 = v9;
  id v14 = v8;
  v15[0] = v7;
  dispatch_sync(v10, block);
}

uint64_t __121__MAAutoAsset__stageDownloadGroupsSync_awaitingAllGroups_withStagingTimeout_byGroupAssetsStaged_error_reportingProgress___block_invoke_2( uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 64) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 72) + 8LL) + 40LL), *(id *)(result + 32));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 80) + 8LL) + 40LL), *(id *)(v1 + 40));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 88) + 8LL) + 40LL), *(id *)(v1 + 48));
    *(_BYTE *)(*(void *)(*(void *)(v1 + 96) + 8LL) + 24LL) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 56));
  }

  return result;
}

void __121__MAAutoAsset__stageDownloadGroupsSync_awaitingAllGroups_withStagingTimeout_byGroupAssetsStaged_error_reportingProgress___block_invoke_3( void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = *(void *)(a1[6] + 8LL);
    uint64_t v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0LL;

    uint64_t v4 = *(void *)(a1[7] + 8LL);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0LL;

    uint64_t v6 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto(stageDownloadGroups)",  0LL,  @"timeout (at framework layer) while waiting for stage-download-groups to complete");
    uint64_t v7 = *(void *)(a1[8] + 8LL);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }

+ (void)stageDownloadAll:(int64_t)a3 reportingProgress:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  if (v8)
  {
    id v9 = objc_alloc(&OBJC_CLASS___MAAutoAsset);
    BOOL v10 = (void *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"%s", getprogname());
    +[MAAutoAsset assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:]( &OBJC_CLASS___MAAutoAsset,  "assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:",  0LL,  0LL);
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v22 = 0LL;
    id v12 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]( v9,  "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:",  v10,  v11,  0LL,  0LL,  &v22);
    id v13 = v22;

    if (v13)
    {
      +[MAAutoAsset defaultDispatchQueue](&OBJC_CLASS___MAAutoAsset, "defaultDispatchQueue");
      id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __61__MAAutoAsset_stageDownloadAll_reportingProgress_completion___block_invoke_2;
      block[3] = &unk_189FF9738;
      uint64_t v15 = &v19;
      id v19 = v8;
      id v18 = v13;
      dispatch_async(v14, block);
    }

    else
    {
      v20[0] = MEMORY[0x1895F87A8];
      v20[1] = 3221225472LL;
      v20[2] = __61__MAAutoAsset_stageDownloadAll_reportingProgress_completion___block_invoke;
      void v20[3] = &unk_189FFB038;
      uint64_t v15 = &v21;
      id v21 = v8;
      [v12 _stageDownloadAll:a3 reportingProgress:v7 completion:v20];
    }
  }

  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceSetLogDomain");
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 oslog];
    id v13 = (id)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset stageDownloadAll:reportingProgress:completion:].cold.1();
    }
  }
}

uint64_t __61__MAAutoAsset_stageDownloadAll_reportingProgress_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __61__MAAutoAsset_stageDownloadAll_reportingProgress_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  0LL,  0LL,  *(void *)(a1 + 32));
}

- (void)_stageDownloadAll:(int64_t)a3 reportingProgress:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __62__MAAutoAsset__stageDownloadAll_reportingProgress_completion___block_invoke;
    v12[3] = &unk_189FFB060;
    void v12[4] = self;
    int64_t v15 = a3;
    id v13 = v8;
    id v14 = v9;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v12);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    BOOL v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 oslog];
    __int128 v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _stageDownloadAll:reportingProgress:completion:].cold.1();
    }
  }
}

void __62__MAAutoAsset__stageDownloadAll_reportingProgress_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _failedStageDownloadAll:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 48)];
  }

  else
  {
    uint64_t v3 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    [*(id *)(a1 + 32) autoAssetClientName];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = __maAutoAssetSharedClientProcessName;
    uint64_t v6 = __maAutoAssetSharedClientProcessID;
    [*(id *)(a1 + 32) assetSelector];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v3,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  v4,  v5,  v6,  v7,  v8);

    BOOL v10 = -[MAAutoAssetInfoDesire initWithDesiredCategory:forClientAssetPolicy:reasonDesired:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:]( objc_alloc(&OBJC_CLASS___MAAutoAssetInfoDesire),  "initWithDesiredCategory:forClientAssetPolicy:reasonDesired:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:",  0LL,  0LL,  0LL,  -2LL,  *(void *)(a1 + 56),  *(void *)(a1 + 40) != 0LL);
    id v11 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 UUIDString];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();

    [v11 setSafeObject:v9 forKey:@"instance"];
    [v11 setSafeObject:v10 forKey:@"desire"];
    id v14 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-STAGE:DOWNLOAD_ALL" clientID:v13 version:0 message:v11];
    int64_t v15 = (void *)[*(id *)(a1 + 32) _newProxyObjectForStageProgressBlock:*(void *)(a1 + 40)];
    uint64_t v16 = (void *)__maAutoAssetSharedConnectionClient;
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = __62__MAAutoAsset__stageDownloadAll_reportingProgress_completion___block_invoke_2;
    void v19[3] = &unk_189FFACA0;
    uint64_t v17 = *(void *)(a1 + 32);
    id v20 = v15;
    uint64_t v21 = v17;
    id v22 = *(id *)(a1 + 48);
    id v18 = v15;
    [v16 connectClientSendServerMessage:v14 proxyObject:v18 withReply:v19];
  }

void __62__MAAutoAsset__stageDownloadAll_reportingProgress_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
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

    [*(id *)(a1 + 40) _failedStageDownloadAll:v10 withResponseError:v11 description:v9 completion:*(void *)(a1 + 48)];
  }

  else
  {
    [v12 message];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 safeObjectForKey:@"staged" ofClass:objc_opt_class()];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    id v8 = *(void **)(a1 + 40);
    if (v7) {
      [v8 _successStageDownloadAll:v7 completion:*(void *)(a1 + 48)];
    }
    else {
      [v8 _failedStageDownloadAll:6104 withResponseError:0 description:@"no staged-information provided by server" completion:*(void *)(a1 + 48)];
    }
  }
}

+ (unint64_t)stageDownloadAllSync:(int64_t)a3 assetsSuccessfullyStaged:(int64_t *)a4 error:(id *)a5 reportingProgress:(id)a6
{
  id v9 = a6;
  uint64_t v10 = objc_alloc(&OBJC_CLASS___MAAutoAsset);
  id v11 = (void *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"%s", getprogname());
  +[MAAutoAsset assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:]( &OBJC_CLASS___MAAutoAsset,  "assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:",  0LL,  0LL);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  id v18 = 0LL;
  id v13 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]( v10,  "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:",  v11,  v12,  0LL,  0LL,  &v18);
  id v14 = v18;

  if (!v14)
  {
    id v17 = 0LL;
    unint64_t v15 = [v13 _stageDownloadAllSync:a3 assetsSuccessfullyStaged:a4 error:&v17 reportingProgress:v9];
    id v14 = v17;
    if (!a5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }

  unint64_t v15 = 0LL;
  if (a5) {
LABEL_3:
  }
    *a5 = v14;
LABEL_4:

  return v15;
}

- (unint64_t)_stageDownloadAllSync:(int64_t)a3 assetsSuccessfullyStaged:(int64_t *)a4 error:(id *)a5 reportingProgress:(id)a6
{
  id v9 = a6;
  uint64_t v40 = 0LL;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x2020000000LL;
  uint64_t v43 = 0LL;
  uint64_t v36 = 0LL;
  BOOL v37 = &v36;
  uint64_t v38 = 0x2020000000LL;
  uint64_t v39 = 0LL;
  uint64_t v30 = 0LL;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  uint64_t v33 = __Block_byref_object_copy__5;
  int64_t v34 = __Block_byref_object_dispose__5;
  id v35 = 0LL;
  v28[0] = 0LL;
  v28[1] = v28;
  v28[2] = 0x2020000000LL;
  char v29 = 0;
  v26[0] = 0LL;
  v26[1] = v26;
  v26[2] = 0x2020000000LL;
  char v27 = 0;
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0LL);
  uint64_t v11 = MEMORY[0x1895F87A8];
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = __86__MAAutoAsset__stageDownloadAllSync_assetsSuccessfullyStaged_error_reportingProgress___block_invoke;
  void v19[3] = &unk_189FFB0B0;
  uint64_t v21 = v26;
  id v22 = &v40;
  id v12 = v9;
  id v23 = &v36;
  uint64_t v24 = &v30;
  id v25 = v28;
  id v13 = v10;
  id v20 = v13;
  -[MAAutoAsset _stageDownloadAll:reportingProgress:completion:]( self,  "_stageDownloadAll:reportingProgress:completion:",  a3,  v9,  v19);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:]( &OBJC_CLASS___MAAutoAsset,  "waitOnSemaphore:withDaemonTriggeredTimeout:",  v13,  a3))
  {
    +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
    id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v11;
    block[1] = 3221225472LL;
    block[2] = __86__MAAutoAsset__stageDownloadAllSync_assetsSuccessfullyStaged_error_reportingProgress___block_invoke_3;
    block[3] = &unk_189FFAF70;
    void block[4] = v28;
    void block[5] = v26;
    block[6] = &v40;
    void block[7] = &v36;
    void block[8] = &v30;
    dispatch_sync(v14, block);
  }

  if (a4) {
    *a4 = v37[3];
  }
  if (a5) {
    *a5 = (id) v31[5];
  }
  unint64_t v15 = v41[3];

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);

  return v15;
}

void __86__MAAutoAsset__stageDownloadAllSync_assetsSuccessfullyStaged_error_reportingProgress___block_invoke( _OWORD *a1,  uint64_t a2,  uint64_t a3,  void *a4)
{
  id v7 = a4;
  +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)uint64_t v11 = a1[2];
  __int128 v9 = a1[4];
  __int128 v15 = a1[3];
  __int128 v16 = v9;
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __86__MAAutoAsset__stageDownloadAllSync_assetsSuccessfullyStaged_error_reportingProgress___block_invoke_2;
  block[3] = &unk_189FFB088;
  uint64_t v17 = a2;
  uint64_t v18 = a3;
  id v13 = v7;
  id v10 = v11[0];
  __int128 v14 = *(_OWORD *)v11;
  v11[0] = v7;
  dispatch_sync(v8, block);
}

uint64_t __86__MAAutoAsset__stageDownloadAllSync_assetsSuccessfullyStaged_error_reportingProgress___block_invoke_2( uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 48) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 96);
    *(void *)(*(void *)(*(void *)(result + 56) + 8LL) + 24LL) = *(void *)(result + 88);
    *(void *)(*(void *)(*(void *)(result + 64) + 8LL) + 24LL) = v2;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 72) + 8LL) + 40LL), *(id *)(result + 32));
    *(_BYTE *)(*(void *)(*(void *)(v1 + 80) + 8LL) + 24LL) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 40));
  }

  return result;
}

void __86__MAAutoAsset__stageDownloadAllSync_assetsSuccessfullyStaged_error_reportingProgress___block_invoke_3( void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    *(void *)(*(void *)(a1[6] + 8LL) + 24LL) = 0LL;
    *(void *)(*(void *)(a1[7] + 8LL) + 24LL) = 0LL;
    uint64_t v2 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto(stageDownloadAll)",  0LL,  @"timeout (at framework layer) while waiting for stage-download-all to complete");
    uint64_t v3 = *(void *)(a1[8] + 8LL);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }

+ (void)stageCancelOperation:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = objc_alloc(&OBJC_CLASS___MAAutoAsset);
    id v5 = (void *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"%s", getprogname());
    +[MAAutoAsset assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:]( &OBJC_CLASS___MAAutoAsset,  "assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:",  0LL,  0LL);
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v17 = 0LL;
    id v7 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]( v4,  "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:",  v5,  v6,  0LL,  0LL,  &v17);
    id v8 = v17;

    if (v8)
    {
      +[MAAutoAsset defaultDispatchQueue](&OBJC_CLASS___MAAutoAsset, "defaultDispatchQueue");
      __int128 v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __36__MAAutoAsset_stageCancelOperation___block_invoke_2;
      block[3] = &unk_189FF9738;
      id v10 = &v14;
      id v14 = v3;
      id v13 = v8;
      dispatch_async(v9, block);
    }

    else
    {
      v15[0] = MEMORY[0x1895F87A8];
      v15[1] = 3221225472LL;
      id v15[2] = __36__MAAutoAsset_stageCancelOperation___block_invoke;
      void v15[3] = &unk_189FFB0D8;
      id v10 = &v16;
      id v16 = v3;
      [v7 _stageCancelOperation:v15];
    }
  }

  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceSetLogDomain");
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 oslog];
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset stageCancelOperation:].cold.1();
    }
  }
}

uint64_t __36__MAAutoAsset_stageCancelOperation___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __36__MAAutoAsset_stageCancelOperation___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

- (void)_stageCancelOperation:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __37__MAAutoAsset__stageCancelOperation___block_invoke;
    v8[3] = &unk_189FFAC50;
    v8[4] = self;
    id v9 = v4;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v8);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 oslog];
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _stageCancelOperation:].cold.1();
    }
  }
}

void __37__MAAutoAsset__stageCancelOperation___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _failedStageCancelOperation:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 40)];
  }

  else
  {
    id v3 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    [*(id *)(a1 + 32) autoAssetClientName];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = __maAutoAssetSharedClientProcessName;
    uint64_t v6 = __maAutoAssetSharedClientProcessID;
    [*(id *)(a1 + 32) assetSelector];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v3,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  v4,  v5,  v6,  v7,  v8);

    id v10 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 UUIDString];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();

    [v10 setSafeObject:v9 forKey:@"instance"];
    id v13 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-STAGE:CANCEL_OPERATION" clientID:v12 version:0 message:v10];
    id v14 = (void *)__maAutoAssetSharedConnectionClient;
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __37__MAAutoAsset__stageCancelOperation___block_invoke_2;
    v16[3] = &unk_189FF94D8;
    __int128 v15 = *(void **)(a1 + 40);
    void v16[4] = *(void *)(a1 + 32);
    id v17 = v15;
    [v14 connectClientSendServerMessage:v13 proxyObject:0 withReply:v16];
  }

void __37__MAAutoAsset__stageCancelOperation___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  if (!v10 || v5)
  {
    if (v5)
    {
      id v7 = @"failure reported by server";
      uint64_t v8 = 0LL;
      id v9 = v5;
    }

    else
    {
      id v7 = @"no response message from server";
      uint64_t v8 = 6104LL;
      id v9 = 0LL;
    }

    [v6 _failedStageCancelOperation:v8 withResponseError:v9 description:v7 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v6 _successStageCancelOperation:*(void *)(a1 + 40)];
  }
}

+ (id)stageCancelOperationSync
{
  uint64_t v2 = objc_alloc(&OBJC_CLASS___MAAutoAsset);
  id v3 = (void *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"%s", getprogname());
  +[MAAutoAsset assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:]( &OBJC_CLASS___MAAutoAsset,  "assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:",  0LL,  0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = 0LL;
  id v5 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]( v2,  "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:",  v3,  v4,  0LL,  0LL,  &v8);
  id v6 = v8;

  if (!v6)
  {
    [v5 _stageCancelOperationSync];
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)_stageCancelOperationSync
{
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  id v22 = __Block_byref_object_copy__5;
  id v23 = __Block_byref_object_dispose__5;
  id v24 = 0LL;
  v17[0] = 0LL;
  v17[1] = v17;
  id v17[2] = 0x2020000000LL;
  char v18 = 0;
  v15[0] = 0LL;
  v15[1] = v15;
  id v15[2] = 0x2020000000LL;
  char v16 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
  uint64_t v4 = MEMORY[0x1895F87A8];
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  id v10[2] = __40__MAAutoAsset__stageCancelOperationSync__block_invoke;
  v10[3] = &unk_189FFB100;
  id v12 = v15;
  id v13 = &v19;
  id v14 = v17;
  id v5 = v3;
  uint64_t v11 = v5;
  -[MAAutoAsset _stageCancelOperation:](self, "_stageCancelOperation:", v10);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:]( &OBJC_CLASS___MAAutoAsset,  "waitOnSemaphore:withDaemonTriggeredTimeout:",  v5,  -100LL))
  {
    +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v4;
    block[1] = 3221225472LL;
    block[2] = __40__MAAutoAsset__stageCancelOperationSync__block_invoke_3;
    block[3] = &unk_189FF94B0;
    void block[4] = v17;
    void block[5] = v15;
    block[6] = &v19;
    dispatch_sync(v6, block);
  }

  id v7 = (id)v20[5];

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

void __40__MAAutoAsset__stageCancelOperationSync__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)id v6 = *(_OWORD *)(a1 + 32);
  __int128 v10 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __40__MAAutoAsset__stageCancelOperationSync__block_invoke_2;
  block[3] = &unk_189FFAEA8;
  id v8 = v3;
  id v5 = v6[0];
  __int128 v9 = *(_OWORD *)v6;
  v6[0] = v3;
  dispatch_sync(v4, block);
}

uint64_t __40__MAAutoAsset__stageCancelOperationSync__block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 48) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 56) + 8LL) + 40LL), *(id *)(result + 32));
    *(_BYTE *)(*(void *)(*(void *)(v1 + 64) + 8LL) + 24LL) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 40));
  }

  return result;
}

void __40__MAAutoAsset__stageCancelOperationSync__block_invoke_3(void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto(stageCancelOperation)",  0LL,  @"timeout (at framework layer) while waiting for stage-cancel-operation to complete");
    uint64_t v3 = *(void *)(a1[6] + 8LL);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }

+ (void)stagePurgeAll:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = objc_alloc(&OBJC_CLASS___MAAutoAsset);
    id v5 = (void *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"%s", getprogname());
    +[MAAutoAsset assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:]( &OBJC_CLASS___MAAutoAsset,  "assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:",  0LL,  0LL);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v17 = 0LL;
    id v7 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]( v4,  "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:",  v5,  v6,  0LL,  0LL,  &v17);
    id v8 = v17;

    if (v8)
    {
      +[MAAutoAsset defaultDispatchQueue](&OBJC_CLASS___MAAutoAsset, "defaultDispatchQueue");
      __int128 v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __29__MAAutoAsset_stagePurgeAll___block_invoke_2;
      block[3] = &unk_189FF9738;
      __int128 v10 = &v14;
      id v14 = v3;
      id v13 = v8;
      dispatch_async(v9, block);
    }

    else
    {
      v15[0] = MEMORY[0x1895F87A8];
      v15[1] = 3221225472LL;
      id v15[2] = __29__MAAutoAsset_stagePurgeAll___block_invoke;
      void v15[3] = &unk_189FFB0D8;
      __int128 v10 = &v16;
      id v16 = v3;
      [v7 _stagePurgeAll:v15];
    }
  }

  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceSetLogDomain");
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 oslog];
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset stagePurgeAll:].cold.1();
    }
  }
}

uint64_t __29__MAAutoAsset_stagePurgeAll___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __29__MAAutoAsset_stagePurgeAll___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

- (void)_stagePurgeAll:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __30__MAAutoAsset__stagePurgeAll___block_invoke;
    v8[3] = &unk_189FFAC50;
    v8[4] = self;
    id v9 = v4;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v8);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 oslog];
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _stagePurgeAll:].cold.1();
    }
  }
}

void __30__MAAutoAsset__stagePurgeAll___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _failedStagePurgeAll:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 40)];
  }

  else
  {
    id v3 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    [*(id *)(a1 + 32) autoAssetClientName];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = __maAutoAssetSharedClientProcessName;
    uint64_t v6 = __maAutoAssetSharedClientProcessID;
    [*(id *)(a1 + 32) assetSelector];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v3,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  v4,  v5,  v6,  v7,  v8);

    id v10 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 UUIDString];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();

    [v10 setSafeObject:v9 forKey:@"instance"];
    id v13 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-STAGE:PURGE_ALL" clientID:v12 version:0 message:v10];
    id v14 = (void *)__maAutoAssetSharedConnectionClient;
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __30__MAAutoAsset__stagePurgeAll___block_invoke_2;
    v16[3] = &unk_189FF94D8;
    __int128 v15 = *(void **)(a1 + 40);
    void v16[4] = *(void *)(a1 + 32);
    id v17 = v15;
    [v14 connectClientSendServerMessage:v13 proxyObject:0 withReply:v16];
  }

void __30__MAAutoAsset__stagePurgeAll___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  if (!v10 || v5)
  {
    if (v5)
    {
      id v7 = @"failure reported by server";
      uint64_t v8 = 0LL;
      id v9 = v5;
    }

    else
    {
      id v7 = @"no response message from server";
      uint64_t v8 = 6104LL;
      id v9 = 0LL;
    }

    [v6 _failedStagePurgeAll:v8 withResponseError:v9 description:v7 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v6 _successStagePurgeAll:*(void *)(a1 + 40)];
  }
}

+ (id)stagePurgeAllSync
{
  uint64_t v2 = objc_alloc(&OBJC_CLASS___MAAutoAsset);
  id v3 = (void *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"%s", getprogname());
  +[MAAutoAsset assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:]( &OBJC_CLASS___MAAutoAsset,  "assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:",  0LL,  0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = 0LL;
  id v5 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]( v2,  "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:",  v3,  v4,  0LL,  0LL,  &v8);
  id v6 = v8;

  if (!v6)
  {
    [v5 _stagePurgeAllSync];
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)_stagePurgeAllSync
{
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  id v22 = __Block_byref_object_copy__5;
  id v23 = __Block_byref_object_dispose__5;
  id v24 = 0LL;
  v17[0] = 0LL;
  v17[1] = v17;
  id v17[2] = 0x2020000000LL;
  char v18 = 0;
  v15[0] = 0LL;
  v15[1] = v15;
  id v15[2] = 0x2020000000LL;
  char v16 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
  uint64_t v4 = MEMORY[0x1895F87A8];
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  id v10[2] = __33__MAAutoAsset__stagePurgeAllSync__block_invoke;
  v10[3] = &unk_189FFB100;
  id v12 = v15;
  id v13 = &v19;
  id v14 = v17;
  id v5 = v3;
  uint64_t v11 = v5;
  -[MAAutoAsset _stagePurgeAll:](self, "_stagePurgeAll:", v10);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:]( &OBJC_CLASS___MAAutoAsset,  "waitOnSemaphore:withDaemonTriggeredTimeout:",  v5,  -100LL))
  {
    +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v4;
    block[1] = 3221225472LL;
    block[2] = __33__MAAutoAsset__stagePurgeAllSync__block_invoke_3;
    block[3] = &unk_189FF94B0;
    void block[4] = v17;
    void block[5] = v15;
    block[6] = &v19;
    dispatch_sync(v6, block);
  }

  id v7 = (id)v20[5];

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

void __33__MAAutoAsset__stagePurgeAllSync__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)id v6 = *(_OWORD *)(a1 + 32);
  __int128 v10 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __33__MAAutoAsset__stagePurgeAllSync__block_invoke_2;
  block[3] = &unk_189FFAEA8;
  id v8 = v3;
  id v5 = v6[0];
  __int128 v9 = *(_OWORD *)v6;
  v6[0] = v3;
  dispatch_sync(v4, block);
}

uint64_t __33__MAAutoAsset__stagePurgeAllSync__block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 48) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 56) + 8LL) + 40LL), *(id *)(result + 32));
    *(_BYTE *)(*(void *)(*(void *)(v1 + 64) + 8LL) + 24LL) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 40));
  }

  return result;
}

void __33__MAAutoAsset__stagePurgeAllSync__block_invoke_3(void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto(stagePurgeAll)",  0LL,  @"timeout (at framework layer) while waiting for stage-purge-all to complete");
    uint64_t v3 = *(void *)(a1[6] + 8LL);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }

+ (void)stageEraseAll:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = objc_alloc(&OBJC_CLASS___MAAutoAsset);
    id v5 = (void *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"%s", getprogname());
    +[MAAutoAsset assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:]( &OBJC_CLASS___MAAutoAsset,  "assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:",  0LL,  0LL);
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    id v17 = 0LL;
    id v7 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]( v4,  "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:",  v5,  v6,  0LL,  0LL,  &v17);
    id v8 = v17;

    if (v8)
    {
      +[MAAutoAsset defaultDispatchQueue](&OBJC_CLASS___MAAutoAsset, "defaultDispatchQueue");
      __int128 v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __29__MAAutoAsset_stageEraseAll___block_invoke_2;
      block[3] = &unk_189FF9738;
      __int128 v10 = &v14;
      id v14 = v3;
      id v13 = v8;
      dispatch_async(v9, block);
    }

    else
    {
      v15[0] = MEMORY[0x1895F87A8];
      v15[1] = 3221225472LL;
      id v15[2] = __29__MAAutoAsset_stageEraseAll___block_invoke;
      void v15[3] = &unk_189FFB0D8;
      __int128 v10 = &v16;
      id v16 = v3;
      [v7 _stageEraseAll:v15];
    }
  }

  else
  {
    +[MAAutoAsset frameworkInstanceSetLogDomain](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceSetLogDomain");
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 oslog];
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAsset stageEraseAll:].cold.1();
    }
  }
}

uint64_t __29__MAAutoAsset_stageEraseAll___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __29__MAAutoAsset_stageEraseAll___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32));
}

- (void)_stageEraseAll:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __30__MAAutoAsset__stageEraseAll___block_invoke;
    v8[3] = &unk_189FFAC50;
    v8[4] = self;
    id v9 = v4;
    -[MAAutoAsset connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v8);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 oslog];
    id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAsset _stageEraseAll:].cold.1();
    }
  }
}

void __30__MAAutoAsset__stageEraseAll___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _failedStageEraseAll:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 40)];
  }

  else
  {
    id v3 = objc_alloc(&OBJC_CLASS___MAAutoAssetInfoInstance);
    [*(id *)(a1 + 32) autoAssetClientName];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = __maAutoAssetSharedClientProcessName;
    uint64_t v6 = __maAutoAssetSharedClientProcessID;
    [*(id *)(a1 + 32) assetSelector];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    id v9 = -[MAAutoAssetInfoInstance initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:]( v3,  "initForClientName:withProcessName:withProcessID:usingAssetSelector:associatingFrameworkUUID:",  v4,  v5,  v6,  v7,  v8);

    id v10 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAsset frameworkInstanceUUID](&OBJC_CLASS___MAAutoAsset, "frameworkInstanceUUID");
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 UUIDString];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();

    [v10 setSafeObject:v9 forKey:@"instance"];
    id v13 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-STAGE:ERASE_ALL" clientID:v12 version:0 message:v10];
    id v14 = (void *)__maAutoAssetSharedConnectionClient;
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __30__MAAutoAsset__stageEraseAll___block_invoke_2;
    v16[3] = &unk_189FF94D8;
    __int128 v15 = *(void **)(a1 + 40);
    void v16[4] = *(void *)(a1 + 32);
    id v17 = v15;
    [v14 connectClientSendServerMessage:v13 proxyObject:0 withReply:v16];
  }

void __30__MAAutoAsset__stageEraseAll___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  if (!v8 || v5)
  {
    if (v5) {
      [v6 _failedStageEraseAll:0 withResponseError:v5 description:@"failure reported by server" completion:v7];
    }
    else {
      [v6 _failedStagePurgeAll:6104 withResponseError:0 description:@"no response message from server" completion:v7];
    }
  }

  else
  {
    [v6 _successStageEraseAll:*(void *)(a1 + 40)];
  }
}

+ (id)stageEraseAllSync
{
  uint64_t v2 = objc_alloc(&OBJC_CLASS___MAAutoAsset);
  id v3 = (void *)objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"%s", getprogname());
  +[MAAutoAsset assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:]( &OBJC_CLASS___MAAutoAsset,  "assetSelectorForAssetTargetOSVersion:forTargetBuildVersion:",  0LL,  0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  id v8 = 0LL;
  id v5 = -[MAAutoAsset initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:]( v2,  "initForClientName:selectingAsset:usingDesiredPolicyCategory:completingFromQueue:error:",  v3,  v4,  0LL,  0LL,  &v8);
  id v6 = v8;

  if (!v6)
  {
    [v5 _stageEraseAllSync];
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)_stageEraseAllSync
{
  uint64_t v19 = 0LL;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000LL;
  id v22 = __Block_byref_object_copy__5;
  id v23 = __Block_byref_object_dispose__5;
  id v24 = 0LL;
  v17[0] = 0LL;
  v17[1] = v17;
  id v17[2] = 0x2020000000LL;
  char v18 = 0;
  v15[0] = 0LL;
  v15[1] = v15;
  id v15[2] = 0x2020000000LL;
  char v16 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0LL);
  uint64_t v4 = MEMORY[0x1895F87A8];
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  id v10[2] = __33__MAAutoAsset__stageEraseAllSync__block_invoke;
  v10[3] = &unk_189FFB100;
  id v12 = v15;
  id v13 = &v19;
  id v14 = v17;
  id v5 = v3;
  uint64_t v11 = v5;
  -[MAAutoAsset _stageEraseAll:](self, "_stageEraseAll:", v10);
  if (+[MAAutoAsset waitOnSemaphore:withDaemonTriggeredTimeout:]( &OBJC_CLASS___MAAutoAsset,  "waitOnSemaphore:withDaemonTriggeredTimeout:",  v5,  -100LL))
  {
    +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
    id v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v4;
    block[1] = 3221225472LL;
    block[2] = __33__MAAutoAsset__stageEraseAllSync__block_invoke_3;
    block[3] = &unk_189FF94B0;
    void block[4] = v17;
    void block[5] = v15;
    block[6] = &v19;
    dispatch_sync(v6, block);
  }

  id v7 = (id)v20[5];

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);

  return v7;
}

void __33__MAAutoAsset__stageEraseAllSync__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  +[MAAutoAsset frameworkDispatchQueue](&OBJC_CLASS___MAAutoAsset, "frameworkDispatchQueue");
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)id v6 = *(_OWORD *)(a1 + 32);
  __int128 v10 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __33__MAAutoAsset__stageEraseAllSync__block_invoke_2;
  block[3] = &unk_189FFAEA8;
  id v8 = v3;
  id v5 = v6[0];
  __int128 v9 = *(_OWORD *)v6;
  v6[0] = v3;
  dispatch_sync(v4, block);
}

uint64_t __33__MAAutoAsset__stageEraseAllSync__block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 48) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 56) + 8LL) + 40LL), *(id *)(result + 32));
    *(_BYTE *)(*(void *)(*(void *)(v1 + 64) + 8LL) + 24LL) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 40));
  }

  return result;
}

void __33__MAAutoAsset__stageEraseAllSync__block_invoke_3(void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto(stageEraseAll)",  0LL,  @"timeout (at framework layer) while waiting for stage-erase-all to complete");
    uint64_t v3 = *(void *)(a1[6] + 8LL);
    uint64_t v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }

+ (id)assetSelectorForAssetTargetOSVersion:(id)a3 forTargetBuildVersion:(id)a4
{
  id v5 = (__CFString *)a3;
  id v6 = (__CFString *)a4;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = @"MAAutoAssetStage-target-os-version-specifier";
  }
  if (v6) {
    id v8 = v6;
  }
  else {
    id v8 = @"MAAutoAssetControl-target-build-version-version";
  }
  id v9 = -[MAAutoAssetSelector initForAssetType:withAssetSpecifier:matchingAssetVersion:]( objc_alloc(&OBJC_CLASS___MAAutoAssetSelector),  "initForAssetType:withAssetSpecifier:matchingAssetVersion:",  @"MAAutoAssetStage-target-all-asset-types",  v7,  v8);

  return v9;
}

+ (void)frameworkInstanceSetLogDomain
{
  if (frameworkInstanceSetLogDomain_frameworkLogDomainOnce_0 != -1) {
    dispatch_once(&frameworkInstanceSetLogDomain_frameworkLogDomainOnce_0, &__block_literal_global_9);
  }
}

void __44__MAAutoAsset_frameworkInstanceSetLogDomain__block_invoke()
{
  id v1 = (id)[objc_alloc(NSString) initWithFormat:@"%@.%s", @"com.apple.MAAutoClient", getprogname()];
  [MEMORY[0x189612760] sharedCore];
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 useDomain:v1];
}

+ (id)defaultDispatchQueue
{
  if (defaultDispatchQueue_defaultQueueOnce_1 != -1) {
    dispatch_once(&defaultDispatchQueue_defaultQueueOnce_1, &__block_literal_global_663);
  }
  return (id)defaultDispatchQueue_defaultQueue_1;
}

void __35__MAAutoAsset_defaultDispatchQueue__block_invoke()
{
  v0 = (const char *)[@"com.apple.MobileAsset.autoasset.client" UTF8String];
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v1 = dispatch_queue_create(v0, v3);
  uint64_t v2 = (void *)defaultDispatchQueue_defaultQueue_1;
  defaultDispatchQueue_defaultQueue_1 = (uint64_t)v1;
}

+ (id)frameworkDispatchQueue
{
  if (frameworkDispatchQueue_frameworkQueueOnce_0 != -1) {
    dispatch_once(&frameworkDispatchQueue_frameworkQueueOnce_0, &__block_literal_global_664);
  }
  return (id)frameworkDispatchQueue_frameworkQueue_0;
}

void __37__MAAutoAsset_frameworkDispatchQueue__block_invoke()
{
  v0 = (const char *)[@"com.apple.MobileAsset.autoasset.framework" UTF8String];
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v1 = dispatch_queue_create(v0, v3);
  uint64_t v2 = (void *)frameworkDispatchQueue_frameworkQueue_0;
  frameworkDispatchQueue_frameworkQueue_0 = (uint64_t)v1;
}

+ (id)frameworkInstanceUUID
{
  if (frameworkInstanceUUID_frameworkUUIDOnce_0 != -1) {
    dispatch_once(&frameworkInstanceUUID_frameworkUUIDOnce_0, &__block_literal_global_665);
  }
  return (id)frameworkInstanceUUID_frameworkUUID_0;
}

void __36__MAAutoAsset_frameworkInstanceUUID__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x189607AB8]);
  dispatch_queue_t v1 = (void *)frameworkInstanceUUID_frameworkUUID_0;
  frameworkInstanceUUID_frameworkUUID_0 = (uint64_t)v0;
}

+ (int64_t)waitOnSemaphore:(id)a3 withDaemonTriggeredTimeout:(int64_t)a4
{
  return dispatch_semaphore_wait((dispatch_semaphore_t)a3, 0xFFFFFFFFFFFFFFFFLL);
}

+ (void)logMAAutoAssetVersion
{
  if (__maAutoAssetLogVersionDispatchOnce != -1) {
    dispatch_once(&__maAutoAssetLogVersionDispatchOnce, &__block_literal_global_667);
  }
}

void __36__MAAutoAsset_logMAAutoAssetVersion__block_invoke()
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  id v0 = (void *)[objc_alloc(MEMORY[0x189607940]) initWithString:&stru_189FFC530];
  [v0 appendString:@"|TARGET_OS_MAC"];
  [v0 appendString:@"|TARGET_OS_IPHONE"];
  [v0 appendString:@"|TARGET_OS_TV"];
  if ([MEMORY[0x189612760] stringIsEqual:v0 to:&stru_189FFC530])
  {
    uint64_t v1 = [objc_alloc(MEMORY[0x189607940]) initWithString:@"(NO_TARGETS_DEFINED)"];

    id v0 = (void *)v1;
  }

  else
  {
    [v0 appendString:@"|"];
  }

  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543618;
    id v5 = @"2.1.2";
    __int16 v6 = 2114;
    id v7 = v0;
    _os_log_impl( &dword_18718F000,  v3,  OS_LOG_TYPE_DEFAULT,  "MA-auto(FRAMEWORK_VERSION:%{public}@) | build environment:%{public}@",  (uint8_t *)&v4,  0x16u);
  }
}

- (NSString)autoAssetClientName
{
  return self->_autoAssetClientName;
}

- (MAAutoAssetSelector)assetSelector
{
  return self->_assetSelector;
}

- (NSString)updateCategoryDesiredByClient
{
  return self->_updateCategoryDesiredByClient;
}

- (MAAutoAssetSelector)contentLockedSelector
{
  return self->_contentLockedSelector;
}

- (void)setContentLockedSelector:(id)a3
{
}

- (NSString)contentLockedReason
{
  return self->_contentLockedReason;
}

- (void)setContentLockedReason:(id)a3
{
}

- (NSURL)localContentURL
{
  return self->_localContentURL;
}

- (void)setLocalContentURL:(id)a3
{
}

- (NSDictionary)assetAttributes
{
  return self->_assetAttributes;
}

- (void)setAssetAttributes:(id)a3
{
}

- (OS_dispatch_queue)completionDispatchQueue
{
  return self->_completionDispatchQueue;
}

- (int)locksOfContent
{
  return self->_locksOfContent;
}

- (void)setLocksOfContent:(int)a3
{
  self->_locksOfContent = a3;
}

- (void).cxx_destruct
{
}

- (void)interestInContent:withInterestPolicy:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto{interestInContent} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)checkForNewer:withUsagePolicy:withTimeout:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto{checkForNewer} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)determineIfAvailable:withTimeout:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto{determineIfAvailable} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)currentStatus:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto{currentStatus} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)lockContent:withUsagePolicy:withTimeout:reportingProgress:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto{lockContent} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)mapLockedContent:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto{mapLockedContent} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)continueLockUsage:withUsagePolicy:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto{continueLockUsage} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)endLockUsage:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto{endLockUsage} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

void __50__MAAutoAsset_connectToServerFrameworkCompletion___block_invoke_cold_1()
{
}

void __51__MAAutoAsset__newProxyObjectForLockProgressBlock___block_invoke_cold_1()
{
}

void __51__MAAutoAsset__newProxyObjectForLockProgressBlock___block_invoke_cold_2()
{
}

void __51__MAAutoAsset__newProxyObjectForLockProgressBlock___block_invoke_cold_3()
{
}

void __52__MAAutoAsset__newProxyObjectForStageProgressBlock___block_invoke_cold_1()
{
}

void __52__MAAutoAsset__newProxyObjectForStageProgressBlock___block_invoke_cold_2()
{
}

void __52__MAAutoAsset__newProxyObjectForStageProgressBlock___block_invoke_cold_3()
{
}

- (void)_successInterestInContent:(void *)a1 completion:.cold.1(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v2,  v3,  "MA-auto{_successInterestInContent} | no client completion block | %{public}@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_5();
}

- (void)_failedInterestInContent:withResponseError:description:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1( &dword_18718F000,  v0,  v1,  "MA-auto{_failedInterestInContent} | no client completion block | %{public}@",  v2);
  OUTLINED_FUNCTION_8();
}

void __81__MAAutoAsset__failedInterestInContent_withResponseError_description_completion___block_invoke_cold_1( uint64_t a1,  uint64_t a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0( &dword_18718F000,  v3,  v4,  "MA-auto{_failedInterestInContent} | %{public}@ | error:%{public}@",  v5,  v6,  v7,  v8,  v9);

  OUTLINED_FUNCTION_6();
}

- (void)_successCheckForNewer:(void *)a1 completion:.cold.1(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v2,  v3,  "MA-auto{_successCheckForNewer} | no client completion block | %{public}@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_5();
}

- (void)_failedCheckForNewer:withResponseError:description:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1( &dword_18718F000,  v0,  v1,  "MA-auto{_failedCheckForNewer} | no client completion block | %{public}@",  v2);
  OUTLINED_FUNCTION_8();
}

void __77__MAAutoAsset__failedCheckForNewer_withResponseError_description_completion___block_invoke_cold_1( uint64_t a1,  void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0( &dword_18718F000,  v3,  v4,  "MA-auto{_failedCheckForNewer} | %{public}@ | error:%{public}@",  v5,  v6,  v7,  v8,  v9);

  OUTLINED_FUNCTION_6();
}

- (void)_successDetermineIfAvailable:(void *)a1 completion:.cold.1(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v2,  v3,  "MA-auto{_successDetermineIfAvailable} | no client completion block | %{public}@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_5();
}

- (void)_failedDetermineIfAvailable:withResponseError:description:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1( &dword_18718F000,  v0,  v1,  "MA-auto{_failedDetermineIfAvailable} | no client completion block | %{public}@",  v2);
  OUTLINED_FUNCTION_8();
}

void __84__MAAutoAsset__failedDetermineIfAvailable_withResponseError_description_completion___block_invoke_cold_1( uint64_t a1,  void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0( &dword_18718F000,  v3,  v4,  "MA-auto{_failedDetermineIfAvailable} | %{public}@ | error:%{public}@",  v5,  v6,  v7,  v8,  v9);

  OUTLINED_FUNCTION_6();
}

- (void)_successCurrentStatus:(void *)a1 completion:.cold.1(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v2,  v3,  "MA-auto{_successCurrentStatus} | no client completion block | %{public}@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_5();
}

- (void)_failedCurrentStatus:withResponseError:description:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1( &dword_18718F000,  v0,  v1,  "MA-auto{_failedCurrentStatus} | no client completion block | %{public}@",  v2);
  OUTLINED_FUNCTION_8();
}

void __77__MAAutoAsset__failedCurrentStatus_withResponseError_description_completion___block_invoke_cold_1( uint64_t a1,  uint64_t a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0( &dword_18718F000,  v3,  v4,  "MA-auto{_failedCurrentStatus} | %{public}@ | error:%{public}@",  v5,  v6,  v7,  v8,  v9);

  OUTLINED_FUNCTION_6();
}

void __96__MAAutoAsset__successLockContent_dueToDesire_sandboxExtension_sandboxExtensionPath_completion___block_invoke_cold_1( id *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v2,  v3,  "MA-auto{_successLockContent} | no client completion block | %{public}@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_5();
}

- (void)_failedLockContent:withResponseError:description:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1( &dword_18718F000,  v0,  v1,  "MA-auto{_failedLockContent} | no client completion block | %{public}@",  v2);
  OUTLINED_FUNCTION_8();
}

void __75__MAAutoAsset__failedLockContent_withResponseError_description_completion___block_invoke_cold_1( uint64_t a1,  uint64_t a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0( &dword_18718F000,  v3,  v4,  "MA-auto{_failedLockContent} | %{public}@ | error:%{public}@",  v5,  v6,  v7,  v8,  v9);

  OUTLINED_FUNCTION_6();
}

void __63__MAAutoAsset__successMapLockedContent_dueToDesire_completion___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v2,  v3,  "MA-auto{_successMapLockedContent} | no client completion block | %{public}@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_5();
}

- (void)_failedMapLockedContent:withResponseError:description:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1( &dword_18718F000,  v0,  v1,  "MA-auto{_failedMapLockedContent} | no client completion block | %{public}@",  v2);
  OUTLINED_FUNCTION_8();
}

void __80__MAAutoAsset__failedMapLockedContent_withResponseError_description_completion___block_invoke_cold_1( uint64_t a1,  uint64_t a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0( &dword_18718F000,  v3,  v4,  "MA-auto{_failedMapLockedContent} | %{public}@ | error:%{public}@",  v5,  v6,  v7,  v8,  v9);

  OUTLINED_FUNCTION_6();
}

- (void)_successContinueLockUsage:(void *)a1 completion:.cold.1(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v2,  v3,  "MA-auto{_successContinueLockUsage} | no client completion block | %{public}@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_5();
}

- (void)_failedContinueLockUsage:withResponseError:description:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1( &dword_18718F000,  v0,  v1,  "MA-auto{_failedContinueLockUsage} | no client completion block | %{public}@",  v2);
  OUTLINED_FUNCTION_8();
}

void __81__MAAutoAsset__failedContinueLockUsage_withResponseError_description_completion___block_invoke_cold_1( uint64_t a1,  uint64_t a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0( &dword_18718F000,  v3,  v4,  "MA-auto{_failedContinueLockUsage} | %{public}@ | error:%{public}@",  v5,  v6,  v7,  v8,  v9);

  OUTLINED_FUNCTION_6();
}

void __47__MAAutoAsset__successEndLockUsage_completion___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v2,  v3,  "MA-auto{_successEndLockUsage} | no client completion block | %{public}@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_5();
}

void __47__MAAutoAsset__successEndLockUsage_completion___block_invoke_cold_2( uint64_t a1,  id *a2,  os_log_s *a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 40) summary];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v6 = [*a2 locksOfContent];
  int v7 = 138543618;
  uint8_t v8 = v5;
  __int16 v9 = 1024;
  int v10 = v6;
  _os_log_error_impl( &dword_18718F000,  a3,  OS_LOG_TYPE_ERROR,  "MA-auto{_successEndLockUsage} | %{public}@ | end lock when locksOfContent=%d | cleared locksOfContent",  (uint8_t *)&v7,  0x12u);

  OUTLINED_FUNCTION_6();
}

- (void)_failedEndLockUsage:withResponseError:description:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1( &dword_18718F000,  v0,  v1,  "MA-auto{_failedEndLockUsage} | no client completion block | %{public}@",  v2);
  OUTLINED_FUNCTION_8();
}

void __76__MAAutoAsset__failedEndLockUsage_withResponseError_description_completion___block_invoke_cold_1( uint64_t a1,  uint64_t a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0( &dword_18718F000,  v3,  v4,  "MA-auto{_failedEndLockUsage} | %{public}@ | error:%{public}@",  v5,  v6,  v7,  v8,  v9);

  OUTLINED_FUNCTION_6();
}

void __38__MAAutoAsset__successCancelActivity___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 summary];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v3,  v4,  "MA-auto{_successCancelActivity} | no client completion block | %{public}@",  v5,  v6,  v7,  v8,  v9);

  OUTLINED_FUNCTION_6();
}

- (void)_failedCancelActivity:withResponseError:description:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1( &dword_18718F000,  v0,  v1,  "MA-auto{_failedCancelActivity} | no client completion block | %{public}@",  v2);
  OUTLINED_FUNCTION_8();
}

void __78__MAAutoAsset__failedCancelActivity_withResponseError_description_completion___block_invoke_cold_1( uint64_t a1,  uint64_t a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0( &dword_18718F000,  v3,  v4,  "MA-auto{_failedCancelActivity} | %{public}@ | error:%{public}@",  v5,  v6,  v7,  v8,  v9);

  OUTLINED_FUNCTION_6();
}

void __33__MAAutoAsset__successEliminate___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 summary];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v3,  v4,  "MA-auto{_successEliminate} | no client completion block | %{public}@",  v5,  v6,  v7,  v8,  v9);

  OUTLINED_FUNCTION_6();
}

- (void)_failedEliminate:withResponseError:description:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1( &dword_18718F000,  v0,  v1,  "MA-auto{_failedEliminate} | no client completion block | %{public}@",  v2);
  OUTLINED_FUNCTION_8();
}

void __73__MAAutoAsset__failedEliminate_withResponseError_description_completion___block_invoke_cold_1( uint64_t a1,  uint64_t a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0( &dword_18718F000,  v3,  v4,  "MA-auto{_failedEliminate} | %{public}@ | error:%{public}@",  v5,  v6,  v7,  v8,  v9);

  OUTLINED_FUNCTION_6();
}

- (void)_successStageDetermineGroupsAvailableForUpdate:(void *)a1 completion:.cold.1(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v2,  v3,  "MA-auto(staging-client){_successStageDetermineGroupsAvailableForUpdate} | no client completion block | staging:%{public}@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_5();
}

- (void)_failedStageDetermineGroupsAvailableForUpdate:withResponseError:description:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1( &dword_18718F000,  v0,  v1,  "MA-auto(staging-client){_failedStageDetermineGroupsAvailableForUpdate} | no client completion block | %{public}@",  v2);
  OUTLINED_FUNCTION_8();
}

void __102__MAAutoAsset__failedStageDetermineGroupsAvailableForUpdate_withResponseError_description_completion___block_invoke_cold_1( uint64_t a1,  uint64_t a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0( &dword_18718F000,  v3,  v4,  "MA-auto(staging-client){_failedStageDetermineGroupsAvailableForUpdate} | %{public}@ | error:%{public}@",  v5,  v6,  v7,  v8,  v9);

  OUTLINED_FUNCTION_6();
}

- (void)_successStageDetermineAllAvailable:(void *)a1 completion:.cold.1(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v2,  v3,  "MA-auto(staging-client){_successStageDetermineAllAvailable} | no client completion block | staging:%{public}@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_5();
}

- (void)_failedStageDetermineAllAvailable:withResponseError:description:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1( &dword_18718F000,  v0,  v1,  "MA-auto(staging-client){_failedStageDetermineAllAvailable} | no client completion block | %{public}@",  v2);
  OUTLINED_FUNCTION_8();
}

void __90__MAAutoAsset__failedStageDetermineAllAvailable_withResponseError_description_completion___block_invoke_cold_1( uint64_t a1,  uint64_t a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0( &dword_18718F000,  v3,  v4,  "MA-auto(staging-client){_failedStageDetermineAllAvailable} | %{public}@ | error:%{public}@",  v5,  v6,  v7,  v8,  v9);

  OUTLINED_FUNCTION_6();
}

- (void)_successStageDownloadGroups:(void *)a1 completion:.cold.1(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v2,  v3,  "MA-auto(staging-client){_successStageDownloadGroups} | no client completion block | staged:%{public}@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_5();
}

- (void)_failedStageDownloadGroups:withResponseError:description:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1( &dword_18718F000,  v0,  v1,  "MA-auto(staging-client){_failedStageDownloadGroups} | no client completion block | %{public}@",  v2);
  OUTLINED_FUNCTION_8();
}

void __83__MAAutoAsset__failedStageDownloadGroups_withResponseError_description_completion___block_invoke_cold_1( uint64_t a1,  uint64_t a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0( &dword_18718F000,  v3,  v4,  "MA-auto(staging-client){_failedStageDownloadGroups} | %{public}@ | error:%{public}@",  v5,  v6,  v7,  v8,  v9);

  OUTLINED_FUNCTION_6();
}

- (void)_successStageDownloadAll:(void *)a1 completion:.cold.1(void *a1)
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v2,  v3,  "MA-auto(staging-client){_successStageDownloadAll} | no client completion block | staged:%{public}@",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_5();
}

- (void)_failedStageDownloadAll:withResponseError:description:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1( &dword_18718F000,  v0,  v1,  "MA-auto(staging-client){_failedStageDownloadAll} | no client completion block | %{public}@",  v2);
  OUTLINED_FUNCTION_8();
}

void __80__MAAutoAsset__failedStageDownloadAll_withResponseError_description_completion___block_invoke_cold_1( uint64_t a1,  uint64_t a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0( &dword_18718F000,  v3,  v4,  "MA-auto(staging-client){_failedStageDownloadAll} | %{public}@ | error:%{public}@",  v5,  v6,  v7,  v8,  v9);

  OUTLINED_FUNCTION_6();
}

- (void)_successStageCancelOperation:.cold.1()
{
}

- (void)_failedStageCancelOperation:withResponseError:description:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1( &dword_18718F000,  v0,  v1,  "MA-auto(staging-client){_failedStageCancelOperation} | no client completion block | %{public}@",  v2);
  OUTLINED_FUNCTION_8();
}

void __84__MAAutoAsset__failedStageCancelOperation_withResponseError_description_completion___block_invoke_cold_1( uint64_t a1,  uint64_t a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0( &dword_18718F000,  v3,  v4,  "MA-auto(staging-client){_failedStageCancelOperation} | %{public}@ | error:%{public}@",  v5,  v6,  v7,  v8,  v9);

  OUTLINED_FUNCTION_6();
}

- (void)_successStagePurgeAll:.cold.1()
{
}

- (void)_failedStagePurgeAll:withResponseError:description:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1( &dword_18718F000,  v0,  v1,  "MA-auto(staging-client){_failedStagePurgeAll} | no client completion block | %{public}@",  v2);
  OUTLINED_FUNCTION_8();
}

void __77__MAAutoAsset__failedStagePurgeAll_withResponseError_description_completion___block_invoke_cold_1( uint64_t a1,  uint64_t a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0( &dword_18718F000,  v3,  v4,  "MA-auto(staging-client){_failedStagePurgeAll} | %{public}@ | error:%{public}@",  v5,  v6,  v7,  v8,  v9);

  OUTLINED_FUNCTION_6();
}

- (void)_successStageEraseAll:.cold.1()
{
}

- (void)_failedStageEraseAll:withResponseError:description:completion:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_1( &dword_18718F000,  v0,  v1,  "MA-auto(staging-client){_failedStageEraseEraseAll} | no client completion block | %{public}@",  v2);
  OUTLINED_FUNCTION_8();
}

void __77__MAAutoAsset__failedStageEraseAll_withResponseError_description_completion___block_invoke_cold_1( uint64_t a1,  uint64_t a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0( &dword_18718F000,  v3,  v4,  "MA-auto(staging-client){_failedStageEraseAll} | %{public}@ | error:%{public}@",  v5,  v6,  v7,  v8,  v9);

  OUTLINED_FUNCTION_6();
}

+ (void)interestInContent:forAssetSelector:withInterestPolicy:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto{+interestInContent} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

+ (void)determineIfAvailable:forAssetSelector:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto{+determineIfAvailable} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

+ (void)endPreviousLocksOfReason:forClientName:forAssetSelector:removingLockCount:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto{+endPreviousLocksOfReason} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)_endPreviousLocksOfReason:removingLockCount:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto{_endPreviousLocksOfReason} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

+ (void)endAllPreviousLocksOfReason:forClientName:forAssetSelector:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto{+endAllPreviousLocksOfReason} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)_endAllPreviousLocksOfReason:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto{_endAllPreviousLocksOfReason} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

+ (void)endAllPreviousLocksOfSelector:forClientName:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto{+endAllPreviousLocksOfSelector} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

+ (void)cancelActivityForSelector:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto{+cancelActivityForSelector} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)_cancelActivityForSelector:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto{_cancelActivityForSelector} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

+ (void)eliminateAllForSelector:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto{+eliminateAllForSelector} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)_eliminateAllForSelector:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto{_eliminateAllForSelector} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

+ (void)eliminateAllForAssetType:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto{+eliminateAllForAssetType} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)_eliminateAllForAssetType:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto{_eliminateAllForAssetType} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

+ (void)eliminatePromotedNeverLockedForSelector:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto{+eliminatePromotedNeverLockedForSelector} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)_eliminatePromotedNeverLockedForSelector:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto{_eliminatePromotedNeverLockedForSelector} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

+ (void)stageDetermineGroupsAvailableForUpdate:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto(staging-client){+stageDetermineGroupsAvailableForUpdate} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

void __65__MAAutoAsset_stageDetermineGroupsAvailableForUpdate_completion___block_invoke_cold_1()
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3_0( &dword_18718F000,  v3,  v4,  "MA-auto(staging-client){stageDetermineGroupsAvailableForUpdate} | MISSING required information | failureReason:%{pub lic}@ | returnedError:%{public}@",  v5,  v6,  v7,  v8,  2u);

  OUTLINED_FUNCTION_6();
}

- (void)_stageDetermineGroupsAvailableForUpdate:completion:.cold.1()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto(staging-client){stageDetermineGroupsAvailableForUpdate} | no staging-client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

+ (void)stageDetermineGroupsAvailableForUpdateSync:totalExpectedBytes:error:.cold.1()
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3_0( &dword_18718F000,  v3,  v4,  "MA-auto(staging-client){stageDetermineGroupsAvailableForUpdateSync} | MISSING required information | failureReason:% {public}@ | returnedError:%{public}@",  v5,  v6,  v7,  v8,  2u);

  OUTLINED_FUNCTION_6();
}

+ (void)stageDetermineAllAvailableForUpdate:completion:.cold.1()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto(staging-client){+stageDetermineAllAvailableForUpdate} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)_stageDetermineAllAvailableForUpdate:completion:.cold.1()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto(staging-client){stageDetermineAllAvailable} | no staging-client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

+ (void)stageDetermineAllAvailable:forTargetBuildVersion:completion:.cold.1()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto(staging-client){+stageDetermineAllAvailable} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)_stageDetermineAllAvailable:forTargetBuildVersion:completion:.cold.1()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto(staging-client){stageDetermineAllAvailable} | no staging-client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

+ (void)stageDownloadGroups:awaitingAllGroups:withStagingTimeout:reportingProgress:completion:.cold.1()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto(staging-client){+stageDownloadGroups} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

void __101__MAAutoAsset_stageDownloadGroups_awaitingAllGroups_withStagingTimeout_reportingProgress_completion___block_invoke_cold_1()
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3_0( &dword_18718F000,  v3,  v4,  "MA-auto(staging-client){stageDownloadGroups} | MISSING required information | failureReason:%{public}@ | returnedError:%{public}@",  v5,  v6,  v7,  v8,  2u);

  OUTLINED_FUNCTION_6();
}

- (void)_stageDownloadGroups:awaitingAllGroups:withStagingTimeout:reportingProgress:completion:.cold.1()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto(staging-client){stageDownloadGroups} | no staging-client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

+ (void)stageDownloadGroupsSync:awaitingAllGroups:withStagingTimeout:byGroupAssetsStaged:error:reportingProgress:.cold.1()
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_3_0( &dword_18718F000,  v3,  v4,  "MA-auto(staging-client){stageDownloadGroupsSync} | MISSING required information | failureReason:%{public}@ | returne dError:%{public}@",  v5,  v6,  v7,  v8,  2u);

  OUTLINED_FUNCTION_6();
}

+ (void)stageDownloadAll:reportingProgress:completion:.cold.1()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto(staging-client){+stageDownloadAll} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)_stageDownloadAll:reportingProgress:completion:.cold.1()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto(staging-client){stageDownloadAll} | no staging-client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

+ (void)stageCancelOperation:.cold.1()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto(staging-client){+stageCancelOperation} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)_stageCancelOperation:.cold.1()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto(staging-client){stageCancelOperation} | no staging-client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

+ (void)stagePurgeAll:.cold.1()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto(staging-client){+stagePurgeAll} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)_stagePurgeAll:.cold.1()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto(staging-client){stagePurgeAll} | no staging-client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

+ (void)stageEraseAll:.cold.1()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto(staging-client){+stageEraseAll} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)_stageEraseAll:.cold.1()
{
  uint64_t v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto(staging-client){stageEraseAll} | no staging-client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

@end