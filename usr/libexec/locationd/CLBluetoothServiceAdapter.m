@interface CLBluetoothServiceAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetHasConnectedDevices;
- (CLBluetoothServiceAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)clearAFHSettings;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)fetchHasConnectedDevicesWithReply:(id)a3;
- (void)fetchIsBluetoothPoweredWithReply:(id)a3;
- (void)scan;
- (void)setAFHChannelAvoidance:(id)a3;
@end

@implementation CLBluetoothServiceAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_1019992C0 != -1) {
    dispatch_once(&qword_1019992C0, &stru_10185FD08);
  }
  return (id)qword_1019992B8;
}

- (CLBluetoothServiceAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLBluetoothServiceAdapter;
  return -[CLBluetoothServiceAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLBluetoothServiceProtocol,  &OBJC_PROTOCOL___CLBluetoothServiceClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier")) {
    sub_101253090();
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
  if (qword_1019992D0 != -1) {
    dispatch_once(&qword_1019992D0, &stru_10185FD28);
  }
  return byte_1019992C8;
}

- (void)fetchHasConnectedDevicesWithReply:(id)a3
{
  (*((void (**)(id, BOOL))a3 + 2))( a3,  *((void *)-[CLBluetoothServiceAdapter adaptee](self, "adaptee") + 19) != 0LL);
}

- (void)clearAFHSettings
{
}

- (void)setAFHChannelAvoidance:(id)a3
{
}

- (BOOL)syncgetHasConnectedDevices
{
  return *((void *)-[CLBluetoothServiceAdapter adaptee](self, "adaptee") + 19) != 0LL;
}

- (void)scan
{
}

- (void)fetchIsBluetoothPoweredWithReply:(id)a3
{
}

@end