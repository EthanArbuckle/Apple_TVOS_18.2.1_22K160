@interface NSFileAccessClaim
+ (BOOL)canNewWriteOfItemAtLocation:(id)a3 options:(unint64_t)a4 safelyOverlapExistingWriteOfItemAtLocation:(id)a5 options:(unint64_t)a6;
+ (BOOL)canReadingItemAtLocation:(id)a3 options:(unint64_t)a4 safelyOverlapNewWriting:(BOOL)a5 ofItemAtLocation:(id)a6 options:(unint64_t)a7;
+ (BOOL)supportsSecureCoding;
- (BOOL)_writeArchiveOfDirectoryAtURL:(id)a3 toURL:(id)a4 error:(id *)a5;
- (BOOL)cameFromSuperarbiter;
- (BOOL)canAccessLocations:(id)a3 forReading:(BOOL)a4 error:(id *)a5;
- (BOOL)checkIfSymbolicLinkAtURL:(id)a3 withResolutionCount:(int64_t *)a4 andIfSoThenReevaluateSelf:(id)a5;
- (BOOL)claimerInvokingIsBlockedByReactorWithID:(id)a3;
- (BOOL)didWait;
- (BOOL)evaluateSelfWithRootNode:(id)a3 checkSubarbitrability:(BOOL)a4;
- (BOOL)isBlockedByClaimWithPurposeID:(id)a3;
- (BOOL)isBlockedByReadingItemAtLocation:(id)a3 options:(unint64_t)a4;
- (BOOL)isBlockedByWritingItemAtLocation:(id)a3 options:(unint64_t)a4;
- (BOOL)isGranted;
- (BOOL)isRevoked;
- (BOOL)shouldBeRevokedPriorToInvokingAccessor;
- (BOOL)shouldCancelInsteadOfWaiting;
- (BOOL)shouldEnableMaterializationDuringAccessorBlock;
- (BOOL)shouldInformProvidersAboutEndOfWriteWithOptions:(unint64_t)a3;
- (BOOL)shouldMakeProviderProvideItemAtLocation:(id)a3 withOptions:(unint64_t)a4;
- (BOOL)shouldReadingWithOptions:(unint64_t)a3 causePresenterToRelinquish:(id)a4;
- (BOOL)shouldWritingWithOptions:(unint64_t)a3 causePresenterToRelinquish:(id)a4;
- (NSArray)allURLs;
- (NSFileAccessClaim)initWithClient:(id)a3 claimID:(id)a4 purposeID:(id)a5;
- (NSFileAccessClaim)initWithCoder:(id)a3;
- (OS_dispatch_semaphore)claimerWaiter;
- (id)claimID;
- (id)claimerError;
- (id)client;
- (id)description;
- (id)descriptionWithIndenting:(id)a3;
- (id)pendingClaims;
- (id)purposeID;
- (id)purposeIDOfClaimOnItemAtLocation:(id)a3 forMessagingPresenter:(id)a4;
- (int)clientProcessIdentifier;
- (uint64_t)_recursive_claimerInvokingIsBlockedByReactorWithID:(void *)a3 checkedClaims:;
- (void)_checkIfMovingRequiresProvidingAmongWritingLocations:(id)a3 options:(unint64_t *)a4 thenContinue:(id)a5;
- (void)_protectIfNecessaryFileAtURL:(id)a3 withOptions:(unint64_t)a4 forReading:(BOOL)a5;
- (void)_setupWithClaimID:(id)a3 purposeID:(id)a4 originatingReactorQueueID:(id)a5;
- (void)acceptClaimFromClient:(id)a3 arbiterQueue:(id)a4 grantHandler:(id)a5;
- (void)addBlockingReactorID:(id)a3;
- (void)addPendingClaim:(id)a3;
- (void)block;
- (void)blockClaimerForReason:(id)a3;
- (void)cancelled;
- (void)dealloc;
- (void)devalueSelf;
- (void)disavowed;
- (void)encodeWithCoder:(id)a3;
- (void)ensureProvidersOfItemsAtReadingLocations:(id)a3 writingLocations:(id)a4 thenContinue:(id)a5;
- (void)evaluateNewClaim:(id)a3;
- (void)finished;
- (void)givePriorityToClaim:(id)a3;
- (void)invokeClaimer;
- (void)makePresentersOfItemAtLocation:(id)a3 orContainedItem:(BOOL)a4 relinquishUsingProcedureGetter:(id)a5;
- (void)makeProviderOfItemAtLocation:(id)a3 provideIfNecessaryWithOptions:(unint64_t)a4 thenContinue:(id)a5;
- (void)makeProviderOfItemAtLocation:(id)a3 provideOrAttachPhysicalURLIfNecessaryForPurposeID:(id)a4 readingOptions:(unint64_t)a5 thenContinue:(id)a6;
- (void)makeProviderOfItemAtLocation:(id)a3 provideOrAttachPhysicalURLIfNecessaryForPurposeID:(id)a4 writingOptions:(unint64_t)a5 thenContinue:(id)a6;
- (void)makeProviderOfItemAtLocation:(id)a3 providePhysicalURLThenContinue:(id)a4;
- (void)makeProvidersProvideItemsForReadingLocations:(id)a3 options:(unint64_t *)a4 andWritingLocationsIfNecessary:(id)a5 options:(unint64_t *)a6 thenContinue:(id)a7;
- (void)prepareClaimForGrantingWithArbiterQueue:(id)a3;
- (void)prepareItemForUploadingFromURL:(id)a3 thenContinue:(id)a4;
- (void)removeBlockingReactorID:(id)a3;
- (void)removePendingClaims:(id)a3;
- (void)revoked;
- (void)scheduleBlockedClaim:(id)a3;
- (void)setCameFromSuperarbiter;
- (void)setClaimerError:(id)a3;
- (void)setShouldEnableMaterializationDuringAccessorBlock:(BOOL)a3;
- (void)startObservingClientState;
- (void)unblock;
- (void)unblockClaimerForReason:(id)a3;
- (void)whenDevaluedPerformProcedure:(id)a3;
- (void)whenFinishedPerformProcedure:(id)a3;
- (void)whenRevokedPerformProcedure:(id)a3;
@end

@implementation NSFileAccessClaim

+ (BOOL)canReadingItemAtLocation:(id)a3 options:(unint64_t)a4 safelyOverlapNewWriting:(BOOL)a5 ofItemAtLocation:(id)a6 options:(unint64_t)a7
{
  int v7 = a7;
  return a7 >> 31 && a5
      || (objc_msgSend(a3, "itemIsItemAtLocation:", a6, a4, a5) & 1) == 0
      && ((*(void *)&v7 & 0x13000BLL) == 0 || ([a3 itemIsInItemAtLocation:a6] & 1) == 0);
}

+ (BOOL)canNewWriteOfItemAtLocation:(id)a3 options:(unint64_t)a4 safelyOverlapExistingWriteOfItemAtLocation:(id)a5 options:(unint64_t)a6
{
  if (a4 >> 31) {
    return 1;
  }
  int v6 = a6;
  int v8 = a4;
  return ([a3 itemIsItemAtLocation:a5] & 1) == 0
      && ((*(void *)&v8 & 0x13000BLL) == 0 || ([a5 itemIsInItemAtLocation:a3] & 1) == 0)
      && ((*(void *)&v6 & 0x13000BLL) == 0 || ([a3 itemIsInItemAtLocation:a5] & 1) == 0);
}

- (BOOL)shouldReadingWithOptions:(unint64_t)a3 causePresenterToRelinquish:(id)a4
{
  if ((a3 & 0x40000000) != 0) {
    return 0;
  }
  if ((a3 & 0x80000001) != 0x80000000) {
    return 1;
  }
  int v6 = objc_msgSend((id)objc_msgSend(a4, "client"), "processIdentifier");
  return v6 != -[NSXPCConnection processIdentifier](self->_client, "processIdentifier");
}

- (BOOL)shouldWritingWithOptions:(unint64_t)a3 causePresenterToRelinquish:(id)a4
{
  return a3 >> 31 == 0;
}

- (BOOL)shouldInformProvidersAboutEndOfWriteWithOptions:(unint64_t)a3
{
  int v3 = a3;
  BOOL v4 = !-[NSFileAccessClaim cameFromSuperarbiter](self, "cameFromSuperarbiter");
  return (*(void *)&v3 & 0x30000LL) == 0 && v4;
}

- (void)_setupWithClaimID:(id)a3 purposeID:(id)a4 originatingReactorQueueID:(id)a5
{
  if (a3) {
    int v8 = (NSString *)a3;
  }
  else {
    int v8 = +[NSFileCoordinator _createIdentifierForNewClaim]( &OBJC_CLASS___NSFileCoordinator,  "_createIdentifierForNewClaim");
  }
  self->_claimID = v8;
  self->_purposeIDOrNil = (NSString *)a4;
  self->_blockageCount = 1LL;
  self->_claimerBlockageReasons = (NSMutableArray *)objc_msgSend( objc_alloc(MEMORY[0x189603FA8]),  "initWithObjects:",  @"Initial blockage",  0);
  self->_originatingReactorQueueID = a5;
}

- (NSFileAccessClaim)initWithClient:(id)a3 claimID:(id)a4 purposeID:(id)a5
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___NSFileAccessClaim;
  int v8 = -[NSFileAccessClaim init](&v10, sel_init);
  if (v8)
  {
    v8->_client = (NSXPCConnection *)a3;
    v8->_claimerWaiter = (OS_dispatch_semaphore *)dispatch_semaphore_create(0LL);
    -[NSFileAccessClaim _setupWithClaimID:purposeID:originatingReactorQueueID:]( v8,  "_setupWithClaimID:purposeID:originatingReactorQueueID:",  a4,  a5,  0LL);
  }

  return v8;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1895F89C0];

  claimerWaiter = (dispatch_object_s *)self->_claimerWaiter;
  if (claimerWaiter) {
    dispatch_release(claimerWaiter);
  }

  id serverClaimerOrNil = self->_serverClaimerOrNil;
  if (serverClaimerOrNil) {

  }
  -[NSFileAccessProcessManager invalidate](self->_processManager, "invalidate");
  arbiterQueue = (dispatch_object_s *)self->_arbiterQueue;
  if (arbiterQueue) {
    dispatch_release(arbiterQueue);
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSFileAccessClaim;
  -[NSFileAccessClaim dealloc](&v6, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    [a3 encodeObject:self->_claimID forKey:@"NSClaimIDKey"];
    [a3 encodeObject:self->_purposeIDOrNil forKey:@"NSPurposeIDKey"];
    [a3 encodeObject:self->_originatingReactorQueueID forKey:@"NSOriginatingReactorQueueID"];
  }

  else
  {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"NSFileAccessClaims should only ever be encoded by XPC" userInfo:0]);
    -[NSFileAccessClaim initWithCoder:](v5, v6, v7);
  }

- (NSFileAccessClaim)initWithCoder:(id)a3
{
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSClaimIDKey"];
    uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSPurposeIDKey"];
    -[NSFileAccessClaim _setupWithClaimID:purposeID:originatingReactorQueueID:]( self,  "_setupWithClaimID:purposeID:originatingReactorQueueID:",  v5,  v6,  [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NSOriginatingReactorQueueID"]);
    return self;
  }

  else
  {

    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"NSFileAccessClaims should only ever be decoded by XPC" userInfo:0]);
    return (NSFileAccessClaim *)+[NSFileAccessClaim supportsSecureCoding](v8, v9);
  }

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)client
{
  return self->_client;
}

- (id)claimID
{
  return self->_claimID;
}

- (id)purposeID
{
  return self->_purposeIDOrNil;
}

- (int)clientProcessIdentifier
{
  client = self->_client;
  if (client) {
    return -[NSXPCConnection processIdentifier](client, "processIdentifier");
  }
  else {
    return getpid();
  }
}

- (void)prepareClaimForGrantingWithArbiterQueue:(id)a3
{
  if (self->_arbiterQueue) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"NSFileAccessClaim.m",  295LL,  @"This claim has already been prepared for granting");
  }
  self->_arbiterQueue = (OS_dispatch_queue *)a3;
  if (a3) {
    dispatch_retain((dispatch_object_t)a3);
  }
  self->_originatingReactorQueueID = (id)-[NSMutableDictionary objectForKeyedSubscript:]( -[NSThread threadDictionary]( +[NSThread currentThread]( &OBJC_CLASS___NSThread,  "currentThread"),  "threadDictionary"),  "objectForKeyedSubscript:",  @"_NSCurrentReactorID");
}

- (void)acceptClaimFromClient:(id)a3 arbiterQueue:(id)a4 grantHandler:(id)a5
{
  if (self->_client) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"NSFileAccessClaim.m",  309LL,  @"This claim has already been accepted");
  }
  self->_client = (NSXPCConnection *)a3;
  self->_arbiterQueue = (OS_dispatch_queue *)a4;
  if (a4) {
    dispatch_retain((dispatch_object_t)a4);
  }
  self->_id serverClaimerOrNil = (id)[a5 copy];
}

- (void)setCameFromSuperarbiter
{
  self->_cameFromSuperarbiter = 1;
}

- (BOOL)cameFromSuperarbiter
{
  return self->_cameFromSuperarbiter;
}

