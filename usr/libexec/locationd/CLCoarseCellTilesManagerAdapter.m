@interface CLCoarseCellTilesManagerAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLCoarseCellTilesManagerAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)requestCellTileDownloadByType:(int)a3 lat:(double)a4 lon:(double)a5 seckey:(unint64_t)a6;
@end

@implementation CLCoarseCellTilesManagerAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101999918 != -1) {
    dispatch_once(&qword_101999918, &stru_101862620);
  }
  return (id)qword_101999910;
}

- (CLCoarseCellTilesManagerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLCoarseCellTilesManagerAdapter;
  return -[CLCoarseCellTilesManagerAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLCoarseCellTilesManagerProtocol,  &OBJC_PROTOCOL___CLCoarseCellTilesManagerClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
  {
    uint64_t v3 = sub_1012546E8();
    sub_100964048(v3);
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
  int v2 = sub_1004FC938();
  if (v2)
  {
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_1018628A8);
    }
    uint64_t v3 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "CLCoarseCellTilesManager is not supported in diagnostics mode",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_1018628A8);
      }
      v7[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  0LL,  "CLCoarseCellTilesManager is not supported in diagnostics mode",  v7,  2);
      v6 = (uint8_t *)v5;
      sub_10029211C("Generic", 1LL, 0, 2LL, "+[CLCoarseCellTilesManagerAdapter isSupported]", "%s\n", v5);
      if (v6 != buf) {
        free(v6);
      }
    }
  }

  return v2 ^ 1;
}

- (void)requestCellTileDownloadByType:(int)a3 lat:(double)a4 lon:(double)a5 seckey:(unint64_t)a6
{
  if ((a3 - 6) < 3 || a3 == 12)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    v13 = -[CLCoarseCellTilesManagerAdapter adaptee](self, "adaptee");
    unsigned int v14 = a3;
    double v16 = a4;
    double v17 = a5;
    unint64_t v15 = a6;
    double v18 = Current;
  }

  else
  {
    v13 = (void *)sub_101254860(self, a2, *(__n128 *)&a4, *(__n128 *)&a5);
  }

  sub_1009643C0((uint64_t)v13, v14, v15, v16, v17, v18);
}

@end