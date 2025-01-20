@interface CLPersistentTimerInternal
- (CLPersistentTimerInternal)initWithFireTime:(double)a3 timeInterval:(double)a4 serviceIdentifier:(const char *)a5 wakeDevice:(BOOL)a6 clTimer:(void *)a7 silo:(id)a8 minimumEarlyFireProportion:(double)a9;
- (id).cxx_construct;
- (void)bounce_timerFired:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)setNextFireTime:(double)a3;
- (void)setTimerWithInterval:(double)a3;
- (void)timerFired:(id)a3;
@end

@implementation CLPersistentTimerInternal

- (CLPersistentTimerInternal)initWithFireTime:(double)a3 timeInterval:(double)a4 serviceIdentifier:(const char *)a5 wakeDevice:(BOOL)a6 clTimer:(void *)a7 silo:(id)a8 minimumEarlyFireProportion:(double)a9
{
  if (!a7) {
    sub_101243110();
  }
  v19.receiver = self;
  v19.super_class = (Class)&OBJC_CLASS___CLPersistentTimerInternal;
  v17 = -[CLPersistentTimerInternal init](&v19, "init");
  if (v17)
  {
    *((void *)v17 + 7) = -[NSString initWithCString:encoding:]( objc_alloc(&OBJC_CLASS___NSString),  "initWithCString:encoding:",  a5,  4LL);
    std::string::assign((std::string *)(v17 + 32), a5);
    v17[64] = a6;
    *((void *)v17 + 2) = a7;
    *((void *)v17 + 3) = a8;
    *((double *)v17 + 9) = a4;
    *((double *)v17 + 10) = a9;
    if (a3 >= 0.0) {
      a4 = a3 - CFAbsoluteTimeGetCurrent();
    }
    [v17 setTimerWithInterval:a4];
  }

  return (CLPersistentTimerInternal *)v17;
}

- (void)setNextFireTime:(double)a3
{
}

