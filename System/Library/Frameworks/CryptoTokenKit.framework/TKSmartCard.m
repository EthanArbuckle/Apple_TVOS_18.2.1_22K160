@interface TKSmartCard
+ (BOOL)decodeResponse:(id)a3 sw:(unsigned __int16 *)a4 appendTo:(id)a5 error:(id *)a6;
+ (id)_localizedString:(id)a3;
- (BOOL)beginSessionWithError:(id *)a3;
- (BOOL)checkAPDUResponse:(id)a3 error:(id *)a4;
- (BOOL)inSessionWithError:(NSError *)error executeBlock:(void *)block;
- (BOOL)revalidate;
- (BOOL)selectApplication:(id)a3 error:(id *)a4;
- (BOOL)sensitive;
- (BOOL)synchronous;
- (BOOL)useCommandChaining;
- (BOOL)useExtendedLength;
- (BOOL)valid;
- (NSData)sendIns:(UInt8)ins p1:(UInt8)p1 p2:(UInt8)p2 data:(NSData *)requestData le:(NSNumber *)le sw:(UInt16 *)sw error:(NSError *)error;
- (TKSmartCard)initWithSlot:(id)a3;
- (TKSmartCardProtocol)allowedProtocols;
- (TKSmartCardProtocol)currentProtocol;
- (TKSmartCardSlot)slot;
- (TKSmartCardUserInteractionForSecurePINChange)userInteractionForSecurePINChangeWithPINFormat:(TKSmartCardPINFormat *)PINFormat APDU:(NSData *)APDU currentPINByteOffset:(NSInteger)currentPINByteOffset newPINByteOffset:(NSInteger)newPINByteOffset;
- (TKSmartCardUserInteractionForSecurePINVerification)userInteractionForSecurePINVerificationWithPINFormat:(TKSmartCardPINFormat *)PINFormat APDU:(NSData *)APDU PINByteOffset:(NSInteger)PINByteOffset;
- (UInt8)cla;
- (id)buildIns:(unsigned __int8)a3 p1:(unsigned __int8)a4 p2:(unsigned __int8)a5 data:(id)a6 range:(_NSRange)a7 le:(id)a8 protocol:(unint64_t)a9 chained:(BOOL)a10 extended:(BOOL *)a11 realLe:(unint64_t *)a12;
- (id)context;
- (id)contextForKey:(id)a3;
- (id)remoteSessionWithErrorHandler:(id)a3;
- (int64_t)sessionEndPolicy;
- (void)beginSessionWithReply:(void *)reply;
- (void)dealloc;
- (void)encodeLength:(unint64_t)a3 into:(id)a4 sized:(int64_t)a5;
- (void)endSession;
- (void)endSessionWithReply:(id)a3;
- (void)handleApduResponse:(id)a3 body:(id)a4 le:(unint64_t)a5 isCase4:(BOOL)a6 error:(id)a7 reply:(id)a8;
- (void)inSlotQueueExecuteBlock:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)querySessionWithReply:(id)a3;
- (void)releaseSessionWithReply:(id)a3;
- (void)reserveExclusive:(BOOL)a3 reply:(id)a4;
- (void)sendIns:(UInt8)ins p1:(UInt8)p1 p2:(UInt8)p2 data:(NSData *)requestData le:(NSNumber *)le reply:(void *)reply;
- (void)sessionRequested;
- (void)setAllowedProtocols:(TKSmartCardProtocol)allowedProtocols;
- (void)setCla:(UInt8)cla;
- (void)setContext:(id)a3 forKey:(id)a4;
- (void)setContext:(id)context;
- (void)setCurrentProtocol:(unint64_t)a3;
- (void)setSensitive:(BOOL)sensitive;
- (void)setSessionEndPolicy:(int64_t)a3;
- (void)setSynchronous:(BOOL)a3;
- (void)setUseCommandChaining:(BOOL)useCommandChaining;
- (void)setUseExtendedLength:(BOOL)useExtendedLength;
- (void)setValid:(BOOL)a3;
- (void)transmitChunkedIns:(unsigned __int8)a3 p1:(unsigned __int8)a4 p2:(unsigned __int8)a5 data:(id)a6 fromOffset:(unint64_t)a7 realLe:(unint64_t)a8 chained:(BOOL)a9 isCase4:(BOOL)a10 reply:(id)a11;
- (void)transmitRequest:(NSData *)request reply:(void *)reply;
- (void)unreserve;
@end

@implementation TKSmartCard

+ (id)_localizedString:(id)a3
{
  v3 = (void *)MEMORY[0x1896077F8];
  id v4 = a3;
  [v3 bundleWithIdentifier:@"com.apple.CryptoTokenKit"];
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 localizedStringForKey:v4 value:&stru_189F8C1A8 table:0];
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (TKSmartCard)initWithSlot:(id)a3
{
  uint64_t v29 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)&OBJC_CLASS___TKSmartCard;
  v6 = -[TKSmartCard init](&v27, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_slot, a3);
    v7->_valid = 1;
    NSStringFromSelector(sel_state);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    [v5 addObserver:v7 forKeyPath:v8 options:1 context:0];

    TK_LOG_smartcard();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[TKSmartCard initWithSlot:].cold.1((uint64_t)v7);
    }

    v7->_allowedProtocols = 0LL;
    __int128 v23 = 0u;
    __int128 v24 = 0u;
    __int128 v25 = 0u;
    __int128 v26 = 0u;
    v10 = -[TKSmartCardSlot ATR](v7->_slot, "ATR", 0LL);
    [v10 protocols];
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v24;
      do
      {
        uint64_t v15 = 0LL;
        do
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          v7->_allowedProtocols |= [*(id *)(*((void *)&v23 + 1) + 8 * v15++) unsignedIntegerValue];
        }

        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }

      while (v13);
    }

    v7->_currentProtocol = 0LL;
    v7->_sensitive = 0;
    dispatch_queue_t v16 = dispatch_queue_create("beginSessionQueue", 0LL);
    beginSessionQueue = v7->_beginSessionQueue;
    v7->_beginSessionQueue = (OS_dispatch_queue *)v16;

    v18 = (dispatch_object_s *)v7->_beginSessionQueue;
    -[TKSmartCardSlot queue](v7->_slot, "queue");
    v19 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v18, v19);

    v20 = objc_alloc_init(MEMORY[0x189616338]);
    syncObject = v7->_syncObject;
    v7->_syncObject = v20;
  }

  return v7;
}

- (id)remoteSessionWithErrorHandler:(id)a3
{
  BOOL synchronous = self->_synchronous;
  id session = self->_session;
  if (synchronous) {
    [session synchronousRemoteObjectProxyWithErrorHandler:a3];
  }
  else {
    [session remoteObjectProxyWithErrorHandler:a3];
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (self->_valid)
  {
    NSStringFromSelector(sel_state);
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    int v13 = [v9 isEqualToString:v12];

    if (v13)
    {
      [v11 objectForKey:*MEMORY[0x1896075B8]];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = [v14 integerValue];

      if (v15 != 2 && v15 != 4)
      {
        TK_LOG_smartcard();
        v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          -[TKSmartCard observeValueForKeyPath:ofObject:change:context:].cold.1();
        }

        -[TKSmartCard setContext:forKey:](self, "setContext:forKey:", 0LL, 0LL);
        v18 = self->_syncObject;
        objc_sync_enter(v18);
        -[TKSmartCard setValid:](self, "setValid:", 0LL);
        -[TKSmartCard setCurrentProtocol:](self, "setCurrentProtocol:", 0LL);
        objc_sync_exit(v18);
      }
    }
  }
}

- (void)setSensitive:(BOOL)sensitive
{
  self->_sensitive = sensitive;
}

- (BOOL)sensitive
{
  return self->_sensitive;
}

- (void)setSynchronous:(BOOL)a3
{
  self->_BOOL synchronous = a3;
}

- (BOOL)synchronous
{
  return self->_synchronous;
}

