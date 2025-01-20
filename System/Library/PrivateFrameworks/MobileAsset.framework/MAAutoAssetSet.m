@interface MAAutoAssetSet
+ (BOOL)supportsSecureCoding;
+ (id)defaultDispatchQueue;
+ (id)eliminateAtomicSync:(id)a3 usingClientDomain:(id)a4 forAssetSetIdentifier:(id)a5;
+ (id)eliminateAtomicSync:(id)a3 usingClientDomain:(id)a4 forAssetSetIdentifier:(id)a5 awaitingUnlocked:(BOOL)a6;
+ (id)endAtomicLocksSync:(id)a3 usingClientDomain:(id)a4 forClientName:(id)a5 forAssetSetIdentifier:(id)a6 ofAtomicInstance:(id)a7 removingLockCount:(int64_t)a8;
+ (id)frameworkDispatchQueue;
+ (id)frameworkInstanceUUID;
+ (int64_t)waitOnSemaphore:(id)a3 withDaemonTriggeredTimeout:(int64_t)a4;
+ (void)eliminateAtomic:(id)a3 usingClientDomain:(id)a4 forAssetSetIdentifier:(id)a5 awaitingUnlocked:(BOOL)a6 completion:(id)a7;
+ (void)eliminateAtomic:(id)a3 usingClientDomain:(id)a4 forAssetSetIdentifier:(id)a5 completion:(id)a6;
+ (void)endAtomicLocks:(id)a3 usingClientDomain:(id)a4 forClientName:(id)a5 forAssetSetIdentifier:(id)a6 ofAtomicInstance:(id)a7 removingLockCount:(int64_t)a8 completion:(id)a9;
+ (void)frameworkInstanceSetLogDomain;
- (BOOL)shortTermLocker;
- (MAAutoAssetSet)initWithCoder:(id)a3;
- (NSArray)autoAssetEntries;
- (NSString)assetSetIdentifier;
- (NSString)autoAssetSetClientName;
- (NSString)clientDomainName;
- (NSString)updateCategoryDesiredByClient;
- (OS_dispatch_queue)completionDispatchQueue;
- (id)_eliminateAtomicSync:(id)a3 awaitingUnlocked:(BOOL)a4;
- (id)_endAtomicLocksSync:(id)a3 usingClientDomain:(id)a4 forClientName:(id)a5 forAssetSetIdentifier:(id)a6 ofAtomicInstance:(id)a7 removingLockCount:(int64_t)a8;
- (id)_newProxyObjectForSetProgressBlock:(id)a3;
- (id)_readLockedSetStatusFromSharedLockFile:(id)a3 error:(id *)a4;
- (id)_shortTermCurrentSetStatusSync:(id *)a3;
- (id)_shortTermEndAtomicLockSync:(id)a3 ofAtomicInstance:(id)a4;
- (id)_shortTermLockAtomicSync:(id)a3 forAtomicInstance:(id)a4 error:(id *)a5;
- (id)_shortTermLockAtomicSync:(id)a3 forAtomicInstance:(id)a4 performContentValidation:(BOOL)a5 error:(id *)a6;
- (id)_shortTermLockForAtomicInstance:(id)a3 locking:(BOOL)a4 withLockedFileDescriptor:(int)a5 forLockReason:(id)a6 justCreated:(BOOL *)a7 providingLockedSetStatus:(id *)a8 error:(id *)a9;
- (id)_shortTermLockForAtomicInstance:(id)a3 locking:(BOOL)a4 withLockedFileDescriptor:(int)a5 forLockReason:(id)a6 justCreated:(BOOL *)a7 providingLockedSetStatus:(id *)a8 shouldVerifyContent:(BOOL)a9 error:(id *)a10;
- (id)alterEntriesRepresentingAtomicSync:(id)a3 toBeComprisedOfEntries:(id)a4;
- (id)alterEntriesRepresentingAtomicSync:(id)a3 toBeComprisedOfEntries:(id)a4 withNeedPolicy:(id)a5;
- (id)assetSetForStagingSync:(id)a3 asEntriesWhenTargeting:(id)a4;
- (id)checkAtomicSync:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withNeedPolicy:(id)a6 withTimeout:(int64_t)a7 discoveredAtomicEntries:(id *)a8 error:(id *)a9;
- (id)checkAtomicSync:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withNeedPolicy:(id)a6 withTimeout:(int64_t)a7 discoveredAtomicEntries:(id *)a8 error:(id *)a9 reportingProgress:(id)a10;
- (id)checkAtomicSync:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withTimeout:(int64_t)a6 discoveredAtomicEntries:(id *)a7 error:(id *)a8;
- (id)checkAtomicSync:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withTimeout:(int64_t)a6 discoveredAtomicEntries:(id *)a7 error:(id *)a8 reportingProgress:(id)a9;
- (id)checkAtomicSync:(id)a3 forAtomicInstance:(id)a4 withNeedPolicy:(id)a5 withTimeout:(int64_t)a6 discoveredAtomicEntries:(id *)a7 error:(id *)a8;
- (id)checkAtomicSync:(id)a3 forAtomicInstance:(id)a4 withTimeout:(int64_t)a5 discoveredAtomicEntries:(id *)a6 error:(id *)a7;
- (id)continueAtomicLockSync:(id)a3 ofAtomicInstance:(id)a4;
- (id)continueAtomicLockSync:(id)a3 ofAtomicInstance:(id)a4 withNeedPolicy:(id)a5;
- (id)currentSetStatusSync:(id *)a3;
- (id)endAtomicLockSync:(id)a3 ofAtomicInstance:(id)a4;
- (id)formSubAtomicInstanceSync:(id)a3 fromAtomicInstance:(id)a4 toBeComprisedOfEntries:(id)a5 error:(id *)a6;
- (id)initLockerUsingClientDomain:(id)a3 forAssetSetIdentifier:(id)a4 error:(id *)a5;
- (id)initLockerUsingClientDomain:(id)a3 forAssetSetIdentifier:(id)a4 usingDesiredPolicyCategory:(id)a5 completingFromQueue:(id)a6 error:(id *)a7;
- (id)initUsingClientDomain:(id)a3 forClientName:(id)a4 forAssetSetIdentifier:(id)a5 asShortTermLocker:(BOOL)a6 comprisedOfEntries:(id)a7 usingDesiredPolicyCategory:(id)a8 completingFromQueue:(id)a9 error:(id *)a10;
- (id)initUsingClientDomain:(id)a3 forClientName:(id)a4 forAssetSetIdentifier:(id)a5 comprisedOfEntries:(id)a6 completingFromQueue:(id)a7 error:(id *)a8;
- (id)initUsingClientDomain:(id)a3 forClientName:(id)a4 forAssetSetIdentifier:(id)a5 comprisedOfEntries:(id)a6 error:(id *)a7;
- (id)initUsingClientDomain:(id)a3 forClientName:(id)a4 forAssetSetIdentifier:(id)a5 comprisedOfEntries:(id)a6 usingDesiredPolicyCategory:(id)a7 completingFromQueue:(id)a8 error:(id *)a9;
- (id)initUsingClientDomain:(id)a3 forClientName:(id)a4 forAssetSetIdentifier:(id)a5 comprisedOfEntries:(id)a6 usingDesiredPolicyCategory:(id)a7 error:(id *)a8;
- (id)lockAtomicSync:(id)a3 forAtomicInstance:(id)a4 error:(id *)a5;
- (id)lockAtomicSync:(id)a3 forAtomicInstance:(id)a4 withNeedPolicy:(id)a5 withTimeout:(int64_t)a6 lockedAtomicEntries:(id *)a7 error:(id *)a8;
- (id)lockAtomicSync:(id)a3 forAtomicInstance:(id)a4 withNeedPolicy:(id)a5 withTimeout:(int64_t)a6 lockedAtomicEntries:(id *)a7 error:(id *)a8 reportingProgress:(id)a9;
- (id)lockAtomicSync:(id)a3 forAtomicInstance:(id)a4 withTimeout:(int64_t)a5 lockedAtomicEntries:(id *)a6 error:(id *)a7;
- (id)lockAtomicSync:(id)a3 forAtomicInstance:(id)a4 withTimeout:(int64_t)a5 lockedAtomicEntries:(id *)a6 error:(id *)a7 reportingProgress:(id)a8;
- (id)lockAtomicSyncWithContentValidationOption:(id)a3 forAtomicInstance:(id)a4 performContentValidation:(BOOL)a5 error:(id *)a6;
- (id)mapLockedAtomicEntrySync:(id)a3 forAtomicInstance:(id)a4 mappingSelector:(id)a5 mappedSelector:(id *)a6;
- (id)needForAtomicSync:(id)a3;
- (id)needForAtomicSync:(id)a3 withNeedPolicy:(id)a4;
- (id)summary;
- (int)_shortTermOpenSharedLockFile:(id)a3 lockingAtomicInstance:(id)a4 forLockReason:(id)a5 verifyingLocalContentURLs:(BOOL)a6 openingFilename:(id)a7 providingLockedSetStatus:(id *)a8 sharedLockError:(id *)a9;
- (void)_closeAndRemoveShortTermLock:(id)a3 forShortTermLock:(id)a4;
- (void)_eliminateAtomic:(id)a3 awaitingUnlocked:(BOOL)a4 completion:(id)a5;
- (void)_endAtomicLocks:(id)a3 usingClientDomain:(id)a4 forClientName:(id)a5 forAssetSetIdentifier:(id)a6 ofAtomicInstance:(id)a7 removingLockCount:(int64_t)a8 completion:(id)a9;
- (void)_failedCheckAtomic:(id)a3 forAssetSetIdentifier:(id)a4 withErrorCode:(int64_t)a5 withResponseError:(id)a6 description:(id)a7 completion:(id)a8;
- (void)_failedCurrentSetStatus:(id)a3 forAssetSetIdentifier:(id)a4 withErrorCode:(int64_t)a5 withResponseError:(id)a6 description:(id)a7 completion:(id)a8;
- (void)_failedFormSubAtomicInstance:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7;
- (void)_failedLockAtomic:(id)a3 forAssetSetIdentifier:(id)a4 withErrorCode:(int64_t)a5 withResponseError:(id)a6 description:(id)a7 completion:(id)a8;
- (void)_failedMapLockedAtomicEntry:(id)a3 forAssetSetIdentifier:(id)a4 withErrorCode:(int64_t)a5 withResponseError:(id)a6 description:(id)a7 completion:(id)a8;
- (void)_failedOperation:(id)a3 forAssetSetIdentifier:(id)a4 withErrorCode:(int64_t)a5 withResponseError:(id)a6 description:(id)a7 completion:(id)a8;
- (void)_lockAtomicStatusProgress:(id)a3 lockAtomicError:(id)a4 progressBlock:(id)a5;
- (void)_lockAtomicWithContentValidationOption:(id)a3 forAtomicInstance:(id)a4 performContentValidation:(BOOL)a5 completion:(id)a6;
- (void)_shortTermCurrentSetStatus:(id)a3;
- (void)_shortTermEndAtomicLock:(id)a3 ofAtomicInstance:(id)a4 completion:(id)a5;
- (void)_shortTermLockAtomic:(id)a3 forAtomicInstance:(id)a4 completion:(id)a5;
- (void)_shortTermLockAtomicWithContentValidationOption:(id)a3 forAtomicInstance:(id)a4 performContentValidation:(BOOL)a5 completion:(id)a6;
- (void)_shortTermLogResult:(id)a3 forLockReason:(id)a4 forAtomicInstance:(id)a5 atomicInstanceFilename:(id)a6 forShortTermLock:(id)a7 withSetStatus:(id)a8 returningError:(id)a9;
- (void)_successCheckAtomic:(id)a3 forAssetSetIdentifier:(id)a4 newerInstanceDiscovered:(id)a5 discoveredAtomicEntries:(id)a6 completion:(id)a7;
- (void)_successCurrentSetStatus:(id)a3 forAssetSetIdentifier:(id)a4 withAssetSetStatus:(id)a5 completion:(id)a6;
- (void)_successFormSubAtomicInstance:(id)a3 formedSubAtomicInstance:(id)a4 completion:(id)a5;
- (void)_successLockAtomic:(id)a3 forAssetSetIdentifier:(id)a4 lockedAtomicInstance:(id)a5 lockedAtomicEntries:(id)a6 sandboxExtension:(id)a7 sandboxExtensionPath:(id)a8 completion:(id)a9;
- (void)_successMapLockedAtomicEntry:(id)a3 forAtomicInstance:(id)a4 forMappedSelector:(id)a5 completion:(id)a6;
- (void)_successOperation:(id)a3 forAssetSetIdentifier:(id)a4 completion:(id)a5;
- (void)alterEntriesRepresentingAtomic:(id)a3 toBeComprisedOfEntries:(id)a4 completion:(id)a5;
- (void)alterEntriesRepresentingAtomic:(id)a3 toBeComprisedOfEntries:(id)a4 withNeedPolicy:(id)a5 completion:(id)a6;
- (void)assetSetForStaging:(id)a3 asEntriesWhenTargeting:(id)a4 completion:(id)a5;
- (void)checkAtomic:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withNeedPolicy:(id)a6 withTimeout:(int64_t)a7 completion:(id)a8;
- (void)checkAtomic:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withNeedPolicy:(id)a6 withTimeout:(int64_t)a7 reportingProgress:(id)a8 completion:(id)a9;
- (void)checkAtomic:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withTimeout:(int64_t)a6 completion:(id)a7;
- (void)checkAtomic:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withTimeout:(int64_t)a6 reportingProgress:(id)a7 completion:(id)a8;
- (void)checkAtomic:(id)a3 forAtomicInstance:(id)a4 withNeedPolicy:(id)a5 withTimeout:(int64_t)a6 completion:(id)a7;
- (void)checkAtomic:(id)a3 forAtomicInstance:(id)a4 withTimeout:(int64_t)a5 completion:(id)a6;
- (void)connectToServerFrameworkCompletion:(id)a3;
- (void)continueAtomicLock:(id)a3 ofAtomicInstance:(id)a4 completion:(id)a5;
- (void)continueAtomicLock:(id)a3 ofAtomicInstance:(id)a4 withNeedPolicy:(id)a5 completion:(id)a6;
- (void)currentSetStatus:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)endAtomicLock:(id)a3 ofAtomicInstance:(id)a4 completion:(id)a5;
- (void)formSubAtomicInstance:(id)a3 fromAtomicInstance:(id)a4 toBeComprisedOfEntries:(id)a5 completion:(id)a6;
- (void)lockAtomic:(id)a3 forAtomicInstance:(id)a4 completion:(id)a5;
- (void)lockAtomic:(id)a3 forAtomicInstance:(id)a4 withNeedPolicy:(id)a5 withTimeout:(int64_t)a6 completion:(id)a7;
- (void)lockAtomic:(id)a3 forAtomicInstance:(id)a4 withNeedPolicy:(id)a5 withTimeout:(int64_t)a6 reportingProgress:(id)a7 completion:(id)a8;
- (void)lockAtomic:(id)a3 forAtomicInstance:(id)a4 withTimeout:(int64_t)a5 completion:(id)a6;
- (void)lockAtomic:(id)a3 forAtomicInstance:(id)a4 withTimeout:(int64_t)a5 reportingProgress:(id)a6 completion:(id)a7;
- (void)mapLockedAtomicEntry:(id)a3 forAtomicInstance:(id)a4 mappingSelector:(id)a5 completion:(id)a6;
- (void)needForAtomic:(id)a3 completion:(id)a4;
- (void)needForAtomic:(id)a3 withNeedPolicy:(id)a4 completion:(id)a5;
- (void)setAssetSetIdentifier:(id)a3;
- (void)setAutoAssetEntries:(id)a3;
- (void)setAutoAssetSetClientName:(id)a3;
- (void)setClientDomainName:(id)a3;
- (void)setUpdateCategoryDesiredByClient:(id)a3;
@end

@implementation MAAutoAssetSet

- (id)initUsingClientDomain:(id)a3 forClientName:(id)a4 forAssetSetIdentifier:(id)a5 comprisedOfEntries:(id)a6 error:(id *)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = +[MAAutoAssetSet defaultDispatchQueue](&OBJC_CLASS___MAAutoAssetSet, "defaultDispatchQueue");
  id v17 = -[MAAutoAssetSet initUsingClientDomain:forClientName:forAssetSetIdentifier:asShortTermLocker:comprisedOfEntries:usingDesiredPolicyCategory:completingFromQueue:error:]( self,  "initUsingClientDomain:forClientName:forAssetSetIdentifier:asShortTermLocker:comprisedOfEntries:usingDesiredPol icyCategory:completingFromQueue:error:",  v15,  v14,  v13,  0LL,  v12,  0LL,  v16,  a7);

  return v17;
}

- (id)initUsingClientDomain:(id)a3 forClientName:(id)a4 forAssetSetIdentifier:(id)a5 comprisedOfEntries:(id)a6 completingFromQueue:(id)a7 error:(id *)a8
{
  return -[MAAutoAssetSet initUsingClientDomain:forClientName:forAssetSetIdentifier:asShortTermLocker:comprisedOfEntries:usingDesiredPolicyCategory:completingFromQueue:error:]( self,  "initUsingClientDomain:forClientName:forAssetSetIdentifier:asShortTermLocker:comprisedOfEntries:usingDesiredPo licyCategory:completingFromQueue:error:",  a3,  a4,  a5,  0LL,  a6,  0LL,  a7,  a8);
}

- (id)initUsingClientDomain:(id)a3 forClientName:(id)a4 forAssetSetIdentifier:(id)a5 comprisedOfEntries:(id)a6 usingDesiredPolicyCategory:(id)a7 error:(id *)a8
{
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  id v18 = a3;
  v19 = +[MAAutoAssetSet defaultDispatchQueue](&OBJC_CLASS___MAAutoAssetSet, "defaultDispatchQueue");
  id v20 = -[MAAutoAssetSet initUsingClientDomain:forClientName:forAssetSetIdentifier:asShortTermLocker:comprisedOfEntries:usingDesiredPolicyCategory:completingFromQueue:error:]( self,  "initUsingClientDomain:forClientName:forAssetSetIdentifier:asShortTermLocker:comprisedOfEntries:usingDesiredPol icyCategory:completingFromQueue:error:",  v18,  v17,  v16,  0LL,  v15,  v14,  v19,  a8);

  return v20;
}

- (id)initUsingClientDomain:(id)a3 forClientName:(id)a4 forAssetSetIdentifier:(id)a5 comprisedOfEntries:(id)a6 usingDesiredPolicyCategory:(id)a7 completingFromQueue:(id)a8 error:(id *)a9
{
  return -[MAAutoAssetSet initUsingClientDomain:forClientName:forAssetSetIdentifier:asShortTermLocker:comprisedOfEntries:usingDesiredPolicyCategory:completingFromQueue:error:]( self,  "initUsingClientDomain:forClientName:forAssetSetIdentifier:asShortTermLocker:comprisedOfEntries:usingDesiredPo licyCategory:completingFromQueue:error:",  a3,  a4,  a5,  0LL,  a6,  a7,  a8,  a9);
}

- (id)initLockerUsingClientDomain:(id)a3 forAssetSetIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = +[MAAutoAssetSet defaultDispatchQueue](&OBJC_CLASS___MAAutoAssetSet, "defaultDispatchQueue");
  id v11 = -[MAAutoAssetSet initUsingClientDomain:forClientName:forAssetSetIdentifier:asShortTermLocker:comprisedOfEntries:usingDesiredPolicyCategory:completingFromQueue:error:]( self,  "initUsingClientDomain:forClientName:forAssetSetIdentifier:asShortTermLocker:comprisedOfEntries:usingDesiredPol icyCategory:completingFromQueue:error:",  v9,  @"SHORT_TERM_LOCKER",  v8,  1LL,  0LL,  0LL,  v10,  a5);

  return v11;
}

- (id)initLockerUsingClientDomain:(id)a3 forAssetSetIdentifier:(id)a4 usingDesiredPolicyCategory:(id)a5 completingFromQueue:(id)a6 error:(id *)a7
{
  return -[MAAutoAssetSet initUsingClientDomain:forClientName:forAssetSetIdentifier:asShortTermLocker:comprisedOfEntries:usingDesiredPolicyCategory:completingFromQueue:error:]( self,  "initUsingClientDomain:forClientName:forAssetSetIdentifier:asShortTermLocker:comprisedOfEntries:usingDesiredPo licyCategory:completingFromQueue:error:",  a3,  @"SHORT_TERM_LOCKER",  a4,  1LL,  0LL,  a5,  a6,  a7);
}

- (id)initUsingClientDomain:(id)a3 forClientName:(id)a4 forAssetSetIdentifier:(id)a5 asShortTermLocker:(BOOL)a6 comprisedOfEntries:(id)a7 usingDesiredPolicyCategory:(id)a8 completingFromQueue:(id)a9 error:(id *)a10
{
  BOOL v12 = a6;
  id v17 = a3;
  id v29 = a4;
  id v28 = a5;
  id v27 = a7;
  id v26 = a8;
  id v18 = a9;
  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___MAAutoAssetSet;
  v19 = -[MAAutoAssetSet init](&v30, sel_init);
  if (!v19)
  {
    v21 = 0LL;
    goto LABEL_24;
  }

  +[MAAutoAssetSet frameworkInstanceSetLogDomain]( &OBJC_CLASS___MAAutoAssetSet,  "frameworkInstanceSetLogDomain",  v26,  v27,  v28,  v29);
  objc_storeStrong((id *)&v19->_clientDomainName, a3);
  objc_storeStrong((id *)&v19->_autoAssetSetClientName, a4);
  objc_storeStrong((id *)&v19->_assetSetIdentifier, a5);
  v19->_shortTermLocker = v12;
  objc_storeStrong((id *)&v19->_autoAssetEntries, a7);
  objc_storeStrong((id *)&v19->_updateCategoryDesiredByClient, a8);
  if (v18)
  {
    id v20 = (OS_dispatch_queue *)v18;
  }

  else
  {
    +[MAAutoAssetSet defaultDispatchQueue](&OBJC_CLASS___MAAutoAssetSet, "defaultDispatchQueue");
    id v20 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  }

  completionDispatchQueue = v19->_completionDispatchQueue;
  v19->_completionDispatchQueue = v20;

  if (!v12)
  {
    if (v19->_completionDispatchQueue) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }

  if (__maAutoAssetSetShortTermLockerOnce != -1) {
    dispatch_once(&__maAutoAssetSetShortTermLockerOnce, &__block_literal_global_15);
  }
  if (!v19->_completionDispatchQueue)
  {
LABEL_16:
    v23 = @"no completion dispatch queue";
    goto LABEL_18;
  }

  if (__maAutoAssetSetShortTermLockerDispatchQueue)
  {
    if (!__maAutoAssetSetSharedProcessByClientDomainName)
    {
      v23 = @"no SHORT-TERM lock tracking dictionary";
      goto LABEL_18;
    }

void __166__MAAutoAssetSet_initUsingClientDomain_forClientName_forAssetSetIdentifier_asShortTermLocker_comprisedOfEntries_usingDesiredPolicyCategory_completingFromQueue_error___block_invoke()
{
  v0 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v1 = dispatch_queue_create("process.MobileAssetFramework.shortTermLocker", v0);
  v2 = (void *)__maAutoAssetSetShortTermLockerDispatchQueue;
  __maAutoAssetSetShortTermLockerDispatchQueue = (uint64_t)v1;

  id v3 = objc_alloc_init(MEMORY[0x189603FC8]);
  v4 = (void *)__maAutoAssetSetSharedProcessByClientDomainName;
  __maAutoAssetSetSharedProcessByClientDomainName = (uint64_t)v3;
}

- (MAAutoAssetSet)initWithCoder:(id)a3
{
  v21[4] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)&OBJC_CLASS___MAAutoAssetSet;
  v5 = -[MAAutoAssetSet init](&v20, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x189604010];
    v21[0] = objc_opt_class();
    v21[1] = objc_opt_class();
    v21[2] = objc_opt_class();
    v21[3] = objc_opt_class();
    [MEMORY[0x189603F18] arrayWithObjects:v21 count:4];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setWithArray:v7];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"clientDomainName"];
    clientDomainName = v5->_clientDomainName;
    v5->_clientDomainName = (NSString *)v9;

    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"autoAssetSetClientName"];
    autoAssetSetClientName = v5->_autoAssetSetClientName;
    v5->_autoAssetSetClientName = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"assetSetIdentifier"];
    assetSetIdentifier = v5->_assetSetIdentifier;
    v5->_assetSetIdentifier = (NSString *)v13;

    v5->_shortTermLocker = [v4 decodeBoolForKey:@"shortTermLocker"];
    uint64_t v15 = [v4 decodeObjectOfClasses:v8 forKey:@"autoAssetEntries"];
    autoAssetEntries = v5->_autoAssetEntries;
    v5->_autoAssetEntries = (NSArray *)v15;

    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"updateCategoryDesiredByClient"];
    updateCategoryDesiredByClient = v5->_updateCategoryDesiredByClient;
    v5->_updateCategoryDesiredByClient = (NSString *)v17;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = -[MAAutoAssetSet clientDomainName](self, "clientDomainName");
  [v4 encodeObject:v5 forKey:@"clientDomainName"];
  v6 = -[MAAutoAssetSet autoAssetSetClientName](self, "autoAssetSetClientName");
  [v4 encodeObject:v6 forKey:@"autoAssetSetClientName"];
  v7 = -[MAAutoAssetSet assetSetIdentifier](self, "assetSetIdentifier");
  [v4 encodeObject:v7 forKey:@"assetSetIdentifier"];

  objc_msgSend( v4,  "encodeBool:forKey:",  -[MAAutoAssetSet shortTermLocker](self, "shortTermLocker"),  @"shortTermLocker");
  -[MAAutoAssetSet autoAssetEntries](self, "autoAssetEntries");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v8 forKey:@"autoAssetEntries"];

  -[MAAutoAssetSet updateCategoryDesiredByClient](self, "updateCategoryDesiredByClient");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v9 forKey:@"updateCategoryDesiredByClient"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)alterEntriesRepresentingAtomic:(id)a3 toBeComprisedOfEntries:(id)a4 completion:(id)a5
{
}

- (void)alterEntriesRepresentingAtomic:(id)a3 toBeComprisedOfEntries:(id)a4 withNeedPolicy:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    if (-[MAAutoAssetSet shortTermLocker](self, "shortTermLocker"))
    {
      -[MAAutoAssetSet assetSetIdentifier](self, "assetSetIdentifier");
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MAAutoAssetSet _failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:]( self,  "_failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:",  @"alterEntriesRepresentingAtomic",  v14,  6580LL,  0LL,  @"not supported for SHORT-TERM locker instance",  v13);
    }

    else
    {
      v17[0] = MEMORY[0x1895F87A8];
      v17[1] = 3221225472LL;
      v17[2] = __98__MAAutoAssetSet_alterEntriesRepresentingAtomic_toBeComprisedOfEntries_withNeedPolicy_completion___block_invoke;
      v17[3] = &unk_189FFB5C0;
      v17[4] = self;
      id v18 = v11;
      id v19 = v12;
      id v20 = v10;
      id v21 = v13;
      -[MAAutoAssetSet connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v17);
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 oslog];
    id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet alterEntriesRepresentingAtomic:toBeComprisedOfEntries:withNeedPolicy:completion:].cold.1();
    }
  }
}

void __98__MAAutoAssetSet_alterEntriesRepresentingAtomic_toBeComprisedOfEntries_withNeedPolicy_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    [v4 assetSetIdentifier];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 _failedOperation:@"alterEntriesRepresentingAtomic" forAssetSetIdentifier:v5 withErrorCode:0 withResponseError:v3 description:@"unable to connect to the auto-asset-set XPC service" completion:*(void *)(a1 + 64)];
  }

  else
  {
    v6 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoInstance);
    [*(id *)(a1 + 32) clientDomainName];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) autoAssetSetClientName];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = __maAutoAssetSetSharedClientProcessName;
    uint64_t v10 = __maAutoAssetSetSharedClientProcessID;
    [*(id *)(a1 + 32) assetSetIdentifier];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = *(void *)(a1 + 40);
    +[MAAutoAssetSet frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSet, "frameworkInstanceUUID");
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:]( v6,  "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:co mprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:",  v7,  v8,  v9,  v10,  v11,  0LL,  v12,  0LL,  v13);

    id v15 = -[MAAutoAssetSetInfoDesire initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:]( objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoDesire),  "initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTime out:desiringProgress:",  *(void *)(a1 + 48),  *(void *)(a1 + 56),  0LL,  -101LL,  -101LL,  0LL);
    id v16 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAssetSet frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSet, "frameworkInstanceUUID");
    uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 UUIDString];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();

    [v16 setSafeObject:v14 forKey:@"setInstance"];
    [v16 setSafeObject:v15 forKey:@"setDesire"];
    id v19 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-SET:ALTER_ENTRIES_REPRESENTING_ATOMIC" clientID:v18 version:0 message:v16];
    id v20 = (void *)__maAutoAssetSetSharedConnectionClient;
    v21[0] = MEMORY[0x1895F87A8];
    v21[1] = 3221225472LL;
    v21[2] = __98__MAAutoAssetSet_alterEntriesRepresentingAtomic_toBeComprisedOfEntries_withNeedPolicy_completion___block_invoke_2;
    v21[3] = &unk_189FF94D8;
    v21[4] = *(void *)(a1 + 32);
    id v22 = *(id *)(a1 + 64);
    [v20 connectClientSendServerMessage:v19 proxyObject:0 withReply:v21];
  }
}

void __98__MAAutoAssetSet_alterEntriesRepresentingAtomic_toBeComprisedOfEntries_withNeedPolicy_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v13 = a2;
  id v5 = a3;
  v6 = *(void **)(a1 + 32);
  [v6 assetSetIdentifier];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13 || v5)
  {
    if (v5)
    {
      id v8 = @"failure reported by server";
      uint64_t v9 = v6;
      uint64_t v10 = v7;
      uint64_t v11 = 0LL;
      id v12 = v5;
    }

    else
    {
      id v8 = @"no response message from server";
      uint64_t v9 = v6;
      uint64_t v10 = v7;
      uint64_t v11 = 6104LL;
      id v12 = 0LL;
    }

    [v9 _failedOperation:@"alterEntriesRepresentingAtomic" forAssetSetIdentifier:v10 withErrorCode:v11 withResponseError:v12 description:v8 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v6 _successOperation:@"alterEntriesRepresentingAtomic" forAssetSetIdentifier:v7 completion:*(void *)(a1 + 40)];
  }
}

- (id)alterEntriesRepresentingAtomicSync:(id)a3 toBeComprisedOfEntries:(id)a4
{
  return -[MAAutoAssetSet alterEntriesRepresentingAtomicSync:toBeComprisedOfEntries:withNeedPolicy:]( self,  "alterEntriesRepresentingAtomicSync:toBeComprisedOfEntries:withNeedPolicy:",  a3,  a4,  0LL);
}

