@interface PPSMetricMonitorService
+ (id)sharedInstance;
- (BOOL)_canStartMonitoringForClient:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableDictionary)clients;
- (PPSMetricMonitorService)init;
- (PPSMetricMonitorServiceDelegate)delegate;
- (void)_handleConnectionEndedWithClient:(id)a3;
- (void)endWithError:(id)a3;
- (void)finishMonitoringAndSendMetrics;
- (void)setClients:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setUpWithConfiguration:(id)a3 completion:(id)a4;
- (void)setUpdateInterval:(id)a3 completion:(id)a4;
- (void)startMonitoringProcessWithName:(id)a3 completion:(id)a4;
- (void)startMonitoringProcessWithPID:(id)a3 completion:(id)a4;
- (void)startMonitoringProcessesWithName:(id)a3 completion:(id)a4;
- (void)startMonitoringProcessesWithNames:(id)a3 withPIDs:(id)a4 completion:(id)a5;
- (void)startMonitoringProcessesWithPID:(id)a3 completion:(id)a4;
- (void)startMonitoringSystemMetricsWithCompletion:(id)a3;
- (void)startXPCListener;
@end

@implementation PPSMetricMonitorService

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_1);
  }
  return (id)sharedInstance_service;
}

void __41__PPSMetricMonitorService_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(&OBJC_CLASS___PPSMetricMonitorService);
  v1 = (void *)sharedInstance_service;
  sharedInstance_service = (uint64_t)v0;
}

- (PPSMetricMonitorService)init
{
  v6.receiver = self;
  v6.super_class = (Class)&OBJC_CLASS___PPSMetricMonitorService;
  v2 = -[PPSMetricMonitorService init](&v6, sel_init);
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x189603FC8] dictionary];
    clients = v2->_clients;
    v2->_clients = (NSMutableDictionary *)v3;
  }

  return v2;
}

- (void)startXPCListener
{
}

- (void)endWithError:(id)a3
{
  id v4 = a3;
  PPSMetricMonitorLogHandleForCategory(2LL);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PPSMetricMonitorService endWithError:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  v13 = -[PPSMetricMonitorService clients](self, "clients");
  objc_sync_enter(v13);
  v14 = -[PPSMetricMonitorService clients](self, "clients");
  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __40__PPSMetricMonitorService_endWithError___block_invoke;
  v16[3] = &unk_18A3A4760;
  id v15 = v4;
  id v17 = v15;
  [v14 enumerateKeysAndObjectsUsingBlock:v16];

  objc_sync_exit(v13);
}

void __40__PPSMetricMonitorService_endWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 endWithError:*(void *)(a1 + 32)];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v32 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 processIdentifier];
  PPSMetricMonitorLogHandleForCategory(3LL);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v8;
    _os_log_impl(&dword_189441000, v9, OS_LOG_TYPE_DEFAULT, "New client connection from PID %d", (uint8_t *)&buf, 8u);
  }

  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C798670];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setRemoteObjectInterface:v10];

  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C798C38];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 setExportedInterface:v11];

  [v7 exportedInterface];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189604010] setWithObject:objc_opt_class()];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  [v12 setClasses:v13 forSelector:sel_setUpWithConfiguration_completion_ argumentIndex:0 ofReply:0];

  [v7 setExportedObject:self];
  [v7 remoteObjectProxyWithErrorHandler:&__block_literal_global_56];
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSMetricMonitorService clients](self, "clients");
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v15);
  v16 = -[PPSClient initWithConnection:remoteProxy:]( objc_alloc(&OBJC_CLASS___PPSClient),  "initWithConnection:remoteProxy:",  v7,  v14);
  -[PPSMetricMonitorService clients](self, "clients");
  id v17 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:v8];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 setObject:v16 forKeyedSubscript:v18];

  objc_sync_exit(v15);
  objc_initWeak(&buf, self);
  uint64_t v19 = MEMORY[0x1895F87A8];
  v28[0] = MEMORY[0x1895F87A8];
  v28[1] = 3221225472LL;
  v28[2] = __62__PPSMetricMonitorService_listener_shouldAcceptNewConnection___block_invoke_59;
  v28[3] = &unk_18A3A47A8;
  int v30 = v8;
  objc_copyWeak(&v29, &buf);
  v28[4] = self;
  [v7 setInterruptionHandler:v28];
  uint64_t v21 = v19;
  uint64_t v22 = 3221225472LL;
  v23 = __62__PPSMetricMonitorService_listener_shouldAcceptNewConnection___block_invoke_60;
  v24 = &unk_18A3A47A8;
  int v27 = v8;
  objc_copyWeak(&v26, &buf);
  v25 = self;
  [v7 setInvalidationHandler:&v21];
  objc_msgSend(v7, "resume", v21, v22, v23, v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&buf);

  return 1;
}

