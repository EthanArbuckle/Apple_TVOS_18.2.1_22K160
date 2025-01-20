@interface PPSMetricMonitor
- (BOOL)isInterrupted;
- (BOOL)setUpdateInterval:(double)a3 error:(id *)a4;
- (BOOL)startMonitoringSystemMetricsWithError:(id *)a3;
- (NSArray)currentProcessNames;
- (NSArray)currentProcessPIDs;
- (NSXPCConnection)connection;
- (OS_dispatch_queue)delegateQueue;
- (OS_dispatch_queue)xpcMessagingQueue;
- (PPSMetricMonitor)initWithConfiguration:(id)a3 delegate:(id)a4 error:(id *)a5;
- (PPSMetricMonitorConfiguration)config;
- (PPSMetricMonitorDelegate)delegate;
- (PPSMetricMonitorServiceInterface)remoteProxy;
- (int64_t)monitoringState;
- (void)_handleXPCInterruption;
- (void)_resetMonitoringState;
- (void)_resumeMonitoring;
- (void)_setUpXPCConnectionWithConfig:(id)a3;
- (void)endWithError:(id)a3;
- (void)setConfig:(id)a3;
- (void)setConnection:(id)a3;
- (void)setCurrentProcessNames:(id)a3;
- (void)setCurrentProcessPIDs:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)setIsInterrupted:(BOOL)a3;
- (void)setMonitoringState:(int64_t)a3;
- (void)setRemoteProxy:(id)a3;
- (void)setXpcMessagingQueue:(id)a3;
- (void)startMonitoringSystemMetricsOnly;
- (void)stopMonitoring;
@end

@implementation PPSMetricMonitor

- (PPSMetricMonitor)initWithConfiguration:(id)a3 delegate:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  PPSMetricMonitorLogHandleForCategory(1LL);
  v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[PPSMetricMonitor initWithConfiguration:delegate:error:].cold.2(v10, v11, v12, v13, v14, v15, v16, v17);
  }

  v30.receiver = self;
  v30.super_class = (Class)&OBJC_CLASS___PPSMetricMonitor;
  v18 = -[PPSMetricMonitor init](&v30, sel_init);
  if (v18)
  {
    dispatch_queue_attr_make_with_qos_class(0LL, QOS_CLASS_USER_INITIATED, 0);
    v19 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v18->_delegate, v9);
    objc_storeStrong((id *)&v18->_config, a3);
    currentProcessPIDs = v18->_currentProcessPIDs;
    v18->_monitoringState = 0LL;
    v18->_currentProcessPIDs = 0LL;

    v18->_isInterrupted = 0;
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.PerfPowerMetricMonitor.xpcMessagingQueue", v19);
    xpcMessagingQueue = v18->_xpcMessagingQueue;
    v18->_xpcMessagingQueue = (OS_dispatch_queue *)v21;

    dispatch_queue_t v23 = dispatch_queue_create("com.apple.PerfPowerMetricMonitor.delegateQueue", v19);
    delegateQueue = v18->_delegateQueue;
    v18->_delegateQueue = (OS_dispatch_queue *)v23;

    uint64_t v25 = [v8 mode];
    double v26 = 0.0;
    if ((unint64_t)(v25 - 1) >= 3)
    {
      if (v25) {
        goto LABEL_11;
      }
      [v8 updateInterval];
      double v26 = 0.2;
      if (v27 >= 0.2) {
        goto LABEL_11;
      }
      PPSMetricMonitorLogHandleForCategory(1LL);
      v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
        -[PPSMetricMonitor initWithConfiguration:delegate:error:].cold.1(v8, v28);
      }
    }

    [v8 setUpdateInterval:v26];
LABEL_11:
  }

  return v18;
}

