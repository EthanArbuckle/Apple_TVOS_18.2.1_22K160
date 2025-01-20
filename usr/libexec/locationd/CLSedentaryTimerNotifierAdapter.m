@interface CLSedentaryTimerNotifierAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetIsTimerArmed;
- (CLSedentaryTimerNotifierAdapter)init;
- (int)syncgetSedentaryAlarmData:(void *)a3 since:(double)a4;
- (int)syncgetStartTimerForClient:(id)a3 andOptions:(id)a4;
- (int)syncgetStopTimerForClient:(id)a3;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)timeZoneDidChange:(id)a3;
@end

@implementation CLSedentaryTimerNotifierAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_1019940A0 != -1) {
    dispatch_once(&qword_1019940A0, &stru_10182F338);
  }
  return (id)qword_101994098;
}

- (CLSedentaryTimerNotifierAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLSedentaryTimerNotifierAdapter;
  return -[CLSedentaryTimerNotifierAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLSedentaryTimerNotifierProtocol,  &OBJC_PROTOCOL___CLSedentaryTimerNotifierClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier")) {
    sub_1012331D4();
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

- (BOOL)syncgetIsTimerArmed
{
  return *((_BYTE *)-[CLSedentaryTimerNotifierAdapter adaptee](self, "adaptee") + 176);
}

- (int)syncgetStartTimerForClient:(id)a3 andOptions:(id)a4
{
  if (qword_1019344B0 != -1) {
    dispatch_once(&qword_1019344B0, &stru_10182F5F0);
  }
  v7 = (os_log_s *)qword_1019344B8;
  if (os_log_type_enabled((os_log_t)qword_1019344B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[SedentaryTimerTriage] SedentaryAlarm, syncgetStartTimerForClient starting timer for client,%{public}@!",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019344B0 != -1) {
      dispatch_once(&qword_1019344B0, &stru_10182F5F0);
    }
    int v11 = 138543362;
    id v12 = a3;
    v10 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019344B8,  0LL,  "[SedentaryTimerTriage] SedentaryAlarm, syncgetStartTimerForClient starting timer for client,%{public}@!",  &v11,  12);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLSedentaryTimerNotifierAdapter syncgetStartTimerForClient:andOptions:]",  "%s\n",  v10);
    if (v10 != buf) {
      free(v10);
    }
  }

  sub_1010DDBC0(buf, (char *)[a3 UTF8String]);
  int v8 = sub_1002BA910((uint64_t)-[CLSedentaryTimerNotifierAdapter adaptee](self, "adaptee"), (uint64_t)buf, a4);
  if (v14 < 0) {
    operator delete(*(void **)buf);
  }
  return v8;
}

- (int)syncgetStopTimerForClient:(id)a3
{
  if (qword_1019344B0 != -1) {
    dispatch_once(&qword_1019344B0, &stru_10182F5F0);
  }
  unint64_t v5 = (os_log_s *)qword_1019344B8;
  if (os_log_type_enabled((os_log_t)qword_1019344B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "[SedentaryTimerTriage] SedentaryAlarm, syncgetStopTimerForClient stopping timer for client,%{public}@!",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019344B0 != -1) {
      dispatch_once(&qword_1019344B0, &stru_10182F5F0);
    }
    int v8 = 138543362;
    id v9 = a3;
    v7 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019344B8,  0LL,  "[SedentaryTimerTriage] SedentaryAlarm, syncgetStopTimerForClient stopping timer for client,%{public}@!",  &v8,  12);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLSedentaryTimerNotifierAdapter syncgetStopTimerForClient:]", "%s\n", v7);
    if (v7 != buf) {
      free(v7);
    }
  }

  sub_1010DDBC0(buf, (char *)[a3 UTF8String]);
  sub_1002BB348((uint64_t)-[CLSedentaryTimerNotifierAdapter adaptee](self, "adaptee"));
  if (v11 < 0) {
    operator delete(*(void **)buf);
  }
  return 100;
}

- (int)syncgetSedentaryAlarmData:(void *)a3 since:(double)a4
{
  if (qword_1019344B0 != -1) {
    dispatch_once(&qword_1019344B0, &stru_10182F5F0);
  }
  v7 = (os_log_s *)qword_1019344B8;
  if (os_log_type_enabled((os_log_t)qword_1019344B8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134349056;
    double v13 = a4;
    _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "[SedentaryTimerTriage] SedentaryAlarm, syncgetSedentaryAlarmData with start time,%{public}f!",  buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019344B0 != -1) {
      dispatch_once(&qword_1019344B0, &stru_10182F5F0);
    }
    int v10 = 134349056;
    double v11 = a4;
    id v9 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019344B8,  0LL,  "[SedentaryTimerTriage] SedentaryAlarm, syncgetSedentaryAlarmData with start time,%{public}f!",  &v10,  12);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLSedentaryTimerNotifierAdapter syncgetSedentaryAlarmData:since:]",  "%s\n",  v9);
  }

  return sub_100F64A7C(*((void *)-[CLSedentaryTimerNotifierAdapter adaptee](self, "adaptee") + 23), (void **)a3, a4);
}

- (void)timeZoneDidChange:(id)a3
{
  uint64_t v3 = *((void *)-[CLSedentaryTimerNotifierAdapter adaptee](self, "adaptee", a3) + 47);
  if (v3) {
    sub_100258338(v3);
  }
}

+ (BOOL)isSupported
{
  if (qword_1019940B0 != -1) {
    dispatch_once(&qword_1019940B0, &stru_10182F358);
  }
  return byte_1019940A8;
}

@end