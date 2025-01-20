@interface CLRunningPowerHealthKitWriter
- (CLRunningPowerHealthKitWriter)init;
- (void)dealloc;
@end

@implementation CLRunningPowerHealthKitWriter

- (CLRunningPowerHealthKitWriter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLRunningPowerHealthKitWriter;
  return -[CLRunningHealthKitWriter init](&v3, "init");
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___CLRunningPowerHealthKitWriter;
  -[CLRunningHealthKitWriter dealloc](&v2, "dealloc");
}

@end