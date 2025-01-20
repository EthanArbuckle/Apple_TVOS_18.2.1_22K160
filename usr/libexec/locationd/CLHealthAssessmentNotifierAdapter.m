@interface CLHealthAssessmentNotifierAdapter
+ (BOOL)isSupported;
+ (id)getSilo;
+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4;
+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4;
- (BOOL)anySubscribedToSensorRecorder;
- (BOOL)syncgetDoSync:(id)a3;
- (CLHealthAssessmentChoreaDetectionService)choreaDetectionService;
- (CLHealthAssessmentNotifierAdapter)init;
- (CLHealthAssessmentTremorDetectionService)tremorDetectionService;
- (CLTimer)fAggregateRecordsTimer;
- (CLTimer)fSensorRecorderQueryTimer;
- (CLTimer)fSensorRecorderSubscribeTimer;
- (CMSensorRecorder)sensorRecorder;
- (double)lastProcessedTime;
- (double)monitorKinesiasExpiration;
- (double)monitorKinesiasStart;
- (double)updateStartTime;
- (void)adaptee;
- (void)addMonitoringPeriodFrom:(double)a3 until:(double)a4;
- (void)aggregateRecords;
- (void)beginService;
- (void)doAsync:(id)a3;
- (void)doAsync:(id)a3 withReply:(id)a4;
- (void)endService;
- (void)processDataWithMaxDuration:(double)a3 endTime:(double)a4;
- (void)processNextIntervalWithRemainingDurationToProcess:(double *)a3 endTime:(double)a4 updateCanContinue:(BOOL *)a5;
- (void)setChoreaDetectionService:(id)a3;
- (void)setFAggregateRecordsTimer:(id)a3;
- (void)setFSensorRecorderQueryTimer:(id)a3;
- (void)setFSensorRecorderSubscribeTimer:(id)a3;
- (void)setLastProcessedTime:(double)a3;
- (void)setMonitorKinesiasExpiration:(double)a3;
- (void)setMonitorKinesiasStart:(double)a3;
- (void)setSensorRecorder:(id)a3;
- (void)setTremorDetectionService:(id)a3;
- (void)setUpdateStartTime:(double)a3;
- (void)setupService;
- (void)startUpdatesforAnalyzer:(int)a3;
- (void)stopMonitoring;
- (void)syncgetResultReady:(id)a3 ForAnalyzer:(int)a4;
- (void)teardownService;
- (void)updateSensorRecorderQuery;
- (void)updateSensorRecorderSubscription;
@end

@implementation CLHealthAssessmentNotifierAdapter

+ (void)becameFatallyBlocked:(id)a3 index:(unint64_t)a4
{
  unint64_t v5 = a4 + 1;
}

+ (void)performSyncOnSilo:(id)a3 invoker:(id)a4
{
}

+ (id)getSilo
{
  if (qword_101993CA8 != -1) {
    dispatch_once(&qword_101993CA8, &stru_10182B878);
  }
  return (id)qword_101993CA0;
}

- (CLHealthAssessmentNotifierAdapter)init
{
  v3.receiver = self;
  v3.super_class = (Class)&OBJC_CLASS___CLHealthAssessmentNotifierAdapter;
  return -[CLHealthAssessmentNotifierAdapter initWithInboundProtocol:outboundProtocol:]( &v3,  "initWithInboundProtocol:outboundProtocol:",  &OBJC_PROTOCOL___CLHealthAssessmentNotifierProtocol,  &OBJC_PROTOCOL___CLHealthAssessmentNotifierClientProtocol);
}

- (void)beginService
{
  if (qword_101934800 != -1) {
    dispatch_once(&qword_101934800, &stru_10182B9E8);
  }
  objc_super v3 = (os_log_s *)off_101934808;
  if (os_log_type_enabled((os_log_t)off_101934808, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "CLHealthAssessmentNotifier starting up", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934800 != -1) {
      dispatch_once(&qword_101934800, &stru_10182B9E8);
    }
    LOWORD(v25) = 0;
    v19 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  off_101934808,  1LL,  "CLHealthAssessmentNotifier starting up",  &v25,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLHealthAssessmentNotifierAdapter beginService]", "%s\n", v19);
  }

  -[CLNotifierServiceAdapter setAdaptedNotifier:]( self,  "setAdaptedNotifier:",  sub_1002298D8((uint64_t)-[CLHealthAssessmentNotifierAdapter universe](self, "universe")));
  if (!-[CLNotifierServiceAdapter notifier](self, "notifier")) {
    sub_101230F28();
  }
  uint64_t v4 = sub_1002F8DDC();
  if (sub_1002A6E6C(v4))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v6 = sub_1002F8DDC();
    p_double monitorKinesiasStart = &self->_monitorKinesiasStart;
    sub_1002A832C(v6, (uint64_t)@"kMonitorKinesiasStart", &self->_monitorKinesiasStart);
    double monitorKinesiasStart = self->_monitorKinesiasStart;
    if (Current < monitorKinesiasStart) {
      double monitorKinesiasStart = Current;
    }
    double *p_monitorKinesiasStart = monitorKinesiasStart;
    uint64_t v9 = sub_1002F8DDC();
    p_monitorKinesiasExpiration = &self->_monitorKinesiasExpiration;
    sub_1002A832C(v9, (uint64_t)@"kMonitorKinesiasExpiration", &self->_monitorKinesiasExpiration);
    double v11 = *p_monitorKinesiasStart + 604800.0;
    if (v11 >= self->_monitorKinesiasExpiration) {
      double v11 = *p_monitorKinesiasExpiration;
    }
    double *p_monitorKinesiasExpiration = v11;
    if (qword_101934800 != -1) {
      dispatch_once(&qword_101934800, &stru_10182B9E8);
    }
    v12 = (os_log_s *)off_101934808;
    if (os_log_type_enabled((os_log_t)off_101934808, OS_LOG_TYPE_INFO))
    {
      double v13 = *p_monitorKinesiasStart;
      double v14 = *p_monitorKinesiasExpiration;
      *(_DWORD *)buf = 134349312;
      double v30 = v13;
      __int16 v31 = 2050;
      double v32 = v14;
      _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Loaded monitoring period start: %{public}f expiration date: %{public}f",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934800 != -1) {
        dispatch_once(&qword_101934800, &stru_10182B9E8);
      }
      double v20 = *p_monitorKinesiasStart;
      double v21 = *p_monitorKinesiasExpiration;
      int v25 = 134349312;
      double v26 = v20;
      __int16 v27 = 2050;
      double v28 = v21;
      LODWORD(v24) = 22;
      v22 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  off_101934808,  1LL,  "Loaded monitoring period start: %{public}f expiration date: %{public}f",  &v25,  v24);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLHealthAssessmentNotifierAdapter beginService]", "%s\n", v22);
    }

    uint64_t v15 = sub_1002F8DDC();
    sub_1002A832C(v15, (uint64_t)@"kMonitorKinesiasLastProcessed", &self->_lastProcessedTime);
    double lastProcessedTime = self->_lastProcessedTime;
    if (Current < lastProcessedTime) {
      double lastProcessedTime = Current;
    }
    self->_double lastProcessedTime = lastProcessedTime;
    -[CLHealthAssessmentNotifierAdapter setupService](self, "setupService");
    -[CLHealthAssessmentNotifierAdapter monitorKinesiasExpiration](self, "monitorKinesiasExpiration");
    if (v17 > Current)
    {
      if (qword_101934800 != -1) {
        dispatch_once(&qword_101934800, &stru_10182B9E8);
      }
      v18 = (os_log_s *)off_101934808;
      if (os_log_type_enabled((os_log_t)off_101934808, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl( (void *)&_mh_execute_header,  v18,  OS_LOG_TYPE_INFO,  "Resume sensor recording on service start",  buf,  2u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934800 != -1) {
          dispatch_once(&qword_101934800, &stru_10182B9E8);
        }
        LOWORD(v25) = 0;
        LODWORD(v24) = 2;
        v23 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  off_101934808,  1LL,  "Resume sensor recording on service start",  &v25,  v24);
        sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLHealthAssessmentNotifierAdapter beginService]", "%s\n", v23);
      }

      -[CLHealthAssessmentNotifierAdapter updateSensorRecorderSubscription](self, "updateSensorRecorderSubscription");
      self->fDyskinesiaSubscribed = 1;
      self->fTremorSubscribed = 1;
    }
  }

