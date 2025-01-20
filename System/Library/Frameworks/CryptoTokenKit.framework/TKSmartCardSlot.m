@interface TKSmartCardSlot
- (NSInteger)maxInputLength;
- (NSInteger)maxOutputLength;
- (NSString)name;
- (OS_dispatch_queue)queue;
- (TKSmartCard)makeSmartCard;
- (TKSmartCardATR)ATR;
- (TKSmartCardSlot)initWithEndpoint:(id)a3 error:(id *)a4;
- (TKSmartCardSlotProxy)proxy;
- (TKSmartCardSlotState)state;
- (id)description;
- (id)screen;
- (id)slotParameters;
- (id)synchronous:(BOOL)a3 remoteSlotWithErrorHandler:(id)a4;
- (id)userInteractionForConfirmation;
- (id)userInteractionForStringEntry;
- (int64_t)powerState;
- (int64_t)previousState;
- (int64_t)shareState;
- (void)connectToEndpoint:(id)a3 synchronous:(BOOL)a4 reply:(id)a5;
- (void)control:(id)a3 data:(id)a4 expectedLength:(unsigned int)a5 reply:(id)a6;
- (void)dealloc;
- (void)getAttrib:(unsigned int)a3 reply:(id)a4;
- (void)invalidate;
- (void)setATR:(id)a3;
- (void)setAttrib:(unsigned int)a3 data:(id)a4 reply:(id)a5;
- (void)setPowerState:(int64_t)a3;
- (void)setPreviousState:(int64_t)a3;
- (void)setShareState:(int64_t)a3;
- (void)setState:(int64_t)a3;
@end

@implementation TKSmartCardSlot

- (id)description
{
  return (id)[NSString stringWithFormat:@"<TKSmartCardSlot: %p '%@'>", self, self->_name];
}

- (id)synchronous:(BOOL)a3 remoteSlotWithErrorHandler:(id)a4
{
  connection = self->_connection;
  if (a3) {
    -[NSXPCConnection synchronousRemoteObjectProxyWithErrorHandler:]( connection,  "synchronousRemoteObjectProxyWithErrorHandler:",  a4);
  }
  else {
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](connection, "remoteObjectProxyWithErrorHandler:", a4);
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)connectToEndpoint:(id)a3 synchronous:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = (NSXPCConnection *)[objc_alloc(MEMORY[0x189607B30]) initWithListenerEndpoint:v8];
  connection = self->_connection;
  self->_connection = v10;

  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6B2DA8];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6B31F8];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 setInterface:v13 forSelector:sel_sessionWithParameters_reply_ argumentIndex:0 ofReply:1];

  -[NSXPCConnection setRemoteObjectInterface:](self->_connection, "setRemoteObjectInterface:", v12);
  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6B0908];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setExportedInterface:](self->_connection, "setExportedInterface:", v14);

  v15 = -[TKSmartCardSlotProxy initWithSlot:](objc_alloc(&OBJC_CLASS___TKSmartCardSlotProxy), "initWithSlot:", self);
  proxy = self->_proxy;
  self->_proxy = v15;

  -[NSXPCConnection setExportedObject:](self->_connection, "setExportedObject:", self->_proxy);
  objc_initWeak(&location, self);
  uint64_t v17 = MEMORY[0x1895F87A8];
  v27[0] = MEMORY[0x1895F87A8];
  v27[1] = 3221225472LL;
  v27[2] = __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke;
  v27[3] = &unk_189F8A460;
  objc_copyWeak(&v28, &location);
  -[NSXPCConnection setInvalidationHandler:](self->_connection, "setInvalidationHandler:", v27);
  v25[0] = v17;
  v25[1] = 3221225472LL;
  v25[2] = __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_113;
  v25[3] = &unk_189F8A460;
  objc_copyWeak(&v26, &location);
  -[NSXPCConnection setInterruptionHandler:](self->_connection, "setInterruptionHandler:", v25);
  -[NSXPCConnection resume](self->_connection, "resume");
  self->_state = 1LL;
  self->_previousState = 1LL;
  v23[0] = v17;
  v23[1] = 3221225472LL;
  v23[2] = __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_114;
  v23[3] = &unk_189F8A488;
  id v18 = v9;
  id v24 = v18;
  v19 = -[TKSmartCardSlot synchronous:remoteSlotWithErrorHandler:](self, "synchronous:remoteSlotWithErrorHandler:", v6, v23);
  v21[0] = v17;
  v21[1] = 3221225472LL;
  v21[2] = __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_115;
  v21[3] = &unk_189F8A4B0;
  v21[4] = self;
  id v20 = v18;
  id v22 = v20;
  [v19 setupSlotWithReply:v21];

  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