- (id)alterEntriesRepresentingAtomicSync:(id)a3 toBeComprisedOfEntries:(id)a4 withNeedPolicy:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v34[0] = 0LL;
  v34[1] = v34;
  v34[2] = 0x3032000000LL;
  v34[3] = __Block_byref_object_copy__8;
  v34[4] = __Block_byref_object_dispose__8;
  id v35 = 0LL;
  uint64_t v28 = 0LL;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  v31 = __Block_byref_object_copy__8;
  v32 = __Block_byref_object_dispose__8;
  id v33 = 0LL;
  v26[0] = 0LL;
  v26[1] = v26;
  v26[2] = 0x2020000000LL;
  char v27 = 0;
  v24[0] = 0LL;
  v24[1] = v24;
  v24[2] = 0x2020000000LL;
  char v25 = 0;
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0LL);
  uint64_t v12 = MEMORY[0x1895F87A8];
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __91__MAAutoAssetSet_alterEntriesRepresentingAtomicSync_toBeComprisedOfEntries_withNeedPolicy___block_invoke;
  v18[3] = &unk_189FFB5E8;
  id v20 = v24;
  id v21 = v34;
  id v22 = &v28;
  v23 = v26;
  id v13 = v11;
  id v19 = v13;
  -[MAAutoAssetSet alterEntriesRepresentingAtomic:toBeComprisedOfEntries:withNeedPolicy:completion:]( self,  "alterEntriesRepresentingAtomic:toBeComprisedOfEntries:withNeedPolicy:completion:",  v8,  v9,  v10,  v18);
  if (+[MAAutoAssetSet waitOnSemaphore:withDaemonTriggeredTimeout:]( &OBJC_CLASS___MAAutoAssetSet,  "waitOnSemaphore:withDaemonTriggeredTimeout:",  v13,  -100LL))
  {
    +[MAAutoAssetSet frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSet, "frameworkDispatchQueue");
    id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v12;
    block[1] = 3221225472LL;
    block[2] = __91__MAAutoAssetSet_alterEntriesRepresentingAtomicSync_toBeComprisedOfEntries_withNeedPolicy___block_invoke_3;
    block[3] = &unk_189FFAB38;
    block[4] = v26;
    block[5] = v24;
    block[6] = v34;
    block[7] = &v28;
    dispatch_sync(v14, block);
  }

  id v15 = (id)v29[5];

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(v34, 8);
  return v15;
}

void __91__MAAutoAssetSet_alterEntriesRepresentingAtomicSync_toBeComprisedOfEntries_withNeedPolicy___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  +[MAAutoAssetSet frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSet, "frameworkDispatchQueue");
  v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)id v10 = *(_OWORD *)(a1 + 32);
  __int128 v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __91__MAAutoAssetSet_alterEntriesRepresentingAtomicSync_toBeComprisedOfEntries_withNeedPolicy___block_invoke_2;
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

uint64_t __91__MAAutoAssetSet_alterEntriesRepresentingAtomicSync_toBeComprisedOfEntries_withNeedPolicy___block_invoke_2( uint64_t result)
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

void __91__MAAutoAssetSet_alterEntriesRepresentingAtomicSync_toBeComprisedOfEntries_withNeedPolicy___block_invoke_3( void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = *(void *)(a1[6] + 8LL);
    id v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0LL;

    uint64_t v4 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto-set(alterEntriesRepresentingAtomicSync)",  0LL,  @"timeout (at framework layer) while waiting for alter-entries-representing-atomic to complete");
    uint64_t v5 = *(void *)(a1[7] + 8LL);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }

- (void)needForAtomic:(id)a3 completion:(id)a4
{
}

- (void)needForAtomic:(id)a3 withNeedPolicy:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (-[MAAutoAssetSet shortTermLocker](self, "shortTermLocker"))
    {
      -[MAAutoAssetSet assetSetIdentifier](self, "assetSetIdentifier");
      dispatch_semaphore_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MAAutoAssetSet _failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:]( self,  "_failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:",  @"needForAtomic",  v11,  6580LL,  0LL,  @"not supported for SHORT-TERM locker instance",  v10);
    }

    else
    {
      v14[0] = MEMORY[0x1895F87A8];
      v14[1] = 3221225472LL;
      v14[2] = __58__MAAutoAssetSet_needForAtomic_withNeedPolicy_completion___block_invoke;
      v14[3] = &unk_189FF9528;
      v14[4] = self;
      id v15 = v9;
      id v16 = v8;
      id v17 = v10;
      -[MAAutoAssetSet connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v14);
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 oslog];
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet needForAtomic:withNeedPolicy:completion:].cold.1();
    }
  }
}

void __58__MAAutoAssetSet_needForAtomic_withNeedPolicy_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    [v4 assetSetIdentifier];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 _failedOperation:@"needForAtomic" forAssetSetIdentifier:v5 withErrorCode:0 withResponseError:v3 description:@"unable to connect to the auto-asset-set XPC service" completion:*(void *)(a1 + 56)];
  }

  else
  {
    id v6 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoInstance);
    [*(id *)(a1 + 32) clientDomainName];
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) autoAssetSetClientName];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = __maAutoAssetSetSharedClientProcessName;
    uint64_t v10 = __maAutoAssetSetSharedClientProcessID;
    [*(id *)(a1 + 32) assetSetIdentifier];
    dispatch_semaphore_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) autoAssetEntries];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAssetSet frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSet, "frameworkInstanceUUID");
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:]( v6,  "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:co mprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:",  v7,  v8,  v9,  v10,  v11,  0LL,  v12,  0LL,  v13);

    id v15 = -[MAAutoAssetSetInfoDesire initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:]( objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoDesire),  "initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTime out:desiringProgress:",  *(void *)(a1 + 40),  *(void *)(a1 + 48),  0LL,  -101LL,  -101LL,  0LL);
    id v16 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAssetSet frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSet, "frameworkInstanceUUID");
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 UUIDString];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();

    [v16 setSafeObject:v14 forKey:@"setInstance"];
    [v16 setSafeObject:v15 forKey:@"setDesire"];
    id v19 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-SET:NEED_FOR_ATOMIC" clientID:v18 version:0 message:v16];
    id v20 = (void *)__maAutoAssetSetSharedConnectionClient;
    v21[0] = MEMORY[0x1895F87A8];
    v21[1] = 3221225472LL;
    v21[2] = __58__MAAutoAssetSet_needForAtomic_withNeedPolicy_completion___block_invoke_2;
    v21[3] = &unk_189FF94D8;
    v21[4] = *(void *)(a1 + 32);
    id v22 = *(id *)(a1 + 56);
    [v20 connectClientSendServerMessage:v19 proxyObject:0 withReply:v21];
  }
}

void __58__MAAutoAssetSet_needForAtomic_withNeedPolicy_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  [v6 assetSetIdentifier];
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13 || v5)
  {
    if (v5)
    {
      id v8 = @"failure reported by server";
      uint64_t v9 = v6;
      uint64_t v10 = v7;
      uint64_t v11 = 0LL;
      id v12 = v5;
    }

    else
    {
      id v8 = @"no response message from server";
      uint64_t v9 = v6;
      uint64_t v10 = v7;
      uint64_t v11 = 6104LL;
      id v12 = 0LL;
    }

    [v9 _failedOperation:@"needForAtomic" forAssetSetIdentifier:v10 withErrorCode:v11 withResponseError:v12 description:v8 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v6 _successOperation:@"needForAtomic" forAssetSetIdentifier:v7 completion:*(void *)(a1 + 40)];
  }
}

- (id)needForAtomicSync:(id)a3
{
  return -[MAAutoAssetSet needForAtomicSync:withNeedPolicy:](self, "needForAtomicSync:withNeedPolicy:", a3, 0LL);
}

- (id)needForAtomicSync:(id)a3 withNeedPolicy:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v31[0] = 0LL;
  v31[1] = v31;
  v31[2] = 0x3032000000LL;
  v31[3] = __Block_byref_object_copy__8;
  v31[4] = __Block_byref_object_dispose__8;
  id v32 = 0LL;
  uint64_t v25 = 0LL;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000LL;
  uint64_t v28 = __Block_byref_object_copy__8;
  id v29 = __Block_byref_object_dispose__8;
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
  v15[2] = __51__MAAutoAssetSet_needForAtomicSync_withNeedPolicy___block_invoke;
  v15[3] = &unk_189FFB5E8;
  id v17 = v21;
  id v18 = v31;
  id v19 = &v25;
  id v20 = v23;
  uint64_t v10 = v8;
  id v16 = v10;
  -[MAAutoAssetSet needForAtomic:withNeedPolicy:completion:]( self,  "needForAtomic:withNeedPolicy:completion:",  v6,  v7,  v15);
  if (+[MAAutoAssetSet waitOnSemaphore:withDaemonTriggeredTimeout:]( &OBJC_CLASS___MAAutoAssetSet,  "waitOnSemaphore:withDaemonTriggeredTimeout:",  v10,  -100LL))
  {
    +[MAAutoAssetSet frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSet, "frameworkDispatchQueue");
    uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v9;
    block[1] = 3221225472LL;
    block[2] = __51__MAAutoAssetSet_needForAtomicSync_withNeedPolicy___block_invoke_3;
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

void __51__MAAutoAssetSet_needForAtomicSync_withNeedPolicy___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  +[MAAutoAssetSet frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSet, "frameworkDispatchQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)uint64_t v10 = *(_OWORD *)(a1 + 32);
  __int128 v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __51__MAAutoAssetSet_needForAtomicSync_withNeedPolicy___block_invoke_2;
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

uint64_t __51__MAAutoAssetSet_needForAtomicSync_withNeedPolicy___block_invoke_2(uint64_t result)
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

void __51__MAAutoAssetSet_needForAtomicSync_withNeedPolicy___block_invoke_3(void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = *(void *)(a1[6] + 8LL);
    id v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0LL;

    uint64_t v4 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto-set(needForAtomicSync)",  0LL,  @"timeout (at framework layer) while waiting for need-for-atomic to complete");
    uint64_t v5 = *(void *)(a1[7] + 8LL);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }

- (void)checkAtomic:(id)a3 forAtomicInstance:(id)a4 withTimeout:(int64_t)a5 completion:(id)a6
{
}

- (void)checkAtomic:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withTimeout:(int64_t)a6 completion:(id)a7
{
}

- (void)checkAtomic:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withTimeout:(int64_t)a6 reportingProgress:(id)a7 completion:(id)a8
{
}

- (void)checkAtomic:(id)a3 forAtomicInstance:(id)a4 withNeedPolicy:(id)a5 withTimeout:(int64_t)a6 completion:(id)a7
{
}

- (void)checkAtomic:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withNeedPolicy:(id)a6 withTimeout:(int64_t)a7 completion:(id)a8
{
}

- (void)checkAtomic:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withNeedPolicy:(id)a6 withTimeout:(int64_t)a7 reportingProgress:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a8;
  id v19 = a9;
  if (v19)
  {
    if (-[MAAutoAssetSet shortTermLocker](self, "shortTermLocker"))
    {
      -[MAAutoAssetSet assetSetIdentifier](self, "assetSetIdentifier");
      id v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[MAAutoAssetSet _failedCheckAtomic:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:]( self,  "_failedCheckAtomic:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:",  @"checkAtomic",  v20,  6580LL,  0LL,  @"not supported for SHORT-TERM locker instance",  v19);
    }

    else
    {
      v23[0] = MEMORY[0x1895F87A8];
      v23[1] = 3221225472LL;
      v23[2] = __121__MAAutoAssetSet_checkAtomic_forAtomicInstance_awaitingDownload_withNeedPolicy_withTimeout_reportingProgress_completion___block_invoke;
      void v23[3] = &unk_189FFB610;
      v23[4] = self;
      id v24 = v16;
      id v25 = v17;
      BOOL v30 = a5;
      id v26 = v15;
      int64_t v29 = a7;
      id v27 = v18;
      id v28 = v19;
      -[MAAutoAssetSet connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v23);
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 oslog];
    char v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet checkAtomic:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:reportingProgress:completion:].cold.1();
    }
  }
}

void __121__MAAutoAssetSet_checkAtomic_forAtomicInstance_awaitingDownload_withNeedPolicy_withTimeout_reportingProgress_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    [v4 assetSetIdentifier];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 _failedCheckAtomic:@"checkAtomic" forAssetSetIdentifier:v5 withErrorCode:0 withResponseError:v3 description:@"unable to connect to the auto-asset-set XPC service" completion:*(void *)(a1 + 72)];
  }

  else
  {
    id v24 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoInstance);
    [*(id *)(a1 + 32) clientDomainName];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) autoAssetSetClientName];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = __maAutoAssetSetSharedClientProcessName;
    uint64_t v9 = __maAutoAssetSetSharedClientProcessID;
    [*(id *)(a1 + 32) assetSetIdentifier];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = *(void *)(a1 + 40);
    [*(id *)(a1 + 32) autoAssetEntries];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAssetSet frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSet, "frameworkInstanceUUID");
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:]( v24,  "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:co mprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:",  v6,  v7,  v8,  v9,  v10,  v11,  v12,  0LL,  v13);

    id v15 = -[MAAutoAssetSetInfoDesire initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:]( objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoDesire),  "initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTime out:desiringProgress:",  *(void *)(a1 + 48),  *(void *)(a1 + 56),  *(unsigned __int8 *)(a1 + 88),  *(void *)(a1 + 80),  -101LL,  *(void *)(a1 + 64) != 0LL);
    id v16 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAssetSet frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSet, "frameworkInstanceUUID");
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 UUIDString];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();

    [v16 setSafeObject:v14 forKey:@"setInstance"];
    [v16 setSafeObject:v15 forKey:@"setDesire"];
    id v19 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-SET:CHECK_ATOMIC" clientID:v18 version:0 message:v16];
    id v20 = (void *)[*(id *)(a1 + 32) _newProxyObjectForSetProgressBlock:*(void *)(a1 + 64)];
    id v21 = (void *)__maAutoAssetSetSharedConnectionClient;
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    v25[2] = __121__MAAutoAssetSet_checkAtomic_forAtomicInstance_awaitingDownload_withNeedPolicy_withTimeout_reportingProgress_completion___block_invoke_2;
    v25[3] = &unk_189FFACA0;
    uint64_t v22 = *(void *)(a1 + 32);
    id v26 = v20;
    uint64_t v27 = v22;
    id v28 = *(id *)(a1 + 72);
    id v23 = v20;
    [v21 connectClientSendServerMessage:v19 proxyObject:v23 withReply:v25];
  }
}

void __121__MAAutoAssetSet_checkAtomic_forAtomicInstance_awaitingDownload_withNeedPolicy_withTimeout_reportingProgress_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v24 = a2;
  id v5 = a3;
  if (!v24 || v5)
  {
    id v15 = *(void **)(a1 + 40);
    [v15 assetSetIdentifier];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      id v16 = @"failure reported by server";
      id v17 = v15;
      id v18 = v7;
      uint64_t v19 = 0LL;
      id v20 = v5;
    }

    else
    {
      id v16 = @"no response message from server";
      id v17 = v15;
      id v18 = v7;
      uint64_t v19 = 6104LL;
      id v20 = 0LL;
    }

    [v17 _failedCheckAtomic:@"checkAtomic" forAssetSetIdentifier:v18 withErrorCode:v19 withResponseError:v20 description:v16 completion:*(void *)(a1 + 48)];
  }

  else
  {
    [v24 message];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 safeObjectForKey:@"setFound" ofClass:objc_opt_class()];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      [v7 currentSetStatus];
      uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 newerVersionError];
      uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v10 = *(void **)(a1 + 40);
      [v10 assetSetIdentifier];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 currentSetStatus];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      id v13 = v12;
      if (v9)
      {
        [v12 newerVersionError];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 _failedCheckAtomic:@"checkAtomic" forAssetSetIdentifier:v11 withErrorCode:0 withResponseError:v14 description:@"found-information indicated error" completion:*(void *)(a1 + 48)];
      }

      else
      {
        [v12 newerAtomicInstanceDiscovered];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 currentSetStatus];
        uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
        [v22 newerDiscoveredAtomicEntries];
        id v23 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 _successCheckAtomic:@"checkAtomic" forAssetSetIdentifier:v11 newerInstanceDiscovered:v14 discoveredAtomicEntries:v23 completion:*(void *)(a1 + 48)];
      }
    }

    else
    {
      id v21 = *(void **)(a1 + 40);
      [v21 assetSetIdentifier];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 _failedCheckAtomic:@"checkAtomic" forAssetSetIdentifier:v11 withErrorCode:6104 withResponseError:0 description:@"no found-information provided by server" completion:*(void *)(a1 + 48)];
    }
  }
}

- (id)checkAtomicSync:(id)a3 forAtomicInstance:(id)a4 withTimeout:(int64_t)a5 discoveredAtomicEntries:(id *)a6 error:(id *)a7
{
  return -[MAAutoAssetSet checkAtomicSync:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:discoveredAtomicEntries:error:reportingProgress:]( self,  "checkAtomicSync:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:discoveredAtomicEntries:error:r eportingProgress:",  a3,  a4,  0LL,  0LL,  a5,  a6,  a7,  0LL);
}

- (id)checkAtomicSync:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withTimeout:(int64_t)a6 discoveredAtomicEntries:(id *)a7 error:(id *)a8
{
  return -[MAAutoAssetSet checkAtomicSync:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:discoveredAtomicEntries:error:reportingProgress:]( self,  "checkAtomicSync:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:discoveredAtomicEntries:error:r eportingProgress:",  a3,  a4,  a5,  0LL,  a6,  a7,  a8,  0LL);
}

- (id)checkAtomicSync:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withTimeout:(int64_t)a6 discoveredAtomicEntries:(id *)a7 error:(id *)a8 reportingProgress:(id)a9
{
  return -[MAAutoAssetSet checkAtomicSync:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:discoveredAtomicEntries:error:reportingProgress:]( self,  "checkAtomicSync:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:discoveredAtomicEntries:error:r eportingProgress:",  a3,  a4,  a5,  0LL,  a6,  a7,  a8,  a9);
}

- (id)checkAtomicSync:(id)a3 forAtomicInstance:(id)a4 withNeedPolicy:(id)a5 withTimeout:(int64_t)a6 discoveredAtomicEntries:(id *)a7 error:(id *)a8
{
  return -[MAAutoAssetSet checkAtomicSync:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:discoveredAtomicEntries:error:reportingProgress:]( self,  "checkAtomicSync:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:discoveredAtomicEntries:error:r eportingProgress:",  a3,  a4,  0LL,  a5,  a6,  a7,  a8,  0LL);
}

- (id)checkAtomicSync:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withNeedPolicy:(id)a6 withTimeout:(int64_t)a7 discoveredAtomicEntries:(id *)a8 error:(id *)a9
{
  return -[MAAutoAssetSet checkAtomicSync:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:discoveredAtomicEntries:error:reportingProgress:]( self,  "checkAtomicSync:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:discoveredAtomicEntries:error:r eportingProgress:",  a3,  a4,  a5,  a6,  a7,  a8,  a9,  0LL);
}

- (id)checkAtomicSync:(id)a3 forAtomicInstance:(id)a4 awaitingDownload:(BOOL)a5 withNeedPolicy:(id)a6 withTimeout:(int64_t)a7 discoveredAtomicEntries:(id *)a8 error:(id *)a9 reportingProgress:(id)a10
{
  BOOL v24 = a5;
  id v22 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = a10;
  v58[0] = 0LL;
  v58[1] = v58;
  v58[2] = 0x3032000000LL;
  v58[3] = __Block_byref_object_copy__8;
  v58[4] = __Block_byref_object_dispose__8;
  id v59 = 0LL;
  uint64_t v52 = 0LL;
  v53 = &v52;
  uint64_t v54 = 0x3032000000LL;
  v55 = __Block_byref_object_copy__8;
  v56 = __Block_byref_object_dispose__8;
  id v57 = 0LL;
  uint64_t v46 = 0LL;
  v47 = &v46;
  uint64_t v48 = 0x3032000000LL;
  v49 = __Block_byref_object_copy__8;
  v50 = __Block_byref_object_dispose__8;
  id v51 = 0LL;
  uint64_t v40 = 0LL;
  v41 = &v40;
  uint64_t v42 = 0x3032000000LL;
  v43 = __Block_byref_object_copy__8;
  v44 = __Block_byref_object_dispose__8;
  id v45 = 0LL;
  v38[0] = 0LL;
  v38[1] = v38;
  v38[2] = 0x2020000000LL;
  char v39 = 0;
  v36[0] = 0LL;
  v36[1] = v36;
  v36[2] = 0x2020000000LL;
  char v37 = 0;
  dispatch_semaphore_t v15 = dispatch_semaphore_create(0LL);
  v27[0] = MEMORY[0x1895F87A8];
  v27[1] = 3221225472LL;
  v27[2] = __144__MAAutoAssetSet_checkAtomicSync_forAtomicInstance_awaitingDownload_withNeedPolicy_withTimeout_discoveredAtomicEntries_error_reportingProgress___block_invoke;
  v27[3] = &unk_189FFB660;
  BOOL v30 = v36;
  v31 = v58;
  id v16 = v12;
  id v28 = v16;
  id v32 = &v52;
  id v33 = &v46;
  v34 = &v40;
  id v35 = v38;
  id v17 = v15;
  int64_t v29 = v17;
  -[MAAutoAssetSet checkAtomic:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:reportingProgress:completion:]( self,  "checkAtomic:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:reportingProgress:completion:",  v22,  v16,  v24,  v13,  a7,  v14,  v27);
  if (+[MAAutoAssetSet waitOnSemaphore:withDaemonTriggeredTimeout:]( &OBJC_CLASS___MAAutoAssetSet,  "waitOnSemaphore:withDaemonTriggeredTimeout:",  v17,  -100LL))
  {
    +[MAAutoAssetSet frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSet, "frameworkDispatchQueue");
    id v18 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __144__MAAutoAssetSet_checkAtomicSync_forAtomicInstance_awaitingDownload_withNeedPolicy_withTimeout_discoveredAtomicEntries_error_reportingProgress___block_invoke_3;
    block[3] = &unk_189FFB688;
    void block[4] = v38;
    block[5] = v36;
    block[6] = v58;
    block[7] = &v52;
    void block[8] = &v46;
    block[9] = &v40;
    dispatch_sync(v18, block);
  }

  if (a8) {
    *a8 = (id) v47[5];
  }
  if (a9) {
    *a9 = (id) v41[5];
  }
  id v19 = (id)v53[5];

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v38, 8);
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);

  _Block_object_dispose(v58, 8);
  return v19;
}

void __144__MAAutoAssetSet_checkAtomicSync_forAtomicInstance_awaitingDownload_withNeedPolicy_withTimeout_discoveredAtomicEntries_error_reportingProgress___block_invoke( uint64_t a1,  void *a2,  void *a3,  void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  +[MAAutoAssetSet frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSet, "frameworkDispatchQueue");
  uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __144__MAAutoAssetSet_checkAtomicSync_forAtomicInstance_awaitingDownload_withNeedPolicy_withTimeout_discoveredAtomicEntries_error_reportingProgress___block_invoke_2;
  block[3] = &unk_189FFB638;
  __int128 v21 = *(_OWORD *)(a1 + 48);
  id v16 = *(id *)(a1 + 32);
  id v17 = v7;
  __int128 v11 = *(_OWORD *)(a1 + 80);
  __int128 v22 = *(_OWORD *)(a1 + 64);
  __int128 v23 = v11;
  id v18 = v8;
  id v19 = v9;
  id v20 = *(id *)(a1 + 40);
  id v12 = v9;
  id v13 = v8;
  id v14 = v7;
  dispatch_sync(v10, block);
}

uint64_t __144__MAAutoAssetSet_checkAtomicSync_forAtomicInstance_awaitingDownload_withNeedPolicy_withTimeout_discoveredAtomicEntries_error_reportingProgress___block_invoke_2( uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 72) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    objc_storeStrong((id *)(*(void *)(*(void *)(result + 80) + 8LL) + 40LL), *(id *)(result + 32));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 88) + 8LL) + 40LL), *(id *)(v1 + 40));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 96) + 8LL) + 40LL), *(id *)(v1 + 48));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 104) + 8LL) + 40LL), *(id *)(v1 + 56));
    *(_BYTE *)(*(void *)(*(void *)(v1 + 112) + 8LL) + 24LL) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 64));
  }

  return result;
}

void __144__MAAutoAssetSet_checkAtomicSync_forAtomicInstance_awaitingDownload_withNeedPolicy_withTimeout_discoveredAtomicEntries_error_reportingProgress___block_invoke_3( void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = *(void *)(a1[6] + 8LL);
    id v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0LL;

    uint64_t v4 = *(void *)(a1[7] + 8LL);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0LL;

    uint64_t v6 = *(void *)(a1[8] + 8LL);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0LL;

    uint64_t v8 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto-set(checkAtomicSync)",  0LL,  @"timeout (at framework layer) while waiting for check-atomic to complete");
    uint64_t v9 = *(void *)(a1[9] + 8LL);
    uint64_t v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }

- (void)lockAtomic:(id)a3 forAtomicInstance:(id)a4 withTimeout:(int64_t)a5 completion:(id)a6
{
}

- (void)lockAtomic:(id)a3 forAtomicInstance:(id)a4 withNeedPolicy:(id)a5 withTimeout:(int64_t)a6 completion:(id)a7
{
}

- (void)lockAtomic:(id)a3 forAtomicInstance:(id)a4 withTimeout:(int64_t)a5 reportingProgress:(id)a6 completion:(id)a7
{
}

- (void)lockAtomic:(id)a3 forAtomicInstance:(id)a4 withNeedPolicy:(id)a5 withTimeout:(int64_t)a6 reportingProgress:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  if (v18)
  {
    if (-[MAAutoAssetSet shortTermLocker](self, "shortTermLocker"))
    {
      -[MAAutoAssetSet assetSetIdentifier](self, "assetSetIdentifier");
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[MAAutoAssetSet _failedLockAtomic:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:]( self,  "_failedLockAtomic:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:",  @"lockAtomic",  v19,  6580LL,  0LL,  @"not supported for SHORT-TERM locker instance",  v18);
    }

    else
    {
      v22[0] = MEMORY[0x1895F87A8];
      v22[1] = 3221225472LL;
      v22[2] = __103__MAAutoAssetSet_lockAtomic_forAtomicInstance_withNeedPolicy_withTimeout_reportingProgress_completion___block_invoke;
      v22[3] = &unk_189FFB6B0;
      v22[4] = self;
      id v23 = v15;
      id v24 = v16;
      id v25 = v14;
      int64_t v28 = a6;
      id v26 = v17;
      id v27 = v18;
      -[MAAutoAssetSet connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v22);
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 oslog];
    __int128 v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet lockAtomic:forAtomicInstance:withNeedPolicy:withTimeout:reportingProgress:completion:].cold.1();
    }
  }
}

void __103__MAAutoAssetSet_lockAtomic_forAtomicInstance_withNeedPolicy_withTimeout_reportingProgress_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    [v4 assetSetIdentifier];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 _failedLockAtomic:@"lockAtomic" forAssetSetIdentifier:v5 withErrorCode:0 withResponseError:v3 description:@"unable to connect to the auto-asset-set XPC service" completion:*(void *)(a1 + 72)];
  }

  else
  {
    id v24 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoInstance);
    [*(id *)(a1 + 32) clientDomainName];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) autoAssetSetClientName];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = __maAutoAssetSetSharedClientProcessName;
    uint64_t v9 = __maAutoAssetSetSharedClientProcessID;
    [*(id *)(a1 + 32) assetSetIdentifier];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = *(void *)(a1 + 40);
    [*(id *)(a1 + 32) autoAssetEntries];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAssetSet frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSet, "frameworkInstanceUUID");
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:]( v24,  "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:co mprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:",  v6,  v7,  v8,  v9,  v10,  v11,  v12,  0LL,  v13);

    id v15 = -[MAAutoAssetSetInfoDesire initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:]( objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoDesire),  "initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTime out:desiringProgress:",  *(void *)(a1 + 48),  *(void *)(a1 + 56),  1LL,  -101LL,  *(void *)(a1 + 80),  *(void *)(a1 + 64) != 0LL);
    id v16 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAssetSet frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSet, "frameworkInstanceUUID");
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 UUIDString];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();

    [v16 setSafeObject:v14 forKey:@"setInstance"];
    [v16 setSafeObject:v15 forKey:@"setDesire"];
    id v19 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-SET:LOCK_ATOMIC" clientID:v18 version:0 message:v16];
    id v20 = (void *)[*(id *)(a1 + 32) _newProxyObjectForSetProgressBlock:*(void *)(a1 + 64)];
    __int128 v21 = (void *)__maAutoAssetSetSharedConnectionClient;
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    v25[2] = __103__MAAutoAssetSet_lockAtomic_forAtomicInstance_withNeedPolicy_withTimeout_reportingProgress_completion___block_invoke_2;
    v25[3] = &unk_189FFACA0;
    uint64_t v22 = *(void *)(a1 + 32);
    id v26 = v20;
    uint64_t v27 = v22;
    id v28 = *(id *)(a1 + 72);
    id v23 = v20;
    [v21 connectClientSendServerMessage:v19 proxyObject:v23 withReply:v25];
  }
}

void __103__MAAutoAssetSet_lockAtomic_forAtomicInstance_withNeedPolicy_withTimeout_reportingProgress_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v30 = a2;
  id v5 = a3;
  if (!v30 || v5)
  {
    id v19 = *(void **)(a1 + 40);
    [v19 assetSetIdentifier];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      id v20 = @"failure reported by server";
      __int128 v21 = v19;
      uint64_t v22 = v7;
      uint64_t v23 = 0LL;
      id v24 = v5;
    }

    else
    {
      id v20 = @"no response message from server";
      __int128 v21 = v19;
      uint64_t v22 = v7;
      uint64_t v23 = 6104LL;
      id v24 = 0LL;
    }

    [v21 _failedLockAtomic:@"lockAtomic" forAssetSetIdentifier:v22 withErrorCode:v23 withResponseError:v24 description:v20 completion:*(void *)(a1 + 48)];
  }

  else
  {
    [v30 message];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 safeObjectForKey:@"setFound" ofClass:objc_opt_class()];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    [v30 message];
    uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 safeStringForKey:@"sandboxExtensionKey"];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

    [v30 message];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 safeStringForKey:@"sandboxExtensionPathKey"];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      [v7 currentSetStatus];
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 availableForUseError];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();

      id v14 = *(void **)(a1 + 40);
      [v14 assetSetIdentifier];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v7 currentSetStatus];
      id v16 = (void *)objc_claimAutoreleasedReturnValue();
      id v17 = v16;
      if (v13)
      {
        [v16 availableForUseError];
        id v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 _failedLockAtomic:@"lockAtomic" forAssetSetIdentifier:v15 withErrorCode:0 withResponseError:v18 description:@"found-information indicated error" completion:*(void *)(a1 + 48)];
      }

      else
      {
        [v16 latestDownloadedAtomicInstance];
        int64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 currentSetStatus];
        id v26 = v9;
        uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
        [v27 latestDowloadedAtomicInstanceEntries];
        id v28 = (void *)objc_claimAutoreleasedReturnValue();
        [v14 _successLockAtomic:@"lockAtomic" forAssetSetIdentifier:v15 lockedAtomicInstance:v29 lockedAtomicEntries:v28 sandboxExtension:v26 sandboxExte nsionPath:v11 completion:*(void *)(a1 + 48)];

        uint64_t v9 = v26;
      }
    }

    else
    {
      id v25 = *(void **)(a1 + 40);
      [v25 assetSetIdentifier];
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 _failedLockAtomic:@"lockAtomic" forAssetSetIdentifier:v15 withErrorCode:6104 withResponseError:0 description:@"no found-information provided by server" completion:*(void *)(a1 + 48)];
    }
  }
}

