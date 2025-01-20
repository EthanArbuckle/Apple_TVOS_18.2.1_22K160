@interface CLDaemonStatusAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetAirplaneMode:(BOOL *)a3;
- (BOOL)syncgetBatterySaverMode;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetHasLingerClients;
- (BOOL)syncgetIsSleeping;
- (BOOL)syncgetRegisterPowerKeepAlive:(BOOL)a3 client:(unint64_t)a4 dbgMessage:(id)a5;
- (CLDaemonStatusAdapter)init;
- (int)syncgetReachability;
- (int)syncgetThermalLevel;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)fetchIsAirplaneModeEnabledWithReply:(id)a3;
- (void)fetchIsBatteryConnectedWithReply:(id)a3;
- (void)fetchReachabilityWithReply:(id)a3;
- (void)fetchWirelessModemClientCountWithReply:(id)a3;
- (void)notifyMigrationPerformed;
- (void)triggerMetricHeartbeatNotification;
@end

@implementation CLDaemonStatusAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101995628 != -1) {
    dispatch_once(&qword_101995628, &stru_101835D38);
  }
  return (id)qword_101995620;
}

- (CLDaemonStatusAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLDaemonStatusAdapter;
  return -[CLDaemonStatusAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLDaemonStatusProtocol,  &OBJC_PROTOCOL___CLDaemonStatusClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
  {
    uint64_t v3 = sub_101237C68();
    sub_1003C5E44(v3);
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

- (void)fetchIsAirplaneModeEnabledWithReply:(id)a3
{
}

- (void)fetchReachabilityWithReply:(id)a3
{
}

- (void)fetchIsBatteryConnectedWithReply:(id)a3
{
  int v9 = 7;
  v4 = -[CLDaemonStatusAdapter adaptee](self, "adaptee", 0xBFF0000000000000LL, 0LL, 0LL);
  unsigned int v5 = (*(uint64_t (**)(void *, int *, uint64_t *))(*(void *)v4 + 128LL))(v4, &v9, &v7);
  if (BYTE1(v8)) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0LL;
  }
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v6);
}

- (void)fetchWirelessModemClientCountWithReply:(id)a3
{
  int v7 = 12;
  LOBYTE(v6[0]) = 0;
  v4 = -[CLDaemonStatusAdapter adaptee](self, "adaptee");
  else {
    uint64_t v5 = 0LL;
  }
  (*((void (**)(id, uint64_t))a3 + 2))(a3, v5);
}

- (BOOL)syncgetAirplaneMode:(BOOL *)a3
{
  *a3 = objc_msgSend(*((id *)-[CLDaemonStatusAdapter adaptee](self, "adaptee") + 14), "airplaneMode");
  return 1;
}

- (int)syncgetReachability
{
  return objc_msgSend(*((id *)-[CLDaemonStatusAdapter adaptee](self, "adaptee") + 14), "reachability");
}

- (BOOL)syncgetHasLingerClients
{
  int v3 = 19;
  return sub_100247620((uint64_t)-[CLDaemonStatusAdapter adaptee](self, "adaptee"), &v3, 1LL) != 0;
}

- (BOOL)syncgetIsSleeping
{
  return *((_BYTE *)-[CLDaemonStatusAdapter adaptee](self, "adaptee") + 248);
}

- (void)notifyMigrationPerformed
{
}

- (BOOL)syncgetRegisterPowerKeepAlive:(BOOL)a3 client:(unint64_t)a4 dbgMessage:(id)a5
{
  return sub_1003C638C( (uint64_t)-[CLDaemonStatusAdapter adaptee](self, "adaptee"),  a3,  a4,  (uint64_t)[a5 UTF8String]);
}

- (void)triggerMetricHeartbeatNotification
{
}

- (int)syncgetThermalLevel
{
  return objc_msgSend(*((id *)-[CLDaemonStatusAdapter adaptee](self, "adaptee") + 14), "thermalLevel");
}

- (BOOL)syncgetBatterySaverMode
{
  return objc_msgSend( *((id *)-[CLDaemonStatusAdapter adaptee](self, "adaptee") + 14),  "batterySaverModeEnabled");
}

@end