- (void)startObservingClientState
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  client = self->_client;
  if (client && self->_arbiterQueue && !self->_cameFromSuperarbiter)
  {
    pid_t v4 = -[NSXPCConnection processIdentifier](client, "processIdentifier");
    uint64_t v5 = (os_log_s *)_NSFCProcessMonitorLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      claimID = self->_claimID;
      *(_DWORD *)buf = 67109378;
      pid_t v10 = v4;
      __int16 v11 = 2114;
      v12 = claimID;
      _os_log_impl( &dword_182EB1000,  v5,  OS_LOG_TYPE_INFO,  "Starting to observe state of client with pid %d on behalf of claim %{public}@",  buf,  0x12u);
    }

    self->_processManager = -[NSFileAccessProcessManager initWithClient:queue:]( objc_alloc(&OBJC_CLASS___NSFileAccessProcessManager),  "initWithClient:queue:",  -[NSXPCConnection _xpcConnection](self->_client, "_xpcConnection"),  self->_arbiterQueue);
    -[NSFileAccessProcessManager setURLs:]( self->_processManager,  "setURLs:",  -[NSFileAccessClaim allURLs](self, "allURLs"));
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __46__NSFileAccessClaim_startObservingClientState__block_invoke;
    v7[3] = &unk_189CA35E8;
    v7[4] = self;
    pid_t v8 = v4;
    -[NSFileAccessProcessManager setSuspensionHandler:](self->_processManager, "setSuspensionHandler:", v7);
  }

uint64_t __46__NSFileAccessClaim_startObservingClientState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  pid_t v4 = (os_log_s *)_NSFCProcessMonitorLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 16LL);
    int v6 = *(_DWORD *)(a1 + 40);
    int v9 = 138543618;
    uint64_t v10 = v5;
    __int16 v11 = 1024;
    int v12 = v6;
    _os_log_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_DEFAULT,  "Claim %{public}@ observed suspension of client with %d",  (uint8_t *)&v9,  0x12u);
  }

  id v7 = *(void **)(a1 + 32);
  if (v7[5]) {
    return [v7 cancelled];
  }
  else {
    return [a2 killProcessWithMessage:@"A coordinated read or write was still active when process was suspended."];
  }
}

- (void)block
{
  unint64_t blockageCount = self->_blockageCount;
  if (!blockageCount)
  {
    NSLog( (NSString *)@"NSFileCoordinator: an access claim that was unblocked has somehow become blocked again.",  a2);
    unint64_t blockageCount = self->_blockageCount;
  }

  self->_unint64_t blockageCount = blockageCount + 1;
}

- (void)unblock
{
  unint64_t blockageCount = self->_blockageCount;
  if (!blockageCount)
  {
    NSLog( (NSString *)@"NSFileCoordinator: an access claim that was unblocked is somehow becoming even more unblocked.",  a2);
    unint64_t blockageCount = self->_blockageCount;
  }

  unint64_t v4 = blockageCount - 1;
  self->_unint64_t blockageCount = v4;
  if (!v4 && !self->_isRevoked)
  {
    processManager = self->_processManager;
    if (processManager) {
      -[NSFileAccessProcessManager preventSuspensionWithActivityName:]( processManager,  "preventSuspensionWithActivityName:",  +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"File Coordination Claim %@",  -[NSFileAccessClaim claimID](self, "claimID")));
    }
    -[NSFileAccessClaim granted](self, "granted");
  }

- (BOOL)didWait
{
  return self->_didWait;
}

- (void)blockClaimerForReason:(id)a3
{
  if (!-[NSMutableArray count](self->_claimerBlockageReasons, "count")) {
    NSLog( (NSString *)@"NSFileCoordinator: -[NSFileAccessClaim blockClaimerForReason:] is being invoked with %@ when the claimer has already been invoked.",  a3);
  }
  -[NSMutableArray addObject:](self->_claimerBlockageReasons, "addObject:", a3);
}

- (void)unblockClaimerForReason:(id)a3
{
  uint64_t v4 = -[NSMutableArray indexOfObject:](self->_claimerBlockageReasons, "indexOfObject:", a3);
  if (v4 != 0x7FFFFFFFFFFFFFFFLL) {
    -[NSMutableArray removeObjectAtIndex:](self->_claimerBlockageReasons, "removeObjectAtIndex:", v4);
  }
  if (!-[NSMutableArray count](self->_claimerBlockageReasons, "count")) {
    -[NSFileAccessClaim invokeClaimer](self, "invokeClaimer");
  }
}

- (void)setClaimerError:(id)a3
{
  claimerError = self->_claimerError;
  if (claimerError != a3)
  {

    self->_claimerError = (NSError *)[a3 copy];
  }

- (id)claimerError
{
  return self->_claimerError;
}

- (BOOL)evaluateSelfWithRootNode:(id)a3 checkSubarbitrability:(BOOL)a4
{
  return 1;
}

- (void)whenRevokedPerformProcedure:(id)a3
{
  if (!self->_revocationProcedures) {
    self->_revocationProcedures = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
  }
  id v5 = (id)[a3 copy];
  -[NSMutableArray addObject:](self->_revocationProcedures, "addObject:", v5);
}

- (void)whenDevaluedPerformProcedure:(id)a3
{
  if (!self->_devaluationProcedures) {
    self->_devaluationProcedures = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
  }
  id v5 = (id)[a3 copy];
  -[NSMutableArray addObject:](self->_devaluationProcedures, "addObject:", v5);
}

- (void)whenFinishedPerformProcedure:(id)a3
{
  if (!self->_finishingProcedures) {
    self->_finishingProcedures = (NSMutableArray *)objc_alloc_init(MEMORY[0x189603FA8]);
  }
  id v5 = (id)[a3 copy];
  -[NSMutableArray addObject:](self->_finishingProcedures, "addObject:", v5);
}

- (void)addBlockingReactorID:(id)a3
{
  blockingReactorIDs = self->_blockingReactorIDs;
  if (!blockingReactorIDs)
  {
    blockingReactorIDs = objc_alloc_init(&OBJC_CLASS___NSCountedSet);
    self->_blockingReactorIDs = blockingReactorIDs;
  }

  -[NSCountedSet addObject:](blockingReactorIDs, "addObject:", a3);
}

- (void)removeBlockingReactorID:(id)a3
{
}

- (BOOL)claimerInvokingIsBlockedByReactorWithID:(id)a3
{
  id v5 = objc_alloc_init(MEMORY[0x189603FE0]);
  LOBYTE(a3) = -[NSFileAccessClaim _recursive_claimerInvokingIsBlockedByReactorWithID:checkedClaims:]( (uint64_t)self,  (uint64_t)a3,  v5);

  return (char)a3;
}

- (uint64_t)_recursive_claimerInvokingIsBlockedByReactorWithID:(void *)a3 checkedClaims:
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (result)
  {
    uint64_t v5 = result;
    if ([a3 containsObject:result]) {
      return 0LL;
    }
    if ([*(id *)(v5 + 88) containsObject:a2]) {
      return 1LL;
    }
    [a3 addObject:v5];
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    __int128 v11 = 0u;
    __int128 v12 = 0u;
    int v6 = *(void **)(v5 + 80);
    result = [v6 countByEnumeratingWithState:&v11 objects:v10 count:16];
    if (result)
    {
      uint64_t v7 = result;
      uint64_t v8 = *(void *)v12;
LABEL_9:
      uint64_t v9 = 0LL;
      while (1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        if ((-[NSFileAccessClaim _recursive_claimerInvokingIsBlockedByReactorWithID:checkedClaims:]( *(void *)(*((void *)&v11 + 1) + 8 * v9),  a2,  a3) & 1) != 0) {
          return 1LL;
        }
        if (v7 == ++v9)
        {
          uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v10 count:16];
          result = 0LL;
          if (v7) {
            goto LABEL_9;
          }
          return result;
        }
      }
    }
  }

  return result;
}

- (BOOL)isBlockedByClaimWithPurposeID:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  blockingClaims = self->_blockingClaims;
  uint64_t v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( blockingClaims,  "countByEnumeratingWithState:objects:count:",  &v11,  v10,  16LL);
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      uint64_t v8 = 0LL;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(blockingClaims);
        }
        if (objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v8), "purposeID"), "isEqual:", a3))
        {
          LOBYTE(v5) = 1;
          return v5;
        }

        ++v8;
      }

      while (v6 != v8);
      uint64_t v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:]( blockingClaims,  "countByEnumeratingWithState:objects:count:",  &v11,  v10,  16LL);
      uint64_t v6 = v5;
      if (v5) {
        continue;
      }
      break;
    }
  }

  return v5;
}

- (void)givePriorityToClaim:(id)a3
{
  v8[1] = *MEMORY[0x1895F89C0];
  uint64_t v5 = [a3 claimID];
  uint64_t v6 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Avoiding deadlock with claim: %@",  v5);
  -[NSFileAccessClaim blockClaimerForReason:](self, "blockClaimerForReason:", v6);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __41__NSFileAccessClaim_givePriorityToClaim___block_invoke;
  v7[3] = &unk_189CA16F0;
  v7[4] = self;
  void v7[5] = v5;
  v7[6] = v6;
  [a3 whenDevaluedPerformProcedure:v7];
  v8[0] = a3;
  -[NSFileAccessClaim removePendingClaims:]( self,  "removePendingClaims:",  [MEMORY[0x189603F18] arrayWithObjects:v8 count:1]);
}

uint64_t __41__NSFileAccessClaim_givePriorityToClaim___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v2 = (os_log_s *)_NSFCClaimsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 16LL);
    int v6 = 138543618;
    uint64_t v7 = v4;
    __int16 v8 = 2114;
    uint64_t v9 = v3;
    _os_log_impl( &dword_182EB1000,  v2,  OS_LOG_TYPE_DEFAULT,  "Unblocking claimer for claim %{public}@ because the claim it was avoiding a deadlock with finished: %{public}@",  (uint8_t *)&v6,  0x16u);
  }

  *(_BYTE *)(*(void *)(a1 + 32) + 48LL) = 1;
  return [*(id *)(a1 + 32) unblockClaimerForReason:*(void *)(a1 + 48)];
}

- (void)scheduleBlockedClaim:(id)a3
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  uint64_t v5 = [a3 purposeID];
  if (v5)
  {
    uint64_t v6 = v5;
    if (-[NSFileAccessClaim claimerInvokingIsBlockedByReactorWithID:]( self,  "claimerInvokingIsBlockedByReactorWithID:",  v5))
    {
      uint64_t v7 = (os_log_s *)_NSFCClaimsLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [a3 claimID];
        claimID = self->_claimID;
        *(_DWORD *)v20 = 138543874;
        *(void *)&v20[4] = v8;
        *(_WORD *)&v20[12] = 2114;
        *(void *)&v20[14] = claimID;
        *(_WORD *)&v20[22] = 2114;
        uint64_t v21 = v6;
        uint64_t v10 = "Letting claim %{public}@ go before blocking claim %{public}@ because the latter is blocked by a reactor wi"
              "th the former's purposeID: %{public}@";
LABEL_8:
        _os_log_impl(&dword_182EB1000, v7, OS_LOG_TYPE_DEFAULT, v10, v20, 0x20u);
        goto LABEL_9;
      }

      goto LABEL_9;
    }

    if (-[NSFileAccessClaim isBlockedByClaimWithPurposeID:](self, "isBlockedByClaimWithPurposeID:", v6))
    {
      uint64_t v7 = (os_log_s *)_NSFCClaimsLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = [a3 claimID];
        __int128 v12 = self->_claimID;
        *(_DWORD *)v20 = 138543874;
        *(void *)&v20[4] = v11;
        *(_WORD *)&v20[12] = 2114;
        *(void *)&v20[14] = v12;
        *(_WORD *)&v20[22] = 2114;
        uint64_t v21 = v6;
        uint64_t v10 = "Letting claim %{public}@ go before blocking claim %{public}@ because the latter is blocked by another clai"
              "m with the former's purposeID: %{public}@";
        goto LABEL_8;
      }

- (void)evaluateNewClaim:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  if (a3 != self)
  {
    uint64_t v5 = [a3 purposeID];
    if (v5 && -[NSString isEqual:](self->_purposeIDOrNil, "isEqual:", v5) && !self->_isRevoked)
    {
      uint64_t v6 = (os_log_s *)_NSFCClaimsLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = [a3 claimID];
        claimID = self->_claimID;
        purposeIDOrNil = self->_purposeIDOrNil;
        int v10 = 138543874;
        uint64_t v11 = v7;
        __int16 v12 = 2114;
        int v13 = claimID;
        __int16 v14 = 2114;
        BOOL v15 = purposeIDOrNil;
        _os_log_impl( &dword_182EB1000,  v6,  OS_LOG_TYPE_INFO,  "Claim %{public}@ is not blocked by %{public}@ because it has the same purposeID: %{public}@",  (uint8_t *)&v10,  0x20u);
      }
    }

    else if (-[NSFileAccessClaim blocksClaim:](self, "blocksClaim:", a3))
    {
      -[NSFileAccessClaim scheduleBlockedClaim:](self, "scheduleBlockedClaim:", a3);
    }
  }

- (void)addPendingClaim:(id)a3
{
  pendingClaims = self->_pendingClaims;
  if (!pendingClaims)
  {
    pendingClaims = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x189603FD0]);
    self->_pendingClaims = pendingClaims;
  }

  if ((-[NSMutableOrderedSet containsObject:](pendingClaims, "containsObject:", a3) & 1) == 0)
  {
    -[NSMutableOrderedSet addObject:](self->_pendingClaims, "addObject:", a3);
    [a3 block];
    id v6 = (id)*((void *)a3 + 10);
    if (!v6)
    {
      id v6 = objc_alloc_init(MEMORY[0x189603FE0]);
      *((void *)a3 + 10) = v6;
    }

    [v6 addObject:self];
    *((_BYTE *)a3 + 48) = 1;
  }

