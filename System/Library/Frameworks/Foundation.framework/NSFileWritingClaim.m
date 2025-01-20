@interface NSFileWritingClaim
+ (BOOL)supportsSecureCoding;
- (BOOL)blocksClaim:(id)a3;
- (BOOL)evaluateSelfWithRootNode:(id)a3 checkSubarbitrability:(BOOL)a4;
- (BOOL)isBlockedByReadingItemAtLocation:(id)a3 options:(unint64_t)a4;
- (BOOL)isBlockedByWritingItemAtLocation:(id)a3 options:(unint64_t)a4;
- (NSFileWritingClaim)initWithCoder:(id)a3;
- (NSFileWritingClaim)initWithPurposeID:(id)a3 url:(id)a4 options:(unint64_t)a5 claimer:(id)a6;
- (id)allURLs;
- (void)dealloc;
- (void)devalueSelf;
- (void)encodeWithCoder:(id)a3;
- (void)forwardUsingConnection:(id)a3 crashHandler:(id)a4;
- (void)granted;
- (void)invokeClaimer;
- (void)itemAtLocation:(id)a3 wasReplacedByItemAtLocation:(id)a4;
- (void)protectFilesAgainstEviction;
- (void)resolveURLsThenContinueInvokingClaimer:(id)a3;
@end

@implementation NSFileWritingClaim

- (NSFileWritingClaim)initWithPurposeID:(id)a3 url:(id)a4 options:(unint64_t)a5 claimer:(id)a6
{
  v9 = -[NSFileAccessClaim initWithClient:claimID:purposeID:](self, "initWithClient:claimID:purposeID:", 0LL, 0LL, a3);
  if (v9)
  {
    v9->_url = (NSURL *)[a4 copy];
    v9->_options = a5;
    v9->super._claimerOrNil = (id)[a6 copy];
  }

  return v9;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFileWritingClaim;
  -[NSFileAccessClaim dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"NSFileAccessClaims should only ever be encoded by XPC" userInfo:0]);
  }
  objc_msgSend( a3,  "encodeObject:forKey:",  +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", self->_url),  @"NSURLPairKey");
  objc_msgSend( a3,  "encodeObject:forKey:",  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_options),  @"NSURLOptionsKey");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSFileWritingClaim;
  -[NSFileAccessClaim encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
}

- (NSFileWritingClaim)initWithCoder:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSFileWritingClaim;
  uint64_t v4 = -[NSFileAccessClaim initWithCoder:](&v8, sel_initWithCoder_);
  if (!v4) {
    return v4;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4->_url = (NSURL *)(id)objc_msgSend( (id)objc_msgSend( a3,  "decodeObjectOfClass:forKey:",  objc_opt_class(),  @"NSURLPairKey"),  "URL");
    v4->_options = objc_msgSend( (id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"NSURLOptionsKey"),  "unsignedIntegerValue");
    return v4;
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"NSFileAccessClaims should only ever be decoded by XPC" userInfo:0]);
  return (NSFileWritingClaim *)+[NSFileWritingClaim supportsSecureCoding](v6, v7);
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
  v9[2] = __58__NSFileWritingClaim_forwardUsingConnection_crashHandler___block_invoke;
  v9[3] = &unk_189CA0D60;
  v9[4] = self;
  v9[5] = a4;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __58__NSFileWritingClaim_forwardUsingConnection_crashHandler___block_invoke_342;
  v8[3] = &unk_189CA3A50;
  v8[4] = self;
  objc_msgSend((id)objc_msgSend(a3, "remoteObjectProxyWithErrorHandler:", v9), "grantAccessClaim:withReply:", self, v8);
}

uint64_t __58__NSFileWritingClaim_forwardUsingConnection_crashHandler___block_invoke(uint64_t a1, uint64_t a2)
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
    objc_msgSend( *(id *)(a1 + 32),  "setClaimerError:",  _NSErrorWithFilePath(512, *(void *)(*(void *)(a1 + 32) + 208)));
  }
  return [*(id *)(a1 + 32) unblock];
}

