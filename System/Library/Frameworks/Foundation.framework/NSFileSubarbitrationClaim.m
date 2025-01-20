@interface NSFileSubarbitrationClaim
+ (BOOL)supportsSecureCoding;
- (BOOL)evaluateSelfWithRootNode:(id)a3 checkSubarbitrability:(BOOL)a4;
- (BOOL)isBlockedByReadingItemAtLocation:(id)a3 options:(unint64_t)a4;
- (BOOL)isBlockedByWritingItemAtLocation:(id)a3 options:(unint64_t)a4;
- (BOOL)nullified;
- (NSFileSubarbitrationClaim)initWithCoder:(id)a3;
- (NSFileSubarbitrationClaim)initWithReadingURLs:(id)a3 options:(unint64_t)a4 writingURLs:(id)a5 options:(unint64_t)a6 claimer:(id)a7;
- (NSXPCConnection)subarbiterConnection;
- (id)descriptionWithIndenting:(id)a3;
- (id)relinquishmentForWrite:(BOOL)a3 toPresenterForID:(id)a4;
- (void)dealloc;
- (void)devalueOldClaim:(id)a3;
- (void)devalueSelf;
- (void)encodeWithCoder:(id)a3;
- (void)evaluateNewClaim:(id)a3;
- (void)forwardReacquisitionForWritingClaim:(BOOL)a3 withID:(id)a4 toPresenterForID:(id)a5 usingReplySender:(id)a6;
- (void)forwardRelinquishmentForWritingClaim:(BOOL)a3 withID:(id)a4 options:(unint64_t)a5 purposeID:(id)a6 subitemURL:(id)a7 toPresenter:(id)a8 usingReplySender:(id)a9;
- (void)forwardUsingConnection:(id)a3 crashHandler:(id)a4;
- (void)forwardUsingConnection:(id)a3 withServer:(id)a4 crashHandler:(id)a5;
- (void)granted;
- (void)invokeClaimer;
- (void)revoked;
- (void)setSubarbiterConnection:(id)a3;
@end

@implementation NSFileSubarbitrationClaim

- (NSFileSubarbitrationClaim)initWithReadingURLs:(id)a3 options:(unint64_t)a4 writingURLs:(id)a5 options:(unint64_t)a6 claimer:(id)a7
{
  v12 = -[NSFileAccessClaim initWithClient:claimID:purposeID:](self, "initWithClient:claimID:purposeID:", 0LL, 0LL, 0LL);
  if (v12)
  {
    v12->_readingURLs = (NSArray *)[a3 copy];
    v12->_readingOptions = a4;
    v12->_writingURLs = (NSArray *)[a5 copy];
    v12->_writingOptions = a6;
    v12->super._claimerOrNil = (id)[a7 copy];
  }

  return v12;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFileSubarbitrationClaim;
  -[NSFileAccessClaim dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"NSFileAccessClaims should only ever be encoded by XPC" userInfo:0]);
  }
  [a3 encodeObject:self->_readingURLs forKey:@"NSReadingURLsKey"];
  objc_msgSend( a3,  "encodeObject:forKey:",  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_readingOptions),  @"NSReadingOptionsKey");
  [a3 encodeObject:self->_writingURLs forKey:@"NSWritingURLsKey"];
  objc_msgSend( a3,  "encodeObject:forKey:",  +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_writingOptions),  @"NSWritingOptionsKey");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSFileSubarbitrationClaim;
  -[NSFileAccessClaim encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
}

- (NSFileSubarbitrationClaim)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1895F89C0];
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___NSFileSubarbitrationClaim;
  uint64_t v4 = -[NSFileAccessClaim initWithCoder:](&v12, sel_initWithCoder_);
  if (!v4) {
    return v4;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_super v5 = (void *)[a3 allowedClasses];
    uint64_t v6 = (void *)MEMORY[0x189604010];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    uint64_t v7 = objc_msgSend( v5,  "setByAddingObjectsFromSet:",  objc_msgSend(v6, "setWithArray:", objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v13, 2)));
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __43__NSFileSubarbitrationClaim_initWithCoder___block_invoke;
    v11[3] = &unk_189CA5378;
    v11[4] = a3;
    v11[5] = v7;
    v11[6] = v4;
    v4->_readingURLs = (NSArray *)objc_msgSend( __43__NSFileSubarbitrationClaim_initWithCoder___block_invoke( (uint64_t)v11,  (uint64_t)@"NSReadingURLsKey"),  "mutableCopy");
    v4->_writingURLs = (NSArray *)objc_msgSend( __43__NSFileSubarbitrationClaim_initWithCoder___block_invoke( (uint64_t)v11,  (uint64_t)@"NSWritingURLsKey"),  "mutableCopy");
    v4->_readingOptions = objc_msgSend( (id)objc_msgSend( a3,  "decodeObjectOfClass:forKey:",  objc_opt_class(),  @"NSReadingOptionsKey"),  "unsignedIntegerValue");
    v4->_writingOptions = objc_msgSend( (id)objc_msgSend( a3,  "decodeObjectOfClass:forKey:",  objc_opt_class(),  @"NSWritingOptionsKey"),  "unsignedIntegerValue");
    v4->_forwardedClaimIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x189603FE0]);
    v4->_readRelinquishmentsByPresenterID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    v4->_writeRelinquishmentsByPresenterID = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x189603FC8]);
    return v4;
  }

  objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"NSFileAccessClaims should only ever be decoded by XPC" userInfo:0]);
  return (NSFileSubarbitrationClaim *)__43__NSFileSubarbitrationClaim_initWithCoder___block_invoke(v9, v10);
}

void *__43__NSFileSubarbitrationClaim_initWithCoder___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void *)[*(id *)(a1 + 32) decodeObjectOfClasses:*(void *)(a1 + 40) forKey:a2];
  if (v4)
  {
    if ((_NSIsNSArray() & 1) == 0)
    {
      uint64_t v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSFileSubarbitrationClaim decoded the wrong class for key %@",  a2);
LABEL_13:
      v11 = v10;

      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:v11 userInfo:0]);
    }

    __int128 v15 = 0u;
    __int128 v16 = 0u;
    __int128 v13 = 0u;
    __int128 v14 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v12 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        uint64_t v8 = 0LL;
        do
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            uint64_t v10 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSFileSubarbitrationClaim decoded the wrong class for contents of %@",  a2);
            goto LABEL_13;
          }

          ++v8;
        }

        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v12 count:16];
      }

      while (v6);
    }
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)descriptionWithIndenting:(id)a3
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSFileSubarbitrationClaim;
  id result = -[NSFileAccessClaim descriptionWithIndenting:](&v6, sel_descriptionWithIndenting_);
  if (self->_nullified) {
    return (id)[result stringByAppendingFormat:@"\n%@    (nullified)", a3];
  }
  return result;
}

