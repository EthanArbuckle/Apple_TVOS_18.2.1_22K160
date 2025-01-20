@interface PLDiscretionaryEnergyMonitor
+ (double)getDiscretionaryEnergyBudget;
- (BOOL)debugMode;
- (BOOL)isCharging;
- (NSDate)powerlogTimestampLast;
- (NSDate)powerlogTimestampPrevious;
- (NSDictionary)lastPowerlogResponse;
- (NSMutableArray)quickEnergySnapshots;
- (NSMutableDictionary)mockData;
- (OS_dispatch_queue)workQueue;
- (OS_dispatch_source)powerlogQueryTimer;
- (OS_dispatch_source)quickEnergyAccumulatorTimer;
- (PLDiscretionaryEnergyMonitor)initWithCompletionBlock:(id)a3;
- (PLDiscretionaryEnergyMonitor)initWithDebugMode:(BOOL)a3 andMockData:(id)a4 andCompletionBlock:(id)a5;
- (PLDiscretionaryIntervalManager)intervalManager;
- (double)accumulatedCPUEnergy;
- (double)accumulatedNetworkEnergy;
- (double)getPowerlogEnergySum:(id)a3;
- (double)lastReportedCPUEnergy;
- (double)lastReportedNetworkEnergy;
- (double)lastReportedTotalEnergy;
- (double)powerlogEnergyDiff;
- (double)powerlogEnergyLast;
- (double)powerlogEnergyPrevious;
- (id)completionBlock;
- (id)createPowerlogQueryTimer;
- (id)createQuickEnergyAccumulatorTimer;
- (void)accumulateQuickEnergy;
- (void)createQuickEnergyAccumulatorTimer;
- (void)generateEnergyReport;
- (void)incrementCPUEnergy:(double)a3;
- (void)incrementNetworkEnergy:(double)a3;
- (void)logEnergyReport:(id)a3;
- (void)logPowerlogResponse:(id)a3;
- (void)logQuickEnergySnapshots;
- (void)queryPowerlogForDiscretionaryEnergy;
- (void)reportChargingStatus:(BOOL)a3;
- (void)reportStartEvent:(id)a3 withInfo:(id)a4;
- (void)reportStopEvent:(id)a3 withInfo:(id)a4;
- (void)runCompletionBlockWithEnergyResponse:(id)a3;
- (void)setAccumulatedCPUEnergy:(double)a3;
- (void)setAccumulatedNetworkEnergy:(double)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setDebugMode:(BOOL)a3;
- (void)setIntervalManager:(id)a3;
- (void)setIsCharging:(BOOL)a3;
- (void)setLastPowerlogResponse:(id)a3;
- (void)setLastReportedCPUEnergy:(double)a3;
- (void)setLastReportedNetworkEnergy:(double)a3;
- (void)setLastReportedTotalEnergy:(double)a3;
- (void)setMockData:(id)a3;
- (void)setPowerlogEnergyDiff:(double)a3;
- (void)setPowerlogEnergyLast:(double)a3;
- (void)setPowerlogEnergyPrevious:(double)a3;
- (void)setPowerlogQueryTimer:(id)a3;
- (void)setPowerlogTimestampLast:(id)a3;
- (void)setPowerlogTimestampPrevious:(id)a3;
- (void)setQuickEnergyAccumulatorTimer:(id)a3;
- (void)setQuickEnergySnapshots:(id)a3;
- (void)setStateForNotification:(id)a3 withState:(id)a4;
- (void)setWorkQueue:(id)a3;
- (void)setupNotificationListeners;
- (void)testHighVolumeStartStopReporting:(id)a3 withInfo:(id)a4 withNumIterations:(double)a5;
- (void)updateMockData:(id)a3;
@end

@implementation PLDiscretionaryEnergyMonitor

+ (double)getDiscretionaryEnergyBudget
{
  return result;
}

- (PLDiscretionaryEnergyMonitor)initWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)&OBJC_CLASS___PLDiscretionaryEnergyMonitor;
  v5 = -[PLDiscretionaryEnergyMonitor init](&v10, sel_init);
  if (v5)
  {
    PLLogDiscretionaryEnergyMonitor();
    v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_186654000, v6, OS_LOG_TYPE_DEFAULT, "Initializing PLDiscretionaryEnergyMonitor...", v9, 2u);
    }

    v5 = -[PLDiscretionaryEnergyMonitor initWithDebugMode:andMockData:andCompletionBlock:]( v5,  "initWithDebugMode:andMockData:andCompletionBlock:",  0LL,  0LL,  v4);
    PLLogDiscretionaryEnergyMonitor();
    v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl( &dword_186654000,  v7,  OS_LOG_TYPE_DEFAULT,  "Finished initializing PLDiscretionaryEnergyMonitor...",  v9,  2u);
    }
  }

  return v5;
}

