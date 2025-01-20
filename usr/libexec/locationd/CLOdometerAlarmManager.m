@interface CLOdometerAlarmManager
+ (id)getSilo;
- (CLOdometerAlarm)currentlyScheduled;
- (CLOdometerAlarm)firstAlarm;
- (CLOdometerAlarmManager)init;
- (double)lastOdometer;
- (id).cxx_construct;
- (void)addAlarm:(id)a3;
- (void)beginService;
- (void)endService;
- (void)handleLocationData:(const void *)a3;
- (void)handleOdometer:(double)a3;
- (void)handleOdometerData:(const void *)a3;
- (void)removeAlarm:(id)a3;
- (void)reschedule;
- (void)reset;
- (void)setCurrentlyScheduled:(id)a3;
- (void)setLastOdometer:(double)a3;
@end

@implementation CLOdometerAlarmManager

+ (id)getSilo
{
  if (qword_10199D5C8 != -1) {
    dispatch_once(&qword_10199D5C8, &stru_10187CB90);
  }
  return (id)qword_10199D5C0;
}

- (CLOdometerAlarmManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLOdometerAlarmManager;
  return -[CLOdometerAlarmManager initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLOdometerAlarmManagerProtocol,  &OBJC_PROTOCOL___CLOdometerAlarmManagerClientProtocol);
}

- (void)beginService
{
  self->fAlarms = objc_alloc_init(&OBJC_CLASS___NSMutableArray);
  sub_10043AC3C((uint64_t)sub_100CB0BF0, (uint64_t)self, -[CLOdometerAlarmManager universe](self, "universe"), &v6);
  objc_super v3 = v6;
  v6 = 0LL;
  value = self->fLocationClient.__ptr_.__value_;
  self->fLocationClient.__ptr_.__value_ = v3;
  if (value)
  {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
    v5 = v6;
    v6 = 0LL;
    if (v5) {
      (*(void (**)(Client *))(*(void *)v5 + 8LL))(v5);
    }
  }

  [*((id *)self->fLocationClient.__ptr_.__value_ + 2) register:*((void *)self->fLocationClient.__ptr_.__value_ + 1) forNotification:5 registrationInfo:0];
  -[CLOdometerAlarmManager universe](self, "universe");
  sub_100A9E608();
}

- (void)endService
{
  value = self->fLocationClient.__ptr_.__value_;
  self->fLocationClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *))(*(void *)value + 8LL))(value);
  }
  v4 = self->fGpsClient.__ptr_.__value_;
  self->fGpsClient.__ptr_.__value_ = 0LL;
  if (v4) {
    (*(void (**)(Client *))(*(void *)v4 + 8LL))(v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)&OBJC_CLASS___CLOdometerAlarmManager;
  -[CLOdometerAlarmManager dealloc](&v5, "dealloc");
}

- (void)addAlarm:(id)a3
{
}

- (void)removeAlarm:(id)a3
{
}