- (void)forwardUsingConnection:(id)a3 crashHandler:(id)a4
{
}

- (void)forwardUsingConnection:(id)a3 withServer:(id)a4 crashHandler:(id)a5
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v9 = (os_log_s *)_NSFCClaimsLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v13 = -[NSFileAccessClaim claimID](self, "claimID");
    _os_log_debug_impl( &dword_182EB1000,  v9,  OS_LOG_TYPE_DEBUG,  "Subarbitration claim %{public}@ blocked pending grantAccessClaim",  buf,  0xCu);
  }

  -[NSFileAccessClaim block](self, "block");
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __76__NSFileSubarbitrationClaim_forwardUsingConnection_withServer_crashHandler___block_invoke;
  v11[3] = &unk_189CA0D60;
  v11[4] = self;
  v11[5] = a5;
  v10[0] = MEMORY[0x1895F87A8];
  v10[1] = 3221225472LL;
  v10[2] = __76__NSFileSubarbitrationClaim_forwardUsingConnection_withServer_crashHandler___block_invoke_35;
  v10[3] = &unk_189CA0C18;
  v10[4] = self;
  objc_msgSend( (id)objc_msgSend(a3, "remoteObjectProxyWithErrorHandler:", v11),  "grantSubarbitrationClaim:withServer:reply:",  self,  objc_msgSend(a4, "endpoint"),  v10);
}

uint64_t __76__NSFileSubarbitrationClaim_forwardUsingConnection_withServer_crashHandler___block_invoke( uint64_t a1,  uint64_t a2)
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

  uint64_t v5 = (os_log_s *)_NSFCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v8 = 138543618;
    uint64_t v9 = @"grantSubarbitrationClaim";
    __int16 v10 = 2114;
    uint64_t v11 = a2;
    _os_log_error_impl( &dword_182EB1000,  v5,  OS_LOG_TYPE_ERROR,  "Sending of a '%{public}@' message was interrupted: %{public}@",  (uint8_t *)&v8,  0x16u);
  }

  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16LL))()) {
    objc_msgSend( *(id *)(a1 + 32),  "setClaimerError:",  +[NSError errorWithDomain:code:userInfo:]( NSError,  "errorWithDomain:code:userInfo:",  @"NSCocoaErrorDomain",  255,  0));
  }
  return [*(id *)(a1 + 32) unblock];
}

uint64_t __76__NSFileSubarbitrationClaim_forwardUsingConnection_withServer_crashHandler___block_invoke_35( uint64_t a1,  uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (os_log_s *)_NSFCClaimsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = [*(id *)(a1 + 32) claimID];
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_debug_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_DEBUG,  "%{public}@ received grantAccessClaim reply",  (uint8_t *)&v7,  0xCu);
    if (!a2) {
      return [*(id *)(a1 + 32) unblock];
    }
    goto LABEL_3;
  }

  if (a2) {
LABEL_3:
  }
    [*(id *)(a1 + 32) setClaimerError:a2];
  return [*(id *)(a1 + 32) unblock];
}

