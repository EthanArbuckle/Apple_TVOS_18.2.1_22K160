@interface NSFileMultipleAccessClaim
+ (BOOL)supportsSecureCoding;
- (BOOL)blocksClaim:(id)a3;
- (BOOL)evaluateSelfWithRootNode:(id)a3 checkSubarbitrability:(BOOL)a4;
- (BOOL)isBlockedByReadingItemAtLocation:(id)a3 options:(unint64_t)a4;
- (BOOL)isBlockedByWritingItemAtLocation:(id)a3 options:(unint64_t)a4;
- (BOOL)shouldBeRevokedPriorToInvokingAccessor;
- (BOOL)shouldCancelInsteadOfWaiting;
- (NSFileMultipleAccessClaim)initWithCoder:(id)a3;
- (NSFileMultipleAccessClaim)initWithPurposeID:(id)a3 intents:(id)a4 claimer:(id)a5;
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

@implementation NSFileMultipleAccessClaim

- (NSFileMultipleAccessClaim)initWithPurposeID:(id)a3 intents:(id)a4 claimer:(id)a5
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  v7 = -[NSFileAccessClaim initWithClient:claimID:purposeID:](self, "initWithClient:claimID:purposeID:", 0LL, 0LL, a3);
  if (v7)
  {
    v7->super._claimerOrNil = (id)[a5 copy];
    v7->_readingURLs = (NSMutableArray *)objc_opt_new();
    v7->_writingURLs = (NSMutableArray *)objc_opt_new();
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __63__NSFileMultipleAccessClaim_initWithPurposeID_intents_claimer___block_invoke;
    v17[3] = &unk_189CA3C80;
    v17[4] = v7;
    [a4 enumerateObjectsUsingBlock:v17];
    v7->_readingURLsDidChange = (BOOL *)calloc(1uLL, -[NSMutableArray count](v7->_readingURLs, "count"));
    v7->_writingURLsDidChange = (BOOL *)calloc(1uLL, -[NSMutableArray count](v7->_writingURLs, "count"));
    v7->_readingOptions = (unint64_t *)calloc(8uLL, -[NSMutableArray count](v7->_readingURLs, "count"));
    v7->_writingOptions = (unint64_t *)calloc(8uLL, -[NSMutableArray count](v7->_writingURLs, "count"));
    __int128 v21 = 0u;
    __int128 v22 = 0u;
    __int128 v19 = 0u;
    __int128 v20 = 0u;
    uint64_t v8 = [a4 countByEnumeratingWithState:&v19 objects:v18 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0LL;
      uint64_t v11 = 0LL;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0LL; i != v9; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(a4);
          }
          v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ([v14 isRead])
          {
            uint64_t v15 = [v14 readingOptions];
            v7->_readingOptions[v10++] = ((_DWORD)v15 << 14) & 0x20000 | (unint64_t)v15;
          }

          else
          {
            v7->_writingOptions[v11++] = [v14 writingOptions];
          }
        }

        uint64_t v9 = [a4 countByEnumeratingWithState:&v19 objects:v18 count:16];
      }

      while (v9);
    }
  }

  return v7;
}

uint64_t __63__NSFileMultipleAccessClaim_initWithPurposeID_intents_claimer___block_invoke( uint64_t a1,  void *a2)
{
  int v4 = [a2 isRead];
  uint64_t v5 = 29LL;
  if (v4) {
    uint64_t v5 = 28LL;
  }
  return objc_msgSend( *(id *)(*(void *)(a1 + 32) + OBJC_IVAR___NSFileReadingClaim__url[v5]),  "addObject:",  objc_msgSend(a2, "URL"));
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1895F89C0];

  free(self->_readingOptions);
  free(self->_writingOptions);
  free(self->_readingURLsDidChange);
  free(self->_writingURLsDidChange);

  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___NSFileMultipleAccessClaim;
  -[NSFileAccessClaim dealloc](&v3, sel_dealloc);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:@"NSFileAccessClaims should only ever be encoded by XPC" userInfo:0]);
  }
  [a3 encodeObject:pairsForURLs(self->_readingURLs) forKey:@"NSReadingURLPairsKey"];
  objc_msgSend( a3,  "encodeBytes:length:forKey:",  self->_readingOptions,  8 * -[NSMutableArray count](self->_readingURLs, "count"),  @"NSReadingOptionsKey");
  [a3 encodeObject:pairsForURLs(self->_writingURLs) forKey:@"NSWritingURLPairsKey"];
  objc_msgSend( a3,  "encodeBytes:length:forKey:",  self->_writingOptions,  8 * -[NSMutableArray count](self->_writingURLs, "count"),  @"NSWritingOptionsKey");
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___NSFileMultipleAccessClaim;
  -[NSFileAccessClaim encodeWithCoder:](&v5, sel_encodeWithCoder_, a3);
}

- (NSFileMultipleAccessClaim)initWithCoder:(id)a3
{
  v25[2] = *MEMORY[0x1895F89C0];
  v24.receiver = self;
  v24.super_class = (Class)&OBJC_CLASS___NSFileMultipleAccessClaim;
  uint64_t v4 = -[NSFileAccessClaim initWithCoder:](&v24, sel_initWithCoder_);
  if (!v4) {
    return v4;
  }
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_super v5 = (void *)[a3 allowedClasses];
    uint64_t v6 = (void *)MEMORY[0x189604010];
    v25[0] = objc_opt_class();
    v25[1] = objc_opt_class();
    uint64_t v7 = objc_msgSend( v5,  "setByAddingObjectsFromSet:",  objc_msgSend(v6, "setWithArray:", objc_msgSend(MEMORY[0x189603F18], "arrayWithObjects:count:", v25, 2)));
    v23[0] = MEMORY[0x1895F87A8];
    v23[1] = 3221225472LL;
    v23[2] = __43__NSFileMultipleAccessClaim_initWithCoder___block_invoke;
    v23[3] = &unk_189CA3CA8;
    v23[4] = a3;
    v23[5] = v7;
    v23[6] = v4;
    v4->_readingURLs = (NSMutableArray *)objc_msgSend( __43__NSFileMultipleAccessClaim_initWithCoder___block_invoke( (uint64_t)v23,  (uint64_t)@"NSReadingURLPairsKey"),  "mutableCopy");
    v4->_writingURLs = (NSMutableArray *)objc_msgSend( __43__NSFileMultipleAccessClaim_initWithCoder___block_invoke( (uint64_t)v23,  (uint64_t)@"NSWritingURLPairsKey"),  "mutableCopy");
    size_t v8 = 8 * -[NSMutableArray count](v4->_readingURLs, "count");
    if (v8)
    {
      uint64_t v22 = 0LL;
      uint64_t v9 = [a3 decodeBytesForKey:@"NSReadingOptionsKey" returnedLength:&v22];
      if (v22 != v8)
      {

        v17 = (void *)MEMORY[0x189603F70];
        uint64_t v18 = *MEMORY[0x189603A58];
        __int128 v19 = @"NSFileMultipleAccessClaim failed to properly decode NSReadingOptionsKey";
        goto LABEL_16;
      }

      uint64_t v10 = (const void *)v9;
      uint64_t v11 = (unint64_t *)malloc(v8);
      v4->_readingOptions = v11;
      if (v11) {
        memcpy(v11, v10, v8);
      }
    }

    size_t v12 = 8 * -[NSMutableArray count](v4->_writingURLs, "count");
    if (!v12)
    {
LABEL_11:
      v4->_readingURLsDidChange = (BOOL *)calloc(1uLL, -[NSMutableArray count](v4->_readingURLs, "count"));
      v4->_writingURLsDidChange = (BOOL *)calloc(1uLL, -[NSMutableArray count](v4->_writingURLs, "count"));
      return v4;
    }

    uint64_t v22 = 0LL;
    uint64_t v13 = [a3 decodeBytesForKey:@"NSWritingOptionsKey" returnedLength:&v22];
    if (v22 == v12)
    {
      v14 = (const void *)v13;
      uint64_t v15 = (unint64_t *)malloc(v12);
      v4->_writingOptions = v15;
      if (v15) {
        memcpy(v15, v14, v12);
      }
      goto LABEL_11;
    }

    v17 = (void *)MEMORY[0x189603F70];
    uint64_t v18 = *MEMORY[0x189603A58];
    __int128 v19 = @"NSFileMultipleAccessClaim failed to properly decode NSWritingOptionsKey";
  }

  else
  {

    v17 = (void *)MEMORY[0x189603F70];
    uint64_t v18 = *MEMORY[0x189603A58];
    __int128 v19 = @"NSFileAccessClaims should only ever be decoded by XPC";
  }

