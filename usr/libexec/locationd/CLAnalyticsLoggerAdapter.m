@interface CLAnalyticsLoggerAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (CLAnalyticsLoggerAdapter)init;
- (id).cxx_construct;
- (void)beginService;
- (void)endService;
- (void)setMeasurements:(id)a3;
- (void)submitEvent:(id)a3;
- (void)submitEvent:(id)a3 withMeasurements:(id)a4;
@end

@implementation CLAnalyticsLoggerAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101998AA0 != -1) {
    dispatch_once(&qword_101998AA0, &stru_1018507B8);
  }
  return (id)qword_101998A98;
}

+ (BOOL)isSupported
{
  return 1;
}

- (CLAnalyticsLoggerAdapter)init
{
  if (qword_101934A40 != -1) {
    dispatch_once(&qword_101934A40, &stru_101850820);
  }
  v3 = (os_log_s *)qword_101934A48;
  if (os_log_type_enabled((os_log_t)qword_101934A48, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ca,init", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934A40 != -1) {
      dispatch_once(&qword_101934A40, &stru_101850820);
    }
    v8[0] = 0;
    _os_log_send_and_compose_impl(2LL, 0LL, buf, 1628LL, &_mh_execute_header, qword_101934A48, 0LL, "#ca,init", v8, 2);
    v6 = (uint8_t *)v5;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLAnalyticsLoggerAdapter init]", "%s\n", v5);
    if (v6 != buf) {
      free(v6);
    }
  }

  v7.receiver = self;
  v7.super_class = (Class)&OBJC_CLASS___CLAnalyticsLoggerAdapter;
  return -[CLAnalyticsLoggerAdapter initWithInboundProtocol:outboundProtocol:]( &v7,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLAnalyticsLoggerServiceProtocol,  &OBJC_PROTOCOL___CLAnalyticsLoggerClientProtocol);
}

- (void)beginService
{
  if (qword_101934A40 != -1) {
    dispatch_once(&qword_101934A40, &stru_101850820);
  }
  v3 = (os_log_s *)qword_101934A48;
  if (os_log_type_enabled((os_log_t)qword_101934A48, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "#ca,beginService", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934A40 != -1) {
      dispatch_once(&qword_101934A40, &stru_101850820);
    }
    v7[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A48,  0LL,  "#ca,beginService",  v7,  2);
    v6 = (uint8_t *)v5;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLAnalyticsLoggerAdapter beginService]", "%s\n", v5);
    if (v6 != buf) {
      free(v6);
    }
  }

  sub_1007C5548((uint64_t)-[CLAnalyticsLoggerAdapter universe](self, "universe"), buf);
  value = self->fInstance.__ptr_.__value_;
  self->fInstance.__ptr_.__value_ = *(CLAnalyticsLogger **)buf;
  if (value) {
    (*(void (**)(CLAnalyticsLogger *))(*(void *)value + 8LL))(value);
  }
}

- (void)endService
{
  if (qword_101934A40 != -1) {
    dispatch_once(&qword_101934A40, &stru_101850820);
  }
  v2 = (os_log_s *)qword_101934A48;
  if (os_log_type_enabled((os_log_t)qword_101934A48, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "#ca,endService", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934A40 != -1) {
      dispatch_once(&qword_101934A40, &stru_101850820);
    }
    v5[0] = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A48,  0LL,  "#ca,endService",  v5,  2);
    v4 = (uint8_t *)v3;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLAnalyticsLoggerAdapter endService]", "%s\n", v3);
    if (v4 != buf) {
      free(v4);
    }
  }