- (BOOL)evaluateSelfWithRootNode:(id)a3 checkSubarbitrability:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v96 = *MEMORY[0x1895F89C0];
  if (!a4)
  {
    id v6 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v92 = 0u;
    __int128 v93 = 0u;
    __int128 v94 = 0u;
    __int128 v95 = 0u;
    readingURLs = self->_readingURLs;
    uint64_t v8 = -[NSArray countByEnumeratingWithState:objects:count:]( readingURLs,  "countByEnumeratingWithState:objects:count:",  &v92,  v91,  16LL);
    if (v8)
    {
      uint64_t v9 = *(void *)v93;
      do
      {
        for (uint64_t i = 0LL; i != v8; ++i)
        {
          if (*(void *)v93 != v9) {
            objc_enumerationMutation(readingURLs);
          }
          uint64_t v11 = (void *)[a3 descendantForFileURL:*(void *)(*((void *)&v92 + 1) + 8 * i)];
          if (v11)
          {
            [v6 addObject:v11];
            [v11 addAccessClaim:self];
          }
        }

        uint64_t v8 = -[NSArray countByEnumeratingWithState:objects:count:]( readingURLs,  "countByEnumeratingWithState:objects:count:",  &v92,  v91,  16LL);
      }

      while (v8);
    }

    self->_readingLocations = (NSArray *)[v6 copy];

    id v12 = objc_alloc_init(MEMORY[0x189603FA8]);
    __int128 v89 = 0u;
    __int128 v90 = 0u;
    __int128 v87 = 0u;
    __int128 v88 = 0u;
    writingURLs = self->_writingURLs;
    uint64_t v14 = -[NSArray countByEnumeratingWithState:objects:count:]( writingURLs,  "countByEnumeratingWithState:objects:count:",  &v87,  v86,  16LL);
    if (v14)
    {
      uint64_t v15 = *(void *)v88;
      do
      {
        for (uint64_t j = 0LL; j != v14; ++j)
        {
          if (*(void *)v88 != v15) {
            objc_enumerationMutation(writingURLs);
          }
          uint64_t v17 = (void *)[a3 descendantForFileURL:*(void *)(*((void *)&v87 + 1) + 8 * j)];
          if (v17)
          {
            [v12 addObject:v17];
            [v17 addAccessClaim:self];
          }
        }

        uint64_t v14 = -[NSArray countByEnumeratingWithState:objects:count:]( writingURLs,  "countByEnumeratingWithState:objects:count:",  &v87,  v86,  16LL);
      }

      while (v14);
    }

    self->_writingLocations = (NSArray *)[v12 copy];

    id v18 = objc_alloc_init(MEMORY[0x189603FE0]);
    BOOL v43 = v4;
    v59[0] = 0LL;
    v59[1] = v59;
    v59[2] = 0x2020000000LL;
    char v60 = 0;
    uint64_t v19 = MEMORY[0x1895F87A8];
    v58[0] = MEMORY[0x1895F87A8];
    v58[1] = 3221225472LL;
    v58[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke;
    v58[3] = &unk_189CA53C8;
    v58[4] = v18;
    v58[5] = self;
    v58[6] = v59;
    id v44 = v18;
    if ((self->_writingOptions & 9) != 0)
    {
      __int128 v84 = 0u;
      __int128 v85 = 0u;
      __int128 v82 = 0u;
      __int128 v83 = 0u;
      obuint64_t j = self->_writingLocations;
      uint64_t v20 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v82,  v81,  16LL);
      if (v20)
      {
        uint64_t v21 = *(void *)v83;
        do
        {
          for (uint64_t k = 0LL; k != v20; ++k)
          {
            if (*(void *)v83 != v21) {
              objc_enumerationMutation(obj);
            }
            v23 = *(void **)(*((void *)&v82 + 1) + 8 * k);
            v57[0] = v19;
            v57[1] = 3221225472LL;
            v57[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_41;
            v57[3] = &unk_189CA3900;
            v57[4] = v58;
            [v23 forEachPresenterOfItemOrContainedItemPerformProcedure:v57];
            v56[0] = v19;
            v56[1] = 3221225472LL;
            v56[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_3;
            v56[3] = &unk_189CA38D8;
            v56[4] = v23;
            v56[5] = v58;
            [v23 forEachPresenterOfContainingFilePackagePerformProcedure:v56];
          }

          uint64_t v20 = -[NSArray countByEnumeratingWithState:objects:count:]( obj,  "countByEnumeratingWithState:objects:count:",  &v82,  v81,  16LL);
        }

        while (v20);
      }
    }

    if ((self->_readingOptions & 1) == 0)
    {
      __int128 v79 = 0u;
      __int128 v80 = 0u;
      __int128 v77 = 0u;
      __int128 v78 = 0u;
      obja = self->_readingLocations;
      uint64_t v24 = -[NSArray countByEnumeratingWithState:objects:count:]( obja,  "countByEnumeratingWithState:objects:count:",  &v77,  v76,  16LL);
      if (v24)
      {
        uint64_t v25 = *(void *)v78;
        do
        {
          for (uint64_t m = 0LL; m != v24; ++m)
          {
            if (*(void *)v78 != v25) {
              objc_enumerationMutation(obja);
            }
            v27 = *(void **)(*((void *)&v77 + 1) + 8 * m);
            v55[0] = v19;
            v55[1] = 3221225472LL;
            v55[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_5;
            v55[3] = &unk_189CA3900;
            v55[4] = v58;
            [v27 forEachPresenterOfItemOrContainedItemPerformProcedure:v55];
            v54[0] = v19;
            v54[1] = 3221225472LL;
            v54[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_7;
            v54[3] = &unk_189CA5440;
            v54[4] = v58;
            [v27 forEachPresenterOfContainingFilePackagePerformProcedure:v54];
          }

          uint64_t v24 = -[NSArray countByEnumeratingWithState:objects:count:]( obja,  "countByEnumeratingWithState:objects:count:",  &v77,  v76,  16LL);
        }

        while (v24);
      }
    }

    if ((self->_writingOptions & 4) != 0)
    {
      __int128 v74 = 0u;
      __int128 v75 = 0u;
      __int128 v72 = 0u;
      __int128 v73 = 0u;
      objb = self->_writingLocations;
      uint64_t v28 = -[NSArray countByEnumeratingWithState:objects:count:]( objb,  "countByEnumeratingWithState:objects:count:",  &v72,  v71,  16LL);
      if (v28)
      {
        uint64_t v29 = *(void *)v73;
        do
        {
          for (uint64_t n = 0LL; n != v28; ++n)
          {
            if (*(void *)v73 != v29) {
              objc_enumerationMutation(objb);
            }
            v31 = *(void **)(*((void *)&v72 + 1) + 8 * n);
            v53[0] = v19;
            v53[1] = 3221225472LL;
            v53[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_9;
            v53[3] = &unk_189CA3900;
            v53[4] = v58;
            [v31 forEachPresenterOfItemOrContainedItemPerformProcedure:v53];
            v52[0] = v19;
            v52[1] = 3221225472LL;
            v52[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_11;
            v52[3] = &unk_189CA5440;
            v52[4] = v58;
            [v31 forEachPresenterOfContainingFilePackagePerformProcedure:v52];
          }

          uint64_t v28 = -[NSArray countByEnumeratingWithState:objects:count:]( objb,  "countByEnumeratingWithState:objects:count:",  &v72,  v71,  16LL);
        }

        while (v28);
      }
    }

    self->_rootNode = (NSFileAccessNode *)a3;
    v51[0] = v19;
    v51[1] = 3221225472LL;
    v51[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_13;
    v51[3] = &unk_189CA5468;
    v51[4] = self;
    __int128 v67 = 0u;
    __int128 v68 = 0u;
    __int128 v69 = 0u;
    __int128 v70 = 0u;
    readingLocations = self->_readingLocations;
    uint64_t v33 = -[NSArray countByEnumeratingWithState:objects:count:]( readingLocations,  "countByEnumeratingWithState:objects:count:",  &v67,  v66,  16LL);
    if (v33)
    {
      uint64_t v34 = *(void *)v68;
      do
      {
        for (iuint64_t i = 0LL; ii != v33; ++ii)
        {
          if (*(void *)v68 != v34) {
            objc_enumerationMutation(readingLocations);
          }
          v36 = *(void **)(*((void *)&v67 + 1) + 8 * ii);
          v50[0] = v19;
          v50[1] = 3221225472LL;
          v50[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_52;
          v50[3] = &unk_189CA5238;
          v50[4] = self;
          v50[5] = v51;
          [v36 forEachRelevantAccessClaimPerformProcedure:v50];
        }

        uint64_t v33 = -[NSArray countByEnumeratingWithState:objects:count:]( readingLocations,  "countByEnumeratingWithState:objects:count:",  &v67,  v66,  16LL);
      }

      while (v33);
    }

    __int128 v64 = 0u;
    __int128 v65 = 0u;
    __int128 v62 = 0u;
    __int128 v63 = 0u;
    writingLocations = self->_writingLocations;
    uint64_t v38 = -[NSArray countByEnumeratingWithState:objects:count:]( writingLocations,  "countByEnumeratingWithState:objects:count:",  &v62,  v61,  16LL);
    if (v38)
    {
      uint64_t v39 = *(void *)v63;
      do
      {
        for (juint64_t j = 0LL; jj != v38; ++jj)
        {
          if (*(void *)v63 != v39) {
            objc_enumerationMutation(writingLocations);
          }
          v41 = *(void **)(*((void *)&v62 + 1) + 8 * jj);
          v49[0] = v19;
          v49[1] = 3221225472LL;
          v49[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_2_54;
          v49[3] = &unk_189CA5238;
          v49[4] = self;
          v49[5] = v51;
          [v41 forEachRelevantAccessClaimPerformProcedure:v49];
        }

        uint64_t v38 = -[NSArray countByEnumeratingWithState:objects:count:]( writingLocations,  "countByEnumeratingWithState:objects:count:",  &v62,  v61,  16LL);
      }

      while (v38);
    }

    _Block_object_dispose(v59, 8);
    BOOL v4 = v43;
  }

  return !v4;
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  uint64_t a4)
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  uint64_t v7 = [a2 reactorID];
  uint64_t result = [*(id *)(a1 + 32) containsObject:v7];
  if ((result & 1) == 0)
  {
    uint64_t v9 = (os_log_s *)_NSFCClaimsLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [*(id *)(a1 + 40) claimID];
      *(_DWORD *)buf = 138543874;
      uint64_t v16 = v10;
      __int16 v17 = 2114;
      uint64_t v18 = a3;
      __int16 v19 = 2114;
      uint64_t v20 = v7;
      _os_log_impl( &dword_182EB1000,  v9,  OS_LOG_TYPE_DEFAULT,  "Subarbitration claimer %{public}@ is waiting for %{public}@ response from presenter: %{public}@",  buf,  0x20u);
    }

    [*(id *)(a1 + 32) addObject:v7];
    uint64_t v11 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"Waiting for %@ response from presenter: %@",  a3,  v7);
    [*(id *)(a1 + 40) blockClaimerForReason:v11];
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_39;
    v14[3] = &unk_189CA53A0;
    v14[4] = v7;
    v14[5] = a3;
    uint64_t v12 = *(void *)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    v14[7] = v11;
    v14[8] = v13;
    v14[6] = v12;
    return (*(uint64_t (**)(uint64_t, void *))(a4 + 16))(a4, v14);
  }

  return result;
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_39( uint64_t a1,  uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  BOOL v4 = (os_log_s *)_NSFCClaimsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = [*(id *)(a1 + 48) claimID];
    int v9 = 138543874;
    uint64_t v10 = v5;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    __int16 v13 = 2114;
    uint64_t v14 = v7;
    _os_log_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_DEFAULT,  "Presenter %{public}@ has sent a %@ response, unblocking subarbitration claimer: %{public}@",  (uint8_t *)&v9,  0x20u);
  }

  if (a2 && !*(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL))
  {
    [*(id *)(a1 + 48) setClaimerError:a2];
    *(_BYTE *)(*(void *)(*(void *)(a1 + 64) + 8LL) + 24LL) = 1;
  }

  return [*(id *)(a1 + 48) unblockClaimerForReason:*(void *)(a1 + 56)];
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_41( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6)
{
  v8[5] = *MEMORY[0x1895F89C0];
  uint64_t v6 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_2;
  v8[3] = &unk_189CA53F0;
  v8[4] = a2;
  return (*(uint64_t (**)(uint64_t, uint64_t, const __CFString *, void *, uint64_t, uint64_t))(v6 + 16))( v6,  a2,  @"Accommodate Deletion",  v8,  a5,  a6);
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  return [*(id *)(a1 + 32) accommodateDeletionWithSubitemPath:0 completionHandler:a2];
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_3( uint64_t a1,  uint64_t a2)
{
  v7[6] = *MEMORY[0x1895F89C0];
  uint64_t v4 = objc_msgSend(*(id *)(a1 + 32), "pathFromAncestor:");
  uint64_t v5 = *(void *)(a1 + 40);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_4;
  v7[3] = &unk_189CA5418;
  v7[4] = a2;
  v7[5] = v4;
  return (*(uint64_t (**)(uint64_t, uint64_t, const __CFString *, void *))(v5 + 16))( v5,  a2,  @"Accommodate Deletion",  v7);
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_4( uint64_t a1,  uint64_t a2)
{
  return [*(id *)(a1 + 32) accommodateDeletionWithSubitemPath:*(void *)(a1 + 40) completionHandler:a2];
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_5( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6)
{
  v8[5] = *MEMORY[0x1895F89C0];
  uint64_t v6 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_6;
  v8[3] = &unk_189CA53F0;
  v8[4] = a2;
  return (*(uint64_t (**)(uint64_t, uint64_t, const __CFString *, void *, uint64_t, uint64_t))(v6 + 16))( v6,  a2,  @"Save Changes",  v8,  a5,  a6);
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_6( uint64_t a1,  uint64_t a2)
{
  return [*(id *)(a1 + 32) saveChangesWithCompletionHandler:a2];
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_7( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6)
{
  v8[5] = *MEMORY[0x1895F89C0];
  uint64_t v6 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_8;
  v8[3] = &unk_189CA53F0;
  v8[4] = a2;
  return (*(uint64_t (**)(uint64_t, uint64_t, const __CFString *, void *, uint64_t, uint64_t))(v6 + 16))( v6,  a2,  @"Save Changes",  v8,  a5,  a6);
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_8( uint64_t a1,  uint64_t a2)
{
  return [*(id *)(a1 + 32) saveChangesWithCompletionHandler:a2];
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_9( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6)
{
  v8[5] = *MEMORY[0x1895F89C0];
  uint64_t v6 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_10;
  v8[3] = &unk_189CA53F0;
  v8[4] = a2;
  return (*(uint64_t (**)(uint64_t, uint64_t, const __CFString *, void *, uint64_t, uint64_t))(v6 + 16))( v6,  a2,  @"Save Changes",  v8,  a5,  a6);
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_10( uint64_t a1,  uint64_t a2)
{
  return [*(id *)(a1 + 32) saveChangesWithCompletionHandler:a2];
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_11( uint64_t a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6)
{
  v8[5] = *MEMORY[0x1895F89C0];
  uint64_t v6 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_12;
  v8[3] = &unk_189CA53F0;
  v8[4] = a2;
  return (*(uint64_t (**)(uint64_t, uint64_t, const __CFString *, void *, uint64_t, uint64_t))(v6 + 16))( v6,  a2,  @"Save Changes",  v8,  a5,  a6);
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_12( uint64_t a1,  uint64_t a2)
{
  return [*(id *)(a1 + 32) saveChangesWithCompletionHandler:a2];
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_13( uint64_t a1,  int a2,  void *a3)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if (a2
    && [*(id *)(*(void *)(a1 + 32) + 248) count] == 1
    && (objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend( (id)objc_msgSend(a3, "purposeID"),  "isEqualToString:",  @"com.apple.desktopservices.copyengine"))
  {
    uint64_t v5 = (os_log_s *)_NSFCClaimsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [*(id *)(a1 + 32) claimID];
      int v10 = 138543618;
      uint64_t v11 = v6;
      __int16 v12 = 2114;
      uint64_t v13 = [a3 claimID];
      uint64_t v7 = "Nullified subarbitration claim %{public}@ to work around a deadlock with claim: %{public}@";
LABEL_11:
      _os_log_impl(&dword_182EB1000, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0x16u);
      return 1LL;
    }

    return 1LL;
  }

  if (*(void **)(a1 + 32) != a3 && (objc_opt_isKindOfClass() & 1) != 0)
  {
    uint64_t v5 = (os_log_s *)_NSFCClaimsLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [*(id *)(a1 + 32) claimID];
      int v10 = 138543618;
      uint64_t v11 = v8;
      __int16 v12 = 2114;
      uint64_t v13 = [a3 claimID];
      uint64_t v7 = "Nullified subarbitration claim %{public}@ to because of a blocking subarbitration claim: %{public}@";
      goto LABEL_11;
    }

    return 1LL;
  }

  return 0LL;
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_52( uint64_t a1,  void *a2)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  uint64_t v5 = *(void *)(a1 + 32);
  if (!(_DWORD)result) {
    return [a2 evaluateNewClaim:v5];
  }
  *(_BYTE *)(v5 + 296) = 1;
  return result;
}

uint64_t __76__NSFileSubarbitrationClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_2_54( uint64_t a1,  void *a2)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
  uint64_t v5 = *(void *)(a1 + 32);
  if (!(_DWORD)result) {
    return [a2 evaluateNewClaim:v5];
  }
  *(_BYTE *)(v5 + 296) = 1;
  return result;
}

- (void)evaluateNewClaim:(id)a3
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  if (a3 != self && !-[NSFileSubarbitrationClaim nullified](self, "nullified"))
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      uint64_t v5 = (os_log_s *)_NSFCClaimsLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543618;
        uint64_t v12 = [a3 claimID];
        __int16 v13 = 2114;
        id v14 = -[NSFileAccessClaim claimID](self, "claimID");
        _os_log_impl( &dword_182EB1000,  v5,  OS_LOG_TYPE_DEFAULT,  "New subarbitration claim %{public}@ is blocked by subarbitration claim %{public}@",  (uint8_t *)&v11,  0x16u);
      }

      uint64_t v6 = self;
      uint64_t v7 = a3;
LABEL_15:
      [v6 addPendingClaim:v7];
      return;
    }

    if (!-[NSFileAccessClaim isGranted](self, "isGranted"))
    {
      int v10 = (os_log_s *)_NSFCClaimsLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543618;
        uint64_t v12 = [a3 claimID];
        __int16 v13 = 2114;
        id v14 = -[NSFileAccessClaim claimID](self, "claimID");
        _os_log_impl( &dword_182EB1000,  v10,  OS_LOG_TYPE_DEFAULT,  "Claim %{public}@ is blocked by subarbitration claim %{public}@",  (uint8_t *)&v11,  0x16u);
      }

      uint64_t v6 = a3;
      uint64_t v7 = self;
      goto LABEL_15;
    }

    uint64_t v8 = [a3 claimID];
    if ((-[NSMutableSet containsObject:](self->_forwardedClaimIDs, "containsObject:", v8) & 1) == 0)
    {
      -[NSMutableSet addObject:](self->_forwardedClaimIDs, "addObject:", v8);
      int v9 = (os_log_s *)_NSFCClaimsLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138543618;
        uint64_t v12 = [a3 claimID];
        __int16 v13 = 2114;
        id v14 = -[NSFileAccessClaim claimID](self, "claimID");
        _os_log_impl( &dword_182EB1000,  v9,  OS_LOG_TYPE_DEFAULT,  "Forwarding claim %{public}@ to subarbiter for claim %{public}@ for evaluation there",  (uint8_t *)&v11,  0x16u);
      }

      [a3 forwardUsingConnection:self->_subarbiterConnection crashHandler:&__block_literal_global_79];
    }
  }

uint64_t __46__NSFileSubarbitrationClaim_evaluateNewClaim___block_invoke()
{
  return 0LL;
}

- (void)devalueOldClaim:(id)a3
{
  if (a3 != self)
  {
    uint64_t v4 = [a3 claimID];
    if (-[NSMutableSet containsObject:](self->_forwardedClaimIDs, "containsObject:", v4))
    {
      objc_msgSend( -[NSXPCConnection remoteObjectProxy](self->_subarbiterConnection, "remoteObjectProxy"),  "revokeAccessClaimForID:",  v4);
      -[NSMutableSet removeObject:](self->_forwardedClaimIDs, "removeObject:", v4);
    }
  }

- (BOOL)isBlockedByReadingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  return 1;
}

- (BOOL)isBlockedByWritingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  return 1;
}

- (void)granted
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  rootNode = self->_rootNode;
  uint64_t v4 = (os_log_s *)_NSFCClaimsLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (rootNode)
  {
    if (v5)
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = -[NSFileAccessClaim claimID](self, "claimID");
      _os_log_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_DEFAULT,  "Subarbitration claim %{public}@ granted in server",  (uint8_t *)&buf,  0xCu);
    }

    uint64_t v6 = MEMORY[0x1895F87A8];
    v12[0] = MEMORY[0x1895F87A8];
    v12[1] = 3221225472LL;
    v12[2] = __36__NSFileSubarbitrationClaim_granted__block_invoke;
    v12[3] = &unk_189C9A030;
    v12[4] = self;
    if ((self->_readingOptions & 0x20000) != 0)
    {
      *(void *)&__int128 buf = 0LL;
      *((void *)&buf + 1) = &buf;
      uint64_t v19 = 0x2020000000LL;
      NSUInteger v20 = -[NSArray count](self->_readingLocations, "count");
      if (*(void *)(*((void *)&buf + 1) + 24LL))
      {
        v11[0] = v6;
        v11[1] = 3221225472LL;
        v11[2] = __36__NSFileSubarbitrationClaim_granted__block_invoke_2;
        v11[3] = &unk_189CA54F8;
        v11[4] = v12;
        v11[5] = &buf;
        __int128 v14 = 0u;
        __int128 v15 = 0u;
        __int128 v16 = 0u;
        __int128 v17 = 0u;
        readingLocations = self->_readingLocations;
        uint64_t v8 = -[NSArray countByEnumeratingWithState:objects:count:]( readingLocations,  "countByEnumeratingWithState:objects:count:",  &v14,  v13,  16LL);
        if (v8)
        {
          uint64_t v9 = *(void *)v15;
          do
          {
            for (uint64_t i = 0LL; i != v8; ++i)
            {
              if (*(void *)v15 != v9) {
                objc_enumerationMutation(readingLocations);
              }
              -[NSFileAccessClaim makeProviderOfItemAtLocation:provideIfNecessaryWithOptions:thenContinue:]( self,  "makeProviderOfItemAtLocation:provideIfNecessaryWithOptions:thenContinue:",  *(void *)(*((void *)&v14 + 1) + 8 * i),  self->_readingOptions,  v11);
            }

            uint64_t v8 = -[NSArray countByEnumeratingWithState:objects:count:]( readingLocations,  "countByEnumeratingWithState:objects:count:",  &v14,  v13,  16LL);
          }

          while (v8);
        }
      }

      _Block_object_dispose(&buf, 8);
    }

    else
    {
      __36__NSFileSubarbitrationClaim_granted__block_invoke((uint64_t)v12);
    }
  }

  else
  {
    if (v5)
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = -[NSFileAccessClaim claimID](self, "claimID");
      _os_log_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_DEFAULT,  "Subarbitration claim %{public}@ granted in client",  (uint8_t *)&buf,  0xCu);
    }

    -[NSFileAccessClaim unblockClaimerForReason:](self, "unblockClaimerForReason:", 0x189CC6E28LL);
  }

uint64_t __36__NSFileSubarbitrationClaim_granted__block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(_BYTE *)(v2 + 296))
  {
    objc_super v3 = (os_log_s *)_NSFCClaimsLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = [*(id *)(a1 + 32) claimID];
      *(_DWORD *)__int128 buf = 138543362;
      uint64_t v33 = v4;
      _os_log_impl( &dword_182EB1000,  v3,  OS_LOG_TYPE_DEFAULT,  "Subarbitration claim %{public}@ was nullified",  buf,  0xCu);
    }

    return [*(id *)(a1 + 32) unblockClaimerForReason:0x189CC6E28];
  }

  else
  {
    uint64_t v6 = *(void **)(v2 + 264);
    v31[0] = MEMORY[0x1895F87A8];
    v31[1] = 3221225472LL;
    v31[2] = __36__NSFileSubarbitrationClaim_granted__block_invoke_56;
    v31[3] = &unk_189CA54B0;
    v31[4] = v2;
    [v6 forEachReactorToItemOrContainedItemPerformProcedure:v31];
    id v7 = objc_alloc_init(MEMORY[0x189603FA8]);
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)(a1 + 32);
    if (*(void *)(v9 + 208))
    {
      objc_msgSend(v7, "addObjectsFromArray:");
      uint64_t v9 = *(void *)(a1 + 32);
    }

    if (*(void *)(v9 + 224))
    {
      objc_msgSend(v8, "addObjectsFromArray:");
      uint64_t v9 = *(void *)(a1 + 32);
    }

    objc_msgSend((id)objc_msgSend(*(id *)(v9 + 240), "remoteObjectProxy"), "prepareToArbitrateForURLs:", v8);

    id v10 = objc_alloc_init(MEMORY[0x189603FA8]);
    int v11 = (void *)[*(id *)(a1 + 32) pendingClaims];
    __int128 v37 = 0u;
    __int128 v38 = 0u;
    __int128 v39 = 0u;
    __int128 v40 = 0u;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v37 objects:v36 count:16];
    if (v12)
    {
      uint64_t v14 = v12;
      uint64_t v15 = *(void *)v38;
      *(void *)&__int128 v13 = 138543618LL;
      __int128 v26 = v13;
      id v27 = v10;
      uint64_t v28 = v11;
      do
      {
        for (uint64_t i = 0LL; i != v14; ++i)
        {
          if (*(void *)v38 != v15) {
            objc_enumerationMutation(v11);
          }
          __int128 v17 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            if (([v17 isRevoked] & 1) == 0)
            {
              uint64_t v18 = [v17 claimID];
              if (([*(id *)(*(void *)(a1 + 32) + 272) containsObject:v18] & 1) == 0)
              {
                uint64_t v19 = (os_log_s *)_NSFCClaimsLog();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v20 = [v17 claimID];
                  uint64_t v21 = [*(id *)(a1 + 32) claimID];
                  *(_DWORD *)__int128 buf = v26;
                  uint64_t v33 = v20;
                  id v10 = v27;
                  __int16 v34 = 2114;
                  uint64_t v35 = v21;
                  _os_log_impl( &dword_182EB1000,  v19,  OS_LOG_TYPE_DEFAULT,  "Forwarding pending claim %{public}@ to subarbiter for claim %{public}@ for evaluation there",  buf,  0x16u);
                }

                objc_msgSend(*(id *)(*(void *)(a1 + 32) + 272), "addObject:", v18, v26, v27);
                [v17 forwardUsingConnection:*(void *)(*(void *)(a1 + 32) + 240) crashHandler:&__block_literal_global_59];
                int v11 = v28;
              }
            }

            objc_msgSend(v10, "addObject:", v17, v26, v27);
          }
        }

        uint64_t v14 = [v11 countByEnumeratingWithState:&v37 objects:v36 count:16];
      }

      while (v14);
    }

    objc_msgSend(*(id *)(a1 + 32), "removePendingClaims:", v10, v26, v27);

    uint64_t v22 = *(void *)(a1 + 32);
    v23 = *(void **)(v22 + 240);
    uint64_t v24 = MEMORY[0x1895F87A8];
    v30[0] = MEMORY[0x1895F87A8];
    v30[1] = 3221225472LL;
    v30[2] = __36__NSFileSubarbitrationClaim_granted__block_invoke_60;
    v30[3] = &unk_189CA0C18;
    v30[4] = v22;
    uint64_t v25 = (void *)[v23 remoteObjectProxyWithErrorHandler:v30];
    v29[0] = v24;
    v29[1] = 3221225472LL;
    v29[2] = __36__NSFileSubarbitrationClaim_granted__block_invoke_63;
    v29[3] = &unk_189C9A030;
    v29[4] = *(void *)(a1 + 32);
    return [v25 startArbitratingWithReply:v29];
  }