void *__43__NSFileMultipleAccessClaim_initWithCoder___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void *)[*(id *)(a1 + 32) decodeObjectOfClasses:*(void *)(a1 + 40) forKey:a2];
  objc_super v5 = (void *)objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  if (v4)
  {
    if ((_NSIsNSArray() & 1) == 0)
    {
      size_t v12 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSFileMultipleAccessClaim decoded the wrong class for key %@",  a2);
LABEL_13:
      uint64_t v13 = v12;

      objc_exception_throw((id)[MEMORY[0x189603F70] exceptionWithName:*MEMORY[0x189603A58] reason:v13 userInfo:0]);
    }

    __int128 v17 = 0u;
    __int128 v18 = 0u;
    __int128 v15 = 0u;
    __int128 v16 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      do
      {
        uint64_t v9 = 0LL;
        do
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            size_t v12 = +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"NSFileMultipleAccessClaim decoded the wrong class for contents of %@",  a2);
            goto LABEL_13;
          }

          objc_msgSend(v5, "addObject:", objc_msgSend(v10, "URL"));
          ++v9;
        }

        while (v7 != v9);
        uint64_t v7 = [v4 countByEnumeratingWithState:&v15 objects:v14 count:16];
      }

      while (v7);
    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)forwardUsingConnection:(id)a3 crashHandler:(id)a4
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v7 = (os_log_s *)_NSFCClaimsLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    id v11 = -[NSFileAccessClaim claimID](self, "claimID");
    _os_log_debug_impl( &dword_182EB1000,  v7,  OS_LOG_TYPE_DEBUG,  "%{public}@ blocked pending grantAccessClaim",  buf,  0xCu);
  }

  -[NSFileAccessClaim block](self, "block");
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __65__NSFileMultipleAccessClaim_forwardUsingConnection_crashHandler___block_invoke;
  v9[3] = &unk_189CA0D60;
  v9[4] = self;
  v9[5] = a4;
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __65__NSFileMultipleAccessClaim_forwardUsingConnection_crashHandler___block_invoke_406;
  v8[3] = &unk_189CA3A50;
  v8[4] = self;
  objc_msgSend((id)objc_msgSend(a3, "remoteObjectProxyWithErrorHandler:", v9), "grantAccessClaim:withReply:", self, v8);
}

uint64_t __65__NSFileMultipleAccessClaim_forwardUsingConnection_crashHandler___block_invoke( uint64_t a1,  uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  uint64_t v4 = (os_log_s *)_NSFCClaimsLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = [*(id *)(a1 + 32) claimID];
    int v10 = 138543618;
    id v11 = (const __CFString *)v9;
    __int16 v12 = 2114;
    uint64_t v13 = a2;
    _os_log_error_impl( &dword_182EB1000,  v4,  OS_LOG_TYPE_ERROR,  "%{public}@ grantAccessClaim message failed: %{public}@",  (uint8_t *)&v10,  0x16u);
  }

  objc_super v5 = (os_log_s *)_NSFCLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v10 = 138543618;
    id v11 = @"grantAccessClaim";
    __int16 v12 = 2114;
    uint64_t v13 = a2;
    _os_log_error_impl( &dword_182EB1000,  v5,  OS_LOG_TYPE_ERROR,  "Sending of a '%{public}@' message was interrupted: %{public}@",  (uint8_t *)&v10,  0x16u);
  }

  if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16LL))())
  {
    uint64_t v6 = 208LL;
    if ([*(id *)(*(void *)(a1 + 32) + 208) count])
    {
      uint64_t v7 = 256LL;
    }

    else
    {
      uint64_t v6 = 232LL;
      uint64_t v7 = 512LL;
    }

    objc_msgSend( *(id *)(a1 + 32),  "setClaimerError:",  _NSErrorWithFilePath(v7, objc_msgSend(*(id *)(*(void *)(a1 + 32) + v6), "objectAtIndex:", 0)));
  }

  return [*(id *)(a1 + 32) unblock];
}

uint64_t __65__NSFileMultipleAccessClaim_forwardUsingConnection_crashHandler___block_invoke_406( uint64_t a1,  void *a2,  void *a3,  void *a4,  uint64_t a5,  uint64_t a6)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  __int16 v12 = (os_log_s *)_NSFCClaimsLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = [*(id *)(a1 + 32) claimID];
    *(_DWORD *)buf = 138543362;
    uint64_t v21 = v14;
    _os_log_debug_impl( &dword_182EB1000,  v12,  OS_LOG_TYPE_DEBUG,  "%{public}@ received grantAccessClaim reply",  buf,  0xCu);
    if (a6) {
      goto LABEL_3;
    }
  }

  else if (a6)
  {
LABEL_3:
    uint64_t v13 = (os_log_s *)_NSFCClaimsLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v17 = [*(id *)(a1 + 32) claimID];
      *(_DWORD *)buf = 138543618;
      uint64_t v21 = v17;
      __int16 v22 = 2114;
      uint64_t v23 = a6;
      _os_log_error_impl( &dword_182EB1000,  v13,  OS_LOG_TYPE_ERROR,  "%{public}@ grantAccessClaim reply is an error: %{public}@",  buf,  0x16u);
    }

    [*(id *)(a1 + 32) setClaimerError:a6];
    return [*(id *)(a1 + 32) unblock];
  }

  uint64_t v15 = MEMORY[0x1895F87A8];
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = __65__NSFileMultipleAccessClaim_forwardUsingConnection_crashHandler___block_invoke_407;
  v19[3] = &unk_189CA3CD0;
  v19[4] = *(void *)(a1 + 32);
  [a2 enumerateObjectsUsingBlock:v19];
  v18[0] = v15;
  v18[1] = 3221225472LL;
  v18[2] = __65__NSFileMultipleAccessClaim_forwardUsingConnection_crashHandler___block_invoke_2;
  v18[3] = &unk_189CA3CD0;
  v18[4] = *(void *)(a1 + 32);
  [a3 enumerateObjectsUsingBlock:v18];
  if (a4)
  {

    *(void *)(*(void *)(a1 + 32) + 176) = [a4 copy];
  }

  [*(id *)(a1 + 32) setShouldEnableMaterializationDuringAccessorBlock:a5];
  return [*(id *)(a1 + 32) unblock];
}

uint64_t __65__NSFileMultipleAccessClaim_forwardUsingConnection_crashHandler___block_invoke_407( uint64_t a1,  void *a2,  uint64_t a3)
{
  uint64_t result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    uint64_t result = objc_msgSend( *(id *)(*(void *)(a1 + 32) + 208),  "replaceObjectAtIndex:withObject:",  a3,  objc_msgSend(a2, "URL"));
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 224LL) + a3) = 1;
  }

  return result;
}