- (PLDiscretionaryEnergyMonitor)initWithDebugMode:(BOOL)a3 andMockData:(id)a4 andCompletionBlock:(id)a5
{
  BOOL v6 = a3;
  uint64_t v28 = *MEMORY[0x1895F89C0];
  id v8 = a4;
  id v9 = a5;
  v25.receiver = self;
  v25.super_class = (Class)&OBJC_CLASS___PLDiscretionaryEnergyMonitor;
  objc_super v10 = -[PLDiscretionaryEnergyMonitor init](&v25, sel_init);
  v11 = v10;
  if (v10)
  {
    -[PLDiscretionaryEnergyMonitor setCompletionBlock:](v10, "setCompletionBlock:", v9);
    discretionaryEnergyMonitorQueue();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDiscretionaryEnergyMonitor setWorkQueue:](v11, "setWorkQueue:", v12);

    -[PLDiscretionaryEnergyMonitor setMockData:](v11, "setMockData:", 0LL);
    BOOL v13 = v6 && +[PLModelingUtilities internalBuild](&OBJC_CLASS___PLModelingUtilities, "internalBuild");
    -[PLDiscretionaryEnergyMonitor setDebugMode:](v11, "setDebugMode:", v13);
    if (-[PLDiscretionaryEnergyMonitor debugMode](v11, "debugMode"))
    {
      PLLogDiscretionaryEnergyMonitor();
      v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v8;
        _os_log_impl(&dword_186654000, v14, OS_LOG_TYPE_INFO, "Initializing in debug mode with mockData=%@", buf, 0xCu);
      }

      if (v8)
      {
        v15 = (void *)[v8 mutableCopy];
        -[PLDiscretionaryEnergyMonitor setMockData:](v11, "setMockData:", v15);
        v16 = -[PLDiscretionaryEnergyMonitor mockData](v11, "mockData");
        [v16 objectForKeyedSubscript:@"LastPowerlogResponseMock"];
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLDiscretionaryEnergyMonitor setLastPowerlogResponse:](v11, "setLastPowerlogResponse:", v17);
      }
    }

    else if (+[PLModelingUtilities internalBuild](&OBJC_CLASS___PLModelingUtilities, "internalBuild"))
    {
      -[PLDiscretionaryEnergyMonitor setupNotificationListeners](v11, "setupNotificationListeners");
    }

    -[PLDiscretionaryEnergyMonitor setAccumulatedCPUEnergy:](v11, "setAccumulatedCPUEnergy:", 0.0);
    -[PLDiscretionaryEnergyMonitor setAccumulatedNetworkEnergy:](v11, "setAccumulatedNetworkEnergy:", 0.0);
    -[PLDiscretionaryEnergyMonitor setLastReportedTotalEnergy:](v11, "setLastReportedTotalEnergy:", 0.0);
    -[PLDiscretionaryEnergyMonitor setPowerlogEnergyLast:](v11, "setPowerlogEnergyLast:", 0.0);
    -[PLDiscretionaryEnergyMonitor setPowerlogEnergyPrevious:](v11, "setPowerlogEnergyPrevious:", 0.0);
    v18 = -[PLDiscretionaryEnergyMonitor createPowerlogQueryTimer](v11, "createPowerlogQueryTimer");
    -[PLDiscretionaryEnergyMonitor setPowerlogQueryTimer:](v11, "setPowerlogQueryTimer:", v18);
    v19 = -[PLDiscretionaryEnergyMonitor createQuickEnergyAccumulatorTimer](v11, "createQuickEnergyAccumulatorTimer");
    -[PLDiscretionaryEnergyMonitor setQuickEnergyAccumulatorTimer:](v11, "setQuickEnergyAccumulatorTimer:", v19);

    v20 = (void *)objc_opt_new();
    -[PLDiscretionaryEnergyMonitor setQuickEnergySnapshots:](v11, "setQuickEnergySnapshots:", v20);

    -[PLDiscretionaryEnergyMonitor queryPowerlogForDiscretionaryEnergy](v11, "queryPowerlogForDiscretionaryEnergy");
    -[PLDiscretionaryEnergyMonitor accumulateQuickEnergy](v11, "accumulateQuickEnergy");
    -[PLDiscretionaryEnergyMonitor setIsCharging:](v11, "setIsCharging:", 0LL);
    v21 = objc_alloc(&OBJC_CLASS___PLDiscretionaryIntervalManager);
    v22 = -[PLDiscretionaryEnergyMonitor mockData](v11, "mockData");
    v23 = -[PLDiscretionaryIntervalManager initWithEnergyMonitor:andMockData:]( v21,  "initWithEnergyMonitor:andMockData:",  v11,  v22);
    -[PLDiscretionaryEnergyMonitor setIntervalManager:](v11, "setIntervalManager:", v23);
  }

  return v11;
}

- (void)reportStartEvent:(id)a3 withInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  PLLogDiscretionaryEnergyMonitor();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[PLDiscretionaryEnergyMonitor reportStartEvent:withInfo:].cold.1();
  }

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __58__PLDiscretionaryEnergyMonitor_reportStartEvent_withInfo___block_invoke;
  block[3] = &unk_189E9E7F8;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

void __58__PLDiscretionaryEnergyMonitor_reportStartEvent_withInfo___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 handleStartEvent:*(void *)(a1 + 40) withInfo:*(void *)(a1 + 48)];
}

- (void)reportStopEvent:(id)a3 withInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  PLLogDiscretionaryEnergyMonitor();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[PLDiscretionaryEnergyMonitor reportStopEvent:withInfo:].cold.1();
  }

  dispatch_time_t v9 = dispatch_time(0LL, 1000000000LL);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __57__PLDiscretionaryEnergyMonitor_reportStopEvent_withInfo___block_invoke;
  block[3] = &unk_189E9E7F8;
  block[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v11 = v7;
  id v12 = v6;
  dispatch_after(v9, (dispatch_queue_t)workQueue, block);
}

void __57__PLDiscretionaryEnergyMonitor_reportStopEvent_withInfo___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 handleStopEvent:*(void *)(a1 + 40) withInfo:*(void *)(a1 + 48)];
}