- (id)pendingClaims
{
  pendingClaims = self->_pendingClaims;
  if (!pendingClaims) {
    pendingClaims = (NSMutableOrderedSet *)MEMORY[0x189603F18];
  }
  return (id)-[NSMutableOrderedSet array](pendingClaims, "array");
}

- (void)removePendingClaims:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(id **)(*((void *)&v11 + 1) + 8 * i);
        if (-[NSMutableOrderedSet containsObject:](self->_pendingClaims, "containsObject:", v9))
        {
          [v9[10] removeObject:self];
          [v9 unblock];
        }
      }

      uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v10 count:16];
    }

    while (v6);
  }

  -[NSMutableOrderedSet removeObjectsInArray:](self->_pendingClaims, "removeObjectsInArray:", a3);
}

- (BOOL)isBlockedByReadingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  return 0;
}

- (BOOL)isBlockedByWritingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  return 0;
}

- (void)ensureProvidersOfItemsAtReadingLocations:(id)a3 writingLocations:(id)a4 thenContinue:(id)a5
{
  if ([a3 count] || objc_msgSend(a4, "count"))
  {
    id v9 = (id)objc_opt_new();
    if (a3) {
      [v9 addObjectsFromArray:a3];
    }
    if (a4) {
      [v9 addObjectsFromArray:a4];
    }
    +[NSFileAccessArbiter ensureProvidersIfNecessaryForClaim:user:atLocations:queue:thenContinue:]( &OBJC_CLASS___NSFileAccessArbiter,  "ensureProvidersIfNecessaryForClaim:user:atLocations:queue:thenContinue:",  self,  -[NSXPCConnection effectiveUserIdentifier](self->_client, "effectiveUserIdentifier"),  v9,  self->_arbiterQueue,  a5);
  }

  else
  {
    (*((void (**)(id))a5 + 2))(a5);
  }

- (BOOL)shouldMakeProviderProvideItemAtLocation:(id)a3 withOptions:(unint64_t)a4
{
  char v4 = a4;
  uint64_t v6 = (void *)[a3 itemProvider];
  if (v6)
  {
    if (-[NSString isEqual:](self->_purposeIDOrNil, "isEqual:", [v6 reactorID])) {
      LOBYTE(v6) = 0;
    }
    else {
      LOBYTE(v6) = !self->_cameFromSuperarbiter && (v4 & 4) == 0LL;
    }
  }

  return (char)v6;
}

- (void)makeProviderOfItemAtLocation:(id)a3 provideIfNecessaryWithOptions:(unint64_t)a4 thenContinue:(id)a5
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_arbiterQueue);
  if (-[NSFileAccessClaim shouldMakeProviderProvideItemAtLocation:withOptions:]( self,  "shouldMakeProviderProvideItemAtLocation:withOptions:",  a3,  a4))
  {
    id v9 = (void *)[a3 itemProvider];
    uint64_t v10 = [v9 reactorID];
    __int128 v11 = (os_log_s *)_NSFCClaimsLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      claimID = self->_claimID;
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = claimID;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v10;
      _os_log_impl( &dword_182EB1000,  v11,  OS_LOG_TYPE_DEFAULT,  "Claimer for %{public}@ is waiting for provider %{public}@ to provide",  buf,  0x16u);
    }

    __int128 v13 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Waiting for provider %@ to provide",  v10);
    -[NSFileAccessClaim blockClaimerForReason:](self, "blockClaimerForReason:", v13);
    -[NSFileAccessClaim addBlockingReactorID:](self, "addBlockingReactorID:", v10);
    *(void *)buf = 0LL;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3052000000LL;
    v19 = __Block_byref_object_copy__26;
    v20 = __Block_byref_object_dispose__26;
    uint64_t v21 = 0LL;
    uint64_t v14 = [a3 url];
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __93__NSFileAccessClaim_makeProviderOfItemAtLocation_provideIfNecessaryWithOptions_thenContinue___block_invoke;
    v17[3] = &unk_189CA3610;
    v17[4] = v10;
    v17[5] = self;
    v17[7] = a5;
    v17[8] = buf;
    v17[6] = v13;
    uint64_t v15 = (void *)[v9 provideItemAtURL:v14 withOptions:a4 forAccessClaim:self completionHandler:v17];
    *(void *)(*(void *)&buf[8] + 40LL) = v15;
    if (v15)
    {
      if (!self->_providerCancellationProcedures)
      {
        self->_providerCancellationProcedures = (NSMutableArray *)objc_opt_new();
        uint64_t v15 = *(void **)(*(void *)&buf[8] + 40LL);
      }

      uint64_t v16 = (void *)[v15 copy];
      -[NSMutableArray addObject:](self->_providerCancellationProcedures, "addObject:", v16);
    }

    _Block_object_dispose(buf, 8);
  }

  else
  {
    (*((void (**)(id, uint64_t))a5 + 2))(a5, 1LL);
  }

uint64_t __93__NSFileAccessClaim_makeProviderOfItemAtLocation_provideIfNecessaryWithOptions_thenContinue___block_invoke( uint64_t a1,  void *a2)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  char v4 = (os_log_s *)_NSFCClaimsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 16LL);
    int v16 = 138543618;
    uint64_t v17 = v5;
    __int16 v18 = 2114;
    uint64_t v19 = v6;
    _os_log_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_DEFAULT,  "Provider %{public}@ finished, unblocking claimer for %{public}@",  (uint8_t *)&v16,  0x16u);
  }

  uint64_t v7 = [a2 sandboxToken];
  if (v7)
  {
    uint64_t v8 = v7;
    id v9 = *(void **)(*(void *)(a1 + 40) + 176LL);
    if (!v9)
    {
      *(void *)(*(void *)(a1 + 40) + 176LL) = objc_opt_new();
      id v9 = *(void **)(*(void *)(a1 + 40) + 176LL);
    }

    [v9 addObject:v8];
  }

  [*(id *)(a1 + 40) removeBlockingReactorID:*(void *)(a1 + 32)];
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 40LL)) {
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 96), "removeObject:");
  }
  uint64_t v10 = [a2 error];
  if (v10)
  {
    uint64_t v11 = v10;
    __int128 v12 = (os_log_s *)_NSFCClaimsLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = [*(id *)(a1 + 40) claimID];
      int v16 = 138543874;
      uint64_t v17 = v14;
      __int16 v18 = 2114;
      uint64_t v19 = v15;
      __int16 v20 = 2112;
      uint64_t v21 = v11;
      _os_log_error_impl( &dword_182EB1000,  v12,  OS_LOG_TYPE_ERROR,  "Provider %{public}@, while providing for claim %{public}@, returned an error: %@",  (uint8_t *)&v16,  0x20u);
    }

    [*(id *)(a1 + 40) setClaimerError:v11];
  }

  (*(void (**)(void, BOOL))(*(void *)(a1 + 56) + 16))( *(void *)(a1 + 56),  [*(id *)(a1 + 40) claimerError] == 0);
  return [*(id *)(a1 + 40) unblockClaimerForReason:*(void *)(a1 + 48)];
}

- (void)_checkIfMovingRequiresProvidingAmongWritingLocations:(id)a3 options:(unint64_t *)a4 thenContinue:(id)a5
{
  uint64_t v63 = *MEMORY[0x1895F89C0];
  if ((unint64_t)[a3 count] < 2)
  {
    (*((void (**)(id, void))a5 + 2))(a5, 0LL);
  }

  else
  {
    v39 = (void (**)(id, void *))a5;
    id v9 = (void *)objc_opt_new();
    uint64_t v10 = (void *)objc_opt_new();
    uint64_t v11 = (void *)objc_opt_new();
    v47[0] = MEMORY[0x1895F87A8];
    v47[1] = 3221225472LL;
    v47[2] = __95__NSFileAccessClaim__checkIfMovingRequiresProvidingAmongWritingLocations_options_thenContinue___block_invoke;
    v47[3] = &unk_189CA3638;
    v47[4] = v10;
    v47[5] = v11;
    v47[6] = v9;
    v47[7] = a4;
    [a3 enumerateObjectsUsingBlock:v47];

    v41 = (void *)[MEMORY[0x189603FE0] set];
    obuint64_t j = (id)objc_opt_new();
    __int128 v59 = 0u;
    __int128 v60 = 0u;
    __int128 v61 = 0u;
    __int128 v62 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v59 objects:v58 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v60;
      do
      {
        for (uint64_t i = 0LL; i != v12; ++i)
        {
          if (*(void *)v60 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          int v16 = (void *)[v15 objectAtIndexedSubscript:0];
          uint64_t v17 = (void *)[v15 objectAtIndexedSubscript:1];
          BOOL v18 = -[NSFileAccessClaim shouldMakeProviderProvideItemAtLocation:withOptions:]( self,  "shouldMakeProviderProvideItemAtLocation:withOptions:",  v16,  0LL);
          if (v16 != v17 && v18)
          {
            __int16 v20 = (void *)[v16 itemProvider];
            uint64_t v21 = (void *)[v17 itemProvider];
            if (v20 == v21
              || objc_msgSend( (id)objc_msgSend(v20, "reactorID"),  "isEqualToString:",  objc_msgSend(v21, "reactorID")))
            {
              [obj addObject:v15];
            }

            else
            {
              [v41 addObject:v16];
            }
          }
        }

        uint64_t v12 = [v11 countByEnumeratingWithState:&v59 objects:v58 count:16];
      }

      while (v12);
    }

    if ([obj count])
    {
      uint64_t v22 = +[NSString stringWithFormat:]( NSString,  "stringWithFormat:",  @"Checking with provider about %ld moving items",  [obj count]);
      -[NSFileAccessClaim blockClaimerForReason:](self, "blockClaimerForReason:", v22);
      v38 = v22;
      v45[0] = 0LL;
      v45[1] = v45;
      v45[2] = 0x2810000000LL;
      v45[3] = &unk_183A8509D;
      int v46 = 0;
      v23 = dispatch_group_create();
      id v42 = (id)objc_msgSend(objc_alloc(MEMORY[0x189603FA8]), "initWithCapacity:", objc_msgSend(obj, "count"));
      __int128 v56 = 0u;
      __int128 v57 = 0u;
      __int128 v54 = 0u;
      __int128 v55 = 0u;
      uint64_t v24 = [obj countByEnumeratingWithState:&v54 objects:v53 count:16];
      if (v24)
      {
        uint64_t v25 = *(void *)v55;
        do
        {
          for (uint64_t j = 0LL; j != v24; ++j)
          {
            if (*(void *)v55 != v25) {
              objc_enumerationMutation(obj);
            }
            v27 = *(void **)(*((void *)&v54 + 1) + 8 * j);
            v28 = (void *)[v27 objectAtIndexedSubscript:0];
            v29 = (void *)[v27 objectAtIndexedSubscript:1];
            dispatch_group_enter(v23);
            v30 = (void *)[v28 itemProvider];
            objc_msgSend(v42, "addObject:", objc_msgSend(v30, "reactorID"));
            uint64_t v31 = [v28 standardizedURL];
            uint64_t v32 = objc_msgSend((id)objc_msgSend(v29, "parent"), "standardizedURL");
            uint64_t v33 = [v29 name];
            v44[0] = MEMORY[0x1895F87A8];
            v44[1] = 3221225472LL;
            v44[2] = __95__NSFileAccessClaim__checkIfMovingRequiresProvidingAmongWritingLocations_options_thenContinue___block_invoke_2;
            v44[3] = &unk_189CA3660;
            v44[7] = v23;
            v44[8] = v45;
            v44[4] = v41;
            v44[5] = v28;
            v44[6] = self;
            [v30 movingItemAtURL:v31 requiresProvidingWithDestinationDirectoryURL:v32 newFileName:v33 completionHandler:v44];
          }

          uint64_t v24 = [obj countByEnumeratingWithState:&v54 objects:v53 count:16];
        }

        while (v24);
      }

      __int128 v51 = 0u;
      __int128 v52 = 0u;
      __int128 v49 = 0u;
      __int128 v50 = 0u;
      uint64_t v34 = [v42 countByEnumeratingWithState:&v49 objects:v48 count:16];
      if (v34)
      {
        uint64_t v35 = *(void *)v50;
        do
        {
          for (uint64_t k = 0LL; k != v34; ++k)
          {
            if (*(void *)v50 != v35) {
              objc_enumerationMutation(v42);
            }
            -[NSFileAccessClaim addBlockingReactorID:]( self,  "addBlockingReactorID:",  *(void *)(*((void *)&v49 + 1) + 8 * k));
          }

          uint64_t v34 = [v42 countByEnumeratingWithState:&v49 objects:v48 count:16];
        }

        while (v34);
      }

      arbiterQueue = (dispatch_queue_s *)self->_arbiterQueue;
      block[0] = MEMORY[0x1895F87A8];
      block[1] = 3221225472LL;
      block[2] = __95__NSFileAccessClaim__checkIfMovingRequiresProvidingAmongWritingLocations_options_thenContinue___block_invoke_3;
      block[3] = &unk_189CA3688;
      block[4] = v41;
      block[5] = self;
      block[6] = v38;
      block[7] = v42;
      block[8] = v39;
      dispatch_group_notify(v23, arbiterQueue, block);
      dispatch_release(v23);
      _Block_object_dispose(v45, 8);
    }

    else
    {
      v39[2](v39, v41);
    }
  }

uint64_t __95__NSFileAccessClaim__checkIfMovingRequiresProvidingAmongWritingLocations_options_thenContinue___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  v11[2] = *MEMORY[0x1895F89C0];
  if ((*(void *)(*(void *)(a1 + 56) + 8 * a3) & 2) != 0)
  {
    if ([*(id *)(a1 + 32) count])
    {
      v11[0] = a2;
      uint64_t v7 = *(void **)(a1 + 40);
      v11[1] = [*(id *)(a1 + 32) firstObject];
      objc_msgSend(v7, "addObject:", objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v11, 2));
      uint64_t v6 = *(void **)(a1 + 32);
      return [v6 removeObjectAtIndex:0];
    }

    id v9 = *(void **)(a1 + 48);
  }

  else
  {
    if ([*(id *)(a1 + 48) count])
    {
      uint64_t v5 = *(void **)(a1 + 40);
      v10[0] = [*(id *)(a1 + 48) firstObject];
      v10[1] = a2;
      objc_msgSend(v5, "addObject:", objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v10, 2));
      uint64_t v6 = *(void **)(a1 + 48);
      return [v6 removeObjectAtIndex:0];
    }

    id v9 = *(void **)(a1 + 32);
  }

  return [v9 addObject:a2];
}