- (id)lockAtomicSync:(id)a3 forAtomicInstance:(id)a4 withTimeout:(int64_t)a5 lockedAtomicEntries:(id *)a6 error:(id *)a7
{
  return -[MAAutoAssetSet lockAtomicSync:forAtomicInstance:withNeedPolicy:withTimeout:lockedAtomicEntries:error:reportingProgress:]( self,  "lockAtomicSync:forAtomicInstance:withNeedPolicy:withTimeout:lockedAtomicEntries:error:reportingProgress:",  a3,  a4,  0LL,  a5,  a6,  a7,  0LL);
}

- (id)lockAtomicSync:(id)a3 forAtomicInstance:(id)a4 withNeedPolicy:(id)a5 withTimeout:(int64_t)a6 lockedAtomicEntries:(id *)a7 error:(id *)a8
{
  return -[MAAutoAssetSet lockAtomicSync:forAtomicInstance:withNeedPolicy:withTimeout:lockedAtomicEntries:error:reportingProgress:]( self,  "lockAtomicSync:forAtomicInstance:withNeedPolicy:withTimeout:lockedAtomicEntries:error:reportingProgress:",  a3,  a4,  a5,  a6,  a7,  a8,  0LL);
}

- (id)lockAtomicSync:(id)a3 forAtomicInstance:(id)a4 withTimeout:(int64_t)a5 lockedAtomicEntries:(id *)a6 error:(id *)a7 reportingProgress:(id)a8
{
  return -[MAAutoAssetSet lockAtomicSync:forAtomicInstance:withNeedPolicy:withTimeout:lockedAtomicEntries:error:reportingProgress:]( self,  "lockAtomicSync:forAtomicInstance:withNeedPolicy:withTimeout:lockedAtomicEntries:error:reportingProgress:",  a3,  a4,  0LL,  a5,  a6,  a7,  a8);
}

- (id)lockAtomicSync:(id)a3 forAtomicInstance:(id)a4 withNeedPolicy:(id)a5 withTimeout:(int64_t)a6 lockedAtomicEntries:(id *)a7 error:(id *)a8 reportingProgress:(id)a9
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a9;
  uint64_t v50 = 0LL;
  id v51 = &v50;
  uint64_t v52 = 0x3032000000LL;
  v53 = __Block_byref_object_copy__8;
  uint64_t v54 = __Block_byref_object_dispose__8;
  id v55 = 0LL;
  uint64_t v44 = 0LL;
  id v45 = &v44;
  uint64_t v46 = 0x3032000000LL;
  v47 = __Block_byref_object_copy__8;
  uint64_t v48 = __Block_byref_object_dispose__8;
  id v49 = 0LL;
  uint64_t v38 = 0LL;
  char v39 = &v38;
  uint64_t v40 = 0x3032000000LL;
  v41 = __Block_byref_object_copy__8;
  uint64_t v42 = __Block_byref_object_dispose__8;
  id v43 = 0LL;
  v36[0] = 0LL;
  v36[1] = v36;
  v36[2] = 0x2020000000LL;
  char v37 = 0;
  v34[0] = 0LL;
  v34[1] = v34;
  v34[2] = 0x2020000000LL;
  char v35 = 0;
  dispatch_semaphore_t v16 = dispatch_semaphore_create(0LL);
  v27[0] = MEMORY[0x1895F87A8];
  v27[1] = 3221225472LL;
  v27[2] = __122__MAAutoAssetSet_lockAtomicSync_forAtomicInstance_withNeedPolicy_withTimeout_lockedAtomicEntries_error_reportingProgress___block_invoke;
  v27[3] = &unk_189FFB6D8;
  int64_t v29 = v34;
  id v30 = &v50;
  id v17 = v15;
  v31 = &v44;
  id v32 = &v38;
  id v18 = v12;
  id v33 = v36;
  id v19 = v16;
  id v28 = v19;
  -[MAAutoAssetSet lockAtomic:forAtomicInstance:withNeedPolicy:withTimeout:reportingProgress:completion:]( self,  "lockAtomic:forAtomicInstance:withNeedPolicy:withTimeout:reportingProgress:completion:",  v12,  v13,  v14,  a6,  v15,  v27);
  if (+[MAAutoAssetSet waitOnSemaphore:withDaemonTriggeredTimeout:]( &OBJC_CLASS___MAAutoAssetSet,  "waitOnSemaphore:withDaemonTriggeredTimeout:",  v19,  -100LL))
  {
    +[MAAutoAssetSet frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSet, "frameworkDispatchQueue");
    id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __122__MAAutoAssetSet_lockAtomicSync_forAtomicInstance_withNeedPolicy_withTimeout_lockedAtomicEntries_error_reportingProgress___block_invoke_3;
    block[3] = &unk_189FFAF70;
    void block[4] = v36;
    block[5] = v34;
    block[6] = &v50;
    block[7] = &v44;
    void block[8] = &v38;
    dispatch_sync(v20, block);
  }

  if (a7) {
    *a7 = (id) v45[5];
  }
  if (a8) {
    *a8 = (id) v39[5];
  }
  id v21 = (id)v51[5];

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);

  return v21;
}

void __122__MAAutoAssetSet_lockAtomicSync_forAtomicInstance_withNeedPolicy_withTimeout_lockedAtomicEntries_error_reportingProgress___block_invoke( _OWORD *a1,  void *a2,  void *a3,  void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  +[MAAutoAssetSet frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSet, "frameworkDispatchQueue");
  uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)id v15 = a1[2];
  __int128 v11 = a1[4];
  __int128 v21 = a1[3];
  __int128 v22 = v11;
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __122__MAAutoAssetSet_lockAtomicSync_forAtomicInstance_withNeedPolicy_withTimeout_lockedAtomicEntries_error_reportingProgress___block_invoke_2;
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

uint64_t __122__MAAutoAssetSet_lockAtomicSync_forAtomicInstance_withNeedPolicy_withTimeout_lockedAtomicEntries_error_reportingProgress___block_invoke_2( uint64_t result)
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

void __122__MAAutoAssetSet_lockAtomicSync_forAtomicInstance_withNeedPolicy_withTimeout_lockedAtomicEntries_error_reportingProgress___block_invoke_3( void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = *(void *)(a1[6] + 8LL);
    id v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0LL;

    uint64_t v4 = *(void *)(a1[7] + 8LL);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = 0LL;

    uint64_t v6 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto-set(lockAtomicSync)",  0LL,  @"timeout (at framework layer) while waiting for lock-atomic to complete");
    uint64_t v7 = *(void *)(a1[8] + 8LL);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }

- (void)mapLockedAtomicEntry:(id)a3 forAtomicInstance:(id)a4 mappingSelector:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    if (-[MAAutoAssetSet shortTermLocker](self, "shortTermLocker"))
    {
      -[MAAutoAssetSet assetSetIdentifier](self, "assetSetIdentifier");
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MAAutoAssetSet _failedMapLockedAtomicEntry:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:]( self,  "_failedMapLockedAtomicEntry:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:",  @"mapLockedAtomicEntry",  v14,  6580LL,  0LL,  @"not supported for SHORT-TERM locker instance",  v13);
    }

    else
    {
      v17[0] = MEMORY[0x1895F87A8];
      v17[1] = 3221225472LL;
      v17[2] = __84__MAAutoAssetSet_mapLockedAtomicEntry_forAtomicInstance_mappingSelector_completion___block_invoke;
      v17[3] = &unk_189FFB5C0;
      id v18 = v12;
      id v19 = self;
      id v20 = v11;
      id v21 = v10;
      id v22 = v13;
      -[MAAutoAssetSet connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v17);
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 oslog];
    dispatch_semaphore_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet mapLockedAtomicEntry:forAtomicInstance:mappingSelector:completion:].cold.1();
    }
  }
}

void __84__MAAutoAssetSet_mapLockedAtomicEntry_forAtomicInstance_mappingSelector_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 40);
    [v4 assetSetIdentifier];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 _failedMapLockedAtomicEntry:@"mapLockedAtomicEntry" forAssetSetIdentifier:v5 withErrorCode:0 withResponseError:v3 description:@"unable to connect to the auto-asset-set XPC service" completion:*(void *)(a1 + 64)];
  }

  else
  {
    id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
    uint64_t v7 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetEntry);
    [*(id *)(a1 + 32) assetType];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) assetSpecifier];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) assetVersion];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v27 = -[MAAutoAssetSetEntry initForAssetType:withAssetSpecifier:matchingAssetVersion:]( v7,  "initForAssetType:withAssetSpecifier:matchingAssetVersion:",  v8,  v9,  v10);

    id v11 = v6;
    [v6 addObject:v27];
    id v12 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoInstance);
    [*(id *)(a1 + 40) clientDomainName];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) autoAssetSetClientName];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = __maAutoAssetSetSharedClientProcessName;
    uint64_t v16 = __maAutoAssetSetSharedClientProcessID;
    [*(id *)(a1 + 40) assetSetIdentifier];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v18 = *(void *)(a1 + 48);
    +[MAAutoAssetSet frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSet, "frameworkInstanceUUID");
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    id v20 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:]( v12,  "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:co mprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:",  v13,  v14,  v15,  v16,  v17,  v18,  v11,  0LL,  v19);

    id v21 = -[MAAutoAssetSetInfoDesire initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:]( objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoDesire),  "initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTime out:desiringProgress:",  0LL,  *(void *)(a1 + 56),  0LL,  -101LL,  -101LL,  0LL);
    id v22 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAssetSet frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSet, "frameworkInstanceUUID");
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 UUIDString];
    id v24 = (void *)objc_claimAutoreleasedReturnValue();

    [v22 setSafeObject:v20 forKey:@"setInstance"];
    [v22 setSafeObject:v21 forKey:@"setDesire"];
    id v25 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-SET:MAP_LOCKED_ATOMIC_ENTRY" clientID:v24 version:0 message:v22];
    id v26 = (void *)__maAutoAssetSetSharedConnectionClient;
    v28[0] = MEMORY[0x1895F87A8];
    v28[1] = 3221225472LL;
    v28[2] = __84__MAAutoAssetSet_mapLockedAtomicEntry_forAtomicInstance_mappingSelector_completion___block_invoke_2;
    v28[3] = &unk_189FFB700;
    v28[4] = *(void *)(a1 + 40);
    id v31 = *(id *)(a1 + 64);
    id v29 = *(id *)(a1 + 32);
    id v30 = *(id *)(a1 + 48);
    [v26 connectClientSendServerMessage:v25 proxyObject:0 withReply:v28];

    id v3 = 0LL;
  }
}

void __84__MAAutoAssetSet_mapLockedAtomicEntry_forAtomicInstance_mappingSelector_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (!v5 || v6)
  {
    uint64_t v28 = a1;
    id v29 = *(void **)(a1 + 32);
    [v29 assetSetIdentifier];
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      id v30 = @"failure reported by server";
      id v31 = v29;
      id v32 = v9;
      uint64_t v33 = 0LL;
      v34 = v7;
    }

    else
    {
      id v30 = @"no response message from server";
      id v31 = v29;
      id v32 = v9;
      uint64_t v33 = 6104LL;
      v34 = 0LL;
    }

    [v31 _failedMapLockedAtomicEntry:@"mapLockedAtomicEntry" forAssetSetIdentifier:v32 withErrorCode:v33 withResponseError:v34 description:v30 completion:*(void *)(v28 + 56)];
    goto LABEL_25;
  }

  uint64_t v44 = a1;
  [v5 message];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 safeObjectForKey:@"setFound" ofClass:objc_opt_class()];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    char v35 = *(void **)(v44 + 32);
    [v35 assetSetIdentifier];
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    [v35 _failedMapLockedAtomicEntry:@"mapLockedAtomicEntry" forAssetSetIdentifier:v36 withErrorCode:6104 withResponseError:0 description:@"no found-information provided by server" completion:*(void *)(v44 + 56)];

    goto LABEL_25;
  }

  id v40 = v5;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  char v39 = v9;
  [v9 currentSetStatus];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 latestDowloadedAtomicInstanceEntries];
  id v11 = (void *)objc_claimAutoreleasedReturnValue();

  id obj = v11;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v45 objects:v49 count:16];
  uint64_t v13 = v44;
  if (!v12)
  {
LABEL_15:

    goto LABEL_23;
  }

  uint64_t v14 = v12;
  uint64_t v15 = *(void *)v46;
  unint64_t v16 = 0x189612000uLL;
  uint64_t v41 = *(void *)v46;
LABEL_6:
  uint64_t v17 = 0LL;
  uint64_t v42 = v14;
  while (1)
  {
    if (*(void *)v46 != v15) {
      objc_enumerationMutation(obj);
    }
    uint64_t v18 = *(void **)(*((void *)&v45 + 1) + 8 * v17);
    id v19 = *(void **)(v16 + 1888);
    [v18 fullAssetSelector];
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v20 assetType];
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(v13 + 40) assetType];
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (([v19 stringIsEqual:v21 to:v22] & 1) == 0)
    {

      goto LABEL_13;
    }

    uint64_t v23 = *(void **)(v16 + 1888);
    [v18 fullAssetSelector];
    id v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 assetSpecifier];
    unint64_t v25 = v16;
    id v26 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(v13 + 40) assetSpecifier];
    id v27 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v23) = [v23 stringIsEqual:v26 to:v27];

    uint64_t v13 = v44;
    unint64_t v16 = v25;
    uint64_t v14 = v42;

    uint64_t v15 = v41;
LABEL_13:
    if (v14 == ++v17)
    {
      uint64_t v14 = [obj countByEnumeratingWithState:&v45 objects:v49 count:16];
      if (v14) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }

  [v18 fullAssetSelector];
  char v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
  {
    [*(id *)(v44 + 32) _successMapLockedAtomicEntry:@"mapLockedAtomicEntry" forAtomicInstance:*(void *)(v44 + 48) forMappedSelector:v37 completion:*(void *)(v44 + 56)];
    goto LABEL_24;
  }

- (id)mapLockedAtomicEntrySync:(id)a3 forAtomicInstance:(id)a4 mappingSelector:(id)a5 mappedSelector:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v36 = 0LL;
  char v37 = &v36;
  uint64_t v38 = 0x3032000000LL;
  char v39 = __Block_byref_object_copy__8;
  id v40 = __Block_byref_object_dispose__8;
  id v41 = 0LL;
  uint64_t v30 = 0LL;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  uint64_t v33 = __Block_byref_object_copy__8;
  v34 = __Block_byref_object_dispose__8;
  id v35 = 0LL;
  v28[0] = 0LL;
  v28[1] = v28;
  v28[2] = 0x2020000000LL;
  char v29 = 0;
  v26[0] = 0LL;
  v26[1] = v26;
  v26[2] = 0x2020000000LL;
  char v27 = 0;
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0LL);
  uint64_t v14 = MEMORY[0x1895F87A8];
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __92__MAAutoAssetSet_mapLockedAtomicEntrySync_forAtomicInstance_mappingSelector_mappedSelector___block_invoke;
  v20[3] = &unk_189FFB728;
  id v22 = v26;
  uint64_t v23 = &v36;
  id v24 = &v30;
  unint64_t v25 = v28;
  uint64_t v15 = v13;
  id v21 = v15;
  -[MAAutoAssetSet mapLockedAtomicEntry:forAtomicInstance:mappingSelector:completion:]( self,  "mapLockedAtomicEntry:forAtomicInstance:mappingSelector:completion:",  v10,  v11,  v12,  v20);
  if (+[MAAutoAssetSet waitOnSemaphore:withDaemonTriggeredTimeout:]( &OBJC_CLASS___MAAutoAssetSet,  "waitOnSemaphore:withDaemonTriggeredTimeout:",  v15,  -100LL))
  {
    +[MAAutoAssetSet frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSet, "frameworkDispatchQueue");
    unint64_t v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v19[0] = v14;
    v19[1] = 3221225472LL;
    v19[2] = __92__MAAutoAssetSet_mapLockedAtomicEntrySync_forAtomicInstance_mappingSelector_mappedSelector___block_invoke_3;
    v19[3] = &unk_189FFAB38;
    v19[4] = v28;
    v19[5] = v26;
    v19[6] = &v36;
    v19[7] = &v30;
    dispatch_sync(v16, v19);
  }

  if (a6) {
    *a6 = (id) v37[5];
  }
  id v17 = (id)v31[5];

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  return v17;
}

void __92__MAAutoAssetSet_mapLockedAtomicEntrySync_forAtomicInstance_mappingSelector_mappedSelector___block_invoke( uint64_t a1,  uint64_t a2,  void *a3,  void *a4)
{
  id v6 = a3;
  id v7 = a4;
  +[MAAutoAssetSet frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSet, "frameworkDispatchQueue");
  id v8 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)id v11 = *(_OWORD *)(a1 + 32);
  __int128 v16 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __92__MAAutoAssetSet_mapLockedAtomicEntrySync_forAtomicInstance_mappingSelector_mappedSelector___block_invoke_2;
  block[3] = &unk_189FF9460;
  id v13 = v6;
  id v14 = v7;
  uint64_t v17 = *(void *)(a1 + 64);
  id v9 = v11[0];
  __int128 v15 = *(_OWORD *)v11;
  id v10 = v7;
  v11[0] = v6;
  dispatch_sync(v8, block);
}

uint64_t __92__MAAutoAssetSet_mapLockedAtomicEntrySync_forAtomicInstance_mappingSelector_mappedSelector___block_invoke_2( uint64_t result)
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

void __92__MAAutoAssetSet_mapLockedAtomicEntrySync_forAtomicInstance_mappingSelector_mappedSelector___block_invoke_3( void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = *(void *)(a1[6] + 8LL);
    id v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0LL;

    uint64_t v4 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto-set(mapLockedAtomicEntrySync)",  0LL,  @"timeout (at framework layer) while waiting for map-locked-atomic-entry to complete");
    uint64_t v5 = *(void *)(a1[7] + 8LL);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }

- (void)lockAtomic:(id)a3 forAtomicInstance:(id)a4 completion:(id)a5
{
}

- (void)_lockAtomicWithContentValidationOption:(id)a3 forAtomicInstance:(id)a4 performContentValidation:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v12)
  {
    if (-[MAAutoAssetSet shortTermLocker](self, "shortTermLocker"))
    {
      -[MAAutoAssetSet _shortTermLockAtomic:forAtomicInstance:performContentValidation:completion:]( self,  "_shortTermLockAtomic:forAtomicInstance:performContentValidation:completion:",  v10,  v11,  v7,  v12);
    }

    else
    {
      -[MAAutoAssetSet completionDispatchQueue](self, "completionDispatchQueue");
      __int128 v15 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1895F87A8];
      v16[1] = 3221225472LL;
      v16[2] = __111__MAAutoAssetSet__lockAtomicWithContentValidationOption_forAtomicInstance_performContentValidation_completion___block_invoke;
      v16[3] = &unk_189FFB750;
      BOOL v18 = v7;
      id v17 = v12;
      dispatch_async(v15, v16);
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 oslog];
    id v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet lockAtomic:forAtomicInstance:withNeedPolicy:withTimeout:reportingProgress:completion:].cold.1();
    }
  }
}

void __111__MAAutoAssetSet__lockAtomicWithContentValidationOption_forAtomicInstance_performContentValidation_completion___block_invoke( uint64_t a1)
{
  if (*(_BYTE *)(a1 + 40)) {
    uint64_t v2 = @"auto-set(lockAtomic)";
  }
  else {
    uint64_t v2 = @"auto-set(lockAtomic:Fast)";
  }
  +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6581LL,  v2,  0LL,  @"restricted to SHORT-TERM locker instance");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (id)lockAtomicSync:(id)a3 forAtomicInstance:(id)a4 error:(id *)a5
{
  return -[MAAutoAssetSet lockAtomicSyncWithContentValidationOption:forAtomicInstance:performContentValidation:error:]( self,  "lockAtomicSyncWithContentValidationOption:forAtomicInstance:performContentValidation:error:",  a3,  a4,  1LL,  a5);
}

- (id)lockAtomicSyncWithContentValidationOption:(id)a3 forAtomicInstance:(id)a4 performContentValidation:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = @"auto-set(lockAtomicSync:fast)";
  if (v7) {
    id v12 = @"auto-set(lockAtomicSync)";
  }
  id v13 = v12;
  if (-[MAAutoAssetSet shortTermLocker](self, "shortTermLocker"))
  {
    id v17 = 0LL;
    -[MAAutoAssetSet _shortTermLockAtomicSync:forAtomicInstance:performContentValidation:error:]( self,  "_shortTermLockAtomicSync:forAtomicInstance:performContentValidation:error:",  v10,  v11,  v7,  &v17);
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    id v15 = v17;
    if (!a6) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }

  +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6581LL,  v13,  0LL,  @"restricted to SHORT-TERM locker instance");
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = 0LL;
  if (a6) {
LABEL_7:
  }
    *a6 = v15;
LABEL_8:

  return v14;
}

- (void)formSubAtomicInstance:(id)a3 fromAtomicInstance:(id)a4 toBeComprisedOfEntries:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    if (-[MAAutoAssetSet shortTermLocker](self, "shortTermLocker"))
    {
      -[MAAutoAssetSet assetSetIdentifier](self, "assetSetIdentifier");
      id v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MAAutoAssetSet _failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:]( self,  "_failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:",  @"formSubAtomicInstance",  v14,  6580LL,  0LL,  @"not supported for SHORT-TERM locker instance",  v13);
    }

    else
    {
      v17[0] = MEMORY[0x1895F87A8];
      v17[1] = 3221225472LL;
      v17[2] = __93__MAAutoAssetSet_formSubAtomicInstance_fromAtomicInstance_toBeComprisedOfEntries_completion___block_invoke;
      v17[3] = &unk_189FFB5C0;
      void v17[4] = self;
      id v18 = v11;
      id v19 = v12;
      id v20 = v10;
      id v21 = v13;
      -[MAAutoAssetSet connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v17);
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 oslog];
    __int128 v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet formSubAtomicInstance:fromAtomicInstance:toBeComprisedOfEntries:completion:].cold.1();
    }
  }
}

void __93__MAAutoAssetSet_formSubAtomicInstance_fromAtomicInstance_toBeComprisedOfEntries_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _failedFormSubAtomicInstance:@"formSubAtomicInstance" withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset-set XPC service" completion:*(void *)(a1 + 64)];
  }

  else
  {
    id v3 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoInstance);
    [*(id *)(a1 + 32) clientDomainName];
    uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) autoAssetSetClientName];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = __maAutoAssetSetSharedClientProcessName;
    uint64_t v7 = __maAutoAssetSetSharedClientProcessID;
    [*(id *)(a1 + 32) assetSetIdentifier];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    +[MAAutoAssetSet frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSet, "frameworkInstanceUUID");
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    id v12 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:]( v3,  "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:co mprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:",  v4,  v5,  v6,  v7,  v8,  v9,  v10,  0LL,  v11);

    id v13 = -[MAAutoAssetSetInfoDesire initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:]( objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoDesire),  "initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTime out:desiringProgress:",  0LL,  *(void *)(a1 + 56),  0LL,  -101LL,  -101LL,  0LL);
    id v14 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAssetSet frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSet, "frameworkInstanceUUID");
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 UUIDString];
    __int128 v16 = (void *)objc_claimAutoreleasedReturnValue();

    [v14 setSafeObject:v12 forKey:@"setInstance"];
    [v14 setSafeObject:v13 forKey:@"setDesire"];
    id v17 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-SET:FORM_SUB_ATOMIC" clientID:v16 version:0 message:v14];
    id v18 = (void *)__maAutoAssetSetSharedConnectionClient;
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = __93__MAAutoAssetSet_formSubAtomicInstance_fromAtomicInstance_toBeComprisedOfEntries_completion___block_invoke_2;
    v19[3] = &unk_189FF94D8;
    v19[4] = *(void *)(a1 + 32);
    id v20 = *(id *)(a1 + 64);
    [v18 connectClientSendServerMessage:v17 proxyObject:0 withReply:v19];
  }

void __93__MAAutoAssetSet_formSubAtomicInstance_fromAtomicInstance_toBeComprisedOfEntries_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
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

    [*(id *)(a1 + 32) _failedFormSubAtomicInstance:@"formSubAtomicInstance" withErrorCode:v12 withResponseError:v13 description:v11 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v14 message];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 safeObjectForKey:@"setFound" ofClass:objc_opt_class()];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();

    id v8 = *(void **)(a1 + 32);
    [v7 currentSetStatus];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 newerAtomicInstanceDiscovered];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v8 _successFormSubAtomicInstance:@"formSubAtomicInstance" formedSubAtomicInstance:v10 completion:*(void *)(a1 + 40)];
  }
}

- (id)formSubAtomicInstanceSync:(id)a3 fromAtomicInstance:(id)a4 toBeComprisedOfEntries:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v36 = 0LL;
  char v37 = &v36;
  uint64_t v38 = 0x3032000000LL;
  char v39 = __Block_byref_object_copy__8;
  id v40 = __Block_byref_object_dispose__8;
  id v41 = 0LL;
  uint64_t v30 = 0LL;
  id v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  uint64_t v33 = __Block_byref_object_copy__8;
  v34 = __Block_byref_object_dispose__8;
  id v35 = 0LL;
  v28[0] = 0LL;
  v28[1] = v28;
  v28[2] = 0x2020000000LL;
  char v29 = 0;
  v26[0] = 0LL;
  v26[1] = v26;
  v26[2] = 0x2020000000LL;
  char v27 = 0;
  dispatch_semaphore_t v13 = dispatch_semaphore_create(0LL);
  uint64_t v14 = MEMORY[0x1895F87A8];
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __92__MAAutoAssetSet_formSubAtomicInstanceSync_fromAtomicInstance_toBeComprisedOfEntries_error___block_invoke;
  v20[3] = &unk_189FFB5E8;
  id v22 = v26;
  uint64_t v23 = &v36;
  id v24 = &v30;
  unint64_t v25 = v28;
  id v15 = v13;
  id v21 = v15;
  -[MAAutoAssetSet formSubAtomicInstance:fromAtomicInstance:toBeComprisedOfEntries:completion:]( self,  "formSubAtomicInstance:fromAtomicInstance:toBeComprisedOfEntries:completion:",  v10,  v11,  v12,  v20);
  if (+[MAAutoAssetSet waitOnSemaphore:withDaemonTriggeredTimeout:]( &OBJC_CLASS___MAAutoAssetSet,  "waitOnSemaphore:withDaemonTriggeredTimeout:",  v15,  -100LL))
  {
    +[MAAutoAssetSet frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSet, "frameworkDispatchQueue");
    __int128 v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v19[0] = v14;
    v19[1] = 3221225472LL;
    v19[2] = __92__MAAutoAssetSet_formSubAtomicInstanceSync_fromAtomicInstance_toBeComprisedOfEntries_error___block_invoke_3;
    v19[3] = &unk_189FFAB38;
    v19[4] = v28;
    void v19[5] = v26;
    v19[6] = &v36;
    v19[7] = &v30;
    dispatch_sync(v16, v19);
  }

  if (a6) {
    *a6 = (id) v31[5];
  }
  id v17 = (id)v37[5];

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  return v17;
}

void __92__MAAutoAssetSet_formSubAtomicInstanceSync_fromAtomicInstance_toBeComprisedOfEntries_error___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  +[MAAutoAssetSet frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSet, "frameworkDispatchQueue");
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)id v10 = *(_OWORD *)(a1 + 32);
  __int128 v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __92__MAAutoAssetSet_formSubAtomicInstanceSync_fromAtomicInstance_toBeComprisedOfEntries_error___block_invoke_2;
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

uint64_t __92__MAAutoAssetSet_formSubAtomicInstanceSync_fromAtomicInstance_toBeComprisedOfEntries_error___block_invoke_2( uint64_t result)
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

void __92__MAAutoAssetSet_formSubAtomicInstanceSync_fromAtomicInstance_toBeComprisedOfEntries_error___block_invoke_3( void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = *(void *)(a1[6] + 8LL);
    id v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0LL;

    uint64_t v4 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto-set(formSubAtomicInstanceSync)",  0LL,  @"timeout (at framework layer) while waiting for form-sub-atomic-instance to complete");
    uint64_t v5 = *(void *)(a1[7] + 8LL);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }

- (void)continueAtomicLock:(id)a3 ofAtomicInstance:(id)a4 completion:(id)a5
{
}

- (void)continueAtomicLock:(id)a3 ofAtomicInstance:(id)a4 withNeedPolicy:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    if (-[MAAutoAssetSet shortTermLocker](self, "shortTermLocker"))
    {
      -[MAAutoAssetSet assetSetIdentifier](self, "assetSetIdentifier");
      __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MAAutoAssetSet _failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:]( self,  "_failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:",  @"continueAtomicLock",  v14,  6580LL,  0LL,  @"not supported for SHORT-TERM locker instance",  v13);
    }

    else
    {
      v17[0] = MEMORY[0x1895F87A8];
      v17[1] = 3221225472LL;
      v17[2] = __80__MAAutoAssetSet_continueAtomicLock_ofAtomicInstance_withNeedPolicy_completion___block_invoke;
      v17[3] = &unk_189FFB5C0;
      void v17[4] = self;
      id v18 = v11;
      id v19 = v12;
      id v20 = v10;
      id v21 = v13;
      -[MAAutoAssetSet connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v17);
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    __int128 v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 oslog];
    uint64_t v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet continueAtomicLock:ofAtomicInstance:withNeedPolicy:completion:].cold.1();
    }
  }
}

void __80__MAAutoAssetSet_continueAtomicLock_ofAtomicInstance_withNeedPolicy_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    [v4 assetSetIdentifier];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 _failedOperation:@"continueAtomicLock" forAssetSetIdentifier:v5 withErrorCode:0 withResponseError:v3 description:@"unable to connect to the auto-asset-set XPC service" completion:*(void *)(a1 + 64)];
  }

  else
  {
    id v6 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoInstance);
    [*(id *)(a1 + 32) clientDomainName];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) autoAssetSetClientName];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = __maAutoAssetSetSharedClientProcessName;
    uint64_t v10 = __maAutoAssetSetSharedClientProcessID;
    [*(id *)(a1 + 32) assetSetIdentifier];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = *(void *)(a1 + 40);
    +[MAAutoAssetSet frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSet, "frameworkInstanceUUID");
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:]( v6,  "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:co mprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:",  v7,  v8,  v9,  v10,  v11,  v12,  0LL,  0LL,  v13);

    id v15 = -[MAAutoAssetSetInfoDesire initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:]( objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoDesire),  "initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTime out:desiringProgress:",  *(void *)(a1 + 48),  *(void *)(a1 + 56),  0LL,  -101LL,  -101LL,  0LL);
    id v16 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAssetSet frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSet, "frameworkInstanceUUID");
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 UUIDString];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();

    [v16 setSafeObject:v14 forKey:@"setInstance"];
    [v16 setSafeObject:v15 forKey:@"setDesire"];
    id v19 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-SET:CONTINUE_ATOMIC_LOCK" clientID:v18 version:0 message:v16];
    id v20 = (void *)__maAutoAssetSetSharedConnectionClient;
    v21[0] = MEMORY[0x1895F87A8];
    v21[1] = 3221225472LL;
    v21[2] = __80__MAAutoAssetSet_continueAtomicLock_ofAtomicInstance_withNeedPolicy_completion___block_invoke_2;
    void v21[3] = &unk_189FF94D8;
    v21[4] = *(void *)(a1 + 32);
    id v22 = *(id *)(a1 + 64);
    [v20 connectClientSendServerMessage:v19 proxyObject:0 withReply:v21];
  }
}