void __62__PPSMetricMonitorService_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  PPSMetricMonitorLogHandleForCategory(3LL);
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __62__PPSMetricMonitorService_listener_shouldAcceptNewConnection___block_invoke_59(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  PPSMetricMonitorLogHandleForCategory(3LL);
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 48);
    v10[0] = 67109120;
    v10[1] = v3;
    _os_log_impl( &dword_189441000,  v2,  OS_LOG_TYPE_DEFAULT,  "XPC connection from PID: %d interrupted",  (uint8_t *)v10,  8u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained clients];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_enter(v5);
  id v6 = objc_loadWeakRetained((id *)(a1 + 40));
  [v6 clients];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:*(unsigned int *)(a1 + 48)];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKeyedSubscript:v8];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9) {
    [*(id *)(a1 + 32) _handleConnectionEndedWithClient:v9];
  }

  objc_sync_exit(v5);
}

void __62__PPSMetricMonitorService_listener_shouldAcceptNewConnection___block_invoke_60(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1895F89C0];
  PPSMetricMonitorLogHandleForCategory(3LL);
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 48);
    v16[0] = 67109120;
    v16[1] = v3;
    _os_log_impl( &dword_189441000,  v2,  OS_LOG_TYPE_DEFAULT,  "XPC connection from PID %d invalidated",  (uint8_t *)v16,  8u);
  }

  uint64_t v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained clients];
  id v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_enter(v6);
  id v7 = objc_loadWeakRetained((id *)(a1 + 40));
  [v7 clients];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:*(unsigned int *)(a1 + 48)];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 objectForKeyedSubscript:v9];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10) {
    [*(id *)(a1 + 32) _handleConnectionEndedWithClient:v10];
  }
  [*(id *)(a1 + 32) clients];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v12 = [v11 count] == 0;

  if (v12)
  {
    PPSMetricMonitorLogHandleForCategory(2LL);
    v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16[0]) = 0;
      _os_log_impl(&dword_189441000, v13, OS_LOG_TYPE_DEFAULT, "All clients disconnected", (uint8_t *)v16, 2u);
    }

    id v14 = objc_loadWeakRetained(v4);
    [v14 delegate];
    id v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v15 allClientsDidDisconnect];
  }

  objc_sync_exit(v6);
}

- (void)setUpWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  [MEMORY[0x189607B30] currentConnection];
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 processIdentifier];

  PPSMetricMonitorLogHandleForCategory(2LL);
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[PPSMetricMonitorService setUpWithConfiguration:completion:].cold.1();
  }

  -[PPSMetricMonitorService clients](self, "clients");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v11);
  -[PPSMetricMonitorService clients](self, "clients");
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:v9];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v12 objectForKeyedSubscript:v13];

  [(id)v14 setConfig:v6];
  objc_sync_exit(v11);

  -[PPSMetricMonitorService delegate](self, "delegate");
  id v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v14) = [v15 isMonitoringMetrics];

  if ((v14 & 1) == 0)
  {
    v16 = -[PPSMetricMonitorService delegate](self, "delegate");
    [v16 setUpForMonitoring];
  }

  v7[2](v7);
}

