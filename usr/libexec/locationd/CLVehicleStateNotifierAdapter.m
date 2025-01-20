@interface CLVehicleStateNotifierAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLVehicleStateNotifierAdapter)init;
- (unint64_t)syncgetVehicularDndHints;
- (unint64_t)syncgetVehicularDndOperatorState;
- (unint64_t)syncgetVehicularDndState;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)fetchVehicularDndOperatorStateWithReply:(id)a3;
- (void)fetchVehicularDndStateAndHintsAndOperatorStateWithReply:(id)a3;
- (void)fetchVehicularDndStateAndHintsWithReply:(id)a3;
- (void)fetchVehicularFalsePositiveSuppressionStatusWithReply:(id)a3;
- (void)resetVehicularFalsePositiveSuppressionDnd;
@end

@implementation CLVehicleStateNotifierAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199FE90 != -1) {
    dispatch_once(&qword_10199FE90, &stru_101893EE8);
  }
  return (id)qword_10199FE88;
}

- (CLVehicleStateNotifierAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLVehicleStateNotifierAdapter;
  return -[CLVehicleStateNotifierAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLVehicleStateNotifierProtocol,  &OBJC_PROTOCOL___CLVehicleStateNotifierClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier")) {
    sub_10127F810();
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

+ (BOOL)isSupported
{
  return !sub_1004F7A4C();
}

- (unint64_t)syncgetVehicularDndState
{
  return *((void *)-[CLVehicleStateNotifierAdapter adaptee](self, "adaptee") + 143);
}

- (unint64_t)syncgetVehicularDndHints
{
  return *((void *)-[CLVehicleStateNotifierAdapter adaptee](self, "adaptee") + 145);
}

- (unint64_t)syncgetVehicularDndOperatorState
{
  return *((void *)-[CLVehicleStateNotifierAdapter adaptee](self, "adaptee") + 146);
}

- (void)resetVehicularFalsePositiveSuppressionDnd
{
}

- (void)fetchVehicularFalsePositiveSuppressionStatusWithReply:(id)a3
{
  uint64_t v4 = sub_100FFA990((uint64_t)-[CLVehicleStateNotifierAdapter adaptee](self, "adaptee"));
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v4);
}

- (void)fetchVehicularDndStateAndHintsWithReply:(id)a3
{
}

- (void)fetchVehicularDndOperatorStateWithReply:(id)a3
{
}

- (void)fetchVehicularDndStateAndHintsAndOperatorStateWithReply:(id)a3
{
}

@end