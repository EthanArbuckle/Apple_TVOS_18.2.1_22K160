@interface CLWifiLocationProviderAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLWifiLocationProviderAdapter)init;
- (void)adaptee;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)emergencyStateChange:(id)a3;
- (void)endService;
- (void)requestLocationUpdateWithParameters:(id)a3;
@end

@implementation CLWifiLocationProviderAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_1019957B8 != -1) {
    dispatch_once(&qword_1019957B8, &stru_101839140);
  }
  return (id)qword_1019957B0;
}

- (CLWifiLocationProviderAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLWifiLocationProviderAdapter;
  return -[CLWifiLocationProviderAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLWifiLocationProviderProtocol,  &OBJC_PROTOCOL___CLWifiLocationProviderClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier")) {
    sub_101239928();
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

- (void)emergencyStateChange:(id)a3
{
  (*((void (**)(__int128 *__return_ptr, id, SEL))a3 + 2))(&v12, a3, a2);
  if (qword_101934860 != -1) {
    dispatch_once(&qword_101934860, &stru_101839340);
  }
  v4 = (os_log_s *)qword_101934868;
  if (os_log_type_enabled((os_log_t)qword_101934868, OS_LOG_TYPE_DEFAULT))
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
    if (qword_101934860 != -1) {
      dispatch_once(&qword_101934860, &stru_101839340);
    }
    uint64_t v7 = qword_101934868;
    sub_100982BDC(&v12, &buf);
    if ((buf.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      p_std::string buf = &buf;
    }
    else {
      p_std::string buf = (std::string *)buf.__r_.__value_.__r.__words[0];
    }
    int v15 = 136315138;
    v16 = p_buf;
    v9 = (std::string *)_os_log_send_and_compose_impl( 2LL,  0LL,  __p,  1628LL,  &_mh_execute_header,  v7,  0LL,  "notifier adapter received emergency state %s",  (const char *)&v15);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLWifiLocationProviderAdapter emergencyStateChange:]",  "%s\n",  (const char *)v9);
    if (v9 != __p) {
      free(v9);
    }
  }

  v6 = -[CLWifiLocationProviderAdapter adaptee](self, "adaptee");
  __int128 v10 = v12;
  int v11 = v13;
  sub_10043C988((uint64_t)v6, (uint64_t)&v10);
}

- (void)requestLocationUpdateWithParameters:(id)a3
{
  v4 = -[CLWifiLocationProviderAdapter adaptee](self, "adaptee");
  (*((void (**)(uint64_t *__return_ptr, id))a3 + 2))(v5, a3);
  sub_10043CBE4((uint64_t)v4, v5);
  if (v8 < 0) {
    operator delete(__p);
  }
  if (v6 < 0) {
    operator delete((void *)v5[2]);
  }
}

+ (BOOL)isSupported
{
  if (qword_1019957C8 != -1) {
    dispatch_once(&qword_1019957C8, &stru_101839160);
  }
  if (qword_101934850 != -1) {
    dispatch_once(&qword_101934850, &stru_101839360);
  }
  v2 = (os_log_s *)qword_101934858;
  if (os_log_type_enabled((os_log_t)qword_101934858, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)std::string buf = 67240192;
    int v7 = byte_1019957C0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "@ClxWifi, supported, %{public}d", buf, 8u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934850 != -1) {
      dispatch_once(&qword_101934850, &stru_101839360);
    }
    v5[0] = 67240192;
    v5[1] = byte_1019957C0;
    v4 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934858,  0LL,  "@ClxWifi, supported, %{public}d",  v5,  8);
    sub_10029211C("Generic", 1LL, 0, 2LL, "+[CLWifiLocationProviderAdapter isSupported]", "%s\n", v4);
  }

  return byte_1019957C0;
}

@end