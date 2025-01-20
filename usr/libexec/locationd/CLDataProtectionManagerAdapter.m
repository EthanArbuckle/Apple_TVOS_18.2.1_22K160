@interface CLDataProtectionManagerAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDeviceUnlockedSinceFirstBoot;
- (BOOL)syncgetDoSync:(id)a3;
- (CLDataProtectionManagerAdapter)init;
- (int)syncgetDataAvailability;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)fetchDataAvailabilityWithReply:(id)a3;
- (void)postDataAvailability;
@end

@implementation CLDataProtectionManagerAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199A6A0 != -1) {
    dispatch_once(&qword_10199A6A0, &stru_10186DED8);
  }
  return (id)qword_10199A698;
}

- (CLDataProtectionManagerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLDataProtectionManagerAdapter;
  return -[CLDataProtectionManagerAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLDataProtectionManagerProtocol,  &OBJC_PROTOCOL___CLDataProtectionManagerClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier")) {
    sub_10125DA0C();
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

- (void)fetchDataAvailabilityWithReply:(id)a3
{
}

- (void)postDataAvailability
{
  if (qword_101934A70 != -1) {
    dispatch_once(&qword_101934A70, &stru_10186E080);
  }
  objc_super v3 = (os_log_s *)qword_101934A78;
  if (os_log_type_enabled((os_log_t)qword_101934A78, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEBUG,  "client of CLDataProtectionManager is requesting a re-broadcast of data availability",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934A70 != -1) {
      dispatch_once(&qword_101934A70, &stru_10186E080);
    }
    v6[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A78,  2LL,  "client of CLDataProtectionManager is requesting a re-broadcast of data availability",  v6,  2);
    unint64_t v5 = (uint8_t *)v4;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLDataProtectionManagerAdapter postDataAvailability]", "%s\n", v4);
    if (v5 != buf) {
      free(v5);
    }
  }

  sub_100ACC038(-[CLDataProtectionManagerAdapter adaptee](self, "adaptee"));
}

- (int)syncgetDataAvailability
{
  return *((_DWORD *)-[CLDataProtectionManagerAdapter adaptee](self, "adaptee") + 28);
}

- (BOOL)syncgetDeviceUnlockedSinceFirstBoot
{
  return sub_100ACC244();
}

@end