- (void)releaseSessionWithReply:(id)a3
{
  id v4 = a3;
  TK_LOG_smartcard();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[TKSmartCard releaseSessionWithReply:].cold.1();
  }

  -[TKSmartCard setContext:forKey:](self, "setContext:forKey:", 0LL, 0LL);
  if (self->_sensitiveRequired)
  {
    -[TKSmartCard setSessionEndPolicy:](self, "setSessionEndPolicy:", 1LL);
    self->_sensitiveRequired = 0;
  }

  uint64_t v6 = MEMORY[0x1895F87A8];
  v17[0] = MEMORY[0x1895F87A8];
  v17[1] = 3221225472LL;
  v17[2] = __39__TKSmartCard_releaseSessionWithReply___block_invoke;
  v17[3] = &unk_189F8A5B0;
  v17[4] = self;
  id v18 = v4;
  id v7 = v4;
  v8 = (void *)MEMORY[0x18959C69C](v17);
  dispatch_suspend((dispatch_object_t)self->_beginSessionQueue);
  v15[0] = v6;
  v15[1] = 3221225472LL;
  v15[2] = __39__TKSmartCard_releaseSessionWithReply___block_invoke_2_200;
  v15[3] = &unk_189F8A488;
  id v9 = v8;
  id v16 = v9;
  -[TKSmartCard remoteSessionWithErrorHandler:](self, "remoteSessionWithErrorHandler:", v15);
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472LL;
  v13[2] = __39__TKSmartCard_releaseSessionWithReply___block_invoke_3_201;
  v13[3] = &unk_189F8A588;
  id v14 = v9;
  id v11 = v9;
  [v10 terminateWithReply:v13];

  id session = self->_session;
  self->_id session = 0LL;
}

void __39__TKSmartCard_releaseSessionWithReply___block_invoke(uint64_t a1)
{
  v2 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __39__TKSmartCard_releaseSessionWithReply___block_invoke_2;
  v4[3] = &unk_189F8A5B0;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

void __39__TKSmartCard_releaseSessionWithReply___block_invoke_2(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 cards];
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 removeObject:*(void *)(a1 + 32)];

  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16LL));
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void **)(v4 + 8);
  uint64_t v7 = MEMORY[0x1895F87A8];
  uint64_t v8 = *(unsigned __int8 *)(v4 + 26);
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __39__TKSmartCard_releaseSessionWithReply___block_invoke_3;
  v12[3] = &unk_189F8A560;
  v12[4] = v4;
  id v13 = v5;
  [v6 synchronous:v8 remoteSlotWithErrorHandler:v12];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  v10[1] = 3221225472LL;
  v10[2] = __39__TKSmartCard_releaseSessionWithReply___block_invoke_199;
  v10[3] = &unk_189F8A588;
  id v11 = *(id *)(a1 + 40);
  [v9 waitForStateFlushedWithReply:v10];
}

void __39__TKSmartCard_releaseSessionWithReply___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  TK_LOG_smartcard();
  uint64_t v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __39__TKSmartCard_releaseSessionWithReply___block_invoke_3_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t __39__TKSmartCard_releaseSessionWithReply___block_invoke_199(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __39__TKSmartCard_releaseSessionWithReply___block_invoke_2_200(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __39__TKSmartCard_releaseSessionWithReply___block_invoke_3_201(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)sessionRequested
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_186E58000, v0, v1, "%{public}@: got request for unused session, releasing it", v2);
  OUTLINED_FUNCTION_4();
}

- (void)inSlotQueueExecuteBlock:(id)a3
{
  if (self->_synchronous)
  {
    slot = self->_slot;
    id v4 = a3;
    -[TKSmartCardSlot queue](slot, "queue");
    uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    dispatch_sync(v6, v4);
  }

  else
  {
    id v5 = (void (*)(void))*((void *)a3 + 2);
    uint64_t v6 = (dispatch_queue_s *)a3;
    v5();
  }
}

- (void)querySessionWithReply:(id)a3
{
  v23[3] = *MEMORY[0x1895F89C0];
  id v4 = a3;
  unint64_t allowedProtocols = self->_allowedProtocols;
  self->_sessionEndPolicy = 0LL;
  self->_someoneWantsSession = 0;
  v22[0] = @"protocol";
  [MEMORY[0x189607968] numberWithUnsignedInteger:allowedProtocols];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v6;
  v22[1] = @"sensitive";
  [MEMORY[0x189607968] numberWithBool:self->_sensitive];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v7;
  v22[2] = @"endpolicy";
  [MEMORY[0x189607968] numberWithInteger:self->_sessionEndPolicy];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v8;
  [MEMORY[0x189603F68] dictionaryWithObjects:v23 forKeys:v22 count:3];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();

  TK_LOG_smartcard();
  id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[TKSmartCard querySessionWithReply:].cold.1();
  }

  uint64_t v11 = MEMORY[0x1895F87A8];
  v21[0] = MEMORY[0x1895F87A8];
  v21[1] = 3221225472LL;
  v21[2] = __37__TKSmartCard_querySessionWithReply___block_invoke;
  v21[3] = &unk_189F8A290;
  v21[4] = self;
  -[TKSmartCard inSlotQueueExecuteBlock:](self, "inSlotQueueExecuteBlock:", v21);
  slot = self->_slot;
  BOOL synchronous = self->_synchronous;
  v19[0] = v11;
  v19[1] = 3221225472LL;
  v19[2] = __37__TKSmartCard_querySessionWithReply___block_invoke_2;
  v19[3] = &unk_189F8A560;
  v19[4] = self;
  id v14 = v4;
  id v20 = v14;
  -[TKSmartCardSlot synchronous:remoteSlotWithErrorHandler:]( slot,  "synchronous:remoteSlotWithErrorHandler:",  synchronous,  v19);
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v11;
  v17[1] = 3221225472LL;
  v17[2] = __37__TKSmartCard_querySessionWithReply___block_invoke_2_207;
  v17[3] = &unk_189F8A660;
  v17[4] = self;
  id v18 = v14;
  id v16 = v14;
  [v15 sessionWithParameters:v9 reply:v17];
}

void __37__TKSmartCard_querySessionWithReply___block_invoke(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 cards];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 addObject:*(void *)(a1 + 32)];
}

void __37__TKSmartCard_querySessionWithReply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  TK_LOG_smartcard();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __37__TKSmartCard_querySessionWithReply___block_invoke_2_cold_1();
  }

  id v5 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1895F87A8];
  v8[1] = 3221225472LL;
  v8[2] = __37__TKSmartCard_querySessionWithReply___block_invoke_205;
  v8[3] = &unk_189F8A290;
  v8[4] = v5;
  [v5 inSlotQueueExecuteBlock:v8];
  uint64_t v6 = *(void *)(a1 + 40);
  [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-7 userInfo:0];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0LL, v7);
}

void __37__TKSmartCard_querySessionWithReply___block_invoke_205(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 cards];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 removeObject:*(void *)(a1 + 32)];
}

void __37__TKSmartCard_querySessionWithReply___block_invoke_2_207(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7)
  {
    uint64_t v10 = MEMORY[0x1895F87A8];
    uint64_t v11 = *(void **)(a1 + 32);
    v23[0] = MEMORY[0x1895F87A8];
    v23[1] = 3221225472LL;
    v23[2] = __37__TKSmartCard_querySessionWithReply___block_invoke_2_209;
    v23[3] = &unk_189F8A638;
    void v23[4] = v11;
    id v24 = v7;
    id v25 = v8;
    [v11 inSlotQueueExecuteBlock:v23];
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(void **)(a1 + 40);
    id v14 = *(void **)(v12 + 8);
    uint64_t v15 = *(unsigned __int8 *)(v12 + 26);
    v21[0] = v10;
    v21[1] = 3221225472LL;
    v21[2] = __37__TKSmartCard_querySessionWithReply___block_invoke_2_213;
    v21[3] = &unk_189F8A560;
    v21[4] = v12;
    id v22 = v13;
    [v14 synchronous:v15 remoteSlotWithErrorHandler:v21];
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v10;
    v19[1] = 3221225472LL;
    v19[2] = __37__TKSmartCard_querySessionWithReply___block_invoke_214;
    v19[3] = &unk_189F8A588;
    id v20 = *(id *)(a1 + 40);
    [v16 waitForStateFlushedWithReply:v19];
  }

  else
  {
    TK_LOG_smartcard();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      __37__TKSmartCard_querySessionWithReply___block_invoke_2_207_cold_1(a1, v17);
    }

    id v18 = *(void **)(a1 + 32);
    v26[0] = MEMORY[0x1895F87A8];
    v26[1] = 3221225472LL;
    v26[2] = __37__TKSmartCard_querySessionWithReply___block_invoke_208;
    v26[3] = &unk_189F8A290;
    v26[4] = v18;
    [v18 inSlotQueueExecuteBlock:v26];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }
}

void __37__TKSmartCard_querySessionWithReply___block_invoke_208(uint64_t a1)
{
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v3 cards];
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 removeObject:*(void *)(a1 + 32)];
}