- (void)endService
{
  objc_super v3 = -[CLNotifierServiceAdapter notifier](self, "notifier");
  (*((void (**)(CLNotifierBase *))v3->var0 + 2))(v3);
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

- (void)setupService
{
  if (!-[CLHealthAssessmentNotifierAdapter sensorRecorder](self, "sensorRecorder"))
  {
    -[CLHealthAssessmentNotifierAdapter setSensorRecorder:]( self,  "setSensorRecorder:",  objc_alloc_init(&OBJC_CLASS___CMSensorRecorder));
    sub_100229DF8((uint64_t)-[CLHealthAssessmentNotifierAdapter adaptee](self, "adaptee"));
    -[CLHealthAssessmentNotifierAdapter setChoreaDetectionService:]( self,  "setChoreaDetectionService:",  objc_alloc_init(&OBJC_CLASS___CLHealthAssessmentChoreaDetectionService));
    -[CLHealthAssessmentChoreaDetectionService setDelegate:]( -[CLHealthAssessmentNotifierAdapter choreaDetectionService](self, "choreaDetectionService"),  "setDelegate:",  self);
    -[CLHealthAssessmentNotifierAdapter setTremorDetectionService:]( self,  "setTremorDetectionService:",  objc_alloc_init(&OBJC_CLASS___CLHealthAssessmentTremorDetectionService));
    -[CLHealthAssessmentTremorDetectionService setDelegate:]( -[CLHealthAssessmentNotifierAdapter tremorDetectionService](self, "tremorDetectionService"),  "setDelegate:",  self);
    -[CLHealthAssessmentNotifierAdapter setFSensorRecorderQueryTimer:]( self,  "setFSensorRecorderQueryTimer:",  objc_msgSend(objc_msgSend(-[CLHealthAssessmentNotifierAdapter universe](self, "universe"), "silo"), "newTimer"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472LL;
    v15[2] = sub_100229FCC;
    v15[3] = &unk_10181A288;
    v15[4] = self;
    -[CLTimer setHandler:]( -[CLHealthAssessmentNotifierAdapter fSensorRecorderQueryTimer](self, "fSensorRecorderQueryTimer"),  "setHandler:",  v15);
    double v14 = 15.0;
    uint64_t v3 = sub_1006E27E8();
    sub_100413284(v3, buf);
    sub_1002A82BC(*(uint64_t *)&buf[0], "kMonitorKinesiasProcessingDelay", &v14);
    uint64_t v4 = (std::__shared_weak_count *)*((void *)&buf[0] + 1);
    if (*((void *)&buf[0] + 1))
    {
      unint64_t v5 = (unint64_t *)(*((void *)&buf[0] + 1) + 8LL);
      do
        unint64_t v6 = __ldaxr(v5);
      while (__stlxr(v6 - 1, v5));
      if (!v6)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }

    v7 = -[CLHealthAssessmentNotifierAdapter fSensorRecorderQueryTimer](self, "fSensorRecorderQueryTimer");
    -[CLTimer setNextFireDelay:](v7, "setNextFireDelay:", v14);
    if (qword_101934800 != -1) {
      dispatch_once(&qword_101934800, &stru_10182B9E8);
    }
    v8 = (os_log_s *)off_101934808;
    if (os_log_type_enabled((os_log_t)off_101934808, OS_LOG_TYPE_INFO))
    {
      -[CLTimer nextFireTime]( -[CLHealthAssessmentNotifierAdapter fSensorRecorderQueryTimer](self, "fSensorRecorderQueryTimer"),  "nextFireTime");
      LODWORD(buf[0]) = 134349056;
      *(void *)((char *)buf + 4) = v9;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "fSensorRecorderQueryTimer.nextFireTime, %{public}f",  (uint8_t *)buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934800 != -1) {
        dispatch_once(&qword_101934800, &stru_10182B9E8);
      }
      v10 = off_101934808;
      -[CLTimer nextFireTime]( -[CLHealthAssessmentNotifierAdapter fSensorRecorderQueryTimer](self, "fSensorRecorderQueryTimer"),  "nextFireTime");
      int v16 = 134349056;
      uint64_t v17 = v11;
      v12 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v10,  1LL,  "fSensorRecorderQueryTimer.nextFireTime, %{public}f",  &v16,  12);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLHealthAssessmentNotifierAdapter setupService]", "%s\n", v12);
    }

    -[CLHealthAssessmentNotifierAdapter setFAggregateRecordsTimer:]( self,  "setFAggregateRecordsTimer:",  objc_msgSend(objc_msgSend(-[CLHealthAssessmentNotifierAdapter universe](self, "universe"), "silo"), "newTimer"));
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472LL;
    v13[2] = sub_100229FD4;
    v13[3] = &unk_10181A288;
    v13[4] = self;
    -[CLTimer setHandler:]( -[CLHealthAssessmentNotifierAdapter fAggregateRecordsTimer](self, "fAggregateRecordsTimer"),  "setHandler:",  v13);
    -[CLHealthAssessmentNotifierAdapter aggregateRecords](self, "aggregateRecords");
  }

- (void)teardownService
{
  if (qword_101934800 != -1) {
    dispatch_once(&qword_101934800, &stru_10182B9E8);
  }
  uint64_t v3 = (os_log_s *)off_101934808;
  if (os_log_type_enabled((os_log_t)off_101934808, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Tearing down service", buf, 2u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934800 != -1) {
      dispatch_once(&qword_101934800, &stru_10182B9E8);
    }
    v10[0] = 0;
    uint64_t v9 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  off_101934808,  0LL,  "Tearing down service",  v10,  2);
    sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLHealthAssessmentNotifierAdapter teardownService]", "%s\n", v9);
  }

  uint64_t v4 = sub_1002F8DDC();
  sub_1002A66DC(v4);
  uint64_t v5 = sub_1002F8DDC();
  sub_1002A66DC(v5);
  self->_double monitorKinesiasStart = 0.0;
  uint64_t v6 = sub_1002F8DDC();
  sub_1002A66DC(v6);
  self->_monitorKinesiasExpiration = 0.0;
  uint64_t v7 = sub_1002F8DDC();
  sub_1002A66DC(v7);
  self->_double lastProcessedTime = 0.0;
  self->_updateStartTime = 0.0;
  uint64_t v8 = sub_1002F8DDC();
  (*(void (**)(uint64_t))(*(void *)v8 + 944LL))(v8);
  -[CLHealthAssessmentNotifierAdapter setFSensorRecorderQueryTimer:](self, "setFSensorRecorderQueryTimer:", 0LL);
  -[CLHealthAssessmentNotifierAdapter setFAggregateRecordsTimer:](self, "setFAggregateRecordsTimer:", 0LL);
  -[CLHealthAssessmentNotifierAdapter setFSensorRecorderSubscribeTimer:](self, "setFSensorRecorderSubscribeTimer:", 0LL);

  -[CLHealthAssessmentNotifierAdapter setChoreaDetectionService:](self, "setChoreaDetectionService:", 0LL);
  -[CLHealthAssessmentNotifierAdapter setTremorDetectionService:](self, "setTremorDetectionService:", 0LL);

  -[CLHealthAssessmentNotifierAdapter setSensorRecorder:](self, "setSensorRecorder:", 0LL);
}

