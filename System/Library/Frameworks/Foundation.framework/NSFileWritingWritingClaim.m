@interface NSFileWritingWritingClaim
+ (BOOL)supportsSecureCoding;
- (BOOL)blocksClaim:(id)a3;
- (BOOL)evaluateSelfWithRootNode:(id)a3 checkSubarbitrability:(BOOL)a4;
- (BOOL)isBlockedByReadingItemAtLocation:(id)a3 options:(unint64_t)a4;
- (BOOL)isBlockedByWritingItemAtLocation:(id)a3 options:(unint64_t)a4;
- (NSFileWritingWritingClaim)initWithCoder:(id)a3;
- (NSFileWritingWritingClaim)initWithPurposeID:(id)a3 url:(id)a4 options:(unint64_t)a5 url:(id)a6 options:(unint64_t)a7 claimer:(id)a8;
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

@implementation NSFileWritingWritingClaim

- (NSFileWritingWritingClaim)initWithPurposeID:(id)a3 url:(id)a4 options:(unint64_t)a5 url:(id)a6 options:(unint64_t)a7 claimer:(id)a8
{
  v13 = -[NSFileAccessClaim initWithClient:claimID:purposeID:](self, "initWithClient:claimID:purposeID:", 0LL, 0LL, a3);
  if (v13)
  {
    v13->_url1 = (NSURL *)[a4 copy];
    v13->_options1 = a5;
    v13->_url2 = (NSURL *)[a6 copy];
    v13->_options2 = a7;
    v13->super._claimerOrNil = (id)[a8 copy];
  }

  return v13;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFileWritingWritingClaim;
  -[NSFileAccessClaim dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"NSFileAccessClaims should only ever be encoded by XPC" userInfo:0]);
  }
  objc_msgSend( a3,  "encodeObject:forKey:",  +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", self->_url1),  @"NSURLPair1Key");
  objc_msgSend( a3,  "encodeObject:forKey:",  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_options1),  @"NSOptions1Key");
  objc_msgSend( a3,  "encodeObject:forKey:",  +[NSURLPromisePair pairWithURL:](NSURLPromisePair, "pairWithURL:", self->_url2),  @"NSURLPair2Key");
  objc_msgSend( a3,  "encodeObject:forKey:",  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_options2),  @"NSOptions2Key");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSFileWritingWritingClaim;
  -[NSFileAccessClaim encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
}

- (NSFileWritingWritingClaim)initWithCoder:(id)a3
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  v8.receiver = self;
  v8.super_class = (Class)&OBJC_CLASS___NSFileWritingWritingClaim;
  uint64_t v4 = -[NSFileAccessClaim initWithCoder:](&v8, sel_initWithCoder_);
  if (!v4) {
    return v4;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4->_url1 = (NSURL *)(id)objc_msgSend( (id)objc_msgSend( a3,  "decodeObjectOfClass:forKey:",  objc_opt_class(),  @"NSURLPair1Key"),  "URL");
    v4->_options1 = objc_msgSend( (id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"NSOptions1Key"),  "unsignedIntegerValue");
    v4->_url2 = (NSURL *)(id)objc_msgSend( (id)objc_msgSend( a3,  "decodeObjectOfClass:forKey:",  objc_opt_class(),  @"NSURLPair2Key"),  "URL");
    v4->_options2 = objc_msgSend( (id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"NSOptions2Key"),  "unsignedIntegerValue");
    return v4;
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"NSFileAccessClaims should only ever be decoded by XPC" userInfo:0]);
  return (NSFileWritingWritingClaim *)+[NSFileWritingWritingClaim supportsSecureCoding](v6, v7);
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
  v9[2] = __65__NSFileWritingWritingClaim_forwardUsingConnection_crashHandler___block_invoke;
  v9[3] = &unk_189CA0D60;
  v9[4] = self;
  v9[5] = a4;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __65__NSFileWritingWritingClaim_forwardUsingConnection_crashHandler___block_invoke_379;
  v8[3] = &unk_189CA3A50;
  v8[4] = self;
  objc_msgSend((id)objc_msgSend(a3, "remoteObjectProxyWithErrorHandler:", v9), "grantAccessClaim:withReply:", self, v8);
}

