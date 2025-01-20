@interface CLSignificantChangeManagerAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLSignificantChangeManagerAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)fetchLastSignificantLocationDistanceAndLatencyWithReply:(id)a3;
- (void)simulateSignificantLocationChange:(id)a3;
@end

@implementation CLSignificantChangeManagerAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101999808 != -1) {
    dispatch_once(&qword_101999808, &stru_101861EB0);
  }
  return (id)qword_101999800;
}

- (CLSignificantChangeManagerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLSignificantChangeManagerAdapter;
  return -[CLSignificantChangeManagerAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLSignificantChangeManagerProtocol,  &OBJC_PROTOCOL___CLSignificantChangeManagerClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier")) {
    sub_10125451C();
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

- (void)fetchLastSignificantLocationDistanceAndLatencyWithReply:(id)a3
{
  v4 = -[CLSignificantChangeManagerAdapter adaptee](self, "adaptee");
  (*((void (**)(id, double, double))a3 + 2))(a3, v4[23], v4[24]);
}

- (void)simulateSignificantLocationChange:(id)a3
{
}

+ (BOOL)isSupported
{
  return 1;
}

@end