- (void)updateSensorRecorderSubscription
{
  double v4 = v3;
  -[CLHealthAssessmentNotifierAdapter monitorKinesiasExpiration](self, "monitorKinesiasExpiration");
  if (v4 >= v5)
  {
    if (qword_101934800 != -1) {
      dispatch_once(&qword_101934800, &stru_10182B9E8);
    }
    uint64_t v7 = (os_log_s *)off_101934808;
    if (os_log_type_enabled((os_log_t)off_101934808, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v7,  OS_LOG_TYPE_INFO,  "Stop renewing sensorRecorder subscription",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934800 != -1) {
        dispatch_once(&qword_101934800, &stru_10182B9E8);
      }
      v9[0] = 0;
      uint64_t v8 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  off_101934808,  1LL,  "Stop renewing sensorRecorder subscription",  v9,  2);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLHealthAssessmentNotifierAdapter updateSensorRecorderSubscription]",  "%s\n",  v8);
    }
  }

  else
  {
    if (!-[CLHealthAssessmentNotifierAdapter fSensorRecorderSubscribeTimer](self, "fSensorRecorderSubscribeTimer"))
    {
      -[CLHealthAssessmentNotifierAdapter setFSensorRecorderSubscribeTimer:]( self,  "setFSensorRecorderSubscribeTimer:",   objc_msgSend( objc_msgSend(-[CLHealthAssessmentNotifierAdapter universe](self, "universe"), "silo"),  "newTimer"));
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472LL;
      v11[2] = sub_10022A4C4;
      v11[3] = &unk_10181A288;
      v11[4] = self;
      -[CLTimer setHandler:]( -[CLHealthAssessmentNotifierAdapter fSensorRecorderSubscribeTimer](self, "fSensorRecorderSubscribeTimer"),  "setHandler:",  v11);
    }

    dispatch_queue_global_t global_queue = dispatch_get_global_queue(0LL, 0LL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472LL;
    block[2] = sub_10022A4CC;
    block[3] = &unk_10181A288;
    block[4] = self;
    dispatch_async(global_queue, block);
  }

- (void)updateSensorRecorderQuery
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472LL;
  v2[2] = sub_10022AB20;
  v2[3] = &unk_10181A288;
  v2[4] = self;
  objc_msgSend(objc_msgSend(-[CLHealthAssessmentNotifierAdapter universe](self, "universe"), "silo"), "async:", v2);
}

- (void)processDataWithMaxDuration:(double)a3 endTime:(double)a4
{
  if (a3 > 0.0)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    if (Current >= a4)
    {
      double v8 = a4;
    }

    else
    {
      double v8 = Current;
      if (qword_101934800 != -1) {
        dispatch_once(&qword_101934800, &stru_10182B9E8);
      }
      uint64_t v9 = (os_log_s *)off_101934808;
      if (os_log_type_enabled((os_log_t)off_101934808, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134349312;
        double v30 = v8;
        __int16 v31 = 2050;
        double v32 = a4;
        _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Limiting processing up to timestamp %{public}lf (asked %{public}lf)",  buf,  0x16u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934800 != -1) {
          dispatch_once(&qword_101934800, &stru_10182B9E8);
        }
        int v21 = 134349312;
        double v22 = v8;
        __int16 v23 = 2050;
        double v24 = a4;
        v10 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  off_101934808,  1LL,  "Limiting processing up to timestamp %{public}lf (asked %{public}lf)",  &v21,  22);
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLHealthAssessmentNotifierAdapter processDataWithMaxDuration:endTime:]",  "%s\n",  v10);
      }
    }

    double v20 = a3;
    char v19 = 1;
    unsigned int v11 = 0;
    if (a3 > 0.0)
    {
      while (v11 <= 0x1D)
      {
        -[CLHealthAssessmentNotifierAdapter processNextIntervalWithRemainingDurationToProcess:endTime:updateCanContinue:]( self,  "processNextIntervalWithRemainingDurationToProcess:endTime:updateCanContinue:",  &v20,  &v19,  v8);
        if (qword_101934800 != -1) {
          dispatch_once(&qword_101934800, &stru_10182B9E8);
        }
        v12 = (os_log_s *)off_101934808;
        if (os_log_type_enabled((os_log_t)off_101934808, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134349312;
          double v30 = v20;
          __int16 v31 = 1026;
          LODWORD(v32) = v11;
          _os_log_impl( (void *)&_mh_execute_header,  v12,  OS_LOG_TYPE_INFO,  "Remaining duration to process = %{public}lf, current iteration = %{public}i",  buf,  0x12u);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_101934800 != -1) {
            dispatch_once(&qword_101934800, &stru_10182B9E8);
          }
          int v21 = 134349312;
          double v22 = v20;
          __int16 v23 = 1026;
          LODWORD(v24) = v11;
          LODWORD(v18) = 18;
          double v13 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  off_101934808,  1LL,  "Remaining duration to process = %{public}lf, current iteration = %{public}i",  &v21,  v18);
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLHealthAssessmentNotifierAdapter processDataWithMaxDuration:endTime:]",  "%s\n",  v13);
        }

        ++v11;
        if (v20 <= 0.0 || !v19) {
          goto LABEL_33;
        }
      }

      if (qword_101934800 != -1) {
        dispatch_once(&qword_101934800, &stru_10182B9E8);
      }
      double v14 = (os_log_s *)off_101934808;
      if (os_log_type_enabled((os_log_t)off_101934808, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67240192;
        LODWORD(v30) = v11;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_DEFAULT,  "Exceeding maximum number of iterations when processing data = %{public}i - interrupting the processing",  buf,  8u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934800 != -1) {
          dispatch_once(&qword_101934800, &stru_10182B9E8);
        }
        int v21 = 67240192;
        LODWORD(v22) = v11;
        LODWORD(v18) = 8;
        uint64_t v17 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  off_101934808,  0LL,  "Exceeding maximum number of iterations when processing data = %{public}i - interrupting the processing",  &v21,  v18);
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLHealthAssessmentNotifierAdapter processDataWithMaxDuration:endTime:]",  "%s\n",  v17);
      }

      char v19 = 0;
    }