- (void)reschedule
{
  objc_super v3 = -[CLOdometerAlarmManager firstAlarm](self, "firstAlarm");
  if (v3 != -[CLOdometerAlarmManager currentlyScheduled](self, "currentlyScheduled"))
  {
    if (v3)
    {
      __asm { FMOV            V0.2D, #-1.0 }

      __int128 v9 = _Q0;
      __int16 v10 = 0;
      int v11 = 0;
      int v12 = 0;
      [*((id *)self->fGpsClient.__ptr_.__value_ + 2) register:*((void *)self->fGpsClient.__ptr_.__value_ + 1) forNotification:16 registrationInfo:sub_100419014(&v9)];
    }

    else
    {
      [*((id *)self->fGpsClient.__ptr_.__value_ + 2) unregister:*((void *)self->fGpsClient.__ptr_.__value_ + 1) forNotification:16];
    }

    -[CLOdometerAlarmManager setCurrentlyScheduled:](self, "setCurrentlyScheduled:", v3);
  }

- (void)handleLocationData:(const void *)a3
{
  double v5 = *((double *)a3 + 20);
  uint64_t v6 = *((void *)a3 + 100);
  double v7 = v5;
  if (v6) {
    double v7 = *(double *)sub_1000F0F58(v6);
  }
  if (v7 >= 0.0)
  {
    if (qword_101934A70 != -1) {
      dispatch_once(&qword_101934A70, &stru_10187CBD0);
    }
    v14 = (os_log_s *)qword_101934A78;
    if (os_log_type_enabled((os_log_t)qword_101934A78, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      double v30 = v7;
      __int16 v31 = 2048;
      double v32 = v5;
      _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEBUG,  "BATCH: received locations w/ odometer: %f, %f",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934A70 != -1) {
        dispatch_once(&qword_101934A70, &stru_10187CBD0);
      }
      int v25 = 134218240;
      double v26 = v7;
      __int16 v27 = 2048;
      double v28 = v5;
      LODWORD(v24) = 22;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A78,  2LL,  "BATCH: received locations w/ odometer: %f, %f",  COERCE_DOUBLE(&v25),  v24);
      v19 = (uint8_t *)v18;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLOdometerAlarmManager handleLocationData:]", "%s\n", v18);
      if (v19 != buf) {
        free(v19);
      }
    }

    -[CLOdometerAlarmManager lastOdometer](self, "lastOdometer");
    if (v7 >= v15)
    {
      -[CLOdometerAlarmManager handleOdometer:](self, "handleOdometer:", v5);
    }

    else
    {
      if (qword_101934A70 != -1) {
        dispatch_once(&qword_101934A70, &stru_10187CBD0);
      }
      v16 = (os_log_s *)qword_101934A78;
      if (os_log_type_enabled((os_log_t)qword_101934A78, OS_LOG_TYPE_DEFAULT))
      {
        -[CLOdometerAlarmManager lastOdometer](self, "lastOdometer");
        *(_DWORD *)buf = 134218240;
        double v30 = v17;
        __int16 v31 = 2048;
        double v32 = v7;
        _os_log_impl( (void *)&_mh_execute_header,  v16,  OS_LOG_TYPE_DEFAULT,  "#Warning BATCH: odometer ran from %f to %f",  buf,  0x16u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934A70 != -1) {
          dispatch_once(&qword_101934A70, &stru_10187CBD0);
        }
        uint64_t v20 = qword_101934A78;
        -[CLOdometerAlarmManager lastOdometer](self, "lastOdometer");
        int v25 = 134218240;
        double v26 = v21;
        __int16 v27 = 2048;
        double v28 = v7;
        LODWORD(v24) = 22;
        _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v20,  0LL,  "#Warning BATCH: odometer ran from %f to %f",  COERCE_DOUBLE(&v25),  v24);
        v23 = (uint8_t *)v22;
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLOdometerAlarmManager handleLocationData:]", "%s\n", v22);
        if (v23 != buf) {
          free(v23);
        }
      }

      -[CLOdometerAlarmManager reset](self, "reset");
    }
  }

  else if (-[NSMutableArray count](self->fAlarms, "count"))
  {
    if (qword_101934A70 != -1) {
      dispatch_once(&qword_101934A70, &stru_10187CBD0);
    }
    v8 = (os_log_s *)qword_101934A78;
    if (os_log_type_enabled((os_log_t)qword_101934A78, OS_LOG_TYPE_DEFAULT))
    {
      *(double *)&__int128 v9 = COERCE_DOUBLE(sub_100832C40(*((_DWORD *)a3 + 24)));
      *(_DWORD *)buf = 136315138;
      double v30 = *(double *)&v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_DEFAULT,  "#Warning BATCH: Received a location (%s) without an odometer while odometer alarm was set",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934A70 != -1) {
        dispatch_once(&qword_101934A70, &stru_10187CBD0);
      }
      uint64_t v10 = qword_101934A78;
      *(double *)&int v11 = COERCE_DOUBLE(sub_100832C40(*((_DWORD *)a3 + 24)));
      int v25 = 136315138;
      double v26 = *(double *)&v11;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v10,  0LL,  "#Warning BATCH: Received a location (%s) without an odometer while odometer alarm was set",  (const char *)&v25);
      v13 = (uint8_t *)v12;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLOdometerAlarmManager handleLocationData:]", "%s\n", v12);
      if (v13 != buf) {
        free(v13);
      }
    }
  }

  objc_sync_exit(self);
}