- (void)startMonitoringSystemMetricsWithCompletion:(id)a3
{
  v23[1] = *MEMORY[0x1895F89C0];
  uint64_t v4 = (void (**)(id, void))a3;
  [MEMORY[0x189607B30] currentConnection];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 processIdentifier];

  PPSMetricMonitorLogHandleForCategory(2LL);
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[PPSMetricMonitorService startMonitoringSystemMetricsWithCompletion:].cold.1();
  }

  -[PPSMetricMonitorService clients](self, "clients");
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v7);
  -[PPSMetricMonitorService clients](self, "clients");
  uint64_t v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = (void *)MEMORY[0x189607968];
  [MEMORY[0x189607B30] currentConnection];
  uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "numberWithInt:", objc_msgSend(v10, "processIdentifier"));
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 objectForKeyedSubscript:v11];
  BOOL v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v7);
  if (-[PPSMetricMonitorService _canStartMonitoringForClient:](self, "_canStartMonitoringForClient:", v12))
  {
    v13 = -[PPSMetricMonitorService delegate](self, "delegate");
    char v14 = [v13 isMonitoringMetrics];

    if ((v14 & 1) == 0)
    {
      -[PPSMetricMonitorService delegate](self, "delegate");
      id v15 = (void *)objc_claimAutoreleasedReturnValue();
      [v12 config];
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v17 = [v16 mode];
      [v12 config];
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      [v18 updateInterval];
      objc_msgSend(v15, "startMonitoringWithConfigurationMode:updateInterval:", v17);
    }

    v4[2](v4, 0LL);
  }

  else
  {
    uint64_t v19 = (void *)MEMORY[0x189607870];
    uint64_t v22 = *MEMORY[0x1896075E0];
    v23[0] = @"Service is busy";
    [MEMORY[0x189603F68] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    [v19 errorWithDomain:@"com.apple.PerfPowerMetricMonitor" code:2 userInfo:v20];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v4)[2](v4, v21);
  }
}

- (void)startMonitoringProcessWithPID:(id)a3 completion:(id)a4
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v6 = (void *)MEMORY[0x189603F18];
  id v7 = a4;
  id v8 = a3;
  [v6 arrayWithObjects:&v10 count:1];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PPSMetricMonitorService startMonitoringProcessesWithPID:completion:]( self,  "startMonitoringProcessesWithPID:completion:",  v9,  v7,  v10,  v11);
}

- (void)startMonitoringProcessesWithPID:(id)a3 completion:(id)a4
{
  v26[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  [MEMORY[0x189607B30] currentConnection];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 processIdentifier];

  PPSMetricMonitorLogHandleForCategory(2LL);
  uint64_t v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[PPSMetricMonitorService startMonitoringProcessesWithPID:completion:].cold.1();
  }

  -[PPSMetricMonitorService clients](self, "clients");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v10);
  -[PPSMetricMonitorService clients](self, "clients");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v12 = (void *)MEMORY[0x189607968];
  [MEMORY[0x189607B30] currentConnection];
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "numberWithInt:", objc_msgSend(v13, "processIdentifier"));
  char v14 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 objectForKeyedSubscript:v14];
  id v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v10);
  if (-[PPSMetricMonitorService _canStartMonitoringForClient:](self, "_canStartMonitoringForClient:", v15))
  {
    v16 = -[PPSMetricMonitorService delegate](self, "delegate");
    char v17 = [v16 isMonitoringMetrics];

    if ((v17 & 1) == 0)
    {
      v18 = -[PPSMetricMonitorService delegate](self, "delegate");
      [v15 config];
      uint64_t v19 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v20 = [v19 mode];
      [v15 config];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 updateInterval];
      objc_msgSend(v18, "startMonitoringWithConfigurationMode:updateInterval:", v20);
    }

    v7[2](v7, 0LL);
  }

  else
  {
    uint64_t v22 = (void *)MEMORY[0x189607870];
    uint64_t v25 = *MEMORY[0x1896075E0];
    v26[0] = @"Service is busy";
    [MEMORY[0x189603F68] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v22 errorWithDomain:@"com.apple.PerfPowerMetricMonitor" code:2 userInfo:v23];
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v7)[2](v7, v24);
  }
}