- (void)generateEnergyReport
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0(&dword_186654000, v0, v1, "cumulativePowerlogEnergy=%f", v2);
  OUTLINED_FUNCTION_1();
}

void __52__PLDiscretionaryEnergyMonitor_generateEnergyReport__block_invoke( uint64_t a1,  void *a2,  uint64_t a3,  _BYTE *a4)
{
  id v7 = a2;
  PLLogDiscretionaryEnergyMonitor();
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __52__PLDiscretionaryEnergyMonitor_generateEnergyReport__block_invoke_cold_1(a1, v7, v8);
  }

  dispatch_time_t v9 = *(void **)(a1 + 32);
  [v7 timestamp];
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [v9 timeIntervalSinceDate:v10];
  double v12 = v11;

  if (v12 <= 60.0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8LL) + 40LL), a2);
    *a4 = 1;
  }

  else
  {
    [*(id *)(a1 + 40) addObject:v7];
  }
}

- (void)queryPowerlogForDiscretionaryEnergy
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __67__PLDiscretionaryEnergyMonitor_queryPowerlogForDiscretionaryEnergy__block_invoke;
  block[3] = &unk_189E9E750;
  block[4] = self;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

void __67__PLDiscretionaryEnergyMonitor_queryPowerlogForDiscretionaryEnergy__block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1895F89C0];
  PLLogDiscretionaryEnergyMonitor();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(v32) = 0;
    _os_log_impl( &dword_186654000,  v2,  OS_LOG_TYPE_INFO,  "Querying powerlog for discretionary energy",  (uint8_t *)&v32,  2u);
  }

  if ([*(id *)(a1 + 32) debugMode])
  {
    PLLogDiscretionaryEnergyMonitor();
    uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v32) = 0;
      _os_log_impl( &dword_186654000,  v3,  OS_LOG_TYPE_INFO,  "Not querying for powerlog response in debug mode, using lastPowerlogResponse instead",  (uint8_t *)&v32,  2u);
    }

    uint64_t v4 = [*(id *)(a1 + 32) lastPowerlogResponse];
  }

  else
  {
    uint64_t v4 = PLQueryRegistered(24, @"BLMReportEnergyDuet", 0LL);
  }

  v5 = (void *)v4;
  PLLogDiscretionaryEnergyMonitor();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v32 = 138412290;
    v33 = v5;
    _os_log_impl(&dword_186654000, v6, OS_LOG_TYPE_INFO, "Powerlog response: %@", (uint8_t *)&v32, 0xCu);
  }

  if (!v5
    || ([v5 objectForKeyedSubscript:@"PermissionUnknown"],
        id v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    PLLogDiscretionaryEnergyMonitor();
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __67__PLDiscretionaryEnergyMonitor_queryPowerlogForDiscretionaryEnergy__block_invoke_cold_1();
    }
    goto LABEL_32;
  }

  [*(id *)(a1 + 32) logPowerlogResponse:v5];
  [*(id *)(a1 + 32) lastPowerlogResponse];
  id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    [*(id *)(a1 + 32) lastPowerlogResponse];
    id v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  }

  [v5 objectForKeyedSubscript:@"BLMEnergyResponseTimestamp"];
  dispatch_time_t v9 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setPowerlogTimestampLast:v9];

  [*(id *)(a1 + 32) getPowerlogEnergySum:v5];
  objc_msgSend(*(id *)(a1 + 32), "setPowerlogEnergyLast:");
  [*(id *)(a1 + 32) setLastPowerlogResponse:v5];
  if (!v8) {
    goto LABEL_29;
  }
  -[os_log_s objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", @"BLMEnergyResponseTimestamp");
  id v10 = (void *)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setPowerlogTimestampPrevious:v10];
  [*(id *)(a1 + 32) getPowerlogEnergySum:v8];
  objc_msgSend(*(id *)(a1 + 32), "setPowerlogEnergyPrevious:");
  [*(id *)(a1 + 32) powerlogTimestampLast];
  double v11 = (void *)objc_claimAutoreleasedReturnValue();

  char v12 = 1;
  if (v10)
  {
    if (v11)
    {
      [*(id *)(a1 + 32) powerlogTimestampLast];
      id v13 = (void *)objc_claimAutoreleasedReturnValue();
      [v13 timeIntervalSinceDate:v10];
      double v15 = v14;

      if (v15 > 0.0)
      {
        [*(id *)(a1 + 32) powerlogEnergyLast];
        double v17 = v16;
        [*(id *)(a1 + 32) powerlogEnergyPrevious];
        [*(id *)(a1 + 32) setPowerlogEnergyDiff:v17 - v18];
        PLLogDiscretionaryEnergyMonitor();
        v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          [*(id *)(a1 + 32) powerlogEnergyPrevious];
          v21 = v20;
          [*(id *)(a1 + 32) powerlogEnergyLast];
          uint64_t v23 = v22;
          [*(id *)(a1 + 32) powerlogEnergyDiff];
          uint64_t v25 = v24;
          [*(id *)(a1 + 32) powerlogTimestampPrevious];
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          [*(id *)(a1 + 32) powerlogTimestampLast];
          id v27 = (void *)objc_claimAutoreleasedReturnValue();
          int v32 = 134219010;
          v33 = v21;
          __int16 v34 = 2048;
          uint64_t v35 = v23;
          __int16 v36 = 2048;
          uint64_t v37 = v25;
          __int16 v38 = 2112;
          v39 = v26;
          __int16 v40 = 2112;
          v41 = v27;
          _os_log_impl( &dword_186654000,  v19,  OS_LOG_TYPE_DEFAULT,  "New Powerlog Accounting Energy: previousPowerlogEnergySum=%f, lastPowerlogEnergySum=%f, powerlogEnergyDiff=% f from previousResponseTimestamp=%@ to lastResponseTimestamp=%@",  (uint8_t *)&v32,  0x34u);
        }

        char v12 = 0;
      }
    }
  }

  uint64_t v28 = [*(id *)(a1 + 32) powerlogTimestampLast];
  if (!v28)
  {

LABEL_29:
    PLLogDiscretionaryEnergyMonitor();
    v31 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      __67__PLDiscretionaryEnergyMonitor_queryPowerlogForDiscretionaryEnergy__block_invoke_cold_2();
    }

    [*(id *)(a1 + 32) generateEnergyReport];
    goto LABEL_32;
  }

  v29 = (void *)v28;
  [*(id *)(a1 + 32) powerlogTimestampPrevious];
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v30) {
    char v12 = 0;
  }

  if ((v12 & 1) == 0) {
    goto LABEL_29;
  }
