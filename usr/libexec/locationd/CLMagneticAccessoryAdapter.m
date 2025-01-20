@interface CLMagneticAccessoryAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLMagneticAccessoryAdapter)init;
- (CLMagneticAccessoryAdapter)initWithMagneticAccessory:(void *)a3;
- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7;
- (void)accessoryEndpointDetached:(id)a3 forConnection:(id)a4;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
@end

@implementation CLMagneticAccessoryAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_1019999A8 != -1) {
    dispatch_once(&qword_1019999A8, &stru_101863860);
  }
  return (id)qword_1019999A0;
}

- (CLMagneticAccessoryAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLMagneticAccessoryAdapter;
  return -[CLMagneticAccessoryAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLMagneticAccessoryProtocol,  &OBJC_PROTOCOL___CLMagneticAccessoryClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier")) {
    sub_1012553D0();
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
  if (qword_1019999B8 != -1) {
    dispatch_once(&qword_1019999B8, &stru_101863880);
  }
  return byte_1019999B0;
}

- (CLMagneticAccessoryAdapter)initWithMagneticAccessory:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CLMagneticAccessoryAdapter;
  result = -[CLNotifierServiceAdapter init](&v5, "init");
  if (result) {
    result->_magneticAccessory = a3;
  }
  return result;
}

- (void)accessoryEndpointDetached:(id)a3 forConnection:(id)a4
{
}

- (void)accessoryEndpointAttached:(id)a3 transportType:(int)a4 protocol:(int)a5 properties:(id)a6 forConnection:(id)a7
{
}

@end