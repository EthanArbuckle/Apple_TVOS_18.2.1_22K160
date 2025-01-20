@interface UARPPersonalizationManager
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)xpcConnectionHasEntitlement:(id)a3;
- (UARPPersonalizationManager)initWithMachServiceName:(id)a3 entitlement:(id)a4 delegate:(id)a5 queue:(id)a6;
- (void)dealloc;
- (void)getOutstandingPersonalizationRequests:(id)a3 reply:(id)a4;
- (void)personalizationResponse:(id)a3 updaterName:(id)a4;
@end

@implementation UARPPersonalizationManager

- (UARPPersonalizationManager)initWithMachServiceName:(id)a3 entitlement:(id)a4 delegate:(id)a5 queue:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___UARPPersonalizationManager;
  v14 = -[UARPPersonalizationManager init](&v25, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_delegate, v12);
    objc_storeStrong((id *)&v15->_queue, a6);
    uint64_t v16 = [v10 copy];
    serviceName = v15->_serviceName;
    v15->_serviceName = (NSString *)v16;

    uint64_t v18 = [v11 copy];
    entitlement = v15->_entitlement;
    v15->_entitlement = (NSString *)v18;

    os_log_t v20 = os_log_create("com.apple.accessoryupdater.uarp", "personalization");
    log = v15->_log;
    v15->_log = v20;

    uint64_t v22 = [objc_alloc(MEMORY[0x189607B50]) initWithMachServiceName:v15->_serviceName];
    listener = v15->_listener;
    v15->_listener = (NSXPCListener *)v22;

    -[NSXPCListener setDelegate:](v15->_listener, "setDelegate:", v15);
    -[NSXPCListener activate](v15->_listener, "activate");
  }

  return v15;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___UARPPersonalizationManager;
  -[UARPPersonalizationManager dealloc](&v3, sel_dealloc);
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v23 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0LL;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000LL;
  char v20 = 0;
  v8 = self->_log;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = [v7 processIdentifier];
    *(_DWORD *)buf = 67109120;
    int v22 = v9;
    _os_log_impl(&dword_187DC0000, v8, OS_LOG_TYPE_INFO, "Connection from PID %d", buf, 8u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __65__UARPPersonalizationManager_listener_shouldAcceptNewConnection___block_invoke;
  block[3] = &unk_18A143100;
  block[4] = self;
  id v15 = v7;
  uint64_t v16 = &v17;
  id v11 = v7;
  dispatch_sync((dispatch_queue_t)queue, block);
  BOOL v12 = *((_BYTE *)v18 + 24) != 0;

  _Block_object_dispose(&v17, 8);
  return v12;
}

void __65__UARPPersonalizationManager_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1895F89C0];
  if ([*(id *)(a1 + 32) xpcConnectionHasEntitlement:*(void *)(a1 + 40)])
  {
    [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C6FE6D8];
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) setExportedInterface:v2];

    [*(id *)(a1 + 40) setExportedObject:*(void *)(a1 + 32)];
    int v3 = [*(id *)(a1 + 40) processIdentifier];
    uint64_t v4 = MEMORY[0x1895F87A8];
    v10[0] = MEMORY[0x1895F87A8];
    v10[1] = 3221225472LL;
    v10[2] = __65__UARPPersonalizationManager_listener_shouldAcceptNewConnection___block_invoke_2;
    v10[3] = &unk_18A1430D8;
    v5 = *(void **)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    int v11 = v3;
    [v5 setInterruptionHandler:v10];
    v8[0] = v4;
    v8[1] = 3221225472LL;
    v8[2] = __65__UARPPersonalizationManager_listener_shouldAcceptNewConnection___block_invoke_11;
    v8[3] = &unk_18A1430D8;
    id v6 = *(void **)(a1 + 40);
    v8[4] = *(void *)(a1 + 32);
    int v9 = v3;
    [v6 setInvalidationHandler:v8];
    [*(id *)(a1 + 40) _setQueue:*(void *)(*(void *)(a1 + 32) + 16)];
    [*(id *)(a1 + 40) resume];
    id v7 = *(os_log_s **)(*(void *)(a1 + 32) + 8LL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v13 = v3;
      _os_log_impl(&dword_187DC0000, v7, OS_LOG_TYPE_INFO, "New connection from PID %d", buf, 8u);
    }

    *(_BYTE *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 24LL) = 1;
  }

