@interface PLDiscretionaryIntervalManager
- (BOOL)quickEnergyEnabled;
- (NSMutableDictionary)activityNameToInvolvedIdentifiers;
- (NSMutableDictionary)identifierToDiscretionaryIntervals;
- (NSMutableDictionary)mockData;
- (OS_dispatch_source)openIntervalTimer;
- (OS_dispatch_source)powerlogReportTimer;
- (PLDiscretionaryEnergyMonitor)discretionaryEnergyMonitor;
- (PLDiscretionaryIntervalManager)initWithEnergyMonitor:(id)a3 andMockData:(id)a4;
- (id)coalesceIntervals:(id)a3;
- (id)createOpenIntervalTimer;
- (id)createPowerlogReportTimer;
- (void)createOpenIntervalTimer;
- (void)createPowerlogReportTimer;
- (void)disableQuickEnergy;
- (void)enableQuickEnergy;
- (void)handleOpenIntervalTimer;
- (void)handlePowerlogReportTimer;
- (void)handleStartEvent:(id)a3 withInfo:(id)a4;
- (void)handleStopEvent:(id)a3 withInfo:(id)a4;
- (void)logActivityNameToInvolvedIdentifiers;
- (void)logDiscretionaryIntervals;
- (void)reportIntervalsToPowerlog;
- (void)reportQuickEnergyForInterval:(id)a3 withIdentifier:(id)a4 andAdjustSnapshotToNow:(BOOL)a5;
- (void)setActivityNameToInvolvedIdentifiers:(id)a3;
- (void)setDiscretionaryEnergyMonitor:(id)a3;
- (void)setIdentifierToDiscretionaryIntervals:(id)a3;
- (void)setMockData:(id)a3;
- (void)setOpenIntervalTimer:(id)a3;
- (void)setPowerlogReportTimer:(id)a3;
- (void)setQuickEnergyEnabled:(BOOL)a3;
@end

@implementation PLDiscretionaryIntervalManager

- (PLDiscretionaryIntervalManager)initWithEnergyMonitor:(id)a3 andMockData:(id)a4
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)&OBJC_CLASS___PLDiscretionaryIntervalManager;
  v8 = -[PLDiscretionaryIntervalManager init](&v16, sel_init);
  if (v8)
  {
    PLLogDiscretionaryEnergyMonitor();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v7;
      _os_log_impl( &dword_186654000,  v9,  OS_LOG_TYPE_DEFAULT,  "Initializing DiscretionaryIntervalManager, with mockData=%@",  buf,  0xCu);
    }

    -[PLDiscretionaryIntervalManager setMockData:](v8, "setMockData:", v7);
    v10 = (void *)objc_opt_new();
    -[PLDiscretionaryIntervalManager setIdentifierToDiscretionaryIntervals:]( v8,  "setIdentifierToDiscretionaryIntervals:",  v10);

    v11 = (void *)objc_opt_new();
    -[PLDiscretionaryIntervalManager setActivityNameToInvolvedIdentifiers:]( v8,  "setActivityNameToInvolvedIdentifiers:",  v11);

    -[PLDiscretionaryIntervalManager setDiscretionaryEnergyMonitor:](v8, "setDiscretionaryEnergyMonitor:", v6);
    -[PLDiscretionaryIntervalManager setQuickEnergyEnabled:](v8, "setQuickEnergyEnabled:", 1LL);
    v12 = -[PLDiscretionaryIntervalManager createOpenIntervalTimer](v8, "createOpenIntervalTimer");
    -[PLDiscretionaryIntervalManager setOpenIntervalTimer:](v8, "setOpenIntervalTimer:", v12);
    v13 = -[PLDiscretionaryIntervalManager createPowerlogReportTimer](v8, "createPowerlogReportTimer");
    -[PLDiscretionaryIntervalManager setPowerlogReportTimer:](v8, "setPowerlogReportTimer:", v13);

    PLLogDiscretionaryEnergyMonitor();
    v14 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( &dword_186654000,  v14,  OS_LOG_TYPE_DEFAULT,  "Finished initializing DiscretionaryIntervalManager",  buf,  2u);
    }
  }

  return v8;
}

