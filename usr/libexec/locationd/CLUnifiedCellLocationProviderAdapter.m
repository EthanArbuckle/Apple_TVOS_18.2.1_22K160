@interface CLUnifiedCellLocationProviderAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLUnifiedCellLocationProviderAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
@end

@implementation CLUnifiedCellLocationProviderAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199A010 != -1) {
    dispatch_once(&qword_10199A010, &stru_101868020);
  }
  return (id)qword_10199A008;
}

- (CLUnifiedCellLocationProviderAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLUnifiedCellLocationProviderAdapter;
  return -[CLUnifiedCellLocationProviderAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLUnifiedCellLocationProviderProtocol,  &OBJC_PROTOCOL___CLUnifiedCellLocationProviderClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier")) {
    sub_1012598B8();
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
  if (qword_10199A020 != -1) {
    dispatch_once(&qword_10199A020, &stru_101868040);
  }
  if (qword_101934850 != -1) {
    dispatch_once(&qword_101934850, &stru_101868368);
  }
  v2 = (os_log_s *)qword_101934858;
  if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67240192;
    int v8 = byte_10199A018;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "@ClxCell, supported, %{public}d", buf, 8u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101868368);
    }
    v6[0] = 67240192;
    v6[1] = byte_10199A018;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  0LL,  "@ClxCell, supported, %{public}d",  v6,  8);
    unint64_t v5 = (uint8_t *)v4;
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "+[CLUnifiedCellLocationProviderAdapter(IsSupported) isSupported]",  "%s\n",  v4);
    if (v5 != buf) {
      free(v5);
    }
  }

  return byte_10199A018;
}

@end