@interface PLDiscretionaryInterval
- (BOOL)isClosed;
- (BOOL)shouldClose;
- (NSDate)currentStartDate;
- (NSDate)endDate;
- (NSDate)originalStartDate;
- (PLCPUEnergySnapshot)cpuEnergySnapshot;
- (PLDiscretionaryInterval)initWithIdentifier:(id)a3 andInfo:(id)a4 andSnapshottingEnabled:(BOOL)a5 andMockData:(id)a6;
- (PLNetworkUsageSnapshot)networkEnergySnapshot;
- (double)checkOpenIntervalDuration:(id)a3;
- (double)openCount;
- (double)startCount;
- (id)description;
- (void)closeInterval;
- (void)setCpuEnergySnapshot:(id)a3;
- (void)setCurrentStartDate:(id)a3;
- (void)setEndDate:(id)a3;
- (void)setNetworkEnergySnapshot:(id)a3;
- (void)setOpenCount:(double)a3;
- (void)setOriginalStartDate:(id)a3;
- (void)setStartCount:(double)a3;
@end

@implementation PLDiscretionaryInterval

- (PLDiscretionaryInterval)initWithIdentifier:(id)a3 andInfo:(id)a4 andSnapshottingEnabled:(BOOL)a5 andMockData:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)&OBJC_CLASS___PLDiscretionaryInterval;
  v13 = -[PLDiscretionaryInterval init](&v18, sel_init);
  if (v13)
  {
    [MEMORY[0x189603F50] date];
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLDiscretionaryInterval setOriginalStartDate:](v13, "setOriginalStartDate:", v14);
    v15 = -[PLDiscretionaryInterval originalStartDate](v13, "originalStartDate");
    -[PLDiscretionaryInterval setCurrentStartDate:](v13, "setCurrentStartDate:", v15);

    -[PLDiscretionaryInterval setOpenCount:](v13, "setOpenCount:", 1.0);
    -[PLDiscretionaryInterval setStartCount:](v13, "setStartCount:", 1.0);
    if (a5)
    {
      if ([v10 isEqualToString:@"discretionaryNetworkTasks"])
      {
        v16 = -[PLNetworkUsageSnapshot initWithInfo:]( objc_alloc(&OBJC_CLASS___PLNetworkUsageSnapshot),  "initWithInfo:",  v11);
        -[PLDiscretionaryInterval setNetworkEnergySnapshot:](v13, "setNetworkEnergySnapshot:", v16);
      }

      else
      {
        v16 = -[PLCPUEnergySnapshot initWithIdentifier:andMockData:]( objc_alloc(&OBJC_CLASS___PLCPUEnergySnapshot),  "initWithIdentifier:andMockData:",  v10,  v12);
        -[PLDiscretionaryInterval setCpuEnergySnapshot:](v13, "setCpuEnergySnapshot:", v16);
      }
    }

    else
    {
      PLLogDiscretionaryEnergyMonitor();
      v16 = (PLNetworkUsageSnapshot *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEBUG)) {
        -[PLDiscretionaryInterval initWithIdentifier:andInfo:andSnapshottingEnabled:andMockData:].cold.1();
      }
    }
  }

  return v13;
}

- (BOOL)shouldClose
{
  return v2 < 1.0;
}

- (BOOL)isClosed
{
  double v2 = (void *)objc_claimAutoreleasedReturnValue();
  BOOL v3 = v2 != 0LL;

  return v3;
}

- (void)closeInterval
{
  uint64_t v5 = *MEMORY[0x1895F89C0];
  [a1 openCount];
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_10(&dword_186654000, a2, v3, "Attempted to close interval with openCount=%f", v4);
  OUTLINED_FUNCTION_8();
}