- (void)handleStartEvent:(id)a3 withInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  PLLogDiscretionaryEnergyMonitor();
  v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[PLDiscretionaryIntervalManager handleStartEvent:withInfo:].cold.2();
  }

  [v7 objectForKeyedSubscript:@"involvedIdentifiers"];
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PLDiscretionaryIntervalManager activityNameToInvolvedIdentifiers](self, "activityNameToInvolvedIdentifiers");
  [v10 setObject:v9 forKeyedSubscript:v6];

  [v7 objectForKeyedSubscript:@"involvedIdentifiers"];
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v7 objectForKeyedSubscript:@"requiresNetwork"];
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = [v12 BOOLValue];

  if ((_DWORD)v10)
  {
    v13 = (void *)[v11 mutableCopy];

    [v13 addObject:@"discretionaryNetworkTasks"];
    v11 = v13;
  }

  v16[0] = MEMORY[0x1895F87A8];
  v16[1] = 3221225472LL;
  v16[2] = __60__PLDiscretionaryIntervalManager_handleStartEvent_withInfo___block_invoke;
  v16[3] = &unk_189E9E648;
  v16[4] = self;
  id v17 = v7;
  id v14 = v7;
  [v11 enumerateObjectsUsingBlock:v16];
  PLLogDiscretionaryEnergyMonitor();
  v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[PLDiscretionaryIntervalManager handleStartEvent:withInfo:].cold.1(self, v15);
  }
}

void __60__PLDiscretionaryIntervalManager_handleStartEvent_withInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) identifierToDiscretionaryIntervals];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:v3];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    [MEMORY[0x189603FA8] array];
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 32) identifierToDiscretionaryIntervals];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    [v6 setObject:v5 forKeyedSubscript:v3];
  }

  if ([v5 count]
    && ([v5 lastObject],
        id v7 = (void *)objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isClosed],
        v7,
        (v8 & 1) == 0))
  {
    PLLogDiscretionaryEnergyMonitor();
    v15 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      __60__PLDiscretionaryIntervalManager_handleStartEvent_withInfo___block_invoke_cold_2();
    }

    [v5 lastObject];
    objc_super v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 openCount];
    [v16 setOpenCount:v17 + 1.0];

    [v5 lastObject];
    id v14 = (PLDiscretionaryInterval *)objc_claimAutoreleasedReturnValue();
    -[PLDiscretionaryInterval startCount](v14, "startCount");
    -[PLDiscretionaryInterval setStartCount:](v14, "setStartCount:", v18 + 1.0);
  }

  else
  {
    PLLogDiscretionaryEnergyMonitor();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __60__PLDiscretionaryIntervalManager_handleStartEvent_withInfo___block_invoke_cold_1();
    }

    v10 = objc_alloc(&OBJC_CLASS___PLDiscretionaryInterval);
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = [*(id *)(a1 + 32) quickEnergyEnabled];
    [*(id *)(a1 + 32) mockData];
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    id v14 = -[PLDiscretionaryInterval initWithIdentifier:andInfo:andSnapshottingEnabled:andMockData:]( v10,  "initWithIdentifier:andInfo:andSnapshottingEnabled:andMockData:",  v3,  v11,  v12,  v13);

    [v5 addObject:v14];
  }
}

- (void)handleStopEvent:(id)a3 withInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  PLLogDiscretionaryEnergyMonitor();
  char v8 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[PLDiscretionaryIntervalManager handleStopEvent:withInfo:].cold.4();
  }
  v9 = -[PLDiscretionaryIntervalManager activityNameToInvolvedIdentifiers](self, "activityNameToInvolvedIdentifiers");
  [v9 objectForKeyedSubscript:v6];
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    uint64_t v11 = (void *)[v7 mutableCopy];
    PLLogDiscretionaryEnergyMonitor();
    uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[PLDiscretionaryIntervalManager handleStopEvent:withInfo:].cold.3(self, (uint64_t)v11, v12);
    }
    v13 = -[PLDiscretionaryIntervalManager activityNameToInvolvedIdentifiers](self, "activityNameToInvolvedIdentifiers");
    [v13 objectForKeyedSubscript:v6];
    id v14 = (void *)objc_claimAutoreleasedReturnValue();
    [v11 setObject:v14 forKeyedSubscript:@"involvedIdentifiers"];

    [v11 objectForKeyedSubscript:@"involvedIdentifiers"];
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_super v16 = (void *)[v15 mutableCopy];

    [v7 objectForKeyedSubscript:@"requiresNetwork"];
    double v17 = (void *)objc_claimAutoreleasedReturnValue();
    int v18 = [v17 BOOLValue];

    if (v18) {
      [v16 addObject:@"discretionaryNetworkTasks"];
    }
    v20[0] = MEMORY[0x1895F87A8];
    v20[1] = 3221225472LL;
    v20[2] = __59__PLDiscretionaryIntervalManager_handleStopEvent_withInfo___block_invoke;
    v20[3] = &unk_189E9E698;
    v20[4] = self;
    [v16 enumerateObjectsUsingBlock:v20];
    PLLogDiscretionaryEnergyMonitor();
    uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[PLDiscretionaryIntervalManager handleStopEvent:withInfo:].cold.2(self, v19);
    }
  }

  else
  {
    PLLogDiscretionaryEnergyMonitor();
    uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR)) {
      -[PLDiscretionaryIntervalManager handleStopEvent:withInfo:].cold.1((uint64_t)v6, self, (os_log_s *)v11);
    }
  }
}

