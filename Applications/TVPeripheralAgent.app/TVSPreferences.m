@interface TVSPreferences
+ (id)sharedPeripheralAgentPreferences;
- (double)remote10PercentBatteryCheckTimeIntervalInSeconds;
- (double)remote20PercentBatteryCheckTimeIntervalInSeconds;
- (double)remoteCriticallyLowBatteryCheckTimeIntervalInSeconds;
- (double)remoteCriticallyLowBatteryUserInitiatedCheckTimeIntervalInSeconds;
- (double)remoteTimeIntervalInSecondsSinceLastBatteryCheck;
- (void)setRemoteTimeIntervalInSecondsSinceLastBatteryCheck:(double)a3;
@end

@implementation TVSPreferences

+ (id)sharedPeripheralAgentPreferences
{
  v4 = (dispatch_once_t *)&unk_100040338;
  id location = 0LL;
  objc_storeStrong(&location, &stru_1000386A0);
  if (*v4 != -1) {
    dispatch_once(v4, location);
  }
  objc_storeStrong(&location, 0LL);
  return (id)qword_100040328;
}

- (double)remote20PercentBatteryCheckTimeIntervalInSeconds
{
  return result;
}

- (double)remote10PercentBatteryCheckTimeIntervalInSeconds
{
  return result;
}

- (double)remoteCriticallyLowBatteryCheckTimeIntervalInSeconds
{
  return result;
}

- (double)remoteCriticallyLowBatteryUserInitiatedCheckTimeIntervalInSeconds
{
  return result;
}

- (double)remoteTimeIntervalInSecondsSinceLastBatteryCheck
{
  return result;
}

- (void)setRemoteTimeIntervalInSecondsSinceLastBatteryCheck:(double)a3
{
}

@end