LABEL_32:
}

- (void)runCompletionBlockWithEnergyResponse:(id)a3
{
  id v6 = a3;
  -[PLDiscretionaryEnergyMonitor completionBlock](self, "completionBlock");
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PLDiscretionaryEnergyMonitor completionBlock](self, "completionBlock");
    v5 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (id)createPowerlogQueryTimer
{
  uint64_t v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, v3);

  dispatch_time_t v5 = dispatch_time(0LL, 60000000000LL);
  dispatch_source_set_timer(v4, v5, 0x8BB2C97000uLL, 0x165A0BC00uLL);
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __56__PLDiscretionaryEnergyMonitor_createPowerlogQueryTimer__block_invoke;
  handler[3] = &unk_189E9E750;
  handler[4] = self;
  dispatch_source_set_event_handler(v4, handler);
  dispatch_resume(v4);
  return v4;
}

uint64_t __56__PLDiscretionaryEnergyMonitor_createPowerlogQueryTimer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) queryPowerlogForDiscretionaryEnergy];
}

- (id)createQuickEnergyAccumulatorTimer
{
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[PLDiscretionaryEnergyMonitor createQuickEnergyAccumulatorTimer].cold.1();
  }

  dispatch_get_global_queue(-32768LL, 0LL);
  uint64_t v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  dispatch_time_t v5 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, v4);

  dispatch_time_t v6 = dispatch_time(0LL, 60000000000LL);
  dispatch_source_set_timer(v5, v6, 0xDF8475800uLL, 0x165A0BC00uLL);
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __65__PLDiscretionaryEnergyMonitor_createQuickEnergyAccumulatorTimer__block_invoke;
  handler[3] = &unk_189E9E750;
  handler[4] = self;
  dispatch_source_set_event_handler(v5, handler);
  dispatch_resume(v5);
  return v5;
}

uint64_t __65__PLDiscretionaryEnergyMonitor_createQuickEnergyAccumulatorTimer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) accumulateQuickEnergy];
}

- (void)accumulateQuickEnergy
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __53__PLDiscretionaryEnergyMonitor_accumulateQuickEnergy__block_invoke;
  block[3] = &unk_189E9E750;
  block[4] = self;
  dispatch_async((dispatch_queue_t)workQueue, block);
}

void __53__PLDiscretionaryEnergyMonitor_accumulateQuickEnergy__block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1895F89C0];
  PLLogDiscretionaryEnergyMonitor();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(v27) = 0;
    _os_log_impl(&dword_186654000, v2, OS_LOG_TYPE_INFO, "accumulating quick energy", (uint8_t *)&v27, 2u);
  }

  PLLogDiscretionaryEnergyMonitor();
  uint64_t v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    [*(id *)(a1 + 32) accumulatedCPUEnergy];
    dispatch_time_t v5 = v4;
    [*(id *)(a1 + 32) accumulatedNetworkEnergy];
    uint64_t v7 = v6;
    [*(id *)(a1 + 32) accumulatedCPUEnergy];
    double v9 = v8;
    [*(id *)(a1 + 32) accumulatedNetworkEnergy];
    int v27 = 134218496;
    uint64_t v28 = v5;
    __int16 v29 = 2048;
    uint64_t v30 = v7;
    __int16 v31 = 2048;
    double v32 = v9 + v10;
    _os_log_impl( &dword_186654000,  v3,  OS_LOG_TYPE_DEFAULT,  "Creating quick energy snapshot, cpuEnergyTotal=%f, networkEnergyTotal=%f, totalEnergy=%f",  (uint8_t *)&v27,  0x20u);
  }

  double v11 = objc_alloc(&OBJC_CLASS___PLQuickEnergySnapshot);
  id v13 = *(void **)(a1 + 32);
  char v12 = (id *)(a1 + 32);
  [v13 accumulatedCPUEnergy];
  double v15 = v14;
  [*v12 accumulatedNetworkEnergy];
  double v17 = -[PLQuickEnergySnapshot initWithEnergies:andNetworkEnergy:](v11, "initWithEnergies:andNetworkEnergy:", v15, v16);
  [*v12 quickEnergySnapshots];
  double v18 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = [v18 count];

  [*v12 quickEnergySnapshots];
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v19)
  {
    [v20 lastObject];
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();

    -[PLQuickEnergySnapshot computeEnergyDiff:](v17, "computeEnergyDiff:", v22);
    if (v23 >= 1.0)
    {
      [*v12 quickEnergySnapshots];
      uint64_t v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 addObject:v17];

      [*v12 generateEnergyReport];
      PLLogDiscretionaryEnergyMonitor();
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        [*v12 quickEnergySnapshots];
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        int v27 = 138412290;
        uint64_t v28 = v26;
        _os_log_impl(&dword_186654000, v24, OS_LOG_TYPE_INFO, "quickEnergySnapshots=%@", (uint8_t *)&v27, 0xCu);
      }
    }

    else
    {
      PLLogDiscretionaryEnergyMonitor();
      uint64_t v24 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        __53__PLDiscretionaryEnergyMonitor_accumulateQuickEnergy__block_invoke_cold_2();
      }
    }
  }

  else
  {
    [v20 addObject:v17];

    PLLogDiscretionaryEnergyMonitor();
    uint64_t v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      __53__PLDiscretionaryEnergyMonitor_accumulateQuickEnergy__block_invoke_cold_1(v12, v22);
    }
  }
}

