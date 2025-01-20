@interface CSMacWakeSleepMonitor
+ (id)sharedInstance;
- (BOOL)deviceIsInSleep;
@end

@implementation CSMacWakeSleepMonitor

+ (id)sharedInstance
{
  return 0LL;
}

- (BOOL)deviceIsInSleep
{
  return 0;
}

@end