uint64_t __65__NSFileWritingWritingClaim_forwardUsingConnection_crashHandler___block_invoke( uint64_t a1,  uint64_t a2)
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

uint64_t __65__NSFileWritingWritingClaim_forwardUsingConnection_crashHandler___block_invoke_379( uint64_t a1,  uint64_t a2,  void *a3,  void *a4,  uint64_t a5,  uint64_t a6)
{
  uint64_t v22 = *MEMORY[0x1895F89C0];
  uint64_t v11 = (os_log_s *)_NSFCClaimsLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = [*(id *)(a1 + 32) claimID];
    int v18 = 138543362;
    uint64_t v19 = v13;
    _os_log_debug_impl( &dword_182EB1000,  v11,  OS_LOG_TYPE_DEBUG,  "%{public}@ received grantAccessClaim reply",  (uint8_t *)&v18,  0xCu);
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
      uint64_t v17 = [*(id *)(a1 + 32) claimID];
      int v18 = 138543618;
      uint64_t v19 = v17;
      __int16 v20 = 2114;
      uint64_t v21 = a6;
      _os_log_error_impl( &dword_182EB1000,  v12,  OS_LOG_TYPE_ERROR,  "%{public}@ grantAccessClaim reply is an error: %{public}@",  (uint8_t *)&v18,  0x16u);
    }

    [*(id *)(a1 + 32) setClaimerError:a6];
    return [*(id *)(a1 + 32) unblock];
  }

  v14 = (void *)[a3 firstObject];
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    *(void *)(*(void *)(a1 + 32) + 208) = objc_msgSend((id)objc_msgSend(v14, "URL"), "copy");
    *(_BYTE *)(*(void *)(a1 + 32) + 216LL) = 1;
  }

  else {
    v15 = (void *)[a3 objectAtIndex:1];
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    *(void *)(*(void *)(a1 + 32) + 232) = objc_msgSend((id)objc_msgSend(v15, "URL"), "copy");
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
  v19[2] = *MEMORY[0x1895F89C0];
  uint64_t v7 = (NSFileAccessNode *)[a3 descendantForFileURL:self->_url1];
  uint64_t v8 = [a3 descendantForFileURL:self->_url2];
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
    v19[0] = v7;
    v19[1] = v11;
    if (-[NSFileAccessClaim canAccessLocations:forReading:error:]( self,  "canAccessLocations:forReading:error:",  [MEMORY[0x189603F18] arrayWithObjects:v19 count:2],  0,  &v18))
    {
      self->_location1 = v7;
      -[NSFileAccessNode addAccessClaim:](v7, "addAccessClaim:", self);
      self->_location2 = v11;
      -[NSFileAccessNode addAccessClaim:](v11, "addAccessClaim:", self);
      location1 = self->_location1;
      uint64_t v13 = MEMORY[0x1895F87A8];
      v17[0] = MEMORY[0x1895F87A8];
      v17[1] = 3221225472LL;
      v17[2] = __76__NSFileWritingWritingClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke;
      v17[3] = &unk_189CA3A78;
      v17[4] = self;
      -[NSFileAccessNode forEachRelevantAccessClaimForEvaluatingAgainstClaim:performProcedure:]( location1,  "forEachRelevantAccessClaimForEvaluatingAgainstClaim:performProcedure:",  self,  v17);
      location2 = self->_location2;
      v16[0] = v13;
      v16[1] = 3221225472LL;
      v16[2] = __76__NSFileWritingWritingClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_2;
      v16[3] = &unk_189CA3A78;
      v16[4] = self;
      -[NSFileAccessNode forEachRelevantAccessClaimForEvaluatingAgainstClaim:performProcedure:]( location2,  "forEachRelevantAccessClaimForEvaluatingAgainstClaim:performProcedure:",  self,  v16);
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

  -[NSFileAccessNode removeSelfIfUseless](v7, "removeSelfIfUseless");
  -[NSFileAccessNode removeSelfIfUseless](v11, "removeSelfIfUseless");
  return v10;
}

uint64_t __76__NSFileWritingWritingClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke( uint64_t a1,  void *a2)
{
  return [a2 evaluateNewClaim:*(void *)(a1 + 32)];
}

uint64_t __76__NSFileWritingWritingClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_2( uint64_t a1,  void *a2)
{
  return [a2 evaluateNewClaim:*(void *)(a1 + 32)];
}

- (BOOL)isBlockedByReadingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  uint64_t v7 = (void *)objc_opt_class();
  LOBYTE(v8) = 1;
  if ([v7 canReadingItemAtLocation:a3 options:a4 safelyOverlapNewWriting:1 ofItemAtLocation:self->_location1 options:self->_options1]) {
    return [v7 canReadingItemAtLocation:a3 options:a4 safelyOverlapNewWriting:1 ofItemAtLocation:self->_location2 options:self->_options2] ^ 1;
  }
  return v8;
}

