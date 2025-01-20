@interface RBHistoricalStatistics
- (RBHistoricalStatistics)initWithReportFrequency:(unint64_t)a3;
- (void)logStatisticsPeriodically;
- (void)logStatisticsWithLabel:(void *)a1;
- (void)notifyAssertionCount:(unint64_t)a3;
- (void)notifyClientCount:(unint64_t)a3;
- (void)notifyMonitorCount:(unint64_t)a3;
- (void)notifyProcessCount:(unint64_t)a3;
@end

@implementation RBHistoricalStatistics

- (void)logStatisticsWithLabel:(void *)a1
{
  uint64_t v31 = *MEMORY[0x1895F89C0];
  id v3 = a2;
  if (a1)
  {
    rbs_general_log();
    v4 = (os_log_s *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = a1[2];
      uint64_t v6 = a1[3];
      uint64_t v7 = a1[4];
      uint64_t v8 = a1[5];
      uint64_t v9 = a1[6];
      uint64_t v10 = a1[7];
      uint64_t v11 = a1[8];
      uint64_t v12 = a1[9];
      int v13 = 138414338;
      id v14 = v3;
      __int16 v15 = 2048;
      uint64_t v16 = v5;
      __int16 v17 = 2048;
      uint64_t v18 = v6;
      __int16 v19 = 2048;
      uint64_t v20 = v7;
      __int16 v21 = 2048;
      uint64_t v22 = v8;
      __int16 v23 = 2048;
      uint64_t v24 = v9;
      __int16 v25 = 2048;
      uint64_t v26 = v10;
      __int16 v27 = 2048;
      uint64_t v28 = v11;
      __int16 v29 = 2048;
      uint64_t v30 = v12;
      _os_log_impl( &dword_188634000,  v4,  OS_LOG_TYPE_DEFAULT,  "%@C %lu(%lu) P %lu(%lu) A %lu(%lu) M %lu(%lu)",  (uint8_t *)&v13,  0x5Cu);
    }
  }
}

- (void)logStatisticsPeriodically
{
  if (a1)
  {
    block[0] = MEMORY[0x1895F87A8];
    block[1] = 3221225472LL;
    block[2] = __51__RBHistoricalStatistics_logStatisticsPeriodically__block_invoke;
    block[3] = &unk_18A255C70;
    block[4] = a1;
    if (logStatisticsPeriodically_onceToken != -1) {
      dispatch_once(&logStatisticsPeriodically_onceToken, block);
    }
  }

void __51__RBHistoricalStatistics_logStatisticsPeriodically__block_invoke(uint64_t a1)
{
  v2 = (dispatch_queue_attr_s *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_t v3 = dispatch_queue_create("RBHistoricalStatistics", v2);
  v4 = (void *)logStatisticsPeriodically_periodicQueue;
  logStatisticsPeriodically_periodicQueue = (uint64_t)v3;

  dispatch_source_t v5 = dispatch_source_create(MEMORY[0x1895F8B78], 0LL, 0LL, (dispatch_queue_t)logStatisticsPeriodically_periodicQueue);
  uint64_t v6 = (void *)logStatisticsPeriodically_periodicSource;
  logStatisticsPeriodically_periodicSource = (uint64_t)v5;

  handler[0] = MEMORY[0x1895F87A8];
  handler[1] = 3221225472LL;
  handler[2] = __51__RBHistoricalStatistics_logStatisticsPeriodically__block_invoke_2;
  handler[3] = &unk_18A255C70;
  handler[4] = *(void *)(a1 + 32);
  dispatch_source_set_event_handler((dispatch_source_t)logStatisticsPeriodically_periodicSource, handler);
  dispatch_activate((dispatch_object_t)logStatisticsPeriodically_periodicSource);
  uint64_t v7 = (dispatch_source_s *)logStatisticsPeriodically_periodicSource;
  dispatch_time_t v8 = dispatch_time(0LL, *(void *)(*(void *)(a1 + 32) + 80LL));
  dispatch_source_set_timer( v7,  v8,  *(void *)(*(void *)(a1 + 32) + 80LL),  *(void *)(*(void *)(a1 + 32) + 80LL) / 0xAuLL);
}

void __51__RBHistoricalStatistics_logStatisticsPeriodically__block_invoke_2(uint64_t a1)
{
}

- (RBHistoricalStatistics)initWithReportFrequency:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___RBHistoricalStatistics;
  v4 = -[RBHistoricalStatistics init](&v7, sel_init);
  dispatch_source_t v5 = v4;
  if (v4)
  {
    v4->_frequency = a3;
    v4->_period = 60000000000LL * a3;
    -[RBHistoricalStatistics logStatisticsPeriodically]((uint64_t)v4);
  }

  return v5;
}

- (void)notifyClientCount:(unint64_t)a3
{
  self->_currentClients = a3;
  if (self->_peakClients < a3)
  {
    self->_peakClients = a3;
    -[RBHistoricalStatistics logStatisticsWithLabel:](self, @"Client HWM ");
  }

- (void)notifyProcessCount:(unint64_t)a3
{
  self->_currentProcesses = a3;
  if (self->_peakProcesses < a3)
  {
    self->_peakProcesses = a3;
    -[RBHistoricalStatistics logStatisticsWithLabel:](self, @"Process HWM ");
  }

- (void)notifyAssertionCount:(unint64_t)a3
{
  self->_currentAsserions = a3;
  if (self->_peakAssertions < a3)
  {
    self->_peakAssertions = a3;
    -[RBHistoricalStatistics logStatisticsWithLabel:](self, @"Assertion HWM ");
  }

- (void)notifyMonitorCount:(unint64_t)a3
{
  self->_currentMonitors = a3;
  if (self->_peakMonitors < a3)
  {
    self->_peakMonitors = a3;
    -[RBHistoricalStatistics logStatisticsWithLabel:](self, @"Monitor HWM ");
  }

@end