@interface NSFileReadingWritingClaim
+ (BOOL)supportsSecureCoding;
- (BOOL)blocksClaim:(id)a3;
- (BOOL)evaluateSelfWithRootNode:(id)a3 checkSubarbitrability:(BOOL)a4;
- (BOOL)isBlockedByReadingItemAtLocation:(id)a3 options:(unint64_t)a4;
- (BOOL)isBlockedByWritingItemAtLocation:(id)a3 options:(unint64_t)a4;
- (BOOL)shouldCancelInsteadOfWaiting;
- (NSFileReadingWritingClaim)initWithCoder:(id)a3;
- (NSFileReadingWritingClaim)initWithPurposeID:(id)a3 readingURL:(id)a4 options:(unint64_t)a5 writingURL:(id)a6 options:(unint64_t)a7 claimer:(id)a8;
- (id)allURLs;
- (void)dealloc;
- (void)devalueSelf;
- (void)encodeWithCoder:(id)a3;
- (void)forwardUsingConnection:(id)a3 crashHandler:(id)a4;
- (void)granted;
- (void)invokeClaimer;
- (void)itemAtLocation:(id)a3 wasReplacedByItemAtLocation:(id)a4;
- (void)protectFilesAgainstEviction;
- (void)resolveURLsThenMaybeContinueInvokingClaimer:(id)a3;
@end

@implementation NSFileReadingWritingClaim

- (NSFileReadingWritingClaim)initWithPurposeID:(id)a3 readingURL:(id)a4 options:(unint64_t)a5 writingURL:(id)a6 options:(unint64_t)a7 claimer:(id)a8
{
  v13 = -[NSFileAccessClaim initWithClient:claimID:purposeID:](self, "initWithClient:claimID:purposeID:", 0LL, 0LL, a3);
  if (v13)
  {
    v13->_readingURL = (NSURL *)[a4 copy];
    v13->_readingOptions = ((_DWORD)a5 << 14) & 0x20000 | a5;
    v13->_writingURL = (NSURL *)[a6 copy];
    v13->_writingOptions = a7;
    v13->super._claimerOrNil = (id)[a8 copy];
  }

  return v13;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFileReadingWritingClaim;
  -[NSFileAccessClaim dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"NSFileAccessClaims should only ever be encoded by XPC" userInfo:0]);
  }
  objc_msgSend( a3,  "encodeObject:forKey:",  +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", self->_readingURL),  @"NSReadingURLPairKey");
  objc_msgSend( a3,  "encodeObject:forKey:",  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_readingOptions),  @"NSReadingOptionsKey");
  objc_msgSend( a3,  "encodeObject:forKey:",  +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", self->_writingURL),  @"NSWritingURLPairKey");
  objc_msgSend( a3,  "encodeObject:forKey:",  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_writingOptions),  @"NSWritingOptionsKey");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSFileReadingWritingClaim;
  -[NSFileAccessClaim encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
}

- (NSFileReadingWritingClaim)initWithCoder:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSFileReadingWritingClaim;
  uint64_t v4 = -[NSFileAccessClaim initWithCoder:](&v8, sel_initWithCoder_);
  if (!v4) {
    return v4;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4->_readingURL = (NSURL *)(id)objc_msgSend( (id)objc_msgSend( a3,  "decodeObjectOfClass:forKey:",  objc_opt_class(),  @"NSReadingURLPairKey"),  "URL");
    v4->_readingOptions = objc_msgSend( (id)objc_msgSend( a3,  "decodeObjectOfClass:forKey:",  objc_opt_class(),  @"NSReadingOptionsKey"),  "unsignedIntegerValue");
    v4->_writingURL = (NSURL *)(id)objc_msgSend( (id)objc_msgSend( a3,  "decodeObjectOfClass:forKey:",  objc_opt_class(),  @"NSWritingURLPairKey"),  "URL");
    v4->_writingOptions = objc_msgSend( (id)objc_msgSend( a3,  "decodeObjectOfClass:forKey:",  objc_opt_class(),  @"NSWritingOptionsKey"),  "unsignedIntegerValue");
    return v4;
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"NSFileAccessClaims should only ever be decoded by XPC" userInfo:0]);
  return (NSFileReadingWritingClaim *)+[NSFileReadingWritingClaim supportsSecureCoding](v6, v7);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)forwardUsingConnection:(id)a3 crashHandler:(id)a4
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  SEL v7 = (os_log_s *)_NSFCClaimsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = -[NSFileAccessClaim claimID](self, "claimID");
    _os_log_debug_impl( &dword_182EB1000,  v7,  OS_LOG_TYPE_DEBUG,  "%{public}@ blocked pending grantAccessClaim",  buf,  0xCu);
  }

  -[NSFileAccessClaim block](self, "block");
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __65__NSFileReadingWritingClaim_forwardUsingConnection_crashHandler___block_invoke;
  v9[3] = &unk_189CA0D60;
  v9[4] = self;
  v9[5] = a4;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __65__NSFileReadingWritingClaim_forwardUsingConnection_crashHandler___block_invoke_354;
  v8[3] = &unk_189CA3A50;
  v8[4] = self;
  objc_msgSend((id)objc_msgSend(a3, "remoteObjectProxyWithErrorHandler:", v9), "grantAccessClaim:withReply:", self, v8);
}