- (BOOL)isBlockedByWritingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  uint64_t v7 = (void *)objc_opt_class();
  if ([v7 canNewWriteOfItemAtLocation:self->_location1 options:self->_options1 safelyOverlapExistingWriteOfItemAtLocation:a3 options:a4]) {
    return [v7 canNewWriteOfItemAtLocation:self->_location2 options:self->_options2 safelyOverlapExistingWriteOfItemAtLocation:a3 options:a4] ^ 1;
  }
  else {
    return 1;
  }
}

- (void)granted
{
  buf[3] = *MEMORY[0x1895F89C0];
  uint64_t v3 = atomic_load(&_NSFCSubarbitrationCount);
  if (v3 < 1
    || (unsigned __int8 v13 = atomic_load(_NSFCDisableLogSuppression), (v13 & 1) != 0)
    || (uint64_t v14 = atomic_load(&_NSFCSubarbitratedClaimCount), v14 <= 99))
  {
    if (self->_location1 || self->_location2)
    {
      BOOL v4 = (os_log_s *)_NSFCClaimsLog();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_7;
      }
      LODWORD(buf[0]) = 138543362;
      *(void *)((char *)buf + 4) = -[NSFileAccessClaim claimID](self, "claimID");
      objc_super v5 = "Claim %{public}@ granted in server";
    }

    else
    {
      BOOL v4 = (os_log_s *)_NSFCClaimsLog();
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_7;
      }
      LODWORD(buf[0]) = 138543362;
      *(void *)((char *)buf + 4) = -[NSFileAccessClaim claimID](self, "claimID");
      objc_super v5 = "Claim %{public}@ granted in client";
    }

    _os_log_impl(&dword_182EB1000, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)buf, 0xCu);
  }

void __36__NSFileWritingWritingClaim_granted__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    uint64_t v3 = *(void **)(a1 + 32);
    if (v3[32])
    {
      objc_msgSend(v3, "makePresentersOfItemAtLocation:orContainedItem:relinquishUsingProcedureGetter:");
      uint64_t v3 = *(void **)(a1 + 32);
    }

    if (v3[33]) {
      objc_msgSend(v3, "makePresentersOfItemAtLocation:orContainedItem:relinquishUsingProcedureGetter:");
    }
  }

  free(*(void **)(a1 + 40));
}

id __36__NSFileWritingWritingClaim_granted__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[7] = *MEMORY[0x1895F89C0];
  if (![*(id *)(a1 + 32) shouldWritingWithOptions:*(void *)(*(void *)(a1 + 32) + 224) causePresenterToRelinquish:a2]) {
    return 0LL;
  }
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __36__NSFileWritingWritingClaim_granted__block_invoke_3;
  v7[3] = &unk_189CA3B68;
  v7[4] = *(void *)(a1 + 32);
  v7[5] = a2;
  v7[6] = a3;
  return (id)[v7 copy];
}

uint64_t __36__NSFileWritingWritingClaim_granted__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend( *(id *)(a1 + 40),  "relinquishToWritingClaimWithID:options:purposeID:subitemPath:resultHandler:",  objc_msgSend(*(id *)(a1 + 32), "claimID"),  *(void *)(*(void *)(a1 + 32) + 224),  objc_msgSend( *(id *)(a1 + 32),  "purposeIDOfClaimOnItemAtLocation:forMessagingPresenter:",  *(void *)(*(void *)(a1 + 32) + 256),  *(void *)(a1 + 40)),  *(void *)(a1 + 48),  a2);
}

