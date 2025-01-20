@interface CLCachedLocationControllerAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLCachedLocationControllerAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
@end

@implementation CLCachedLocationControllerAdapter

+ (BOOL)isSupported
{
  if (qword_101997348 != -1) {
    dispatch_once(&qword_101997348, &stru_101842D70);
  }
  return (byte_101997340 & 1) == 0;
}

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101997358 != -1) {
    dispatch_once(&qword_101997358, &stru_101842D90);
  }
  return (id)qword_101997350;
}

- (CLCachedLocationControllerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLCachedLocationControllerAdapter;
  return -[CLCachedLocationControllerAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLCachedLocationControllerProtocol,  &OBJC_PROTOCOL___CLCachedLocationControllerClientProtocol);
}

- (void)beginService
{
  uint64_t v3 = sub_1005DCF84((uint64_t)-[CLCachedLocationControllerAdapter universe](self, "universe"));
  if (v3) {
    uint64_t v4 = v3 + 8;
  }
  else {
    uint64_t v4 = 0LL;
  }
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", v4);
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
  {
    uint64_t v5 = sub_1012408E4();
    sub_1005DCF84(v5);
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

@end