uint64_t __36__NSFileSubarbitrationClaim_granted__block_invoke_56(uint64_t a1, void *a2)
{
  return objc_msgSend( a2,  "forwardUsingProxy:",  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 240), "remoteObjectProxy"));
}

uint64_t __36__NSFileSubarbitrationClaim_granted__block_invoke_58()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  v0 = (os_log_s *)_NSOSLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_error_impl( &dword_182EB1000,  v0,  OS_LOG_TYPE_ERROR,  "A process invoked -[NSFileCoordinator prepareForReadingItemsAtURLs:options:writingItemsAtURLs:options:error:byAcce ssor:] but stopped listening. Letting other process' file access claims proceed.",  v2,  2u);
  }

  return 0LL;
}

uint64_t __36__NSFileSubarbitrationClaim_granted__block_invoke_60(uint64_t a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (os_log_s *)_NSFCLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138543618;
    id v7 = @"startArbitrating";
    __int16 v8 = 2114;
    uint64_t v9 = a2;
    _os_log_error_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_ERROR,  "Sending of a '%{public}@' message was interrupted: %{public}@",  (uint8_t *)&v6,  0x16u);
  }

  return [*(id *)(a1 + 32) unblockClaimerForReason:0x189CC6E28];
}

uint64_t __36__NSFileSubarbitrationClaim_granted__block_invoke_63(uint64_t a1)
{
  return [*(id *)(a1 + 32) unblockClaimerForReason:0x189CC6E28];
}

