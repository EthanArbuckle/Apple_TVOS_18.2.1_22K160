@interface TMMonotonicClock
- (BOOL)isMachTimeValid:(unint64_t)a3;
- (OS_dispatch_queue)workQ;
- (TMMonotonicClock)init;
- (TMMonotonicClock)initWithSyncInterval:(double)a3;
- (double)coarseMonotonicTime;
- (unint64_t)lastWake;
- (void)dealloc;
- (void)montonicTimeForMachTime:(unint64_t)a3 toQueue:(id)a4 withCompletionHandler:(id)a5;
- (void)setWorkQ:(id)a3;
@end

@implementation TMMonotonicClock

- (TMMonotonicClock)init
{
  return 0LL;
}

- (TMMonotonicClock)initWithSyncInterval:(double)a3
{
  v9.receiver = self;
  v9.super_class = (Class)&OBJC_CLASS___TMMonotonicClock;
  v4 = -[TMMonotonicClock init](&v9, "init");
  v5 = v4;
  if (v4)
  {
    v6 = (objc_class *)objc_opt_class(v4);
    v7 = -[NSString UTF8String]( +[NSString stringWithFormat:]( &OBJC_CLASS___NSString,  "stringWithFormat:",  @"%@.%llx",  NSStringFromClass(v6),  v5),  "UTF8String");
    v5->_workQ = (OS_dispatch_queue *)dispatch_queue_create(v7, 0LL);
    v5->_lastCoarseMonotonicTimeMachTime = -[TMMonotonicClock machTime](v5, "machTime");
    v5->_syncInterval = a3;
  }

  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___TMMonotonicClock;
  -[TMMonotonicClock dealloc](&v3, "dealloc");
}

- (void)montonicTimeForMachTime:(unint64_t)a3 toQueue:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v10 = mach_absolute_time();
  if (v10 < a3) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:]( +[NSAssertionHandler currentHandler](&OBJC_CLASS___NSAssertionHandler, "currentHandler"),  "handleFailureInMethod:object:file:lineNumber:description:",  a2,  self,  @"TMMonotonicClock.m",  63LL,  @"%lld < %lld",  a3,  v10);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472LL;
  block[2] = sub_100011804;
  block[3] = &unk_100029200;
  block[4] = self;
  block[5] = a4;
  block[6] = a5;
  block[7] = a3;
  dispatch_async((dispatch_queue_t)-[TMMonotonicClock workQ](self, "workQ"), block);
}

- (double)coarseMonotonicTime
{
  unint64_t v3 = -[TMMonotonicClock machTime](self, "machTime");
  double v4 = sub_1000070E4(0LL, 0LL);
  double v5 = sub_100007998(self->_lastCoarseMonotonicTimeMachTime, v3);
  double v6 = v4 - self->_lastCoarseMonotonicTime;
  double v7 = sub_100006DA4();
  if (v6 >= v7 * -0.5)
  {
    if (v5 > v7 + v7 && v6 < v7 * 0.5)
    {
      uint64_t v14 = qword_1000338F8;
      if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_FAULT))
      {
        double lastCoarseMonotonicTime = self->_lastCoarseMonotonicTime;
        int v17 = 134219008;
        double v18 = v4;
        __int16 v19 = 2048;
        double v20 = lastCoarseMonotonicTime;
        __int16 v21 = 2048;
        double v22 = v6;
        __int16 v23 = 2048;
        double v24 = v5;
        __int16 v25 = 2048;
        double v26 = v7;
        uint64_t v10 = "PMU RTC appears stalled: %f - %f = %f; mach advanced by %f; resolution %f";
        v11 = (os_log_s *)v14;
        uint32_t v12 = 52;
        goto LABEL_12;
      }
    }
  }

  else
  {
    uint64_t v8 = qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_FAULT))
    {
      double v9 = self->_lastCoarseMonotonicTime;
      int v17 = 134218752;
      double v18 = v4;
      __int16 v19 = 2048;
      double v20 = v9;
      __int16 v21 = 2048;
      double v22 = v6;
      __int16 v23 = 2048;
      double v24 = v7;
      uint64_t v10 = "PMU RTC went backward: %f - %f = %f; resolution %f";
      v11 = (os_log_s *)v8;
      uint32_t v12 = 42;
LABEL_12:
      _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, v10, (uint8_t *)&v17, v12);
    }
  }

  self->_double lastCoarseMonotonicTime = v4;
  self->_lastCoarseMonotonicTimeMachTime = v3;
  return v4;
}

- (unint64_t)lastWake
{
  if (qword_1000338E8 != -1) {
    dispatch_once(&qword_1000338E8, &stru_100029220);
  }
  size_t v15 = 8LL;
  if (sysctl((int *)&unk_1000338D8, qword_1000338E0, &v16, &v15, 0LL, 0LL))
  {
    unint64_t v3 = (os_log_s *)qword_1000338F8;
    if (os_log_type_enabled((os_log_t)qword_1000338F8, OS_LOG_TYPE_ERROR)) {
      sub_10001B8D4(v3, v4, v5, v6, v7, v8, v9, v10);
    }
    unint64_t v11 = -1LL;
    unint64_t v16 = -1LL;
  }

  else
  {
    unint64_t v11 = v16;
  }

  if (self->_lastWake != v11)
  {
    self->_lastWake = v11;
    uint32_t v12 = (os_log_s *)qword_100033900;
    if (os_log_type_enabled((os_log_t)qword_100033900, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "cmd,lastWake,mach,%llu", buf, 0xCu);
      unint64_t v11 = v16;
    }

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472LL;
    v14[2] = sub_100011F3C;
    v14[3] = &unk_100029240;
    v14[4] = v11;
    AnalyticsSendEventLazy(@"com.apple.timed.lastWake", v14);
    return v16;
  }

  return v11;
}

- (BOOL)isMachTimeValid:(unint64_t)a3
{
  return -[TMMonotonicClock lastWake](self, "lastWake") < a3;
}

- (OS_dispatch_queue)workQ
{
  return self->_workQ;
}

- (void)setWorkQ:(id)a3
{
}

@end