void __95__NSFileAccessClaim__checkIfMovingRequiresProvidingAmongWritingLocations_options_thenContinue___block_invoke_2( uint64_t a1,  void *a2)
{
}

void __95__NSFileAccessClaim__checkIfMovingRequiresProvidingAmongWritingLocations_options_thenContinue___block_invoke_3( uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  (*(void (**)(void))(*(void *)(a1 + 64) + 16LL))();
  [*(id *)(a1 + 40) unblockClaimerForReason:*(void *)(a1 + 48)];
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v8 = 0u;
  __int128 v9 = 0u;
  v2 = *(void **)(a1 + 56);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0LL; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(a1 + 40) removeBlockingReactorID:*(void *)(*((void *)&v8 + 1) + 8 * i)];
      }

      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v7 count:16];
    }

    while (v4);
  }
}

- (void)makeProvidersProvideItemsForReadingLocations:(id)a3 options:(unint64_t *)a4 andWritingLocationsIfNecessary:(id)a5 options:(unint64_t *)a6 thenContinue:(id)a7
{
  v13[10] = *MEMORY[0x1895F89C0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_arbiterQueue);
  v13[0] = MEMORY[0x1895F87A8];
  v13[1] = 3221225472LL;
  v13[2] = __126__NSFileAccessClaim_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue___block_invoke;
  v13[3] = &unk_189CA3750;
  v13[4] = self;
  v13[5] = a5;
  v13[6] = a3;
  v13[7] = a7;
  v13[8] = a6;
  v13[9] = a4;
  -[NSFileAccessClaim ensureProvidersOfItemsAtReadingLocations:writingLocations:thenContinue:]( self,  "ensureProvidersOfItemsAtReadingLocations:writingLocations:thenContinue:",  a3,  a5,  v13);
}

uint64_t __126__NSFileAccessClaim_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue___block_invoke( uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __126__NSFileAccessClaim_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue___block_invoke_2;
  v6[3] = &unk_189CA3728;
  v6[4] = v3;
  int8x16_t v4 = *(int8x16_t *)(a1 + 40);
  int8x16_t v7 = vextq_s8(v4, v4, 8uLL);
  int8x16_t v5 = *(int8x16_t *)(a1 + 64);
  int8x16_t v9 = vextq_s8(v5, v5, 8uLL);
  uint64_t v8 = *(void *)(a1 + 56);
  return [v3 _checkIfMovingRequiresProvidingAmongWritingLocations:v4.i64[0] options:v5.i64[0] thenContinue:v6];
}

void __126__NSFileAccessClaim_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue___block_invoke_2( uint64_t a1,  void *a2)
{
  uint64_t v65 = *MEMORY[0x1895F89C0];
  if ([a2 count]) {
    [*(id *)(a1 + 32) setShouldEnableMaterializationDuringAccessorBlock:1];
  }
  int8x16_t v4 = (void *)objc_opt_new();
  uint64_t v46 = 0LL;
  v47 = &v46;
  uint64_t v48 = 0x2020000000LL;
  uint64_t v49 = 0LL;
  uint64_t v42 = 0LL;
  v43 = &v42;
  uint64_t v44 = 0x2020000000LL;
  uint64_t v45 = 0LL;
  v40[0] = 0LL;
  v40[1] = v40;
  v40[2] = 0x2020000000LL;
  char v41 = 1;
  dispatch_group_t v5 = dispatch_group_create();
  uint64_t v6 = MEMORY[0x1895F87A8];
  v33[0] = MEMORY[0x1895F87A8];
  v33[1] = 3221225472LL;
  uint64_t v34 = __126__NSFileAccessClaim_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue___block_invoke_3;
  uint64_t v35 = &unk_189CA36D8;
  v36 = v4;
  dispatch_group_t v37 = v5;
  uint64_t v38 = *(void *)(a1 + 32);
  v39 = v40;
  int8x16_t v7 = (void *)[a2 mutableCopy];
  v31[0] = v6;
  v31[1] = 3221225472LL;
  v31[2] = __126__NSFileAccessClaim_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue___block_invoke_5;
  v31[3] = &unk_189CA3700;
  uint64_t v8 = *(void **)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  v31[4] = *(void *)(a1 + 32);
  v31[5] = v9;
  __int128 v32 = *(_OWORD *)(a1 + 64);
  v31[6] = a2;
  v31[7] = v7;
  v31[8] = v33;
  v31[9] = &v42;
  v31[10] = &v46;
  [v8 enumerateObjectsUsingBlock:v31];
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  __int128 v61 = 0u;
  __int128 v62 = 0u;
  uint64_t v10 = [v7 countByEnumeratingWithState:&v61 objects:v60 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v62;
    do
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v62 != v11) {
          objc_enumerationMutation(v7);
        }
        v34((uint64_t)v33, *(void *)(*((void *)&v61 + 1) + 8 * i), 0x20000LL, v43 + 3);
      }

      uint64_t v10 = [v7 countByEnumeratingWithState:&v61 objects:v60 count:16];
    }

    while (v10);
  }

  __int128 v58 = 0u;
  __int128 v59 = 0u;
  __int128 v56 = 0u;
  __int128 v57 = 0u;
  v28 = v5;
  obuint64_t j = *(id *)(a1 + 48);
  uint64_t v13 = [obj countByEnumeratingWithState:&v56 objects:v55 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v57;
    do
    {
      for (uint64_t j = 0LL; j != v13; ++j)
      {
        if (*(void *)v57 != v14) {
          objc_enumerationMutation(obj);
        }
        int v16 = *(void **)(*((void *)&v56 + 1) + 8 * j);
        uint64_t v17 = [v16 parent];
        uint64_t v18 = a1;
        if ([*(id *)(a1 + 32) shouldMakeProviderProvideItemAtLocation:v17 withOptions:0]
          && ([v4 containsObject:v17] & 1) == 0
          && ([v4 containsObject:v16] & 1) == 0)
        {
          __int128 v53 = 0u;
          __int128 v54 = 0u;
          __int128 v51 = 0u;
          __int128 v52 = 0u;
          uint64_t v19 = [v4 countByEnumeratingWithState:&v51 objects:v50 count:16];
          if (v19)
          {
            uint64_t v20 = *(void *)v52;
LABEL_20:
            uint64_t v21 = 0LL;
            while (1)
            {
              if (*(void *)v52 != v20) {
                objc_enumerationMutation(v4);
              }
              if ([*(id *)(*((void *)&v51 + 1) + 8 * v21) itemIsInItemAtLocation:v17]) {
                break;
              }
              if (v19 == ++v21)
              {
                uint64_t v19 = [v4 countByEnumeratingWithState:&v51 objects:v50 count:16];
                if (v19) {
                  goto LABEL_20;
                }
                goto LABEL_26;
              }
            }
          }

          else
          {
LABEL_26:
            uint64_t v22 = [v16 parent];
            v34((uint64_t)v33, v22, 0x20000000LL, v43 + 3);
          }
        }

        a1 = v18;
      }

      uint64_t v13 = [obj countByEnumeratingWithState:&v56 objects:v55 count:16];
    }

    while (v13);
  }

  uint64_t v23 = MEMORY[0x1895F87A8];
  uint64_t v24 = v43[3];
  if (v47[3] | v24)
  {
    uint64_t v25 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Providing for %ld readers and %ld writers",  v47[3],  v24);
    [*(id *)(a1 + 32) blockClaimerForReason:v25];
    uint64_t v26 = *(void *)(a1 + 32);
    v27 = *(dispatch_queue_s **)(v26 + 184);
    block[0] = v23;
    block[1] = 3221225472LL;
    block[2] = __126__NSFileAccessClaim_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue___block_invoke_6;
    block[3] = &unk_189CA3EB0;
    block[6] = *(void *)(a1 + 56);
    block[7] = v40;
    block[4] = v26;
    block[5] = v25;
    dispatch_group_notify(v28, v27, block);
  }

  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }

  dispatch_release(v28);
  _Block_object_dispose(v40, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);
}

uint64_t __126__NSFileAccessClaim_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue___block_invoke_3( uint64_t a1,  uint64_t a2,  uint64_t a3,  void *a4)
{
  v10[6] = *MEMORY[0x1895F89C0];
  ++*a4;
  [*(id *)(a1 + 32) addObject:a2];
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  void v10[2] = __126__NSFileAccessClaim_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue___block_invoke_4;
  v10[3] = &unk_189CA36B0;
  int8x16_t v7 = *(void **)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  v10[4] = *(void *)(a1 + 40);
  v10[5] = v8;
  return [v7 makeProviderOfItemAtLocation:a2 provideIfNecessaryWithOptions:a3 thenContinue:v10];
}

void __126__NSFileAccessClaim_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue___block_invoke_4( uint64_t a1,  char a2)
{
  if ((a2 & 1) == 0) {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 0;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __126__NSFileAccessClaim_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue___block_invoke_5( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a1 + 88) + 8 * a3);
  uint64_t result = [*(id *)(a1 + 32) shouldMakeProviderProvideItemAtLocation:a2 withOptions:v5];
  int v7 = result;
  if ((_DWORD)result) {
    BOOL v8 = (v5 & 0x20000) == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8)
  {
LABEL_8:
    if (!v7) {
      return result;
    }
    goto LABEL_9;
  }

  uint64_t v9 = *(void **)(a1 + 40);
  if (v9)
  {
    uint64_t result = [v9 indexOfObjectIdenticalTo:a2];
    if (result != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (*(void *)(*(void *)(a1 + 96) + 8 * result) != 2LL) {
        return result;
      }
      goto LABEL_9;
    }

    goto LABEL_8;
  }

uint64_t __126__NSFileAccessClaim_makeProvidersProvideItemsForReadingLocations_options_andWritingLocationsIfNecessary_options_thenContinue___block_invoke_6( uint64_t a1)
{
  return [*(id *)(a1 + 32) unblockClaimerForReason:*(void *)(a1 + 40)];
}

- (void)makeProviderOfItemAtLocation:(id)a3 providePhysicalURLThenContinue:(id)a4
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  int v7 = (void *)[a3 itemProvider];
  uint64_t v8 = [v7 reactorID];
  if (!v7
    || (uint64_t v9 = v8, -[NSString isEqual:](self->_purposeIDOrNil, "isEqual:", v8))
    || self->_cameFromSuperarbiter
    || -[NSFileAccessClaim claimerError](self, "claimerError"))
  {
    (*((void (**)(id, void))a4 + 2))(a4, 0LL);
  }

  else
  {
    uint64_t v10 = (os_log_s *)_NSFCClaimsLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      claimID = self->_claimID;
      *(_DWORD *)buf = 138543618;
      int v16 = claimID;
      __int16 v17 = 2114;
      uint64_t v18 = v9;
      _os_log_impl( &dword_182EB1000,  v10,  OS_LOG_TYPE_DEFAULT,  "Claimer for %{public}@ is waiting for provider %{public}@ to provide a physical URL",  buf,  0x16u);
    }

    uint64_t v12 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Waiting for provider %@ to provide a physical URL",  v9);
    -[NSMutableArray addObject:](self->_claimerBlockageReasons, "addObject:", v12);
    -[NSFileAccessClaim addBlockingReactorID:](self, "addBlockingReactorID:", v9);
    uint64_t v13 = [a3 standardizedURL];
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __81__NSFileAccessClaim_makeProviderOfItemAtLocation_providePhysicalURLThenContinue___block_invoke;
    v14[3] = &unk_189CA3778;
    v14[4] = v9;
    v14[5] = self;
    v14[6] = v12;
    v14[7] = a4;
    [v7 providePhysicalURLForURL:v13 completionHandler:v14];
  }

uint64_t __81__NSFileAccessClaim_makeProviderOfItemAtLocation_providePhysicalURLThenContinue___block_invoke( uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v2 = (os_log_s *)_NSFCClaimsLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 16LL);
    int v6 = 138543618;
    uint64_t v7 = v3;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl( &dword_182EB1000,  v2,  OS_LOG_TYPE_DEFAULT,  "Provider %{public}@ has finished providing a physical URL, unblocking claimer for %{public}@",  (uint8_t *)&v6,  0x16u);
  }

  [*(id *)(a1 + 40) removeBlockingReactorID:*(void *)(a1 + 32)];
  [*(id *)(*(void *)(a1 + 40) + 56) removeObject:*(void *)(a1 + 48)];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16LL))();
}

