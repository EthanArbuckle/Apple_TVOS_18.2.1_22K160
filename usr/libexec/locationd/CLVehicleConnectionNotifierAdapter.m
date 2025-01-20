@interface CLVehicleConnectionNotifierAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLVehicleConnectionNotifierAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)deliverAndReleaseNotification:(__CFUserNotification *)a3 withFlags:(unint64_t)a4;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)fetchIsDeviceVehicle:(id)a3 deviceType:(unint64_t)a4 withReply:(id)a5;
- (void)fetchMostRecentConnectionWithReply:(id)a3;
- (void)fetchMostRecentInVehicleStartAndExitTimesWithReply:(id)a3;
@end

@implementation CLVehicleConnectionNotifierAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199DD58 != -1) {
    dispatch_once(&qword_10199DD58, &stru_10187FD60);
  }
  return (id)qword_10199DD50;
}

- (CLVehicleConnectionNotifierAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLVehicleConnectionNotifierAdapter;
  return -[CLVehicleConnectionNotifierAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLVehicleConnectionNotifierProtocol,  &OBJC_PROTOCOL___CLVehicleConnectionNotifierClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier")) {
    sub_10126BDF4();
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

- (void)fetchMostRecentConnectionWithReply:(id)a3
{
}

- (void)fetchIsDeviceVehicle:(id)a3 deviceType:(unint64_t)a4 withReply:(id)a5
{
  int v6 = a4;
  sub_1010DDBC0(__p, (char *)[a3 UTF8String]);
  v8 = -[CLVehicleConnectionNotifierAdapter adaptee](self, "adaptee");
  int v9 = v8[944];
  BOOL v10 = (v6 == 22 || v6 == 17) && (sub_100D25CD0((uint64_t)v8, (uint64_t)__p) & 1) != 0 || v6 == 16 && v9 != 0;
  (*((void (**)(id, BOOL))a5 + 2))(a5, v10);
  if (v13 < 0) {
    operator delete(__p[0]);
  }
}

- (void)deliverAndReleaseNotification:(__CFUserNotification *)a3 withFlags:(unint64_t)a4
{
}

- (void)fetchMostRecentInVehicleStartAndExitTimesWithReply:(id)a3
{
}

@end