- (void)handleOdometerData:(const void *)a3
{
  if (*((double *)a3 + 104) <= 0.0)
  {
    if (qword_101934A70 != -1) {
      dispatch_once(&qword_101934A70, &stru_10187CBD0);
    }
    double v7 = (os_log_s *)qword_101934A78;
    if (os_log_type_enabled((os_log_t)qword_101934A78, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *((void *)a3 + 104);
      *(_DWORD *)buf = 134217984;
      uint64_t v18 = v8;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_DEFAULT,  "#Warning BATCH: odometer reset: %.2f",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934A70 != -1) {
        dispatch_once(&qword_101934A70, &stru_10187CBD0);
      }
      uint64_t v12 = *((void *)a3 + 104);
      int v15 = 134217984;
      uint64_t v16 = v12;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A78,  0LL,  "#Warning BATCH: odometer reset: %.2f",  COERCE_DOUBLE(&v15));
      v14 = (uint8_t *)v13;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLOdometerAlarmManager handleOdometerData:]", "%s\n", v13);
      if (v14 != buf) {
        free(v14);
      }
    }

    -[CLOdometerAlarmManager reset](self, "reset");
  }

  else
  {
    if (qword_101934A70 != -1) {
      dispatch_once(&qword_101934A70, &stru_10187CBD0);
    }
    double v5 = (os_log_s *)qword_101934A78;
    if (os_log_type_enabled((os_log_t)qword_101934A78, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = *((void *)a3 + 104);
      *(_DWORD *)buf = 134217984;
      uint64_t v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "BATCH: received odometer: %f", buf, 0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934A70 != -1) {
        dispatch_once(&qword_101934A70, &stru_10187CBD0);
      }
      uint64_t v9 = *((void *)a3 + 104);
      int v15 = 134217984;
      uint64_t v16 = v9;
      _os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  qword_101934A78,  2LL,  "BATCH: received odometer: %f",  COERCE_DOUBLE(&v15));
      int v11 = (uint8_t *)v10;
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLOdometerAlarmManager handleOdometerData:]", "%s\n", v10);
      if (v11 != buf) {
        free(v11);
      }
    }

    -[CLOdometerAlarmManager handleOdometer:](self, "handleOdometer:", *((double *)a3 + 104));
  }

  objc_sync_exit(self);
}

- (void)handleOdometer:(double)a3
{
  while (-[CLOdometerAlarmManager firstAlarm](self, "firstAlarm"))
  {
    -[CLOdometerAlarm odometerTarget](-[CLOdometerAlarmManager firstAlarm](self, "firstAlarm"), "odometerTarget");
    if (v5 >= a3) {
      break;
    }
    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472LL;
    v7[2] = sub_100CB1C98;
    v7[3] = &unk_10181FA90;
    v7[4] = self;
    *(double *)&v7[5] = a3;
    dispatch_async(global_queue, v7);
    -[NSMutableArray removeObjectAtIndex:](self->fAlarms, "removeObjectAtIndex:", 0LL);
  }

  -[CLOdometerAlarmManager setLastOdometer:](self, "setLastOdometer:", a3);
  -[CLOdometerAlarmManager reschedule](self, "reschedule");
}

- (void)reset
{
  __int128 v11 = 0u;
  __int128 v12 = 0u;
  __int128 v13 = 0u;
  __int128 v14 = 0u;
  fAlarms = self->fAlarms;
  id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( fAlarms,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (i = 0LL; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(fAlarms);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8LL * (void)i);
        dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472LL;
        block[2] = sub_100CB1E1C;
        block[3] = &unk_10181A288;
        block[4] = v8;
        dispatch_async(global_queue, block);
      }

      id v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:]( fAlarms,  "countByEnumeratingWithState:objects:count:",  &v11,  v15,  16LL);
    }

    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->fAlarms, "removeAllObjects");
  -[CLOdometerAlarmManager setLastOdometer:](self, "setLastOdometer:", 0.0);
}

- (CLOdometerAlarm)firstAlarm
{
  result = (CLOdometerAlarm *)-[NSMutableArray count](self->fAlarms, "count");
  if (result) {
    return (CLOdometerAlarm *)-[NSMutableArray objectAtIndex:](self->fAlarms, "objectAtIndex:", 0LL);
  }
  return result;
}

- (CLOdometerAlarm)currentlyScheduled
{
  return self->currentlyScheduled;
}

- (void)setCurrentlyScheduled:(id)a3
{
  self->currentlyScheduled = (CLOdometerAlarm *)a3;
}

- (double)lastOdometer
{
  return self->lastOdometer;
}

- (void)setLastOdometer:(double)a3
{
  self->lastOdometer = a3;
}

- (void).cxx_destruct
{
  value = self->fGpsClient.__ptr_.__value_;
  self->fGpsClient.__ptr_.__value_ = 0LL;
  if (value) {
    (*(void (**)(Client *, SEL))(*(void *)value + 8LL))(value, a2);
  }
  id v4 = self->fLocationClient.__ptr_.__value_;
  self->fLocationClient.__ptr_.__value_ = 0LL;
  if (v4) {
    (*(void (**)(Client *))(*(void *)v4 + 8LL))(v4);
  }
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0LL;
  *((void *)self + 3) = 0LL;
  return self;
}

@end