void __59__PLDiscretionaryIntervalManager_handleStopEvent_withInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) identifierToDiscretionaryIntervals];
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  [v4 objectForKeyedSubscript:v3];
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ([v5 count])
  {
    [v5 lastObject];
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ([v6 isClosed])
    {
      PLLogDiscretionaryEnergyMonitor();
      id v7 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __59__PLDiscretionaryIntervalManager_handleStopEvent_withInfo___block_invoke_cold_2();
      }
LABEL_15:

      goto LABEL_16;
    }

    [v6 openCount];
    [v6 setOpenCount:v8 + -1.0];
    if ([v6 shouldClose])
    {
      if ([*(id *)(a1 + 32) quickEnergyEnabled]) {
        [*(id *)(a1 + 32) reportQuickEnergyForInterval:v6 withIdentifier:v3 andAdjustSnapshotToNow:0];
      }
      [v6 closeInterval];
      [*(id *)(a1 + 32) activityNameToInvolvedIdentifiers];
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x1895F87A8];
      v14[1] = 3221225472LL;
      v14[2] = __59__PLDiscretionaryIntervalManager_handleStopEvent_withInfo___block_invoke_294;
      v14[3] = &unk_189E9E670;
      v15 = (os_log_s *)v3;
      [v9 keysOfEntriesPassingTest:v14];
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if ([v10 count])
      {
        [*(id *)(a1 + 32) activityNameToInvolvedIdentifiers];
        uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
        [v10 allObjects];
        uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
        [v11 removeObjectsForKeys:v12];
      }

      PLLogDiscretionaryEnergyMonitor();
      v13 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __59__PLDiscretionaryIntervalManager_handleStopEvent_withInfo___block_invoke_cold_3();
      }

      id v7 = v15;
      goto LABEL_15;
    }
  }

  else
  {
    PLLogDiscretionaryEnergyMonitor();
    id v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR)) {
      __59__PLDiscretionaryIntervalManager_handleStopEvent_withInfo___block_invoke_cold_1();
    }
  }

uint64_t __59__PLDiscretionaryIntervalManager_handleStopEvent_withInfo___block_invoke_294( uint64_t a1,  uint64_t a2,  void *a3)
{
  return [a3 containsObject:*(void *)(a1 + 32)];
}

- (void)reportIntervalsToPowerlog
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  [a1 identifierToDiscretionaryIntervals];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0( &dword_186654000,  a2,  v4,  "After persisting open intervals, identifierToDiscretionaryIntervals=%@",  v5);

  OUTLINED_FUNCTION_8();
}