- (double)checkOpenIntervalDuration:(id)a3
{
  uint64_t v19 = *MEMORY[0x1895F89C0];
  id v4 = a3;
  if (-[PLDiscretionaryInterval isClosed](self, "isClosed"))
  {
    PLLogDiscretionaryEnergyMonitor();
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    double v6 = 0.0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[PLDiscretionaryInterval checkOpenIntervalDuration:].cold.1();
    }
  }

  else
  {
    [MEMORY[0x189603F50] date];
    uint64_t v5 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    v7 = -[PLDiscretionaryInterval originalStartDate](self, "originalStartDate");
    -[os_log_s timeIntervalSinceDate:](v5, "timeIntervalSinceDate:", v7);
    double v6 = v8;

    PLLogDiscretionaryEnergyMonitor();
    v9 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      -[PLDiscretionaryInterval originalStartDate](self, "originalStartDate");
      id v12 = (void *)objc_claimAutoreleasedReturnValue();
      int v13 = 134218498;
      double v14 = v6;
      __int16 v15 = 2112;
      v16 = (PLDiscretionaryInterval *)v5;
      __int16 v17 = 2112;
      id v18 = v12;
      _os_log_debug_impl( &dword_186654000,  v9,  OS_LOG_TYPE_DEBUG,  "timeSinceIntervalStart=%f, now=%@, intervalStartDate=%@",  (uint8_t *)&v13,  0x20u);
    }

    if (v6 > 600.0)
    {
      PLLogDiscretionaryEnergyMonitor();
      id v10 = (os_log_s *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v13 = 134218498;
        double v14 = v6;
        __int16 v15 = 2112;
        v16 = self;
        __int16 v17 = 2112;
        id v18 = v4;
        _os_log_error_impl( &dword_186654000,  v10,  OS_LOG_TYPE_ERROR,  "Interval open for %f seconds, potential unclosed interval=%@ for identifier=%@",  (uint8_t *)&v13,  0x20u);
      }
    }
  }

  return v6;
}

- (id)description
{
  uint64_t v3 = (void *)NSString;
  -[PLDiscretionaryInterval originalStartDate](self, "originalStartDate");
  id v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDiscretionaryInterval currentStartDate](self, "currentStartDate");
  uint64_t v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDiscretionaryInterval endDate](self, "endDate");
  double v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PLDiscretionaryInterval cpuEnergySnapshot](self, "cpuEnergySnapshot");
  -[PLDiscretionaryInterval networkEnergySnapshot](self, "networkEnergySnapshot");
  double v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDiscretionaryInterval openCount](self, "openCount");
  uint64_t v10 = v9;
  -[PLDiscretionaryInterval startCount](self, "startCount");
  [v3 stringWithFormat:@"originalStartDate=%@, currentStartDate=%@, endDate=%@, cpuEnergySnapshot=%@, networkEnergySnapshot=%@, openCount=%f, startCount=%f", v4, v5, v6, v7, v8, v10, v11];
  id v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (NSDate)originalStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 8LL, 1);
}

- (void)setOriginalStartDate:(id)a3
{
}

- (NSDate)currentStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 16LL, 1);
}

- (void)setCurrentStartDate:(id)a3
{
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 24LL, 1);
}

- (void)setEndDate:(id)a3
{
}

- (PLCPUEnergySnapshot)cpuEnergySnapshot
{
  return (PLCPUEnergySnapshot *)objc_getProperty(self, a2, 32LL, 1);
}

- (void)setCpuEnergySnapshot:(id)a3
{
}

- (PLNetworkUsageSnapshot)networkEnergySnapshot
{
  return (PLNetworkUsageSnapshot *)objc_getProperty(self, a2, 40LL, 1);
}

- (void)setNetworkEnergySnapshot:(id)a3
{
}

- (double)startCount
{
  return self->_startCount;
}

- (void)setStartCount:(double)a3
{
  self->_startCount = a3;
}

- (double)openCount
{
  return self->_openCount;
}

- (void)setOpenCount:(double)a3
{
  self->_openCount = a3;
}

- (void).cxx_destruct
{
}

- (void)initWithIdentifier:andInfo:andSnapshottingEnabled:andMockData:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1895F89C0];
  OUTLINED_FUNCTION_4();
  __int16 v2 = 1024;
  int v3 = 0;
  _os_log_debug_impl( &dword_186654000,  v0,  OS_LOG_TYPE_DEBUG,  "Initializing discretionary interval without snapshotting for identifier=%@, snapshottingEnabled=%d",  v1,  0x12u);
  OUTLINED_FUNCTION_1();
}

- (void)checkOpenIntervalDuration:.cold.1()
{
}

@end