uint64_t __36__NSFileSubarbitrationClaim_granted__block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 40) + 8LL);
  uint64_t v2 = *(void *)(v1 + 24) - 1LL;
  *(void *)(v1 + 24) = v2;
  if (!v2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16LL))();
  }
  return result;
}

- (void)invokeClaimer
{
  uint64_t v9 = *MEMORY[0x1895F89C0];
  if (self->super._claimerOrNil)
  {
    uint64_t v3 = (os_log_s *)_NSFCClaimsLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int128 buf = 138543362;
      id v8 = -[NSFileAccessClaim claimID](self, "claimID");
      _os_log_impl( &dword_182EB1000,  v3,  OS_LOG_TYPE_DEFAULT,  "Subarbitration claim %{public}@ invoked in client",  buf,  0xCu);
    }

    (*((void (**)(id, NSFileSubarbitrationClaim *, id))self->super._claimerOrNil + 2))( self->super._claimerOrNil,  self,  -[NSFileAccessClaim claimerError](self, "claimerError"));

    self->super._claimerOrNil = 0LL;
  }

  if (self->super._serverClaimerOrNil)
  {
    uint64_t v4 = (os_log_s *)_NSFCClaimsLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = -[NSFileAccessClaim claimID](self, "claimID");
      *(_DWORD *)__int128 buf = 138543362;
      id v8 = v5;
      _os_log_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_DEFAULT,  "Subarbitration claim %{public}@ invoked in server",  buf,  0xCu);
    }

    (*((void (**)(id, void, void, void, void, id))self->super._serverClaimerOrNil + 2))( self->super._serverClaimerOrNil,  0LL,  0LL,  0LL,  0LL,  -[NSFileAccessClaim claimerError](self, "claimerError"));

    self->super._serverClaimerOrNil = 0LL;
  }

  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___NSFileSubarbitrationClaim;
  -[NSFileAccessClaim invokeClaimer](&v6, sel_invokeClaimer);
}