uint64_t __65__NSFileMultipleAccessClaim_forwardUsingConnection_crashHandler___block_invoke_2( uint64_t a1,  void *a2,  uint64_t a3)
{
  uint64_t result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    uint64_t result = objc_msgSend( *(id *)(*(void *)(a1 + 32) + 232),  "replaceObjectAtIndex:withObject:",  a3,  objc_msgSend(a2, "URL"));
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 248LL) + a3) = 1;
  }

  return result;
}

- (BOOL)evaluateSelfWithRootNode:(id)a3 checkSubarbitrability:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v82 = *MEMORY[0x1895F89C0];
  *(_OWORD *)&callBacks.versiouint64_t n = xmmword_189CA3FE8;
  *(_OWORD *)&callBacks.release = *(_OWORD *)algn_189CA3FF8;
  callBacks.equal = (CFArrayEqualCallBack)0x180AD0008LL;
  uint64_t v7 = CFArrayCreateMutable(0LL, 0LL, &callBacks);
  __int128 v78 = 0u;
  __int128 v79 = 0u;
  __int128 v80 = 0u;
  __int128 v81 = 0u;
  readingURLs = self->_readingURLs;
  uint64_t v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( readingURLs,  "countByEnumeratingWithState:objects:count:",  &v78,  v77,  16LL);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v79;
    while (2)
    {
      for (uint64_t i = 0LL; i != v10; ++i)
      {
        if (*(void *)v79 != v11) {
          objc_enumerationMutation(readingURLs);
        }
        uint64_t v13 = (void *)[a3 descendantForFileURL:*(void *)(*((void *)&v78 + 1) + 8 * i)];
        if (v13)
        {
          uint64_t v14 = v13;
          if (v4 && ![v13 itemIsSubarbitrable])
          {
            v34 = v14;
LABEL_46:
            [v34 removeSelfIfUseless];
            return 0;
          }

          -[__CFArray addObject:](v7, "addObject:", v14);
        }
      }

      uint64_t v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( readingURLs,  "countByEnumeratingWithState:objects:count:",  &v78,  v77,  16LL);
      if (v10) {
        continue;
      }
      break;
    }
  }

  *(_OWORD *)&callBacks.versiouint64_t n = xmmword_189CA3FE8;
  *(_OWORD *)&callBacks.release = *(_OWORD *)algn_189CA3FF8;
  callBacks.equal = (CFArrayEqualCallBack)0x180AD0008LL;
  uint64_t v15 = CFArrayCreateMutable(0LL, 0LL, &callBacks);
  __int128 v73 = 0u;
  __int128 v74 = 0u;
  __int128 v75 = 0u;
  __int128 v76 = 0u;
  writingURLs = self->_writingURLs;
  uint64_t v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( writingURLs,  "countByEnumeratingWithState:objects:count:",  &v73,  v72,  16LL);
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v74;
    while (2)
    {
      for (uint64_t j = 0LL; j != v18; ++j)
      {
        if (*(void *)v74 != v19) {
          objc_enumerationMutation(writingURLs);
        }
        uint64_t v21 = (void *)[a3 descendantForFileURL:*(void *)(*((void *)&v73 + 1) + 8 * j)];
        if (v21)
        {
          __int16 v22 = v21;
          if (v4 && ![v21 itemIsSubarbitrable])
          {
            v34 = v22;
            goto LABEL_46;
          }

          -[__CFArray addObject:](v15, "addObject:", v22);
        }
      }

      uint64_t v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( writingURLs,  "countByEnumeratingWithState:objects:count:",  &v73,  v72,  16LL);
      if (v18) {
        continue;
      }
      break;
    }
  }

  callBacks.versiouint64_t n = 0LL;
  if (!-[NSFileAccessClaim canAccessLocations:forReading:error:]( self,  "canAccessLocations:forReading:error:",  v7,  1LL,  &callBacks)
    || !-[NSFileAccessClaim canAccessLocations:forReading:error:]( self,  "canAccessLocations:forReading:error:",  v15,  0LL,  &callBacks))
  {
    -[NSFileAccessClaim setClaimerError:](self, "setClaimerError:", callBacks.version);
    return 1;
  }

  self->_readingLocations = (NSMutableArray *)v7;
  self->_writingLocations = (NSMutableArray *)v15;
  __int128 v68 = 0u;
  __int128 v69 = 0u;
  __int128 v70 = 0u;
  __int128 v71 = 0u;
  readingLocations = self->_readingLocations;
  uint64_t v24 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( readingLocations,  "countByEnumeratingWithState:objects:count:",  &v68,  v67,  16LL);
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v69;
    do
    {
      for (uint64_t k = 0LL; k != v25; ++k)
      {
        if (*(void *)v69 != v26) {
          objc_enumerationMutation(readingLocations);
        }
        [*(id *)(*((void *)&v68 + 1) + 8 * k) addAccessClaim:self];
      }

      uint64_t v25 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( readingLocations,  "countByEnumeratingWithState:objects:count:",  &v68,  v67,  16LL);
    }

    while (v25);
  }

  __int128 v65 = 0u;
  __int128 v66 = 0u;
  __int128 v63 = 0u;
  __int128 v64 = 0u;
  writingLocations = self->_writingLocations;
  uint64_t v29 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( writingLocations,  "countByEnumeratingWithState:objects:count:",  &v63,  v62,  16LL);
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v64;
    do
    {
      for (uint64_t m = 0LL; m != v30; ++m)
      {
        if (*(void *)v64 != v31) {
          objc_enumerationMutation(writingLocations);
        }
        [*(id *)(*((void *)&v63 + 1) + 8 * m) addAccessClaim:self];
      }

      uint64_t v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( writingLocations,  "countByEnumeratingWithState:objects:count:",  &v63,  v62,  16LL);
    }

    while (v30);
  }

  if (-[NSMutableArray count](self->_readingURLs, "count"))
  {
    uint64_t v33 = 0LL;
    while ((self->_readingOptions[v33] & 2) == 0)
    {
    }

    self->_rootNode = (NSFileAccessNode *)a3;
  }

uint64_t __76__NSFileMultipleAccessClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke( uint64_t a1,  void *a2)
{
  return [a2 evaluateNewClaim:*(void *)(a1 + 32)];
}

uint64_t __76__NSFileMultipleAccessClaim_evaluateSelfWithRootNode_checkSubarbitrability___block_invoke_2( uint64_t a1,  void *a2)
{
  return [a2 evaluateNewClaim:*(void *)(a1 + 32)];
}

- (BOOL)isBlockedByReadingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  uint64_t v8 = 0LL;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000LL;
  char v11 = 0;
  writingLocations = self->_writingLocations;
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __70__NSFileMultipleAccessClaim_isBlockedByReadingItemAtLocation_options___block_invoke;
  v7[3] = &unk_189CA3CF8;
  v7[4] = self;
  v7[5] = a3;
  v7[6] = &v8;
  v7[7] = a4;
  -[NSMutableArray enumerateObjectsUsingBlock:](writingLocations, "enumerateObjectsUsingBlock:", v7);
  char v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __70__NSFileMultipleAccessClaim_isBlockedByReadingItemAtLocation_options___block_invoke( void *a1,  uint64_t a2,  uint64_t a3,  _BYTE *a4)
{
  uint64_t result = [(id)objc_opt_class() canReadingItemAtLocation:a1[5] options:a1[7] safelyOverlapNewWriting:1 ofItemAtLocation:a2 options:*(void *)(*(void *)(a1[4] + 240) + 8 * a3)];
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(void *)(a1[6] + 8LL) + 24LL) = 1;
    *a4 = 1;
  }

  return result;
}