void __80__MAAutoAssetSet_continueAtomicLock_ofAtomicInstance_withNeedPolicy_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  [v6 assetSetIdentifier];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13 || v5)
  {
    if (v5)
    {
      id v8 = @"failure reported by server";
      uint64_t v9 = v6;
      uint64_t v10 = v7;
      uint64_t v11 = 0LL;
      id v12 = v5;
    }

    else
    {
      id v8 = @"no response message from server";
      uint64_t v9 = v6;
      uint64_t v10 = v7;
      uint64_t v11 = 6104LL;
      id v12 = 0LL;
    }

    [v9 _failedOperation:@"continueAtomicLock" forAssetSetIdentifier:v10 withErrorCode:v11 withResponseError:v12 description:v8 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v6 _successOperation:@"continueAtomicLock" forAssetSetIdentifier:v7 completion:*(void *)(a1 + 40)];
  }
}

- (id)continueAtomicLockSync:(id)a3 ofAtomicInstance:(id)a4
{
  return -[MAAutoAssetSet continueAtomicLockSync:ofAtomicInstance:withNeedPolicy:]( self,  "continueAtomicLockSync:ofAtomicInstance:withNeedPolicy:",  a3,  a4,  0LL);
}

- (id)continueAtomicLockSync:(id)a3 ofAtomicInstance:(id)a4 withNeedPolicy:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v34[0] = 0LL;
  v34[1] = v34;
  v34[2] = 0x3032000000LL;
  void v34[3] = __Block_byref_object_copy__8;
  v34[4] = __Block_byref_object_dispose__8;
  id v35 = 0LL;
  uint64_t v28 = 0LL;
  char v29 = &v28;
  uint64_t v30 = 0x3032000000LL;
  id v31 = __Block_byref_object_copy__8;
  uint64_t v32 = __Block_byref_object_dispose__8;
  id v33 = 0LL;
  v26[0] = 0LL;
  v26[1] = v26;
  v26[2] = 0x2020000000LL;
  char v27 = 0;
  v24[0] = 0LL;
  v24[1] = v24;
  v24[2] = 0x2020000000LL;
  char v25 = 0;
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0LL);
  uint64_t v12 = MEMORY[0x1895F87A8];
  v18[0] = MEMORY[0x1895F87A8];
  v18[1] = 3221225472LL;
  v18[2] = __73__MAAutoAssetSet_continueAtomicLockSync_ofAtomicInstance_withNeedPolicy___block_invoke;
  v18[3] = &unk_189FFB5E8;
  id v20 = v24;
  id v21 = v34;
  id v22 = &v28;
  uint64_t v23 = v26;
  id v13 = v11;
  id v19 = v13;
  -[MAAutoAssetSet continueAtomicLock:ofAtomicInstance:withNeedPolicy:completion:]( self,  "continueAtomicLock:ofAtomicInstance:withNeedPolicy:completion:",  v8,  v9,  v10,  v18);
  if (+[MAAutoAssetSet waitOnSemaphore:withDaemonTriggeredTimeout:]( &OBJC_CLASS___MAAutoAssetSet,  "waitOnSemaphore:withDaemonTriggeredTimeout:",  v13,  -100LL))
  {
    +[MAAutoAssetSet frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSet, "frameworkDispatchQueue");
    id v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v12;
    block[1] = 3221225472LL;
    block[2] = __73__MAAutoAssetSet_continueAtomicLockSync_ofAtomicInstance_withNeedPolicy___block_invoke_3;
    block[3] = &unk_189FFAB38;
    void block[4] = v26;
    block[5] = v24;
    block[6] = v34;
    block[7] = &v28;
    dispatch_sync(v14, block);
  }

  id v15 = (id)v29[5];

  _Block_object_dispose(v24, 8);
  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(v34, 8);
  return v15;
}

void __73__MAAutoAssetSet_continueAtomicLockSync_ofAtomicInstance_withNeedPolicy___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  +[MAAutoAssetSet frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSet, "frameworkDispatchQueue");
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)id v10 = *(_OWORD *)(a1 + 32);
  __int128 v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __73__MAAutoAssetSet_continueAtomicLockSync_ofAtomicInstance_withNeedPolicy___block_invoke_2;
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

uint64_t __73__MAAutoAssetSet_continueAtomicLockSync_ofAtomicInstance_withNeedPolicy___block_invoke_2( uint64_t result)
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

void __73__MAAutoAssetSet_continueAtomicLockSync_ofAtomicInstance_withNeedPolicy___block_invoke_3( void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = *(void *)(a1[6] + 8LL);
    id v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0LL;

    uint64_t v4 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto-set(continueAtomicLockSync)",  0LL,  @"timeout (at framework layer) while waiting for continue-atomic-lock to complete");
    uint64_t v5 = *(void *)(a1[7] + 8LL);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }

- (void)endAtomicLock:(id)a3 ofAtomicInstance:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (!-[MAAutoAssetSet shortTermLocker](self, "shortTermLocker"))
    {
      v15[0] = MEMORY[0x1895F87A8];
      v15[1] = 3221225472LL;
      id v15[2] = __60__MAAutoAssetSet_endAtomicLock_ofAtomicInstance_completion___block_invoke_2;
      v15[3] = &unk_189FF9528;
      void v15[4] = self;
      id v16 = v9;
      id v17 = v8;
      id v18 = v10;
      -[MAAutoAssetSet connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v15);

      goto LABEL_8;
    }

    -[MAAutoAssetSet _shortTermEndAtomicLockSync:ofAtomicInstance:]( self,  "_shortTermEndAtomicLockSync:ofAtomicInstance:",  v8,  v9);
    dispatch_semaphore_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAAutoAssetSet completionDispatchQueue](self, "completionDispatchQueue");
    id v12 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __60__MAAutoAssetSet_endAtomicLock_ofAtomicInstance_completion___block_invoke;
    block[3] = &unk_189FFAE08;
    id v20 = v11;
    id v21 = v10;
    void block[4] = self;
    id v13 = v11;
    dispatch_async(v12, block);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    __int128 v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 oslog];
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet endAtomicLock:ofAtomicInstance:completion:].cold.1();
    }
  }

LABEL_8:
}

void __60__MAAutoAssetSet_endAtomicLock_ofAtomicInstance_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  [*(id *)(a1 + 32) assetSetIdentifier];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, *(void *)(a1 + 40));
}

void __60__MAAutoAssetSet_endAtomicLock_ofAtomicInstance_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    [v4 assetSetIdentifier];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 _failedOperation:@"endAtomicLock" forAssetSetIdentifier:v5 withErrorCode:0 withResponseError:v3 description:@"unable to connect to the auto-asset-set XPC service" completion:*(void *)(a1 + 56)];
  }

  else
  {
    id v6 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoInstance);
    [*(id *)(a1 + 32) clientDomainName];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) autoAssetSetClientName];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = __maAutoAssetSetSharedClientProcessName;
    uint64_t v10 = __maAutoAssetSetSharedClientProcessID;
    [*(id *)(a1 + 32) assetSetIdentifier];
    dispatch_semaphore_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = *(void *)(a1 + 40);
    +[MAAutoAssetSet frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSet, "frameworkInstanceUUID");
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:]( v6,  "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:co mprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:",  v7,  v8,  v9,  v10,  v11,  v12,  0LL,  0LL,  v13);

    id v15 = -[MAAutoAssetSetInfoDesire initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:]( objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoDesire),  "initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTime out:desiringProgress:",  0LL,  *(void *)(a1 + 48),  0LL,  -101LL,  -101LL,  0LL);
    id v16 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAssetSet frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSet, "frameworkInstanceUUID");
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 UUIDString];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();

    [v16 setSafeObject:v14 forKey:@"setInstance"];
    [v16 setSafeObject:v15 forKey:@"setDesire"];
    id v19 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-SET:END_ATOMIC_LOCK" clientID:v18 version:0 message:v16];
    id v20 = (void *)__maAutoAssetSetSharedConnectionClient;
    v21[0] = MEMORY[0x1895F87A8];
    v21[1] = 3221225472LL;
    v21[2] = __60__MAAutoAssetSet_endAtomicLock_ofAtomicInstance_completion___block_invoke_3;
    void v21[3] = &unk_189FF94D8;
    v21[4] = *(void *)(a1 + 32);
    id v22 = *(id *)(a1 + 56);
    [v20 connectClientSendServerMessage:v19 proxyObject:0 withReply:v21];
  }
}

void __60__MAAutoAssetSet_endAtomicLock_ofAtomicInstance_completion___block_invoke_3( uint64_t a1,  void *a2,  void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  [v6 assetSetIdentifier];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13 || v5)
  {
    if (v5)
    {
      id v8 = @"failure reported by server";
      uint64_t v9 = v6;
      uint64_t v10 = v7;
      uint64_t v11 = 0LL;
      id v12 = v5;
    }

    else
    {
      id v8 = @"no response message from server";
      uint64_t v9 = v6;
      uint64_t v10 = v7;
      uint64_t v11 = 6104LL;
      id v12 = 0LL;
    }

    [v9 _failedOperation:@"endAtomicLock" forAssetSetIdentifier:v10 withErrorCode:v11 withResponseError:v12 description:v8 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v6 _successOperation:@"endAtomicLock" forAssetSetIdentifier:v7 completion:*(void *)(a1 + 40)];
  }
}

- (id)endAtomicLockSync:(id)a3 ofAtomicInstance:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v29 = 0LL;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000LL;
  uint64_t v32 = __Block_byref_object_copy__8;
  id v33 = __Block_byref_object_dispose__8;
  id v34 = 0LL;
  if (-[MAAutoAssetSet shortTermLocker](self, "shortTermLocker"))
  {
    uint64_t v8 = -[MAAutoAssetSet _shortTermEndAtomicLockSync:ofAtomicInstance:]( self,  "_shortTermEndAtomicLockSync:ofAtomicInstance:",  v6,  v7);
    uint64_t v9 = (void *)v30[5];
    v30[5] = v8;
  }

  else
  {
    v27[0] = 0LL;
    v27[1] = v27;
    v27[2] = 0x3032000000LL;
    v27[3] = __Block_byref_object_copy__8;
    void v27[4] = __Block_byref_object_dispose__8;
    id v28 = 0LL;
    v25[0] = 0LL;
    v25[1] = v25;
    v25[2] = 0x2020000000LL;
    char v26 = 0;
    v23[0] = 0LL;
    v23[1] = v23;
    v23[2] = 0x2020000000LL;
    char v24 = 0;
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0LL);
    uint64_t v11 = MEMORY[0x1895F87A8];
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __53__MAAutoAssetSet_endAtomicLockSync_ofAtomicInstance___block_invoke;
    v17[3] = &unk_189FFB5E8;
    id v19 = v23;
    id v20 = v27;
    id v21 = &v29;
    id v22 = v25;
    id v12 = v10;
    id v18 = v12;
    -[MAAutoAssetSet endAtomicLock:ofAtomicInstance:completion:]( self,  "endAtomicLock:ofAtomicInstance:completion:",  v6,  v7,  v17);
    if (+[MAAutoAssetSet waitOnSemaphore:withDaemonTriggeredTimeout:]( &OBJC_CLASS___MAAutoAssetSet,  "waitOnSemaphore:withDaemonTriggeredTimeout:",  v12,  -100LL))
    {
      +[MAAutoAssetSet frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSet, "frameworkDispatchQueue");
      id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = v11;
      block[1] = 3221225472LL;
      block[2] = __53__MAAutoAssetSet_endAtomicLockSync_ofAtomicInstance___block_invoke_3;
      block[3] = &unk_189FFAB38;
      void block[4] = v25;
      void block[5] = v23;
      block[6] = v27;
      block[7] = &v29;
      dispatch_sync(v13, block);
    }

    _Block_object_dispose(v23, 8);
    _Block_object_dispose(v25, 8);
    _Block_object_dispose(v27, 8);
  }

  id v14 = (id)v30[5];
  _Block_object_dispose(&v29, 8);

  return v14;
}

void __53__MAAutoAssetSet_endAtomicLockSync_ofAtomicInstance___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  +[MAAutoAssetSet frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSet, "frameworkDispatchQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)dispatch_semaphore_t v10 = *(_OWORD *)(a1 + 32);
  __int128 v15 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __53__MAAutoAssetSet_endAtomicLockSync_ofAtomicInstance___block_invoke_2;
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

uint64_t __53__MAAutoAssetSet_endAtomicLockSync_ofAtomicInstance___block_invoke_2(uint64_t result)
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

void __53__MAAutoAssetSet_endAtomicLockSync_ofAtomicInstance___block_invoke_3(void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = *(void *)(a1[6] + 8LL);
    id v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0LL;

    uint64_t v4 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto-set(endAtomicLockSync)",  0LL,  @"timeout (at framework layer) while waiting for end-atomic-lock to complete");
    uint64_t v5 = *(void *)(a1[7] + 8LL);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }

- (void)assetSetForStaging:(id)a3 asEntriesWhenTargeting:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    if (-[MAAutoAssetSet shortTermLocker](self, "shortTermLocker"))
    {
      -[MAAutoAssetSet assetSetIdentifier](self, "assetSetIdentifier");
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MAAutoAssetSet _failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:]( self,  "_failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:",  @"assetSetForStaging",  v11,  6580LL,  0LL,  @"not supported for SHORT-TERM locker instance",  v10);
    }

    else
    {
      v14[0] = MEMORY[0x1895F87A8];
      v14[1] = 3221225472LL;
      v14[2] = __71__MAAutoAssetSet_assetSetForStaging_asEntriesWhenTargeting_completion___block_invoke;
      v14[3] = &unk_189FF9528;
      v14[4] = self;
      id v15 = v9;
      id v16 = v8;
      id v17 = v10;
      -[MAAutoAssetSet connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v14);
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 oslog];
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet assetSetForStaging:asEntriesWhenTargeting:completion:].cold.1();
    }
  }
}

void __71__MAAutoAssetSet_assetSetForStaging_asEntriesWhenTargeting_completion___block_invoke( uint64_t a1,  void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    [v4 assetSetIdentifier];
    uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 _failedOperation:@"assetSetForStaging" forAssetSetIdentifier:v5 withErrorCode:0 withResponseError:v3 description:@"unable to connect to the auto-asset-set XPC service" completion:*(void *)(a1 + 56)];
  }

  else
  {
    id v6 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoInstance);
    [*(id *)(a1 + 32) clientDomainName];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) autoAssetSetClientName];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = __maAutoAssetSetSharedClientProcessName;
    uint64_t v10 = __maAutoAssetSetSharedClientProcessID;
    [*(id *)(a1 + 32) assetSetIdentifier];
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = *(void *)(a1 + 40);
    +[MAAutoAssetSet frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSet, "frameworkInstanceUUID");
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:]( v6,  "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:co mprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:",  v7,  v8,  v9,  v10,  v11,  0LL,  0LL,  v12,  v13);

    id v15 = -[MAAutoAssetSetInfoDesire initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:]( objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoDesire),  "initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTime out:desiringProgress:",  0LL,  *(void *)(a1 + 48),  0LL,  -101LL,  -101LL,  0LL);
    id v16 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAssetSet frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSet, "frameworkInstanceUUID");
    id v17 = (void *)objc_claimAutoreleasedReturnValue();
    [v17 UUIDString];
    id v18 = (void *)objc_claimAutoreleasedReturnValue();

    [v16 setSafeObject:v14 forKey:@"setInstance"];
    [v16 setSafeObject:v15 forKey:@"setDesire"];
    id v19 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-SET:ASSET_SET_FOR_STAGING" clientID:v18 version:0 message:v16];
    id v20 = (void *)__maAutoAssetSetSharedConnectionClient;
    v21[0] = MEMORY[0x1895F87A8];
    v21[1] = 3221225472LL;
    v21[2] = __71__MAAutoAssetSet_assetSetForStaging_asEntriesWhenTargeting_completion___block_invoke_2;
    void v21[3] = &unk_189FF94D8;
    v21[4] = *(void *)(a1 + 32);
    id v22 = *(id *)(a1 + 56);
    [v20 connectClientSendServerMessage:v19 proxyObject:0 withReply:v21];
  }
}

void __71__MAAutoAssetSet_assetSetForStaging_asEntriesWhenTargeting_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  [v6 assetSetIdentifier];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13 || v5)
  {
    if (v5)
    {
      id v8 = @"failure reported by server";
      uint64_t v9 = v6;
      uint64_t v10 = v7;
      uint64_t v11 = 0LL;
      id v12 = v5;
    }

    else
    {
      id v8 = @"no response message from server";
      uint64_t v9 = v6;
      uint64_t v10 = v7;
      uint64_t v11 = 6104LL;
      id v12 = 0LL;
    }

    [v9 _failedOperation:@"assetSetForStaging" forAssetSetIdentifier:v10 withErrorCode:v11 withResponseError:v12 description:v8 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v6 _successOperation:@"assetSetForStaging" forAssetSetIdentifier:v7 completion:*(void *)(a1 + 40)];
  }
}

- (id)assetSetForStagingSync:(id)a3 asEntriesWhenTargeting:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v24 = 0LL;
  char v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  char v27 = __Block_byref_object_copy__8;
  id v28 = __Block_byref_object_dispose__8;
  id v29 = 0LL;
  v22[0] = 0LL;
  v22[1] = v22;
  v22[2] = 0x2020000000LL;
  char v23 = 0;
  v20[0] = 0LL;
  v20[1] = v20;
  v20[2] = 0x2020000000LL;
  char v21 = 0;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0LL);
  uint64_t v9 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  id v15[2] = __64__MAAutoAssetSet_assetSetForStagingSync_asEntriesWhenTargeting___block_invoke;
  v15[3] = &unk_189FFB778;
  id v17 = v20;
  id v18 = &v24;
  id v19 = v22;
  uint64_t v10 = v8;
  id v16 = v10;
  -[MAAutoAssetSet assetSetForStaging:asEntriesWhenTargeting:completion:]( self,  "assetSetForStaging:asEntriesWhenTargeting:completion:",  v6,  v7,  v15);
  if (+[MAAutoAssetSet waitOnSemaphore:withDaemonTriggeredTimeout:]( &OBJC_CLASS___MAAutoAssetSet,  "waitOnSemaphore:withDaemonTriggeredTimeout:",  v10,  -100LL))
  {
    +[MAAutoAssetSet frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSet, "frameworkDispatchQueue");
    uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v9;
    block[1] = 3221225472LL;
    block[2] = __64__MAAutoAssetSet_assetSetForStagingSync_asEntriesWhenTargeting___block_invoke_3;
    block[3] = &unk_189FF94B0;
    void block[4] = v22;
    void block[5] = v20;
    block[6] = &v24;
    dispatch_sync(v11, block);
  }

  id v12 = (id)v25[5];

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

void __64__MAAutoAssetSet_assetSetForStagingSync_asEntriesWhenTargeting___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v4 = a3;
  +[MAAutoAssetSet frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSet, "frameworkDispatchQueue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)id v7 = *(_OWORD *)(a1 + 32);
  __int128 v11 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __64__MAAutoAssetSet_assetSetForStagingSync_asEntriesWhenTargeting___block_invoke_2;
  block[3] = &unk_189FFAEA8;
  id v9 = v4;
  id v6 = v7[0];
  __int128 v10 = *(_OWORD *)v7;
  v7[0] = v4;
  dispatch_sync(v5, block);
}

uint64_t __64__MAAutoAssetSet_assetSetForStagingSync_asEntriesWhenTargeting___block_invoke_2(uint64_t result)
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

void __64__MAAutoAssetSet_assetSetForStagingSync_asEntriesWhenTargeting___block_invoke_3(void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto-set(assetSetForStagingSync)",  0LL,  @"timeout (at framework layer) while waiting for asset-set-for-staging to complete");
    uint64_t v3 = *(void *)(a1[6] + 8LL);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }

- (void)currentSetStatus:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if (-[MAAutoAssetSet shortTermLocker](self, "shortTermLocker"))
    {
      -[MAAutoAssetSet _shortTermCurrentSetStatus:](self, "_shortTermCurrentSetStatus:", v4);
    }

    else
    {
      v7[0] = MEMORY[0x1895F87A8];
      v7[1] = 3221225472LL;
      id v7[2] = __35__MAAutoAssetSet_currentSetStatus___block_invoke;
      v7[3] = &unk_189FFAC50;
      v7[4] = self;
      id v8 = v4;
      -[MAAutoAssetSet connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v7);
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 oslog];
    id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet currentSetStatus:].cold.1();
    }
  }
}

void __35__MAAutoAssetSet_currentSetStatus___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    [v4 assetSetIdentifier];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 _failedCurrentSetStatus:@"currentSetStatus" forAssetSetIdentifier:v5 withErrorCode:0 withResponseError:v3 description:@"unable to connect to the auto-asset-set XPC service" completion:*(void *)(a1 + 40)];
  }

  else
  {
    id v6 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoInstance);
    [*(id *)(a1 + 32) clientDomainName];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) autoAssetSetClientName];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = __maAutoAssetSetSharedClientProcessName;
    uint64_t v10 = __maAutoAssetSetSharedClientProcessID;
    [*(id *)(a1 + 32) assetSetIdentifier];
    __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAssetSet frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSet, "frameworkInstanceUUID");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:]( v6,  "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:co mprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:",  v7,  v8,  v9,  v10,  v11,  0LL,  0LL,  0LL,  v12);

    id v14 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAssetSet frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSet, "frameworkInstanceUUID");
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 UUIDString];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();

    [v14 setSafeObject:v13 forKey:@"setInstance"];
    id v17 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-SET:CURRENT_SET_STATUS" clientID:v16 version:0 message:v14];
    id v18 = (void *)__maAutoAssetSetSharedConnectionClient;
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = __35__MAAutoAssetSet_currentSetStatus___block_invoke_2;
    void v20[3] = &unk_189FF94D8;
    id v19 = *(void **)(a1 + 40);
    void v20[4] = *(void *)(a1 + 32);
    id v21 = v19;
    [v18 connectClientSendServerMessage:v17 proxyObject:0 withReply:v20];
  }
}

void __35__MAAutoAssetSet_currentSetStatus___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v20 = a2;
  id v5 = a3;
  if (v20 && !v5)
  {
    [v20 message];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 safeObjectForKey:@"setFound" ofClass:objc_opt_class()];
    id v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      [v7 currentSetStatus];
      id v8 = (void *)objc_claimAutoreleasedReturnValue();

      uint64_t v9 = *(void **)(a1 + 32);
      [v9 assetSetIdentifier];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        [v7 currentSetStatus];
        __int128 v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 _successCurrentSetStatus:@"currentSetStatus" forAssetSetIdentifier:v10 withAssetSetStatus:v11 completion:*(void *)(a1 + 40)];

LABEL_13:
        goto LABEL_14;
      }

      uint64_t v18 = *(void *)(a1 + 40);
      id v19 = @"found-information yet no set-status provided";
    }

    else
    {
      uint64_t v9 = *(void **)(a1 + 32);
      [v9 assetSetIdentifier];
      uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v18 = *(void *)(a1 + 40);
      id v19 = @"no found-information provided by server";
    }

    [v9 _failedCurrentSetStatus:@"currentSetStatus" forAssetSetIdentifier:v10 withErrorCode:6104 withResponseError:0 description:v19 completion:v18];
    goto LABEL_13;
  }

  id v12 = *(void **)(a1 + 32);
  [v12 assetSetIdentifier];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    id v13 = @"failure reported by server";
    id v14 = v12;
    id v15 = v7;
    uint64_t v16 = 0LL;
    id v17 = v5;
  }

  else
  {
    id v13 = @"no response message from server";
    id v14 = v12;
    id v15 = v7;
    uint64_t v16 = 6104LL;
    id v17 = 0LL;
  }

  [v14 _failedCurrentSetStatus:@"currentSetStatus" forAssetSetIdentifier:v15 withErrorCode:v16 withResponseError:v17 description:v13 completion:*(void *)(a1 + 40)];
LABEL_14:
}

- (id)currentSetStatusSync:(id *)a3
{
  uint64_t v35 = 0LL;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000LL;
  uint64_t v38 = __Block_byref_object_copy__8;
  char v39 = __Block_byref_object_dispose__8;
  id v40 = 0LL;
  uint64_t v29 = 0LL;
  uint64_t v30 = (id *)&v29;
  uint64_t v31 = 0x3032000000LL;
  uint64_t v32 = __Block_byref_object_copy__8;
  id v33 = __Block_byref_object_dispose__8;
  id v34 = 0LL;
  if (-[MAAutoAssetSet shortTermLocker](self, "shortTermLocker"))
  {
    id v5 = v30;
    id v28 = v30[5];
    uint64_t v6 = -[MAAutoAssetSet _shortTermCurrentSetStatusSync:](self, "_shortTermCurrentSetStatusSync:", &v28);
    objc_storeStrong(v5 + 5, v28);
    id v7 = (void *)v36[5];
    v36[5] = v6;

    if (a3) {
LABEL_3:
    }
      *a3 = v30[5];
  }

  else
  {
    v26[0] = 0LL;
    v26[1] = v26;
    v26[2] = 0x3032000000LL;
    void v26[3] = __Block_byref_object_copy__8;
    v26[4] = __Block_byref_object_dispose__8;
    id v27 = 0LL;
    v24[0] = 0LL;
    v24[1] = v24;
    v24[2] = 0x2020000000LL;
    char v25 = 0;
    v22[0] = 0LL;
    v22[1] = v22;
    v22[2] = 0x2020000000LL;
    char v23 = 0;
    dispatch_semaphore_t v10 = dispatch_semaphore_create(0LL);
    uint64_t v11 = MEMORY[0x1895F87A8];
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    id v15[2] = __39__MAAutoAssetSet_currentSetStatusSync___block_invoke;
    v15[3] = &unk_189FFB7A0;
    id v17 = v22;
    uint64_t v18 = v26;
    void v15[4] = self;
    id v19 = &v35;
    id v20 = &v29;
    id v21 = v24;
    id v12 = v10;
    uint64_t v16 = v12;
    -[MAAutoAssetSet currentSetStatus:](self, "currentSetStatus:", v15);
    if (+[MAAutoAssetSet waitOnSemaphore:withDaemonTriggeredTimeout:]( &OBJC_CLASS___MAAutoAssetSet,  "waitOnSemaphore:withDaemonTriggeredTimeout:",  v12,  -100LL))
    {
      +[MAAutoAssetSet frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSet, "frameworkDispatchQueue");
      id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = v11;
      block[1] = 3221225472LL;
      block[2] = __39__MAAutoAssetSet_currentSetStatusSync___block_invoke_3;
      block[3] = &unk_189FFAF70;
      void block[4] = v24;
      void block[5] = v22;
      block[6] = v26;
      void block[7] = &v35;
      void block[8] = &v29;
      dispatch_sync(v13, block);
    }

    _Block_object_dispose(v22, 8);
    _Block_object_dispose(v24, 8);
    _Block_object_dispose(v26, 8);

    if (a3) {
      goto LABEL_3;
    }
  }

  id v8 = (id)v36[5];
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  return v8;
}

void __39__MAAutoAssetSet_currentSetStatusSync___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  +[MAAutoAssetSet frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSet, "frameworkDispatchQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __39__MAAutoAssetSet_currentSetStatusSync___block_invoke_2;
  block[3] = &unk_189FFAC00;
  __int128 v8 = *(_OWORD *)(a1 + 56);
  void block[4] = *(void *)(a1 + 32);
  id v14 = v5;
  __int128 v9 = *(_OWORD *)(a1 + 72);
  __int128 v17 = v8;
  __int128 v18 = v9;
  *(_OWORD *)id v12 = *(_OWORD *)(a1 + 40);
  id v15 = v6;
  id v10 = v12[0];
  __int128 v16 = *(_OWORD *)v12;
  id v11 = v6;
  v12[0] = v5;
  dispatch_sync(v7, block);
}

uint64_t __39__MAAutoAssetSet_currentSetStatusSync___block_invoke_2(uint64_t result)
{
  if (!*(_BYTE *)(*(void *)(*(void *)(result + 64) + 8LL) + 24LL))
  {
    uint64_t v1 = result;
    uint64_t v2 = [*(id *)(result + 32) assetSetIdentifier];
    uint64_t v3 = *(void *)(*(void *)(v1 + 72) + 8LL);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 80) + 8LL) + 40LL), *(id *)(v1 + 40));
    objc_storeStrong((id *)(*(void *)(*(void *)(v1 + 88) + 8LL) + 40LL), *(id *)(v1 + 48));
    *(_BYTE *)(*(void *)(*(void *)(v1 + 96) + 8LL) + 24LL) = 1;
    return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v1 + 56));
  }

  return result;
}

void __39__MAAutoAssetSet_currentSetStatusSync___block_invoke_3(void *a1)
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

    uint64_t v6 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto-set(currentSetStatusSync)",  0LL,  @"timeout (at framework layer) while waiting for current-set-status to complete");
    uint64_t v7 = *(void *)(a1[8] + 8LL);
    __int128 v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }

- (void)_shortTermLockAtomicWithContentValidationOption:(id)a3 forAtomicInstance:(id)a4 performContentValidation:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  id v21 = 0LL;
  -[MAAutoAssetSet _shortTermLockAtomicSync:forAtomicInstance:performContentValidation:error:]( self,  "_shortTermLockAtomicSync:forAtomicInstance:performContentValidation:error:",  a3,  a4,  v6,  &v21);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  id v12 = v21;
  -[MAAutoAssetSet completionDispatchQueue](self, "completionDispatchQueue");
  id v13 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __120__MAAutoAssetSet__shortTermLockAtomicWithContentValidationOption_forAtomicInstance_performContentValidation_completion___block_invoke;
  v17[3] = &unk_189FFAE08;
  id v19 = v12;
  id v20 = v10;
  id v18 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(v13, v17);
}

uint64_t __120__MAAutoAssetSet__shortTermLockAtomicWithContentValidationOption_forAtomicInstance_performContentValidation_completion___block_invoke( void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

- (void)_shortTermLockAtomic:(id)a3 forAtomicInstance:(id)a4 completion:(id)a5
{
}

- (id)_shortTermLockAtomicSync:(id)a3 forAtomicInstance:(id)a4 performContentValidation:(BOOL)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  uint64_t v30 = 0LL;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000LL;
  id v33 = __Block_byref_object_copy__8;
  id v34 = __Block_byref_object_dispose__8;
  id v35 = 0LL;
  uint64_t v24 = 0LL;
  char v25 = &v24;
  uint64_t v26 = 0x3032000000LL;
  id v27 = __Block_byref_object_copy__8;
  id v28 = __Block_byref_object_dispose__8;
  id v29 = 0LL;
  id v12 = (dispatch_queue_s *)__maAutoAssetSetShortTermLockerDispatchQueue;
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __92__MAAutoAssetSet__shortTermLockAtomicSync_forAtomicInstance_performContentValidation_error___block_invoke;
  v17[3] = &unk_189FFB7C8;
  id v13 = v11;
  id v18 = v13;
  id v19 = self;
  id v14 = v10;
  BOOL v23 = a5;
  id v20 = v14;
  id v21 = &v30;
  id v22 = &v24;
  dispatch_sync(v12, v17);
  if (a6) {
    *a6 = (id) v25[5];
  }
  id v15 = (id)v31[5];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v15;
}