id __36__NSFileWritingWritingClaim_granted__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v7[7] = *MEMORY[0x1895F89C0];
  if (![*(id *)(a1 + 32) shouldWritingWithOptions:*(void *)(*(void *)(a1 + 32) + 248) causePresenterToRelinquish:a2]) {
    return 0LL;
  }
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __36__NSFileWritingWritingClaim_granted__block_invoke_5;
  v7[3] = &unk_189CA3B68;
  v7[4] = *(void *)(a1 + 32);
  v7[5] = a2;
  v7[6] = a3;
  return (id)[v7 copy];
}

uint64_t __36__NSFileWritingWritingClaim_granted__block_invoke_5(uint64_t a1, uint64_t a2)
{
  return objc_msgSend( *(id *)(a1 + 40),  "relinquishToWritingClaimWithID:options:purposeID:subitemPath:resultHandler:",  objc_msgSend(*(id *)(a1 + 32), "claimID"),  *(void *)(*(void *)(a1 + 32) + 248),  objc_msgSend( *(id *)(a1 + 32),  "purposeIDOfClaimOnItemAtLocation:forMessagingPresenter:",  *(void *)(*(void *)(a1 + 32) + 264),  *(void *)(a1 + 40)),  *(void *)(a1 + 48),  a2);
}

uint64_t __36__NSFileWritingWritingClaim_granted__block_invoke_6(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (*(void *)(result + 256))
  {
    int v3 = [(id)result shouldInformProvidersAboutEndOfWriteWithOptions:*(void *)(result + 224)];
    uint64_t result = *(void *)(a1 + 32);
    if (v3)
    {
      objc_msgSend( (id)objc_msgSend(*(id *)(result + 256), "itemProvider"),  "observeEndOfWriteAtLocation:forAccessClaim:",  *(void *)(*(void *)(a1 + 32) + 256));
      uint64_t result = *(void *)(a1 + 32);
    }
  }

  if (*(void *)(result + 264))
  {
    uint64_t result = [(id)result shouldInformProvidersAboutEndOfWriteWithOptions:*(void *)(result + 248)];
    if ((_DWORD)result) {
      return objc_msgSend( (id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 264), "itemProvider"),  "observeEndOfWriteAtLocation:forAccessClaim:",  *(void *)(*(void *)(a1 + 32) + 264));
    }
  }

  return result;
}

- (void)resolveURLsThenContinueInvokingClaimer:(id)a3
{
  v12[7] = *MEMORY[0x1895F89C0];
  if (-[NSFileAccessClaim didWait](self, "didWait"))
  {
    id v5 = -[NSFileAccessNode standardizedURL](self->_location1, "standardizedURL");
    if (v5)
    {
      id v6 = v5;

      self->_url1 = (NSURL *)[v6 copy];
      self->_url1DidChange = 1;
    }

    id v7 = -[NSFileAccessNode standardizedURL](self->_location2, "standardizedURL");
    if (v7)
    {
      BOOL v8 = v7;

      self->_url2 = (NSURL *)[v8 copy];
      self->_url2DidChange = 1;
    }
  }

  if (-[NSFileAccessClaim claimerError](self, "claimerError"))
  {
    (*((void (**)(id, void, void))a3 + 2))(a3, 0LL, 0LL);
  }

  else
  {
    id v9 = -[NSFileAccessClaim purposeID](self, "purposeID");
    location1 = self->_location1;
    unint64_t options1 = self->_options1;
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __68__NSFileWritingWritingClaim_resolveURLsThenContinueInvokingClaimer___block_invoke;
    v12[3] = &unk_189CA3BE0;
    v12[4] = self;
    v12[5] = v9;
    v12[6] = a3;
    -[NSFileAccessClaim makeProviderOfItemAtLocation:provideOrAttachPhysicalURLIfNecessaryForPurposeID:writingOptions:thenContinue:]( self,  "makeProviderOfItemAtLocation:provideOrAttachPhysicalURLIfNecessaryForPurposeID:writingOptions:thenContinue:",  location1,  v9,  options1,  v12);
  }

uint64_t __68__NSFileWritingWritingClaim_resolveURLsThenContinueInvokingClaimer___block_invoke( void *a1,  uint64_t a2)
{
  v8[7] = *MEMORY[0x1895F89C0];
  int v3 = (void *)a1[4];
  uint64_t v2 = a1[5];
  uint64_t v4 = v3[33];
  uint64_t v5 = v3[31];
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __68__NSFileWritingWritingClaim_resolveURLsThenContinueInvokingClaimer___block_invoke_2;
  v8[3] = &unk_189CA3C58;
  uint64_t v6 = a1[6];
  void v8[5] = v3;
  v8[6] = v6;
  v8[4] = a2;
  return [v3 makeProviderOfItemAtLocation:v4 provideOrAttachPhysicalURLIfNecessaryForPurposeID:v2 writingOptions:v5 thenContinue:v8];
}

uint64_t __68__NSFileWritingWritingClaim_resolveURLsThenContinueInvokingClaimer___block_invoke_2( void *a1,  uint64_t a2)
{
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[4];
  if (v5)
  {
LABEL_4:
    if (a2) {
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, v5, a2);
    }
    goto LABEL_5;
  }

  uint64_t v6 = a1[5];
  if (*(_BYTE *)(v6 + 216))
  {
    uint64_t v5 = *(void *)(v6 + 208);
    goto LABEL_4;
  }

  uint64_t v5 = 0LL;
  if (a2) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, v5, a2);
  }
