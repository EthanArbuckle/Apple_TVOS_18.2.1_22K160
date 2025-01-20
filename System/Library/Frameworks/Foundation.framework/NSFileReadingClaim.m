@interface NSFileReadingClaim
+ (BOOL)supportsSecureCoding;
- (BOOL)blocksClaim:(id)a3;
- (BOOL)evaluateSelfWithRootNode:(id)a3 checkSubarbitrability:(BOOL)a4;
- (BOOL)isBlockedByReadingItemAtLocation:(id)a3 options:(unint64_t)a4;
- (BOOL)isBlockedByWritingItemAtLocation:(id)a3 options:(unint64_t)a4;
- (BOOL)shouldBeRevokedPriorToInvokingAccessor;
- (BOOL)shouldCancelInsteadOfWaiting;
- (NSFileReadingClaim)initWithCoder:(id)a3;
- (NSFileReadingClaim)initWithPurposeID:(id)a3 url:(id)a4 options:(unint64_t)a5 claimer:(id)a6;
- (id)allURLs;
- (void)dealloc;
- (void)devalueSelf;
- (void)encodeWithCoder:(id)a3;
- (void)forwardUsingConnection:(id)a3 crashHandler:(id)a4;
- (void)granted;
- (void)invokeClaimer;
- (void)itemAtLocation:(id)a3 wasReplacedByItemAtLocation:(id)a4;
- (void)protectFilesAgainstEviction;
- (void)resolveURLThenMaybeContinueInvokingClaimer:(id)a3;
@end

@implementation NSFileReadingClaim

- (NSFileReadingClaim)initWithPurposeID:(id)a3 url:(id)a4 options:(unint64_t)a5 claimer:(id)a6
{
  v9 = -[NSFileAccessClaim initWithClient:claimID:purposeID:](self, "initWithClient:claimID:purposeID:", 0LL, 0LL, a3);
  if (v9)
  {
    v9->_url = (NSURL *)[a4 copy];
    v9->_options = ((_DWORD)a5 << 14) & 0x20000 | a5;
    v9->super._claimerOrNil = (id)[a6 copy];
  }

  return v9;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFileReadingClaim;
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
  v5.super_class = (Class)&OBJC_CLASS___NSFileReadingClaim;
  -[NSFileAccessClaim encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
}

- (NSFileReadingClaim)initWithCoder:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSFileReadingClaim;
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
  return (NSFileReadingClaim *)+[NSFileReadingClaim supportsSecureCoding](v6, v7);
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
  v9[2] = __58__NSFileReadingClaim_forwardUsingConnection_crashHandler___block_invoke;
  v9[3] = &unk_189CA0D60;
  v9[4] = self;
  v9[5] = a4;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __58__NSFileReadingClaim_forwardUsingConnection_crashHandler___block_invoke_317;
  v8[3] = &unk_189CA3A50;
  v8[4] = self;
  objc_msgSend((id)objc_msgSend(a3, "remoteObjectProxyWithErrorHandler:", v9), "grantAccessClaim:withReply:", self, v8);
}

uint64_t __58__NSFileReadingClaim_forwardUsingConnection_crashHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (os_log_s *)_NSFCClaimsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v6 = [*(id *)(a1 + 32) claimID];
    int v7 = 138543618;
    uint64_t v8 = v6;
    __int16 v9 = 2114;
    uint64_t v10 = a2;
    _os_log_error_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_ERROR,  "%{public}@ grantAccessClaim message failed: %{public}@",  (uint8_t *)&v7,  0x16u);
  }

  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16LL))()) {
    objc_msgSend( *(id *)(a1 + 32),  "setClaimerError:",  _NSErrorWithFilePath(256, *(void *)(*(void *)(a1 + 32) + 208)));
  }
  return [*(id *)(a1 + 32) unblock];
}

