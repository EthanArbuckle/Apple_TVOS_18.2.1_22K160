@interface CLAppMonitorAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetForegroundApp:(void *)a3;
- (BOOL)syncgetIsApplicationInstalledLocally:(__CFString *)a3;
- (CLAppMonitorAdapter)init;
- (int)syncgetAppType:(id)a3;
- (void)adaptee;
- (void)beginService;
- (void)checkApplications:(id)a3 withReply:(id)a4;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)isApplicationInstalledIncludingPairedDevices:(id)a3 withReply:(id)a4;
- (void)onApplicationStateChange:(id)a3;
- (void)onApplicationStateMonitor:(id)a3 didUpdate:(id)a4 forProcess:(id)a5;
- (void)onApplicationsInstalled:(id)a3;
- (void)onApplicationsUninstalled:(id)a3;
@end

@implementation CLAppMonitorAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199E5E8 != -1) {
    dispatch_once(&qword_10199E5E8, &stru_1018821C8);
  }
  return (id)qword_10199E5E0;
}

- (CLAppMonitorAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLAppMonitorAdapter;
  return -[CLAppMonitorAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLAppMonitorProtocol,  &OBJC_PROTOCOL___CLAppMonitorClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier")) {
    sub_10126ECC8();
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

- (BOOL)syncgetForegroundApp:(void *)a3
{
  return sub_100D91610((uint64_t)-[CLAppMonitorAdapter adaptee](self, "adaptee"), (uint64_t)a3);
}

- (BOOL)syncgetIsApplicationInstalledLocally:(__CFString *)a3
{
  return sub_100D916B0(a3);
}

- (void)isApplicationInstalledIncludingPairedDevices:(id)a3 withReply:(id)a4
{
}

- (int)syncgetAppType:(id)a3
{
  return sub_100D91B10(a3);
}

- (void)onApplicationStateChange:(id)a3
{
}

- (void)onApplicationStateMonitor:(id)a3 didUpdate:(id)a4 forProcess:(id)a5
{
}

- (void)onApplicationsInstalled:(id)a3
{
}

- (void)onApplicationsUninstalled:(id)a3
{
}

- (void)checkApplications:(id)a3 withReply:(id)a4
{
}

@end