- (void)setTimerWithInterval:(double)a3
{
  if (qword_101934A40 != -1) {
    dispatch_once(&qword_101934A40, &stru_101849618);
  }
  v5 = (os_log_s *)qword_101934A48;
  if (os_log_type_enabled((os_log_t)qword_101934A48, OS_LOG_TYPE_DEBUG))
  {
    p_strIdentifier = &self->_strIdentifier;
    double v7 = -1.0;
    if (a3 != 1.79769313e308) {
      double v7 = a3;
    }
    *(_DWORD *)buf = 136315394;
    v34 = p_strIdentifier;
    __int16 v35 = 2048;
    double v36 = v7;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "setTimerWithInterval, %s, interval, %.1lf",  buf,  0x16u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934A40 != -1) {
      dispatch_once(&qword_101934A40, &stru_101849618);
    }
    data = &self->_strIdentifier;
    double v19 = -1.0;
    if (a3 != 1.79769313e308) {
      double v19 = a3;
    }
    int v29 = 136315394;
    v30 = data;
    __int16 v31 = 2048;
    double v32 = v19;
    LODWORD(v28) = 22;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A48,  2LL,  "setTimerWithInterval, %s, interval, %.1lf",  (const char *)&v29,  v28);
    v21 = (uint8_t *)v20;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLPersistentTimerInternal setTimerWithInterval:]", "%s\n", v20);
    if (v21 != buf) {
      free(v21);
    }
  }

  -[CLPersistentTimerInternal invalidate](self, "invalidate");
  if (a3 <= 0.0)
  {
    if (qword_101934A40 != -1) {
      dispatch_once(&qword_101934A40, &stru_101849618);
    }
    v13 = (os_log_s *)qword_101934A48;
    if (os_log_type_enabled((os_log_t)qword_101934A48, OS_LOG_TYPE_DEBUG))
    {
      v14 = &self->_strIdentifier;
      *(_DWORD *)buf = 136315394;
      v34 = v14;
      __int16 v35 = 2048;
      double v36 = 1.0;
      _os_log_impl( (void *)&_mh_execute_header,  v13,  OS_LOG_TYPE_DEBUG,  "interval, %s, %.5lf, flooring to 1.0, interval",  buf,  0x16u);
    }

    a3 = 1.0;
    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934A40 != -1) {
        dispatch_once(&qword_101934A40, &stru_101849618);
      }
      v25 = &self->_strIdentifier;
      int v29 = 136315394;
      v30 = v25;
      __int16 v31 = 2048;
      double v32 = 1.0;
      LODWORD(v28) = 22;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A48,  2LL,  "interval, %s, %.5lf, flooring to 1.0, interval",  (const char *)&v29,  v28);
      v27 = (uint8_t *)v26;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLPersistentTimerInternal setTimerWithInterval:]", "%s\n", v26);
      if (v27 != buf) {
        free(v27);
      }
    }
  }

  else if (a3 == 1.79769313e308)
  {
    if (qword_101934A40 != -1) {
      dispatch_once(&qword_101934A40, &stru_101849618);
    }
    v8 = (os_log_s *)qword_101934A48;
    if (os_log_type_enabled((os_log_t)qword_101934A48, OS_LOG_TYPE_DEBUG))
    {
      v9 = &self->_strIdentifier;
      *(_DWORD *)buf = 136315138;
      v34 = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEBUG,  "setTimerWithInterval, %s, interval, DBL_MAX",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934A40 != -1) {
        dispatch_once(&qword_101934A40, &stru_101849618);
      }
      v10 = &self->_strIdentifier;
      int v29 = 136315138;
      v30 = v10;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A48,  2LL,  "setTimerWithInterval, %s, interval, DBL_MAX",  (const char *)&v29);
      v12 = (uint8_t *)v11;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLPersistentTimerInternal setTimerWithInterval:]", "%s\n", v11);
      if (v12 != buf) {
        free(v12);
      }
    }

    return;
  }

  if (qword_101934A40 != -1) {
    dispatch_once(&qword_101934A40, &stru_101849618);
  }
  v15 = (os_log_s *)qword_101934A48;
  if (os_log_type_enabled((os_log_t)qword_101934A48, OS_LOG_TYPE_DEBUG))
  {
    v16 = &self->_strIdentifier;
    *(_DWORD *)buf = 136315394;
    v34 = v16;
    __int16 v35 = 2048;
    double v36 = a3;
    _os_log_impl( (void *)&_mh_execute_header,  v15,  OS_LOG_TYPE_DEBUG,  "setTimerWithInterval, %s, interval, %.1lf",  buf,  0x16u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934A40 != -1) {
      dispatch_once(&qword_101934A40, &stru_101849618);
    }
    v22 = &self->_strIdentifier;
    int v29 = 136315394;
    v30 = v22;
    __int16 v31 = 2048;
    double v32 = a3;
    LODWORD(v28) = 22;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A48,  2LL,  "setTimerWithInterval, %s, interval, %.1lf",  (const char *)&v29,  v28);
    v24 = (uint8_t *)v23;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLPersistentTimerInternal setTimerWithInterval:]", "%s\n", v23);
    if (v24 != buf) {
      free(v24);
    }
  }

  v17 = -[PCPersistentTimer initWithTimeInterval:serviceIdentifier:target:selector:userInfo:]( objc_alloc(&OBJC_CLASS___PCPersistentTimer),  "initWithTimeInterval:serviceIdentifier:target:selector:userInfo:",  *(void *)&self->_strIdentifier.__r_.var0,  self,  "bounce_timerFired:",  0LL,  a3);
  self->_pcTimer = v17;
  -[PCPersistentTimer setMinimumEarlyFireProportion:]( v17,  "setMinimumEarlyFireProportion:",  *(double *)&self->_wakeDevice);
  -[PCPersistentTimer setDisableSystemWaking:]( self->_pcTimer,  "setDisableSystemWaking:",  LOBYTE(self->_strIdentifier.var0) == 0);
  -[PCPersistentTimer scheduleInRunLoop:]( self->_pcTimer,  "scheduleInRunLoop:",  +[NSRunLoop mainRunLoop](&OBJC_CLASS___NSRunLoop, "mainRunLoop"));
}

- (void)dealloc
{
  if (self->_pcTimer) {
    sub_1012433E8();
  }
  if (!self->_clTimer) {
    sub_10124327C();
  }

  *(void *)&self->_strIdentifier.__r_.var0 = 0LL;
  self->_silo = 0LL;
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLPersistentTimerInternal;
  -[CLPersistentTimerInternal dealloc](&v3, "dealloc");
}

- (void)bounce_timerFired:(id)a3
{
  silo = self->_silo;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472LL;
  v4[2] = sub_1006B5574;
  v4[3] = &unk_10181A328;
  v4[4] = self;
  v4[5] = a3;
  -[CLSilo async:](silo, "async:", v4);
}