void __92__MAAutoAssetSet__shortTermLockAtomicSync_forAtomicInstance_performContentValidation_error___block_invoke( uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x1895F89C0];
  id v2 = *(id *)(a1 + 32);
  unsigned __int8 v58 = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  if (!v3)
  {
    [*(id *)(a1 + 40) clientDomainName];
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) assetSetIdentifier];
    id v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAssetSetStatus shortTermLockFilename:forAssetSetIdentifier:forSetAtomicInstance:]( &OBJC_CLASS___MAAutoAssetSetStatus,  "shortTermLockFilename:forAssetSetIdentifier:forSetAtomicInstance:",  v19,  v20,  0LL);
    id v21 = (void *)objc_claimAutoreleasedReturnValue();

    id v22 = *(void **)(a1 + 40);
    uint64_t v23 = *(void *)(a1 + 48);
    uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8LL);
    char v25 = *(void **)(v24 + 40);
    uint64_t v26 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v27 = *(void *)(*(void *)(a1 + 64) + 8LL);
    id v56 = *(id *)(v27 + 40);
    id v57 = v25;
    uint64_t v28 = [v22 _shortTermOpenSharedLockFile:@"auto-set(_shortTermLockAtomicSync)[atomic-instance]" lockingAtomicInstance:v2 forLockReason:v23 verifyingLocalContentURLs:v26 openingFilename:v21 p rovidingLockedSetStatus:&v57 sharedLockError:&v56];
    objc_storeStrong((id *)(v24 + 40), v57);
    objc_storeStrong((id *)(v27 + 40), v56);
    if ((v28 & 0x80000000) != 0)
    {
      id v10 = 0LL;
      goto LABEL_17;
    }

    uint64_t v29 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) latestDownloadedAtomicInstance];

    uint64_t v30 = *(void **)(a1 + 40);
    uint64_t v31 = *(void *)(a1 + 48);
    char v32 = *(_BYTE *)(a1 + 72);
    uint64_t v33 = *(void *)(*(void *)(a1 + 64) + 8LL);
    id v55 = *(id *)(v33 + 40);
    LOBYTE(v52) = v32;
    [v30 _shortTermLockForAtomicInstance:v29 locking:1 withLockedFileDescriptor:v28 forLockReason:v31 justCreated:&v58 providingLockedSetStatu s:0 shouldVerifyContent:v52 error:&v55];
    id v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v33 + 40), v55);
    if (v10)
    {
      int v34 = v58;
      [MEMORY[0x1896127A0] sharedLogger];
      id v35 = (void *)objc_claimAutoreleasedReturnValue();
      [v35 oslog];
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      BOOL v36 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v34)
      {
        if (v36)
        {
          uint64_t v37 = *(void *)(a1 + 48);
          [v10 summary];
          uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(void *)v60 = v29;
          *(_WORD *)&v60[8] = 2114;
          *(void *)&v60[10] = v37;
          *(_WORD *)&v60[18] = 2114;
          *(void *)&v60[20] = v38;
          char v39 = "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermLockAtomicSync} (%{public}@) | lockReason:%{public}@ |"
                " holding shared lock | shortTermLock:%{public}@";
          id v40 = v13;
          uint32_t v41 = 32;
LABEL_27:
          _os_log_impl(&dword_18718F000, v40, OS_LOG_TYPE_DEFAULT, v39, buf, v41);

          goto LABEL_16;
        }

        goto LABEL_16;
      }

      if (v36)
      {
        uint64_t v44 = *(void *)(a1 + 48);
        [v10 summary];
        __int128 v45 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(void *)v60 = v29;
        *(_WORD *)&v60[8] = 2114;
        *(void *)&v60[10] = v44;
        *(_WORD *)&v60[18] = 2114;
        *(void *)&v60[20] = v45;
        _os_log_impl( &dword_18718F000,  v13,  OS_LOG_TYPE_DEFAULT,  "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermLockAtomicSync} (%{public}@) | lockReason:%{public}@ | addit ional (locally tracked usage) of shared lock | shortTermLock:%{public}@",  buf,  0x20u);
      }
    }

    if (close(v28))
    {
      int v46 = *__error();
      [MEMORY[0x1896127A0] sharedLogger];
      __int128 v47 = (void *)objc_claimAutoreleasedReturnValue();
      [v47 oslog];
      id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v48 = *(void *)(a1 + 48);
        *(_DWORD *)buf = 67109890;
        *(_DWORD *)v60 = v28;
        *(_WORD *)&v60[4] = 2114;
        *(void *)&v60[6] = v29;
        *(_WORD *)&v60[14] = 2114;
        *(void *)&v60[16] = v48;
        *(_WORD *)&v60[24] = 1024;
        *(_DWORD *)&v60[26] = v46;
        _os_log_error_impl( &dword_18718F000,  v13,  OS_LOG_TYPE_ERROR,  "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermLockAtomicSync}\n [SHORT_FILE_CLOSE][%d] (%{public}@) | lockReason:%{public}@ | WARNING | (extraFileLockToClose) failed close of sharedLockedFileDescriptor, errno:%d",  buf,  0x22u);
      }

      goto LABEL_16;
    }

    [MEMORY[0x1896127A0] sharedLogger];
    id v49 = (void *)objc_claimAutoreleasedReturnValue();
    [v49 oslog];
    id v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v50 = *(void *)(a1 + 48);
      [v10 summary];
      uint64_t v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)v60 = v28;
      *(_WORD *)&v60[4] = 2114;
      *(void *)&v60[6] = v29;
      *(_WORD *)&v60[14] = 2114;
      *(void *)&v60[16] = v50;
      *(_WORD *)&v60[24] = 2114;
      *(void *)&v60[26] = v38;
      char v39 = "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermLockAtomicSync}\n"
            "[SHORT_FILE_CLOSE][%d] (%{public}@) | lockReason:%{public}@ | (extraFileLockToClose) released sharedLockedFi"
            "leDescriptor | shortTermLock:%{public}@";
      id v40 = v13;
      uint32_t v41 = 38;
      goto LABEL_27;
    }

- (id)_shortTermLockAtomicSync:(id)a3 forAtomicInstance:(id)a4 error:(id *)a5
{
  return -[MAAutoAssetSet _shortTermLockAtomicSync:forAtomicInstance:performContentValidation:error:]( self,  "_shortTermLockAtomicSync:forAtomicInstance:performContentValidation:error:",  a3,  a4,  1LL,  a5);
}

- (void)_shortTermEndAtomicLock:(id)a3 ofAtomicInstance:(id)a4 completion:(id)a5
{
  id v8 = a5;
  -[MAAutoAssetSet _shortTermEndAtomicLockSync:ofAtomicInstance:]( self,  "_shortTermEndAtomicLockSync:ofAtomicInstance:",  a3,  a4);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSet completionDispatchQueue](self, "completionDispatchQueue");
  id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __70__MAAutoAssetSet__shortTermEndAtomicLock_ofAtomicInstance_completion___block_invoke;
  block[3] = &unk_189FFAE08;
  id v14 = v9;
  id v15 = v8;
  void block[4] = self;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, block);
}

void __70__MAAutoAssetSet__shortTermEndAtomicLock_ofAtomicInstance_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  [*(id *)(a1 + 32) assetSetIdentifier];
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v3, *(void *)(a1 + 40));
}

- (id)_shortTermEndAtomicLockSync:(id)a3 ofAtomicInstance:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0LL;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  id v21 = __Block_byref_object_copy__8;
  id v22 = __Block_byref_object_dispose__8;
  id v23 = 0LL;
  id v8 = (dispatch_queue_s *)__maAutoAssetSetShortTermLockerDispatchQueue;
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __63__MAAutoAssetSet__shortTermEndAtomicLockSync_ofAtomicInstance___block_invoke;
  v13[3] = &unk_189FFB7F0;
  id v14 = v7;
  id v15 = v6;
  uint64_t v16 = self;
  __int128 v17 = &v18;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(v8, v13);
  id v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v11;
}

void __63__MAAutoAssetSet__shortTermEndAtomicLockSync_ofAtomicInstance___block_invoke(uint64_t a1)
{
  uint64_t v89 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = a1 + 32;
  if (!*(void *)(a1 + 32))
  {
    if (v2)
    {
      uint64_t v16 = (void *)[objc_alloc(NSString) initWithFormat:@"Cannot end SHORT-TERM locks of all atomic-instances when lock-reason provided | endLockReason:%@", *(void *)(a1 + 40)];
      uint64_t v17 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6111LL,  @"auto-set(_shortTermEndAtomicLockSync)",  0LL,  v16);
      uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8LL);
      id v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;

      id v9 = 0LL;
      goto LABEL_69;
    }

    uint64_t v27 = (void *)__maAutoAssetSetSharedProcessByClientDomainName;
    [*(id *)(a1 + 48) clientDomainName];
    uint64_t v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v27 safeObjectForKey:v28 ofClass:objc_opt_class()];
    uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v29)
    {
      id v56 = (void *)[objc_alloc(NSString) initWithFormat:@"Cannot end SHORT-TERM locks of all atomic-instances (byAssetSetIdenfier empty) | endLockReason:%@", *(void *)(a1 + 40)];
      uint64_t v57 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6111LL,  @"auto-set(_shortTermEndAtomicLockSync)",  0LL,  v56);
      uint64_t v58 = *(void *)(*(void *)(a1 + 56) + 8LL);
      id v59 = *(void **)(v58 + 40);
      *(void *)(v58 + 40) = v57;

      id v9 = 0LL;
LABEL_68:

      goto LABEL_69;
    }

    [*(id *)(a1 + 48) assetSetIdentifier];
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    [v29 safeObjectForKey:v30 ofClass:objc_opt_class()];
    uint64_t v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v31)
    {
      v63 = (void *)[objc_alloc(NSString) initWithFormat:@"Cannot end SHORT-TERM locks of all atomic-instances (byAtomicInstance empty) | endLockReason:%@", *(void *)(a1 + 40)];
      uint64_t v64 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6111LL,  @"auto-set(_shortTermEndAtomicLockSync)",  0LL,  v63);
      uint64_t v65 = *(void *)(*(void *)(a1 + 56) + 8LL);
      v66 = *(void **)(v65 + 40);
      *(void *)(v65 + 40) = v64;

      id v9 = 0LL;
LABEL_67:

      goto LABEL_68;
    }

    id v32 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v84 = 0u;
    __int128 v85 = 0u;
    __int128 v86 = 0u;
    __int128 v87 = 0u;
    id v33 = v31;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v84 objects:v88 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v85;
      do
      {
        for (uint64_t i = 0LL; i != v35; ++i)
        {
          if (*(void *)v85 != v36) {
            objc_enumerationMutation(v33);
          }
          [v32 addObject:*(void *)(*((void *)&v84 + 1) + 8 * i)];
        }

        uint64_t v35 = [v33 countByEnumeratingWithState:&v84 objects:v88 count:16];
      }

      while (v35);
    }

    uint64_t v38 = [v32 count];
    if (v38 < 1)
    {
      id v40 = 0LL;
    }

    else
    {
      uint64_t v39 = v38;
      v81 = v29;
      id v40 = 0LL;
      char v41 = 0;
      for (uint64_t j = 0LL; j != v39; ++j)
      {
        [v32 objectAtIndex:j];
        uint64_t v43 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v80) = 0;
        [*(id *)(a1 + 48) _shortTermLockForAtomicInstance:v43 locking:0 withLockedFileDescriptor:0xFFFFFFFFLL forLockReason:0 justCreated:0 providingLockedSetS tatus:0 shouldVerifyContent:v80 error:0];
        uint64_t v44 = (void *)objc_claimAutoreleasedReturnValue();
        [v33 removeObjectForKey:v43];
        if (v44)
        {
          [*(id *)(a1 + 48) _closeAndRemoveShortTermLock:@"_shortTermEndAtomicLockSync(ending all locks of atomic-instances and lock-reasons)" forShortTermLock:v44];
          if (v40) {
            char v41 = 1;
          }
          else {
            id v40 = v44;
          }
        }
      }

      if ((v41 & 1) != 0)
      {
        id v9 = 0LL;
        uint64_t v29 = v81;
LABEL_66:

        goto LABEL_67;
      }

      uint64_t v29 = v81;
    }

    id v40 = v40;
    id v9 = v40;
    goto LABEL_66;
  }

  uint64_t v4 = *(void **)(a1 + 48);
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8LL);
  id v8 = *(void **)(v5 + 40);
  id v7 = (id *)(v5 + 40);
  id v6 = v8;
  if (v2)
  {
    id obj = v6;
    LOBYTE(v80) = 0;
    objc_msgSend( v4,  "_shortTermLockForAtomicInstance:locking:withLockedFileDescriptor:forLockReason:justCreated:providingLockedSetStatu s:shouldVerifyContent:error:",  v80,  &obj);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v7, obj);
    if (v9)
    {
      [v9 lockCountByReason];
      id v10 = (void *)objc_claimAutoreleasedReturnValue();
      [v10 safeObjectForKey:*(void *)(a1 + 40) ofClass:objc_opt_class()];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        uint64_t v12 = [v11 intValue];
        uint64_t v13 = v12;
        if ((int)v12 > 0)
        {
          if ((_DWORD)v12 != 1)
          {
            uint64_t v60 = [objc_alloc(MEMORY[0x189607968]) initWithInteger:(v12 - 1)];

            [v9 lockCountByReason];
            uint64_t v61 = (void *)objc_claimAutoreleasedReturnValue();
            [v61 setSafeObject:v60 forKey:*(void *)(a1 + 40)];

            if ([v9 totalLockCount] < 2)
            {
              [MEMORY[0x1896127A0] sharedLogger];
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              [v67 oslog];
              uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();

              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
                __63__MAAutoAssetSet__shortTermEndAtomicLockSync_ofAtomicInstance___block_invoke_cold_4( v3,  (uint64_t)v9,  v26);
              }
              id v11 = (void *)v60;
              goto LABEL_62;
            }

            objc_msgSend(v9, "setTotalLockCount:", objc_msgSend(v9, "totalLockCount") - 1);
            id v11 = (void *)v60;
            goto LABEL_60;
          }

          [v9 lockCountByReason];
          id v14 = (void *)objc_claimAutoreleasedReturnValue();
          [v14 removeObjectForKey:*(void *)(a1 + 40)];

          uint64_t v15 = [v9 totalLockCount];
          if (v15 < 1)
          {
            [MEMORY[0x1896127A0] sharedLogger];
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            [v68 oslog];
            v69 = (os_log_s *)objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
              __63__MAAutoAssetSet__shortTermEndAtomicLockSync_ofAtomicInstance___block_invoke_cold_3( v3,  (uint64_t)v9,  v69);
            }
          }

          else
          {
            objc_msgSend(v9, "setTotalLockCount:", objc_msgSend(v9, "totalLockCount") - 1);
          }

          [v9 lockCountByReason];
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          if ([v70 count])
          {
          }

          else
          {
            uint64_t v71 = [v9 totalLockCount];

            if (v71 > 0)
            {
              if (v15 < 1)
              {
LABEL_63:

                goto LABEL_69;
              }

              goto LABEL_60;
            }

            [*(id *)(a1 + 48) _closeAndRemoveShortTermLock:@"_shortTermEndAtomicLockSync(ending specific atomic-instance lock)" forShortTermLock:v9];
          }

          if (v15 <= 0) {
            goto LABEL_63;
          }
LABEL_60:
          v72 = (void *)__maAutoAssetSetSharedProcessByClientDomainName;
          [*(id *)(a1 + 48) clientDomainName];
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          [v72 safeObjectForKey:v73 ofClass:objc_opt_class()];
          uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();

          if (v26)
          {
            [*(id *)(a1 + 48) assetSetIdentifier];
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            v75 = -[os_log_s safeObjectForKey:ofClass:](v26, "safeObjectForKey:ofClass:", v74, objc_opt_class());
            [v9 assetSetAtomicInstance];
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            [v75 setSafeObject:v9 forKey:v76];

            [*(id *)(a1 + 48) assetSetIdentifier];
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            -[os_log_s setSafeObject:forKey:](v26, "setSafeObject:forKey:", v75, v77);

            v78 = (void *)__maAutoAssetSetSharedProcessByClientDomainName;
            [*(id *)(a1 + 48) clientDomainName];
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            [v78 setSafeObject:v26 forKey:v79];
          }

          goto LABEL_62;
        }

        id v50 = objc_alloc(NSString);
        [v9 summary];
        uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        uint64_t v51 = (os_log_s *)[v50 initWithFormat:@"SHORT-TERM lock lockCountForReason has invalid lock count | shortTermLock:%@ | endLockReason:%@ | lockCount:%d", v26, *(void *)(a1 + 40), v13];
        uint64_t v52 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6501LL,  @"auto-set(_shortTermEndAtomicLockSync)",  0LL,  v51);
        uint64_t v53 = *(void *)(*(void *)(a1 + 56) + 8LL);
        uint64_t v54 = *(void **)(v53 + 40);
        *(void *)(v53 + 40) = v52;

        goto LABEL_45;
      }

      id v45 = objc_alloc(NSString);
      [v9 summary];
      uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      int v46 = (void *)[v45 initWithFormat:@"SHORT-TERM lock is not currently locked for reason to end-lock for | shortTermLock:%@ | endLockReason:%@", v26, *(void *)(a1 + 40)];
      uint64_t v47 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6501LL,  @"auto-set(_shortTermEndAtomicLockSync)",  0LL,  v46);
      uint64_t v48 = *(void *)(*(void *)(a1 + 56) + 8LL);
      id v49 = *(void **)(v48 + 40);
      *(void *)(v48 + 40) = v47;

      id v11 = 0LL;
      goto LABEL_62;
    }
  }

  else
  {
    id v83 = v6;
    LOBYTE(v80) = 0;
    objc_msgSend( v4,  "_shortTermLockForAtomicInstance:locking:withLockedFileDescriptor:forLockReason:justCreated:providingLockedSetStatu s:shouldVerifyContent:error:",  v80,  &v83);
    id v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v7, v83);
    uint64_t v20 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8LL) + 40LL);
    if (v20 && [v20 code] == 6110)
    {
      uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8LL);
      id v22 = *(void **)(v21 + 40);
      *(void *)(v21 + 40) = 0LL;
    }

    if (v9)
    {
      id v23 = (void *)__maAutoAssetSetSharedProcessByClientDomainName;
      [*(id *)(a1 + 48) clientDomainName];
      uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 safeObjectForKey:v24 ofClass:objc_opt_class()];
      id v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        [MEMORY[0x1896127A0] sharedLogger];
        id v55 = (void *)objc_claimAutoreleasedReturnValue();
        [v55 oslog];
        uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          __63__MAAutoAssetSet__shortTermEndAtomicLockSync_ofAtomicInstance___block_invoke_cold_1(v3, (uint64_t)v9, v26);
        }
        goto LABEL_62;
      }

      [*(id *)(a1 + 48) assetSetIdentifier];
      char v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 safeObjectForKey:v25 ofClass:objc_opt_class()];
      uint64_t v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (!v26)
      {
        [MEMORY[0x1896127A0] sharedLogger];
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        [v62 oslog];
        uint64_t v51 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
          __63__MAAutoAssetSet__shortTermEndAtomicLockSync_ofAtomicInstance___block_invoke_cold_2(v3, (uint64_t)v9, v51);
        }
LABEL_45:

        goto LABEL_62;
      }

      [*(id *)(a1 + 48) _closeAndRemoveShortTermLock:@"_shortTermEndAtomicLockSync(ending specific atomic-instance locks - all lock-reasons)" forShortTermLock:v9];
LABEL_62:

      goto LABEL_63;
    }
  }

- (void)_shortTermCurrentSetStatus:(id)a3
{
  id v4 = a3;
  id v15 = 0LL;
  -[MAAutoAssetSet _shortTermCurrentSetStatusSync:](self, "_shortTermCurrentSetStatusSync:", &v15);
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = v15;
  -[MAAutoAssetSet completionDispatchQueue](self, "completionDispatchQueue");
  id v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  id v11[2] = __45__MAAutoAssetSet__shortTermCurrentSetStatus___block_invoke;
  v11[3] = &unk_189FFAE08;
  id v13 = v6;
  id v14 = v4;
  id v12 = v5;
  id v8 = v6;
  id v9 = v5;
  id v10 = v4;
  dispatch_async(v7, v11);
}

uint64_t __45__MAAutoAssetSet__shortTermCurrentSetStatus___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

- (id)_shortTermCurrentSetStatusSync:(id *)a3
{
  uint64_t v13 = 0LL;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000LL;
  uint64_t v16 = __Block_byref_object_copy__8;
  uint64_t v17 = __Block_byref_object_dispose__8;
  id v18 = 0LL;
  uint64_t v7 = 0LL;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000LL;
  id v10 = __Block_byref_object_copy__8;
  id v11 = __Block_byref_object_dispose__8;
  id v12 = 0LL;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __49__MAAutoAssetSet__shortTermCurrentSetStatusSync___block_invoke;
  block[3] = &unk_189FFB818;
  void block[4] = self;
  void block[5] = &v13;
  block[6] = &v7;
  dispatch_sync((dispatch_queue_t)__maAutoAssetSetShortTermLockerDispatchQueue, block);
  if (a3) {
    *a3 = (id) v8[5];
  }
  id v4 = (id)v14[5];
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  return v4;
}

void __49__MAAutoAssetSet__shortTermCurrentSetStatusSync___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  [*(id *)(a1 + 32) clientDomainName];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) assetSetIdentifier];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSetStatus shortTermLockFilename:forAssetSetIdentifier:forSetAtomicInstance:]( &OBJC_CLASS___MAAutoAssetSetStatus,  "shortTermLockFilename:forAssetSetIdentifier:forSetAtomicInstance:",  v2,  v3,  0LL);
  id v4 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v7 = *(void **)(v6 + 40);
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8LL);
  id v21 = *(id *)(v8 + 40);
  id obj = v7;
  int v9 = [v5 _shortTermOpenSharedLockFile:@"auto-set(_shortTermCurrentSetStatus)" lockingAtomicInstance:0 forLockReason:0 verifyingLocalContentURLs:0 openingFilename:v4 prov idingLockedSetStatus:&obj sharedLockError:&v21];
  objc_storeStrong((id *)(v6 + 40), obj);
  objc_storeStrong((id *)(v8 + 40), v21);
  if ((v9 & 0x80000000) == 0)
  {
    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8LL);
    id v20 = *(id *)(v11 + 40);
    uint64_t v12 = [v10 _readLockedSetStatusFromSharedLockFile:v4 error:&v20];
    objc_storeStrong((id *)(v11 + 40), v20);
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    if (close(v9))
    {
      int v15 = *__error();
      [MEMORY[0x1896127A0] sharedLogger];
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 oslog];
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) latestDownloadedAtomicInstance];
        id v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109890;
        int v24 = v9;
        __int16 v25 = 2114;
        uint64_t v26 = v18;
        __int16 v27 = 2114;
        uint64_t v28 = v4;
        __int16 v29 = 1024;
        int v30 = v15;
        _os_log_error_impl( &dword_18718F000,  v17,  OS_LOG_TYPE_ERROR,  "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermCurrentSetStatusSync}\n [SHORT_FILE_CLOSE][%d] (%{public}@) | WARNING | failed close of shared lock file | latestAtomicInstanceFilenam e:%{public}@ | errno:%d",  buf,  0x22u);
LABEL_7:
      }
    }

    else
    {
      [MEMORY[0x1896127A0] sharedLogger];
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      [v19 oslog];
      uint64_t v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) latestDownloadedAtomicInstance];
        id v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109634;
        int v24 = v9;
        __int16 v25 = 2114;
        uint64_t v26 = v18;
        __int16 v27 = 2114;
        uint64_t v28 = v4;
        _os_log_impl( &dword_18718F000,  v17,  OS_LOG_TYPE_DEFAULT,  "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermCurrentSetStatusSync}\n [SHORT_FILE_CLOSE][%d] (%{public}@) | released sharedLockedFileDescriptor | | latestAtomicInstanceFilename:%{public}@",  buf,  0x1Cu);
        goto LABEL_7;
      }
    }
  }

  [*(id *)(a1 + 32) _shortTermLogResult:@"_shortTermCurrentSetStatusSync" forLockReason:0 forAtomicInstance:0 atomicInstanceFilename:v4 forShortTermLock:0 withSetStatus:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) returningError:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

- (id)_shortTermLockForAtomicInstance:(id)a3 locking:(BOOL)a4 withLockedFileDescriptor:(int)a5 forLockReason:(id)a6 justCreated:(BOOL *)a7 providingLockedSetStatus:(id *)a8 shouldVerifyContent:(BOOL)a9 error:(id *)a10
{
  uint64_t v11 = *(void *)&a5;
  BOOL v12 = a4;
  uint64_t v90 = *MEMORY[0x1895F89C0];
  id v14 = a3;
  id v15 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)__maAutoAssetSetShortTermLockerDispatchQueue);
  uint64_t v16 = (void *)__maAutoAssetSetSharedProcessByClientDomainName;
  -[MAAutoAssetSet clientDomainName](self, "clientDomainName");
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 safeObjectForKey:v17 ofClass:objc_opt_class()];
  id v18 = (id)objc_claimAutoreleasedReturnValue();

  v81 = v14;
  if (!v18)
  {
    if (v12)
    {
      id v18 = objc_alloc_init(MEMORY[0x189603FC8]);
      uint64_t v34 = (void *)__maAutoAssetSetSharedProcessByClientDomainName;
      -[MAAutoAssetSet clientDomainName](self, "clientDomainName");
      uint64_t v35 = (void *)objc_claimAutoreleasedReturnValue();
      [v34 setSafeObject:v18 forKey:v35];

      if (v18) {
        goto LABEL_2;
      }
      __int16 v25 = 0LL;
      BOOL v36 = 0;
      id v28 = 0LL;
    }

    else
    {
      uint64_t v47 = (void *)[objc_alloc(NSString) initWithFormat:@"No current SHORT-TERM lock (by clientDomainName) | assetSetAtomicInstance:%@ | lockReason:%@", v14, v15];
      +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6110LL,  @"auto-set(_shortTermLockForAtomicInstance)",  0LL,  v47);
      id v28 = (id)objc_claimAutoreleasedReturnValue();

      id v18 = 0LL;
      __int16 v25 = 0LL;
      BOOL v36 = 0;
    }

    id v27 = 0LL;
    id v22 = 0LL;
    uint64_t v48 = a8;
    goto LABEL_47;
  }

- (id)_shortTermLockForAtomicInstance:(id)a3 locking:(BOOL)a4 withLockedFileDescriptor:(int)a5 forLockReason:(id)a6 justCreated:(BOOL *)a7 providingLockedSetStatus:(id *)a8 error:(id *)a9
{
  LOBYTE(v10) = 1;
  return -[MAAutoAssetSet _shortTermLockForAtomicInstance:locking:withLockedFileDescriptor:forLockReason:justCreated:providingLockedSetStatus:shouldVerifyContent:error:]( self,  "_shortTermLockForAtomicInstance:locking:withLockedFileDescriptor:forLockReason:justCreated:providingLockedSet Status:shouldVerifyContent:error:",  a3,  a4,  *(void *)&a5,  a6,  a7,  a8,  v10,  a9);
}

- (int)_shortTermOpenSharedLockFile:(id)a3 lockingAtomicInstance:(id)a4 forLockReason:(id)a5 verifyingLocalContentURLs:(BOOL)a6 openingFilename:(id)a7 providingLockedSetStatus:(id *)a8 sharedLockError:(id *)a9
{
  BOOL v89 = a6;
  uint64_t v13 = a9;
  uint64_t v105 = *MEMORY[0x1895F89C0];
  id v14 = a3;
  id v15 = (__CFString *)a4;
  id v16 = a5;
  uint64_t v17 = v15;
  id v18 = v16;
  id v19 = a7;
  id v20 = @"SYMLINK";
  if (v15) {
    id v20 = v15;
  }
  uint64_t v21 = v20;
  id v22 = v19;
  int v23 = open((const char *)[v22 UTF8String], 20);
  int v24 = v23;
  uint64_t v90 = v17;
  if (v23 < 0)
  {
    int v92 = v23;
    id v28 = a9;
    uint64_t v31 = *__error();
    id v32 = objc_alloc(NSString);
    id v33 = v21;
    id v34 = v18;
    __int16 v29 = v33;
    uint64_t v35 = [v32 initWithFormat:@"Unable to obtain shared lock (%@) | lockReason:%@ | atomicInstanceFilename:%@ | errno:%d", v33, v18, v22, v31];
    id v36 = v14;
    uint64_t v37 = (void *)v35;
    id v38 = v36;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6582LL);
    id v27 = (void *)objc_claimAutoreleasedReturnValue();

    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v39 = (void *)objc_claimAutoreleasedReturnValue();
    [v39 oslog];
    __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      uint64_t v87 = 0LL;
      uint64_t v88 = 0LL;
      id v14 = v38;
      id v18 = v34;
      goto LABEL_44;
    }

    *(_DWORD *)buf = 138544386;
    id v14 = v38;
    id v100 = v38;
    __int16 v101 = 2114;
    *(void *)v102 = v29;
    *(_WORD *)&v102[8] = 2114;
    id v18 = v34;
    uint64_t v21 = v29;
    *(void *)&v102[10] = v18;
    *(_WORD *)&v102[18] = 2114;
    *(void *)&v102[20] = v22;
    *(_WORD *)&v102[28] = 1024;
    *(_DWORD *)&v102[30] = v31;
    _os_log_error_impl( &dword_18718F000,  v25,  OS_LOG_TYPE_ERROR,  "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{%{public}@:_shortTermOpenSharedLockFile} (%{public}@) | lockReason:%{publi c}@ | unable to obtain shared lock | atomicInstanceFilename:%{public}@ | errno:%d",  buf,  0x30u);
    uint64_t v87 = 0LL;
    uint64_t v88 = 0LL;
