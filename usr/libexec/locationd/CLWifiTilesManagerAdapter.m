@interface CLWifiTilesManagerAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLWifiTilesManagerAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)getNumberOfInputApsUsedInWifiTileForCoordinate:(id)a3 withReply:(id)a4;
- (void)requestTileDownloadForLat:(double)a3 lon:(double)a4 details:(CLTileFileDownloadDetails *)a5;
@end

@implementation CLWifiTilesManagerAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199EB10 != -1) {
    dispatch_once(&qword_10199EB10, &stru_101884248);
  }
  return (id)qword_10199EB08;
}

- (CLWifiTilesManagerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLWifiTilesManagerAdapter;
  return -[CLWifiTilesManagerAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLWifiTilesManagerProtocol,  &OBJC_PROTOCOL___CLWifiTilesManagerClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
  {
    uint64_t v3 = sub_1012711A4();
    sub_100DEB454(v3);
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
      dispatch_once(&qword_101934850, &stru_101884538);
    }
    uint64_t v3 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_DEFAULT,  "CLWifiTilesManager is not supported in diagnostics mode",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101884538);
      }
      v12[0] = 0;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  0LL,  "CLWifiTilesManager is not supported in diagnostics mode",  v12,  2);
      v7 = (uint8_t *)v6;
      sub_10029211C("Generic", 1LL, 0, 2LL, "+[CLWifiTilesManagerAdapter isSupported]", "%s\n", v6);
      if (v7 != buf) {
        free(v7);
      }
    }
  }

  if ((sub_10068D0F0() & 1) != 0)
  {
    LOBYTE(v4) = v2 ^ 1;
  }

  else
  {
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101884538);
    }
    unint64_t v5 = (os_log_s *)qword_101934858;
    if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "CLWifiTilesManager is disabled by settings",  buf,  2u);
    }

    int v4 = sub_1002921D0(115, 2);
    if (v4)
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934850 != -1) {
        dispatch_once(&qword_101934850, &stru_101884538);
      }
      v12[0] = 0;
      LODWORD(v11) = 2;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  0LL,  "CLWifiTilesManager is disabled by settings",  v12,  v11);
      v9 = (uint8_t *)v8;
      sub_10029211C("Generic", 1LL, 0, 2LL, "+[CLWifiTilesManagerAdapter isSupported]", "%s\n", v8);
      if (v9 != buf) {
        free(v9);
      }
      LOBYTE(v4) = 0;
    }
  }

  return v4;
}

- (void)requestTileDownloadForLat:(double)a3 lon:(double)a4 details:(CLTileFileDownloadDetails *)a5
{
  double Current = CFAbsoluteTimeGetCurrent();
  v10 = -[CLWifiTilesManagerAdapter adaptee](self, "adaptee");
  sub_1010DDBC0(&__p, "");
  sub_100DEB938((uint64_t)v10, 0, &__p, (uint64_t)a5, a3, a4, Current);
}

- (void)getNumberOfInputApsUsedInWifiTileForCoordinate:(id)a3 withReply:(id)a4
{
  $F24F406B2B787EFB06265DBA3D28CBD5 v6 = a3;
  uint64_t v5 = sub_100F7D018(*((void *)-[CLWifiTilesManagerAdapter adaptee](self, "adaptee") + 60), &v6.var0);
  (*((void (**)(id, uint64_t))a4 + 2))(a4, v5);
}

@end