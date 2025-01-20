@interface CLKappaNotifierAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)syncgetDoSync:(id)a3;
- (CLKappaNotifierAdapter)init;
- (int)syncgetKappaState;
- (void)adaptee;
- (void)beginService;
- (void)collect:(OverrideClient)a3 isLocal:(BOOL)a4;
- (void)companionHeartbeat:(id)a3;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)dontcollect:(OverrideClient)a3 isLocal:(BOOL)a4;
- (void)emergencyStateChange:(id)a3;
- (void)endService;
- (void)forceCompanionHeartbeat;
- (void)forceTrigger;
- (void)forceTriggerIgneous:(id)a3;
- (void)remoteTimeout;
- (void)simulateTriggerWithDelay:(int)a3;
- (void)simulateTriggerWithDelay:(int)a3 forMode:(unsigned __int8)a4;
- (void)startDem;
- (void)stopDem;
@end

@implementation CLKappaNotifierAdapter

- (void)simulateTriggerWithDelay:(int)a3
{
}

- (void)simulateTriggerWithDelay:(int)a3 forMode:(unsigned __int8)a4
{
  int v6 = 0;
  uint64_t v7 = 0LL;
  v4[0] = 8 * (a4 == 1);
  v4[1] = 8 * (a4 == 2);
  v4[2] = 8 * (a4 == 4);
  uint64_t v5 = (1000000 * a3);
  sub_100FEF7CC((uint64_t)-[CLKappaNotifierAdapter adaptee](self, "adaptee"), v4);
}

- (void)collect:(OverrideClient)a3 isLocal:(BOOL)a4
{
  BOOL v4 = a4;
  OverrideClient v17 = a3;
  unint64_t v6 = *(unint64_t *)&a3 >> 8;
  unint64_t v7 = *(unint64_t *)&a3 >> 16;
  unint64_t v8 = *(unint64_t *)&a3 >> 24;
  BOOL var4 = a3.var4;
  BOOL var7 = a3.var7;
  unint64_t v11 = *(unint64_t *)&a3 >> 40;
  BOOL var6 = a3.var6;
  if (qword_1019345E0 != -1) {
    dispatch_once(&qword_1019345E0, &stru_101893A78);
  }
  v13 = (os_log_s *)qword_1019345E8;
  if (os_log_type_enabled((os_log_t)qword_1019345E8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67110912;
    int v27 = v6;
    __int16 v28 = 1024;
    int v29 = v7;
    __int16 v30 = 1024;
    int v31 = v8;
    __int16 v32 = 1024;
    BOOL v33 = var4;
    __int16 v34 = 1024;
    BOOL v35 = var7;
    __int16 v36 = 1024;
    int v37 = v11;
    __int16 v38 = 1024;
    BOOL v39 = var6;
    __int16 v40 = 1024;
    BOOL v41 = v4;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "collect %d %d %d %d %d %d %d %d", buf, 0x32u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019345E0 != -1) {
      dispatch_once(&qword_1019345E0, &stru_101893A78);
    }
    LOWORD(v19) = 1024;
    HIWORD(v19) = v7;
    __int16 v20 = 1024;
    int v21 = v11;
    __int16 v22 = 1024;
    BOOL v23 = var6;
    __int16 v24 = 1024;
    BOOL v25 = v4;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019345E8,  1LL,  "collect %d %d %d %d %d %d %d %d",  &v18,  50,  v16,  *(_DWORD *)&v17.var0,  67110912,  v19,  v8,  0x4000000);
    v15 = (uint8_t *)v14;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLKappaNotifierAdapter collect:isLocal:]", "%s\n", v14);
    if (v15 != buf) {
      free(v15);
    }
  }

  sub_100FEEBE4((uint64_t)-[CLKappaNotifierAdapter adaptee](self, "adaptee"), (uint64_t)&v17, v4);
}

- (void)dontcollect:(OverrideClient)a3 isLocal:(BOOL)a4
{
  BOOL v4 = a4;
  OverrideClient v17 = a3;
  unint64_t v6 = *(unint64_t *)&a3 >> 8;
  unint64_t v7 = *(unint64_t *)&a3 >> 16;
  unint64_t v8 = *(unint64_t *)&a3 >> 24;
  BOOL var4 = a3.var4;
  BOOL var7 = a3.var7;
  unint64_t v11 = *(unint64_t *)&a3 >> 40;
  BOOL var6 = a3.var6;
  if (qword_1019345E0 != -1) {
    dispatch_once(&qword_1019345E0, &stru_101893A78);
  }
  v13 = (os_log_s *)qword_1019345E8;
  if (os_log_type_enabled((os_log_t)qword_1019345E8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67110912;
    int v27 = v6;
    __int16 v28 = 1024;
    int v29 = v7;
    __int16 v30 = 1024;
    int v31 = v8;
    __int16 v32 = 1024;
    BOOL v33 = var4;
    __int16 v34 = 1024;
    BOOL v35 = var7;
    __int16 v36 = 1024;
    int v37 = v11;
    __int16 v38 = 1024;
    BOOL v39 = var6;
    __int16 v40 = 1024;
    BOOL v41 = v4;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "dontcollect %d %d %d %d %d %d %d %d", buf, 0x32u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019345E0 != -1) {
      dispatch_once(&qword_1019345E0, &stru_101893A78);
    }
    LOWORD(v19) = 1024;
    HIWORD(v19) = v7;
    __int16 v20 = 1024;
    int v21 = v11;
    __int16 v22 = 1024;
    BOOL v23 = var6;
    __int16 v24 = 1024;
    BOOL v25 = v4;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019345E8,  1LL,  "dontcollect %d %d %d %d %d %d %d %d",  &v18,  50,  v16,  *(_DWORD *)&v17.var0,  67110912,  v19,  v8,  0x4000000);
    v15 = (uint8_t *)v14;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLKappaNotifierAdapter dontcollect:isLocal:]", "%s\n", v14);
    if (v15 != buf) {
      free(v15);
    }
  }

  sub_100FEE7C4((uint64_t)-[CLKappaNotifierAdapter adaptee](self, "adaptee"), (unint64_t *)&v17, v4);
}