- (double)getPowerlogEnergySum:(id)a3
{
  id v3 = a3;
  [v3 objectForKeyedSubscript:@"BLMEnergyForDuet"];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 count];

  if (v5)
  {
    uint64_t v10 = 0LL;
    double v11 = (double *)&v10;
    uint64_t v12 = 0x2020000000LL;
    uint64_t v13 = 0LL;
    [v3 objectForKeyedSubscript:@"BLMEnergyForDuet"];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1895F87A8];
    v9[1] = 3221225472LL;
    v9[2] = __53__PLDiscretionaryEnergyMonitor_getPowerlogEnergySum___block_invoke;
    v9[3] = &unk_189E9E848;
    v9[4] = &v10;
    [v6 enumerateObjectsUsingBlock:v9];
    double v7 = v11[3];

    _Block_object_dispose(&v10, 8);
  }

  else
  {
    double v7 = 0.0;
  }

  return v7;
}

void __53__PLDiscretionaryEnergyMonitor_getPowerlogEnergySum___block_invoke(uint64_t a1, void *a2)
{
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 doubleValue];
  *(double *)(*(void *)(*(void *)(a1 + 32) + 8LL) + 24LL) = v3
}

- (void)reportChargingStatus:(BOOL)a3
{
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __53__PLDiscretionaryEnergyMonitor_reportChargingStatus___block_invoke;
  v4[3] = &unk_189E9E870;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async((dispatch_queue_t)workQueue, v4);
}

uint64_t __53__PLDiscretionaryEnergyMonitor_reportChargingStatus___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  PLLogDiscretionaryEnergyMonitor();
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x189607968], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isCharging"));
    double v3 = (void *)objc_claimAutoreleasedReturnValue();
    [MEMORY[0x189607968] numberWithBool:*(unsigned __int8 *)(a1 + 40)];
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    int v12 = 138412546;
    uint64_t v13 = v3;
    __int16 v14 = 2112;
    double v15 = v4;
    _os_log_impl( &dword_186654000,  v2,  OS_LOG_TYPE_DEFAULT,  "Setting chargingStatus from isCharging=%@ to isCharging=%@",  (uint8_t *)&v12,  0x16u);
  }

  if (([*(id *)(a1 + 32) isCharging] & 1) == 0 && *(_BYTE *)(a1 + 40))
  {
    PLLogDiscretionaryEnergyMonitor();
    BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __53__PLDiscretionaryEnergyMonitor_reportChargingStatus___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) intervalManager];
    uint64_t v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 handleOpenIntervalTimer];

    [*(id *)(a1 + 32) intervalManager];
    double v7 = (void *)objc_claimAutoreleasedReturnValue();
    [v7 disableQuickEnergy];
  }

  if ([*(id *)(a1 + 32) isCharging] && !*(_BYTE *)(a1 + 40))
  {
    PLLogDiscretionaryEnergyMonitor();
    double v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __53__PLDiscretionaryEnergyMonitor_reportChargingStatus___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) intervalManager];
    double v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 handleOpenIntervalTimer];

    [*(id *)(a1 + 32) intervalManager];
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 enableQuickEnergy];
  }

  return [*(id *)(a1 + 32) setIsCharging:*(unsigned __int8 *)(a1 + 40)];
}

- (void)incrementCPUEnergy:(double)a3
{
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __51__PLDiscretionaryEnergyMonitor_incrementCPUEnergy___block_invoke;
  v4[3] = &unk_189E9E898;
  v4[4] = self;
  *(double *)&void v4[5] = a3;
  dispatch_async((dispatch_queue_t)workQueue, v4);
}

void __51__PLDiscretionaryEnergyMonitor_incrementCPUEnergy___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isCharging];
  PLLogDiscretionaryEnergyMonitor();
  double v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4) {
      __51__PLDiscretionaryEnergyMonitor_incrementCPUEnergy___block_invoke_cold_1();
    }
  }

  else
  {
    if (v4) {
      __51__PLDiscretionaryEnergyMonitor_incrementCPUEnergy___block_invoke_cold_2(a1, v3, v5);
    }

    uint64_t v6 = *(void **)(a1 + 32);
    [v6 accumulatedCPUEnergy];
    [v6 setAccumulatedCPUEnergy:v7 + *(double *)(a1 + 40)];
  }