- (BOOL)isBlockedByWritingItemAtLocation:(id)a3 options:(unint64_t)a4
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  uint64_t v7 = objc_opt_class();
  uint64_t v15 = 0LL;
  __int128 v16 = &v15;
  uint64_t v17 = 0x2020000000LL;
  readingLocations = self->_readingLocations;
  char v18 = 0;
  uint64_t v9 = MEMORY[0x1895F87A8];
  v14[0] = MEMORY[0x1895F87A8];
  v14[1] = 3221225472LL;
  v14[2] = __70__NSFileMultipleAccessClaim_isBlockedByWritingItemAtLocation_options___block_invoke;
  v14[3] = &unk_189CA3D20;
  v14[4] = v7;
  v14[5] = self;
  v14[7] = &v15;
  v14[8] = a4;
  v14[6] = a3;
  -[NSMutableArray enumerateObjectsUsingBlock:](readingLocations, "enumerateObjectsUsingBlock:", v14);
  if (*((_BYTE *)v16 + 24))
  {
    BOOL v10 = 1;
  }

  else
  {
    writingLocations = self->_writingLocations;
    v13[0] = v9;
    v13[1] = 3221225472LL;
    v13[2] = __70__NSFileMultipleAccessClaim_isBlockedByWritingItemAtLocation_options___block_invoke_2;
    v13[3] = &unk_189CA3D20;
    v13[4] = v7;
    v13[5] = self;
    v13[6] = a3;
    v13[7] = &v15;
    v13[8] = a4;
    -[NSMutableArray enumerateObjectsUsingBlock:](writingLocations, "enumerateObjectsUsingBlock:", v13);
    BOOL v10 = *((_BYTE *)v16 + 24) != 0;
  }

  _Block_object_dispose(&v15, 8);
  return v10;
}

uint64_t __70__NSFileMultipleAccessClaim_isBlockedByWritingItemAtLocation_options___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  _BYTE *a4)
{
  uint64_t result = [*(id *)(a1 + 32) canReadingItemAtLocation:a2 options:*(void *)(*(void *)(*(void *)(a1 + 40) + 216) + 8 * a3) safelyOverlapNewWriting:0 ofItemAtLocation:*(void *)(a1 + 48) options:*(void *)(a1 + 64)];
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    *a4 = 1;
  }

  return result;
}

uint64_t __70__NSFileMultipleAccessClaim_isBlockedByWritingItemAtLocation_options___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  _BYTE *a4)
{
  uint64_t result = [*(id *)(a1 + 32) canNewWriteOfItemAtLocation:a2 options:*(void *)(*(void *)(*(void *)(a1 + 40) + 240) + 8 * a3) safelyOverlapExistingWriteOfItemAtLocation:*(void *)(a1 + 48) options:*(void *)(a1 + 64)];
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
    *a4 = 1;
  }

  return result;
}

- (void)granted
{
  uint64_t v21 = *MEMORY[0x1895F89C0];
  if (self->_readingLocations || self->_writingLocations)
  {
    uint64_t v3 = atomic_load(&_NSFCSubarbitrationCount);
    if (v3 < 1
      || (unsigned __int8 v14 = atomic_load(_NSFCDisableLogSuppression), (v14 & 1) != 0)
      || (uint64_t v15 = atomic_load(&_NSFCSubarbitratedClaimCount), v15 <= 99))
    {
      BOOL v4 = (os_log_s *)_NSFCClaimsLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v20 = -[NSFileAccessClaim claimID](self, "claimID");
        _os_log_impl(&dword_182EB1000, v4, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ granted in server", buf, 0xCu);
      }
    }

    readingLocations = self->_readingLocations;
    readingOptions = self->_readingOptions;
    writingLocations = self->_writingLocations;
    writingOptions = self->_writingOptions;
    uint64_t v9 = MEMORY[0x1895F87A8];
    v18[0] = MEMORY[0x1895F87A8];
    v18[1] = 3221225472LL;
    v18[2] = __36__NSFileMultipleAccessClaim_granted__block_invoke;
    v18[3] = &unk_189C9E870;
    v18[4] = self;
    -[NSFileAccessClaim makeProvidersProvideItemsForReadingLocations:options:andWritingLocationsIfNecessary:options:thenContinue:]( self,  "makeProvidersProvideItemsForReadingLocations:options:andWritingLocationsIfNecessary:options:thenContinue:",  readingLocations,  readingOptions,  writingLocations,  writingOptions,  v18);
    if (self->_writingLocations)
    {
      v17[0] = v9;
      v17[1] = 3221225472LL;
      v17[2] = __36__NSFileMultipleAccessClaim_granted__block_invoke_8;
      v17[3] = &unk_189C9A030;
      v17[4] = self;
      -[NSFileAccessClaim whenRevokedPerformProcedure:](self, "whenRevokedPerformProcedure:", v17);
    }
  }

  else
  {
    client = self->super._client;
    char v11 = (os_log_s *)_NSFCClaimsLog();
    uint64_t v12 = v11;
    if (client)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        id v20 = -[NSFileAccessClaim claimID](self, "claimID");
        _os_log_error_impl( &dword_182EB1000,  v12,  OS_LOG_TYPE_ERROR,  "Claim %{public}@ can't be granted in daemon",  buf,  0xCu);
      }
    }

    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v20 = -[NSFileAccessClaim claimID](self, "claimID");
        _os_log_impl(&dword_182EB1000, v12, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ granted in client", buf, 0xCu);
      }

      uint64_t v13 = (void *)[MEMORY[0x189603F18] arrayWithArray:self->_readingURLs];
      v16[0] = MEMORY[0x1895F87A8];
      v16[1] = 3221225472LL;
      v16[2] = __36__NSFileMultipleAccessClaim_granted__block_invoke_409;
      v16[3] = &unk_189CA3C80;
      v16[4] = self;
      [v13 enumerateObjectsUsingBlock:v16];
    }
  }

  -[NSFileAccessClaim unblockClaimerForReason:](self, "unblockClaimerForReason:", @"Initial blockage");
}

void __36__NSFileMultipleAccessClaim_granted__block_invoke(uint64_t a1, int a2)
{
  v10[6] = *MEMORY[0x1895F89C0];
  if (a2)
  {
    id v8 = objc_alloc_init(MEMORY[0x189603FE0]);
    uint64_t v3 = *(void *)(a1 + 32);
    BOOL v4 = *(void **)(v3 + 264);
    uint64_t v5 = MEMORY[0x1895F87A8];
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __36__NSFileMultipleAccessClaim_granted__block_invoke_2;
    v10[3] = &unk_189CA3D98;
    v10[4] = v3;
    v10[5] = v8;
    [v4 enumerateObjectsUsingBlock:v10];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 256);
    v9[0] = v5;
    v9[1] = 3221225472LL;
    v9[2] = __36__NSFileMultipleAccessClaim_granted__block_invoke_5;
    v9[3] = &unk_189CA3D98;
    v9[4] = v6;
    v9[5] = v8;
    [v7 enumerateObjectsUsingBlock:v9];
  }

uint64_t __36__NSFileMultipleAccessClaim_granted__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  __int128 v3 = *(_OWORD *)(a1 + 32);
  BOOL v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(v4[30] + 8 * a3);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __36__NSFileMultipleAccessClaim_granted__block_invoke_3;
  v7[3] = &unk_189CA3D70;
  __int128 v8 = v3;
  uint64_t v9 = a2;
  uint64_t v10 = v5;
  return [v4 makePresentersOfItemAtLocation:a2 orContainedItem:(v5 & 0x13000B) != 0 relinquishUsingProcedureGetter:v7];
}