uint64_t __65__NSFileReadingWritingClaim_forwardUsingConnection_crashHandler___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (os_log_s *)_NSFCClaimsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v7 = [*(id *)(a1 + 32) claimID];
    int v8 = 138543618;
    uint64_t v9 = (const __CFString *)v7;
    __int16 v10 = 2114;
    uint64_t v11 = a2;
    _os_log_error_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_ERROR,  "%{public}@ grantAccessClaim message failed: %{public}@",  (uint8_t *)&v8,  0x16u);
  }

  objc_super v5 = (os_log_s *)_NSFCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543618;
    uint64_t v9 = @"grantAccessClaim";
    __int16 v10 = 2114;
    uint64_t v11 = a2;
    _os_log_error_impl( &dword_182EB1000,  v5,  OS_LOG_TYPE_ERROR,  "Sending of a '%{public}@' message was interrupted: %{public}@",  (uint8_t *)&v8,  0x16u);
  }

  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16LL))()) {
    objc_msgSend( *(id *)(a1 + 32),  "setClaimerError:",  _NSErrorWithFilePath(256, *(void *)(*(void *)(a1 + 32) + 208)));
  }
  return [*(id *)(a1 + 32) unblock];
}

uint64_t __65__NSFileReadingWritingClaim_forwardUsingConnection_crashHandler___block_invoke_354( uint64_t a1,  void *a2,  void *a3,  void *a4,  uint64_t a5,  uint64_t a6)
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  uint64_t v12 = (os_log_s *)_NSFCClaimsLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = [*(id *)(a1 + 32) claimID];
    int v19 = 138543362;
    uint64_t v20 = v14;
    _os_log_debug_impl( &dword_182EB1000,  v12,  OS_LOG_TYPE_DEBUG,  "%{public}@ received grantAccessClaim reply",  (uint8_t *)&v19,  0xCu);
    if (a6) {
      goto LABEL_3;
    }
  }

  else if (a6)
  {
LABEL_3:
    v13 = (os_log_s *)_NSFCClaimsLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = [*(id *)(a1 + 32) claimID];
      int v19 = 138543618;
      uint64_t v20 = v18;
      __int16 v21 = 2114;
      uint64_t v22 = a6;
      _os_log_error_impl( &dword_182EB1000,  v13,  OS_LOG_TYPE_ERROR,  "%{public}@ grantAccessClaim reply is an error: %{public}@",  (uint8_t *)&v19,  0x16u);
    }

    [*(id *)(a1 + 32) setClaimerError:a6];
    return [*(id *)(a1 + 32) unblock];
  }

  v15 = (void *)[a2 firstObject];
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    *(void *)(*(void *)(a1 + 32) + 208) = objc_msgSend((id)objc_msgSend(v15, "URL"), "copy");
    *(_BYTE *)(*(void *)(a1 + 32) + 216LL) = 1;
  }

  v16 = (void *)[a3 firstObject];
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    *(void *)(*(void *)(a1 + 32) + 232) = objc_msgSend((id)objc_msgSend(v16, "URL"), "copy");
    *(_BYTE *)(*(void *)(a1 + 32) + 240LL) = 1;
  }

  if (a4)
  {

    *(void *)(*(void *)(a1 + 32) + 176) = [a4 copy];
  }

  [*(id *)(a1 + 32) setShouldEnableMaterializationDuringAccessorBlock:a5];
  return [*(id *)(a1 + 32) unblock];
}