- (void)processNextIntervalWithRemainingDurationToProcess:(double *)a3 endTime:(double)a4 updateCanContinue:(BOOL *)a5
{
  if ((sub_100D8A92C(*((void *)-[CLHealthAssessmentNotifierAdapter adaptee](self, "adaptee") + 20) + 72LL) & 1) != 0)
  {
    -[CLHealthAssessmentNotifierAdapter updateStartTime](self, "updateStartTime");
    if (v9 == 0.0)
    {
      -[CLHealthAssessmentNotifierAdapter lastProcessedTime](self, "lastProcessedTime");
      if (v10 > 0.0)
      {
        if (qword_101934800 != -1) {
          dispatch_once(&qword_101934800, &stru_10182B9E8);
        }
        unsigned int v11 = (os_log_s *)off_101934808;
        if (os_log_type_enabled((os_log_t)off_101934808, OS_LOG_TYPE_INFO))
        {
          -[CLHealthAssessmentNotifierAdapter lastProcessedTime](self, "lastProcessedTime");
          int v125 = 134349056;
          double v126 = v12;
          _os_log_impl( (void *)&_mh_execute_header,  v11,  OS_LOG_TYPE_INFO,  "Updating start time to %{public}f based on last processed time",  (uint8_t *)&v125,  0xCu);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(&v125, 0x65CuLL);
          if (qword_101934800 != -1) {
            dispatch_once(&qword_101934800, &stru_10182B9E8);
          }
          v87 = off_101934808;
          -[CLHealthAssessmentNotifierAdapter lastProcessedTime](self, "lastProcessedTime");
          int v119 = 134349056;
          double v120 = v88;
          v89 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  &v125,  1628LL,  &_mh_execute_header,  v87,  1LL,  "Updating start time to %{public}f based on last processed time",  &v119,  12);
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLHealthAssessmentNotifierAdapter processNextIntervalWithRemainingDurationToProcess:endTime:updateCanContinue:]",  "%s\n",  v89);
        }

        -[CLHealthAssessmentNotifierAdapter lastProcessedTime](self, "lastProcessedTime");
        -[CLHealthAssessmentNotifierAdapter setUpdateStartTime:](self, "setUpdateStartTime:");
      }
    }

    if (*a3 <= 0.0 || (-[CLHealthAssessmentNotifierAdapter updateStartTime](self, "updateStartTime", *a3), v13 > a4))
    {
      if (qword_101934800 != -1) {
        dispatch_once(&qword_101934800, &stru_10182B9E8);
      }
      double v14 = (os_log_s *)off_101934808;
      if (os_log_type_enabled((os_log_t)off_101934808, OS_LOG_TYPE_INFO))
      {
        double v15 = *a3;
        -[CLHealthAssessmentNotifierAdapter updateStartTime](self, "updateStartTime");
        int v125 = 134349568;
        double v126 = v15;
        __int16 v127 = 2050;
        double v128 = a4;
        __int16 v129 = 2050;
        uint64_t v130 = v16;
        _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "No processing to do, remainingDurationToProcess=%{public}f, endTime=%{public}f, updateStartTime=%{public}f",  (uint8_t *)&v125,  0x20u);
      }

      if (!sub_1002921D0(115, 2)) {
        goto LABEL_17;
      }
      bzero(&v125, 0x65CuLL);
      if (qword_101934800 != -1) {
        dispatch_once(&qword_101934800, &stru_10182B9E8);
      }
      v83 = off_101934808;
      double v84 = *a3;
      -[CLHealthAssessmentNotifierAdapter updateStartTime](self, "updateStartTime");
      int v119 = 134349568;
      double v120 = v84;
      __int16 v121 = 2050;
      double v122 = a4;
      __int16 v123 = 2050;
      uint64_t v124 = v85;
      LODWORD(v103) = 32;
      v69 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  &v125,  1628LL,  &_mh_execute_header,  v83,  1LL,  "No processing to do, remainingDurationToProcess=%{public}f, endTime=%{public}f, updateStartTime=%{public}f",  &v119,  v103);
LABEL_106:
      v86 = (int *)v69;
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLHealthAssessmentNotifierAdapter processNextIntervalWithRemainingDurationToProcess:endTime:updateCanContinue:]",  "%s\n",  v69);
      if (v86 != &v125) {
        free(v86);
      }