- (void)makeProviderOfItemAtLocation:(id)a3 provideOrAttachPhysicalURLIfNecessaryForPurposeID:(id)a4 readingOptions:(unint64_t)a5 thenContinue:(id)a6
{
  char v7 = a5;
  uint64_t v15 = *MEMORY[0x1895F89C0];
  uint64_t v11 = (void *)[a3 itemProvider];
  if (v11
    && (char v12 = objc_msgSend((id)objc_msgSend(v11, "reactorID"), "isEqualToString:", a4), (v7 & 4) != 0)
    && (v12 & 1) == 0)
  {
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __128__NSFileAccessClaim_makeProviderOfItemAtLocation_provideOrAttachPhysicalURLIfNecessaryForPurposeID_readingOptions_thenContinue___block_invoke;
    v13[3] = &unk_189CA37A0;
    char v14 = 1;
    v13[4] = a3;
    v13[5] = a6;
    -[NSFileAccessClaim makeProviderOfItemAtLocation:providePhysicalURLThenContinue:]( self,  "makeProviderOfItemAtLocation:providePhysicalURLThenContinue:",  a3,  v13);
  }

  else
  {
    (*((void (**)(id, void))a6 + 2))(a6, 0LL);
  }

uint64_t __128__NSFileAccessClaim_makeProviderOfItemAtLocation_provideOrAttachPhysicalURLIfNecessaryForPurposeID_readingOptions_thenContinue___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (a2 && *(_BYTE *)(a1 + 48))
  {
    [*(id *)(a1 + 32) standardizedURL];
    _CFURLPromiseSetPhysicalURL();
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)makeProviderOfItemAtLocation:(id)a3 provideOrAttachPhysicalURLIfNecessaryForPurposeID:(id)a4 writingOptions:(unint64_t)a5 thenContinue:(id)a6
{
  char v7 = a5;
  uint64_t v15 = *MEMORY[0x1895F89C0];
  uint64_t v11 = (void *)[a3 itemProvider];
  if (v11
    && (char v12 = objc_msgSend((id)objc_msgSend(v11, "reactorID"), "isEqualToString:", a4), (v7 & 0x13) != 0)
    && (v12 & 1) == 0)
  {
    v13[0] = MEMORY[0x1895F87A8];
    v13[1] = 3221225472LL;
    v13[2] = __128__NSFileAccessClaim_makeProviderOfItemAtLocation_provideOrAttachPhysicalURLIfNecessaryForPurposeID_writingOptions_thenContinue___block_invoke;
    v13[3] = &unk_189CA37A0;
    BOOL v14 = (v7 & 0x11) == 0LL;
    v13[4] = a3;
    v13[5] = a6;
    -[NSFileAccessClaim makeProviderOfItemAtLocation:providePhysicalURLThenContinue:]( self,  "makeProviderOfItemAtLocation:providePhysicalURLThenContinue:",  a3,  v13);
  }

  else
  {
    (*((void (**)(id, void))a6 + 2))(a6, 0LL);
  }

uint64_t __128__NSFileAccessClaim_makeProviderOfItemAtLocation_provideOrAttachPhysicalURLIfNecessaryForPurposeID_writingOptions_thenContinue___block_invoke( uint64_t a1,  uint64_t a2)
{
  if (a2 && *(_BYTE *)(a1 + 48))
  {
    [*(id *)(a1 + 32) standardizedURL];
    _CFURLPromiseSetPhysicalURL();
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)makePresentersOfItemAtLocation:(id)a3 orContainedItem:(BOOL)a4 relinquishUsingProcedureGetter:(id)a5
{
  uint64_t v39 = *MEMORY[0x1895F89C0];
  if (!self->_cameFromSuperarbiter)
  {
    v26[0] = 0LL;
    v26[1] = v26;
    v26[2] = 0x2020000000LL;
    char v27 = 0;
    uint64_t v8 = MEMORY[0x1895F87A8];
    v25[0] = MEMORY[0x1895F87A8];
    v25[1] = 3221225472LL;
    v25[2] = __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke;
    v25[3] = &unk_189CA38B0;
    v25[4] = self;
    v25[5] = a3;
    v25[6] = a5;
    v25[7] = v26;
    v24[0] = MEMORY[0x1895F87A8];
    v24[1] = 3221225472LL;
    v24[2] = __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_5;
    v24[3] = &unk_189CA38D8;
    v24[4] = a3;
    v24[5] = v25;
    [a3 forEachPresenterOfContainingFilePackagePerformProcedure:v24];
    v23[0] = v8;
    v23[1] = 3221225472LL;
    v23[2] = __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_6;
    v23[3] = &unk_189CA3900;
    v23[4] = v25;
    [a3 forEachPresenterOfItemPerformProcedure:v23];
    if (a4 || [a3 itemIsFilePackage])
    {
      v22[0] = v8;
      v22[1] = 3221225472LL;
      v22[2] = __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_7;
      v22[3] = &unk_189CA3900;
      v22[4] = v25;
      [a3 forEachPresenterOfContainedItemPerformProcedure:v22];
    }

    uint64_t v9 = (void *)objc_msgSend( MEMORY[0x189603F18],  "arrayWithArray:",  -[NSFileAccessClaim pendingClaims](self, "pendingClaims"));
    if ([v9 count])
    {
      uint64_t v10 = (os_log_s *)_NSFCClaimsLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        claimID = self->_claimID;
        *(_DWORD *)buf = 138543362;
        uint64_t v29 = (uint64_t)claimID;
        _os_log_impl(&dword_182EB1000, v10, OS_LOG_TYPE_INFO, "Re-evaluating claims pending %{public}@", buf, 0xCu);
      }
    }

    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    uint64_t v12 = [v9 countByEnumeratingWithState:&v35 objects:v34 count:16];
    if (v12)
    {
      uint64_t v14 = *(void *)v36;
      *(void *)&__int128 v13 = 138543874LL;
      __int128 v21 = v13;
      do
      {
        uint64_t v15 = 0LL;
        do
        {
          if (*(void *)v36 != v14) {
            objc_enumerationMutation(v9);
          }
          int v16 = *(void **)(*((void *)&v35 + 1) + 8 * v15);
          uint64_t v17 = v16[24];
          if (v17
            && -[NSFileAccessClaim claimerInvokingIsBlockedByReactorWithID:]( self,  "claimerInvokingIsBlockedByReactorWithID:",  v16[24]))
          {
            uint64_t v18 = (os_log_s *)_NSFCClaimsLog();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v19 = [v16 claimID];
              uint64_t v20 = self->_claimID;
              *(_DWORD *)buf = v21;
              uint64_t v29 = v19;
              __int16 v30 = 2114;
              uint64_t v31 = v20;
              __int16 v32 = 2114;
              uint64_t v33 = v17;
              _os_log_impl( &dword_182EB1000,  v18,  OS_LOG_TYPE_DEFAULT,  "Letting claim %{public}@ go before blocking claim %{public}@ because the latter is blocked by a reactor with the former's purposeID: %{public}@",  buf,  0x20u);
            }

            -[NSFileAccessClaim givePriorityToClaim:](self, "givePriorityToClaim:", v16, v21);
          }

          ++v15;
        }

        while (v12 != v15);
        uint64_t v12 = [v9 countByEnumeratingWithState:&v35 objects:v34 count:16];
      }

      while (v12);
    }

    _Block_object_dispose(v26, 8);
  }

void __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  uint64_t a4)
{
  uint64_t v28 = *MEMORY[0x1895F89C0];
  uint64_t v18 = 0LL;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x2020000000LL;
  char v21 = 1;
  uint64_t v7 = [*(id *)(a1 + 32) purposeID];
  uint64_t v8 = MEMORY[0x1895F87A8];
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_2;
  v17[3] = &unk_189CA37C8;
  uint64_t v9 = *(void **)(a1 + 40);
  v17[4] = *(void *)(a1 + 32);
  v17[5] = v7;
  v17[6] = &v18;
  [v9 forEachAccessClaimOnItemOrContainedItemPerformProcedure:v17];
  if (*((_BYTE *)v19 + 24))
  {
    uint64_t v10 = [a2 reactorID];
    uint64_t v11 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
    if (v11)
    {
      uint64_t v12 = (os_log_s *)_NSFCClaimsLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 16LL);
        *(_DWORD *)buf = 138543874;
        uint64_t v23 = v13;
        __int16 v24 = 2114;
        uint64_t v25 = v10;
        __int16 v26 = 2082;
        uint64_t v27 = a4;
        _os_log_impl( &dword_182EB1000,  v12,  OS_LOG_TYPE_DEFAULT,  "Claimer for %{public}@ is waiting for presenter %{public}@ on %{public}s to relinquish",  buf,  0x20u);
      }

      uint64_t v14 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Waiting for presenter %@ to relinquish",  v10);
      [*(id *)(a1 + 32) blockClaimerForReason:v14];
      [*(id *)(a1 + 32) addBlockingReactorID:v10];
      v16[0] = v8;
      v16[1] = 3221225472LL;
      v16[2] = __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_65;
      v16[3] = &unk_189CA3888;
      uint64_t v15 = *(void *)(a1 + 32);
      v16[4] = v10;
      v16[5] = v15;
      v16[6] = v14;
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v16);
      *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    }
  }

  _Block_object_dispose(&v18, 8);
}

uint64_t __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_2( uint64_t result,  void *a2)
{
  if (*(void **)(result + 32) != a2)
  {
    uint64_t v2 = result;
    uint64_t result = [a2 claimerInvokingIsBlockedByReactorWithID:*(void *)(result + 40)];
    if ((_DWORD)result) {
      *(_BYTE *)(*(void *)(*(void *)(v2 + 48) + 8LL) + 24LL) = 0;
    }
  }

  return result;
}

uint64_t __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_65( void *a1,  int a2,  void *a3,  uint64_t a4)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  uint64_t v8 = (os_log_s *)_NSFCClaimsLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = a1[4];
    uint64_t v10 = *(void *)(a1[5] + 16LL);
    *(_DWORD *)buf = 138543618;
    uint64_t v23 = v9;
    __int16 v24 = 2114;
    uint64_t v25 = v10;
    _os_log_impl( &dword_182EB1000,  v8,  OS_LOG_TYPE_DEFAULT,  "Presenter %{public}@ has finished relinquishing, unblocking claimer for %{public}@",  buf,  0x16u);
  }

  uint64_t v11 = MEMORY[0x1895F87A8];
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_66;
  v21[3] = &unk_189CA3818;
  uint64_t v12 = (void *)a1[5];
  v21[4] = a1[4];
  v21[5] = v12;
  v21[6] = a4;
  objc_msgSend(v12, "removeBlockingReactorID:");
  uint64_t v13 = a1[5];
  if (*(_BYTE *)(v13 + 49))
  {
    __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_66( (uint64_t)v21,  (uint64_t)&__block_literal_global_75);
  }

  else
  {
    uint64_t v14 = *(void **)(v13 + 104);
    if (!v14)
    {
      *(void *)(a1[5] + 104LL) = objc_alloc_init(MEMORY[0x189603FC8]);
      uint64_t v14 = *(void **)(a1[5] + 104LL);
    }

    uint64_t v15 = [v14 objectForKey:a1[4]];
    int v16 = v21;
    if (v15)
    {
      v20[0] = v11;
      v20[1] = 3221225472LL;
      v20[2] = __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_3;
      v20[3] = &unk_189CA3860;
      v20[4] = v21;
      v20[5] = v15;
      int v16 = v20;
    }

    uint64_t v17 = (void *)[v16 copy];
    [*(id *)(a1[5] + 104) setObject:v17 forKey:a1[4]];
  }

  uint64_t v18 = (void *)a1[5];
  if (a2 && !v18[8])
  {
    *(void *)(a1[5] + 64) = [a3 copy];
    uint64_t v18 = (void *)a1[5];
  }

  return [v18 unblockClaimerForReason:a1[6]];
}

uint64_t __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_66( uint64_t a1,  uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (os_log_s *)_NSFCClaimsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 16LL);
    *(_DWORD *)buf = 138543618;
    uint64_t v16 = v5;
    __int16 v17 = 2114;
    uint64_t v18 = v6;
    _os_log_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_DEFAULT,  "Making presenter %{public}@ reacquire after claim %{public}@",  buf,  0x16u);
  }

  [*(id *)(a1 + 40) addBlockingReactorID:*(void *)(a1 + 32)];
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v9 = MEMORY[0x1895F87A8];
  uint64_t v10 = 3221225472LL;
  uint64_t v11 = __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_67;
  uint64_t v12 = &unk_189CA37F0;
  int8x16_t v13 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
  uint64_t v14 = a2;
  return (*(uint64_t (**)(void))(v7 + 16))();
}

uint64_t __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_67( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

uint64_t __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_3( uint64_t a1,  uint64_t a2)
{
  v4[6] = *MEMORY[0x1895F89C0];
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_4;
  v4[3] = &unk_189CA3328;
  uint64_t v2 = *(void *)(a1 + 32);
  v4[4] = *(void *)(a1 + 40);
  v4[5] = a2;
  return (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, v4);
}

uint64_t __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_4( uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16LL))( *(void *)(a1 + 32),  *(void *)(a1 + 40));
}