- (void)startMonitoringProcessWithName:(id)a3 completion:(id)a4
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v10 = a3;
  id v6 = (void *)MEMORY[0x189603F18];
  id v7 = a4;
  id v8 = a3;
  [v6 arrayWithObjects:&v10 count:1];
  uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PPSMetricMonitorService startMonitoringProcessesWithName:completion:]( self,  "startMonitoringProcessesWithName:completion:",  v9,  v7,  v10,  v11);
}

- (void)startMonitoringProcessesWithName:(id)a3 completion:(id)a4
{
  uint64_t v38 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v30 = a4;
  [MEMORY[0x189607B30] currentConnection];
  id v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 processIdentifier];

  PPSMetricMonitorLogHandleForCategory(2LL);
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[PPSMetricMonitorService startMonitoringProcessesWithName:completion:].cold.2();
  }

  id v9 = objc_alloc_init(MEMORY[0x189603FA8]);
  __int128 v31 = 0u;
  __int128 v32 = 0u;
  __int128 v33 = 0u;
  __int128 v34 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v32;
    do
    {
      for (uint64_t i = 0LL; i != v12; ++i)
      {
        if (*(void *)v32 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v31 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x189607968];
        -[PPSMetricMonitorService delegate](self, "delegate");
        char v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "numberWithInt:", objc_msgSend(v17, "pidForProcessName:", v15));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        [v9 addObject:v18];
      }

      uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v37 count:16];
    }

    while (v12);
  }

  if ([v9 count])
  {
    uint64_t v19 = v30;
    -[PPSMetricMonitorService startMonitoringProcessesWithPID:completion:]( self,  "startMonitoringProcessesWithPID:completion:",  v9,  v30);
  }

  else
  {
    PPSMetricMonitorLogHandleForCategory(2LL);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = v30;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[PPSMetricMonitorService startMonitoringProcessesWithName:completion:].cold.1( (uint64_t)v10,  v20,  v21,  v22,  v23,  v24,  v25,  v26);
    }

    int v27 = (void *)MEMORY[0x189607870];
    uint64_t v35 = *MEMORY[0x1896075E0];
    v36 = @"Invalid process name";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    [v27 errorWithDomain:@"com.apple.PerfPowerMetricMonitor" code:5 userInfo:v28];
    id v29 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v30 + 2))(v30, v29);
  }
}