LABEL_17:
      *a5 = 0;
      return;
    }

    double v18 = fmin(*a3, 43200.0);
    -[CLHealthAssessmentNotifierAdapter updateStartTime](self, "updateStartTime");
    double v111 = a4;
    double v112 = v19;
    +[CLHealthAssessmentUtilities limitStart:andEnd:maxDuration:from:]( &OBJC_CLASS___CLHealthAssessmentUtilities,  "limitStart:andEnd:maxDuration:from:",  &v112,  &v111,  259190.0,  CFAbsoluteTimeGetCurrent());
    if (!sub_10022C4B4(-[CLHealthAssessmentNotifierAdapter adaptee](self, "adaptee"), &v112, &v111, v18))
    {
      -[CLHealthAssessmentNotifierAdapter setLastProcessedTime:](self, "setLastProcessedTime:", v111);
      if (qword_101934800 != -1) {
        dispatch_once(&qword_101934800, &stru_10182B9E8);
      }
      v68 = (os_log_s *)off_101934808;
      if (os_log_type_enabled((os_log_t)off_101934808, OS_LOG_TYPE_INFO))
      {
        int v125 = 134349056;
        double v126 = v111;
        _os_log_impl( (void *)&_mh_execute_header,  v68,  OS_LOG_TYPE_INFO,  "No valid period, marking up to %{public}f as processed",  (uint8_t *)&v125,  0xCu);
      }

      if (!sub_1002921D0(115, 2)) {
        goto LABEL_17;
      }
      bzero(&v125, 0x65CuLL);
      if (qword_101934800 != -1) {
        dispatch_once(&qword_101934800, &stru_10182B9E8);
      }
      int v119 = 134349056;
      double v120 = v111;
      LODWORD(v103) = 12;
      v69 = (const char *)_os_log_send_and_compose_impl( 2LL,  0LL,  &v125,  1628LL,  &_mh_execute_header,  off_101934808,  1LL,  "No valid period, marking up to %{public}f as processed",  &v119,  v103);
      goto LABEL_106;
    }

    v105 = a5;
    double v111 = fmin(v111, a4);
    double v20 = objc_alloc(&OBJC_CLASS___NSDate);
    int v21 = -[NSDate initWithTimeIntervalSinceReferenceDate:](v20, "initWithTimeIntervalSinceReferenceDate:", v112);
    double v22 = objc_alloc(&OBJC_CLASS___NSDate);
    __int16 v23 =  -[NSDate initWithTimeIntervalSinceReferenceDate:]( v22,  "initWithTimeIntervalSinceReferenceDate:",  v111 + 2.0);
    if (qword_101934800 != -1) {
      dispatch_once(&qword_101934800, &stru_10182B9E8);
    }
    p_vtable = &OBJC_METACLASS___CLPrivacyManager.vtable;
    __int16 v25 = (os_log_s *)off_101934808;
    if (os_log_type_enabled((os_log_t)off_101934808, OS_LOG_TYPE_INFO))
    {
      int v125 = 134349312;
      double v126 = v112;
      __int16 v127 = 2050;
      double v128 = v111;
      _os_log_impl( (void *)&_mh_execute_header,  v25,  OS_LOG_TYPE_INFO,  "Requesting sensorRecorder data from %{public}f to %{public}f",  (uint8_t *)&v125,  0x16u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(&v125, 0x65CuLL);
      if (qword_101934800 != -1) {
        dispatch_once(&qword_101934800, &stru_10182B9E8);
      }
      int v119 = 134349312;
      double v120 = v112;
      __int16 v121 = 2050;
      double v122 = v111;
      LODWORD(v103) = 22;
      v90 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  &v125,  1628LL,  &_mh_execute_header,  off_101934808,  1LL,  "Requesting sensorRecorder data from %{public}f to %{public}f",  &v119,  v103);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLHealthAssessmentNotifierAdapter processNextIntervalWithRemainingDurationToProcess:endTime:updateCanContinue:]",  "%s\n",  v90);
      p_vtable = (void **)(&OBJC_METACLASS___CLPrivacyManager + 24);
    }

    v108 = -[CMSensorRecorder accelerometerDataFromDate:toDate:]( -[CLHealthAssessmentNotifierAdapter sensorRecorder](self, "sensorRecorder"),  "accelerometerDataFromDate:toDate:",  v21,  v23);
    if (qword_101934800 != -1) {
      dispatch_once(&qword_101934800, &stru_10182B9E8);
    }
    double v26 = (os_log_s *)p_vtable[257];
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      LOWORD(v125) = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Received accel data", (uint8_t *)&v125, 2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(&v125, 0x65CuLL);
      if (qword_101934800 != -1) {
        dispatch_once(&qword_101934800, &stru_10182B9E8);
      }
      LOWORD(v119) = 0;
      LODWORD(v103) = 2;
      v91 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  &v125,  1628LL,  &_mh_execute_header,  off_101934808,  1LL,  "Received accel data",  &v119,  v103);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLHealthAssessmentNotifierAdapter processNextIntervalWithRemainingDurationToProcess:endTime:updateCanContinue:]",  "%s\n",  v91);
      p_vtable = (void **)(&OBJC_METACLASS___CLPrivacyManager + 24);
    }

    id v107 = -[CMSensorRecorder gyroDataFromDate:toDate:]( -[CLHealthAssessmentNotifierAdapter sensorRecorder](self, "sensorRecorder"),  "gyroDataFromDate:toDate:",  v21,  v23);
    if (qword_101934800 != -1) {
      dispatch_once(&qword_101934800, &stru_10182B9E8);
    }
    __int16 v27 = (os_log_s *)p_vtable[257];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      LOWORD(v125) = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Received gyro data", (uint8_t *)&v125, 2u);
    }

    v104 = a3;
    if (sub_1002921D0(115, 2))
    {
      bzero(&v125, 0x65CuLL);
      if (qword_101934800 != -1) {
        dispatch_once(&qword_101934800, &stru_10182B9E8);
      }
      LOWORD(v119) = 0;
      LODWORD(v103) = 2;
      v92 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  &v125,  1628LL,  &_mh_execute_header,  off_101934808,  1LL,  "Received gyro data",  &v119,  v103);
      sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLHealthAssessmentNotifierAdapter processNextIntervalWithRemainingDurationToProcess:endTime:updateCanContinue:]",  "%s\n",  v92);
    }

    uint64_t v106 = 0LL;
    uint64_t v28 = 0LL;
    unint64_t v29 = 0LL;
    unint64_t v30 = 0LL;
    unint64_t v31 = 0LL;
    unint64_t v32 = 0LL;
    while (1)
    {
      if (v30 >= v32)
      {
        id v33 = -[CMSensorDataList countByEnumeratingWithState:objects:count:]( v108,  "countByEnumeratingWithState:objects:count:",  v110,  &v125,  700LL);
        if (!v33) {
          goto LABEL_73;
        }
        unint64_t v32 = (unint64_t)v33;
        unint64_t v30 = 0LL;
      }

      if (v29 >= v31)
      {
        id v34 = [v107 countByEnumeratingWithState:v109 objects:&v119 count:700];
        if (!v34) {
          goto LABEL_73;
        }
        unint64_t v31 = (unint64_t)v34;
        unint64_t v29 = 0LL;
      }

      __int16 v35 = (void *)*((void *)&v125 + v30);
      unsigned int v36 = (void *)*((void *)&v119 + v29);
      [v35 startTime];
      double v38 = v37;
      [v36 startTime];
      double v40 = v39;
      if (v38 > v111 && v39 > v111) {
        break;
      }
      if (v38 >= v39)
      {
        if (v39 <= v111 && v39 > v112)
        {
          [v36 rotationRate];
          float v59 = v58;
          [v36 rotationRate];
          float v61 = v60;
          [v36 rotationRate];
          float v63 = v62;
          v64 = -[CLHealthAssessmentNotifierAdapter tremorDetectionService](self, "tremorDetectionService");
          *(float *)&double v65 = v59;
          *(float *)&double v66 = v61;
          *(float *)&double v67 = v63;
          -[CLHealthAssessmentTremorDetectionService feedGyroSample:time:]( v64,  "feedGyroSample:time:",  v65,  v66,  v67,  v40);
          -[CLHealthAssessmentNotifierAdapter setUpdateStartTime:](self, "setUpdateStartTime:", v40);
          ++v106;
        }

        ++v29;
      }

      else
      {
        if (v38 <= v111 && v38 > v112)
        {
          [v35 acceleration];
          float v44 = v43;
          [v35 acceleration];
          float v46 = v45;
          [v35 acceleration];
          float v48 = v47;
          v49 = -[CLHealthAssessmentNotifierAdapter tremorDetectionService](self, "tremorDetectionService");
          *(float *)&double v50 = v44;
          *(float *)&double v51 = v46;
          *(float *)&double v52 = v48;
          -[CLHealthAssessmentTremorDetectionService feedAccelSample:time:]( v49,  "feedAccelSample:time:",  v50,  v51,  v52,  v38);
          v53 = -[CLHealthAssessmentNotifierAdapter choreaDetectionService](self, "choreaDetectionService");
          *(float *)&double v54 = v44;
          *(float *)&double v55 = v46;
          *(float *)&double v56 = v48;
          -[CLHealthAssessmentChoreaDetectionService feedAccelSample:time:]( v53,  "feedAccelSample:time:",  v54,  v55,  v56,  v38);
          -[CLHealthAssessmentNotifierAdapter setUpdateStartTime:](self, "setUpdateStartTime:", v38);
          ++v28;
        }

        ++v30;
      }
    }

    -[CLHealthAssessmentNotifierAdapter setUpdateStartTime:](self, "setUpdateStartTime:");