void __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_5( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  uint64_t v5 = (void *)MEMORY[0x186E1FF60]();
  [*(id *)(a1 + 32) pathFromAncestor:a3];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  objc_autoreleasePoolPop(v5);
}

void __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_6( uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x186E1FF60]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  objc_autoreleasePoolPop(v2);
}

void __99__NSFileAccessClaim_makePresentersOfItemAtLocation_orContainedItem_relinquishUsingProcedureGetter___block_invoke_7( uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x186E1FF60]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
  objc_autoreleasePoolPop(v2);
}

- (BOOL)canAccessLocations:(id)a3 forReading:(BOOL)a4 error:(id *)a5
{
  BOOL v19 = a4;
  uint64_t v34 = *MEMORY[0x1895F89C0];
  uint64_t v21 = 0LL;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x2020000000LL;
  char v24 = 1;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v30 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v31;
    uint64_t v10 = MEMORY[0x1895F87A8];
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(a3);
        }
        uint64_t v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        v20[0] = v10;
        v20[1] = 3221225472LL;
        v20[2] = __57__NSFileAccessClaim_canAccessLocations_forReading_error___block_invoke;
        v20[3] = &unk_189CA3928;
        v20[4] = self;
        v20[5] = &v21;
        [v12 forEachPresenterOfItemPerformProcedure:v20];
      }

      uint64_t v8 = [a3 countByEnumeratingWithState:&v30 objects:v29 count:16];
    }

    while (v8);
  }

  if (!*((_BYTE *)v22 + 24))
  {
    int8x16_t v13 = (os_log_s *)_NSFCClaimsLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      claimID = self->_claimID;
      purposeIDOrNil = self->_purposeIDOrNil;
      *(_DWORD *)buf = 138543618;
      uint64_t v26 = claimID;
      __int16 v27 = 2114;
      uint64_t v28 = purposeIDOrNil;
      _os_log_error_impl( &dword_182EB1000,  v13,  OS_LOG_TYPE_ERROR,  "Denying access for claim %{public}@ because the presenter (reactor ID: %{public}@) performing it has been disconnected",  buf,  0x16u);
      if (!a5) {
        goto LABEL_15;
      }
    }

    else if (!a5)
    {
      goto LABEL_15;
    }

    if (v19) {
      uint64_t v14 = 257LL;
    }
    else {
      uint64_t v14 = 513LL;
    }
    *a5 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  v14,  0LL);
  }

uint64_t __57__NSFileAccessClaim_canAccessLocations_forReading_error___block_invoke(uint64_t result, void *a2)
{
  if (*(_BYTE *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL))
  {
    uint64_t v3 = result;
    uint64_t result = objc_msgSend((id)objc_msgSend(a2, "reactorID"), "isEqual:", *(void *)(*(void *)(result + 32) + 24));
    if ((_DWORD)result)
    {
      uint64_t result = [a2 disconnected];
      *(_BYTE *)(*(void *)(*(void *)(v3 + 40) + 8LL) + 24LL) = result ^ 1;
    }
  }

  return result;
}

- (BOOL)_writeArchiveOfDirectoryAtURL:(id)a3 toURL:(id)a4 error:(id *)a5
{
  uint64_t v57 = *MEMORY[0x1895F89C0];
  uint64_t v8 = (void *)[a3 path];
  uint64_t v9 = (char *)[a3 fileSystemRepresentation];
  uint64_t v10 = [a4 fileSystemRepresentation];
  if (!v8 || !v9 || !v10)
  {
    if (!a5) {
      return 0;
    }
    v53[0] = @"NSSourceFilePathErrorKey";
    v53[1] = @"NSDestinationFilePath";
    v54[0] = a3;
    v54[1] = a4;
    __int16 v17 = +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  256,  [MEMORY[0x189603F68] dictionaryWithObjects:v54 forKeys:v53 count:2]);
    BOOL result = 0;
    *a5 = v17;
    return result;
  }

  uint64_t v11 = (void *)archive_write_new();
  archive_write_set_format_zip();
  if (archive_write_open_filename())
  {
    if (a5)
    {
      uint64_t v12 = __error();
      *a5 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(*v12, (uint64_t)a4, 0, 0LL, 0LL);
    }

    free(v11);
    uint64_t disk_new = 0LL;
    uint64_t v11 = 0LL;
    uint64_t v14 = 0LL;
    BOOL v15 = 0;
    __int128 v55 = v9;
    uint64_t v56 = 0LL;
    goto LABEL_8;
  }

  uint64_t disk_new = archive_read_disk_new();
  archive_read_disk_set_standard_lookup();
  __int128 v55 = v9;
  uint64_t v56 = 0LL;
  BOOL v19 = fts_open(&v55, 84, 0LL);
  if (v19)
  {
    uint64_t v14 = v19;
    char v16 = 0;
    BOOL v15 = 1;
  }

  else
  {
    if (!a5)
    {
      uint64_t v14 = 0LL;
      BOOL v15 = 0;
LABEL_8:
      char v16 = 1;
      goto LABEL_16;
    }

    uint64_t v20 = __error();
    char v16 = 1;
    uint64_t v14 = 0LL;
    BOOL v15 = 0;
    *a5 = _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(*v20, (uint64_t)a3, 1, 0LL, 0LL);
  }

- (void)prepareItemForUploadingFromURL:(id)a3 thenContinue:(id)a4
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  -[NSFileAccessClaim blockClaimerForReason:](self, "blockClaimerForReason:", @"Zipping");
  id v7 = -[NSFileAccessClaim claimID](self, "claimID");
  uint64_t v8 = (os_log_s *)_NSFCClaimsLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543619;
    *(void *)&uint8_t buf[4] = v7;
    __int16 v31 = 2113;
    uint64_t v32 = [a3 path];
    _os_log_impl( &dword_182EB1000,  v8,  OS_LOG_TYPE_INFO,  "Claim %{public}@ is waiting for file %{private}@ to be prepared for uploading",  buf,  0x16u);
  }

  uint64_t v9 = MEMORY[0x1895F87A8];
  v23[0] = MEMORY[0x1895F87A8];
  v23[1] = 3221225472LL;
  char v24 = __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke;
  int v25 = &unk_189CA3950;
  int v27 = self;
  id v28 = a4;
  id v26 = v7;
  *(void *)buf = 0LL;
  uint64_t v10 = -[NSString fileSystemRepresentation]( -[NSString stringByAppendingPathComponent:]( NSTemporaryDirectory(),  "stringByAppendingPathComponent:",  @"CoordinatedZipFileXXXXXX"),  "fileSystemRepresentation");
  uint64_t v11 = strdup(v10);
  if (-[NSFileManager createDirectoryAtPath:withIntermediateDirectories:attributes:error:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "createDirectoryAtPath:withIntermediateDirectories:attributes:error:",  NSTemporaryDirectory(),  1LL,  0LL,  buf))
  {
    if (v11 && mkdtemp(v11))
    {
      uint64_t v12 = -[NSFileManager stringWithFileSystemRepresentation:length:]( +[NSFileManager defaultManager](&OBJC_CLASS___NSFileManager, "defaultManager"),  "stringWithFileSystemRepresentation:length:",  v11,  strlen(v11));
      v22[0] = v9;
      v22[1] = 3221225472LL;
      v22[2] = __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke_86;
      v22[3] = &unk_189C9A030;
      v22[4] = v12;
      -[NSFileAccessClaim whenFinishedPerformProcedure:](self, "whenFinishedPerformProcedure:", v22);
      uint64_t v21 = 0LL;
      uint64_t v13 = *MEMORY[0x189603D30];
      v29[0] = *MEMORY[0x189603C48];
      v29[1] = v13;
      v15[0] = v9;
      v15[1] = 3221225472LL;
      v15[2] = __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke_87;
      v15[3] = &unk_189CA3238;
      uint64_t v16 = objc_msgSend( a3,  "resourceValuesForKeys:error:",  objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v29, 2),  &v21);
      id v17 = a3;
      uint64_t v18 = self;
      BOOL v19 = v12;
      uint64_t v20 = v23;
      v14[0] = v9;
      v14[1] = 3221225472LL;
      v14[2] = __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke_109;
      v14[3] = &unk_189CA3998;
      v14[4] = v16;
      v14[5] = v12;
      v14[6] = a3;
      v14[7] = self;
      void v14[8] = v21;
      v14[9] = v23;
      __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke_87((uint64_t)v15, (uint64_t)v14);
    }

    else
    {
      v24( (uint64_t)v23,  0LL,  (uint64_t)+[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  256LL,  0LL));
    }
  }

  else
  {
    __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke( (uint64_t)v23,  0LL,  *(uint64_t *)buf);
  }

  free(v11);
}

uint64_t __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  uint64_t v6 = (os_log_s *)_NSFCClaimsLog();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v11 = 138543619;
      uint64_t v12 = v8;
      __int16 v13 = 2113;
      uint64_t v14 = a2;
      _os_log_impl( &dword_182EB1000,  v7,  OS_LOG_TYPE_INFO,  "Upload preparation for claim %{public}@ completed with resulting URL: %{private}@",  (uint8_t *)&v11,  0x16u);
    }
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    uint64_t v10 = *(void *)(a1 + 32);
    int v11 = 138543619;
    uint64_t v12 = v10;
    __int16 v13 = 2113;
    uint64_t v14 = a3;
    _os_log_error_impl( &dword_182EB1000,  v7,  OS_LOG_TYPE_ERROR,  "Upload preparation for claim %{public}@ completed with error: %{private}@",  (uint8_t *)&v11,  0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16LL))();
  return [*(id *)(a1 + 40) unblockClaimerForReason:@"Zipping"];
}

void __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke_86(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  id v2 = 0LL;
  if (([(id)objc_opt_new() removeItemAtPath:*(void *)(a1 + 32) error:&v2] & 1) == 0
    && [v2 code] != 4)
  {
    v1 = (os_log_s *)_NSFCClaimsLog();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v4 = v2;
      _os_log_error_impl( &dword_182EB1000,  v1,  OS_LOG_TYPE_ERROR,  "Failed to remove file created for uploading: %{public}@",  buf,  0xCu);
    }
  }

void __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke_87( uint64_t a1,  uint64_t a2)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  int v4 = objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *MEMORY[0x189603D30]),  "hasPrefix:",  @"com.apple.iwork");
  int v5 = objc_msgSend( (id)objc_msgSend(*(id *)(a1 + 40), "lastPathComponent"),  "hasPrefix:",  @"__NSFileCoordinationPrepareForUploadTestFile");
  if ((v4 & 1) != 0 || v5)
  {
    if (v4)
    {
      if (NSFileAccessClaimInitialBlockageReason_block_invoke_onceToken != -1) {
        dispatch_once(&NSFileAccessClaimInitialBlockageReason_block_invoke_onceToken, &__block_literal_global_92);
      }
      uint64_t v6 = @"com.apple.iWorkFileFormat";
    }

    else if (v5)
    {
      uint64_t v6 = @"com.apple.foundationtests.NSFileCoordinationPrepareForUploadTestService";
    }

    else
    {
      uint64_t v6 = 0LL;
    }

    id v7 = -[NSXPCConnection initWithServiceName:](objc_alloc(&OBJC_CLASS___NSXPCConnection), "initWithServiceName:", v6);
    -[NSXPCConnection setRemoteObjectInterface:]( v7,  "setRemoteObjectInterface:",  +[NSXPCInterface interfaceWithProtocol:](&OBJC_CLASS___NSXPCInterface, "interfaceWithProtocol:", &unk_18C68EA78));
    -[NSXPCConnection _setQueue:](v7, "_setQueue:", *(void *)(*(void *)(a1 + 48) + 184LL));
    -[NSXPCConnection resume](v7, "resume");
    uint64_t v8 = (os_log_s *)_NSFCClaimsLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = [*(id *)(a1 + 40) path];
      *(_DWORD *)buf = 138543619;
      char v24 = v6;
      __int16 v25 = 2113;
      uint64_t v26 = v20;
      _os_log_debug_impl( &dword_182EB1000,  v8,  OS_LOG_TYPE_DEBUG,  "Asking service named %{public}@ to prepare file %{private}@ for uploading",  buf,  0x16u);
    }

    [*(id *)(a1 + 40) fileSystemRepresentation];
    uint64_t v9 = (const char *)sandbox_extension_issue_file();
    [*(id *)(a1 + 56) fileSystemRepresentation];
    uint64_t v10 = (const char *)sandbox_extension_issue_file();
    if (v9) {
      uint64_t v11 = [MEMORY[0x189603F48] dataWithBytesNoCopy:v9 length:strlen(v9) + 1 freeWhenDone:1];
    }
    else {
      uint64_t v11 = [MEMORY[0x189603F48] data];
    }
    uint64_t v12 = v11;
    if (v10) {
      uint64_t v13 = [MEMORY[0x189603F48] dataWithBytesNoCopy:v10 length:strlen(v10) + 1 freeWhenDone:1];
    }
    else {
      uint64_t v13 = [MEMORY[0x189603F48] data];
    }
    uint64_t v14 = v13;
    uint64_t v15 = MEMORY[0x1895F87A8];
    v22[0] = MEMORY[0x1895F87A8];
    v22[1] = 3221225472LL;
    v22[2] = __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke_106;
    v22[3] = &unk_189CA0D60;
    v22[4] = v6;
    void v22[5] = a2;
    id v16 = -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v7, "remoteObjectProxyWithErrorHandler:", v22);
    uint64_t v17 = *(void *)(a1 + 40);
    uint64_t v18 = [MEMORY[0x189604030] fileURLWithPath:*(void *)(a1 + 56)];
    v21[0] = v15;
    v21[1] = 3221225472LL;
    v21[2] = __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke_108;
    v21[3] = &unk_189CA3530;
    uint64_t v19 = *(void *)(a1 + 40);
    v21[4] = v6;
    v21[5] = v19;
    v21[6] = *(void *)(a1 + 64);
    void v21[7] = a2;
    [v16 prepareFileForUploadingAtURL:v17 originalURLExtension:v12 inDirectory:v18 destinationSandboxExtension:v14 completionHandler:v21];
  }

  else
  {
    (*(void (**)(uint64_t))(a2 + 16))(a2);
  }