- (void)incrementNetworkEnergy:(double)a3
{
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __55__PLDiscretionaryEnergyMonitor_incrementNetworkEnergy___block_invoke;
  v4[3] = &unk_189E9E898;
  v4[4] = self;
  *(double *)&void v4[5] = a3;
  dispatch_async((dispatch_queue_t)workQueue, v4);
}

void __55__PLDiscretionaryEnergyMonitor_incrementNetworkEnergy___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isCharging];
  PLLogDiscretionaryEnergyMonitor();
  double v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4) {
      __51__PLDiscretionaryEnergyMonitor_incrementCPUEnergy___block_invoke_cold_1();
    }
  }

  else
  {
    if (v4) {
      __55__PLDiscretionaryEnergyMonitor_incrementNetworkEnergy___block_invoke_cold_2(a1, v3, v5);
    }

    uint64_t v6 = *(void **)(a1 + 32);
    [v6 accumulatedNetworkEnergy];
    [v6 setAccumulatedNetworkEnergy:v7 + *(double *)(a1 + 40)];
  }

- (void)testHighVolumeStartStopReporting:(id)a3 withInfo:(id)a4 withNumIterations:(double)a5
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  PLLogDiscretionaryEnergyMonitor();
  uint64_t v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412802;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    __int16 v17 = 2048;
    double v18 = a5;
    _os_log_impl( &dword_186654000,  v10,  OS_LOG_TYPE_DEFAULT,  "Testing high volume start/stops for activityName=%@, withInfo=%@ for %f iterations",  (uint8_t *)&v13,  0x20u);
  }

  if (a5 > 0.0)
  {
    int v11 = 1;
    do
    {
      -[PLDiscretionaryEnergyMonitor reportStartEvent:withInfo:](self, "reportStartEvent:withInfo:", v8, v9);
      -[PLDiscretionaryEnergyMonitor reportStopEvent:withInfo:](self, "reportStopEvent:withInfo:", v8, v9);
      double v12 = (double)v11++;
    }

    while (v12 < a5);
  }
}

- (void)setupNotificationListeners
{
  double v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v16 = 0;
    _os_log_impl(&dword_186654000, v3, OS_LOG_TYPE_DEFAULT, "Setting up debug listeners", v16, 2u);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( DarwinNotifyCenter,  self,  (CFNotificationCallback)didReceiveNotification,  @"com.apple.energybudgetingdebug.quickEnergySnapshots",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  uint64_t v5 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( v5,  self,  (CFNotificationCallback)didReceiveNotification,  @"com.apple.energybudgetingdebug.queryPowerlog",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  uint64_t v6 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( v6,  self,  (CFNotificationCallback)didReceiveNotification,  @"com.apple.energybudgetingdebug.generateEnergyReport",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  double v7 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( v7,  self,  (CFNotificationCallback)didReceiveNotification,  @"com.apple.energybudgetingdebug.discretionaryIntervals",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  id v8 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( v8,  self,  (CFNotificationCallback)didReceiveNotification,  @"com.apple.energybudgetingdebug.lastPowerlogEnergy",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  id v9 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( v9,  self,  (CFNotificationCallback)didReceiveNotification,  @"com.apple.energybudgetingdebug.lastPowerlogTimestamp",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  uint64_t v10 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( v10,  self,  (CFNotificationCallback)didReceiveNotification,  @"com.apple.energybudgetingdebug.chargingStatus",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  int v11 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( v11,  self,  (CFNotificationCallback)didReceiveNotification,  @"com.apple.energybudgetingdebug.lastReportedTotalEnergy",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  double v12 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( v12,  self,  (CFNotificationCallback)didReceiveNotification,  @"com.apple.energybudgetingdebug.lastReportedCPUEnergy",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  int v13 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( v13,  self,  (CFNotificationCallback)didReceiveNotification,  @"com.apple.energybudgetingdebug.lastReportedNetworkEnergy",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  id v14 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( v14,  self,  (CFNotificationCallback)didReceiveNotification,  @"com.apple.energybudgetingdebug.accumulatedCPUEnergy",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
  __int16 v15 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver( v15,  self,  (CFNotificationCallback)didReceiveNotification,  @"com.apple.energybudgetingdebug.accumulatedNetworkEnergy",  0LL,  CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)setStateForNotification:(id)a3 withState:(id)a4
{
  uint64_t v30 = *MEMORY[0x1895F89C0];
  id v5 = a3;
  id v6 = a4;
  PLLogDiscretionaryEnergyMonitor();
  double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v26 = 138412546;
    id v27 = v6;
    __int16 v28 = 2112;
    id v29 = v5;
    _os_log_impl( &dword_186654000,  v7,  OS_LOG_TYPE_INFO,  "Setting state=%@ for notificationName=%@",  (uint8_t *)&v26,  0x16u);
  }

  id v8 = v5;
  uint64_t v9 = notify_register_check((const char *)[v8 UTF8String], &v26);
  if ((_DWORD)v9)
  {
    uint64_t v10 = v9;
    PLLogDiscretionaryEnergyMonitor();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PLDiscretionaryEnergyMonitor setStateForNotification:withState:].cold.2(v10, v11, v12, v13, v14, v15, v16, v17);
    }
LABEL_9:

    goto LABEL_10;
  }

  uint64_t v18 = notify_set_state(v26, [v6 unsignedLongLongValue]);
  if ((_DWORD)v18)
  {
    uint64_t v19 = v18;
    PLLogDiscretionaryEnergyMonitor();
    int v11 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[PLDiscretionaryEnergyMonitor setStateForNotification:withState:].cold.1(v19, v11, v20, v21, v22, v23, v24, v25);
    }
    goto LABEL_9;
  }

- (void)updateMockData:(id)a3
{
  uint64_t v16 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  BOOL v5 = -[PLDiscretionaryEnergyMonitor debugMode](self, "debugMode");
  PLLogDiscretionaryEnergyMonitor();
  id v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  double v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_186654000, v7, OS_LOG_TYPE_INFO, "Updating to mockData=%@", (uint8_t *)&v14, 0xCu);
    }

    double v7 = (os_log_s *)[v4 mutableCopy];
    -[os_log_s objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", @"LastPowerlogResponseMock");
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDiscretionaryEnergyMonitor mockData](self, "mockData");
    uint64_t v9 = (void *)objc_claimAutoreleasedReturnValue();
    [v9 setObject:v8 forKeyedSubscript:@"LastPowerlogResponseMock"];

    -[PLDiscretionaryEnergyMonitor mockData](self, "mockData");
    uint64_t v10 = (void *)objc_claimAutoreleasedReturnValue();
    [v10 objectForKeyedSubscript:@"LastPowerlogResponseMock"];
    int v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDiscretionaryEnergyMonitor setLastPowerlogResponse:](self, "setLastPowerlogResponse:", v11);

    -[os_log_s objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", @"CPUCoalitionsMock");
    uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDiscretionaryEnergyMonitor mockData](self, "mockData");
    uint64_t v13 = (void *)objc_claimAutoreleasedReturnValue();
    [v13 setObject:v12 forKeyedSubscript:@"CPUCoalitionsMock"];
  }

  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    -[PLDiscretionaryEnergyMonitor updateMockData:].cold.1();
  }
}

- (void)logPowerlogResponse:(id)a3
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  [v3 objectForKeyedSubscript:@"BLMEnergyForDuet"];
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 enumerateObjectsUsingBlock:&__block_literal_global_433];

  PLLogDiscretionaryEnergyMonitor();
  BOOL v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    [v3 objectForKeyedSubscript:@"BLMEnergyResponseTimestamp"];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    int v9 = 138412290;
    uint64_t v10 = v6;
    _os_log_impl(&dword_186654000, v5, OS_LOG_TYPE_INFO, "EnergyResponseTimestamp: %@", (uint8_t *)&v9, 0xCu);
  }

  PLLogDiscretionaryEnergyMonitor();
  double v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    [v3 objectForKeyedSubscript:@"BLMUUIDForDuet"];
    id v8 = (void *)objc_claimAutoreleasedReturnValue();
    int v9 = 138412290;
    uint64_t v10 = v8;
    _os_log_impl(&dword_186654000, v7, OS_LOG_TYPE_INFO, "UUIDForDuet: %@", (uint8_t *)&v9, 0xCu);
  }
}

