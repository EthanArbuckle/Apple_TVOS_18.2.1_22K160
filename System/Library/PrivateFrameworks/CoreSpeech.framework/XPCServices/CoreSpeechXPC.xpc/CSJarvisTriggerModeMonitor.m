@interface CSJarvisTriggerModeMonitor
+ (id)sharedInstance;
+ (id)triggerModeStringDescription:(int64_t)a3;
- (CSJarvisTriggerModeMonitor)init;
- (int64_t)getTriggerMode;
@end

@implementation CSJarvisTriggerModeMonitor

- (CSJarvisTriggerModeMonitor)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CSJarvisTriggerModeMonitor;

  return 0LL;
}

- (int64_t)getTriggerMode
{
  return -1LL;
}

+ (id)sharedInstance
{
  return 0LL;
}

+ (id)triggerModeStringDescription:(int64_t)a3
{
  return @"unknown";
}

@end