uint64_t __58__NSFileReadingClaim_forwardUsingConnection_crashHandler___block_invoke_317( uint64_t a1,  void *a2,  uint64_t a3,  void *a4,  uint64_t a5,  uint64_t a6)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  uint64_t v11 = (os_log_s *)_NSFCClaimsLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = [*(id *)(a1 + 32) claimID];
    int v17 = 138543362;
    uint64_t v18 = v13;
    _os_log_debug_impl( &dword_182EB1000,  v11,  OS_LOG_TYPE_DEBUG,  "%{public}@ received grantAccessClaim reply",  (uint8_t *)&v17,  0xCu);
    if (a6) {
      goto LABEL_3;
    }
  }

  else if (a6)
  {
LABEL_3:
    uint64_t v12 = (os_log_s *)_NSFCClaimsLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v16 = [*(id *)(a1 + 32) claimID];
      int v17 = 138543618;
      uint64_t v18 = v16;
      __int16 v19 = 2114;
      uint64_t v20 = a6;
      _os_log_error_impl( &dword_182EB1000,  v12,  OS_LOG_TYPE_ERROR,  "%{public}@ grantAccessClaim reply is an error: %{public}@",  (uint8_t *)&v17,  0x16u);
    }

    [*(id *)(a1 + 32) setClaimerError:a6];
    return [*(id *)(a1 + 32) unblock];
  }

  v14 = (void *)[a2 firstObject];
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    *(void *)(*(void *)(a1 + 32) + 208) = objc_msgSend((id)objc_msgSend(v14, "URL"), "copy");
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
  v14[1] = *MEMORY[0x1895F89C0];
  int v7 = (NSFileAccessNode *)[a3 descendantForFileURL:self->_url];
  if (!v7) {
    return 1;
  }
  uint64_t v8 = v7;
  uint64_t v13 = 0LL;
  if (v4 && !-[NSFileAccessNode itemIsSubarbitrable](v7, "itemIsSubarbitrable"))
  {
    BOOL v10 = 0;
  }

  else
  {
    v14[0] = v8;
    if (-[NSFileAccessClaim canAccessLocations:forReading:error:]( self,  "canAccessLocations:forReading:error:",  [MEMORY[0x189603F18] arrayWithObjects:v14 count:1],  1,  &v13))
    {
      self->_location = v8;
      -[NSFileAccessNode addAccessClaim:](v8, "addAccessClaim:", self);
      if ((self->_options & 2) != 0) {
        self->_rootNode = (NSFileAccessNode *)a3;
      }
      location = self->_location;
      v12[0] = MEMORY[0x1895F87A8];
      v12[1] = 3221225472LL;
      v12[2] = __69__NSFileReadingClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke;
      v12[3] = &unk_189CA3A78;
      v12[4] = self;
      -[NSFileAccessNode forEachRelevantAccessClaimForEvaluatingAgainstClaim:performProcedure:]( location,  "forEachRelevantAccessClaimForEvaluatingAgainstClaim:performProcedure:",  self,  v12);
    }

    else
    {
      -[NSFileAccessClaim setClaimerError:](self, "setClaimerError:", v13);
    }

    BOOL v10 = 1;
  }

  -[NSFileAccessNode removeSelfIfUseless](v8, "removeSelfIfUseless");
  return v10;
}

uint64_t __69__NSFileReadingClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke( uint64_t a1,  void *a2)
{
  return [a2 evaluateNewClaim:*(void *)(a1 + 32)];
}

- (BOOL)isBlockedByReadingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  return 0;
}

- (BOOL)isBlockedByWritingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  return [(id)objc_opt_class() canReadingItemAtLocation:self->_location options:self->_options safelyOverlapNewWriting:0 ofItemAtLocation:a3 options:a4] ^ 1;
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
    v15[0] = MEMORY[0x1895F87A8];
    v15[1] = 3221225472LL;
    v15[2] = __29__NSFileReadingClaim_granted__block_invoke;
    v15[3] = &unk_189C9E870;
    v15[4] = self;
    -[NSFileAccessClaim makeProvidersProvideItemsForReadingLocations:options:andWritingLocationsIfNecessary:options:thenContinue:]( self,  "makeProvidersProvideItemsForReadingLocations:options:andWritingLocationsIfNecessary:options:thenContinue:",  v5,  &self->_options,  0LL,  0LL,  v15);
  }

  else if (self->super._client)
  {
    uint64_t v6 = (os_log_s *)_NSFCClaimsLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v18 = -[NSFileAccessClaim claimID](self, "claimID");
      _os_log_error_impl( &dword_182EB1000,  v6,  OS_LOG_TYPE_ERROR,  "Claim %{public}@ can't be granted in daemon",  buf,  0xCu);
    }
  }

  else
  {
    uint64_t v7 = atomic_load(&_NSFCSubarbitrationCount);
    if (v7 < 1
      || (unsigned __int8 v12 = atomic_load(_NSFCDisableLogSuppression), (v12 & 1) != 0)
      || (uint64_t v13 = atomic_load(&_NSFCSubarbitratedClaimCount), v13 <= 99))
    {
      uint64_t v8 = (os_log_s *)_NSFCClaimsLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v18 = -[NSFileAccessClaim claimID](self, "claimID");
        _os_log_impl(&dword_182EB1000, v8, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ granted in client", buf, 0xCu);
      }
    }

    if ((self->_options & 8) != 0)
    {
      url = self->_url;
      v14[0] = MEMORY[0x1895F87A8];
      v14[1] = 3221225472LL;
      void v14[2] = __29__NSFileReadingClaim_granted__block_invoke_321;
      v14[3] = &unk_189C9AE08;
      v14[4] = self;
      -[NSFileAccessClaim prepareItemForUploadingFromURL:thenContinue:]( self,  "prepareItemForUploadingFromURL:thenContinue:",  url,  v14);
    }
  }

  -[NSFileAccessClaim unblockClaimerForReason:](self, "unblockClaimerForReason:", @"Initial blockage");
}