void __37__TKSmartCard_querySessionWithReply___block_invoke_2_209(uint64_t a1)
{
  uint64_t v1 = a1 + 40;
  v2 = (id *)(a1 + 32);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32LL), *(id *)(a1 + 40));
  [*(id *)(v1 + 8) objectForKey:@"protocol"];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  *((void *)*v2 + 14) = [v3 unsignedIntegerValue];

  ++*((void *)*v2 + 5);
  TK_LOG_smartcard();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __37__TKSmartCard_querySessionWithReply___block_invoke_2_209_cold_1();
  }

  [*((id *)*v2 + 1) ATR];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 historicalRecords];
  uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v7 = [v6 indexOfObjectPassingTest:&__block_literal_global_212];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = 0LL;
  }

  else
  {
    [v6 objectAtIndexedSubscript:v7];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  [v8 value];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 length];

  if (v10 != 3)
  {
    BOOL v13 = 0LL;
LABEL_11:
    uint64_t v14 = 0LL;
    goto LABEL_12;
  }

  id v11 = [v8 value];
  uint64_t v12 = [v11 bytes];

  BOOL v13 = *(char *)(v12 + 2) < 0;
  if (*((void *)*v2 + 14) != 2 || [*((id *)*v2 + 1) maxInputLength] < 262) {
    goto LABEL_11;
  }
  uint64_t v14 = (*(unsigned __int8 *)(v12 + 2) >> 6) & 1;
LABEL_12:
  [*v2 setUseExtendedLength:v14];
  [*v2 setUseCommandChaining:v13];
}

BOOL __37__TKSmartCard_querySessionWithReply___block_invoke_210(uint64_t a1, void *a2)
{
  return [a2 tag] == 7;
}

void __37__TKSmartCard_querySessionWithReply___block_invoke_2_213(uint64_t a1, void *a2)
{
  id v3 = a2;
  TK_LOG_smartcard();
  id v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __39__TKSmartCard_releaseSessionWithReply___block_invoke_3_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

uint64_t __37__TKSmartCard_querySessionWithReply___block_invoke_214(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)beginSessionWithReply:(void *)reply
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v4 = reply;
  TK_LOG_smartcard();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[TKSmartCard beginSessionWithReply:].cold.1(self, v5);
  }

  if (-[TKSmartCard valid](self, "valid"))
  {
    beginSessionQueue = self->_beginSessionQueue;
    v11[0] = MEMORY[0x1895F87A8];
    v11[1] = 3221225472LL;
    v11[2] = __37__TKSmartCard_beginSessionWithReply___block_invoke;
    v11[3] = &unk_189F8A5B0;
    v11[4] = self;
    id v12 = v4;
    dispatch_async((dispatch_queue_t)beginSessionQueue, v11);
  }

  else
  {
    TK_LOG_smartcard();
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      -[TKSmartCard slot](self, "slot");
      id v8 = (void *)objc_claimAutoreleasedReturnValue();
      [v8 name];
      id v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      uint64_t v14 = v9;
      _os_log_impl( &dword_186E58000,  v7,  OS_LOG_TYPE_INFO,  "%{public}@: an attempt to begin session with invalidated (removed) card",  buf,  0xCu);
    }

    [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-7 userInfo:0];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void, void *))v4 + 2))(v4, 0LL, v10);
  }
}

void __37__TKSmartCard_beginSessionWithReply___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 32))
  {
    ++*(void *)(v2 + 40);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
  }

  else
  {
    dispatch_suspend(*(dispatch_object_t *)(v2 + 16));
    v4[0] = MEMORY[0x1895F87A8];
    v4[1] = 3221225472LL;
    v4[2] = __37__TKSmartCard_beginSessionWithReply___block_invoke_2;
    v4[3] = &unk_189F8A200;
    id v3 = *(void **)(a1 + 40);
    id v5 = *(id *)(a1 + 32);
    id v6 = v3;
    [v5 querySessionWithReply:v4];
  }

void __37__TKSmartCard_beginSessionWithReply___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(dispatch_object_s **)(*(void *)(a1 + 32) + 16LL);
  id v5 = a3;
  dispatch_resume(v4);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (BOOL)beginSessionWithError:(id *)a3
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  uint64_t v24 = 0LL;
  id v25 = &v24;
  uint64_t v26 = 0x2020000000LL;
  char v27 = 1;
  uint64_t v18 = 0LL;
  v19 = &v18;
  uint64_t v20 = 0x3032000000LL;
  v21 = __Block_byref_object_copy__0;
  id v22 = __Block_byref_object_dispose__0;
  id v23 = 0LL;
  TK_LOG_smartcard();
  id v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    -[TKSmartCard slot](self, "slot");
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 name];
    uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKSmartCard beginSessionWithError:].cold.1(v7, (uint64_t)v31, v5, v6);
  }

  if (-[TKSmartCard valid](self, "valid"))
  {
    *(void *)&__int128 buf = 0LL;
    *((void *)&buf + 1) = &buf;
    uint64_t v29 = 0x2020000000LL;
    char v30 = 0;
    beginSessionQueue = self->_beginSessionQueue;
    uint64_t v9 = MEMORY[0x1895F87A8];
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __37__TKSmartCard_beginSessionWithError___block_invoke;
    block[3] = &unk_189F8A3C0;
    block[4] = self;
    block[5] = &buf;
    dispatch_sync((dispatch_queue_t)beginSessionQueue, block);
    if (*(_BYTE *)(*((void *)&buf + 1) + 24LL))
    {
      self->_BOOL synchronous = 1;
      v16[0] = v9;
      v16[1] = 3221225472LL;
      v16[2] = __37__TKSmartCard_beginSessionWithError___block_invoke_2;
      v16[3] = &unk_189F8A688;
      v16[4] = self;
      v16[5] = &v24;
      v16[6] = &v18;
      -[TKSmartCard querySessionWithReply:](self, "querySessionWithReply:", v16);
      self->_BOOL synchronous = 0;
    }

    int v10 = *((unsigned __int8 *)v25 + 24);
    if (a3 && !*((_BYTE *)v25 + 24))
    {
      *a3 = (id) v19[5];
      int v10 = *((unsigned __int8 *)v25 + 24);
    }

    BOOL v11 = v10 != 0;
    _Block_object_dispose(&buf, 8);
  }

  else
  {
    TK_LOG_smartcard();
    id v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      -[TKSmartCard slot](self, "slot");
      BOOL v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 name];
      uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v14;
      _os_log_impl( &dword_186E58000,  v12,  OS_LOG_TYPE_INFO,  "%{public}@: an attempt to begin session with invalidated (removed) card",  (uint8_t *)&buf,  0xCu);
    }

    if (a3)
    {
      [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-7 userInfo:0];
      BOOL v11 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      BOOL v11 = 0;
    }
  }

  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v11;
}

void __37__TKSmartCard_beginSessionWithError___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 32))
  {
    ++*(void *)(v1 + 40);
  }

  else
  {
    dispatch_suspend(*(dispatch_object_t *)(v1 + 16));
    *(_BYTE *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 24LL) = 1;
  }

void __37__TKSmartCard_beginSessionWithError___block_invoke_2(void *a1, char a2, void *a3)
{
  id v6 = a3;
  dispatch_resume(*(dispatch_object_t *)(a1[4] + 16LL));
  *(_BYTE *)(*(void *)(a1[5] + 8LL) + 24LL) = a2;
  if ((a2 & 1) == 0) {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8LL) + 40LL), a3);
  }
}

- (BOOL)inSessionWithError:(NSError *)error executeBlock:(void *)block
{
  id v6 = block;
  if (-[TKSmartCard beginSessionWithError:](self, "beginSessionWithError:", error))
  {
    char v7 = v6[2](v6, error);
    -[TKSmartCard endSession](self, "endSession");
  }

  else
  {
    char v7 = 0;
  }

  return v7;
}

- (int64_t)sessionEndPolicy
{
  return 0LL;
}

- (void)setSessionEndPolicy:(int64_t)a3
{
  self->_sessionEndPolicy = a3;
  id session = self->_session;
  if (session) {
    objc_msgSend(session, "setEndPolicy:");
  }
}

- (void)endSessionWithReply:(id)a3
{
  id v5 = a3;
  TK_LOG_smartcard();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[TKSmartCard endSessionWithReply:].cold.1();
  }

  beginSessionQueue = self->_beginSessionQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __35__TKSmartCard_endSessionWithReply___block_invoke;
  block[3] = &unk_189F8A6B0;
  id v10 = v5;
  SEL v11 = a2;
  block[4] = self;
  id v8 = v5;
  dispatch_async((dispatch_queue_t)beginSessionQueue, block);
}