uint64_t __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke_2()
{
  return xpc_add_bundle();
}

uint64_t __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke_106( uint64_t a1,  uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  int v4 = (os_log_s *)_NSFCClaimsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 138543618;
    uint64_t v8 = v6;
    __int16 v9 = 2114;
    uint64_t v10 = a2;
    _os_log_error_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_ERROR,  "Error communicating with service named: %{public}@. %{public}@",  (uint8_t *)&v7,  0x16u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke_108( uint64_t a1,  unint64_t a2,  uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  unint64_t v5 = a2 | a3;
  uint64_t v6 = (os_log_s *)_NSFCClaimsLog();
  int v7 = v6;
  if (v5)
  {
    if (a2)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v8 = *(void *)(a1 + 32);
        uint64_t v9 = [*(id *)(a1 + 40) path];
        int v15 = 138543875;
        uint64_t v16 = v8;
        __int16 v17 = 2113;
        uint64_t v18 = v9;
        __int16 v19 = 2113;
        uint64_t v20 = [(id)a2 path];
        _os_log_debug_impl( &dword_182EB1000,  v7,  OS_LOG_TYPE_DEBUG,  "Service %{public}@ succeeded in preparing file %{private}@ for uploading. Resulting path: %{private}@",  (uint8_t *)&v15,  0x20u);
      }
    }

    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = [*(id *)(a1 + 40) path];
      int v15 = 138543875;
      uint64_t v16 = v13;
      __int16 v17 = 2113;
      uint64_t v18 = v14;
      __int16 v19 = 2113;
      uint64_t v20 = [0 path];
      _os_log_error_impl( &dword_182EB1000,  v7,  OS_LOG_TYPE_ERROR,  "Service %{public}@ failed to prepare file %{private}@ for uploading. Error: %{private}@",  (uint8_t *)&v15,  0x20u);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
  }

  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = [*(id *)(a1 + 40) path];
      int v15 = 138543619;
      uint64_t v16 = v11;
      __int16 v17 = 2113;
      uint64_t v18 = v12;
      _os_log_debug_impl( &dword_182EB1000,  v7,  OS_LOG_TYPE_DEBUG,  "Service %{public}@ has requested we fall back to the standard procedure to prepare file %{private}@ for uploading.",  (uint8_t *)&v15,  0x16u);
    }

    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16LL))();
  }

uint64_t __65__NSFileAccessClaim_prepareItemForUploadingFromURL_thenContinue___block_invoke_109(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  __int16 v25 = 0LL;
  id v2 = (void *)[*(id *)(a1 + 32) objectForKey:*MEMORY[0x189603C48]];
  if (v2)
  {
    int v3 = [v2 BOOLValue];
    int v4 = (void *)objc_msgSend( *(id *)(a1 + 40),  "stringByAppendingPathComponent:",  objc_msgSend(*(id *)(a1 + 48), "lastPathComponent"));
    unint64_t v5 = v4;
    if (v3)
    {
      uint64_t v6 = (void *)[v4 lastPathComponent];
      int v7 = (const char *)[v6 fileSystemRepresentation];
      if (v7)
      {
        size_t v8 = strlen(v7);
        if (v8 - 252 <= 0xFFFFFFFFFFFFFEFFLL)
        {
          size_t v9 = v8;
          uint64_t v10 = (void *)[v6 stringByDeletingPathExtension];
          size_t v11 = [v10 length] - v9;
          uint64_t v12 = objc_msgSend(v10, "rangeOfComposedCharacterSequencesForRange:", 0, v11 + 251);
          BOOL v14 = v11 != -251LL && v13 > v11 + 251;
          if (v14)
          {
            unint64_t v20 = v11 + 250;
            do
            {
              uint64_t v15 = objc_msgSend(v10, "rangeOfComposedCharacterSequencesForRange:", 0, v20);
              unint64_t v16 = v21;
              if (!v20) {
                break;
              }
              BOOL v14 = v21 > v20--;
            }

            while (v14);
          }

          else
          {
            uint64_t v15 = v12;
            unint64_t v16 = v13;
          }

          unint64_t v5 = (void *)objc_msgSend( (id)objc_msgSend( (id)objc_msgSend(v5, "stringByDeletingLastPathComponent"),  "stringByAppendingPathComponent:",  objc_msgSend(v6, "substringWithRange:", v15, v16)),  "stringByAppendingPathExtension:",  objc_msgSend(v6, "pathExtension"));
        }

        unint64_t v5 = (void *)[v5 stringByAppendingPathExtension:@"zip"];
      }

      uint64_t v22 = [MEMORY[0x189604030] fileURLWithPath:v5 isDirectory:0];
      uint64_t v23 = (os_log_s *)_NSFCClaimsLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_182EB1000,  v23,  OS_LOG_TYPE_INFO,  "(ReadingForUploading) Creating zip archive of coordinated directory",  buf,  2u);
      }

      [*(id *)(a1 + 56) _writeArchiveOfDirectoryAtURL:*(void *)(a1 + 48) toURL:v22 error:&v25];
    }

    else
    {
      uint64_t v18 = [MEMORY[0x189604030] fileURLWithPath:v4 isDirectory:0];
      __int16 v19 = (os_log_s *)_NSFCClaimsLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( &dword_182EB1000,  v19,  OS_LOG_TYPE_INFO,  "(ReadingForUploading) Copying cordinated flat file",  buf,  2u);
      }

      [(id)objc_opt_new() copyItemAtURL:*(void *)(a1 + 48) toURL:v18 error:&v25];
    }
  }

  else
  {
    __int16 v17 = *(NSError **)(a1 + 64);
    if (!v17) {
      __int16 v17 = +[NSError errorWithDomain:code:userInfo:]( &OBJC_CLASS___NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  256LL,  0LL);
    }
    __int16 v25 = v17;
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 72) + 16LL))();
}

- (void)invokeClaimer
{
  if (!self->_hasInvokedClaimer)
  {
    claimerWaiter = self->_claimerWaiter;
    if (claimerWaiter) {
      dispatch_semaphore_signal((dispatch_semaphore_t)claimerWaiter);
    }
    self->_hasInvokedClaimer = 1;
  }

- (void)revoked
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  uint64_t v3 = atomic_load(&_NSFCSubarbitrationCount);
  if (v3 < 1
    || (unsigned __int8 v12 = atomic_load(_NSFCDisableLogSuppression), (v12 & 1) != 0)
    || (uint64_t v13 = atomic_load(&_NSFCSubarbitratedClaimCount), v13 <= 199))
  {
    int v4 = (os_log_s *)_NSFCClaimsLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      claimID = self->_claimID;
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = claimID;
      _os_log_impl(&dword_182EB1000, v4, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ was revoked", (uint8_t *)&buf, 0xCu);
    }
  }

  self->_isRevoked = 1;
  -[NSFileAccessClaim cancelled](self, "cancelled");
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v19 = 0u;
  __int128 v20 = 0u;
  revocationProcedures = self->_revocationProcedures;
  uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( revocationProcedures,  "countByEnumeratingWithState:objects:count:",  &v19,  v18,  16LL);
  if (v7)
  {
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(revocationProcedures);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v19 + 1) + 8 * i) + 16LL))();
      }

      uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( revocationProcedures,  "countByEnumeratingWithState:objects:count:",  &v19,  v18,  16LL);
    }

    while (v7);
  }

  self->_revocationProcedures = 0LL;
  *(void *)&__int128 buf = 0LL;
  *((void *)&buf + 1) = &buf;
  uint64_t v16 = 0x2020000000LL;
  int v17 = 1;
  reacquisitionProceduresByPresenterID = self->_reacquisitionProceduresByPresenterID;
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __28__NSFileAccessClaim_revoked__block_invoke;
  v14[3] = &unk_189CA39C0;
  v14[4] = self;
  v14[5] = &buf;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( reacquisitionProceduresByPresenterID,  "enumerateKeysAndObjectsUsingBlock:",  v14);

  self->_reacquisitionProceduresByPresenterID = 0LL;
  int v11 = *(_DWORD *)(*((void *)&buf + 1) + 24LL) - 1;
  *(_DWORD *)(*((void *)&buf + 1) + 24LL) = v11;
  if (!v11) {
    -[NSFileAccessClaim devalueSelf](self, "devalueSelf");
  }
  _Block_object_dispose(&buf, 8);
}

uint64_t __28__NSFileAccessClaim_revoked__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL);
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __28__NSFileAccessClaim_revoked__block_invoke_2;
  v4[3] = &unk_189CA1890;
  __int128 v5 = *(_OWORD *)(a1 + 32);
  return (*(uint64_t (**)(uint64_t, void *))(a3 + 16))(a3, v4);
}

uint64_t __28__NSFileAccessClaim_revoked__block_invoke_2(uint64_t result)
{
  if (!--*(_DWORD *)(*(void *)(*(void *)(result + 40) + 8LL) + 24LL)) {
    return [*(id *)(result + 32) devalueSelf];
  }
  return result;
}

- (void)devalueSelf
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  -[NSFileAccessProcessManager invalidate](self->_processManager, "invalidate");

  self->_processManager = 0LL;
  uint64_t v3 = atomic_load(&_NSFCSubarbitrationCount);
  if (v3 < 1
    || (unsigned __int8 v17 = atomic_load(_NSFCDisableLogSuppression), (v17 & 1) != 0)
    || (uint64_t v18 = atomic_load(&_NSFCSubarbitratedClaimCount), v18 <= 199))
  {
    int v4 = (os_log_s *)_NSFCClaimsLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      claimID = self->_claimID;
      *(_DWORD *)__int128 buf = 138543362;
      uint64_t v30 = claimID;
      _os_log_impl(&dword_182EB1000, v4, OS_LOG_TYPE_INFO, "Claim %{public}@ was devalued", buf, 0xCu);
    }
  }

  __int128 v27 = 0u;
  __int128 v28 = 0u;
  __int128 v25 = 0u;
  __int128 v26 = 0u;
  pendingClaims = self->_pendingClaims;
  uint64_t v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( pendingClaims,  "countByEnumeratingWithState:objects:count:",  &v25,  v24,  16LL);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v26;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v26 != v9) {
          objc_enumerationMutation(pendingClaims);
        }
        int v11 = *(id **)(*((void *)&v25 + 1) + 8 * i);
        [v11[10] removeObject:self];
        [v11 unblock];
      }

      uint64_t v8 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( pendingClaims,  "countByEnumeratingWithState:objects:count:",  &v25,  v24,  16LL);
    }

    while (v8);
  }

  self->_pendingClaims = 0LL;
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  devaluationProcedures = self->_devaluationProcedures;
  uint64_t v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( devaluationProcedures,  "countByEnumeratingWithState:objects:count:",  &v20,  v19,  16LL);
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t j = 0LL; j != v14; ++j)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(devaluationProcedures);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v20 + 1) + 8 * j) + 16LL))();
      }

      uint64_t v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( devaluationProcedures,  "countByEnumeratingWithState:objects:count:",  &v20,  v19,  16LL);
    }

    while (v14);
  }

  self->_devaluationProcedures = 0LL;
}

- (void)cancelled
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  providerCancellationProcedures = self->_providerCancellationProcedures;
  if (providerCancellationProcedures)
  {
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    uint64_t v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( providerCancellationProcedures,  "countByEnumeratingWithState:objects:count:",  &v13,  v12,  16LL);
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v14;
      do
      {
        uint64_t v7 = 0LL;
        do
        {
          if (*(void *)v14 != v6) {
            objc_enumerationMutation(providerCancellationProcedures);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v7++) + 16LL))();
        }

        while (v5 != v7);
        uint64_t v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( providerCancellationProcedures,  "countByEnumeratingWithState:objects:count:",  &v13,  v12,  16LL);
      }

      while (v5);
    }
  }

  self->_providerCancellationProcedures = 0LL;
  if (-[NSMutableArray count](self->_claimerBlockageReasons, "count"))
  {
    uint64_t v8 = (os_log_s *)_NSFCClaimsLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      claimID = self->_claimID;
      int v10 = 138543362;
      int v11 = claimID;
      _os_log_impl( &dword_182EB1000,  v8,  OS_LOG_TYPE_DEFAULT,  "Claim %{public}@ was cancelled before claimer was invoked",  (uint8_t *)&v10,  0xCu);
    }

    if (!self->_claimerError) {
      self->_claimerError = -[NSError initWithDomain:code:userInfo:]( objc_alloc(&OBJC_CLASS___NSError),  "initWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  3072LL,  0LL);
    }
    -[NSFileAccessClaim invokeClaimer](self, "invokeClaimer");
  }

- (BOOL)isGranted
{
  return !self->_blockageCount && !self->_isRevoked;
}

- (BOOL)isRevoked
{
  return self->_isRevoked;
}