void __59__PLDiscretionaryIntervalManager_reportIntervalsToPowerlog__block_invoke( id *a1,  void *a2,  void *a3)
{
  uint64_t v49 = *MEMORY[0x1895F89C0];
  id v36 = a2;
  id v4 = a3;
  PLLogDiscretionaryEnergyMonitor();
  v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __59__PLDiscretionaryIntervalManager_reportIntervalsToPowerlog__block_invoke_cold_2();
  }

  uint64_t v6 = (void *)objc_opt_new();
  __int128 v37 = 0u;
  __int128 v38 = 0u;
  __int128 v39 = 0u;
  __int128 v40 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v37 objects:v48 count:16];
  v34 = v6;
  if (v8)
  {
    uint64_t v9 = v8;
    char v10 = 0;
    uint64_t v11 = *(void *)v38;
    do
    {
      for (uint64_t i = 0LL; i != v9; ++i)
      {
        if (*(void *)v38 != v11) {
          objc_enumerationMutation(v7);
        }
        v13 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        [v13 originalStartDate];
        id v14 = (void *)objc_claimAutoreleasedReturnValue();
        [v13 endDate];
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (([v13 isClosed] & 1) == 0)
        {
          [v13 checkOpenIntervalDuration:v36];
          v10 |= v16 > 600.0;
          [MEMORY[0x189603F50] date];
          id v17 = (id)objc_claimAutoreleasedReturnValue();

          v47 = v13;
          [MEMORY[0x189603F18] arrayWithObjects:&v47 count:1];
          int v18 = (void *)objc_claimAutoreleasedReturnValue();
          uint64_t v19 = (void *)[v18 mutableCopy];
          uint64_t v6 = v34;
          [a1[4] setObject:v19 forKeyedSubscript:v36];

          v15 = v17;
        }

        v45[0] = @"startDate";
        v45[1] = @"endDate";
        v46[0] = v14;
        v46[1] = v15;
        [MEMORY[0x189603F68] dictionaryWithObjects:v46 forKeys:v45 count:2];
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)[v20 mutableCopy];
        [v6 addObject:v21];
      }

      uint64_t v9 = [v7 countByEnumeratingWithState:&v37 objects:v48 count:16];
    }

    while (v9);

    if ((v10 & 1) != 0) {
      [a1[5] logActivityNameToInvolvedIdentifiers];
    }
  }

  else
  {
  }

  if (([v36 isEqualToString:@"discretionaryNetworkTasks"] & 1) == 0)
  {
    PLLogDiscretionaryEnergyMonitor();
    v22 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      __59__PLDiscretionaryIntervalManager_reportIntervalsToPowerlog__block_invoke_cold_1();
    }

    v23 = (void *)objc_opt_new();
    [v23 setObject:&unk_189EA4418 forKeyedSubscript:@"updateType"];
    v24 = (void *)MEMORY[0x189603F18];
    [a1[5] coalesceIntervals:v6];
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    [v24 arrayWithArray:v25];
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    [v23 setObject:v26 forKeyedSubscript:@"eventIntervals"];

    id v27 = v36;
    v28 = +[PLCPUEnergySnapshot identifierToAccountingName](&OBJC_CLASS___PLCPUEnergySnapshot, "identifierToAccountingName");
    [v28 objectForKeyedSubscript:v27];
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      v30 = +[PLCPUEnergySnapshot identifierToAccountingName](&OBJC_CLASS___PLCPUEnergySnapshot, "identifierToAccountingName");
      [v30 objectForKeyedSubscript:v27];
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      PLLogDiscretionaryEnergyMonitor();
      v32 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v42 = v27;
        __int16 v43 = 2112;
        v44 = v31;
        _os_log_impl( &dword_186654000,  v32,  OS_LOG_TYPE_INFO,  "Adjusting identifier=%@ to accountingName=%@ before reporting to powerlog",  buf,  0x16u);
      }
    }

    else
    {
      v31 = v27;
    }

    uint64_t v6 = v34;
    [v23 setObject:v31 forKeyedSubscript:@"bundleID"];
    v33 = (void *)[v23 mutableCopy];
    [a1[6] addObject:v33];
  }
}

void __59__PLDiscretionaryIntervalManager_reportIntervalsToPowerlog__block_invoke_309(uint64_t a1, void *a2)
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

- (id)coalesceIntervals:(id)a3
{
  uint64_t v27 = *MEMORY[0x1895F89C0];
  id v3 = a3;
  PLLogDiscretionaryEnergyMonitor();
  int v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[PLDiscretionaryIntervalManager coalesceIntervals:].cold.2();
  }

  [MEMORY[0x189603FA8] array];
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  __int128 v22 = 0u;
  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v25 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0LL;
    uint64_t v9 = *(void *)v23;
    do
    {
      for (uint64_t i = 0LL; i != v7; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (v8)
        {
          [*(id *)(*((void *)&v22 + 1) + 8 * i) objectForKeyedSubscript:@"startDate"];
          uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
          [v8 objectForKeyedSubscript:@"endDate"];
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v12 timeIntervalSinceDate:v13];
          double v15 = v14;

          double v16 = -v15;
          if (v15 >= 0.0) {
            double v16 = v15;
          }
          if (v16 >= 5.0)
          {
            [v21 addObject:v8];
            id v18 = v11;

            uint64_t v8 = v18;
          }

          else
          {
            [v11 objectForKeyedSubscript:@"endDate"];
            id v17 = (void *)objc_claimAutoreleasedReturnValue();
            [v8 setObject:v17 forKeyedSubscript:@"endDate"];
          }
        }

        else
        {
          uint64_t v8 = (void *)[*(id *)(*((void *)&v22 + 1) + 8 * i) mutableCopy];
        }
      }

      uint64_t v7 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }

    while (v7);

    if (v8) {
      [v21 addObject:v8];
    }
  }

  else
  {

    uint64_t v8 = 0LL;
  }

  PLLogDiscretionaryEnergyMonitor();
  uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    -[PLDiscretionaryIntervalManager coalesceIntervals:].cold.1();
  }

  return v21;
}