- (void)revoked
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( self->_readRelinquishmentsByPresenterID,  "enumerateKeysAndObjectsUsingBlock:",  &__block_literal_global_69);

  self->_readRelinquishmentsByPresenterID = 0LL;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:]( self->_writeRelinquishmentsByPresenterID,  "enumerateKeysAndObjectsUsingBlock:",  &__block_literal_global_70);

  self->_writeRelinquishmentsByPresenterID = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFileSubarbitrationClaim;
  -[NSFileAccessClaim revoked](&v3, sel_revoked);
}

uint64_t __36__NSFileSubarbitrationClaim_revoked__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 removeAllBlockingAccessClaimIDs];
}

uint64_t __36__NSFileSubarbitrationClaim_revoked__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 removeAllBlockingAccessClaimIDs];
}

- (void)devalueSelf
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  __int128 v20 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  readingLocations = self->_readingLocations;
  uint64_t v4 = -[NSArray countByEnumeratingWithState:objects:count:]( readingLocations,  "countByEnumeratingWithState:objects:count:",  &v20,  v19,  16LL);
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      for (uint64_t i = 0LL; i != v5; ++i)
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(readingLocations);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * i) removeAccessClaim:self];
      }

      uint64_t v5 = -[NSArray countByEnumeratingWithState:objects:count:]( readingLocations,  "countByEnumeratingWithState:objects:count:",  &v20,  v19,  16LL);
    }

    while (v5);
  }

  self->_readingLocations = 0LL;
  __int128 v15 = 0u;
  __int128 v16 = 0u;
  __int128 v17 = 0u;
  __int128 v18 = 0u;
  writingLocations = self->_writingLocations;
  uint64_t v9 = -[NSArray countByEnumeratingWithState:objects:count:]( writingLocations,  "countByEnumeratingWithState:objects:count:",  &v15,  v14,  16LL);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t j = 0LL; j != v10; ++j)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(writingLocations);
        }
        [*(id *)(*((void *)&v15 + 1) + 8 * j) removeAccessClaim:self];
      }

      uint64_t v10 = -[NSArray countByEnumeratingWithState:objects:count:]( writingLocations,  "countByEnumeratingWithState:objects:count:",  &v15,  v14,  16LL);
    }

    while (v10);
  }

  self->_writingLocations = 0LL;
  v13.receiver = self;
  v13.super_class = (Class)&OBJC_CLASS___NSFileSubarbitrationClaim;
  -[NSFileAccessClaim devalueSelf](&v13, sel_devalueSelf);
}