- (BOOL)evaluateSelfWithRootNode:(id)a3 checkSubarbitrability:(BOOL)a4
{
  BOOL v4 = a4;
  v20[1] = *MEMORY[0x1895F89C0];
  uint64_t v7 = (NSFileAccessNode *)[a3 descendantForFileURL:self->_readingURL];
  uint64_t v8 = [a3 descendantForFileURL:self->_writingURL];
  if (v7) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9) {
    return 1;
  }
  uint64_t v11 = (NSFileAccessNode *)v8;
  uint64_t v18 = 0LL;
  if (!v4
    || -[NSFileAccessNode itemIsSubarbitrable](v7, "itemIsSubarbitrable")
    && -[NSFileAccessNode itemIsSubarbitrable](v11, "itemIsSubarbitrable"))
  {
    v20[0] = v7;
    if (-[NSFileAccessClaim canAccessLocations:forReading:error:]( self,  "canAccessLocations:forReading:error:",  [MEMORY[0x189603F18] arrayWithObjects:v20 count:1],  1,  &v18)
      && (int v19 = v11,
          -[NSFileAccessClaim canAccessLocations:forReading:error:]( self,  "canAccessLocations:forReading:error:",  [MEMORY[0x189603F18] arrayWithObjects:&v19 count:1],  0,  &v18)))
    {
      self->_readingLocation = v7;
      -[NSFileAccessNode addAccessClaim:](v7, "addAccessClaim:", self);
      self->_writingLocation = v11;
      -[NSFileAccessNode addAccessClaim:](v11, "addAccessClaim:", self);
      if ((self->_readingOptions & 2) != 0) {
        self->_rootNode = (NSFileAccessNode *)a3;
      }
      readingLocation = self->_readingLocation;
      uint64_t v13 = MEMORY[0x1895F87A8];
      v17[0] = MEMORY[0x1895F87A8];
      v17[1] = 3221225472LL;
      v17[2] = __76__NSFileReadingWritingClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke;
      v17[3] = &unk_189CA3A78;
      v17[4] = self;
      -[NSFileAccessNode forEachRelevantAccessClaimForEvaluatingAgainstClaim:performProcedure:]( readingLocation,  "forEachRelevantAccessClaimForEvaluatingAgainstClaim:performProcedure:",  self,  v17);
      writingLocation = self->_writingLocation;
      v16[0] = v13;
      v16[1] = 3221225472LL;
      v16[2] = __76__NSFileReadingWritingClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_2;
      v16[3] = &unk_189CA3A78;
      v16[4] = self;
      -[NSFileAccessNode forEachRelevantAccessClaimForEvaluatingAgainstClaim:performProcedure:]( writingLocation,  "forEachRelevantAccessClaimForEvaluatingAgainstClaim:performProcedure:",  self,  v16);
    }

    else
    {
      -[NSFileAccessClaim setClaimerError:](self, "setClaimerError:", v18);
    }

    BOOL v10 = 1;
  }

  else
  {
    BOOL v10 = 0;
  }

  -[NSFileAccessNode removeSelfIfUseless](v11, "removeSelfIfUseless");
  -[NSFileAccessNode removeSelfIfUseless](v7, "removeSelfIfUseless");
  return v10;
}

uint64_t __76__NSFileReadingWritingClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke( uint64_t a1,  void *a2)
{
  return [a2 evaluateNewClaim:*(void *)(a1 + 32)];
}

uint64_t __76__NSFileReadingWritingClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_2( uint64_t a1,  void *a2)
{
  return [a2 evaluateNewClaim:*(void *)(a1 + 32)];
}

- (BOOL)isBlockedByReadingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  return [(id)objc_opt_class() canReadingItemAtLocation:a3 options:a4 safelyOverlapNewWriting:1 ofItemAtLocation:self->_writingLocation options:self->_writingOptions] ^ 1;
}

