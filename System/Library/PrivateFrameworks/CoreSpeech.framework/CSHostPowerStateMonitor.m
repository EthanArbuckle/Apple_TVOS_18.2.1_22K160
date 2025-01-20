@interface CSHostPowerStateMonitor
+ (id)sharedInstance;
- (int64_t)currentDarwinHostState;
- (int64_t)currentPowerState;
- (int64_t)currentRawPowerState;
- (void)_startMonitoringWithQueue:(id)a3;
- (void)_stopMonitoring;
@end

@implementation CSHostPowerStateMonitor

+ (id)sharedInstance
{
  return 0LL;
}

- (int64_t)currentPowerState
{
}

- (int64_t)currentRawPowerState
{
}

- (int64_t)currentDarwinHostState
{
  return -1LL;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[CSHostPowerStateMonitor _startMonitoringWithQueue:]", "CSHostPowerStateMonitor.m", 49, "NO");
}

- (void)_stopMonitoring
{
}

@end