LABEL_5:
  uint64_t v7 = a1[5];
  if (*(_BYTE *)(v7 + 240)) {
    a2 = *(void *)(v7 + 232);
  }
  else {
    a2 = 0LL;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v4, v5, a2);
}

- (void)invokeClaimer
{
  v2[5] = *MEMORY[0x1895F89C0];
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 3221225472LL;
  v2[2] = __42__NSFileWritingWritingClaim_invokeClaimer__block_invoke;
  v2[3] = &unk_189CA3C08;
  v2[4] = self;
  -[NSFileWritingWritingClaim resolveURLsThenContinueInvokingClaimer:]( self,  "resolveURLsThenContinueInvokingClaimer:",  v2);
}

id __42__NSFileWritingWritingClaim_invokeClaimer__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1895F89C0];
  uint64_t v6 = *(void **)(a1 + 32);
  if (v6[20])
  {
    uint64_t v7 = atomic_load(&_NSFCSubarbitrationCount);
    if (v7 < 1
      || (unsigned __int8 v18 = atomic_load(_NSFCDisableLogSuppression), (v18 & 1) != 0)
      || (uint64_t v19 = atomic_load(&_NSFCSubarbitratedClaimCount), v19 <= 99))
    {
      BOOL v8 = (os_log_s *)_NSFCClaimsLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = [*(id *)(a1 + 32) claimID];
        *(_DWORD *)buf = 138543362;
        uint64_t v25 = v9;
        _os_log_impl(&dword_182EB1000, v8, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ invoked in client", buf, 0xCu);
      }
    }

    (*(void (**)(void, void, uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(a1 + 32) + 160) + 16))( *(void *)(*(void *)(a1 + 32) + 160),  *(void *)(a1 + 32),  a2,  a3,  [*(id *)(a1 + 32) claimerError]);

    *(void *)(*(void *)(a1 + 32) + 160LL) = 0LL;
    uint64_t v6 = *(void **)(a1 + 32);
  }

  if (v6[21])
  {
    uint64_t v10 = atomic_load(&_NSFCSubarbitrationCount);
    if (v10 < 1
      || (unsigned __int8 v20 = atomic_load(_NSFCDisableLogSuppression), (v20 & 1) != 0)
      || (uint64_t v21 = atomic_load(&_NSFCSubarbitratedClaimCount), v21 <= 99))
    {
      uint64_t v11 = (os_log_s *)_NSFCClaimsLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [*(id *)(a1 + 32) claimID];
        *(_DWORD *)buf = 138543362;
        uint64_t v25 = v12;
        _os_log_impl(&dword_182EB1000, v11, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ invoked in server", buf, 0xCu);
      }
    }

    if (a2) {
      unsigned __int8 v13 = +[NSURLPromisePair pairWithURL:](&OBJC_CLASS___NSURLPromisePair, "pairWithURL:", a2);
    }
    else {
      unsigned __int8 v13 = (NSURLPromisePair *)[MEMORY[0x189603FE8] null];
    }
    uint64_t v14 = v13;
    if (a3) {
      v15 = +[NSURLPromisePair pairWithURL:](&OBJC_CLASS___NSURLPromisePair, "pairWithURL:", a3);
    }
    else {
      v15 = (NSURLPromisePair *)[MEMORY[0x189603FE8] null];
    }
    uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 168LL);
    v23[0] = v14;
    v23[1] = v15;
    (*(void (**)(uint64_t, void, uint64_t, void, uint64_t, uint64_t))(v16 + 16))( v16,  0,  [MEMORY[0x189603F18] arrayWithObjects:v23 count:2],  *(void *)(*(void *)(a1 + 32) + 176),  objc_msgSend(*(id *)(a1 + 32), "shouldEnableMaterializationDuringAccessorBlock"),  objc_msgSend(*(id *)(a1 + 32), "claimerError"));

    *(void *)(*(void *)(a1 + 32) + 168LL) = 0LL;
    uint64_t v6 = *(void **)(a1 + 32);
  }

  v22.receiver = v6;
  v22.super_class = (Class)&OBJC_CLASS___NSFileWritingWritingClaim;
  return objc_msgSendSuper2(&v22, sel_invokeClaimer);
}

