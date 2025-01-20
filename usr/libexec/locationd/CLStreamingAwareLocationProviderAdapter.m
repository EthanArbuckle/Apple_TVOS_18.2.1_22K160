@interface CLStreamingAwareLocationProviderAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLStreamingAwareLocationProviderAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)releaseAccuracyEnablementAssertionForClient:(id)a3;
- (void)remoteDeviceMotionUpdate:(int)a3 atTime:(double)a4;
- (void)takeAccuracyEnablementAssertionForClient:(id)a3 withDesiredAccuracy:(double)a4;
@end

@implementation CLStreamingAwareLocationProviderAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199A878 != -1) {
    dispatch_once(&qword_10199A878, &stru_10186EB28);
  }
  return (id)qword_10199A870;
}

- (CLStreamingAwareLocationProviderAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLStreamingAwareLocationProviderAdapter;
  return -[CLStreamingAwareLocationProviderAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLStreamingAwareLocationProviderProtocol,  &OBJC_PROTOCOL___CLStreamingAwareLocationProviderClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier")) {
    sub_10125E4A0();
  }
}

- (void)endService
{
  v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v2->var0 + 2))(v2);
}

- (void)adaptee
{
  result = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (result) {
  return result;
  }
}

- (void)doAsync:(id)a3
{
}

- (void)doAsync:(id)a3 withReply:(id)a4
{
}

- (BOOL)syncgetDoSync:(id)a3
{
  return 0;
}

- (void)takeAccuracyEnablementAssertionForClient:(id)a3 withDesiredAccuracy:(double)a4
{
}

- (void)releaseAccuracyEnablementAssertionForClient:(id)a3
{
}

- (void)remoteDeviceMotionUpdate:(int)a3 atTime:(double)a4
{
}

@end