void __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    TK_LOG_smartcard();
    v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_cold_1();
    }

    id v3 = WeakRetained;
    objc_sync_enter(v3);
    [v3 setState:0];
    objc_sync_exit(v3);

    [v3 setPreviousState:0];
    [v3 setATR:0];
  }
}

void __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_113(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    TK_LOG_smartcard();
    v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_113_cold_1();
    }

    [WeakRetained invalidate];
  }
}

void __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_114(uint64_t a1, void *a2)
{
  id v3 = a2;
  TK_LOG_smartcard();
  v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_114_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

uint64_t __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_115(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 objectForKey:@"name"];
  uint64_t v6 = a1 + 32;
  uint64_t v5 = *(void *)(a1 + 32);
  v7 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v4;

  [v3 objectForKey:@"state"];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(void *)(*(void *)v6 + 40) = [v8 integerValue];

  [v3 objectForKey:@"prevstate"];
  id v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(void *)(*(void *)v6 + 72) = [v9 integerValue];

  v10 = objc_alloc(&OBJC_CLASS___TKSmartCardATR);
  [v3 objectForKey:@"atr"];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = -[TKSmartCardATR initWithBytes:](v10, "initWithBytes:", v11);
  v13 = *(void **)(*(void *)(a1 + 32) + 48LL);
  *(void *)(*(void *)v6 + 48LL) = v12;

  [v3 objectForKey:@"power"];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(void *)(*(void *)v6 + 16) = [v14 integerValue];

  [v3 objectForKey:@"share"];
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  *(void *)(*(void *)v6 + 24) = [v15 integerValue];

  [*(id *)(*(void *)(a1 + 32) + 64) slotInitialized];
  v16 = objc_alloc(&OBJC_CLASS___TKSlotParameters);
  [v3 objectForKey:@"params"];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();

  uint64_t v18 = -[TKSlotParameters initWithEntriesFromDictionary:](v16, "initWithEntriesFromDictionary:", v17);
  v19 = *(void **)(*(void *)(a1 + 32) + 32LL);
  *(void *)(*(void *)v6 + 32LL) = v18;

  TK_LOG_smartcard();
  id v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_115_cold_1();
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16LL))();
}

- (id)slotParameters
{
  return self->_slotParameters;
}

- (NSInteger)maxInputLength
{
  return -[TKSlotParameters maxInputLength](self->_slotParameters, "maxInputLength");
}

- (NSInteger)maxOutputLength
{
  return -[TKSlotParameters maxOutputLength](self->_slotParameters, "maxOutputLength");
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)-[NSXPCConnection _queue](self->_connection, "_queue");
}

- (TKSmartCard)makeSmartCard
{
  if (-[TKSmartCardSlot state](self, "state") != TKSmartCardSlotStateValidCard
    && -[TKSmartCardSlot state](self, "state") != TKSmartCardSlotStateProbing)
  {
    return (TKSmartCard *)0LL;
  }

  if (-[TKSmartCardSlot state](self, "state") == TKSmartCardSlotStateProbing)
  {
    -[TKSmartCardSlot synchronous:remoteSlotWithErrorHandler:]( self,  "synchronous:remoteSlotWithErrorHandler:",  1LL,  &__block_literal_global_118);
    id v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "waitForNextState:reply:", -[TKSmartCardSlot state](self, "state"), &__block_literal_global_121);
  }

  if (-[TKSmartCardSlot state](self, "state") == TKSmartCardSlotStateValidCard) {
    return -[TKSmartCard initWithSlot:](objc_alloc(&OBJC_CLASS___TKSmartCard), "initWithSlot:", self);
  }
  else {
    return (TKSmartCard *)0LL;
  }
}

void __32__TKSmartCardSlot_makeSmartCard__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  TK_LOG_smartcard();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_114_cold_1();
  }
}

- (void)invalidate
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_6(&dword_186E58000, v0, v1, "%{public}@: invalidating slot and connection %{public}@", v2);
  OUTLINED_FUNCTION_4();
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TKSmartCardSlot;
  -[TKSmartCardSlot dealloc](&v3, sel_dealloc);
}

- (TKSmartCardSlot)initWithEndpoint:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)&OBJC_CLASS___TKSmartCardSlot;
  v7 = -[TKSmartCardSlot init](&v21, sel_init);
  id v8 = v7;
  if (v7)
  {
    uint64_t v17 = 0LL;
    uint64_t v18 = &v17;
    uint64_t v19 = 0x2020000000LL;
    char v20 = 1;
    uint64_t v11 = 0LL;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000LL;
    v14 = __Block_byref_object_copy__0;
    v15 = __Block_byref_object_dispose__0;
    id v16 = 0LL;
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __42__TKSmartCardSlot_initWithEndpoint_error___block_invoke;
    v10[3] = &unk_189F8A538;
    v10[4] = &v17;
    v10[5] = &v11;
    -[TKSmartCardSlot connectToEndpoint:synchronous:reply:](v7, "connectToEndpoint:synchronous:reply:", v6, 1LL, v10);
    if (!*((_BYTE *)v18 + 24))
    {

      id v8 = 0LL;
      if (a4) {
        *a4 = (id) v12[5];
      }
    }

    _Block_object_dispose(&v11, 8);

    _Block_object_dispose(&v17, 8);
  }

  return v8;
}

