@interface CLCorrectiveCompensatedLocationProviderAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLCorrectiveCompensatedLocationProviderAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)fetchLocationWithReply:(id)a3;
@end

@implementation CLCorrectiveCompensatedLocationProviderAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101997318 != -1) {
    dispatch_once(&qword_101997318, &stru_101842AE8);
  }
  return (id)qword_101997310;
}

- (CLCorrectiveCompensatedLocationProviderAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLCorrectiveCompensatedLocationProviderAdapter;
  return -[CLCorrectiveCompensatedLocationProviderAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLCorrectiveCompensatedLocationProviderProtocol,  &OBJC_PROTOCOL___CLCorrectiveCompensatedLocationProviderClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier")) {
    sub_1012405E4();
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

- (void)fetchLocationWithReply:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472LL;
  v3[2] = sub_1005D8800;
  v3[3] = &unk_101842B10;
  v3[4] = a3;
  sub_1005D85D0((id *)-[CLCorrectiveCompensatedLocationProviderAdapter adaptee](self, "adaptee"), (uint64_t)v3);
}

@end