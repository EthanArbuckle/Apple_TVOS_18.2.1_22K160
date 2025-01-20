@interface CLLocationControllerAdapter
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetActiveTechs:(void *)a3;
- (BOOL)syncgetDoSync:(id)a3;
- (BOOL)syncgetMetric:(void *)a3;
- (BOOL)syncgetZaxisStats:(void *)a3;
- (CLLocationControllerAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)emergencyStateChange:(id)a3;
- (void)endService;
- (void)onOutdoorUpdate:(id)a3;
- (void)setGpsAssistantHasClients:(BOOL)a3 forNotification:(int)a4;
- (void)setRealTimeHarvestTriggered:(double)a3;
- (void)setTrackRunHint:(id)a3;
@end

@implementation CLLocationControllerAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_1019957A0 != -1) {
    dispatch_once(&qword_1019957A0, &stru_101838908);
  }
  return (id)qword_101995798;
}

- (CLLocationControllerAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLLocationControllerAdapter;
  return -[CLLocationControllerAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLLocationControllerProtocol,  &OBJC_PROTOCOL___CLLocationControllerClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier")) {
    sub_101239708();
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

- (BOOL)syncgetMetric:(void *)a3
{
  v4 = -[CLLocationControllerAdapter adaptee](self, "adaptee");
  (*(void (**)(void *, void *))(*v4[36] + 184LL))(v4[36], a3);
  return 1;
}

- (BOOL)syncgetActiveTechs:(void *)a3
{
  return 1;
}

- (BOOL)syncgetZaxisStats:(void *)a3
{
  return 1;
}

- (void)setTrackRunHint:(id)a3
{
  v4 = [a3 bytes];
  if (qword_101934490 != -1) {
    dispatch_once(&qword_101934490, &stru_101838C00);
  }
  unint64_t v5 = (os_log_s *)qword_101934498;
  if (os_log_type_enabled((os_log_t)qword_101934498, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)v4;
    int v7 = v4[2];
    int v8 = v4[3];
    *(_DWORD *)buf = 134349569;
    uint64_t v20 = v6;
    __int16 v21 = 1025;
    int v22 = v7;
    __int16 v23 = 1025;
    int v24 = v8;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "CLTR,Daemon,syncsetTrackRunHint,received,mctime,%{public}.1lf,lane,%{private}d,notification,%{private}d",  buf,  0x18u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934490 != -1) {
      dispatch_once(&qword_101934490, &stru_101838C00);
    }
    uint64_t v9 = *(void *)v4;
    int v10 = v4[2];
    int v11 = v4[3];
    int v13 = 134349569;
    uint64_t v14 = v9;
    __int16 v15 = 1025;
    int v16 = v10;
    __int16 v17 = 1025;
    int v18 = v11;
    v12 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934498,  0LL,  "CLTR,Daemon,syncsetTrackRunHint,received,mctime,%{public}.1lf,lane,%{private}d,notification,%{private}d",  &v13,  24);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLLocationControllerAdapter setTrackRunHint:]", "%s\n", v12);
  }

  -[CLLocationControllerAdapter adaptee](self, "adaptee");
}

- (void)setGpsAssistantHasClients:(BOOL)a3 forNotification:(int)a4
{
  BOOL v4 = a3;
  int v6 = a4;
  unint64_t v5 = -[CLLocationControllerAdapter adaptee](self, "adaptee");
  (*(void (**)(void *, int *, BOOL))(*v5[36] + 232LL))(v5[36], &v6, v4);
}

- (void)emergencyStateChange:(id)a3
{
  (*((void (**)(__int128 *__return_ptr, id, SEL))a3 + 2))(&v12, a3, a2);
  if (qword_101934830 != -1) {
    dispatch_once(&qword_101934830, &stru_101838C20);
  }
  BOOL v4 = (os_log_s *)qword_101934838;
  if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_DEFAULT))
  {
    sub_100982BDC(&v12, __p);
    unint64_t v5 = (__p[0].__r_.__value_.__s.__size_ & 0x80u) == 0 ? __p : (std::string *)__p[0].__r_.__value_.__r.__words[0];
    LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "notifier adapter received emergency state %s",  (uint8_t *)&buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_101934830 != -1) {
      dispatch_once(&qword_101934830, &stru_101838C20);
    }
    uint64_t v7 = qword_101934838;
    sub_100982BDC(&v12, &buf);
    if ((buf.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      p_std::string buf = &buf;
    }
    else {
      p_std::string buf = (std::string *)buf.__r_.__value_.__r.__words[0];
    }
    int v15 = 136315138;
    int v16 = p_buf;
    uint64_t v9 = (std::string *)_os_log_send_and_compose_impl( 2LL,  0LL,  __p,  1628LL,  &_mh_execute_header,  v7,  0LL,  "notifier adapter received emergency state %s",  (const char *)&v15);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLLocationControllerAdapter emergencyStateChange:]",  "%s\n",  (const char *)v9);
    if (v9 != __p) {
      free(v9);
    }
  }

  int v6 = -[CLLocationControllerAdapter adaptee](self, "adaptee");
  __int128 v10 = v12;
  int v11 = v13;
  sub_10041BBF0((uint64_t)v6, (uint64_t)&v10);
}

- (void)onOutdoorUpdate:(id)a3
{
  BOOL v4 = -[CLLocationControllerAdapter adaptee](self, "adaptee");
  (*((void (**)(void *__return_ptr, id))a3 + 2))(v5, a3);
  sub_10041BE5C((uint64_t)v4, (uint64_t)v5);
}

- (void)setRealTimeHarvestTriggered:(double)a3
{
  if (qword_101934830 != -1) {
    dispatch_once(&qword_101934830, &stru_101838C20);
  }
  objc_super v3 = (os_log_s *)qword_101934838;
  if (os_log_type_enabled((os_log_t)qword_101934838, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "BaroAlt,Realtime harvest,not supported", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934830 != -1) {
      dispatch_once(&qword_101934830, &stru_101838C20);
    }
    v5[0] = 0;
    BOOL v4 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934838,  1LL,  "BaroAlt,Realtime harvest,not supported",  v5,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLLocationControllerAdapter setRealTimeHarvestTriggered:]", "%s\n", v4);
  }

@end