- (void)startMonitoringProcessesWithNames:(id)a3 withPIDs:(id)a4 completion:(id)a5
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void))a5;
  [MEMORY[0x189607B30] currentConnection];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 processIdentifier];

  PPSMetricMonitorLogHandleForCategory(2LL);
  uint64_t v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)id buf = 136315906;
    id v30 = "-[PPSMetricMonitorService startMonitoringProcessesWithNames:withPIDs:completion:]";
    __int16 v31 = 1024;
    int v32 = v12;
    __int16 v33 = 2112;
    id v34 = v8;
    __int16 v35 = 2112;
    id v36 = v9;
    _os_log_debug_impl( &dword_189441000,  v13,  OS_LOG_TYPE_DEBUG,  "%s called by client: %d process names: %@, PIDs: %@ ",  buf,  0x26u);
  }

  -[PPSMetricMonitorService clients](self, "clients");
  char v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v14);
  -[PPSMetricMonitorService clients](self, "clients");
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithInt:v12];
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 objectForKeyedSubscript:v16];
  char v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v14);
  if (-[PPSMetricMonitorService _canStartMonitoringForClient:](self, "_canStartMonitoringForClient:", v17))
  {
    v18 = -[PPSMetricMonitorService delegate](self, "delegate");
    char v19 = [v18 isMonitoringMetrics];

    if ((v19 & 1) == 0)
    {
      -[PPSMetricMonitorService delegate](self, "delegate");
      uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
      [v17 config];
      uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
      uint64_t v22 = [v21 mode];
      [v17 config];
      uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
      [v23 updateInterval];
      objc_msgSend(v20, "startMonitoringWithConfigurationMode:updateInterval:", v22);
    }

    v10[2](v10, 0LL);
  }

  else
  {
    uint64_t v24 = (void *)MEMORY[0x189607870];
    uint64_t v27 = *MEMORY[0x1896075E0];
    v28 = @"Service is busy";
    [MEMORY[0x189603F68] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 errorWithDomain:@"com.apple.PerfPowerMetricMonitor" code:2 userInfo:v25];
    uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v10)[2](v10, v26);
  }
}

- (void)finishMonitoringAndSendMetrics
{
}

- (void)setUpdateInterval:(id)a3 completion:(id)a4
{
  v18[1] = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  [MEMORY[0x189607B30] currentConnection];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 processIdentifier];

  PPSMetricMonitorLogHandleForCategory(2LL);
  id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[PPSMetricMonitorService setUpdateInterval:completion:].cold.1();
  }

  -[PPSMetricMonitorService clients](self, "clients");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v10);
  -[PPSMetricMonitorService clients](self, "clients");
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 count];

  objc_sync_exit(v10);
  if (v12 == 1)
  {
    -[PPSMetricMonitorService delegate](self, "delegate");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 doubleValue];
    objc_msgSend(v13, "changeUpdateInterval:");

    v7[2](v7, 0LL);
  }

  else
  {
    char v14 = (void *)MEMORY[0x189607870];
    uint64_t v17 = *MEMORY[0x1896075E0];
    v18[0] = @"Unable to change update interval while multiple clients are connected";
    [MEMORY[0x189603F68] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
    [v14 errorWithDomain:@"com.apple.PerfPowerMetricMonitor" code:8 userInfo:v15];
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *))v7)[2](v7, v16);
  }
}