LABEL_73:
    if (v28 | v106)
    {
      v71 = v105;
      if (qword_101934800 != -1) {
        dispatch_once(&qword_101934800, &stru_10182B9E8);
      }
      v76 = (os_log_s *)off_101934808;
      if (os_log_type_enabled((os_log_t)off_101934808, OS_LOG_TYPE_INFO))
      {
        -[CLHealthAssessmentNotifierAdapter updateStartTime](self, "updateStartTime");
        *(_DWORD *)buf = 67240704;
        *(_DWORD *)v117 = v28;
        *(_WORD *)&v117[4] = 1026;
        *(_DWORD *)&v117[6] = v106;
        *(_WORD *)v118 = 2050;
        *(double *)&v118[2] = v77 - v112;
        _os_log_impl( (void *)&_mh_execute_header,  v76,  OS_LOG_TYPE_INFO,  "New records read, accel = %{public}d, gyro = %{public}d, duration processed = %{public}lf",  buf,  0x18u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934800 != -1) {
          dispatch_once(&qword_101934800, &stru_10182B9E8);
        }
        v93 = off_101934808;
        -[CLHealthAssessmentNotifierAdapter updateStartTime](self, "updateStartTime");
        int v113 = 67240704;
        *(_DWORD *)v114 = v28;
        *(_WORD *)&v114[4] = 1026;
        *(_DWORD *)&v114[6] = v106;
        *(_WORD *)v115 = 2050;
        *(double *)&v115[2] = v94 - v112;
        LODWORD(v103) = 24;
        v95 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v93,  1LL,  "New records read, accel = %{public}d, gyro = %{public}d, duration processed = %{public}lf",  &v113,  v103);
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLHealthAssessmentNotifierAdapter processNextIntervalWithRemainingDurationToProcess:endTime:updateCanContinue:]",  "%s\n",  v95);
        v71 = v105;
      }

      -[CLHealthAssessmentNotifierAdapter updateStartTime](self, "updateStartTime");
      double *v104 = *v104 - (v78 - v112);
    }

    else
    {
      double v70 = CFAbsoluteTimeGetCurrent() + -600.0;
      -[CLHealthAssessmentNotifierAdapter updateStartTime](self, "updateStartTime");
      v71 = v105;
      if (v72 >= v70)
      {
        if (qword_101934800 != -1) {
          dispatch_once(&qword_101934800, &stru_10182B9E8);
        }
        v80 = (os_log_s *)off_101934808;
        if (os_log_type_enabled((os_log_t)off_101934808, OS_LOG_TYPE_INFO))
        {
          -[CLHealthAssessmentNotifierAdapter updateStartTime](self, "updateStartTime");
          *(_DWORD *)buf = 134349056;
          *(void *)v117 = v81;
          _os_log_impl( (void *)&_mh_execute_header,  v80,  OS_LOG_TYPE_INFO,  "No new records from sensorRecorder, updateStartTime is up to date (%{public}f)",  buf,  0xCu);
        }

        if (sub_1002921D0(115, 2))
        {
          bzero(buf, 0x65CuLL);
          if (qword_101934800 != -1) {
            dispatch_once(&qword_101934800, &stru_10182B9E8);
          }
          v100 = off_101934808;
          -[CLHealthAssessmentNotifierAdapter updateStartTime](self, "updateStartTime");
          int v113 = 134349056;
          *(void *)v114 = v101;
          LODWORD(v103) = 12;
          v102 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v100,  1LL,  "No new records from sensorRecorder, updateStartTime is up to date (%{public}f)",  &v113,  v103);
          sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLHealthAssessmentNotifierAdapter processNextIntervalWithRemainingDurationToProcess:endTime:updateCanContinue:]",  "%s\n",  v102);
          char v79 = 0;
          v71 = v105;
          goto LABEL_97;
        }

        goto LABEL_96;
      }

      if (qword_101934800 != -1) {
        dispatch_once(&qword_101934800, &stru_10182B9E8);
      }
      v73 = (os_log_s *)off_101934808;
      if (os_log_type_enabled((os_log_t)off_101934808, OS_LOG_TYPE_INFO))
      {
        -[CLHealthAssessmentNotifierAdapter updateStartTime](self, "updateStartTime");
        double v75 = v111;
        if (v70 < v111) {
          double v75 = v70;
        }
        *(_DWORD *)buf = 134349312;
        *(void *)v117 = v74;
        *(_WORD *)&v117[8] = 2050;
        *(double *)v118 = v75;
        _os_log_impl( (void *)&_mh_execute_header,  v73,  OS_LOG_TYPE_INFO,  "No new records from sensorRecorder, advancing startUpdateTime from %{public}f to %{public}f",  buf,  0x16u);
      }

      if (sub_1002921D0(115, 2))
      {
        bzero(buf, 0x65CuLL);
        if (qword_101934800 != -1) {
          dispatch_once(&qword_101934800, &stru_10182B9E8);
        }
        v96 = off_101934808;
        -[CLHealthAssessmentNotifierAdapter updateStartTime](self, "updateStartTime");
        double v98 = v111;
        if (v70 < v111) {
          double v98 = v70;
        }
        int v113 = 134349312;
        *(void *)v114 = v97;
        *(_WORD *)&v114[8] = 2050;
        *(double *)v115 = v98;
        LODWORD(v103) = 22;
        v99 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v96,  1LL,  "No new records from sensorRecorder, advancing startUpdateTime from %{public}f to %{public}f",  &v113,  v103);
        sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLHealthAssessmentNotifierAdapter processNextIntervalWithRemainingDurationToProcess:endTime:updateCanContinue:]",  "%s\n",  v99);
        v71 = v105;
      }

      if (v70 < v111)
      {
        -[CLHealthAssessmentNotifierAdapter setUpdateStartTime:](self, "setUpdateStartTime:", v70);
LABEL_96:
        char v79 = 0;
        goto LABEL_97;
      }

      -[CLHealthAssessmentNotifierAdapter setUpdateStartTime:](self, "setUpdateStartTime:");
    }

    char v79 = 1;