LABEL_45:
    BOOL v45 = v89;
    int v46 = a8;

    __int16 v25 = 0LL;
    uint64_t v13 = v28;
    uint64_t v17 = v90;
    goto LABEL_46;
  }

  id v98 = 0LL;
  -[MAAutoAssetSet _readLockedSetStatusFromSharedLockFile:error:]( self,  "_readLockedSetStatusFromSharedLockFile:error:",  v22,  &v98);
  __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  id v26 = v98;
  if (v26)
  {
    id v27 = v26;
    id v28 = a9;
    __int16 v29 = v21;
    id v30 = v18;
    uint64_t v87 = 0LL;
    uint64_t v88 = 0LL;
    goto LABEL_37;
  }

  if (!v25)
  {
    id v85 = 0LL;
    uint64_t v61 = (void *)[objc_alloc(NSString) initWithFormat:@"Unable to read contents of shared lock (%@) | lockReason:%@ | atomicInstanceFilename:%@", v21, v18, v22];
    uint64_t v62 = 6582LL;
LABEL_34:
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v62,  v14,  0LL,  v61);
    id v27 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v87 = 0LL;
    uint64_t v88 = 0LL;
    int v46 = a8;
    goto LABEL_35;
  }

  [MEMORY[0x1896127A0] sharedLogger];
  id v86 = v14;
  id v40 = (void *)objc_claimAutoreleasedReturnValue();
  [v40 oslog];
  id v41 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  id v14 = v86;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138544386;
    id v100 = v86;
    __int16 v101 = 1024;
    *(_DWORD *)v102 = v24;
    *(_WORD *)&v102[4] = 2114;
    *(void *)&v102[6] = v21;
    *(_WORD *)&v102[14] = 2112;
    *(void *)&v102[16] = v18;
    *(_WORD *)&v102[24] = 2114;
    *(void *)&v102[26] = v22;
    _os_log_impl( &dword_18718F000,  v41,  OS_LOG_TYPE_DEFAULT,  "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{%{public}@:_shortTermOpenSharedLockFile}\n [SHORT_FILE_OPEN][%d] (%{public}@) | lockReason:%@ | successfully opened SHORT-TERM | atomicInstanceFilename:%{public}@ | ",  buf,  0x30u);
  }

  -[os_log_s latestDownloadedAtomicInstance](v25, "latestDownloadedAtomicInstance");
  id v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v42)
  {
    id v85 = v25;
    uint64_t v61 = (void *)[objc_alloc(NSString) initWithFormat:@"No latestDownloadedAtomicInstance in locked set-status from shared lock (%@) | lockReason:%@ | atomicInstanceFilename:%@", v21, v18, v22];
    uint64_t v62 = 6111LL;
    goto LABEL_34;
  }

  -[os_log_s latestDowloadedAtomicInstanceEntries](v25, "latestDowloadedAtomicInstanceEntries");
  id v43 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v44 = [v43 count];

  if (!v44)
  {
    id v85 = v25;
    uint64_t v61 = (void *)[objc_alloc(NSString) initWithFormat:@"Empty latestDowloadedAtomicInstanceEntries in locked set-status from shared lock (%@) | lockReason:%@ | atomicInstanceFilename:%@", v21, v18, v22];
    uint64_t v62 = 6110LL;
    id v14 = v86;
    goto LABEL_34;
  }

  int v92 = v24;
  BOOL v45 = v89;
  if (!v89)
  {
    uint64_t v87 = 0LL;
    uint64_t v88 = 0LL;
    id v27 = 0LL;
    id v14 = v86;
    int v46 = a8;
    goto LABEL_46;
  }

  [MEMORY[0x1896078A8] defaultManager];
  id v83 = (void *)objc_claimAutoreleasedReturnValue();
  __int128 v94 = 0u;
  __int128 v95 = 0u;
  __int128 v96 = 0u;
  __int128 v97 = 0u;
  -[os_log_s latestDowloadedAtomicInstanceEntries](v25, "latestDowloadedAtomicInstanceEntries");
  id obj = (id)objc_claimAutoreleasedReturnValue();
  int v46 = a8;
  uint64_t v81 = [obj countByEnumeratingWithState:&v94 objects:v104 count:16];
  if (!v81)
  {
    uint64_t v87 = 0LL;
    uint64_t v88 = 0LL;
    id v27 = 0LL;
    id v14 = v86;
    int v24 = v92;
    goto LABEL_66;
  }

  uint64_t v87 = 0LL;
  uint64_t v88 = 0LL;
  uint64_t v82 = *(void *)v95;
  int v24 = v92;
  id v79 = v18;
  while (2)
  {
    uint64_t v47 = 0LL;
    do
    {
      if (*(void *)v95 != v82) {
        objc_enumerationMutation(obj);
      }
      uint64_t v48 = *(void **)(*((void *)&v94 + 1) + 8 * v47);
      [v48 localContentURL];
      id v49 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v49)
      {
        id v73 = objc_alloc(NSString);
        [v48 summary];
        id v84 = (void *)objc_claimAutoreleasedReturnValue();
        id v18 = v79;
        uint64_t v57 = (void *)[v73 initWithFormat:@"AtomicEntry in locked set-status has nil localContentURL (%@) | lockReason:%@ | atomicInstanceFilename:%@ | nextAtomicEntry:%@", v21, v79, v22, v84];
        id v14 = v86;
        +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6108LL,  v86,  0LL,  v57);
        id v27 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_65;
      }

      [v48 localContentURL];
      id v50 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v51 = [v50 lastPathComponent];

      int v52 = [MEMORY[0x189612760] stringIsEqual:v51 to:@".AssetData"];
      id v84 = (void *)v51;
      if ((v52 & 1) == 0 && ([MEMORY[0x189612760] stringIsEqual:v51 to:@"AssetData"] & 1) == 0)
      {
        id v74 = objc_alloc(NSString);
        [v48 summary];
        uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();
        id v18 = v79;
        int v75 = (void *)[v74 initWithFormat:@"AtomicEntry in locked set-status that is neither standard nor secure asset (%@) | lockReason:%@ | atomicInstanceFilename:%@ | nextAtomicEntry:%@", v21, v79, v22, v57];
        +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6108LL,  v86,  0LL,  v75);
        id v27 = (void *)objc_claimAutoreleasedReturnValue();

        id v14 = v86;
LABEL_63:
        int v24 = v92;
LABEL_65:

        int v46 = a8;
        goto LABEL_66;
      }

      unint64_t v53 = v21;
      [v48 localContentURL];
      uint64_t v54 = (void *)objc_claimAutoreleasedReturnValue();
      [v54 URLByDeletingLastPathComponent];
      id v55 = (void *)objc_claimAutoreleasedReturnValue();
      [v55 URLByAppendingPathComponent:@"Info.plist"];
      uint64_t v56 = (void *)objc_claimAutoreleasedReturnValue();
      [v56 path];
      uint64_t v57 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v57 || ([v83 fileExistsAtPath:v57] & 1) == 0)
      {
        id v70 = objc_alloc(NSString);
        [v48 summary];
        id v71 = (void *)objc_claimAutoreleasedReturnValue();
        id v18 = v79;
        v72 = (void *)[v70 initWithFormat:@"AtomicEntry in locked set-status has localContentURL where Info.plist is missing (%@) | lockReason:%@ | atomicInstanceFilename:%@ | nextAtomicEntry:%@ | infoPlistPath:%@", v53, v79, v22, v71, v57];
        id v14 = v86;
        +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6108LL,  v86,  0LL,  v72);
        id v27 = (void *)objc_claimAutoreleasedReturnValue();

        uint64_t v21 = v53;
        goto LABEL_62;
      }

      if (v52)
      {
        [v48 localContentURL];
        uint64_t v58 = (void *)objc_claimAutoreleasedReturnValue();
        [v58 path];
        id v59 = (void *)objc_claimAutoreleasedReturnValue();
        [v59 stringByAppendingPathComponent:@"System/Library/CoreServices/RestoreVersion.plist"];
        uint64_t v60 = (void *)objc_claimAutoreleasedReturnValue();

        if ([v83 fileExistsAtPath:v60])
        {
          uint64_t v21 = v53;
          ++v87;

          goto LABEL_28;
        }

        id v76 = objc_alloc(NSString);
        [v48 summary];
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        id v18 = v79;
        v78 = (void *)[v76 initWithFormat:@"AtomicEntry in locked set-status for secure grafted/mounted auto-asset where required content is missing (%@) | lockReason:%@ | atomicInstanceFilename:%@ | nextAtomicEntry:%@ | secureGraftedReqiredFilename:%@", v53, v79, v22, v77, v60];
        +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6108LL,  v86,  0LL,  v78);
        id v27 = (void *)objc_claimAutoreleasedReturnValue();

        uint64_t v21 = v53;
        id v14 = v86;
LABEL_62:
        uint64_t v17 = v90;
        uint64_t v13 = a9;
        goto LABEL_63;
      }

      ++v88;
      uint64_t v21 = v53;
LABEL_28:

      ++v47;
      uint64_t v13 = a9;
      id v14 = v86;
      uint64_t v17 = v90;
      int v24 = v92;
    }

    while (v81 != v47);
    id v27 = 0LL;
    id v18 = v79;
    int v46 = a8;
    uint64_t v81 = [obj countByEnumeratingWithState:&v94 objects:v104 count:16];
    if (v81) {
      continue;
    }
    break;
  }

- (void)_shortTermLogResult:(id)a3 forLockReason:(id)a4 forAtomicInstance:(id)a5 atomicInstanceFilename:(id)a6 forShortTermLock:(id)a7 withSetStatus:(id)a8 returningError:(id)a9
{
  uint64_t v69 = *MEMORY[0x1895F89C0];
  id v54 = a3;
  id v15 = (__CFString *)a4;
  id v16 = (__CFString *)a5;
  uint64_t v17 = (__CFString *)a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  dispatch_assert_queue_V2((dispatch_queue_t)__maAutoAssetSetShortTermLockerDispatchQueue);
  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 oslog];
  id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    BOOL v27 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    if (v18)
    {
      if (v27)
      {
        uint64_t v28 = -[MAAutoAssetSet assetSetIdentifier](self, "assetSetIdentifier");
        __int16 v29 = @"N";
        if (v15) {
          id v30 = v15;
        }
        else {
          id v30 = @"N";
        }
        id v49 = v30;
        int v52 = (void *)v28;
        [v18 summary];
        uint64_t v31 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          [v19 summary];
          __int16 v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }

        *(_DWORD *)buf = 138544386;
        id v56 = v54;
        __int16 v57 = 2114;
        uint64_t v58 = v52;
        __int16 v59 = 2114;
        uint64_t v60 = v49;
        __int16 v61 = 2114;
        uint64_t v62 = v31;
        __int16 v63 = 2114;
        uint64_t v64 = v29;
        _os_log_impl( &dword_18718F000,  v22,  OS_LOG_TYPE_DEFAULT,  "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{%{public}@} %{public}@ SUCCESS | lockReason:%{public}@ | shortTermLock :%{public}@ | setStatus:%{public}@",  buf,  0x34u);
        if (v19) {
      }
        }

      goto LABEL_22;
    }

    if (!v27) {
      goto LABEL_53;
    }
    -[MAAutoAssetSet assetSetIdentifier](self, "assetSetIdentifier");
    unint64_t v53 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v35 = @"N";
    if (v15) {
      id v40 = v15;
    }
    else {
      id v40 = @"N";
    }
    if (v16) {
      id v41 = v16;
    }
    else {
      id v41 = @"N";
    }
    if (v17) {
      id v42 = v17;
    }
    else {
      id v42 = @"N";
    }
    if (v19)
    {
      id v43 = v42;
      uint64_t v44 = [v19 summary];
      id v42 = v43;
      uint64_t v35 = (__CFString *)v44;
    }

    *(_DWORD *)buf = 138544642;
    id v56 = v54;
    __int16 v57 = 2114;
    uint64_t v58 = v53;
    __int16 v59 = 2114;
    uint64_t v60 = v40;
    __int16 v61 = 2114;
    uint64_t v62 = v41;
    __int16 v63 = 2114;
    uint64_t v64 = (__CFString *)v42;
    __int16 v65 = 2114;
    v66 = v35;
    _os_log_impl( &dword_18718F000,  v22,  OS_LOG_TYPE_DEFAULT,  "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{%{public}@} %{public}@ SUCCESS | lockReason:%{public}@ | forAtomicInstance :%{public}@ | atomicInstanceFilename:%{public}@ | setStatus:%{public}@",  buf,  0x3Eu);
    if (!v19)
    {
LABEL_52:

      goto LABEL_53;
    }

- (id)_readLockedSetStatusFromSharedLockFile:(id)a3 error:(id *)a4
{
  uint64_t v50 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  p_vtable = &OBJC_METACLASS___MAAutoAssetSetProgress.vtable;
  dispatch_assert_queue_V2((dispatch_queue_t)__maAutoAssetSetShortTermLockerDispatchQueue);
  if (_readLockedSetStatusFromSharedLockFile_error__readSetStatusSetupDispatchOnce != -1) {
    dispatch_once( &_readLockedSetStatusFromSharedLockFile_error__readSetStatusSetupDispatchOnce,  &__block_literal_global_413);
  }
  id v7 = v5;
  uint64_t v8 = &OBJC_METACLASS___MAAutoAssetSetProgress.vtable;
  if (realpath_DARWIN_EXTSN((const char *)[v7 fileSystemRepresentation], v49))
  {
    [NSString stringWithUTF8String:v49];
    int v9 = (void *)objc_claimAutoreleasedReturnValue();
    __int128 v40 = 0u;
    __int128 v41 = 0u;
    __int128 v42 = 0u;
    __int128 v43 = 0u;
    id v10 = (id)_readLockedSetStatusFromSharedLockFile_error__recordArray;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v41;
LABEL_6:
      uint64_t v14 = 0LL;
      while (1)
      {
        if (*(void *)v41 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v40 + 1) + 8 * v14);
        [v15 lockerFileRealPath];
        id v16 = (void *)objc_claimAutoreleasedReturnValue();
        int v17 = [v16 isEqualToString:v9];

        if (v17) {
          break;
        }
        if (v12 == ++v14)
        {
          uint64_t v12 = [v10 countByEnumeratingWithState:&v40 objects:v48 count:16];
          if (v12) {
            goto LABEL_6;
          }
          goto LABEL_12;
        }
      }

      if ([v15 isCurrentlyValid])
      {
        [v15 setStatus];
        id v19 = (void *)objc_claimAutoreleasedReturnValue();

        id v18 = 0LL;
        id v20 = 0LL;
        uint64_t v21 = 0LL;
        id v22 = 0LL;
        goto LABEL_43;
      }

      id v18 = v15;
      [MEMORY[0x1896127A0] sharedLogger];
      __int16 v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 oslog];
      id v26 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v45 = v7;
        _os_log_impl( &dword_18718F000,  v26,  OS_LOG_TYPE_DEFAULT,  "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK] _readLockedSetStatusFromSharedLockFile: In memory record for lock file (%@) not valid. Discarding",  buf,  0xCu);
      }

      uint64_t v8 = &OBJC_METACLASS___MAAutoAssetSetProgress.vtable;
      p_vtable = &OBJC_METACLASS___MAAutoAssetSetProgress.vtable;
      if (v18) {
        [(id)_readLockedSetStatusFromSharedLockFile_error__recordArray removeObject:v18];
      }
    }

    else
    {
LABEL_12:

      id v18 = 0LL;
      uint64_t v8 = (void **)(&OBJC_METACLASS___MAAutoAssetSetProgress + 24);
      p_vtable = (void **)(&OBJC_METACLASS___MAAutoAssetSetProgress + 24);
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    BOOL v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 oslog];
    int v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v45 = v7;
      _os_log_impl( &dword_18718F000,  v24,  OS_LOG_TYPE_DEFAULT,  "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK] _readLockedSetStatusFromSharedLockFile: Failed to determine realpath for %@. Skipping caching",  buf,  0xCu);
    }

    int v9 = 0LL;
    id v18 = 0LL;
  }

  id v27 = objc_alloc(MEMORY[0x1896127B0]);
  char v28 = objc_opt_respondsToSelector();

  id v29 = objc_alloc(MEMORY[0x1896127B0]);
  id v30 = p_vtable[278];
  if ((v28 & 1) != 0) {
    uint64_t v31 = (void *)[v29 initWithDispatchQueue:v30 withPersistencePath:v7 forPolicyVersion:@"1.0" issuingDefaultLevelLogging:0];
  }
  else {
    uint64_t v31 = (void *)[v29 initWithDispatchQueue:v30 withPersistencePath:v7 forPolicyVersion:@"1.0"];
  }
  id v20 = v31;
  if (!v31)
  {
    uint64_t v34 = [objc_alloc(NSString) initWithFormat:@"Unable to create persisted-state for shared lock file | sharedLockFilename:%@", v7];
    goto LABEL_33;
  }

  if (![v31 loadPersistedState])
  {
    uint64_t v34 = [objc_alloc(NSString) initWithFormat:@"Unable to load persisted-state for shared lock file | sharedLockFilename:%@", v7];
    goto LABEL_33;
  }

  uint64_t v32 = [v20 secureCodedObjectForKey:@"sharedLockSetStatus" ofClass:objc_opt_class()];
  if (!v32)
  {
    uint64_t v34 = [objc_alloc(NSString) initWithFormat:@"Unable to read set-status from persisted-state for shared lock file | sharedLockFilename:%@", v7];
LABEL_33:
    uint64_t v35 = (void *)v34;
    +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6101LL,  @"auto-set(_readLockedSetStatusFromSharedLockFile)",  0LL,  v34);
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

    id v33 = 0LL;
    if (!a4) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }

  id v33 = (void *)v32;
  uint64_t v21 = 0LL;
  if (a4) {
LABEL_34:
  }
    *a4 = v21;
LABEL_35:
  if (v33 && v9)
  {
    id v36 = -[MAAutoAssetSetShortTermLockInMemoryRecord initWithPathAndSetStatus:setStatus:]( objc_alloc(&OBJC_CLASS___MAAutoAssetSetShortTermLockInMemoryRecord),  "initWithPathAndSetStatus:setStatus:",  v9,  v33);
    [v8[268] addObject:v36];
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v37 = (void *)objc_claimAutoreleasedReturnValue();
    [v37 oslog];
    id v38 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v45 = v7;
      __int16 v46 = 2112;
      uint64_t v47 = v9;
      _os_log_impl( &dword_18718F000,  v38,  OS_LOG_TYPE_DEFAULT,  "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK] _readLockedSetStatusFromSharedLockFile: Updating in memory record for lo ckerFile:'%@' realPath:'%@'",  buf,  0x16u);
    }
  }

  id v22 = v33;
  id v19 = v22;
LABEL_43:

  return v19;
}

void __63__MAAutoAssetSet__readLockedSetStatusFromSharedLockFile_error___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x189603FA8]);
  uint64_t v1 = (void *)_readLockedSetStatusFromSharedLockFile_error__recordArray;
  _readLockedSetStatusFromSharedLockFile_error__recordArray = (uint64_t)v0;
}

- (void)_closeAndRemoveShortTermLock:(id)a3 forShortTermLock:(id)a4
{
  *(void *)&v33[13] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)__maAutoAssetSetShortTermLockerDispatchQueue);
  int v8 = [v7 lockedFileDescriptor];
  if (([v7 lockedFileDescriptor] & 0x80000000) == 0)
  {
    int v9 = close([v7 lockedFileDescriptor]);
    [v7 setLockedFileDescriptor:0xFFFFFFFFLL];
    if (v9)
    {
      int v10 = *__error();
      [MEMORY[0x1896127A0] sharedLogger];
      uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
      [v11 oslog];
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        [v7 assetSetAtomicInstance];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 summary];
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        int v26 = 138544386;
        id v27 = v6;
        __int16 v28 = 1024;
        int v29 = v8;
        __int16 v30 = 2114;
        uint64_t v31 = v13;
        __int16 v32 = 1024;
        *(_DWORD *)id v33 = v10;
        v33[2] = 2114;
        *(void *)&v33[3] = v14;
        _os_log_error_impl( &dword_18718F000,  v12,  OS_LOG_TYPE_ERROR,  "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{%{public}@:_closeAndRemoveShortTermLock}\n [SHORT_FILE_CLOSE][%d] (%{public}@) | WARNING | failed close of shared lock file | errno:%d | shortTermLock:%{public}@",  (uint8_t *)&v26,  0x2Cu);
LABEL_9:
      }
    }

    else
    {
      [MEMORY[0x1896127A0] sharedLogger];
      int v17 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 oslog];
      uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        [v7 assetSetAtomicInstance];
        uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
        [v7 summary];
        uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
        int v26 = 138544130;
        id v27 = v6;
        __int16 v28 = 1024;
        int v29 = v8;
        __int16 v30 = 2114;
        uint64_t v31 = v13;
        __int16 v32 = 2114;
        *(void *)id v33 = v14;
        _os_log_impl( &dword_18718F000,  v12,  OS_LOG_TYPE_DEFAULT,  "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{%{public}@:_closeAndRemoveShortTermLock}\n [SHORT_FILE_CLOSE][%d] (%{public}@) | released shared lock | shortTermLock:%{public}@",  (uint8_t *)&v26,  0x26u);
        goto LABEL_9;
      }
    }

    id v18 = (void *)__maAutoAssetSetSharedProcessByClientDomainName;
    -[MAAutoAssetSet clientDomainName](self, "clientDomainName");
    id v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v18 safeObjectForKey:v19 ofClass:objc_opt_class()];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      -[MAAutoAssetSet assetSetIdentifier](self, "assetSetIdentifier");
      id v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v16 safeObjectForKey:v20 ofClass:objc_opt_class()];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        id v22 = objc_alloc_init(MEMORY[0x189603FC8]);
        [v7 setLockCountByReason:v22];

        [v7 setTotalLockCount:0];
        [v7 assetSetAtomicInstance];
        BOOL v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        [v21 removeObjectForKey:v23];
      }

      else
      {
        [MEMORY[0x1896127A0] sharedLogger];
        __int16 v25 = (void *)objc_claimAutoreleasedReturnValue();
        [v25 oslog];
        BOOL v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          -[MAAutoAssetSet _closeAndRemoveShortTermLock:forShortTermLock:].cold.3((uint64_t)v6, v7, v23);
        }
      }
    }

    else
    {
      [MEMORY[0x1896127A0] sharedLogger];
      int v24 = (void *)objc_claimAutoreleasedReturnValue();
      [v24 oslog];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR)) {
        -[MAAutoAssetSet _closeAndRemoveShortTermLock:forShortTermLock:].cold.2((uint64_t)v6, v7, (os_log_s *)v21);
      }
    }

    goto LABEL_19;
  }

  [MEMORY[0x1896127A0] sharedLogger];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 oslog];
  id v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_ERROR)) {
    -[MAAutoAssetSet _closeAndRemoveShortTermLock:forShortTermLock:].cold.1((uint64_t)v6, v7, (os_log_s *)v16);
  }
LABEL_19:
}

- (id)summary
{
  id v3 = objc_alloc(NSString);
  -[MAAutoAssetSet autoAssetSetClientName](self, "autoAssetSetClientName");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAAutoAssetSet assetSetIdentifier](self, "assetSetIdentifier");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MAAutoAssetSet shortTermLocker](self, "shortTermLocker")) {
    id v6 = @"Y";
  }
  else {
    id v6 = @"N";
  }
  -[MAAutoAssetSet autoAssetEntries](self, "autoAssetEntries");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    id v8 = objc_alloc(NSString);
    -[MAAutoAssetSet autoAssetEntries](self, "autoAssetEntries");
    int v9 = (void *)objc_claimAutoreleasedReturnValue();
    int v10 = (void *)objc_msgSend(v8, "initWithFormat:", @"%ld", objc_msgSend(v9, "count"));
    uint64_t v11 = (void *)[v3 initWithFormat:@"autoAssetSetClientName:%@|assetSetIdentifier:%@|shortTermLocker:%@|autoAssetEntries:%@", v4, v5, v6, v10];
  }

  else
  {
    uint64_t v11 = (void *)[v3 initWithFormat:@"autoAssetSetClientName:%@|assetSetIdentifier:%@|shortTermLocker:%@|autoAssetEntries:%@", v4, v5, v6, @"N"];
  }

  return v11;
}

+ (void)endAtomicLocks:(id)a3 usingClientDomain:(id)a4 forClientName:(id)a5 forAssetSetIdentifier:(id)a6 ofAtomicInstance:(id)a7 removingLockCount:(int64_t)a8 completion:(id)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  if (v19)
  {
    id v27 = v14;
    id v20 = objc_alloc(&OBJC_CLASS___MAAutoAssetSet);
    +[MAAutoAssetSet defaultDispatchQueue](&OBJC_CLASS___MAAutoAssetSet, "defaultDispatchQueue");
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    id v34 = 0LL;
    id v22 = -[MAAutoAssetSet initUsingClientDomain:forClientName:forAssetSetIdentifier:comprisedOfEntries:usingDesiredPolicyCategory:completingFromQueue:error:]( v20,  "initUsingClientDomain:forClientName:forAssetSetIdentifier:comprisedOfEntries:usingDesiredPolicyCategory:comp letingFromQueue:error:",  v15,  v16,  v17,  0LL,  0LL,  v21,  &v34);
    id v23 = v34;

    if (v23)
    {
      +[MAAutoAssetSet defaultDispatchQueue](&OBJC_CLASS___MAAutoAssetSet, "defaultDispatchQueue");
      int v24 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __133__MAAutoAssetSet_endAtomicLocks_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount_completion___block_invoke_2;
      block[3] = &unk_189FFAE08;
      __int16 v25 = &v31;
      id v31 = v19;
      id v29 = v17;
      id v30 = v23;
      dispatch_async(v24, block);
    }

    else
    {
      v32[0] = MEMORY[0x1895F87A8];
      v32[1] = 3221225472LL;
      v32[2] = __133__MAAutoAssetSet_endAtomicLocks_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount_completion___block_invoke;
      v32[3] = &unk_189FFB860;
      __int16 v25 = &v33;
      id v33 = v19;
      [v22 _endAtomicLocks:v27 usingClientDomain:v15 forClientName:v16 forAssetSetIdentifier:v17 ofAtomicInstance:v18 removingLockCount:a8 completion:v32];
    }

    id v14 = v27;
  }

  else
  {
    +[MAAutoAssetSet frameworkInstanceSetLogDomain](&OBJC_CLASS___MAAutoAssetSet, "frameworkInstanceSetLogDomain");
    [MEMORY[0x1896127A0] sharedLogger];
    int v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v26 oslog];
    id v23 = (id)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAssetSet endAtomicLocks:usingClientDomain:forClientName:forAssetSetIdentifier:ofAtomicInstance:removingLockCount:completion:].cold.1();
    }
  }
}

uint64_t __133__MAAutoAssetSet_endAtomicLocks_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount_completion___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __133__MAAutoAssetSet_endAtomicLocks_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount_completion___block_invoke_2( void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

- (void)_endAtomicLocks:(id)a3 usingClientDomain:(id)a4 forClientName:(id)a5 forAssetSetIdentifier:(id)a6 ofAtomicInstance:(id)a7 removingLockCount:(int64_t)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  if (v20)
  {
    if (!v15 && a8 != -1)
    {
      uint64_t v21 = @"endLockReason is nil but endLockCount is not MA_END_ATOMIC_LOCKS_COUNT_ALL";
LABEL_13:
      -[MAAutoAssetSet _failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:]( self,  "_failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:",  @"endAtomicLocks",  v18,  6108LL,  0LL,  v21,  v20);
      goto LABEL_15;
    }

    if ([v19 isEqualToString:@"ALL_INSTANCES"])
    {
      if (a8 != -1)
      {
        uint64_t v21 = @"MA_END_ATOMIC_LOCKS_ALL_INSTANCES is specified but endLockCount is not MA_END_ATOMIC_LOCKS_COUNT_ALL";
        goto LABEL_13;
      }

      if (v15)
      {
        uint64_t v21 = @"MA_END_ATOMIC_LOCKS_ALL_INSTANCES is specified but endLockReason is not nil";
        goto LABEL_13;
      }
    }

    v24[0] = MEMORY[0x1895F87A8];
    v24[1] = 3221225472LL;
    v24[2] = __134__MAAutoAssetSet__endAtomicLocks_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount_completion___block_invoke;
    void v24[3] = &unk_189FFB888;
    id v25 = v16;
    id v26 = v17;
    id v27 = v18;
    id v28 = v19;
    int64_t v32 = a8;
    id v29 = v15;
    id v30 = self;
    id v31 = v20;
    -[MAAutoAssetSet connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v24);

    goto LABEL_15;
  }

  [MEMORY[0x1896127A0] sharedLogger];
  id v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 oslog];
  id v23 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    -[MAAutoAssetSet _endAtomicLocks:usingClientDomain:forClientName:forAssetSetIdentifier:ofAtomicInstance:removingLockCount:completion:].cold.1();
  }

LABEL_15:
}

void __134__MAAutoAssetSet__endAtomicLocks_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount_completion___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 72) _failedOperation:@"endAtomicLocks" forAssetSetIdentifier:*(void *)(a1 + 48) withErrorCode:0 withResponseError:a2 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 80)];
  }

  else
  {
    id v3 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoInstance);
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = __maAutoAssetSetSharedClientProcessName;
    uint64_t v7 = __maAutoAssetSetSharedClientProcessID;
    uint64_t v8 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    +[MAAutoAssetSet frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSet, "frameworkInstanceUUID");
    int v10 = (void *)objc_claimAutoreleasedReturnValue();
    id v11 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:]( v3,  "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:co mprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:",  v4,  v5,  v6,  v7,  v8,  v9,  0LL,  0LL,  v10);

    id v12 = -[MAAutoAssetSetInfoDesire initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:]( objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoDesire),  "initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTime out:desiringProgress:",  0LL,  *(void *)(a1 + 64),  0LL,  -101LL,  -101LL,  0LL);
    uint64_t v13 = -[MAAutoAssetSetInfoEnd initWithLockReason:endingLockCount:]( objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoEnd),  "initWithLockReason:endingLockCount:",  *(void *)(a1 + 64),  *(void *)(a1 + 88));
    id v14 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAssetSet frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSet, "frameworkInstanceUUID");
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 UUIDString];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();

    [v14 setSafeObject:v11 forKey:@"setInstance"];
    [v14 setSafeObject:v12 forKey:@"setDesire"];
    [v14 setSafeObject:v13 forKey:@"setEnd"];
    id v17 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-SET:END_ATOMIC_LOCKS_FOR_CLIENT" clientID:v16 version:0 message:v14];
    id v18 = (void *)__maAutoAssetSetSharedConnectionClient;
    v19[0] = MEMORY[0x1895F87A8];
    v19[1] = 3221225472LL;
    v19[2] = __134__MAAutoAssetSet__endAtomicLocks_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount_completion___block_invoke_2;
    v19[3] = &unk_189FFACA0;
    v19[4] = *(void *)(a1 + 72);
    id v20 = *(id *)(a1 + 48);
    id v21 = *(id *)(a1 + 80);
    [v18 connectClientSendServerMessage:v17 proxyObject:0 withReply:v19];
  }

void __134__MAAutoAssetSet__endAtomicLocks_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount_completion___block_invoke_2( void *a1,  void *a2,  void *a3)
{
  id v11 = a2;
  id v5 = a3;
  uint64_t v6 = (void *)a1[4];
  uint64_t v7 = a1[5];
  if (!v11 || v5)
  {
    if (v5)
    {
      uint64_t v8 = @"failure reported by server";
      uint64_t v9 = 0LL;
      id v10 = v5;
    }

    else
    {
      uint64_t v8 = @"no response message from server";
      uint64_t v9 = 6104LL;
      id v10 = 0LL;
    }

    [v6 _failedOperation:@"endAtomicLocks" forAssetSetIdentifier:v7 withErrorCode:v9 withResponseError:v10 description:v8 completion:a1[6]];
  }

  else
  {
    [v6 _successOperation:@"endAtomicLocks" forAssetSetIdentifier:v7 completion:a1[6]];
  }
}

+ (id)endAtomicLocksSync:(id)a3 usingClientDomain:(id)a4 forClientName:(id)a5 forAssetSetIdentifier:(id)a6 ofAtomicInstance:(id)a7 removingLockCount:(int64_t)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = objc_alloc(&OBJC_CLASS___MAAutoAssetSet);
  +[MAAutoAssetSet defaultDispatchQueue](&OBJC_CLASS___MAAutoAssetSet, "defaultDispatchQueue");
  id v19 = (void *)objc_claimAutoreleasedReturnValue();
  id v23 = 0LL;
  id v20 = -[MAAutoAssetSet initUsingClientDomain:forClientName:forAssetSetIdentifier:comprisedOfEntries:usingDesiredPolicyCategory:completingFromQueue:error:]( v18,  "initUsingClientDomain:forClientName:forAssetSetIdentifier:comprisedOfEntries:usingDesiredPolicyCategory:comple tingFromQueue:error:",  v14,  v15,  v16,  0LL,  0LL,  v19,  &v23);
  id v21 = v23;

  if (!v21)
  {
    [v20 _endAtomicLocksSync:v13 usingClientDomain:v14 forClientName:v15 forAssetSetIdentifier:v16 ofAtomicInstance:v17 removingLockCount:a8];
    id v21 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v21;
}

