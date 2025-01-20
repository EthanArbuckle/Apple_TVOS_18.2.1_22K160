@interface LSDServiceGetXPCConnection
@end

@implementation LSDServiceGetXPCConnection

void ___LSDServiceGetXPCConnection_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x189603FC8]);
  v1 = (void *)_LSDServiceGetXPCConnection::serverConnections;
  _LSDServiceGetXPCConnection::serverConnections = (uint64_t)v0;
}

id ___LSDServiceGetXPCConnection_block_invoke_2(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)[objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:v2 options:*(void *)(a1 + 48)];
  if (v3)
  {
    [*(id *)(a1 + 40) XPCInterface];
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    [v3 setRemoteObjectInterface:v4];

    uint64_t v5 = MEMORY[0x1895F87A8];
    v14[0] = MEMORY[0x1895F87A8];
    v14[1] = 3221225472LL;
    v14[2] = ___LSDServiceGetXPCConnection_block_invoke_3;
    v14[3] = &unk_189D741C8;
    id v6 = v2;
    id v15 = v6;
    [v3 setInterruptionHandler:v14];
    v11[0] = v5;
    v11[1] = 3221225472LL;
    v11[2] = ___LSDServiceGetXPCConnection_block_invoke_45;
    v11[3] = &unk_189D74BF8;
    id v12 = v6;
    id v13 = *(id *)(a1 + 32);
    [v3 setInvalidationHandler:v11];
    [v3 setDelegate:objc_opt_class()];
    uint64_t v7 = *(unsigned int *)(a1 + 56);
    v8 = *(void (**)(void *, uint64_t))(a1 + 64);
    id v9 = *(id *)(a1 + 72);
    v8(v3, v7);

    [v3 resume];
  }

  return v3;
}

void ___LSDServiceGetXPCConnection_block_invoke_3(uint64_t a1)
{
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    ___LSDServiceGetXPCConnection_block_invoke_3_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }
}

void ___LSDServiceGetXPCConnection_block_invoke_45(uint64_t a1)
{
  v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    ___LSDServiceGetXPCConnection_block_invoke_45_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }

  os_unfair_lock_lock((os_unfair_lock_t)&_LSDServiceGetXPCConnection::serverConnectionsLock);
  [(id)_LSDServiceGetXPCConnection::serverConnections removeObjectForKey:*(void *)(a1 + 40)];
  os_unfair_lock_unlock((os_unfair_lock_t)&_LSDServiceGetXPCConnection::serverConnectionsLock);
}

void ___LSDServiceGetXPCConnection_block_invoke_3_cold_1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void ___LSDServiceGetXPCConnection_block_invoke_45_cold_1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end