- (void)reportQuickEnergyForInterval:(id)a3 withIdentifier:(id)a4 andAdjustSnapshotToNow:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v42 = *MEMORY[0x1895F89C0];
  id v8 = a3;
  id v9 = a4;
  PLLogDiscretionaryEnergyMonitor();
  char v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    [MEMORY[0x189607968] numberWithBool:v5];
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    int v32 = 138412802;
    double v33 = *(double *)&v8;
    __int16 v34 = 2112;
    id v35 = v9;
    __int16 v36 = 2112;
    __int128 v37 = v31;
    _os_log_debug_impl( &dword_186654000,  v10,  OS_LOG_TYPE_DEBUG,  "reporting quick energy for interval=%@, identifier=%@, adjustSnapshotToNow=%@",  (uint8_t *)&v32,  0x20u);
  }

  [MEMORY[0x189603F50] date];
  uint64_t v11 = (void *)objc_claimAutoreleasedReturnValue();
  [v8 currentStartDate];
  uint64_t v12 = (void *)objc_claimAutoreleasedReturnValue();
  [v11 timeIntervalSinceDate:v12];
  double v14 = v13;

  [v8 cpuEnergySnapshot];
  double v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    [v8 cpuEnergySnapshot];
    double v16 = (void *)objc_claimAutoreleasedReturnValue();
    [v16 computeEnergyDiffUntilNow:v9 andAdjustSnapshotToNow:v5];
    double v18 = v17;

    if (v18 > 0.0)
    {
      PLLogDiscretionaryEnergyMonitor();
      uint64_t v19 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        [v8 currentStartDate];
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        int v32 = 134219010;
        double v33 = v18;
        __int16 v34 = 2112;
        id v35 = v9;
        __int16 v36 = 2048;
        __int128 v37 = v14;
        __int16 v38 = 2112;
        __int128 v39 = v20;
        __int16 v40 = 2112;
        v41 = v11;
        _os_log_impl( &dword_186654000,  v19,  OS_LOG_TYPE_DEFAULT,  "Adding CPUEnergy=%f for identifier=%@ over %f seconds from startDate=%@ to endDate=%@",  (uint8_t *)&v32,  0x34u);
      }

      -[PLDiscretionaryIntervalManager discretionaryEnergyMonitor](self, "discretionaryEnergyMonitor");
      id v21 = (void *)objc_claimAutoreleasedReturnValue();
      [v21 incrementCPUEnergy:v18];
    }
  }

  uint64_t v22 = [v8 networkEnergySnapshot];
  if (v22)
  {
    __int128 v23 = (void *)v22;
    int v24 = [v9 isEqualToString:@"discretionaryNetworkTasks"];

    if (v24)
    {
      [v8 networkEnergySnapshot];
      __int128 v25 = (void *)objc_claimAutoreleasedReturnValue();
      [v25 computeEnergyDiffUntilNow:v5];
      double v27 = v26;

      if (v27 > 0.0)
      {
        PLLogDiscretionaryEnergyMonitor();
        v28 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          [v8 currentStartDate];
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          int v32 = 134219010;
          double v33 = v27;
          __int16 v34 = 2112;
          id v35 = v9;
          __int16 v36 = 2048;
          __int128 v37 = v14;
          __int16 v38 = 2112;
          __int128 v39 = v29;
          __int16 v40 = 2112;
          v41 = v11;
          _os_log_impl( &dword_186654000,  v28,  OS_LOG_TYPE_INFO,  "Adding NetworkEnergy=%f for identifier=%@ over %f seconds from startDate=%@ to endDate=%@",  (uint8_t *)&v32,  0x34u);
        }
        v30 = -[PLDiscretionaryIntervalManager discretionaryEnergyMonitor](self, "discretionaryEnergyMonitor");
        [v30 incrementNetworkEnergy:v27];
      }
    }
  }

  if (v5) {
    [v8 setCurrentStartDate:v11];
  }
}

- (void)enableQuickEnergy
{
}

- (void)disableQuickEnergy
{
}

- (void)handleOpenIntervalTimer
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __57__PLDiscretionaryIntervalManager_handleOpenIntervalTimer__block_invoke;
  block[3] = &unk_189E9E750;
  block[4] = self;
  dispatch_async(v3, block);
}

