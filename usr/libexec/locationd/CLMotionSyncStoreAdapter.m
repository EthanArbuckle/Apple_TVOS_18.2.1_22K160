@interface CLMotionSyncStoreAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLMotionSyncStoreAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)resetStoredCalibrations;
@end

@implementation CLMotionSyncStoreAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199DDB0 != -1) {
    dispatch_once(&qword_10199DDB0, &stru_1018801D8);
  }
  return (id)qword_10199DDA8;
}

- (CLMotionSyncStoreAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLMotionSyncStoreAdapter;
  return -[CLMotionSyncStoreAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLMotionSyncStoreProtocol,  &OBJC_PROTOCOL___CLMotionSyncStoreClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier")) {
    sub_10126C0EC();
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
  return sub_1004F7000();
}

- (void)resetStoredCalibrations
{
  v2 = -[CLMotionSyncStoreAdapter adaptee](self, "adaptee");
  (*(void (**)(void *))(*(void *)v2 + 232LL))(v2);
  if (qword_1019344D0 != -1) {
    dispatch_once(&qword_1019344D0, &stru_101880368);
  }
  objc_super v3 = (os_log_s *)qword_1019344D8;
  if (os_log_type_enabled((os_log_t)qword_1019344D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "#Notice Calibrations were successfully cleared.",  buf,  2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019344D0 != -1) {
      dispatch_once(&qword_1019344D0, &stru_101880368);
    }
    v6[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019344D8,  0LL,  "#Notice Calibrations were successfully cleared.",  v6,  2);
    unint64_t v5 = (uint8_t *)v4;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLMotionSyncStoreAdapter resetStoredCalibrations]", "%s\n", v4);
    if (v5 != buf) {
      free(v5);
    }
  }

@end