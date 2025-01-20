@interface CLTransitMacTileDataProvider
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLTransitMacTileDataProvider)init;
- (id).cxx_construct;
- (void)beginService;
- (void)endService;
- (void)fetchMacAddressesAmong:(id)a3 nearLatitude:(double)a4 longitude:(double)a5 withReply:(id)a6;
- (void)onDarwinNotifierNotification:(int)a3 data:(id)a4;
@end

@implementation CLTransitMacTileDataProvider

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101997C78 != -1) {
    dispatch_once(&qword_101997C78, &stru_101848F60);
  }
  return (id)qword_101997C70;
}

- (CLTransitMacTileDataProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLTransitMacTileDataProvider;
  return -[CLTransitMacTileDataProvider initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLTransitMacTileDataProviderProtocol,  &OBJC_PROTOCOL___CLAppTileDataProviderClientProtocol);
}

- (void)beginService
{
  if (qword_101934A70 != -1) {
    dispatch_once(&qword_101934A70, &stru_101848FA0);
  }
  objc_super v3 = (os_log_s *)qword_101934A78;
  if (os_log_type_enabled((os_log_t)qword_101934A78, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "TransitMac: service begin", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934A70 != -1) {
      dispatch_once(&qword_101934A70, &stru_101848FA0);
    }
    v9[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A78,  2LL,  "TransitMac: service begin",  v9,  2);
    v8 = (uint8_t *)v7;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLTransitMacTileDataProvider beginService]", "%s\n", v7);
    if (v8 != buf) {
      free(v8);
    }
  }

  sub_100EE2800((uint64_t)sub_1006A9A70, (uint64_t)self, -[CLTransitMacTileDataProvider universe](self, "universe"), buf);
  v4 = *(Client **)buf;
  *(void *)buf = 0LL;
  value = self->_darwinNotifierClient.__ptr_.__value_;
  self->_darwinNotifierClient.__ptr_.__value_ = v4;
  if (value)
  {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
    v6 = *(Client **)buf;
    *(void *)buf = 0LL;
    if (v6) {
      (*(void (**)(Client *))(*(void *)v6 + 8LL))(v6);
    }
  }

  [*((id *)self->_darwinNotifierClient.__ptr_.__value_ + 2) register:*((void *)self->_darwinNotifierClient.__ptr_.__value_ + 1) forNotification:0 registrationInfo:0];
}

- (void)endService
{
  if (qword_101934A70 != -1) {
    dispatch_once(&qword_101934A70, &stru_101848FA0);
  }
  v2 = (os_log_s *)qword_101934A78;
  if (os_log_type_enabled((os_log_t)qword_101934A78, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "TransitMac: service end", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934A70 != -1) {
      dispatch_once(&qword_101934A70, &stru_101848FA0);
    }
    v5[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A78,  2LL,  "TransitMac: service end",  v5,  2);
    v4 = (uint8_t *)v3;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLTransitMacTileDataProvider endService]", "%s\n", v3);
    if (v4 != buf) {
      free(v4);
    }
  }

- (void)fetchMacAddressesAmong:(id)a3 nearLatitude:(double)a4 longitude:(double)a5 withReply:(id)a6
{
  (*((void (**)(void **__return_ptr, id))a3 + 2))(v16, a3);
  __p = 0LL;
  v14 = 0LL;
  uint64_t v15 = 0LL;
  objc_msgSend( objc_msgSend( objc_msgSend(-[CLTransitMacTileDataProvider universe](self, "universe"), "vendor"),  "proxyForService:",  @"CLTilesManager"),  "syncgetTransitMacAddressesAmong:nearLatitude:longitude:resultMacAddresses:",  v16,  &__p,  a4,  a5);
  v11 = objc_opt_new(&OBJC_CLASS___NSMutableArray);
  v12 = __p;
  if (__p != v14)
  {
    do
      -[NSMutableArray addObject:]( v11,  "addObject:",   -[CLTransitMacTileDataProviderResult initWithMacAddress:]( objc_alloc(&OBJC_CLASS___CLTransitMacTileDataProviderResult),  "initWithMacAddress:",  *v12++));
    while (v12 != v14);
  }

  (*((void (**)(id, NSMutableArray *, void))a6 + 2))(a6, v11, 0LL);
  if (__p)
  {
    v14 = __p;
    operator delete(__p);
  }

  if (v16[0])
  {
    v16[1] = v16[0];
    operator delete(v16[0]);
  }

- (void)onDarwinNotifierNotification:(int)a3 data:(id)a4
{
  if (!a3)
  {
    sub_1002A5370(v23);
    sub_1002F0B04(buf);
    BOOL v6 = sub_1002A8F8C((uint64_t)buf[0].__r_.__value_.__l.__data_, "SpoofTransitMacQuery", v23);
    BOOL v7 = v6;
    size = (std::__shared_weak_count *)buf[0].__r_.__value_.__l.__size_;
    if (!buf[0].__r_.__value_.__l.__size_) {
      goto LABEL_6;
    }
    v9 = (unint64_t *)(buf[0].__r_.__value_.__l.__size_ + 8);
    do
      unint64_t v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
      std::__shared_weak_count::__release_weak(size);
      if (v7) {
        goto LABEL_7;
      }
    }

    else
    {
LABEL_6:
      if (v6)
      {
LABEL_7:
        if (qword_101934A70 != -1) {
          dispatch_once(&qword_101934A70, &stru_101848FA0);
        }
        v11 = (os_log_s *)qword_101934A78;
        if (os_log_type_enabled((os_log_t)qword_101934A78, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "TransitMac: spoofing a query",  (uint8_t *)buf,  2u);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_101934A70 != -1) {
            dispatch_once(&qword_101934A70, &stru_101848FA0);
          }
          LOWORD(v22[0]) = 0;
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A78,  1LL,  "TransitMac: spoofing a query",  v22,  2);
          v17 = (std::string *)v16;
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLTransitMacTileDataProvider onDarwinNotifierNotification:data:]",  "%s\n",  v16);
          if (v17 != buf) {
            free(v17);
          }
        }

        else {
          double v12 = 37.332862;
        }
        else {
          double v13 = -122.030238;
        }
        memset(buf, 0, 24);
        if (sub_1002A8560((uint64_t)v23, "MacAddress", buf))
        {
          uint64_t v21 = sub_1007EBE44((uint64_t *)buf);
          uint64_t v14 = sub_1005B46E8((uint64_t)&v21);
        }

        else
        {
          uint64_t v14 = 567LL;
        }

        uint64_t v15 = operator new(8uLL);
        *uint64_t v15 = v14;
        v19 = 0LL;
        uint64_t v20 = 0LL;
        __p = 0LL;
        sub_100007590(&__p, v15, (uint64_t)(v15 + 1), 1uLL);
        -[CLTransitMacTileDataProvider fetchMacAddressesAmong:nearLatitude:longitude:withReply:]( self,  "fetchMacAddressesAmong:nearLatitude:longitude:withReply:",  sub_1006AA110((uint64_t)&__p),  &stru_101848F80,  v12,  v13);
        if (__p)
        {
          v19 = __p;
          operator delete(__p);
        }

        operator delete(v15);
      }
    }

    sub_1002A5590(v23);
  }

- (void).cxx_destruct
{
  value = self->_darwinNotifierClient.__ptr_.__value_;
  self->_darwinNotifierClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0LL;
  return self;
}

@end