void __57__PLDiscretionaryIntervalManager_handleOpenIntervalTimer__block_invoke(uint64_t a1)
{
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __57__PLDiscretionaryIntervalManager_handleOpenIntervalTimer__block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) identifierToDiscretionaryIntervals];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1895F87A8];
  v4[1] = 3221225472LL;
  v4[2] = __57__PLDiscretionaryIntervalManager_handleOpenIntervalTimer__block_invoke_312;
  v4[3] = &unk_189E9E728;
  v4[4] = *(void *)(a1 + 32);
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
}

void __57__PLDiscretionaryIntervalManager_handleOpenIntervalTimer__block_invoke_312( uint64_t a1,  void *a2,  void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [v6 lastObject];
  uint64_t v7 = (void *)objc_claimAutoreleasedReturnValue();
  [v6 lastObject];
  id v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = [v8 isClosed];
  if ((v6 & 1) == 0 && [*(id *)(a1 + 32) quickEnergyEnabled])
  {
    PLLogDiscretionaryEnergyMonitor();
    id v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __57__PLDiscretionaryIntervalManager_handleOpenIntervalTimer__block_invoke_312_cold_1();
    }

    [*(id *)(a1 + 32) reportQuickEnergyForInterval:v7 withIdentifier:v5 andAdjustSnapshotToNow:1];
  }
}

- (void)handlePowerlogReportTimer
{
  id v3 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1895F87A8];
  block[1] = 3221225472LL;
  block[2] = __59__PLDiscretionaryIntervalManager_handlePowerlogReportTimer__block_invoke;
  block[3] = &unk_189E9E750;
  block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __59__PLDiscretionaryIntervalManager_handlePowerlogReportTimer__block_invoke(uint64_t a1)
{
  id v2 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __59__PLDiscretionaryIntervalManager_handlePowerlogReportTimer__block_invoke_cold_1();
  }

  return [*(id *)(a1 + 32) reportIntervalsToPowerlog];
}

- (id)createOpenIntervalTimer
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[PLDiscretionaryIntervalManager createOpenIntervalTimer].cold.1();
  }

  dispatch_get_global_queue(-32768LL, 0LL);
  int v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  id v5 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, v4);

  dispatch_time_t v6 = dispatch_time(0LL, 60000000000LL);
  dispatch_source_set_timer(v5, v6, 0xDF8475800uLL, 0x165A0BC00uLL);
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __57__PLDiscretionaryIntervalManager_createOpenIntervalTimer__block_invoke;
  handler[3] = &unk_189E9E750;
  handler[4] = self;
  dispatch_source_set_event_handler(v5, handler);
  dispatch_resume(v5);
  return v5;
}

uint64_t __57__PLDiscretionaryIntervalManager_createOpenIntervalTimer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleOpenIntervalTimer];
}

- (id)createPowerlogReportTimer
{
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[PLDiscretionaryIntervalManager createPowerlogReportTimer].cold.1();
  }

  dispatch_get_global_queue(-32768LL, 0LL);
  int v4 = (dispatch_queue_s *)objc_claimAutoreleasedReturnValue();
  id v5 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, v4);

  dispatch_time_t v6 = dispatch_time(0LL, 60000000000LL);
  dispatch_source_set_timer(v5, v6, 0x8BB2C97000uLL, 0x165A0BC00uLL);
  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __59__PLDiscretionaryIntervalManager_createPowerlogReportTimer__block_invoke;
  handler[3] = &unk_189E9E750;
  handler[4] = self;
  dispatch_source_set_event_handler(v5, handler);
  dispatch_resume(v5);
  return v5;
}

uint64_t __59__PLDiscretionaryIntervalManager_createPowerlogReportTimer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) handlePowerlogReportTimer];
}

- (void)logActivityNameToInvolvedIdentifiers
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  PLLogDiscretionaryEnergyMonitor();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[PLDiscretionaryIntervalManager activityNameToInvolvedIdentifiers](self, "activityNameToInvolvedIdentifiers");
    int v4 = (void *)objc_claimAutoreleasedReturnValue();
    int v6 = 134217984;
    uint64_t v7 = [v4 count];
    _os_log_impl( &dword_186654000,  v3,  OS_LOG_TYPE_INFO,  "Logging activityNameToInvolvedIdentifiers, count=%lu",  (uint8_t *)&v6,  0xCu);
  }

  -[PLDiscretionaryIntervalManager activityNameToInvolvedIdentifiers](self, "activityNameToInvolvedIdentifiers");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_314];
}

void __70__PLDiscretionaryIntervalManager_logActivityNameToInvolvedIdentifiers__block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  id v5 = a3;
  PLLogDiscretionaryEnergyMonitor();
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412546;
    id v8 = v4;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl( &dword_186654000,  v6,  OS_LOG_TYPE_INFO,  "activityName=%@, involvedIdentifiers=%@",  (uint8_t *)&v7,  0x16u);
  }
}