uint64_t __35__TKSmartCard_endSessionWithReply___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (*(_BYTE *)(v2 + 25)) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = *(_BYTE *)(v2 + 24) != 0;
  }
  *(_BYTE *)(v2 + 25) = v3;
  uint64_t v4 = a1[4];
  if (!*(void *)(v4 + 32) || (uint64_t v5 = *(void *)(v4 + 40), v5 <= 0))
  {
    [MEMORY[0x1896077D8] currentHandler];
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 handleFailureInMethod:a1[6] object:a1[4] file:@"TKSmartCard.m" lineNumber:794 description:@"bad endSession"];

    uint64_t v4 = a1[4];
    uint64_t v5 = *(void *)(v4 + 40);
  }

  uint64_t v6 = v5 - 1;
  *(void *)(v4 + 40) = v6;
  if (!v6 && ((uint64_t v8 = a1[4], *(_BYTE *)(v8 + 48)) || *(void *)(v8 + 56))) {
    return [(id)v8 releaseSessionWithReply:a1[5]];
  }
  else {
    return (*(uint64_t (**)(void))(a1[5] + 16LL))();
  }
}

- (void)endSession
{
}

- (void)transmitRequest:(NSData *)request reply:(void *)reply
{
  uint64_t v6 = request;
  char v7 = reply;
  if (-[TKSmartCard valid](self, "valid"))
  {
    if (!self->_sessionCounter)
    {
      TK_LOG_smartcard();
      uint64_t v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[TKSmartCard transmitRequest:reply:].cold.2(self, v8);
      }

      [MEMORY[0x189603F70] raise:*MEMORY[0x189603A58] format:@"attempt to transmitRequest out of card session"];
    }

    TK_LOG_smartcard();
    uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[TKSmartCard transmitRequest:reply:].cold.1();
    }

    uint64_t v10 = MEMORY[0x1895F87A8];
    v17[0] = MEMORY[0x1895F87A8];
    v17[1] = 3221225472LL;
    v17[2] = __37__TKSmartCard_transmitRequest_reply___block_invoke;
    v17[3] = &unk_189F8A560;
    v17[4] = self;
    id v11 = v7;
    id v18 = v11;
    -[TKSmartCard remoteSessionWithErrorHandler:](self, "remoteSessionWithErrorHandler:", v17);
    id v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    v15[1] = 3221225472LL;
    v15[2] = __37__TKSmartCard_transmitRequest_reply___block_invoke_226;
    v15[3] = &unk_189F8A6F8;
    void v15[4] = self;
    id v16 = v11;
    [v12 transmit:v6 reply:v15];
  }

  else
  {
    TK_LOG_smartcard();
    BOOL v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[TKSmartCard transmitRequest:reply:].cold.3(self, v13);
    }

    [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-7 userInfo:0];
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void, void *))v7 + 2))(v7, 0LL, v14);
  }
}

void __37__TKSmartCard_transmitRequest_reply___block_invoke(uint64_t a1)
{
  uint64_t v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __37__TKSmartCard_transmitRequest_reply___block_invoke_cold_1(a1, v2);
  }

  uint64_t v3 = *(void *)(a1 + 40);
  [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-7 userInfo:0];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0LL, v4);
}

void __37__TKSmartCard_transmitRequest_reply___block_invoke_226(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v5 = a2;
  id v6 = a3;
  TK_LOG_smartcard();
  char v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138543874;
    uint64_t v10 = v8;
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_debug_impl( &dword_186E58000,  v7,  OS_LOG_TYPE_DEBUG,  "%{public}@: transmitRequest got reply %@ (err=%{public}@)",  (uint8_t *)&v9,  0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (id)context
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKSmartCard contextForKey:](self, "contextForKey:", v3);
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setContext:(id)context
{
  uint64_t v4 = (void *)MEMORY[0x189603FE8];
  id v5 = context;
  [v4 null];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  -[TKSmartCard setContext:forKey:](self, "setContext:forKey:", v5, v6);
}

- (id)contextForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_contexts, "objectForKey:", a3);
}

- (void)setContext:(id)a3 forKey:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  if (!v6)
  {
    NSStringFromSelector(sel_context);
    __int16 v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKSmartCard willChangeValueForKey:](self, "willChangeValueForKey:", v13);

    contexts = self->_contexts;
    self->_contexts = 0LL;

    goto LABEL_10;
  }

  [MEMORY[0x189603FE8] null];
  char v7 = (void *)objc_claimAutoreleasedReturnValue();
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    NSStringFromSelector(sel_context);
    int v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKSmartCard willChangeValueForKey:](self, "willChangeValueForKey:", v9);
  }

  uint64_t v10 = self->_contexts;
  if (!v16 || v10)
  {
    if (!v16)
    {
      -[NSMutableDictionary removeObjectForKey:](v10, "removeObjectForKey:", v6);
      if (!v8) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }

  else
  {
    [MEMORY[0x189603FC8] dictionary];
    __int16 v11 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    id v12 = self->_contexts;
    self->_contexts = v11;

    uint64_t v10 = self->_contexts;
  }

  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v16, v6);
  if ((v8 & 1) != 0)
  {
LABEL_10:
    NSStringFromSelector(sel_context);
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKSmartCard didChangeValueForKey:](self, "didChangeValueForKey:", v15);
  }

- (TKSmartCardUserInteractionForSecurePINVerification)userInteractionForSecurePINVerificationWithPINFormat:(TKSmartCardPINFormat *)PINFormat APDU:(NSData *)APDU PINByteOffset:(NSInteger)PINByteOffset
{
  int v8 = PINFormat;
  int v9 = APDU;
  -[TKSmartCard slot](self, "slot");
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 slotParameters];
  __int16 v11 = (void *)objc_claimAutoreleasedReturnValue();
  int v12 = [v11 securePINVerificationSupported];

  if (v12)
  {
    __int16 v13 = objc_alloc_init(&OBJC_CLASS___TKSmartCardUserInteractionForSecurePINVerification);
    -[TKSmartCard slot](self, "slot");
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKSmartCardUserInteractionForSecurePINVerification setSlot:PINFormat:APDU:PINByteOffset:]( v13,  "setSlot:PINFormat:APDU:PINByteOffset:",  v14,  v8,  v9,  PINByteOffset);
  }

  else
  {
    __int16 v13 = 0LL;
  }

  return v13;
}

- (TKSmartCardUserInteractionForSecurePINChange)userInteractionForSecurePINChangeWithPINFormat:(TKSmartCardPINFormat *)PINFormat APDU:(NSData *)APDU currentPINByteOffset:(NSInteger)currentPINByteOffset newPINByteOffset:(NSInteger)newPINByteOffset
{
  uint64_t v10 = PINFormat;
  __int16 v11 = APDU;
  -[TKSmartCard slot](self, "slot");
  int v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 slotParameters];
  __int16 v13 = (void *)objc_claimAutoreleasedReturnValue();
  int v14 = [v13 securePINChangeSupported];

  if (v14)
  {
    uint64_t v15 = objc_alloc_init(&OBJC_CLASS___TKSmartCardUserInteractionForSecurePINChange);
    -[TKSmartCard slot](self, "slot");
    id v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[TKSmartCardUserInteractionForSecurePINChange setSlot:PINFormat:APDU:currentPINByteOffset:newPINByteOffset:]( v15,  "setSlot:PINFormat:APDU:currentPINByteOffset:newPINByteOffset:",  v16,  v10,  v11,  currentPINByteOffset,  newPINByteOffset);
  }

  else
  {
    uint64_t v15 = 0LL;
  }

  return v15;
}

- (void)dealloc
{
  id session = self->_session;
  if (session)
  {
    if (self->_sensitiveRequired || self->_sensitive)
    {
      -[TKSmartCard setSessionEndPolicy:](self, "setSessionEndPolicy:", 1LL);
      self->_sensitiveRequired = 0;
      id session = self->_session;
    }

    [session terminateWithReply:&__block_literal_global_233];
  }

  -[TKSmartCard unreserve](self, "unreserve");
  uint64_t v4 = self->_slot;
  objc_sync_enter(v4);
  slot = self->_slot;
  NSStringFromSelector(sel_state);
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TKSmartCardSlot removeObserver:forKeyPath:](slot, "removeObserver:forKeyPath:", self, v6);

  objc_sync_exit(v4);
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___TKSmartCard;
  -[TKSmartCard dealloc](&v7, sel_dealloc);
}