id __36__NSFileMultipleAccessClaim_granted__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  v9[9] = *MEMORY[0x1895F89C0];
  if (![*(id *)(a1 + 32) shouldWritingWithOptions:*(void *)(a1 + 56) causePresenterToRelinquish:a2]) {
    return 0LL;
  }
  objc_msgSend(*(id *)(a1 + 40), "addObject:", objc_msgSend(a2, "reactorID"));
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __36__NSFileMultipleAccessClaim_granted__block_invoke_4;
  v9[3] = &unk_189CA3D48;
  uint64_t v6 = *(void *)(a1 + 48);
  uint64_t v7 = *(void *)(a1 + 56);
  v9[4] = *(void *)(a1 + 32);
  v9[5] = v6;
  v9[7] = a3;
  v9[8] = v7;
  void v9[6] = a2;
  return (id)[v9 copy];
}

uint64_t __36__NSFileMultipleAccessClaim_granted__block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend( *(id *)(a1 + 48),  "relinquishToWritingClaimWithID:options:purposeID:subitemPath:resultHandler:",  objc_msgSend(*(id *)(a1 + 32), "claimID"),  *(void *)(a1 + 64),  objc_msgSend( *(id *)(a1 + 32),  "purposeIDOfClaimOnItemAtLocation:forMessagingPresenter:",  *(void *)(a1 + 40),  *(void *)(a1 + 48)),  *(void *)(a1 + 56),  a2);
}

uint64_t __36__NSFileMultipleAccessClaim_granted__block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  __int128 v3 = *(_OWORD *)(a1 + 32);
  BOOL v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(v4[27] + 8 * a3);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __36__NSFileMultipleAccessClaim_granted__block_invoke_6;
  v7[3] = &unk_189CA3DE8;
  uint64_t v9 = v5;
  __int128 v8 = v3;
  return [v4 makePresentersOfItemAtLocation:a2 orContainedItem:0 relinquishUsingProcedureGetter:v7];
}

id __36__NSFileMultipleAccessClaim_granted__block_invoke_6(uint64_t a1, void *a2)
{
  v6[7] = *MEMORY[0x1895F89C0];
  if (![*(id *)(a1 + 32) shouldReadingWithOptions:*(void *)(a1 + 48) causePresenterToRelinquish:a2]
    || (objc_msgSend(*(id *)(a1 + 40), "containsObject:", objc_msgSend(a2, "reactorID")) & 1) != 0)
  {
    return 0LL;
  }

  objc_msgSend(*(id *)(a1 + 40), "addObject:", objc_msgSend(a2, "reactorID"));
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __36__NSFileMultipleAccessClaim_granted__block_invoke_7;
  v6[3] = &unk_189CA3DC0;
  uint64_t v5 = *(void *)(a1 + 32);
  v6[4] = a2;
  v6[5] = v5;
  v6[6] = *(void *)(a1 + 48);
  return (id)[v6 copy];
}

uint64_t __36__NSFileMultipleAccessClaim_granted__block_invoke_7(uint64_t a1, uint64_t a2)
{
  return objc_msgSend( *(id *)(a1 + 32),  "relinquishToReadingClaimWithID:options:purposeID:resultHandler:",  objc_msgSend(*(id *)(a1 + 40), "claimID"),  *(void *)(a1 + 48),  objc_msgSend(*(id *)(a1 + 40), "purposeID"),  a2);
}

uint64_t __36__NSFileMultipleAccessClaim_granted__block_invoke_8(uint64_t a1)
{
  v4[5] = *MEMORY[0x1895F89C0];
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 264);
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __36__NSFileMultipleAccessClaim_granted__block_invoke_9;
  v4[3] = &unk_189CA3E10;
  v4[4] = v1;
  return [v2 enumerateObjectsUsingBlock:v4];
}

uint64_t __36__NSFileMultipleAccessClaim_granted__block_invoke_9(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = [*(id *)(a1 + 32) shouldInformProvidersAboutEndOfWriteWithOptions:*(void *)(*(void *)(*(void *)(a1 + 32) + 240) + 8 * a3)];
  if ((_DWORD)result) {
    return objc_msgSend( (id)objc_msgSend(a2, "itemProvider"),  "observeEndOfWriteAtLocation:forAccessClaim:",  a2,  *(void *)(a1 + 32));
  }
  return result;
}

void *__36__NSFileMultipleAccessClaim_granted__block_invoke_409(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void v4[6] = *MEMORY[0x1895F89C0];
  uint64_t result = *(void **)(a1 + 32);
  if ((*(void *)(result[27] + 8 * a3) & 8) != 0)
  {
    v4[0] = MEMORY[0x1895F87A8];
    v4[1] = 3221225472LL;
    v4[2] = __36__NSFileMultipleAccessClaim_granted__block_invoke_2_410;
    v4[3] = &unk_189CA3E38;
    v4[4] = result;
    v4[5] = a3;
    return (void *)[result prepareItemForUploadingFromURL:a2 thenContinue:v4];
  }

  return result;
}

uint64_t __36__NSFileMultipleAccessClaim_granted__block_invoke_2_410(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1895F89C0];
  if (a2)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 224LL) + *(void *)(a1 + 40)) = 1;
    return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 208), "replaceObjectAtIndex:withObject:");
  }

  else
  {
    uint64_t v6 = (os_log_s *)_NSFCClaimsLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = [*(id *)(a1 + 32) claimID];
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      uint64_t v11 = a3;
      _os_log_error_impl( &dword_182EB1000,  v6,  OS_LOG_TYPE_ERROR,  "Claim %{public}@ failed during preparing for uploading due to error: %@",  (uint8_t *)&v8,  0x16u);
    }

    return [*(id *)(a1 + 32) setClaimerError:a3];
  }

- (void)resolveURLsThenMaybeContinueInvokingClaimer:(id)a3
{
  v11[5] = *MEMORY[0x1895F89C0];
  if (-[NSFileAccessClaim didWait](self, "didWait"))
  {
    readingLocations = self->_readingLocations;
    uint64_t v6 = MEMORY[0x1895F87A8];
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke;
    v11[3] = &unk_189CA3C80;
    v11[4] = self;
    -[NSMutableArray enumerateObjectsUsingBlock:](readingLocations, "enumerateObjectsUsingBlock:", v11);
    writingLocations = self->_writingLocations;
    v10[0] = v6;
    v10[1] = 3221225472LL;
    v10[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_2;
    v10[3] = &unk_189CA3C80;
    v10[4] = self;
    -[NSMutableArray enumerateObjectsUsingBlock:](writingLocations, "enumerateObjectsUsingBlock:", v10);
  }

  if (-[NSFileAccessClaim claimerError](self, "claimerError"))
  {
    (*((void (**)(id, void, void))a3 + 2))(a3, 0LL, 0LL);
  }

  else
  {
    void v8[5] = a3;
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_3;
    v9[3] = &unk_189CA3B18;
    v9[4] = self;
    v8[0] = MEMORY[0x1895F87A8];
    v8[1] = 3221225472LL;
    v8[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_6;
    v8[3] = &unk_189C9FF78;
    v8[4] = self;
    __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_3( (uint64_t)v9,  (uint64_t)v8);
  }

uint64_t __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke( uint64_t a1,  void *a2,  uint64_t a3)
{
  uint64_t result = [a2 standardizedURL];
  if (result) {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 208) replaceObjectAtIndex:a3 withObject:result];
  }
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 224LL) + a3) = 1;
  return result;
}

uint64_t __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_2( uint64_t a1,  void *a2,  uint64_t a3)
{
  uint64_t result = [a2 standardizedURL];
  if (result) {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 232) replaceObjectAtIndex:a3 withObject:result];
  }
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 248LL) + a3) = 1;
  return result;
}