void __52__PLDiscretionaryEnergyMonitor_logPowerlogResponse___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  PLLogDiscretionaryEnergyMonitor();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_186654000, v3, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)logQuickEnergySnapshots
{
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_436];
}

void __55__PLDiscretionaryEnergyMonitor_logQuickEnergySnapshots__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  id v2 = a2;
  PLLogDiscretionaryEnergyMonitor();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_186654000, v3, OS_LOG_TYPE_INFO, "%@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)logEnergyReport:(id)a3
{
  id v3 = a3;
  PLLogDiscretionaryEnergyMonitor();
  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[PLDiscretionaryEnergyMonitor logEnergyReport:].cold.1();
  }

  PLLogRegisteredEvent(70LL, @"DASEnergyReport", v3);
}

- (PLDiscretionaryIntervalManager)intervalManager
{
  return (PLDiscretionaryIntervalManager *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setIntervalManager:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (double)lastReportedTotalEnergy
{
  return self->_lastReportedTotalEnergy;
}

- (void)setLastReportedTotalEnergy:(double)a3
{
  self->_lastReportedTotalEnergy = a3;
}

- (double)lastReportedCPUEnergy
{
  return self->_lastReportedCPUEnergy;
}

- (void)setLastReportedCPUEnergy:(double)a3
{
  self->_lastReportedCPUEnergy = a3;
}

- (double)lastReportedNetworkEnergy
{
  return self->_lastReportedNetworkEnergy;
}

- (void)setLastReportedNetworkEnergy:(double)a3
{
  self->_lastReportedNetworkEnergy = a3;
}

- (NSDictionary)lastPowerlogResponse
{
  return self->_lastPowerlogResponse;
}

- (void)setLastPowerlogResponse:(id)a3
{
}

- (NSMutableArray)quickEnergySnapshots
{
  return self->_quickEnergySnapshots;
}

- (void)setQuickEnergySnapshots:(id)a3
{
}

- (OS_dispatch_source)powerlogQueryTimer
{
  return self->_powerlogQueryTimer;
}

- (void)setPowerlogQueryTimer:(id)a3
{
}

- (OS_dispatch_source)quickEnergyAccumulatorTimer
{
  return self->_quickEnergyAccumulatorTimer;
}

- (void)setQuickEnergyAccumulatorTimer:(id)a3
{
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
}

- (double)accumulatedCPUEnergy
{
  return self->_accumulatedCPUEnergy;
}

- (void)setAccumulatedCPUEnergy:(double)a3
{
  self->_accumulatedCPUEnergy = a3;
}

- (double)accumulatedNetworkEnergy
{
  return self->_accumulatedNetworkEnergy;
}

- (void)setAccumulatedNetworkEnergy:(double)a3
{
  self->_accumulatedNetworkEnergy = a3;
}

- (double)powerlogEnergyDiff
{
  return self->_powerlogEnergyDiff;
}

- (void)setPowerlogEnergyDiff:(double)a3
{
  self->_powerlogEnergyDiff = a3;
}

- (NSDate)powerlogTimestampPrevious
{
  return (NSDate *)objc_getProperty(self, a2, 120LL, 1);
}

- (void)setPowerlogTimestampPrevious:(id)a3
{
}

- (NSDate)powerlogTimestampLast
{
  return (NSDate *)objc_getProperty(self, a2, 128LL, 1);
}

- (void)setPowerlogTimestampLast:(id)a3
{
}

- (double)powerlogEnergyPrevious
{
  return self->_powerlogEnergyPrevious;
}

- (void)setPowerlogEnergyPrevious:(double)a3
{
  self->_powerlogEnergyPrevious = a3;
}

- (double)powerlogEnergyLast
{
  return self->_powerlogEnergyLast;
}

- (void)setPowerlogEnergyLast:(double)a3
{
  self->_powerlogEnergyLast = a3;
}

- (BOOL)isCharging
{
  return self->_isCharging;
}

- (void)setIsCharging:(BOOL)a3
{
  self->_isCharging = a3;
}

- (BOOL)debugMode
{
  return self->_debugMode;
}

- (void)setDebugMode:(BOOL)a3
{
  self->_debugMode = a3;
}

- (NSMutableDictionary)mockData
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 152LL, 1);
}