uint64_t __58__NSFileWritingClaim_forwardUsingConnection_crashHandler___block_invoke_342( uint64_t a1,  uint64_t a2,  void *a3,  void *a4,  uint64_t a5,  uint64_t a6)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  uint64_t v11 = (os_log_s *)_NSFCClaimsLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = [*(id *)(a1 + 32) claimID];
    int v15 = 138543362;
    uint64_t v16 = v12;
    _os_log_debug_impl( &dword_182EB1000,  v11,  OS_LOG_TYPE_DEBUG,  "%{public}@ received grantAccessClaim reply",  (uint8_t *)&v15,  0xCu);
    if (a6) {
      goto LABEL_3;
    }
  }

  else if (a6)
  {
LABEL_3:
    [*(id *)(a1 + 32) setClaimerError:a6];
    return [*(id *)(a1 + 32) unblock];
  }

  v13 = (void *)[a3 firstObject];
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    *(void *)(*(void *)(a1 + 32) + 208) = objc_msgSend((id)objc_msgSend(v13, "URL"), "copy");
    *(_BYTE *)(*(void *)(a1 + 32) + 216LL) = 1;
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
  v13[1] = *MEMORY[0x1895F89C0];
  id v6 = (NSFileAccessNode *)[a3 descendantForFileURL:self->_url];
  if (!v6) {
    return 1;
  }
  uint64_t v7 = v6;
  uint64_t v12 = 0LL;
  if (v4 && !-[NSFileAccessNode itemIsSubarbitrable](v6, "itemIsSubarbitrable"))
  {
    BOOL v9 = 0;
  }

  else
  {
    v13[0] = v7;
    if (-[NSFileAccessClaim canAccessLocations:forReading:error:]( self,  "canAccessLocations:forReading:error:",  [MEMORY[0x189603F18] arrayWithObjects:v13 count:1],  0,  &v12))
    {
      self->_location = v7;
      -[NSFileAccessNode addAccessClaim:](v7, "addAccessClaim:", self);
      location = self->_location;
      v11[0] = MEMORY[0x1895F87A8];
      v11[1] = 3221225472LL;
      v11[2] = __69__NSFileWritingClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke;
      v11[3] = &unk_189CA3A78;
      v11[4] = self;
      -[NSFileAccessNode forEachRelevantAccessClaimForEvaluatingAgainstClaim:performProcedure:]( location,  "forEachRelevantAccessClaimForEvaluatingAgainstClaim:performProcedure:",  self,  v11);
    }

    else
    {
      -[NSFileAccessClaim setClaimerError:](self, "setClaimerError:", v12);
    }

    BOOL v9 = 1;
  }

  -[NSFileAccessNode removeSelfIfUseless](v7, "removeSelfIfUseless");
  return v9;
}

uint64_t __69__NSFileWritingClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke( uint64_t a1,  void *a2)
{
  return [a2 evaluateNewClaim:*(void *)(a1 + 32)];
}

- (BOOL)isBlockedByReadingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  return [(id)objc_opt_class() canReadingItemAtLocation:a3 options:a4 safelyOverlapNewWriting:1 ofItemAtLocation:self->_location options:self->_options] ^ 1;
}

- (BOOL)isBlockedByWritingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  return [(id)objc_opt_class() canNewWriteOfItemAtLocation:self->_location options:self->_options safelyOverlapExistingWriteOfItemAtLocation:a3 options:a4] ^ 1;
}

- (void)granted
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  if (self->_location)
  {
    uint64_t v3 = atomic_load(&_NSFCSubarbitrationCount);
    if (v3 < 1
      || (unsigned __int8 v10 = atomic_load(_NSFCDisableLogSuppression), (v10 & 1) != 0)
      || (uint64_t v11 = atomic_load(&_NSFCSubarbitratedClaimCount), v11 <= 99))
    {
      BOOL v4 = (os_log_s *)_NSFCClaimsLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v18 = -[NSFileAccessClaim claimID](self, "claimID");
        _os_log_impl(&dword_182EB1000, v4, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ granted in server", buf, 0xCu);
      }
    }

    location = self->_location;
    uint64_t v5 = [MEMORY[0x189603F18] arrayWithObjects:&location count:1];
    uint64_t v6 = MEMORY[0x1895F87A8];
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __29__NSFileWritingClaim_granted__block_invoke;
    v15[3] = &unk_189C9E870;
    v15[4] = self;
    -[NSFileAccessClaim makeProvidersProvideItemsForReadingLocations:options:andWritingLocationsIfNecessary:options:thenContinue:]( self,  "makeProvidersProvideItemsForReadingLocations:options:andWritingLocationsIfNecessary:options:thenContinue:",  0LL,  0LL,  v5,  &self->_options,  v15);
    if (-[NSFileAccessClaim shouldInformProvidersAboutEndOfWriteWithOptions:]( self,  "shouldInformProvidersAboutEndOfWriteWithOptions:",  self->_options))
    {
      v14[0] = v6;
      v14[1] = 3221225472LL;
      v14[2] = __29__NSFileWritingClaim_granted__block_invoke_4;
      v14[3] = &unk_189C9A030;
      v14[4] = self;
      -[NSFileAccessClaim whenRevokedPerformProcedure:](self, "whenRevokedPerformProcedure:", v14);
    }
  }

  else if (self->super._client)
  {
    uint64_t v7 = (os_log_s *)_NSFCClaimsLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = -[NSFileAccessClaim claimID](self, "claimID");
      _os_log_error_impl( &dword_182EB1000,  v7,  OS_LOG_TYPE_ERROR,  "Claim %{public}@ can't be granted in daemon",  buf,  0xCu);
    }
  }

  else
  {
    uint64_t v8 = atomic_load(&_NSFCSubarbitrationCount);
    if (v8 < 1
      || (unsigned __int8 v12 = atomic_load(_NSFCDisableLogSuppression), (v12 & 1) != 0)
      || (uint64_t v13 = atomic_load(&_NSFCSubarbitratedClaimCount), v13 <= 99))
    {
      BOOL v9 = (os_log_s *)_NSFCClaimsLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v18 = -[NSFileAccessClaim claimID](self, "claimID");
        _os_log_impl(&dword_182EB1000, v9, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ granted in client", buf, 0xCu);
      }
    }
  }

  -[NSFileAccessClaim unblockClaimerForReason:](self, "unblockClaimerForReason:", @"Initial blockage");
}

