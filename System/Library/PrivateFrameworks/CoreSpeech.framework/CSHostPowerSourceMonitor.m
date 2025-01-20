@interface CSHostPowerSourceMonitor
+ (id)sharedInstance;
- (CSHostPowerSourceMonitor)init;
- (int64_t)currentPowerSource;
@end

@implementation CSHostPowerSourceMonitor

- (CSHostPowerSourceMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSHostPowerSourceMonitor;

  return 0LL;
}

- (int64_t)currentPowerSource
{
  return 0LL;
}

+ (id)sharedInstance
{
  return 0LL;
}

@end