- (BOOL)isBlockedByWritingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  uint64_t v7 = (void *)objc_opt_class();
  if ([v7 canReadingItemAtLocation:self->_readingLocation options:self->_readingOptions safelyOverlapNewWriting:0 ofItemAtLocation:a3 options:a4]) {
    return [v7 canNewWriteOfItemAtLocation:self->_writingLocation options:self->_writingOptions safelyOverlapExistingWriteOfItemAtLocation:a3 options:a4] ^ 1;
  }
  else {
    return 1;
  }
}

- (void)granted
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  if (self->_readingLocation || self->_writingLocation)
  {
    uint64_t v3 = atomic_load(&_NSFCSubarbitrationCount);
    if (v3 < 1
      || (unsigned __int8 v12 = atomic_load(_NSFCDisableLogSuppression), (v12 & 1) != 0)
      || (uint64_t v13 = atomic_load(&_NSFCSubarbitratedClaimCount), v13 <= 99))
    {
      BOOL v4 = (os_log_s *)_NSFCClaimsLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v22 = -[NSFileAccessClaim claimID](self, "claimID");
        _os_log_impl(&dword_182EB1000, v4, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ granted in server", buf, 0xCu);
      }
    }

    if (self->_readingLocation)
    {
      readingLocation = self->_readingLocation;
      uint64_t v5 = [MEMORY[0x189603F18] arrayWithObjects:&readingLocation count:1];
    }

    else
    {
      uint64_t v5 = 0LL;
    }

    if (self->_writingLocation)
    {
      writingLocation = self->_writingLocation;
      uint64_t v6 = [MEMORY[0x189603F18] arrayWithObjects:&writingLocation count:1];
    }

    else
    {
      uint64_t v6 = 0LL;
    }

    uint64_t v7 = MEMORY[0x1895F87A8];
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __36__NSFileReadingWritingClaim_granted__block_invoke;
    v18[3] = &unk_189C9E870;
    v18[4] = self;
    -[NSFileAccessClaim makeProvidersProvideItemsForReadingLocations:options:andWritingLocationsIfNecessary:options:thenContinue:]( self,  "makeProvidersProvideItemsForReadingLocations:options:andWritingLocationsIfNecessary:options:thenContinue:",  v5,  &self->_readingOptions,  v6,  &self->_writingOptions,  v18);
    if (self->_writingLocation
      && -[NSFileAccessClaim shouldInformProvidersAboutEndOfWriteWithOptions:]( self,  "shouldInformProvidersAboutEndOfWriteWithOptions:",  self->_writingOptions))
    {
      v17[0] = v7;
      v17[1] = 3221225472LL;
      v17[2] = __36__NSFileReadingWritingClaim_granted__block_invoke_6;
      v17[3] = &unk_189C9A030;
      v17[4] = self;
      -[NSFileAccessClaim whenRevokedPerformProcedure:](self, "whenRevokedPerformProcedure:", v17);
    }
  }

  else if (self->super._client)
  {
    uint64_t v8 = (os_log_s *)_NSFCClaimsLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v22 = -[NSFileAccessClaim claimID](self, "claimID");
      _os_log_error_impl( &dword_182EB1000,  v8,  OS_LOG_TYPE_ERROR,  "Claim %{public}@ can't be granted in daemon",  buf,  0xCu);
    }
  }

  else
  {
    uint64_t v9 = atomic_load(&_NSFCSubarbitrationCount);
    if (v9 < 1
      || (unsigned __int8 v14 = atomic_load(_NSFCDisableLogSuppression), (v14 & 1) != 0)
      || (uint64_t v15 = atomic_load(&_NSFCSubarbitratedClaimCount), v15 <= 99))
    {
      BOOL v10 = (os_log_s *)_NSFCClaimsLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v22 = -[NSFileAccessClaim claimID](self, "claimID");
        _os_log_impl(&dword_182EB1000, v10, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ granted in client", buf, 0xCu);
      }
    }

    if ((self->_readingOptions & 8) != 0)
    {
      readingURL = self->_readingURL;
      v16[0] = MEMORY[0x1895F87A8];
      v16[1] = 3221225472LL;
      v16[2] = __36__NSFileReadingWritingClaim_granted__block_invoke_355;
      v16[3] = &unk_189C9AE08;
      v16[4] = self;
      -[NSFileAccessClaim prepareItemForUploadingFromURL:thenContinue:]( self,  "prepareItemForUploadingFromURL:thenContinue:",  readingURL,  v16);
    }
  }

  -[NSFileAccessClaim unblockClaimerForReason:](self, "unblockClaimerForReason:", @"Initial blockage");
}