uint64_t __29__NSFileWritingClaim_granted__block_invoke(uint64_t result, int a2)
{
  v5[5] = *MEMORY[0x1895F89C0];
  if (a2)
  {
    v2 = *(void **)(result + 32);
    uint64_t v3 = v2[29];
    BOOL v4 = (v2[28] & 0x13000BLL) != 0;
    v5[0] = MEMORY[0x1895F87A8];
    v5[1] = 3221225472LL;
    v5[2] = __29__NSFileWritingClaim_granted__block_invoke_2;
    v5[3] = &unk_189CA3AC8;
    v5[4] = v2;
    return [v2 makePresentersOfItemAtLocation:v3 orContainedItem:v4 relinquishUsingProcedureGetter:v5];
  }

  return result;
}

id __29__NSFileWritingClaim_granted__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[7] = *MEMORY[0x1895F89C0];
  if (![*(id *)(a1 + 32) shouldWritingWithOptions:*(void *)(*(void *)(a1 + 32) + 224) causePresenterToRelinquish:a2]) {
    return 0LL;
  }
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __29__NSFileWritingClaim_granted__block_invoke_3;
  v7[3] = &unk_189CA3B68;
  v7[4] = *(void *)(a1 + 32);
  v7[5] = a2;
  v7[6] = a3;
  return (id)[v7 copy];
}

uint64_t __29__NSFileWritingClaim_granted__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend( *(id *)(a1 + 40),  "relinquishToWritingClaimWithID:options:purposeID:subitemPath:resultHandler:",  objc_msgSend(*(id *)(a1 + 32), "claimID"),  *(void *)(*(void *)(a1 + 32) + 224),  objc_msgSend( *(id *)(a1 + 32),  "purposeIDOfClaimOnItemAtLocation:forMessagingPresenter:",  *(void *)(*(void *)(a1 + 32) + 232),  *(void *)(a1 + 40)),  *(void *)(a1 + 48),  a2);
}

uint64_t __29__NSFileWritingClaim_granted__block_invoke_4(uint64_t a1)
{
  return objc_msgSend( (id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 232), "itemProvider"),  "observeEndOfWriteAtLocation:forAccessClaim:",  *(void *)(*(void *)(a1 + 32) + 232));
}

- (void)resolveURLsThenContinueInvokingClaimer:(id)a3
{
  v10[6] = *MEMORY[0x1895F89C0];
  if (-[NSFileAccessClaim didWait](self, "didWait"))
  {
    id v5 = -[NSFileAccessNode standardizedURL](self->_location, "standardizedURL");
    if (v5)
    {
      uint64_t v6 = v5;

      self->_url = (NSURL *)[v6 copy];
      self->_urlDidChange = 1;
    }
  }

  if (-[NSFileAccessClaim claimerError](self, "claimerError"))
  {
    (*((void (**)(id, void))a3 + 2))(a3, 0LL);
  }

  else
  {
    location = self->_location;
    id v8 = -[NSFileAccessClaim purposeID](self, "purposeID");
    unint64_t options = self->_options;
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __61__NSFileWritingClaim_resolveURLsThenContinueInvokingClaimer___block_invoke;
    v10[3] = &unk_189CA3B90;
    v10[4] = self;
    v10[5] = a3;
    -[NSFileAccessClaim makeProviderOfItemAtLocation:provideOrAttachPhysicalURLIfNecessaryForPurposeID:writingOptions:thenContinue:]( self,  "makeProviderOfItemAtLocation:provideOrAttachPhysicalURLIfNecessaryForPurposeID:writingOptions:thenContinue:",  location,  v8,  options,  v10);
  }

uint64_t __61__NSFileWritingClaim_resolveURLsThenContinueInvokingClaimer___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  if (!a2)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (*(_BYTE *)(v4 + 216)) {
      a2 = *(void *)(v4 + 208);
    }
    else {
      a2 = 0LL;
    }
  }

  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
}