- (void)logDiscretionaryIntervals
{
  uint64_t v8 = *MEMORY[0x1895F89C0];
  PLLogDiscretionaryEnergyMonitor();
  id v3 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[PLDiscretionaryIntervalManager identifierToDiscretionaryIntervals](self, "identifierToDiscretionaryIntervals");
    id v4 = (void *)objc_claimAutoreleasedReturnValue();
    int v6 = 134217984;
    uint64_t v7 = [v4 count];
    _os_log_impl( &dword_186654000,  v3,  OS_LOG_TYPE_DEFAULT,  "Logging identifierToDiscretionaryIntervals, count=%lu",  (uint8_t *)&v6,  0xCu);
  }

  -[PLDiscretionaryIntervalManager identifierToDiscretionaryIntervals](self, "identifierToDiscretionaryIntervals");
  id v5 = (void *)objc_claimAutoreleasedReturnValue();
  [v5 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_315];
}

void __59__PLDiscretionaryIntervalManager_logDiscretionaryIntervals__block_invoke( uint64_t a1,  void *a2,  void *a3)
{
  uint64_t v36 = *MEMORY[0x1895F89C0];
  id v4 = a2;
  id v5 = a3;
  PLLogDiscretionaryEnergyMonitor();
  int v6 = (os_log_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v26 = v4;
    __int16 v27 = 2048;
    uint64_t v28 = [v5 count];
    _os_log_impl(&dword_186654000, v6, OS_LOG_TYPE_INFO, "identifier=%@, intervalCount=%lu", buf, 0x16u);
  }

  uint64_t v19 = v4;

  __int128 v23 = 0u;
  __int128 v24 = 0u;
  __int128 v21 = 0u;
  __int128 v22 = 0u;
  id obj = v5;
  uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v35 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0LL; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        PLLogDiscretionaryEnergyMonitor();
        uint64_t v12 = (os_log_s *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          [v11 originalStartDate];
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 currentStartDate];
          double v14 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 endDate];
          double v15 = (void *)objc_claimAutoreleasedReturnValue();
          [v11 openCount];
          uint64_t v17 = v16;
          [v11 startCount];
          *(_DWORD *)buf = 138413314;
          id v26 = v13;
          __int16 v27 = 2112;
          uint64_t v28 = (uint64_t)v14;
          __int16 v29 = 2112;
          v30 = v15;
          __int16 v31 = 2048;
          uint64_t v32 = v17;
          __int16 v33 = 2048;
          uint64_t v34 = v18;
          _os_log_impl( &dword_186654000,  v12,  OS_LOG_TYPE_INFO,  "-> interval: originalStartDate=%@, currentStartDate=%@, endDate=%@, openCount=%f, startCount=%f",  buf,  0x34u);
        }
      }

      uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v35 count:16];
    }

    while (v8);
  }
}

- (NSMutableDictionary)identifierToDiscretionaryIntervals
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setIdentifierToDiscretionaryIntervals:(id)a3
{
}

- (NSMutableDictionary)activityNameToInvolvedIdentifiers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setActivityNameToInvolvedIdentifiers:(id)a3
{
}

- (OS_dispatch_source)openIntervalTimer
{
  return self->_openIntervalTimer;
}

- (void)setOpenIntervalTimer:(id)a3
{
}

- (OS_dispatch_source)powerlogReportTimer
{
  return self->_powerlogReportTimer;
}

- (void)setPowerlogReportTimer:(id)a3
{
}

- (PLDiscretionaryEnergyMonitor)discretionaryEnergyMonitor
{
  return (PLDiscretionaryEnergyMonitor *)objc_loadWeakRetained((id *)&self->_discretionaryEnergyMonitor);
}

- (void)setDiscretionaryEnergyMonitor:(id)a3
{
}

- (BOOL)quickEnergyEnabled
{
  return self->_quickEnergyEnabled;
}

- (void)setQuickEnergyEnabled:(BOOL)a3
{
  self->_quickEnergyEnabled = a3;
}

- (NSMutableDictionary)mockData
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56LL, 1);
}

- (void)setMockData:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)handleStartEvent:(void *)a1 withInfo:(os_log_s *)a2 .cold.1(void *a1, os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  [a1 identifierToDiscretionaryIntervals];
  id v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_186654000, a2, v4, "after handleStartEvent, identifierToDiscretionaryIntervals=%@", v5);

  OUTLINED_FUNCTION_8();
}