- (void)setMockData:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)reportStartEvent:withInfo:.cold.1()
{
  OUTLINED_FUNCTION_2(&dword_186654000, v0, v1, "Reporting startEvent activityName=%@, info=%@ from energyMonitor");
  OUTLINED_FUNCTION_1();
}

- (void)reportStopEvent:withInfo:.cold.1()
{
  OUTLINED_FUNCTION_2(&dword_186654000, v0, v1, "Reporting stopEvent activityName=%@, info=%@ from energyMonitor");
  OUTLINED_FUNCTION_1();
}

void __52__PLDiscretionaryEnergyMonitor_generateEnergyReport__block_invoke_cold_1( uint64_t a1,  void *a2,  os_log_s *a3)
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  int v4 = *(void **)(a1 + 32);
  [a2 timestamp];
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 timeIntervalSinceDate:v5];
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0(&dword_186654000, a3, v6, "timedifferential=%f", v7);

  OUTLINED_FUNCTION_11();
}

void __67__PLDiscretionaryEnergyMonitor_queryPowerlogForDiscretionaryEnergy__block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_186654000, v0, v1, "No valid response from powerlog, response=%@", v2);
  OUTLINED_FUNCTION_1();
}

void __67__PLDiscretionaryEnergyMonitor_queryPowerlogForDiscretionaryEnergy__block_invoke_cold_2()
{
}

- (void)createQuickEnergyAccumulatorTimer
{
}

void __53__PLDiscretionaryEnergyMonitor_accumulateQuickEnergy__block_invoke_cold_1(id *a1, os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  [*a1 quickEnergySnapshots];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0( &dword_186654000,  a2,  v4,  "after enqueuing first quickEnergy snapshot, quickEnergySnapshots=%@",  v5);

  OUTLINED_FUNCTION_8();
}

void __53__PLDiscretionaryEnergyMonitor_accumulateQuickEnergy__block_invoke_cold_2()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_0(&dword_186654000, v0, v1, "energyDiff=%f not sufficient to enqueue new quick energy snapshot", v2);
  OUTLINED_FUNCTION_1();
}

void __53__PLDiscretionaryEnergyMonitor_reportChargingStatus___block_invoke_cold_1()
{
}

void __51__PLDiscretionaryEnergyMonitor_incrementCPUEnergy___block_invoke_cold_1()
{
}

void __51__PLDiscretionaryEnergyMonitor_incrementCPUEnergy___block_invoke_cold_2( uint64_t a1,  os_log_s *a2,  uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 134217984;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_0(&dword_186654000, a2, a3, "incrementing cpu energy by energy=%f", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void __55__PLDiscretionaryEnergyMonitor_incrementNetworkEnergy___block_invoke_cold_2( uint64_t a1,  os_log_s *a2,  uint64_t a3)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  uint64_t v3 = *(void *)(a1 + 40);
  int v4 = 134217984;
  uint64_t v5 = v3;
  OUTLINED_FUNCTION_0(&dword_186654000, a2, a3, "incrementing network energy by energy=%f", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

- (void)setStateForNotification:(uint64_t)a3 withState:(uint64_t)a4 .cold.1( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)setStateForNotification:(uint64_t)a3 withState:(uint64_t)a4 .cold.2( uint64_t a1,  os_log_s *a2,  uint64_t a3,  uint64_t a4,  uint64_t a5,  uint64_t a6,  uint64_t a7,  uint64_t a8)
{
}

- (void)updateMockData:.cold.1()
{
}

- (void)logEnergyReport:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_186654000, v0, v1, "Logging energy report to powerlog ... logEvent=%@", v2);
  OUTLINED_FUNCTION_1();
}

@end