- (void)reserveExclusive:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  objc_super v7 = v6;
  if (self->_allowedProtocols)
  {
    slot = self->_slot;
    uint64_t v9 = MEMORY[0x1895F87A8];
    v16[0] = MEMORY[0x1895F87A8];
    v16[1] = 3221225472LL;
    v16[2] = __38__TKSmartCard_reserveExclusive_reply___block_invoke;
    v16[3] = &unk_189F8A488;
    id v10 = v6;
    id v17 = v10;
    -[TKSmartCardSlot synchronous:remoteSlotWithErrorHandler:]( slot,  "synchronous:remoteSlotWithErrorHandler:",  0LL,  v16);
    __int16 v11 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607968] numberWithUnsignedInteger:self->_allowedProtocols];
    int v12 = (void *)objc_claimAutoreleasedReturnValue();
    reservationId = self->_reservationId;
    v14[0] = v9;
    v14[1] = 3221225472LL;
    v14[2] = __38__TKSmartCard_reserveExclusive_reply___block_invoke_2;
    v14[3] = &unk_189F8A740;
    v14[4] = self;
    id v15 = v10;
    [v11 reserveProtocols:v12 reservationId:reservationId exclusive:v4 reply:v14];
  }

  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0LL);
  }
}

uint64_t __38__TKSmartCard_reserveExclusive_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __38__TKSmartCard_reserveExclusive_reply___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v8 = a2;
  id v7 = a3;
  if (!a4)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 72LL), a3);
    if ([v8 unsignedIntegerValue]) {
      objc_msgSend(*(id *)(a1 + 32), "setAllowedProtocols:", objc_msgSend(v8, "unsignedIntegerValue"));
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (void)unreserve
{
  if (self->_reservationId)
  {
    -[TKSmartCardSlot synchronous:remoteSlotWithErrorHandler:]( self->_slot,  "synchronous:remoteSlotWithErrorHandler:",  0LL,  &__block_literal_global_235);
    uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 reserveProtocols:0 reservationId:self->_reservationId exclusive:0 reply:&__block_literal_global_236];

    reservationId = self->_reservationId;
    self->_reservationId = 0LL;
  }

- (BOOL)revalidate
{
  if (-[TKSmartCardSlot state](self->_slot, "state") == TKSmartCardSlotStateValidCard) {
    -[TKSmartCard setValid:](self, "setValid:", 1LL);
  }
  return -[TKSmartCard valid](self, "valid");
}

- (UInt8)cla
{
  return self->_cla;
}

- (void)setCla:(UInt8)cla
{
  self->_cla = cla;
}

- (BOOL)useExtendedLength
{
  return self->_useExtendedLength;
}

- (void)setUseExtendedLength:(BOOL)useExtendedLength
{
  self->_useExtendedLength = useExtendedLength;
}

- (BOOL)useCommandChaining
{
  return self->_useCommandChaining;
}

- (void)setUseCommandChaining:(BOOL)useCommandChaining
{
  self->_useCommandChaining = useCommandChaining;
}

+ (BOOL)decodeResponse:(id)a3 sw:(unsigned __int16 *)a4 appendTo:(id)a5 error:(id *)a6
{
  uint64_t v41 = *MEMORY[0x1895F89C0];
  id v9 = a3;
  id v10 = a5;
  *a4 = 0;
  if (!v9) {
    goto LABEL_5;
  }
  if ((unint64_t)[v9 length] <= 1)
  {
    if (a6)
    {
      [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-3 userInfo:0];
      BOOL v11 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }

- (BOOL)checkAPDUResponse:(id)a3 error:(id *)a4
{
  id v5 = a3;
  char v6 = [(id)objc_opt_class() decodeResponse:v5 sw:&v8 appendTo:0 error:a4];

  if (v8 == -28672) {
    return v6;
  }
  else {
    return 0;
  }
}

- (void)handleApduResponse:(id)a3 body:(id)a4 le:(unint64_t)a5 isCase4:(BOOL)a6 error:(id)a7 reply:(id)a8
{
  BOOL v10 = a6;
  id v14 = a4;
  id v15 = a8;
  id v16 = a7;
  id v17 = a3;
  id v30 = v16;
  LOBYTE(a3) = [(id)objc_opt_class() decodeResponse:v17 sw:&v31 appendTo:v14 error:&v30];

  id v18 = v30;
  if ((a3 & 1) == 0)
  {
    (*((void (**)(id, void, void, id))v15 + 2))(v15, 0LL, 0LL, v18);
    goto LABEL_25;
  }

  unsigned __int16 v19 = v31;
  if (v31 == 36864 && v10)
  {
    if (self->_currentProtocol != 1) {
      goto LABEL_13;
    }
    if (![v14 length])
    {
      unsigned __int16 v31 = 24832;
LABEL_11:
      if ([v14 length] >= a5)
      {
        unsigned __int16 v31 = -28672;

        id v18 = 0LL;
      }

      goto LABEL_13;
    }

    unsigned __int16 v19 = v31;
  }

  if ((v19 & 0xFF00) == 0x6100) {
    goto LABEL_11;
  }
LABEL_13:
  if ((v31 & 0xFF00) == 0x6100)
  {
    if ((_BYTE)v31) {
      unint64_t v20 = v31;
    }
    else {
      unint64_t v20 = 256LL;
    }
    if ([v14 length] + v20 > a5) {
      unint64_t v20 = a5 - [v14 length];
    }
    if (v20 > -[TKSmartCardSlot maxOutputLength](self->_slot, "maxOutputLength") - 2) {
      LOBYTE(v20) = -[TKSmartCardSlot maxOutputLength](self->_slot, "maxOutputLength") - 2;
    }
    unsigned __int8 cla = self->_cla;
    __int16 v27 = 192;
    char v28 = 0;
    char v29 = v20;
    [MEMORY[0x189603F48] dataWithBytes:&cla length:5];
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1895F87A8];
    v22[1] = 3221225472LL;
    v22[2] = __62__TKSmartCard_handleApduResponse_body_le_isCase4_error_reply___block_invoke;
    void v22[3] = &unk_189F8A7C8;
    v22[4] = self;
    id v23 = v14;
    unint64_t v25 = a5;
    id v24 = v15;
    -[TKSmartCard transmitRequest:reply:](self, "transmitRequest:reply:", v21, v22);
  }

  else
  {
    if ([v14 length] > a5) {
      [v14 setLength:a5];
    }
    (*((void (**)(id, id, void, id))v15 + 2))(v15, v14, v31, v18);
  }

uint64_t __62__TKSmartCard_handleApduResponse_body_le_isCase4_error_reply___block_invoke( uint64_t a1,  uint64_t a2,  uint64_t a3)
{
  return [*(id *)(a1 + 32) handleApduResponse:a2 body:*(void *)(a1 + 40) le:*(void *)(a1 + 56) isCase4:0 error:a3 reply:*(void *)(a1 + 48)];
}

- (void)encodeLength:(unint64_t)a3 into:(id)a4 sized:(int64_t)a5
{
  id v7 = a4;
  __int16 v8 = v7;
  switch(a5)
  {
    case 3LL:
      v12[0] = 0;
      v12[1] = BYTE1(a3);
      v12[2] = a3;
      BOOL v10 = (__int16 *)v12;
      uint64_t v11 = 3LL;
LABEL_9:
      [v7 appendBytes:v10 length:v11];
      break;
    case 2LL:
      __int16 v13 = bswap32(a3) >> 16;
      BOOL v10 = &v13;
      uint64_t v11 = 2LL;
      goto LABEL_9;
    case 1LL:
      char v9 = 0;
      if (a3 < 0x100) {
        char v9 = a3;
      }
      char v14 = v9;
      BOOL v10 = (__int16 *)&v14;
      uint64_t v11 = 1LL;
      goto LABEL_9;
  }
}

- (id)buildIns:(unsigned __int8)a3 p1:(unsigned __int8)a4 p2:(unsigned __int8)a5 data:(id)a6 range:(_NSRange)a7 le:(id)a8 protocol:(unint64_t)a9 chained:(BOOL)a10 extended:(BOOL *)a11 realLe:(unint64_t *)a12
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  id v17 = a6;
  id v18 = a8;
  unsigned __int16 v19 = (void *)MEMORY[0x189603FB8];
  if (v17) {
    uint64_t v20 = [v17 length] + 10;
  }
  else {
    uint64_t v20 = 10LL;
  }
  [v19 dataWithCapacity:v20];
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  id v22 = v21;
  unsigned __int8 cla = self->_cla;
  v38[0] = cla;
  v38[1] = a3;
  v38[2] = a4;
  v38[3] = a5;
  if (a10) {
    v38[0] = cla | 0x10;
  }
  [v21 appendBytes:v38 length:4];
  if (v17)
  {
    if (length >= 0x10000) {
      objc_msgSend( MEMORY[0x189603F70],  "raise:format:",  *MEMORY[0x189603A60],  @"Attempt to send APDU with Lc=%lu",  length);
    }
    BOOL v24 = length > 0xFF;
  }

  else
  {
    BOOL v24 = 0;
  }

  *a12 = 0LL;
  if (!v18)
  {
    __int16 v27 = a11;
    if (!v17) {
      goto LABEL_26;
    }
    goto LABEL_22;
  }

  if ((unint64_t)[v18 unsignedIntegerValue] > 0x10000) {
    [MEMORY[0x189603F70] raise:*MEMORY[0x189603A60], @"Attempt to send APDU with Le=%@", v18 format];
  }
  uint64_t v25 = [v18 unsignedIntegerValue];
  unint64_t v26 = 0x10000LL;
  if (v25) {
    unint64_t v26 = v25;
  }
  *a12 = v26;
  __int16 v27 = a11;
  int v28 = v26 > 0x100 || v24;
  if (*a11) {
    BOOL v24 = v28;
  }
  if (v17)
  {
LABEL_22:
    if (v24) {
      uint64_t v29 = 3LL;
    }
    else {
      uint64_t v29 = 1LL;
    }
    -[TKSmartCard encodeLength:into:sized:](self, "encodeLength:into:sized:", length, v22, v29);
    objc_msgSend(v22, "appendBytes:length:", objc_msgSend(v17, "bytes") + location, length);
  }

- (void)transmitChunkedIns:(unsigned __int8)a3 p1:(unsigned __int8)a4 p2:(unsigned __int8)a5 data:(id)a6 fromOffset:(unint64_t)a7 realLe:(unint64_t)a8 chained:(BOOL)a9 isCase4:(BOOL)a10 reply:(id)a11
{
  unsigned int v13 = a5;
  unsigned int v39 = a3;
  unsigned int v40 = a4;
  id v15 = a6;
  id v16 = a11;
  uint64_t v17 = [v15 length];
  if (v17 - a7 > 0xFF && !self->_useExtendedLength) {
    unint64_t v19 = 255LL;
  }
  else {
    unint64_t v19 = v17 - a7;
  }
  if (v19 <= 0xFF) {
    uint64_t v20 = 5LL;
  }
  else {
    uint64_t v20 = 7LL;
  }
  unsigned int v41 = v13;
  if (a9 && v19 + a7 == [v15 length])
  {
    uint64_t v21 = 6LL;
    if (v19 > 0xFF) {
      uint64_t v21 = 9LL;
    }
    if (self->_currentProtocol == 2 || v15 == 0LL) {
      uint64_t v20 = v21;
    }
    int v23 = 1;
  }

  else
  {
    int v23 = 0;
  }

  if (v20 + v19 > -[TKSmartCardSlot maxInputLength](self->_slot, "maxInputLength"))
  {
    if (v23)
    {
      uint64_t v24 = -2LL;
      if (v19 <= 0xFF) {
        uint64_t v24 = -1LL;
      }
      if (self->_currentProtocol == 2 || v15 == 0LL) {
        uint64_t v26 = v24;
      }
      else {
        uint64_t v26 = 0LL;
      }
      v20 += v26;
    }

    LOBYTE(v23) = 0;
    unint64_t v19 = -[TKSmartCardSlot maxInputLength](self->_slot, "maxInputLength") - v20;
  }

  v64[0] = self->_useExtendedLength;
  if (v19)
  {
    char v27 = v23 ^ 1;
    if ((v23 & a10) == 1)
    {
      uint64_t v28 = [MEMORY[0x189607968] numberWithUnsignedInteger:a8];
    }

    else
    {
      uint64_t v28 = 0LL;
    }

    LOBYTE(v35) = v27 & a9;
    v36 = (void *)v28;
    -[TKSmartCard buildIns:p1:p2:data:range:le:protocol:chained:extended:realLe:]( self,  "buildIns:p1:p2:data:range:le:protocol:chained:extended:realLe:",  v39,  v40,  v13,  v15,  a7,  v19,  v28,  self->_currentProtocol,  v35,  v64,  v63);
    unint64_t v38 = a7;
    uint64_t v30 = (void *)objc_claimAutoreleasedReturnValue();
    uint64_t v59 = 0LL;
    v60 = &v59;
    uint64_t v61 = 0x2020000000LL;
    char v62 = 0;
    v46[0] = MEMORY[0x1895F87A8];
    v46[1] = 3221225472LL;
    v46[2] = __85__TKSmartCard_transmitChunkedIns_p1_p2_data_fromOffset_realLe_chained_isCase4_reply___block_invoke;
    v46[3] = &unk_189F8A7F0;
    char v53 = v23;
    v46[4] = self;
    unint64_t v50 = a8;
    BOOL v54 = a10;
    id v31 = v16;
    id v48 = v31;
    char v55 = v39;
    char v56 = v40;
    char v57 = v13;
    id v37 = v15;
    id v32 = v15;
    unint64_t v51 = v38;
    unint64_t v52 = v19;
    BOOL v58 = a9;
    id v47 = v32;
    v49 = &v59;
    -[TKSmartCard transmitRequest:reply:](self, "transmitRequest:reply:", v30, v46);
    if (*((_BYTE *)v60 + 24))
    {
      BYTE1(v34) = a10;
      LOBYTE(v34) = v27 & a9;
      -[TKSmartCard transmitChunkedIns:p1:p2:data:fromOffset:realLe:chained:isCase4:reply:]( self,  "transmitChunkedIns:p1:p2:data:fromOffset:realLe:chained:isCase4:reply:",  v39,  v40,  v13,  v32,  v19 + v38,  a8,  v34,  v31);
    }

    _Block_object_dispose(&v59, 8);
    uint64_t v33 = v36;
    id v15 = v37;
  }

  else
  {
    if (a10)
    {
      [MEMORY[0x189607968] numberWithUnsignedInteger:a8];
      uint64_t v29 = (void *)objc_claimAutoreleasedReturnValue();
    }

    else
    {
      uint64_t v29 = 0LL;
    }

    LOBYTE(v35) = a9 & ~(_BYTE)v23;
    -[TKSmartCard buildIns:p1:p2:data:range:le:protocol:chained:extended:realLe:]( self,  "buildIns:p1:p2:data:range:le:protocol:chained:extended:realLe:",  v39,  v40,  v41,  0LL,  0LL,  0LL,  v29,  self->_currentProtocol,  v35,  v64,  v63);
    uint64_t v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (a10) {

    }
    v42[0] = MEMORY[0x1895F87A8];
    v42[1] = 3221225472LL;
    v42[2] = __85__TKSmartCard_transmitChunkedIns_p1_p2_data_fromOffset_realLe_chained_isCase4_reply___block_invoke_2;
    v42[3] = &unk_189F8A818;
    v42[4] = self;
    unint64_t v44 = a8;
    BOOL v45 = a10;
    id v43 = v16;
    -[TKSmartCard transmitRequest:reply:](self, "transmitRequest:reply:", v33, v42);
  }
}

void __85__TKSmartCard_transmitChunkedIns_p1_p2_data_fromOffset_realLe_chained_isCase4_reply___block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a3;
  if (*(_BYTE *)(a1 + 88))
  {
    char v6 = *(void **)(a1 + 32);
    id v7 = (void *)MEMORY[0x189603FB8];
    id v8 = a2;
    [v7 data];
    char v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 handleApduResponse:v8 body:v9 le:*(void *)(a1 + 64) isCase4:*(unsigned __int8 *)(a1 + 89) error:v5 reply:*(void *)(a1 + 48)];

    id v10 = v5;
  }

  else
  {
    id v11 = a2;
    id v17 = v5;
    int v12 = [(id)objc_opt_class() decodeResponse:v11 sw:&v18 appendTo:0 error:&v17];

    id v10 = v17;
    if (v12 && v18 == 36864)
    {
      if ([*(id *)(a1 + 32) synchronous])
      {
        *(_BYTE *)(*(void *)(*(void *)(a1 + 56) + 8LL) + 24LL) = 1;
      }

      else
      {
        char v15 = *(_BYTE *)(a1 + 93);
        if (v15) {
          char v15 = *(_BYTE *)(a1 + 88) == 0;
        }
        BYTE1(v16) = *(_BYTE *)(a1 + 89);
        LOBYTE(v16) = v15;
        objc_msgSend( *(id *)(a1 + 32),  "transmitChunkedIns:p1:p2:data:fromOffset:realLe:chained:isCase4:reply:",  *(unsigned __int8 *)(a1 + 90),  *(unsigned __int8 *)(a1 + 91),  *(unsigned __int8 *)(a1 + 92),  *(void *)(a1 + 40),  *(void *)(a1 + 80) + *(void *)(a1 + 72),  *(void *)(a1 + 64),  v16,  *(void *)(a1 + 48));
      }
    }

    else
    {
      uint64_t v13 = *(void *)(a1 + 48);
      if ((v12 & 1) != 0)
      {
        objc_msgSend(MEMORY[0x189603F48], "data", v18);
        char v14 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, void, id))(v13 + 16))(v13, v14, v18, v10);
      }

      else
      {
        (*(void (**)(uint64_t, void, void, id))(v13 + 16))(v13, 0LL, v18, v10);
      }
    }
  }
}