void __36__NSFileReadingWritingClaim_granted__block_invoke(uint64_t a1, int a2)
{
  v7[12] = *MEMORY[0x1895F89C0];
  if (a2)
  {
    id v3 = objc_alloc_init(MEMORY[0x189603FE0]);
    BOOL v4 = *(void **)(a1 + 32);
    uint64_t v5 = MEMORY[0x1895F87A8];
    if (v4[33])
    {
      v7[6] = MEMORY[0x1895F87A8];
      v7[7] = 3221225472LL;
      v7[8] = __36__NSFileReadingWritingClaim_granted__block_invoke_2;
      v7[9] = &unk_189CA3BB8;
      v7[10] = v4;
      v7[11] = v3;
      objc_msgSend(v4, "makePresentersOfItemAtLocation:orContainedItem:relinquishUsingProcedureGetter:");
      BOOL v4 = *(void **)(a1 + 32);
    }

    uint64_t v6 = v4[32];
    if (v6)
    {
      v7[0] = v5;
      v7[1] = 3221225472LL;
      v7[2] = __36__NSFileReadingWritingClaim_granted__block_invoke_4;
      v7[3] = &unk_189CA3BB8;
      v7[4] = v4;
      v7[5] = v3;
      [v4 makePresentersOfItemAtLocation:v6 orContainedItem:0 relinquishUsingProcedureGetter:v7];
    }
  }

id __36__NSFileReadingWritingClaim_granted__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  v7[7] = *MEMORY[0x1895F89C0];
  if (![*(id *)(a1 + 32) shouldWritingWithOptions:*(void *)(*(void *)(a1 + 32) + 248) causePresenterToRelinquish:a2]) {
    return 0LL;
  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", objc_msgSend(a2, "reactorID"));
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __36__NSFileReadingWritingClaim_granted__block_invoke_3;
  v7[3] = &unk_189CA3B68;
  v7[4] = *(void *)(a1 + 32);
  v7[5] = a2;
  v7[6] = a3;
  return (id)[v7 copy];
}

uint64_t __36__NSFileReadingWritingClaim_granted__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend( *(id *)(a1 + 40),  "relinquishToWritingClaimWithID:options:purposeID:subitemPath:resultHandler:",  objc_msgSend(*(id *)(a1 + 32), "claimID"),  *(void *)(*(void *)(a1 + 32) + 248),  objc_msgSend( *(id *)(a1 + 32),  "purposeIDOfClaimOnItemAtLocation:forMessagingPresenter:",  *(void *)(*(void *)(a1 + 32) + 264),  *(void *)(a1 + 40)),  *(void *)(a1 + 48),  a2);
}

id __36__NSFileReadingWritingClaim_granted__block_invoke_4(uint64_t a1, void *a2)
{
  v6[6] = *MEMORY[0x1895F89C0];
  if (![*(id *)(a1 + 32) shouldReadingWithOptions:*(void *)(*(void *)(a1 + 32) + 224) causePresenterToRelinquish:a2]
    || (objc_msgSend(*(id *)(a1 + 40), "containsObject:", objc_msgSend(a2, "reactorID")) & 1) != 0)
  {
    return 0LL;
  }

  objc_msgSend(*(id *)(a1 + 40), "addObject:", objc_msgSend(a2, "reactorID"));
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __36__NSFileReadingWritingClaim_granted__block_invoke_5;
  v6[3] = &unk_189CA3AA0;
  uint64_t v5 = *(void *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  return (id)[v6 copy];
}

uint64_t __36__NSFileReadingWritingClaim_granted__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend( *(id *)(a1 + 32),  "relinquishToReadingClaimWithID:options:purposeID:resultHandler:",  objc_msgSend(*(id *)(a1 + 40), "claimID"),  *(void *)(*(void *)(a1 + 40) + 224),  objc_msgSend(*(id *)(a1 + 40), "purposeID"),  a2);
}