void __65__UARPPersonalizationManager_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  v2 = *(os_log_s **)(*(void *)(a1 + 32) + 8LL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __65__UARPPersonalizationManager_listener_shouldAcceptNewConnection___block_invoke_2_cold_1(a1, v2, v3);
  }
}

void __65__UARPPersonalizationManager_listener_shouldAcceptNewConnection___block_invoke_11(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  v2 = *(os_log_s **)(*(void *)(a1 + 32) + 8LL);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = *(_DWORD *)(a1 + 40);
    v4[0] = 67109120;
    v4[1] = v3;
    _os_log_impl(&dword_187DC0000, v2, OS_LOG_TYPE_INFO, "Connection from PID %d invalidated", (uint8_t *)v4, 8u);
  }

- (BOOL)xpcConnectionHasEntitlement:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
    -[UARPPersonalizationManager xpcConnectionHasEntitlement:].cold.2(log);
  }
  [v4 valueForEntitlement:self->_entitlement];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([v6 BOOLValue])
  {
    BOOL v7 = 1;
  }

  else
  {
    v8 = self->_log;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[UARPPersonalizationManager xpcConnectionHasEntitlement:].cold.1(v8);
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (void)getOutstandingPersonalizationRequests:(id)a3 reply:(id)a4
{
  uint64_t v18 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  BOOL v7 = (void (**)(id, void *))a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315138;
    int v13 = "-[UARPPersonalizationManager getOutstandingPersonalizationRequests:reply:]";
    _os_log_impl(&dword_187DC0000, log, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v12, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained personalizationHelperQueryPendingTssRequests:v6];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();

  int v11 = self->_log;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 136315650;
    int v13 = "-[UARPPersonalizationManager getOutstandingPersonalizationRequests:reply:]";
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    uint64_t v17 = v10;
    _os_log_impl( &dword_187DC0000,  v11,  OS_LOG_TYPE_INFO,  "%s: Updater Name %@, pending tss requests %@",  (uint8_t *)&v12,  0x20u);
  }

  v7[2](v7, v10);
}

- (void)personalizationResponse:(id)a3 updaterName:(id)a4
{
  uint64_t v15 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    int v12 = "-[UARPPersonalizationManager personalizationResponse:updaterName:]";
    __int16 v13 = 2112;
    id v14 = v7;
    _os_log_impl(&dword_187DC0000, log, OS_LOG_TYPE_INFO, "%s: Updater Name %@", (uint8_t *)&v11, 0x16u);
  }

  int v9 = self->_log;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v11 = 136315394;
    int v12 = "-[UARPPersonalizationManager personalizationResponse:updaterName:]";
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl(&dword_187DC0000, v9, OS_LOG_TYPE_INFO, "%s: TSS Response %@", (uint8_t *)&v11, 0x16u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained personalizationHelperTssResponse:v6 updaterName:v7];
}

- (void).cxx_destruct
{
}

void __65__UARPPersonalizationManager_listener_shouldAcceptNewConnection___block_invoke_2_cold_1( uint64_t a1,  os_log_s *a2,  uint64_t a3)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  int v3 = *(_DWORD *)(a1 + 40);
  v4[0] = 67109120;
  v4[1] = v3;
  OUTLINED_FUNCTION_0_3(&dword_187DC0000, a2, a3, "Connection to PID %d interrupted", (uint8_t *)v4);
}

- (void)xpcConnectionHasEntitlement:(void *)a1 .cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  id v2 = a1;
  v4[0] = 67109120;
  v4[1] = OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_3( &dword_187DC0000,  v1,  v3,  "Connection from PID %d does not have the correct entitlement",  (uint8_t *)v4);

  OUTLINED_FUNCTION_1_4();
}

- (void)xpcConnectionHasEntitlement:(void *)a1 .cold.2(void *a1)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  id v2 = a1;
  v4[0] = 67109120;
  v4[1] = OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_3(&dword_187DC0000, v1, v3, "Connection from PID %d checking entitlement", (uint8_t *)v4);

  OUTLINED_FUNCTION_1_4();
}

@end