- (BOOL)startMonitoringSystemMetricsWithError:(id *)a3
{
  v40[1] = *MEMORY[0x1895F89C0];
  PPSMetricMonitorLogHandleForCategory(1LL);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl( &dword_189441000,  v5,  OS_SIGNPOST_EVENT,  0xEEEEB0B5B2B2EEEELL,  "startMonitoringSystemMetrics",  (const char *)&unk_18944D0F9,  buf,  2u);
  }

  PPSMetricMonitorLogHandleForCategory(1LL);
  v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[PPSMetricMonitor startMonitoringSystemMetricsWithError:].cold.2(v6, v7, v8, v9, v10, v11, v12, v13);
  }

  if (-[PPSMetricMonitor monitoringState](self, "monitoringState")
    && !-[PPSMetricMonitor isInterrupted](self, "isInterrupted"))
  {
    if (a3)
    {
      PPSMetricMonitorLogHandleForCategory(1LL);
      v20 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[PPSMetricMonitor startMonitoringSystemMetricsWithError:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);
      }

      v28 = (void *)MEMORY[0x189607870];
      uint64_t v39 = *MEMORY[0x1896075E0];
      v40[0] = @"Already monitoring";
      [MEMORY[0x189603F68] dictionaryWithObjects:v40 forKeys:&v39 count:1];
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      [v28 errorWithDomain:@"com.apple.PerfPowerMetricMonitor" code:7 userInfo:v29];
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

    return 0;
  }

  else
  {
    -[PPSMetricMonitor _resetMonitoringState](self, "_resetMonitoringState");
    -[PPSMetricMonitor connection](self, "connection");
    uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
    BOOL v15 = v14 == 0LL;

    if (v15)
    {
      -[PPSMetricMonitor config](self, "config");
      uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[PPSMetricMonitor _setUpXPCConnectionWithConfig:](self, "_setUpXPCConnectionWithConfig:", v16);
    }

    *(void *)buf = 0LL;
    v34 = buf;
    uint64_t v35 = 0x3032000000LL;
    v36 = __Block_byref_object_copy_;
    v37 = __Block_byref_object_dispose_;
    id v38 = 0LL;
    -[PPSMetricMonitor xpcMessagingQueue](self, "xpcMessagingQueue");
    uint64_t v17 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1895F87A8];
    v32[1] = 3221225472LL;
    v32[2] = __58__PPSMetricMonitor_startMonitoringSystemMetricsWithError___block_invoke;
    v32[3] = &unk_18A3A4618;
    v32[4] = self;
    v32[5] = buf;
    dispatch_sync(v17, v32);

    v18 = (void *)*((void *)v34 + 5);
    BOOL v19 = v18 == 0LL;
    if (v18)
    {
      if (a3) {
        *a3 = v18;
      }
    }

    else
    {
      -[PPSMetricMonitor connection](self, "connection");
      objc_super v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30) {
        -[PPSMetricMonitor setMonitoringState:](self, "setMonitoringState:", 1LL);
      }
    }

    _Block_object_dispose(buf, 8);
  }

  return v19;
}

void __58__PPSMetricMonitor_startMonitoringSystemMetricsWithError___block_invoke(uint64_t a1)
{
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1895F87A8];
  v3[1] = 3221225472LL;
  v3[2] = __58__PPSMetricMonitor_startMonitoringSystemMetricsWithError___block_invoke_2;
  v3[3] = &unk_18A3A45F0;
  v3[4] = *(void *)(a1 + 40);
  [v2 startMonitoringSystemMetricsWithCompletion:v3];
}

void __58__PPSMetricMonitor_startMonitoringSystemMetricsWithError___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)startMonitoringSystemMetricsOnly
{
}

- (void)stopMonitoring
{
}

void __34__PPSMetricMonitor_stopMonitoring__block_invoke(uint64_t a1)
{
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 finishMonitoringAndSendMetrics];
}