uint64_t __29__NSFileReadingClaim_granted__block_invoke(uint64_t result, int a2)
{
  v4[5] = *MEMORY[0x1895F89C0];
  if (a2)
  {
    v2 = *(void **)(result + 32);
    uint64_t v3 = v2[29];
    v4[0] = MEMORY[0x1895F87A8];
    v4[1] = 3221225472LL;
    v4[2] = __29__NSFileReadingClaim_granted__block_invoke_2;
    v4[3] = &unk_189CA3AC8;
    v4[4] = v2;
    return [v2 makePresentersOfItemAtLocation:v3 orContainedItem:0 relinquishUsingProcedureGetter:v4];
  }

  return result;
}

id __29__NSFileReadingClaim_granted__block_invoke_2(uint64_t a1, uint64_t a2)
{
  v6[6] = *MEMORY[0x1895F89C0];
  if (![*(id *)(a1 + 32) shouldReadingWithOptions:*(void *)(*(void *)(a1 + 32) + 224) causePresenterToRelinquish:a2]) {
    return 0LL;
  }
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __29__NSFileReadingClaim_granted__block_invoke_3;
  v6[3] = &unk_189CA3AA0;
  uint64_t v4 = *(void *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v4;
  return (id)[v6 copy];
}

uint64_t __29__NSFileReadingClaim_granted__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend( *(id *)(a1 + 32),  "relinquishToReadingClaimWithID:options:purposeID:resultHandler:",  objc_msgSend(*(id *)(a1 + 40), "claimID"),  *(void *)(*(void *)(a1 + 40) + 224),  objc_msgSend(*(id *)(a1 + 40), "purposeID"),  a2);
}

void *__29__NSFileReadingClaim_granted__block_invoke_321(void *result, void *a2, uint64_t a3)
{
  uint64_t v3 = result;
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

- (void)resolveURLThenMaybeContinueInvokingClaimer:(id)a3
{
  void v8[5] = *MEMORY[0x1895F89C0];
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
    v7[5] = a3;
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __65__NSFileReadingClaim_resolveURLThenMaybeContinueInvokingClaimer___block_invoke;
    v8[3] = &unk_189CA3B18;
    v8[4] = self;
    v7[0] = MEMORY[0x1895F87A8];
    v7[1] = 3221225472LL;
    v7[2] = __65__NSFileReadingClaim_resolveURLThenMaybeContinueInvokingClaimer___block_invoke_3;
    v7[3] = &unk_189C9FF78;
    v7[4] = self;
    __65__NSFileReadingClaim_resolveURLThenMaybeContinueInvokingClaimer___block_invoke((uint64_t)v8, (uint64_t)v7);
  }

uint64_t __65__NSFileReadingClaim_resolveURLThenMaybeContinueInvokingClaimer___block_invoke( uint64_t a1,  uint64_t a2)
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
  v6[2] = __65__NSFileReadingClaim_resolveURLThenMaybeContinueInvokingClaimer___block_invoke_2;
  v6[3] = &unk_189CA3AF0;
  v6[4] = v3;
  uint64_t result = [(id)v3 checkIfSymbolicLinkAtURL:v4 withResolutionCount:v3 + 248 andIfSoThenReevaluateSelf:v6];
  if ((result & 1) == 0) {
    return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  }
  return result;
}

uint64_t __65__NSFileReadingClaim_resolveURLThenMaybeContinueInvokingClaimer___block_invoke_2( uint64_t a1,  void *a2)
{
  *(void *)(*(void *)(a1 + 32) + 208) = [a2 copy];
  *(_BYTE *)(*(void *)(a1 + 32) + 216LL) = 1;
  return [*(id *)(a1 + 32) evaluateSelfWithRootNode:*(void *)(*(void *)(a1 + 32) + 240) checkSubarbitrability:0];
}