- (id)descriptionWithIndenting:(id)a3
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  client = self->_client;
  if (client)
  {
    uint64_t v6 = -[NSXPCConnection processIdentifier](client, "processIdentifier");
    int v7 = proc_name(v6, buffer, 0x100u);
    if (v7 < 1) {
      uint64_t v8 = 0LL;
    }
    else {
      uint64_t v8 =  -[NSString initWithBytes:length:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithBytes:length:encoding:",  buffer,  v7,  4LL);
    }
    uint64_t v9 = +[NSString stringWithFormat:](&OBJC_CLASS___NSString, "stringWithFormat:", @"%@ (%i)", v8, v6);
  }

  else
  {
    uint64_t v9 = (NSString *)@"<this process>";
  }

  int v10 = +[NSString string](&OBJC_CLASS___NSMutableString, "string");
  int v11 = (void *)[a3 stringByAppendingString:@"    "];
  -[NSString appendFormat:]( v10,  "appendFormat:",  @"%@<%@ %p> client: %@, claim ID: %@",  a3,  objc_opt_class(),  self,  v9,  self->_claimID);
  if (self->_cameFromSuperarbiter) {
    -[NSString appendString:](v10, "appendString:", @" - came from superabiter");
  }
  purposeIDOrNil = self->_purposeIDOrNil;
  if (!purposeIDOrNil) {
    purposeIDOrNil = (NSString *)@"<nil>";
  }
  -[NSString appendFormat:](v10, "appendFormat:", @"\n%@purposeID: %@", v11, purposeIDOrNil);
  unint64_t blockageCount = self->_blockageCount;
  if (blockageCount) {
    -[NSString appendFormat:](v10, "appendFormat:", @"\n%@blockage count: %i", v11, blockageCount);
  }
  if (self->_pendingClaims)
  {
    -[NSString appendFormat:](v10, "appendFormat:", @"\n%@pending claims:", v11);
    uint64_t v14 = [v11 stringByAppendingString:@"    "];
    __int128 v33 = 0u;
    __int128 v34 = 0u;
    __int128 v35 = 0u;
    __int128 v36 = 0u;
    pendingClaims = self->_pendingClaims;
    uint64_t v16 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( pendingClaims,  "countByEnumeratingWithState:objects:count:",  &v33,  v32,  16LL);
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v34;
      do
      {
        for (uint64_t i = 0LL; i != v17; ++i)
        {
          if (*(void *)v34 != v18) {
            objc_enumerationMutation(pendingClaims);
          }
          -[NSString appendFormat:]( v10,  "appendFormat:",  @"\n%@",  [*(id *)(*((void *)&v33 + 1) + 8 * i) descriptionWithIndenting:v14]);
        }

        uint64_t v17 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:]( pendingClaims,  "countByEnumeratingWithState:objects:count:",  &v33,  v32,  16LL);
      }

      while (v17);
    }
  }

  if (-[NSMutableArray count](self->_claimerBlockageReasons, "count"))
  {
    -[NSString appendFormat:](v10, "appendFormat:", @"\n%@claimer blockage reasons:", v11);
    uint64_t v20 = [v11 stringByAppendingString:@"    "];
    __int128 v28 = 0u;
    __int128 v29 = 0u;
    __int128 v30 = 0u;
    __int128 v31 = 0u;
    claimerBlockageReasons = self->_claimerBlockageReasons;
    uint64_t v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( claimerBlockageReasons,  "countByEnumeratingWithState:objects:count:",  &v28,  v27,  16LL);
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v29;
      do
      {
        for (uint64_t j = 0LL; j != v23; ++j)
        {
          if (*(void *)v29 != v24) {
            objc_enumerationMutation(claimerBlockageReasons);
          }
          -[NSString appendFormat:]( v10,  "appendFormat:",  @"\n%@%@",  v20,  *(void *)(*((void *)&v28 + 1) + 8 * j));
        }

        uint64_t v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( claimerBlockageReasons,  "countByEnumeratingWithState:objects:count:",  &v28,  v27,  16LL);
      }

      while (v23);
    }
  }

  return v10;
}

- (id)description
{
  return -[NSFileAccessClaim descriptionWithIndenting:](self, "descriptionWithIndenting:", &stru_189CA6A28);
}

- (BOOL)checkIfSymbolicLinkAtURL:(id)a3 withResolutionCount:(int64_t *)a4 andIfSoThenReevaluateSelf:(id)a5
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  if (self->_claimerError
    || ![a3 getResourceValue:&v24 forKey:*MEMORY[0x189603C98] error:0]
    || ![v24 BOOLValue])
  {
    return 0;
  }

  uint64_t v9 = (*a4)++;
  if (v9 > 31)
  {
    uint64_t v20 = (os_log_s *)_NSFCClaimsLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v22 = -[NSFileAccessClaim claimID](self, "claimID");
      *(_DWORD *)__int128 buf = 138543362;
      __int128 v26 = v22;
      _os_log_error_impl( &dword_182EB1000,  v20,  OS_LOG_TYPE_ERROR,  "Claim %{public}@ failed symbolic link resolution due to an apparent link cycle",  buf,  0xCu);
    }

    -[NSFileAccessClaim setClaimerError:]( self,  "setClaimerError:",  _NSErrorWithFilePathErrnoVariantAndExtraUserInfo(62LL, (uint64_t)a3, 1, 0LL, 0LL));
    return 0;
  }

  uint64_t v10 = [a3 path];
  if (!v10) {
    return 0;
  }
  uint64_t v11 = v10;
  unsigned __int8 v12 = objc_alloc_init(&OBJC_CLASS___NSFileManager);
  uint64_t v13 = -[NSFileManager destinationOfSymbolicLinkAtPath:error:](v12, "destinationOfSymbolicLinkAtPath:error:", v11, 0LL);
  if (v13 && (uint64_t v14 = [MEMORY[0x189604030] fileURLWithPath:v13 relativeToURL:a3]) != 0)
  {
    uint64_t v15 = v14;
    if (self->_blockageCount || -[NSMutableArray count](self->_claimerBlockageReasons, "count"))
    {
      uint64_t v16 = (os_log_s *)_NSFCClaimsLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        claimID = self->_claimID;
        *(_DWORD *)__int128 buf = 138543362;
        __int128 v26 = claimID;
        _os_log_error_impl( &dword_182EB1000,  v16,  OS_LOG_TYPE_ERROR,  "claim %{public}@ is trying to resolve a symbolic link too early",  buf,  0xCu);
      }
    }

    ++self->_blockageCount;
    -[NSMutableArray addObject:](self->_claimerBlockageReasons, "addObject:", @"Initial blockage");
    uint64_t v17 = (os_log_s *)_NSFCClaimsLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = self->_claimID;
      *(_DWORD *)__int128 buf = 138543362;
      __int128 v26 = v18;
      _os_log_impl( &dword_182EB1000,  v17,  OS_LOG_TYPE_DEFAULT,  "claim %{public}@ is re-evaluating after resolving a symlink",  buf,  0xCu);
    }

    -[NSFileAccessClaim devalueSelf](self, "devalueSelf");
    (*((void (**)(id, uint64_t))a5 + 2))(a5, v15);
    -[NSFileAccessClaim unblock](self, "unblock");
    BOOL v19 = 1;
  }

  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (id)purposeIDOfClaimOnItemAtLocation:(id)a3 forMessagingPresenter:(id)a4
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  uint64_t v10 = 0LL;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3052000000LL;
  uint64_t v13 = __Block_byref_object_copy__140;
  uint64_t v14 = __Block_byref_object_dispose__141;
  id v15 = -[NSFileAccessClaim purposeID](self, "purposeID");
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __76__NSFileAccessClaim_purposeIDOfClaimOnItemAtLocation_forMessagingPresenter___block_invoke;
  v9[3] = &unk_189CA39E8;
  v9[4] = self;
  v9[5] = a4;
  v9[6] = &v10;
  [a3 forEachRelevantAccessClaimPerformProcedure:v9];
  int v7 = (void *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __76__NSFileAccessClaim_purposeIDOfClaimOnItemAtLocation_forMessagingPresenter___block_invoke( uint64_t result,  id *a2)
{
  if (*(id **)(result + 32) != a2)
  {
    uint64_t v3 = result;
    uint64_t v4 = (void *)[a2 purposeID];
    BOOL result = objc_msgSend(v4, "isEqual:", objc_msgSend(*(id *)(v3 + 40), "reactorID"));
    if ((_DWORD)result)
    {
      BOOL result = [a2[11] containsObject:*(void *)(*(void *)(*(void *)(v3 + 48) + 8) + 40)];
      if ((_DWORD)result) {
        *(void *)(*(void *)(*(void *)(v3 + 48) + 8LL) + 40LL) = v4;
      }
    }
  }

  return result;
}

- (BOOL)shouldBeRevokedPriorToInvokingAccessor
{
  return 0;
}

- (void)finished
{
  uint64_t v13 = *MEMORY[0x1895F89C0];
  __int128 v9 = 0u;
  __int128 v10 = 0u;
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  finishingProcedures = self->_finishingProcedures;
  uint64_t v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( finishingProcedures,  "countByEnumeratingWithState:objects:count:",  &v9,  v8,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(finishingProcedures);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * i) + 16LL))();
      }

      uint64_t v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( finishingProcedures,  "countByEnumeratingWithState:objects:count:",  &v9,  v8,  16LL);
    }

    while (v5);
  }

  self->_finishingProcedures = 0LL;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( self->_fileHandlesForEvictionProtection,  "enumerateKeysAndObjectsUsingBlock:",  &__block_literal_global_144_0);

  self->_fileHandlesForEvictionProtection = 0LL;
}

void __29__NSFileAccessClaim_finished__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v6 = 0LL;
  if (([a3 closeAndReturnError:&v6] & 1) == 0)
  {
    uint64_t v4 = (os_log_s *)_NSFCClaimsLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = [a2 path];
      *(_DWORD *)__int128 buf = 138478083;
      uint64_t v8 = v5;
      __int16 v9 = 2112;
      uint64_t v10 = v6;
      _os_log_error_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_ERROR,  "Failed to close file at %{private}@ because of error: %@",  buf,  0x16u);
    }
  }

- (void)disavowed
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  uint64_t v3 = (os_log_s *)_NSFCClaimsLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    claimID = self->_claimID;
    int v6 = 138543362;
    int v7 = claimID;
    _os_log_impl( &dword_182EB1000,  v3,  OS_LOG_TYPE_INFO,  "Disavowing claim %{public}@ that was never granted",  (uint8_t *)&v6,  0xCu);
  }

  if (-[NSMutableArray count](self->_revocationProcedures, "count"))
  {

    self->_revocationProcedures = 0LL;
  }

  if (-[NSMutableOrderedSet count](self->_pendingClaims, "count"))
  {

    self->_pendingClaims = 0LL;
  }

  if (-[NSMutableSet count](self->_blockingClaims, "count"))
  {

    self->_blockingClaims = 0LL;
  }

  id serverClaimerOrNil = self->_serverClaimerOrNil;
  if (serverClaimerOrNil)
  {

    self->_id serverClaimerOrNil = 0LL;
  }

- (NSArray)allURLs
{
  return 0LL;
}

- (BOOL)shouldCancelInsteadOfWaiting
{
  return 0;
}

- (void)_protectIfNecessaryFileAtURL:(id)a3 withOptions:(unint64_t)a4 forReading:(BOOL)a5
{
  v11[1] = *(id *)MEMORY[0x1895F89C0];
  unint64_t v7 = (a4 >> 2) & 1;
  if (!a4) {
    LODWORD(v7) = 1;
  }
  if (a5) {
    BOOL v8 = (a4 & 0xC) == 0;
  }
  else {
    BOOL v8 = v7;
  }
  if (!-[NSMutableDictionary objectForKey:](self->_fileHandlesForEvictionProtection, "objectForKey:"))
  {
    v11[0] = 0LL;
    if ([a3 getResourceValue:v11 forKey:*MEMORY[0x189603DF8] error:0])
    {
    }

    else if (!v8)
    {
      return;
    }

    if (!self->_fileHandlesForEvictionProtection) {
      self->_fileHandlesForEvictionProtection = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    }
    if ([a3 fileSystemRepresentation])
    {
      uint64_t v9 = open((const char *)[a3 fileSystemRepresentation], 0x8000);
      if ((_DWORD)v9 == -1)
      {
        -[NSMutableDictionary setObject:forKey:]( self->_fileHandlesForEvictionProtection,  "setObject:forKey:",  +[NSFileHandle fileHandleWithNullDevice](&OBJC_CLASS___NSFileHandle, "fileHandleWithNullDevice"),  a3);
      }

      else
      {
        uint64_t v10 = -[NSFileHandle initWithFileDescriptor:closeOnDealloc:]( objc_alloc(&OBJC_CLASS___NSFileHandle),  "initWithFileDescriptor:closeOnDealloc:",  v9,  1LL);
        -[NSMutableDictionary setObject:forKey:](self->_fileHandlesForEvictionProtection, "setObject:forKey:", v10, a3);
      }
    }
  }

- (OS_dispatch_semaphore)claimerWaiter
{
  return self->_claimerWaiter;
}

- (BOOL)shouldEnableMaterializationDuringAccessorBlock
{
  return self->_shouldEnableMaterializationDuringAccessorBlock;
}

- (void)setShouldEnableMaterializationDuringAccessorBlock:(BOOL)a3
{
  self->_shouldEnableMaterializationDuringAccessorBlocuint64_t k = a3;
}

@end