- (BOOL)setUpdateInterval:(double)a3 error:(id *)a4
{
  double v6 = 0.2;
  if (a3 >= 0.2)
  {
    double v6 = a3;
  }

  else
  {
    PPSMetricMonitorLogHandleForCategory(1LL);
    uint64_t v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[PPSMetricMonitor setUpdateInterval:error:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }

  uint64_t v20 = 0LL;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000LL;
  uint64_t v23 = __Block_byref_object_copy_;
  uint64_t v24 = __Block_byref_object_dispose_;
  id v25 = 0LL;
  -[PPSMetricMonitor remoteProxy](self, "remoteProxy");
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189607968] numberWithDouble:v6];
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1895F87A8];
  v19[1] = 3221225472LL;
  v19[2] = __44__PPSMetricMonitor_setUpdateInterval_error___block_invoke;
  v19[3] = &unk_18A3A45F0;
  v19[4] = &v20;
  [v15 setUpdateInterval:v16 completion:v19];

  uint64_t v17 = (void *)v21[5];
  if (a4 && v17) {
    *a4 = v17;
  }
  _Block_object_dispose(&v20, 8);

  return v17 == 0LL;
}

void __44__PPSMetricMonitor_setUpdateInterval_error___block_invoke(uint64_t a1, void *a2)
{
}

- (void)_resetMonitoringState
{
}

- (void)endWithError:(id)a3
{
  id v4 = a3;
  v5 = -[PPSMetricMonitor delegate](self, "delegate");
  [v5 metricMonitor:self didEndWithError:v4];

  -[PPSMetricMonitor _resetMonitoringState](self, "_resetMonitoringState");
}

- (void)_setUpXPCConnectionWithConfig:(id)a3
{
  id v4 = a3;
  PPSMetricMonitorLogHandleForCategory(3LL);
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[PPSMetricMonitor _setUpXPCConnectionWithConfig:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  }

  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x189607B30]) initWithMachServiceName:@"com.apple.PerfPowerMetricMonitor.xpc" options:4096];
  -[PPSMetricMonitor setConnection:](self, "setConnection:", v13);

  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C798C38];
  uint64_t v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSMetricMonitor connection](self, "connection");
  BOOL v15 = (void *)objc_claimAutoreleasedReturnValue();
  [v15 setRemoteObjectInterface:v14];

  -[PPSMetricMonitor connection](self, "connection");
  uint64_t v16 = (void *)objc_claimAutoreleasedReturnValue();
  [v16 remoteObjectInterface];
  uint64_t v17 = (void *)objc_claimAutoreleasedReturnValue();
  [MEMORY[0x189604010] setWithObject:objc_opt_class()];
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  [v17 setClasses:v18 forSelector:sel_setUpWithConfiguration_completion_ argumentIndex:0 ofReply:0];

  [MEMORY[0x189607B48] interfaceWithProtocol:&unk_18C798670];
  BOOL v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSMetricMonitor connection](self, "connection");
  uint64_t v20 = (void *)objc_claimAutoreleasedReturnValue();
  [v20 setExportedInterface:v19];

  -[PPSMetricMonitor connection](self, "connection");
  uint64_t v21 = (void *)objc_claimAutoreleasedReturnValue();
  [v21 setExportedObject:self];

  objc_initWeak(&location, self);
  -[PPSMetricMonitor connection](self, "connection");
  uint64_t v22 = (void *)objc_claimAutoreleasedReturnValue();
  [v22 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global];
  uint64_t v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPSMetricMonitor setRemoteProxy:](self, "setRemoteProxy:", v23);

  -[PPSMetricMonitor connection](self, "connection");
  uint64_t v24 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v25 = MEMORY[0x1895F87A8];
  v36[0] = MEMORY[0x1895F87A8];
  v36[1] = 3221225472LL;
  v36[2] = __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_38;
  v36[3] = &unk_18A3A46A8;
  objc_copyWeak(&v37, &location);
  [v24 setInterruptionHandler:v36];

  -[PPSMetricMonitor connection](self, "connection");
  uint64_t v26 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v25;
  v34[1] = 3221225472LL;
  v34[2] = __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_39;
  v34[3] = &unk_18A3A46A8;
  objc_copyWeak(&v35, &location);
  [v26 setInvalidationHandler:v34];

  PPSMetricMonitorLogHandleForCategory(3LL);
  uint64_t v27 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_189441000, v27, OS_LOG_TYPE_DEFAULT, "Connecting to powerlogHelperd", buf, 2u);
  }
  v28 = -[PPSMetricMonitor connection](self, "connection");
  [v28 resume];

  -[PPSMetricMonitor xpcMessagingQueue](self, "xpcMessagingQueue");
  v29 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v31[0] = v25;
  v31[1] = 3221225472LL;
  v31[2] = __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_43;
  v31[3] = &unk_18A3A46D0;
  v31[4] = self;
  id v32 = v4;
  id v30 = v4;
  dispatch_async(v29, v31);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);
}