- (id)_endAtomicLocksSync:(id)a3 usingClientDomain:(id)a4 forClientName:(id)a5 forAssetSetIdentifier:(id)a6 ofAtomicInstance:(id)a7 removingLockCount:(int64_t)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  uint64_t v35 = 0LL;
  id v36 = &v35;
  uint64_t v37 = 0x3032000000LL;
  id v38 = __Block_byref_object_copy__8;
  uint64_t v39 = __Block_byref_object_dispose__8;
  id v40 = 0LL;
  v33[0] = 0LL;
  v33[1] = v33;
  v33[2] = 0x2020000000LL;
  char v34 = 0;
  v31[0] = 0LL;
  v31[1] = v31;
  v31[2] = 0x2020000000LL;
  char v32 = 0;
  dispatch_semaphore_t v18 = dispatch_semaphore_create(0LL);
  uint64_t v19 = MEMORY[0x1895F87A8];
  v26[0] = MEMORY[0x1895F87A8];
  v26[1] = 3221225472LL;
  v26[2] = __127__MAAutoAssetSet__endAtomicLocksSync_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount___block_invoke;
  void v26[3] = &unk_189FFB778;
  id v28 = v31;
  id v29 = &v35;
  id v30 = v33;
  id v20 = v18;
  id v27 = v20;
  -[MAAutoAssetSet _endAtomicLocks:usingClientDomain:forClientName:forAssetSetIdentifier:ofAtomicInstance:removingLockCount:completion:]( self,  "_endAtomicLocks:usingClientDomain:forClientName:forAssetSetIdentifier:ofAtomicInstance:removingLockCount:completion:",  v13,  v14,  v15,  v16,  v17,  a8,  v26);
  if (+[MAAutoAssetSet waitOnSemaphore:withDaemonTriggeredTimeout:]( &OBJC_CLASS___MAAutoAssetSet,  "waitOnSemaphore:withDaemonTriggeredTimeout:",  v20,  -100LL))
  {
    +[MAAutoAssetSet frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSet, "frameworkDispatchQueue");
    id v21 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v19;
    block[1] = 3221225472LL;
    block[2] = __127__MAAutoAssetSet__endAtomicLocksSync_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount___block_invoke_3;
    block[3] = &unk_189FF94B0;
    void block[4] = v33;
    void block[5] = v31;
    block[6] = &v35;
    dispatch_sync(v21, block);
  }

  id v22 = (id)v36[5];

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v33, 8);
  _Block_object_dispose(&v35, 8);

  return v22;
}

void __127__MAAutoAssetSet__endAtomicLocksSync_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v4 = a3;
  +[MAAutoAssetSet frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSet, "frameworkDispatchQueue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)uint64_t v7 = *(_OWORD *)(a1 + 32);
  __int128 v11 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __127__MAAutoAssetSet__endAtomicLocksSync_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount___block_invoke_2;
  block[3] = &unk_189FFAEA8;
  id v9 = v4;
  id v6 = v7[0];
  __int128 v10 = *(_OWORD *)v7;
  v7[0] = v4;
  dispatch_sync(v5, block);
}

uint64_t __127__MAAutoAssetSet__endAtomicLocksSync_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount___block_invoke_2( uint64_t result)
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

void __127__MAAutoAssetSet__endAtomicLocksSync_usingClientDomain_forClientName_forAssetSetIdentifier_ofAtomicInstance_removingLockCount___block_invoke_3( void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto-set(endAtomicLocks)",  0LL,  @"timeout (at framework layer) while waiting for end-atomic-locks to complete");
    uint64_t v3 = *(void *)(a1[6] + 8LL);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }

+ (void)eliminateAtomic:(id)a3 usingClientDomain:(id)a4 forAssetSetIdentifier:(id)a5 completion:(id)a6
{
}

+ (void)eliminateAtomic:(id)a3 usingClientDomain:(id)a4 forAssetSetIdentifier:(id)a5 awaitingUnlocked:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (v14)
  {
    id v15 = objc_alloc(&OBJC_CLASS___MAAutoAssetSet);
    +[MAAutoAssetSet defaultDispatchQueue](&OBJC_CLASS___MAAutoAssetSet, "defaultDispatchQueue");
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    id v28 = 0LL;
    id v17 = -[MAAutoAssetSet initUsingClientDomain:forClientName:forAssetSetIdentifier:comprisedOfEntries:usingDesiredPolicyCategory:completingFromQueue:error:]( v15,  "initUsingClientDomain:forClientName:forAssetSetIdentifier:comprisedOfEntries:usingDesiredPolicyCategory:comp letingFromQueue:error:",  v12,  @"ALL_CLIENTS",  v13,  0LL,  0LL,  v16,  &v28);
    id v18 = v28;

    if (v18)
    {
      +[MAAutoAssetSet defaultDispatchQueue](&OBJC_CLASS___MAAutoAssetSet, "defaultDispatchQueue");
      uint64_t v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __102__MAAutoAssetSet_eliminateAtomic_usingClientDomain_forAssetSetIdentifier_awaitingUnlocked_completion___block_invoke_2;
      block[3] = &unk_189FFAE08;
      id v20 = &v25;
      id v25 = v14;
      id v23 = v13;
      id v24 = v18;
      dispatch_async(v19, block);
    }

    else
    {
      v26[0] = MEMORY[0x1895F87A8];
      v26[1] = 3221225472LL;
      v26[2] = __102__MAAutoAssetSet_eliminateAtomic_usingClientDomain_forAssetSetIdentifier_awaitingUnlocked_completion___block_invoke;
      void v26[3] = &unk_189FFB860;
      id v20 = &v27;
      id v27 = v14;
      [v17 _eliminateAtomic:v11 awaitingUnlocked:v8 completion:v26];
    }
  }

  else
  {
    +[MAAutoAssetSet frameworkInstanceSetLogDomain](&OBJC_CLASS___MAAutoAssetSet, "frameworkInstanceSetLogDomain");
    [MEMORY[0x1896127A0] sharedLogger];
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 oslog];
    id v18 = (id)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled((os_log_t)v18, OS_LOG_TYPE_ERROR)) {
      +[MAAutoAssetSet eliminateAtomic:usingClientDomain:forAssetSetIdentifier:awaitingUnlocked:completion:].cold.1();
    }
  }
}

uint64_t __102__MAAutoAssetSet_eliminateAtomic_usingClientDomain_forAssetSetIdentifier_awaitingUnlocked_completion___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __102__MAAutoAssetSet_eliminateAtomic_usingClientDomain_forAssetSetIdentifier_awaitingUnlocked_completion___block_invoke_2( void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16LL))(a1[6], a1[4], a1[5]);
}

- (void)_eliminateAtomic:(id)a3 awaitingUnlocked:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    id v12[2] = __63__MAAutoAssetSet__eliminateAtomic_awaitingUnlocked_completion___block_invoke;
    v12[3] = &unk_189FF9500;
    v12[4] = self;
    id v13 = v8;
    BOOL v15 = a4;
    id v14 = v9;
    -[MAAutoAssetSet connectToServerFrameworkCompletion:](self, "connectToServerFrameworkCompletion:", v12);
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    __int128 v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 oslog];
    id v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet _eliminateAtomic:awaitingUnlocked:completion:].cold.1();
    }
  }
}

void __63__MAAutoAssetSet__eliminateAtomic_awaitingUnlocked_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    [v4 assetSetIdentifier];
    id v5 = (void *)objc_claimAutoreleasedReturnValue();
    [v4 _failedOperation:@"eliminateAtomic" forAssetSetIdentifier:v5 withErrorCode:0 withResponseError:v3 description:@"unable to connect to the auto-asset XPC service" completion:*(void *)(a1 + 48)];
  }

  else
  {
    id v6 = objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoInstance);
    [*(id *)(a1 + 32) clientDomainName];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) autoAssetSetClientName];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = __maAutoAssetSetSharedClientProcessName;
    uint64_t v10 = __maAutoAssetSetSharedClientProcessID;
    [*(id *)(a1 + 32) assetSetIdentifier];
    id v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[MAAutoAssetSet frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSet, "frameworkInstanceUUID");
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    id v13 = -[MAAutoAssetSetInfoInstance initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:comprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:]( v6,  "initUsingClientDomain:forClientName:withProcessName:withProcessID:forAssetSetIdentifier:forAtomicInstance:co mprisedOfEntries:asEntriesWhenTargeting:associatingFrameworkUUID:",  v7,  v8,  v9,  v10,  v11,  0LL,  0LL,  0LL,  v12);

    id v14 = -[MAAutoAssetSetInfoDesire initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTimeout:desiringProgress:]( objc_alloc(&OBJC_CLASS___MAAutoAssetSetInfoDesire),  "initForClientAssetSetPolicy:reasonDesired:awaitingDownloadOfDiscovered:withCheckWaitTimeout:withLockWaitTime out:desiringProgress:",  0LL,  *(void *)(a1 + 40),  *(unsigned __int8 *)(a1 + 56),  -101LL,  -101LL,  0LL);
    id v15 = objc_alloc_init(MEMORY[0x189603FC8]);
    +[MAAutoAssetSet frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSet, "frameworkInstanceUUID");
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 UUIDString];
    id v17 = (void *)objc_claimAutoreleasedReturnValue();

    [v15 setSafeObject:v13 forKey:@"setInstance"];
    [v15 setSafeObject:v14 forKey:@"setDesire"];
    id v18 = (void *)[objc_alloc(MEMORY[0x189612758]) initWithType:1 messageName:@"MA-AUTO-SET:ELIMINATE_ATOMIC" clientID:v17 version:0 message:v15];
    uint64_t v19 = (void *)__maAutoAssetSetSharedConnectionClient;
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = __63__MAAutoAssetSet__eliminateAtomic_awaitingUnlocked_completion___block_invoke_2;
    void v20[3] = &unk_189FF94D8;
    void v20[4] = *(void *)(a1 + 32);
    id v21 = *(id *)(a1 + 48);
    [v19 connectClientSendServerMessage:v18 proxyObject:0 withReply:v20];
  }
}

void __63__MAAutoAssetSet__eliminateAtomic_awaitingUnlocked_completion___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v13 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  [v6 assetSetIdentifier];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13 || v5)
  {
    if (v5)
    {
      id v8 = @"failure reported by server";
      uint64_t v9 = v6;
      uint64_t v10 = v7;
      uint64_t v11 = 0LL;
      id v12 = v5;
    }

    else
    {
      id v8 = @"no response message from server";
      uint64_t v9 = v6;
      uint64_t v10 = v7;
      uint64_t v11 = 6104LL;
      id v12 = 0LL;
    }

    [v9 _failedOperation:@"eliminateAtomic" forAssetSetIdentifier:v10 withErrorCode:v11 withResponseError:v12 description:v8 completion:*(void *)(a1 + 40)];
  }

  else
  {
    [v6 _successOperation:@"eliminateAtomic" forAssetSetIdentifier:v7 completion:*(void *)(a1 + 40)];
  }
}

+ (id)eliminateAtomicSync:(id)a3 usingClientDomain:(id)a4 forAssetSetIdentifier:(id)a5
{
  return (id)[a1 eliminateAtomicSync:a3 usingClientDomain:a4 forAssetSetIdentifier:a5 awaitingUnlocked:0];
}

+ (id)eliminateAtomicSync:(id)a3 usingClientDomain:(id)a4 forAssetSetIdentifier:(id)a5 awaitingUnlocked:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a3;
  id v10 = a5;
  id v11 = a4;
  id v12 = objc_alloc(&OBJC_CLASS___MAAutoAssetSet);
  +[MAAutoAssetSet defaultDispatchQueue](&OBJC_CLASS___MAAutoAssetSet, "defaultDispatchQueue");
  id v13 = (void *)objc_claimAutoreleasedReturnValue();
  id v17 = 0LL;
  id v14 = -[MAAutoAssetSet initUsingClientDomain:forClientName:forAssetSetIdentifier:comprisedOfEntries:usingDesiredPolicyCategory:completingFromQueue:error:]( v12,  "initUsingClientDomain:forClientName:forAssetSetIdentifier:comprisedOfEntries:usingDesiredPolicyCategory:comple tingFromQueue:error:",  v11,  @"ALL_CLIENTS",  v10,  0LL,  0LL,  v13,  &v17);

  id v15 = v17;
  if (!v15)
  {
    [v14 _eliminateAtomicSync:v9 awaitingUnlocked:v6];
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)_eliminateAtomicSync:(id)a3 awaitingUnlocked:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v23 = 0LL;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000LL;
  id v26 = __Block_byref_object_copy__8;
  id v27 = __Block_byref_object_dispose__8;
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
  v14[2] = __56__MAAutoAssetSet__eliminateAtomicSync_awaitingUnlocked___block_invoke;
  v14[3] = &unk_189FFB778;
  id v16 = v19;
  id v17 = &v23;
  id v18 = v21;
  id v9 = v7;
  id v15 = v9;
  -[MAAutoAssetSet _eliminateAtomic:awaitingUnlocked:completion:]( self,  "_eliminateAtomic:awaitingUnlocked:completion:",  v6,  v4,  v14);
  if (+[MAAutoAssetSet waitOnSemaphore:withDaemonTriggeredTimeout:]( &OBJC_CLASS___MAAutoAssetSet,  "waitOnSemaphore:withDaemonTriggeredTimeout:",  v9,  -100LL))
  {
    +[MAAutoAssetSet frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSet, "frameworkDispatchQueue");
    id v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v8;
    block[1] = 3221225472LL;
    block[2] = __56__MAAutoAssetSet__eliminateAtomicSync_awaitingUnlocked___block_invoke_3;
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

void __56__MAAutoAssetSet__eliminateAtomicSync_awaitingUnlocked___block_invoke( uint64_t a1,  uint64_t a2,  void *a3)
{
  id v4 = a3;
  +[MAAutoAssetSet frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSet, "frameworkDispatchQueue");
  id v5 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[1] = 3221225472LL;
  *(_OWORD *)dispatch_semaphore_t v7 = *(_OWORD *)(a1 + 32);
  __int128 v11 = *(_OWORD *)(a1 + 48);
  block[0] = MEMORY[0x1895F87A8];
  block[2] = __56__MAAutoAssetSet__eliminateAtomicSync_awaitingUnlocked___block_invoke_2;
  block[3] = &unk_189FFAEA8;
  id v9 = v4;
  id v6 = v7[0];
  __int128 v10 = *(_OWORD *)v7;
  v7[0] = v4;
  dispatch_sync(v5, block);
}

uint64_t __56__MAAutoAssetSet__eliminateAtomicSync_awaitingUnlocked___block_invoke_2(uint64_t result)
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

void __56__MAAutoAssetSet__eliminateAtomicSync_awaitingUnlocked___block_invoke_3(void *a1)
{
  if (!*(_BYTE *)(*(void *)(a1[4] + 8LL) + 24LL))
  {
    *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = 1;
    uint64_t v2 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6105LL,  @"auto-set(eliminateAtomicSync)",  0LL,  @"timeout (at framework layer) while waiting for eliminate-atomic to complete");
    uint64_t v3 = *(void *)(a1[6] + 8LL);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }

- (void)connectToServerFrameworkCompletion:(id)a3
{
  id v4 = (void (**)(id, void))a3;
  uint64_t v6 = 0LL;
  dispatch_semaphore_t v7 = &v6;
  uint64_t v8 = 0x3032000000LL;
  id v9 = __Block_byref_object_copy__8;
  __int128 v10 = __Block_byref_object_dispose__8;
  id v11 = 0LL;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __53__MAAutoAssetSet_connectToServerFrameworkCompletion___block_invoke;
  v5[3] = &unk_189FFAD68;
  v5[4] = self;
  v5[5] = &v6;
  if (__maAutoAssetSetSharedDispatchOnce != -1) {
    dispatch_once(&__maAutoAssetSetSharedDispatchOnce, v5);
  }
  v4[2](v4, v7[5]);
  _Block_object_dispose(&v6, 8);
}

void __53__MAAutoAssetSet_connectToServerFrameworkCompletion___block_invoke(uint64_t a1)
{
  v32[1] = *MEMORY[0x1895F89C0];
  +[MAAutoAssetSet frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSet, "frameworkInstanceUUID");
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 UUIDString];
  id v30 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v2 = (void *)MEMORY[0x189604010];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  id v12 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = objc_msgSend(objc_alloc(NSString), "initWithFormat:", @"%s", getprogname());
  id v14 = (void *)__maAutoAssetSetSharedClientProcessName;
  __maAutoAssetSetSharedClientProcessName = v13;

  __maAutoAssetSetSharedClientProcessID = getpid();
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET:ALTER_ENTRIES_REPRESENTING_ATOMIC"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET:NEED_FOR_ATOMIC"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET:CHECK_ATOMIC"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET:LOCK_ATOMIC"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET:MAP_LOCKED_ATOMIC_ENTRY"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET:FORM_SUB_ATOMIC"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET:CONTINUE_ATOMIC_LOCK"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET:END_ATOMIC_LOCK"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET:END_ATOMIC_LOCKS_FOR_CLIENT"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET:ASSET_SET_FOR_STAGING"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET:CURRENT_SET_STATUS"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET:ELIMINATE_ATOMIC"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET(REPLY):ALTER_ENTRIES_REPRESENTING_ATOMIC"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET(REPLY):NEED_FOR_ATOMIC"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET(REPLY):CHECK_ATOMIC"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET(REPLY):LOCK_ATOMIC"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET(REPLY):MAP_LOCKED_ATOMIC_ENTRY"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET(REPLY):FORM_SUB_ATOMIC"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET(REPLY):CONTINUE_ATOMIC_LOCK"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET(REPLY):END_ATOMIC_LOCK"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET(REPLY):END_ATOMIC_LOCKS_FOR_CLIENT"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET(REPLY):ASSET_SET_FOR_STAGING"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET(REPLY):CURRENT_SET_STATUS"];
  [MEMORY[0x189612748] setAllowlistedClasses:v12 forKey:@"MA-AUTO-SET(REPLY):ELIMINATE_ATOMIC"];
  [MEMORY[0x1896127A0] sharedLogger];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 oslog];
  id v16 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( &dword_18718F000,  v16,  OS_LOG_TYPE_DEFAULT,  "MA-auto-set{connectToServerFrameworkCompletion} set all the allowlisted classes for the client policy for all delegate callbacks",  buf,  2u);
  }

  id v17 = (void *)[objc_alloc(MEMORY[0x189612748]) initForServiceName:@"com.apple.mobileasset.autoasset" delegate:*(void *)(a1 + 32) clientID:v30];
  id v18 = (void *)MEMORY[0x189604010];
  v32[0] = objc_opt_class();
  [MEMORY[0x189603F18] arrayWithObjects:v32 count:1];
  uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
  [v18 setWithArray:v19];
  char v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 setProxyObjectClasses:v20];

  uint64_t v21 = [objc_alloc(MEMORY[0x189612740]) initWithClientPolicy:v17];
  char v22 = (void *)__maAutoAssetSetSharedConnectionClient;
  __maAutoAssetSetSharedConnectionClient = v21;

  if (__maAutoAssetSetSharedConnectionClient)
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 oslog];
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_18718F000,  v24,  OS_LOG_TYPE_DEFAULT,  "MA-auto-set{connectToServerFrameworkCompletion} connection client initialized for server connection",  buf,  2u);
    }
  }

  else
  {
    uint64_t v25 = +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( &OBJC_CLASS___MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  6104LL,  @"auto-set(connectToServerFrameworkCompletion)",  0LL,  @"unable to create shared SUCoreConnectClient for the client process");
    uint64_t v26 = *(void *)(*(void *)(a1 + 40) + 8LL);
    id v27 = *(void **)(v26 + 40);
    *(void *)(v26 + 40) = v25;

    [MEMORY[0x1896127A0] sharedLogger];
    id v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v28 oslog];
    id v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      __53__MAAutoAssetSet_connectToServerFrameworkCompletion___block_invoke_cold_1();
    }
  }
}

- (id)_newProxyObjectForSetProgressBlock:(id)a3
{
  id v4 = a3;
  v15[0] = 0LL;
  v15[1] = v15;
  id v15[2] = 0x3042000000LL;
  v15[3] = __Block_byref_object_copy__510;
  void v15[4] = __Block_byref_object_dispose__511;
  objc_initWeak(&v16, self);
  id v5 = objc_alloc(MEMORY[0x189612750]);
  +[MAAutoAssetSet frameworkInstanceUUID](&OBJC_CLASS___MAAutoAssetSet, "frameworkInstanceUUID");
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 UUIDString];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[MAAutoAssetSet frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSet, "frameworkDispatchQueue");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  id v12[2] = __53__MAAutoAssetSet__newProxyObjectForSetProgressBlock___block_invoke;
  v12[3] = &unk_189FFB8B0;
  id v14 = v15;
  id v9 = v4;
  id v13 = v9;
  uint64_t v10 = (void *)[v5 initWithClientID:v7 completionQueue:v8 genericBlock:v12];

  _Block_object_dispose(v15, 8);
  objc_destroyWeak(&v16);

  return v10;
}

void __53__MAAutoAssetSet__newProxyObjectForSetProgressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  +[MAAutoAssetSet frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSet, "frameworkDispatchQueue");
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
      __53__MAAutoAssetSet__newProxyObjectForSetProgressBlock___block_invoke_cold_1();
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
      __53__MAAutoAssetSet__newProxyObjectForSetProgressBlock___block_invoke_cold_2();
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
      __53__MAAutoAssetSet__newProxyObjectForSetProgressBlock___block_invoke_cold_3();
    }
LABEL_11:

    goto LABEL_12;
  }

  [WeakRetained _lockAtomicStatusProgress:v3 lockAtomicError:0 progressBlock:*(void *)(a1 + 32)];
LABEL_12:
}

- (void)_successCheckAtomic:(id)a3 forAssetSetIdentifier:(id)a4 newerInstanceDiscovered:(id)a5 discoveredAtomicEntries:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v16)
  {
    -[MAAutoAssetSet completionDispatchQueue](self, "completionDispatchQueue");
    id v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __119__MAAutoAssetSet__successCheckAtomic_forAssetSetIdentifier_newerInstanceDiscovered_discoveredAtomicEntries_completion___block_invoke;
    block[3] = &unk_189FFB8D8;
    uint64_t v21 = (os_log_s *)v12;
    id v22 = v13;
    id v25 = v16;
    id v23 = v14;
    id v24 = v15;
    dispatch_async(v17, block);

    id v18 = v21;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 oslog];
    id v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet _successCheckAtomic:forAssetSetIdentifier:newerInstanceDiscovered:discoveredAtomicEntries:completion:].cold.1();
    }
  }
}

uint64_t __119__MAAutoAssetSet__successCheckAtomic_forAssetSetIdentifier_newerInstanceDiscovered_discoveredAtomicEntries_completion___block_invoke( void *a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896127A0] sharedLogger];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = a1[5];
    int v7 = 138543618;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    uint64_t v10 = v5;
    _os_log_impl( &dword_18718F000,  v3,  OS_LOG_TYPE_DEFAULT,  "MA-auto-set{_successCheckAtomic:%{public}@} | assetSetIdentifier:%{public}@ | SUCCESS",  (uint8_t *)&v7,  0x16u);
  }

  return (*(uint64_t (**)(void))(a1[8] + 16LL))();
}

- (void)_failedCheckAtomic:(id)a3 forAssetSetIdentifier:(id)a4 withErrorCode:(int64_t)a5 withResponseError:(id)a6 description:(id)a7 completion:(id)a8
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (v18)
  {
    -[MAAutoAssetSet completionDispatchQueue](self, "completionDispatchQueue");
    uint64_t v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __114__MAAutoAssetSet__failedCheckAtomic_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke;
    block[3] = &unk_189FFB900;
    id v27 = v16;
    int64_t v32 = a5;
    id v28 = v14;
    id v29 = v15;
    id v30 = v17;
    id v31 = v18;
    dispatch_async(v19, block);

    char v20 = v27;
  }

  else
  {
    id v21 = objc_alloc(NSString);
    if (v16)
    {
      [v16 checkedDescription];
      id v22 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v23 = [v21 initWithFormat:@"%@ | error:%@", v17, v22];
    }

    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:]( &OBJC_CLASS___MAAutoAssetError,  "summaryForCode:fromOperation:",  a5,  v14);
      id v22 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v23 = [v21 initWithFormat:@"%@ | result:%@", v17, v22];
    }

    char v20 = (void *)v23;

    [MEMORY[0x1896127A0] sharedLogger];
    id v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 oslog];
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v34 = v14;
      __int16 v35 = 2114;
      id v36 = v20;
      __int16 v37 = 2112;
      id v38 = v15;
      _os_log_error_impl( &dword_18718F000,  v25,  OS_LOG_TYPE_ERROR,  "MA-auto-set{_failedCheckAtomic:%{public}@} | %{public}@ | assetSetIdentifier:%@ | no client completion block",  buf,  0x20u);
    }
  }
}

void __114__MAAutoAssetSet__failedCheckAtomic_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke( uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 72)) != 0
    && (uint64_t v6 = (void *)[objc_alloc(NSString) initWithFormat:@"auto-set(%@) | assetSetIdentifier:%@", *(void *)(a1 + 40), *(void *)(a1 + 48)],  +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v5,  v6,  0,  *(void *)(a1 + 56)),  v2 = (id)objc_claimAutoreleasedReturnValue(),  v6,  v2))
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 oslog];
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __114__MAAutoAssetSet__failedCheckAtomic_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke_cold_1( a1,  (uint64_t)v2);
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 oslog];
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 56);
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v12 = v10;
      __int16 v13 = 2114;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      _os_log_impl( &dword_18718F000,  v4,  OS_LOG_TYPE_DEFAULT,  "MA-auto-set{_failedCheckAtomic:%{public}@} | %{public}@ | assetSetIdentifier:%@ | SUCCESS",  buf,  0x20u);
    }

    id v2 = 0LL;
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
}

- (void)_successCurrentSetStatus:(id)a3 forAssetSetIdentifier:(id)a4 withAssetSetStatus:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    -[MAAutoAssetSet completionDispatchQueue](self, "completionDispatchQueue");
    uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __95__MAAutoAssetSet__successCurrentSetStatus_forAssetSetIdentifier_withAssetSetStatus_completion___block_invoke;
    v17[3] = &unk_189FFB928;
    id v18 = (os_log_s *)v10;
    id v19 = v11;
    id v21 = v13;
    id v20 = v12;
    dispatch_async(v14, v17);

    __int16 v15 = v18;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 oslog];
    __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet _successCurrentSetStatus:forAssetSetIdentifier:withAssetSetStatus:completion:].cold.1();
    }
  }
}

uint64_t __95__MAAutoAssetSet__successCurrentSetStatus_forAssetSetIdentifier_withAssetSetStatus_completion___block_invoke( void *a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896127A0] sharedLogger];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = a1[5];
    int v7 = 138543618;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    uint64_t v10 = v5;
    _os_log_impl( &dword_18718F000,  v3,  OS_LOG_TYPE_DEFAULT,  "MA-auto-set{_successCurrentSetStatus:%{public}@} | assetSetIdentifier:%{public}@ | SUCCESS",  (uint8_t *)&v7,  0x16u);
  }

  return (*(uint64_t (**)(void))(a1[7] + 16LL))();
}

- (void)_failedCurrentSetStatus:(id)a3 forAssetSetIdentifier:(id)a4 withErrorCode:(int64_t)a5 withResponseError:(id)a6 description:(id)a7 completion:(id)a8
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (v18)
  {
    -[MAAutoAssetSet completionDispatchQueue](self, "completionDispatchQueue");
    id v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __119__MAAutoAssetSet__failedCurrentSetStatus_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke;
    block[3] = &unk_189FFB900;
    id v27 = v16;
    int64_t v32 = a5;
    id v28 = v14;
    id v29 = v15;
    id v30 = v17;
    id v31 = v18;
    dispatch_async(v19, block);

    id v20 = v27;
  }

  else
  {
    id v21 = objc_alloc(NSString);
    if (v16)
    {
      [v16 checkedDescription];
      id v22 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v23 = [v21 initWithFormat:@"%@ | error:%@", v17, v22];
    }

    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:]( &OBJC_CLASS___MAAutoAssetError,  "summaryForCode:fromOperation:",  a5,  v14);
      id v22 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v23 = [v21 initWithFormat:@"%@ | result:%@", v17, v22];
    }

    id v20 = (void *)v23;

    [MEMORY[0x1896127A0] sharedLogger];
    id v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 oslog];
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v34 = v14;
      __int16 v35 = 2114;
      id v36 = v20;
      __int16 v37 = 2112;
      id v38 = v15;
      _os_log_error_impl( &dword_18718F000,  v25,  OS_LOG_TYPE_ERROR,  "MA-auto-set{_failedCurrentSetStatus:%{public}@} | %{public}@ | assetSetIdentifier:%@ | no client completion block",  buf,  0x20u);
    }
  }
}

void __119__MAAutoAssetSet__failedCurrentSetStatus_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke( uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 72)) != 0
    && (uint64_t v6 = (void *)[objc_alloc(NSString) initWithFormat:@"auto-set(%@) | assetSetIdentifier:%@", *(void *)(a1 + 40), *(void *)(a1 + 48)],  +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v5,  v6,  0,  *(void *)(a1 + 56)),  v2 = (id)objc_claimAutoreleasedReturnValue(),  v6,  v2))
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 oslog];
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __119__MAAutoAssetSet__failedCurrentSetStatus_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke_cold_1( a1,  (uint64_t)v2);
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 oslog];
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 56);
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v12 = v10;
      __int16 v13 = 2114;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      _os_log_impl( &dword_18718F000,  v4,  OS_LOG_TYPE_DEFAULT,  "MA-auto-set{_failedCurrentSetStatus:%{public}@} | %{public}@ | assetSetIdentifier:%@ | SUCCESS",  buf,  0x20u);
    }

    id v2 = 0LL;
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
}

- (void)_lockAtomicStatusProgress:(id)a3 lockAtomicError:(id)a4 progressBlock:(id)a5
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v7 = a3;
  id v8 = a5;
  +[MAAutoAssetSet frameworkDispatchQueue](&OBJC_CLASS___MAAutoAssetSet, "frameworkDispatchQueue");
  uint64_t v9 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  if (v8)
  {
    -[MAAutoAssetSet completionDispatchQueue](self, "completionDispatchQueue");
    uint64_t v10 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __74__MAAutoAssetSet__lockAtomicStatusProgress_lockAtomicError_progressBlock___block_invoke;
    v14[3] = &unk_189FF9738;
    uint64_t v16 = (os_log_s *)v8;
    id v15 = v7;
    dispatch_async(v10, v14);

    uint64_t v11 = v16;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    [v12 oslog];
    uint64_t v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      [v7 summary];
      __int16 v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      id v18 = v13;
      _os_log_impl( &dword_18718F000,  v11,  OS_LOG_TYPE_DEFAULT,  "MA-auto-set{_lockAtomicStatusProgress} | no client progress block | %{public}@",  buf,  0xCu);
    }
  }
}

uint64_t __74__MAAutoAssetSet__lockAtomicStatusProgress_lockAtomicError_progressBlock___block_invoke( uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16LL))( *(void *)(a1 + 40),  *(void *)(a1 + 32),  0LL);
}

