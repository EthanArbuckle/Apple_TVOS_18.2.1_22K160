@interface CLFitnessMachineNotifierAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLFitnessMachineNotifierAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)feedFitnessMachineData:(id)a3;
@end

@implementation CLFitnessMachineNotifierAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199DE20 != -1) {
    dispatch_once(&qword_10199DE20, &stru_1018808B8);
  }
  return (id)qword_10199DE18;
}

- (CLFitnessMachineNotifierAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLFitnessMachineNotifierAdapter;
  return -[CLFitnessMachineNotifierAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLFitnessMachineNotifierProtocol,  &OBJC_PROTOCOL___CLFitnessMachineNotifierClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier")) {
    sub_10126C508();
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

- (void)feedFitnessMachineData:(id)a3
{
  v4 = -[CLFitnessMachineNotifierAdapter adaptee](self, "adaptee");
  v5[8] = v7[8];
  v5[9] = v7[9];
  uint64_t v6 = v8;
  v5[4] = v7[4];
  v5[5] = v7[5];
  v5[6] = v7[6];
  v5[7] = v7[7];
  v5[0] = v7[0];
  v5[1] = v7[1];
  v5[2] = v7[2];
  v5[3] = v7[3];
  sub_100D3B3D8((uint64_t)v4, (uint64_t)v5);
}

+ (BOOL)isSupported
{
  if (qword_10199DE30 != -1) {
    dispatch_once(&qword_10199DE30, &stru_1018808D8);
  }
  return byte_10199DE28;
}

@end