void __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  PPSMetricMonitorLogHandleForCategory(3LL);
  v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

void __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_38(uint64_t a1)
{
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_38_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleXPCInterruption];
}

void __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_39(uint64_t a1)
{
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_39_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  uint64_t v10 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v10);
  [WeakRetained setConnection:0];

  id v12 = objc_loadWeakRetained(v10);
  [v12 setRemoteProxy:0];

  id v13 = objc_loadWeakRetained(v10);
  uint64_t v14 = [v13 monitoringState];

  if (v14)
  {
    id v15 = objc_loadWeakRetained(v10);
    [v15 delegateQueue];
    uint64_t v16 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_40;
    block[3] = &unk_18A3A46A8;
    objc_copyWeak(&v18, v10);
    dispatch_async(v16, block);

    objc_destroyWeak(&v18);
  }

void __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_40(uint64_t a1)
{
  v6[1] = *MEMORY[0x1895F89C0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = (void *)MEMORY[0x189607870];
  uint64_t v5 = *MEMORY[0x1896075E0];
  v6[0] = @"XPC connection invalidated";
  [MEMORY[0x189603F68] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  [v2 errorWithDomain:@"com.apple.PerfPowerMetricMonitor" code:1 userInfo:v3];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  [WeakRetained endWithError:v4];
}

void __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_43(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_2;
  v4[3] = &unk_18A3A46A8;
  objc_copyWeak(&v5, &location);
  [v2 setUpWithConfiguration:v3 completion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_2(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained delegate];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    id v5 = objc_loadWeakRetained(v1);
    [v5 delegateQueue];
    uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_3;
    block[3] = &unk_18A3A46A8;
    objc_copyWeak(&v8, v1);
    dispatch_async(v6, block);

    objc_destroyWeak(&v8);
  }

void __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained delegate];
  id v1 = (void *)objc_claimAutoreleasedReturnValue();
  [v1 metricMonitorDidBecomeReady:WeakRetained];
}

- (void)_handleXPCInterruption
{
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  char v4 = objc_opt_respondsToSelector();

  uint64_t v5 = MEMORY[0x1895F87A8];
  if ((v4 & 1) != 0)
  {
    -[PPSMetricMonitor delegateQueue](self, "delegateQueue");
    uint64_t v6 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
    block[0] = v5;
    block[1] = 3221225472LL;
    block[2] = __42__PPSMetricMonitor__handleXPCInterruption__block_invoke;
    block[3] = &unk_18A3A4640;
    void block[4] = self;
    dispatch_async(v6, block);
  }

  -[PPSMetricMonitor xpcMessagingQueue](self, "xpcMessagingQueue");
  uint64_t v7 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  v8[1] = 3221225472LL;
  v8[2] = __42__PPSMetricMonitor__handleXPCInterruption__block_invoke_2;
  v8[3] = &unk_18A3A4640;
  v8[4] = self;
  dispatch_async(v7, v8);
}

void __42__PPSMetricMonitor__handleXPCInterruption__block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 metricMonitorInterruptionDidBegin:*(void *)(a1 + 32)];
}