- (void)handleStartEvent:withInfo:.cold.2()
{
  OUTLINED_FUNCTION_2(&dword_186654000, v0, v1, "handling start event for activityName=%@ with info=%@");
  OUTLINED_FUNCTION_1();
}

void __60__PLDiscretionaryIntervalManager_handleStartEvent_withInfo___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_186654000, v0, v1, "Adding a new open interval for identifier=%@", v2);
  OUTLINED_FUNCTION_1();
}

void __60__PLDiscretionaryIntervalManager_handleStartEvent_withInfo___block_invoke_cold_2()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0( &dword_186654000,  v0,  v1,  "There is already an open interval for identifier=%@, incrementing openCount",  v2);
  OUTLINED_FUNCTION_1();
}

- (void)handleStopEvent:(os_log_s *)a3 withInfo:.cold.1(uint64_t a1, void *a2, os_log_s *a3)
{
  uint64_t v7 = *MEMORY[0x1895F89C0];
  [a2 activityNameToInvolvedIdentifiers];
  uint64_t v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_13( &dword_186654000,  a3,  v5,  "Received stop event for activity with no involvedIdentifiers known for activityName=%@, activityNameToInvolvedIdentifiers=%@",  v6);

  OUTLINED_FUNCTION_11();
}

- (void)handleStopEvent:(void *)a1 withInfo:(os_log_s *)a2 .cold.2(void *a1, os_log_s *a2)
{
  uint64_t v6 = *MEMORY[0x1895F89C0];
  [a1 identifierToDiscretionaryIntervals];
  uint64_t v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_186654000, a2, v4, "after handleStopEvent, identifierToDiscretionaryIntervals=%@", v5);

  OUTLINED_FUNCTION_8();
}

- (void)handleStopEvent:(os_log_s *)a3 withInfo:.cold.3(void *a1, uint64_t a2, os_log_s *a3)
{
  uint64_t v11 = *MEMORY[0x1895F89C0];
  [a1 activityNameToInvolvedIdentifiers];
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  int v7 = 138412546;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  OUTLINED_FUNCTION_6( &dword_186654000,  a3,  v6,  "activityNameToInvolvedIdentifiers=%@, infoWithIdentifiers=%@",  (uint8_t *)&v7);

  OUTLINED_FUNCTION_11();
}

- (void)handleStopEvent:withInfo:.cold.4()
{
  OUTLINED_FUNCTION_2(&dword_186654000, v0, v1, "handling stop event for activityName=%@ with info=%@");
  OUTLINED_FUNCTION_1();
}

void __59__PLDiscretionaryIntervalManager_handleStopEvent_withInfo___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_186654000, v0, v1, "There are 0 intervals for identifier=%@", v2);
  OUTLINED_FUNCTION_1();
}

void __59__PLDiscretionaryIntervalManager_handleStopEvent_withInfo___block_invoke_cold_2()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_186654000, v0, v1, "No open intervals for identifier=%@", v2);
  OUTLINED_FUNCTION_1();
}

void __59__PLDiscretionaryIntervalManager_handleStopEvent_withInfo___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_2(&dword_186654000, v0, v1, "closed interval=%@ for identifier=%@");
  OUTLINED_FUNCTION_1();
}

void __59__PLDiscretionaryIntervalManager_reportIntervalsToPowerlog__block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_186654000, v0, v1, "intervalsPowerlogFormat=%@", v2);
  OUTLINED_FUNCTION_1();
}

void __59__PLDiscretionaryIntervalManager_reportIntervalsToPowerlog__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2(&dword_186654000, v0, v1, "Processing identifier=%@ and intervals=%@");
  OUTLINED_FUNCTION_1();
}

- (void)coalesceIntervals:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_186654000, v0, v1, "After coalescing intervals, intervals=%@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)coalesceIntervals:.cold.2()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_186654000, v0, v1, "Coalescing intervals=%@", v2);
  OUTLINED_FUNCTION_1();
}

void __57__PLDiscretionaryIntervalManager_handleOpenIntervalTimer__block_invoke_cold_1()
{
}

void __57__PLDiscretionaryIntervalManager_handleOpenIntervalTimer__block_invoke_312_cold_1()
{
  uint64_t v3 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_186654000, v0, v1, "reporting energy for openInterval=%@", v2);
  OUTLINED_FUNCTION_1();
}

void __59__PLDiscretionaryIntervalManager_handlePowerlogReportTimer__block_invoke_cold_1()
{
}

- (void)createOpenIntervalTimer
{
}

- (void)createPowerlogReportTimer
{
}

@end