uint64_t __36__NSFileReadingWritingClaim_granted__block_invoke_6(uint64_t a1)
{
  return objc_msgSend( (id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 264), "itemProvider"),  "observeEndOfWriteAtLocation:forAccessClaim:",  *(void *)(*(void *)(a1 + 32) + 264));
}

void *__36__NSFileReadingWritingClaim_granted__block_invoke_355(void *result, void *a2, uint64_t a3)
{
  id v3 = result;
  uint64_t v13 = *MEMORY[0x1895F89C0];
  if (a2)
  {
    *(_BYTE *)(result[4] + 216LL) = 1;
    uint64_t v5 = *(void **)(result[4] + 208LL);
    if (v5 != a2)
    {

      result = a2;
      *(void *)(v3[4] + 208LL) = result;
    }
  }

  else
  {
    uint64_t v7 = (os_log_s *)_NSFCClaimsLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [(id)v3[4] claimID];
      int v9 = 138543618;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      uint64_t v12 = a3;
      _os_log_error_impl( &dword_182EB1000,  v7,  OS_LOG_TYPE_ERROR,  "Claim %{public}@ failed during preparing for uploading due to error: %@",  (uint8_t *)&v9,  0x16u);
    }

    return (void *)[(id)v3[4] setClaimerError:a3];
  }

  return result;
}

- (void)resolveURLsThenMaybeContinueInvokingClaimer:(id)a3
{
  v10[5] = *MEMORY[0x1895F89C0];
  if (-[NSFileAccessClaim didWait](self, "didWait"))
  {
    id v5 = -[NSFileAccessNode standardizedURL](self->_readingLocation, "standardizedURL");
    if (v5)
    {
      uint64_t v6 = v5;

      self->_readingURL = (NSURL *)[v6 copy];
      self->_readingURLDidChange = 1;
    }

    id v7 = -[NSFileAccessNode standardizedURL](self->_writingLocation, "standardizedURL");
    if (v7)
    {
      uint64_t v8 = v7;

      self->_writingURL = (NSURL *)[v8 copy];
      self->_writingURLDidChange = 1;
    }
  }

  if (-[NSFileAccessClaim claimerError](self, "claimerError"))
  {
    (*((void (**)(id, void, void))a3 + 2))(a3, 0LL, 0LL);
  }

  else
  {
    v9[5] = a3;
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __73__NSFileReadingWritingClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke;
    v10[3] = &unk_189CA3B18;
    v10[4] = self;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __73__NSFileReadingWritingClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_3;
    v9[3] = &unk_189C9FF78;
    v9[4] = self;
    __73__NSFileReadingWritingClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke( (uint64_t)v10,  (uint64_t)v9);
  }

uint64_t __73__NSFileReadingWritingClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke( uint64_t a1,  uint64_t a2)
{
  v6[5] = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(a1 + 32);
  if ((*(_BYTE *)(v3 + 224) & 2) == 0) {
    return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  }
  uint64_t v4 = *(void *)(v3 + 208);
  if (!v4) {
    return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  }
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __73__NSFileReadingWritingClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_2;
  v6[3] = &unk_189CA3AF0;
  v6[4] = v3;
  uint64_t result = [(id)v3 checkIfSymbolicLinkAtURL:v4 withResolutionCount:v3 + 280 andIfSoThenReevaluateSelf:v6];
  if ((result & 1) == 0) {
    return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  }
  return result;
}

uint64_t __73__NSFileReadingWritingClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_2( uint64_t a1,  void *a2)
{
  *(void *)(*(void *)(a1 + 32) + 208) = [a2 copy];
  *(_BYTE *)(*(void *)(a1 + 32) + 216LL) = 1;
  return [*(id *)(a1 + 32) evaluateSelfWithRootNode:*(void *)(*(void *)(a1 + 32) + 272) checkSubarbitrability:0];
}

uint64_t __73__NSFileReadingWritingClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_3( uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[32];
  uint64_t v4 = [v2 purposeID];
  __int128 v5 = *(_OWORD *)(a1 + 32);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 224LL);
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __73__NSFileReadingWritingClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_4;
  v8[3] = &unk_189CA3B40;
  __int128 v9 = v5;
  return [v2 makeProviderOfItemAtLocation:v3 provideOrAttachPhysicalURLIfNecessaryForPurposeID:v4 readingOptions:v6 thenContinue:v8];
}