void __42__PPSMetricMonitor__handleXPCInterruption__block_invoke_2(uint64_t a1)
{
  id v2 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) config];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __42__PPSMetricMonitor__handleXPCInterruption__block_invoke_3;
  v4[3] = &unk_18A3A46A8;
  objc_copyWeak(&v5, &location);
  [v2 setUpWithConfiguration:v3 completion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __42__PPSMetricMonitor__handleXPCInterruption__block_invoke_3(uint64_t a1)
{
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_189441000, v2, OS_LOG_TYPE_DEFAULT, "Resumed XPC connection to powerlogHelperd", buf, 2u);
  }

  dispatch_get_global_queue(33LL, 0LL);
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __42__PPSMetricMonitor__handleXPCInterruption__block_invoke_48;
  block[3] = &unk_18A3A46A8;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  dispatch_async(v3, block);

  objc_destroyWeak(&v5);
}

void __42__PPSMetricMonitor__handleXPCInterruption__block_invoke_48(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resumeMonitoring];
}

- (void)_resumeMonitoring
{
}

void __37__PPSMetricMonitor__resumeMonitoring__block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 metricMonitorInterruptionDidEnd:*(void *)(a1 + 32)];
}

void __37__PPSMetricMonitor__resumeMonitoring__block_invoke_2(uint64_t a1)
{
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setObject:@"Failed to resume after interruption" forKeyedSubscript:*MEMORY[0x1896075E0]];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    [v5 setObject:v2 forKeyedSubscript:*MEMORY[0x189607798]];
  }
  uint64_t v3 = *(void **)(a1 + 40);
  [MEMORY[0x189607870] errorWithDomain:@"com.apple.PerfPowerMetricMonitor" code:3 userInfo:v5];
  char v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v3 endWithError:v4];
}

- (PPSMetricMonitorDelegate)delegate
{
  return (PPSMetricMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (PPSMetricMonitorConfiguration)config
{
  return (PPSMetricMonitorConfiguration *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setConfig:(id)a3
{
}

- (NSXPCConnection)connection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setConnection:(id)a3
{
}

- (PPSMetricMonitorServiceInterface)remoteProxy
{
  return (PPSMetricMonitorServiceInterface *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setRemoteProxy:(id)a3
{
}

- (int64_t)monitoringState
{
  return self->_monitoringState;
}

- (void)setMonitoringState:(int64_t)a3
{
  self->_monitoringState = a3;
}

- (NSArray)currentProcessPIDs
{
  return (NSArray *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setCurrentProcessPIDs:(id)a3
{
}

- (NSArray)currentProcessNames
{
  return (NSArray *)objc_getProperty(self, a2, 64LL, 1);
}

- (void)setCurrentProcessNames:(id)a3
{
}

- (BOOL)isInterrupted
{
  return self->_isInterrupted;
}

- (void)setIsInterrupted:(BOOL)a3
{
  self->_isInterrupted = a3;
}

- (OS_dispatch_queue)xpcMessagingQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72LL, 1);
}

- (void)setXpcMessagingQueue:(id)a3
{
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80LL, 1);
}

- (void)setDelegateQueue:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithConfiguration:(void *)a1 delegate:(os_log_s *)a2 error:.cold.1(void *a1, os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  [a1 updateInterval];
  int v4 = 134217984;
  uint64_t v5 = v3;
  _os_log_error_impl( &dword_189441000,  a2,  OS_LOG_TYPE_ERROR,  "Update interval smaller than 0.2 s is not supported (got %f); defaulting to 0.2 s",
    (uint8_t *)&v4,
    0xCu);
}

- (void)initWithConfiguration:(uint64_t)a3 delegate:(uint64_t)a4 error:(uint64_t)a5 .cold.2( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)startMonitoringSystemMetricsWithError:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)startMonitoringSystemMetricsWithError:(uint64_t)a3 .cold.2( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)setUpdateInterval:(uint64_t)a3 error:(uint64_t)a4 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_3();
}

- (void)_setUpXPCConnectionWithConfig:(uint64_t)a3 .cold.1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_cold_1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_38_cold_1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

void __50__PPSMetricMonitor__setUpXPCConnectionWithConfig___block_invoke_39_cold_1( os_log_s *a1,  uint64_t a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

@end