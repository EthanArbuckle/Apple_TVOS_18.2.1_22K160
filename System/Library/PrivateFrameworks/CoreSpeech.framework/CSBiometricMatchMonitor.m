@interface CSBiometricMatchMonitor
+ (id)sharedInstance;
- (BOOL)getLastBiometricMatchEvent:(BOOL *)a3 atTime:(unint64_t *)a4;
- (CSBiometricMatchMonitorDelegate)delegate;
- (unint64_t)getBiometricMatchResultForTriggerTimeStamp:(unint64_t)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CSBiometricMatchMonitor

+ (id)sharedInstance
{
  return 0LL;
}

- (BOOL)getLastBiometricMatchEvent:(BOOL *)a3 atTime:(unint64_t *)a4
{
  return 0;
}

- (unint64_t)getBiometricMatchResultForTriggerTimeStamp:(unint64_t)a3
{
  return 0LL;
}

- (CSBiometricMatchMonitorDelegate)delegate
{
  return (CSBiometricMatchMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end