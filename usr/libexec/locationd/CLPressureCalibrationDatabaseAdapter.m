@interface CLPressureCalibrationDatabaseAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLPressureCalibrationDatabaseAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
@end

@implementation CLPressureCalibrationDatabaseAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101999348 != -1) {
    dispatch_once(&qword_101999348, &stru_101861400);
  }
  return (id)qword_101999340;
}

- (CLPressureCalibrationDatabaseAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLPressureCalibrationDatabaseAdapter;
  return -[CLPressureCalibrationDatabaseAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLPressureCalibrationDatabaseProtocol,  &OBJC_PROTOCOL___CLPressureCalibrationDatabaseClientProtocol);
}

- (void)beginService
{
  uint64_t v3 = sub_100934244((uint64_t)-[CLPressureCalibrationDatabaseAdapter universe](self, "universe"));
  if (v3) {
    uint64_t v4 = v3 + 16;
  }
  else {
    uint64_t v4 = 0LL;
  }
  -[CLNotifierServiceAdapter setAdaptedNotifier:](self, "setAdaptedNotifier:", v4);
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
  {
    uint64_t v5 = sub_101253D28();
    sub_100934244(v5);
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

+ (BOOL)isSupported
{
  if (qword_101999358 != -1) {
    dispatch_once(&qword_101999358, &stru_101861420);
  }
  return byte_101999350;
}

@end