uint64_t __65__NSFileReadingClaim_resolveURLThenMaybeContinueInvokingClaimer___block_invoke_3(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[29];
  uint64_t v4 = [v2 purposeID];
  __int128 v5 = *(_OWORD *)(a1 + 32);
  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 224LL);
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __65__NSFileReadingClaim_resolveURLThenMaybeContinueInvokingClaimer___block_invoke_4;
  v8[3] = &unk_189CA3B40;
  __int128 v9 = v5;
  return [v2 makeProviderOfItemAtLocation:v3 provideOrAttachPhysicalURLIfNecessaryForPurposeID:v4 readingOptions:v6 thenContinue:v8];
}

uint64_t __65__NSFileReadingClaim_resolveURLThenMaybeContinueInvokingClaimer___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)invokeClaimer
{
  v2[5] = *MEMORY[0x1895F89C0];
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 3221225472LL;
  v2[2] = __35__NSFileReadingClaim_invokeClaimer__block_invoke;
  v2[3] = &unk_189CA3AF0;
  v2[4] = self;
  -[NSFileReadingClaim resolveURLThenMaybeContinueInvokingClaimer:]( self,  "resolveURLThenMaybeContinueInvokingClaimer:",  v2);
}

id __35__NSFileReadingClaim_invokeClaimer__block_invoke(uint64_t a1, uint64_t a2)
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

    (*(void (**)(void, void, uint64_t, void, uint64_t))(*(void *)(*(void *)(a1 + 32) + 160) + 16))( *(void *)(*(void *)(a1 + 32) + 160),  *(void *)(a1 + 32),  a2,  *(void *)(*(void *)(a1 + 32) + 176),  [*(id *)(a1 + 32) claimerError]);

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
      __int128 v9 = (os_log_s *)_NSFCClaimsLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = [*(id *)(a1 + 32) claimID];
        *(_DWORD *)buf = 138543362;
        uint64_t v21 = v10;
        _os_log_impl(&dword_182EB1000, v9, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ invoked in server", buf, 0xCu);
      }
    }

    uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 168LL);
    uint64_t v12 = +[NSURLPromisePair pairWithURL:](&OBJC_CLASS___NSURLPromisePair, "pairWithURL:", a2);
    if (!v12) {
      uint64_t v12 = (NSURLPromisePair *)[MEMORY[0x189603FE8] null];
    }
    uint64_t v19 = v12;
    (*(void (**)(uint64_t, uint64_t, void, void, uint64_t, uint64_t))(v11 + 16))( v11,  [MEMORY[0x189603F18] arrayWithObjects:&v19 count:1],  0,  *(void *)(*(void *)(a1 + 32) + 176),  objc_msgSend(*(id *)(a1 + 32), "shouldEnableMaterializationDuringAccessorBlock"),  objc_msgSend(*(id *)(a1 + 32), "claimerError"));

    *(void *)(*(void *)(a1 + 32) + 168LL) = 0LL;
    uint64_t v4 = *(void **)(a1 + 32);
  }

  v18.receiver = v4;
  v18.super_class = (Class)&OBJC_CLASS___NSFileReadingClaim;
  return objc_msgSendSuper2(&v18, sel_invokeClaimer);
}

- (void)devalueSelf
{
  v5[5] = *MEMORY[0x1895F89C0];
  location = self->_location;
  v5[0] = MEMORY[0x1895F87A8];
  v5[1] = 3221225472LL;
  v5[2] = __33__NSFileReadingClaim_devalueSelf__block_invoke;
  v5[3] = &unk_189CA3A78;
  v5[4] = self;
  -[NSFileAccessNode forEachRelevantAccessClaimPerformProcedure:]( location,  "forEachRelevantAccessClaimPerformProcedure:",  v5);
  -[NSFileAccessNode removeAccessClaim:](self->_location, "removeAccessClaim:", self);
  self->_location = 0LL;
  v4.receiver = self;
  v4.super_class = (Class)&OBJC_CLASS___NSFileReadingClaim;
  -[NSFileAccessClaim devalueSelf](&v4, sel_devalueSelf);
}

uint64_t __33__NSFileReadingClaim_devalueSelf__block_invoke(uint64_t a1, void *a2)
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
  return [a3 isBlockedByReadingItemAtLocation:self->_location options:self->_options];
}

- (BOOL)shouldBeRevokedPriorToInvokingAccessor
{
  return (LOBYTE(self->_options) >> 3) & 1;
}

- (id)allURLs
{
  return (id)objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:", self->_url, 0);
}

- (BOOL)shouldCancelInsteadOfWaiting
{
  return (BYTE2(self->_options) >> 3) & 1;
}

- (void)protectFilesAgainstEviction
{
}

@end