uint64_t __73__NSFileReadingWritingClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_4( uint64_t a1,  uint64_t a2)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = v4[33];
  uint64_t v6 = [v4 purposeID];
  __int128 v7 = *(_OWORD *)(a1 + 32);
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 248LL);
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __73__NSFileReadingWritingClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_5;
  v10[3] = &unk_189CA3BE0;
  v10[4] = a2;
  __int128 v11 = v7;
  return [v4 makeProviderOfItemAtLocation:v5 provideOrAttachPhysicalURLIfNecessaryForPurposeID:v6 writingOptions:v8 thenContinue:v10];
}

uint64_t __73__NSFileReadingWritingClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_5( uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16LL))();
}

- (void)invokeClaimer
{
  v2[5] = *MEMORY[0x1895F89C0];
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 3221225472LL;
  v2[2] = __42__NSFileReadingWritingClaim_invokeClaimer__block_invoke;
  v2[3] = &unk_189CA3C08;
  v2[4] = self;
  -[NSFileReadingWritingClaim resolveURLsThenMaybeContinueInvokingClaimer:]( self,  "resolveURLsThenMaybeContinueInvokingClaimer:",  v2);
}

id __42__NSFileReadingWritingClaim_invokeClaimer__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  uint64_t v6 = *(void **)(a1 + 32);
  if (v6[20])
  {
    uint64_t v7 = atomic_load(&_NSFCSubarbitrationCount);
    if (v7 < 1
      || (unsigned __int8 v20 = atomic_load(_NSFCDisableLogSuppression), (v20 & 1) != 0)
      || (uint64_t v21 = atomic_load(&_NSFCSubarbitratedClaimCount), v21 <= 99))
    {
      uint64_t v8 = (os_log_s *)_NSFCClaimsLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = [*(id *)(a1 + 32) claimID];
        *(_DWORD *)buf = 138543362;
        uint64_t v28 = v9;
        _os_log_impl(&dword_182EB1000, v8, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ invoked in client", buf, 0xCu);
      }
    }

    (*(void (**)(void, void, uint64_t, uint64_t, void, uint64_t))(*(void *)(*(void *)(a1 + 32) + 160LL)
                                                                              + 16))( *(void *)(*(void *)(a1 + 32) + 160),  *(void *)(a1 + 32),  a2,  a3,  *(void *)(*(void *)(a1 + 32) + 176),  [*(id *)(a1 + 32) claimerError]);

    *(void *)(*(void *)(a1 + 32) + 160LL) = 0LL;
    uint64_t v6 = *(void **)(a1 + 32);
  }

  if (v6[21])
  {
    uint64_t v10 = atomic_load(&_NSFCSubarbitrationCount);
    if (v10 < 1
      || (unsigned __int8 v22 = atomic_load(_NSFCDisableLogSuppression), (v22 & 1) != 0)
      || (uint64_t v23 = atomic_load(&_NSFCSubarbitratedClaimCount), v23 <= 99))
    {
      __int128 v11 = (os_log_s *)_NSFCClaimsLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [*(id *)(a1 + 32) claimID];
        *(_DWORD *)buf = 138543362;
        uint64_t v28 = v12;
        _os_log_impl(&dword_182EB1000, v11, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ invoked in server", buf, 0xCu);
      }
    }

    if (a2) {
      uint64_t v13 = +[NSURLPromisePair pairWithURL:](&OBJC_CLASS___NSURLPromisePair, "pairWithURL:", a2);
    }
    else {
      uint64_t v13 = (NSURLPromisePair *)[MEMORY[0x189603FE8] null];
    }
    unsigned __int8 v14 = v13;
    if (a3) {
      uint64_t v15 = +[NSURLPromisePair pairWithURL:](&OBJC_CLASS___NSURLPromisePair, "pairWithURL:", a3);
    }
    else {
      uint64_t v15 = (NSURLPromisePair *)[MEMORY[0x189603FE8] null];
    }
    v16 = v15;
    uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 168LL);
    v26 = v14;
    uint64_t v18 = [MEMORY[0x189603F18] arrayWithObjects:&v26 count:1];
    v25 = v16;
    (*(void (**)(uint64_t, uint64_t, uint64_t, void, uint64_t, uint64_t))(v17 + 16))( v17,  v18,  [MEMORY[0x189603F18] arrayWithObjects:&v25 count:1],  *(void *)(*(void *)(a1 + 32) + 176),  objc_msgSend(*(id *)(a1 + 32), "shouldEnableMaterializationDuringAccessorBlock"),  objc_msgSend(*(id *)(a1 + 32), "claimerError"));

    *(void *)(*(void *)(a1 + 32) + 168LL) = 0LL;
    uint64_t v6 = *(void **)(a1 + 32);
  }

  v24.receiver = v6;
  v24.super_class = (Class)&OBJC_CLASS___NSFileReadingWritingClaim;
  return objc_msgSendSuper2(&v24, sel_invokeClaimer);
}