- (BOOL)_canStartMonitoringForClient:(id)a3
{
  uint64_t v37 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  [v4 config];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    PPSMetricMonitorLogHandleForCategory(2LL);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[PPSMetricMonitorService _canStartMonitoringForClient:].cold.1(v4, v20);
    }
    goto LABEL_12;
  }

  -[PPSMetricMonitorService delegate](self, "delegate");
  id v6 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = [v6 isMonitoringMetrics];

  if (!v7)
  {
LABEL_13:
    BOOL v25 = 1;
    goto LABEL_14;
  }

  -[PPSMetricMonitorService delegate](self, "delegate");
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 currentUpdateMode];

  -[PPSMetricMonitorService delegate](self, "delegate");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v10 currentUpdateInterval];
  double v12 = v11;

  [v4 config];
  uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v14 = [v13 mode];

  if (v9 != v14)
  {
    PPSMetricMonitorLogHandleForCategory(2LL);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      [v4 connection];
      uint64_t v27 = (void *)objc_claimAutoreleasedReturnValue();
      int v28 = [v27 processIdentifier];
      [v4 config];
      id v29 = (void *)objc_claimAutoreleasedReturnValue();
      int v31 = 67109632;
      int v32 = v28;
      __int16 v33 = 2048;
      double v34 = *(double *)&v9;
      __int16 v35 = 2048;
      uint64_t v36 = [v29 mode];
      _os_log_impl( &dword_189441000,  v20,  OS_LOG_TYPE_DEFAULT,  "Rejecting client %d due to incompatible mode (current: %ld; requested: %ld)",
        (uint8_t *)&v31,
        0x1Cu);
    }

    goto LABEL_12;
  }

  [v4 config];
  uint64_t v15 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = [v15 mode];

  if (v16 == 3)
  {
    PPSMetricMonitorLogHandleForCategory(2LL);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    [v4 connection];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    int v31 = 67109120;
    int v32 = [v21 processIdentifier];
    id v30 = "Rejecting client %d with mode updateOnSnapshot; already running";
LABEL_21:
    _os_log_impl(&dword_189441000, v20, OS_LOG_TYPE_DEFAULT, v30, (uint8_t *)&v31, 8u);
    goto LABEL_22;
  }

  if (v16 == 1)
  {
    PPSMetricMonitorLogHandleForCategory(2LL);
    uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    [v4 connection];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    int v31 = 67109120;
    int v32 = [v21 processIdentifier];
    id v30 = "Rejecting client %d with mode updateOnStop; already running";
    goto LABEL_21;
  }

  if (v16) {
    goto LABEL_13;
  }
  [v4 config];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 updateInterval];
  double v19 = vabdd_f64(v12, v18);

  if (v19 <= 0.001) {
    goto LABEL_13;
  }
  PPSMetricMonitorLogHandleForCategory(2LL);
  uint64_t v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    [v4 connection];
    uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
    int v22 = [v21 processIdentifier];
    [v4 config];
    uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 updateInterval];
    int v31 = 67109632;
    int v32 = v22;
    __int16 v33 = 2048;
    double v34 = v12;
    __int16 v35 = 2048;
    uint64_t v36 = v24;
    _os_log_impl( &dword_189441000,  v20,  OS_LOG_TYPE_DEFAULT,  "Rejecting client %d due to incompatible update interval (current: %f; requested: %f)",
      (uint8_t *)&v31,
      0x1Cu);

LABEL_22:
  }

- (void)_handleConnectionEndedWithClient:(id)a3
{
  id v9 = a3;
  -[PPSMetricMonitorService clients](self, "clients");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  -[PPSMetricMonitorService clients](self, "clients");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  id v6 = (void *)MEMORY[0x189607968];
  [v9 connection];
  int v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "processIdentifier"));
  id v8 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 removeObjectForKey:v8];

  objc_sync_exit(v4);
}

- (PPSMetricMonitorServiceDelegate)delegate
{
  return (PPSMetricMonitorServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)clients
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setClients:(id)a3
{
}

- (void).cxx_destruct
{
}

  ;
}

- (void)endWithError:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)setUpWithConfiguration:completion:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_189441000, v0, v1, "%s called by client: %d config: %@", v2);
  OUTLINED_FUNCTION_3_0();
}

- (void)startMonitoringSystemMetricsWithCompletion:.cold.1()
{
}

- (void)startMonitoringProcessesWithPID:completion:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_189441000, v0, v1, "%s called by client: %d PID: %@", v2);
  OUTLINED_FUNCTION_3_0();
}

- (void)startMonitoringProcessesWithName:(uint64_t)a3 completion:(uint64_t)a4 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)startMonitoringProcessesWithName:completion:.cold.2()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_189441000, v0, v1, "%s called by client: %d processName: %@ ", v2);
  OUTLINED_FUNCTION_3_0();
}

- (void)setUpdateInterval:completion:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_189441000, v0, v1, "%s called by client: %d interval: %@", v2);
  OUTLINED_FUNCTION_3_0();
}

- (void)_canStartMonitoringForClient:(void *)a1 .cold.1(void *a1, os_log_s *a2)
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  [a1 connection];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 67109120;
  v4[1] = [v3 processIdentifier];
  _os_log_fault_impl(&dword_189441000, a2, OS_LOG_TYPE_FAULT, "Client %d config is nil", (uint8_t *)v4, 8u);

  OUTLINED_FUNCTION_3();
}

@end