@interface CLTimeManagerAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetReferenceTime:(double *)a3;
- (BOOL)syncgetReferenceTime:(double *)a3 andError:(double *)a4;
- (CLTimeManagerAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)setGpsTime:(unint64_t)a3;
@end

@implementation CLTimeManagerAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101995750 != -1) {
    dispatch_once(&qword_101995750, &stru_101838568);
  }
  return (id)qword_101995748;
}

- (CLTimeManagerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLTimeManagerAdapter;
  return -[CLTimeManagerAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLTimeManagerProtocol,  &OBJC_PROTOCOL___CLTimeManagerClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
  {
    uint64_t v3 = sub_101239138();
    sub_100415338(v3);
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

- (BOOL)syncgetReferenceTime:(double *)a3
{
  return TMGetReferenceTime(a3, &v5, v6) != 0;
}

- (BOOL)syncgetReferenceTime:(double *)a3 andError:(double *)a4
{
  return TMGetReferenceTime(a3, a4, v7) != 0;
}

- (void)setGpsTime:(unint64_t)a3
{
}

@end