void __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_3( uint64_t a1,  uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  uint64_t v7 = 0LL;
  int v8 = &v7;
  uint64_t v9 = 0x2020000000LL;
  char v10 = 0;
  uint64_t v3 = *(void *)(a1 + 32);
  if (!*(void *)(v3 + 272)) {
    goto LABEL_3;
  }
  id v5 = (id)[*(id *)(v3 + 208) copy];
  v6[0] = MEMORY[0x1895F87A8];
  v6[1] = 3221225472LL;
  v6[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_4;
  v6[3] = &unk_189CA3E88;
  v6[4] = *(void *)(a1 + 32);
  v6[5] = &v7;
  [v5 enumerateObjectsUsingBlock:v6];
  if (!*((_BYTE *)v8 + 24)) {
LABEL_3:
  }
    (*(void (**)(uint64_t))(a2 + 16))(a2);
  _Block_object_dispose(&v7, 8);
}

void *__73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_4( uint64_t a1,  uint64_t a2,  uint64_t a3,  _BYTE *a4)
{
  v7[6] = *MEMORY[0x1895F89C0];
  uint64_t result = *(void **)(a1 + 32);
  if (result[35] == a3)
  {
    if ((*(void *)(result[27] + 8 * a3) & 2) != 0)
    {
      v7[0] = MEMORY[0x1895F87A8];
      v7[1] = 3221225472LL;
      v7[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_5;
      v7[3] = &unk_189CA3E60;
      void v7[4] = result;
      v7[5] = a3;
      uint64_t result = (void *)[result checkIfSymbolicLinkAtURL:a2 withResolutionCount:result + 36 andIfSoThenReevaluateSelf:v7];
      *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = (_BYTE)result;
      if (*(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL))
      {
        *a4 = 1;
      }

      else
      {
        ++*(void *)(*(void *)(a1 + 32) + 280LL);
        *(void *)(*(void *)(a1 + 32) + 288LL) = 0LL;
      }
    }

    else
    {
      result[35] = a3 + 1;
    }
  }

  return result;
}

uint64_t __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_5( uint64_t a1,  uint64_t a2)
{
  *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 224LL) + *(void *)(a1 + 40)) = 1;
  return [*(id *)(a1 + 32) evaluateSelfWithRootNode:*(void *)(*(void *)(a1 + 32) + 272) checkSubarbitrability:0];
}

void __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_6( uint64_t a1)
{
  v25[6] = *MEMORY[0x1895F89C0];
  v2 = (uint64_t *)(a1 + 32);
  uint64_t v3 = objc_msgSend( MEMORY[0x189603FA8],  "arrayWithCapacity:",  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 208), "count"));
  uint64_t v4 = objc_msgSend(MEMORY[0x189603FA8], "arrayWithCapacity:", objc_msgSend(*(id *)(*v2 + 232), "count"));
  uint64_t v5 = *v2;
  uint64_t v6 = *(void **)(*v2 + 208);
  uint64_t v7 = MEMORY[0x1895F87A8];
  v25[0] = MEMORY[0x1895F87A8];
  v25[1] = 3221225472LL;
  v25[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_7;
  void v25[3] = &unk_189CA3D98;
  v25[4] = v5;
  v25[5] = v3;
  [v6 enumerateObjectsUsingBlock:v25];
  uint64_t v8 = *v2;
  uint64_t v9 = *(void **)(*v2 + 232);
  v24[0] = v7;
  v24[1] = 3221225472LL;
  v24[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_8;
  v24[3] = &unk_189CA3D98;
  v24[4] = v8;
  v24[5] = v4;
  [v9 enumerateObjectsUsingBlock:v24];
  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000LL;
  uint64_t v10 = [*(id *)(*v2 + 256) count];
  uint64_t v23 = [*(id *)(*v2 + 264) count] + v10;
  v19[0] = v7;
  v19[1] = 3221225472LL;
  v19[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_9;
  v19[3] = &unk_189CA3EB0;
  uint64_t v11 = *(void *)(a1 + 40);
  v19[6] = v11;
  v19[7] = &v20;
  v19[4] = v3;
  void v19[5] = v4;
  if (v21[3])
  {
    uint64_t v12 = [*(id *)(a1 + 32) purposeID];
    uint64_t v13 = *(void *)(a1 + 32);
    unsigned __int8 v14 = *(void **)(v13 + 256);
    v18[0] = v7;
    v18[1] = 3221225472LL;
    v18[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_10;
    v18[3] = &unk_189CA3F00;
    v18[4] = v13;
    void v18[5] = v12;
    v18[6] = v3;
    v18[7] = v19;
    [v14 enumerateObjectsUsingBlock:v18];
    uint64_t v15 = *(void *)(a1 + 32);
    __int128 v16 = *(void **)(v15 + 264);
    v17[0] = v7;
    v17[1] = 3221225472LL;
    v17[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_12;
    v17[3] = &unk_189CA3F00;
    v17[4] = v15;
    void v17[5] = v12;
    v17[6] = v4;
    v17[7] = v19;
    [v16 enumerateObjectsUsingBlock:v17];
  }

  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v11, v3, v4);
  }

  _Block_object_dispose(&v20, 8);
}

uint64_t __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_7( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 40);
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 224LL) + a3)) {
    a2 = [MEMORY[0x189603FE8] null];
  }
  return [v3 addObject:a2];
}

uint64_t __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_8( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 40);
  if (!*(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 248LL) + a3)) {
    a2 = [MEMORY[0x189603FE8] null];
  }
  return [v3 addObject:a2];
}

void *__73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_9( void *result)
{
  uint64_t v1 = *(void *)(result[7] + 8LL);
  uint64_t v2 = *(void *)(v1 + 24) - 1LL;
  *(void *)(v1 + 24) = v2;
  if (!v2) {
    return (void *)(*(uint64_t (**)(void, void, void))(result[6] + 16LL))( result[6],  result[4],  result[5]);
  }
  return result;
}

uint64_t __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_10( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(v4[27] + 8 * a3);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_11;
  v7[3] = &unk_189CA3ED8;
  uint64_t v9 = a3;
  __int128 v8 = *(_OWORD *)(a1 + 48);
  return [v4 makeProviderOfItemAtLocation:a2 provideOrAttachPhysicalURLIfNecessaryForPurposeID:v3 readingOptions:v5 thenContinue:v7];
}

uint64_t __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_11( uint64_t a1,  uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) replaceObjectAtIndex:*(void *)(a1 + 48) withObject:a2];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_12( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(v4[30] + 8 * a3);
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_13;
  v7[3] = &unk_189CA3ED8;
  uint64_t v9 = a3;
  __int128 v8 = *(_OWORD *)(a1 + 48);
  return [v4 makeProviderOfItemAtLocation:a2 provideOrAttachPhysicalURLIfNecessaryForPurposeID:v3 writingOptions:v5 thenContinue:v7];
}