LABEL_97:
    _BYTE *v71 = v79;
    return;
  }

  if (qword_101934800 != -1) {
    dispatch_once(&qword_101934800, &stru_10182B9E8);
  }
  uint64_t v17 = (os_log_s *)off_101934808;
  if (os_log_type_enabled((os_log_t)off_101934808, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v125) = 0;
    _os_log_impl( (void *)&_mh_execute_header,  v17,  OS_LOG_TYPE_ERROR,  "DB not accessible, cannot process accel, gyro data",  (uint8_t *)&v125,  2u);
  }

  if (sub_1002921D0(115, 0))
  {
    bzero(&v125, 0x65CuLL);
    if (qword_101934800 != -1) {
      dispatch_once(&qword_101934800, &stru_10182B9E8);
    }
    LOWORD(v119) = 0;
    v82 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  &v125,  1628LL,  &_mh_execute_header,  off_101934808,  16LL,  "DB not accessible, cannot process accel, gyro data",  &v119,  2);
    sub_10029211C( "Generic",  1LL,  0,  0LL,  "-[CLHealthAssessmentNotifierAdapter processNextIntervalWithRemainingDurationToProcess:endTime:updateCanContinue:]",  "%s\n",  v82);
  }

  *a5 = 0;
  -[CLHealthAssessmentNotifierAdapter adaptee](self, "adaptee");
  sub_10022C448();
}

- (BOOL)anySubscribedToSensorRecorder
{
  return self->fTremorSubscribed || self->fDyskinesiaSubscribed;
}

- (void)addMonitoringPeriodFrom:(double)a3 until:(double)a4
{
  if (v7 == 0.0
    || (-[CLHealthAssessmentNotifierAdapter monitorKinesiasExpiration](self, "monitorKinesiasExpiration"), v8 < a3))
  {
    self->_double monitorKinesiasStart = a3;
    uint64_t v9 = sub_1002F8DDC();
    sub_1002AC820(v9, @"kMonitorKinesiasStart", &self->_monitorKinesiasStart);
    uint64_t v10 = sub_1002F8DDC();
    buf[0] = 1;
    sub_1002AB464(v10, @"kMonitorKinesiasHasData", buf);
  }

  p_monitorKinesiasExpiration = &self->_monitorKinesiasExpiration;
  self->_monitorKinesiasExpiration = a4;
  uint64_t v12 = sub_1002F8DDC();
  sub_1002AC820(v12, @"kMonitorKinesiasExpiration", &self->_monitorKinesiasExpiration);
  uint64_t v13 = sub_1002F8DDC();
  (*(void (**)(uint64_t))(*(void *)v13 + 944LL))(v13);
  if (qword_101934800 != -1) {
    dispatch_once(&qword_101934800, &stru_10182B9E8);
  }
  double v14 = (os_log_s *)off_101934808;
  if (os_log_type_enabled((os_log_t)off_101934808, OS_LOG_TYPE_INFO))
  {
    double monitorKinesiasStart = self->_monitorKinesiasStart;
    uint64_t v16 = *(void *)p_monitorKinesiasExpiration;
    *(_DWORD *)buf = 134349312;
    double v25 = monitorKinesiasStart;
    __int16 v26 = 2050;
    uint64_t v27 = v16;
    _os_log_impl( (void *)&_mh_execute_header,  v14,  OS_LOG_TYPE_INFO,  "Updated monitoring period to %{public}f - %{public}f",  buf,  0x16u);
  }

  if (sub_1002921D0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_101934800 != -1) {
      dispatch_once(&qword_101934800, &stru_10182B9E8);
    }
    double v17 = self->_monitorKinesiasStart;
    uint64_t v18 = *(void *)p_monitorKinesiasExpiration;
    int v20 = 134349312;
    double v21 = v17;
    __int16 v22 = 2050;
    uint64_t v23 = v18;
    double v19 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  off_101934808,  1LL,  "Updated monitoring period to %{public}f - %{public}f",  &v20,  22);
    sub_10029211C( "Generic",  1LL,  0,  2LL,  "-[CLHealthAssessmentNotifierAdapter addMonitoringPeriodFrom:until:]",  "%s\n",  v19);
  }

- (void)startUpdatesforAnalyzer:(int)a3
{
  unsigned __int8 v5 = -[CLHealthAssessmentNotifierAdapter anySubscribedToSensorRecorder](self, "anySubscribedToSensorRecorder");
  if (!a3)
  {
    uint64_t v6 = &OBJC_IVAR___CLHealthAssessmentNotifierAdapter_fTremorSubscribed;
    if ((v5 & 1) != 0) {
      goto LABEL_7;
    }
LABEL_6:
    -[CLHealthAssessmentNotifierAdapter updateSensorRecorderSubscription](self, "updateSensorRecorderSubscription");
    goto LABEL_7;
  }

  if (a3 != 1) {
    return;
  }
  uint64_t v6 = &OBJC_IVAR___CLHealthAssessmentNotifierAdapter_fDyskinesiaSubscribed;
  if ((v5 & 1) == 0) {
    goto LABEL_6;
  }
LABEL_7:
  self->super.CLIntersiloService_opaque[*v6] = 1;
}

- (void)stopMonitoring
{
  double v4 = v3;
  -[CLHealthAssessmentNotifierAdapter monitorKinesiasExpiration](self, "monitorKinesiasExpiration");
  if (v5 > v4)
  {
    p_monitorKinesiasExpiration = &self->_monitorKinesiasExpiration;
    self->_monitorKinesiasExpiration = v4;
    uint64_t v7 = sub_1002F8DDC();
    sub_1002AC820(v7, @"kMonitorKinesiasExpiration", &self->_monitorKinesiasExpiration);
    uint64_t v8 = sub_1002F8DDC();
    (*(void (**)(uint64_t))(*(void *)v8 + 944LL))(v8);
    if (qword_101934800 != -1) {
      dispatch_once(&qword_101934800, &stru_10182B9E8);
    }
    uint64_t v9 = (os_log_s *)off_101934808;
    if (os_log_type_enabled((os_log_t)off_101934808, OS_LOG_TYPE_INFO))
    {
      double monitorKinesiasStart = self->_monitorKinesiasStart;
      uint64_t v11 = *(void *)p_monitorKinesiasExpiration;
      *(_DWORD *)buf = 134349312;
      double v20 = monitorKinesiasStart;
      __int16 v21 = 2050;
      uint64_t v22 = v11;
      _os_log_impl( (void *)&_mh_execute_header,  v9,  OS_LOG_TYPE_INFO,  "Stop monitoring, set period to %{public}f - %{public}f",  buf,  0x16u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934800 != -1) {
        dispatch_once(&qword_101934800, &stru_10182B9E8);
      }
      double v12 = self->_monitorKinesiasStart;
      uint64_t v13 = *(void *)p_monitorKinesiasExpiration;
      int v15 = 134349312;
      double v16 = v12;
      __int16 v17 = 2050;
      uint64_t v18 = v13;
      double v14 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  off_101934808,  1LL,  "Stop monitoring, set period to %{public}f - %{public}f",  &v15,  22);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLHealthAssessmentNotifierAdapter stopMonitoring]", "%s\n", v14);
    }

    self->fDyskinesiaSubscribed = 0;
    self->fTremorSubscribed = 0;
    -[CLHealthAssessmentNotifierAdapter updateSensorRecorderSubscription](self, "updateSensorRecorderSubscription");
  }