- (void)setMeasurements:(id)a3
{
  if (qword_101934A40 != -1) {
    dispatch_once(&qword_101934A40, &stru_101850820);
  }
  unint64_t v5 = (os_log_s *)qword_101934A48;
  if (os_log_type_enabled((os_log_t)qword_101934A48, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "#ca,setMeasurements", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934A40 != -1) {
      dispatch_once(&qword_101934A40, &stru_101850820);
    }
    LOWORD(v18) = 0;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A48,  0LL,  "#ca,setMeasurements",  &v18,  2);
    v15 = (uint8_t *)v14;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLAnalyticsLoggerAdapter setMeasurements:]", "%s\n", v14);
    if (v15 != buf) {
      free(v15);
    }
  }

  if (a3)
  {
    (*((void (**)(int **__return_ptr, id))a3 + 2))(&v18, a3);
    v6 = v18;
    for (i = v19; v6 != i; v6 += 10)
    {
      uint64_t value = (uint64_t)self->fInstance.__ptr_.__value_;
      sub_10043BD50((uint64_t)v17, (uint64_t)(v6 + 2));
      LOBYTE(value) = sub_1007C5F28(value, v6, (uint64_t)v17);
      sub_10043AFF4((uint64_t)v17);
      if ((value & 1) == 0)
      {
        if (qword_101934A40 != -1) {
          dispatch_once(&qword_101934A40, &stru_101850820);
        }
        v9 = (os_log_s *)qword_101934A48;
        if (os_log_type_enabled((os_log_t)qword_101934A48, OS_LOG_TYPE_DEBUG))
        {
          int v10 = *v6;
          *(_DWORD *)buf = 67240192;
          *(_DWORD *)&buf[4] = v10;
          _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_DEBUG,  "#ca,ERROR,setMeasurements,measurement,%{public}d,failed",  buf,  8u);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_101934A40 != -1) {
            dispatch_once(&qword_101934A40, &stru_101850820);
          }
          int v11 = *v6;
          v21[0] = 67240192;
          v21[1] = v11;
          LODWORD(v16) = 8;
          _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A48,  2LL,  "#ca,ERROR,setMeasurements,measurement,%{public}d,failed",  v21,  v16);
          v13 = (uint8_t *)v12;
          sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLAnalyticsLoggerAdapter setMeasurements:]", "%s\n", v12);
          if (v13 != buf) {
            free(v13);
          }
        }
      }
    }
  }

  else
  {
    v18 = 0LL;
    v19 = 0LL;
    uint64_t v20 = 0LL;
  }

  *(void *)buf = &v18;
  sub_10043B844((void ***)buf);
}