uint64_t __73__NSFileMultipleAccessClaim_resolveURLsThenMaybeContinueInvokingClaimer___block_invoke_13( uint64_t a1,  uint64_t a2)
{
  if (a2) {
    [*(id *)(a1 + 32) replaceObjectAtIndex:*(void *)(a1 + 48) withObject:a2];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)invokeClaimer
{
  v2[5] = *MEMORY[0x1895F89C0];
  v2[0] = MEMORY[0x1895F87A8];
  v2[1] = 3221225472LL;
  v2[2] = __42__NSFileMultipleAccessClaim_invokeClaimer__block_invoke;
  v2[3] = &unk_189CA3F28;
  v2[4] = self;
  -[NSFileMultipleAccessClaim resolveURLsThenMaybeContinueInvokingClaimer:]( self,  "resolveURLsThenMaybeContinueInvokingClaimer:",  v2);
}

id __42__NSFileMultipleAccessClaim_invokeClaimer__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1895F89C0];
  uint64_t v6 = *(void **)(a1 + 32);
  if (v6[20])
  {
    uint64_t v7 = atomic_load(&_NSFCSubarbitrationCount);
    if (v7 < 1
      || (unsigned __int8 v17 = atomic_load(_NSFCDisableLogSuppression), (v17 & 1) != 0)
      || (uint64_t v18 = atomic_load(&_NSFCSubarbitratedClaimCount), v18 <= 99))
    {
      __int128 v8 = (os_log_s *)_NSFCClaimsLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = [*(id *)(a1 + 32) claimID];
        *(_DWORD *)buf = 138543362;
        uint64_t v23 = v9;
        _os_log_impl(&dword_182EB1000, v8, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ invoked in client", buf, 0xCu);
      }
    }

    (*(void (**)(void, void, void *, void *, void, uint64_t))(*(void *)(*(void *)(a1 + 32) + 160LL)
                                                                            + 16))( *(void *)(*(void *)(a1 + 32) + 160),  *(void *)(a1 + 32),  a2,  a3,  *(void *)(*(void *)(a1 + 32) + 176),  [*(id *)(a1 + 32) claimerError]);

    *(void *)(*(void *)(a1 + 32) + 160LL) = 0LL;
    uint64_t v6 = *(void **)(a1 + 32);
  }

  if (v6[21])
  {
    uint64_t v10 = atomic_load(&_NSFCSubarbitrationCount);
    if (v10 < 1
      || (unsigned __int8 v19 = atomic_load(_NSFCDisableLogSuppression), (v19 & 1) != 0)
      || (uint64_t v20 = atomic_load(&_NSFCSubarbitratedClaimCount), v20 <= 99))
    {
      uint64_t v11 = (os_log_s *)_NSFCClaimsLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = [*(id *)(a1 + 32) claimID];
        *(_DWORD *)buf = 138543362;
        uint64_t v23 = v12;
        _os_log_impl(&dword_182EB1000, v11, OS_LOG_TYPE_DEFAULT, "Claim %{public}@ invoked in server", buf, 0xCu);
      }
    }

    uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 168LL);
    unsigned __int8 v14 = pairsForURLs(a2);
    uint64_t v15 = pairsForURLs(a3);
    (*(void (**)(uint64_t, void *, void *, void, uint64_t, uint64_t))(v13 + 16))( v13,  v14,  v15,  *(void *)(*(void *)(a1 + 32) + 176),  [*(id *)(a1 + 32) shouldEnableMaterializationDuringAccessorBlock],  objc_msgSend(*(id *)(a1 + 32), "claimerError"));

    *(void *)(*(void *)(a1 + 32) + 168LL) = 0LL;
    uint64_t v6 = *(void **)(a1 + 32);
  }

  v21.receiver = v6;
  v21.super_class = (Class)&OBJC_CLASS___NSFileMultipleAccessClaim;
  return objc_msgSendSuper2(&v21, sel_invokeClaimer);
}

- (void)devalueSelf
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  __int128 v45 = 0u;
  __int128 v46 = 0u;
  __int128 v47 = 0u;
  __int128 v48 = 0u;
  readingLocations = self->_readingLocations;
  uint64_t v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( readingLocations,  "countByEnumeratingWithState:objects:count:",  &v45,  v44,  16LL);
  uint64_t v5 = MEMORY[0x1895F87A8];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v46;
    do
    {
      for (uint64_t i = 0LL; i != v6; ++i)
      {
        if (*(void *)v46 != v7) {
          objc_enumerationMutation(readingLocations);
        }
        uint64_t v9 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        v28[0] = v5;
        v28[1] = 3221225472LL;
        v28[2] = __40__NSFileMultipleAccessClaim_devalueSelf__block_invoke;
        v28[3] = &unk_189CA3A78;
        v28[4] = self;
        [v9 forEachRelevantAccessClaimPerformProcedure:v28];
      }

      uint64_t v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( readingLocations,  "countByEnumeratingWithState:objects:count:",  &v45,  v44,  16LL);
    }

    while (v6);
  }

  __int128 v42 = 0u;
  __int128 v43 = 0u;
  __int128 v40 = 0u;
  __int128 v41 = 0u;
  writingLocations = self->_writingLocations;
  uint64_t v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( writingLocations,  "countByEnumeratingWithState:objects:count:",  &v40,  v39,  16LL);
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v41;
    do
    {
      for (uint64_t j = 0LL; j != v12; ++j)
      {
        if (*(void *)v41 != v13) {
          objc_enumerationMutation(writingLocations);
        }
        uint64_t v15 = *(void **)(*((void *)&v40 + 1) + 8 * j);
        v27[0] = v5;
        v27[1] = 3221225472LL;
        v27[2] = __40__NSFileMultipleAccessClaim_devalueSelf__block_invoke_2;
        v27[3] = &unk_189CA3A78;
        v27[4] = self;
        [v15 forEachRelevantAccessClaimPerformProcedure:v27];
      }

      uint64_t v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( writingLocations,  "countByEnumeratingWithState:objects:count:",  &v40,  v39,  16LL);
    }

    while (v12);
  }

  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v35 = 0u;
  __int128 v36 = 0u;
  __int128 v16 = self->_readingLocations;
  uint64_t v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v35,  v34,  16LL);
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v36;
    do
    {
      for (uint64_t k = 0LL; k != v18; ++k)
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(v16);
        }
        [*(id *)(*((void *)&v35 + 1) + 8 * k) removeAccessClaim:self];
      }

      uint64_t v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v16,  "countByEnumeratingWithState:objects:count:",  &v35,  v34,  16LL);
    }

    while (v18);
  }

  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v30 = 0u;
  __int128 v31 = 0u;
  objc_super v21 = self->_writingLocations;
  uint64_t v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v30,  v29,  16LL);
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v31;
    do
    {
      for (uint64_t m = 0LL; m != v23; ++m)
      {
        if (*(void *)v31 != v24) {
          objc_enumerationMutation(v21);
        }
        [*(id *)(*((void *)&v30 + 1) + 8 * m) removeAccessClaim:self];
      }

      uint64_t v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( v21,  "countByEnumeratingWithState:objects:count:",  &v30,  v29,  16LL);
    }

    while (v23);
  }

  self->_readingLocations = 0LL;
  self->_writingLocations = 0LL;
  v26.receiver = self;
  v26.super_class = (Class)&OBJC_CLASS___NSFileMultipleAccessClaim;
  -[NSFileAccessClaim devalueSelf](&v26, sel_devalueSelf);
}

uint64_t __40__NSFileMultipleAccessClaim_devalueSelf__block_invoke(uint64_t a1, void *a2)
{
  return [a2 devalueOldClaim:*(void *)(a1 + 32)];
}

uint64_t __40__NSFileMultipleAccessClaim_devalueSelf__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 devalueOldClaim:*(void *)(a1 + 32)];
}