void __85__TKSmartCard_transmitChunkedIns_p1_p2_data_fromOffset_realLe_chained_isCase4_reply___block_invoke_2( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = *(void **)(a1 + 32);
  char v6 = (void *)MEMORY[0x189603FB8];
  id v7 = a3;
  id v8 = a2;
  [v6 data];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleApduResponse:v8 body:v9 le:*(void *)(a1 + 48) isCase4:*(unsigned __int8 *)(a1 + 56) error:v7 reply:*(void *)(a1 + 40)];
}

- (void)sendIns:(UInt8)ins p1:(UInt8)p1 p2:(UInt8)p2 data:(NSData *)requestData le:(NSNumber *)le reply:(void *)reply
{
  uint64_t v10 = p2;
  uint64_t v11 = p1;
  uint64_t v12 = ins;
  uint64_t v49 = *MEMORY[0x1895F89C0];
  char v14 = requestData;
  char v15 = le;
  uint64_t v16 = reply;
  if (!self->_sessionCounter) {
    [MEMORY[0x189603F70] raise:*MEMORY[0x189603A58] format:@"sendIns: not in active card session"];
  }
  id v17 = self->_syncObject;
  objc_sync_enter(v17);
  if (-[TKSmartCard valid](self, "valid"))
  {
    if (self->_currentProtocol - 1 >= 2) {
      objc_msgSend( MEMORY[0x189603F70],  "raise:format:",  *MEMORY[0x189603A58],  @"sendIns: found protocol 0x%04lx, but only T=0 or T=1 protocols are supported",  self->_currentProtocol);
    }
    objc_sync_exit(v17);

    TK_LOG_smartcard();
    unsigned __int16 v18 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int128 buf = 67110146;
      *(_DWORD *)&uint8_t buf[4] = v12;
      __int16 v41 = 1024;
      int v42 = v11;
      __int16 v43 = 1024;
      int v44 = v10;
      __int16 v45 = 2112;
      v46 = v14;
      __int16 v47 = 2112;
      id v48 = v15;
      _os_log_debug_impl(&dword_186E58000, v18, OS_LOG_TYPE_DEBUG, "req: %02x %02x%02x %@ le:%@", buf, 0x28u);
    }

    v38[0] = MEMORY[0x1895F87A8];
    v38[1] = 3221225472LL;
    v38[2] = __43__TKSmartCard_sendIns_p1_p2_data_le_reply___block_invoke;
    v38[3] = &unk_189F8A840;
    unsigned int v39 = v16;
    unint64_t v19 = (void *)MEMORY[0x18959C69C](v38);
    if (v14) {
      BOOL v20 = v15 == 0LL;
    }
    else {
      BOOL v20 = 1;
    }
    char v21 = !v20;
    char v32 = v21;
    BOOL useExtendedLength = self->_useExtendedLength;
    LOBYTE(v30) = 0;
    -[TKSmartCard buildIns:p1:p2:data:range:le:protocol:chained:extended:realLe:]( self,  "buildIns:p1:p2:data:range:le:protocol:chained:extended:realLe:",  v12,  v11,  v10,  v14,  0LL,  -[NSData length](v14, "length"),  v15,  self->_currentProtocol,  v30,  &useExtendedLength,  buf);
    id v22 = (void *)objc_claimAutoreleasedReturnValue();
    unint64_t v23 = [v22 length];
    if (v23 > -[TKSmartCardSlot maxInputLength](self->_slot, "maxInputLength")
      || useExtendedLength && !self->_useExtendedLength)
    {
      if (self->_useCommandChaining)
      {
        BYTE1(v29) = v32;
        LOBYTE(v29) = 1;
        -[TKSmartCard transmitChunkedIns:p1:p2:data:fromOffset:realLe:chained:isCase4:reply:]( self,  "transmitChunkedIns:p1:p2:data:fromOffset:realLe:chained:isCase4:reply:",  v12,  v11,  v10,  v14,  0LL,  *(void *)buf,  v29,  v19);
      }

      else
      {
        if (self->_currentProtocol != 2 || !self->_useExtendedLength)
        {
          BOOL useExtendedLength = 1;
          LOBYTE(v31) = 0;
          uint64_t v28 = -[TKSmartCard buildIns:p1:p2:data:range:le:protocol:chained:extended:realLe:]( self,  "buildIns:p1:p2:data:range:le:protocol:chained:extended:realLe:",  v12,  v11,  v10,  v14,  0LL,  -[NSData length](v14, "length"),  v15,  2LL,  v31,  &useExtendedLength,  buf);

          id v22 = (void *)v28;
        }

        BYTE1(v29) = v32;
        LOBYTE(v29) = 0;
        -[TKSmartCard transmitChunkedIns:p1:p2:data:fromOffset:realLe:chained:isCase4:reply:]( self,  "transmitChunkedIns:p1:p2:data:fromOffset:realLe:chained:isCase4:reply:",  194LL,  0LL,  0LL,  v22,  0LL,  *(void *)buf,  v29,  v19);
      }
    }

    else
    {
      v33[0] = MEMORY[0x1895F87A8];
      v33[1] = 3221225472LL;
      v33[2] = __43__TKSmartCard_sendIns_p1_p2_data_le_reply___block_invoke_252;
      v33[3] = &unk_189F8A818;
      v33[4] = self;
      uint64_t v35 = *(void *)buf;
      char v36 = v32;
      id v34 = v19;
      -[TKSmartCard transmitRequest:reply:](self, "transmitRequest:reply:", v22, v33);
    }

    id v17 = v39;
  }

  else
  {
    TK_LOG_smartcard();
    uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      -[TKSmartCard slot](self, "slot");
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 name];
      uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[TKSmartCard sendIns:p1:p2:data:le:reply:].cold.1(v26, (uint64_t)buf, v24, v25);
    }

    [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-7 userInfo:0];
    char v27 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void, void, void *))v16 + 2))(v16, 0LL, 0LL, v27);

    objc_sync_exit(v17);
  }
}