- (void)submitEvent:(id)a3
{
  if (a3)
  {
    (*((void (**)(__int128 *__return_ptr, id, SEL))a3 + 2))(&__s1, a3, a2);
  }

  else
  {
    __int128 __s1 = 0uLL;
    uint64_t v105 = 0LL;
  }

  if (qword_101934A40 != -1) {
    dispatch_once(&qword_101934A40, &stru_101850820);
  }
  v4 = (os_log_s *)qword_101934A48;
  if (os_log_type_enabled((os_log_t)qword_101934A48, OS_LOG_TYPE_DEFAULT))
  {
    p_s1 = &__s1;
    if (v105 < 0) {
      p_s1 = (__int128 *)__s1;
    }
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = p_s1;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "#ca,submit,event,%s", buf, 0xCu);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934A40 != -1) {
      dispatch_once(&qword_101934A40, &stru_101850820);
    }
    v76 = &__s1;
    if (v105 < 0) {
      v76 = (__int128 *)__s1;
    }
    *(_DWORD *)v106 = 136315138;
    *(void *)&v106[4] = v76;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A48,  0LL,  "#ca,submit,event,%s",  v106);
    v78 = (char *)v77;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLAnalyticsLoggerAdapter submitEvent:]", "%s\n", v77);
    if (v78 != buf) {
      free(v78);
    }
  }

  uint64_t v6 = HIBYTE(v105);
  int v7 = HIBYTE(v105);
  size_t v8 = *((void *)&__s1 + 1);
  if (v105 >= 0) {
    uint64_t v9 = HIBYTE(v105);
  }
  else {
    uint64_t v9 = *((void *)&__s1 + 1);
  }
  uint64_t v10 = qword_1019A1660;
  if (byte_1019A166F >= 0) {
    uint64_t v10 = byte_1019A166F;
  }
  if (v9 == v10)
  {
    if (byte_1019A166F >= 0) {
      int v11 = &qword_1019A1658;
    }
    else {
      int v11 = (uint64_t *)qword_1019A1658;
    }
    if (v105 < 0)
    {
      v14 = (void *)__s1;
    }

    else
    {
      if (!HIBYTE(v105)) {
        goto LABEL_79;
      }
      v12 = &__s1;
      uint64_t v13 = HIBYTE(v105);
      while (*(unsigned __int8 *)v12 == *(unsigned __int8 *)v11)
      {
        v12 = (__int128 *)((char *)v12 + 1);
        int v11 = (uint64_t *)((char *)v11 + 1);
        if (!--v13)
        {
LABEL_77:
          uint64_t value = self->fInstance.__ptr_.__value_;
          if ((v7 & 0x80) == 0) {
            goto LABEL_80;
          }
          v14 = (void *)__s1;
          goto LABEL_83;
        }
      }
    }
  }

  uint64_t v15 = *((void *)&xmmword_1019A1670 + 1);
  if (byte_1019A1687 >= 0) {
    uint64_t v15 = byte_1019A1687;
  }
  if (v9 == v15)
  {
    if (byte_1019A1687 >= 0) {
      uint64_t v16 = &xmmword_1019A1670;
    }
    else {
      uint64_t v16 = (__int128 *)xmmword_1019A1670;
    }
    if ((v7 & 0x80) != 0)
    {
      v14 = (void *)__s1;
    }

    else
    {
      if (!v7) {
        goto LABEL_79;
      }
      v17 = &__s1;
      uint64_t v18 = v6;
      while (*(unsigned __int8 *)v17 == *(unsigned __int8 *)v16)
      {
        v17 = (__int128 *)((char *)v17 + 1);
        uint64_t v16 = (__int128 *)((char *)v16 + 1);
        if (!--v18) {
          goto LABEL_77;
        }
      }
    }
  }

  uint64_t v19 = qword_1019A1690;
  if (byte_1019A169F >= 0) {
    uint64_t v19 = byte_1019A169F;
  }
  if (v9 == v19)
  {
    if (byte_1019A169F >= 0) {
      uint64_t v20 = &qword_1019A1688;
    }
    else {
      uint64_t v20 = (uint64_t *)qword_1019A1688;
    }
    if ((v7 & 0x80) != 0)
    {
      v14 = (void *)__s1;
    }

    else
    {
      if (!v7) {
        goto LABEL_79;
      }
      v21 = &__s1;
      uint64_t v22 = v6;
      while (*(unsigned __int8 *)v21 == *(unsigned __int8 *)v20)
      {
        v21 = (__int128 *)((char *)v21 + 1);
        uint64_t v20 = (uint64_t *)((char *)v20 + 1);
        if (!--v22) {
          goto LABEL_77;
        }
      }
    }
  }

  uint64_t v23 = *((void *)&xmmword_1019A16A0 + 1);
  if (byte_1019A16B7 >= 0) {
    uint64_t v23 = byte_1019A16B7;
  }
  if (v9 != v23) {
    goto LABEL_66;
  }
  if (byte_1019A16B7 >= 0) {
    v24 = &xmmword_1019A16A0;
  }
  else {
    v24 = (__int128 *)xmmword_1019A16A0;
  }
  if ((v7 & 0x80) != 0)
  {
    v14 = (void *)__s1;
LABEL_82:
    uint64_t value = self->fInstance.__ptr_.__value_;
LABEL_83:
    sub_1010DD48C(__p, v14, v8);
    goto LABEL_84;
  }

  if (!v7) {
    goto LABEL_79;
  }
  v25 = &__s1;
  uint64_t v26 = v6;
  while (*(unsigned __int8 *)v25 == *(unsigned __int8 *)v24)
  {
    v25 = (__int128 *)((char *)v25 + 1);
    v24 = (__int128 *)((char *)v24 + 1);
    if (!--v26) {
      goto LABEL_77;
    }
  }

- (void)submitEvent:(id)a3 withMeasurements:(id)a4
{
}

- (void).cxx_destruct
{
  uint64_t value = self->fInstance.__ptr_.__value_;
  self->fInstance.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(CLAnalyticsLogger *))(*(void *)value + 8LL))(value);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0LL;
  return self;
}

@end