- (id)relinquishmentForWrite:(BOOL)a3 toPresenterForID:(id)a4
{
  if (a3) {
    uint64_t v5 = 36LL;
  }
  else {
    uint64_t v5 = 35LL;
  }
  uint64_t v6 = (id *)&(&self->super.super.isa)[v5];
  id v7 = (NSFilePresenterRelinquishment *)-[objc_class objectForKey:]((&self->super.super.isa)[v5], "objectForKey:", a4);
  if (!v7)
  {
    id v7 = objc_alloc_init(&OBJC_CLASS___NSFilePresenterRelinquishment);
    [*v6 setObject:v7 forKey:a4];
    id v8 = v7;
  }

  return v7;
}

- (void)forwardRelinquishmentForWritingClaim:(BOOL)a3 withID:(id)a4 options:(unint64_t)a5 purposeID:(id)a6 subitemURL:(id)a7 toPresenter:(id)a8 usingReplySender:(id)a9
{
  v19[6] = *MEMORY[0x1895F89C0];
  id v15 = -[NSFileSubarbitrationClaim relinquishmentForWrite:toPresenterForID:]( self,  "relinquishmentForWrite:toPresenterForID:",  a3,  [a8 reactorID]);
  v19[0] = 0LL;
  v19[1] = v19;
  v19[2] = 0x3052000000LL;
  v19[3] = __Block_byref_object_copy__29;
  v19[4] = __Block_byref_object_dispose__29;
  v19[5] = 0LL;
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __131__NSFileSubarbitrationClaim_forwardRelinquishmentForWritingClaim_withID_options_purposeID_subitemURL_toPresenter_usingReplySender___block_invoke;
  v17[3] = &unk_189CA55A8;
  BOOL v18 = a3;
  v17[4] = a8;
  v17[5] = a4;
  v17[6] = a6;
  v17[7] = a7;
  v17[9] = v19;
  v17[10] = a5;
  v17[8] = v15;
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __131__NSFileSubarbitrationClaim_forwardRelinquishmentForWritingClaim_withID_options_purposeID_subitemURL_toPresenter_usingReplySender___block_invoke_3;
  v16[3] = &unk_189CA55D0;
  v16[4] = a9;
  v16[5] = v19;
  [v15 performRelinquishmentToAccessClaimIfNecessary:a4 usingBlock:v17 withReply:v16];
  _Block_object_dispose(v19, 8);
}