- (void)remoteTimeout
{
}

- (void)companionHeartbeat:(id)a3
{
  if (qword_1019345E0 != -1) {
    dispatch_once(&qword_1019345E0, &stru_101893A78);
  }
  uint64_t v5 = (os_log_s *)qword_1019345E8;
  if (os_log_type_enabled((os_log_t)qword_1019345E8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "received heartbeat from companion", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019345E0 != -1) {
      dispatch_once(&qword_1019345E0, &stru_101893A78);
    }
    v8[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019345E8,  1LL,  "received heartbeat from companion",  v8,  2);
    unint64_t v7 = (uint8_t *)v6;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLKappaNotifierAdapter companionHeartbeat:]", "%s\n", v6);
    if (v7 != buf) {
      free(v7);
    }
  }

  sub_100FED950((uint64_t)-[CLKappaNotifierAdapter adaptee](self, "adaptee"), (uint64_t)a3);
}

- (void)forceCompanionHeartbeat
{
}

- (void)startDem
{
  if (qword_1019345E0 != -1) {
    dispatch_once(&qword_1019345E0, &stru_101893A78);
  }
  v3 = (os_log_s *)qword_1019345E8;
  if (os_log_type_enabled((os_log_t)qword_1019345E8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "start DEM", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019345E0 != -1) {
      dispatch_once(&qword_1019345E0, &stru_101893A78);
    }
    v6[0] = 0;
    _os_log_send_and_compose_impl(2LL, 0LL, buf, 1628LL, &_mh_execute_header, qword_1019345E8, 1LL, "start DEM", v6, 2);
    uint64_t v5 = (uint8_t *)v4;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLKappaNotifierAdapter startDem]", "%s\n", v4);
    if (v5 != buf) {
      free(v5);
    }
  }

  sub_100FEF558((uint64_t)-[CLKappaNotifierAdapter adaptee](self, "adaptee"), 1LL);
}

- (void)stopDem
{
  if (qword_1019345E0 != -1) {
    dispatch_once(&qword_1019345E0, &stru_101893A78);
  }
  v3 = (os_log_s *)qword_1019345E8;
  if (os_log_type_enabled((os_log_t)qword_1019345E8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "stop DEM", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019345E0 != -1) {
      dispatch_once(&qword_1019345E0, &stru_101893A78);
    }
    v6[0] = 0;
    _os_log_send_and_compose_impl(2LL, 0LL, buf, 1628LL, &_mh_execute_header, qword_1019345E8, 1LL, "stop DEM", v6, 2);
    uint64_t v5 = (uint8_t *)v4;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLKappaNotifierAdapter stopDem]", "%s\n", v4);
    if (v5 != buf) {
      free(v5);
    }
  }

  sub_100FEF558((uint64_t)-[CLKappaNotifierAdapter adaptee](self, "adaptee"), 0LL);
}

- (void)forceTrigger
{
  __int128 v4 = 0uLL;
  uint64_t v2 = 4LL;
  __int128 v3 = 0uLL;
  sub_100FEF7CC((uint64_t)-[CLKappaNotifierAdapter adaptee](self, "adaptee"), (unsigned __int8 *)&v2);
}

- (int)syncgetKappaState
{
  return sub_100FF0498((uint64_t)-[CLKappaNotifierAdapter adaptee](self, "adaptee"));
}