- (void)itemAtLocation:(id)a3 wasReplacedByItemAtLocation:(id)a4
{
  v15[5] = *MEMORY[0x1895F89C0];
  writingLocations = self->_writingLocations;
  uint64_t v8 = MEMORY[0x1895F87A8];
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __72__NSFileMultipleAccessClaim_itemAtLocation_wasReplacedByItemAtLocation___block_invoke;
  v15[3] = &unk_189CA3F50;
  v15[4] = a3;
  uint64_t v9 = (void *)-[NSMutableArray indexesOfObjectsPassingTest:](writingLocations, "indexesOfObjectsPassingTest:", v15);
  readingLocations = self->_readingLocations;
  v14[0] = v8;
  v14[1] = 3221225472LL;
  v14[2] = __72__NSFileMultipleAccessClaim_itemAtLocation_wasReplacedByItemAtLocation___block_invoke_2;
  v14[3] = &unk_189CA3F50;
  v14[4] = a3;
  uint64_t v11 = (void *)-[NSMutableArray indexesOfObjectsPassingTest:](readingLocations, "indexesOfObjectsPassingTest:", v14);
  v13[0] = v8;
  v13[1] = 3221225472LL;
  v13[2] = __72__NSFileMultipleAccessClaim_itemAtLocation_wasReplacedByItemAtLocation___block_invoke_3;
  v13[3] = &unk_189CA3F78;
  v13[4] = a4;
  v13[5] = self;
  v13[6] = a3;
  [v9 enumerateIndexesUsingBlock:v13];
  v12[0] = v8;
  v12[1] = 3221225472LL;
  v12[2] = __72__NSFileMultipleAccessClaim_itemAtLocation_wasReplacedByItemAtLocation___block_invoke_4;
  v12[3] = &unk_189CA3F78;
  v12[4] = a4;
  v12[5] = self;
  v12[6] = a3;
  [v11 enumerateIndexesUsingBlock:v12];
}

BOOL __72__NSFileMultipleAccessClaim_itemAtLocation_wasReplacedByItemAtLocation___block_invoke( uint64_t a1,  uint64_t a2)
{
  return *(void *)(a1 + 32) == a2;
}

BOOL __72__NSFileMultipleAccessClaim_itemAtLocation_wasReplacedByItemAtLocation___block_invoke_2( uint64_t a1,  uint64_t a2)
{
  return *(void *)(a1 + 32) == a2;
}

uint64_t __72__NSFileMultipleAccessClaim_itemAtLocation_wasReplacedByItemAtLocation___block_invoke_3( uint64_t a1,  uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 40) + 264) replaceObjectAtIndex:a2 withObject:*(void *)(a1 + 32)];
}

uint64_t __72__NSFileMultipleAccessClaim_itemAtLocation_wasReplacedByItemAtLocation___block_invoke_4( uint64_t a1,  uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 40) + 256) replaceObjectAtIndex:a2 withObject:*(void *)(a1 + 32)];
}

- (BOOL)blocksClaim:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  uint64_t v12 = 0LL;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x2020000000LL;
  char v15 = 0;
  readingLocations = self->_readingLocations;
  uint64_t v6 = MEMORY[0x1895F87A8];
  v11[0] = MEMORY[0x1895F87A8];
  v11[1] = 3221225472LL;
  v11[2] = __41__NSFileMultipleAccessClaim_blocksClaim___block_invoke;
  v11[3] = &unk_189CA3FA0;
  v11[4] = a3;
  v11[5] = self;
  void v11[6] = &v12;
  -[NSMutableArray enumerateObjectsUsingBlock:](readingLocations, "enumerateObjectsUsingBlock:", v11);
  if (*((_BYTE *)v13 + 24))
  {
    BOOL v7 = 1;
  }

  else
  {
    writingLocations = self->_writingLocations;
    v10[0] = v6;
    v10[1] = 3221225472LL;
    v10[2] = __41__NSFileMultipleAccessClaim_blocksClaim___block_invoke_2;
    v10[3] = &unk_189CA3FA0;
    v10[4] = a3;
    void v10[5] = self;
    v10[6] = &v12;
    -[NSMutableArray enumerateObjectsUsingBlock:](writingLocations, "enumerateObjectsUsingBlock:", v10);
    BOOL v7 = *((_BYTE *)v13 + 24) != 0;
  }

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __41__NSFileMultipleAccessClaim_blocksClaim___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3,  _BYTE *a4)
{
  uint64_t result = [*(id *)(a1 + 32) isBlockedByReadingItemAtLocation:a2 options:*(void *)(*(void *)(*(void *)(a1 + 40) + 216) + 8 * a3)];
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
    *a4 = 1;
  }

  return result;
}

uint64_t __41__NSFileMultipleAccessClaim_blocksClaim___block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3,  _BYTE *a4)
{
  uint64_t result = [*(id *)(a1 + 32) isBlockedByWritingItemAtLocation:a2 options:*(void *)(*(void *)(*(void *)(a1 + 40) + 240) + 8 * a3)];
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
    *a4 = 1;
  }

  return result;
}

- (BOOL)shouldBeRevokedPriorToInvokingAccessor
{
  uint64_t v3 = -[NSMutableArray count](self->_readingURLs, "count");
  if (-[NSMutableArray count](self->_writingURLs, "count"))
  {
    LOBYTE(v4) = 0;
  }

  else if (v3)
  {
    readingOptions = self->_readingOptions;
    uint64_t v6 = v3 - 1;
    do
    {
      unint64_t v8 = *readingOptions++;
      char v7 = v8;
      BOOL v4 = (v8 >> 3) & 1;
      BOOL v10 = v6-- != 0;
    }

    while ((v7 & 8) != 0 && v10);
  }

  else
  {
    LOBYTE(v4) = 1;
  }

  return v4;
}

- (id)allURLs
{
  uint64_t v3 = (void *)[MEMORY[0x189603FA8] array];
  BOOL v4 = v3;
  if (self->_readingURLs) {
    objc_msgSend(v3, "addObjectsFromArray:");
  }
  if (self->_writingURLs) {
    objc_msgSend(v4, "addObjectsFromArray:");
  }
  return v4;
}

- (BOOL)shouldCancelInsteadOfWaiting
{
  unint64_t v3 = -[NSMutableArray count](self->_readingURLs, "count");
  if (v3)
  {
    readingOptions = self->_readingOptions;
    if ((*((_BYTE *)readingOptions + 2) & 8) != 0)
    {
      LOBYTE(v3) = 1;
    }

    else
    {
      uint64_t v5 = 1LL;
      do
      {
        unint64_t v6 = v5;
        if (v3 == v5) {
          break;
        }
        unint64_t v7 = readingOptions[v5++];
      }

      while ((v7 & 0x80000) == 0);
      LOBYTE(v3) = v6 < v3;
    }
  }

  return v3;
}

- (void)protectFilesAgainstEviction
{
  v7[5] = *MEMORY[0x1895F89C0];
  readingURLs = self->_readingURLs;
  uint64_t v4 = MEMORY[0x1895F87A8];
  v7[0] = MEMORY[0x1895F87A8];
  v7[1] = 3221225472LL;
  v7[2] = __56__NSFileMultipleAccessClaim_protectFilesAgainstEviction__block_invoke;
  v7[3] = &unk_189CA3FC8;
  void v7[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](readingURLs, "enumerateObjectsUsingBlock:", v7);
  writingURLs = self->_writingURLs;
  v6[0] = v4;
  v6[1] = 3221225472LL;
  v6[2] = __56__NSFileMultipleAccessClaim_protectFilesAgainstEviction__block_invoke_2;
  v6[3] = &unk_189CA3FC8;
  v6[4] = self;
  -[NSMutableArray enumerateObjectsUsingBlock:](writingURLs, "enumerateObjectsUsingBlock:", v6);
}

uint64_t __56__NSFileMultipleAccessClaim_protectFilesAgainstEviction__block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  return [*(id *)(a1 + 32) _protectIfNecessaryFileAtURL:a2 withOptions:*(void *)(*(void *)(*(void *)(a1 + 32) + 216) + 8 * a3) forReading:1];
}

uint64_t __56__NSFileMultipleAccessClaim_protectFilesAgainstEviction__block_invoke_2( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  return [*(id *)(a1 + 32) _protectIfNecessaryFileAtURL:a2 withOptions:*(void *)(*(void *)(*(void *)(a1 + 32) + 240) + 8 * a3) forReading:0];
}

@end