@interface CLSensorCalibrationControllerAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLSensorCalibrationControllerAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)start:(BOOL)a3;
@end

@implementation CLSensorCalibrationControllerAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199ABF8 != -1) {
    dispatch_once(&qword_10199ABF8, &stru_101873920);
  }
  return (id)qword_10199ABF0;
}

- (CLSensorCalibrationControllerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLSensorCalibrationControllerAdapter;
  return -[CLSensorCalibrationControllerAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLSensorCalibrationControllerProtocol,  &OBJC_PROTOCOL___CLSensorCalibrationControllerClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
  {
    uint64_t v3 = sub_1012600D0();
    sub_100B6ECC0(v3);
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

- (void)start:(BOOL)a3
{
}

+ (BOOL)isSupported
{
  return ((unint64_t)sub_1004F97F4() >> 13) & 1;
}

@end