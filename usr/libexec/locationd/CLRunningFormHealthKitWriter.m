@interface CLRunningFormHealthKitWriter
- (CLRunningFormHealthKitWriter)init;
- (void)dealloc;
@end

@implementation CLRunningFormHealthKitWriter

- (CLRunningFormHealthKitWriter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLRunningFormHealthKitWriter;
  return -[CLRunningHealthKitWriter init](&v3, "init");
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)&OBJC_CLASS___CLRunningFormHealthKitWriter;
  -[CLRunningHealthKitWriter dealloc](&v2, "dealloc");
}

@end