void __42__TKSmartCardSlot_initWithEndpoint_error___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    *(_BYTE *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = 0;
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8LL) + 40LL), a2);
    id v4 = v5;
  }
}

- (void)control:(id)a3 data:(id)a4 expectedLength:(unsigned int)a5 reply:(id)a6
{
  uint64_t v6 = *(void *)&a5;
  id v10 = a6;
  v15[0] = MEMORY[0x1895F87A8];
  v15[1] = 3221225472LL;
  v15[2] = __53__TKSmartCardSlot_control_data_expectedLength_reply___block_invoke;
  v15[3] = &unk_189F8A488;
  id v16 = v10;
  id v11 = v10;
  id v12 = a4;
  id v13 = a3;
  v14 = -[TKSmartCardSlot synchronous:remoteSlotWithErrorHandler:](self, "synchronous:remoteSlotWithErrorHandler:", 0LL, v15);
  [v14 sendControl:v13 data:v12 expectedLength:v6 reply:v11];
}

uint64_t __53__TKSmartCardSlot_control_data_expectedLength_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)getAttrib:(unsigned int)a3 reply:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1895F87A8];
  v9[1] = 3221225472LL;
  v9[2] = __35__TKSmartCardSlot_getAttrib_reply___block_invoke;
  v9[3] = &unk_189F8A488;
  id v10 = v6;
  id v7 = v6;
  -[TKSmartCardSlot synchronous:remoteSlotWithErrorHandler:](self, "synchronous:remoteSlotWithErrorHandler:", 0LL, v9);
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 getAttrib:v4 reply:v7];
}

uint64_t __35__TKSmartCardSlot_getAttrib_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (void)setAttrib:(unsigned int)a3 data:(id)a4 reply:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v8 = a5;
  v12[0] = MEMORY[0x1895F87A8];
  v12[1] = 3221225472LL;
  v12[2] = __40__TKSmartCardSlot_setAttrib_data_reply___block_invoke;
  v12[3] = &unk_189F8A488;
  id v13 = v8;
  id v9 = v8;
  id v10 = a4;
  -[TKSmartCardSlot synchronous:remoteSlotWithErrorHandler:](self, "synchronous:remoteSlotWithErrorHandler:", 0LL, v12);
  id v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 setAttrib:v6 data:v10 reply:v9];
}

uint64_t __40__TKSmartCardSlot_setAttrib_data_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16LL))();
}

- (id)screen
{
  return 0LL;
}

- (id)userInteractionForConfirmation
{
  return 0LL;
}

- (id)userInteractionForStringEntry
{
  return 0LL;
}

- (TKSmartCardSlotState)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (TKSmartCardATR)ATR
{
  return (TKSmartCardATR *)objc_getProperty(self, a2, 48LL, 1);
}

- (void)setATR:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (TKSmartCardSlotProxy)proxy
{
  return self->_proxy;
}

- (int64_t)previousState
{
  return self->_previousState;
}

- (void)setPreviousState:(int64_t)a3
{
  self->_previousState = a3;
}

- (int64_t)shareState
{
  return self->_shareState;
}

- (void)setShareState:(int64_t)a3
{
  self->_shareState = a3;
}

- (int64_t)powerState
{
  return self->_powerState;
}

- (void)setPowerState:(int64_t)a3
{
  self->_powerState = a3;
}

- (void).cxx_destruct
{
}

void __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_186E58000, v0, v1, "%{public}@: connection invalidated", v2);
  OUTLINED_FUNCTION_4();
}

void __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_113_cold_1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_186E58000, v0, v1, "%{public}@: connection interrupted, invalidating", v2);
  OUTLINED_FUNCTION_4();
}

void __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_114_cold_1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0(&dword_186E58000, v0, v1, "SmartCard slot connection failed (%{public}@)", v2);
  OUTLINED_FUNCTION_4();
}

void __55__TKSmartCardSlot_connectToEndpoint_synchronous_reply___block_invoke_115_cold_1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6(&dword_186E58000, v0, v1, "%{public}@: slot connected with parameters: %{public}@", v2);
  OUTLINED_FUNCTION_4();
}

@end