@interface CSBatteryMonitor
+ (id)sharedInstance;
- (CSBatteryMonitor)init;
- (unsigned)batteryState;
@end

@implementation CSBatteryMonitor

- (CSBatteryMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSBatteryMonitor;

  return 0LL;
}

- (unsigned)batteryState
{
  return 0;
}

+ (id)sharedInstance
{
  return 0LL;
}

@end