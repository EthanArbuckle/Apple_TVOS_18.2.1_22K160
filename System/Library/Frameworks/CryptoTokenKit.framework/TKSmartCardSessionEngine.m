@interface TKSmartCardSessionEngine
- (BOOL)active;
- (BOOL)valid;
- (NSXPCConnection)connection;
- (TKSmartCardSessionEngine)initWithSlot:(id)a3 connection:(id)a4;
- (int64_t)endPolicy;
- (void)dealloc;
- (void)setActive:(BOOL)a3;
- (void)setEndPolicy:(int64_t)a3;
- (void)setSessionEndPolicy:(int64_t)a3;
- (void)setValid:(BOOL)a3;
- (void)terminateWithReply:(id)a3;
- (void)transmit:(id)a3 reply:(id)a4;
@end

@implementation TKSmartCardSessionEngine

- (TKSmartCardSessionEngine)initWithSlot:(id)a3 connection:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)&OBJC_CLASS___TKSmartCardSessionEngine;
  v9 = -[TKSmartCardSessionEngine init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_slot, a3);
    objc_storeWeak((id *)&v10->_connection, v8);
    v10->_valid = 1;
  }

  return v10;
}

- (void)transmit:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if (self->_transmitting)
  {
    TK_LOG_token_0();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[TKSmartCardSessionEngine transmit:reply:].cold.2((uint64_t)self);
    }

    v9 = (void *)MEMORY[0x189607870];
    uint64_t v10 = -2LL;
    goto LABEL_9;
  }

  if (!-[TKSmartCardSessionEngine valid](self, "valid"))
  {
    v9 = (void *)MEMORY[0x189607870];
    uint64_t v10 = -7LL;
LABEL_9:
    [v9 errorWithDomain:@"CryptoTokenKit" code:v10 userInfo:0];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0LL, v16);

    goto LABEL_10;
  }

  slot = self->_slot;
  p_slot = &self->_slot;
  -[TKSmartCardSlotEngine setApduSentSinceLastReset:](slot, "setApduSentSinceLastReset:", 1LL);
  *((_BYTE *)p_slot + 8) = 1;
  -[TKSmartCardSlotEngine logWithBytes:handler:](*p_slot, "logWithBytes:handler:", v6, &__block_literal_global_362);
  v13 = -[TKSmartCardSlotEngine delegate](*p_slot, "delegate");
  [v13 engine:*p_slot transmit:v6];
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  *((_BYTE *)p_slot + 8) = 0;
  v15 = *p_slot;
  if (v14)
  {
    -[TKSmartCardSlotEngine logWithBytes:handler:](v15, "logWithBytes:handler:", v14, &__block_literal_global_364);
    ((void (**)(id, void *, void *))v7)[2](v7, v14, 0LL);
  }

  else
  {
    -[TKSmartCardSlotEngine logWithBytes:handler:](v15, "logWithBytes:handler:", 0LL, &__block_literal_global_366);
    TK_LOG_token_0();
    v17 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[TKSmartCardSessionEngine transmit:reply:].cold.1((id *)p_slot);
    }

    [MEMORY[0x189607870] errorWithDomain:@"CryptoTokenKit" code:-2 userInfo:0];
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0LL, v18);
  }

LABEL_10:
}

void __43__TKSmartCardSessionEngine_transmit_reply___block_invoke(int a1, os_log_t oslog)
{
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    __43__TKSmartCardSessionEngine_transmit_reply___block_invoke_cold_1();
  }
}

void __43__TKSmartCardSessionEngine_transmit_reply___block_invoke_363(int a1, os_log_t oslog)
{
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    __43__TKSmartCardSessionEngine_transmit_reply___block_invoke_363_cold_1();
  }
}

void __43__TKSmartCardSessionEngine_transmit_reply___block_invoke_365(int a1, os_log_t oslog)
{
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG)) {
    __43__TKSmartCardSessionEngine_transmit_reply___block_invoke_365_cold_1();
  }
}

- (void)setSessionEndPolicy:(int64_t)a3
{
  self->_endPolicy = a3;
}

- (void)terminateWithReply:(id)a3
{
  v4 = (void (**)(void))a3;
  if (self->_active) {
    -[TKSmartCardSlotEngine leaveSession:](self->_slot, "leaveSession:", self);
  }
  v4[2]();
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TKSmartCardSessionEngine;
  -[TKSmartCardSessionEngine dealloc](&v3, sel_dealloc);
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (int64_t)endPolicy
{
  return self->_endPolicy;
}

- (void)setEndPolicy:(int64_t)a3
{
  self->_endPolicy = a3;
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void).cxx_destruct
{
}

- (void)transmit:(id *)a1 reply:.cold.1(id *a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_14(&dword_186E58000, v2, v3, "%@: failed to transmit APDU", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_12_0();
}

- (void)transmit:(uint64_t)a1 reply:.cold.2(uint64_t a1)
{
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_14( &dword_186E58000,  v2,  v3,  "%{public}@: refusing to send APDU while another is in progress.",  v4,  v5,  v6,  v7,  v8);

  OUTLINED_FUNCTION_12_0();
}

void __43__TKSmartCardSessionEngine_transmit_reply___block_invoke_cold_1()
{
}

void __43__TKSmartCardSessionEngine_transmit_reply___block_invoke_363_cold_1()
{
}

void __43__TKSmartCardSessionEngine_transmit_reply___block_invoke_365_cold_1()
{
}

@end