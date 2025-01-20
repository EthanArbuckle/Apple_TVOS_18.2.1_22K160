@interface CLCompanionNotifierAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLCompanionNotifierAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
@end

@implementation CLCompanionNotifierAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_1019955F0 != -1) {
    dispatch_once(&qword_1019955F0, &stru_101835570);
  }
  return (id)qword_1019955E8;
}

- (CLCompanionNotifierAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLCompanionNotifierAdapter;
  return -[CLCompanionNotifierAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLCompanionNotifierProtocol,  &OBJC_PROTOCOL___CLCompanionNotifierClientProtocol);
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
  return 0;
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
  {
    sub_101236F64();
LABEL_10:
    dispatch_once(&qword_1019344B0, &stru_101835758);
    goto LABEL_5;
  }

  v4 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  if (v4) {
  p_vtable = &OBJC_METACLASS___CLPrivacyManager.vtable;
  }
  if (qword_1019344B0 != -1) {
    goto LABEL_10;
  }
LABEL_5:
  unint64_t v5 = (os_log_s *)qword_1019344B8;
  if (os_log_type_enabled((os_log_t)qword_1019344B8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v10 = 0LL;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "companion idsService (beginService) %p",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    int v7 = 134217984;
    uint64_t v8 = 0LL;
    v6 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019344B8,  2LL,  "companion idsService (beginService) %p",  &v7);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLCompanionNotifierAdapter(isSupported) beginService]", "%s\n", v6);
  }

- (void)endService
{
  v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v2->var0 + 2))(v2);
}

@end