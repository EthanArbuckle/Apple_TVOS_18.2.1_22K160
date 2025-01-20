@interface CLLoiLocationProviderAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLLoiLocationProviderAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
@end

@implementation CLLoiLocationProviderAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199A9D8 != -1) {
    dispatch_once(&qword_10199A9D8, &stru_101872A18);
  }
  return (id)qword_10199A9D0;
}

- (CLLoiLocationProviderAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLLoiLocationProviderAdapter;
  return -[CLLoiLocationProviderAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLLoiLocationProviderProtocol,  &OBJC_PROTOCOL___CLLoiLocationProviderClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier")) {
    sub_10125FD38();
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
  else {
    BOOL v2 = 1;
  }
  if (!v2) {
    byte_10199A9E0 = 1;
  }
  if (qword_101934850 != -1) {
    dispatch_once(&qword_101934850, &stru_101872C20);
  }
  objc_super v3 = (os_log_s *)qword_101934858;
  if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67240192;
    int v9 = byte_10199A9E0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "@ClxLoi, supported, %{public}d", buf, 8u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101872C20);
    }
    v7[0] = 67240192;
    v7[1] = byte_10199A9E0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  1LL,  "@ClxLoi, supported, %{public}d",  v7,  8);
    v6 = (uint8_t *)v5;
    sub_10029211C("Generic", 1LL, 0, 2LL, "+[CLLoiLocationProviderAdapter(IsSupported) isSupported]", "%s\n", v5);
    if (v6 != buf) {
      free(v6);
    }
  }

  return byte_10199A9E0;
}

@end