void __43__TKSmartCard_sendIns_p1_p2_data_le_reply___block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (v6)
  {
    TK_LOG_smartcard();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __43__TKSmartCard_sendIns_p1_p2_data_le_reply___block_invoke_cold_1();
    }
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

void __43__TKSmartCard_sendIns_p1_p2_data_le_reply___block_invoke_252(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = (void *)MEMORY[0x189603FB8];
  id v7 = a3;
  id v8 = a2;
  [v6 data];
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleApduResponse:v8 body:v9 le:*(void *)(a1 + 48) isCase4:*(unsigned __int8 *)(a1 + 56) error:v7 reply:*(void *)(a1 + 40)];
}

- (NSData)sendIns:(UInt8)ins p1:(UInt8)p1 p2:(UInt8)p2 data:(NSData *)requestData le:(NSNumber *)le sw:(UInt16 *)sw error:(NSError *)error
{
  uint64_t v11 = p2;
  uint64_t v12 = p1;
  uint64_t v13 = ins;
  char v15 = requestData;
  uint64_t v16 = le;
  uint64_t v27 = 0LL;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000LL;
  uint64_t v30 = __Block_byref_object_copy__0;
  uint64_t v31 = __Block_byref_object_dispose__0;
  id v32 = 0LL;
  self->_BOOL synchronous = 1;
  uint64_t v21 = 0LL;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000LL;
  uint64_t v24 = __Block_byref_object_copy__0;
  uint64_t v25 = __Block_byref_object_dispose__0;
  id v26 = 0LL;
  v20[0] = MEMORY[0x1895F87A8];
  v20[1] = 3221225472LL;
  v20[2] = __46__TKSmartCard_sendIns_p1_p2_data_le_sw_error___block_invoke;
  v20[3] = &unk_189F8A868;
  v20[5] = &v21;
  v20[6] = sw;
  v20[4] = &v27;
  -[TKSmartCard sendIns:p1:p2:data:le:reply:](self, "sendIns:p1:p2:data:le:reply:", v13, v12, v11, v15, v16, v20);
  self->_BOOL synchronous = 0;
  if (error)
  {
    id v17 = (void *)v22[5];
    if (v17) {
      *error = (NSError *)v17;
    }
  }

  id v18 = (id)v28[5];
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);
  return (NSData *)v18;
}