- (void)devalueSelf
{
  void v8[5] = *MEMORY[0x1895F89C0];
  readingLocation = self->_readingLocation;
  uint64_t v4 = MEMORY[0x1895F87A8];
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __40__NSFileReadingWritingClaim_devalueSelf__block_invoke;
  v8[3] = &unk_189CA3A78;
  void v8[4] = self;
  -[NSFileAccessNode forEachRelevantAccessClaimPerformProcedure:]( readingLocation,  "forEachRelevantAccessClaimPerformProcedure:",  v8);
  writingLocation = self->_writingLocation;
  v7[0] = v4;
  v7[1] = 3221225472LL;
  v7[2] = __40__NSFileReadingWritingClaim_devalueSelf__block_invoke_2;
  v7[3] = &unk_189CA3A78;
  v7[4] = self;
  -[NSFileAccessNode forEachRelevantAccessClaimPerformProcedure:]( writingLocation,  "forEachRelevantAccessClaimPerformProcedure:",  v7);
  -[NSFileAccessNode removeAccessClaim:](self->_readingLocation, "removeAccessClaim:", self);
  self->_readingLocation = 0LL;
  -[NSFileAccessNode removeAccessClaim:](self->_writingLocation, "removeAccessClaim:", self);
  self->_writingLocation = 0LL;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSFileReadingWritingClaim;
  -[NSFileAccessClaim devalueSelf](&v6, sel_devalueSelf);
}

uint64_t __40__NSFileReadingWritingClaim_devalueSelf__block_invoke(uint64_t a1, void *a2)
{
  return [a2 devalueOldClaim:*(void *)(a1 + 32)];
}

uint64_t __40__NSFileReadingWritingClaim_devalueSelf__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 devalueOldClaim:*(void *)(a1 + 32)];
}

- (void)itemAtLocation:(id)a3 wasReplacedByItemAtLocation:(id)a4
{
  if (self->_writingLocation == a3)
  {
    [a4 addAccessClaim:self];
    [a3 removeAccessClaim:self];
    self->_writingLocation = (NSFileAccessNode *)a4;
  }

  if (self->_readingLocation == a3)
  {
    [a4 addAccessClaim:self];
    [a3 removeAccessClaim:self];
    self->_readingLocation = (NSFileAccessNode *)a4;
  }

- (BOOL)blocksClaim:(id)a3
{
  if ([a3 isBlockedByReadingItemAtLocation:self->_readingLocation options:self->_readingOptions]) {
    return 1;
  }
  else {
    return [a3 isBlockedByWritingItemAtLocation:self->_writingLocation options:self->_writingOptions];
  }
}

- (id)allURLs
{
  uint64_t v3 = (void *)[MEMORY[0x189603FA8] array];
  uint64_t v4 = v3;
  if (self->_readingURL) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_writingURL) {
    objc_msgSend(v4, "addObject:");
  }
  return v4;
}

- (BOOL)shouldCancelInsteadOfWaiting
{
  return (BYTE2(self->_readingOptions) >> 3) & 1;
}

- (void)protectFilesAgainstEviction
{
}

@end