- (void)_successLockAtomic:(id)a3 forAssetSetIdentifier:(id)a4 lockedAtomicInstance:(id)a5 lockedAtomicEntries:(id)a6 sandboxExtension:(id)a7 sandboxExtensionPath:(id)a8 completion:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a9;
  if (v19)
  {
    +[MAAutoAssetAuthorizationPolicy consumeSandboxExtension:forPath:]( &OBJC_CLASS___MAAutoAssetAuthorizationPolicy,  "consumeSandboxExtension:forPath:",  a7,  a8);
    -[MAAutoAssetSet completionDispatchQueue](self, "completionDispatchQueue");
    id v20 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __149__MAAutoAssetSet__successLockAtomic_forAssetSetIdentifier_lockedAtomicInstance_lockedAtomicEntries_sandboxExtension_sandboxExtensionPath_completion___block_invoke;
    block[3] = &unk_189FFB8D8;
    id v24 = (os_log_s *)v15;
    id v25 = v16;
    id v28 = v19;
    id v26 = v17;
    id v27 = v18;
    dispatch_async(v20, block);

    id v21 = v24;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 oslog];
    id v21 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet _successLockAtomic:forAssetSetIdentifier:lockedAtomicInstance:lockedAtomicEntries:sandboxExtension:sandboxExtensionPath:completion:].cold.1();
    }
  }
}

uint64_t __149__MAAutoAssetSet__successLockAtomic_forAssetSetIdentifier_lockedAtomicInstance_lockedAtomicEntries_sandboxExtension_sandboxExtensionPath_completion___block_invoke( void *a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896127A0] sharedLogger];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = a1[5];
    int v7 = 138543618;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    uint64_t v10 = v5;
    _os_log_impl( &dword_18718F000,  v3,  OS_LOG_TYPE_DEFAULT,  "MA-auto-set{_successLockAtomic:%{public}@} | assetSetIdentifier:%{public}@ | SUCCESS",  (uint8_t *)&v7,  0x16u);
  }

  return (*(uint64_t (**)(void))(a1[8] + 16LL))();
}

- (void)_failedLockAtomic:(id)a3 forAssetSetIdentifier:(id)a4 withErrorCode:(int64_t)a5 withResponseError:(id)a6 description:(id)a7 completion:(id)a8
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (v18)
  {
    -[MAAutoAssetSet completionDispatchQueue](self, "completionDispatchQueue");
    id v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __113__MAAutoAssetSet__failedLockAtomic_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke;
    block[3] = &unk_189FFB900;
    id v27 = v16;
    int64_t v32 = a5;
    id v28 = v14;
    id v29 = v15;
    id v30 = v17;
    id v31 = v18;
    dispatch_async(v19, block);

    id v20 = v27;
  }

  else
  {
    id v21 = objc_alloc(NSString);
    if (v16)
    {
      [v16 checkedDescription];
      id v22 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v23 = [v21 initWithFormat:@"%@ | error:%@", v17, v22];
    }

    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:]( &OBJC_CLASS___MAAutoAssetError,  "summaryForCode:fromOperation:",  a5,  v14);
      id v22 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v23 = [v21 initWithFormat:@"%@ | result:%@", v17, v22];
    }

    id v20 = (void *)v23;

    [MEMORY[0x1896127A0] sharedLogger];
    id v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 oslog];
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v34 = v14;
      __int16 v35 = 2114;
      id v36 = v20;
      __int16 v37 = 2112;
      id v38 = v15;
      _os_log_error_impl( &dword_18718F000,  v25,  OS_LOG_TYPE_ERROR,  "MA-auto-set{_failedLockAtomic:%{public}@} | %{public}@ | assetSetIdentifier:%@ | no client completion block",  buf,  0x20u);
    }
  }
}

void __113__MAAutoAssetSet__failedLockAtomic_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke( uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 72)) != 0
    && (uint64_t v6 = (void *)[objc_alloc(NSString) initWithFormat:@"auto-set(%@) | assetSetIdentifier:%@", *(void *)(a1 + 40), *(void *)(a1 + 48)],  +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v5,  v6,  0,  *(void *)(a1 + 56)),  v2 = (id)objc_claimAutoreleasedReturnValue(),  v6,  v2))
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 oslog];
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __113__MAAutoAssetSet__failedLockAtomic_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke_cold_1( a1,  (uint64_t)v2);
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 oslog];
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 56);
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v12 = v10;
      __int16 v13 = 2114;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      _os_log_impl( &dword_18718F000,  v4,  OS_LOG_TYPE_DEFAULT,  "MA-auto-set{_failedLockAtomic:%{public}@} | %{public}@ | assetSetIdentifier:%@ | SUCCESS",  buf,  0x20u);
    }

    id v2 = 0LL;
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
}

- (void)_successMapLockedAtomicEntry:(id)a3 forAtomicInstance:(id)a4 forMappedSelector:(id)a5 completion:(id)a6
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    -[MAAutoAssetSet completionDispatchQueue](self, "completionDispatchQueue");
    uint64_t v14 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __94__MAAutoAssetSet__successMapLockedAtomicEntry_forAtomicInstance_forMappedSelector_completion___block_invoke;
    v18[3] = &unk_189FFB950;
    id v19 = (os_log_s *)v10;
    id v20 = v11;
    id v21 = v12;
    id v22 = v13;
    dispatch_async(v14, v18);

    __int16 v15 = v19;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 oslog];
    __int16 v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      if (v12)
      {
        [v12 summary];
        uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

      else
      {
        uint64_t v17 = @"N";
      }

      *(_DWORD *)buf = 138543874;
      id v24 = v10;
      __int16 v25 = 2114;
      id v26 = v11;
      __int16 v27 = 2114;
      id v28 = v17;
      _os_log_error_impl( &dword_18718F000,  v15,  OS_LOG_TYPE_ERROR,  "MA-auto-set{_successMapLockedAtomicEntry:%{public}@}| assetSetAtomicInstance:%{public}@ | mappedSelector:%{publi c}@ | no client completion block",  buf,  0x20u);
      if (v12) {
    }
      }
  }
}

uint64_t __94__MAAutoAssetSet__successMapLockedAtomicEntry_forAtomicInstance_forMappedSelector_completion___block_invoke( uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896127A0] sharedLogger];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    [*(id *)(a1 + 48) summary];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    int v8 = 138543874;
    uint64_t v9 = v4;
    __int16 v10 = 2114;
    uint64_t v11 = v5;
    __int16 v12 = 2114;
    id v13 = v6;
    _os_log_impl( &dword_18718F000,  v3,  OS_LOG_TYPE_DEFAULT,  "MA-auto-set{_successMapLockedAtomicEntry:%{public}@} | assetSetAtomicInstance:%{public}@ | mappedSelector:%{public}@ | SUCCESS",  (uint8_t *)&v8,  0x20u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

- (void)_failedMapLockedAtomicEntry:(id)a3 forAssetSetIdentifier:(id)a4 withErrorCode:(int64_t)a5 withResponseError:(id)a6 description:(id)a7 completion:(id)a8
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (v18)
  {
    -[MAAutoAssetSet completionDispatchQueue](self, "completionDispatchQueue");
    id v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __123__MAAutoAssetSet__failedMapLockedAtomicEntry_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke;
    block[3] = &unk_189FFB900;
    id v27 = v16;
    int64_t v32 = a5;
    id v28 = v14;
    id v29 = v15;
    id v30 = v17;
    id v31 = v18;
    dispatch_async(v19, block);

    id v20 = v27;
  }

  else
  {
    id v21 = objc_alloc(NSString);
    if (v16)
    {
      [v16 checkedDescription];
      id v22 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v23 = [v21 initWithFormat:@"%@ | error:%@", v17, v22];
    }

    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:]( &OBJC_CLASS___MAAutoAssetError,  "summaryForCode:fromOperation:",  a5,  v14);
      id v22 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v23 = [v21 initWithFormat:@"%@ | result:%@", v17, v22];
    }

    id v20 = (void *)v23;

    [MEMORY[0x1896127A0] sharedLogger];
    id v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 oslog];
    __int16 v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v34 = v14;
      __int16 v35 = 2114;
      id v36 = v20;
      __int16 v37 = 2112;
      id v38 = v15;
      _os_log_error_impl( &dword_18718F000,  v25,  OS_LOG_TYPE_ERROR,  "MA-auto-set{_failedMapLockedAtomicEntry:%{public}@} | %{public}@ | assetSetIdentifier:%@ | no client completion block",  buf,  0x20u);
    }
  }
}

void __123__MAAutoAssetSet__failedMapLockedAtomicEntry_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke( uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 72)) != 0
    && (uint64_t v6 = (void *)[objc_alloc(NSString) initWithFormat:@"auto-set(%@) | assetSetIdentifier:%@", *(void *)(a1 + 40), *(void *)(a1 + 48)],  +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v5,  v6,  0,  *(void *)(a1 + 56)),  v2 = (id)objc_claimAutoreleasedReturnValue(),  v6,  v2))
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 oslog];
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __123__MAAutoAssetSet__failedMapLockedAtomicEntry_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke_cold_1( a1,  (uint64_t)v2);
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 oslog];
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 48);
      uint64_t v8 = *(void *)(a1 + 56);
      uint64_t v10 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      uint64_t v12 = v10;
      __int16 v13 = 2114;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v9;
      _os_log_impl( &dword_18718F000,  v4,  OS_LOG_TYPE_DEFAULT,  "MA-auto-set{_failedMapLockedAtomicEntry:%{public}@} | %{public}@ | assetSetIdentifier:%@ | SUCCESS",  buf,  0x20u);
    }

    id v2 = 0LL;
  }

  (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
}

- (void)_successFormSubAtomicInstance:(id)a3 formedSubAtomicInstance:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    -[MAAutoAssetSet completionDispatchQueue](self, "completionDispatchQueue");
    uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __83__MAAutoAssetSet__successFormSubAtomicInstance_formedSubAtomicInstance_completion___block_invoke;
    block[3] = &unk_189FFAE30;
    __int16 v15 = (os_log_s *)v8;
    id v16 = v9;
    id v17 = v10;
    dispatch_async(v11, block);

    uint64_t v12 = v15;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 oslog];
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet _successFormSubAtomicInstance:formedSubAtomicInstance:completion:].cold.1();
    }
  }
}

uint64_t __83__MAAutoAssetSet__successFormSubAtomicInstance_formedSubAtomicInstance_completion___block_invoke( void *a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896127A0] sharedLogger];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = a1[5];
    int v7 = 138543618;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    uint64_t v10 = v5;
    _os_log_impl( &dword_18718F000,  v3,  OS_LOG_TYPE_DEFAULT,  "MA-auto-set{_successFormSubAtomicInstance:%{public}@} | subAtomicInstance:%{public}@ | SUCCESS",  (uint8_t *)&v7,  0x16u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16LL))();
}

- (void)_failedFormSubAtomicInstance:(id)a3 withErrorCode:(int64_t)a4 withResponseError:(id)a5 description:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (v15)
  {
    -[MAAutoAssetSet completionDispatchQueue](self, "completionDispatchQueue");
    id v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __102__MAAutoAssetSet__failedFormSubAtomicInstance_withErrorCode_withResponseError_description_completion___block_invoke;
    block[3] = &unk_189FF9628;
    id v24 = v13;
    int64_t v28 = a4;
    id v25 = v12;
    id v26 = v14;
    id v27 = v15;
    dispatch_async(v16, block);

    id v17 = v24;
  }

  else
  {
    id v18 = objc_alloc(NSString);
    if (v13)
    {
      [v13 checkedDescription];
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = [v18 initWithFormat:@"%@ | error:%@", v14, v19];
    }

    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:]( &OBJC_CLASS___MAAutoAssetError,  "summaryForCode:fromOperation:",  a4,  v12);
      id v19 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = [v18 initWithFormat:@"%@ | result:%@", v14, v19];
    }

    id v17 = (void *)v20;

    [MEMORY[0x1896127A0] sharedLogger];
    id v21 = (void *)objc_claimAutoreleasedReturnValue();
    [v21 oslog];
    id v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet _failedFormSubAtomicInstance:withErrorCode:withResponseError:description:completion:].cold.1();
    }
  }
}

void __102__MAAutoAssetSet__failedFormSubAtomicInstance_withErrorCode_withResponseError_description_completion___block_invoke( uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 64)) != 0
    && (uint64_t v6 = (void *)[objc_alloc(NSString) initWithFormat:@"auto-set(%@)", *(void *)(a1 + 40)],  +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v5,  v6,  0,  *(void *)(a1 + 48)),  v2 = (id)objc_claimAutoreleasedReturnValue(),  v6,  v2))
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 oslog];
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __102__MAAutoAssetSet__failedFormSubAtomicInstance_withErrorCode_withResponseError_description_completion___block_invoke_cold_1( a1,  v2);
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 oslog];
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      uint64_t v13 = v9;
      _os_log_impl( &dword_18718F000,  v4,  OS_LOG_TYPE_DEFAULT,  "MA-auto-set{_failedFormSubAtomicInstance:%{public}@} | %{public}@ | SUCCESS",  buf,  0x16u);
    }

    id v2 = 0LL;
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

- (void)_successOperation:(id)a3 forAssetSetIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    -[MAAutoAssetSet completionDispatchQueue](self, "completionDispatchQueue");
    uint64_t v11 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __69__MAAutoAssetSet__successOperation_forAssetSetIdentifier_completion___block_invoke;
    block[3] = &unk_189FFAE30;
    id v15 = (os_log_s *)v8;
    id v16 = v9;
    id v17 = v10;
    dispatch_async(v11, block);

    __int16 v12 = v15;
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 oslog];
    __int16 v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet _successOperation:forAssetSetIdentifier:completion:].cold.1();
    }
  }
}

uint64_t __69__MAAutoAssetSet__successOperation_forAssetSetIdentifier_completion___block_invoke(void *a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  [MEMORY[0x1896127A0] sharedLogger];
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 oslog];
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = a1[4];
    uint64_t v5 = a1[5];
    int v7 = 138543618;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    uint64_t v10 = v5;
    _os_log_impl( &dword_18718F000,  v3,  OS_LOG_TYPE_DEFAULT,  "MA-auto-set{_successOperation:%{public}@} | assetSetIdentifier:%{public}@ | SUCCESS",  (uint8_t *)&v7,  0x16u);
  }

  return (*(uint64_t (**)(void))(a1[6] + 16LL))();
}

- (void)_failedOperation:(id)a3 forAssetSetIdentifier:(id)a4 withErrorCode:(int64_t)a5 withResponseError:(id)a6 description:(id)a7 completion:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (v18)
  {
    -[MAAutoAssetSet completionDispatchQueue](self, "completionDispatchQueue");
    id v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __112__MAAutoAssetSet__failedOperation_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke;
    block[3] = &unk_189FF9628;
    id v27 = v16;
    int64_t v31 = a5;
    id v28 = v14;
    id v29 = v17;
    id v30 = v18;
    dispatch_async(v19, block);

    uint64_t v20 = v27;
  }

  else
  {
    id v21 = objc_alloc(NSString);
    if (v16)
    {
      [v16 checkedDescription];
      id v22 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v23 = [v21 initWithFormat:@"%@ | error:%@", v17, v22];
    }

    else
    {
      +[MAAutoAssetError summaryForCode:fromOperation:]( &OBJC_CLASS___MAAutoAssetError,  "summaryForCode:fromOperation:",  a5,  v14);
      id v22 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v23 = [v21 initWithFormat:@"%@ | result:%@", v17, v22];
    }

    uint64_t v20 = (void *)v23;

    [MEMORY[0x1896127A0] sharedLogger];
    id v24 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 oslog];
    id v25 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[MAAutoAssetSet _failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:].cold.1();
    }
  }
}

void __112__MAAutoAssetSet__failedOperation_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke( uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  id v2 = *(id *)(a1 + 32);
  if (v2
    || (uint64_t v5 = *(void *)(a1 + 64)) != 0
    && (uint64_t v6 = (void *)[objc_alloc(NSString) initWithFormat:@"auto-set(%@)", *(void *)(a1 + 40)],  +[MAAutoAssetError buildError:fromOperation:underlyingError:withDescription:]( MAAutoAssetError,  "buildError:fromOperation:underlyingError:withDescription:",  v5,  v6,  0,  *(void *)(a1 + 48)),  v2 = (id)objc_claimAutoreleasedReturnValue(),  v6,  v2))
  {
    [MEMORY[0x1896127A0] sharedLogger];
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 oslog];
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __112__MAAutoAssetSet__failedOperation_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke_cold_1( a1,  v2);
    }
  }

  else
  {
    [MEMORY[0x1896127A0] sharedLogger];
    int v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 oslog];
    uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      uint64_t v13 = v9;
      _os_log_impl( &dword_18718F000,  v4,  OS_LOG_TYPE_DEFAULT,  "MA-auto-set{_failedOperation:%{public}@} | %{public}@ | SUCCESS",  buf,  0x16u);
    }

    id v2 = 0LL;
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

+ (void)frameworkInstanceSetLogDomain
{
  if (frameworkInstanceSetLogDomain_setFrameworkLogDomainOnce != -1) {
    dispatch_once(&frameworkInstanceSetLogDomain_setFrameworkLogDomainOnce, &__block_literal_global_523);
  }
}

void __47__MAAutoAssetSet_frameworkInstanceSetLogDomain__block_invoke()
{
  id v1 = (id)[objc_alloc(NSString) initWithFormat:@"%@.%s", @"com.apple.MAAutoSetClient", getprogname()];
  [MEMORY[0x189612760] sharedCore];
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  [v0 useDomain:v1];
}

+ (id)defaultDispatchQueue
{
  if (defaultDispatchQueue_setDefaultQueueOnce != -1) {
    dispatch_once(&defaultDispatchQueue_setDefaultQueueOnce, &__block_literal_global_526);
  }
  return (id)defaultDispatchQueue_setDefaultQueue;
}

void __38__MAAutoAssetSet_defaultDispatchQueue__block_invoke()
{
  id v0 = (const char *)[@"com.apple.MobileAsset.autoassetset.client" UTF8String];
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v1 = dispatch_queue_create(v0, v3);
  id v2 = (void *)defaultDispatchQueue_setDefaultQueue;
  defaultDispatchQueue_setDefaultQueue = (uint64_t)v1;
}

+ (id)frameworkDispatchQueue
{
  if (frameworkDispatchQueue_setFrameworkQueueOnce != -1) {
    dispatch_once(&frameworkDispatchQueue_setFrameworkQueueOnce, &__block_literal_global_527);
  }
  return (id)frameworkDispatchQueue_setFrameworkQueue;
}

void __40__MAAutoAssetSet_frameworkDispatchQueue__block_invoke()
{
  id v0 = (const char *)[@"com.apple.MobileAsset.autoassetset.framework" UTF8String];
  dispatch_queue_attr_make_with_autorelease_frequency(0LL, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  id v3 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v1 = dispatch_queue_create(v0, v3);
  id v2 = (void *)frameworkDispatchQueue_setFrameworkQueue;
  frameworkDispatchQueue_setFrameworkQueue = (uint64_t)v1;
}

+ (id)frameworkInstanceUUID
{
  if (frameworkInstanceUUID_setFrameworkUUIDOnce != -1) {
    dispatch_once(&frameworkInstanceUUID_setFrameworkUUIDOnce, &__block_literal_global_528);
  }
  return (id)frameworkInstanceUUID_setFrameworkUUID;
}

void __39__MAAutoAssetSet_frameworkInstanceUUID__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x189607AB8]);
  dispatch_queue_t v1 = (void *)frameworkInstanceUUID_setFrameworkUUID;
  frameworkInstanceUUID_setFrameworkUUID = (uint64_t)v0;
}

+ (int64_t)waitOnSemaphore:(id)a3 withDaemonTriggeredTimeout:(int64_t)a4
{
  return dispatch_semaphore_wait((dispatch_semaphore_t)a3, 0xFFFFFFFFFFFFFFFFLL);
}

- (NSString)clientDomainName
{
  return self->_clientDomainName;
}

- (void)setClientDomainName:(id)a3
{
}

- (NSString)autoAssetSetClientName
{
  return self->_autoAssetSetClientName;
}

- (void)setAutoAssetSetClientName:(id)a3
{
}

- (NSString)assetSetIdentifier
{
  return self->_assetSetIdentifier;
}

- (void)setAssetSetIdentifier:(id)a3
{
}

- (BOOL)shortTermLocker
{
  return self->_shortTermLocker;
}

- (NSArray)autoAssetEntries
{
  return self->_autoAssetEntries;
}

- (void)setAutoAssetEntries:(id)a3
{
}

- (NSString)updateCategoryDesiredByClient
{
  return self->_updateCategoryDesiredByClient;
}

- (void)setUpdateCategoryDesiredByClient:(id)a3
{
}

- (OS_dispatch_queue)completionDispatchQueue
{
  return self->_completionDispatchQueue;
}

- (void).cxx_destruct
{
}

  ;
}

  ;
}

- (void)alterEntriesRepresentingAtomic:toBeComprisedOfEntries:withNeedPolicy:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto-set{alterEntriesRepresentingAtomic} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)needForAtomic:withNeedPolicy:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto-set{needForAtomic} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)checkAtomic:forAtomicInstance:awaitingDownload:withNeedPolicy:withTimeout:reportingProgress:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto-set{checkAtomic} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)lockAtomic:forAtomicInstance:withNeedPolicy:withTimeout:reportingProgress:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto-set{lockAtomic} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)mapLockedAtomicEntry:forAtomicInstance:mappingSelector:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto-set{mapLockedAtomicEntry} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)formSubAtomicInstance:fromAtomicInstance:toBeComprisedOfEntries:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto-set{formSubAtomicInstance} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)continueAtomicLock:ofAtomicInstance:withNeedPolicy:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto-set{continueAtomicLock} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)endAtomicLock:ofAtomicInstance:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto-set{endAtomicLock} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)assetSetForStaging:asEntriesWhenTargeting:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto-set{assetSetForStaging} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)currentSetStatus:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto-set{currentSetStatus} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

void __63__MAAutoAssetSet__shortTermEndAtomicLockSync_ofAtomicInstance___block_invoke_cold_1( uint64_t a1,  uint64_t a2,  os_log_s *a3)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_2( &dword_18718F000,  a3,  v5,  "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermEndAtomicLockSync} (%{public}@) | WARNING | unable to locate byAss etSetIdentifier when ending SHORT-TERM locks for all lock reasons | shortTermLock:%@",  v6);

  OUTLINED_FUNCTION_6();
}

void __63__MAAutoAssetSet__shortTermEndAtomicLockSync_ofAtomicInstance___block_invoke_cold_2( uint64_t a1,  uint64_t a2,  os_log_s *a3)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_2( &dword_18718F000,  a3,  v5,  "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermEndAtomicLockSync} (%{public}@) | WARNING | unable to locate byAto micInstance when ending SHORT-TERM locks for all lock reasons | shortTermLock:%@",  v6);

  OUTLINED_FUNCTION_6();
}

void __63__MAAutoAssetSet__shortTermEndAtomicLockSync_ofAtomicInstance___block_invoke_cold_3( uint64_t a1,  uint64_t a2,  os_log_s *a3)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_2( &dword_18718F000,  a3,  v5,  "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermEndAtomicLockSync} (%{public}@) | WARNING | inconsistent totalLock Count (ending last lock) | shortTermLock:%@",  v6);

  OUTLINED_FUNCTION_6();
}

void __63__MAAutoAssetSet__shortTermEndAtomicLockSync_ofAtomicInstance___block_invoke_cold_4( uint64_t a1,  uint64_t a2,  os_log_s *a3)
{
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_2( &dword_18718F000,  a3,  v5,  "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{_shortTermEndAtomicLockSync} (%{public}@) | WARNING | inconsistent totalLock Count (not last lock) | shortTermLock:%@",  v6);

  OUTLINED_FUNCTION_6();
}

- (void)_closeAndRemoveShortTermLock:(os_log_s *)a3 forShortTermLock:.cold.1( uint64_t a1,  void *a2,  os_log_s *a3)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  [a2 summary];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_2( &dword_18718F000,  a3,  v5,  "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{%{public}@:_closeAndRemoveShortTermLock} | WARNING | invalid lockedFileDesci ptor | shortTermLock:%{public}@",  v6);

  OUTLINED_FUNCTION_6();
}

- (void)_closeAndRemoveShortTermLock:(os_log_s *)a3 forShortTermLock:.cold.2( uint64_t a1,  void *a2,  os_log_s *a3)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  [a2 summary];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_2( &dword_18718F000,  a3,  v5,  "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{%{public}@:_closeAndRemoveShortTermLock} | WARNING | unable to locate byAsse tSetIdentifier when ending SHORT-TERM lock | shortTermLock:%{public}@",  v6);

  OUTLINED_FUNCTION_6();
}

- (void)_closeAndRemoveShortTermLock:(os_log_s *)a3 forShortTermLock:.cold.3( uint64_t a1,  void *a2,  os_log_s *a3)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  [a2 summary];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_2( &dword_18718F000,  a3,  v5,  "MA-auto-set[AUTO-SHORT-TERM][FRAMEWORK]{%{public}@:_closeAndRemoveShortTermLock} | WARNING | unable to locate byAtom icInstance when ending SHORT-TERM lock | shortTermLock:%{public}@",  v6);

  OUTLINED_FUNCTION_6();
}

+ (void)endAtomicLocks:usingClientDomain:forClientName:forAssetSetIdentifier:ofAtomicInstance:removingLockCount:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto-set{+endAtomicLocks} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)_endAtomicLocks:usingClientDomain:forClientName:forAssetSetIdentifier:ofAtomicInstance:removingLockCount:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto-set{_endAtomicLocks} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

+ (void)eliminateAtomic:usingClientDomain:forAssetSetIdentifier:awaitingUnlocked:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto-set{+eliminateAtomic} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

- (void)_eliminateAtomic:awaitingUnlocked:completion:.cold.1()
{
  id v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0( &dword_18718F000,  v1,  v2,  "MA-auto-set{_eliminateAtomic} | no client completion block | %{public}@",  v3,  v4,  v5,  v6,  v7);

  OUTLINED_FUNCTION_5();
}

void __53__MAAutoAssetSet_connectToServerFrameworkCompletion___block_invoke_cold_1()
{
}

void __53__MAAutoAssetSet__newProxyObjectForSetProgressBlock___block_invoke_cold_1()
{
}

void __53__MAAutoAssetSet__newProxyObjectForSetProgressBlock___block_invoke_cold_2()
{
}

void __53__MAAutoAssetSet__newProxyObjectForSetProgressBlock___block_invoke_cold_3()
{
}

- (void)_successCheckAtomic:forAssetSetIdentifier:newerInstanceDiscovered:discoveredAtomicEntries:completion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2( &dword_18718F000,  v0,  (uint64_t)v0,  "MA-auto-set{_successCheckAtomic:%{public}@}| assetSetIdentifier:%{public}@ | no client completion block",  v1);
  OUTLINED_FUNCTION_8();
}

void __114__MAAutoAssetSet__failedCheckAtomic_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke_cold_1( uint64_t a1,  uint64_t a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8_1( &dword_18718F000,  v3,  v4,  "MA-auto-set{_failedCheckAtomic:%{public}@} | %{public}@ | assetSetIdentifier:%@ | error:%{public}@",  v5,  v6,  v7,  v8,  v9);

  OUTLINED_FUNCTION_7_1();
}

- (void)_successCurrentSetStatus:forAssetSetIdentifier:withAssetSetStatus:completion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2( &dword_18718F000,  v0,  (uint64_t)v0,  "MA-auto-set{_successCurrentSetStatus:%{public}@}| assetSetIdentifier:%{public}@ | no client completion block",  v1);
  OUTLINED_FUNCTION_8();
}

void __119__MAAutoAssetSet__failedCurrentSetStatus_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke_cold_1( uint64_t a1,  uint64_t a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8_1( &dword_18718F000,  v3,  v4,  "MA-auto-set{_failedCurrentSetStatus:%{public}@} | %{public}@ | assetSetIdentifier:%@ | error:%{public}@",  v5,  v6,  v7,  v8,  v9);

  OUTLINED_FUNCTION_7_1();
}

- (void)_successLockAtomic:forAssetSetIdentifier:lockedAtomicInstance:lockedAtomicEntries:sandboxExtension:sandboxExtensionPath:completion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2( &dword_18718F000,  v0,  (uint64_t)v0,  "MA-auto-set{_successLockAtomic:%{public}@}| assetSetIdentifier:%{public}@ | no client completion block",  v1);
  OUTLINED_FUNCTION_8();
}

void __113__MAAutoAssetSet__failedLockAtomic_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke_cold_1( uint64_t a1,  uint64_t a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8_1( &dword_18718F000,  v3,  v4,  "MA-auto-set{_failedLockAtomic:%{public}@} | %{public}@ | assetSetIdentifier:%@ | error:%{public}@",  v5,  v6,  v7,  v8,  v9);

  OUTLINED_FUNCTION_7_1();
}

void __123__MAAutoAssetSet__failedMapLockedAtomicEntry_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke_cold_1( uint64_t a1,  uint64_t a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8_1( &dword_18718F000,  v3,  v4,  "MA-auto-set{_failedMapLockedAtomicEntry:%{public}@} | %{public}@ | assetSetIdentifier:%@ | error:%{public}@",  v5,  v6,  v7,  v8,  v9);

  OUTLINED_FUNCTION_7_1();
}

- (void)_successFormSubAtomicInstance:formedSubAtomicInstance:completion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2( &dword_18718F000,  v0,  (uint64_t)v0,  "MA-auto-set{_successFormSubAtomicInstance:%{public}@}| subAtomicInstance:%{public}@ | no client completion block",  v1);
  OUTLINED_FUNCTION_8();
}

- (void)_failedFormSubAtomicInstance:withErrorCode:withResponseError:description:completion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2( &dword_18718F000,  v0,  (uint64_t)v0,  "MA-auto-set{_failedFormSubAtomicInstance:%{public}@} | %{public}@ | no client completion block",  v1);
  OUTLINED_FUNCTION_8();
}

void __102__MAAutoAssetSet__failedFormSubAtomicInstance_withErrorCode_withResponseError_description_completion___block_invoke_cold_1( uint64_t a1,  void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16( &dword_18718F000,  v3,  v4,  "MA-auto-set{_failedFormSubAtomicInstance:%{public}@} | %{public}@ | error:%{public}@",  v5,  v6,  v7,  v8,  v9);

  OUTLINED_FUNCTION_18();
}

- (void)_successOperation:forAssetSetIdentifier:completion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2( &dword_18718F000,  v0,  (uint64_t)v0,  "MA-auto-set{_successOperation:%{public}@} | assetSetIdentifier:%{public}@ | no client completion block",  v1);
  OUTLINED_FUNCTION_8();
}

- (void)_failedOperation:forAssetSetIdentifier:withErrorCode:withResponseError:description:completion:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2( &dword_18718F000,  v0,  (uint64_t)v0,  "MA-auto-set{_failedOperation:%{public}@} | no client completion block | %{public}@",  v1);
  OUTLINED_FUNCTION_8();
}

void __112__MAAutoAssetSet__failedOperation_forAssetSetIdentifier_withErrorCode_withResponseError_description_completion___block_invoke_cold_1( uint64_t a1,  void *a2)
{
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14_0();
  OUTLINED_FUNCTION_16( &dword_18718F000,  v3,  v4,  "MA-auto-set{_failedOperation:%{public}@} | %{public}@ | error:%{public}@",  v5,  v6,  v7,  v8,  v9);

  OUTLINED_FUNCTION_18();
}

@end