- (void)devalueSelf
{
  void v8[5] = *MEMORY[0x1895F89C0];
  location1 = self->_location1;
  uint64_t v4 = MEMORY[0x1895F87A8];
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __40__NSFileWritingWritingClaim_devalueSelf__block_invoke;
  v8[3] = &unk_189CA3A78;
  v8[4] = self;
  -[NSFileAccessNode forEachRelevantAccessClaimPerformProcedure:]( location1,  "forEachRelevantAccessClaimPerformProcedure:",  v8);
  location2 = self->_location2;
  v7[0] = v4;
  v7[1] = 3221225472LL;
  v7[2] = __40__NSFileWritingWritingClaim_devalueSelf__block_invoke_2;
  v7[3] = &unk_189CA3A78;
  v7[4] = self;
  -[NSFileAccessNode forEachRelevantAccessClaimPerformProcedure:]( location2,  "forEachRelevantAccessClaimPerformProcedure:",  v7);
  -[NSFileAccessNode removeAccessClaim:](self->_location1, "removeAccessClaim:", self);
  self->_location1 = 0LL;
  -[NSFileAccessNode removeAccessClaim:](self->_location2, "removeAccessClaim:", self);
  self->_location2 = 0LL;
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSFileWritingWritingClaim;
  -[NSFileAccessClaim devalueSelf](&v6, sel_devalueSelf);
}

uint64_t __40__NSFileWritingWritingClaim_devalueSelf__block_invoke(uint64_t a1, void *a2)
{
  return [a2 devalueOldClaim:*(void *)(a1 + 32)];
}

uint64_t __40__NSFileWritingWritingClaim_devalueSelf__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 devalueOldClaim:*(void *)(a1 + 32)];
}

- (void)itemAtLocation:(id)a3 wasReplacedByItemAtLocation:(id)a4
{
  if (self->_location1 == a3)
  {
    [a4 addAccessClaim:self];
    [a3 removeAccessClaim:self];
    self->_location1 = (NSFileAccessNode *)a4;
  }

  if (self->_location2 == a3)
  {
    [a4 addAccessClaim:self];
    [a3 removeAccessClaim:self];
    self->_location2 = (NSFileAccessNode *)a4;
  }

- (BOOL)blocksClaim:(id)a3
{
  if ([a3 isBlockedByWritingItemAtLocation:self->_location1 options:self->_options1]) {
    return 1;
  }
  else {
    return [a3 isBlockedByWritingItemAtLocation:self->_location2 options:self->_options2];
  }
}

- (id)allURLs
{
  int v3 = (void *)[MEMORY[0x189603FA8] array];
  uint64_t v4 = v3;
  if (self->_url1) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_url2) {
    objc_msgSend(v4, "addObject:");
  }
  return v4;
}

- (void)protectFilesAgainstEviction
{
}

@end