- (void)invokeClaimer
{
  v2[5] = *MEMORY[0x1895F89C0];
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 3221225472LL;
  v2[2] = __35__NSFileWritingClaim_invokeClaimer__block_invoke;
  v2[3] = &unk_189CA3AF0;
  v2[4] = self;
  -[NSFileWritingClaim resolveURLsThenContinueInvokingClaimer:](self, "resolveURLsThenContinueInvokingClaimer:", v2);
}

id __35__NSFileWritingClaim_invokeClaimer__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4[20])
  {
    uint64_t v5 = atomic_load(&_NSFCSubarbitrationCount);
    if (v5 < 1
      || (unsigned __int8 v14 = atomic_load(_NSFCDisableLogSuppression), (v14 & 1) != 0)
      || (uint64_t v15 = atomic_load(&_NSFCSubarbitratedClaimCount), v15 <= 99))
    {
      uint64_t v6 = (os_log_s *)_NSFCClaimsLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = [*(id *)(a1 + 32) claimID];
        *(_DWORD *)buf = 138543362;
        uint64_t v21 = v7;
        _os_log_impl(&dword_182EB1000, v6, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ invoked in client", buf, 0xCu);
      }
    }

    (*(void (**)(void, void, uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 32) + 160) + 16))( *(void *)(*(void *)(a1 + 32) + 160),  *(void *)(a1 + 32),  a2,  [*(id *)(a1 + 32) claimerError]);

    *(void *)(*(void *)(a1 + 32) + 160LL) = 0LL;
    uint64_t v4 = *(void **)(a1 + 32);
  }

  if (v4[21])
  {
    uint64_t v8 = atomic_load(&_NSFCSubarbitrationCount);
    if (v8 < 1
      || (unsigned __int8 v16 = atomic_load(_NSFCDisableLogSuppression), (v16 & 1) != 0)
      || (uint64_t v17 = atomic_load(&_NSFCSubarbitratedClaimCount), v17 <= 99))
    {
      BOOL v9 = (os_log_s *)_NSFCClaimsLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [*(id *)(a1 + 32) claimID];
        *(_DWORD *)buf = 138543362;
        uint64_t v21 = v10;
        _os_log_impl(&dword_182EB1000, v9, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ invoked in server", buf, 0xCu);
      }
    }

    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 168LL);
    unsigned __int8 v12 = +[NSURLPromisePair pairWithURL:](&OBJC_CLASS___NSURLPromisePair, "pairWithURL:", a2);
    if (!v12) {
      unsigned __int8 v12 = (NSURLPromisePair *)[MEMORY[0x189603FE8] null];
    }
    uint64_t v19 = v12;
    (*(void (**)(uint64_t, void, uint64_t, void, uint64_t, uint64_t))(v11 + 16))( v11,  0,  [MEMORY[0x189603F18] arrayWithObjects:&v19 count:1],  *(void *)(*(void *)(a1 + 32) + 176),  objc_msgSend(*(id *)(a1 + 32), "shouldEnableMaterializationDuringAccessorBlock"),  objc_msgSend(*(id *)(a1 + 32), "claimerError"));

    *(void *)(*(void *)(a1 + 32) + 168LL) = 0LL;
    uint64_t v4 = *(void **)(a1 + 32);
  }

  v18.receiver = v4;
  v18.super_class = (Class)&OBJC_CLASS___NSFileWritingClaim;
  return objc_msgSendSuper2(&v18, sel_invokeClaimer);
}

- (void)devalueSelf
{
  v5[5] = *MEMORY[0x1895F89C0];
  location = self->_location;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __33__NSFileWritingClaim_devalueSelf__block_invoke;
  v5[3] = &unk_189CA3A78;
  v5[4] = self;
  -[NSFileAccessNode forEachRelevantAccessClaimPerformProcedure:]( location,  "forEachRelevantAccessClaimPerformProcedure:",  v5);
  -[NSFileAccessNode removeAccessClaim:](self->_location, "removeAccessClaim:", self);
  self->_location = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSFileWritingClaim;
  -[NSFileAccessClaim devalueSelf](&v4, sel_devalueSelf);
}

uint64_t __33__NSFileWritingClaim_devalueSelf__block_invoke(uint64_t a1, void *a2)
{
  return [a2 devalueOldClaim:*(void *)(a1 + 32)];
}

- (void)itemAtLocation:(id)a3 wasReplacedByItemAtLocation:(id)a4
{
  if (self->_location == a3)
  {
    [a4 addAccessClaim:self];
    [a3 removeAccessClaim:self];
    self->_location = (NSFileAccessNode *)a4;
  }

- (BOOL)blocksClaim:(id)a3
{
  return [a3 isBlockedByWritingItemAtLocation:self->_location options:self->_options];
}

- (id)allURLs
{
  return (id)objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:", self->_url, 0);
}

- (void)protectFilesAgainstEviction
{
}

@end