uint64_t __131__NSFileSubarbitrationClaim_forwardRelinquishmentForWritingClaim_withID_options_purposeID_subitemURL_toPresenter_usingReplySender___block_invoke( uint64_t a1,  uint64_t a2)
{
  void v11[7] = *MEMORY[0x1895F89C0];
  uint64_t v2 = *(unsigned __int8 *)(a1 + 88);
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = *(void *)(a1 + 56);
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __131__NSFileSubarbitrationClaim_forwardRelinquishmentForWritingClaim_withID_options_purposeID_subitemURL_toPresenter_usingReplySender___block_invoke_2;
  v11[3] = &unk_189CA5580;
  uint64_t v7 = *(void *)(a1 + 64);
  uint64_t v9 = *(void *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 80);
  v11[5] = a2;
  void v11[6] = v9;
  v11[4] = v7;
  return [v4 forwardRelinquishmentForWritingClaim:v2 withID:v3 purposeID:v5 subitemURL:v6 options:v8 completionHandler:v11];
}

uint64_t __131__NSFileSubarbitrationClaim_forwardRelinquishmentForWritingClaim_withID_options_purposeID_subitemURL_toPresenter_usingReplySender___block_invoke_2( uint64_t a1,  int a2,  void *a3,  uint64_t a4)
{
  if (a2) {
    id v7 = a3;
  }
  else {
    id v7 = 0LL;
  }
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL) = v7;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

void __131__NSFileSubarbitrationClaim_forwardRelinquishmentForWritingClaim_withID_options_purposeID_subitemURL_toPresenter_usingReplySender___block_invoke_3( uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL) = 0LL;
}

- (void)forwardReacquisitionForWritingClaim:(BOOL)a3 withID:(id)a4 toPresenterForID:(id)a5 usingReplySender:(id)a6
{
  v9[5] = *MEMORY[0x1895F89C0];
  id v8 = -[NSFileSubarbitrationClaim relinquishmentForWrite:toPresenterForID:]( self,  "relinquishmentForWrite:toPresenterForID:",  a3,  a5);
  if (v8)
  {
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __106__NSFileSubarbitrationClaim_forwardReacquisitionForWritingClaim_withID_toPresenterForID_usingReplySender___block_invoke;
    v9[3] = &unk_189C9DCE8;
    v9[4] = a6;
    [v8 removeBlockingAccessClaimID:a4 thenContinue:v9];
  }

  else if (a6)
  {
    (*((void (**)(id))a6 + 2))(a6);
  }

uint64_t __106__NSFileSubarbitrationClaim_forwardReacquisitionForWritingClaim_withID_toPresenterForID_usingReplySender___block_invoke( uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (NSXPCConnection)subarbiterConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 240LL, 1);
}

- (void)setSubarbiterConnection:(id)a3
{
}

- (BOOL)nullified
{
  return self->_nullified;
}

@end