- (void)timerFired:(id)a3
{
  if (qword_101934A40 != -1) {
    dispatch_once(&qword_101934A40, &stru_101849618);
  }
  v5 = (os_log_s *)qword_101934A48;
  if (os_log_type_enabled((os_log_t)qword_101934A48, OS_LOG_TYPE_DEBUG))
  {
    p_strIdentifier = &self->_strIdentifier;
    clTimer = self->_clTimer;
    *(_DWORD *)buf = 136315650;
    double v19 = p_strIdentifier;
    __int16 v20 = 2048;
    id v21 = a3;
    __int16 v22 = 2048;
    v23 = clTimer;
    _os_log_impl( (void *)&_mh_execute_header,  v5,  OS_LOG_TYPE_DEBUG,  "timerFired: timer, _clTimer, %s, %p, %p",  buf,  0x20u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934A40 != -1) {
      dispatch_once(&qword_101934A40, &stru_101849618);
    }
    data = &self->_strIdentifier;
    v9 = self->_clTimer;
    int v12 = 136315650;
    v13 = data;
    __int16 v14 = 2048;
    id v15 = a3;
    __int16 v16 = 2048;
    v17 = v9;
    _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A48,  2LL,  "timerFired: timer, _clTimer, %s, %p, %p",  (const char *)&v12,  32);
    v11 = (uint8_t *)v10;
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLPersistentTimerInternal timerFired:]", "%s\n", v10);
    if (v11 != buf) {
      free(v11);
    }
  }

  if (self->_pcTimer == a3)
  {
    sub_1006B57B4((uint64_t)self->_clTimer);
  }

- (void)invalidate
{
  pcTimer = self->_pcTimer;
  if (pcTimer)
  {
    v4 = pcTimer;
    self->_pcTimer = 0LL;
    if (*((char *)&self->_strIdentifier.__r_.__value_.var0.var1 + 23) < 0)
    {
      sub_1010DD48C( __dst,  self->_strIdentifier.__r_.__value_.var0.var1.__data_,  self->_strIdentifier.__r_.__value_.var0.var1.__size_);
    }

    else
    {
      *(_OWORD *)__dst = *(_OWORD *)self->_strIdentifier.__r_.__value_.var0.var0.__data_;
      uint64_t v15 = *((void *)&self->_strIdentifier.__r_.__value_.var0.var1 + 2);
    }

    if (qword_101934A40 != -1) {
      dispatch_once(&qword_101934A40, &stru_101849618);
    }
    v5 = (os_log_s *)qword_101934A48;
    if (os_log_type_enabled((os_log_t)qword_101934A48, OS_LOG_TYPE_DEBUG))
    {
      v6 = __dst;
      if (v15 < 0) {
        v6 = (void **)__dst[0];
      }
      *(_DWORD *)buf = 136315394;
      id v21 = v6;
      __int16 v22 = 2048;
      v23 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Scheduling invalidation, %s, %p", buf, 0x16u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934A40 != -1) {
        dispatch_once(&qword_101934A40, &stru_101849618);
      }
      v8 = __dst;
      if (v15 < 0) {
        v8 = (void **)__dst[0];
      }
      int v16 = 136315394;
      v17 = v8;
      __int16 v18 = 2048;
      double v19 = v4;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A48,  2LL,  "Scheduling invalidation, %s, %p",  (const char *)&v16,  22);
      v10 = (uint8_t *)v9;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLPersistentTimerInternal invalidate]", "%s\n", v9);
      if (v10 != buf) {
        free(v10);
      }
    }

    id v7 = +[CLSilo main](&OBJC_CLASS___CLSilo, "main");
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3321888768LL;
    v11[2] = sub_1006B5CBC;
    v11[3] = &unk_1018495E8;
    if (SHIBYTE(v15) < 0)
    {
      sub_1010DD48C(&__p, __dst[0], (unint64_t)__dst[1]);
    }

    else
    {
      __int128 __p = *(_OWORD *)__dst;
      uint64_t v13 = v15;
    }

    v11[4] = v4;
    [v7 async:v11];
    if (SHIBYTE(v13) < 0) {
      operator delete((void *)__p);
    }
    if (SHIBYTE(v15) < 0) {
      operator delete(__dst[0]);
    }
  }

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = 0uLL;
  *((void *)self + 6) = 0LL;
  return self;
}

@end