void __46__TKSmartCard_sendIns_p1_p2_data_le_sw_error___block_invoke( uint64_t a1,  void *a2,  __int16 a3,  void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8LL);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v13 = v7;

  **(_WORD **)(a1 + 48) = a3;
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8LL);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;
}

- (BOOL)selectApplication:(id)a3 error:(id *)a4
{
  v18[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  -[TKSmartCard contextForKey:](self, "contextForKey:", @"AID");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  char v8 = [v6 isEqual:v7];

  if ((v8 & 1) != 0) {
    goto LABEL_5;
  }
  -[TKSmartCard sendIns:p1:p2:data:le:sw:error:]( self,  "sendIns:p1:p2:data:le:sw:error:",  164LL,  4LL,  0LL,  v6,  0LL,  &v16,  a4);
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  int v10 = v16;

  if (v9 && v10 == 36864)
  {
    -[TKSmartCard setContext:forKey:](self, "setContext:forKey:", v6, @"AID");
LABEL_5:
    BOOL v11 = 1;
    goto LABEL_11;
  }

  if (a4)
  {
    uint64_t v17 = *MEMORY[0x1896075E0];
    [NSString stringWithFormat:@"Unable to select card application AID %@", v6];
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v12;
    [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    id v13 = (void *)objc_claimAutoreleasedReturnValue();
    char v14 = (void *)[v13 mutableCopy];

    if (*a4) {
      [v14 setObject:*a4 forKeyedSubscript:*MEMORY[0x189607798]];
    }
    [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-7 userInfo:v14];
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (TKSmartCardSlot)slot
{
  return self->_slot;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (TKSmartCardProtocol)allowedProtocols
{
  return self->_allowedProtocols;
}

- (void)setAllowedProtocols:(TKSmartCardProtocol)allowedProtocols
{
  self->_unint64_t allowedProtocols = allowedProtocols;
}

- (TKSmartCardProtocol)currentProtocol
{
  return self->_currentProtocol;
}

- (void)setCurrentProtocol:(unint64_t)a3
{
  self->_currentProtocol = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithSlot:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = 138543618;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_6(&dword_186E58000, v1, (uint64_t)v1, "%{public}@: connected to slot %{public}@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_4();
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_6(&dword_186E58000, v0, (uint64_t)v0, "%{public}@: invalidating because of state changed to %ld", v1);
  OUTLINED_FUNCTION_4();
}

- (void)releaseSessionWithReply:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6(&dword_186E58000, v0, v1, "%{public}@: releasing card session %{public}@", v2);
  OUTLINED_FUNCTION_4();
}

void __39__TKSmartCard_releaseSessionWithReply___block_invoke_3_cold_1()
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 name];
  uint64_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_0( &dword_186E58000,  v3,  v4,  "%{public}@: failed to waitForStateFlushedWithReply: %{public}@",  v5,  v6,  v7,  v8,  v9);

  OUTLINED_FUNCTION_2();
}

- (void)querySessionWithReply:.cold.1()
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_12();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_debug_impl( &dword_186E58000,  v2,  OS_LOG_TYPE_DEBUG,  "%{public}@: querying slot for the session, proto=%04lx, counter=%ld",  v3,  0x20u);
}

void __37__TKSmartCard_querySessionWithReply___block_invoke_2_cold_1()
{
  uint64_t v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 name];
  os_log_t v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_6_0( &dword_186E58000,  v3,  v4,  "%{public}@: failed to call slot to allocate exclusive session for the card: %{public}@",  v5,  v6,  v7,  v8,  v9);

  OUTLINED_FUNCTION_2();
}

void __37__TKSmartCard_querySessionWithReply___block_invoke_2_207_cold_1(uint64_t a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 name];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0( &dword_186E58000,  a2,  v5,  "%{public}@: slot refused to allocate exclusive session for the card",  v6);

  OUTLINED_FUNCTION_2();
}

void __37__TKSmartCard_querySessionWithReply___block_invoke_2_209_cold_1()
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_11();
  __int16 v4 = 2048;
  uint64_t v5 = v0;
  __int16 v6 = 2048;
  uint64_t v7 = v1;
  _os_log_debug_impl( &dword_186E58000,  v2,  OS_LOG_TYPE_DEBUG,  "%{public}@: slot answered session %{public}@ (protocol=0x%04lx, counter=%ld)",  v3,  0x2Au);
}

- (void)beginSessionWithReply:(void *)a1 .cold.1(void *a1, os_log_s *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  [a1 slot];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 name];
  __int16 v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_186E58000, a2, v5, "%{public}@: begin exclusive SmartCard session", v6);

  OUTLINED_FUNCTION_2();
}

- (void)beginSessionWithError:(os_log_s *)a3 .cold.1(void *a1, uint64_t a2, os_log_s *a3, void *a4)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1(&dword_186E58000, a3, (uint64_t)a3, "%{public}@: begin exclusive SmartCard session", (uint8_t *)a2);
}

- (void)endSessionWithReply:.cold.1()
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_12();
  __int16 v4 = 1024;
  int v5 = v0;
  OUTLINED_FUNCTION_15(&dword_186E58000, v1, v2, "%{public}@: endSession: counter=%ld, someoneWantsSession=%d", v3);
}

- (void)transmitRequest:reply:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_10_0();
  OUTLINED_FUNCTION_6(&dword_186E58000, v0, (uint64_t)v0, "%{public}@: transmitRequest:%@", v1);
  OUTLINED_FUNCTION_4();
}

- (void)transmitRequest:(void *)a1 reply:(os_log_s *)a2 .cold.2(void *a1, os_log_s *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  [a1 slot];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 name];
  __int16 v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0( &dword_186E58000,  a2,  v5,  "%{public}@: attempted to transmit APDU when no session is opened",  v6);

  OUTLINED_FUNCTION_2();
}

- (void)transmitRequest:(void *)a1 reply:(os_log_s *)a2 .cold.3(void *a1, os_log_s *a2)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  [a1 slot];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 name];
  __int16 v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0( &dword_186E58000,  a2,  v5,  "%{public}@: transmitRequest invoked on card invalid (removed) card",  v6);

  OUTLINED_FUNCTION_2();
}

void __37__TKSmartCard_transmitRequest_reply___block_invoke_cold_1(uint64_t a1, os_log_s *a2)
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 name];
  __int16 v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_186E58000, a2, v5, "%{public}@: token disappeared while transmitting request", v6);

  OUTLINED_FUNCTION_2();
}

+ (void)decodeResponse:(unsigned __int16 *)a1 sw:(os_log_s *)a2 appendTo:error:.cold.1(unsigned __int16 *a1, os_log_s *a2)
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_186E58000, a2, OS_LOG_TYPE_DEBUG, "SmartCard returned error sw: 0x%04hx", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_8();
}

- (void)sendIns:(os_log_s *)a3 p1:(void *)a4 p2:data:le:reply:.cold.1(void *a1, uint64_t a2, os_log_s *a3, void *a4)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_3_0( &dword_186E58000,  a3,  (uint64_t)a3,  "%{public}@: sendIns invoked on invalid (removed) card",  (uint8_t *)a2);
}

void __43__TKSmartCard_sendIns_p1_p2_data_le_reply___block_invoke_cold_1()
{
  uint64_t v10 = *MEMORY[0x1895F89C0];
  v5[0] = 67109634;
  v5[1] = v3;
  __int16 v6 = 2048;
  uint64_t v7 = [v2 length];
  __int16 v8 = 2112;
  uint64_t v9 = v1;
  OUTLINED_FUNCTION_15(&dword_186E58000, v0, v4, "rsp: %04x len:%lu:%@", (uint8_t *)v5);
}

@end