- (void)syncgetResultReady:(id)a3 ForAnalyzer:(int)a4
{
}

- (void)aggregateRecords
{
  if (sub_10022E0FC((uint64_t)-[CLHealthAssessmentNotifierAdapter adaptee](self, "adaptee")))
  {
    -[CLTimer setNextFireDelay:]( -[CLHealthAssessmentNotifierAdapter fAggregateRecordsTimer](self, "fAggregateRecordsTimer"),  "setNextFireDelay:",  3600.0);
    if (qword_101934800 != -1) {
      dispatch_once(&qword_101934800, &stru_10182B9E8);
    }
    double v3 = (os_log_s *)off_101934808;
    if (os_log_type_enabled((os_log_t)off_101934808, OS_LOG_TYPE_INFO))
    {
      -[CLTimer nextFireTime]( -[CLHealthAssessmentNotifierAdapter fAggregateRecordsTimer](self, "fAggregateRecordsTimer"),  "nextFireTime");
      *(_DWORD *)buf = 134349056;
      uint64_t v13 = v4;
      _os_log_impl( (void *)&_mh_execute_header,  v3,  OS_LOG_TYPE_INFO,  "fAggregateRecordsTimer.nextFireTime, %{public}f",  buf,  0xCu);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934800 != -1) {
        dispatch_once(&qword_101934800, &stru_10182B9E8);
      }
      double v5 = off_101934808;
      -[CLTimer nextFireTime]( -[CLHealthAssessmentNotifierAdapter fAggregateRecordsTimer](self, "fAggregateRecordsTimer"),  "nextFireTime");
      int v10 = 134349056;
      uint64_t v11 = v6;
      uint64_t v7 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  v5,  1LL,  "fAggregateRecordsTimer.nextFireTime, %{public}f",  &v10,  12);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLHealthAssessmentNotifierAdapter aggregateRecords]", "%s\n", v7);
    }
  }

  else
  {
    if (qword_101934800 != -1) {
      dispatch_once(&qword_101934800, &stru_10182B9E8);
    }
    uint64_t v8 = (os_log_s *)off_101934808;
    if (os_log_type_enabled((os_log_t)off_101934808, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl( (void *)&_mh_execute_header,  v8,  OS_LOG_TYPE_INFO,  "Closing down CLHealthAssessmentNotifier, past timeout period for stored data",  buf,  2u);
    }

    if (sub_1002921D0(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_101934800 != -1) {
        dispatch_once(&qword_101934800, &stru_10182B9E8);
      }
      LOWORD(v10) = 0;
      uint64_t v9 = (char *)_os_log_send_and_compose_impl( 2LL,  0LL,  buf,  1628LL,  &_mh_execute_header,  off_101934808,  1LL,  "Closing down CLHealthAssessmentNotifier, past timeout period for stored data",  &v10,  2);
      sub_10029211C("Generic", 1LL, 0, 2LL, "-[CLHealthAssessmentNotifierAdapter aggregateRecords]", "%s\n", v9);
    }

    -[CLHealthAssessmentNotifierAdapter teardownService](self, "teardownService");
  }

- (void)setLastProcessedTime:(double)a3
{
  p_double lastProcessedTime = &self->_lastProcessedTime;
  if (self->_lastProcessedTime < a3)
  {
    *p_double lastProcessedTime = a3;
    uint64_t v6 = sub_1002F8DDC();
    sub_1002AC820(v6, @"kMonitorKinesiasLastProcessed", p_lastProcessedTime);
    uint64_t v7 = sub_1002F8DDC();
    (*(void (**)(uint64_t))(*(void *)v7 + 944LL))(v7);
  }

  -[CLHealthAssessmentNotifierAdapter updateStartTime](self, "updateStartTime");
  if (v8 < a3) {
    double v8 = a3;
  }
  -[CLHealthAssessmentNotifierAdapter setUpdateStartTime:](self, "setUpdateStartTime:", v8);
}

- (CMSensorRecorder)sensorRecorder
{
  return self->_sensorRecorder;
}

- (void)setSensorRecorder:(id)a3
{
}

- (CLTimer)fSensorRecorderSubscribeTimer
{
  return self->_fSensorRecorderSubscribeTimer;
}

- (void)setFSensorRecorderSubscribeTimer:(id)a3
{
}

- (CLTimer)fSensorRecorderQueryTimer
{
  return self->_fSensorRecorderQueryTimer;
}

- (void)setFSensorRecorderQueryTimer:(id)a3
{
}

- (CLTimer)fAggregateRecordsTimer
{
  return self->_fAggregateRecordsTimer;
}

- (void)setFAggregateRecordsTimer:(id)a3
{
}

- (double)updateStartTime
{
  return self->_updateStartTime;
}

- (void)setUpdateStartTime:(double)a3
{
  self->_updateStartTime = a3;
}

- (double)monitorKinesiasStart
{
  return self->_monitorKinesiasStart;
}

- (void)setMonitorKinesiasStart:(double)a3
{
  self->_double monitorKinesiasStart = a3;
}

- (double)monitorKinesiasExpiration
{
  return self->_monitorKinesiasExpiration;
}

- (void)setMonitorKinesiasExpiration:(double)a3
{
  self->_monitorKinesiasExpiration = a3;
}

- (double)lastProcessedTime
{
  return self->_lastProcessedTime;
}

- (CLHealthAssessmentChoreaDetectionService)choreaDetectionService
{
  return self->_choreaDetectionService;
}

- (void)setChoreaDetectionService:(id)a3
{
}

- (CLHealthAssessmentTremorDetectionService)tremorDetectionService
{
  return self->_tremorDetectionService;
}

- (void)setTremorDetectionService:(id)a3
{
}

+ (BOOL)isSupported
{
  if (qword_101993CB8 != -1) {
    dispatch_once(&qword_101993CB8, &stru_10182B8A8);
  }
  return byte_101993CB0;
}

@end