- (void)emergencyStateChange:(id)a3
{
  (*((void (**)(__int128 *__return_ptr, id, SEL))a3 + 2))(&v13, a3, a2);
  if (qword_1019345E0 != -1) {
    dispatch_once(&qword_1019345E0, &stru_101893A78);
  }
  __int128 v4 = (os_log_s *)qword_1019345E8;
  if (os_log_type_enabled((os_log_t)qword_1019345E8, OS_LOG_TYPE_DEFAULT))
  {
    sub_100982BDC(&v13, __p);
    uint64_t v5 = (__p[0].__r_.__value_.__s.__size_ & 0x80u) == 0 ? __p : (std::string *)__p[0].__r_.__value_.__r.__words[0];
    LODWORD(buf.__r_.__value_.__l.__data_) = 136315138;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v5;
    _os_log_impl( (void *)&_mh_execute_header,  v4,  OS_LOG_TYPE_DEFAULT,  "notifier adapter received emergency state %s",  (uint8_t *)&buf,  0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(__p, 0x65CuLL);
    if (qword_1019345E0 != -1) {
      dispatch_once(&qword_1019345E0, &stru_101893A78);
    }
    uint64_t v7 = qword_1019345E8;
    sub_100982BDC(&v13, &buf);
    if ((buf.__r_.__value_.__s.__size_ & 0x80u) == 0) {
      p_std::string buf = &buf;
    }
    else {
      p_std::string buf = (std::string *)buf.__r_.__value_.__r.__words[0];
    }
    int v16 = 136315138;
    OverrideClient v17 = p_buf;
    _os_log_send_and_compose_impl( 2LL,  0LL,  __p,  1628LL,  &_mh_execute_header,  v7,  0LL,  "notifier adapter received emergency state %s",  (const char *)&v16);
    v10 = v9;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLKappaNotifierAdapter emergencyStateChange:]", "%s\n", (const char *)v10);
    if (v10 != __p) {
      free(v10);
    }
  }

  unint64_t v6 = -[CLKappaNotifierAdapter adaptee](self, "adaptee");
  __int128 v11 = v13;
  int v12 = v14;
  sub_100FEB48C((uint64_t)v6, (uint64_t)&v11);
}

- (void)forceTriggerIgneous:(id)a3
{
  uint64_t v26 = 0LL;
  __int128 v25 = 0x40000uLL;
  if (a3)
  {
    strncpy((char *)&v25 + 8, (const char *)[a3 UTF8String], 0xFuLL);
    if (qword_1019347D0 != -1) {
      dispatch_once(&qword_1019347D0, &stru_101893BB8);
    }
    uint64_t v5 = (os_log_s *)qword_1019347D8;
    if (os_log_type_enabled((os_log_t)qword_1019347D8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)std::string buf = 136315394;
      __int16 v22 = (char *)[a3 UTF8String];
      __int16 v23 = 2080;
      __int16 v24 = (char *)&v25 + 8;
      _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEFAULT,  "truncated force trigger uid from %s to %s",  buf,  0x16u);
    }

    if (!sub_1002921D0(115, 2)) {
      goto LABEL_17;
    }
    bzero(buf, 0x65CuLL);
    if (qword_1019347D0 != -1) {
      dispatch_once(&qword_1019347D0, &stru_101893BB8);
    }
    uint64_t v6 = qword_1019347D8;
    int v17 = 136315394;
    int v18 = (char *)[a3 UTF8String];
    __int16 v19 = 2080;
    __int16 v20 = (char *)&v25 + 8;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v6,  0LL,  "truncated force trigger uid from %s to %s",  (const char *)&v17,  22);
    unint64_t v8 = (uint8_t *)v7;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLKappaNotifierAdapter forceTriggerIgneous:]", "%s\n", v7);
    if (v8 == buf) {
      goto LABEL_17;
    }
LABEL_32:
    free(v8);
    goto LABEL_17;
  }

  if (qword_1019347D0 != -1) {
    dispatch_once(&qword_1019347D0, &stru_101893BB8);
  }
  v9 = (os_log_s *)qword_1019347D8;
  if (os_log_type_enabled((os_log_t)qword_1019347D8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)std::string buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received nil GUID, setting to empty", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1019347D0 != -1) {
      dispatch_once(&qword_1019347D0, &stru_101893BB8);
    }
    LOWORD(v17) = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_1019347D8,  0LL,  "Received nil GUID, setting to empty",  &v17,  2);
    unint64_t v8 = (uint8_t *)v14;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLKappaNotifierAdapter forceTriggerIgneous:]", "%s\n", v14);
    if (v8 != buf) {
      goto LABEL_32;
    }
  }

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_10199FE38 != -1) {
    dispatch_once(&qword_10199FE38, &stru_1018939D8);
  }
  return (id)qword_10199FE30;
}

- (CLKappaNotifierAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLKappaNotifierAdapter;
  return -[CLKappaNotifierAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLKappaNotifierProtocol,  &OBJC_PROTOCOL___CLKappaNotifierClientProtocol);
}

- (void)beginService
{
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier"))
  {
    objc_super v3 = (CLKappaNotifierAdapter *)sub_10127F198();
    -[CLKappaNotifierAdapter endService](v3, v4);
  }

- (void)endService
{
  uint64_t v2 = -[CLNotifierServiceAdapter notifier](self, "notifier");
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
  if (qword_10199FE48 != -1) {
    dispatch_once(&qword_10199FE48, &stru_101893A58);
  }
  return byte_10199FE40;
}

@end